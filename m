Content-Type: multipart/mixed; boundary="===============6349832766829134805=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3 06/15] media: i2c: Add ov7251_pll_configure()
Date: Thu, 05 May 2022 20:29:21 +0800
Message-ID: <202205052030.TLrDYuNF-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6349832766829134805==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220504223027.3480287-7-djrscally@gmail.com>
References: <20220504223027.3480287-7-djrscally@gmail.com>
TO: Daniel Scally <djrscally@gmail.com>
TO: linux-media(a)vger.kernel.org
CC: yong.zhi(a)intel.com
CC: sakari.ailus(a)linux.intel.com
CC: bingbu.cao(a)intel.com
CC: tian.shu.qiu(a)intel.com
CC: andriy.shevchenko(a)linux.intel.com
CC: hverkuil-cisco(a)xs4all.nl

Hi Daniel,

I love your patch! Perhaps something to improve:

[auto build test WARNING on media-tree/master]
[also build test WARNING on v5.18-rc5 next-20220504]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Scally/Suppor=
t-OVTI7251-on-Microsoft-Surface-line/20220505-063608
base:   git://linuxtv.org/media_tree.git master
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: i386-randconfig-c001 (https://download.01.org/0day-ci/archive/20220=
505/202205052030.TLrDYuNF-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/media/i2c/ov7251.c:1241:3-9: preceding lock on line 1236

vim +1241 drivers/media/i2c/ov7251.c

d30bb512da3d8e Todor Tomov   2018-04-25  1230  =

d30bb512da3d8e Todor Tomov   2018-04-25  1231  static int ov7251_s_stream(s=
truct v4l2_subdev *subdev, int enable)
d30bb512da3d8e Todor Tomov   2018-04-25  1232  {
d30bb512da3d8e Todor Tomov   2018-04-25  1233  	struct ov7251 *ov7251 =3D t=
o_ov7251(subdev);
d30bb512da3d8e Todor Tomov   2018-04-25  1234  	int ret;
d30bb512da3d8e Todor Tomov   2018-04-25  1235  =

d30bb512da3d8e Todor Tomov   2018-04-25 @1236  	mutex_lock(&ov7251->lock);
d30bb512da3d8e Todor Tomov   2018-04-25  1237  =

d30bb512da3d8e Todor Tomov   2018-04-25  1238  	if (enable) {
575c4ea63dc4cb Daniel Scally 2022-05-04  1239  		ret =3D ov7251_pll_configu=
re(ov7251);
575c4ea63dc4cb Daniel Scally 2022-05-04  1240  		if (ret)
575c4ea63dc4cb Daniel Scally 2022-05-04 @1241  			return dev_err_probe(ov72=
51->dev, ret,
575c4ea63dc4cb Daniel Scally 2022-05-04  1242  					     "error configuring=
 PLLs\n");
575c4ea63dc4cb Daniel Scally 2022-05-04  1243  =

d30bb512da3d8e Todor Tomov   2018-04-25  1244  		ret =3D ov7251_set_registe=
r_array(ov7251,
d30bb512da3d8e Todor Tomov   2018-04-25  1245  					ov7251->current_mode->d=
ata,
d30bb512da3d8e Todor Tomov   2018-04-25  1246  					ov7251->current_mode->d=
ata_size);
d30bb512da3d8e Todor Tomov   2018-04-25  1247  		if (ret < 0) {
d30bb512da3d8e Todor Tomov   2018-04-25  1248  			dev_err(ov7251->dev, "cou=
ld not set mode %dx%d\n",
d30bb512da3d8e Todor Tomov   2018-04-25  1249  				ov7251->current_mode->wi=
dth,
d30bb512da3d8e Todor Tomov   2018-04-25  1250  				ov7251->current_mode->he=
ight);
d30bb512da3d8e Todor Tomov   2018-04-25  1251  			goto exit;
d30bb512da3d8e Todor Tomov   2018-04-25  1252  		}
d30bb512da3d8e Todor Tomov   2018-04-25  1253  		ret =3D __v4l2_ctrl_handle=
r_setup(&ov7251->ctrls);
d30bb512da3d8e Todor Tomov   2018-04-25  1254  		if (ret < 0) {
d30bb512da3d8e Todor Tomov   2018-04-25  1255  			dev_err(ov7251->dev, "cou=
ld not sync v4l2 controls\n");
d30bb512da3d8e Todor Tomov   2018-04-25  1256  			goto exit;
d30bb512da3d8e Todor Tomov   2018-04-25  1257  		}
d30bb512da3d8e Todor Tomov   2018-04-25  1258  		ret =3D ov7251_write_reg(o=
v7251, OV7251_SC_MODE_SELECT,
d30bb512da3d8e Todor Tomov   2018-04-25  1259  				       OV7251_SC_MODE_SE=
LECT_STREAMING);
d30bb512da3d8e Todor Tomov   2018-04-25  1260  	} else {
d30bb512da3d8e Todor Tomov   2018-04-25  1261  		ret =3D ov7251_write_reg(o=
v7251, OV7251_SC_MODE_SELECT,
d30bb512da3d8e Todor Tomov   2018-04-25  1262  				       OV7251_SC_MODE_SE=
LECT_SW_STANDBY);
d30bb512da3d8e Todor Tomov   2018-04-25  1263  	}
d30bb512da3d8e Todor Tomov   2018-04-25  1264  =

d30bb512da3d8e Todor Tomov   2018-04-25  1265  exit:
d30bb512da3d8e Todor Tomov   2018-04-25  1266  	mutex_unlock(&ov7251->lock);
d30bb512da3d8e Todor Tomov   2018-04-25  1267  =

d30bb512da3d8e Todor Tomov   2018-04-25  1268  	return ret;
d30bb512da3d8e Todor Tomov   2018-04-25  1269  }
d30bb512da3d8e Todor Tomov   2018-04-25  1270  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6349832766829134805==--

