import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VectorValuedSetFunctionsMeasuresCanonicalLaneLean

structure BoundedVariationPackage where
  variationFinite : Prop
  decompositionExists : Prop
  totalVariationControlled : Prop

def BoundedVariationClosed (B : BoundedVariationPackage) : Prop :=
  B.variationFinite ∧ B.decompositionExists ∧ B.totalVariationControlled

theorem bounded_variation_closed_from_evidence (B : BoundedVariationPackage)
    (h1 : B.variationFinite) (h2 : B.decompositionExists) (h3 : B.totalVariationControlled) :
    BoundedVariationClosed B := by
  exact And.intro h1 (And.intro h2 h3)

end VectorValuedSetFunctionsMeasuresCanonicalLaneLean
end HautevilleHouse