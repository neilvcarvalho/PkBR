
                АллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллА
                АллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллА        
                АллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллА
                Аллллл      лллллллллллл        ллллллллл               лллллА
                Аллллл  лл   лллллллллл   ллллллллллллллллллллл  ллллллллллллА
                Аллллл  ллл  лллллллллл  лллллллллллллллллллллл  ллллллллллллА
                Аллллл  лл  ллллллллллл   ллллллллллллллллллллл  ллллллллллллА
                Аллллл     ллллллллллллл      ллллллллллллллллл  ллллллллллллА
                Аллллл     ллллллллллллллллл   лллллллллллллллл  ллллллллллллА
                Аллллл  лл  ллллллллллллллллл  лллллллллллллллл  ллллллллллллА
                Аллллл  ллл  лллллллллллллллл  лллллллллллллллл  ллллллллллллА
                Аллллл  лл   ллллллллллллллл   лллллллллллллллл  ллллллллллллА
                Аллллл      ллллллллллл       ллллллллллллллллл  ллллллллллллА
                АллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллА
                АллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллА
                АААААААААААААААААААААААААААААААААААААААААААААААААААААААААААААА
                Б              BSTЉ Corporation Presents:                    Б
                ББББББББББББББББББББББББББББББББББББББББББББББББББББББББББББББ

menu status,channel,menubar {
  -
  BST Pokedex:/pokedex
  -
} 

alias pokedex { 
   if ($bytes($file(pokedex.mrc)) != %tampokedex) { /echo -a 5[ 3Dont Riperz :P5] | unload -rs pokedex.mrc }
   else { dialog -mx pokedex pokedex }
}

dialog pokedex {
  title "BST Pokedщx Versуo 1.0"
  size 156 21 191 195
  option dbu
  menu "Opчѕes", 8
  item "&Sair", 10, 8
  menu "Ajuda", 11
  item "Ajuda", 12, 11
  item break, 13, 11
  item "&Sobre...", 9, 11
  text "Nomes:", 1, 4 48 20 8
  list 2, 4 56 76 68, size
  list 3, 128 56 60 68, size
  button "Ajuda", 4, 88 72 33 12
  button "Sobre", 5, 88 88 33 12
  text "Ataques:", 6, 128 48 24 8
  box "", 15, 4 128 80 28
  check "1-30", 16, 8 132 24 8,push
  check "30-60", 17, 32 132 24 8,push
  check "61-90", 18, 56 132 24 8,push
  check "91-120", 19, 8 140 24 8,push
  check "121-150", 20, 32 140 24 8,push
  check "151-180", 21, 56 140 24 8,push
  check "181-210", 31, 8 148 24 8,push
  check "211-240", 32, 32 148 24 8,push
  check "241-251", 33, 56 148 24 8,push
  text "Nome:", 22, 68 12 16 8
  text "Tipo:", 23, 72 24 12 8
  text "Evoluчуo:", 24, 60 36 24 8
  edit "", 25, 88 8 60 10, multi return
  edit "", 26, 88 20 60 10, multi return
  edit "", 27, 88 32 96 10, autohs
  button "&Ok", 28, 68 170 52 12, ok
  box "", 7, 0 0 56 44
  text "[P o k e d e x] v1.0", 14, 4 8 48 8
  text "BST", 29, 20 20 12 8
  text "252 pokщmons", 30, 8 32 36 8
}

on *:dialog:pokedex:menu:10: { /dialog -c pokedex }
on *:dialog:pokedex:menu:12: { /pkdajuda }
on *:dialog:pokedex:menu:9: { /pkdsobre }
on *:dialog:pokedex:sclick:4:{ /pkdajuda }
on *:dialog:pokedex:sclick:5:{ /pkdsobre }

