inherited frmAlgemeenImpl: TfrmAlgemeenImpl
  ClientHeight = 466
  ExplicitHeight = 493
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel3: TPanel
    Top = 387
    ExplicitTop = 387
  end
  inherited pnlLabels: TPanel
    Height = 387
    ExplicitHeight = 387
    inherited Label11: TLabel
      Top = 216
      ExplicitTop = 216
    end
    inherited Label12: TLabel
      Top = 248
      ExplicitTop = 248
    end
    inherited Label13: TLabel
      Top = 280
      ExplicitTop = 280
    end
    object Label2: TLabel
      Left = 16
      Top = 184
      Width = 44
      Height = 13
      Caption = 'Kategori:'
    end
  end
  inherited pnlFields: TPanel
    Height = 387
    ExplicitHeight = 387
    inherited edtAlgemeen: TEdit [0]
      Left = 136
      TabOrder = 9
      ExplicitLeft = 136
    end
    inherited edtLidNr: TEdit [1]
    end
    inherited edtNaam: TEdit [2]
    end
    inherited edtAdres: TEdit [3]
    end
    inherited edtPostcode: TEdit [4]
    end
    inherited edtPlaats: TEdit [5]
    end
    inherited edtTelefoon: TEdit [6]
      Top = 208
      TabOrder = 6
      ExplicitTop = 208
    end
    inherited edtEmail: TEdit [7]
      Top = 240
      TabOrder = 7
      ExplicitTop = 240
    end
    inherited edtOmschrijving: TMemo [8]
      Top = 273
      Lines.Strings = ()
      TabOrder = 8
      ExplicitTop = 273
    end
    object cmbCategorie: TComboBox
      Left = 6
      Top = 176
      Width = 145
      Height = 21
      Hint = 'Categorieen'
      HelpType = htKeyword
      HelpKeyword = 'Categorie'
      TabOrder = 5
      TextHint = 'Categorie'
    end
  end
  inherited CurrQuery: TADOQuery
    Left = 72
  end
end
