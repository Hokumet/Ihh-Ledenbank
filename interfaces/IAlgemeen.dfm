inherited frmIAlgemeen: TfrmIAlgemeen
  Caption = 'Genel bilgiler'
  ClientHeight = 431
  ExplicitHeight = 458
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel3: TPanel
    Top = 352
    ExplicitTop = 352
  end
  inherited pnlLabels: TPanel
    Height = 352
    ExplicitHeight = 352
    object Label1: TLabel
      Left = 16
      Top = 24
      Width = 38
      Height = 13
      Caption = 'Sira No:'
    end
    object Label7: TLabel
      Left = 16
      Top = 56
      Width = 54
      Height = 13
      Caption = 'Adi Soyadi:'
    end
    object Label8: TLabel
      Left = 16
      Top = 88
      Width = 34
      Height = 13
      Caption = 'Adresi:'
    end
    object Label9: TLabel
      Left = 16
      Top = 120
      Width = 58
      Height = 13
      Caption = 'Posta Kodu:'
    end
    object Label10: TLabel
      Left = 16
      Top = 152
      Width = 28
      Height = 13
      Caption = 'Sehir:'
    end
    object Label11: TLabel
      Left = 16
      Top = 184
      Width = 40
      Height = 13
      Caption = 'Telefon:'
    end
    object Label12: TLabel
      Left = 16
      Top = 216
      Width = 32
      Height = 13
      Caption = 'E-mail:'
    end
    object Label13: TLabel
      Left = 16
      Top = 248
      Width = 45
      Height = 13
      Caption = 'A'#231'iklama:'
    end
  end
  inherited pnlFields: TPanel
    Height = 352
    ExplicitHeight = 352
    object edtLidNr: TEdit
      Left = 6
      Top = 16
      Width = 121
      Height = 21
      HelpType = htKeyword
      HelpKeyword = 'LidNr'
      TabOrder = 0
    end
    object edtNaam: TEdit
      Left = 6
      Top = 48
      Width = 219
      Height = 21
      HelpType = htKeyword
      HelpKeyword = 'Naam'
      TabOrder = 1
    end
    object edtAdres: TEdit
      Left = 6
      Top = 80
      Width = 219
      Height = 21
      HelpType = htKeyword
      HelpKeyword = 'Straat'
      TabOrder = 2
    end
    object edtPostcode: TEdit
      Left = 6
      Top = 112
      Width = 121
      Height = 21
      HelpType = htKeyword
      HelpKeyword = 'Postcode'
      TabOrder = 3
    end
    object edtPlaats: TEdit
      Left = 6
      Top = 144
      Width = 121
      Height = 21
      HelpType = htKeyword
      HelpKeyword = 'Plaats'
      TabOrder = 4
    end
    object edtTelefoon: TEdit
      Left = 6
      Top = 176
      Width = 121
      Height = 21
      HelpType = htKeyword
      HelpKeyword = 'Telefoonnr'
      TabOrder = 5
    end
    object edtEmail: TEdit
      Left = 6
      Top = 208
      Width = 219
      Height = 21
      HelpType = htKeyword
      HelpKeyword = 'Email'
      TabOrder = 6
    end
    object edtOmschrijving: TMemo
      Left = 6
      Top = 241
      Width = 219
      Height = 96
      HelpType = htKeyword
      HelpKeyword = 'Omschrijving'
      Lines.Strings = (
        'edtOmschrijving')
      TabOrder = 7
    end
    object edtAlgemeen: TEdit
      Left = 158
      Top = 112
      Width = 43
      Height = 21
      HelpType = htKeyword
      HelpKeyword = 'Algemeen'
      TabOrder = 8
      Text = 'true'
      Visible = False
    end
  end
end
