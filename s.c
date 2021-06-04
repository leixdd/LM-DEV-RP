

# Only change the IP if you're using a server with multiple network interfaces, otherwise change the port only.
endpoint_add_tcp "0.0.0.0:30120"
endpoint_add_udp "0.0.0.0:30120"

setr ea_LanguageName "en"                # set our language to english
setr ea_MenuButton "315"		 # set our menu button to NUMPAD -. default: "315"
setr ea_alwaysShowButtons "false"	# we don't want to see buttons we can't even access, do we? default: "false"
set ea_moderationNotification "false"   # this can be either "false" or a discord webhook address, this will send a discord message if an admin takes actions against a player  ( such as banning and kicking )
set ea_custombanlist "false"            # read docs for this, dont touch it
set ea_enableCallAdminCommand "true"
set ea_enableReportCommand "true"

# These resources will start by default.

set es_enableCustomData 1
set mysql_connection_string "mysql://root:S4S4geyo@127.0.0.1/fx_server?charset=utf8mb4"

#essentialmode
add_ace resource.essentialmode command.sets allow
add_ace resource.essentialmode command.add_principal allow
add_ace resource.essentialmode command.add_ace allow

stop webadmin

ensure mapmanager
ensure chat
ensure spawnmanager
ensure sessionmanager
ensure fivem
ensure hardcap
ensure rconlog
ensure scoreboard
ensure baseevents
ensure yarn
ensure mysql-async
ensure cron
ensure es_extended
#ensure chat

start pNotify
start mysql-async
start essentialmode
start esplugin_mysql
start es_admin2
start esx_addons_gcphone
start gcphone
start skinchanger
start esx_skin
start esx_society
start esx_menu_dialog
start esx_menu_default
start esx_menu_list
start esx_vehicleshop
start esx_billing
start esx_inventoryhud
start esx_addoninventory
start esx_datastore
start esx_license
start esx_service
start esx_identity
start esx_addonaccount
start esx_voice
start esx_basicneeds
start esx_status
#start esx_plasticsurgery
start esx_policejob
#start esx_atm
#start esx_phone
start new_banking
start mythic_notify
#start esx_whitelist
start instance
#start esx_garage
start esx_vehiclelock
start esx_lscustom
start dpemotes
start CarryPeople
#start IDsAboveHead
start PiggyBack
start TakeHostage
start esx_weaponshop
start esx_shops
start esx_extraitems
start esx_clotheshop
start esx_accessories
start esx_property
start esx_advancedgarage
start esx_accessories
start recoil
#start mark-b_police-tracker
start esx_doorlock
start esx_advancedholdup
start SLBK11_MissionRow
start esx_advancedhospital
start esx_joblisting
start esx_dmvschool
start esx_drugs
#start esx_drugfarms
start esx_licenseshop
start esx_barbershop
start esx_jobs
start esx_boat
start esx_aircraftshop
start esx_sit
start 99kr-burglary
start pillboxext
start policedepartmentbymolha
start esx_hifi
start eden_animal
start esx_advancedjail
start esx_duty
start esx_outlawalert
start esx_blackmoney
start Stadus_Scoreboard
start jsfour-idcard
start LegacyFuel
start HideInTrunk
start pointFinger
start toggleid
start crouch-n-prone
start esx_yacht
start esx_ambulancejob
start esx_gps
#start chat
start chat-theme-civlifechat
start esx_rpchat
start esx_gangjob
start lmdev_police_logs
start dpclothing
start mb_addons
start Lake
start christmasLegion
start christmasCity
start XNLRideAnimals
start heliCam
start malibuMansion
start beachhouse
start beachhouse2016
start yachtHeist
start mcdoLegion
start underwater_headquarters
start secret_agent_headquarters
start franklin_mansion_house
start luxury_mansion
start the_mansion
start myblip
start tambayanBeach
#start esx_optionalneeds
#disc
#start disc-base
#start disc-hud

#ADDON CARS
#start lamboaventador
start policeasd
start supervolito
#UTILITIES
start NativeUI
start EasyAdmin
#start vMenu
exec permissions.cfg
start vMenu

start trew_hud_ui
# REQUIRED
add_principal group.admin group.user
add_ace resource.es_extended command.add_ace allow
add_ace resource.es_extended command.add_principal allow
add_ace resource.es_extended command.remove_principal allow
add_ace resource.es_extended command.stop allow

#start esplugin_mysql
#start es_admin2

# This allows players to use scripthook-based plugins such as the legacy Lambda Menu.
# Set this to 1 to allow scripthook. Do note that this does _not_ guarantee players won't be able to use external plugins.
sv_scriptHookAllowed 0

# Uncomment this and set a password to enable RCON. Make sure to change the password - it should look like rcon_password "YOURPASSWORD"
#rcon_password ""

# A comma-separated list of tags for your server.
# For example:
# - sets tags "drifting, cars, racing"
# Or:
# - sets tags "roleplay, military, tanks"
sets tags "default"

# A valid locale identifier for your server's primary language.
# For example "en-US", "fr-CA", "nl-NL", "de-DE", "en-GB", "pt-BR"
sets locale "root-AQ" 
# please DO replace root-AQ on the line ABOVE with a real language! :)

# Set an optional server info and connecting banner image url.
# Size doesn't matter, any banner sized image will be fine.
#sets banner_detail "https://url.to/image.png"
#sets banner_connecting "https://url.to/image.png"

# Set your server's hostname
sv_hostname "ImperialCity"

# Nested configs!
#exec server_internal.cfg

# Loading a server icon (96x96 PNG file)
#load_server_icon myLogo.png

# convars which can be used in scripts
set temp_convar "hey world!"

# Uncomment this line if you do not want your server to be listed in the server browser.
# Do not edit it if you *do* want your server listed.
#sv_master1 ""

# Add system admins
add_ace group.admin command allow # allow all commands
add_ace group.admin command.quit deny # but don't allow quit
add_ace group.admin easyadmin allow
#add_principal identifier.license:07e8828eb0dd422dcd3a7993d23c91f97c29848f group.admin # add the admin to the group
add_principal identifier.steam:76561199061287568 group.admin
add_principal identifier.steam:0000111e755e5 group.admin


# Hide player endpoints in external log output. ginawa kong steam kasi di ako makakapasok kung rockstart license okieeee jn k mna pasok na ako
sv_endpointprivacy true

# enable OneSync with default configuration (required for server-side state awareness)
onesync_enabled true

# Server player slot limit (must be between 1 and 32, unless using OneSync)
sv_maxclients 32

# Steam Web API key, if you want to use Steam authentication (https://steamcommunity.com/dev/apikey)
# -> replace "" with the key
set steam_webApiKey "DCC1D867FEB56B4593D9F2018CBE2219"

# License key for your server (https://keymaster.fivem.net)
#sv_licenseKey "nlb488na53xgurzpyi25407da4pd9sxc"
sv_licenseKey "54ccsk5h7y2bfneixptm3fyq2yokdou0"

sv_authMaxVariance 0
sv_authMinTrust 0
