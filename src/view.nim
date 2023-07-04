import model

type View* = object
  exists: bool

proc newView*(): View = View(exists: true)

proc render*(v: View, m: Model): string = $(m.chunks)

proc renderWelcomeMessage*(v: View): string = """
       _           _    _____ _____ _______             _ _ _   _            
      | |         | |  / ____|  __ \__   __|           | (_) | | |           
   ___| |__   __ _| |_| |  __| |__) | | |     ___ _ __ | |_| |_| |_ ___ _ __ 
  / __| '_ \ / _` | __| | |_ |  ___/  | |    / __| '_ \| | | __| __/ _ \ '__|
 | (__| | | | (_| | |_| |__| | |      | |    \__ \ |_) | | | |_| ||  __/ |   
  \___|_| |_|\__,_|\__|\_____|_|      |_|    |___/ .__/|_|_|\__|\__\___|_|   
                                                 |_|                         
==============================================================================
Welcome to chatGPT slitter.
To begin, start selecting a file you want to split (split [file_name]):
"""
