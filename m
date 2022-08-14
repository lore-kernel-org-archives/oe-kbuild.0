Content-Type: multipart/mixed; boundary="===============4914245678579680478=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/vfio/fsl-mc/vfio_fsl_mc.c:79:21: warning: use of uninitialized value '<unknown>' [CWE-457]
Date: Sun, 14 Aug 2022 22:44:50 +0800
Message-ID: <202208142248.XcwPK3kT-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4914245678579680478==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: drivers/v=
fio/fsl-mc/vfio_fsl_mc.c:79:21: warning: use of uninitialized value '<unkno=
wn>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Diana Craciun <diana.craciun@oss.nxp.com>
CC: Alex Williamson <alex.williamson@redhat.com>
CC: Laurentiu Tudor <laurentiu.tudor@nxp.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   aea23e7c464bfdec04b52cf61edb62030e9e0d0a
commit: 8798a803ddf6329dc3b995775862b571db4909d2 vfio/fsl-mc: Add per devic=
e reset support
date:   11 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 11 months ago
config: arm-randconfig-c002-20220808 (https://download.01.org/0day-ci/archi=
ve/20220814/202208142248.XcwPK3kT-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D8798a803ddf6329dc3b995775862b571db4909d2
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 8798a803ddf6329dc3b995775862b571db4909d2
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc-analyzer warnings: (new ones prefixed by >>)
   drivers/vfio/fsl-mc/vfio_fsl_mc.c: In function 'vfio_fsl_mc_reset_device=
':
>> drivers/vfio/fsl-mc/vfio_fsl_mc.c:79:21: warning: use of uninitialized v=
alue '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
      79 |                 u16 token;
         |                     ^~~~~
     'vfio_fsl_mc_reset_device': events 1-3
       |
       |   73 |         if (is_fsl_mc_bus_dprc(vdev->mc_dev)) {
       |      |            ^
       |      |            |
       |      |            (1) following 'false' branch...
       |......
       |   79 |                 u16 token;
       |      |                     ~~~~~
       |      |                     |
       |      |                     (2) ...to here
       |      |                     (3) use of uninitialized value '<unknow=
n>' here
       |

vim +79 drivers/vfio/fsl-mc/vfio_fsl_mc.c

df747bcd5b216d Diana Craciun  2020-10-05  67  =

8798a803ddf632 Diana Craciun  2021-09-22  68  static int vfio_fsl_mc_reset_=
device(struct vfio_fsl_mc_device *vdev)
8798a803ddf632 Diana Craciun  2021-09-22  69  {
8798a803ddf632 Diana Craciun  2021-09-22  70  	struct fsl_mc_device *mc_dev=
 =3D vdev->mc_dev;
8798a803ddf632 Diana Craciun  2021-09-22  71  	int ret =3D 0;
8798a803ddf632 Diana Craciun  2021-09-22  72  =

8798a803ddf632 Diana Craciun  2021-09-22  73  	if (is_fsl_mc_bus_dprc(vdev-=
>mc_dev)) {
8798a803ddf632 Diana Craciun  2021-09-22  74  		return dprc_reset_container=
(mc_dev->mc_io, 0,
8798a803ddf632 Diana Craciun  2021-09-22  75  					mc_dev->mc_handle,
8798a803ddf632 Diana Craciun  2021-09-22  76  					mc_dev->obj_desc.id,
8798a803ddf632 Diana Craciun  2021-09-22  77  					DPRC_RESET_OPTION_NON_RE=
CURSIVE);
8798a803ddf632 Diana Craciun  2021-09-22  78  	} else {
8798a803ddf632 Diana Craciun  2021-09-22 @79  		u16 token;
8798a803ddf632 Diana Craciun  2021-09-22  80  =

8798a803ddf632 Diana Craciun  2021-09-22  81  		ret =3D fsl_mc_obj_open(mc_=
dev->mc_io, 0, mc_dev->obj_desc.id,
8798a803ddf632 Diana Craciun  2021-09-22  82  				      mc_dev->obj_desc.ty=
pe,
8798a803ddf632 Diana Craciun  2021-09-22  83  				      &token);
8798a803ddf632 Diana Craciun  2021-09-22  84  		if (ret)
8798a803ddf632 Diana Craciun  2021-09-22  85  			goto out;
8798a803ddf632 Diana Craciun  2021-09-22  86  		ret =3D fsl_mc_obj_reset(mc=
_dev->mc_io, 0, token);
8798a803ddf632 Diana Craciun  2021-09-22  87  		if (ret) {
8798a803ddf632 Diana Craciun  2021-09-22  88  			fsl_mc_obj_close(mc_dev->m=
c_io, 0, token);
8798a803ddf632 Diana Craciun  2021-09-22  89  			goto out;
8798a803ddf632 Diana Craciun  2021-09-22  90  		}
8798a803ddf632 Diana Craciun  2021-09-22  91  		ret =3D fsl_mc_obj_close(mc=
_dev->mc_io, 0, token);
8798a803ddf632 Diana Craciun  2021-09-22  92  	}
8798a803ddf632 Diana Craciun  2021-09-22  93  out:
8798a803ddf632 Diana Craciun  2021-09-22  94  	return ret;
8798a803ddf632 Diana Craciun  2021-09-22  95  }
fb1ff4c1941573 Bharat Bhushan 2020-10-05  96  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4914245678579680478==--

