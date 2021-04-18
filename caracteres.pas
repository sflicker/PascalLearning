program caracteres;

var
    c, d: char;
    a: integer;

BEGIN
   c := 'F';
   a := ord(c);
   writeln('Le code ascii de ', c, ' est ', a);
   a := 122;
   c := chr(a);
   writeln('Le caractere de code ascii ', a, ' est ', c);
   c := 'j';
   d := succ(c);
   writeln('Le caractere suivant ', c, ' est ', d);
 END.
