object frmSettingAncestor: TfrmSettingAncestor
  Left = 576
  Top = 279
  Caption = 'Ayarlar'
  ClientHeight = 282
  ClientWidth = 453
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Panel3: TPanel
    Left = 0
    Top = 227
    Width = 453
    Height = 55
    Align = alBottom
    ParentBackground = False
    TabOrder = 0
    DesignSize = (
      453
      55)
    object btnCancel: TBitBtn
      Left = 327
      Top = 15
      Width = 90
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Annuleren'
      ModalResult = 2
      TabOrder = 0
    end
    object btnSave: TBitBtn
      Left = 93
      Top = 15
      Width = 90
      Height = 25
      Caption = '&Opslaan'
      ModalResult = 1
      TabOrder = 1
      OnClick = btnSaveClick
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 453
    Height = 227
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = 'Genel'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Panel2: TPanel
        Left = 144
        Top = 0
        Width = 301
        Height = 199
        Align = alRight
        BevelOuter = bvNone
        Color = clBlue
        ParentBackground = False
        TabOrder = 1
        object edtBackground: TEdit
          Left = 13
          Top = 45
          Width = 183
          Height = 21
          TabOrder = 1
        end
        object edtLogin: TEdit
          Left = 13
          Top = 69
          Width = 183
          Height = 21
          TabOrder = 3
        end
        object btnBack: TButton
          Left = 216
          Top = 45
          Width = 73
          Height = 21
          Caption = 'Bladeren'
          TabOrder = 2
          OnClick = btnBackClick
        end
        object btnLog: TButton
          Left = 216
          Top = 69
          Width = 73
          Height = 21
          Caption = 'Bladeren'
          TabOrder = 4
          OnClick = btnLogClick
        end
        object edtAnaekran: TEdit
          Left = 13
          Top = 93
          Width = 183
          Height = 21
          TabOrder = 5
        end
        object btnAnaekran: TButton
          Left = 216
          Top = 93
          Width = 73
          Height = 21
          Caption = 'Bladeren'
          TabOrder = 6
          OnClick = btnAnaekranClick
        end
        object edtTitel: TEdit
          Left = 13
          Top = 21
          Width = 183
          Height = 21
          TabOrder = 0
        end
        object edtDatabase: TEdit
          Left = 13
          Top = 117
          Width = 183
          Height = 21
          Enabled = False
          TabOrder = 7
        end
        object btnDatabase: TButton
          Left = 216
          Top = 117
          Width = 73
          Height = 21
          Caption = 'Bladeren'
          TabOrder = 8
          Visible = False
          OnClick = btnDatabaseClick
        end
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 144
        Height = 199
        Align = alClient
        BevelOuter = bvNone
        Color = 33023
        ParentBackground = False
        TabOrder = 0
        object lAdi: TLabel
          Left = 20
          Top = 48
          Width = 64
          Height = 13
          Caption = 'Rapport logo:'
        end
        object Label1: TLabel
          Left = 20
          Top = 72
          Width = 52
          Height = 13
          Caption = 'Login logo:'
        end
        object Label2: TLabel
          Left = 20
          Top = 96
          Width = 120
          Height = 13
          Caption = 'Hoofscherm achtergrond:'
        end
        object Label3: TLabel
          Left = 20
          Top = 24
          Width = 75
          Height = 13
          Caption = 'Programma titel:'
        end
        object Label4: TLabel
          Left = 20
          Top = 121
          Width = 69
          Height = 13
          Caption = 'Database map'
        end
      end
    end
  end
  object OpenDialog: TOpenPictureDialog
    Filter = 
      'All (*.jpg;*.jpeg;*.bmp;*.ico;*.emf;*.wmf)|*.jpg;*.jpeg;*.bmp,*.' +
      'png|JPEG Image File (*.jpg)|*.jpg|JPEG Image File (*.jpeg)|*.jpe' +
      'g|Bitmaps (*.bmp)|*.bmp| Png Image File (*.png)|*.png'
    InitialDir = 'C:\'
    Left = 168
    Top = 8
  end
end
