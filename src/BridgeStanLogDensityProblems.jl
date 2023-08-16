module BridgeStanLogDensityProblems

export BridgeStanLogDensityProblem

using BridgeStan, LogDensityProblems

struct BridgeStanLogDensityProblem
    posterior::StanModel
end

BridgeStanLogDensityProblem(stan_file::AbstractString, data::AbstractString; kwargs...) = BridgeStanLogDensityProblem(
    StanModel(;stan_file=stan_file, data=data, kwargs...)
)


LogDensityProblems.dimension(what::BridgeStanLogDensityProblem) = Int64(BridgeStan.param_unc_num(what.posterior))
LogDensityProblems.capabilities(::Type{<:BridgeStanLogDensityProblem}) = LogDensityProblems.LogDensityOrder{2}()
LogDensityProblems.logdensity(what::BridgeStanLogDensityProblem, x) = try 
    BridgeStan.log_density(what.posterior, x)
catch e
    -Inf
end
LogDensityProblems.logdensity_and_gradient(what::BridgeStanLogDensityProblem, x) = try 
    BridgeStan.log_density_gradient(what.posterior, x)
catch e
    -Inf, -Inf .* x
end
LogDensityProblems.logdensity_gradient_and_hessian(what::BridgeStanLogDensityProblem, x) = BridgeStan.log_density_hessian(what.posterior, x)


end