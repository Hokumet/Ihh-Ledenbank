inherited frmIBroeder: TfrmIBroeder
  Caption = 'frmIBroeder'
  ClientHeight = 597
  ExplicitHeight = 635
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel3: TPanel
    Top = 518
    ExplicitTop = 518
  end
  inherited pnlLabels: TPanel
    Height = 518
    ExplicitHeight = 518
    inherited Label3: TLabel
      Top = 374
      ExplicitTop = 374
    end
    inherited Label5: TLabel
      Left = 16
      ExplicitLeft = 16
    end
    object Label6: TLabel [5]
      Left = 16
      Top = 344
      Width = 24
      Height = 13
      Caption = #220'lke:'
    end
    inherited Label13: TLabel
      Top = 404
      ExplicitTop = 404
    end
  end
  inherited pnlFields: TPanel
    Height = 518
    ExplicitHeight = 518
    inherited cmbBetaling: TComboBox
      Top = 366
      TabOrder = 11
      ExplicitTop = 366
    end
    object cmbLand: TComboBox [5]
      Left = 6
      Top = 336
      Width = 123
      Height = 21
      Hint = 'Landen'
      HelpType = htKeyword
      HelpKeyword = 'Land'
      TabOrder = 10
      TextHint = 'Naam'
    end
    inherited edtOmschrijving: TMemo
      Top = 398
      Height = 107
      TabOrder = 12
      ExplicitTop = 398
      ExplicitHeight = 107
    end
  end
end
