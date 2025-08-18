{ config, lib, ... }:
{
  options.my.primaryUser = lib.mkOption {
    type = lib.types.str;
    default = "methylene";
    descrioption = "The primary user of the host";
  };
}
