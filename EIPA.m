%% ELEC 4700 PA-5
%%Saifuddin Mohammed
%%101092039

set(0,'DefaultFigureWindowStyle','docked')
set(0,'defaultaxesfontsize',20)
set(0,'defaultaxesfontname','Times New Roman')
set(0,'DefaultLineLineWidth',2); 
close all

%%  Harmonic Wave Equation in 2D FD and Modes

nx = 50;
ny = 50;
%ny = 30;
G = sparse(nx*ny,nx*ny);  %Creating G matrix using sparse

    
for i = 1:nx
    for j = 1:ny
        
        n = j + (i-1)*ny;
        
        if i == 1 || i == nx ||j == 1 || j == ny
            G(n, :) = 0;
            G(n, n) = 1;
            
        else
            
            
            G(n, n) = -4; % or -2; 
            G(n, n+1) = 1;
            G(n, n-1) = 1;
            G(n, n+ny) = 1;
            G(n, n-ny) = 1;
            
            
        end
        
    end
    
end


figure(1) 

spy(G) %plotting G using spy        

[E, D] = eigs(G, 9, 'SM'); %PLOTTING EIGENVALUES

V = zeros(nx, ny, 9);


figure(2)


for z = 1:9              
   V(:, :, z) = reshape(E(:, z), nx, ny);
   
   subplot(3, 3, z)
   
   surf(V(:, :, z))     %plotting the eigenvectors 
   
end