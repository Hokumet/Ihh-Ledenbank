inherited frmEditLand: TfrmEditLand
  Caption = 'frmEditLand'
  ClientHeight = 137
  ExplicitWidth = 415
  ExplicitHeight = 175
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel3: TPanel
    Top = 58
    ExplicitTop = 64
  end
  inherited pnlLabels: TPanel
    Height = 58
    ExplicitHeight = 64
    object Label1: TLabel
      Left = 16
      Top = 24
      Width = 24
      Height = 13
      Caption = #220'lke:'
    end
  end
  inherited pnlFields: TPanel
    Height = 58
    ExplicitHeight = 64
    object edtNaam: TEdit
      Left = 6
      Top = 16
      Width = 121
      Height = 21
      HelpType = htKeyword
      HelpKeyword = 'Naam'
      TabOrder = 0
    end
  end
  inherited CurrQuery: TADOQuery
    Top = 48
  end
end
