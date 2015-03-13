inherited frmSpaarpotImpl: TfrmSpaarpotImpl
  ClientHeight = 581
  ExplicitHeight = 619
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel3: TPanel
    Top = 502
    ExplicitTop = 502
  end
  inherited pnlLabels: TPanel
    Height = 502
    ExplicitHeight = 502
    inherited Label3: TLabel
      Top = 312
      ExplicitTop = 312
    end
    inherited Label11: TLabel
      Top = 248
      ExplicitTop = 248
    end
    inherited Label12: TLabel
      Top = 280
      ExplicitTop = 280
    end
    inherited Label13: TLabel
      Top = 342
      ExplicitTop = 342
    end
    object Label4: TLabel
      Left = 16
      Top = 216
      Width = 62
      Height = 13
      Caption = 'Kumbara No:'
    end
  end
  inherited pnlFields: TPanel
    Height = 502
    ExplicitHeight = 502
    inherited cmbBetaling: TComboBox
      Top = 304
      TabOrder = 9
      ExplicitTop = 304
    end
    inherited edtTelefoon: TEdit
      Top = 240
      TabOrder = 7
      ExplicitTop = 240
    end
    inherited edtEmail: TEdit
      Top = 272
      TabOrder = 8
      ExplicitTop = 272
    end
    inherited edtOmschrijving: TMemo
      Top = 336
      Lines.Strings = ()
      TabOrder = 10
      ExplicitTop = 336
    end
    inherited edtAlgemeen: TEdit
      TabOrder = 11
    end
    object edtSpaarpotNr: TEdit
      Left = 6
      Top = 208
      Width = 121
      Height = 21
      HelpType = htKeyword
      HelpKeyword = 'SpaarpotNr'
      TabOrder = 6
    end
    object edtSpaarpot: TEdit
      Left = 158
      Top = 144
      Width = 43
      Height = 21
      HelpType = htKeyword
      HelpKeyword = 'Spaarpot'
      TabOrder = 12
      Text = 'true'
      Visible = False
    end
  end
end
