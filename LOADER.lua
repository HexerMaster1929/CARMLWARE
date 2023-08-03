-- mega cool loader 😎

local UI = game:GetObjects("rbxassetid://13823330402")[1]
local TS = game:GetService("TweenService")

local KeySys = UI.MainWindow.MUI.PAGES.KEYSYSTEM
local MainLoader = UI.MainWindow.MUI.PAGES.LOADERMAIN

local LOADER = _G.CARMLWARE_LOADER["LOADER_VERSION"] or "STABLE"
local LISTURL = "https://raw.githubusercontent.com/HexerMaster1929/CARMLWARE/main/GAMES/SUPPORTEDLIST.lua"

local LOADURL = "https://raw.githubusercontent.com/HexerMaster1929/CARMLWARE/main/GAMES/%s/%s.lua"

local Exploit;
if identifyexecutor then
	Exploit,Ver = identifyexecutor()
	if Ver then
		Exploit = Exploit..' '..tostring(Ver)
	end
else
	Exploit = secure_load and "Sentinel" or pebc_execute and "ProtoSmasher" or is_sirhurt_closure and "Sirhurt" or (syn and not is_sirhurt_closure and not isexecutorclosure) and "Synapse X" or KRNL_LOADED and "Krnl"
end

KeySys.EXECUTOR.Text = Exploit
MainLoader.EXECUTOR.Text = Exploit



function IsGameSupported()
	local LIST;
	pcall(function()
		LIST = loadstring(game:httpget(("https://raw.githubusercontent.com/HexerMaster1929/CARMLWARE/main/GAMES/SUPPORTEDLIST.lua"),true))()
		end)
	warn(LIST)
	if LIST ~= nil then
		if  LIST[game.PlaceId] then
			return true,LIST[game.PlaceId]
		else
			return false
		end
	end
end

function FinishLoading()
	local MUI = UI.MainWindow.MUI
	TS:Create(MainLoader.TITLE,TweenInfo.new(0.28,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),{
		TextTransparency = 0,
		TextStrokeTransparency = 0.9,
	}):Play()
	TS:Create(MainLoader.EXECUTOR,TweenInfo.new(0.28,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),{
		TextTransparency = 0,
		TextStrokeTransparency = 0.9,
	}):Play()
	TS:Create(MainLoader.LSTAT,TweenInfo.new(0.28,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),{
		TextTransparency = 0,
		TextStrokeTransparency = 0.9,
	}):Play()
	TS:Create(MainLoader.ICON,TweenInfo.new(0.28,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),{
		ImageTransparency = 0,
	}):Play()
	

	
	FadeSet(MainLoader.LSTAT,"INJECTING CARMLWARE")	
	task.wait(0.45)
	FadeSet(MainLoader.LSTAT,"FIRING LOADERS")	
	task.wait(0.40)
	FadeSet(MainLoader.LSTAT,"CHECKING IF GAME SUPPORTED")	
	task.wait(0.30)
	local ISSUPPORT,SNAME = IsGameSupported()
	if ISSUPPORT then
		
		FadeSet(MainLoader.LSTAT,"GAME SUPPORTED, ENJOY!")	
		task.wait(1.5)
		
		TS:Create(MUI.ImageLabel,TweenInfo.new(0.56,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),{
			ImageTransparency = 1,
		}):Play()
		TS:Create(MUI.UIStroke,TweenInfo.new(0.56,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),{
			Transparency = 1,
		}):Play()
		TS:Create(MUI.Border.UIStroke,TweenInfo.new(0.56,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),{
			Transparency = 1,
		}):Play()

		TS:Create(MainLoader.TITLE,TweenInfo.new(0.28,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),{
			TextTransparency = 1,
			TextStrokeTransparency = 1,
		}):Play()
		TS:Create(MainLoader.EXECUTOR,TweenInfo.new(0.28,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),{
			TextTransparency = 1,
			TextStrokeTransparency = 1,
		}):Play()
		TS:Create(MainLoader.LSTAT,TweenInfo.new(0.28,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),{
			TextTransparency = 1,
			TextStrokeTransparency = 1,
		}):Play()
		TS:Create(MainLoader.ICON,TweenInfo.new(0.28,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),{
			ImageTransparency = 1,
		}):Play()
		
		loadstring(game:httpget((tostring(string.format(LOADURL,SNAME,LOADER))),true))()
		
	else
		FadeSet(MainLoader.LSTAT,"NOT SUPPORTED, CLOSING!")	
		task.wait(2)
		UI:Destroy()
	end
