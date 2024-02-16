page 50101 "BSB Book List"
{
    Caption = 'Books';
    PageType = List;
    SourceTable = "BSB Book";
    Editable = false;
    ApplicationArea = All;
    UsageCategory = Lists;
    CardPageId = "BSB Book Card";

    layout
    {
        area(Content)
        {
            repeater(BSBBooks)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(ISBN; Rec.ISBN)
                {
                    ToolTip = 'Specifies the value of the ISBN field.';
                }
                field(Author; Rec.Author)
                {
                    ToolTip = 'Specifies the value of the Author field.';
                }
                field(Type; Rec."Type")
                {
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("No. of Pages"; Rec."No. of Pages")
                {
                    ToolTip = 'Specifies the value of the No. of Pages field.';
                }
            }

        }
        area(FactBoxes)
        {
            systempart(Links; Links)
            {
                ApplicationArea = RecordLinks;
            }
            systempart(Notes; Notes)
            {
                ApplicationArea = Notes;
            }

        }

    }
    actions
    {
        area(Processing)
        {
            action(CreateBooks)
            {
                Caption = 'Create Books';
                Image = CreateDocuments;
                ApplicationArea = All;
                ToolTip = 'Executes the Create Books action.';
                RunObject = codeunit "BSB Create Books";
            }
            action(BookSale)
            {
                Caption = 'Start Sales Process';
                image = Process;
                ApplicationArea = All;
                ToolTip = 'Executes the Start Sales Process action.';
                Promoted = true;

                trigger OnAction()
                var
                    BSBBokkTypeProcessMgmt: Codeunit "BSB Book Type Process Mgmt.";
                    BSBBookType: Interface "BSB Book Type Process";
                begin
                    BSBBookType := BSBBokkTypeProcessMgmt.GetHandler(Rec);
                    BSBBookType.StartDeployBook();
                    BSBBookType.StartDeliverBook();
                end;
            }
        }
    }
}