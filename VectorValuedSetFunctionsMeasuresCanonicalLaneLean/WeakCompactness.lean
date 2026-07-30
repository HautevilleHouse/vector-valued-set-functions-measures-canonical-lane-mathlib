import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VectorValuedSetFunctionsMeasuresCanonicalLaneLean

structure WeakCompactnessPackage (μ : Set ℕ → ℝ) where
  measureSpace : MeasurableSpace ℕ
  vectorMeasure : VectorMeasure ℕ ℝ
  uniformlyCountablyAdditive : Prop
  weakCompactnessTheorem : Prop
  applications : Prop

structure WeakCompactnessEvidence (P : WeakCompactnessPackage) where
  uniformlyCountablyAdditiveClosed : P.uniformlyCountablyAdditive
  weakCompactnessTheoremClosed : P.weakCompactnessTheorem
  applicationsClosed : P.applications

def WeakCompactnessClosed (P : WeakCompactnessPackage) : Prop :=
  P.uniformlyCountablyAdditive ∧ P.weakCompactnessTheorem ∧ P.applications

theorem weak_compactness_closed_from_evidence (P : WeakCompactnessPackage)
    (E : WeakCompactnessEvidence P) : WeakCompactnessClosed P := by
  exact And.intro E.uniformlyCountablyAdditiveClosed
    (And.intro E.weakCompactnessTheoremClosed E.applicationsClosed)

end VectorValuedSetFunctionsMeasuresCanonicalLaneLean
end HautevilleHouse
