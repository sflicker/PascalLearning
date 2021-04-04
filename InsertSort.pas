program InsertSort;

uses sysutils;

const ArraySize = 1000;
const Space = ' ';
const RandomRange = 100;

type
  IntArray = array [1..ArraySize] of integer;
  
var 
  a : IntArray;
  freq : IntArray;
  average : real;
  median: real;

procedure swap(var x, y: integer);
var
  tmp: integer;

begin
  tmp := x;
  x := y;
  y := tmp;
end;

procedure printArray(var anArray: IntArray);
var
  i : integer;
begin
  for i := Low(anArray) to High(anArray) do
    begin
      write(anArray[i] : 4);
      if i mod 10 = 0 then
	writeln;
    end;
end;

procedure sortArray(var anArray: IntArray);
var
  i, j : integer;
begin

  i := Low(anArray)+1;
  while i <= High(anArray) do
    begin
      j := i;
      while (j > 1) and (anArray[j-1] > anArray[j]) do
        begin
          swap(anArray[j], anArray[j-1]);     
          j := j - 1;
        end;
      i := i + 1;
    end;
end;

procedure initializeArray(var anArray: IntArray);
var
  i : integer;
begin
  for i := Low(anArray) to High(anArray) do
    anArray[i] := Random(RandomRange);

end;

function averageArray(var anArray: IntArray): Real;
var
   i, count: integer;
   sum: LongInt;
begin
  sum := 0;
  count := 0;
  for i := Low(anArray) to High(anArray) do
    begin  
      sum := sum + anArray[i];
      count := count + 1;
    end;

  averageArray := sum / count;
  writeln('Sum = ', sum, ', Count = ', count, ', Average = ', averageArray:7:2);
end;

function medianArray(var anArray: IntArray) : Real;
var count, mid: integer;
begin
  count := High(anArray) - Low(anArray) + 1;
  if count mod 2 = 0 then
    begin
      writeln('Even Median Logic');
      mid := count div 2;
      writeln(anArray[mid], Space, anArray[mid+1]);
      medianArray := (anArray[mid] + anArray[mid+1])/2.0;
    end
  else 
    begin
      writeln('Odd Median Logic');
      mid := count div 2;
      medianArray := anArray[mid];
    end;

  writeln('count = ', count, ', mid = ', mid, ', median = ', medianArray : 7 : 2);
end;

function modeArray(var anArray, freq: IntArray) : String;
var
   count, i, j, maxCount, maxPos, maxFreq : integer;
begin
   maxCount := 0;
   maxPos := -1;
   maxFreq := 0;
   for i := Low(freq) to High(freq) do
     freq[i] := 0;

   for i := Low(freq) to High(freq) do
   begin
     if freq[i] = -1 then
         continue;
     count := 1;
     for j := i+1 to High(anArray) do
     begin
       if anArray[i] = anArray[j] then
       begin
         count := count + 1;      
         freq[j] := -1;
       end;

    end;
     freq[i] := count;
     if count > maxCount then
     begin
       maxCount := count;
       maxPos := i;
       maxFreq := 1;
     end
     else
       if count = maxCount then
       begin
         maxFreq := maxFreq + 1;
       end;
   end;
   modeArray := '';

   if maxFreq = 1 then
     modeArray := Concat('mode is ', IntToStr(a[maxPos]), ' occurring ', IntToStr(maxCount), ' times.')
   else
     modeArray := Concat('No mode. ', IntToStr(maxFreq), ' numbers appear ', IntToStr(maxCount), ' times.');
end;

{*  main program *}
begin
  Randomize;
  initializeArray(a);

 {* printArray(a); *}
  
  sortArray(a);
  
  writeln;
  {* printArray(a); *}
  average := averageArray(a);
  writeln('Average = ', average :7 :2);

  median := medianArray(a);
  writeln('Median = ', median: 7: 2);
  writeln('Mode = ', modeArray(a, freq));
end.
