import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.VectorValuedSetFunctionsMeasuresCanonicalLaneLean.Integration

namespace HautevilleHouse
namespace VectorValuedSetFunctionsMeasuresCanonicalLaneLean

structure RadonNikodymPackage (f : VectorSetFunction) (μ ν : VectorMeasure f) where
  derivativeExists : Prop
  densityFunction : f.domain → f.codomain
  recoveryFormula : ∀ (E : Set f.domain), ν.measureOnSets E = ∫ x in E, densityFunction x ∂μ

structure RadonNikodymEvidence (f : VectorSetFunction) (μ ν : VectorMeasure f) (R : RadonNikodymPackage f μ ν) where
  derivativeExistsClosed : R.derivativeExists
  recoveryFormulaClosed : R.recoveryFormula

def RadonNikodymClosed (f : VectorSetFunction) (μ ν : VectorMeasure f) (R : RadonNikodymPackage f μ ν) : Prop :=
  R.derivativeExists ∧ R.recoveryFormula

theorem radon_nikodym_closed_from_evidence (f : VectorSetFunction) (μ ν : VectorMeasure f) (R : RadonNikodymPackage f μ ν) (E : RadonNikodymEvidence f μ ν R) :
    RadonNikodymClosed f μ ν R := by
  exact And.intro E.derivativeExistsClosed E.recoveryFormulaClosed

end VectorValuedSetFunctionsMeasuresCanonicalLaneLean
end HautevilleHouse