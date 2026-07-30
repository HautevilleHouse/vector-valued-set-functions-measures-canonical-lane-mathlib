import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VectorValuedSetFunctionsMeasuresCanonicalLaneLean

structure VectorValuedSetFunction (α : Type u) (β : Type v) [AddCommMonoid β] [TopologicalSpace β] where
  domain : Set α
  range : β
  additivity : Prop
  countableAdditivity : Prop

definition VectorMeasure (α : Type u) [MeasurableSpace α] (β : Type v) [NormedAddCommGroup β] : Type (max u v) :=
  { f : Set α → β // f ∅ = 0 ∧ ∀ (s : ℕ → Set α), (∀ n, MeasurableSet (s n)) → Pairwise (Disjoint on s) → Summable (λ n => f (s n)) ∧ f (⋃ n, s n) = ∑' n, f (s n) }

structure AdmissibleClass where
  object : VectorValuedSetFunction ℕ ℝ
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  VectorMeasureClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end VectorValuedSetFunctionsMeasuresCanonicalLaneLean
end HautevilleHouse
