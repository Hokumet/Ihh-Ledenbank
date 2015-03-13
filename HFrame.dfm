object frAncestor: TfrAncestor
  Left = 0
  Top = 0
  Width = 369
  Height = 374
  Color = 2068964
  ParentBackground = False
  ParentColor = False
  TabOrder = 0
  object lblTitel: TLabel
    Left = 0
    Top = 0
    Width = 369
    Height = 13
    Align = alTop
    Alignment = taCenter
    Caption = 'lblTitel'
    Color = 9175051
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    ExplicitWidth = 39
  end
  object Panel1: TPanel
    Left = 0
    Top = 309
    Width = 369
    Height = 65
    Align = alBottom
    Color = 9175051
    TabOrder = 1
    object btnNew: TButton
      Left = 8
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Nieuw'
      TabOrder = 0
    end
    object btnEdit: TButton
      Left = 128
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Wijzigen'
      TabOrder = 1
    end
    object btnDelete: TButton
      Left = 240
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Verwijderen'
      TabOrder = 2
      OnClick = btnDeleteClick
    end
  end
  object lvwItems: TListView
    Left = 0
    Top = 13
    Width = 369
    Height = 296
    Align = alClient
    Columns = <>
    HideSelection = False
    RowSelect = True
    PopupMenu = pmpRightClick
    TabOrder = 0
    ViewStyle = vsReport
    OnClick = lvwItemsClick
    OnDblClick = lvwItemsDblClick
    OnSelectItem = lvwItemsSelectItem
  end
  object pmpRightClick: TPopupMenu
    Left = 216
    Top = 112
    object Yeni1: TMenuItem
      Caption = 'Yeni'
    end
    object Degistir1: TMenuItem
      Caption = 'Degistir'
      Default = True
      OnClick = lvwItemsDblClick
    end
    object Sil1: TMenuItem
      Caption = 'Sil'
      OnClick = btnDeleteClick
    end
  end
end
