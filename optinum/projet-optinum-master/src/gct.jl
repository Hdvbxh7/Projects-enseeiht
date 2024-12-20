using LinearAlgebra
"""
Approximation de la solution du problème 

    min qₖ(s) = s'gₖ + 1/2 s' Hₖ s, sous la contrainte ‖s‖ ≤ Δₖ

# Syntaxe

    s = gct(g, H, Δ; kwargs...)

# Entrées

    - g : (Vector{<:Real}) le vecteur gₖ
    - H : (Matrix{<:Real}) la matrice Hₖ
    - Δ : (Real) le scalaire Δₖ
    - kwargs  : les options sous formes d'arguments "keywords", c'est-à-dire des arguments nommés
        • max_iter : le nombre maximal d'iterations (optionnel, par défaut 100)
        • tol_abs  : la tolérence absolue (optionnel, par défaut 1e-10)
        • tol_rel  : la tolérence relative (optionnel, par défaut 1e-8)

# Sorties

    - s : (Vector{<:Real}) une approximation de la solution du problème

# Exemple d'appel

    g = [0; 0]
    H = [7 0 ; 0 2]
    Δ = 1
    s = gct(g, H, Δ)

"""
function gct(g::Vector{<:Real}, H::Matrix{<:Real}, Δ::Real; 
    max_iter::Integer = 100, 
    tol_abs::Real = 1e-10, 
    tol_rel::Real = 1e-8)
    
    iter=0
    g0=g 
    s = zeros(length(g))
    p0=-g
    gj=g
    pj=-g

    function sigmacalcul(s,pj)
        a = norm(pj)*norm(pj)
        b = 2*s'*pj
        c = norm(s)*norm(s) - Δ*Δ 
        d = sqrt(b*b - 4*a*c)
        sigma1 = ((-b + d)/(2*a))
        sigma2 = ((-b - d)/(2*a))
        s1 = s +sigma1*pj
        s2 = s +sigma2*pj
        return s1,s2
    end
    
    function q(s,H,g)
        return g'*s + 0.5*s'*H*s
    end
    
    while (iter <= max_iter) && ( norm(gj) > max( norm(g0) *tol_rel,tol_abs) )
        k = pj'*H*pj
        if (k<=0)
            s1,s2 = sigmacalcul(s,pj)
            if q(s1,H,g)<q(s2,H,g)
                return s1
            else
                return s2
            end
        end
        alphaj = (gj'*gj)/k
        if (norm(s + alphaj*pj) >= Δ)
            s1,s2 = sigmacalcul(s,pj)
            return s1
        end
        s = s + alphaj*pj
        gj1 = gj + alphaj*H*pj
        betaj = (gj1'*gj1)/(gj'*gj)
        pj = -gj1 + betaj*pj
        gj = gj1
        iter=iter+1
    end            
   return s
end
