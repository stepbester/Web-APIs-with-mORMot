unit CalculatorService;

interface

uses
  SynCommons;

type
  ICalculatorService = interface(IInvokable)
    ['{5606726F-7DAB-4A56-A63E-04C004969A36}']
    function Add(const A, B: Integer): Integer;
    function Multiply(const A, B: Integer): Integer;
  end;

  TCalculatorService = class(TInterfacedObject, ICalculatorService)
  public
    function Add(const A, B: Integer): Integer;
    function Multiply(const A, B: Integer): Integer;
  end;

implementation

function TCalculatorService.Add(const A, B: Integer): Integer;
begin
  Result := A + B;
end;

function TCalculatorService.Multiply(const A, B: Integer): Integer;
begin
  Result := A * B;
end;

end.
