{
  inputs,
  pkgs,
  asztal,
  ...
}: {
  imports = [
    inputs.ags.homeManagerModules.default
    inputs.astal.homeManagerModules.default
  ];

  home.packages = with pkgs; [
    asztal
    bun
    dart-sass
    fd
    brightnessctl
    swww
    inputs.matugen.packages.${system}.default
    slurp
    wf-recorder
    wl-clipboard
    wayshot
    swappy
    hyprpicker
    pavucontrol
    networkmanager
    gtk3
  ];

    home.file.".cache/ags/options.json" = {
      source = ../../ags/options.json;
    };

  programs.astal = {
    enable = true;
    extraPackages = with pkgs; [
      libadwaita
    ];
  };

  programs.ags = {
    enable = true;
    configDir = ../../ags;
    # extraPackages = with pkgs; [
    #   accountsservice
    # ];
  };
}
