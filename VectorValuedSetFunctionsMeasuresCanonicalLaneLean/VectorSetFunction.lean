import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VectorValuedSetFunctionsMeasuresCanonicalLaneLean

structure VectorSetFunction where
  domain : Type u
  codomain : Type v
  function : domain → codomain
  additive : Prop
  countablyAdditive : Prop

structure VectorSetFunctionEvidence (f : VectorSetFunction) where
  additiveClosed : f.additive
  countablyAdditiveClosed : f.countablyAdditive

def VectorSetFunctionClosed (f : VectorSetFunction) : Prop :=
  f.additive ∧ f.countablyAdditive

theorem vector_set_function_closed_from_evidence (f : VectorSetFunction) (E : VectorSetFunctionEvidence f) :
    VectorSetFunctionClosed f := by
  exact And.intro E.additiveClosed E.countablyAdditiveClosed

end VectorValuedSetFunctionsMeasuresCanonicalLaneLean
end HautevilleHouse