function [avg,stdev] = stat(x)

  n=length(x);
  avg=sum(x)/n;
  stdev=sqrt(sum((x-avg).^2)/n);
  endfunction
