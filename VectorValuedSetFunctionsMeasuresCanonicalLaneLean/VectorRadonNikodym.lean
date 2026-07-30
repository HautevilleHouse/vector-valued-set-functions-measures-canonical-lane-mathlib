import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VectorValuedSetFunctionsMeasuresCanonicalLaneLean

structure VectorRadonNikodymPackage (μ : Set ℕ → ℝ) where
  referenceMeasure : μ
  vectorMeasure : VectorMeasure ℕ ℝ
  derivativeExists : Prop
  radonNikodymTheorem : Prop
  uniqueness : Prop

structure VectorRadonNikodymEvidence (P : VectorRadonNikodymPackage) where
  derivativeExistsClosed : P.derivativeExists
  radonNikodymTheoremClosed : P.radonNikodymTheorem
  uniquenessClosed : P.uniqueness

def VectorRadonNikodymClosed (P : VectorRadonNikodymPackage) : Prop :=
  P.derivativeExists ∧ P.radonNikodymTheorem ∧ P.uniqueness

theorem vector_radon_nikodym_closed_from_evidence (P : VectorRadonNikodymPackage)
    (E : VectorRadonNikodymEvidence P) : VectorRadonNikodymClosed P := by
  exact And.intro E.derivativeExistsClosed
    (And.intro E.radonNikodymTheoremClosed E.uniquenessClosed)

end VectorValuedSetFunctionsMeasuresCanonicalLaneLean
end HautevilleHouse
