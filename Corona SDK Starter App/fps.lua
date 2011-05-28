module(..., package.seeall)
PerformanceOutput = {};
PerformanceOutput.mt = {};
PerformanceOutput.mt.__index = PerformanceOutput;


local prevTime = 0;
local maxSavedFps = 30;

local function createLayout(self)
        local group = display.newGroup();

        self.memory = display.newText("0/10",20,0, Helvetica, 15);
        self.framerate = display.newText("0", 30, self.memory.height, "Helvetica", 20);
        local background = display.newRect(-50,0, 175, 50);

        self.memory:setTextColor(255,255,255);
        self.framerate:setTextColor(255,255,255);
        background:setFillColor(0,0,0);

        group:insert(background);
        group:insert(self.memory);
        group:insert(self.framerate);


        return group;
end

local function minElement(table)
        local min = 10000;
        for i = 1, #table do
                if(table[i] < min) then min = table[i]; end
        end
        return min;
end


local function getLabelUpdater(self)
        local lastFps = {};
        local lastFpsCounter = 1;
        return function(event)
                local curTime = system.getTimer();
                local dt = curTime - prevTime;
                prevTime = curTime;

                local fps = math.floor(1000/dt);

                lastFps[lastFpsCounter] = fps;
                lastFpsCounter = lastFpsCounter + 1;
                if(lastFpsCounter > maxSavedFps) then lastFpsCounter = 1; end
                local minLastFps = minElement(lastFps);

                self.framerate.text = "FPS: "..fps.."(min: "..minLastFps..")";

                self.memory.text = "Mem: "..(system.getInfo("textureMemoryUsed")/1000000).." mb";
        end
end


local instance = nil;
-- Singleton
function PerformanceOutput.new()
        if(instance ~= nil) then return instance; end
        local self = {};
        setmetatable(self, PerformanceOutput.mt);

        self.group = createLayout(self);

        Runtime:addEventListener("enterFrame", getLabelUpdater(self));

        instance = self;
        return self;
end
