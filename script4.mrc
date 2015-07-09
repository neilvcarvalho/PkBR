alias checkgolpes { echo 2 -s Procurando erros em 4pokedex.ini | var %a 0 | while %a < $ini(pokedex.ini,golpes,0) { inc %a | checkgolpes2 %a $readini(pokedex.ini,golpes,$ini(pokedex.ini,golpes, [ %a ] )) } | echo 2 -s Procura concluída. }
alias checkgolpes2 { var %a 0 | while %a < $numtok($2-,32) { inc %a | var %txt $gettok($2-, [ %a ] ,32) | if $count(%txt,\) != 1 { echo 2 -s Erro em 04 $+ %txt (Poke:04 $ini(pokedex.ini,golpes,$1) /Parte:04 %a $+ ) } } }
alias xataque { var %a 0 | while %a < $lines(xataque.txt) { inc %a | var %txt $read -l $+ %a xataque.txt | xataque2 %txt | writeini pokedex.ini golpes $1 $readini(pokedex.ini,golpes,$1) %xataque } | echo -a $ini(pokedex.ini,golpes,$1) - $readini(pokedex.ini,golpes,$1) }
alias xataque2 { set %xataque $replace($2,---,XX) $+ \ $+ $replace($3-,$chr(32),-) }
alias repgolpes { var %a 0 | while %a < $ini(pokedex.ini,golpes,0) { inc %a | var %nick $ini(pokedex.ini,golpes, [ %a ] ) | writeini pokedex.ini golpes %nick $replace($readini(pokedex.ini,golpes, [ %nick ] ),xx\,XX\) } }
alias evolui writeini pokedex.ini evolui $1 $iif($2,$2,no) | echo $1 ( $+ $ini(pokedex.ini,evolui,$1) $+ ) evolui no level $readini(pokedex.ini,evolui,$1)
alias numascii { var %a 0 | while %a < $len($1-) { inc %a | var %b $asc($mid($1-, [ %a ] ,1)) | echo -s $mid($1-,%a,1) = %b | var %c $calc(%c + %b) } | echo -s TOTAL = %c }
alias xdesafio { msg $1 Desafio de %desafio. [ $+ [ $1 ] ] cancelado. | msg %desafio. [ $+ [ $1 ] ] $1 passou 2 minutos sem responder. | unset %desafio. [ $+ [ $1 ] ] }
alias xpoke { writeini pokedex.ini golpes $1 $readini(pokedex.ini,golpes,$1) $replace($remove($2,L),--,XX) $+ \ $+ $replace($iif($2 == L--,$3-,$4-),$chr(32),-) }
alias xpok { xpoke %xpoke $$?="golpe" | echo -s $ini(pokedex.ini,golpes,%xpoke) - %xpoke - $readini(pokedex.ini,golpes,%xpoke) }
alias checkpass { var %a 0 | var %b 0 | while %a < $ini(info.ini,pokes,0) { inc %a | var %nick $ini(info.ini,pokes, [ %a ] ) | if $getpass(%nick) == $null { inc %b | echo -a 2Erro!4 $cc(%nick) 2não tem senha. $iif($points(%nick) > 75,4 $+ $cc(%nick) 2tem mais de 0475 2pontos) } } | echo -a 2Um total de4 %b 2nicks sem senha. }
alias points { return $calc($replace($getinfo(levels,$1),$chr(32),+)) }
alias jaentrou { var %a 0 | while %a < $lines(entradas.txt) { inc %a | if $1 == $read -l $+ %a entradas.txt { return $true } } | return $false }
alias checkglp {
  echo -s 2Procurando erros em 4pokedex.ini
  var %a 0
  var %c 0
  while %a < $1 {
    inc %a
    var %b 0
    while %b < $numtok($readini(pokedex.ini,golpes,$ini(pokedex.ini,golpes,%a)),32) {
      inc %b
      var %atk $gettok($gettok($readini(pokedex.ini,golpes,$ini(pokedex.ini,golpes, [ %a ] )), [ %b ] ,32),2,92)
      if $readini(ataques.ini,ataques,%atk) == $null {
        echo -s 2Erro em4 %atk 2/4 $ini(pokedex.ini,golpes,%a)
        inc %c
      }
    }
  }
  echo -s 04 $+ %c 2erros encontrados em4 %a 2pokemons.
}
alias checkevo {
  echo -s 02Procurando erros em 04info.ini
  var %a 0
  while %a < $ini(info.ini,pokes,0) {
    inc %a
    var %b 0
    while %b < $numtok($getinfo(pokes, [ %nick ] ),32) {
      inc %b
      var %pok $gettok($getinfo(pokes, [ %nick ] ), [ %b ] ,32)
      if $evo(%pok) isnum && $evo(%pok) <= $gettok($getinfo(levels, [ %nick ] ), [ %b ] ,32) {
        echo -s 02Erro em04 %nick 02/04 $xbah(%pok)
      }
    }
  }
  echo -s 02Fim da procura.
}
alias checkxm { echo -s 2Procurando erros em 4info.ini | var %a 0 | while %a < $ini(info.ini,pokes,0) { inc %a | if $numtok($getinfo(pokes,$ini(info.ini,pokes,%a)),32) != $numtok($getinfo($1,$ini(info.ini,pokes,%a)),32) { echo -s 2Erro nos4 $1 2de4 $ini(info.ini,pokes,%a) } } | echo -s 2Procura concluída }
alias fila {
  var %a 0 | while %a < $numtok(%fight.fila,32) { inc %a | var %fila %fila $cor(3) $+ $gettok(%fight.fila, [ %a ] ,32) $cor(1) $+ Vs $cor(3) $+ $iif($gettok(%fight.fila,$calc( [ %a ] + 1),32),$gettok(%fight.fila,$calc( [ %a ] + 1),32),?) $cor(1) $+ $iif(%a != $calc($numtok(%fight.fila,32) - 1),/) | inc %a }
  if $gettok(%fight.fila,2,32) { msg %chan $pkbr $cor(1) $+ Próximas lutas $x $left(%fila,397) $+ $cor(1) $+ $iif($len(%fila) > 397,...) }
}
alias capfila { if %cap.fila { msg %chan $pkbr $cor(1) $+ Fila de capturas: $cor(3) $+ $reptok($replace($comvirgula(%cap.fila),$chr(44),$cor(1) $+ $chr(44) $+ $cor(3)),e,$cor(1) $+ e $+ $cor(3),1,32) } }
alias xxxtest {
  .remove test.tmp
  var %a 0
  while %a < $ini(tms.ini,tm-compat,0) {
    inc %a
    var %tm $ini(tms.ini,tm-compat, [ %a ] )
    .remove test.tmp
    write test.tmp $readini(tms.ini,tm-compat, [ %tm ] )
    var %b 0
    echo -s %a
    while %b < $numtok($xxxtest2,32) {
      inc %b
      var %txt2 $gettok($xxxtest2, [ %b ] ,32)
      if %txt2 !isnum { writeini tms.ini tm-compat %tm $puttok($readini(tms.ini,tm-compat, [ %tm ] ),$num( [ %txt2 ] ), [ %b ] ,32) }
    }
  }
  .remove test.tmp
}
alias xxxtest2 { if $isfile(test.tmp) { .return $read test.tmp } | else return }


