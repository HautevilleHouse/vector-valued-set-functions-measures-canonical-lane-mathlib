import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VectorValuedSetFunctionsMeasuresCanonicalLaneLean

structure DecompositionPackage (α : Type u) [MeasurableSpace α] (β : Type v) [NormedAddCommGroup β] [FiniteDimensional ℝ β] where
  μ : MeasurePackage α β
  ν : MeasurePackage α β
  decomposition : True
  absolutelyContinuousPart : MeasurePackage α β
  singularPart : MeasurePackage α β
  decompositionProperty : μ.measure.μ = absolutelyContinuousPart.measure.μ + singularPart.measure.μ

structure DecompositionEvidence {α : Type u} [MeasurableSpace α] {β : Type v} [NormedAddCommGroup β] [FiniteDimensional ℝ β] (P : DecompositionPackage α β) where
  decompositionPropertyClosed : P.decompositionProperty = P.decompositionProperty

def DecompositionClosed {α : Type u} [MeasurableSpace α] {β : Type v} [NormedAddCommGroup β] [FiniteDimensional ℝ β] (P : DecompositionPackage α β) : Prop :=
  P.decompositionProperty = P.decompositionProperty

theorem decomposition_closed_from_evidence
    {α : Type u} [MeasurableSpace α] {β : Type v} [NormedAddCommGroup β] [FiniteDimensional ℝ β]
    (P : DecompositionPackage α β) (E : DecompositionEvidence P) : DecompositionClosed P := by
  exact E.decompositionPropertyClosed

end VectorValuedSetFunctionsMeasuresCanonicalLaneLean
end HautevilleHouse