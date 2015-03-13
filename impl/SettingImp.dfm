inherited frmSettingImp: TfrmSettingImp
  Caption = 'frmSettingImp'
  ExplicitWidth = 469
  ExplicitHeight = 320
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    inherited TabSheet1: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 445
      ExplicitHeight = 199
      inherited Panel2: TPanel
        object btnWorddoc: TButton
          Left = 216
          Top = 141
          Width = 73
          Height = 21
          Caption = 'Bladeren'
          TabOrder = 9
          OnClick = btnWorddocClick
        end
      end
      inherited Panel1: TPanel
        inherited Label4: TLabel
          Top = 120
          ExplicitTop = 120
        end
        object Label5: TLabel
          Left = 20
          Top = 144
          Width = 76
          Height = 13
          Caption = 'Word document'
        end
      end
    end
  end
  object edtWordDocument: TEdit [2]
    Left = 161
    Top = 165
    Width = 183
    Height = 21
    TabOrder = 2
  end
  object odWordDoc: TOpenDialog
    Left = 216
    Top = 8
  end
end
