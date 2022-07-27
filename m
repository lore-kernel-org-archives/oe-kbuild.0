Content-Type: multipart/mixed; boundary="===============7735494554181652689=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/media/i2c/ov13b10.c:639:16: warning: use of uninitialized value '<unknown>' [CWE-457]
Date: Thu, 28 Jul 2022 03:00:19 +0800
Message-ID: <202207280252.9RnqpRVE-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7735494554181652689==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: drivers/m=
edia/i2c/ov13b10.c:639:16: warning: use of uninitialized value '<unknown>' =
[CWE-457] [-Wanalyzer-use-of-uninitialized-value]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Arec Kao <arec.kao@intel.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org
CC: Sakari Ailus <sakari.ailus@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   6e7765cb477a9753670d4351d14de93f1e9dbbd4
commit: 7ee85054682299babdb32f597b11daeec2d3e9d9 media: Add sensor driver s=
upport for the ov13b10 camera.
date:   10 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 10 months ago
config: arm-randconfig-c002-20220718 (https://download.01.org/0day-ci/archi=
ve/20220728/202207280252.9RnqpRVE-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D7ee85054682299babdb32f597b11daeec2d3e9d9
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 7ee85054682299babdb32f597b11daeec2d3e9d9
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc-analyzer warnings: (new ones prefixed by >>)
   drivers/media/i2c/ov13b10.c: In function 'ov13b10_write_reg':
>> drivers/media/i2c/ov13b10.c:639:16: warning: use of uninitialized value =
'<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     639 |         __be32 val;
         |                ^~~
     'ov13b10_write_reg': event 1
       |
       |  639 |         __be32 val;
       |      |                ^~~
       |      |                |
       |      |                (1) use of uninitialized value '<unknown>' h=
ere
       |
   drivers/media/i2c/ov13b10.c: In function 'ov13b10_enable_test_pattern':
   drivers/media/i2c/ov13b10.c:744:13: warning: use of uninitialized value =
'<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     744 |         u32 val;
         |             ^~~
     'ov13b10_enable_test_pattern': event 1
       |
       |  744 |         u32 val;
       |      |             ^~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
       |
   drivers/media/i2c/ov13b10.c: In function 'ov13b10_set_ctrl_hflip':
   drivers/media/i2c/ov13b10.c:766:13: warning: use of uninitialized value =
'<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     766 |         u32 val;
         |             ^~~
     'ov13b10_set_ctrl_hflip': event 1
       |
       |  766 |         u32 val;
       |      |             ^~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
       |
   drivers/media/i2c/ov13b10.c: In function 'ov13b10_set_ctrl_vflip':
   drivers/media/i2c/ov13b10.c:797:13: warning: use of uninitialized value =
'<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     797 |         u32 val;
         |             ^~~
     'ov13b10_set_ctrl_vflip': event 1
       |
       |  797 |         u32 val;
       |      |             ^~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
       |
   drivers/media/i2c/ov13b10.c: In function 'ov13b10_identify_module':
   drivers/media/i2c/ov13b10.c:1152:13: warning: use of uninitialized value=
 '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
    1152 |         u32 val;
         |             ^~~
     'ov13b10_identify_module': event 1
       |
       | 1152 |         u32 val;
       |      |             ^~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
       |
   drivers/media/i2c/ov13b10.c: In function 'ov13b10_check_hwcfg':
   drivers/media/i2c/ov13b10.c:1318:13: warning: use of uninitialized value=
 '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
    1318 |         u32 ext_clk;
         |             ^~~~~~~
     'ov13b10_check_hwcfg': event 1
       |
       | 1318 |         u32 ext_clk;
       |      |             ^~~~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
       |

vim +639 drivers/media/i2c/ov13b10.c

7ee85054682299b Arec Kao 2021-08-17  631  =

7ee85054682299b Arec Kao 2021-08-17  632  /* Write registers up to 4 at a t=
ime */
7ee85054682299b Arec Kao 2021-08-17  633  static int ov13b10_write_reg(stru=
ct ov13b10 *ov13b,
7ee85054682299b Arec Kao 2021-08-17  634  			     u16 reg, u32 len, u32 __v=
al)
7ee85054682299b Arec Kao 2021-08-17  635  {
7ee85054682299b Arec Kao 2021-08-17  636  	struct i2c_client *client =3D v4=
l2_get_subdevdata(&ov13b->sd);
7ee85054682299b Arec Kao 2021-08-17  637  	int buf_i, val_i;
7ee85054682299b Arec Kao 2021-08-17  638  	u8 buf[6], *val_p;
7ee85054682299b Arec Kao 2021-08-17 @639  	__be32 val;
7ee85054682299b Arec Kao 2021-08-17  640  =

7ee85054682299b Arec Kao 2021-08-17  641  	if (len > 4)
7ee85054682299b Arec Kao 2021-08-17  642  		return -EINVAL;
7ee85054682299b Arec Kao 2021-08-17  643  =

7ee85054682299b Arec Kao 2021-08-17  644  	buf[0] =3D reg >> 8;
7ee85054682299b Arec Kao 2021-08-17  645  	buf[1] =3D reg & 0xff;
7ee85054682299b Arec Kao 2021-08-17  646  =

7ee85054682299b Arec Kao 2021-08-17  647  	val =3D cpu_to_be32(__val);
7ee85054682299b Arec Kao 2021-08-17  648  	val_p =3D (u8 *)&val;
7ee85054682299b Arec Kao 2021-08-17  649  	buf_i =3D 2;
7ee85054682299b Arec Kao 2021-08-17  650  	val_i =3D 4 - len;
7ee85054682299b Arec Kao 2021-08-17  651  =

7ee85054682299b Arec Kao 2021-08-17  652  	while (val_i < 4)
7ee85054682299b Arec Kao 2021-08-17  653  		buf[buf_i++] =3D val_p[val_i++];
7ee85054682299b Arec Kao 2021-08-17  654  =

7ee85054682299b Arec Kao 2021-08-17  655  	if (i2c_master_send(client, buf,=
 len + 2) !=3D len + 2)
7ee85054682299b Arec Kao 2021-08-17  656  		return -EIO;
7ee85054682299b Arec Kao 2021-08-17  657  =

7ee85054682299b Arec Kao 2021-08-17  658  	return 0;
7ee85054682299b Arec Kao 2021-08-17  659  }
7ee85054682299b Arec Kao 2021-08-17  660  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7735494554181652689==--

