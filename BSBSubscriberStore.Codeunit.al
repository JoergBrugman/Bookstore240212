codeunit 50100 "BSB Subscriber Store"
{
    var
        FavrotiteBoohHintMsg: Label 'Do not foret to enter %1';

    [EventSubscriber(ObjectType::Table, Database::Customer, OnAfterInsertEvent, '', true, true)]
    local procedure FavoriteBookHint(var Rec: Record Customer; RunTrigger: Boolean)
    begin
        if not RunTrigger then
            exit;
        if (Rec."BSB Favorite Book No." = '') then
            Message(FavrotiteBoohHintMsg, Rec.FieldCaption("BSB Favorite Book No."));
    end;
}