program elseiftest;

var
   a, b : integer;

begin

    Randomize;
    a := Random(100);
    writeln('a = ', a);

    if a > 90 then
        writeln('greater than 90')
    else if a > 65 then
        writeln('greater than 65')
    else if a > 40 then
        writeln('greater than 40')
    else
        writeln('less than 40');
    
    b := Random(100);
    writeln('b = ', b);

    if b > 50 then
      writeln('b is greater than 50');

end.