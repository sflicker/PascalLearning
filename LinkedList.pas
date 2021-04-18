program LinkedList;
Uses sysutils;

type
    TStudentRec = record
        First, Last : String;
        ID, Age : Integer;
        Gender : Char;
    end;

    TNodePtr = ^TNode;
    TNode = record
        StudentRec : TStudentRec;
        NodePtr : TNodePtr;
    end;

var
    Head, Tail : TNodePtr;
    SampRec : TStudentRec;

procedure InitLinkedList;
begin
  Head := nil;
  Tail := Head; 
end;

procedure AssignRecord(var StudentRec : TStudentRec; First: String; Last: String; ID: Integer; Age: Integer; Gender: Char);
begin
   StudentRec.First := First;
   StudentRec.Last := Last;
   StudentRec.ID := ID;
   StudentRec.Age := Age;
   StudentRec.Gender := Gender;
end;

procedure AddNode(var StudentRec : TStudentRec);
var
    Node : TNode;
    StudentRecPtr : ^TStudentRec;
    fmt, s: String;

begin
    StudentRecPtr := addr(StudentRec);
    //fmt := '[0x%p]';
    //s := Format(fmt, [StudentRecPtr]);

    writeln(Format('@StudentRec = [0x%p]', [StudentRecPtr]));

    Node.StudentRec := StudentRec;
    New(Node.NodePtr);

    StudentRecPtr := addr(Node.StudentRec);
    writeln(Format('@Node.StudentRec = [0x%p], [0x%p]', [StudentRecPtr, @StudentRecPtr]));

    if Head = nil then
    begin
      New(Head);
      New(Tail);
      Head^ := Node;
    end else
    begin
        Tail^.NodePtr^ := Node;
    end;
    Tail^ := Node;
    writeln(Format('Tail^.StudentRec = %p', [@Tail^.StudentRec]));
end;

procedure Print(Head : TNodePtr);
var
    Node : TNodePtr;
    fmt, s: String;
begin
  
  s := Format('Head %p', [Head]);
  writeln(s);

 {* New(Node); *}
  Node := Head;
  while Node^.NodePtr <> nil do
  begin
    writeln('==================');
    writeln(Format('Node addr = %p', [@Node]));
    writeln(Format('Node^.NodePtr addr = %p', [@Node^.NodePtr]));
    writeln(Format('StudentRec addr = %p', [@Node^.StudentRec]));
    writeln(Node^.StudentRec.First);
    writeln(Node^.StudentRec.Last);
    writeln(Node^.StudentRec.ID);
    writeln(Node^.StudentRec.Age);
    writeln(Node^.StudentRec.Gender);
    writeln('==================');
    Node := Node^.NodePtr;
  end;
  Dispose(Node);
end;

procedure sizeofstuff;
  type TStudentRecPtr = ^TStudentRec;
begin
  writeln('sizeOf Integer = ', sizeof(Integer));
  writeln('sizeof String = ', sizeof(String));
  writeln('sizeof Char = ', sizeof(Char));
  writeln('SizeOf TStudentRec = ', sizeof(TStudentRec));
  writeln('sizeOf TNode = ', sizeof(TNode));
  writeln('sizeOf TNodePtr = ', sizeof(TNodePtr));
  writeln('sizeof ^TStudentRec = ', sizeof(TStudentRecPtr));
end;

begin
  
  sizeofstuff;
  InitLinkedList;
  AssignRecord(SampRec, 'George', 'Washington', 1, 289, 'M');
  AddNode(SampRec);
  AssignRecord(SampRec, 'John', 'Adams', 2, 285, 'M');
  AddNode(SampRec);
  AssignRecord(SampRec, 'Thomas', 'Jefferson', 3, 278, 'M');
  AddNode(SampRec);
  Print(Head);
end.