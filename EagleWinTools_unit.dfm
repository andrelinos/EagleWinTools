object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'EagleWinTools'
  ClientHeight = 817
  ClientWidth = 1062
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1062
    Height = 817
    Align = alClient
    BevelOuter = bvNone
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 0
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 1062
      Height = 113
      Align = alTop
      BevelOuter = bvNone
      Color = 3355443
      ParentBackground = False
      TabOrder = 0
      object Label9: TLabel
        Left = 41
        Top = 32
        Width = 52
        Height = 16
        Caption = 'Windows'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label10: TLabel
        Left = 40
        Top = 56
        Width = 59
        Height = 13
        Caption = 'Processador'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label15: TLabel
        Left = 41
        Top = 75
        Width = 70
        Height = 13
        Caption = 'InfoMainboard'
        Color = clWindow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clLime
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
    end
    object Panel3: TPanel
      Left = 0
      Top = 113
      Width = 1062
      Height = 704
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 344
        Height = 704
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
        object PageControl: TPageControl
          Left = 0
          Top = 0
          Width = 344
          Height = 704
          ActivePage = Windows
          Align = alClient
          TabOrder = 0
          object Windows: TTabSheet
            Caption = 'Navegadores'
            object ScrollBox1: TScrollBox
              Left = 0
              Top = 0
              Width = 336
              Height = 676
              VertScrollBar.Smooth = True
              VertScrollBar.Tracking = True
              Align = alClient
              BorderStyle = bsNone
              Ctl3D = False
              ParentCtl3D = False
              TabOrder = 0
              object Panel6: TPanel
                Left = 0
                Top = 0
                Width = 336
                Height = 676
                Align = alClient
                BevelOuter = bvNone
                Color = 3355443
                ParentBackground = False
                TabOrder = 0
                object Panel9: TPanel
                  Left = 0
                  Top = 0
                  Width = 336
                  Height = 80
                  Align = alTop
                  BevelOuter = bvNone
                  BorderStyle = bsSingle
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWhite
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                  object Label3: TLabel
                    Left = 32
                    Top = 12
                    Width = 120
                    Height = 19
                    Caption = 'Internet Explorer'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWhite
                    Font.Height = -16
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    ParentFont = False
                  end
                  object spInternetExplorer: TSpeedButton
                    Left = 224
                    Top = 50
                    Width = 80
                    Height = 24
                    Caption = 'Executar'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object Label1: TLabel
                    Left = 55
                    Top = 36
                    Width = 122
                    Height = 16
                    Caption = 'Limpar senhas salvas'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = 8421631
                    Font.Height = -13
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    ParentFont = False
                  end
                  object CheckBox17: TCheckBox
                    Left = 39
                    Top = 37
                    Width = 26
                    Height = 17
                    Color = 8453888
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWhite
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    ParentColor = False
                    ParentFont = False
                    TabOrder = 0
                  end
                end
                object Panel7: TPanel
                  Left = 0
                  Top = 80
                  Width = 336
                  Height = 80
                  Align = alTop
                  BevelOuter = bvNone
                  BorderStyle = bsSingle
                  TabOrder = 1
                  object Label2: TLabel
                    Left = 32
                    Top = 12
                    Width = 120
                    Height = 19
                    Caption = 'Microsoft Edge'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWhite
                    Font.Height = -16
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object spMicrosoftEdge: TSpeedButton
                    Left = 224
                    Top = 50
                    Width = 80
                    Height = 24
                    Caption = 'Executar'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                    OnClick = spMicrosoftEdgeClick
                  end
                  object Label6: TLabel
                    Left = 55
                    Top = 37
                    Width = 122
                    Height = 16
                    Caption = 'Limpar senhas salvas'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = 8421631
                    Font.Height = -13
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    ParentFont = False
                  end
                  object Edge_TempFile_CheckBox: TCheckBox
                    Left = 39
                    Top = 37
                    Width = 26
                    Height = 17
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWhite
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 0
                  end
                end
                object Panel8: TPanel
                  Left = 0
                  Top = 240
                  Width = 336
                  Height = 80
                  Align = alTop
                  BevelOuter = bvNone
                  BorderStyle = bsSingle
                  TabOrder = 2
                  object Label4: TLabel
                    Left = 32
                    Top = 12
                    Width = 148
                    Height = 19
                    Caption = 'Navegador Vivaldi'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWhite
                    Font.Height = -16
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object spNavegadorVivaldi: TSpeedButton
                    Left = 224
                    Top = 42
                    Width = 80
                    Height = 24
                    Caption = 'Executar'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                    OnClick = spNavegadorVivaldiClick
                  end
                  object Label8: TLabel
                    Left = 55
                    Top = 37
                    Width = 122
                    Height = 16
                    Caption = 'Limpar senhas salvas'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = 8421631
                    Font.Height = -13
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    ParentFont = False
                  end
                  object CheckBox25: TCheckBox
                    Left = 39
                    Top = 37
                    Width = 26
                    Height = 17
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWhite
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 0
                  end
                end
                object Panel10: TPanel
                  Left = 0
                  Top = 160
                  Width = 336
                  Height = 80
                  Align = alTop
                  BevelOuter = bvNone
                  BorderStyle = bsSingle
                  TabOrder = 3
                  object Label5: TLabel
                    Left = 32
                    Top = 12
                    Width = 120
                    Height = 19
                    Caption = 'Mozilla Firefox'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWhite
                    Font.Height = -16
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object spMozillaFirefox: TSpeedButton
                    Left = 224
                    Top = 49
                    Width = 80
                    Height = 24
                    Caption = 'Executar'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                    OnClick = spMozillaFirefoxClick
                  end
                  object Label7: TLabel
                    Left = 55
                    Top = 37
                    Width = 122
                    Height = 16
                    Caption = 'Limpar senhas salvas'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = 8421631
                    Font.Height = -13
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    ParentFont = False
                  end
                  object CheckBox33: TCheckBox
                    Left = 39
                    Top = 37
                    Width = 26
                    Height = 17
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWhite
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 0
                  end
                end
              end
            end
          end
          object Aplicativos: TTabSheet
            Caption = 'Windows'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 3355443
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ImageIndex = 1
            ParentFont = False
            object ScrollBox2: TScrollBox
              Left = 0
              Top = 0
              Width = 336
              Height = 676
              VertScrollBar.Smooth = True
              VertScrollBar.Tracking = True
              Align = alClient
              BorderStyle = bsNone
              Ctl3D = False
              ParentCtl3D = False
              TabOrder = 0
              object Panel5: TPanel
                Left = 0
                Top = 0
                Width = 336
                Height = 676
                Align = alClient
                Color = 3355443
                ParentBackground = False
                TabOrder = 0
                object Panel13: TPanel
                  Left = 1
                  Top = 1
                  Width = 334
                  Height = 80
                  Align = alTop
                  BevelOuter = bvNone
                  BorderStyle = bsSingle
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWhite
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                  object Label11: TLabel
                    Left = 32
                    Top = 12
                    Width = 147
                    Height = 19
                    Caption = 'Windows Explorer'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWhite
                    Font.Height = -16
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object SpeedButton4: TSpeedButton
                    Left = 224
                    Top = 50
                    Width = 80
                    Height = 24
                    Caption = 'Executar'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object Label12: TLabel
                    Left = 55
                    Top = 36
                    Width = 123
                    Height = 16
                    Caption = 'Documentos recentes'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = 8421631
                    Font.Height = -13
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    ParentFont = False
                  end
                  object CheckBox1: TCheckBox
                    Left = 39
                    Top = 37
                    Width = 26
                    Height = 17
                    Color = 8453888
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWhite
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    ParentColor = False
                    ParentFont = False
                    TabOrder = 0
                  end
                end
                object Panel14: TPanel
                  Left = 1
                  Top = 81
                  Width = 334
                  Height = 80
                  Align = alTop
                  BevelOuter = bvNone
                  BorderStyle = bsSingle
                  TabOrder = 1
                  object Label13: TLabel
                    Left = 32
                    Top = 12
                    Width = 65
                    Height = 19
                    Caption = 'Sistema'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWhite
                    Font.Height = -16
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object SpeedButton5: TSpeedButton
                    Left = 224
                    Top = 50
                    Width = 80
                    Height = 24
                    Caption = 'Executar'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object Label14: TLabel
                    Left = 55
                    Top = 37
                    Width = 85
                    Height = 16
                    Caption = 'Esvaziar lixeira'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = 8421631
                    Font.Height = -13
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    ParentFont = False
                  end
                  object CheckBox2: TCheckBox
                    Left = 39
                    Top = 37
                    Width = 26
                    Height = 17
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWhite
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 0
                  end
                end
              end
            end
          end
          object TabSheet1: TTabSheet
            Caption = 'TabSheet1'
            ImageIndex = 2
          end
        end
      end
      object Panel11: TPanel
        Left = 344
        Top = 0
        Width = 718
        Height = 704
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object Panel12: TPanel
          Left = 0
          Top = 0
          Width = 718
          Height = 99
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object Label16: TLabel
            Left = 6
            Top = 77
            Width = 93
            Height = 16
            Caption = 'Processando...'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Visible = False
          end
        end
        object Panel15: TPanel
          Left = 0
          Top = 99
          Width = 718
          Height = 316
          Align = alTop
          BevelOuter = bvNone
          Caption = 'Panel12'
          TabOrder = 1
          object MemoLogs: TMemo
            Left = 0
            Top = 0
            Width = 718
            Height = 316
            Align = alClient
            BevelInner = bvNone
            BevelOuter = bvNone
            BorderStyle = bsNone
            Ctl3D = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Verdana'
            Font.Style = [fsItalic]
            ParentCtl3D = False
            ParentFont = False
            ReadOnly = True
            ScrollBars = ssVertical
            TabOrder = 0
          end
        end
      end
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 500
    OnTimer = Timer1Timer
    Left = 584
    Top = 161
  end
end
