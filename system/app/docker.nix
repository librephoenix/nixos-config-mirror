{ config, lib, pkgs, myName, storageDriver ? null, ... }:

assert lib.asserts.assertOneOf "storageDriver" storageDriver [
  null
  "aufs"
  "btrfs"
  "devicemapper"
  "overlay"
  "overlay2"
  "zfs"
];

{
  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
    storageDriver = storageDriver;
    autoPrune.enable = true;
  };
  users.users.${myName}.extraGroups = [ "docker" ];
}
