function cerinta2()

  % -------------------------------- Cadru general
  image = 'in/images/image1.gif';
  A = double(imread(image));
  [m n] = size(A);
  k = [1:19 20:20:99 100:30:min(m,n)];
  x = length(k);
  
  % -------------------------------- Primul subpunct
  s = svd(A);
  
  % -------------------------------- Al doilea subpunct
  inform = zeros(x,1);
  suma = 0;
  for i = 1:min(m,n)
    suma = suma + s(i);
  end
  for i = 1:x
    for j = 1:k(i)
      inform(i) = inform(i) + s(j);
    end
  end
  inform = inform / suma;
  
  % -------------------------------- Al treilea subpunct
  err = zeros(x,1);
  vect = zeros(x,1);
  for aux = 1:x
    A_k = cerinta1(image, k(aux));
    for i = 1:m
      for j = 1:n
        vect(aux) = vect(aux) + ((A(i,j) - A_k(i,j)) ^ 2);
      end
    end
    err(aux) = vect(aux) / (m*n);
  end
  
  % -------------------------------- Al patrulea subpunct
  rate = zeros(x,1);
  for i = 1:x
    rate(i,1) = (m*k(i) + n*k(i) + k(i)) / (m*n);
  end
  % -------------------------------- Realizarea graficelor
  subplot(2,2,1);
  plot(s);
  title('Figura 1');
  subplot(2,2,2);
  plot(k,inform);
  title('Figura 2');
  subplot(2,2,3);
  plot(k,err);
  title('Figura 3');
  subplot(2,2,4);
  plot(k,rate);
  title('Figura 4');
end