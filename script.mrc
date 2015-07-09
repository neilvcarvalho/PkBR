alias getinfo { return $readini(info.ini,$1,$replace($2,[,$chr(40),],$chr(41))) }
alias setinfo { writeini info.ini $1 $sc($2) $3- }
alias delinfo { remini info.ini $1 $2 }
alias gettemp { return $readini(temp.ini,$1,$replace($2,[,$chr(40),],$chr(41))) }
alias settemp { writeini temp.ini $1 $sc($2) $3- }
alias deltemp { remini temp.ini $1 $2 }
alias getpass { return $readini(pass.ini,pass,$replace($1,[,$chr(40),],$chr(41))) }
alias setpass { writeini pass.ini pass $sc($1) $2- }
alias delpass { remini pass.ini pass $1 }
alias getdiv { return $readini(bank.ini,emprestimo,$replace($1,[,$chr(40),],$chr(41))) }
alias setdiv { writeini bank.ini emprestimo $sc($1) $2- }
alias deldiv { remini bank.ini emprestimo $1 }
alias pokes return bulbasaur,ivysaur,charmander,charmeleon,squirtle,wartortle,caterpie,metapod,butterfree,weedle,kakuna,beedrill,pidgey,pidgeotto,rattata,raticate,spearow,fearow,ekans,arbok,pikachu,sandshrew,sandslash,nidoran(f),nidorina,nidoran(m),nidorino,clefairy,vulpix,jigglypuff,zubat,golbat,oddish,gloom,paras,parasect,venonat,digglet,meowth,psyduck,mankey,growlithe,poliwag,poliwhirl,abra,kadabra,machop,bellsprout,tentacool,geodude,graveler,ponyta,slowpoke,magnemite,doduo,seel,grimer,shellder,gastly,onix,drowzee,krabby,voltorb,exeggcute,cubone,hitmonlee,hitmonchan,lickitung,koffing,rhyhorn,chansey,tangela,horsea,goldeen,staryu,magikarp,gyarados,ditto,eevee,taurus,articuno,zapdos,moltres,dratini,farfetch'd,mr.mime,lapras,eevee,porygon,kabuto,omanyte,snorlax,aerodactyl,scyther,pinsir,tauros,electabuzz,magmar,jynx,kangaskhan,haunter,hypno
alias pokes2 return chikorita,bayleef,cyndaquil,quilava,totodile,croconaw,hoothoot,noctowl,sentret,furret,pichu,ledyba,ledian,spinarak,ariados,cleffa,igglybuff,togepi,dunsparce,mareep,flaafy,wooper,quagsire,unown,hoppip,skiplum,pineco,yanma,sunkern,sudowoodo,wobbuffet,heracross,aipom,snubull,granbull,stantler,marill,azumarill,tyrogue,hitmontop,girafarig,miltank,magby,smoochum,elekid,smeargle,natu,xatu,qwilfish,shuckle,corsola,remoraid,octillery,chinchou,gligar,delibird,swinub,teddiursa,phanpy,donphan,mantine,skarmory,murkrow,houndour,houndoom,slugma,sneasel,misdreavus,raikou,entei,suicune,larvitar,lugia,ho-oh
alias ehpoke { if $istok($pokes,$1,44) { return $true } | else return $false }
alias check { if $gettemp(cadastrando,$1) == $true { deltemp cadastrando $1 | deltemp pokes $1 | msg $1 $pkbr Tempo esgotado } }
alias nc {
  msg $1 $cor(1) $+ ( $+ $cor(3) $+ $2 $+ $cor(1) $+ ) $cor(2) $+ $3-
  if $2 == PkBR && *não*pode*usar* iswm $strip($3-) { msg %chan $cor(1) $+ %poke2 $cor(3) $+ usou POF! | .timer 1 3 xatacar PkBR pof! }
  if $2 == PkBR && *golpe*desabilitado* iswm $strip($3-) { msg %chan $cor(1) $+ %poke2 $cor(3) $+ usou POF! | .timer 1 3 xatacar PkBR pof! }
}
alias isop { if $ini(ops.ini,pass,$nick) { return $true } | else return $false }
alias identified {
  if $readini(ops.ini,identify,$1) { return $true }
  else { return $false }
}
alias unidentify remini ops.ini identify $1
on *:connect:{ if $server == test.pkbr.org { set %chan #PkBR | oper admin 123 } | else set %chan %xchan | if $me != %me { nickserv ghost %me $decode(%pass) | nickserv release %me $decode(%pass) | nickserv recover %me $decode(%pass) | nick %me } | join %chan | .timer 1 20 join %chan $+ _Gym | xidentify PkBR | .timermedia 0 60 media }
alias cc { return $replace($1,$chr(40),$chr(91),$chr(41),$chr(93)) }
alias sc { return $replace($1,$chr(91),$chr(40),$chr(93),$chr(41)) }
alias top50 {
  .remove top50.txt
  if $hget(top50) { hfree top50 }
  checkrk
  write top50.txt TOP 50 - PkBR $versao
  write top50.txt Atualizado em $asctime
  write top50.txt Pontuação mínima atual: %tp.pts pontos
  write top50.txt  
  if $hget(top50) == $null { hmake top50 100 }
  var %a 0 | while %a < $ini(info.ini,pokes,0) { inc %a | if $pontos($ini(info.ini,pokes,%a)) < %tp.pts { goto pulo } | hadd top50 a $hget(top50,a) $pontos($ini(info.ini,pokes,%a)) $+ ~ $+ $cc($ini(info.ini,pokes,%a)) | :pulo }
  var %b 0 | while %b < $numtok($hget(top50,a),32) { inc %b | var %txt $gettok($sorttok($hget(top50,a),32,nr), [ %b ] ,32) | var %nck $gettok( [ %txt ] ,2,126) | var %pnt $gettok( [ %txt ] ,1,126) | write top50.txt %b $+ ª posição: %nck - Com %pnt pontos. }
}
alias rnk1 { return a }
on *:filesent:dados_*.txt:{ .remove $filename }
alias pkgym return xpoke.gym. $+ $1
on *:text:*:#:{
  if $nick !isop $chan && @* iswm $strip($1) {
    inc %p.tf.a. [ $+ [ $nick ] ]
    if %p.tf.a. [ $+ [ $nick ] ] >= 3 && $strip($1) != @golpe { kick $chan $nick Floodou? Floodeu-se! | .timerp.tf. $+ $nick off | unset %p.*. [ $+ [ $nick ] ] | return }
    if $timer(p.tf. $+ $nick) == $null { .timerp.tf. $+ $nick 1 5 unset %p.tf.a. [ $+ [ $nick ] ] }
  }
  if $nick !isop $chan && @* iswm $strip($1) {
    if $strip($1) == %p.rf.a. [ $+ [ $nick ] ] && $strip($1) != @golpe { inc %p.rf.b. [ $+ [ $nick ] ] }
    else unset %p.rf.b. [ $+ [ $nick ] ]
    set %p.rf.a. [ $+ [ $nick ] ] $strip($1)
    if $calc(%p.rf.b. [ $+ [ $nick ] ] + 1) >= 2 { kick $chan $nick Não repita os comandos. | .timerp.rf?. $+ $nick off | unset %p.*. [ $+ [ $nick ] ] | return }
    if $timer(p.rf. $+ $nick) == $null { .timerp.rf. $+ $nick 1 5 unset %p.rf.b. [ $+ [ $nick ] ] | .timerp.rf2. $+ $nick 1 5 unset %p.rf.a. [ $+ [ $nick ] ] }
  }
  if $strip($1) == @gyms {
    var %a 0 | while %a < $ini(gym.ini,gyms,0) { inc %a | var %l %l $cor(1) $+ $xxbah($ini(gym.ini,gyms, [ %a ] )) $+ : $cor(3) $+ $readini(gym.ini,gyms,$ini(gym.ini,gyms, [ %a ] )) $iif($readini(gym.ini,gyms,$ini(gym.ini,gyms, [ %a ] )) ison %chan $+ _Gym,(Disponível)) $iif(%a != $ini(gym.ini,gyms,0),$x) }
    msg $nick $pkbr Lideres dos ginasios: %l
  }
  if $strip($1) == @gym {
    if $jahadv($nick) { return }
    if $timer(5 $+ $nick) { notice $nick Aguarde 5 minutos para lutar ou capturar novamente. (Faltam $duration($timer(5 $+ $nick).secs) $+ )  | settemp jahadv $nick x | return }
    if $readini(gym.ini,gyms,$strip($2)) == $null { notice $nick Gym inexistente. | return }
    if $readini(gym.ini,gyms,$strip($2)) !ison %chan $+ _Gym { notice $nick Líder não presente/disponível no momento. | return }
    if $numtok($getinfo(insigneas,$nick),32) == $ini(gym.ini,gyms,$strip($2)) { notice $nick Você já tem a insígnea dada por $readini(gym.ini,gyms,$strip($2)) $+ . | return }
    if $calc($numtok($getinfo(insigneas,$nick),32) +1) < $ini(gym.ini,gyms,$strip($2)) { notice $nick Você ainda não tem as insígneas necessárias para desafiar $readini(gym.ini,gyms,$strip($2)) $+ . | return }
    if $numtok(%fight.fila,32) >= 20 { notice $nick A fila está cheia. | return }
    if $istok(%fight.fila,gym. $+ $strip($2),32) { notice $nick O ginásio de $lower($strip($2)) já está na fila de lutas. | return }
    if $istok(%fight.fila,$nick,32) { notice $nick Você já está na fila de lutas. | return }
    if $strip($3) == $null { notice $nick Formato: @Gym tipo ID | return }
    notice $nick $readini(gym.ini,gyms,$strip($2)) $+ : Não me faça rir, fracote! Você não ganha de mim! Só vai levar uma bela PISA!
    set %fight.fila %fight.fila $nick Gym. $+ $xxbah($strip($2))
    set % [ $+ [ $pkgym($strip($2)) ] ] $rand(1,$numtok($getinfo(pokes,gym. $+ $strip($2)),32))
    set %xpoke. [ $+ [ $nick ] ] $strip($3)
    fila
    notice $readini(gym.ini,gyms,$strip($2)) ACORDA!!!!!!!! Você vai lutar agora pelo gym de $strip($2) com $nick
    msg $readini(gym.ini,gyms,$strip($2)) ACORDA!!!!!!!! Você vai lutar agora pelo gym de $strip($2) com $nick
    nc %chan $+ _Gym $readini(gym.ini,gyms,$strip($2)) ACORDA!!!!!!!! Você vai lutar agora pelo gym de $strip($2) com $nick
    if %sbp.player1 == $null && $timer(luta) == $null {
      iniciar luta
    }
  }
  if $strip($1) == @top50 { dcc send $nick top50.txt }
  if $strip($1) == @loteria {
    if $getinfo(pokes,$nick) == $null { notice $nick Você não está cadastrado. | return }
    if $xidentified($nick) == $false { notice $nick Você não está identificado. | return }
    if $gettemp(lot,$nick) { notice $nick Você já fez uma aposta. | return }
    if $getinfo(grana,$nick) < 100 { notice $nick Você não tem dinheiro suficiente para fazer sua fezinha... É preciso ter no mínimo $chr(36) $+ 100 | return }
    if $strip($2) !isnum 0-10 || $strip($3) !isnum 0-10 || $strip($4) !isnum 0-10 { notice $nick Os três números apostados devem ser de 0 a 10. | return }
    settemp lot $nick $strip($2-4)
    setinfo grana $nick $calc($getinfo(grana,$nick) -100)
    notice $nick Aposta realizada. O sorteio será realizado no $remove(%chan,$chr(35)) $+ .
    if $ini(temp.ini,lot,0) >= 10 { lot.sort }
  }
  if $strip($1) == @sair {
    if $strip($2) == luta {
      if $istok(%fight.fila,$nick,32) == $false { notice $nick Você não está na fila de lutas. | return }
      if $nick == %sbp.player1 || $nick == %sbp.player2 { notice $nick Você já está lutando. Para sair da luta, digite @desistir | return }
      if $timer(luta) { if $gettok(%fight.fila,1,32) == $nick || $gettok(%fight.fila,2,32) == $nick { notice $nick Sua luta está sendo iniciada. Para sair da luta, digite @desistir | return } }
      var %a 0 | while %a < $numtok(%fight.fila,32) {
        inc %a
        var %luta $gettok(%fight.fila, [ %a ] ,32) $gettok(%fight.fila,$calc( [ %a ] +1),32)
        if $istok(%luta,$nick,32) { goto p }
        var %lutas %lutas %luta
        :p
        inc %a
      }
      notice $nick Você saiu da fila de lutas.
      set %fight.fila %lutas
      fila
    }
    if $strip($2) == cap {
      if $istok(%cap.fila,$nick,32) == $false { notice $nick Você não está na fila de capturas. | return }
      if $nick == %sbp.player1 || $nick == %sbp.player2 { notice $nick Você já está capturando. Para sair da captura, digite @desistir | return }
      if $timer(luta) { if $gettok(%cap.fila,1,32) == $nick { notice $nick Sua captura está sendo iniciada. Para sair dela, digite @desistir | return } }
      set %cap.fila $deltok(%cap.fila,$findtok(%cap.fila,$nick,1,32))
      notice $nick Você saiu da fila de capturas.
      capfila
    }
  }
  if $strip($1) == @desistir && $xidentified($nick) {
    if $nick == %sbp.player1 { sbp.fim Player2 }
    if $nick == %sbp.player2 { sbp.fim Player1 }
  }
  if $strip($1) == @evoluir && $strip($2) && $xidentified($nick) { xcheckevo $nick $strip($2) }
  if $getinfo(pokes,$strip($2)) && $strip($1) == @pontos { msg %chan $pkbr $cor(3) $+ Pontuação de  $+ $cor(3) $+ $strip($2) $+  $x $cor(3) $+ $calc($replace($getinfo(levels,$strip($2)),$chr(32),+)) }
  if $strip($1) == @dados {
    var %nck $iif($strip($2),$strip($2),$nick)
    var %nck $cc($ini(info.ini,pokes,$ini(info.ini,pokes,$sc(%nck))))
    if $getinfo(pokes,%nck) {
      var %a 0
      var %b $gettok($getinfo(pokes, [ %nck  ]),0,32)
      var %arq dados_ $+ $remove( [ %nck ] ,|,\,^) $+ .txt
      .remove %arq
      write %arq Nick: $cc($ini(info.ini,pokes,$ini(info.ini,pokes,$sc(%nck))))
      write %arq $chr(160)
      write %arq Pokémons:
      while %a < %b {
        inc %a
        write %arq ID %a - $gettok($getinfo(pokes,%nck),%a,32) LVL $gettok($getinfo(levels,%nck),%a,32) - TM: $replace($xbah($gettok($getinfo(tms,%nck),%a,32)),No,Nenhum) / HM: $replace($xbah($gettok($getinfo(hms,%nck),%a,32)),No,Nenhum)
      }
      if $getinfo(itens,%nck) == Noitens || $getinfo(itens,%nck) == $null { goto ins }
      write %arq $chr(160)
      write %arq Itens: $comvirgula($getinfo(itens,%nck))
      :ins
      if $getinfo(insigneas,%nck) == $null { goto grana }
      write %arq $chr(160)
      write %arq Insigneas: $comvirgula($getinfo(insigneas,%nck))
      :grana
      var %a 0 | while %a < $ini(gym.ini,gyms,0) { inc %a | if $readini(gym.ini,gyms,$ini(gym.ini,gyms,%a)) == %nck { write %arq %nck é líder do ginásio do tipo $ini(gym.ini,gyms,%a) } }
      write %arq $chr(160)
      write %arq Grana: $getinfo(grana,%nck)
      if $getdiv(%nck) > 0 { write %arq Empréstimo: $getdiv(%nck) }
      write %arq Pontuação: $calc($replace($getinfo(levels,%nck),$chr(32),+)) ( $+ Média: $round($med(%nck),1) $+ )
      write %arq Status: $iif($xidentified(%nck),Identificado,Não identificado)
      write %arq $chr(160)
      write %arq info by PkBR $versao
      .dcc send $nick %arq
    }
  }
  if $strip($1) == @tmlist { dcc send $nick tms.txt }
  if $strip($1) == @info && %poke1 {
    msg %chan $pkbr $cor(1) $+ Informações da luta atual
    msg %chan $pkbr $cor(1) $+ Player 1: $cor(3) $+ %sbp.player1 $cor(2) $+ $x $cor(1) $+ Pokémon: $cor(3) $+ %poke1 $cor(1) $+ LVL $cor(3) $+ %poke1level
    msg %chan $pkbr $cor(1) $+ Player 2: $cor(3) $+ %sbp.player2 $cor(2) $+ $x $cor(1) $+ Pokémon: $cor(3) $+ %poke2 $cor(1) $+ LVL $cor(3) $+ %poke2level
  }
  if $strip($1) == @emprestimo && $xidentified($nick) && $strip($2-) isnum {
    var %velho $readini(bank.ini,emprestimo,$sc($nick))
    var %total $calc( [ %velho ] + $strip($2-))
    var %total $int( [ %total ] )
    if %total > 1000 { notice $nick Bloqueado. A dívida não pode ultrapassar de $chr(36) $+ 1000, a não ser por causa dos juros. | return }
    if %total !isnum { notice $nick Erro desconhecido, bloqueando. | write err.txt $asctime - $script / l $scriptline / com $nick | return }
    notice $nick Sua dívida irá aumentando 2% a cada luta. Para pagar, digite @pagar quantia.
    writeini bank.ini emprestimo $sc($nick) %total
    setinfo grana $nick $calc($getinfo(grana,$nick) + $strip($2-))
  }
  if $strip($1) == @pagar && $xidentified($nick) && $strip($2-) isnum {
    var %velho $readini(bank.ini,emprestimo,$sc($nick))
    if $calc($getinfo(grana,$nick) - $strip($2-)) < 0 { notice $nick Você não pode pagar mais do que tem em mãos. | return }
    var %total $calc( [ %velho ] - $strip($2-))
    var %total $int( [ %total ] )
    if %total < 0 { notice $nick Bloqueado. Pelo menos no PkBR Bank não existe dívida negativa :P | return }
    if %total !isnum { notice $nick Erro desconhecido, bloqueando. | return }
    setinfo grana $nick $calc($getinfo(grana,$nick) - $strip($2-))
    notice $nick Sua dívida agora é %total
    writeini bank.ini emprestimo $sc($nick) %total
  }
  if $strip($1) == @ajuda { dcc send $nick ajuda.txt }
  if $strip($1) == @loja { dcc send $nick precos.txt }
  if $strip($1) == @comprar {
    if $getinfo(pokes,$nick) == $null { notice $nick Você não está cadastrado. | return }
    if $xidentified($nick) == $false { notice $nick Você não está identificado. | return }
    if $strip($2) == $null { notice $nick Formato: @Comprar Item | return }
    if $getdiv($nick) > 1500 { notice $nick Bloqueado: Pare de comprar coisas e passe a pagar sua dívida. | return }
    if $readini(mart.ini,mart,$strip($2)) == $null { notice $nick Item não encontrado. Digite @Loja para pegar a lista de itens disponíveis. | return }
    if $getinfo(grana,$nick) < $readini(mart.ini,mart,$strip($2)) { notice $nick Dinheiro insuficiente. | return }
    var %p $readini(mart.ini,mart,$strip($2))
    var %i $strip($2)
    if tm* iswm %i || hm* iswm %i { var %i $upper( [ %i ] ) }
    else { var %i $xbah( [ %i ] ) }
    if %i == $null { notice $nick Erro desconhecido. | write err.txt $asctime - $script / l $scriptline / com $nick | return }
    setinfo grana $nick $calc($getinfo(grana,$nick) - %p)
    if $getinfo(itens,$nick) == noitens { setinfo itens $nick %i }
    else { setinfo itens $nick $getinfo(itens,$nick) %i }
    notice $nick Item comprado. Agora você tem $chr(36) $+ $getinfo(grana,$nick) $+ .
  }
  if $strip($1) == @vender {
    if $getinfo(pokes,$nick) == $null { notice $nick Você não está cadastrado. | return }
    if $xidentified($nick) == $false { notice $nick Você não está identificado. | return }
    if $strip($2) == $null { notice $nick Formato: @Vender Item | return }
    if $istok($getinfo(itens,$nick),$strip($2),32) == $false { notice $nick Você não tem o item $strip($2) $+ . | return }
    var %p $readini(mart.ini,mart,$strip($2))
    var %p $calc( [ %p ] / 2)
    setinfo grana $nick $calc($getinfo(grana,$nick) + %p)
    var %itens $deltok($getinfo(itens,$nick),$findtok($getinfo(itens,$nick),$strip($2),1,32),32) | setinfo itens $nick $iif(%itens,%itens,noitens)
    notice $nick Item comprado. Agora você tem $chr(36) $+ $getinfo(grana,$nick) $+ .
  }
  if $strip($1) == @descadastrar && $getinfo(pokes,$nick) { if $xidentified($nick) { delinfo pokes $nick | delinfo levels $nick | delinfo itens $nick | delinfo grana $nick | delpass $nick | deldiv $nick | xunidentify $nick | mode %chan -v $nick } }
  if $strip($1) == @tmdex && $num($strip($2)) && $strip($2) isnum { var %a 0 | while %a < 50 { inc %a | var %txt $readini(tms.ini,tm-compat, [ %a ] ) | if $istok(%txt,$strip($2),32) { var %b %b %a } } | msg %chan $pkbr TMs que podem ser utilizados em $xbah($num($strip($2))) $+ : $comvirgula(%b) }
  if $strip($1) == @hmdex && $num($strip($2)) && $strip($2) isnum { var %a 0 | while %a < 5 { inc %a | var %txt $readini(tms.ini,hm-compat, [ %a ] ) | if $istok(%txt,$strip($2),32) { var %b %b %a } } | msg %chan $pkbr HMs que podem ser utilizados em $xbah($num($strip($2))) $+ : $comvirgula(%b) }
  if $strip($1) == @desafiar {
    if $jahadv($nick) { return }
    if $timer(5 $+ $nick) { notice $nick Aguarde 5 minutos para lutar ou capturar novamente. (Faltam $duration($timer(5 $+ $nick).secs) $+ ) | settemp jahadv $nick x | return }
    if $istok(%cap.fila,$nick,32) { notice $nick Você está na fila de capturas. | return }
    if $timer(5 $+ $strip($2)) { notice $nick $strip($2) deve aguardar 5 minutos para lutar ou capturar novamente. (Faltam $duration($timer(5 $+ $strip($2)).secs) $+ ) | return }
    if $istok(%cap.fila,$strip($2),32) { notice $nick Você está na fila de capturas. | return }
    if $numtok(%fight.fila,32) >= 20 { notice $nick Fila cheia. | return }
    if $numtok($getinfo(pokes,$nick),32) < $strip($3) || $strip($2) <= 0 { notice $nick Você tem $numtok($getinfo(pokes,$nick),32) pokémons. | return }
    if $strip($3) == $null { notice $nick Sintaxe: @Desafiar [Nick] [ID do seu pokémon] | return }
    if $strip($2) == $nick { notice $nick Você não pode desafiar a si mesmo... | return }
    if $strip($3) !isnum { notice $nick What? $strip($3) não é um número :P. | return }
    if $getinfo(pokes,$nick) == $null { notice $nick Você não pode desafiar alguém sem ser cadastrado :P... | return }
    if $strip($2) !ison %chan { notice $nick $strip($2) não está no $remove(%chan,$chr(35)) $+ . | return }
    if $getinfo(pokes,$strip($2)) == $null { notice $nick $strip($2) não está cadastrado. | return }
    if %desafio. [ $+ [ $strip($2) ] ] { notice $nick $strip($2) já está sendo desafiado. | return }
    if $xidentified($nick) == $false { notice $nick Você não está identificado. | return }
    if $xidentified($strip($2)) == $false { notice $nick $strip($2) não está identificado. | return }
    if $istok(%fight.fila,$strip($2),32) { notice $nick $strip($2) já está na fila de lutas. | return }
    if $istok(%fight.fila,$nick,32) { notice $nick Você já está incluído na fila. | return }
    msg $strip($2) $nick está te desafiando para uma batalha pokémon. Ele usará $gettok($getinfo(pokes,$nick),$strip($3),32) LVL $gettok($getinfo(levels,$nick),$strip($3),32) $+ . Aceita? @Aceitar  $+ $nick $+  ID do seu pokémon (no PVT). Caso contrário, @Rejeitar  $+ $nick $+  <Motivo (opcional)>. Você tem 2 minutos para responder.
    set %xpoke. [ $+ [ $nick ] ] $strip($3)
    set %desafio. [ $+ [ $strip($2) ] ] $nick
    .timer1 $+ $strip($2) 1 120 xdesafio $strip($2)
  }
  if $strip($1) == @capturar {
    if $jahadv($nick) { return }
    if $timer(5 $+ $nick) { notice $nick Aguarde 5 minutos para lutar ou capturar novamente. (Faltam $duration($timer(5 $+ $nick).secs) $+ )  | settemp jahadv $nick x | return }
    if $istok(%fight.fila,$nick,32) { notice $nick Você está na fila de lutas. | return }
    if $getinfo(pokes,$nick) == $null { notice $nick Você não está cadastrado. | return }
    if $xidentified($nick) == $false { notice $nick Você não está identificado. | return }
    if $istok(%cap.fila,$nick,32) { notice $nick Você já está na fila de capturas. | return }
    if $findtok(%caps,$nick,0,32) >= 10 { notice $nick Você já atingiu o limite de tentativas de capturas diárias (10). | return }
    if $strip($2) == $null { notice $nick Sintaxe: @capturar [ID do seu pokémon] | return }
    if $strip($2) !isnum { notice $nick O ID do seu pokémon deve ser um número. | return }
    if $numtok($getinfo(pokes,$nick),32) < $strip($2) || $strip($2) <= 0 { notice $nick Você tem $numtok($getinfo(pokes,$nick),32) pokémons. | return }
    if *ball* !iswm $getinfo(itens,$nick) { notice $nick Voce não tem nenhum tipo de pokeball para poder capturar. | return }
    if $numtok($getinfo(pokes,$nick),32) >= 70 { notice $nick Você tem muitos pokémons. | return }
    notice $nick Você foi adicionado na fila de capturas.
    set %cap.fila %cap.fila $nick
    set %cap.poke. [ $+ [ $nick ] ] $strip($2)
    set %caps %caps $nick
    capfila
    if %sbp.player1 == $null && $timer(luta) == $null {
      iniciar captura
    }
  }
  if $strip($1) == @treinar {
    if $jahadv($nick) { return }
    if $timer(5 $+ $nick) { notice $nick Aguarde 5 minutos para lutar ou capturar novamente. (Faltam $duration($timer(5 $+ $nick).secs) $+ )  | settemp jahadv $nick x | return }
    if $istok(%cap.fila,$nick,32) { notice $nick Você está na fila de capturas. | return }
    if $findtok(%fight.fila,pkbr,0,32) >= 5 { notice $nick 5 treinos já estão na fila, que é o limite. | return }
    ;notice $nick Treinos bloqueados. Por enquanto fique apenas com lutas no estilo "humano vs humano", pelo comando @Desafiar [nick] [ID]. | return
    if $numtok(%fight.fila,32) >= 20 { notice $nick Fila cheia. | return }
    if $getinfo(pokes,$nick) == $null { notice $nick Você não está cadastrado. | return }
    elseif $xidentified($nick) == $false { notice $nick Você não está identificado. | return }
    elseif $istok(%fight.fila,$nick,32) { notice $nick Você já está na fila de lutas. | return }
    elseif $strip($2) == $null { notice $nick Sintaxe: @treinar [ID do seu pokémon] | return }
    elseif $strip($2) !isnum { notice $nick O ID do seu pokémon deve ser um número. | return }
    elseif $numtok($getinfo(pokes,$nick),32) < $strip($2) { notice $nick Você tem $numtok($getinfo(pokes,$nick),32) pokémons. | return }
    else { notice $nick Você foi adicionado na fila de lutas. }
    set %fight.fila %fight.fila $nick PkBR
    set %xpoke. [ $+ [ $nick ] ] $strip($2)
    fila
    if %sbp.player1 == $null && $timer(luta) == $null {
      iniciar luta
    }
  }
  if $strip($1) == @pokedex  {
    dcc send $nick pokedex.txt
  }
  if $strip($1) == @fila {
    fila
  }
  if $strip($1) == @capfila { capfila }
  if $strip($1) == @lancar && $strip($2) && %sbp.player [ $+ [ %sbp.vez ] ] == $nick && %modo == cap {
    msg %chan $pkbr $cor(3) $+ O comando agora é $cor(1) $+ @usar
  }
  if $strip($1) == @usar {
    if $getinfo(pokes,$nick) == $null { notice $nick Voce não está cadastrado. | return }
    if $xidentified($nick) == $false { notice $nick Voce não está identificado. | return }
    if $istok($getinfo(itens,$nick),$strip($2),32) == $false { notice $nick Voce não tem $strip($2) | return }
    if hm* iswm $strip($2) || tm* iswm $strip($2) || *stone iswm $strip($2) || $strip($2) == rarecandy { goto p }
    if %sbp.player [ $+ [ %sbp.vez ] ] != $nick { nc %chan $nick Não é sua vez. | return }
    if $nick == %sbp.player1 { var %p 1 }
    if $nick == %sbp.player2 { var %p 2 }
    :p
    if %sbp.vez == %p {
      if $strip($2-) == potion { item $+ %p potion | var %usou x }
      if $strip($2-) == superpotion { item $+ %p superpotion | var %usou x }
      if $strip($2-) == hyperpotion { item $+ %p hyperpotion | var %usou x }
      if $strip($2-) == maxpotion { item $+ %p maxpotion | var %usou x }
      if $strip($2-) == antidote { item $+ %p antidote | var %usou x }
    }
    if $strip($2) == rarecandy {
      if $nick == %sbp.player1 || $nick == %sbp.player2 { notice $nick Não é permitido o uso de RareCandy em luta. | return }
      if $strip($3-) !isnum && $strip($3-) < $gettok($getinfo(levels,$nick),$strip($3-),32) { notice $nick ID inválido. | return }
      if $gettok($getinfo(levels,$nick),$strip($3-),32) == 100 { notice $nick Voce não pode usar rarecandy neste pokemon, ele já está no level máximo. | return }
      var %lvl $gettok($getinfo(levels,$nick),$strip($3-),32)
      setinfo levels $nick $puttok($getinfo(levels,$nick),$calc(%lvl + 1),$strip($3-),32)
      notice $nick O level de $gettok($getinfo(pokes,$nick),$strip($3-),32) agora é $calc(%lvl + 1)
      var %usou x
    }
    if *stone iswm $strip($2) && $strip($3) isnum {
      var %pkm $gettok($getinfo(pokes,$nick),$strip($3),32)
      if %pkm == $null { return }
      if %pkm == eevee {
        if $strip($2) == thunderstone { var %evol Jolteon }
        if $strip($2) == firestone { var %evol Flareon }
        if $strip($2) == waterstone { var %evol Vaporeon }
        if %evol == $null { notice $nick Eevee não aceita outra stone além de thunder, fire ou waterstone. | return }
        setinfo pokes $nick $puttok($getinfo(pokes,$nick),%evol,$strip($3),32)
        msg %chan $pkbr O $xbah(%pkm) de $nick evoluiu!
        var %usou x
        goto p.evo
      }
      if $evo(%pkm) == $strip($2) { setinfo pokes $nick $puttok($getinfo(pokes,$nick),$xbah($num($calc($num(%pkm) + 1))),$strip($3-),32) | msg %chan $pkbr O $xbah(%pkm) de $nick evoluiu! | var %usou x }
      else notice $nick $xbah(%pkm) não aceita $strip($2)
      :p.evo
    }
    if tm* iswm $strip($2) && $strip($3) isnum {
      var %tm $remove($strip($2),tm)
      if %tm !isnum { notice $nick TM inválido | return }
      var %pkm $gettok($getinfo(pokes,$nick),$strip($3),32)
      if %pkm isnum || %pkm == $null { return }
      if $istok($readini(tms.ini,tm-compat,%tm),$num(%pkm),32) { setinfo tms $nick $puttok($getinfo(tms,$nick),%tm,$strip($3-),32) | notice $nick Seu pokemon agora tem um novo golpe. }
      else notice $nick $xbah(%pkm) não aceita $strip($2)
    }
    if hm* iswm $strip($2) && $strip($3) isnum {
      var %hm $remove($strip($2),hm)
      if %hm !isnum { notice $nick HM inválido | return }
      var %pkm $gettok($getinfo(pokes,$nick),$strip($3),32)
      if %pkm isnum || %pkm == $null { return }
      if $istok($readini(hms.ini,hm-compat,%hm),$num(%pkm),32) { setinfo hms $nick $puttok($getinfo(hms,$nick),%hm,$strip($3-),32) | notice $nick Seu pokemon agora tem um novo golpe. }
      else notice $nick $xbah(%pkm) não aceita $strip($2)
    }
    if *ball iswm $strip($2) && %modo == cap {
      sbp.cap $nick $strip($2)
      if %poke1 == $null { var %usou x }
    }
    if %usou != $null { var %itens $deltok($getinfo(itens,$nick),$findtok($getinfo(itens,$nick),$strip($2),1,32),32) | setinfo itens $nick $iif(%itens,%itens,noitens) }
  }
  if $isadmin($nick) {
    if $strip($1) == !loteria {
      if $strip($2) == -f { var %a $calc(10 - $ini(temp.ini,lot,0)) | msg %chan $pkbr $cor(3) $+ Falta $+ $iif(%a > 1,m) $cor(1) $+ %a $cor(3) $+ aposta $+ $iif(%a > 1,s) $+ . }
      if $strip($2) == -n { echo -s lalalalala | var %b 0 | while %b < $ini(temp.ini,lot,0) { inc %b | var %n $ini(temp.ini,lot, [ %b ] ) | var %nicks %nicks $cc(%n) } | msg %chan $pkbr $cor(1) $+ Nicks apostadores: $cor(3) $+ $reptok($replace($comvirgula(%nicks),$chr(44),$cor(1) $+ $chr(44) $+ $cor(3)),e,$cor(1) $+ e $+ $cor(3),1,32) }
      if $strip($2) == -p { msg %chan $pkbr $cor(1) $+ Prêmio atual: $cor(3) $+ %lot.premio }
    }
    if $strip($1) == !luta { sbp.inicio $strip($2-) }
    if $strip($1) == !pular { poke $+ %sbp.vez $+ passar }
    if $strip($1) == !vencedor && $2 { sbp.fim $strip($2) }
    if $strip($1) == !naolutar && $2 {
      if $istok(%fight.fila,$2,32) == $false { notice $nick $2 não está na fila | return }
      var %a 0 | while %a < $numtok(%fight.fila,32) {
        inc %a
        var %luta $gettok(%fight.fila, [ %a ] ,32) $gettok(%fight.fila,$calc( [ %a ] +1),32)
        if $istok(%luta,$strip($2),32) { goto p }
        var %lutas %lutas %luta
        :p
        inc %a
      }
      notice $nick $2 removido da fila de lutas.
      set %fight.fila %lutas
      fila
    }
    if $strip($1) == !naocapturar && $2 { notice $nick $gettok(%cap.fila,$findtok(%cap.fila,$2,1,32),32) removido da fila de capturas. | set %cap.fila $deltok(%cap.fila,$findtok(%cap.fila,$2,1,32),32) }
    if $strip($1) == !tm1 && $2 { set %tm1 %tm1 $strip($2) }
    if $strip($1) == !tm2 && $2 { set %tm2 %tm2 $strip($2) }
    if $strip($1) == !zerar { zerartudo }
    if $strip($1) == !trocar {
      var %pk1 $gettok($getinfo(pokes,$2),$3,32)
      var %lv1 $gettok($getinfo(levels,$2),$3,32)
      var %tm1 $gettok($getinfo(tms,$2),$3,32)
      var %hm1 $gettok($getinfo(hms,$2),$3,32)
      var %pk2 $gettok($getinfo(pokes,$4),$5,32)
      var %lv2 $gettok($getinfo(levels,$4),$5,32)
      var %tm2 $gettok($getinfo(tms,$4),$5,32)
      var %hm2 $gettok($getinfo(hms,$4),$5,32)
      if $evo(%pk1) == troca { var %pk1 $replace($xbah($ini(pokedex.ini,golpes,$calc($num(%pk1) + 1))),mime,Mime) }
      if $evo(%pk2) == troca { var %pk2 $replace($xbah($ini(pokedex.ini,golpes,$calc($num(%pk2) + 1))),mime,Mime) }
      setinfo pokes $2 $puttok($getinfo(pokes,$2),%pk2,$3,32)
      setinfo pokes $4 $puttok($getinfo(pokes,$4),%pk1,$5,32)
      setinfo levels $2 $puttok($getinfo(levels,$2),%lv2,$3,32)
      setinfo levels $4 $puttok($getinfo(levels,$4),%lv1,$5,32)
      setinfo tms $2 $puttok($getinfo(tms,$2),%tm2,$3,32)
      setinfo tms $4 $puttok($getinfo(tms,$4),%tm1,$5,32)
      setinfo hms $2 $puttok($getinfo(hms,$2),%hm2,$3,32)
      setinfo hms $4 $puttok($getinfo(hms,$4),%hm1,$5,32)
      notice $nick Trocado!
    }
    if $strip($1) == !vender {
      ; !vender nick id nick2 preco
      var %pkm $gettok($getinfo(pokes,$2),$3,32)
      var %lvl $gettok($getinfo(levels,$2),$3,32)
      var %tm $gettok($getinfo(tms,$2),$3,32)
      var %hm $gettok($getinfo(hms,$2),$3,32)
      var %grn1 $getinfo(grana,$2)
      var %grn2 $getinfo(grana,$4)
      if $istok(%fight.fila,$2,32) { notice $nick Bloqueado: $strip($2) está na fila de lutas. | return }
      if $istok(%cap.fila,$2,32) { notice $nick Bloqueado: $strip($2) está na fila de capturas. | return }
      if $calc(%grn2 - $5) < 0 { return }
      setinfo pokes $2 $deltok($getinfo(pokes,$2),$3,32)
      setinfo levels $2 $deltok($getinfo(levels,$2),$3,32)
      setinfo tms $2 $deltok($getinfo(tms,$2),$3,32)
      setinfo hms $2 $deltok($getinfo(hms,$2),$3,32)
      setinfo pokes $4 $getinfo(pokes,$4) %pkm
      setinfo levels $4 $getinfo(levels,$4) %lvl
      setinfo tms $4 $getinfo(tms,$4) %tm
      setinfo hms $4 $getinfo(hms,$4) %hm
      setinfo grana $4 $calc(%grn2 - $5)
      setinfo grana $2 $calc(%grn1 + $5)
      notice $nick Vendido!
    }
    if $strip($1) == !favorecer && $2 {
      if $2 == 1 { set %poke1ata $calc(%poke1ata + 2) }
      if $2 == 2 { set %poke2ata $calc(%poke2ata + 2) }
      msg %chan %sbp.player [ $+ [ $2 ] ] favorecido.
    }
    if $strip($1) == !iniciar {
      iniciar $strip($2)
    }
  }
  if $strip($1) == @golpe {
    xatacar $nick $strip($2-)
  }
}
on *:invite:%chan:{ if $isadmin($nick) { join %chan } }
alias iniciar {
  if $1 == luta {
    var %nick1 $gettok(%fight.fila,1,32)
    var %poke1 %xpoke. [ $+ [ %nick1 ] ]
    var %level1 $gettok($getinfo(levels, [ %nick1 ] ), [ %poke1 ] ,32)
    var %num1 $ini(pokedex.ini,golpes,$gettok($getinfo(pokes, [ %nick1 ] ), [ %poke1 ] ,32))
    var %nick2 $gettok(%fight.fila,2,32)
    if %nick2 != PkBR {
      var %poke2 %xpoke. [ $+ [ %nick2 ] ]
      var %level2 $gettok($getinfo(levels, [ %nick2 ] ), [ %poke2 ] ,32)
      var %num2 $ini(pokedex.ini,golpes,$gettok($getinfo(pokes, [ %nick2 ] ), [ %poke2 ] ,32))
      set %modo fight
    }
    else {
      if %level1 <= 36 { var %level2 $rand(25,35) }
      if %level1 > 36 && %level1 < 46 { var %level2 $rand(36,45) }
      if %level1 >= 46 && %level1 < 56 { var %level2 $rand(46,55) }
      if %level1 >= 56 && %level1 < 66 { var %level2 $rand(56,65) }
      if %level1 >= 66 && %level1 < 76 { var %level2 $rand(66,75) }
      if %level1 >= 76 && %level1 < 86 { var %level2 $rand(76,85) }
      if %level1 >= 86 && %level1 < 96 { var %level2 $rand(86,95) }
      if %level1 >= 96 { var %level2 $rand(96,100) }
      var %num2 $rand(1,149)
    }
    if $gettok($getinfo(tms,%nick1),%poke1,32) isnum { set %tm1 $readini(tms.ini,tms,$gettok($getinfo(tms,%nick1),%poke1,32)) }
    if $gettok($getinfo(tms,%nick2),%poke2,32) isnum { set %tm2 $readini(tms.ini,tms,$gettok($getinfo(tms,%nick2),%poke2,32)) }
    if $gettok($getinfo(hms,%nick1),%poke1,32) isnum { set %hm1 $readini(tms.ini,hms,$gettok($getinfo(hms,%nick1),%poke1,32)) }
    if $gettok($getinfo(hms,%nick2),%poke2,32) isnum { set %hm2 $readini(tms.ini,hms,$gettok($getinfo(hms,%nick2),%poke2,32)) }
    msg %chan $pkbr Iniciando luta em 10 segundos... | .timerluta 1 10 sbp.inicio %nick1 %num1 %level1 %nick2 %num2 %level2
  }
  if $1 == captura {
    var %nick1 $gettok(%cap.fila,1,32)
    var %poke1 %cap.poke. [ $+ [ %nick1 ] ]
    var %level1 $gettok($getinfo(levels, [ %nick1 ] ), [ %poke1 ] ,32)
    var %num1 $ini(pokedex.ini,golpes,$gettok($getinfo(pokes, [ %nick1 ] ), [ %poke1 ] ,32))
    var %med $med( [ %nick1 ] )
    var %med $int( [ %med ] )
    if %med <= 45 { var %level2 25 }
echo -s %med
    if %med >= 46 && %med <= 55 { var %level2 $rand(26,35) }
    if %med >= 56 && %med <= 65 { var %level2 $rand(36,45) }
    if %med >= 66 && %med <= 75 { var %level2 $rand(46,55) }
    if %med >= 76 && %med <= 85 { var %level2 $rand(56,65) }
    if %med >= 86 && %med <= 95 { var %level2 $rand(66,75) }
    if %med >= 96 { var %level2 $rand(76,80) }
    set %modo cap
    if $gettok($getinfo(tms,%nick1),%poke1,32) isnum { set %tm1 $readini(tms.ini,tms,$gettok($getinfo(tms,%nick1),%poke1,32)) }
    if $gettok($getinfo(tms,%nick2),%poke2,32) isnum { set %tm2 $readini(tms.ini,tms,$gettok($getinfo(tms,%nick2),%poke2,32)) }
    if $gettok($getinfo(hms,%nick1),%poke1,32) isnum { set %tm1 $readini(tms.ini,hms,$gettok($getinfo(hms,%nick1),%poke1,32)) }
    if $gettok($getinfo(hms,%nick2),%poke2,32) isnum { set %tm2 $readini(tms.ini,hms,$gettok($getinfo(hms,%nick2),%poke2,32)) }
    msg %chan $pkbr Iniciando captura em 10 segundos... | .timerluta 1 10 sbp.inicio %nick1 %num1 %level1 PkBR $rand(1,149) %level2
  }
}
alias media { if $isid { return $calc($calc($replace(%media,$chr(32),+)) / $numtok(%media,32)) } | else { set %media %media $nick(%chan,0) | set %media $calc($calc($replace(%media,$chr(32),+)) / $numtok(%media,32)) } }
alias semacento {
  return $replace($1-,á,a,à,a,ä,a,â,a,ã,a,é,e,ë,e,è,e,ê,e,í,i,î,i,ï,i,ì,i,ó,o,ò,o,ö,o,ô,o,õ,o,ú,u,ù,u,ü,u,û,u)
}
