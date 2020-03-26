function A_k = cerinta1(image, k)
  % citirea matricei imaginii
  A = imread(image);
  % convertirea elementelor la tipul double
  A = double(A);
  % initializarea matricei A_k
  A_k = A;
  % aflarea dimensiunilor matricei A
  [m n] = size(A);
  % descompunerea valorilor singulare pentru A
  [U S V] = svd(A);
  % aflarea U_k, S_k, V_k
  U_k = U([1:m],[1:k]);
  S_k = S([1:k],[1:k]);
  V_k = V([1:n],[1:k]);
  % calcularea matricei A_k
  A_k = U_k * S_k * (V_k)';
end