(:Ejemplos de clase: 25/04/25:)

(:
  Listado con todos los fabricamtes
:)

(:
for $m in distinct-values(//manufacturer)
order by $m
where $m!="-"
let $salida := upper-case($m)
return <fabricante>{$m}</fabricante>
:)
(:
for $m in distinct-values(//manufacturer)
order by $m
where $m!="-"
let $salida := upper-case($m)
return <fabricante>{$salida}</fabricante>
:)

(:
let $juegos := (
  for $m in //manufacturer
  return tokenize($m," / ")
)
for $m in distinct-values($juegos)
order by $m
where $m!="-"
let $salida := upper-case($m)
return <fabricante>{$salida}</fabricante>
:)

(:
  Listado con los nombres de todos los juegos agrupados/agregados 	por fabricantes
:)

(: se esperaría esta salida por ejemplo 
  
  <fabricante nombre="SEGA">
    <juego>...</juego>
    <juego>...</juego>
  </fabricante>  
:)


for $m in distinct-values(//manufacturer)
  order by $m
  where $m!="-"
  let $juegos := //arcade[manufacturer=$m]/description
  let $salida := (
    for $j in $juegos
    return <juego>{data($j)}</juego>
  )
  let $total := count($salida)
  order by $total descending
  return <fabricante nombre="{$m}" total="{$total}">{$juegos}</fabricante>
