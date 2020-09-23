Content-Type: multipart/mixed; boundary="===============6771051733642808873=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [intel-linux-intel-lts:5.4/yocto 414/1142] drivers/misc/xlink-pcie/local_host/mxlk_epf.c:478:6: warning: Variable 'ret' is reassigned a value before the old one has been used.
Date: Wed, 23 Sep 2020 23:28:29 +0800
Message-ID: <202009232324.i96uHK5B%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6771051733642808873==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Xin Zhang <xin.x.zhang@intel.com>
CC: "Li, Yifan" <yifan2.li@intel.com>

tree:   https://github.com/intel/linux-intel-lts.git 5.4/yocto
head:   eeb611e5394c56d45c5cc8f7dc484c9f19e93143
commit: 792c8003efc4d75b5f52db70e7380b6a425bdba8 [414/1142] xlink-pcie: XLi=
nk PCIe Remote and Local Host driver
:::::: branch date: 5 weeks ago
:::::: commit date: 5 weeks ago
compiler: ia64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> drivers/misc/xlink-pcie/local_host/mxlk_epf.c:478:6: warning: Variable '=
ret' is reassigned a value before the old one has been used. [redundantAssi=
gnment]
    ret =3D pci_epf_register_driver(&mxlk_pcie_epf_driver);
        ^
   drivers/misc/xlink-pcie/local_host/mxlk_epf.c:476:0: note: Variable 'ret=
' is reassigned a value before the old one has been used.
    int ret =3D -EBUSY;
   ^
   drivers/misc/xlink-pcie/local_host/mxlk_epf.c:478:6: note: Variable 'ret=
' is reassigned a value before the old one has been used.
    ret =3D pci_epf_register_driver(&mxlk_pcie_epf_driver);
        ^

# https://github.com/intel/linux-intel-lts/commit/792c8003efc4d75b5f52db70e=
7380b6a425bdba8
git remote add intel-linux-intel-lts https://github.com/intel/linux-intel-l=
ts.git
git fetch --no-tags intel-linux-intel-lts 5.4/yocto
git checkout 792c8003efc4d75b5f52db70e7380b6a425bdba8
vim +/ret +478 drivers/misc/xlink-pcie/local_host/mxlk_epf.c

792c8003efc4d75 Xin Zhang 2020-07-07  473  =

792c8003efc4d75 Xin Zhang 2020-07-07  474  static int __init mxlk_epf_init(=
void)
792c8003efc4d75 Xin Zhang 2020-07-07  475  {
792c8003efc4d75 Xin Zhang 2020-07-07  476  	int ret =3D -EBUSY;
792c8003efc4d75 Xin Zhang 2020-07-07  477  =

792c8003efc4d75 Xin Zhang 2020-07-07 @478  	ret =3D pci_epf_register_driver=
(&mxlk_pcie_epf_driver);
792c8003efc4d75 Xin Zhang 2020-07-07  479  	if (ret) {
792c8003efc4d75 Xin Zhang 2020-07-07  480  		pr_err("Failed to register xli=
nk pcie epf driver: %d\n", ret);
792c8003efc4d75 Xin Zhang 2020-07-07  481  		return ret;
792c8003efc4d75 Xin Zhang 2020-07-07  482  	}
792c8003efc4d75 Xin Zhang 2020-07-07  483  =

792c8003efc4d75 Xin Zhang 2020-07-07  484  	return 0;
792c8003efc4d75 Xin Zhang 2020-07-07  485  }
792c8003efc4d75 Xin Zhang 2020-07-07  486  module_init(mxlk_epf_init);
792c8003efc4d75 Xin Zhang 2020-07-07  487  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6771051733642808873==--

