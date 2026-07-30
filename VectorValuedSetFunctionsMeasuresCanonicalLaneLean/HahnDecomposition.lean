import canonicalLaneMathlib.AdmissibleClass
import VectorValuedSetFunctionsMeasuresCanonicalLaneLean.SetFunctionDefinitions

namespace HautevilleHouse
namespace VectorValuedSetFunctionsMeasuresCanonicalLaneLean

structure SignedMeasure (α : Type u) [MeasurableSpace α] where
  positiveSet : Set α
  negativeSet : Set α
  decomposition : Prop
  measure : Set α → ℝ

def HahnDecompositionClosed (s : SignedMeasure α) : Prop :=
  s.decomposition

theorem hahn_decomposition_closed_from_evidence (s : SignedMeasure α) (h : s.decomposition) : HahnDecompositionClosed s := h

end VectorValuedSetFunctionsMeasuresCanonicalLaneLean
end HautevilleHouse