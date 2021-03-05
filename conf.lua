function love.conf(t)
	t.version="11.1"
	t.gammacorrect=false
	t.accelerometerjoystick=false

	local W=t.window
	W.title="Bad Apple!!"
	W.borderless=false
	W.resizable=true
	W.msaa=false
	W.depth=0
	W.stencil=1
	W.highdpi=true

	local M=t.modules
	M.thread,M.math,M.audio,M.sound,M.font,M.image=false,false,false,false,false,false
	M.mouse,M.touch,M.keyboard,M.joystick,M.physics=false,false,false,false,false
end