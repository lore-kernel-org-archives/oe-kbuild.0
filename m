Content-Type: multipart/mixed; boundary="===============7812053128406016508=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/fpga/intel-m10-bmc-sec-update.c:103 flash_count_show() warn: possible memory leak of 'flash_buf'
Date: Fri, 16 Sep 2022 18:54:50 +0800
Message-ID: <202209161807.tkd9EO6v-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7812053128406016508==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Russ Weight <russell.h.weight@intel.com>
CC: Xu Yilun <yilun.xu@intel.com>
CC: Tom Rix <trix@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   3245cb65fd91cd514801bf91f5a3066d562f0ac4
commit: 154afa5c31cd2de5e6c2c4f35eee390993ee345a fpga: m10bmc-sec: expose m=
ax10 flash update count
date:   3 months ago
:::::: branch date: 2 days ago
:::::: commit date: 3 months ago
config: m68k-randconfig-m031-20220914 (https://download.01.org/0day-ci/arch=
ive/20220916/202209161807.tkd9EO6v-lkp(a)intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/fpga/intel-m10-bmc-sec-update.c:103 flash_count_show() warn: possib=
le memory leak of 'flash_buf'

vim +/flash_buf +103 drivers/fpga/intel-m10-bmc-sec-update.c

154afa5c31cd2d Russ Weight 2022-06-06   82  =

154afa5c31cd2d Russ Weight 2022-06-06   83  static ssize_t flash_count_show=
(struct device *dev,
154afa5c31cd2d Russ Weight 2022-06-06   84  				struct device_attribute *at=
tr, char *buf)
154afa5c31cd2d Russ Weight 2022-06-06   85  {
154afa5c31cd2d Russ Weight 2022-06-06   86  	struct m10bmc_sec *sec =3D dev=
_get_drvdata(dev);
154afa5c31cd2d Russ Weight 2022-06-06   87  	unsigned int stride, num_bits;
154afa5c31cd2d Russ Weight 2022-06-06   88  	u8 *flash_buf;
154afa5c31cd2d Russ Weight 2022-06-06   89  	int cnt, ret;
154afa5c31cd2d Russ Weight 2022-06-06   90  =

154afa5c31cd2d Russ Weight 2022-06-06   91  	stride =3D regmap_get_reg_stri=
de(sec->m10bmc->regmap);
154afa5c31cd2d Russ Weight 2022-06-06   92  	num_bits =3D FLASH_COUNT_SIZE =
* 8;
154afa5c31cd2d Russ Weight 2022-06-06   93  =

154afa5c31cd2d Russ Weight 2022-06-06   94  	flash_buf =3D kmalloc(FLASH_CO=
UNT_SIZE, GFP_KERNEL);
154afa5c31cd2d Russ Weight 2022-06-06   95  	if (!flash_buf)
154afa5c31cd2d Russ Weight 2022-06-06   96  		return -ENOMEM;
154afa5c31cd2d Russ Weight 2022-06-06   97  =

154afa5c31cd2d Russ Weight 2022-06-06   98  	if (FLASH_COUNT_SIZE % stride)=
 {
154afa5c31cd2d Russ Weight 2022-06-06   99  		dev_err(sec->dev,
154afa5c31cd2d Russ Weight 2022-06-06  100  			"FLASH_COUNT_SIZE (0x%x) not=
 aligned to stride (0x%x)\n",
154afa5c31cd2d Russ Weight 2022-06-06  101  			FLASH_COUNT_SIZE, stride);
154afa5c31cd2d Russ Weight 2022-06-06  102  		WARN_ON_ONCE(1);
154afa5c31cd2d Russ Weight 2022-06-06 @103  		return -EINVAL;
154afa5c31cd2d Russ Weight 2022-06-06  104  	}
154afa5c31cd2d Russ Weight 2022-06-06  105  =

154afa5c31cd2d Russ Weight 2022-06-06  106  	ret =3D regmap_bulk_read(sec->=
m10bmc->regmap, STAGING_FLASH_COUNT,
154afa5c31cd2d Russ Weight 2022-06-06  107  			       flash_buf, FLASH_COUN=
T_SIZE / stride);
154afa5c31cd2d Russ Weight 2022-06-06  108  	if (ret) {
154afa5c31cd2d Russ Weight 2022-06-06  109  		dev_err(sec->dev,
154afa5c31cd2d Russ Weight 2022-06-06  110  			"failed to read flash count:=
 %x cnt %x: %d\n",
154afa5c31cd2d Russ Weight 2022-06-06  111  			STAGING_FLASH_COUNT, FLASH_C=
OUNT_SIZE / stride, ret);
154afa5c31cd2d Russ Weight 2022-06-06  112  		goto exit_free;
154afa5c31cd2d Russ Weight 2022-06-06  113  	}
154afa5c31cd2d Russ Weight 2022-06-06  114  	cnt =3D num_bits - bitmap_weig=
ht((unsigned long *)flash_buf, num_bits);
154afa5c31cd2d Russ Weight 2022-06-06  115  =

154afa5c31cd2d Russ Weight 2022-06-06  116  exit_free:
154afa5c31cd2d Russ Weight 2022-06-06  117  	kfree(flash_buf);
154afa5c31cd2d Russ Weight 2022-06-06  118  =

154afa5c31cd2d Russ Weight 2022-06-06  119  	return ret ? : sysfs_emit(buf,=
 "%u\n", cnt);
154afa5c31cd2d Russ Weight 2022-06-06  120  }
154afa5c31cd2d Russ Weight 2022-06-06  121  static DEVICE_ATTR_RO(flash_cou=
nt);
154afa5c31cd2d Russ Weight 2022-06-06  122  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7812053128406016508==--

