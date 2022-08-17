Content-Type: multipart/mixed; boundary="===============1408684005248726166=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [intel-tdx:guest-filter 1/28] drivers/usb/core/sysfs.c:1164:24: warning: unused variable 'intf'
Date: Wed, 17 Aug 2022 08:20:31 +0800
Message-ID: <202208170816.9Y3pFVhv-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1408684005248726166==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "commit no functional change"
:::::: =


BCC: lkp(a)intel.com
CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.co=
m>
CC: Dan Williams <dan.j.williams@intel.com>

tree:   https://github.com/intel/tdx.git guest-filter
head:   c8ae661a124d107ccb71713b70010f1bf237b7a2
commit: 43ef78fa0be78320a27a01cee80aeb3e235ab426 [1/28] driver core: Move t=
he "authorized" attribute from USB/Thunderbolt to core
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
config: i386-randconfig-a012-20220815 (https://download.01.org/0day-ci/arch=
ive/20220817/202208170816.9Y3pFVhv-lkp(a)intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project aed5e3=
bea138ce581d682158eb61c27b3cfdd6ec)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/tdx/commit/43ef78fa0be78320a27a01cee80ae=
b3e235ab426
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx guest-filter
        git checkout 43ef78fa0be78320a27a01cee80aeb3e235ab426
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross W=3D=
1 O=3Dbuild_dir ARCH=3Di386 SHELL=3D/bin/bash drivers/usb/core/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/usb/core/sysfs.c:1164:24: warning: unused variable 'intf' [-Wunu=
sed-variable]
           struct usb_interface *intf =3D to_usb_interface(dev);
                                 ^
   1 warning generated.


vim +/intf +1164 drivers/usb/core/sysfs.c

49e7cc84a86784 Sarah Sharp                2008-10-06  1156  =

310d2b4124c073 Stefan Koch                2015-08-25  1157  /*
310d2b4124c073 Stefan Koch                2015-08-25  1158   * interface_au=
thorized_show - show authorization status of an USB interface
310d2b4124c073 Stefan Koch                2015-08-25  1159   * 1 is authori=
zed, 0 is deauthorized
310d2b4124c073 Stefan Koch                2015-08-25  1160   */
310d2b4124c073 Stefan Koch                2015-08-25  1161  static ssize_t =
interface_authorized_show(struct device *dev,
310d2b4124c073 Stefan Koch                2015-08-25  1162  		struct device=
_attribute *attr, char *buf)
310d2b4124c073 Stefan Koch                2015-08-25  1163  {
310d2b4124c073 Stefan Koch                2015-08-25 @1164  	struct usb_int=
erface *intf =3D to_usb_interface(dev);
310d2b4124c073 Stefan Koch                2015-08-25  1165  =

43ef78fa0be783 Kuppuswamy Sathyanarayanan 2021-08-14  1166  	return sysfs_e=
mit(buf, "%u\n", dev->authorized);
310d2b4124c073 Stefan Koch                2015-08-25  1167  }
310d2b4124c073 Stefan Koch                2015-08-25  1168  =


:::::: The code at line 1164 was first introduced by commit
:::::: 310d2b4124c073a2057ef9d952d4d938e9b1dfd9 usb: interface authorizatio=
n: SysFS part of USB interface authorization

:::::: TO: Stefan Koch <stefan.koch10@gmail.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1408684005248726166==--

