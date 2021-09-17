unit MovieDB;

interface

uses
  mORMot, mORMotSQLite3;

type
  TMethodServerDB = class(TSQLRestServerDB)
  published
    procedure About(Ctxt: TSQLRestServerURIContext);
    procedure Describe(Ctxt: TSQLRestServerURIContext);
  end;

  TMovieDB = class(TObject)
  private
    FModel: TSQLModel;
    FDBServer: TMethodServerDB;
  public
    constructor Create;
    destructor Destroy; override;

    property DBServer: TMethodServerDB read FDBServer;
  end;

implementation

uses
  MovieModels, SynCommons, SysUtils, DateUtils;

{ TMethodServerDB }

procedure TMethodServerDB.About(Ctxt: TSQLRestServerURIContext);
begin
  Ctxt.Results(['This method can be called at the root or on a resource, with or without an ID.']);
end;

procedure TMethodServerDB.Describe(Ctxt: TSQLRestServerURIContext);
var
  RetrievedMovie: TMovie;
begin
  if Ctxt.Table.SQLTableName <> 'Movie' then
  begin
    Ctxt.Results(['Method must be invoked on the /api/movie resource.'], 400);
    Exit;
  end;

  if Ctxt.TableID = -1 then
  begin
    Ctxt.Results(['Method invoked with an invalid resource ID.'], 400);
    Exit;
  end;

  RetrievedMovie := TMovie.Create;
  try
    if not Retrieve(Ctxt.TableID, RetrievedMovie) then
    begin
      Ctxt.Results([Format('No movie to describe with ID %d.', [Ctxt.TableID])], 404);
      Exit;
    end;

    Ctxt.Results([Format('%s, released in %d, was directed by %s.',
      [RetrievedMovie.Title, DateUtils.YearOf(RetrievedMovie.Released), RetrievedMovie.Director])]);
  finally
    RetrievedMovie.Free;
  end;
end;

{ TMovieDB }

constructor TMovieDB.Create;
begin
  FModel := TSQLModel.Create([TMovie], 'api');
  FDBServer := TMethodServerDB.Create(FModel, ':memory:');
  FDBServer.CreateMissingTables;
end;

destructor TMovieDB.Destroy;
begin
  FModel.Free;
  FDBServer.Free;
  inherited Destroy;
end;

end.
