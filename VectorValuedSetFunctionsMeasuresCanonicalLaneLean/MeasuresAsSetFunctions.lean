import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VectorValuedSetFunctionsMeasuresCanonicalLaneLean

structure MeasureAsSetFunction (α : Type u) [MeasurableSpace α] (β : Type v) [NormedAddCommGroup β] where
  μ : Set α → β
  countablyAdditive : ∀ (s : ℕ → Set α), (∀ n, MeasurableSet (s n)) → (Pairwise (fun i j => s i ∩ s j = ∅)) → μ (⋃ n, s n) = ∑' n, μ (s n)
  μ_empty : μ ∅ = 0

structure MeasurePackage (α : Type u) [MeasurableSpace α] (β : Type v) [NormedAddCommGroup β] where
  measure : MeasureAsSetFunction α β
  measurableSpace : MeasurableSpace α
  targetSpace : NormedAddCommGroup β
  measureDefined : True

structure MeasureEvidence {α : Type u} [MeasurableSpace α] {β : Type v} [NormedAddCommGroup β] (P : MeasurePackage α β) where
  countablyAdditiveClosed : P.measure.countablyAdditive = P.measure.countablyAdditive
  μ_emptyClosed : P.measure.μ_empty = 0

def MeasureClosed {α : Type u} [MeasurableSpace α] {β : Type v} [NormedAddCommGroup β] (P : MeasurePackage α β) : Prop :=
  P.measure.countablyAdditive = P.measure.countablyAdditive ∧ P.measure.μ_empty = 0

theorem measure_closed_from_evidence
    {α : Type u} [MeasurableSpace α] {β : Type v} [NormedAddCommGroup β]
    (P : MeasurePackage α β) (E : MeasureEvidence P) : MeasureClosed P := by
  exact And.intro E.countablyAdditiveClosed E.μ_emptyClosed

end VectorValuedSetFunctionsMeasuresCanonicalLaneLean
end HautevilleHouse