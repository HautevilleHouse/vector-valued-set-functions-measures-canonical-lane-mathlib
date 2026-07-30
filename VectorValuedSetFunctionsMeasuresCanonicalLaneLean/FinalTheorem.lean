import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VectorValuedSetFunctionsMeasuresCanonicalLaneLean

def ConstrainedVectorMeasureClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_vector_measure_endgame (A : AdmissibleClass) :
    ConstrainedVectorMeasureClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end VectorValuedSetFunctionsMeasuresCanonicalLaneLean
end HautevilleHouse
