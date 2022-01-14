Content-Type: multipart/mixed; boundary="===============3249578485357814090=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v7] media: i2c: Add ov08d10 camera sensor driver
Date: Fri, 14 Jan 2022 20:16:48 +0800
Message-ID: <202201142047.YegHpDOf-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3249578485357814090==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220112054255.16383-1-jimmy.su@intel.com>
References: <20220112054255.16383-1-jimmy.su@intel.com>
TO: Jimmy Su <jimmy.su@intel.com>

Hi Jimmy,

I love your patch! Perhaps something to improve:

[auto build test WARNING on media-tree/master]
[also build test WARNING on linus/master v5.16 next-20220114]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Jimmy-Su/media-i2c-Add-ov0=
8d10-camera-sensor-driver/20220112-134454
base:   git://linuxtv.org/media_tree.git master
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: mips-randconfig-m031-20220113 (https://download.01.org/0day-ci/arch=
ive/20220114/202201142047.YegHpDOf-lkp(a)intel.com/config)
compiler: mips64el-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/media/i2c/ov08d10.c:833 ov08d10_set_ctrl_flip() warn: impossible co=
ndition '(val < 0) =3D> (0-255 < 0)'

vim +833 drivers/media/i2c/ov08d10.c

8c1d2ed3b617b8 Jimmy Su 2022-01-12  820  =

8c1d2ed3b617b8 Jimmy Su 2022-01-12  821  static int ov08d10_set_ctrl_flip(s=
truct ov08d10 *ov08d10, u32 ctrl_val)
8c1d2ed3b617b8 Jimmy Su 2022-01-12  822  {
8c1d2ed3b617b8 Jimmy Su 2022-01-12  823  	struct i2c_client *client =3D v4l=
2_get_subdevdata(&ov08d10->sd);
8c1d2ed3b617b8 Jimmy Su 2022-01-12  824  	u8 val;
8c1d2ed3b617b8 Jimmy Su 2022-01-12  825  	int ret;
8c1d2ed3b617b8 Jimmy Su 2022-01-12  826  =

8c1d2ed3b617b8 Jimmy Su 2022-01-12  827  	/* System control registers */
8c1d2ed3b617b8 Jimmy Su 2022-01-12  828  	ret =3D i2c_smbus_write_byte_data=
(client, OV08D10_REG_PAGE, 0x01);
8c1d2ed3b617b8 Jimmy Su 2022-01-12  829  	if (ret < 0)
8c1d2ed3b617b8 Jimmy Su 2022-01-12  830  		return ret;
8c1d2ed3b617b8 Jimmy Su 2022-01-12  831  =

8c1d2ed3b617b8 Jimmy Su 2022-01-12  832  	val =3D i2c_smbus_read_byte_data(=
client, OV08D10_REG_FLIP_OPT);
8c1d2ed3b617b8 Jimmy Su 2022-01-12 @833  	if (val < 0)
8c1d2ed3b617b8 Jimmy Su 2022-01-12  834  		return val;
8c1d2ed3b617b8 Jimmy Su 2022-01-12  835  =

8c1d2ed3b617b8 Jimmy Su 2022-01-12  836  	val =3D val | (ctrl_val & OV08D10=
_REG_FLIP_MASK);
8c1d2ed3b617b8 Jimmy Su 2022-01-12  837  =

8c1d2ed3b617b8 Jimmy Su 2022-01-12  838  	ret =3D i2c_smbus_write_byte_data=
(client, OV08D10_REG_PAGE, 0x01);
8c1d2ed3b617b8 Jimmy Su 2022-01-12  839  	if (ret < 0)
8c1d2ed3b617b8 Jimmy Su 2022-01-12  840  		return ret;
8c1d2ed3b617b8 Jimmy Su 2022-01-12  841  =

8c1d2ed3b617b8 Jimmy Su 2022-01-12  842  	ret =3D i2c_smbus_write_byte_data=
(client, OV08D10_REG_FLIP_OPT, val);
8c1d2ed3b617b8 Jimmy Su 2022-01-12  843  =

8c1d2ed3b617b8 Jimmy Su 2022-01-12  844  	if (ret < 0)
8c1d2ed3b617b8 Jimmy Su 2022-01-12  845  		return ret;
8c1d2ed3b617b8 Jimmy Su 2022-01-12  846  =

8c1d2ed3b617b8 Jimmy Su 2022-01-12  847  	return i2c_smbus_write_byte_data(=
client,
8c1d2ed3b617b8 Jimmy Su 2022-01-12  848  					 OV08D10_REG_GLOBAL_EFFECTIVE=
, 0x01);
8c1d2ed3b617b8 Jimmy Su 2022-01-12  849  }
8c1d2ed3b617b8 Jimmy Su 2022-01-12  850  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============3249578485357814090==--

