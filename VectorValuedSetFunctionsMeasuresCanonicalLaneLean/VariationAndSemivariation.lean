import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VectorValuedSetFunctionsMeasuresCanonicalLaneLean

structure VariationPackage where
  vectorMeasure : VectorMeasurePackage
  variationDefined : Prop
  semiVariationDefined : Prop
  variationFinite : Prop
  semiVariationFinite : Prop

structure VariationEvidence (P : VariationPackage) where
  variationDefinedClosed : P.variationDefined
  semiVariationDefinedClosed : P.semiVariationDefined
  variationFiniteClosed : P.variationFinite
  semiVariationFiniteClosed : P.semiVariationFinite

def variationClosed (P : VariationPackage) : Prop :=
  P.variationDefined ∧ P.semiVariationDefined ∧
  P.variationFinite ∧ P.semiVariationFinite

theorem variation_closed_from_evidence
    (P : VariationPackage) (E : VariationEvidence P) :
    variationClosed P := by
  exact And.intro E.variationDefinedClosed
    (And.intro E.semiVariationDefinedClosed
      (And.intro E.variationFiniteClosed E.semiVariationFiniteClosed))

end VectorValuedSetFunctionsMeasuresCanonicalLaneLean
end HautevilleHouse