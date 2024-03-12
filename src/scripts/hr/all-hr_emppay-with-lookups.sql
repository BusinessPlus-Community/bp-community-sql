SELECT
  Emppay.Id AS Empid,
  Emppay.Position,
  Emppay.Pcn,
  Emppay.Uniqueid
FROM Hr_Emppay AS Emppay
INNER JOIN Hr_Earndist AS Dist ON Emppay.Uniqueid = Dist.Uniqueid
