import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VectorValuedSetFunctionsMeasuresCanonicalLaneLean

structure VectorMeasurePackage where
  sourceSigmaAlgebra : Type u
  targetBanachSpace : Type v
  measure : sourceSigmaAlgebra → targetBanachSpace
  emptyZero : Prop
  countableAdditivity : Prop

structure VectorMeasureEvidence (P : VectorMeasurePackage) where
  emptyZeroClosed : P.emptyZero
  countableAdditivityClosed : P.countableAdditivity

def vectorMeasureClosed (P : VectorMeasurePackage) : Prop :=
  P.emptyZero ∧ P.countableAdditivity

theorem vector_measure_closed_from_evidence
    (P : VectorMeasurePackage) (E : VectorMeasureEvidence P) :
    vectorMeasureClosed P := by
  exact And.intro E.emptyZeroClosed E.countableAdditivityClosed

end VectorValuedSetFunctionsMeasuresCanonicalLaneLean
end HautevilleHouse