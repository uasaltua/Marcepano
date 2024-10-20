local codes = {}
local myEvents = {}

local event = require("event")

function myEvents.on(eventName, callback)
    if not myEvents[eventName] then
        myEvents[eventName] = {}
    end
    table.insert(myEvents[eventName], callback)
end

-- Функция для вызова события
function myEvents.call(eventName, ...)
    if myEvents[eventName] then
        for _, callback in ipairs(myEvents[eventName]) do
            callback(...)
        end
    end
end

while true do
    local _, _, x, y, _, code = event.pull()
    print(code)
    os.sleep(1)
end