TMNH = 10;

enxame = rand(TMNH,2);
velocidade = rand(TMNH,2);
pbest = rand(TMNH,2);
gbest = rand(1,2);
fitness_enxame = zeros(10,1);
fitness_pbest = zeros(10,1);
w = 0.9;


for j=1:50

  for i=1:10
    fitness_enxame(i,1) = enxame(i,1)^2 - 10*cos(2*pi*enxame(i,1)) + enxame(i,2)^2 - 10*cos(2*pi*enxame(i,2));
    fitness_pbest(i,1) = pbest(i,1)^2 - 10*cos(2*pi*pbest(i,1)) + pbest(i,2)^2 - 10*cos(2*pi*pbest(i,2));

    if (fitness_enxame(i,1)<fitness_pbest(i,1))
      pbest(i,:) = enxame(i,:);
    endif
  endfor

  [valor, indice] = min(fitness_pbest);
  fitness_gbest = gbest(1,1)^2 - 10*cos(2*pi*gbest(1,1)) + gbest(1,2)^2 - 10*cos(2*pi*gbest(1,2))

  if (valor < fitness_gbest)
    gbest(1,:) = pbest(indice,:);
  endif

  for i=1:10
   velocidade(i,:) = w*velocidade(i,:) + 2*rand(1,2).*(pbest(i,:)-enxame(i,:)) + 2*rand(1,2).*(gbest(1,:)-enxame(i,:));
  endfor

  for i=1:10
    enxame(i,:) = enxame(i,:) + velocidade(i,:);
  endfor

  plot(enxame(:,1), enxame(:,2), 'or'); hold on;
  plot(gbest(1,1), gbest(1,2), 'b*'); hold off;

  w = w*0.95;

endfor


