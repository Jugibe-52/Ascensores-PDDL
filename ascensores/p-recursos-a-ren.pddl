(define (problem los-ascensores-con-recursos-a)
 (:domain ascensores-recursos-ren)
 (:objects

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
   ascensor-lento-1 - ascensor-bloque-1
   ascensor-lento-2-0 - ascensor-bloque-2
   ascensor-lento-2-1 - ascensor-bloque-2
   ascensor-lento-3 - ascensor-bloque-3

   pasagero-0 - pasagero
   pasagero-1 - pasagero
   pasagero-2 - pasagero
   pasagero-3 - pasagero
   pasagero-4 - pasagero
 )
 (:init 
      (= (coste-subir) 2)
      (= (coste-bajar) 2)
      (= (recurso) 5)

      (= (coste-cambiar-planta-lento planta-0 planta-1) 12)
      (= (coste-cambiar-planta-lento planta-1 planta-0) 12)
      (= (coste-cambiar-planta-lento planta-0 planta-2) 20)
      (= (coste-cambiar-planta-lento planta-2 planta-0) 20)
      (= (coste-cambiar-planta-lento planta-0 planta-3) 28)
      (= (coste-cambiar-planta-lento planta-3 planta-0) 28)
      (= (coste-cambiar-planta-lento planta-0 planta-4) 36)
      (= (coste-cambiar-planta-lento planta-4 planta-0) 36)
      (= (coste-cambiar-planta-lento planta-1 planta-2) 12)
      (= (coste-cambiar-planta-lento planta-2 planta-1) 12)
      (= (coste-cambiar-planta-lento planta-1 planta-3) 20)
      (= (coste-cambiar-planta-lento planta-3 planta-1) 20)
      (= (coste-cambiar-planta-lento planta-1 planta-4) 28)
      (= (coste-cambiar-planta-lento planta-4 planta-1) 28)
      (= (coste-cambiar-planta-lento planta-2 planta-3) 12)
      (= (coste-cambiar-planta-lento planta-3 planta-2) 12)
      (= (coste-cambiar-planta-lento planta-2 planta-4) 20)
      (= (coste-cambiar-planta-lento planta-4 planta-2) 20)
      (= (coste-cambiar-planta-lento planta-3 planta-4) 12)
      (= (coste-cambiar-planta-lento planta-4 planta-3) 12)

      (= (coste-cambiar-planta-lento planta-4 planta-5) 12)
      (= (coste-cambiar-planta-lento planta-5 planta-4) 12)
      (= (coste-cambiar-planta-lento planta-4 planta-6) 20)
      (= (coste-cambiar-planta-lento planta-6 planta-4) 20)
      (= (coste-cambiar-planta-lento planta-4 planta-7) 28)
      (= (coste-cambiar-planta-lento planta-7 planta-4) 28)
      (= (coste-cambiar-planta-lento planta-4 planta-8) 36)
      (= (coste-cambiar-planta-lento planta-8 planta-4) 36)
      (= (coste-cambiar-planta-lento planta-5 planta-6) 12)
      (= (coste-cambiar-planta-lento planta-6 planta-5) 12)
      (= (coste-cambiar-planta-lento planta-5 planta-7) 20)
      (= (coste-cambiar-planta-lento planta-7 planta-5) 20)
      (= (coste-cambiar-planta-lento planta-5 planta-8) 28)
      (= (coste-cambiar-planta-lento planta-8 planta-5) 28)
      (= (coste-cambiar-planta-lento planta-6 planta-7) 12)
      (= (coste-cambiar-planta-lento planta-7 planta-6) 12)
      (= (coste-cambiar-planta-lento planta-6 planta-8) 20)
      (= (coste-cambiar-planta-lento planta-8 planta-6) 20)
      (= (coste-cambiar-planta-lento planta-7 planta-8) 12)
      (= (coste-cambiar-planta-lento planta-8 planta-7) 12)

      (= (coste-cambiar-planta-lento planta-8 planta-9) 12)
      (= (coste-cambiar-planta-lento planta-9 planta-8) 12)
      (= (coste-cambiar-planta-lento planta-8 planta-10) 20)
      (= (coste-cambiar-planta-lento planta-10 planta-8) 20)
      (= (coste-cambiar-planta-lento planta-8 planta-11) 28)
      (= (coste-cambiar-planta-lento planta-11 planta-8) 28)
      (= (coste-cambiar-planta-lento planta-8 planta-12) 36)
      (= (coste-cambiar-planta-lento planta-12 planta-8) 36)
      (= (coste-cambiar-planta-lento planta-9 planta-10) 12)
      (= (coste-cambiar-planta-lento planta-10 planta-9) 12)
      (= (coste-cambiar-planta-lento planta-9 planta-11) 20)
      (= (coste-cambiar-planta-lento planta-11 planta-9) 20)
      (= (coste-cambiar-planta-lento planta-9 planta-12) 28)
      (= (coste-cambiar-planta-lento planta-12 planta-9) 28)
      (= (coste-cambiar-planta-lento planta-10 planta-11) 12)
      (= (coste-cambiar-planta-lento planta-11 planta-10) 12)
      (= (coste-cambiar-planta-lento planta-10 planta-12) 20)
      (= (coste-cambiar-planta-lento planta-12 planta-10) 20)
      (= (coste-cambiar-planta-lento planta-11 planta-12) 12)
      (= (coste-cambiar-planta-lento planta-12 planta-11) 12)

      (= (coste-cambiar-planta-rapido planta-0 planta-2) 11)
      (= (coste-cambiar-planta-rapido planta-2 planta-0) 10)
      (= (coste-cambiar-planta-rapido planta-0 planta-4) 13)
      (= (coste-cambiar-planta-rapido planta-4 planta-0) 12)
      (= (coste-cambiar-planta-rapido planta-0 planta-6) 15)
      (= (coste-cambiar-planta-rapido planta-6 planta-0) 14)
      (= (coste-cambiar-planta-rapido planta-0 planta-8) 17)
      (= (coste-cambiar-planta-rapido planta-8 planta-0) 16)
      (= (coste-cambiar-planta-rapido planta-0 planta-10) 19)
      (= (coste-cambiar-planta-rapido planta-10 planta-0) 18)
      (= (coste-cambiar-planta-rapido planta-0 planta-12) 21)
      (= (coste-cambiar-planta-rapido planta-12 planta-0) 20)

      (= (coste-cambiar-planta-rapido planta-2 planta-4) 11)
      (= (coste-cambiar-planta-rapido planta-4 planta-2) 10)
      (= (coste-cambiar-planta-rapido planta-2 planta-6) 13)
      (= (coste-cambiar-planta-rapido planta-6 planta-2) 12)
      (= (coste-cambiar-planta-rapido planta-2 planta-8) 15)
      (= (coste-cambiar-planta-rapido planta-8 planta-2) 14)
      (= (coste-cambiar-planta-rapido planta-2 planta-10) 17)
      (= (coste-cambiar-planta-rapido planta-10 planta-2) 16)
      (= (coste-cambiar-planta-rapido planta-2 planta-12) 19)
      (= (coste-cambiar-planta-rapido planta-12 planta-2) 18)

      (= (coste-cambiar-planta-rapido planta-4 planta-6) 11)
      (= (coste-cambiar-planta-rapido planta-6 planta-4) 10)
      (= (coste-cambiar-planta-rapido planta-4 planta-8) 13)
      (= (coste-cambiar-planta-rapido planta-8 planta-4) 12)
      (= (coste-cambiar-planta-rapido planta-4 planta-10) 15)
      (= (coste-cambiar-planta-rapido planta-10 planta-4) 14)
      (= (coste-cambiar-planta-rapido planta-4 planta-12) 17)
      (= (coste-cambiar-planta-rapido planta-12 planta-4) 16)

      (= (coste-cambiar-planta-rapido planta-6 planta-8) 11)
      (= (coste-cambiar-planta-rapido planta-8 planta-6) 10)
      (= (coste-cambiar-planta-rapido planta-6 planta-10) 13)
      (= (coste-cambiar-planta-rapido planta-10 planta-6) 12)
      (= (coste-cambiar-planta-rapido planta-6 planta-12) 15)
      (= (coste-cambiar-planta-rapido planta-12 planta-6) 14)

      (= (coste-cambiar-planta-rapido planta-8 planta-10) 11)
      (= (coste-cambiar-planta-rapido planta-10 planta-8) 10)
      (= (coste-cambiar-planta-rapido planta-8 planta-12) 13)
      (= (coste-cambiar-planta-rapido planta-12 planta-8) 12)

      (= (coste-cambiar-planta-rapido planta-10 planta-12) 11)
      (= (coste-cambiar-planta-rapido planta-12 planta-10) 10)

      (= (plazas-ascensor ascensor-lento-1) 2)
      (= (plazas-ascensor ascensor-lento-2-0) 2)
      (= (plazas-ascensor ascensor-lento-2-1) 2)
      (= (plazas-ascensor ascensor-lento-3) 2)
      (= (plazas-ascensor ascensor-rapido) 3)

      (at ascensor-lento-1 planta-0)
      (at ascensor-lento-2-0 planta-4)
      (at ascensor-lento-2-1 planta-4)
      (at ascensor-lento-3 planta-8)
      (at ascensor-rapido planta-0)

      (at pasagero-0 planta-2)
      (at pasagero-1 planta-4)
      (at pasagero-2 planta-1)
      (at pasagero-3 planta-8)
      (at pasagero-4 planta-1)
 )

 (:goal (and
      (at pasagero-0 planta-3)
      (at pasagero-1 planta-11)
      (at pasagero-2 planta-12)
      (at pasagero-3 planta-1)
      (at pasagero-4 planta-9)
 ))
 (:metric minimize (recurso))
)