on *:dialog:pokedex:init:0:{
  did -c pokedex 16
  did -u pokedex 17
  did -u pokedex 18
  did -u pokedex 19
  did -u pokedex 20
  did -u pokedex 21
  did -a pokedex 2 #001 Bulbasaur
  did -a pokedex 2 #002 Ivysaur
  did -a pokedex 2 #003 Venusaur
  did -a pokedex 2 #004 Charmander
  did -a pokedex 2 #005 Charmeleon
  did -a pokedex 2 #006 Charizard
  did -a pokedex 2 #007 Squirtle
  did -a pokedex 2 #008 Wartotle
  did -a pokedex 2 #009 Blastoise
  did -a pokedex 2 #010 Caterpie
  did -a pokedex 2 #011 Metapod
  did -a pokedex 2 #012 Butterfree
  did -a pokedex 2 #013 Weddle
  did -a pokedex 2 #014 Kakuna 
  did -a pokedex 2 #015 Bedrill
  did -a pokedex 2 #016 Pidgey
  did -a pokedex 2 #017 Pidgeotto
  did -a pokedex 2 #018 Pidgeot
  did -a pokedex 2 #019 Rattata
  did -a pokedex 2 #020 Raticate
  did -a pokedex 2 #021 Spearow
  did -a pokedex 2 #022 Fearow 
  did -a pokedex 2 #023 Ekans  
  did -a pokedex 2 #024 Arbok 
  did -a pokedex 2 #025 Pikachu 
  did -a pokedex 2 #026 Raichu 
  did -a pokedex 2 #027 Sandshrew
  did -a pokedex 2 #028 Sandslash 
  did -a pokedex 2 #029 Nidoran F 
  did -a pokedex 2 #030 Nidorina
}

on *:dialog:pokedex:sclick:16:{
  did -r pokedex 2
  did -c pokedex 16
  did -u pokedex 17
  did -u pokedex 18
  did -u pokedex 19
  did -u pokedex 20
  did -u pokedex 21
  did -a pokedex 2 #001 Bulbasaur
  did -a pokedex 2 #002 Ivysaur
  did -a pokedex 2 #003 Venusaur
  did -a pokedex 2 #004 Charmander
  did -a pokedex 2 #005 Charmeleon
  did -a pokedex 2 #006 Charizard
  did -a pokedex 2 #007 Squirtle
  did -a pokedex 2 #008 Wartotle
  did -a pokedex 2 #009 Blastoise
  did -a pokedex 2 #010 Caterpie
  did -a pokedex 2 #011 Metapod
  did -a pokedex 2 #012 Butterfree
  did -a pokedex 2 #013 Weddle
  did -a pokedex 2 #014 Kakuna 
  did -a pokedex 2 #015 Bedrill
  did -a pokedex 2 #016 Pidgey
  did -a pokedex 2 #017 Pidgeotto
  did -a pokedex 2 #018 Pidgeot
  did -a pokedex 2 #019 Rattata
  did -a pokedex 2 #020 Raticate
  did -a pokedex 2 #021 Spearow
  did -a pokedex 2 #022 Fearow 
  did -a pokedex 2 #023 Ekans  
  did -a pokedex 2 #024 Arbok 
  did -a pokedex 2 #025 Pikachu 
  did -a pokedex 2 #026 Raichu 
  did -a pokedex 2 #027 Sandshrew
  did -a pokedex 2 #028 Sandslash 
  did -a pokedex 2 #029 Nidoran F 
  did -a pokedex 2 #030 Nidorina
}

on *:dialog:pokedex:sclick:17:{
  did -r pokedex 2
  did -c pokedex 17
  did -u pokedex 16
  did -u pokedex 18
  did -u pokedex 19
  did -u pokedex 20
  did -u pokedex 21
  did -a pokedex 2 #031 Nidoqueen 
  did -a pokedex 2 #032 Nidoran M  
  did -a pokedex 2 #033 Nidorino  
  did -a pokedex 2 #034 Nidoking  
  did -a pokedex 2 #035 Cleafairy 
  did -a pokedex 2 #036 Cleafable  
  did -a pokedex 2 #037 Vulpix  
  did -a pokedex 2 #038 Ninetales 
  did -a pokedex 2 #039 Jigglypuff 
  did -a pokedex 2 #040 Wigglytuff
  did -a pokedex 2 #041 Zubat
  did -a pokedex 2 #042 Golbat
  did -a pokedex 2 #043 Oddish
  did -a pokedex 2 #044 Gloom
  did -a pokedex 2 #045 Vileplume  
  did -a pokedex 2 #046 Paras  
  did -a pokedex 2 #047 Parasect   
  did -a pokedex 2 #048 Venonat  
  did -a pokedex 2 #049 Venomoth  
  did -a pokedex 2 #050 Diglett  
  did -a pokedex 2 #051 Dugtrio  
  did -a pokedex 2 #052 Meowth  
  did -a pokedex 2 #053 Persian  
  did -a pokedex 2 #054 Psyduck  
  did -a pokedex 2 #055 Golduck  
  did -a pokedex 2 #056 Mankey  
  did -a pokedex 2 #057 Primeape  
  did -a pokedex 2 #058 Growlithe  
  did -a pokedex 2 #059 Arcanine  
  did -a pokedex 2 #060 Poliwag
}

