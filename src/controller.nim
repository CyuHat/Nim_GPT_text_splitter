import model
import view
import system
import text_splitter

# Type (class)
type Controller = ref object
  model: Model
  view: View
  running: bool

# related functions (Methods)
proc newController*(): Controller =
  Controller(model: model.newModel(), view: view.newView(), running: true)

proc evalCommand(controller: Controller, cmd: string) =
  var state = controller.model.parse(cmd)
  var response = controller.view.render(state)
  echo response

proc startShell*(controller: Controller) =
  echo controller.view.renderWelcomeMessage()
  while controller.running:
    write(stdout, ">>> ")
    var cmd: string = readLine(stdin)
    if cmd == "exit":
      quit(QuitSuccess)
    else:
      controller.evalCommand(cmd)


if isMainModule:
  let controller = newController()
  controller.startShell()
