import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VectorValuedSetFunctionsMeasuresCanonicalLaneLean

structure VectorValuedSetFunctionPackage where
  sourceSigmaAlgebra : Type u
  targetBanachSpace : Type v
  function : sourceSigmaAlgebra → targetBanachSpace
  additivity : Prop
  countableAdditivity : Prop
  boundedness : Prop

structure VectorValuedSetFunctionEvidence (P : VectorValuedSetFunctionPackage) where
  additivityClosed : P.additivity
  countableAdditivityClosed : P.countableAdditivity
  boundednessClosed : P.boundedness

def vectorValuedSetFunctionClosed (P : VectorValuedSetFunctionPackage) : Prop :=
  P.additivity ∧ P.countableAdditivity ∧ P.boundedness

theorem vector_valued_set_function_closed_from_evidence
    (P : VectorValuedSetFunctionPackage) (E : VectorValuedSetFunctionEvidence P) :
    vectorValuedSetFunctionClosed P := by
  exact And.intro E.additivityClosed (And.intro E.countableAdditivityClosed E.boundednessClosed)

end VectorValuedSetFunctionsMeasuresCanonicalLaneLean
end HautevilleHouse