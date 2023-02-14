report 50413 "Patch Bank Account LE"
{

     // version MOII1.00

    // TAG ID        DATE          DESCRIPTION
    // ------        ----          -----------
    // PangJW1.00    31 AUG 22     - MOSB2022-DMR-0033 To patch Bank account ledger entries

    Caption = 'Patch Bank Account Ledger Entries';
    ProcessingOnly = true;
    UsageCategory = Administration;
    ApplicationArea = All;
Permissions = tabledata "Bank Account Ledger Entry" = rm;

    dataset
    {
        dataitem(BankAcctLE; "Bank Account Ledger Entry")
        {
            
            RequestFilterFields = "Entry No.";

            trigger OnAfterGetRecord();
            begin
                BankAcctLE.Amount := 0;
                BankAcctLE."Remaining Amount" := 0;
                BankAcctLE."Amount (LCY)" := 0;
                BankAcctLE."Credit Amount" := 0;
                BankAcctLE."Credit Amount (LCY)" := 0;
                BankAcctLE."MWH Original Amount" := 0;
                BankAcctLE.Modify;
            end;

            trigger OnPostDataItem();
            begin
                MESSAGE('Patching Done');
            end;
        }
    }
}