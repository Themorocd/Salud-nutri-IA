import { Injectable, Inject, PLATFORM_ID } from '@angular/core';
import { BehaviorSubject } from 'rxjs';
import { isPlatformBrowser } from '@angular/common';

@Injectable({ providedIn: 'root' })
export class LanguageService {
  private idiomaSubject: BehaviorSubject<'es' | 'en'>;

  constructor(@Inject(PLATFORM_ID) private platformId: Object) {
    let idioma: 'es' | 'en' = 'es';
    if (isPlatformBrowser(this.platformId)) {
      idioma = (localStorage.getItem('idioma') as 'es' | 'en') || 'es';
    }
    this.idiomaSubject = new BehaviorSubject<'es' | 'en'>(idioma);
  }

  get idioma$() {
    return this.idiomaSubject.asObservable();
  }

  setIdioma(idioma: 'es' | 'en') {
    this.idiomaSubject.next(idioma);
    if (isPlatformBrowser(this.platformId)) {
      localStorage.setItem('idioma', idioma);
    }
  }

  getIdioma(): 'es' | 'en' {
    return this.idiomaSubject.value;
  }
}
