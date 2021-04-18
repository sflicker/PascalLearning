program FibonacciRecursion;

{$MODE OBJFPC}

var 
    i : Integer;

function Fib(n : Integer) : Integer;
begin
  if n <= 2 then
    Fib:= 1
  else
    Fib := Fib(n-1) + Fib(n-2);

end;

begin
for i := 1 to 25 do
    writeln('Fib(', i, ') = ', Fib(i))
end.