import canonicalLaneMathlib.AdmissibleClass
import Mathlib.MeasureTheory.Integral.Bochner

namespace HautevilleHouse
namespace VectorValuedSetFunctionsMeasuresCanonicalLaneLean

structure IntegrationPackage (α : Type u) (β : Type v) [NormedAddCommGroup β] [NormedSpace ℝ β] where
  integrableFunctions : Set (α → β)
  integralDefined : Prop
  linearity : Prop
  dominatedConvergence : Prop
  integralAgainstMeasure : VectorValuedMeasure α β → (α → β) → β

def IntegrationClosed (I : IntegrationPackage α β) : Prop :=
  I.integralDefined ∧ I.linearity ∧ I.dominatedConvergence

theorem integration_closed_from_evidence (I : IntegrationPackage α β)
    (h1 : I.integralDefined) (h2 : I.linearity) (h3 : I.dominatedConvergence) :
    IntegrationClosed I := by
  exact And.intro h1 (And.intro h2 h3)

end VectorValuedSetFunctionsMeasuresCanonicalLaneLean
end HautevilleHouse