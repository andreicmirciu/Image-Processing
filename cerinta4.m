function [A_k S] = cerinta4(image, k)
  % citirea matricei imaginii
  A = imread(image);
  % convertirea elementelor la tipul double
  A = double(A);
  % aflarea dimensiunilor matricei A
  [m n] = size(A);
  % algoritmul pentru aflarea matricei A_k
  u = sum(A,2)/n;
  for i = 1:m
    A([i],:) = A([i],:) - u(i,1);
  end
  Z = (1/(n-1))*A*A';
  [V S] = eig(Z);
  W = V([1:m],[1:k]);
  Y = W' * A;
  A_k = W*Y + u;
end