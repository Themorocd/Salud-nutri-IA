import { Component, OnInit, Inject, PLATFORM_ID } from '@angular/core';
import { Router, RouterOutlet,NavigationEnd } from '@angular/router';
import { isPlatformBrowser, CommonModule } from '@angular/common';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [RouterOutlet, CommonModule],
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent implements OnInit {
  currentView: string = 'login';
  constructor(private router: Router, @Inject(PLATFORM_ID) private platformId: Object) {}

  // Verifica si el usuario está autenticado
  isAuthenticated(): boolean {
    if (isPlatformBrowser(this.platformId)) {
      return !!localStorage.getItem('token');
    }
    return false;
  }

  // Lógica para cerrar sesión
  logout(): void {
    if (isPlatformBrowser(this.platformId)) {
      localStorage.removeItem('token');
      this.router.navigate(['/login']);
    }
  }
  ngOnInit(): void {
    // Detectar cambios en la ruta y actualizar la clase
    this.router.events.subscribe((event) => {
      if (event instanceof NavigationEnd) {
        if (event.url.includes('login')) {
          this.currentView = 'login';
        } else if (event.url.includes('register')) {
          this.currentView = 'register';
        } else if (event.url.includes('perfil')) {
          this.currentView = 'perfil';
        } else if (event.url.includes('recuperar-password')) {
          this.currentView = 'recuperar-password';
        }
      }
    });
  }

}
