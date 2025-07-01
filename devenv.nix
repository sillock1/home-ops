{ pkgs, lib, config, inputs, ... }:

{
  languages.python = {
    enable = true;
    package = pkgs.python313;
    venv.enable = true;
    uv = {
      enable = true;
      sync.enable = true;
    };
  };
}
