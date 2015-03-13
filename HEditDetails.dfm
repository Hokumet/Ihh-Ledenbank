inherited frmEditDetails: TfrmEditDetails
  Caption = ''
  ClientHeight = 578
  ExplicitHeight = 616
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel3: TPanel
    Top = 499
    ExplicitTop = 499
    ExplicitWidth = 769
  end
  inherited pnlLabels: TPanel
    Left = 397
    Width = 2
    Height = 499
    Align = alRight
    ExplicitLeft = 767
    ExplicitWidth = 2
    ExplicitHeight = 499
  end
  inherited pnlFields: TPanel
    Left = 0
    Width = 0
    Height = 499
    Align = alLeft
    ExplicitLeft = 0
    ExplicitWidth = 0
    ExplicitHeight = 499
  end
  object PageControl: TPageControl [3]
    Left = 0
    Top = 0
    Width = 397
    Height = 499
    HelpType = htKeyword
    HelpKeyword = 'DetailTableName'
    ActivePage = TabSheet2
    Align = alClient
    TabOrder = 3
    ExplicitWidth = 767
    object TabSheet1: TTabSheet
      Caption = 'General'
      ExplicitWidth = 759
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 156
        Height = 471
        Align = alClient
        BevelOuter = bvNone
        Color = 33023
        ParentBackground = False
        TabOrder = 0
        ExplicitWidth = 166
        ExplicitHeight = 270
      end
      object Panel2: TPanel
        Left = 156
        Top = 0
        Width = 233
        Height = 471
        Align = alRight
        BevelOuter = bvNone
        Color = 13369950
        ParentBackground = False
        TabOrder = 1
        ExplicitLeft = 166
        ExplicitHeight = 270
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Details'
      ImageIndex = 1
      ExplicitWidth = 759
      inline frAncestor1: TfrAncestor
        Left = 0
        Top = 0
        Width = 389
        Height = 471
        Align = alClient
        Color = 2068964
        ParentBackground = False
        ParentColor = False
        TabOrder = 0
        ExplicitWidth = 759
        ExplicitHeight = 471
        inherited lblTitel: TLabel
          Width = 389
        end
        inherited Panel1: TPanel
          Top = 406
          Width = 389
          ExplicitTop = 406
          ExplicitWidth = 759
        end
        inherited lvwItems: TListView
          Width = 389
          Height = 393
          ExplicitWidth = 759
          ExplicitHeight = 393
        end
        inherited pmpRightClick: TPopupMenu
          Left = 192
          Top = 88
        end
      end
    end
  end
end
