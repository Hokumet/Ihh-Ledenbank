inherited frmVrijwilligerImpl: TfrmVrijwilligerImpl
  ClientHeight = 499
  ExplicitHeight = 537
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel3: TPanel
    Top = 420
    ExplicitTop = 420
  end
  inherited pnlLabels: TPanel
    Height = 420
    ExplicitHeight = 420
    inherited Label11: TLabel
      Top = 248
      ExplicitTop = 248
    end
    inherited Label12: TLabel
      Top = 280
      ExplicitTop = 280
    end
    inherited Label13: TLabel
      Top = 312
      ExplicitTop = 312
    end
    object Label3: TLabel
      Left = 16
      Top = 216
      Width = 36
      Height = 13
      Caption = 'Meslek:'
    end
  end
  inherited pnlFields: TPanel
    Height = 420
    ExplicitHeight = 420
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
      Top = 305
      Lines.Strings = ()
      ExplicitTop = 305
    end
    inherited edtAlgemeen: TEdit
      TabOrder = 10
    end
    object cmbBaan: TComboBox
      Left = 6
      Top = 208
      Width = 219
      Height = 21
      Hint = 'Banen'
      HelpType = htKeyword
      HelpKeyword = 'Baan'
      TabOrder = 6
      TextHint = 'Naam'
    end
    object edtVrijwilliger: TEdit
      Left = 158
      Top = 144
      Width = 43
      Height = 21
      HelpType = htKeyword
      HelpKeyword = 'Vrijwilliger'
      TabOrder = 11
      Text = 'true'
      Visible = False
    end
  end
end
