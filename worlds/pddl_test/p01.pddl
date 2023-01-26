(define (problem blocksworld-problem)
  (:domain blocksworld)
  (:objects a b c d - block)
  (:init (handempty) (ontable a) (ontable b) (ontable c) (ontable d)
         (clear a) (clear b) (clear c) (clear d))
  (:goal (and (clear d) (ontable b) (on c a) (on a b) (on d c)))
)

