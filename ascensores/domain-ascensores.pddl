;; Problema secuencial
;;

(define (domain ascensores)
  (:requirements :typing)
  (:types
        planta localizable capacidad - object
        ascensor pasagero - localizable
        planta-par - planta
        planta-bloque-1 - planta
        planta-bloque-2 - planta
        planta-bloque-3 - planta
        planta-bloque-1-2-par - (either 
                                 planta-bloque-1 
                                 planta-bloque-2 
                                 planta-par)
        planta-bloque-2-3-par - (either 
                                 planta-bloque-2 
                                 planta-bloque-3
                                 planta-par)
        planta-bloque-1-par - (either 
                               planta-bloque-1 
                               planta-par)
        planta-bloque-2-par - (either 
                               planta-bloque-2 
                               planta-par)
        planta-bloque-3-par - (either 
                               planta-bloque-3 
                               planta-par)
        ascensor-lento ascensor-rapido - ascensor
        ascensor-bloque-1 ascensor-bloque-2 ascensor-bloque-3 - ascensor-lento
  )

  (:predicates
     (at ?l - localizable ?pl - planta)
     (in ?pa - pasagero ?a - ascensor)
     (capacidad-disponible ?a - ascensor ?c1 - capacidad)
     (capacidad-predecesor ?c1 ?c2 - capacidad)
  )

  (:action cambiar-planta-1
    :parameters (?a - ascensor-bloque-1 ?pl1 ?pl2 - (either 
                                              planta-bloque-1 
                                              planta-bloque-1-par 
                                              planta-bloque-1-2-par))
    :precondition (and
        (at ?a ?pl1)
      )
    :effect (and
        (not (at ?a ?pl1))
        (at ?a ?pl2)
      )
  )

  (:action cambiar-planta-2
    :parameters (?a - ascensor-bloque-2 ?pl1 ?pl2 - (either 
                                              planta-bloque-2 
                                              planta-bloque-2-par 
                                              planta-bloque-1-2-par 
                                              planta-bloque-2-3-par))
    :precondition (and
        (at ?a ?pl1)
      )
    :effect (and
        (not (at ?a ?pl1))
        (at ?a ?pl2)
      )
  )

  (:action cambiar-planta-3
    :parameters (?a - ascensor-bloque-3 ?pl1 ?pl2 - (either 
                                              planta-bloque-3 
                                              planta-bloque-3-par 
                                              planta-bloque-2-3-par))
    :precondition (and
        (at ?a ?pl1)
      )
    :effect (and
        (not (at ?a ?pl1))
        (at ?a ?pl2)
      )
  )

 (:action cambiar-planta-rapido
    :parameters (?a - ascensor-rapido ?pl1 ?pl2 - (either 
                                                   planta-bloque-1-par 
                                                   planta-bloque-2-par
                                                   planta-bloque-3-par
                                                   planta-bloque-1-2-par 
                                                   planta-bloque-2-3-par))
    :precondition (and
        (at ?a ?pl1)
      )
    :effect (and
        (not (at ?a ?pl1))
        (at ?a ?pl2)
      )
  )

 (:action subir
    :parameters (?pa - pasagero ?a - ascensor ?pl - planta  ?c2 ?c1 - capacidad)
    :precondition (and
        (at ?a ?pl)
        (at ?pa ?pl)
        (capacidad-disponible ?a ?c2)
        (capacidad-predecesor ?c1 ?c2)
      )
    :effect (and
        (not (at ?pa ?pl))
        (in ?pa ?a)
        (not (capacidad-disponible ?a ?c2))
        (capacidad-disponible ?a ?c1)
      )
  )

  (:action bajar
    :parameters (?pa - pasagero ?a - ascensor ?pl - planta  ?c1 ?c2 - capacidad)
    :precondition (and
        (at ?a ?pl)
        (in ?pa ?a)
        (capacidad-disponible ?a ?c1)
        (capacidad-predecesor ?c1 ?c2)

      )
    :effect (and
        (not (in ?pa ?a))
        (at ?pa ?pl)
        (not (capacidad-disponible ?a ?c1))
        (capacidad-disponible ?a ?c2)
      )
  )
)