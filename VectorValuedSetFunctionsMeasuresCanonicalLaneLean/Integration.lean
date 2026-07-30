import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VectorValuedSetFunctionsMeasuresCanonicalLaneLean

structure IntegrationPackage where
  vectorMeasure : VectorMeasurePackage
  simpleFunctionsDefined : Prop
  integralDefined : Prop
  dominatedConvergence : Prop
  boundedLinearFunctionalIntegration : Prop

structure IntegrationEvidence (P : IntegrationPackage) where
  simpleFunctionsDefinedClosed : P.simpleFunctionsDefined
  integralDefinedClosed : P.integralDefined
  dominatedConvergenceClosed : P.dominatedConvergence
  boundedLinearFunctionalIntegrationClosed : P.boundedLinearFunctionalIntegration

def integrationClosed (P : IntegrationPackage) : Prop :=
  P.simpleFunctionsDefined ∧ P.integralDefined ∧
  P.dominatedConvergence ∧ P.boundedLinearFunctionalIntegration

theorem integration_closed_from_evidence
    (P : IntegrationPackage) (E : IntegrationEvidence P) :
    integrationClosed P := by
  exact And.intro E.simpleFunctionsDefinedClosed
    (And.intro E.integralDefinedClosed
      (And.intro E.dominatedConvergenceClosed E.boundedLinearFunctionalIntegrationClosed))

end VectorValuedSetFunctionsMeasuresCanonicalLaneLean
end HautevilleHouse