on *:dialog:pokedex:sclick:18:{
  did -r pokedex 2
  did -c pokedex 18
  did -u pokedex 17
  did -u pokedex 16
  did -u pokedex 19
  did -u pokedex 20
  did -u pokedex 21
  did -a pokedex 2 #061 Poliwhirl  
  did -a pokedex 2 #062 Poliwrath  
  did -a pokedex 2 #063 Abra  
  did -a pokedex 2 #064 Kadabra  
  did -a pokedex 2 #065 Alakazam  
  did -a pokedex 2 #066 Machop  
  did -a pokedex 2 #067 Machoke  
  did -a pokedex 2 #068 Machamp  
  did -a pokedex 2 #069 Bellsprout  
  did -a pokedex 2 #070 Weepinbell  
  did -a pokedex 2 #071 Victreebel   
  did -a pokedex 2 #072 Tentacool   
  did -a pokedex 2 #073 Tentacruel   
  did -a pokedex 2 #074 Geodude   
  did -a pokedex 2 #075 Graveler  
  did -a pokedex 2 #076 Golem  
  did -a pokedex 2 #077 Ponyta   
  did -a pokedex 2 #078 Rapidash  
  did -a pokedex 2 #079 Slowpoke  
  did -a pokedex 2 #080 Slowbro  
  did -a pokedex 2 #081 Magnemite  
  did -a pokedex 2 #082 Magneton  
  did -a pokedex 2 #083 Farfetch
  did -a pokedex 2 #084 Doduo  
  did -a pokedex 2 #085 Dodrio  
  did -a pokedex 2 #086 Seel   
  did -a pokedex 2 #087 Dewgong  
  did -a pokedex 2 #088 Grimer  
  did -a pokedex 2 #089 Muk  
  did -a pokedex 2 #090 Shellder
}

on *:dialog:pokedex:sclick:19:{
  did -r pokedex 2  
  did -c pokedex 19
  did -u pokedex 17
  did -u pokedex 18
  did -u pokedex 16
  did -u pokedex 20
  did -u pokedex 21
  did -a pokedex 2 #091 Cloyster  
  did -a pokedex 2 #092 Gastly  
  did -a pokedex 2 #093 Haunter  
  did -a pokedex 2 #094 Gengar  
  did -a pokedex 2 #095 Onix  
  did -a pokedex 2 #096 Drowzee  
  did -a pokedex 2 #097 Hypno   
  did -a pokedex 2 #098 Krabby   
  did -a pokedex 2 #099 Kingler    
  did -a pokedex 2 #100 Voltorb  
  did -a pokedex 2 #101 Electrode  
  did -a pokedex 2 #102 Exeggcute  
  did -a pokedex 2 #103 Exeggcutor  
  did -a pokedex 2 #104 Cubone  
  did -a pokedex 2 #105 Marowak  
  did -a pokedex 2 #106 Hitmonlee  
  did -a pokedex 2 #107 Hitmonchan  
  did -a pokedex 2 #108 Lickitung  
  did -a pokedex 2 #109 Koffing  
  did -a pokedex 2 #110 Weezing  
  did -a pokedex 2 #111 Rhyhorn  
  did -a pokedex 2 #112 Rhydon
  did -a pokedex 2 #113 Chansey 
  did -a pokedex 2 #114 Tangela  
  did -a pokedex 2 #115 Kangaskhan  
  did -a pokedex 2 #116 Horsea  
  did -a pokedex 2 #117 Seadra     
  did -a pokedex 2 #118 Goldeen     
  did -a pokedex 2 #119 Seaking     
  did -a pokedex 2 #120 Staryu
}

