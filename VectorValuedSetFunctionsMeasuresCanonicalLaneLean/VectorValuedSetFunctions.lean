import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VectorValuedSetFunctionsMeasuresCanonicalLaneLean

structure VectorValuedSetFunction (α : Type u) [MeasurableSpace α] (β : Type v) [NormedAddCommGroup β] where
  f : Set α → β
  additive : ∀ s t, MeasurableSet s → MeasurableSet t → s ∩ t = ∅ → f (s ∪ t) = f s + f t
  f_empty : f ∅ = 0

structure VectorValuedSetFunctionPackage (α : Type u) [MeasurableSpace α] (β : Type v) [NormedAddCommGroup β] where
  function : VectorValuedSetFunction α β
  measurableSpace : MeasurableSpace α
  targetSpace : NormedAddCommGroup β
  functionDefined : True

structure VectorValuedSetFunctionEvidence {α : Type u} [MeasurableSpace α] {β : Type v} [NormedAddCommGroup β] (P : VectorValuedSetFunctionPackage α β) where
  additiveClosed : P.function.additive = P.function.additive
  f_emptyClosed : P.function.f_empty = 0

def VectorValuedSetFunctionClosed {α : Type u} [MeasurableSpace α] {β : Type v} [NormedAddCommGroup β] (P : VectorValuedSetFunctionPackage α β) : Prop :=
  P.function.additive = P.function.additive ∧ P.function.f_empty = 0

theorem vector_valued_set_function_closed_from_evidence
    {α : Type u} [MeasurableSpace α] {β : Type v} [NormedAddCommGroup β]
    (P : VectorValuedSetFunctionPackage α β) (E : VectorValuedSetFunctionEvidence P) :
    VectorValuedSetFunctionClosed P := by
  exact And.intro E.additiveClosed E.f_emptyClosed

end VectorValuedSetFunctionsMeasuresCanonicalLaneLean
end HautevilleHouse