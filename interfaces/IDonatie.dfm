inherited frmIDonatie: TfrmIDonatie
  Caption = 'Bagis'#231'i bilgileri'
  ClientHeight = 562
  ExplicitHeight = 600
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel3: TPanel
    Top = 483
    ExplicitTop = 483
  end
  inherited pnlLabels: TPanel
    Height = 483
    ExplicitHeight = 483
    inherited Label3: TLabel
      Top = 344
      ExplicitTop = 344
    end
    object Label4: TLabel [3]
      Left = 16
      Top = 216
      Width = 49
      Height = 13
      Caption = 'Banka No:'
    end
    object Label5: TLabel [4]
      Left = 15
      Top = 248
      Width = 33
      Height = 13
      Caption = 'Miktar:'
    end
    inherited Label11: TLabel
      Top = 280
      ExplicitTop = 280
    end
    inherited Label12: TLabel
      Top = 312
      ExplicitTop = 312
    end
    inherited Label13: TLabel
      Top = 374
      ExplicitTop = 374
    end
  end
  inherited pnlFields: TPanel
    Height = 483
    ExplicitHeight = 483
    inherited edtLidNr: TEdit
      Width = 123
      ExplicitWidth = 123
    end
    inherited dtpLidDatum: TDateTimePicker
      Width = 123
      ExplicitWidth = 123
    end
    inherited cmbBetaling: TComboBox
      Top = 336
      Width = 123
      ExplicitTop = 336
      ExplicitWidth = 123
    end
    object edtBankNr: TEdit [3]
      Left = 6
      Top = 208
      Width = 123
      Height = 21
      HelpType = htKeyword
      HelpKeyword = 'Banknr'
      TabOrder = 6
    end
    object edtBedrag: THCurrencyEdit [4]
      Left = 6
      Top = 240
      Width = 123
      Height = 21
      HelpType = htKeyword
      HelpKeyword = 'Bedrag'
      TabOrder = 7
      Alignment = taRightJustify
      MaxValue = 999999.000000000000000000
    end
    inherited edtTelefoon: TEdit
      Top = 272
      TabOrder = 12
      ExplicitTop = 272
    end
    inherited edtEmail: TEdit
      Top = 304
      TabOrder = 9
      ExplicitTop = 304
    end
    inherited edtOmschrijving: TMemo
      Top = 368
      TabOrder = 11
      ExplicitTop = 368
    end
  end
end
