(: Ejercicio 1:
Listado con los nombres de todos los juegos que funcionan bien (is_runnable)
ordenado antigüedad e indicando eI año y fabricante cono atributo
:)

(:

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
  
:)


(: Ejercicio 2:
  El juego más viejo
:)

(: Ejemplo utilizando xPtah

    min(//arcade[year!="-"]/year)
:)

(:Con este for se recorre todos los elementos y solo coge los que son números, el bucle va iterando cada elemento e ignora los que year no son números

haciendo la variable, ya tiene el array de todos los juegos y ahora sí se le puede hacer al mínimo:)
let $juegos := (
  for $a in //arcade
  where number($a/year)
  return $a
)
let $minimo := min($juegos/year)
return $minimo

