program GameOfLife;

uses sysutils, Crt;

const
   xSize = 50;
   ySize = 50;
   Space = ' ';
   Star = '*';
type
   CellType = record
     alive : boolean;
     livingNeighbors : integer;
   end;

   GridType = Array[1..xSize,1..ySize] of CellType;

var
   grid: GridType;
   i, j, generation, numAlive: integer;

procedure initializeGrid(var grid: GridType; aliveFactor: Real);
begin
   for i := 1 to xSize do
     for j := 1 to ySize do
     begin    
       grid[i,j].alive := Random(100) < 100*aliveFactor;
       grid[i,j].livingNeighbors := 0;
     end;
end;

procedure printBoard(var grid: GridType);
var i, j : integer;
begin
  for i :=1 to xSize do
    begin
      for j := 1 to ySize do
        if grid[i,j].alive then write(Star, Space) else write(Space, Space);
      writeln;
    end;
   writeln('Generation = ', generation, ', NumAlive = ', numAlive);
end;

function calcNumAlive(var grid: GridType) : integer;
var i, j : integer;
begin

  calcNumAlive := 0;
  for i := 1 to xSize do
    for j := 1 to ySize do
    begin
        if grid[i,j].alive = true then
           calcNumAlive := calcNumAlive + 1;
    end;

end;

function adjustX(x : integer) : integer;
begin
  if x >= xSize then x -= xSize;
  if x < 0 then x += xSize;
  adjustX := x;
end;

function adjustY(y : integer) : integer;
begin
  if y >= xSize then y -= xSize;
  if y < 0 then y += xSize;
  adjustY := y;
end;


function getCellLivingNeighbors(var grid: GridType; x, y : integer): integer;
var adjScore : integer;
begin
  adjScore := 0;

  if grid[adjustX(x-1), adjustY(y-1)].alive then adjScore := adjScore + 1;
  if grid[adjustX(x-1), adjustY(y)].alive then adjScore := adjScore + 1;
  if grid[adjustX(x-1), adjustY(y+1)].alive then adjScore := adjScore + 1;
  if grid[adjustX(x), adjustY(y-1)].alive then adjScore := adjScore + 1;
  if grid[adjustX(x), adjustY(y+1)].alive then adjScore := adjScore + 1;
  if grid[adjustX(x+1), adjustY(y-1)].alive then adjScore := adjScore + 1;
  if grid[adjustX(x+1), adjustY(y)].alive then adjScore := adjScore + 1;
  if grid[adjustX(x+1), adjustY(y+1)].alive then adjScore := adjScore + 1;

  getCellLivingNeighbors := adjScore;

end;

procedure calculateLivingGridNeighbors(var grid: GridType);
var i, j : integer;
begin
    for i := 1 to xSize do
      for j := 1 to ySize do
        grid[i,j].livingNeighbors := getCellLivingNeighbors(grid, i, j); 
end;

{* living cells die if 0, 1, or 4 or more neighbors *}
{* deads cells come to life if 3 neighbors *}
procedure makeNextGeneration(var grid: GridType);
var i, j : integer;
begin
  for i := 1 to xSize do
    for j := 1 to ySize do
    begin
      if (grid[i,j].livingNeighbors <= 1) or (grid[i,j].livingNeighbors >= 4) then
          grid[i,j].alive := false;
      if (grid[i,j].alive = false) and (grid[i,j].livingNeighbors = 3) then
        grid[i,j].alive := true;
    end; 
end;

procedure runSim(var grid: GridType);
begin
  generation := 0;
  numAlive := calcNumAlive(grid);
  printBoard(grid);
  while numAlive > 0 do
    begin
      Sleep(250);
      generation := generation + 1;
      calculateLivingGridNeighbors(grid);
      makeNextGeneration(grid);
      numAlive := calcNumAlive(grid);
      ClrScr;
      printBoard(grid);
    end;

end;

{* main program *}
begin
   Randomize;
   initializeGrid(grid, 0.5);
   runSim(grid);
end.
