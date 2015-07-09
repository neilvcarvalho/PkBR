alias xatacar {
  if gym.* iswm %sbp.player2 && %sbp.vez == 2 {
    var %bah.gym $remove( [ %sbp.player2 ] ,gym.)
    var %bah.lider $readini(gym.ini,gyms, [ %bah.gym ] )
    if $1 == %bah.lider { var %bah.nick %sbp.player2 }
  }
  else var %bah.nick $1
  if %bah.nick == %sbp.player1 && %sbp.vez == 1 { var %poke $iif(%transform1 == sim, [ %poke2 ] , [ %poke1 ] ) | var %lvl %poke1level | var %pla 1 | var %opon 2 | var %disable %disable1 | var %tm %tm1 | var %sn %poke2sono }
  elseif %bah.nick == %sbp.player2 && %sbp.vez == 2 { var %poke $iif(%transform2 == sim, [ %poke1 ] , [ %poke2 ] ) | var %lvl %poke2level | var %pla 2 | var %opon 1 | var %disable %disable2 | var %tm %tm2 | var %sn %poke1sono }
  if %sbp.vez == %pla {
    if $istok($golpes(%poke,%lvl),$strip($2-),32) || $istok(%tm,$strip($2-),32) || $strip($2) == pof! {
      if %bah.nick == %sbp.player1 || %bah.nick == %sbp.player2  {
        if $strip($2) == dream-eater { if %sn == $null || %sn < 1 { nc %chan %bah.nick Você não pode usar Dream-Eater agora, pois o oponente não está dormindo. | return } }
        if $strip($2) == %disable [ $+ [ %pla ] ] { nc %chan $1 Golpe desabilitado. | return }
        var %tipo $readini(ataques.ini,ataques,$strip($2))
        if $chr(32) isin $strip($2-) { msg %chan Substitua os espaços por "-" | return }
        :inicio
        set %xtipo $readini(atktipos.ini,tipo,$strip($2))
        set %tipo [ $+ [ %pla ] ] %tipo
        if $strip($2) == pof! { poke $+ %pla $+ ataque pof }
        set %ataques [ $+ [ %pla ] ] %ataques [ $+ [ %pla ] ] $strip($2)
        if %tipo == ataqueinefetivo { poke $+ %pla $+ ataque inefetivo }
        if %tipo == ataquesuave { poke $+ %pla $+ ataque comum }
        if %tipo == ataquefraco { poke $+ %pla $+ ataque especial }
        if %tipo == ataquemédio { poke $+ %pla $+ ataque critico }
        if %tipo == ataqueforte { poke $+ %pla $+ ataque efetivo }
        if %tipo == ataque+forte { poke $+ %pla $+ ataque superefetivo }
        if %tipo == +defesa { poke $+ %pla $+ status def+ }
        if %tipo == +ataque { poke $+ %pla $+ status ata+ }
        if %tipo == +velocidade { poke $+ %pla $+ status vel+ }
        if %tipo == -defesa { poke $+ %opon $+ status def- }
        if %tipo == -ataque { poke $+ %opon $+ status ata- }
        if %tipo == -acerto { poke $+ %opon $+ status acerto- }
        if %tipo == -velocidade { poke $+ %opon $+ status vel- }
        if %tipo == quick-attack { poke $+ %pla $+ ataque quick }
        if %tipo == hyper-beam { poke $+ %pla $+ ataque hbeam }
        if %tipo == sonic-boom { poke $+ %pla $+ ataque boom }
        if %tipo == rest { if $xxxtok($strip($2),%pla) < 2 { poke $+ %pla $+ ataque rest } | else nc %chan %bah.nick Você não pode mais usar $strip($2-) | var %denied y | goto fim }
        if %tipo == transform { poke $+ %pla $+ ataque transform }
        if %tipo == veneno { poke $+ %opon $+ status poison }
        if %tipo == poison-gas { poke $+ %pla $+ ataque gas }
        if %tipo == rage { poke $+ %pla $+ ataque rage }
        if %tipo == horn-drill { xchecklevel %pla Hord-Drill | if $xxxtok($replace($strip($2),$chr(32),-),%pla) < 4 { poke $+ %pla $+ ataque mortal HornDrill } | else nc %chan %bah.nick Você não pode mais usar $strip($2-) | var %denied y | goto fim }
        if %tipo == whirlwind { xchecklevel %pla WirlWind | if $xxxtok($replace($strip($2),$chr(32),-),%pla) < 4 { poke $+ %pla $+ ataque mortal WhirlWind } | else nc %chan %bah.nick Você não pode mais usar $strip($2-) | var %denied y | goto fim }
        if %tipo == guilhotine { xchecklevel %pla Guilhotine | if $xxxtok($replace($strip($2),$chr(32),-),%pla) < 4 { poke $+ %pla $+ ataque mortal Guilhotine } | else nc %chan %bah.nick Você não pode mais usar $strip($2-) | var %denied y | goto fim }
        if %tipo == fissure { xchecklevel %pla Fissure | if $xxxtok($replace($strip($2),$chr(32),-),%pla) < 4 { poke $+ %pla $+ ataque mortal Fissure } | else nc %chan %bah.nick Você não pode mais usar $strip($2-) | var %denied y | goto fim }
        if %tipo == roar { xchecklevel %pla Roar | if $xxxtok($replace($strip($2),$chr(32),-),%pla) < 4 { poke $+ %pla $+ ataque mortal Roar } | else nc %chan %bah.nick Você não pode mais usar $strip($2-) | var %denied y | goto fim }
        if %tipo == metronome { poke $+ %pla $+ ataque metronome | var %tipo %metronome.tipo | unset %metronome.tipo | goto inicio }
        if %tipo == substitute { if $xxxtok($replace($strip($2),$chr(32),-),%pla) < 2 { poke $+ %pla $+ ataque substitute } | else nc %chan %bah.nick Você não pode mais usar $strip($2-) | var %denied y | goto fim }
        if %tipo == recover { if $xxxtok($strip($2),%pla) < 2 { poke $+ %pla $+ status recover } | else nc %chan %bah.nick Você não pode mais usar $strip($2-) | var %denied y | goto fim }
        if %tipo == semefeito { poke $+ %pla $+ passar }
        if %tipo == poison-sting { poke $+ %pla $+ ataque sting }
        if %tipo == tranform { poke $+ %pla $+ ataque tranform }
        if %tipo == mist { poke $+ %pla $+ ataque mist }
        if %tipo == haze { poke $+ %pla $+ ataque haze }
        if %tipo == leech-seed { if $xxxtok($strip($2),%pla) < 2 { poke $+ %opon $+ status seed } | else nc %chan %bah.nick Você não pode mais usar $strip($2-) | var %denied y | goto fim }
        if %tipo == bide { poke $+ %pla $+ ataque bide }
        if %tipo == toxic { poke $+ %opon $+ status toxic }
        if %tipo == disable { if $xxxtok($strip($2),%pla) < 2 { poke $+ %opon $+ status disable } | else nc %chan %bah.nick Você não pode mais usar $strip($2-) | var %denied y | goto fim }
        if %tipo == pay-day { set %xpayday [ $+ [ %pla ] ] x | poke $+ %pla $+ ataque especial }
        if %tipo == explosion { set %perder [ $+ [ %pla ] ] sim | poke $+ %pla $+ ataque superefetivo }
        if %tipo == self-destruct { set %perder [ $+ [ %pla ] ] sim | poke $+ %pla $+ ataque efetivo }
        if %tipo == skull-bash { if %skbash [ $+ [ %pla ] ] == $null { set %skbash [ $+ [ %pla ] ] sim | poke $+ %pla $+ status def+ } | else { unset %skbash [ $+ [ %pla ] ] | poke $+ %pla $+ ataque comum } }
        if %tipo == sono { if $xxxtok($strip($2),%pla) < 4 { poke $+ %opon $+ status sono } | else nc %chan %bah.nick Você não pode mais usar $strip($2-) | var %denied y | goto fim }
        if %tipo == paralizar { poke $+ %opon $+ status paralizar }
        if %tipo == confundir { poke $+ %opon $+ status confundir }
        if %tipo == sugarvidasuave { poke $+ %pla $+ ataque suga1 }
        if %tipo == sugarvidafraco { poke $+ %pla $+ ataque suga2 }
        if %tipo == sugarvidamédio { poke $+ %pla $+ ataque suga2 }
        if %tipo == sugarvidaforte { poke $+ %pla $+ ataque suga3 }
        if %tipo == carregavelfraco { poke $+ %pla $+ ataque charge1 }
        if %tipo == carregavelmédio { poke $+ %pla $+ ataque charge2 }
        if %tipo == carregavelforte { poke $+ %pla $+ ataque charge3 }
        if %tipo == carregavel+forte { poke $+ %pla $+ ataque charge4 }
        if %tipo == contínuoinefetivo { if $xxxtok($strip($2),%pla) < 4 { atacont $+ %pla inefetivo } | else nc %chan %bah.nick Você não pode mais usar $strip($2-) | var %denied y | goto fim }
        if %tipo == contínuofraco { if $xxxtok($strip($2),%pla) < 4 { atacont $+ %pla fraco } | else nc %chan %bah.nick Você não pode mais usar $strip($2-) | var %denied y | goto fim }
        if %tipo == contínuoforte { if $xxxtok($strip($2),%pla) < 4 { atacont $+ %pla forte } | else nc %chan %bah.nick Você não pode mais usar $strip($2-) | var %denied y | goto fim }
        if %tipo == perde { sbp.fim Player $+ %opon }
        if %tipo == mesmodooponente { if %tipo [ $+ [ %opon ] ] != $null && %tipo [ $+ [ %opon ] ] != MesmoDoOponente { var %tipo %tipo [ $+ [ %opon ] ] | goto inicio } | else nc %chan %bah.nick Você não pode usar $strip($2) agora! }
        :fim
        if %denied == y && %bah.nick == PkBR && %sbp.player [ $+ [ %opon ] ] == PkBR { if %sbp.player2 == PkBR { msg %chan $cor(1) $+ %poke2 $cor(3) $+ usou POF! | .timer 1 3 xatacar PkBR pof! } }
      }
      else nc %chan $nick Você não pode usar $strip(%bah.nick) $+ ...
    }
  }
}
alias xchecklevel {
  if $1 == %sbp.player1 { var %lvl %poke1level | var %xlvl %poke2level }
  elseif $1 == %sbp.player1 { var %lvl %poke2level | var %xlvl %poke1level }
  if $calc(%xlvl - %lvl) > 5 { msg nc %chan $1 Voce não pode usar $2 | halt }
  else return
}
