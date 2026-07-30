import canonicalLaneMathlib.AdmissibleClass
import Mathlib.MeasureTheory.Measure.MeasureSpace

namespace HautevilleHouse
namespace VectorValuedSetFunctionsMeasuresCanonicalLaneLean

structure VectorValuedMeasure (α : Type u) (β : Type v) [AddCommMonoid β] [TopologicalSpace β] where
  carrier : Set α
  measure : Set α → β
  empty : measure ∅ = 0
  countableAdditive : ∀ (E : ℕ → Set α), Pairwise (fun i j => Disjoint (E i) (E j)) → measure (⋃ n, E n) = ∑' n, measure (E n)

structure AdmittedObject where
  space : Type u
  sigmaAlgebra : Set (Set space)
  targetSpace : Type v
  targetAddCommMonoid : AddCommMonoid targetSpace
  targetTopology : TopologicalSpace targetSpace
  signedMeasure : VectorValuedMeasure space targetSpace
  countablyAdditiveClosure : signedMeasure.countableAdditive
  boundedVariation : Prop
  measureClosed : bridgeClosed (AdmissibleClass.mk this (boundedVariation) (True) (Or.inl boundedVariation))

end VectorValuedSetFunctionsMeasuresCanonicalLaneLean
end HautevilleHouse