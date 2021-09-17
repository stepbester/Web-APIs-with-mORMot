unit MovieDB;

interface

uses
  mORMot, mORMotSQLite3;

type
  TMovieDB = class(TObject)
  private
    FModel: TSQLModel;
    FDBServer: TSQLRestServerDB;
  public
    constructor Create;
    destructor Destroy; override;

    property DBServer: TSQLRestServerDB read FDBServer;
  end;

implementation

uses
  MovieModels, GreetingService, CalculatorService;

constructor TMovieDB.Create;
begin
  FModel := TSQLModel.Create([TMovie], 'api');
  FDBServer := TSQLRestServerDB.Create(FModel, ':memory:');
  FDBServer.CreateMissingTables;
  FDBServer.ServiceRegister(TGreetingService, [TypeInfo(IGreetingService)]);
  FDBServer.ServiceRegister(TCalculatorService, [TypeInfo(ICalculatorService)]);
end;

destructor TMovieDB.Destroy;
begin
  FModel.Free;
  FDBServer.Free;
  inherited Destroy;
end;

end.
