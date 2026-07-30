import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VectorValuedSetFunctionsMeasuresCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  VectorMeasureClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end VectorValuedSetFunctionsMeasuresCanonicalLaneLean
end HautevilleHouse
