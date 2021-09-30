return function(use)
	local custom_section = {
		a = {
			description = { '  Find File            ' },
			command = 'Telescope find_files',
		},
		b = {
			description = { '  Recently Opened Files' },
			command = 'Telescope oldfiles',
		},
		c = {
			description = { '  Recent Projects      ' },
			command = 'Telescope projects',
		},
		d = {
			description = { '  Load Session         ' },
			command = "lua require('session-lens').search_session()",
		},
		e = {
			description = { '  Find Word            ' },
			command = 'Telescope live_grep',
		},
	}

	local header = [[
            x        x            
           xM        Mx           
          d0 .      . Ox          
         oM'  .'      .Md         
        oMX   .x       XMd        
       oMM,   .MOkd    ,MMo       
      lMMW   'WMMMKOx   NMMo      
     lMMM:   X.     Xk  ;MMMl     
    cMMMM          .Wc   WMMMl    
   :WMMMMXx    ,k0K    dXMMMMMc   
  :WMMMx     .KM;         xMMMW:  
 :WMMMM.     cMMx          MMMMW: 
;WMMMMk   .k.;KMMXd ,.k.   xMMMMW:
;MMMMMWx  xWWWNMMMMXWWWx  dNMMMMM:
 cMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMl 
  lMMMMMMMMMMMMMMMMMMMMMMMMMMMMo  
   oMMMMMxMMMMMMMMMMMMMMxMMMMMo   
    dMMMM;  x  WMMMk x  ,MMMMx    
     xMMM       xMMO     MMMO     
      0MM        MM0     MM0      
       0MXx      NMx   xXMK       
        KMMW'    MW  .NMMX        
         XMM'  .KK   'MMN         
          WM' .Wx    'MW          
           M'  xk    'M           
            '  .M    '            
              kO                  
              Ml    .             
               W0kOc              
                MMx               
                 X                
]]

	local processed_header = {}

	for str in header:gmatch('[^\r\n]+') do
		table.insert(processed_header, str)
	end
	vim.g.dashboard_default_executive = 'telescope'
	vim.g.dashboard_custom_section = custom_section
	vim.g.dashboard_custom_header = processed_header

	local footer = [[
     _              _     ____           ___  _   
    | | _   _  ___ | |_  |  _ \   ___   |_ _|| |_ 
 _  | || | | |/ __|| __| | | | | / _ \   | | | __|
| |_| || |_| |\__ \| |_  | |_| || (_) |  | | | |_ 
 \___/  \__,_||___/ \__| |____/  \___/  |___| \__|
                                                  
]]
	local processed_footer = {}

	for str in footer:gmatch('[^\r\n]+') do
		table.insert(processed_footer, str)
	end
	vim.g.dashboard_custom_footer = processed_footer

	use({
		'glepnir/dashboard-nvim',
		disable = vim.g.vscode,
		event = 'VimEnter',
		cond = require('config.firenvim').not_run,
	})
end
