module PosteriorDB

# Load main package and extension dependencies
using BridgeStanLogDensityProblems

BridgeStanLogDensityProblems.BridgeStanLogDensityProblem(posterior::Posterior) = BridgeStanLogDensityProblems(
    PosteriorDB.path(PosteriorDB.implementation(PosteriorDB.model(posterior), "stan")),
    PosteriorDB.load(PosteriorDB.dataset(posterior), String)
)

end