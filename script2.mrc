alias jahadv {
  if $timer(5 $+ $1) == $null { deltemp jahadv $1 | return $false }
  if $gettemp(jahadv,$1) { return $true }
  else return $false
}
alias unadv { deltemp jahadv $1 }
alias checkrk { :ini | var %a 0 | var %b 0 | while %a < $ini(info.ini,pokes,0) { inc %a | if $pontos($ini(info.ini,pokes,%a)) >= %tp.pts { inc %b } } | if %b > 50 { inc %tp.pts | goto ini } }
alias xstart {
  window +d @load $int($calc($window(-1).w /2.333)) $int($calc($window(-1).h /3)) 100 10
  window +d @comments $int($calc($window(-1).w /2.333)) $int($calc(($window(-1).h /3) +9)) 100 15 Verdana 10
  aline @load  
  aline @comments  
  var %a 0 | while %a < 12 {
    inc %a
    if %a == 1 { var %c Loading... }
    if %a == 3 { var %cmd zerartmp | var %c Temp data... }
    if %a == 4 { var %cmd zerartudo | var %c Battle data... }
    if %a == 5 { var %cmd set -u $+(%,temp) $findfile($mircdir,dados_*.txt,0,.remove $1-) | var %c Trash data... }
    if %a == 8 { var %cmd top50 | var %c Top50... }
    spd
    rline @load 1 2,2 $+ $str( ,%a)
    if %c { rline 2 @comments 1 %c }
    if %cmd { %cmd }
    if %a == 12 { rline 2 @comments 1 Closing... | .timer -m 1 100 window -c @load $chr(124) window -c @comments }
    unset %cmd
  }
}
alias -l spd { var %a 0 | while %a < 10 { inc %a | .write spdtemp.txt ah ah.. eh soh pra demorar.. :P } | .remove spdtemp.txt }
alias med { set -u %med $calc($replace($getinfo(levels,$1),$chr(32),+)) | set -u %med $calc(%med / $numtok($getinfo(pokes,$1),32)) | return %med }
