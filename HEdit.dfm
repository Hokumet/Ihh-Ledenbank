object frmHEdit: TfrmHEdit
  Left = 0
  Top = 0
  Caption = 'frmHEdit'
  ClientHeight = 349
  ClientWidth = 399
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Panel3: TPanel
    Left = 0
    Top = 270
    Width = 399
    Height = 79
    Align = alBottom
    ParentBackground = False
    TabOrder = 0
    object LblAangemaakDoor: TLabel
      Left = 45
      Top = 56
      Width = 89
      Height = 13
      Caption = 'Aangemaakt door:'
    end
    object lblAangemaaktOp: TLabel
      Left = 253
      Top = 54
      Width = 79
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
      Left = 53
      Top = 14
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
  object pnlLabels: TPanel
    Left = 0
    Top = 0
    Width = 166
    Height = 270
    Align = alClient
    BevelOuter = bvNone
    Color = 33023
    ParentBackground = False
    TabOrder = 1
  end
  object pnlFields: TPanel
    Left = 166
    Top = 0
    Width = 233
    Height = 270
    Align = alRight
    BevelOuter = bvNone
    Color = 13369950
    ParentBackground = False
    TabOrder = 2
  end
  object CurrQuery: TADOQuery
    Parameters = <>
    Left = 40
    Top = 24
  end
end
