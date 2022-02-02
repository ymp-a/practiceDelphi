object F0002Frm: TF0002Frm
  Left = 0
  Top = 0
  Caption = #25285#24403#32773#12513#12531#12486#30011#38754
  ClientHeight = 242
  ClientWidth = 366
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 366
    Height = 192
    Align = alClient
    TabOrder = 0
    object Label5: TLabel
      Left = 32
      Top = 164
      Width = 24
      Height = 13
      Caption = #21066#38500
    end
    object Label4: TLabel
      Left = 32
      Top = 129
      Width = 24
      Height = 13
      Caption = #27177#38480
    end
    object Label3: TLabel
      Left = 32
      Top = 97
      Width = 47
      Height = 13
      Caption = #12497#12473#12527#12540#12489
    end
    object Label2: TLabel
      Left = 32
      Top = 70
      Width = 48
      Height = 13
      Caption = #25285#24403#32773#21517
    end
    object Label1: TLabel
      Left = 32
      Top = 43
      Width = 50
      Height = 13
      Caption = #25285#24403#32773'CD'
    end
    object EdtPass: TEdit
      Left = 88
      Top = 94
      Width = 121
      Height = 21
      TabOrder = 2
    end
    object chkSTKB: TCheckBox
      Left = 88
      Top = 160
      Width = 25
      Height = 17
      TabOrder = 4
    end
    object CmbKGNM: TComboBox
      Left = 88
      Top = 126
      Width = 145
      Height = 21
      ImeMode = imDisable
      ItemIndex = 0
      TabOrder = 3
      Text = #19968#33324
      Items.Strings = (
        #19968#33324
        #26989#21209#31649#29702#32773
        #12471#12473#12486#12512#31649#29702#32773)
    end
    object EdtNAME: TDBEditUNIC
      Left = 88
      Top = 67
      Width = 121
      Height = 21
      DataField = 'TNNAME'
      DataSource = DataModule3.DataSource2
      ImeMode = imHira
      TabOrder = 1
      OptLen = 20
      OptFldType = O
    end
    object EdtKGKB: TDBEditUNIC
      Left = 239
      Top = 126
      Width = 121
      Height = 21
      DataField = 'TNKGKB'
      DataSource = DataModule3.DataSource2
      TabOrder = 5
      Visible = False
    end
    object EdtTNCD: TDBEditUNIC
      Left = 88
      Top = 40
      Width = 43
      Height = 21
      DataField = 'TNTNCD'
      DataSource = DataModule3.DataSource2
      Enabled = False
      ImeMode = imClose
      ImeName = 'Microsoft Office IME 2007'
      TabOrder = 0
      OptLen = 4
      OptUpper = True
    end
    object EdtPASSw: TDBEditUNIC
      Left = 214
      Top = 93
      Width = 146
      Height = 21
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      DataSource = DataModule3.DataSource2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #65325#65331' '#12468#12471#12483#12463
      Font.Style = []
      ImeMode = imClose
      ParentFont = False
      PasswordChar = '*'
      TabOrder = 6
      Visible = False
      OptLen = 10
    end
    object EdtMode: TEdit
      Left = 0
      Top = 0
      Width = 73
      Height = 24
      Alignment = taCenter
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #65325#65331' '#12468#12471#12483#12463
      Font.Style = []
      ParentFont = False
      TabOrder = 7
      Text = #36861#21152
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 192
    Width = 366
    Height = 50
    Align = alBottom
    TabOrder = 1
    object Button2: TButton
      Left = 7
      Top = 14
      Width = 75
      Height = 25
      Caption = #26356#26032
      TabOrder = 0
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 112
      Top = 14
      Width = 75
      Height = 25
      Caption = #32066#20102
      TabOrder = 1
      OnClick = Button3Click
    end
  end
end
