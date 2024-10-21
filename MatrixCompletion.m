clc; clear;

% Citirea imaginii originale
n = 70;                              % Valoarea de redimensionare a imaginii
A_bar = imread("bunny.jpg");         % Citirea imaginii
A_bar = rgb2gray(A_bar);             % Convertire în alb-negru
A_bar = im2double(A_bar);            % Convertirea în valori double
A_bar = imresize(A_bar, [n n]);      % Redimensionarea imaginii
figure(1);
imshow(A_bar);
title("Imaginea originala");

% Definirea numărului de pixeli cunoscuți
nr_intrari_cunoscute = 3000;

% Alegerea aleatorie a pixelilor cunoscuți
rPerm=randperm(n*n);
omega = sort(rPerm(1: nr_intrari_cunoscute));
A=nan(n); A(omega)=A_bar(omega);
figure(2);
imshow(A);
title("Imaginea blurată cu pixelii cunoscuți");


 %Metoda gradient accelerat
maxiter=1000;
eps=1e-3;
alpha=0.1; %rata de invatare
beta=0.9;
 %Initializare
 A_initial=randn(n,n);
 A_initial(omega)=A(omega);
 Y=A_initial;
 X_old=A_initial;
 oprire=1;
iter=0;
vector_oprire=[];
timp=zeros(1, maxiter);

tic;

while oprire >= eps && iter < maxiter
    vector_oprire=[vector_oprire,oprire];
    grad=Y-A_bar; %Calcul gradient

    %Actualizarea X_new utilizand gradientul
    X_new=Y-alpha * grad;
    X_new(omega)=A(omega);

    %Calculul pasului de impuls
    Y=X_new+ beta* (X_new-X_old);

    oprire= norm(X_new-X_old);
    X_old=X_new;
    iter=iter+1;

    timp(iter)=toc;
end
 %Afisarea imaginii recuperate
figure(3);
imshow(X_new);
title('Imagine recuperata MG Accelerat');
figure(4);
semilogy(1:iter,vector_oprire(1:iter),'b','LineWidth',2);
hold on;

%Definirea parametrilor pentru Gradientul Stocastic
maxiter_sgd=1000;
eps_sgd=1e-3;
alpha_sgd=0.1;
batch_size=200; %dimensiunea subsetului random de date pentru SGD
X_sgd=A_bar;

 %Bucla pentru SGD
 oprire_sgd=1;
 iter_sgd=0;
 vector_oprire_sgd=[]; %vector pentru stocarea criteriului de oprire
 timp_sgd=[];

 tic;


while oprire_sgd >= eps_sgd && iter_sgd < maxiter_sgd
    %Alegerea unui subset aleator de date pentru gradientul stocastic
    idx=randperm(length(omega), batch_size);
    xi_batch= A_bar(omega(idx));

    %Calculul gradientului partial folosind subsetul de date selectat
    grad_sgd=X_sgd-repmat(mean(xi_batch,2),[1, size(X_sgd,2)]); 
   
    X_new_sgd(omega) = A(omega);

    %Actualizarea matricei utilizand gradientul partial
    X_new_sgd=X_sgd-alpha_sgd*grad_sgd;
    X_new(omega)=A(omega); %Impunerea constrangerii

    oprire_sgd= norm(X_new_sgd-X_sgd);
    X_sgd=X_new_sgd;
    iter_sgd=iter_sgd+1;

    vector_oprire_sgd= [vector_oprire_sgd, oprire_sgd];

    timp_sgd(iter_sgd)=toc;
end
 %Afisarea imaginii recuperate
figure(5);
imshow(X_sgd);
title('Imagine recuperata folosind metoda gradient stocastic')
figure(6);
semilogy(1:iter_sgd,vector_oprire_sgd(1:iter_sgd),'b','LineWidth',2);
hold on;