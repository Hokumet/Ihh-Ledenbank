inherited frmISpaarpot: TfrmISpaarpot
  Caption = 'Kumbaraci bilgileri'
  ClientHeight = 498
  ExplicitHeight = 536
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel3: TPanel
    Top = 419
    ExplicitTop = 419
  end
  inherited pnlLabels: TPanel
    Height = 419
    ExplicitHeight = 419
    object Label3: TLabel [2]
      Left = 16
      Top = 280
      Width = 55
      Height = 13
      Caption = 'Aidat takip:'
    end
    inherited Label13: TLabel
      Top = 310
      ExplicitTop = 310
    end
  end
  inherited pnlFields: TPanel
    Height = 419
    ExplicitHeight = 419
    object cmbBetaling: TComboBox [2]
      Left = 6
      Top = 272
      Width = 145
      Height = 21
      Hint = 'Betalingen'
      HelpType = htKeyword
      HelpKeyword = 'Betaling'
      TabOrder = 10
      TextHint = 'Type'
    end
    inherited edtOmschrijving: TMemo
      Top = 304
      ExplicitTop = 304
    end
  end
end
