{ћодуль выравнивани€ колонок DBGrid по ширине}
unit AdjustGrid;

interface

uses Windows, Forms, DBGrids;

Procedure AutoSizeColDBGrid(DBGrid: TDBGrid);

implementation

Procedure AutoSizeColDBGrid(DBGrid: TDBGrid);
var
  i, ColWidth, ColTextWidth: integer;
begin
  if DBGrid.DataSource.DataSet.Active then
  begin
    DBGrid.DataSource.DataSet.DisableControls;
    for i := 0 to DBGrid.Columns.Count - 1 do
    begin
      ColWidth := DBGrid.Canvas.TextWidth(DBGrid.Columns[i].Field.DisplayLabel);
      DBGrid.DataSource.DataSet.First;
      while not DBGrid.DataSource.DataSet.EOF do
      begin
        ColTextWidth := DBGrid.Canvas.TextWidth
          (DBGrid.Columns[i].Field.DisplayText);
        if (ColTextWidth > ColWidth) then
        begin
          ColWidth := ColTextWidth;
        end;
        DBGrid.DataSource.DataSet.Next;
      end;
      DBGrid.Columns[i].Width := ColWidth + 30;
    end;
    DBGrid.DataSource.DataSet.EnableControls;
    DBGrid.DataSource.DataSet.First;
  end;
end;

end.
