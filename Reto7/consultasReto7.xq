(:
for $e in //cd
return $e
:)

(:
  Consulta 1: Devolver todos los discos ordenados por precio
:)
(:
for $disco in /catalogo/cd
order by number($disco/precio)
return $disco
:)


(:
  Consulta 2: Devolver el disco más antiguo
:)
(:
let $discoMasAntiguo := 
  for $disco in /catalogo/cd
  order by number($disco/año)
  return $disco
return $discoMasAntiguo[1]
:)


(:
  Consulta 3: Devuelver la cantidad total de países que aparecen
:)
(:
count(distinct-values(/catalogo/cd/pais))
:)
(:
for $e in distinct-values(/catalogo/cd/pais)
return <pais>{$e}</pais>
:)


(:
  Consulta 4: Devuelva el valor total de la colección en dólares y el valor promedio de todos los discos.
:)
(:
let $precios := 
  for $disco in /catalogo/cd
  return number($disco/precio)
let $total := sum($precios)
let $media := avg($precios)
return 
  <resultado>
    <total>{$total}</total>
    <mediaPrecios moneda="$">{$media}</mediaPrecios>
  </resultado>
:)


(:
  Consulta 5: Devuelva solo los discos editados en USA
:)
(:
for $disco in /catalogo/cd
where $disco/pais = "USA"
return $disco
:)


(:
  Consulta 6: Devuelva todos los discos añadiendo el IVA al precio y convirtiendo el elemento país en atributo.
:)
(:
for $disco in /catalogo/cd
let $precioIva := number($disco/precio) * 1.21
return
  <cd pais="{$disco/pais}">
    {$disco/titulo}
    {$disco/artista}
    {$disco/discografica}
    {$disco/precio}
    <precioConIva>{$precioIva}</precioConIva>
    {$disco/año}
  </cd>
:)


(:
  Consulta 7: Liste el nombre de las discográficas, indicando el número de discos de cada una como atributo con este formato.
          <discografica total="5>Virgin</discografica>
:)
(:
for $disco in distinct-values(/catalogo/cd/discografica)
let $numTotalDiscos := count(/catalogo/cd[discografica = $disco])
order by $disco
return 
  <discografica total="{$numTotalDiscos}">
    {$disco}
  </discografica>
:)


(:
  Consulta 8: Muestre el listado de todos los discos agregados por países, con el número de discos de cada uno como atributo con este formato.
          <pais nombre="USA" total="21">
          <disco>...</disco>
          <disco>...</disco>
          </pais>
:)

for $pais in distinct-values(/catalogo/cd/pais)
let $totalDiscos := /catalogo/cd[pais=$pais]
order by $pais
return
  <pais nombre="{$pais}" total="{count($totalDiscos)}">
    {
      for $disco in $totalDiscos
      return
        <disco>{data($disco/titulo)}</disco>
    }
  </pais>


