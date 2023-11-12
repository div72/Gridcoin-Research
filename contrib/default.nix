let pkgs = import <nixpkgs> {};
in
with pkgs.stdenv;

pkgs.stdenv.mkDerivation {
  name = "gridcoin";

  doCheck = true;
  dontUseCmakeConfigure = true;
  enableParallelBuilding = true;
  sourceDir = ".";

  nativeBuildInputs = with pkgs.buildPackages; [ autoreconfHook cmake libtool pkg-config qt5.wrapQtAppsHook ]
  ++ lib.optionals stdenv.isDarwin [ hexdump perl ];
  buildInputs = with pkgs; [ boost openssl libevent curl qt5.qttools libzip qrencode ];

  unpackPhase = ''
    cp -r ${builtins.toString ./.}/../* .
  '';

  patchPhase = pkgs.lib.optionals pkgs.stdenv.isDarwin ''
    cd src/ && ../contrib/nomacro.pl && cd ..
  '';

  configureFlags = with pkgs; [
    "--with-boost-libdir=${boost.out}/lib"
    "--with-gui=qt5"
    "--with-qt-bindir=${qt5.qtbase.dev}/bin:${qt5.qttools.dev}/bin"
  ];

  checkFlags = with pkgs; [
    "QT_PLUGIN_PATH=${qt5.qtbase}/${qt5.qtbase.qtPluginPrefix}"
  ];
}
