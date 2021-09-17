program RESTORM;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  SynSQLite3Static,
  SynLog,
  MovieDB in '..\Common\MovieDB.pas',
  MovieModels in '..\Common\MovieModels.pas',
  MovieWeb in 'MovieWeb.pas';

const
  Port = '8080';

var
  DB: TMovieDB;
  Server: TMovieWeb;

begin
  with TSynLog.Family do
  begin
    Level := LOG_VERBOSE;
    EchoToConsole := LOG_VERBOSE;
  end;

  DB := TMovieDB.Create;
  try
    Server := TMovieWeb.Create(DB, Port);
    try
      repeat until False;
    finally
      Server.Free;
    end;
  finally
    DB.Free;
  end;
end.
