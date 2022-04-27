inherited IH004MS: TIH004MS
  Caption = 'IH004MS'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TPanel
    inherited DBGrid1: TDBGrid
      OnDblClick = DBGrid1DblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'TNTNCD'
          Title.Caption = #25285#24403#32773'CD'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TNNAME'
          Title.Caption = #25285#24403#32773#21517
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TNKGKB'
          Title.Caption = #27177#38480
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TNSTKB'
          Title.Caption = #29366#24907
          Visible = True
        end>
    end
  end
  inherited Panel3: TPanel
    inherited Button2: TBitBtn
      Caption = #36984#25246'(F2)'
    end
    inherited Button3: TBitBtn
      TabStop = False
      Visible = False
    end
    inherited Button4: TBitBtn
      TabStop = False
      Visible = False
    end
  end
end
