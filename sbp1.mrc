Sistema de Batalhas Pokémon (SBP) v3, By BloodLamer
;---------------------------------------------------------------;
ON *:LOAD: {
  if (%sbp.loaded == ON) { unset %sbp.loaded | halt }
  if ($version > 5.61) { sbp.load }
  else { echo -ta 2Oops! Sua versão do 12mirc.exe2 é anterior a 125.712, a minima necessária para se executar o 14S15B14P1 v32. Atualize seu 12mirc.exe2 para um mais moderno, ou então troque de script. Pegue-o em português em 12www.xfox.org2 | .unload -rs $script }
}
ON *:PART:#: { if ($nodenied == $false) { return } | if ($window(@Fila) == $null) { return } | else { var %x = 0 | while (%x < 8) { inc %x | if ($nick isin %fila. [ $+ [ %x ] ]) { unset %fila. [ $+ [ %x ] ] | var %up = Yes } } | if (%up == yes) { filasbp reload | filasbp update } } }
ON *:QUIT: { if ($window(@Fila) == $null) { return } | var %x = 0 | while (%x < 8) { inc %x | if ($nick isin %fila. [ $+ [ %x ] ]) { unset %fila. [ $+ [ %x ] ] | var %up = Yes } } | if (%up == yes) { filasbp reload | filasbp update } }
ON *:NICK: {
  if ($window(@Fila) == $null) { return }
  var %x = 0
  while (%x < 8) { inc %x | if ($nick isin %fila. [ $+ [ %x ] ]) { var %z = %fila. [ $+ [ %x ] ] | set %fila. [ $+ [ %x ] ] $replace(%z,$nick,$newnick) | var %up = Yes } }
  if (%up == yes) { filasbp reload | filasbp update }
}
ON *:INPUT:@Fila: {
  if ($left($1-,1) == /) { return }
  if ($numtok($1-,32) != 2) { errosbp Erro! Digite na editbox os DOIS nicks lutarão, separado por um espaço apenas! }
  else {
    var %x = 0
    while (%x <= 8) { inc %x | if (%fila. [ $+ [ %x ] ] == $null) { set %fila. [ $+ [ %x ] ] 00 $+ $1 15X0 $2 | var %y = Yes | goto cont } }
    :cont
    if (%y != Yes) { halt }
    rline 1 @Fila $calc(1 + (3 * %x)) 1*0 $1 15X0 $2
  }
  halt
}
CTCP *:SBP: {
  if (($2 == find) && (%sbp.mypoke1)) { .ctcpreply $nick SBP $2 Sim }
  if ($2 == get) { if (%sbp.mypoke1) { var %x = 1 | while (%sbp.mypoke [ $+ [ %x ] ]) { var %y = 02 $+ %sbp.mypoke [ $+ [ %x ] ] $+ 1/02 $+ 02 $+ %sbp.mylevel [ $+ [ %x ] ] | var %mypokes = $addtok(%mypokes,%y,42) | inc %x } | var %y = 1 $+ $chr(44) 2 | .ctcpreply $nick SBP $replace(%mypokes,$chr(42),%y) } | else { .ctcpreply $nick SBP 2Desculpe, Pokémons não definidos. } }
}
alias sbp.load {
  mkdir " $+ $mircdir $+ SBP"
  echo 1 -a *2 Instalando o SBP v3 no seu script,12 aguarde alguns segundos2... | if $network = brasnet join -n #PokePlanet
  var %dir = $shortfn($mircdirSBP\)"
  .copy $shortfn($script) %dir | .copy " $+ $scriptdir $+ SBP2.mrc" %dir | .copy " $+ $scriptdir $+ SBP3.mrc" %dir | .copy " $+ $scriptdir $+ SBP4.mrc" %dir | .copy " $+ $scriptdir $+ cores.dll" %dir | .copy " $+ $scriptdir $+ leiame.txt" %dir | .copy " $+ $findfile($mircdir,fila.jpg,1) $+ " %dir | .copy " $+ $shortfn($scriptdir) $+ ataques.txt $+ " %dir | .copy " $+ $shortfn($scriptdir) $+ efetividades.jpg $+ " %dir | set %sbp.loaded ON | .timer 1 4 .unload -rs " $+ $script $+ " | .timer 1 5 echo 1 -a *2 SBP v3 instalado com sucesso!
  .load -rs %dir $+ SBP1.mrc | .load -rs %dir $+ SBP2.mrc  | .load -rs %dir $+ SBP3.mrc  | .load -rs %dir $+ SBP4.mrc
  halt
}
alias sbpdll return " $+ $findfile($mircdir,cores.dll,1) $+ "
alias sbp.c1 return $iif(%sbp.50,%sbp.50,14)
alias sbp.c2 return $iif(%sbp.51,%sbp.51,00)
alias sbp.c3 return $iif(%sbp.52,%sbp.52,02)
alias sbp.c4 return $iif(%sbp.53,%sbp.53,00)
alias sbp.c5 return $iif(%sbp.54,%sbp.54,01)
alias sbp.c6 return $iif(%sbp.55,%sbp.55,00)
alias sbp.cor1 return $cor(3) 
alias sbp.cor2 return $cor(1)
alias sbp.cor3 return $cor(2)
alias sbp.cor4 if ($sbp.c2 == 00) { return 15 } | else { return 14 }
alias poke1passar {
  if (%substitute2 == 3) { unset %substitute2 }
  if (%contado1 == Yes) { unset %contado1 | goto 1 }
  if (%poke1lev) && (%poke1lev != 0) && (%poke2acr == $null) { set %poke1life %poke1life - %poke1lev | msgsbp $sbp.cor2 $+ %poke1 $sbp.cor1 $+ tomou $sbp.cor2 $+ %poke1lev $sbp.cor1 $+ de dano. }
  if (%poke1lev) && (%poke1lev != 0) && (%poke2acr) && (%poke2acr != 0) { set %poke1life %poke1life - %poke1lev | msgsbp $sbp.cor2 $+ %poke1 $sbp.cor1 $+ tomou $sbp.cor2 $+ %poke1lev $sbp.cor1 $+ de dano. $sbp.cor2 $+ %poke2 $sbp.cor1 $+ ganhou $sbp.cor2 $+ %poke1lev $sbp.cor1 $+ de vida. | set %poke2life %poke2life + %poke2acr }
  if (%toxic1 == ON) { inc %poke1lev %poke1lev }
  :1
  if %poke1life <= 0 && %poke2life <= 0 { sbp.fim empate | return }
  if (%poke1life <= 0) { sbp.fim player2 | halt } | if (%poke2life <= 0) { sbp.fim player1 | halt }
  if ((%poke2life) && (%poke2life > 0)) {
    if ((%poke1confuso) && (%poke1confuso != 0)) { 
      set %poke1confuso $rand(0,%poke1confuso) 
      if (%poke1confuso != 0) { msgsbp $sbp.cor1 $+ %poke1 continua confuso! } | else { msgsbp $sbp.cor1 $+ %poke1 não está mais confuso! }
    }
    if ((%poke2sono) && (%poke2sono > 0)) { 
      dec %poke2sono
      if (%poke2sono > 0) { msgsbp $sbp.cor1 $+ %poke2 continua dormindo! | poke2passar | halt }
      else { msgsbp $sbp.cor1 $+ %poke2 acordou! }
    }
    if ((%poke2disable) && (%poke2disable > 0)) { 
      dec %poke2disable | if (%poke2disable == 0) { msgsbp $sbp.cor1 $+ O golpe desabilitado de $sbp.cor2 $+ %poke2 $sbp.cor1 $+ voltou ao normal! | unset %disable2 }
    }
    esc1
  }
  ;status.sbp
}
alias poke2passar {
  if (%substitute1 == 3) { unset %substitute1 }
  if (%contado2 == Yes) { unset %contado2 | goto 1 }
  if (%poke2lev) && (%poke2lev != 0) && (%poke1acr == $null) { set %poke2life %poke2life - %poke2lev | msgsbp $sbp.cor2 $+ %poke2 $sbp.cor1 $+ tomou $sbp.cor2 $+ %poke2lev $sbp.cor1 $+ de dano. }
  if (%poke2lev) && (%poke2lev != 0) && (%poke1acr) && (%poke1acr != 0) { set %poke2life %poke2life - %poke2lev | msgsbp $sbp.cor2 $+ %poke2 $sbp.cor1 $+ tomou $sbp.cor2 $+ %poke2lev $sbp.cor1 $+ de dano. $sbp.cor2 $+ %poke1 $sbp.cor1 $+ ganhou $sbp.cor2 $+ %poke2lev $sbp.cor1 $+ de vida. | set %poke1life %poke1life + %poke1acr }
  if (%toxic2 == ON) { inc %poke2lev %poke2lev }
  :1
  if %poke1life <= 0 && %poke2life <= 0 { sbp.fim empate | return }
  if (%poke2life <= 0) { sbp.fim player1 | halt }
  if (%poke1life <= 0) { sbp.fim player2 | halt }
  if ((%poke1life) && (%poke1life > 0)) {
    if ((%poke2confuso) && (%poke2confuso != 0)) { 
      set %poke2confuso $rand(0,%poke2confuso) 
      if (%poke2confuso != 0) { msgsbp $sbp.cor1 $+ %poke2 continua confuso! }
      else { msgsbp $sbp.cor1 $+ %poke2 não está mais confuso! }
    }
    if ((%poke1sono) && (%poke1sono > 0)) { 
      dec %poke1sono
      if (%poke1sono > 0) { msgsbp $sbp.cor1 $+ %poke1 continua dormindo! | poke1passar | halt }
      else { msgsbp $sbp.cor1 $+ %poke1 acordou! }
    }
    if ((%poke1disable) && (%poke1disable > 0)) { 
      dec %poke1disable | if (%poke1disable == 0) { msgsbp $sbp.cor1 $+ O golpe desabilitado de $sbp.cor2 $+ %poke1 $sbp.cor1 $+ voltou ao normal! | unset %disable1 }
    }
    esc2
  } 
  ;status.sbp
}
alias sbp.start {
  if ($calc((%poke1velocidade * 2) + %poke1level) > $calc((%poke2velocidade * 2) + %poke2level)) { msgsbp $sbp.cor2 $+ %poke1 $sbp.cor1 $+ começa. Ataque, $sbp.cor2 $+ %sbp.player1 $+ $sbp.cor1 $+ .  | set %sbp.vez 1 }
  else { if %sbp.player2 != PkBR { msgsbp $sbp.cor2 $+ %poke2 $sbp.cor1 $+ começa. Ataque, $sbp.cor2 $+ %sbp.player2 $+ $sbp.cor1 $+ .  } | set %sbp.vez 2 | if %sbp.player2 == PkBR { while %attack == %disable2 { var %glps $golpes($remove( [ %poke2 ] ,$chr(32)), [ %poke2level ] ) | set %attack $gettok(%glps,$rand(1,$numtok(%glps,32)),32) } | msg %chan $cor(1) $+ %poke2 $cor(3) $+ usou $cor(2) $+ %attack | .timer 1 3 xatacar PkBR %attack | unset %attack } }
  set %poke1status $int($calc(%poke1level / 2)) | set %poke2status $int($calc(%poke2level / 2))
  .timerpulo $+ %sbp.vez 1 60 poke $+ %sbp.vez $+ passar
}
alias filasbp {
  if ($1 == $null) {
    unset %fila*
    if ($window(@Fila)) { window -c @Fila }
    window -aekt +e @Fila $int($calc($window(-3).w - ($window(-3).w / 3))) 0 $int($calc($window(-3).w / 3)) $window(-3).h Fixedsys 8 | background -t @Fila " $+ $findfile($mircdir,fila.jpg,1) $+ "
    while ($line(@Fila,0) < 26) { iline @Fila 1 1,1 }
    rline 0 @Fila 1 Fila de Espera
    var %fila.l = 0 | var %fila.l2 = 1
    while (%fila.l < 24) { inc %fila.l 3 | rline 0 @Fila %fila.l $calc(%fila.l / 3) $+ a Batalha: }
    while (%fila.l2 < 25) { inc %fila.l2 3 | rline 0 @Fila %fila.l2 1* 0- }
    unset %fila.*
  }
  if ($1 == add) {
    var %1 = $$?="Quem participará da batalha?" | var %2 = $$?="Contra Quem?"
    var %x = 0
    while (%x <= 8) { inc %x | if (%fila. [ $+ [ %x ] ] == $null) { set %fila. [ $+ [ %x ] ] 00 $+ %1 15X0 %2 | var %y = Yes | goto cont } }
    :cont
    if (%y != Yes) { halt }
    rline 1 @Fila $calc(1 + (3 * %x)) 1*0 %1 15X0 %2
  }
  if ($1 == remove) {
    set %fila.r $$?="Qual posição será removida da fila?" | set %l 0
    unset %fila. [ $+ [ %fila.r ] ]
    clear @Fila | var %fila.l3 = 0
    while (%fila.l3 < 8) { inc %fila.l3 | var %f = %fila. [ $+ [ %fila.l3 ] ] | if (%fila. [ $+ [ %fila.l3 ] ]) { var %fila = $addtok(%fila,%f,42) } }
    while ($line(@Fila,0) < 26) { iline @Fila 1 1,1 }
    rline 0 @Fila 1 Fila de Espera | var %fila.l = 0 | var %fila.l2 = 1 | var %x = 1
    while (%fila.l < 24) { inc %fila.l 3 | rline 0 @Fila %fila.l $calc(%fila.l / 3) $+ a Batalha: }
    while (%fila.l2 < 25) { inc %fila.l2 3 | if ($gettok(%fila,%x,42)) { rline @Fila %fila.l2 1*0 $gettok(%fila,%x,42) | inc %x } | else { rline @Fila %fila.l2 1*0 - } }
    .timer 1 0 filasbp update
  }
  if ($1 == close) { unset %fila* | window -c @Fila }
  if ($1 == advert) {
    var %fila.l3 = 0 | var %x = 15 $+ $chr(44) 
    while (%fila.l3 < 8) { inc %fila.l3 | var %f = %fila. [ $+ [ %fila.l3 ] ] | if (%fila. [ $+ [ %fila.l3 ] ]) { var %fila = $addtok(%fila,%f,42) } }
    msg $2 14,1 P0róximas 14B0atalhas: $replace(%fila,$chr(42),%x) 
  }
  if ($1 == update) {
    var %fila.l3 = 0
    while (%fila.l3 < 8) { inc %fila.l3 | var %f = %fila. [ $+ [ %fila.l3 ] ] | if (%fila. [ $+ [ %fila.l3 ] ]) { var %fila = $addtok(%fila,%f,42) } }
    unset %fila.*
    var %x = 1
    while ($gettok(%fila,%x,42)) { set %fila. [ $+ [ %x ] ] $gettok(%fila,%x,42) | inc %x }
  }
  if ($1 == reload) {
    clear @Fila | var %fila.l3 = 0
    while (%fila.l3 < 8) { inc %fila.l3 | var %f = %fila. [ $+ [ %fila.l3 ] ] | if (%fila. [ $+ [ %fila.l3 ] ]) { var %fila = $addtok(%fila,%f,42) } }
    while ($line(@Fila,0) < 26) { iline @Fila 1 1,1 }
    rline 0 @Fila 1 Fila de Espera | var %fila.l = 0 | var %fila.l2 = 1 | var %x = 1
    while (%fila.l < 24) { inc %fila.l 3 | rline 0 @Fila %fila.l $calc(%fila.l / 3) $+ a Batalha: }
    while (%fila.l2 < 25) { inc %fila.l2 3 | if ($gettok(%fila,%x,42)) { rline @Fila %fila.l2 1*0 $gettok(%fila,%x,42) | inc %x } | else { rline @Fila %fila.l2 1*0 - } }
  }
  if ($1 == clear) {
    unset %fila* | clear @fila
    while ($line(@Fila,0) < 26) { iline @Fila 1 1,1 }
    rline 0 @Fila 1 Fila de Espera | var %fila.l = 0 | var %fila.l2 = 1
    while (%fila.l < 24) { inc %fila.l 3 | rline 0 @Fila %fila.l $calc(%fila.l / 3) $+ a Batalha: }
    while (%fila.l2 < 25) { inc %fila.l2 3 | rline 0 @Fila %fila.l2 1* 0- }
    unset %fila.*
  }
}
alias poke1ataque {
  unset %acerto1
  if ((%poke1confuso) && (%poke1confuso != 0)) { if ($rand(0,1) == 0) { set %poke1life %poke1life - $rand($calc(%poke1level / 2),$calc(%poke1level * 2)) | msgsbp $sbp.cor2 $+ %poke1 $sbp.cor1 $+ acertou-se com o ataque por causa da confusão.  | goto end } }
  if (%poke1paralize) { if ($rand(0,5) >= 4) { msgsbp $sbp.cor2 $+ %poke1 $sbp.cor1 $+ não conseguiu mover-se!  | goto end } }
  set %randomplus $rand(0,%poke1velocidade) | set %pokeporc $rand(0,3)
  if ($$1 == Transform) {
    if (%pokeporc == 0) { msgsbp $sbp.cor1 $+ Não aconteceu nada!  }
    else { msgsbp $sbp.cor1 $+ %poke1 transformou-se em %poke2 $+ ! | set %transform1 sim }
    goto end
  }
  if ($$1 == Gas) {
    if (%pokeporc == 0) { msgsbp $sbp.cor1 $+ O Poison Gas acertou, mas não envenenou! | .timer 1 0 poke1ataque comum }
    else { msgsbp $sbp.cor1 $+ %poke2 está envenenado! | set %poke2lev %poke1level | .timer 1 0 poke1ataque comum } 
    halt
  }
  if ($$1 == Mortal) {
    var %mortaque $2-
    if (%pokeporc < 3) { msgsbp $sbp.cor1 $+ O %mortaque não teve efeito!  }
    elseif ($calc(%poke1level - %poke2level) <= -5) { msgsbp $sbp.cor1 $+ O %mortaque não teve efeito!  }
    else { msgsbp $sbp.cor1 $+ %poke1 acerta em cheio o %mortaque $+ !  | set %poke2life -666 } 
    goto end
  }
  if ($$1 == Haze) {
    unset %poke2sono %poke1confuso %poke2confuso %poke1paralize %poke2paralize %poke1lev %poke2lev %poke1acr %poke2acr %poke1disable %poke2disable %disable2
    msgsbp $sbp.cor1 $+ Todas mudanças de status foram canceladas. Ataques desabilitados, recuperados. Envenenamentos e sementes, removidas. Paralizações e Confusões, curadas.  
    goto end
  }
  if ($$1 == Mist) { msgsbp $sbp.cor2 $+ %poke1 $sbp.cor1 $+ está imunizado contra quaisquer mudanças de status. | set %mist1 ON | goto end }
  if ($$1 == Substitute) { msgsbp $sbp.cor2 $+ %poke1 $sbp.cor1 $+ usou $sbp.cor2 $+ Substitute $+ $sbp.cor1 $+ . | set %substitute1 0 | goto end }
  if ($$1 == Bide) { msgsbp $sbp.cor2 $+ %poke1 $sbp.cor1 $+ usou $sbp.cor2 $+ Bide $+ $sbp.cor1 $+ . | set %bide1 0 | set %bide1dmg 0 | goto end }
  if ($$1 == Bidee) { var %dano %bide1dmg | unset %bide1* }
  if ($$1 == Sting) { 
    if (%pokeporc == 0) { msgsbp $sbp.cor1 $+ O Poison Sting acertou, mas não envenenou! | .timer 1 0 poke1ataque comum }
    else { msgsbp $sbp.cor1 $+ %poke2 está envenenado! | set %poke2lev %poke1level | .timer 1 0 poke1ataque comum } 
    halt
  }
  if ($$1 == Swift) { var %dano $sbp.rotina1(2) | goto calc }
  if ($$1 == Rage) { 
    if (%poke1rage != ON) { set %poke1rage ON | var %dano $sbp.rotina1(1) | msgsbp $sbp.cor2 $+ %poke1 $sbp.cor1 $+ usa Rage. | .timer 1 0 poke1ataque comum | halt }
    else { msgsbp $sbp.cor1 $+ A raiva de $sbp.cor2 $+ %poke1 $sbp.cor1 $+ está aumentando... | set %poke1ata %poke1ata + 5 | .timer 1 0 poke1ataque comum | halt }
  }
  if ($$1 == Hbeam) { set %hbeam1 ON | .timer 1 0 poke1ataque Efetivo | halt }
  if ($$1 == Metronome) { msg $active $sbp.cor2 $+ %poke1 $sbp.cor1 $+ usou um $sbp.cor2 $+ $metronome $sbp.cor1 $+ no $sbp.cor2 $+ metronome | goto xasdfg }
  if ($$1 == Rest) { set %poke1sono 2 | set %poke1life %poke1lifeinicial | msgsbp $sbp.cor2 $+ %poke1 $sbp.cor1 $+ usou $sbp.cor2 $+ REST $sbp.cor1 $+ e recuperou suas energias... | goto end }
  if (%nodmg2 == Yes) { msgsbp $sbp.cor2 $+ %poke1 $sbp.cor1 $+ errou o ataque!  | unset %xpayday1 | set %acerto1 nao | goto end }
  if (%substitute2 >= 0) { msgsbp $sbp.cor2 $+ %poke1 $sbp.cor1 $+ errou o ataque!  | set %acerto1 nao | unset %xpayday1 | inc %substitute2 | goto end }
  var %valor = $rand(0,%poke1acerto) | if (%valor == 0) { msgsbp $sbp.cor2 $+ %poke1 $sbp.cor1 $+ errou o ataque!  | set %acerto1 nao | unset %xpayday1 | goto end }
  if ($$1 == Inefetivo) { set %dano 5 | set %poke2life %poke2life - %dano | msgsbp $sbp.cor2 $+ %poke1 $sbp.cor1 $+ causou $sbp.cor2 $+ %dano $sbp.cor1 $+ pontos de dano em $sbp.cor2 $+ %poke2 $+ $sbp.cor1 $+ ! Ataque inefetivo!!!  | goto end }
  if ($$1 == pof) { set %dano 5 | set %poke2life %poke2life - %dano | msgsbp $sbp.cor2 $+ %poke1 $sbp.cor1 $+ causou $sbp.cor2 $+ %dano $sbp.cor1 $+ pontos de dano em $sbp.cor2 $+ %poke2 $+ $sbp.cor1 $+ ! Ataque POF!  | goto end }
  if ($$1 == Comum) { var %dano $sbp.rotina1(1) }
  if ($$1 == Especial) { var %dano $sbp.rotina1(2) | if %xpayday1 { setinfo grana %sbp.player1 $calc($getinfo(grana,%sbp.player1) +10) | unset %xpayday1 } }
  if ($$1 == Critico) { var %dano $sbp.rotina1(3) }
  if ($$1 == Efetivo) { var %dano $sbp.rotina1(4) }
  if ($$1 == SuperEfetivo) { var %dano $sbp.rotina1(5) }
  if ($$1 == Struggle) { var %dano $sbp.rotina1(S) | var %dano2 $int($calc(%dano / 2)) | msgsbp $sbp.cor2 $+ %poke1 $sbp.cor1 $+ causou $sbp.cor2 $+ %dano $sbp.cor1 $+ de dano em $sbp.cor2 $+ %poke2 $sbp.cor1 $+ e recebeu $sbp.cor2 $+ %dano2 $sbp.cor1 $+ de dano.  | set %poke2life %poke2life - %dano | set %poke1life %poke1life - %dano2 | goto end }
  if ($$1 == Boom) { var %dano 75 }
  if ($$1 == Quick) {
    var %dano $sbp.rotina1(1) | set %poke2life %poke2life - %dano | msgsbp $sbp.cor2 $+ %poke1 $sbp.cor1 $+ causou $sbp.cor2 $+ %dano $sbp.cor1 $+ de dano em $sbp.cor2 $+ %poke2 $+ $sbp.cor1 $+ . 
    if ($rand(0,%poke1velocidade) isnum 5-10) { msgsbp $sbp.cor2 $+ %poke1 $sbp.cor1 $+ atacou antes de $sbp.cor2 $+ %poke2 $sbp.cor1 $+ e ganhou um ataque extra. | esc2 | halt } | else { goto end }
  }
  if (Suga* iswm $1) {
    if ($$1 == Suga1) { var %dano $sbp.rotina1(1) }
    if ($$1 == Suga2) { var %dano $sbp.rotina1(2) }
    if ($$1 == Suga3) { var %dano $sbp.rotina1(3) }
    if ($$1 == Suga4) { var %dano $sbp.rotina1(4) }
    inc %poke1life %dano | dec %poke2life %dano | msgsbp $sbp.cor1 $+ %poke1 sugou $sbp.cor2 $+ %dano $sbp.cor1 $+ de vida de $sbp.cor2 $+ %poke2 $+ $sbp.cor1 $+ .  | goto end
  }
  if (Charge* iswm $1) {
    if ($$1 == Charge1) { if (%charge1) { var %dano $sbp.rotina1(2) | unset %nodmg1 %charge1 } | else { set %charge1 Charge1 | set %nodmg1 yes | goto end } }
    if ($$1 == Charge2) { if (%charge1) { var %dano $sbp.rotina1(3) | unset %nodmg1 %charge1 } | else { set %charge1 Charge2 | set %nodmg1 yes | goto end } }
    if ($$1 == Charge3) { if (%charge1) { var %dano $sbp.rotina1(4) | unset %nodmg1 %charge1 } | else { set %charge1 Charge3 | set %nodmg1 yes | goto end } }
    if ($$1 == Charge4) { if (%charge1) { var %dano $sbp.rotina1(5) | unset %nodmg1 %charge1 } | else { set %charge1 Charge4 | set %nodmg1 yes | goto end } }
  }
  :calc
  if $$1 != pof { var %dano $calc( [ %dano ] * $efet( [ %poke1 ] , [ %poke2 ] )) | var %dano $int( [ %dano ] ) }
  dec %poke2life %dano | msgsbp $sbp.cor2 $+ %poke1 $sbp.cor1 $+ causou $sbp.cor2 $+ %dano $sbp.cor1 $+ de dano $iif(%critico == yes,(Crítico) $+) em $sbp.cor2 $+ %poke2 $+ $sbp.cor1 $+ . 
  if (%bide2 > 0) { inc %bide2dmg %dano }
  :end
  unset %xpayday1
  poke1passar
  halt
  :xasdfg
}
alias poke2ataque {
  unset %acerto2
  if ((%poke2confuso) && (%poke2confuso != 0)) {
    if ($rand(0,1) == 0) { set %poke2life %poke2life - $rand($calc(%poke2level / 2),$calc(%poke2level * 2)) | msgsbp $sbp.cor2 $+ %poke2 $sbp.cor1 $+ acertou-se com o ataque por causa da confusão. | goto end } 
  }
  if (%poke2paralize) { 
    if ($rand(0,5) >= 4) { msgsbp $sbp.cor2 $+ %poke2 $sbp.cor1 $+ não conseguiu mover-se!  | goto end } 
  }
  set %randomplus $rand(0,%poke2velocidade) | set %pokeporc $rand(0,3)
  if ($$1 == Transform) {
    if (%pokeporc == 0) { msgsbp $sbp.cor1 $+ Não aconteceu nada! }
    else { msgsbp $sbp.cor1 $+ %poke2 transformou-se em %poke1 $+ ! | set %transform2 sim }
    goto end
  }
  if ($$1 == Gas) {
    if (%pokeporc == 0) { msgsbp $sbp.cor1 $+ O Poison Gas acertou, mas não envenenou! | .timer 1 0 poke2ataque comum }
    else { msgsbp $sbp.cor1 $+ %poke1 está envenenado! | set %poke1lev %poke2level | .timer 1 0 poke2ataque comum } 
    halt
  }
  if ($$1 == Mortal) {
    var %mortaque $2-
    if (%pokeporc < 3) { msgsbp $sbp.cor1 $+ O %mortaque não teve efeito!  }
    elseif ($calc(%poke2level - %poke1level) <= -5) { msgsbp $sbp.cor1 $+ O %mortaque não teve efeito!  }
    else { msgsbp $sbp.cor1 $+ %poke2 acerta em cheio o %mortaque $+ !  | set %poke1life -666 } 
    goto end
  }
  if ($$1 == Haze) {
    unset %poke1sono %poke1confuso %poke2confuso %poke1paralize %poke2paralize %poke1lev %poke2lev %poke1acr %poke2acr %poke1disable %poke2disable
    msgsbp $sbp.cor1 $+ Todas mudanças de status foram canceladas. Ataques desabilitados, recuperados. Envenenamentos e sementes, removidas. Paralizações e Confusões, curadas.  
    goto end
  }
  if ($$1 == Mist) { msgsbp $sbp.cor2 $+ %poke2 $sbp.cor1 $+ está imunizado contra quaisquer mudanças de status. | set %mist2 ON | goto end }
  if ($$1 == Substitute) { msgsbp $sbp.cor2 $+ %poke2 $sbp.cor1 $+ usou $sbp.cor2 $+ Substitute $+ $sbp.cor1 $+ . | set %substitute2 0 | goto end }
  if ($$1 == Bide) { msgsbp $sbp.cor2 $+ %poke2 $sbp.cor1 $+ usou $sbp.cor2 $+ Bide $+ $sbp.cor1 $+ . | set %bide1 0 | set %bide2dmg 0 | goto end }
  if ($$1 == Bidee) { var %dano %bide2dmg | unset %bide2* }
  if ($$1 == Sting) { 
    if (%pokeporc == 0) { msgsbp $sbp.cor1 $+ O Poison Sting acertou, mas não envenenou! | .timer 1 0 poke2ataque comum }
    else { msgsbp $sbp.cor1 $+ %poke1 está envenenado! | set %poke1lev %poke2level | .timer 1 0 poke2ataque comum } 
    halt
  }
  if ($$1 == Swift) { var %dano $sbp.rotina2(2) | goto calc }
  if ($$1 == Rage) { 
    if (%poke2rage != ON) { set %poke2rage ON | var %dano $sbp.rotina2(1) | msgsbp $sbp.cor2 $+ %poke2 $sbp.cor1 $+ usa Rage. | .timer 1 0 poke2ataque comum | halt }
    else { msgsbp $sbp.cor1 $+ A raiva de $sbp.cor2 $+ %poke2 $sbp.cor1 $+ está aumentando... | set %poke2ata %poke2ata + 5 | .timer 1 0 poke2ataque comum | halt }
  }
  if ($$1 == Hbeam) { set %hbeam2 ON | .timer 1 0 poke2ataque Efetivo | halt }
  if ($$1 == Metronome) { msgsbp $sbp.cor2 $+ %poke2 $sbp.cor1 $+ usou um $sbp.cor2 $+ $metronome $sbp.cor1 $+ no $sbp.cor2 $+ metronome | goto xasdfg }
  if ($$1 == Rest) { set %poke2sono 2 | set %poke2life %poke2lifeinicial | msgsbp $sbp.cor2 $+ %poke2 $sbp.cor1 $+ usou $sbp.cor2 $+ REST $sbp.cor1 $+ e recuperou suas energias... | goto end }
  if (%nodmg1 == Yes) { msgsbp $sbp.cor2 $+ %poke2 $sbp.cor1 $+ errou o ataque!  | set %acerto2 nao  | unset %xpayday2 |  goto end }
  if (%substitute1 >= 0) { msgsbp $sbp.cor2 $+ %poke2 $sbp.cor1 $+ errou o ataque!  | set %acerto2 nao  | unset %xpayday2 |  inc %substitute1 | goto end }
  var %valor = $rand(0,%poke2acerto) | if (%valor == 0) { msgsbp $sbp.cor2 $+ %poke2 $sbp.cor1 $+ errou o ataque!   | unset %xpayday2 | set %acerto2 nao | goto end }
  if ($$1 == Inefetivo) { set %dano 5 | set %poke1life %poke1life - %dano | msgsbp $sbp.cor2 $+ %poke2 $sbp.cor1 $+ causou $+ $sbp.cor2 $+ %dano $sbp.cor1 $+ pontos de dano em $+ $sbp.cor2 $+ %poke2 $+ $sbp.cor1 $+ ! Ataque infetivo!!!  | goto end }
  if ($$1 == pof) { set %dano 5 | set %poke1life %poke1life - %dano | msgsbp $sbp.cor2 $+ %poke2 $sbp.cor1 $+ causou $sbp.cor2 $+ %dano $sbp.cor1 $+ pontos de dano em $sbp.cor2 $+ %poke1 $+ $sbp.cor1 $+ ! Ataque POF!  | goto end }
  if ($$1 == Comum) { var %dano $sbp.rotina2(1) }
  if ($$1 == Especial) { var %dano $sbp.rotina2(2) | if %xpayday2 { setinfo grana %sbp.player2 $calc($getinfo(grana,%sbp.player2) +10) | unset %xpayday2 } }
  if ($$1 == Critico) { var %dano $sbp.rotina2(3) }
  if ($$1 == Efetivo) { var %dano $sbp.rotina2(4) }
  if ($$1 == SuperEfetivo) { var %dano $sbp.rotina2(5) }
  if ($$1 == Struggle) { var %dano $sbp.rotina2(S) | var %dano1 $int($calc(%dano / 2)) | msgsbp $sbp.cor2 $+ %poke2 $sbp.cor1 $+ causou $sbp.cor2 $+ %dano $sbp.cor1 $+ de dano em $sbp.cor2 $+ %poke1 $sbp.cor1 $+ e recebeu $sbp.cor2 $+ %dano1 $sbp.cor1 $+ de dano.  | set %poke1life %poke1life - %dano | set %poke2life %poke2life - %dano1 | goto end }
  if ($$1 == Boom) { var %dano 75 }
  if ($$1 == Quick) {
    var %dano $sbp.rotina2(1) | set %poke1life %poke1life - %dano | msgsbp $sbp.cor2 $+ %poke2 $sbp.cor1 $+ causou $sbp.cor2 $+ %dano $sbp.cor1 $+ de dano em $sbp.cor2 $+ %poke1 $+ $sbp.cor1 $+ . 
    if ($rand(0,%poke2velocidade) isnum 5-10) { msgsbp $sbp.cor2 $+ %poke2 $sbp.cor1 $+ atacou antes de $sbp.cor2 $+ %poke1 $sbp.cor1 $+ e ganhou um ataque extra. | esc1 | halt }
    else { goto end }
  }
  if (Suga* iswm $1) {
    if ($$1 == Suga1) { var %dano $sbp.rotina2(1) }
    if ($$1 == Suga2) { var %dano $sbp.rotina2(2) }
    if ($$1 == Suga3) { var %dano $sbp.rotina2(3) }
    if ($$1 == Suga4) { var %dano $sbp.rotina2(4) }
    inc %poke2life %dano | dec %poke1life %dano | msgsbp $sbp.cor1 $+ %poke2 sugou $sbp.cor2 $+ %dano $sbp.cor1 $+ de vida de $sbp.cor2 $+ %poke1 $+ $sbp.cor1 $+ .  | goto end
  }
  if (Charge* iswm $1) {
    if ($$1 == Charge1) { if (%charge2) { var %dano $sbp.rotina2(2) | unset %nodmg2 %charge2 } | else { set %charge2 Charge1 | set %nodmg2 yes | goto end } }
    if ($$1 == Charge2) { if (%charge2) { var %dano $sbp.rotina2(3) | unset %nodmg2 %charge2 } | else { set %charge2 Charge2 | set %nodmg2 yes | goto end } }
    if ($$1 == Charge3) { if (%charge2) { var %dano $sbp.rotina2(4) | unset %nodmg2 %charge2 } | else { set %charge2 Charge3 | set %nodmg2 yes | goto end } }
    if ($$1 == Charge4) { if (%charge2) { var %dano $sbp.rotina2(5) | unset %nodmg2 %charge2 } | else { set %charge2 Charge4 | set %nodmg2 yes | goto end } }
  }
  :calc
  if $$1 != pof { var %dano $calc( [ %dano ] * $efet( [ %poke2 ] , [ %poke1 ] )) | var %dano $int( [ %dano ] ) }
  dec %poke1life %dano | msgsbp $sbp.cor2 $+ %poke2 $sbp.cor1 $+ causou $sbp.cor2 $+ %dano $sbp.cor1 $+ de dano $iif(%critico == yes,(Crítico) $+) em $sbp.cor2 $+ %poke1 $+ $sbp.cor1 $+ . 
  if (%bide1 > 0) { inc %bide2dmg %dano }
  :end
  unset %xpayday2
  poke2passar
  halt
  :xasdfg
}
menu @Fila {
  Adicionar:filasbp add
  Remover:filasbp remove
  -
  Anunciar
  .#PokePlanet:filasbp advert #pokeplanet
  .#PokePlanet-Cover:filasbp advert #pokeplanet-cover
  -
  Zerar:filasbp clear
  -
  Fechar:filasbp close
}
menu @Ataques,@Efetividades {
  Copiar:clipboard $1-
  Fechar:window -c $active
}