alias vitorias {
  var %a 0 | var %b 0 | while %a < $lines(blah.txt) {
    inc %a
    if $read -l $+ %a blah.txt == $1 { inc %b }
  }
  return %b
}
alias vitnicks {
  var %a 0 | while %a < $lines(blah.txt) {
    inc %a
    var %txt $read -l $+ %a blah.txt
    var %asd $addtok( [ %asd ] , [ %txt ] ,32)
  }
  return %asd
}
alias asdtest {
  var %a 0 | var %b $vitnicks | while %a < $numtok(%b,32) { inc %a | echo -s $gettok(%b,%a,32) = $vitorias($gettok(%b,%a,32)) }
}


alias huatest {
  var %a 0 | while %a < $lines(historico.txt) {
    inc %a | var %txt $read -l $+ %a historico.txt | var %txt $gettok(%txt,1,32) $+ $gettok(%txt,7,32) $+ $gettok(%txt,11,32) | if $istok(%b,%txt,215) { echo -s %b | goto pulo } | var %b %b $+ × $+ %txt | :pulo
  }
}

alias pontos {
  var %a $calc($replace($getinfo(levels,$1),$chr(32),+))
  var %b $calc(100* $numtok($getinfo(insigneas,$1),32))
  var %d $calc( [ %a ] + [ %b ] )
  return %d
}
alias checktipos {
  echo -s 02Procurando tipos em 04pokedex.ini
  var %a 0
  while %a < $ini(pokedex.ini,tipo,0) {
    inc %a
    var %txt $readini(pokedex.ini,tipo,$ini(pokedex.ini,tipo, [ %a ] ))
    var %b 0
    while %b < $numtok(%txt,32) { inc %b
      var %txt2 $gettok( [ %txt ] , [ %b ] ,32)
      var %bah $addtok( [ %bah ] , [ %txt2 ] ,32)
    }
  }
  echo -s 02Tipos:04 $comvirgula(%bah)
}
alias efets { var %a 0 | while %a < $ini(pokedex.ini,tipo,0) { inc %a | echo -s $xbah($ini(pokedex.ini,tipo,%a)) - $efet($1,$ini(pokedex.ini,tipo,%a)) | var %b %b $efet($1,$ini(pokedex.ini,tipo, [ %a ] ))) } | echo -s Média: $calc($calc($replace(%b,$chr(32),+)) / $ini(pokedex.ini,tipo,0)) }
alias xcheckevo {
  var %pk $2
  var %poke $gettok($getinfo(pokes,$1), [ %pk ] ,32)
  var %pokelevel $gettok($getinfo(levels,$1), [ %pk ] ,32)
  if $evo(%poke) isnum {
    if %pokelevel >= $evo(%poke) && $3 == infight { msgsbp $sbp.cor3 $+ %poke $sbp.cor1 $+ evoluiu e agora é um $sbp.cor3 $+ $xbah($ini(pokedex.ini,evolui,$calc($ini(pokedex.ini,evolui,%poke) + 1))) $+ $sbp.cor1 $+ . | var %newpkm $sbp.cor3 $+ $xbah($ini(pokedex.ini,evolui,$calc($ini(pokedex.ini,evolui, [ %poke ] ) + 1))) | setinfo pokes $1 $puttok($getinfo(pokes,$1),%newpkm,%pk,32) }
    elseif %pokelevel >= $evo(%poke) && $3 == $null { msg %chan $pkbr $cor(3) $+ O %poke de $1 evoluiu e agora é um $xbah($ini(pokedex.ini,evolui,$calc($ini(pokedex.ini,evolui,%poke) + 1))) $+ $sbp.cor1 $+ . | var %newpkm $sbp.cor3 $+ $xbah($ini(pokedex.ini,evolui,$calc($ini(pokedex.ini,evolui, [ %poke ] ) + 1))) | setinfo pokes $1 $puttok($getinfo(pokes,$1),%newpkm,%pk,32) }
  }
}
alias checktm1 {
  echo -s procurando erros em tms.ini
  var %a 0
  while %a < $ini(tms.ini,tms,0) {
    inc %a
    if $readini(ataques.ini,ataques,$readini(tms.ini,tms,%a)) == $null { echo -s erro em $readini(tms.ini,tms,%a) }
  }
  echo -s procura concluída
}
alias checkhm1 {
  echo -s procurando erros em tms.ini
  var %a 0
  while %a < $ini(tms.ini,hms,0) {
    inc %a
    if $readini(ataques.ini,ataques,$readini(tms.ini,hms,%a)) == $null { echo -s erro em $readini(tms.ini,hms,%a) }
  }
  echo -s procura concluída
}
alias checktm2 {
  echo -s 2Procurando erros em 4tms.ini
  var %a 0
  var %c 0
  while %a < $ini(tms.ini,tm-compat,0) {
    inc %a
    var %b 0
    while %b < $numtok($readini(tms.ini,tm-compat,$ini(tms.ini,tm-compat,%a)),32) {
      inc %b
      var %pkm $gettok($readini(tms.ini,tm-compat,$ini(tms.ini,tm-compat, [ %a ] )), [ %b ] ,32)
      if $readini(pokedex.ini,golpes,%pkm) == $null {
        echo -s 2Erro em4 %pkm 2/4 TM $+ $ini(tms.ini,tm-compat,%a)
        inc %c
      }
    }
  }
  echo -s 04 $+ %c 2erros encontrados em4 %a 2TMs.
}
alias checkhm2 {
  echo -s 2Procurando erros em 4tms.ini
  var %a 0
  var %c 0
  while %a < $ini(tms.ini,hm-compat,0) {
    inc %a
    var %b 0
    while %b < $numtok($readini(tms.ini,hm-compat,$ini(tms.ini,hm-compat,%a)),32) {
      inc %b
      var %pkm $gettok($readini(tms.ini,hm-compat,$ini(tms.ini,hm-compat, [ %a ] )), [ %b ] ,32)
      if $readini(pokedex.ini,golpes,%pkm) == $null {
        echo -s 2Erro em4 %pkm 2/4 HM $+ $ini(tms.ini,hm-compat,%a)
        inc %c
      }
    }
  }
  echo -s 04 $+ %c 2erros encontrados em4 %a 2HMs.
}
alias checknovos {
  echo -s 02Procurando pokémons novos em 04info.ini
  var %a 0
  var %c 0
  var %p 0
  while %a < $ini(info.ini,pokes,0) {
    inc %a
    var %nick $ini(info.ini,pokes, [ %a ] )
    var %b 0
    while %b < $numtok($getinfo(pokes,%nick),32) {
      inc %b
      inc %p
      var %poke $gettok($getinfo(pokes, [ %nick ] ), [ %b ] ,32)
      if $ini(pokedex.ini,golpes, [ %poke ] ) > 151 {
        inc %c
        var %d $addtok( [ %d ] , [ %nick ] ,32)
        echo -a 04 $+ %poke $+ 02/04 $+ $cc(%nick)
      }
    }
  }
  echo -s 02Dados
  echo -s 02Cadastrados: 04 $+ $ini(info.ini,pokes,0)
  echo -s 02Pokémons novos: 04 $+ %c 02em 04 $+ $numtok(%d,32) 02nicks.
  echo -s 02Pokémons velhos: 04 $+ $calc(%p - %c)
  echo -s 02Total de pokémons:04 %p
}
alias efet {
  var %tipo1 %xtipo
  var %tipo2 $readini(pokedex.ini,tipo,$2)
  if $istok(%tipo1,nor,32) && $istok(%tipo2,ped,32) { var %efe %efe 0.5 }
  if $istok(%tipo1,nor,32) && $istok(%tipo2,fan,32) { var %efe %efe 0.35 }
  if $istok(%tipo1,fog,32) && $istok(%tipo2,agu,32) { var %efe %efe 0.75 }
  if $istok(%tipo1,fog,32) && $istok(%tipo2,gel,32) { var %efe %efe 1.5 }
  if $istok(%tipo1,fog,32) && $istok(%tipo2,ins,32) { var %efe %efe 1.5 }
  if $istok(%tipo1,fog,32) && $istok(%tipo2,ped,32) { var %efe %efe 0.75 }
  if $istok(%tipo1,fog,32) && $istok(%tipo2,dra,32) { var %efe %efe 0.75 }
  if $istok(%tipo1,agu,32) && $istok(%tipo2,fog,32) { var %efe %efe 1.5 }
  if $istok(%tipo1,agu,32) && $istok(%tipo2,ter,32) { var %efe %efe 1.5 }
  if $istok(%tipo1,agu,32) && $istok(%tipo2,agu,32) { var %efe %efe 0.75 }
  if $istok(%tipo1,agu,32) && $istok(%tipo2,gra,32) { var %efe %efe 0.75 }
  if $istok(%tipo1,agu,32) && $istok(%tipo2,ped,32) { var %efe %efe 1.5 }
  if $istok(%tipo1,agu,32) && $istok(%tipo2,dra,32) { var %efe %efe 0.75 }
  if $istok(%tipo1,ele,32) && $istok(%tipo2,agu,32) { var %efe %efe 1.5 }
  if $istok(%tipo1,ele,32) && $istok(%tipo2,ter,32) { var %efe %efe 0.35 }
  if $istok(%tipo1,ele,32) && $istok(%tipo2,ped,32) { var %efe %efe 0.35 }
  if $istok(%tipo1,ele,32) && $istok(%tipo2,voa,32) { var %efe %efe 1.5 }
  if $istok(%tipo1,ele,32) && $istok(%tipo2,dra,32) { var %efe %efe 0.75 }
  if $istok(%tipo1,gra,32) && $istok(%tipo2,agu,32) { var %efe %efe 1.5 }
  if $istok(%tipo1,gra,32) && $istok(%tipo2,ele,32) { var %efe %efe 0.75 }
  if $istok(%tipo1,gra,32) && $istok(%tipo2,gra,32) { var %efe %efe 0.75 }
  if $istok(%tipo1,gra,32) && $istok(%tipo2,agu,32) { var %efe %efe 1.5 }
  if $istok(%tipo1,gra,32) && $istok(%tipo2,ven,32) { var %efe %efe 0.75 }
  if $istok(%tipo1,gra,32) && $istok(%tipo2,ter,32) { var %efe %efe 1.5 }
  if $istok(%tipo1,gra,32) && $istok(%tipo2,voa,32) { var %efe %efe 0.75 }
  if $istok(%tipo1,gra,32) && $istok(%tipo2,ins,32) { var %efe %efe 0.75 }
  if $istok(%tipo1,gra,32) && $istok(%tipo2,ped,32) { var %efe %efe 1.5 }
  if $istok(%tipo1,gra,32) && $istok(%tipo2,dra,32) { var %efe %efe 0.75 }
  if $istok(%tipo1,gel,32) && $istok(%tipo2,fog,32) { var %efe %efe 0.75 }
  if $istok(%tipo1,gel,32) && $istok(%tipo2,agu,32) { var %efe %efe 0.75 }
  if $istok(%tipo1,gel,32) && $istok(%tipo2,gra,32) { var %efe %efe 1.5 }
  if $istok(%tipo1,gel,32) && $istok(%tipo2,gel,32) { var %efe %efe 0.75 }
  if $istok(%tipo1,gel,32) && $istok(%tipo2,ter,32) { var %efe %efe 1.5 }
  if $istok(%tipo1,gel,32) && $istok(%tipo2,voa,32) { var %efe %efe 1.5 }
  if $istok(%tipo1,gel,32) && $istok(%tipo2,dra,32) { var %efe %efe 1.5 }
  if $istok(%tipo1,lut,32) && $istok(%tipo2,nor,32) { var %efe %efe 1.5 }
  if $istok(%tipo1,lut,32) && $istok(%tipo2,gel,32) { var %efe %efe 1.5 }
  if $istok(%tipo1,lut,32) && $istok(%tipo2,ven,32) { var %efe %efe 0.75 }
  if $istok(%tipo1,lut,32) && $istok(%tipo2,voa,32) { var %efe %efe 0.75 }
  if $istok(%tipo1,lut,32) && $istok(%tipo2,psi,32) { var %efe %efe 0.75 }
  if $istok(%tipo1,lut,32) && $istok(%tipo2,ins,32) { var %efe %efe 0.75 }
  if $istok(%tipo1,lut,32) && $istok(%tipo2,ped,32) { var %efe %efe 1.5 }
  if $istok(%tipo1,lut,32) && $istok(%tipo2,fan,32) { var %efe %efe 0.35 }
  if $istok(%tipo1,ven,32) && $istok(%tipo2,gra,32) { var %efe %efe 1.5 }
  if $istok(%tipo1,ven,32) && $istok(%tipo2,ven,32) { var %efe %efe 0.75 }
  if $istok(%tipo1,ven,32) && $istok(%tipo2,voa,32) { var %efe %efe 0.75 }
  if $istok(%tipo1,ven,32) && $istok(%tipo2,ter,32) { var %efe %efe 0.75 }
  if $istok(%tipo1,ven,32) && $istok(%tipo2,ped,32) { var %efe %efe 0.75 }
  if $istok(%tipo1,ter,32) && $istok(%tipo2,fog,32) { var %efe %efe 1.5 }
  if $istok(%tipo1,ter,32) && $istok(%tipo2,ele,32) { var %efe %efe 1.5 }
  if $istok(%tipo1,ter,32) && $istok(%tipo2,gra,32) { var %efe %efe 0.75 }
  if $istok(%tipo1,ter,32) && $istok(%tipo2,ven,32) { var %efe %efe 1.5 }
  if $istok(%tipo1,ter,32) && $istok(%tipo2,voa,32) { var %efe %efe 0.35 }
  if $istok(%tipo1,ter,32) && $istok(%tipo2,ins,32) { var %efe %efe 0.75 }
  if $istok(%tipo1,ter,32) && $istok(%tipo2,ped,32) { var %efe %efe 1.5 }
  if $istok(%tipo1,ter,32) && $istok(%tipo2,fan,32) { var %efe %efe 0.35 }
  if $istok(%tipo1,voa,32) && $istok(%tipo2,ele,32) { var %efe %efe 0.75 }
  if $istok(%tipo1,voa,32) && $istok(%tipo2,gra,32) { var %efe %efe 1.5 }
  if $istok(%tipo1,voa,32) && $istok(%tipo2,voa,32) { var %efe %efe 1.5 }
  if $istok(%tipo1,voa,32) && $istok(%tipo2,ins,32) { var %efe %efe 1.5 }
  if $istok(%tipo1,voa,32) && $istok(%tipo2,ped,32) { var %efe %efe 0.75 }
  if $istok(%tipo1,psi,32) && $istok(%tipo2,voa,32) { var %efe %efe 1.5 }
  if $istok(%tipo1,psi,32) && $istok(%tipo2,ven,32) { var %efe %efe 1.5 }
  if $istok(%tipo1,psi,32) && $istok(%tipo2,psi,32) { var %efe %efe 0.75 }
  if $istok(%tipo1,ins,32) && $istok(%tipo2,fog,32) { var %efe %efe 0.75 }
  if $istok(%tipo1,ins,32) && $istok(%tipo2,gra,32) { var %efe %efe 1.5 }
  if $istok(%tipo1,ins,32) && $istok(%tipo2,lut,32) { var %efe %efe 0.75 }
  if $istok(%tipo1,ins,32) && $istok(%tipo2,voa,32) { var %efe %efe 0.75 }
  if $istok(%tipo1,ins,32) && $istok(%tipo2,psi,32) { var %efe %efe 1.5 }
  if $istok(%tipo1,ins,32) && $istok(%tipo2,fan,32) { var %efe %efe 0.75 }
  if $istok(%tipo1,ped,32) && $istok(%tipo2,fog,32) { var %efe %efe 1.5 }
  if $istok(%tipo1,ped,32) && $istok(%tipo2,gel,32) { var %efe %efe 1.5 }
  if $istok(%tipo1,ped,32) && $istok(%tipo2,lut,32) { var %efe %efe 0.75 }
  if $istok(%tipo1,ped,32) && $istok(%tipo2,gra,32) { var %efe %efe 0.75 }
  if $istok(%tipo1,ped,32) && $istok(%tipo2,voa,32) { var %efe %efe 1.5 }
  if $istok(%tipo1,ped,32) && $istok(%tipo2,ins,32) { var %efe %efe 1.5 }
  if $istok(%tipo1,fan,32) && $istok(%tipo2,nor,32) { var %efe %efe 0.35 }
  if $istok(%tipo1,fan,32) && $istok(%tipo2,psi,32) { var %efe %efe 1.5 }
  if $istok(%tipo1,fan,32) && $istok(%tipo2,fan,32) { var %efe %efe 1.5 }
  if $istok(%tipo1,dra,32) && $istok(%tipo2,dra,32) { var %efe %efe 1.5 }
  return $iif(%efe,$calc($replace(%efe,$chr(32),*)),1)
}
alias checkatkstype {
  var %a 0 | while %a < $ini(ataques.ini,golpes,0) {
    inc %a | var %txt $ini(ataques.ini,golpes, [ %a ] ) | if $readini(atktipos.ini,tipo,%txt) == $null { echo -s erro em %txt }
  }
}
alias lot.sort {
  msg %chan $pkbr $cor(3) $+ Hora do sorteio!
  var %n1 $rand(0,10)
  var %n2 $rand(0,10)
  while %n1 == %n2 { var %n1 $rand(0,10) | var %n2 $rand(0,10) }
  var %ns %n1 %n2 %n3
  msg %chan $pkbr $cor(1) $+ Os números sorteados são: $cor(3) $+ %n1 e %n2
  var %a 0 | while %a < $ini(temp.ini,lot,0) { inc %a | var %b $ini(temp.ini,lot, [ %a ] ) | if $istok($gettemp(lot,%b),%n1,32) && $istok($gettemp(lot,%b),%n2,32) { msg $chan $pkbr $cor(1) $+ Um vencedor! Nick do sortudo: $cor(3) $+ $cc(%b) $x $cor(1) $+ Prêmio: $cor(3) $+ %lot.premio | setinfo grana %b $calc($getinfo(grana,%b) + %lot.premio) | var %c %c %b } }
  if %c == $null { set %lot.premio $calc(%lot.premio + 500) | msg %chan $pkbr $cor(2) $+ Acumulou! O prêmio agora é %lot.premio }
  else set %lot.premio 500
  deltemp lot
}
on *:input:%chan:{
  if /* !iswm $1- { say * Sherlok disse: $1- | haltdef }
}
