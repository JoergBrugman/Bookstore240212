codeunit 50113 "BSB Book Type Process Mgmt."
{
    procedure GetHandler(BSBBook: Record "BSB Book") BookTypeProcess: Interface "BSB Book Type Process"
    begin
        if BSBBook.IsEmpty then
            BSBBook.TestField("No.");
        BookTypeProcess := BSBBook.Type;
    end;
}