end

local KEYCHECKURL = "https://redirect-api.work.ink/tokenValid/"

function CheckKey(KEY)
	local request = (syn and syn.request) or (http and http.request) or request

	local response = request({
		Url = KEYCHECKURL..tostring(KEY),
		Method = "GET"
	})

	if not request then
		game.Players.LocalPlayer:Kick("EXECUTOR ERROR: Executor Does Not Have A HTTP Request Function!")
	end

	local data = game:GetService("HttpService"):JSONDecode(response.Body)
	if data ~= nil then
		return data["valid"]
	
	end
end

KeySys.Buttons.GETKEY.MouseButton1Down:Connect(function()
	KeySys.Buttons.GETKEY.TextLabel.Text = "COPIED"
	setclipboard("https://workink.net/2jM/CARMLWAREKEY")
	wait(5.6)
	KeySys.Buttons.GETKEY.TextLabel.Text = "GET KEY"
end)

local KeyCon = nil

function RequestKey(PreStat)
	if KeyCon ~= nil then
		KeyCon:Disconnect()
	end
    TS:Create(UI.MainWindow,TweenInfo.new(0.75,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),{
		Size = UDim2.new(0, 367,0, 172)
	}):Play()
	KeySys.KSTAT.Text = PreStat or "Please Enter Key!"
	
	--STWEEN1.Completed:Connect(function()
		KeySys.Visible = true
		TS:Create(KeySys.KSTAT,TweenInfo.new(0.28,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),{
			TextTransparency = 0,
			TextStrokeTransparency = 0.9,
		}):Play()
		TS:Create(KeySys.EXECUTOR,TweenInfo.new(0.28,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),{
			TextTransparency = 0,
			TextStrokeTransparency = 0.9,
		}):Play()
		TS:Create(KeySys.TITLE,TweenInfo.new(0.28,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),{
			TextTransparency = 0,
			TextStrokeTransparency = 0.9,
		}):Play()
		TS:Create(KeySys.KeyBox.INPUT,TweenInfo.new(0.28,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),{
			TextTransparency = 0,
			TextStrokeTransparency = 0.9,
		}):Play()
		
		TS:Create(KeySys.ICON,TweenInfo.new(0.28,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),{
			ImageTransparency = 0,
		}):Play()
		
		TS:Create(KeySys.KeyBox.Border.UIStroke,TweenInfo.new(0.28,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),{
			Transparency = 0,
		}):Play()
		TS:Create(KeySys.KeyBox.UIStroke,TweenInfo.new(0.28,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),{
			Transparency = 0,
		}):Play()
		
		for i,v in pairs(KeySys.Buttons:GetChildren()) do
			

			TS:Create(v,TweenInfo.new(0.28,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),{
				BackgroundTransparency = 0,
			}):Play()

		
			TS:Create(v.TextLabel,TweenInfo.new(0.28,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),{
				TextTransparency = 0,
				TextStrokeTransparency = 0.9,
			}):Play()

			TS:Create(v.Border.UIStroke,TweenInfo.new(0.28,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),{
				Transparency = 0.4,
			}):Play()
			TS:Create(v.UIStroke,TweenInfo.new(0.28,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),{
				Transparency = 0.4,
			}):Play()

		end
		
		KeyCon = KeySys.Buttons.SUBMIT.MouseButton1Down:Connect(function()
			if CheckKey(KeySys.KeyBox.INPUT.Text) == true then
				TS:Create(KeySys.KSTAT,TweenInfo.new(0.28,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),{
					TextTransparency = 1,
					TextStrokeTransparency = 1,
				}):Play()
				TS:Create(KeySys.EXECUTOR,TweenInfo.new(0.28,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),{
					TextTransparency = 1,
					TextStrokeTransparency = 1,
				}):Play()
				TS:Create(KeySys.TITLE,TweenInfo.new(0.28,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),{
					TextTransparency = 1,
					TextStrokeTransparency = 1,
				}):Play()
				TS:Create(KeySys.KeyBox.INPUT,TweenInfo.new(0.28,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),{
					TextTransparency = 1,
					TextStrokeTransparency = 1,
				}):Play()

				TS:Create(KeySys.ICON,TweenInfo.new(0.28,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),{
					ImageTransparency = 1,
				}):Play()

				TS:Create(KeySys.KeyBox.Border.UIStroke,TweenInfo.new(0.28,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),{
					Transparency = 1,
				}):Play()
				TS:Create(KeySys.KeyBox.UIStroke,TweenInfo.new(0.28,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),{
					Transparency = 1,
				}):Play()

				for i,v in pairs(KeySys.Buttons:GetChildren()) do


					TS:Create(v,TweenInfo.new(0.28,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),{
						BackgroundTransparency = 1,
					}):Play()


					TS:Create(v.TextLabel,TweenInfo.new(0.28,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),{
						TextTransparency = 1,
						TextStrokeTransparency = 1,
					}):Play()

					TS:Create(v.Border.UIStroke,TweenInfo.new(0.28,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),{
						Transparency = 1,
					}):Play()
					TS:Create(v.UIStroke,TweenInfo.new(0.28,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),{
						Transparency = 1,
					}):Play()

				end
			
			TS:Create(UI.MainWindow,TweenInfo.new(0.75,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),{
				Size = UDim2.new(0, 137,0, 136)
			}):Play()
			
			wait(0.75)
			
			local date = os.date("*t", os.time())
			
			local DECDATA = {
				["DATE"] = {Year = date.year, Month = date.month, Day = date.day, Hour = date.hour, Minute = date.min, Second = date.sec},
				["KEY"] = KeySys.KeyBox.INPUT.Text
			} --game:GetService("HttpService"):JSONDecode(readfile("CARMLWARE/KEYSYSTEM/KEYDATA.carml"))

			writefile("CARMLWARE/KEYSYSTEM/KEYDATA.carml",game:GetService("HttpService"):JSONEncode(DECDATA))
			
			KeySys.Visible = false
			FinishLoading()
				
			else
				KeySys.KSTAT.Text = "INVALID KEY!"
				KeySys.KSTAT.TextColor3 = Color3.fromRGB(170, 0, 0)
			end
		--end)
		
	end)
