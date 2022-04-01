Content-Type: multipart/mixed; boundary="===============7283904020560335244=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [chrome-os:chromeos-5.15 7267/7390] drivers/gpu/drm/img-rogue/1.13/mem_utils.c:322:31: sparse: sparse: cannot dereference this type
Date: Sat, 02 Apr 2022 01:37:30 +0800
Message-ID: <202204020158.wOx6rlLr-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7283904020560335244==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: cros-kernel-buildreports(a)googlegroups.com
TO: Guenter Roeck <groeck@google.com>

Hi Luigi,

First bad commit (maybe !=3D root cause):

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chr=
omeos-5.15
head:   eedd65d2f3214b74707f45e6ea23dd7390cd721f
commit: 1426cb6d787cf4d1835ac9996e86d26484cf142b [7267/7390] CHROMIUM: drm:=
 add img-rogue to the drm build system
:::::: branch date: 4 hours ago
:::::: commit date: 8 days ago
config: arm64-randconfig-s031-20220401 (https://download.01.org/0day-ci/arc=
hive/20220402/202204020158.wOx6rlLr-lkp(a)intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        git remote add chrome-os https://chromium.googlesource.com/chromium=
os/third_party/kernel
        git fetch --no-tags chrome-os chromeos-5.15
        git checkout 1426cb6d787cf4d1835ac9996e86d26484cf142b
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.2.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Da=
rm64 SHELL=3D/bin/bash drivers/gpu/drm/img-rogue/1.13/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/img-rogue/1.13/mem_utils.c:322:31: sparse: sparse: canno=
t dereference this type

vim +322 drivers/gpu/drm/img-rogue/1.13/mem_utils.c

425cbd2feb4569 Luigi Santivetti 2022-03-16  307  =

425cbd2feb4569 Luigi Santivetti 2022-03-16  308  #if defined(DEVICE_MEMSETC=
PY_NON_VECTOR_KM)
425cbd2feb4569 Luigi Santivetti 2022-03-16  309  		BLK_t bValue =3D 0;
425cbd2feb4569 Luigi Santivetti 2022-03-16  310  =

425cbd2feb4569 Luigi Santivetti 2022-03-16  311  		uBlockSize =3D sizeof(BL=
K_t) / sizeof(ui8Value);
425cbd2feb4569 Luigi Santivetti 2022-03-16  312  =

425cbd2feb4569 Luigi Santivetti 2022-03-16  313  		for (i =3D 0; i < uBlock=
Size; i++)
425cbd2feb4569 Luigi Santivetti 2022-03-16  314  		{
425cbd2feb4569 Luigi Santivetti 2022-03-16  315  			bValue |=3D (BLK_t)ui8V=
alue << ((uBlockSize - i - 1) * BITS_PER_BYTE);
425cbd2feb4569 Luigi Santivetti 2022-03-16  316  		}
425cbd2feb4569 Luigi Santivetti 2022-03-16  317  #else
425cbd2feb4569 Luigi Santivetti 2022-03-16  318  		BLK_t bValue =3D {0};
425cbd2feb4569 Luigi Santivetti 2022-03-16  319  =

425cbd2feb4569 Luigi Santivetti 2022-03-16  320  		uBlockSize =3D sizeof(bV=
alue) / sizeof(unsigned int);
425cbd2feb4569 Luigi Santivetti 2022-03-16  321  		for (i =3D 0; i < uBlock=
Size; i++)
425cbd2feb4569 Luigi Santivetti 2022-03-16 @322  			bValue[i] =3D ui8Value =
<< 24U |
425cbd2feb4569 Luigi Santivetti 2022-03-16  323  			            ui8Value <<=
 16U |
425cbd2feb4569 Luigi Santivetti 2022-03-16  324  			            ui8Value <<=
  8U |
425cbd2feb4569 Luigi Santivetti 2022-03-16  325  			            ui8Value;
425cbd2feb4569 Luigi Santivetti 2022-03-16  326  #endif /* defined(DEVICE_M=
EMSETCPY_NON_VECTOR_KM) */
425cbd2feb4569 Luigi Santivetti 2022-03-16  327  =


:::::: The code@line 322 was first introduced by commit
:::::: 425cbd2feb456937b3e6d9c9351a2064d6ddcd74 CHROMIUM: drm/img-rogue: Ad=
d 1.13 IMG PowerVR Rogue driver

:::::: TO: Luigi Santivetti <luigi.santivetti@imagination.corp-partner.go=
ogle.com>
:::::: CC: Chromeos LUCI <chromeos-scoped@luci-project-accounts.iam.gserv=
iceaccount.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7283904020560335244==--

