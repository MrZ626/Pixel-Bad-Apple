--Bad Apple!! (128x96, 10fps, 2192f, compressed with zlib)
--Video file by Leo
local video=love.data.decompress("string","zlib",love.filesystem.read("badapple.dat"))

local X,Y,K
function love.resize(w,h)
	local W,H=w,h
	if H/W>=96/128 then
		K=W/128
		X,Y=0,(H-W*96/128)*.5
	else
		K=H/96
		X,Y=(W-H*128/96)*.5,0
	end
end

function love.run()
	local gc=love.graphics
	local rectangle=gc.rectangle
	local int=math.floor
	local bAnd,bRshift=bit.band,bit.rshift

	local f=0

	love.resize(gc.getWidth(),gc.getHeight())

	return function()
		--EVENT
		love.event.pump()
		for N,w,h in love.event.poll()do
			if N=="quit"then
				return true
			elseif N=="resize"then
				love.resize(w,h)
			end
		end

		--UPDATE
		f=f+1 if f==13146 then f=0 end

		if love.window.isMinimized()then return end
		--DRAW
		gc.origin()gc.translate(X,Y)gc.scale(K)gc.clear()
		local t1=1536*int(f/6)+1
		for i=0,1535 do
			local B=video:byte(t1+i)
			for j=7,0,-1 do
				local p=8*i+j
				if bAnd(B,1)==0 then
					rectangle("fill",p%128,int(p/128),1,1)
				end
				B=bRshift(B,1)
			end
		end
		gc.present()gc.discard()
	end
end