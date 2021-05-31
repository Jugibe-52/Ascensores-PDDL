(define (domain ascensores-recursos-no-ren)
(:requirements :typing :fluents :durative-actions :negative-preconditions)

  (:types
        planta localizable - object
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
     (ocupado ?a)
  )
  (:functions
     (coste-cambiar-planta-lento ?pl1 ?pl2 )
     (coste-cambiar-planta-rapido ?pl1 ?pl2 )
     (coste-subir)
     (coste-bajar)
     (plazas-ascensor ?a)
     (recurso)
  )

  (:durative-action cambiar-planta-1
    :parameters (?a - ascensor-bloque-1 ?pl1 ?pl2 - (either 
                                                planta-bloque-1 
                                                planta-bloque-1-par 
                                                planta-bloque-1-2-par))
    :duration (= ?duration (coste-cambiar-planta-lento ?pl1 ?pl2))
    :condition (and
               (at start (at ?a ?pl1))
               (at start (not (ocupado ?a)))
               (at start (> (recurso) 
                         (/ 1 (coste-cambiar-planta-lento ?pl1 ?pl2))))
    )
    :effect (and
            (at start (not (at ?a ?pl1)))
            (at start (ocupado ?a))
            (at start (decrease (recurso) 
                      (/ 1 (coste-cambiar-planta-lento ?pl1 ?pl2))))
            (at end (not (ocupado ?a)))
            (at end (at ?a ?pl2))
    )
  )

  (:durative-action cambiar-planta-2
    :parameters (?a - ascensor-bloque-2 ?pl1 ?pl2 - (either 
                                              planta-bloque-2 
                                              planta-bloque-2-par 
                                              planta-bloque-1-2-par 
                                              planta-bloque-2-3-par))
    :duration (= ?duration (coste-cambiar-planta-lento ?pl1 ?pl2))
    :condition (and
               (at start (at ?a ?pl1)) 
               (at start (not (ocupado ?a)))
               (at start (> (recurso) 
                         (/ 1 (coste-cambiar-planta-lento ?pl1 ?pl2))))
    )
    :effect (and
            (at start (not (at ?a ?pl1)))
            (at start (ocupado ?a))
            (at start (decrease (recurso) 
                      (/ 1 (coste-cambiar-planta-lento ?pl1 ?pl2))))
            (at end (not (ocupado ?a)))
            (at end (at ?a ?pl2))
    )
  )

  (:durative-action cambiar-planta-3
    :parameters (?a - ascensor-bloque-3 ?pl1 ?pl2 - (either 
                                              planta-bloque-3 
                                              planta-bloque-3-par 
                                              planta-bloque-2-3-par))
    :duration (= ?duration (coste-cambiar-planta-lento ?pl1 ?pl2))
    :condition (and
               (at start (at ?a ?pl1)) 
               (at start (not (ocupado ?a)))
               (at start (> (recurso) 
                         (/ 1 (coste-cambiar-planta-lento ?pl1 ?pl2))))
    )
    :effect (and
            (at start (not (at ?a ?pl1)))
            (at start (ocupado ?a))
            (at start (decrease (recurso) 
                      (/ 1 (coste-cambiar-planta-lento ?pl1 ?pl2))))
            (at end (not (ocupado ?a)))
            (at end (at ?a ?pl2))
    )
  )

 (:durative-action cambiar-planta-rapido
    :parameters (?a - ascensor-rapido ?pl1 ?pl2 - (either 
                                                   planta-bloque-1-par 
                                                   planta-bloque-2-par
                                                   planta-bloque-3-par
                                                   planta-bloque-1-2-par 
                                                   planta-bloque-2-3-par))
    :duration (= ?duration (coste-cambiar-planta-rapido ?pl1 ?pl2))
    :condition (and
               (at start (at ?a ?pl1)) 
               (at start (not (ocupado ?a)))
               (at start (> (recurso) 
                         (/ 1 (coste-cambiar-planta-rapido ?pl1 ?pl2))))
    )
    :effect (and
            (at start (not (at ?a ?pl1)))
            (at start (ocupado ?a))
            (at start (decrease (recurso) 
                      (/ 1 (coste-cambiar-planta-rapido ?pl1 ?pl2))))
            (at end (not (ocupado ?a)))
            (at end (at ?a ?pl2))
    )
  )

  (:durative-action subir
    :parameters (?pa - pasagero ?a - ascensor ?pl - planta)
    :duration (= ?duration (coste-subir))
    :condition(and 
      (at start (at ?a ?pl))
      (at start (at ?pa ?pl))
      (at start (not (ocupado ?a)))
      (at start (>= (plazas-ascensor ?a) 0))
      (at start (> (recurso) 
                (/ 1 (coste-subir))))
      (over all (at ?a ?pl))
    )
    :effect (and
        (at start (not (at ?pa ?pl)))
        (at start (decrease (plazas-ascensor ?a) 1))
        (at start (decrease (recurso) 
                      (/ 1 (coste-subir))))
        (at end (in ?pa ?a))
    )
  )

  (:durative-action bajar
    :parameters (?pa - pasagero ?a - ascensor ?pl - planta)
    :duration (= ?duration (coste-bajar))
    :condition (and
        (at start (at ?a ?pl))
        (at start (in ?pa ?a))
        (at start (not (ocupado ?a)))
        (at start (> (recurso) 
                  (/ 1 (coste-bajar))))
        (over all (at ?a ?pl))
    )
    :effect (and
        (at start (not (in ?pa ?a)))
        (at end (increase (plazas-ascensor ?a) 1))
        (at start (decrease (recurso) 
                      (/ 1 (coste-subir))))
        (at end (at ?pa ?pl))
    )
  )

  (:durative-action recargar-recurso
      :parameters ()
      :duration (= ?duration 1)
      :effect (and 
          (at end (assign (recurso) 5))
      )
  )
)
