unit MovieWeb;

interface

uses
  MovieDB, mORMotHttpServer;

type
  TMovieWeb = class(TObject)
  private
    FHttpServer: TSQLHttpServer;
  public
    constructor Create(AMovieDB: TMovieDB; APort: string);
  end;

implementation

constructor TMovieWeb.Create(AMovieDB: TMovieDB; APort: string);
begin
  FHttpServer := TSQLHttpServer.Create(APort, [AMovieDB.DBServer]);
  FHttpServer.AccessControlAllowOrigin := '*';
end;

end.
