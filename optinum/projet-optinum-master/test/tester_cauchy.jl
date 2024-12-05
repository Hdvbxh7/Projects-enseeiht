# Ecrire les tests de l'algorithme du pas de Cauchy
using Test

function tester_cauchy(cauchy::Function)

    # Tolérance utilisé dans les tests
    tol_test = 1e-3
    
	Test.@testset "Pas de Cauchy" begin
        # le cas de test 1
        g = [0 ; 0]
        H = [7 0 ; 0 2]
        Δ = 1
        s = cauchy(g,H,Δ)
        Test.@test  s ≈ [0.0 ; 0.0] atol = tol_test
        
        g = [6 ; 2]
        H = [7 0 ; 0 2]
        Δ = 0.5       # sol = pas de Cauchy  
        s = cauchy(g,H,Δ)
        Test.@test  s ≈ -Δ*g/norm(g) atol = tol_test
        g = [1,0]
        H = [1 0 ; 0 -1]
        Δ = 0.5       #  g^T H g > 0 sol pas de Cauchy
        s = cauchy(g,H,Δ)
        Test.@test  s ≈ -Δ*g/norm(g) atol = tol_test
        # le cas de test 5
        g = [2 ; 3]
        H = [4 6 ; 6 5]
        Δ = 3
        s = cauchy(g,H,Δ)
        Test.@test  s ≈ [1.9059020876695578 ; -2.3167946029410595] atol = tol_test
    end

end