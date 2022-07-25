Content-Type: multipart/mixed; boundary="===============7550809903279262280=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/media/i2c/ov9282.c:755:13: warning: use of uninitialized value '<unknown>' [CWE-457]
Date: Mon, 25 Jul 2022 16:58:23 +0000
Message-ID: <202207250020.BIeB1mck-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7550809903279262280==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: drivers/m=
edia/i2c/ov9282.c:755:13: warning: use of uninitialized value '<unknown>' [=
CWE-457] [-Wanalyzer-use-of-uninitialized-value]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Martina Krasteva <martinax.krasteva@intel.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org
CC: Sakari Ailus <sakari.ailus@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   515f71412bb73ebd7f41f90e1684fc80b8730789
commit: 14ea315bbeb75aa996b577822999df4edbcfb3d0 media: i2c: Add ov9282 cam=
era sensor driver
date:   12 months ago
:::::: branch date: 23 hours ago
:::::: commit date: 12 months ago
config: arm-randconfig-c002-20220718 (https://download.01.org/0day-ci/archi=
ve/20220725/202207250020.BIeB1mck-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D14ea315bbeb75aa996b577822999df4edbcfb3d0
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 14ea315bbeb75aa996b577822999df4edbcfb3d0
        # save the config file
         ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc-analyzer warnings: (new ones prefixed by >>)
   drivers/media/i2c/ov9282.c: In function 'ov9282_detect':
>> drivers/media/i2c/ov9282.c:755:13: warning: use of uninitialized value '=
<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     755 |         u32 val;
         |             ^~~
     'ov9282_detect': event 1
       |
       |  755 |         u32 val;
       |      |             ^~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
       |

vim +755 drivers/media/i2c/ov9282.c

14ea315bbeb75a Martina Krasteva 2021-05-27  745  =

14ea315bbeb75a Martina Krasteva 2021-05-27  746  /**
14ea315bbeb75a Martina Krasteva 2021-05-27  747   * ov9282_detect() - Detec=
t ov9282 sensor
14ea315bbeb75a Martina Krasteva 2021-05-27  748   * @ov9282: pointer to ov9=
282 device
14ea315bbeb75a Martina Krasteva 2021-05-27  749   *
14ea315bbeb75a Martina Krasteva 2021-05-27  750   * Return: 0 if successful=
, -EIO if sensor id does not match
14ea315bbeb75a Martina Krasteva 2021-05-27  751   */
14ea315bbeb75a Martina Krasteva 2021-05-27  752  static int ov9282_detect(s=
truct ov9282 *ov9282)
14ea315bbeb75a Martina Krasteva 2021-05-27  753  {
14ea315bbeb75a Martina Krasteva 2021-05-27  754  	int ret;
14ea315bbeb75a Martina Krasteva 2021-05-27 @755  	u32 val;
14ea315bbeb75a Martina Krasteva 2021-05-27  756  =

14ea315bbeb75a Martina Krasteva 2021-05-27  757  	ret =3D ov9282_read_reg(o=
v9282, OV9282_REG_ID, 2, &val);
14ea315bbeb75a Martina Krasteva 2021-05-27  758  	if (ret)
14ea315bbeb75a Martina Krasteva 2021-05-27  759  		return ret;
14ea315bbeb75a Martina Krasteva 2021-05-27  760  =

14ea315bbeb75a Martina Krasteva 2021-05-27  761  	if (val !=3D OV9282_ID) {
14ea315bbeb75a Martina Krasteva 2021-05-27  762  		dev_err(ov9282->dev, "ch=
ip id mismatch: %x!=3D%x",
14ea315bbeb75a Martina Krasteva 2021-05-27  763  			OV9282_ID, val);
14ea315bbeb75a Martina Krasteva 2021-05-27  764  		return -ENXIO;
14ea315bbeb75a Martina Krasteva 2021-05-27  765  	}
14ea315bbeb75a Martina Krasteva 2021-05-27  766  =

14ea315bbeb75a Martina Krasteva 2021-05-27  767  	return 0;
14ea315bbeb75a Martina Krasteva 2021-05-27  768  }
14ea315bbeb75a Martina Krasteva 2021-05-27  769  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7550809903279262280==--

