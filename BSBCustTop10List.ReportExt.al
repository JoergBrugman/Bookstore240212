reportextension 50100 "BSB Cust. - Top 10 List" extends "Customer - Top 10 List"
{
    RDLCLayout = 'BSBCustTop10List.ReportExt.rdlc';

    dataset
    {
        modify(Customer)
        {
            RequestFilterFields = "Country/Region Code";
        }

        add(Integer)
        {
            column(BSBCountryRegionCode_Customer; Customer."Country/Region Code")
            {
                IncludeCaption = true;
            }
        }
    }

    // rendering
    // {
    //     layout("Erweiterte Top 10")
    //     {
    //         Caption = 'Caption';
    //         Summary = 'Summary';
    //         Type = RDLC;
    //         LayoutFile = 'BSBCustTop10List.ReportExt.rdlc';
    //     }
    // }
}