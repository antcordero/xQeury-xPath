<juegos>
{
  for $a in //arcade
  let $antigüedad := 2025 - number($a/year)
  where $antigüedad > 50
  let $nombre := $a/description
  return 
  <juego años="{$antigüedad}">
    {data($nombre)}
  </juego>  
}
</juegos>
