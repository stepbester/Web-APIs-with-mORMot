unit MovieWeb;

interface

uses
  MovieDB, mORMotHttpServer;

type
  TMovieWeb = class(TObject)
  private
    FHttpServer: TSQLHttpServer;
  public
    constructor Create(AMovieDB: TMovieDB; const Port: AnsiString);
  end;

implementation

constructor TMovieWeb.Create(AMovieDB: TMovieDB; const Port: AnsiString);
begin
  FHttpServer := TSQLHttpServer.Create(Port, [AMovieDB.DBServer]);
  FHttpServer.AccessControlAllowOrigin := '*';
end;

end.
