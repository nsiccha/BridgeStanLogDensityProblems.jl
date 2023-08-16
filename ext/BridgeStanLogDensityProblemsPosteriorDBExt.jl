module BridgeStanLogDensityProblemsPosteriorDBExt

# Load main package and extension dependencies
using BridgeStanLogDensityProblems, PosteriorDB

BridgeStanLogDensityProblems.BridgeStanLogDensityProblem(posterior::PosteriorDB.Posterior) = BridgeStanLogDensityProblem(
    PosteriorDB.path(PosteriorDB.implementation(PosteriorDB.model(posterior), "stan")),
    PosteriorDB.load(PosteriorDB.dataset(posterior), String)
)

end