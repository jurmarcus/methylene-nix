{ config, lib, ... }:
{
  options.my.primaryUser = mkOption {
    type = types.str;
    default = "methylene";
    descrioption = "The primary user of the host";
  }
}
