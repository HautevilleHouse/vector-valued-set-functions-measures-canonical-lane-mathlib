import canonicalLaneMathlib.AdmissibleClass
import VectorValuedSetFunctionsMeasuresCanonicalLaneLean.SetFunctionDefinitions

namespace HautevilleHouse
namespace VectorValuedSetFunctionsMeasuresCanonicalLaneLean

structure LebesgueDecompositionData (α : Type u) [MeasurableSpace α] (V : Type v) [NormedAddCommGroup V] where
  nu : VectorMeasure α V
  mu : Measure α
  absolutelyContinuousPart : VectorMeasure α V
  singularPart : VectorMeasure α V
  decompositionProperty : Prop

def LebesgueDecompositionClosed (L : LebesgueDecompositionData α V) : Prop :=
  L.decompositionProperty

theorem lebesgue_decomposition_closed_from_evidence (L : LebesgueDecompositionData α V) (h : L.decompositionProperty) : LebesgueDecompositionClosed L := h

end VectorValuedSetFunctionsMeasuresCanonicalLaneLean
end HautevilleHouse