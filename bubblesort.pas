program bubblesort;

{$MODE OBJFPC}

const arraySize = 10000;
const RandomRange = 1000000;

Type
    IntArray = array [1..arraySize] of Int32;
var 
   arrayToSort: IntArray;
   numSwaps: Int64;
   numComparisons: Int64;

procedure printArray(var anArray: IntArray);
var
  i : integer;
begin
  for i := Low(anArray) to High(anArray) do
    begin
      write(anArray[i] : 7 );
      if i mod 10 = 0 then
	writeln;
    end;
end;

procedure initializeArray(var anArray: IntArray);
var
  i : integer;
begin
  for i := Low(anArray) to High(anArray) do
    anArray[i] := Random(RandomRange);

end;

procedure sort(var anArray: IntArray; var numSwaps: Int64; var numComparisons: Int64);
var i, j, tmp : Integer;
begin
   numSwaps := 0;
   numComparisons := 0;
   for i := Low(anArray) to High(anArray) do
   begin
     for j := Low(AnArray) to High(anArray) - i do
     begin
        numComparisons := numComparisons + 1;
        if anArray[j] > anArray[j+1] then
        begin
          numSwaps := numSwaps + 1;
          tmp := anArray[j];
          anArray[j] := anArray[j+1];
          anArray[j+1] := tmp
        end;
     end;
  end;
end;

begin
  Randomize;

  initializeArray(arrayToSort);
  writeln('Array Before Sort');

  printArray(arrayToSort);

  writeln;
  writeln('Sorting');
  sort(arrayToSort, numSwaps, numComparisons);
  writeln('Array After Sort');
  printArray(arrayToSort);
  writeln('Number of Swaps: ', numSwaps, ', Number of Comparisons: ', numComparisons);
end.