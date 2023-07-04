type Model* = ref object
  chunks*: seq[string]

proc newModel*(): Model = Model(chunks: @[])

proc parse*(m: Model, cmd: string): Model =
  m.chunks.add(cmd)
  return m
