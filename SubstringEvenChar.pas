program SubstringEvenChar;

{$MODE OBJFPC}

var
   S, sub : String;
    
function LetterNumber(C : Char) : Integer;
begin
  LetterNumber := ord(C) - ord('a') + 1;
end;

function AllCharactersEven(S : String) : Boolean;
  var 
    counts : array [1..26] of Integer;
    i, pos : Integer;
begin
  for i := 1 to 26 do
    counts[i] := 0;

  for i := 1 to Length(S) do
  begin
    pos := LetterNumber(S[i]);
    counts[pos] := counts[pos] + 1;
  end;

  for i := 1 to 26 do
  begin
    if counts[i] mod 2 <> 0 then
    begin
      AllCharactersEven := false;
      exit;
    end;
  end;
  AllCharactersEven := true;
end;

function CalculateNumberSubstringsWithEven(S : String) : Integer;
   var 
     i, j, len, count : Integer;
begin
  count := 0;
  len := Length(S);
  for i := 1 to len do
  begin
    j := 1;
    for j := 1 to (len - i + 1) do
    begin
      sub := copy(S, j, i);
      if AllCharactersEven(sub) then
      begin
        count := count + 1;
        //writeln(sub);
      end;
    end;
  end;
  CalculateNumberSubstringsWithEven := count;
end;

begin
  S := 'abbaa';  
  writeln('Input = ', S);
  writeln('Number of Substrings with even characters = ', CalculateNumberSubstringsWithEven(S));

  S := 'geeksforgeeks';
  writeln('Input = ', S);
  writeln('Number of Substrings with even characters = ', CalculateNumberSubstringsWithEven(S));

end.