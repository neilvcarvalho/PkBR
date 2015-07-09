alias msgsbp msg %chan $iif($sbp.c2 == 01,$sbp.cor1 $replace($1-,$chr(46), $+ $sbp.c2 $+ $chr(46)) $sbp.cor1,$1-)
alias zerartudo { unset %sbp.player* %poke* %sbeam* %mortaque %sbp.chan %valor %dif %dano %randomplus %hbeam* %mist* %razor* %pk* %contado* %stopq %recebe* %leva* %charge* %nodmg* %toxic* %payday* %transform* | unset %perder? %skbash* %tipo* %ataque* %tm* %disable* %sbp.* %dado? %attack %ataques? %acerto? | .timerpulo? off }
alias poke1status {
  if (%mist1) && (Disable !isin $$1) && (Recover !isin $$1) && (+ !isin $$1) { msgsbp $sbp.cor1 $+ O golpe não teve efeito!  | poke2passar | halt }
  var %pokeporc = $rand(0,%poke2acerto)
  if (%pokeporc == 0) { msgsbp $sbp.cor1 $+ Não aconteceu nada! | goto end }
  if ($$1 == Seed) { msgsbp $sbp.cor1 $+ Uma semente foi plantada em %poke1 $+ ! | set %poke1lev %poke2status | set %poke2acr %poke2status } 
  if ($$1 == Poison) { msgsbp $sbp.cor1 $+ %poke1 está envenenado! | set %poke1lev %poke2status }
  if ($$1 == Toxic) { msgsbp $sbp.cor2 $+ %poke1 $sbp.cor1 $+ foi envenenado pelo $sbp.cor2 $+ Toxic $+ $sbp.cor1 $+ ! | set %poke1lev $int($calc(%poke2status / 5)) | set %toxic1 ON }
  if ($$1 == Sono) { set %poke1sono $rand(2,5) | msgsbp $sbp.cor1 $+ %poke1 dormindo! } 
  if ($$1 == Paralizar) { msgsbp $sbp.cor1 $+ %poke1 paralisado! | set %poke1paralize ON }
  if ($$1 == Confundir) {
    set %poke1confuso $rand(0,4)
    if (%poke1confuso == 0) { msgsbp $sbp.cor1 $+ Não aconteceu nada! }
    else { msgsbp $sbp.cor1 $+ %poke1 confuso! } 
  }
  if ($$1 == Disable) { if (%pokeporc == 0) { msgsbp $sbp.cor1 $+ Não aconteceu nada! } | else { set %dadof $numtok($golpes($remove(%poke1,$chr(32)),%poke1level),32) | set %dador $rand(1,%dadof) | set %golpe $gettok($golpes(%poke1,%poke1level),%dador,32) | msgsbp $sbp.cor1 $+ %poke1 teve o golpe %golpe desabilitado! | set %disable1 %golpe | set %poke1disable $rand(1,5) } }
  if ($$1 == def-) { 
    if (%poke1def > 0) { set %poke1def %poke1def - 5 | msgsbp $sbp.cor1 $+ A defesa de $sbp.cor2 $+ %Poke1 $sbp.cor1 $+ diminuiu! }
    else { msgsbp $sbp.cor1 $+ Não aconteceu nada! }
    if (%poke1def < 0) { set %poke1def 0 }
  }
  if ($$1 == def+) {
    if (%poke1def < 30) { set %poke1def %poke1def + 5 | msgsbp $sbp.cor1 $+ A defesa de %Poke1 aumentou! }
    else { msgsbp $sbp.cor1 $+ Não aconteceu nada! } 
    if (%poke1def > 30) { set %poke1def 30 }
  }
  if ($$1 == ata-) {
    if (%poke1ata > 0) { set %poke1ata %poke1ata - 5 | msgsbp $sbp.cor1 $+ O ataque de %Poke1 diminuiu! }
    else { msgsbp $sbp.cor1 $+ Não aconteceu nada! } 
    if (%poke1ata < 0) { set %poke1ata 0 }
  }
  if ($$1 == ata+) {
    if (%poke1ata <= 30) { inc %poke1ata 5 | msgsbp $sbp.cor1 $+ O ataque de %Poke1 aumentou! }
    else { msgsbp $sbp.cor1 $+ Não aconteceu nada! } 
    if (%poke1ata > 30) { set %poke1ata 30 }
  }
  if ($$1 == vel-) {
    if (%poke1velocidade >= 0) { dec %poke1velocidade 3 | msgsbp $sbp.cor1 $+ A velocidade de %Poke1 diminuiu! }
    else { msgsbp $sbp.cor1 $+ Não aconteceu nada! }
    if (%poke1velocidade < 0) { set %poke1velocidade 0 }
  }
  if ($$1 == vel+) {
    if (%poke1velocidade <= 12) { inc %poke1velocidade 3 | msgsbp $sbp.cor1 $+ A velocidade de %Poke1 aumentou! }
    else { msgsbp $sbp.cor1 $+ Não aconteceu nada! } 
    if (%poke1velocidade > 12) { set %poke1velocidade 12 }
  }
  if ($$1 == acerto-) {
    if (%poke1acerto >= 4) { set %poke1acerto %poke1acerto - 2 | msgsbp $sbp.cor1 $+ A precisão de %poke1 piorou! }
    else { msgsbp $sbp.cor1 $+ Não aconteceu nada! } 
  }
  if ($$1 == Recover) { set %poke1life %poke1life + $int($calc(%poke1lifeinicial / 2)) | msgsbp $sbp.cor1 $+ %poke1 usou $sbp.cor2 $+ RECOVER $sbp.cor1 $+ e recuperou suas energias.  }
  :end
  if (+ isin $$1) || (recover isin $$1) poke1passar
  else { poke2passar }
}
alias poke2status {
  if ((%mist2) && (Disable !isin $$1) && (Recover !isin $$1) && (+ !isin $$1)) { msgsbp $sbp.cor1 $+ O golpe não teve efeito!  | poke1passar | halt }
  var %pokeporc = $rand(0,%poke2acerto)
  if (%pokeporc == 0) { msgsbp $sbp.cor1 $+ Não aconteceu nada! | goto end }
  if ($$1 == Seed) { msgsbp $sbp.cor1 $+ Uma semente foi plantada em %poke2 $+ ! | set %poke2lev %poke1status | set %poke1acr %poke1status } 
  if ($$1 == Poison) { msgsbp $sbp.cor1 $+ %poke2 está envenenado! | set %poke2lev %poke1status }
  if ($$1 == Toxic) { msgsbp $sbp.cor2 $+ %poke2 $sbp.cor1 $+ foi envenenado pelo $sbp.cor2 $+ Toxic $+ $sbp.cor1 $+ ! | set %poke2lev $int($calc(%poke1status / 5)) | set %toxic2 ON }
  if ($$1 == Sono) { set %poke2sono $rand(2,5) | msgsbp $sbp.cor1 $+ %poke2 dormindo! } 
  if ($$1 == Paralizar) { msgsbp $sbp.cor1 $+ %poke2 paralisado! | set %poke2paralize ON }
  if ($$1 == Confundir) {
    set %poke2confuso $rand(0,4)
    if (%poke2confuso == 0) { msgsbp $sbp.cor1 $+ Não aconteceu nada! }
    else { msgsbp $sbp.cor1 $+ %poke2 confuso! } 
  }
  if ($$1 == Disable) {
    if (%pokeporc == 0) { msgsbp $sbp.cor1 $+ Não aconteceu nada! }
    else { set %dadof $numtok($golpes($remove(%poke2,$chr(32)),%poke2level),32) | set %dador $rand(1,%dadof) | set %golpe $gettok($golpes(%poke2,%poke2level),%dador,32) | msgsbp $sbp.cor1 $+ %poke2 teve o golpe %golpe desabilitado! | set %disable2 %golpe | set %poke2disable $rand(1,5) } 
  }
  if ($$1 == def-) { 
    if (%poke2def > 0) { set %poke2def %poke2def - 5 | msgsbp $sbp.cor1 $+ A defesa de $sbp.cor2 $+ %Poke2 $sbp.cor1 $+ diminuiu! }
    else { msgsbp $sbp.cor1 $+ Não aconteceu nada! }
    if (%poke2def < 0) { set %poke2def 0 }
  }
  if ($$1 == def+) {
    if (%poke2def < 30) { set %poke2def %poke2def + 5 | msgsbp $sbp.cor1 $+ A defesa de %Poke2 aumentou! }
    else { msgsbp $sbp.cor1 $+ Não aconteceu nada! } 
    if (%poke2def > 30) { set %poke2def 30 }
  }
  if ($$1 == ata-) {
    if (%poke2ata > 0) { set %poke2ata %poke2ata - 5 | msgsbp $sbp.cor1 $+ O ataque de %Poke2 diminuiu! }
    else { msgsbp $sbp.cor1 $+ Não aconteceu nada! } 
    if (%poke2ata < 0) { set %poke2ata 0 }
  }
  if ($$1 == ata+) {
    if (%poke2ata <= 30) { inc %poke2ata 5 | msgsbp $sbp.cor1 $+ O ataque de %Poke2 aumentou! }
    else { msgsbp $sbp.cor1 $+ Não aconteceu nada! } 
    if (%poke2ata > 30) { set %poke2ata 30 }
  }
  if ($$1 == vel-) {
    if (%poke2velocidade >= 0) { dec %poke2velocidade 3 | msgsbp $sbp.cor1 $+ A velocidade de %Poke2 diminuiu! }
    else { msgsbp $sbp.cor1 $+ Não aconteceu nada! }
    if (%poke2velocidade < 0) { set %poke2velocidade 0 }
  }
  if ($$1 == vel+) {
    if (%poke2velocidade <= 12) { set %poke2velocidade %poke2velocidade + 3 | msgsbp $sbp.cor1 $+ A velocidade de %Poke2 aumentou! }
    else { msgsbp $sbp.cor1 $+ Não aconteceu nada! } 
    if (%poke2velocidade > 12) { set %poke2velocidade 12 }
  }
  if ($$1 == acerto-) {
    if (%poke2acerto >= 4) { set %poke2acerto %poke2acerto - 2 | msgsbp $sbp.cor1 $+ A precisão de %poke2 piorou! }
    else { msgsbp $sbp.cor1 $+ Não aconteceu nada! } 
  }
  if ($$1 == Recover) { set %poke2life %poke2life + $int($calc(%poke2lifeinicial / 2)) | msgsbp $sbp.cor1 $+ %poke2 usou $sbp.cor2 $+ RECOVER $sbp.cor1 $+ e recuperou suas energias.  }
  :end
  if ((+ isin $$1) || (recover isin $$1)) { poke2passar }
  else { poke1passar }
}
alias golpes { var %a 0 | var %txt $readini(pokedex.ini,golpes,$1) | while %a < $numtok(%txt,32) { inc %a | var %txt2 $gettok(%txt, [ %a ] ,32) | if $gettok(%txt2,1,92) == xx || $gettok(%txt2,1,92) <= $2 { var %b %b $gettok(%txt2,2,92) } } | return %b }
alias xxxtok { var %a 0 | var %b 0 | var %c %ataques [ $+ [ $strip($2) ] ] | return $findtok(%c,$replace($strip($1),$chr(32),-),0,32) }
