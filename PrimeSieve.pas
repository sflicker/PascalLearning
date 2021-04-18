program PrimeSieve;

{$MODE OBJFPC}

const
   n = 10000;

var 
    primes : array [2..n] of Boolean;
    i,j : integer;
begin
   writeln('Prime Numbers from 2 to ', n);
   for i := 2 to n do
     primes[i] := true;  

   for i := 2 to n do
       if primes[i] = true then
       begin
       write(i,' ');
       j := i + i;
       while j <= n do
         begin
         primes[j] := false;
         j := j + i;
         end;
       end;
    writeln

end.