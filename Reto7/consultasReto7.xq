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


