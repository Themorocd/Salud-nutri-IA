import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule } from '@angular/router';
import { LanguageService } from '../../services/language.service';


@Component({
  selector: 'app-landing',
  standalone: true,
  imports: [CommonModule, RouterModule],
  templateUrl: './landing.component.html',
  styleUrls: ['./landing.component.scss']
})
export class LandingComponent {  idioma: 'es' | 'en' = 'es';

  constructor(private languageService: LanguageService) {
    this.languageService.idioma$.subscribe((idioma: 'es' | 'en') => this.idioma = idioma);
  }

  cambiarIdioma() {
    this.languageService.setIdioma(this.idioma === 'es' ? 'en' : 'es');
  }
}
