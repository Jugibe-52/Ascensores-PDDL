(define (problem los-ascensores-proposicional-b)
 (:domain ascensores)
 (:objects
   pasagero-0 - pasagero
   pasagero-1 - pasagero
   pasagero-2 - pasagero
   pasagero-3 - pasagero
   pasagero-4 - pasagero

   planta-0 - planta-bloque-1-par
   planta-1 - planta-bloque-1
   planta-2 - planta-bloque-1-par
   planta-3 - planta-bloque-1
   planta-4 - planta-bloque-1-2-par
   planta-5 - planta-bloque-2
   planta-6 - planta-bloque-2-par
   planta-7 - planta-bloque-2
   planta-8 - planta-bloque-2-3-par
   planta-9 - planta-bloque-3
   planta-10 - planta-bloque-3-par
   planta-11 - planta-bloque-3
   planta-12 - planta-bloque-3-par

   ascensor-rapido - ascensor-rapido
   ascensor-rapido-1 - ascensor-rapido
   ascensor-rapido-2 - ascensor-rapido
   ascensor-lento-1 - ascensor-bloque-1
   ascensor-lento-1-1 - ascensor-bloque-1
   ascensor-lento-2-0 - ascensor-bloque-2
   ascensor-lento-2-1 - ascensor-bloque-2
   ascensor-lento-3 - ascensor-bloque-3
   ascensor-lento-3-1 - ascensor-bloque-3
   
   capacidad-0 - capacidad
   capacidad-1 - capacidad
   capacidad-2 - capacidad
   capacidad-3 - capacidad
 )
 (:init 
      (at pasagero-0 planta-1)
      (at pasagero-1 planta-7)
      (at pasagero-2 planta-10)
      (at pasagero-3 planta-5)
      (at pasagero-4 planta-2)

      (at ascensor-rapido planta-0)
      (at ascensor-rapido-1 planta-6)
      (at ascensor-rapido-2 planta-10)
      (at ascensor-lento-1 planta-3)
      (at ascensor-lento-1-1 planta-2)
      (at ascensor-lento-2-0 planta-4)
      (at ascensor-lento-2-1 planta-4)
      (at ascensor-lento-3 planta-11)
      (at ascensor-lento-3-1 planta-12)

      (capacidad-predecesor capacidad-0 capacidad-1)
      (capacidad-predecesor capacidad-1 capacidad-2)
      (capacidad-predecesor capacidad-2 capacidad-3)

      (capacidad-disponible ascensor-rapido capacidad-3)
      (capacidad-disponible ascensor-lento-1 capacidad-2)
      (capacidad-disponible ascensor-lento-2-0 capacidad-2)
      (capacidad-disponible ascensor-lento-2-1 capacidad-2)
      (capacidad-disponible ascensor-lento-3 capacidad-2)
 )

 (:goal (and
      (at pasagero-0 planta-12)
      (at pasagero-1 planta-11)
      (at pasagero-2 planta-6)
      (at pasagero-3 planta-5)
      (at pasagero-4 planta-4)
 ))
)