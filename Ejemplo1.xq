for $a in //arcade
let $nombre := $a/description
let $salida := concat(" -> ", $nombre, " - ")
return $salida