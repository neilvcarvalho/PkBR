alias xporc {
  var %a 0
  var %b 14,14
  var %c 14
  if $2 { var %p $int($calc(100* $1 / $2)) }
  while %a < 10 {
    if %a >= $int($calc(%p /10)) { var %b %b $+ 15,15 | var %c 15 }
    if %a == 4 { var %b %b $+ 00 $+ $iif($len( [ %p ] ) == 1,0,$left( [ %p ] ,1)) $+ %c | goto n }
    if %a == 5 { var %b %b $+ 00 $+ $iif($len( [ %p ] ) == 1,$left( [ %p ] ,1),$mid( [ %p ] ,2,1)) $+ %c | goto n }
    if %a == 6 { var %b %b $+ 00 $+ $iif($len( [ %p ] ) == 3,$mid( [ %p ] ,3,1), [ %c ] $+ ) $+ %c | goto n }
    if %a == 9 { var %b %b $+ 00% | goto n }
    var %b %b $+ 
    :n
    inc %a
  }
  return %b $+ 
}
alias nomear2 {
  if ($1 == 001) { return Bulbasaur 6 8 4 10 }
  if ($1 == 002) { return Ivysaur 10 10 4 11 }
  if ($1 == 003) { return Venusaur 12 14 6 12 }
  if ($1 == 004) { return Charmander 8 6 4 10 }
  if ($1 == 005) { return Charmeleon 8 8 6 11 }
  if ($1 == 006) { return Charizard 14 10 7 12 }
  if ($1 == 007) { return Squirtle 6 10 3 10 }
  if ($1 == 008) { return Wartortle 8 12 4 11 }
  if ($1 == 009) { return Blastoise 12 16 5 12 }
  if ($1 == 010) { return Caterpie 6 6 3 10 }
  if ($1 == 011) { return Metapod 6 10 3 10 }
  if ($1 == 012) { return Butterfree 8 6 6 10 }
  if ($1 == 013) { return Weedle 6 6 3 10 }
  if ($1 == 014) { return Kakuna 6 10 3 10 }
  if ($1 == 015) { return Beedrill 10 6 6 12 }
  if ($1 == 016) { return Pidgey 6 6 4 10 }
  if ($1 == 017) { return Pidgeotto 10 6 4 11 }
  if ($1 == 018) { return Pidgeot 10 8 6 12 }
  if ($1 == 019) { return Rattata 6 6 4 10 }
  if ($1 == 020) { return Raticate 10 8 6 11 }
  if ($1 == 021) { return Spearow 6 6 5 10 }
  if ($1 == 022) { return Fearow 10 8 7 11 }
  if ($1 == 023) { return Ekans 8 6 3 10 }
  if ($1 == 024) { return Arbok 8 8 6 10 }
  if ($1 == 025) { return Pikachu 6 6 6 10 }
  if ($1 == 026) { return Raichu 12 6 6 10 }
  if ($1 == 027) { return Sandshrew 10 8 3 11 }
  if ($1 == 028) { return Sandslash 14 16 4 11 }
  if ($1 == 029) { return Nidoran(F) 6 6 3 11 }
  if ($1 == 030) { return Nidorina 8 6 3 11 }
  if ($1 == 031) { return Nidoqueen 12 12 3 12 }
  if ($1 == 032) { return Nidoran(M) 6 6 3 10 }
  if ($1 == 033) { return Nidorino 8 6 5 10 }
  if ($1 == 034) { return Nidoking 10 16 6 12 }
  if ($1 == 035) { return Clefairy 8 6 3 11 }
  if ($1 == 036) { return Clefable 10 12 4 12 }
  if ($1 == 037) { return Vulpix 8 6 4 11 }
  if ($1 == 038) { return Ninetales 10 10 6 12 }
  if ($1 == 039) { return Jigglypuff 6 6 3 12 }
  if ($1 == 040) { return Wigglytuff 10 6 3 12 }
  if ($1 == 041) { return Zubat 8 6 5 11 }
  if ($1 == 042) { return Golbat 8 8 6 11 }
  if ($1 == 043) { return Oddish 8 6 3 10 }
  if ($1 == 044) { return Gloom 8 8 3 11 }
  if ($1 == 045) { return Vileplume 12 12 3 12 }
  if ($1 == 046) { return Paras 8 6 3 10 }
  if ($1 == 047) { return Parasect 10 8 3 11 }
  if ($1 == 048) { return Venonat 6 6 3 11 }
  if ($1 == 049) { return Venomoth 8 6 6 11 }
  if ($1 == 050) { return Digglet 8 6 6 8 }
  if ($1 == 051) { return Dugtrio 10 6 8 10 }
  if ($1 == 052) { return Meowth 6 6 6 10 }
  if ($1 == 053) { return Persian 8 8 8 11 }
  if ($1 == 054) { return Psyduck 8 6 3 10 }
  if ($1 == 055) { return Golduck 12 12 3 11 }
  if ($1 == 056) { return Mankey 10 6 5 10 }
  if ($1 == 057) { return Primeape 12 8 6 11 }
  if ($1 == 058) { return Growlithe 8 6 5 11 }
  if ($1 == 059) { return Arcanine 14 8 6 12 }
  if ($1 == 060) { return Poliwag 6 6 6 10 }
  if ($1 == 061) { return Poliwhirl 8 8 6 11 }
  if ($1 == 062) { return Poliwrath 12 12 4 12 }
  if ($1 == 063) { return Abra 14 6 6 8 }
  if ($1 == 064) { return Kadabra 14 6 8 9 }
  if ($1 == 065) { return Alakazam 18 6 8 11 }
  if ($1 == 066) { return Machop 12 6 3 11 }
  if ($1 == 067) { return Machoke 12 10 3 12 }
  if ($1 == 068) { return Machamp 16 12 3 12 }
  if ($1 == 069) { return Bellsprout 8 6 3 10 }
  if ($1 == 070) { return Weepinbell 12 6 3 11 }
  if ($1 == 071) { return Victreebell 12 6 3 11 }
  if ($1 == 072) { return Tentacool 10 6 4 10 }
  if ($1 == 073) { return Tentacruel 14 6 6 12 }
  if ($1 == 074) { return Geodude 8 10 3 10 }
  if ($1 == 075) { return Graveler 12 16 3 11 }
  if ($1 == 076) { return Golem 12 16 3 12 }
  if ($1 == 077) { return Ponyta 10 6 6 10 }
  if ($1 == 078) { return Rapidash 12 8 8 12 }
  if ($1 == 079) { return Slowpoke 8 8 3 12 }
  if ($1 == 080) { return Slowbro 12 12 3 12 }
  if ($1 == 081) { return Magnemite 10 8 3 10 }
  if ($1 == 082) { return Magneton 14 12 4 11 }
  if ($1 == 083) { return Farfetch'd 10 6 4 10 }
  if ($1 == 084) { return Doduo 10 6 4 10 }
  if ($1 == 085) { return Dodrio 14 12 6 11 }
  if ($1 == 086) { return Seel 8 6 3 11 }
  if ($1 == 087) { return Dewgong 12 16 4 12 }
  if ($1 == 088) { return Grimer 8 6 3 12 }
  if ($1 == 089) { return Muk 14 8 3 12 }
  if ($1 == 090) { return Shellder 6 12 3 9 }
  if ($1 == 091) { return Cloyster 12 20 4 10 }
  if ($1 == 092) { return Gastly 12 6 5 10 }
  if ($1 == 093) { return Haunter 16 6 6 10 }
  if ($1 == 094) { return Gengar 16 8 6 11 }
  if ($1 == 095) { return Onix 6 18 4 10 }
  if ($1 == 096) { return Drowzee 10 6 3 11 }
  if ($1 == 097) { return Hypno 14 10 4 12 }
  if ($1 == 098) { return Krabby 10 12 3 9 }
  if ($1 == 099) { return Kingler 16 12 4 10 }
  if ($1 == 100) { return Voltorb 6 6 6 10 }
  if ($1 == 101) { return Electrode 8 8 9 11 }
  if ($1 == 102) { return Exeggcute 6 12 3 11 }
  if ($1 == 103) { return Exeggcutor 14 12 4 12 }
  if ($1 == 104) { return Cubone 6 14 3 10 }
  if ($1 == 105) { return Marowak 8 18 3 12 }
  if ($1 == 106) { return Hitmonlee 16 8 6 11 }
  if ($1 == 107) { return Hitmonchan 16 12 4 12 }
  if ($1 == 108) { return Lickitung 6 8 3 12 }
  if ($1 == 109) { return Koffing 6 12 3 10 }
  if ($1 == 110) { return Weezing 12 16 4 11 }
  if ($1 == 111) { return Rhyhorn 12 10 3 12 }
  if ($1 == 112) { return Rhydon 14 12 3 12 }
  if ($1 == 113) { return Chansey 6 6 3 12 }
  if ($1 == 114) { return Tangela 10 16 3 11 }
  if ($1 == 115) { return Kangaskhan 12 12 6 12 }
  if ($1 == 116) { return Horsea 8 8 3 9 }
  if ($1 == 117) { return Seadra 12 12 6 10 }
  if ($1 == 118) { return Goldeen 8 8 4 9 }
  if ($1 == 119) { return Seaking 10 8 4 12 }
  if ($1 == 120) { return Staryu 8 8 6 9 }
  if ($1 == 121) { return Starmie 10 12 8 10 }
  if ($1 == 122) { return Mr.Mime 10 8 6 10 }
  if ($1 == 123) { return Scyther 18 12 9 11 }
  if ($1 == 124) { return Jynx 12 6 6 11 }
  if ($1 == 125) { return Electabuzz 14 6 6 11 }
  if ($1 == 126) { return Magmar 14 10 6 10 }
  if ($1 == 127) { return Pinsir 16 12 6 11 }
  if ($1 == 128) { return Taurus 12 12 8 12 }
  if ($1 == 129) { return Magikarp 6 6 3 9 }
  if ($1 == 130) { return Gyarados 16 10 6 12 }
  if ($1 == 131) { return Lapras 12 12 3 12 }
  if ($1 == 132) { return Ditto 6 6 3 10 }
  if ($1 == 133) { return Eevee 8 6 3 11 }
  if ($1 == 134) { return Vaporeon 16 10 7 12 }
  if ($1 == 135) { return Jolteon 12 10 8 11 }
  if ($1 == 136) { return Flareon 12 6 5 11 }
  if ($1 == 137) { return Porygon 12 8 3 11 }
  if ($1 == 138) { return Omanyte 12 12 3 10 }
  if ($1 == 139) { return Omastar 14 16 3 11 }
  if ($1 == 140) { return Kabuto 12 12 3 10 }
  if ($1 == 141) { return Kabutops 16 16 5 11 }
  if ($1 == 142) { return Aerodactyl 16 10 6 12 }
  if ($1 == 143) { return Snorlax 12 8 3 12 }
  if ($1 == 144) { return Articuno 16 14 7 12 }
  if ($1 == 145) { return Zapdos 20 14 7 12 }
  if ($1 == 146) { return Moltres 20 14 7 12 }
  if ($1 == 147) { return Dratini 10 6 3 10 }
  if ($1 == 148) { return Dragonair 10 6 5 11 }
  if ($1 == 149) { return Dragonite 20 12 6 12 }
  if ($1 == 150) { return Mewtwo 20 18 10 12 }
  if ($1 == 151) { return Mew 22 22 11 13 }
  if ($1 == 152) { return Chikorita 6 10 4 10 }
  if ($1 == 153) { return Bayleef 8 12 4 11 } 
  if ($1 == 154) { return Meganium 12 16 6 12 }
  if ($1 == 155) { return Cyndaquil 6 6 5 10 }
  if ($1 == 156) { return Quilava 8 8 6 11 }
  if ($1 == 157) { return Typhlosion 12 14 7 12 }
  if ($1 == 158) { return Totodile 8 8 3 10 }
  if ($1 == 159) { return Croconaw 10 10 4 11 }
  if ($1 == 160) { return Feraligator 14 14 5 12 }
  if ($1 == 161) { return Sentret 6 4 3 10 }
  if ($1 == 162) { return Furret 8 8 6 11 }
  if ($1 == 163) { return Hoot-Hoot 6 4 4 10 }
  if ($1 == 164) { return Noctowl 8 6 5 11 }
  if ($1 == 165) { return Ledyba 6 6 4 10 }
  if ($1 == 166) { return Ledian 8 8 6 11 }
  if ($1 == 167) { return Spinarak 6 6 4 10 }
  if ($1 == 168) { return Ariados 10 8 6 11 }
  if ($1 == 169) { return Crobat 14 12 8 12 }
  if ($1 == 170) { return Chinchou 8 6 5 10 }
  if ($1 == 171) { return Lanturn 8 8 5 11 }
  if ($1 == 172) { return Pichu 4 4 5 10 }
  if ($1 == 173) { return Cleffa 4 4 3 10 }
  if ($1 == 174) { return Igglybuff 4 4 3 10 }
  if ($1 == 175) { return Togepi 4 4 4 10 }
  if ($1 == 176) { return Togetic 6 12 5 11 }
  if ($1 == 177) { return Natu 6 6 5 10 }
  if ($1 == 178) { return Xatu 8 8 7 11 }
  if ($1 == 179) { return Mareep 6 6 3 10 }
  if ($1 == 180) { return Flaaffy 8 8 4 11 }
  if ($1 == 181) { return Ampharos 10 10 5 12 }
  if ($1 == 182) { return Bellossom 12 12 4 12 }
  if ($1 == 183) { return Marill 6 8 4 10 }
  if ($1 == 184) { return Azumarill 8 10 4 11 }
  if ($1 == 185) { return Sudowoodo 12 12 3 10 }
  if ($1 == 186) { return Politoed 14 12 6 12 }
  if ($1 == 187) { return Hoppip 4 6 4 10 }
  if ($1 == 188) { return Skiploom 8 10 5 11 }
  if ($1 == 189) { return Jumpluff 10 12 6 12 }
  if ($1 == 190) { return Aipom 8 6 5 10 }
  if ($1 == 191) { return Sunkern 6 6 4 10 }
  if ($1 == 192) { return Sunflora 10 8 4 11 }
  if ($1 == 193) { return Yanma 8 10 6 10 }
  if ($1 == 194) { return Wooper 6 8 3 10 }
  if ($1 == 195) { return Quagsire 10 12 4 11 }
  if ($1 == 196) { return Espeon 12 10 6 11 }
  if ($1 == 197) { return Umbreon 12 12 5 11 }
  if ($1 == 198) { return Murkrow 10 6 7 10 }
  if ($1 == 199) { return Slowking 12 14 4 12 }
  if ($1 == 200) { return Misdreavus 10 10 6 10 }
  if ($1 == 201) { return Unnown 8 6 5 10 }
  if ($1 == 202) { return Wobbuffet 6 8 4 12 }
  if ($1 == 203) { return Girafarig 12 10 7 10 }
  if ($1 == 204) { return Pineco 6 10 4 10 }
  if ($1 == 205) { return Foretress 8 16 5 11 }
  if ($1 == 206) { return Dunsparce 10 10 5 10 }
  if ($1 == 207) { return Gligar 10 12 6 10 }
  if ($1 == 208) { return Steelix 12 20 5 11 }
  if ($1 == 209) { return Snubbull 10 6 4 10 }
  if ($1 == 210) { return Granbull 14 10 6 11 }
  if ($1 == 211) { return Qwilfish 12 10 6 10 }
  if ($1 == 212) { return Scizor 20 14 9 12 }
  if ($1 == 213) { return Shuckle 4 20 3 10 }
  if ($1 == 214) { return Heracross 18 10 6 10 }
  if ($1 == 215) { return Sneasel 12 8 8 10 }
  if ($1 == 216) { return Teddiursa 10 6 5 10 }
  if ($1 == 217) { return Ursaring 16 12 6 11 }
  if ($1 == 218) { return Slugma 6 6 3 10 }
  if ($1 == 219) { return Magcargo 8 14 4 11 }
  if ($1 == 220) { return Swinub 8 6 4 10 }
  if ($1 == 221) { return Piloswine 12 10 5 11 }
  if ($1 == 222) { return Corsola 8 12 5 10 }
  if ($1 == 223) { return Remoraid 8 6 5 10 }
  if ($1 == 224) { return Octillery 14 10 6 11 }
  if ($1 == 225) { return Delibird 8 6 6 10 }
  if ($1 == 226) { return Mantine 6 10 8 10 }
  if ($1 == 227) { return Skarmory 14 18 6 10 }
  if ($1 == 228) { return Houndour 8 6 5 10 }
  if ($1 == 229) { return Houndoom 14 10 6 11 }
  if ($1 == 230) { return Kingdra 14 16 8 12 }
  if ($1 == 231) { return Phanpy 6 6 4 10 }
  if ($1 == 232) { return Donphan 16 16 4 11 }
  if ($1 == 233) { return Porygon 2 14 10 7 11 }
  if ($1 == 234) { return Stantler 14 12 7 10 }
  if ($1 == 235) { return Smeargle 6 4 5 10 }
  if ($1 == 236) { return Tyrogue 6 6 5 10 }
  if ($1 == 237) { return Hitmontop 14 14 7 11 }
  if ($1 == 238) { return Smoochum 4 4 4 10 }
  if ($1 == 239) { return Elekid 4 4 7 10 }
  if ($1 == 240) { return Magby 4 4 6 10 }
  if ($1 == 241) { return Milktank 12 12 6 10 }
  if ($1 == 242) { return Blissey 8 8 5 12 }
  if ($1 == 243) { return Raikou 18 14 8 12 }
  if ($1 == 244) { return Entei 20 12 8 12 }
  if ($1 == 245) { return Suicune 20 14 8 12 }
  if ($1 == 246) { return Larvitar 6 8 5 10 }
  if ($1 == 247) { return Pupitar 10 12 6 11 }
  if ($1 == 248) { return Tyranitar 16 18 7 12 }
  if ($1 == 249) { return Lugia 20 14 9 12 }
  if ($1 == 250) { return Ho-oh 18 14 9 12 }
  if ($1 == 251) { return Celebi 22 22 11 12 }
  :z
}
alias sbp.nomear { nomear3 $nomear2(%pkno) }
alias nomear3 { set %pkna $1 | set %pkata $2 | set %pkdef $3 | set %pkvel $4 | set %pklife $5 }