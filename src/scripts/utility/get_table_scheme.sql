SELECT
  CHAR(9) + '[' + [C].[Column_name] + '] ' + [C].[Data_type]
  + CASE
    WHEN [C].[Data_type] IN ('deCimal')
      THEN ISNULL('(' + CONVERT(VARCHAR, [C].[Numeric_precision]) + ', ' + CONVERT(VARCHAR, [C].[Numeric_scale]) + ')', '')
    WHEN [C].[Data_type] IN ('varChar', 'nvarChar', 'Char', 'nChar')
      THEN ISNULL(
        '('
        + CASE
          WHEN [C].[Character_maximum_length] = -1
            THEN 'max'
          ELSE CONVERT(VARCHAR, [C].[Character_maximum_length])
        END + ')', ''
      )
    ELSE ''
  END
  + CASE WHEN [C].[Is_nullable] = 'YES' THEN ' NULL' ELSE '' END
  + ','
FROM [TempDB].[Information_schema].[Columns] AS [C]
WHERE [C].[Table_name] LIKE '#myTempTable%'
ORDER BY [C].[Ordinal_position]
