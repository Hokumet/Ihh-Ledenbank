object frmEditAncestor: TfrmEditAncestor
  Left = 736
  Top = 237
  BorderStyle = bsToolWindow
  Caption = 'frmEditAncestor'
  ClientHeight = 559
  ClientWidth = 387
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Panel3: TPanel
    Left = 0
    Top = 480
    Width = 387
    Height = 79
    Align = alBottom
    ParentBackground = False
    TabOrder = 1
    object LblAangemaakDoor: TLabel
      Left = 45
      Top = 56
      Width = 87
      Height = 13
      Caption = 'Aangemaakt door:'
    end
    object lblAangemaaktOp: TLabel
      Left = 253
      Top = 54
      Width = 78
      Height = 13
      Caption = 'Aangemaakt op:'
    end
    object btnCancel: TBitBtn
      Left = 253
      Top = 15
      Width = 90
      Height = 25
      Caption = '&Annuleren'
      ModalResult = 2
      TabOrder = 0
      OnClick = btnCancelClick
    end
    object btnSave: TBitBtn
      Left = 45
      Top = 15
      Width = 90
      Height = 25
      Caption = '&Ok'
      ModalResult = 1
      TabOrder = 1
      OnClick = btnSaveClick
    end
    object btnReset: TBitBtn
      Left = 149
      Top = 15
      Width = 90
      Height = 25
      Caption = '&Reset'
      TabOrder = 2
      OnClick = btnResetClick
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 387
    Height = 480
    ActivePage = tbsGenel
    Align = alClient
    TabOrder = 0
    object tbsGenel: TTabSheet
      Caption = 'Algemeen'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Panel2: TPanel
        Left = 160
        Top = 0
        Width = 219
        Height = 452
        Align = alRight
        BevelOuter = bvNone
        Color = 13369950
        ParentBackground = False
        TabOrder = 1
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 160
        Height = 452
        Align = alClient
        BevelOuter = bvNone
        Color = 33023
        ParentBackground = False
        TabOrder = 0
      end
    end
  end
end
