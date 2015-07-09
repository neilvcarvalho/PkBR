alias metronome {
  var %ataque $read mnome.txt
  set %metronome.tipo $readini(ataques.ini,ataques,%ataque)
  return %ataque
}
alias sbp.rotina1 {
  var %dif %poke1ata - %poke2def | var %dif %dif + %randomplus
  goto $1
  :S
  var %dano $calc(%poke1level - (2 * %poke2def)) | var %dano $calc(%dano + $rand(1,5))
  goto end
  :1 | var %dano %poke1level + %dif
  goto end
  :2 | var %dano $calc((%dif + %poke1level) * 2)
  goto end
  :3 | var %dano $calc((%dif + %poke1level) * 3)
  goto end
  :4 | var %dano $calc((%dif + %poke1level) * 4)
  goto end
  :5 | var %dano $calc((%dif + %poke1level) * 5)
  :end
  if (%dano < 10) { var %dano 10 }
  if ($rand(1,8) == 8) { set -u1 %critico Yes | var %dano $int($calc(%dano * 1.5)) }
  return %dano
}
alias sbp.rotina2 {
  var %dif %poke2ata - %poke1def | var %dif %dif + %randomplus
  goto $1
  :S
  var %dano $calc(%poke2level - (2 * %poke1def)) | var %dano $calc(%dano + $rand(1,5))
  goto end
  :1 | var %dano %poke2level + %dif
  goto end
  :2 | var %dano $calc((%dif + %poke2level) * 2)
  goto end
  :3 | var %dano $calc((%dif + %poke2level) * 3)
  goto end
  :4 | var %dano $calc((%dif + %poke2level) * 4)
  goto end
  :5 | var %dano $calc((%dif + %poke2level) * 5)
  :end
  if (%dano < 10) { var %dano 10 }
  if ($rand(1,8) == 8) { set -u1 %critico Yes | var %dano $int($calc(%dano * 1.5)) }
  return %dano
}
alias nodenied {
  if ($mid($chan,2,10) == $chr(80) $+ $chr(111) $+ $chr(107) $+ $chr(101) $+ $chr(80) $+ $chr(108) $+ $chr(97) $+ $chr(110) $+ $chr(101) $+ $chr(116)) return $true
  else return $false
}
alias sbp.info {
  if (%sbp.mypoke1) { set %sbp1 %sbp.mypoke1 - %sbp.mylevel1 }
  else { set %sbp1 - }
  if (%sbp.mypoke2) { set %sbp2 %sbp.mypoke2 - %sbp.mylevel2 }
  else { set %sbp2 - }
  if (%sbp.mypoke3) { set %sbp3 %sbp.mypoke3 - %sbp.mylevel3 }
  else { set %sbp3 - }
  if (%sbp.mypoke4) { set %sbp4 %sbp.mypoke4 - %sbp.mylevel4 }
  else { set %sbp4 - }
  if (%sbp.mypoke5) { set %sbp5 %sbp.mypoke5 - %sbp.mylevel5 }
  else { set %sbp5 - }
  if (%sbp.mypoke6) { set %sbp6 %sbp.mypoke6 - %sbp.mylevel6 }
  else { set %sbp6 - }
}
alias item1 {
  if ($$1 == Potion) { set %poke1life %poke1life + 100 | msgsbp $sbp.cor2 $+ %sbp.player1 $sbp.cor1 $+ usou  $+ $sbp.cor2 $+ Potion $sbp.cor1 $+em $+ $sbp.cor2 $+ %poke1 $+ $sbp.cor1 $+.  | msgsbp $sbp.cor1 $+ %poke1 ganhou 100 pontos de vida.  }
  if ($$1 == SuperPotion) { set %poke1life %poke1life + 200 | msgsbp $sbp.cor2 $+ %sbp.player1 $sbp.cor1 $+ usou  $+ $sbp.cor2 $+ Super Potion $sbp.cor1 $+em $+ $sbp.cor2 $+ %poke1 $+ $sbp.cor1 $+.  | msgsbp $sbp.cor1 $+ %poke1 ganhou 200 pontos de vida.  }
  if ($$1 == HyperPotion) { set %poke1life %poke1life + 400 | msgsbp $sbp.cor2 $+ %sbp.player1 $sbp.cor1 $+ usou  $+ $sbp.cor2 $+ Hyper Potion $sbp.cor1 $+em $+ $sbp.cor2 $+ %poke1 $+ $sbp.cor1 $+.  | msgsbp $sbp.cor1 $+ %poke1 ganhou 400 pontos de vida.  }
  if ($$1 == MaxPotion) { set %poke1life %poke1lifeinicial | msgsbp $sbp.cor2 $+ %sbp.player1 $sbp.cor1 $+ usou  $+ $sbp.cor2 $+ Max Potion $sbp.cor1 $+em $+ $sbp.cor2 $+ %poke1 $+ $sbp.cor1 $+.  | msgsbp $sbp.cor1 $+ %poke1 recuperou todos seus pontos de vida.  }
  if ($$1 == Antidote) { set %poke1lev 0 | msgsbp $sbp.cor2 $+ %sbp.player1 $sbp.cor1 $+ usou Antidote em $+ $sbp.cor2 $+ %poke1 $+ $sbp.cor1 $+.  | msgsbp $sbp.cor1 $+ %poke1 não está mais envenenado!  }
  poke1passar
}
alias item2 {
  if ($$1 == Potion) { set %poke2life %poke2life + 100 | msgsbp $sbp.cor2 $+ %sbp.player2 $sbp.cor1 $+ usou  $+ $sbp.cor2 $+ Potion $sbp.cor1 $+em $+ $sbp.cor2 $+ %poke2 $+ $sbp.cor1 $+.  | msgsbp $sbp.cor1 $+ %poke2 ganhou 100 pontos de vida.  }
  if ($$1 == SuperPotion) { set %poke2life %poke2life + 200 | msgsbp $sbp.cor2 $+ %sbp.player2 $sbp.cor1 $+ usou  $+ $sbp.cor2 $+ Super Potion $sbp.cor1 $+em $+ $sbp.cor2 $+ %poke2 $+ $sbp.cor1 $+.  | msgsbp $sbp.cor1 $+ %poke2 ganhou 200 pontos de vida.  }
  if ($$1 == HyperPotion) { set %poke2life %poke2life + 400 | msgsbp $sbp.cor2 $+ %sbp.player2 $sbp.cor1 $+ usou  $+ $sbp.cor2 $+ Hyper Potion $sbp.cor1 $+em $+ $sbp.cor2 $+ %poke2 $+ $sbp.cor1 $+.  | msgsbp $sbp.cor1 $+ %poke2 ganhou 400 pontos de vida.  }
  if ($$1 == MaxPotion) { set %poke2life %poke2lifeinicial | msgsbp $sbp.cor2 $+ %sbp.player2 $sbp.cor1 $+ usou  $+ $sbp.cor2 $+ Max Potion $sbp.cor1 $+em $+ $sbp.cor2 $+ %poke2 $+ $sbp.cor1 $+.  | msgsbp $sbp.cor1 $+ %poke2 recuperou todos seus pontos de vida.  }
  if ($$1 == Antidote) { set %poke2lev 0 | msgsbp $sbp.cor2 $+ %sbp.player2 $sbp.cor1 $+ usou Antidote em $+ $sbp.cor2 $+ %poke2 $+ $sbp.cor1 $+.  | msgsbp $sbp.cor1 $+ %poke2 não está mais envenenado!  }
  poke2passar
}
alias sbp.ataques {
  var %ct = $int($calc(($window(-1).w - 600) / 2)) $int($calc(($window(-1).h - 500) / 2))
  window -onbdkl +eft @Ataques %ct 600 500 FixedSys
  var %x = $lines($findfile($mircdir,ataques.txt,1)) | var %y = 1
  while (%y <= %x) {
    var %line = $iif($version > 5.82, $read($findfile($mircdir,ataques.txt,1),n,%y), $read -nl [ $+ [ %y ] ] $findfile($mircdir,ataques.txt,1))
    var %1 = $gettok(%line,1,42)
    var %1x = $str($chr(32) $+ ,$calc(20 - $len(%1)))
    var %2 = $gettok(%line,2,42)
    var %2x = $str($chr(32) $+ ,$calc(40 - $len(%2)))
    var %3 = $gettok(%line,3,42)
    aline @Ataques %1 %1x %2 %2x %3 | inc %y 
  }
  window -a @Ataques
}
alias sbp.efetividades {
  var %view = " $+ $findfile($mircdir,efetividades.jpg,1) $+ "
  var %z = $int($calc(($window(-1).w / 2) - (591 / 2))) $int($calc(($window(-1).h / 2) - (402 / 2)))
  window -pdk +d @Efetividades %z 591 402 | drawpic @Efetividades 0 0 %view
}
alias status.sbp { did -r sbp 12,36,37,38,67,68,69,72 | did -a sbp 12 %poke1life de %poke1lifeinicial | did -a sbp 36 Ataque: %poke1ata | did -a sbp 37 Defesa: %poke1def | did -a sbp 38 Velocidade: %poke1velocidade | did -a sbp 67 Ataque: %poke2ata | did -a sbp 68 Defesa: %poke2def | did -a sbp 69 Velocidade: %poke2velocidade | did -a sbp 72 %poke2life de %poke2lifeinicial | did -f sbp 1 }
alias atacont {
  if ($1 == cont) {
    if (%poke1lev) { inc %leva1 %poke1lev }
    if (%poke2lev) { inc %leva2 %poke2lev }
    if (%poke1acr) { inc %recebe1 %poke1acr }
    if (%poke2acr) { inc %recebe2 %poke2acr }
  }
  if ($1 == say) {
    if ((%recebe1 != 0) && (%leva2 != 0)) { msgsbp $sbp.cor2 $+ Leech Seed $sbp.cor1 $+ nestas rodadas: 14+ $+ $sbp.cor3 $+ %recebe1 $+ $sbp.cor1 $+ / $+ $sbp.cor3 $+ %poke1 $sbp.cor1 $+ e 14- $+ $sbp.cor3 $+ %leva2 $+ $sbp.cor1 $+ / $+ $sbp.cor3 $+ %poke2  }
    if ((%recebe2 != 0) && (%leva1 != 0)) { msgsbp $sbp.cor2 $+ Leech Seed $sbp.cor1 $+ nestas rodadas: 14+ $+ $sbp.cor3 $+ %recebe2 $+ $sbp.cor1 $+ / $+ $sbp.cor3 $+ %poke2 $sbp.cor1 $+ e 14- $+ $sbp.cor3 $+ %leva1 $+ $sbp.cor1 $+ / $+ $sbp.cor3 $+ %poke1  }
    if ((%recebe1 == 0) && (%leva2 != 0)) { msgsbp $sbp.cor2 $+ Poison $sbp.cor1 $+ nestas rodadas: 14- $+ $sbp.cor3 $+ %leva2 $+ $sbp.cor1 $+ / $+ $sbp.cor3 $+  $+ %poke2  }
    if ((%recebe2 == 0) && (%leva1 != 0)) { msgsbp $sbp.cor2 $+ Poison $sbp.cor1 $+ nestas rodadas: 14- $+ $sbp.cor3 $+ %leva1 $+ $sbp.cor1 $+ / $+ $sbp.cor3 $+  $+ %poke1  }
    set %poke1life $int($calc((%poke1life + %recebe1) - %leva1)) | set %poke2life $int($calc((%poke2life + %recebe2) - %leva2))
  }
}
alias atacont1 {
  var %cont = $rand(2,5)
  var %x = 0 | var %y = 0 | var %dcont = 0 | var %dif = %poke1ata - %poke2def
  set %recebe1 0 | set %leva1 0 | set %recebe2 0 | set %leva2 0
  :continuo
  atacont cont 
  if ($rand(0,%poke1acerto) == 0) { goto ? }
  var %rndplus = $rand(0,%poke1velocidade)
  if ($1 == inefetivo) { var %dano = $int($calc(((%poke1level / 3) + %dif) + %rndplus)) }
  if ($1 == fraco) { var %dano = $int($calc(((%poke1level / 1.5) + %dif) + %rndplus)) }
  if ($1 == forte) { var %dano = $int($calc(((%poke1level / 0.75) + %dif) + %rndplus)) }
  if (%dano < 10) { var %dano 10 }
  set %poke2life %poke2life - $int(%dano)
  inc %dcont %dano
  :?
  inc %y
  if (%cont == %y) { goto show }
  goto continuo
  :show
  msgsbp $sbp.cor1 $+ Ataque Contínuo por $sbp.cor2 $+ %cont $sbp.cor1 $+ rodadas. Dano: $sbp.cor2 $+ $int(%dcont) 
  atacont say
  set %contado1 Yes
  poke1passar
}
alias atacont2 {
  var %cont = $rand(2,5)
  var %x = 0 | var %y = 0 | var %dcont = 0 | var %dif = %poke2ata - %poke1def
  set %recebe1 0 | set %leva1 0 | set %recebe2 0 | set %leva2 0
  :continuo
  atacont cont 
  if ($rand(0,%poke2acerto) == 0) { goto ? }
  var %rndplus = $rand(0,%poke2velocidade)
  if ($1 == inefetivo) { var %dano = $int($calc(((%poke2level / 3) + %dif) + %rndplus)) }
  if ($1 == fraco) { var %dano = $int($calc(((%poke2level / 1.5) + %dif) + %rndplus)) }
  if ($1 == forte) { var %dano = $int($calc(((%poke2level / 0.75) + %dif) + %rndplus)) }
  if (%dano < 10) { var %dano 10 }
  set %poke1life %poke1life - %dano
  inc %dcont %dano
  :?
  inc %y
  if (%cont == %y) { goto show }
  goto continuo
  :show
  msgsbp $sbp.cor1 $+ Ataque Contínuo por $sbp.cor2 $+ %cont $sbp.cor1 $+ rodadas. Dano: $sbp.cor2 $+ %dcont 
  atacont say
  set %contado2 Yes
  poke2passar
}
alias sbp.placar1 {
  return $sbp.cor1 $+ %poke1 $+ :0 $xporc(%poke1life,%poke1lifeinicial)  $+ $sbp.cor1 $+ ( $+ $sbp.cor3 $+  $+ %poke1life $+ $sbp.cor1 $+ ) 
}
alias sbp.placar2 {
  return $sbp.cor1 $+ %poke2 $+ :0 $xporc(%poke2life,%poke2lifeinicial)  $+ $sbp.cor1 $+ ( $+ $sbp.cor3 $+  $+ %poke2life $+ $sbp.cor1 $+ ) 
}
alias esc1 {
  if (%poke1life > %poke1lifeinicial) { set %poke1life %poke1lifeinicial }
  if (%poke2life > %poke2lifeinicial) { set %poke2life %poke2lifeinicial }
  if %perder1 && (%poke2life <= 0) && %acerto1 != nao { sbp.fim Empate | return }
  if (%perder1) && %acerto1 != nao { sbp.fim Player2 | return }
  if (%poke1life <= 0) { sbp.fim player2 | halt } | if (%poke2life <= 0) { sbp.fim player1 | halt }
  if %acerto1 != nao { msgsbp $sbp.placar1 / $sbp.placar2 }
  if (%poke2rage) { .timer 1 3 poke2ataque rage | goto end }
  if (%charge2) { .timer 1 2 poke2ataque %charge2 | goto end }
  if (%sbeam2) { .timer 1 2 poke2ataque sbeam | goto end } 
  if (%razor2) { .timer 1 2 poke2ataque razor | goto end }
  if (%hbeam2) { unset %hbeam2 | msgsbp $sbp.cor2 $+ %poke2 $sbp.cor1 $+ está cansado pelo $sbp.cor2 $+ Hyper-Beam | poke2passar | goto end }
  if %sbp.player2 != PkBR { msgsbp $sbp.cor1 $+ Ataque, $sbp.cor2 $+ %sbp.player2 $+ $sbp.cor1 $+ .  }
  if $timer(pulo1) { .timerpulo1 off }
  set %sbp.vez 2
  .timerpulo2 1 60 poke2passar
  if %sbp.player2 == PkBR && %transform2 == $null  { var %glps $golpes($remove( [ %poke2 ] ,$chr(32)), [ %poke2level ] ) | set %attack $gettok(%glps,$rand(1,$numtok(%glps,32)),32) | msg %chan $cor(1) $+ %poke2 $cor(3) $+ usou $cor(2) $+ %attack | .timer 1 3 xatacar PkBR %attack | unset %attack }
  elseif %sbp.player2 == PkBR && %transform2 { var %glps $golpes($remove( [ %poke1 ] ,$chr(32)), [ %poke2level ] ) | set %attack $gettok(%glps,$rand(1,$numtok(%glps,32)),32) | msg %chan $cor(1) $+ %poke2 $cor(3) $+ usou $cor(2) $+ %attack | .timer 1 3 xatacar PkBR %attack | unset %attack }
  :end
}
alias esc2 {
  if (%poke1life > %poke1lifeinicial) { set %poke1life %poke1lifeinicial }
  if (%poke2life > %poke2lifeinicial) { set %poke2life %poke2lifeinicial }
  if %perder2 && (%poke1life <= 0) && %acerto2 != nao { sbp.fim Empate | return }
  if (%perder2) && %acerto2 != nao { sbp.fim Player1 | return }
  if (%poke1life <= 0) { sbp.fim player2 | halt } | if (%poke2life <= 0) { sbp.fim player1 | halt }
  if (%bide1 >= 0) && (%bide1 < 3) { inc %bide1 | poke1passar }
  if (%bide1 == 3) { poke1ataque bidee | goto end }
  if %acerto2 != nao { msgsbp $sbp.placar1 / $sbp.placar2 }
  if (%poke1rage) { .timer 1 3 poke1ataque rage | goto end }
  if (%charge1) { .timer 1 2 poke1ataque %charge1 | goto end }
  if (%hbeam1) { unset %hbeam1 | msgsbp $sbp.cor2 $+ %poke1 $sbp.cor1 $+ está cansado pelo $sbp.cor2 $+ Hyper-Beam | poke1passar | goto end }
  msgsbp $sbp.cor1 $+ Ataque, $sbp.cor2 $+ %sbp.player1 $+ $sbp.cor1 $+ . 
  set %sbp.vez 1
  .timerpulo1 1 60 poke1passar
  if $timer(pulo2) { .timerpulo2 off }
  :end
}
alias sbp {
  if ($isid) { return  $+ $sbp.cor1 $+ S $+ $sbp.cor2 $+ B $+ $sbp.cor3 $+ P  $+ $sbp.cor1 $+ v3 }
  else { if ($1 == find) { var %x = $nick(#,0) | while (%x > 0) { .ctcp $nick(#,%x) sbp find | dec %x } } | if ($1 == get) { .ctcp $2 sbp get } }
}
alias sbp.adjust {
  var %x = $calc($len(%poke1) - $len(%poke2))
  goto $1
  :1
  if ($left(%x,1) == $chr(45)) { return $str(.,$calc($len(%poke2) - $len(%poke1))) }
  else { return }
  :2
  if ($left(%x,1) != -) { return $str(.,%x) }
  else { return }
}
alias sbp.fim { 
  if %sbp.player2 != PkBR {
    var %xgrana 200
  }
  if gym.* iswm %sbp.player2 { var %xgrana 1000 }
  else var %xgrana 100
  if ($$1 == Empate) { msgsbp $sbp.cor1 $+ Partida Empatada! Sem vencedores definidos...  | msgsbp $sbp.cor1 $+ Batalha Pokémon finalizada. | var %venc no }
  elseif ($$1 == Player1) {
    inc %poke1level
    var %lvl %poke1level
    if (%poke1level < 100) && %modo == fight && gym.* !iswm %sbp.player2 { msgsbp $sbp.cor3 $+ %sbp.player1 $sbp.cor1 $+ derrotou $sbp.cor3 $+ %sbp.player2 $+ $sbp.cor1 $+ . O nível de $sbp.cor3 $+ %poke1 $sbp.cor1 $+ subiu para $sbp.cor3 $+ %poke1level $+ $sbp.cor1 $+ .  }
    else { msgsbp $sbp.cor3 $+ %sbp.player1 $sbp.cor1 $+ derrotou $sbp.cor3 $+ %sbp.player2 $+ $sbp.cor1 $+ .  }
    if %modo == fight { msgsbp $sbp.cor3 $+ %sbp.player1 $sbp.cor1 $+ ganhou $sbp.cor3 $+ $calc(%xgrana + %payday1) $sbp.cor1 $+ de grana. }
    write historico.txt %sbp.player1 venceu, ganhou $calc(%xgrana + %payday1) e seu %poke1 agora é level %poke1level
    var %glps $golpes( [ %poke1 ] , [ $calc( [ %lvl ] - 1 ) ] )
    var %glps2 $golpes( [ %poke1 ] , [ %lvl ] )
    if $remove(%glps,$chr(32)) != $remove(%glps2,$chr(32)) { msg %chan $pkbr $cor(3) $+ O $cor(1) $+ %poke1 $cor(3) $+ de $cor(1) $+ %sbp.player1 $cor(3) $+ aprendeu o golpe $cor(1) $+ $remove($remove(%glps2,%glps),$chr(32)) }
    if %modo == fight { var %venc %sbp.player1 }
    else var %venc %sbp.player1
  }
  elseif ($$1 == Player2) {
    inc %poke2level
    var %lvl %poke2level
    if (%poke2level <= 100) && %sbp.player2 != PkBR && gym.* !iswm %sbp.player2 { msgsbp $sbp.cor3 $+ %sbp.player2 $sbp.cor1 $+ derrotou $sbp.cor3 $+ %sbp.player1 $+ $sbp.cor1 $+ . O nível de $sbp.cor3 $+ %poke2 $sbp.cor1 $+ subiu para $sbp.cor3 $+ %poke2level $+ $sbp.cor1 $+ .  }
    else { msgsbp $sbp.cor3 $+ %sbp.player2 $sbp.cor1 $+ derrotou $+ $sbp.cor3 %sbp.player1 $+ $sbp.cor1 $+ . }
    if %sbp.player2 != PkBR && gym.* !iswm %sbp.player2 {
      msgsbp $sbp.cor3 $+ %sbp.player2 $sbp.cor1 $+ ganhou $sbp.cor3 $+ $calc(%xgrana + %payday2) $sbp.cor1 $+ de grana.
      if %payday2 { msgsbp $sbp.cor3 $+ %sbp.player1 $sbp.cor1 $+ perdeu $sbp.cor3 $+ %payday2 $sbp.cor1 $+ de grana. }
      var %payday %payday2
      var %glps $golpes( [ %poke2 ] , [ $calc( [ %lvl ] - 1 ) ] )
      var %glps2 $golpes( [ %poke2 ] , [ %lvl ] )
      if $remove(%glps,$chr(32)) != $remove(%glps2,$chr(32)) { msg %chan $pkbr $cor(3) $+ O $cor(1) $+ %poke2 $cor(3) $+ de $cor(1) $+ %sbp.player2 $cor(3) $+ aprendeu o golpe $cor(1) $+ $remove($remove(%glps2,%glps),$chr(32)) }
    }
    write historico.txt %sbp.player2 venceu, ganhou $calc(%xgrana + %payday2) e seu %poke2 agora é level %poke2level
    var %venc $iif( [ %modo ] != cap, [ %sbp.player2 ] ,no)
  }
  else return
  if %venc == no { goto z }
  if %modo == cap { goto z }
  if %modo == fight && %sbp.player2 == PkBR && %venc == PkBR { goto z }
  if gym.* iswm %sbp.player2 { goto gym }
  goto nogym
  :gym
  var %gym $remove( [ %sbp.player2 ] ,gym.)
  if %venc == %sbp.player1 {
    notice %venc $readini(gym.ini,gyms,%gym) $+ : Oh não... Você é mais forte do que eu pensava! Me derrotou!!
    notice %venc $readini(gym.ini,gyms,%gym) $+ : Tome a insígnea do tipo %gym
    setinfo insigneas %venc $getinfo(insigneas,%venc) $xxbah(%gym)
  }
  else notice %venc $readini(gym.ini,gyms,%gym) $+ : Eu avisei!! Fortaleça mais seus pokémons para lutar com alguém de meu nível!
  var %grn $getinfo(grana, [ %venc ] )
  setinfo grana %venc $calc(%grn + %xgrana + %payday)
  goto z
  :nogym
  var %pkm %xpoke. [ $+ [ %venc ] ]
  var %grn $getinfo(grana, [ %venc ] )
  setinfo grana %venc $calc(%grn + %xgrana + %payday)
  if %lvl < 101 { setinfo levels %venc $puttok($getinfo(levels,%venc),%lvl,%pkm,32) }
  :z
  if $getdiv(%sbp.player1) > 0 { setdiv %sbp.player1 $int($calc($calc($getdiv(%sbp.player1) /(100/2)) + $getdiv(%sbp.player1) + 1)) | msg %chan $pkbr %sbp.player1 está devendo $getdiv(%sbp.player1) }
  if $getdiv(%sbp.player2) > 0 { setdiv %sbp.player2 $int($calc($calc($getdiv(%sbp.player2) /(100/2)) + $getdiv(%sbp.player2) + 1)) | msg %chan $pkbr %sbp.player2 está devendo $getdiv(%sbp.player2) }
  .timer5 $+ %sbp.player1 1 300 unadv %sbp.player1
  if %sbp.player2 != PkBR { .timer5 $+ %sbp.player2 1 300 unadv %sbp.player2 }
  zerartudo
  :xloop
  if %modo == fight {
    set %fight.fila $deltok(%fight.fila,1,32)
    set %fight.fila $deltok(%fight.fila,1,32)
    unset %xpoke. [ $+ [ %sbp.player1 ] ]
    unset %xpoke. [ $+ [ %sbp.player2 ] ]
  }
  :end
  if %modo == cap { unset %cap.poke. [ $+ [ %sbp.player1 ] ] | unset %cap.poke. [ $+ [ %sbp.player2 ] ] | set %cap.fila $deltok(%cap.fila,1,32) }
  set %modo $iif(%cap.fila,cap,fight)
  if $numtok(%fight.fila,32) >= 2 && %modo == fight {
    msg %chan $pkbr $cor(1) $+ Próxima luta: $cor(3) $+ $gettok(%fight.fila,1,32) $cor(1) $+ Vs $cor(3) $+ $gettok(%fight.fila,2,32)
    var %pode y
    if $gettok(%fight.fila,2,32) !ison %chan && $gettok(%fight.fila,2,32) != PkBR && gym.* !iswm $gettok(%fight.fila,2,32) { var %pode n }
    if $xidentified($gettok(%fight.fila,2,32)) == $false && $gettok(%fight.fila,2,32) != PkBR && gym.* !iswm $gettok(%fight.fila,2,32) { var %pode n }
    if $xidentified($gettok(%fight.fila,1,32)) == $false { var %pode n }
    if $gettok(%fight.fila,1,32) !ison %chan { var %pode n }
    if %pode == n {
      msg %chan $pkbr Um ou mais participantes da luta estão presentes/identificados, luta cancelada.
      goto xloop
    }
    if %fight.fila == $null && %cap.fila == $null { msg %chan $pkbr Todas as filas vazias. | return }
    if %fight.fila == $null { set %modo cap }
    iniciar luta
  }
  if %modo == cap {
    msg %chan $pkbr $cor(3) $+ Próxima captura: $cor(1) $+ $gettok(%cap.fila,1,32)
    iniciar captura
  }
}
alias sbp.cap {
  var %porc $calc(100 * %poke2life / %poke2lifeinicial)
  var %rand $rand(1,100)
  if $istok(pokeball.greatball.ultraball.masterball,$2,46) {
    if $istok($getinfo(itens,$1),$2,32) == $false { nc %chan $1 Você não tem o item $2 | halt }
    if $2 == pokeball { var %chance 50 }
    if $2 == greatball { var %chance 60 }
    if $2 == ultraball { var %chance 70 }
    if $2 == masterball { var %chance 100 }
    if %porc > 20 && $2 != masterball { var %chance $calc( [ %chance ] - 20) }
    if %porc < 10 && $2 != masterball { var %chance $calc( [ %chance ] + 10) }
    msg %chan $sbp.cor2 $+ $1 $sbp.cor1 $+ lançou uma $sbp.cor2 $+ $lower($2) $sbp.cor1 $+ contra $sbp.cor2 $+ %poke2 $+ $sbp.cor1 $+ ...
    msg %chan $pkbr $cor(1) $+ Porcentagem: $cor(3) $+ %porc $x $cor(1) $+ Chance: $cor(3) $+ %chance $x $cor(1) $+ Sorteio: $cor(3) $+ %rand
    if %rand <= %chance { msg %chan $sbp.cor2 $+ %poke2 $sbp.cor1 $+ não está reagindo! | msg %chan $pkbr $cor(1) $+ %sbp.player1 $cor(3) $+ capturou um $cor(1) $+ %poke2 $cor(3) $+ level $cor(1) $+ %poke2level | setinfo pokes $1 $getinfo(pokes,$1) $remove(%poke2,$chr(32)) | setinfo levels $1 $getinfo(levels,$1) %poke2level | setinfo tms $1 $getinfo(tms,$1) no | setinfo hms $1 $getinfo(hms,$1) no }
    else msg %chan $sbp.cor1 $+ A $sbp.cor2 $+ $lower($2) $sbp.cor1 $+ explodiu!
    if $getdiv(%sbp.player1) > 0 { setdiv %sbp.player1 $int($calc($calc($getdiv(%sbp.player1) /(100/2)) + $getdiv(%sbp.player1))) | msg %chan $pkbr %sbp.player1 está devendo $getdiv(%sbp.player1) }
    if $getdiv(%sbp.player2) > 0 { setdiv %sbp.player2 $int($calc($calc($getdiv(%sbp.player2) /(100/2)) + $getdiv(%sbp.player2))) | msg %chan $pkbr %sbp.player2 está devendo $getdiv(%sbp.player2) }
  }
  else { nc %chan $1 $cor(1) $+ $strip($2) $+ ? $cor(3) $+ Digite o nome da bola corretamente. | halt }
  set %cap.fila $deltok(%cap.fila,1,32)
  .timer5 $+ %sbp.player1 1 300 unadv %sbp.player1
  if %sbp.player2 != PkBR { .timer5 $+ %sbp.player2 1 300 unadv %sbp.player2 }
  zerartudo
  var %asdfg 0
  :xloop
  inc %asdfg
  if %modo == fight {
    set %fight.fila $deltok(%fight.fila,1,32)
    set %fight.fila $deltok(%fight.fila,1,32)
  }
  set %modo $iif(%fight.fila,fight,cap)
  if %modo == cap {
    iniciar captura
  }
  if $numtok(%fight.fila,32) >= 2 && %modo == fight {
    msg %chan $pkbr $cor(1) $+ Próxima luta: $cor(3) $+ $gettok(%fight.fila,1,32) $cor(1) $+ Vs $cor(3) $+ $gettok(%fight.fila,2,32)
    var %pode y
    if $gettok(%fight.fila,2,32) !ison %chan && $gettok(%fight.fila,2,32) != PkBR && gym.* !iswm $gettok(%fight.fila,2,32) { var %pode n }
    if $xidentified($gettok(%fight.fila,2,32)) == $false && $gettok(%fight.fila,2,32) != PkBR && gym.* !iswm $gettok(%fight.fila,2,32) { var %pode n }
    if $xidentified($gettok(%fight.fila,1,32)) == $false { var %pode n }
    if $gettok(%fight.fila,1,32) !ison %chan { var %pode n }
    if %pode == n {
      msg %chan $pkbr Um ou mais participantes da luta estão presentes/identificados, luta cancelada.
      goto xloop
    }
    if %fight.fila == $null && %cap.fila == $null { msg %chan $pkbr Todas as filas vazias. | return }
    if %fight.fila == $null { set %modo cap }
    iniciar luta
  }
}
