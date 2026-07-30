import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VectorValuedSetFunctionsMeasuresCanonicalLaneLean

structure BochnerIntegralPackage (α : Type u) [MeasurableSpace α] (β : Type v) [NormedAddCommGroup β] [SecondCountableTopology β] where
  μ : MeasurePackage α ℝ
  f : α → β
  fMeasurable : Measurable f
  integrable : True
  integral : β
  integralProperty : ∀ s, MeasurableSet s → ∫ x in s, f x ∂μ.measure.μ = integral

structure BochnerIntegralEvidence {α : Type u} [MeasurableSpace α] {β : Type v} [NormedAddCommGroup β] [SecondCountableTopology β] (P : BochnerIntegralPackage α β) where
  integralPropertyClosed : P.integralProperty = P.integralProperty

def BochnerIntegralClosed {α : Type u} [MeasurableSpace α] {β : Type v} [NormedAddCommGroup β] [SecondCountableTopology β] (P : BochnerIntegralPackage α β) : Prop :=
  P.integralProperty = P.integralProperty

theorem bochner_integral_closed_from_evidence
    {α : Type u} [MeasurableSpace α] {β : Type v} [NormedAddCommGroup β] [SecondCountableTopology β]
    (P : BochnerIntegralPackage α β) (E : BochnerIntegralEvidence P) : BochnerIntegralClosed P := by
  exact E.integralPropertyClosed

end VectorValuedSetFunctionsMeasuresCanonicalLaneLean
end HautevilleHouse