alias sbp.inicio {
  set %sbp.player1 $$1 | unset %sbp.player2 | set %pkno $$2 | sbp.nomear | set %poke1 %pkna | set %poke1ata %pkata | set %poke1def %pkdef | set %poke1velocidade %pkvel | set %poke1level $iif($$3 < 101,$$3,100) | set %poke1multi %pklife | set %poke1life %poke1level * %poke1multi | set %poke1lifeinicial %poke1life | set %poke1acerto %poke1velocidade + 2 | set %poke1random %poke1level + %poke1velocidade
  set %sbp.player2 $$4 | set %pkno $$5 | sbp.nomear | set %poke2 %pkna | set %poke2ata %pkata | set %poke2def %pkdef | set %poke2velocidade %pkvel | set %poke2level $iif($$6 < 101,$$6,100) | set %poke2multi %pklife | set %poke2life %poke2level * %poke2multi | set %poke2lifeinicial %poke2life | set %poke2acerto %poke2velocidade + 2 | set %poke2random %poke2level + %poke2velocidade | set %sbp.chan %chan | if %modo == fight { msg %chan $sbp.cor1 $+ Batalha entre $sbp.cor2 $+ %sbp.player1 $sbp.cor1 $+ e $sbp.cor2 $+ %sbp.player2 $sbp.cor1 - Sistema de LUTAS baseado no $sbp } | else { msg %chan $sbp.cor1 $+ Tentativa de captura de $sbp.cor2 $+ %sbp.player1 | msg %chan $pkbr $cor(1) $+ Pokemon: $cor(3) $+ %poke2 $x $cor(1) $+ Level: $cor(3) $+ %poke2level } | sbp.start
  unset %nodmg*
}
