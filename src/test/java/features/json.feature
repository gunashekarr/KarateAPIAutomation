Feature: Json Validation
 
  Scenario: Simple Json Parser
  * def jsonObject =
  """
  [
  {
  "name" : "Guna",
  "channel" : "QA Factory"
  },
  {
  "name" : "Shekar",
  "channel" : "QA Factory 11"
  }
  ]
  """
  * print jsonObject
  * print jsonObject[1]
  * print jsonObject[0].channel
  
  Scenario: Complex Json Parser
  * def jsonObject =
  """
  {"menu": {
  "id": "file",
  "value": "File",
  "popup": {
    "menuitem": [
      {"value": "New", "onclick": "CreateNewDoc()"},
      {"value": "Open", "onclick": "OpenDoc()"},
      {"value": "Close", "onclick": "CloseDoc()"}
    ]
  }
}}
  """
  * print jsonObject
  * print jsonObject.menu
  * print jsonObject.menu.value
  * print jsonObject.menu.popup
  * print jsonObject.menu.popup.menuitem
  * print jsonObject.menu.popup.menuitem[0]
  * print jsonObject.menu.popup.menuitem[0].value
  * print jsonObject.menu.popup.menuitem[0].onclick
  * print jsonObject.menu.popup.menuitem[1]
  * print jsonObject.menu.popup.menuitem[1].value
  * print jsonObject.menu.popup.menuitem[1].onclick