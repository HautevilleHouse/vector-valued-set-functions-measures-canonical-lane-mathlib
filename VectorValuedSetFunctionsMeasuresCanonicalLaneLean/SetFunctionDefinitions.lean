import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VectorValuedSetFunctionsMeasuresCanonicalLaneLean

structure SetFunction (α : Type u) [MeasurableSpace α] (V : Type v) [NormedAddCommGroup V] where
  domain : Set α
  codomain : V
  countableAdditivity : Prop
  finiteVariation : Prop

structure VectorMeasure (α : Type u) [MeasurableSpace α] (V : Type v) [NormedAddCommGroup V] extends SetFunction α V where
  sigmaAdditivity : Prop
  totalVariationFinite : Prop

structure MeasureLike (α : Type u) [MeasurableSpace α] (V : Type v) [NormedAddCommGroup V] where
  carrier : Set α
  value : V
  measurability : MeasurableSet carrier

def SetFunctionClosed {α : Type u} [MeasurableSpace α] {V : Type v} [NormedAddCommGroup V] (f : SetFunction α V) : Prop :=
  f.countableAdditivity ∧ f.finiteVariation

theorem set_function_closed_from_properties {α : Type u} [MeasurableSpace α] {V : Type v} [NormedAddCommGroup V] (f : SetFunction α V) (hcount : f.countableAdditivity) (hvar : f.finiteVariation) : SetFunctionClosed f := by
  exact And.intro hcount hvar

end VectorValuedSetFunctionsMeasuresCanonicalLaneLean
end HautevilleHouse