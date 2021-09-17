unit MovieModels;

interface

uses
  mORMot, SynCommons;

type
  TMovie = class(TSQLRecord)
  private
    FTitle: RawUTF8;
    FDirector: RawUTF8;
    FReleased: TDateTime;
    FRunningTime: Integer;
  published
    property Title: RawUTF8 index 200 read FTitle write FTitle;
    property Director: RawUTF8 index 120 read FDirector write FDirector;
    property Released: TDateTime read FReleased write FReleased;
    property RunningTime: Integer read FRunningTime write FRunningTime;
  end;

implementation

end.
