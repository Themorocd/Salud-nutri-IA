const OpenAI = require('openai');
const openaiClient = new OpenAI({ apiKey: process.env.OPENAI_API_KEY });

exports.entrenadorIA = async (req, res) => {
  const { edad, altura, peso, sexo, objetivo, alergias, tipoDieta, tipoRespuesta, idioma } = req.body;

  if (!edad || !altura || !peso || !sexo || !objetivo) {
    return res.status(400).json({
      message: idioma === 'en'
        ? 'Missing user data to generate recommendations.'
        : 'Faltan datos del usuario para generar recomendaciones.'
    });
  }

  const lang = idioma === 'en' ? 'en' : 'es';

  let prompt = '';
  if (tipoRespuesta === 'rutina') {
    prompt = lang === 'en'
      ? `
Age: ${edad}
Height: ${altura} cm
Weight: ${peso} kg
Sex: ${sexo}
Goal: ${objetivo}
Allergies: ${alergias || 'None'}
Diet type: ${tipoDieta || 'None'}

Return ONLY the answer in valid JSON format, with no text before or after, using the following structure:

{
  "rutina": [
    {
      "dia": "Monday",
      "ejercicios": [
        { "nombre": "", "series": "", "repeticiones": "", "descanso": "" }
      ]
    }
    // ...one object for each day of the week (Monday to Sunday)
  ]
}

Use the day names in English: Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday.
Do not include explanations, titles, or comments. Only the clean, well-formed JSON for all days of the week, each with its main exercises.
`.trim()
      : `
Edad: ${edad}
Altura: ${altura} cm
Peso: ${peso} kg
Sexo: ${sexo}
Objetivo: ${objetivo}
Alergias: ${alergias || 'Ninguna'}
Tipo de dieta: ${tipoDieta || 'Ninguna'}

Devuélveme SOLO la respuesta en formato JSON válido, sin ningún texto antes ni después, con la siguiente estructura:

{
  "rutina": [
    {
      "dia": "Lunes",
      "ejercicios": [
        { "nombre": "", "series": "", "repeticiones": "", "descanso": "" }
      ]
    }
    // ...un objeto igual para cada día de la semana (Lunes a Domingo)
  ]
}

Usa los nombres de los días en español: Lunes, Martes, Miércoles, Jueves, Viernes, Sábado, Domingo.
No incluyas explicaciones, títulos, ni comentarios. Solo quiero el JSON limpio, bien formado y completo, con todos los días de la semana para la rutina, cada uno con sus ejercicios principales.
`.trim();
  } else if (tipoRespuesta === 'dieta') {
    prompt = lang === 'en'
      ? `
Age: ${edad}
Height: ${altura} cm
Weight: ${peso} kg
Sex: ${sexo}
Goal: ${objetivo}
Allergies: ${alergias || 'None'}
Diet type: ${tipoDieta || 'None'}

Return ONLY the answer in valid JSON format, with no text before or after, using the following structure:

{
  "dieta": [
    {
      "dia": "Monday",
      "comidas": [
        { "nombre": "Breakfast", "alimentos": "", "cantidad": "" },
        { "nombre": "Lunch", "alimentos": "", "cantidad": "" },
        { "nombre": "Dinner", "alimentos": "", "cantidad": "" }
      ]
    }
    // ...one object for each day of the week (Monday to Sunday)
  ]
}

Use the day names in English: Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday.
Use the meal names in English: Breakfast, Lunch, Dinner.
Do not include explanations, titles, or comments. Only the clean, well-formed JSON for all days of the week (Monday to Sunday), each with only breakfast, lunch, and dinner.
`.trim()
      : `
Edad: ${edad}
Altura: ${altura} cm
Peso: ${peso} kg
Sexo: ${sexo}
Objetivo: ${objetivo}
Alergias: ${alergias || 'Ninguna'}
Tipo de dieta: ${tipoDieta || 'Ninguna'}

Devuélveme SOLO la respuesta en formato JSON válido, sin ningún texto antes ni después, con la siguiente estructura:

{
  "dieta": [
    {
      "dia": "Lunes",
      "comidas": [
        { "nombre": "Desayuno", "alimentos": "", "cantidad": "" },
        { "nombre": "Almuerzo", "alimentos": "", "cantidad": "" },
        { "nombre": "Cena", "alimentos": "", "cantidad": "" }
      ]
    }
    // ...un objeto igual para cada día de la semana (Lunes a Domingo)
  ]
}

Usa los nombres de los días en español: Lunes, Martes, Miércoles, Jueves, Viernes, Sábado, Domingo.
Usa los nombres de las comidas en español: Desayuno, Almuerzo, Cena.
No incluyas explicaciones, títulos, ni comentarios. Solo quiero el JSON limpio, bien formado y completo, con todos los días de la semana (Lunes a Domingo) para la dieta, cada uno con solo desayuno, almuerzo y cena.
`.trim();
  } else {
    return res.status(400).json({
      message: lang === 'en'
        ? 'tipoRespuesta must be "rutina" or "dieta".'
        : 'tipoRespuesta debe ser "rutina" o "dieta".'
    });
  }

  try {
    const messages = [
      {
        role: 'system',
        content: lang === 'en'
          ? 'You are an expert personal trainer and nutritionist. Provide clear and structured answers in English.'
          : 'Eres un entrenador personal y nutricionista experto. Proporciona respuestas claras y estructuradas en español.',
      },
      {
        role: 'user',
        content: prompt,
      },
    ];

    const response = await openaiClient.chat.completions.create({
      model: 'gpt-3.5-turbo',
      messages,
      max_tokens: 1500,
      temperature: 0.7,
    });

    const recomendaciones = response.choices[0].message.content.trim();
    console.log('Respuesta IA:', recomendaciones);

    try {
      const json = JSON.parse(recomendaciones);
      let soloRespuesta = {};
      if (tipoRespuesta === 'rutina' && json.rutina) {
        soloRespuesta = { rutina: json.rutina };
      } else if (tipoRespuesta === 'dieta' && json.dieta) {
        soloRespuesta = { dieta: json.dieta };
      } else {
        soloRespuesta = json;
      }
      return res.status(200).json({ recomendaciones: soloRespuesta });
    } catch (e) {
      const match = recomendaciones.match(/\{[\s\S]*\}/);
      if (match) {
        try {
          const json = JSON.parse(match[0]);
          return res.status(200).json({ recomendaciones: json });
        } catch (e2) { }
      }
      return res.status(200).json({ recomendaciones });
    }
  } catch (error) {
    console.error(
      'Error al generar recomendaciones:',
      error.response?.data || error.message
    );
    res.status(500).json({
      message: lang === 'en'
        ? 'Error generating recommendations.'
        : 'Error al generar recomendaciones.'
    });
  }
};
