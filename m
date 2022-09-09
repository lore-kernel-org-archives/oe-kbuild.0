Content-Type: multipart/mixed; boundary="===============7798415084783046108=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/iio/adc/aspeed_adc.c:180:13: warning: use of uninitialized value '<unknown>' [CWE-457]
Date: Sat, 10 Sep 2022 06:44:25 +0800
Message-ID: <202209100602.3VbNh2UB-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7798415084783046108==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: drivers/i=
io/adc/aspeed_adc.c:180:13: warning: use of uninitialized value '<unknown>'=
 [CWE-457] [-Wanalyzer-use-of-uninitialized-value]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Billy Tsai <billy_tsai@aspeedtech.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   e35be05d748a1b82c0bd3f62dafbad859a3bd027
commit: d0a4c17b40736b368f1f26602ad162e24b4108e7 iio: adc: aspeed: Get and =
set trimming data.
date:   11 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 11 months ago
config: arm-randconfig-c002-20220906 (https://download.01.org/0day-ci/archi=
ve/20220910/202209100602.3VbNh2UB-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dd0a4c17b40736b368f1f26602ad162e24b4108e7
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout d0a4c17b40736b368f1f26602ad162e24b4108e7
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc_analyzer warnings: (new ones prefixed by >>)
   drivers/iio/adc/aspeed_adc.c: In function 'aspeed_adc_set_trim_data':
>> drivers/iio/adc/aspeed_adc.c:180:13: warning: use of uninitialized value=
 '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     180 |         u32 scu_otp, trimming_val;
         |             ^~~~~~~
     'aspeed_adc_set_trim_data': event 1
       |
       |  180 |         u32 scu_otp, trimming_val;
       |      |             ^~~~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
       |

vim +180 drivers/iio/adc/aspeed_adc.c

df05f384a7e387 Billy Tsai 2021-09-22  175  =

d0a4c17b40736b Billy Tsai 2021-09-22  176  static int aspeed_adc_set_trim_d=
ata(struct iio_dev *indio_dev)
d0a4c17b40736b Billy Tsai 2021-09-22  177  {
d0a4c17b40736b Billy Tsai 2021-09-22  178  	struct device_node *syscon;
d0a4c17b40736b Billy Tsai 2021-09-22  179  	struct regmap *scu;
d0a4c17b40736b Billy Tsai 2021-09-22 @180  	u32 scu_otp, trimming_val;
d0a4c17b40736b Billy Tsai 2021-09-22  181  	struct aspeed_adc_data *data =
=3D iio_priv(indio_dev);
d0a4c17b40736b Billy Tsai 2021-09-22  182  =

d0a4c17b40736b Billy Tsai 2021-09-22  183  	syscon =3D of_find_node_by_name=
(NULL, "syscon");
d0a4c17b40736b Billy Tsai 2021-09-22  184  	if (syscon =3D=3D NULL) {
d0a4c17b40736b Billy Tsai 2021-09-22  185  		dev_warn(data->dev, "Couldn't =
find syscon node\n");
d0a4c17b40736b Billy Tsai 2021-09-22  186  		return -EOPNOTSUPP;
d0a4c17b40736b Billy Tsai 2021-09-22  187  	}
d0a4c17b40736b Billy Tsai 2021-09-22  188  	scu =3D syscon_node_to_regmap(s=
yscon);
d0a4c17b40736b Billy Tsai 2021-09-22  189  	if (IS_ERR(scu)) {
d0a4c17b40736b Billy Tsai 2021-09-22  190  		dev_warn(data->dev, "Failed to=
 get syscon regmap\n");
d0a4c17b40736b Billy Tsai 2021-09-22  191  		return -EOPNOTSUPP;
d0a4c17b40736b Billy Tsai 2021-09-22  192  	}
d0a4c17b40736b Billy Tsai 2021-09-22  193  	if (data->model_data->trim_loca=
te) {
d0a4c17b40736b Billy Tsai 2021-09-22  194  		if (regmap_read(scu, data->mod=
el_data->trim_locate->offset,
d0a4c17b40736b Billy Tsai 2021-09-22  195  				&scu_otp)) {
d0a4c17b40736b Billy Tsai 2021-09-22  196  			dev_warn(data->dev,
d0a4c17b40736b Billy Tsai 2021-09-22  197  				 "Failed to get adc trimming=
 data\n");
d0a4c17b40736b Billy Tsai 2021-09-22  198  			trimming_val =3D 0x8;
d0a4c17b40736b Billy Tsai 2021-09-22  199  		} else {
d0a4c17b40736b Billy Tsai 2021-09-22  200  			trimming_val =3D
d0a4c17b40736b Billy Tsai 2021-09-22  201  				((scu_otp) &
d0a4c17b40736b Billy Tsai 2021-09-22  202  				 (data->model_data->trim_loc=
ate->field)) >>
d0a4c17b40736b Billy Tsai 2021-09-22  203  				__ffs(data->model_data->trim=
_locate->field);
d0a4c17b40736b Billy Tsai 2021-09-22  204  		}
d0a4c17b40736b Billy Tsai 2021-09-22  205  		dev_dbg(data->dev,
d0a4c17b40736b Billy Tsai 2021-09-22  206  			"trimming val =3D %d, offset =
=3D %08x, fields =3D %08x\n",
d0a4c17b40736b Billy Tsai 2021-09-22  207  			trimming_val, data->model_dat=
a->trim_locate->offset,
d0a4c17b40736b Billy Tsai 2021-09-22  208  			data->model_data->trim_locate=
->field);
d0a4c17b40736b Billy Tsai 2021-09-22  209  		writel(trimming_val, data->bas=
e + ASPEED_REG_COMPENSATION_TRIM);
d0a4c17b40736b Billy Tsai 2021-09-22  210  	}
d0a4c17b40736b Billy Tsai 2021-09-22  211  	return 0;
d0a4c17b40736b Billy Tsai 2021-09-22  212  }
d0a4c17b40736b Billy Tsai 2021-09-22  213  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7798415084783046108==--

