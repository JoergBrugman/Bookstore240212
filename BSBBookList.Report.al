report 50100 "BSB Book List"
{
    Caption = 'BSB Book List';
    DefaultLayout = RDLC;
    RDLCLayout = 'BSBBookList.Report.rdlc';
    ApplicationArea = All;
    UsageCategory = ReportsAndAnalysis;
    dataset
    {
        dataitem(SingleRowData; Integer)
        {
            DataItemTableView = sorting(Number) where(Number = const(1));

            #region Columns
            column(COMPANYNAME; CompanyProperty.DisplayName()) { }
            column(DataItemsFilters; GetDataItemsFilters()) { }
            #endregion Columns
        }
        dataitem("BSB Book"; "BSB Book")
        {
            DataItemTableView = order(ascending);
            RequestFilterFields = "No.";

            #region Columns
            column(No_BSBBook; "BSB Book"."No.") { IncludeCaption = true; }
            column(Description_BSBBook; "BSB Book".Description) { IncludeCaption = true; }
            column(Author_BSBBook; "BSB Book".Author) { IncludeCaption = true; }
            column(NoofPages_BSBBook; "BSB Book"."No. of Pages") { IncludeCaption = true; }
            #endregion Columns
        }
    }
    requestpage
    {
        SaveValues = true;
    }

    labels
    {
        TitleCaption = 'BSB Book List';
        PageCaption = 'Page {0} of {1}';
        TotalCaptionLbl = 'Total';
    }



    local procedure GetDataItemsFilters() DataItemsFilterTxt: Text
    begin
        AddDataItemFilters(DataItemsFilterTxt, "BSB Book");
    end;

    local procedure AddDataItemFilters(VAR CurrDataItemsFilterTxt: Text; Rec: Variant) FilterTxt: Text
    var
        RecordRef: RecordRef;
        CRLF: Text;
    begin
        if not Rec.IsRecord() then
            exit;
        CRLF[1] := 13;
        CRLF[2] := 10;
        RecordRef.GetTable(Rec);
        FilterTxt := RecordRef.GetFilters();
        if FilterTxt <> '' then begin
            FilterTxt := RecordRef.Caption() + ': ' + FilterTxt;
            if CurrDataItemsFilterTxt <> '' then
                CurrDataItemsFilterTxt += CRLF;
            CurrDataItemsFilterTxt += FilterTxt;
        end;
    end;

}
