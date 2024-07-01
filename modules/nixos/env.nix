{
  # Globally set all x applications to use Wayland! (e.g slack, discord, anything electron etc.)
  # This is requires for these applications to scale properly on Wayland
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
