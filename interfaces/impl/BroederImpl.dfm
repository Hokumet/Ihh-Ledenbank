inherited frmBroederImpl: TfrmBroederImpl
  Caption = 'frmBroederImpl'
  ClientHeight = 634
  ExplicitHeight = 672
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel3: TPanel
    Top = 555
    ExplicitTop = 555
  end
  inherited pnlLabels: TPanel
    Height = 555
    ExplicitHeight = 555
    inherited Label3: TLabel
      Top = 404
      ExplicitTop = 404
    end
    inherited Label13: TLabel
      Top = 434
      ExplicitTop = 434
    end
    object lblBroeder: TLabel
      Left = 16
      Top = 374
      Width = 56
      Height = 13
      Caption = 'Yetimin Adi:'
    end
  end
  inherited pnlFields: TPanel
    Height = 555
    ExplicitHeight = 555
    inherited cmbBetaling: TComboBox
      Top = 396
      ExplicitTop = 396
    end
    inherited cmbLand: TComboBox
      TabOrder = 9
    end
    inherited edtEmail: TEdit
      TabOrder = 8
    end
    inherited edtOmschrijving: TMemo
      Top = 431
      Lines.Strings = ()
      ExplicitTop = 431
    end
    inherited edtAlgemeen: TEdit
      TabOrder = 13
    end
    object edtYFONaam: TEdit
      Left = 6
      Top = 366
      Width = 219
      Height = 21
      HelpType = htKeyword
      HelpKeyword = 'YFONaam'
      TabOrder = 10
    end
    object edtWees: TEdit
      Left = 158
      Top = 144
      Width = 43
      Height = 21
      HelpType = htKeyword
      HelpKeyword = 'Wees'
      TabOrder = 14
      Text = 'true'
      Visible = False
    end
    object edtArm: TEdit
      Left = 158
      Top = 176
      Width = 43
      Height = 21
      HelpType = htKeyword
      HelpKeyword = 'Arm'
      TabOrder = 16
      Text = 'true'
      Visible = False
    end
    object edtBeurs: TEdit
      Left = 158
      Top = 208
      Width = 43
      Height = 21
      HelpType = htKeyword
      HelpKeyword = 'Beurs'
      TabOrder = 15
      Text = 'true'
      Visible = False
    end
  end
end
