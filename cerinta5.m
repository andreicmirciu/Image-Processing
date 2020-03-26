function cerinta5()
  % -------------------------------- Cadru general
  image = 'in/images/image2.gif';
  A = double(imread(image));
  [m n] = size(A);
  [A_k S] = cerinta3(image, min(m,n));
  k = [1:19 20:20:99 100:30:min(m,n)];
  x = length(k);
  
  % -------------------------------- Primul subpunct
  y = diag(S);
  
  % -------------------------------- Al doilea subpunct
  inform = zeros(x,1);
  suma = 0;
  for i = 1:min(m,n)
    suma = suma + y(i);
  end
  for i = 1:x
    for j = 1:k(i)
      inform(i) = inform(i) + y(j);
    end
  end
  inform = inform / suma;
  
  % -------------------------------- Al treilea subpunct
  err = zeros(x,1);
  vect = zeros(x,1);
  for aux = 1:x
    [A_k S] = cerinta3(image, k(aux));
    for i = 1:m
      for j = 1:n
        vect(aux) = vect(aux) + ((A(i,j) - A_k(i,j)) ^ 2);
      end
    end
    err(aux) = vect(aux) / (m*n);
  end
  
  % -------------------------------- Al patrulea subpunct
  compresie = zeros(x,1);
  for i = 1:x
    compresie(i) = (2*k(i) + 1)/n;
  end
  
  % -------------------------------- Realizarea graficelor
  subplot(2,2,1);
  plot(y);
  title('Figura 1');
  subplot(2,2,2);
  plot(k,inform);
  title('Figura 2');
  subplot(2,2,3);
  plot(k,err);
  title('Figura 3');
  subplot(2,2,4);
  plot(k,compresie);
  title('Figura 4');
end