local keys = {
    [13] = "Enter",
    [8] = "Backspace",
    [9] = "Tab",
    [32] = " ",
    [126] = "~",
    [96] = "`",
    [1105] = "ё",
    [1025] = "Ё",
    [48] = "0",
    [49] = "1",
    [50] = "2",
    [51] = "3",
    [52] = "4",
    [53] = "5",
    [54] = "6",
    [55] = "7",
    [56] = "8",
    [57] = "9",
    [45] = "-",
    [95] = "_",
    [61] = "=",
    [43] = "+",
    [92] = "\\",
    [124] = "|",
    [47] = "/",
    [33] = "!",
    [64] = "@",
    [35] = "#",
    [36] = "$",
    [37] = "%",
    [94] = "^",
    [113] = "q",
    [81] = "Q",
    [119] = "w",
    [87] = "W",
    [69] = "E",
    [101] = "e",
    [97] = "a",
    [65] = "A",
    [115] = "s",
    [83] = "S",
    [68] = "D",
    [100] = "d",
}
local myEvents = {}

local event = require("event")

function myEvents.on(eventName, callback)
    if not myEvents[eventName] then
        myEvents[eventName] = {}
    end
    table.insert(myEvents[eventName], callback)
end


function myEvents.del(eventName)
    if myEvents[eventName] then
        myEvents[eventName] = {}
    end
end


function myEvents.call(eventName, ...)
    if myEvents[eventName] then
        for _, callback in ipairs(myEvents[eventName]) do
            callback(...)
        end
    end
end

local function input_handler()
    while true do
        local a, _, code = event.pull()
        if a == "drop" or a == "key_up" or a == "key_down" or a == "touch" or a == "drag" or a == "touch" or a == "clipboard" then
            myEvents.call("mouse_input", a, code)
        end
        --Вызов события клавиатуры
        myEvents.call("Keyboard_input", keys[tonumber(code)] or code)
    end
end