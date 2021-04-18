program FibonaccNonRecursion;

{$MODE OBJFPC}

var 
  i : Integer;

function Fib(n : Integer) : Integer;
var
  i, FibMinus1, FibMinus2 : Integer;
begin
  if n <= 2 then
     Fib := 1
  else
     FibMinus1 := 1;
     FibMinus2 := 1;
     for i := 3 to n do
       begin
         Fib := FibMinus1 + FibMinus2;
         FibMinus2 := FibMinus1;
         FibMinus1 := Fib;
       end;
end;


begin
for i := 1 to 25 do
    writeln('Fib(', i, ') = ', Fib(i))
end.