end

local CoreGui = game:GetService("CoreGui")
if gethui then
	UI.Parent = gethui()
elseif syn.protect_gui then 
	syn.protect_gui(UI)
	UI.Parent = CoreGui
elseif CoreGui:FindFirstChild("RobloxGui") then
	UI.Parent = CoreGui:FindFirstChild("RobloxGui")
else
	UI.Parent = CoreGui
end

-- main cycle

function FadeSet(L,T)
	TS:Create(L,TweenInfo.new(0.25,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),{
		TextTransparency = 1,
		TextStrokeTransparency = 1,
	}):Play()
	task.wait(.25)
	L.Text = T
	TS:Create(L,TweenInfo.new(0.25,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),{
		TextTransparency = 0,
		TextStrokeTransparency = 0.9,
	}):Play()
end

do
	local MUI = UI.MainWindow.MUI
	TS:Create(MUI.ImageLabel,TweenInfo.new(0.56,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),{
		ImageTransparency = 0,
	}):Play()
	TS:Create(MUI.UIStroke,TweenInfo.new(0.56,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),{
		Transparency = 0.4,
	}):Play()
	TS:Create(MUI.Border.UIStroke,TweenInfo.new(0.56,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),{
		Transparency = 0.4,
	}):Play()
	
	TS:Create(MainLoader.TITLE,TweenInfo.new(0.28,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),{
		TextTransparency = 0,
		TextStrokeTransparency = 0.9,
	}):Play()
	TS:Create(MainLoader.EXECUTOR,TweenInfo.new(0.28,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),{
		TextTransparency = 0,
		TextStrokeTransparency = 0.9,
	}):Play()
	TS:Create(MainLoader.LSTAT,TweenInfo.new(0.28,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),{
		TextTransparency = 0,
		TextStrokeTransparency = 0.9,
	}):Play()
	TS:Create(MainLoader.ICON,TweenInfo.new(0.28,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),{
		ImageTransparency = 0,
		}):Play()
	
	
	MainLoader.Visible = true
	
	
	FadeSet(MainLoader.LSTAT,"LOADING MODULES")	
	task.wait(0.45)
	FadeSet(MainLoader.LSTAT,"LOADING INTERFACE")	
	task.wait(0.40)
	FadeSet(MainLoader.LSTAT,"LOADING SAVED FILES")	
	task.wait(0.30)
	FadeSet(MainLoader.LSTAT,"LOADING MODULES")	
	task.wait(0.60)
	
	if isfolder("CARMLWARE") then
		if isfolder("CARMLWARE/KEYSYSTEM") then
			if isfile("CARMLWARE/KEYSYSTEM/KEYDATA.carml") then
				local DECDATA = game:GetService("HttpService"):JSONDecode(readfile("CARMLWARE/KEYSYSTEM/KEYDATA.carml"))
				
				local expire = DECDATA["DATE"]
				local date = os.date("*t", os.time())
				
				if expire == nil then
						RequestKey()
						return
				end
				
				if expire.Year > date.year then
					RequestKey()
					return
				end
				
				
				
				if date.year >= expire.Year and date.month >= expire.Month and date.day >= expire.Day+1 --[[make key last 24 hours]] and date.hour >= expire.Hour and date.min >= expire.Minute and date.sec >= expire.Second then
					TS:Create(MainLoader.TITLE,TweenInfo.new(0.28,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),{
						TextTransparency = 1,
						TextStrokeTransparency = 1,
					}):Play()
					TS:Create(MainLoader.EXECUTOR,TweenInfo.new(0.28,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),{
						TextTransparency = 1,
						TextStrokeTransparency = 1,
					}):Play()
					TS:Create(MainLoader.LSTAT,TweenInfo.new(0.28,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),{
						TextTransparency = 1,
						TextStrokeTransparency = 1,
					}):Play()
					TS:Create(MainLoader.ICON,TweenInfo.new(0.28,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),{
						ImageTransparency = 1,
					}):Play()
					RequestKey("Saved Key Has Expired, Please Get A New Key!")
					writefile("CARMLWARE/KEYSYSTEM/KEYDATA.carml",{ -- anti glitch
						["DATE"] = nil,
						["KEY"] = nil,
					})
				else
					FadeSet(MainLoader.LSTAT,"SAVED KEY IS VALID!")	
					FinishLoading()
				end
			else
				TS:Create(MainLoader.TITLE,TweenInfo.new(0.28,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),{
					TextTransparency = 1,
					TextStrokeTransparency = 1,
				}):Play()
				TS:Create(MainLoader.EXECUTOR,TweenInfo.new(0.28,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),{
					TextTransparency = 1,
					TextStrokeTransparency = 1,
				}):Play()
				TS:Create(MainLoader.LSTAT,TweenInfo.new(0.28,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),{
					TextTransparency = 1,
					TextStrokeTransparency = 1,
				}):Play()
				TS:Create(MainLoader.ICON,TweenInfo.new(0.28,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),{
					ImageTransparency = 1,
				}):Play()
				RequestKey(nil)
			end
		else
			TS:Create(MainLoader.TITLE,TweenInfo.new(0.28,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),{
				TextTransparency = 1,
				TextStrokeTransparency = 1,
			}):Play()
			TS:Create(MainLoader.EXECUTOR,TweenInfo.new(0.28,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),{
				TextTransparency = 1,
				TextStrokeTransparency = 1,
			}):Play()
			TS:Create(MainLoader.LSTAT,TweenInfo.new(0.28,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),{
				TextTransparency = 1,
				TextStrokeTransparency = 1,
			}):Play()
			TS:Create(MainLoader.ICON,TweenInfo.new(0.28,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),{
				ImageTransparency = 1,
			}):Play()
			RequestKey(nil)
		end
	else
		TS:Create(MainLoader.TITLE,TweenInfo.new(0.28,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),{
			TextTransparency = 1,
			TextStrokeTransparency = 1,
		}):Play()
		TS:Create(MainLoader.EXECUTOR,TweenInfo.new(0.28,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),{
			TextTransparency = 1,
			TextStrokeTransparency = 1,
		}):Play()
		TS:Create(MainLoader.LSTAT,TweenInfo.new(0.28,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),{
			TextTransparency = 1,
			TextStrokeTransparency = 1,
		}):Play()
		TS:Create(MainLoader.ICON,TweenInfo.new(0.28,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),{
			ImageTransparency = 1,
		}):Play()
		RequestKey(nil)
	end
	
	
end