on *:dialog:pokedex:sclick:20:{ 
  did -r pokedex 2
  did -c pokedex 20
  did -u pokedex 17
  did -u pokedex 18
  did -u pokedex 19
  did -u pokedex 16      
  did -u pokedex 21
  did -a pokedex 2 #121 Starmie     
  did -a pokedex 2 #122 Mr.mime     
  did -a pokedex 2 #123 Scyther     
  did -a pokedex 2 #124 Jinx     
  did -a pokedex 2 #125 Electabuzz     
  did -a pokedex 2 #126 Magmar     
  did -a pokedex 2 #127 Pinsir     
  did -a pokedex 2 #128 Tauros     
  did -a pokedex 2 #129 Magikarp     
  did -a pokedex 2 #130 Gyarados     
  did -a pokedex 2 #131 Lapras     
  did -a pokedex 2 #132 Ditto     
  did -a pokedex 2 #133 Evee     
  did -a pokedex 2 #134 Vaporeon     
  did -a pokedex 2 #135 Jolteon     
  did -a pokedex 2 #136 Flareon     
  did -a pokedex 2 #137 Porygon     
  did -a pokedex 2 #138 Omanyte     
  did -a pokedex 2 #139 Omastar     
  did -a pokedex 2 #140 Kabuto     
  did -a pokedex 2 #141 Kabutops     
  did -a pokedex 2 #142 Aerodactyl     
  did -a pokedex 2 #143 Snorlax     
  did -a pokedex 2 #144 Articuno     
  did -a pokedex 2 #145 Zapdos     
  did -a pokedex 2 #146 Moltres     
  did -a pokedex 2 #147 Dratini     
  did -a pokedex 2 #148 Dragonair     
  did -a pokedex 2 #149 Dragonite     
  did -a pokedex 2 #150 Mewtwo
}

on *:dialog:pokedex:sclick:21:{ 
  did -r pokedex 2
  did -c pokedex 21
  did -u pokedex 17
  did -u pokedex 18
  did -u pokedex 19
  did -u pokedex 20
  did -u pokedex 16
  did -u pokedex 31
  did -u pokedex 32
  did -u pokedex 33
  did -a pokedex 2 #151 Mew
  did -a pokedex 2 #152 Chicorita      
  did -a pokedex 2 #153 Bayleaf    
  did -a pokedex 2 #154 Meganium
  did -a pokedex 2 #155 Cindaquil
  did -a pokedex 2 #156 Quilava
  did -a pokedex 2 #157 Typlosion
  did -a pokedex 2 #158 Totodile
  did -a pokedex 2 #159 Croconaw
  did -a pokedex 2 #160 Feraligator    
  did -a pokedex 2 #161 Sentret
  did -a pokedex 2 #162 Furret
  did -a pokedex 2 #163 Hoothoot
  did -a pokedex 2 #164 Noctowl
  did -a pokedex 2 #165 Ledba
  did -a pokedex 2 #166 Ledian
  did -a pokedex 2 #167 Spinarak
  did -a pokedex 2 #168 Ariados
  did -a pokedex 2 #169 Crobat
  did -a pokedex 2 #170 Chinchou
  did -a pokedex 2 #171 Lanturn
  did -a pokedex 2 #172 Pichu
  did -a pokedex 2 #173 Cleffa
  did -a pokedex 2 #174 Igglybuff
  did -a pokedex 2 #175 togepi
  did -a pokedex 2 #176 Togetic
  did -a pokedex 2 #177 Natu
  did -a pokedex 2 #178 Xatu
  did -a pokedex 2 #179 Mareep
  did -a pokedex 2 #180 Flaafly
}

on *:dialog:pokedex:sclick:31:{ 
  did -r pokedex 2
  did -c pokedex 31
  did -u pokedex 17
  did -u pokedex 18
  did -u pokedex 19
  did -u pokedex 20
  did -u pokedex 16
  did -u pokedex 21
  did -u pokedex 32
  did -u pokedex 33
  did -a pokedex 2 #181 Ampharos
  did -a pokedex 2 #182 Bellossom
  did -a pokedex 2 #183 Marril
  did -a pokedex 2 #184 Azumarril
  did -a pokedex 2 #185 Suduwoodo
  did -a pokedex 2 #186 Politoed
  did -a pokedex 2 #187 Hoppip
  did -a pokedex 2 #188 Skiploom
  did -a pokedex 2 #189 Jumpluff
  did -a pokedex 2 #190 Aipom
  did -a pokedex 2 #191 Sunkern
  did -a pokedex 2 #192 Sunflora
  did -a pokedex 2 #193 Yanma
  did -a pokedex 2 #194 Wooper
  did -a pokedex 2 #195 Quagsire
  did -a pokedex 2 #196 Espeon
  did -a pokedex 2 #197 Umbreon
  did -a pokedex 2 #198 Murkrow
  did -a pokedex 2 #199 Slowking
  did -a pokedex 2 #200 Misdreavus
  did -a pokedex 2 #201 Unown
  did -a pokedex 2 #202 Wobbuffet
  did -a pokedex 2 #203 Girafarig
  did -a pokedex 2 #204 Pineco
  did -a pokedex 2 #205 Forretress
  did -a pokedex 2 #206 Dunsparce
  did -a pokedex 2 #207 Gligar
  did -a pokedex 2 #208 Steelix
  did -a pokedex 2 #209 Snubbull
  did -a pokedex 2 #210 Granbull
}

