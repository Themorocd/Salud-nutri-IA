import { Injectable } from '@angular/core';
import { CanActivate, Router } from '@angular/router';

@Injectable({ providedIn: 'root' })
export class AdminGuard implements CanActivate {
  constructor(private router: Router) {}

  canActivate(): boolean {
    // Verifica si el token existe en el almacenamiento local
    const token = localStorage.getItem('token');
    if (!token) {
      this.router.navigate(['/login']);
      return false;
    }
    try {
      // Decodifica el token y verifica el rol
      const payload = JSON.parse(atob(token.split('.')[1]));
      if (payload.rol === 'admin') {
        return true;
      }
    } catch {}
    this.router.navigate(['/login']);
    return false;
  }
}
