(:Ejercicios xQuery Practica:)
for $f in distinct-values(//fabricante)
  let $coches := //coche[fabricante=$f]
  let $modelos := $coches/modelo
  let $total := sum($coches/ventas)
where $total>2
order by $total descending
return <fabricante ventas="{$total}" nombre="{$f}">{$modelos}</fabricante>
