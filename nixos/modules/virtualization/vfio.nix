
{ ... }:

{
  # Reservar la Radeon RX580 y su función de audio.
  boot.kernelParams = [
    "vfio-pci.ids=1002:67df,1002:aaf0"
  ];

  # Cargar VFIO durante el arranque temprano.
  boot.initrd.kernelModules = [
    "vfio"
    "vfio_pci"
    "vfio_iommu_type1"
  ];
}
