{
  description = "Marlowe vesting dapp";

  inputs = {
    iogx.url = "github:input-output-hk/iogx?ref=custom-precommit-hooks";
  };


  outputs = inputs: inputs.iogx.lib.mkFlake {
    inherit inputs;
    repoRoot = ./.;
    systems = [ "x86_64-linux" "x86_64-darwin" ];
    outputs = import ./nix/outputs.nix;
  };


  nixConfig = {
    extra-substituters = [
      "https://cache.iog.io"
    ];
    extra-trusted-public-keys = [
      "hydra.iohk.io:f/Ea+s+dFdN+3Y/G+FDgSq+a5NEWhJGzdjvKNGv0/EQ="
    ];
    allow-import-from-derivation = true;
  };
}
