{ lib, stdenv, fetchFromGitHub, cmake, pkg-config
, gtk, glib, pcre, libappindicator, libpthreadstubs, xorg
, libxkbcommon, libepoxy, at-spi2-core, dbus, libdbusmenu
, wrapGAppsHook
}:

stdenv.mkDerivation rec {
  pname = "gromit-mpx";
  version = "1.5.0";

  src = fetchFromGitHub {
    owner = "bk138";
    repo = "gromit-mpx";
    rev = version;
    sha256 = "sha256-I2/9zRKpMkiB0IhnYuOrJHp4nNyG6pfful5D7OqCILQ=";
  };

  nativeBuildInputs = [ cmake pkg-config wrapGAppsHook ];
  buildInputs = [
    gtk glib pcre libappindicator libpthreadstubs
    xorg.libXdmcp libxkbcommon libepoxy at-spi2-core
    dbus libdbusmenu
  ];

  meta = with lib; {
    description = "Desktop annotation tool";

    longDescription = ''
      Gromit-MPX (GRaphics Over MIscellaneous Things) is a small tool
      to make annotations on the screen.
    '';

    homepage = "https://github.com/bk138/gromit-mpx";
    maintainers = with maintainers; [ pjones ];
    platforms = platforms.linux;
    license = licenses.gpl2Plus;
  };
}
