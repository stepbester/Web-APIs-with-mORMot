unit GreetingService;

interface

uses
  SynCommons;

type
  IGreetingService = interface(IInvokable)
    ['{CB6CBA42-7236-4E89-4755-2428DABF34FB}']
    function Hello(const Name: RawUTF8): RawUTF8;
  end;

  TGreetingService = class(TInterfacedObject, IGreetingService)
  public
    function Hello(const Name: RawUTF8): RawUTF8;
  end;

implementation

uses
  SysUtils;

function TGreetingService.Hello(const Name: RawUTF8): RawUTF8;
var
  Greeting: RawUTF8;
begin
  Greeting := 'Hello!';
  if Name <> '' then
  begin
    Greeting := FormatUTF8('Hello, %!', [Name]);
  end;
  Result := Greeting;
end;

end.
