SELECT
  [emp].[entity_id],
  [emp].[id],
  [emp].[deparment],
  [emp].[worksite],
  [emp].[hr_status],
  [emp].[apprv_cd01]
FROM [dbo].[hr_empmstr] AS [emp]
  INNER JOIN [hr_entytble] AS [ent] ON [emp].[entity_id] = [ent].[entity_id]
