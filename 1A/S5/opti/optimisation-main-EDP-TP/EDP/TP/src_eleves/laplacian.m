function L = laplacian(nu,dx1,dx2,N1,N2)
%
%  Cette fonction construit la matrice de l'op�rateur Laplacien 2D anisotrope
%
%  Inputs
%  ------
%
%  nu : nu=[nu1;nu2], coefficients de diffusivit� dans les dierctions x1 et x2. 
%
%  dx1 : pas d'espace dans la direction x1.
%
%  dx2 : pas d'espace dans la direction x2.
%
%  N1 : nombre de points de grille dans la direction x1.
%
%  N2 : nombre de points de grilles dans la direction x2.
%
%  Outputs:
%  -------
%
%  L      : Matrice de l'op�rateur Laplacien (dimension N1N2 x N1N2)
%
% 

% Initialisation

e = ones(N1*N2,1);
em = e; em(N2:N2:end) = 0;
ep = e; ep(1:N2:end) = 0;
L = spdiags([-e*(nu(1)/dx1^2) -em*(nu(2)/dx2^2) e*(2*nu(1)/(dx1^2)+2*nu(2)/(dx2^2)) -em*(nu(2)/dx2^2) -e*(nu(1)/dx1^2)],[-N2 -1 0 +1 +N2],N1*N2,N1*N2);

end    
