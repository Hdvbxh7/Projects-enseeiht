// This file is part of mandelbrot.
// 
// mandelbrot is free software: you can redistribute it and/or modify it under 
// the terms of the GNU General Public License as published by the Free Software 
// Foundation, either version 3 of the License, or (at your option) any later 
// version.
// 
// mandelbrot is distributed in the hope that it will be useful, but WITHOUT ANY 
// WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR 
// A PARTICULAR PURPOSE. See the GNU General Public License for more details.
// 
// You should have received a copy of the GNU General Public License along with 
// mandelbrot. If not, see <https://www.gnu.org/licenses/>.
//
// mandelbrot - Copyright (c) 2023 Guillaume Dupont
// Contact: <guillaume.dupont@toulouse-inp.fr>
#include "mandelbrot.h"

int mandelbrot(complexe_t z0, complexe_t c, double seuil, int maxit) {
    complexe_t zn;
    complexe_t zn1;
    int i=0;
    zn=z0;
    while (module(zn) < seuil||i < maxit){
        puissance(&zn1,zn,2);
        ajouter(&zn1,c,zn1);
        zn=zn1;
        i++;
    }
    return i;
}




