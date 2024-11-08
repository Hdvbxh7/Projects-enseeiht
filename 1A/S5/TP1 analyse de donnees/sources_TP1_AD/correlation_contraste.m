% function correlation_contraste (pour exercice_1.m)

function [correlation,contraste] = correlation_contraste(X)
        taille=size(X,2);
        XA=X-mean(X);
        Sigma=(1/taille)*transpose(XA)*XA;
        correlation=zeros(taille); 
        for i=1:taille 
            for j=1:taille
        		correlation(i,j)=Sigma(i,j)/sqrt(Sigma(i,i)*Sigma(j,j));    
            end
        end
        contraste=zeros(1,taille);
        for i=1:taille
        	contraste(1,i)=Sigma(i,i)/(Sigma(1,1)+Sigma(2,2)+Sigma(3,3));
        end
end

