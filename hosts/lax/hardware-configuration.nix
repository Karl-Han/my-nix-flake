{ config, lib, pkgs, modulesPath, ... }:
let 
  secrets = import ./secrets.nix;
in
{

  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" "sr_mod" ];
  boot.initrd.kernelModules = [ "dm-snapshot" ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  imports =
    [
      (modulesPath + "/installer/scan/not-detected.nix")
    ];
  fileSystems."/" =
    {
      # device = "/dev/ssd_vg/ssd_lv_root";
      device = "/dev/disk/by-uuid/03b89634-18f0-4fbd-b434-df17f3f6e4b7";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    {
      # device = "/dev/sda1";
      device = "/dev/disk/by-uuid/8578-E6F6";
      fsType = "vfat";
      options = [ "fmask=0022" "dmask=0022" ];
    };

  swapDevices = [ ];

  networking.interfaces.enp2s0f1 = {
    ipv4.addresses = [{ address = secrets.interfaceIpAddress; prefixLength = secrets.interfaceIpPrefix; }];
  };
  networking.defaultGateway = { address = secrets.interfaceIpGateway; interface = "enp2s0f1"; };

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}

