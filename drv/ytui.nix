{ rustPlatform
, fetchFromGitHub
, installShellFiles
, makeWrapper
, openssl
, pkg-config
, mpv
, sqlite
, youtube-dl
, lib
}:

rustPlatform.buildRustPackage rec {
  pname = "ytui-music";
  version = "v2.0.1-main";

  src = fetchFromGitHub {
    owner = "sudipghimire533";
    repo = pname;
    rev = "b639c344bbcaae1c943c36263be79a869f585ba1"; # main branch on Oct 10
    sha256 = "sha256-xJWhmR+FPFu4SxFcGS/hUJraXHQ6A9g467CD8bkfm0w=";
  };

  cargoSha256 = "sha256-KUO/aW3IfthmFpGpXdwzj+rbpVi7nJS24gVaOREoulc=";

  nativeBuildInputs = [
    installShellFiles
    makeWrapper
    openssl
    openssl.dev
    pkg-config
  ];

  buildInputs = [ mpv sqlite youtube-dl ];

  PKG_CONFIG_PATH = "${openssl.dev}/lib/pkgconfig";

  #postFixup = ''
  #wrapProgram "$out/bin/ytui_music" \
  #--prefix PATH : "${pkgs.lib.makeBinPath [ pkgs.mpv ]}"
  #'';

  doCheck = false; # skip tests

  doInstallCheck = true;

  meta = with lib; {
    description = "Youtube client in terminal for music";
    homepage = "https://github.com/sudipghimire533/ytui-music";
    license = with licenses; [ gpl2 ];
    maintainers = with maintainers; [ gvolpe ];
  };
}
