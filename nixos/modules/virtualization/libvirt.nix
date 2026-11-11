{ pkgs, ... }:

{
  virtualisation.libvirtd = {
    enable = true;

    qemu = {
      package = pkgs.qemu_kvm;
      runAsRoot = false;
      swtpm.enable = true;

      verbatimConfig = ''
        namespaces = []

        cgroup_device_acl = [
          "/dev/null",
          "/dev/full",
          "/dev/zero",
          "/dev/random",
          "/dev/urandom",
          "/dev/ptmx",
          "/dev/kvm",
          "/dev/rtc",
          "/dev/hpet",
          "/dev/input/vfio-keyboard",
          "/dev/input/vfio-mouse"
        ]
      '';
    };
  };

  programs.virt-manager.enable = true;

  services.udev.extraRules = ''
    # Acheron Apollo87HL - teclado principal
    SUBSYSTEM=="input", KERNEL=="event*", ENV{ID_VENDOR_ID}=="ac11", ENV{ID_MODEL_ID}=="6589", ENV{ID_INPUT_KEYBOARD}=="1", ENV{ID_USB_INTERFACE_NUM}=="00", GROUP="qemu-libvirtd", MODE="0660", SYMLINK+="input/vfio-keyboard"

    # Logitech G502 HERO - ratón principal
    SUBSYSTEM=="input", KERNEL=="event*", ENV{ID_VENDOR_ID}=="046d", ENV{ID_MODEL_ID}=="c08b", ENV{ID_INPUT_MOUSE}=="1", ENV{ID_USB_INTERFACE_NUM}=="00", GROUP="qemu-libvirtd", MODE="0660", SYMLINK+="input/vfio-mouse"
  '';}
