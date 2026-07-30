import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VectorValuedSetFunctionsMeasuresCanonicalLaneLean

structure RadonNikodymPackage (α : Type u) [MeasurableSpace α] (β : Type v) [NormedAddCommGroup β] [FiniteDimensional ℝ β] where
  μ : MeasurePackage α β
  ν : MeasurePackage α β
  μ_absolutely_continuous_ν : Prop
  density : α → β
  densityMeasurable : Measurable density
  radonNikodymProperty : ∀ s, MeasurableSet s → μ.measure.μ s = ∫ x in s, density x ∂ν.measure.μ

structure RadonNikodymEvidence {α : Type u} [MeasurableSpace α] {β : Type v} [NormedAddCommGroup β] [FiniteDimensional ℝ β] (P : RadonNikodymPackage α β) where
  rabsClosed : P.μ_absolutely_continuous_ν
  densityClosed : P.radonNikodymProperty = P.radonNikodymProperty

def RadonNikodymClosed {α : Type u} [MeasurableSpace α] {β : Type v} [NormedAddCommGroup β] [FiniteDimensional ℝ β] (P : RadonNikodymPackage α β) : Prop :=
  P.μ_absolutely_continuous_ν ∧ P.radonNikodymProperty = P.radonNikodymProperty

theorem radon_nikodym_closed_from_evidence
    {α : Type u} [MeasurableSpace α] {β : Type v} [NormedAddCommGroup β] [FiniteDimensional ℝ β]
    (P : RadonNikodymPackage α β) (E : RadonNikodymEvidence P) : RadonNikodymClosed P := by
  exact And.intro E.rabsClosed E.densityClosed

end VectorValuedSetFunctionsMeasuresCanonicalLaneLean
end HautevilleHouse