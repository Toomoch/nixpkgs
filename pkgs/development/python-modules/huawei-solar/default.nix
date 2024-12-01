{
  lib,
  python3,
  fetchFromGitHub,
  fetchFromGitLab,
}:

python3.pkgs.buildPythonPackage rec {
  pname = "huawei-solar";
  version = "2.3.0";
  pyproject = true;

  src = fetchFromGitLab {
    owner = "Emilv2";
    repo = pname;
    rev = version;
    hash = "sha256-PcpyyEH3Ad9oyr4aPlUgxU5S/NPoIDUZj+Ncs7FXhVA=";
  };

  build-system = with python3.pkgs; [
    hatchling
    hatch-vcs
  ];
  dependencies = with python3.pkgs; [
    backoff
    pytz
    pymodbus
    typing-extensions
    pyserial-asyncio
  ];

  meta = with lib; {
    description = "Python library for connecting to Huawei SUN2000 Inverters over Modbus";
    homepage = "https://gitlab.com/Emilv2/huawei-solar/";
    changelog = "https://gitlab.com/Emilv2/huawei-solar/-/tags/${version}";
    maintainers = with maintainers; [ Toomoch ];
    license = licenses.agpl3Only;
    broken = lib.versionAtLeast python3.pkgs.pymodbus.version "3.7.0";
  };

}
