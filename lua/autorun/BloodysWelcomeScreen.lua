include( "bws_config.lua" )

if ( SERVER ) then

	print( "[Bloody's Welcome Screen] Bloody's Welcome Screen Has Started" )

	util.AddNetworkString( "BWS_SENDMENU" )

	hook.Add( "PlayerInitialSpawn", "TheSpawnHook",function  ( ply )

			net.Start( "BWS_SENDMENU" )
			net.Send( ply )

	end)

	function Welcomscreencommand ( ply, text, public )

		if (string.sub(text, 1, 7) == "!forums") then
        
         net.Start( "BWS_SENDMENU" )
         net.Send( ply )
         return(false)

     elseif (string.sub(text, 1, 6) == "!rules") then

     	 net.Start( "BWS_SENDMENU" )
         net.Send( ply )
         return(false)

    	end
    end

	hook.Add("PlayerSay","Welcomecommand",Welcomscreencommand)

end

if ( CLIENT ) then

	function BWS_OPENMENU ()

		local BWS_MENU = vgui.Create( "DFrame" )
		BWS_MENU:SetSize( 1000, 600 )
		BWS_MENU:SetTitle( BloodysWelcomeScreen.WindowTitle )
		BWS_MENU:SetSizable( false )
		BWS_MENU:SetDraggable( false )
		BWS_MENU:SetVisible( true )
		BWS_MENU:MakePopup()
		BWS_MENU:Center()

		local BWS_SITE = vgui.Create( "HTML", BWS_MENU)
		BWS_SITE:SetPos( 0, 25 )
		BWS_SITE:SetSize(1000, 575)
		BWS_SITE:OpenURL( BloodysWelcomeScreen.WebSite )

	end

		net.Receive( "BWS_SENDMENU", BWS_OPENMENU)

end