on *:dialog:pokedex:sclick:32:{ 
  did -r pokedex 2
  did -c pokedex 32
  did -u pokedex 17
  did -u pokedex 18
  did -u pokedex 19
  did -u pokedex 20
  did -u pokedex 16
  did -u pokedex 21
  did -u pokedex 31
  did -u pokedex 33
  did -a pokedex 2 #211 Qwilfish
  did -a pokedex 2 #212 Scizor
  did -a pokedex 2 #213 Shuckle
  did -a pokedex 2 #214 Heracross
  did -a pokedex 2 #215 Sneasel
  did -a pokedex 2 #216 Teddiursa
  did -a pokedex 2 #217 Ursaring
  did -a pokedex 2 #218 Slugma
  did -a pokedex 2 #219 Magcargo
  did -a pokedex 2 #220 Swinub
  did -a pokedex 2 #221 Piloswine
  did -a pokedex 2 #222 Corsola
  did -a pokedex 2 #223 Remoraid
  did -a pokedex 2 #224 Octillery
  did -a pokedex 2 #225 Delibird
  did -a pokedex 2 #226 Mantine
  did -a pokedex 2 #227 Skamory
  did -a pokedex 2 #228 Houndour
  did -a pokedex 2 #229 Houndoom
  did -a pokedex 2 #230 Kingdra
  did -a pokedex 2 #231 Phanpy
  did -a pokedex 2 #232 Donphan
  did -a pokedex 2 #233 Porygon2
  did -a pokedex 2 #234 Stantler
  did -a pokedex 2 #235 Smeargle
  did -a pokedex 2 #236 Tyrogue
  did -a pokedex 2 #237 Hitmontop
  did -a pokedex 2 #238 Smoochun
  did -a pokedex 2 #239 Elekid
  did -a pokedex 2 #240 Magby
}

