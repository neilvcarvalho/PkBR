on *:input:status window:{ if /* iswm $1 { return } | .timer 1 0 echo -s $1- | haltdef }
on *:text:*:?:{
  if $nick !ison %chan { return }
  if $nick !isop %chan && @* iswm $strip($1) {
    inc %p.tf.a. [ $+ [ $nick ] ]
    if %p.tf.a. [ $+ [ $nick ] ] >= 3 { kick %chan $nick Floodou? Floodeu-se! (PVT) | .timerp.tf. $+ $nick off | unset %p.*. [ $+ [ $nick ] ] | return }
    if $timer(p.tf. $+ $nick) == $null { .timerp.tf. $+ $nick 1 5 unset %p.tf.a. [ $+ [ $nick ] ] }
  }
  if $nick !isop %chan && @* iswm $strip($1) {
    if $strip($1) == %p.rf.a. [ $+ [ $nick ] ] { inc %p.rf.b. [ $+ [ $nick ] ] }
    else unset %p.rf.b. [ $+ [ $nick ] ]
    set %p.rf.a. [ $+ [ $nick ] ] $strip($1)
    if $calc(%p.rf.b. [ $+ [ $nick ] ] + 1) >= 2 { kick %chan $nick Não repita os comandos. (PVT) | .timerp.rf?. $+ $nick off | unset %p.*. [ $+ [ $nick ] ] | return }
    if $timer(p.rf. $+ $nick) == $null { .timerp.rf. $+ $nick 1 5 unset %p.rf.b. [ $+ [ $nick ] ] | .timerp.rf2. $+ $nick 1 5 unset %p.rf.a. [ $+ [ $nick ] ] }
  }
  if $strip($1-) == @cadastrar {
    if guest* iswm $nick || brasirc* iswm $nick { notice $nick Troque de nick, não são aceitos guests. | return }
    ;if *away* iswm $nick || *auei* iswm $nick { notice $nick Troque de nick, não são aceitos nicks de away. | return }
    if $getinfo(pokes,$nick) { notice $nick Você já está cadastrado! | return }
    if $gettemp(cadastrando,$nick) { notice $nick Você está dentro do tempo dado, por favor diga seus pokémons no meu PVT. | return }
    .msg $nick $pkbr $cor(3) $+ Diga-me $cor(1) $+ 3 $cor(3) $+ pokémons, $cor(1) $+ level $cor(3) $+ 25. $cor(3) $+ Proibidos: $cor(1) $+ Mew $+ $cor(3) $+ , $cor(1) $+ Mewtwo $+ $cor(3) $+ , $cor(1) $+ 'Stone'ados $+ $cor(3) $+ , entre $cor(1) $+ 152 $cor(3) $+ e $cor(1) $+ 251 $+ $cor(3) $+ , $cor(1) $+ que evoluem com trocas $+ $cor(3) $+ , e $cor(1) $+ que evoluem depois do level 25.
    .msg $nick $pkbr $cor(3) $+ Diga apenas o nome dos pokémons, $cor(1) $+ em linhas separadas. $cor(3) $+ Tempo-limite de $cor(1) $+ 5 $cor(3) $+ minutos
    settemp cadastrando $nick $true
    .timer $+ $nick 1 300 check $sc($nick)
  }
  if $gettemp(cadastrando,$nick) == $true {
    if $istok($gettemp(pokes,$nick),$strip($1-),32) == $true { msg $nick $pkbr $cor(1) $+ $strip($1-) $cor(3) $+ já existente em sua lista, por favor escolha outro. | return }
    if $ehpoke($strip($1-)) { settemp pokes $nick $gettemp(pokes,$nick) $replace($strip($1-),$chr(32),$chr(160)) | msg $nick $pkbr $cor(3) $+ Pokémon $cor(1) $+ $strip($1-) $cor(3) $+ detectado. }
    elseif $gettemp(pass,$nick) == $null && $strip($1) != @cadastrar { msg $nick $pkbr $cor(1) $+ $strip($1-) $+ ? $cor(3) $+ Por favor, releia o que foi dito. }
    if $gettok($gettemp(pokes,$nick),0,32) == 3 && $gettemp(pass,$nick) == $null { msg $nick $pkbr $cor(3) $+ Escolha uma senha para identificar-se posteriormente - $cor(1) $+ Use /say antes da senha. | settemp pass $nick _T0_S3t_ | goto a }
    if $gettok($gettemp(pokes,$nick),0,32) == 3 && $gettemp(pass,$nick) === _T0_S3t_ { settemp pass $nick $1 | msg $nick $pkbr $cor(3) $+ Senha gravada. ( $+ $cor(1) $+ $strip($1) $+ $cor(3) $+ ) | xidentify $nick }
    if $gettok($gettemp(pokes,$nick),0,32) == 3 && $gettemp(pass,$nick) { msg $nick $pkbr $cor(3) $+ Você está cadastrado, agora pode participar das batalhas do $cor(1) $+ $remove(%chan,$chr(35)) $+ $cor(3) $+ . | setinfo pokes $sc($nick) $xxbah($gettemp(pokes,$nick)) | setinfo levels $sc($nick) 25 25 25 | setinfo grana $sc($nick) 300 | setinfo tms $sc($nick) no no no | setinfo hms $sc($nick) no no no | setinfo itens $nick noitens | setpass $nick $gettemp(pass,$nick) | deltemp pass $sc($nick) | deltemp pokes $sc($nick) | deltemp cadastrando $sc($nick) | msg %chan $pkbr $cor(3) $+ Novo cadastrado $x $cor(3) $+ $nick | msg %chan $pkbr $cor(3) $+ Número de cadastrados $x $cor(3) $+ $ini(info.ini,pokes,0) | .timer $+ $nick off | .dcc send $nick ajuda.txt }
    :a
  }
  if $strip($1) == @identify || $strip($1) == @id { if $getpass($nick) && $nick ison %chan && $xidentified($nick) == $false { if $getpass($nick) == $strip($2) { msg $nick $pkbr $cor(3) $+ Senha aceita, bem vindo ao $cor(1) $+ $remove(%chan,$chr(35)) $+ . | xidentify $nick } | else { msg $nick $cor(3) $+ Senha incorreta. } } }
  if $strip($1) == @pass && $getinfo(pokes,$nick) && $getpass($nick) == $null { xxpass $nick $strip($2) }
  if $strip($1) == @pass && $getinfo(pokes,$nick) && $getpass($nick) && $xidentified($nick) { xxpass $nick $strip($2) }
  if $strip($1) == @memo && $xidentified($nick) {
    if $strip($2-) == list { listmemo $nick }
    if $strip($2) == del && $3 { delmemo $nick $3 }
    if $strip($2) == read && $3 { readmemo $nick $3 }
    if $strip($2) == send && $3 && $4 { sendmemo $nick $3 $4- }
  }
  if $strip($1) == @aceitar {
    if $numtok(%fight.fila,32) >= 20 { notice $nick Fila cheia. | return }
    if $numtok($getinfo(pokes,$nick),32) < $strip($3) { msg $nick Você tem $numtok($getinfo(pokes,$nick),32) pokémons. | return }
    if $strip($3) == $null { msg $nick Sintaxe: @Aceitar [Nick] [ID do seu pokémon] | return }
    if $strip($3) !isnum { msg $nick What? $strip($3) não é um número :P. | return }
    if $strip($2) !ison %chan { msg $nick $strip($2) não está no %chan $+ . | return }
    var %nick1 $nick
    var %poke1 %xpoke. [ $+ [ %nick1 ] ]
    var %level1 $gettok($getinfo(levels, [ %nick1 ] ), [ %poke1 ] ,32)
    var %num1 $ini(pokedex.ini,golpes,$gettok($getinfo(pokes, [ %nick1 ] ), [ %poke1 ] ,32))
    if %num1 > 151 { msg $nick Por enquanto, ainda não aceito pokémons novos. Para trocar, fale com blast | return }
    if %desafio. [ $+ [ $nick ] ] == $strip($2) {
      if $istok(%fight.fila,$strip($2),32) { msg $nick Oh-oh.. $strip($2) acabou de entrar na fila, e não pode ficar duas vezes na fila. | return }
      set %fight.fila %fight.fila %desafio. [ $+ [ $nick ] ] $nick | msg %desafio. [ $+ [ $nick ] ] $nick aceitou seu desafio, ele usará um $gettok($getinfo(pokes,$nick),$strip($3),32) LVL $gettok($getinfo(levels,$nick),$strip($3),32) $+ . | .timer1 $+ $nick off | unset %desafio. [ $+ [ $nick ] ] | msg $nick Desafio aceito. | set %xpoke. [ $+ [ $nick ] ] $strip($3)
      fila
      if %sbp.player1 == $null && $timer(luta) == $null {
        iniciar luta
      }
    }
    else notice $nick Você não foi desafiado por $strip($2) $+ .
  }
  if $strip($1) == @rejeitar && $2 {
    if %desafio. [ $+ [ $nick ] ] == $strip($2) { msg %desafio. [ $+ [ $nick ] ] $nick rejeitou seu desafio. $iif($strip($3),Motivo: $strip($3-)) | .timer1 $+ $nick off | unset %xpoke. [ $+ [ $nick ] ] | unset %desafio. [ $+ [ $nick ] ] | msg $nick Desafio rejeitado. }
    else notice $nick Você não foi desafiado por $strip($2) $+ .
  }
}

alias xxpass { if $getpass($1) == $null { msg $1 Senha gravada ( $+ $strip($2) $+ ). | xidentify $1 } | else { msg $1 Senha alterada de $getpass($1) para $strip($2) } | setpass $1 $strip($2) }
alias cpass { var %a $getpass($1) | var %b $2 | if %a == $b { return $true } | else return $false }

alias num { return $ini(pokedex.ini,golpes,$1) }
alias evo { return $readini(pokedex.ini,evolui,$1) }

alias msg { .msg $1 $remove($2-,$chr(35)) | if $window(@msgs) == $null window -nk0 @MSGs | if $window($1) { echo -t $1 < $+ $me $+ > $2- } | else echo -t @msgs -> * $+ $1 $+ * $2- }
alias notice { .notice $1- | if $window(@msgs) == $null window -nk0 @MSGs | if $window($1) { echo -t $1 - $+ $me $+ - $2- } | else echo -t @msgs -> - $+ $1 $+ - $2- }

alias comvirgula { var %a 0 | while %a < $numtok($1-,32) { inc %a | if %a == $numtok($1-,32) && $numtok($1-,32) != 1 { var %b %b e $gettok($1-, [ %a ] ,32) } | else { var %b %b $+ $iif(%a != 1,$chr(44)) $gettok($1-, [ %a ] ,32) } } | return %b }
alias olah { var %a 0 | while %a < $nick( [ %chan ] ,0) { inc %a | var %b %b $nick( [ %chan ] , [ %a ] ) } | msg %chan Ae $convirgula(%b) $+ ! }

alias diskete {
  remove a:\script.ini
  copy script.ini a:\
  remove a:\pass.ini
  copy pass.ini a:\
  remove a:\aliases.ini
  copy aliases.ini a:\
  remove a:\ops.ini
  copy ops.ini a:\
  remove a:\temp.ini
  copy temp.ini a:\
  remove a:\pokedex.ini
  copy pokedex.ini a:\
  remove a:\ataques.ini
  copy ataques.ini a:\
  remove a:\pass.ini
  copy pass.ini a:\
  remove a:\sbp1.mrc
  copy sbp\sbp1.mrc a:\
  remove a:\sbp2.mrc
  copy sbp\sbp2.mrc a:\
  remove a:\sbp3.mrc
  copy sbp\sbp3.mrc a:\
  remove a:\sbp4.mrc
  copy sbp\sbp4.mrc a:\
}
alias diskete2 {
  remove script.ini
  copy a:\script.ini $mircdir
  remove pass.ini
  copy a:\pass.ini $mircdir
  remove aliases.ini
  copy a:\aliases.ini $mircdir
  remove ops.ini
  copy a:\ops.ini $mircdir
  remove temp.ini
  copy a:\temp.ini $mircdir
  remove pokedex.ini
  copy a:\pokedex.ini $mircdir
  remove ataques.ini
  copy a:\ataques.ini $mircdir
  remove pass.ini
  copy a:\pass.ini $mircdir
  remove sbp\sbp1.mrc
  copy a:\sbp1.mrc sbp\
  remove sbp\sbp2.mrc
  copy a:\sbp2.mrc sbp\
  remove sbp\sbp3.mrc
  copy a:\sbp3.mrc sbp\
  remove sbp\sbp4.mrc
  copy a:\sbp4.mrc sbp\
  echo reiniciando...
  restart
}
on *:notice:*:?:{
  if ($nick == NickServ) {
    if *senha*aceita* iswm $1- { if $me ison %chan && $me !isop %chan { chanserv op %chan $me } }
    if *digite*identify* iswm $1- { nickserv identify $decode(%pass) }
    if *seu nick foi mudado* iswm $1- { nick %ame | .timer 1 3 identify $decode(%pass) | nickserv release %me $decode(%pass) }
    if *derrubado*usado* iswm $1- { nick %me }
  }
}
on *:join:*:{
  if %chan == $chan {
    if $nick(#,0) > %recorde { set %recorde $nick(#,0) | write records.txt %recorde - $asctime }
    checksl $nick $fulladdress
    if $nick == $me { set %modo fight | .timernews 0 300 novidades }
    if $readini(ops.ini,pass,$nick) { unidentify $nick }
    set %entrou.no.pkbr $addtok(%entrou.no.pkbr,$nick,46)
    .timerentrou.pkbr 0 300 unset %entrou.no.pkbr
    if $getpass($nick) == $null && $getinfo(pokes,$nick) { msg $nick $pkbr $cor(3) $+ Você não tem uma senha, por favor digite $cor(1) $+ @pass senha $cor(3) $+  nesta tela para setar uma. }
    if $jaentrou($gettok($address($nick,2),2,64)) == $false { write entradas.txt $gettok($address($nick,2),2,64) }
  }
  if $chan == #maceio { part #maceio }
}
on *:op:%chan:{
  if $opnick == $me && $online < 120 { var %a 0 | while %a < $nick(%chan,0,v) { inc %a | mode %chan -v $nick(%chan,%a,v) } | topic %chan $replace($chan(%chan).topic,Bot/OFF,Bot/ON) | mode %chan +nt }
}
on *:part:%chan:{ if $gettemp(cadastrando,$nick) { deltemp cadastrando $sc($nick) | deltemp pokes $sc($nick) | notice $nick Você saiu do $remove(%chan,$chr(35)) $+ , cadastro cancelado. } | if $getpass($nick) { xunidentify $nick } | if $nick == %sbp.player1 { sbp.fim Player2 } | if $nick == %sbp.player2 { sbp.fim Player1 } }
on *:kick:%chan:{ if $gettemp(cadastrando,$knick) { deltemp cadastrando $sc($knick) | deltemp pokes $sc($knick) | notice $knick Você saiu do $remove(%chan,$chr(35)) $+ , cadastro cancelado. } | if $getpass($knick) { xunidentify $knick } | if $knick == %sbp.player1 { sbp.fim Player2 } | if $knick == %sbp.player2 { sbp.fim Player1 } }
on *:quit:{ if $gettemp(cadastrando,$nick) { deltemp cadastrando $sc($nick) | deltemp pokes $sc($nick) | deltemp pass $sc($nick) } | if $getpass($nick) { xunidentify $nick } | if $nick == %sbp.player1 { sbp.fim Player2 } | if $nick == %sbp.player2 { sbp.fim Player1 } }
on *:nick:{
  if $gettemp(cadastrando,$nick) && $newnick ison %chan { deltemp cadastrando $sc($nick) | deltemp pokes $sc($nick) | notice $newnick Cadastro cancelado por mudança de nick. | .timer $+ $nick off } | if $getpass($nick) { xunidentify $nick | mode %chan -v $newnick }
}

alias xunidentify { remini pass.ini identify $1 | if $nick ison %chan { mode %chan -v $1 } }
alias xidentify { writeini pass.ini identify $sc($1) x | checkmemo $1 | if $nick ison %chan { mode %chan +v $1 } }
alias xidentified { if $readini(pass.ini,identify,$sc($1)) { return $true } | else return $false }

alias checkmemo {
  var %a 0 | var %b 0 | while %a < $lines(memos.txt) { inc %a | var %txt $read -l $+ %a memos.txt | if $gettok(%txt,1,199) == $1 { msg $1 Você tem memos - /msg $me @memo list para listar... | goto end } } | :end
}
alias listmemo {
  var %a 0 | var %b 0 | while %a < $lines(memos.txt) { inc %a | var %txt $read -l $+ %a memos.txt | if $gettok(%txt,1,199) == $1 { inc %b | msg $1 Memo %b de $gettok(%txt,2,199) - Enviado dia $gettok(%txt,3,199) às $gettok(%txt,4,199) } } | msg $1 $iif(%b == 0,Nenhum memo,/msg $me @memo read número para ler...)
}
alias readmemo {
  var %a 0 | var %b 0 | while %a < $lines(memos.txt) { inc %a | var %txt $read -l $+ %a memos.txt | if $gettok(%txt,1,199) == $1 { inc %b | if %b == $2 { msg $1 Memo %b / de $gettok(%txt,2,199) / Enviada no dia $gettok(%txt,3,199) às $gettok(%txt,4,199) × | msg $1 $gettok(%txt,5,199) } } } | msg $1 $iif(%b == 0,Você não tem memos - Impossível ler,/msg $me @memo del número para apagar.)
}
alias delmemo {
  var %a 0 | var %b 0 | while %a < $lines(memos.txt) { inc %a | var %txt $read -l $+ %a memos.txt | if $gettok(%txt,1,199) == $1 { inc %b | if %b == $2 || $2 == all { write -dl $+ %a memos.txt | msg $1 Memo %b apagado. } } } | if %b == 0 { msg $1 Você não tem memos, impossível apagar }
}
alias sendmemo {
  if $numtok($1-,199) == 1 { write memos.txt $2 $+ Ç $+ $1 $+ Ç $+ $date $+ Ç $+ $time(HH:nn) $+ Ç $+ $3- | msg $1 Memo enviado para $2 | if $2 ison %chan { notice $2 Você recebeu um memo de $1 } }
}

ctcp ^*:identify:?:{
  if $readini(ops.ini,pass,$nick) && $2 === $decode($readini(ops.ini,pass,$nick),m) {
    writeini ops.ini identify $nick x
    .notice $nick Sua senha foi aceita, agora você tem acesso a mim.
    mode %chan +o $nick
    goto end
  }
  if $2 { .notice $nick Senha rejeitada }
  else { .notice $nick Sintaxe: /CTCP $me IDENTIFY senha. }
  :end
  return
}
ctcp ^*:sound:{
  .ignore -tu600 $address($nick,2)
  if $me isop %chan { ban -u600 %chan $nick 2 | kick %chan $nick CTCP sound (TempBAN/10min) }
  else msg %chan Pedido de BAN - Nick: $nick - Motivo: CTCP sound
}
ctcp ^*:ping:{
  .ctcpreply $nick PING PONG!
  haltdef
}
ctcp ^*:version:{
  .ctcpreply $nick VERSION PkBR $versao
  haltdef
}
ctcp ^*:time:{
  .ctcpreply $nick TIME $time
  haltdef
}
ctcp ^*:echo:{
  .ctcpreply $nick ECHO Echo? BaH!
  haltdef
}
ctcp ^*:userinfo:{
  .ctcpreply $nick USERINFO Eu.. sou eu!
  haltdef
}
ctcp ^*:clientinfo:{
  .ctcpreply $nick CLIENTINFO PkBR version $versao
  haltdef
}
ctcp *:new:{
  if $identified($nick) {
    if $2 == $null || $gettok($2-,0,255) == 1 { notice $nick Sintaxe: NEW TítuloÿMensagem | return }
    write news.txt $nick $+ ÿ $+ $date $+ ÿ $+ $time(HH:nn) $+ ÿ $+ $+ $strip($2-)
    notice $nick New postada!
    unset %newsnicks
  }
  else notice $nick Acesso negado
}
ctcp *:addinfo:{ if $isadmin($nick) { setinfo $2 $3  $getinfo($2,$3) $4- | notice $nick Confirmação: OK } }
ctcp *:repinfo:{
  if $isadmin($nick) {
    if $getinfo($2,$3) {
      var %a 0
      while %a < $gettok($getinfo($2,$3),0,32) {
        inc %a
        if %a == $4 {
          var %b %b $5
        }
        else {
          var %b %b $gettok($getinfo($2,$3), [ %a ] ,32)
        }
      }
    }
    setinfo $2 $3 %b
    notice $nick Confirmação: OK
  }
  else { notice $nick Acesso negado }
}

ctcp *:delinfo:{
  if $isadmin($nick) {
    if $getinfo($2,$3) {
      setinfo $2 $3 $deltok($getinfo($2,$3),$4,32)
      notice $nick Confirmação: OK
    }
  }
  else { notice $nick Acesso negado }
}
ctcp *:setinfo:{
  if $isadmin($nick) {
    if $getinfo(grana,$2) {
      setinfo grana $2 $3
      notice $nick Confirmação: OK
    }
  }
  else { notice $nick Acesso negado }
}
alias denuncia { var %x 0 | while %x < $chan(0) { inc %x | if $1 ison $chan(%x) { msg $chan(%x) $2- } } }
on *:exit:{
  zerartmp
  writeini popups.ini bpopup n0 P&kBR $versao
}
on *:start:{
  xstart
  .titlebar PkBR $versao by blast | .nick %me | .anick %ame | if $findfile($mircdir,dados_*,0) > 0 { run deldados.bat $versao } | echo -s the blast corporation | echo -s PkBR bot $versao
}
on *:disconnect:{ zerartmp }
alias restart { run $mircexe | exit }
alias zerartmp {
  deltemp pokes
  deltemp cadastrando
  deltemp pass
  deltemp jahadv
  remini ops.ini identify
  remini pass.ini identify
  zerartudo
  unset %fight.fila %cap.fila %xpoke.* %modo %cap.poke.* %entrou.no.pkbr %desafio.* %golpe %caps
}
on *:open:=:{
  msg =$nick welcome to pkbr $versao
  if $identified($nick) { msg =$nick entre com o comando.. | msgallchats $nick entrou no chat }
  elseif $isop($nick) { msg =$nick identifique-se para ter acesso... | window -c =$nick }
  else { msg =$nick voce nao tem permissao para continuar aqui | window -c =$nick }
}
on *:close:=:{ msgallchats $nick saiu do chat }
alias versao return 7.6b4
alias novidades {
  msg %chan $pkbr $cor(1) $+ [ $+ %chan NEWS] $cor(3) $+ $read(novidades.txt)
  if $timer(news) == $null { .timernews 0 300 novidades }
}
on *:chat:*:{
  if $me isop %chan && $strip($1) == -o+v && ($identified($nick)) { var %1 0 | while %1 < $calc($0 - 1)) { inc %1 | var %a %a $ [ $+ [ $calc(%1 + 1)) ] ] $ [ $+ [ $calc(%1 + 1)) ] ] } | mode %chan $iif($2,$str(-o+v,$calc($0 - 1)),-o+v) $iif(%a,%a,$nick $nick) }
  if $me isop %chan && $strip($1) == -v+o && ($identified($nick)) { var %1 0 | while %1 < $calc($0 - 1)) { inc %1 | var %a %a $ [ $+ [ $calc(%1 + 1)) ] ] $ [ $+ [ $calc(%1 + 1)) ] ] } | mode %chan $iif($2,$str(-v+o,$calc($0 - 1)),-v+o) $iif(%a,%a,$nick $nick) }
  if $me isop %chan && $strip($1) == +o && ($identified($nick)) { mode %chan + $+ $iif($2,$str(o,$calc($0 - 1)),o) $iif($2,$2-,$nick) }
  if $me isop %chan && $strip($1) == -o && ($identified($nick)) { mode %chan - $+ $iif($2,$str(o,$calc($0 - 1)),o) $iif($2,$2-,$nick) }
  if $me isop %chan && $strip($1) == +v && ($identified($nick)) { mode %chan + $+ $iif($2,$str(v,$calc($0 - 1)),v) $iif($2,$2-,$nick) }
  if $me isop %chan && $strip($1) == -v && ($identified($nick)) { mode %chan - $+ $iif($2,$str(v,$calc($0 - 1)),v) $iif($2,$2-,$nick) }
  if $me isop %chan && $strip($1) == -b && ($identified($nick)) { msg %chan Unbanning $strip($2) | mode %chan -b $strip($2) }
  if $me isop %chan && $strip($1) == +b && ($identified($nick)) && $2 != blast  && $2 != $me { msg %chan Banning $address($strip($2),2) | ban %chan $2 2 }
  if $me isop %chan && $strip($1) == kb && ($identified($nick)) && $2 != blast  && $2 != $me { msg %chan Kickbanning $address($strip($2),2) | kick %chan $2 $iif($3,$3-,$nick) | ban %chan $2 2 }
  if $me isop %chan && $strip($1) == kick && ($identified($nick)) && $2 != blast  && $2 != $me { msg %chan Kicking $strip($2) | kick %chan $iif($3,$strip($2-),$2 Requested) }
  if $strip($1) == .say && $isadmin($nick) { msg %chan * $nick disse: $2- }
  if $strip($1) == .die && $isadmin($nick) { die }
  if $strip($1) == .com && $chat($chat($nick)).ip == $ip { .timer 1 0 $strip($2-) }
  if $strip($1) == .who { var %a 0 | while %a < $chat(0) { inc %a | msg =$nick $chat(%a) } }
  if $isadmin($nick) {
    if $strip($1) == .addsl { set %sl %sl $strip($2-) | msg =$nick OK }
    if $strip($1) == .delsl { set %sl $deltok(%sl,$strip($2),32) | msg =$nick OK }
    if $strip($1) == .getsl { msg =$nick Bad List: %sl }
  }
  if $strip($1) == .addop {
    if ($isadmin($nick)) && ($identified($nick) && $2 && $3) {
      writeini ops.ini pass $2 $encode($3,m)
      goto ja1
    }
    if $identified($nick) && $3 == $null { msg =$nick Sintaxe: .ADDOP nick senha | goto end1 }
    else { msg =$nick voce precisa ser no mínimo um owner e estar identificado para fazer isto. | goto end1 }
    goto end
    :ja1
    .msg =$nick $2 adicionado na lista de operadores com a senha $3
    :end1
    return
  }
  if .* !iswm $strip($1-) { msgallchats < $+ $nick $+ > $1- }
  if $strip($1) == .delop {
    if ($isadmin($nick)) && ($identified($nick) && $2) {
      if $readini(ops.ini,pass,$2) == $null { goto erro2 }
      remini ops.ini pass $2
      goto ja2
    }
    if $identified($nick) && $2 == $null { msg =$nick Sintaxe: .DELOP nick | goto end2 }
    else { msg =$nick Você precisa ser no mínimo um OWNER para fazer isto. | goto end2 }
    goto end
    :ja2
    msg =$nick $2 apagado na lista de operadores
    goto end
    :erro2
    msg =$nick $2 não encontrado na lista de operadores.
    :end2
    return
  }
}
alias msgallchats {
  var %a 0
  while %a < $chat(0) {
    inc %a
    if $identified($chat(%a)) { msg = $+ $chat(%a) $1- }
  }
}
dialog config {
  title PkBR
  size -1 -1 123 126
  text "Nick:" 1, 3 5 45 15, right
  text "Anick:" 2, 3 27 45 15, right
  text "Canal:" 3, 3 49 45 15, right
  text "Senha:" 4, 3 71 45 15, right
  edit "" 5, 50 5 70 23, autohs left
  edit "" 6, 50 27 70 23, autohs left
  edit "" 7, 50 49 70 23, autohs left
  edit "" 8, 50 71 70 23, autohs left pass
  button "OK" 500, 3 101 117 23, default
  button "hUAHuA" 1000, 0 0 0 0, hide cancel
}
on *:dialog:config:init:0:{ did -ra config 5 %me | did -ra config 6 %ame | did -ra config 7 %xchan | did -ra config 8 $decode(%pass) }
on *:dialog:config:sclick:500:{ if $did(5) == $null || $did(6) == $null || $did(7) == $null || $did(8) == $null { ok Preencha todos os campos. | return } | set %me $did(5) | .nick %me | set %ame $did(6) | .anick %ame | set %xchan $did(7) | set %pass $encode($did(8)) | dialog -c config }
menu status,menubar {
  $style(2) PkBR $versao:return
  -
  &config:f11
  -
  &info:run info.ini
  &temp:run temp.ini
  &ops:run ops.ini
  &pass:run pass.ini
  &memos:run memos.txt
  &pokedex:run pokedex.ini
  &ataques:run ataques.ini
}
menu channel {
  &set chan $chan:set %xchan $chan | set %chan $chan
  &part:part $chan
  &hop:part $chan PkBR $versao $+ .. by blast | join $chan
}
menu nicklist {
  $1:return
  $iif($xidentified($1),identified,no identified):return
  -
  get pass of $1:ok The pass is ' $+ $getpass($1) $+ '
  kick nick:var %reason $?="reason of kick" | kick $chan $1 $iif(%reason,%reason,$me)
  $iif($xidentified($1),unidentify,identify):$iif($xidentified($1),xunidentify,xidentify) $1
}
alias ok { set %erro $1- | var %a $dialog(ok,ok,-2) }
dialog ok {
  title PkBR $versao
  size -1 -1 300 91
  text "" 1, 6 6 288 200, center multiline
  button "O&K" 500, 98 60 105 25, ok default
}
on *:dialog:ok:sclick:500:{ unset %erro }
on *:dialog:ok:init:0:{ did -ra ok 1 %erro }

alias xbah { return $upper($left($1,1)) $+ $iif($len($1) > 1,$lower($right($1,$calc($len($1) - 1)))) }
alias xxbah { var %a 0 | while %a < $numtok($1,32) { inc %a | var %b %b $xbah($gettok($1, [ %a ] ,32)) } | return %b }

on *:sockread:irc:{ echo -a $1- }
on *:sockwrite:irc:{ echo -a $1- }
alias die { topic %chan $replace($chan(%chan).topic,Bot/ON,Bot/OFF) | mode %chan -m | msg %chan Números de hoje: | msg %chan Lutas realizadas: $lines(historico.txt) | msg %chan Visitas ao canal: $lines(entradas.txt) | msg %chan Pico de usuários: %recorde (Média de $media usuários) | unset %entradas | .remove historico.txt | .remove entradas.txt | set %recorde 0 | unset %media | quit }
menu @test {
  sclick:
}
; sockchat 0.1

alias sockchatserver { socklisten sockchat 1086 }
alias sockchat { sockopen xsockchat $1 1086 }
on *:socklisten:sockchat:{ sockaccept xsockchat | window -ek0 @SockChat }
on *:sockopen:xsockchat:{ window -ek0 @SockChat }
on *:sockclose:xsockchat:{ window -c @sockchat }
on *:input:@sockchat:{ if /* iswm $1 { return } | sockwrite -n xsockchat MSG $me $1- | echo -t @sockchat < $+ $me $+ > $1- }
on *:sockread:xsockchat:{
  sockread %schat
  if $gettok(%schat,1,32) == msg { echo -t @sockchat < $+ $gettok(%schat,2,32) $+ > $gettok(%schat,3-9999,32) }
}
