function [element,total]= Demo(m)

  element = numel(m);
  total = caltotal(m);

  endfunction

function total = caltotal(m)

  total = sum(sum(m));

endfunction



