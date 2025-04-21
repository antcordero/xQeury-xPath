(:
Listado con los nombres de todos los juegos que funcionan bien (is_runnable)
ordenado antigüedad e indicando eI año y fabricante cono atributo
:)

for $a in //arcade
where $a/is_runnable = "YES"
let $año := $a/year
let $fabricante := $a/manufacturer
let $nombre := data($a/description)
order by number($a/year)
return 
  <juego año="{$año}" fabricante="{$fabricante}">
    {$nombre}
  </juego>


(:
  El juego más viejo
:)