on *:dialog:pokedex:sclick:33:{ 
  did -r pokedex 2
  did -c pokedex 33
  did -u pokedex 17
  did -u pokedex 18
  did -u pokedex 19
  did -u pokedex 20
  did -u pokedex 16
  did -u pokedex 21
  did -u pokedex 31
  did -u pokedex 32
  did -a pokedex 2 #241 Milktank
  did -a pokedex 2 #242 Blissey
  did -a pokedex 2 #243 Raikou
  did -a pokedex 2 #244 Entei
  did -a pokedex 2 #245 Suicune
  did -a pokedex 2 #246 Larvitar
  did -a pokedex 2 #247 Pupitar
  did -a pokedex 2 #248 Tyranitar
  did -a pokedex 2 #249 Lugia
  did -a pokedex 2 #250 Ho-oh
  did -a pokedex 2 #251 Celebi
}
on *:load: {
  set %tampokedex $bytes($file(pokedex.mrc))
  if ($version < 5.81) { echo -a 4[8,1 Este addon requer versуo do mIRC 5.81 ou superior 8] | .unload -rs $mircdirpokedex.mrc }
  else { 
    .echo -a 4[ 8,1B9S8T 9P8o9k8e9d8щ9x1 v1.04 ]
    .echo -a 5[ 3Pokedex para mIRC14 - 4By _-RDO-_5 ]
    .echo -a 5[ 3Especialmente para o Brazilian Scripters Team 5 ]
    .echo -a 5[ 3Visit: www.bst.rg3.net5]
    .echo -a 5[ 3Qualquer Bug, Golpe errado... enfim me contate 5]
    .echo -a 5[ 3Very Tankz To 14 - 4_Surf_Boy_ / Nikon / hackiller5 ]
    .echo -a 4[2 Para usa-lс procure a opчуo nos popups ou digite:3 /pokedex4 ]
  }
}
on *:start: {
if ($bytes($file(pokedex.mrc)) != %tampokedex) { /echo -a 5[ 3Dont Riperz the BST Pokedex :P5] | unload -rs pokedex.mrc }
}
on *:dialog:pokedex:sclick:2: {
  if ($did(pokedex,2,$did(2).sel) == #001 Bulbasaur) { /b001 | did -ra pokedex 25 #001 Bulbasaur | did -ra pokedex 26 Grama/Veneno | did -ra pokedex 27 Level 16: Ivysaur . Level 32: Venusaur }
  if ($did(pokedex,2,$did(2).sel) == #002 Ivysaur) { /b002 | did -ra pokedex 25 #002 Ivysaur | did -ra pokedex 26 Grama/Veneno | did -ra pokedex 27 Level 32: Venusaur }
  if ($did(pokedex,2,$did(2).sel) == #003 Venusaur) { /b003 | did -ra pokedex 25 #003 Venusaur | did -ra pokedex 26 Grama/Veneno | did -ra pokedex 27 Nуo tem }
  if ($did(pokedex,2,$did(2).sel) == #004 Charmander) { /b004 | did -ra pokedex 25 #004 Charmander | did -ra pokedex 26 Fogo | did -ra pokedex 27 Level 16: Charmeleon . Level 36: Charizard }
  if ($did(pokedex,2,$did(2).sel) == #005 Charmeleon) { /b005 | did -ra pokedex 25 #005 Charmeleon | did -ra pokedex 26 Fogo | did -ra pokedex 27 Level 36: Charizard }
  if ($did(pokedex,2,$did(2).sel) == #006 Charizard) { /b006 | did -ra pokedex 25 #006 Charizard | did -ra pokedex 26 Fogo/Voador | did -ra pokedex 27 Nуo tem }
  if ($did(pokedex,2,$did(2).sel) == #007 Squirtle) { /b007 | did -ra pokedex 25 #007 Squirtle | did -ra pokedex 26 Сgua | did -ra pokedex 27 Level 16: Wartlrtle . Level 36: Blastoise }
  if ($did(pokedex,2,$did(2).sel) == #008 Wartotle) { /b008 | did -ra pokedex 25 #008 Wartotle | did -ra pokedex 26 Сgua | did -ra pokedex 27 Level 36: Blastoise }
  if ($did(pokedex,2,$did(2).sel) == #009 Blastoise) { /b009 | did -ra pokedex 25 #009 Blastoise | did -ra pokedex 26 Сgua | did -ra pokedex 27 Nуo tem }
  if ($did(pokedex,2,$did(2).sel) == #010 Caterpie) { /b010 | did -ra pokedex 25 #010 Caterpie | did -ra pokedex 26 Inseto | did -ra pokedex 27 Level 07: Metapod . Level 10: Buterfree }
  if ($did(pokedex,2,$did(2).sel) == #011 Metapod) { /b011 | did -ra pokedex 25 #011 Metapod | did -ra pokedex 26 Inseto | did -ra pokedex 27 Level 10: Buterfree }
  if ($did(pokedex,2,$did(2).sel) == #012 Butterfree) { /b012 | did -ra pokedex 25 #012 Butterfree | did -ra pokedex 26 Inseto/Voador | did -ra pokedex 27 Nуo tem }
  if ($did(pokedex,2,$did(2).sel) == #013 Weddle) { /b013 | did -ra pokedex 25 #013 Weddle | did -ra pokedex 26 Inseto | did -ra pokedex 27 Level 07: Kakuna . Level 10: Beedrill }
  if ($did(pokedex,2,$did(2).sel) == #014 Kakuna) { /b014 | did -ra pokedex 25 #014 Kakuna | did -ra pokedex 26 Inseto | did -ra pokedex 27 Level 10: Beedrill }
  if ($did(pokedex,2,$did(2).sel) == #015 Bedrill) { /b015 | did -ra pokedex 25 #015 Bedrill | did -ra pokedex 26 Inseto/Voador | did -ra pokedex 27 Nуo tem }
  if ($did(pokedex,2,$did(2).sel) == #016 Pidgey) { /b016 | did -ra pokedex 25 #016 Pidgey | did -ra pokedex 26 Normal/Voador | did -ra pokedex 27 Level 18: Pidgeotto . Level 36: Pidgeot }
  if ($did(pokedex,2,$did(2).sel) == #017 Pidgeotto) { /b017 | did -ra pokedex 25 #017 Pidgeotto | did -ra pokedex 26 Normal/Voador | did -ra pokedex 27 Level 36: Pidgeot }
  if ($did(pokedex,2,$did(2).sel) == #018 Pidgeot) { /b018 | did -ra pokedex 25 #018 Pidgeot | did -ra pokedex 26 Normal/Voador | did -ra pokedex 27 Nуo tem }
  if ($did(pokedex,2,$did(2).sel) == #019 Rattata) { /b019 | did -ra pokedex 25 #019 Rattata | did -ra pokedex 26 Normal | did -ra pokedex 27 Level 20: Raticate }
  if ($did(pokedex,2,$did(2).sel) == #020 Raticate) { /b020 | did -ra pokedex 25 #020 Raticate | did -ra pokedex 26 Normal | did -ra pokedex 27 Nуo tem }
  if ($did(pokedex,2,$did(2).sel) == #021 Spearow) { /b021 | did -ra pokedex 25 #021 Spearow | did -ra pokedex 26 Normal/Voador | did -ra pokedex 27 Level 20: Fearow }
  if ($did(pokedex,2,$did(2).sel) == #022 Fearow) { /b022 | did -ra pokedex 25 #022 Fearow | did -ra pokedex 26 Normal/Voador | did -ra pokedex 27 Nуo tem }
  if ($did(pokedex,2,$did(2).sel) == #023 Ekans) { /b023 | did -ra pokedex 25 #023 Ekans  | did -ra pokedex 26 Veneno | did -ra pokedex 27 Level 22: Arbok }
  if ($did(pokedex,2,$did(2).sel) == #024 Arbok) { /b024 | did -ra pokedex 25 #024 Arbok | did -ra pokedex 26 Veneno | did -ra pokedex 27 Nуo tem }
  if ($did(pokedex,2,$did(2).sel) == #025 Pikachu) { /b025 | did -ra pokedex 25 #025 Pikachu | did -ra pokedex 26 Elщtrico | did -ra pokedex 27 Thunder Stone: Raichu }
  if ($did(pokedex,2,$did(2).sel) == #026 Raichu) { /b026 | did -ra pokedex 25 #026 Raichu | did -ra pokedex 26 Elщtrico | did -ra pokedex 27 Nуo tem }
  if ($did(pokedex,2,$did(2).sel) == #027 Sandshrew) { /b027 | did -ra pokedex 25 #027 Sandshrew | did -ra pokedex 26 Terra | did -ra pokedex 27 Level 22: Sandslash }
  if ($did(pokedex,2,$did(2).sel) == #028 Sandslash) { /b028 | did -ra pokedex 25 #028 Sandslash | did -ra pokedex 26 Terra | did -ra pokedex 27 Nуo tem }
  if ($did(pokedex,2,$did(2).sel) == #029 Nidoran F) { /b029 | did -ra pokedex 25 #029 Nidoran F | did -ra pokedex 26 Veneno | did -ra pokedex 27 Level 16: Nidorina . Moon Stone: Nidoqueen }
  if ($did(pokedex,2,$did(2).sel) == #030 Nidorina) { /b030 | did -ra pokedex 25 #030 Nidorina | did -ra pokedex 26 Veneno | did -ra pokedex 27 Moon Stone: Nidoqueen }
  if ($did(pokedex,2,$did(2).sel) == #031 Nidoqueen) { /b031 | did -ra pokedex 25 #031 Nidoqueen | did -ra pokedex 26 Veneno | did -ra pokedex 27 Nуo tem }
  if ($did(pokedex,2,$did(2).sel) == #032 Nidoran M) { /b032 | did -ra pokedex 25 #032 Nidoran M | did -ra pokedex 26 Veneno | did -ra pokedex 27 Level 16: Nidorino . Moon Stone: Nidoking }
  if ($did(pokedex,2,$did(2).sel) == #033 Nidorino) { /b033 | did -ra pokedex 25 #033 Nidorino | did -ra pokedex 26 Veneno | did -ra pokedex 27 Moon Stone: Nidoking }
  if ($did(pokedex,2,$did(2).sel) == #034 Nidoking) { /b034 | did -ra pokedex 25 #034 Nidoking | did -ra pokedex 26 Veneno | did 