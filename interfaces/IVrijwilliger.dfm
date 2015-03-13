inherited frmIVrijwilliger: TfrmIVrijwilliger
  Caption = 'G'#246'n'#252'll'#252' bilgileri'
  ClientHeight = 471
  ExplicitWidth = 320
  ExplicitHeight = 509
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel3: TPanel
    Top = 392
    ExplicitTop = 392
  end
  inherited pnlLabels: TPanel
    Height = 392
    ExplicitHeight = 392
    object Label2: TLabel [1]
      Left = 16
      Top = 56
      Width = 55
      Height = 13
      Caption = 'Kayit tarihi:'
    end
    inherited Label7: TLabel
      Top = 88
      ExplicitTop = 88
    end
    inherited Label8: TLabel
      Top = 120
      ExplicitTop = 120
    end
    inherited Label9: TLabel
      Top = 152
      ExplicitTop = 152
    end
    inherited Label10: TLabel
      Top = 184
      ExplicitTop = 184
    end
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
  end
  inherited pnlFields: TPanel
    Height = 392
    ExplicitHeight = 392
    object dtpLidDatum: TDateTimePicker [1]
      Left = 6
      Top = 48
      Width = 131
      Height = 21
      HelpType = htKeyword
      HelpKeyword = 'InschrijfDatum'
      Date = 41005.641051134260000000
      Time = 41005.641051134260000000
      TabOrder = 1
    end
    inherited edtNaam: TEdit
      Top = 80
      TabOrder = 2
      ExplicitTop = 80
    end
    inherited edtAdres: TEdit
      Top = 112
      TabOrder = 3
      ExplicitTop = 112
    end
    inherited edtPostcode: TEdit
      Top = 144
      TabOrder = 4
      ExplicitTop = 144
    end
    inherited edtPlaats: TEdit
      Top = 176
      TabOrder = 5
      ExplicitTop = 176
    end
    inherited edtTelefoon: TEdit
      Top = 208
      TabOrder = 6
      ExplicitTop = 208
    end
    inherited edtEmail: TEdit
      Top = 240
      TabOrder = 7
      ExplicitTop = 240
    end
    inherited edtOmschrijving: TMemo
      Top = 273
      TabOrder = 9
      ExplicitTop = 273
    end
  end
end
