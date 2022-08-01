Content-Type: multipart/mixed; boundary="===============4015566731517188250=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] media: i2c: imx334: support lower bandwidth mode
Date: Mon, 01 Aug 2022 12:34:17 +0800
Message-ID: <202208011237.RWmAl1tP-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4015566731517188250==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220728063044.19276-1-shravan.chippa@microchip.com>
References: <20220728063044.19276-1-shravan.chippa@microchip.com>
TO: shravan kumar <shravan.chippa@microchip.com>
TO: paul.j.murphy(a)intel.com
TO: daniele.alessandrelli(a)intel.com
TO: mchehab(a)kernel.org
CC: linux-media(a)vger.kernel.org
CC: linux-kernel(a)vger.kernel.org
CC: Shravan Chippa <shravan.chippa@microchip.com>
CC: Conor Dooley <conor.dooley@microchip.com>
CC: Prakash Battu <Prakash.Battu@microchip.com>

Hi shravan,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on media-tree/master]
[also build test WARNING on linus/master v5.19 next-20220728]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/shravan-kumar/media-=
i2c-imx334-support-lower-bandwidth-mode/20220728-143143
base:   git://linuxtv.org/media_tree.git master
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arc-randconfig-m041-20220731 (https://download.01.org/0day-ci/archi=
ve/20220801/202208011237.RWmAl1tP-lkp(a)intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/media/i2c/imx334.c:735 imx334_enum_frame_size() warn: ignoring unre=
achable code.
drivers/media/i2c/imx334.c:832 imx334_set_pad_format() warn: unsigned 'code=
' is never less than zero.

vim +735 drivers/media/i2c/imx334.c

9746b11715c3949 Martina Krasteva 2021-02-03  717  =

9746b11715c3949 Martina Krasteva 2021-02-03  718  /**
9746b11715c3949 Martina Krasteva 2021-02-03  719   * imx334_enum_frame_size=
() - Enumerate V4L2 sub-device frame sizes
9746b11715c3949 Martina Krasteva 2021-02-03  720   * @sd: pointer to imx334=
 V4L2 sub-device structure
0d346d2a6f54f06 Tomi Valkeinen   2021-06-10  721   * @sd_state: V4L2 sub-de=
vice state
9746b11715c3949 Martina Krasteva 2021-02-03  722   * @fsize: V4L2 sub-devic=
e size enumeration need to be filled
9746b11715c3949 Martina Krasteva 2021-02-03  723   *
9746b11715c3949 Martina Krasteva 2021-02-03  724   * Return: 0 if successfu=
l, error code otherwise.
9746b11715c3949 Martina Krasteva 2021-02-03  725   */
9746b11715c3949 Martina Krasteva 2021-02-03  726  static int imx334_enum_fr=
ame_size(struct v4l2_subdev *sd,
0d346d2a6f54f06 Tomi Valkeinen   2021-06-10  727  				  struct v4l2_subdev_=
state *sd_state,
9746b11715c3949 Martina Krasteva 2021-02-03  728  				  struct v4l2_subdev_=
frame_size_enum *fsize)
9746b11715c3949 Martina Krasteva 2021-02-03  729  {
99a7e6eda2d21df Shravan Chippa   2022-07-28  730  	int i;
99a7e6eda2d21df Shravan Chippa   2022-07-28  731  =

99a7e6eda2d21df Shravan Chippa   2022-07-28  732  	if (fsize->index >=3D AR=
RAY_SIZE(supported_modes))
9746b11715c3949 Martina Krasteva 2021-02-03  733  		return -EINVAL;
9746b11715c3949 Martina Krasteva 2021-02-03  734  =

99a7e6eda2d21df Shravan Chippa   2022-07-28 @735  	for (i =3D 0; i < ARRAY_=
SIZE(codes); i++) {
99a7e6eda2d21df Shravan Chippa   2022-07-28  736  		if (codes[i] =3D=3D fsi=
ze->code)
99a7e6eda2d21df Shravan Chippa   2022-07-28  737  			break;
9746b11715c3949 Martina Krasteva 2021-02-03  738  		return -EINVAL;
99a7e6eda2d21df Shravan Chippa   2022-07-28  739  	}
9746b11715c3949 Martina Krasteva 2021-02-03  740  =

99a7e6eda2d21df Shravan Chippa   2022-07-28  741  	fsize->min_width =3D sup=
ported_modes[fsize->index].width;
9746b11715c3949 Martina Krasteva 2021-02-03  742  	fsize->max_width =3D fsi=
ze->min_width;
99a7e6eda2d21df Shravan Chippa   2022-07-28  743  	fsize->min_height =3D su=
pported_modes[fsize->index].height;
9746b11715c3949 Martina Krasteva 2021-02-03  744  	fsize->max_height =3D fs=
ize->min_height;
9746b11715c3949 Martina Krasteva 2021-02-03  745  =

9746b11715c3949 Martina Krasteva 2021-02-03  746  	return 0;
9746b11715c3949 Martina Krasteva 2021-02-03  747  }
9746b11715c3949 Martina Krasteva 2021-02-03  748  =

9746b11715c3949 Martina Krasteva 2021-02-03  749  /**
9746b11715c3949 Martina Krasteva 2021-02-03  750   * imx334_fill_pad_format=
() - Fill subdevice pad format
9746b11715c3949 Martina Krasteva 2021-02-03  751   *                       =
     from selected sensor mode
9746b11715c3949 Martina Krasteva 2021-02-03  752   * @imx334: pointer to im=
x334 device
9746b11715c3949 Martina Krasteva 2021-02-03  753   * @mode: pointer to imx3=
34_mode sensor mode
9746b11715c3949 Martina Krasteva 2021-02-03  754   * @fmt: V4L2 sub-device =
format need to be filled
9746b11715c3949 Martina Krasteva 2021-02-03  755   */
9746b11715c3949 Martina Krasteva 2021-02-03  756  static void imx334_fill_p=
ad_format(struct imx334 *imx334,
9746b11715c3949 Martina Krasteva 2021-02-03  757  				   const struct imx33=
4_mode *mode,
9746b11715c3949 Martina Krasteva 2021-02-03  758  				   struct v4l2_subdev=
_format *fmt)
9746b11715c3949 Martina Krasteva 2021-02-03  759  {
9746b11715c3949 Martina Krasteva 2021-02-03  760  	fmt->format.width =3D mo=
de->width;
9746b11715c3949 Martina Krasteva 2021-02-03  761  	fmt->format.height =3D m=
ode->height;
99a7e6eda2d21df Shravan Chippa   2022-07-28  762  	fmt->format.code =3D imx=
334->cur_code;
9746b11715c3949 Martina Krasteva 2021-02-03  763  	fmt->format.field =3D V4=
L2_FIELD_NONE;
9746b11715c3949 Martina Krasteva 2021-02-03  764  	fmt->format.colorspace =
=3D V4L2_COLORSPACE_RAW;
9746b11715c3949 Martina Krasteva 2021-02-03  765  	fmt->format.ycbcr_enc =
=3D V4L2_YCBCR_ENC_DEFAULT;
9746b11715c3949 Martina Krasteva 2021-02-03  766  	fmt->format.quantization=
 =3D V4L2_QUANTIZATION_DEFAULT;
9746b11715c3949 Martina Krasteva 2021-02-03  767  	fmt->format.xfer_func =
=3D V4L2_XFER_FUNC_NONE;
9746b11715c3949 Martina Krasteva 2021-02-03  768  }
9746b11715c3949 Martina Krasteva 2021-02-03  769  =

9746b11715c3949 Martina Krasteva 2021-02-03  770  /**
9746b11715c3949 Martina Krasteva 2021-02-03  771   * imx334_get_pad_format(=
) - Get subdevice pad format
9746b11715c3949 Martina Krasteva 2021-02-03  772   * @sd: pointer to imx334=
 V4L2 sub-device structure
0d346d2a6f54f06 Tomi Valkeinen   2021-06-10  773   * @sd_state: V4L2 sub-de=
vice state
9746b11715c3949 Martina Krasteva 2021-02-03  774   * @fmt: V4L2 sub-device =
format need to be set
9746b11715c3949 Martina Krasteva 2021-02-03  775   *
9746b11715c3949 Martina Krasteva 2021-02-03  776   * Return: 0 if successfu=
l, error code otherwise.
9746b11715c3949 Martina Krasteva 2021-02-03  777   */
9746b11715c3949 Martina Krasteva 2021-02-03  778  static int imx334_get_pad=
_format(struct v4l2_subdev *sd,
0d346d2a6f54f06 Tomi Valkeinen   2021-06-10  779  				 struct v4l2_subdev_s=
tate *sd_state,
9746b11715c3949 Martina Krasteva 2021-02-03  780  				 struct v4l2_subdev_f=
ormat *fmt)
9746b11715c3949 Martina Krasteva 2021-02-03  781  {
9746b11715c3949 Martina Krasteva 2021-02-03  782  	struct imx334 *imx334 =
=3D to_imx334(sd);
9746b11715c3949 Martina Krasteva 2021-02-03  783  =

9746b11715c3949 Martina Krasteva 2021-02-03  784  	mutex_lock(&imx334->mute=
x);
9746b11715c3949 Martina Krasteva 2021-02-03  785  =

9746b11715c3949 Martina Krasteva 2021-02-03  786  	if (fmt->which =3D=3D V4=
L2_SUBDEV_FORMAT_TRY) {
9746b11715c3949 Martina Krasteva 2021-02-03  787  		struct v4l2_mbus_framef=
mt *framefmt;
9746b11715c3949 Martina Krasteva 2021-02-03  788  =

0d346d2a6f54f06 Tomi Valkeinen   2021-06-10  789  		framefmt =3D v4l2_subde=
v_get_try_format(sd, sd_state, fmt->pad);
9746b11715c3949 Martina Krasteva 2021-02-03  790  		fmt->format =3D *framef=
mt;
9746b11715c3949 Martina Krasteva 2021-02-03  791  	} else {
9746b11715c3949 Martina Krasteva 2021-02-03  792  		imx334_fill_pad_format(=
imx334, imx334->cur_mode, fmt);
9746b11715c3949 Martina Krasteva 2021-02-03  793  	}
9746b11715c3949 Martina Krasteva 2021-02-03  794  =

9746b11715c3949 Martina Krasteva 2021-02-03  795  	mutex_unlock(&imx334->mu=
tex);
9746b11715c3949 Martina Krasteva 2021-02-03  796  =

9746b11715c3949 Martina Krasteva 2021-02-03  797  	return 0;
9746b11715c3949 Martina Krasteva 2021-02-03  798  }
9746b11715c3949 Martina Krasteva 2021-02-03  799  =

99a7e6eda2d21df Shravan Chippa   2022-07-28  800  static int imx219_get_for=
mat_code(struct imx334 *imx334, struct v4l2_subdev_format *fmt)
99a7e6eda2d21df Shravan Chippa   2022-07-28  801  {
99a7e6eda2d21df Shravan Chippa   2022-07-28  802  	int i;
99a7e6eda2d21df Shravan Chippa   2022-07-28  803  =

99a7e6eda2d21df Shravan Chippa   2022-07-28  804  	for (i =3D 0; i < ARRAY_=
SIZE(codes); i++) {
99a7e6eda2d21df Shravan Chippa   2022-07-28  805  		if (codes[i] =3D=3D fmt=
->format.code)
99a7e6eda2d21df Shravan Chippa   2022-07-28  806  			return codes[i];
99a7e6eda2d21df Shravan Chippa   2022-07-28  807  	}
99a7e6eda2d21df Shravan Chippa   2022-07-28  808  =

99a7e6eda2d21df Shravan Chippa   2022-07-28  809  	return -EINVAL;
99a7e6eda2d21df Shravan Chippa   2022-07-28  810  }
99a7e6eda2d21df Shravan Chippa   2022-07-28  811  =

9746b11715c3949 Martina Krasteva 2021-02-03  812  /**
9746b11715c3949 Martina Krasteva 2021-02-03  813   * imx334_set_pad_format(=
) - Set subdevice pad format
9746b11715c3949 Martina Krasteva 2021-02-03  814   * @sd: pointer to imx334=
 V4L2 sub-device structure
0d346d2a6f54f06 Tomi Valkeinen   2021-06-10  815   * @sd_state: V4L2 sub-de=
vice state
9746b11715c3949 Martina Krasteva 2021-02-03  816   * @fmt: V4L2 sub-device =
format need to be set
9746b11715c3949 Martina Krasteva 2021-02-03  817   *
9746b11715c3949 Martina Krasteva 2021-02-03  818   * Return: 0 if successfu=
l, error code otherwise.
9746b11715c3949 Martina Krasteva 2021-02-03  819   */
9746b11715c3949 Martina Krasteva 2021-02-03  820  static int imx334_set_pad=
_format(struct v4l2_subdev *sd,
0d346d2a6f54f06 Tomi Valkeinen   2021-06-10  821  				 struct v4l2_subdev_s=
tate *sd_state,
9746b11715c3949 Martina Krasteva 2021-02-03  822  				 struct v4l2_subdev_f=
ormat *fmt)
9746b11715c3949 Martina Krasteva 2021-02-03  823  {
9746b11715c3949 Martina Krasteva 2021-02-03  824  	struct imx334 *imx334 =
=3D to_imx334(sd);
9746b11715c3949 Martina Krasteva 2021-02-03  825  	const struct imx334_mode=
 *mode;
9746b11715c3949 Martina Krasteva 2021-02-03  826  	int ret =3D 0;
99a7e6eda2d21df Shravan Chippa   2022-07-28  827  	u32 code;
9746b11715c3949 Martina Krasteva 2021-02-03  828  =

9746b11715c3949 Martina Krasteva 2021-02-03  829  	mutex_lock(&imx334->mute=
x);
9746b11715c3949 Martina Krasteva 2021-02-03  830  =

99a7e6eda2d21df Shravan Chippa   2022-07-28  831  	code =3D imx219_get_form=
at_code(imx334, fmt);
99a7e6eda2d21df Shravan Chippa   2022-07-28 @832  	if (code < 0)
99a7e6eda2d21df Shravan Chippa   2022-07-28  833  		return -EINVAL;
99a7e6eda2d21df Shravan Chippa   2022-07-28  834  =

99a7e6eda2d21df Shravan Chippa   2022-07-28  835  	imx334->cur_code =3D cod=
e;
99a7e6eda2d21df Shravan Chippa   2022-07-28  836  =

99a7e6eda2d21df Shravan Chippa   2022-07-28  837  	mode =3D v4l2_find_neare=
st_size(supported_modes,
99a7e6eda2d21df Shravan Chippa   2022-07-28  838  				      ARRAY_SIZE(supp=
orted_modes),
99a7e6eda2d21df Shravan Chippa   2022-07-28  839  				      width, height,
99a7e6eda2d21df Shravan Chippa   2022-07-28  840  				      fmt->format.wid=
th, fmt->format.height);
99a7e6eda2d21df Shravan Chippa   2022-07-28  841  =

9746b11715c3949 Martina Krasteva 2021-02-03  842  	imx334_fill_pad_format(i=
mx334, mode, fmt);
9746b11715c3949 Martina Krasteva 2021-02-03  843  =

9746b11715c3949 Martina Krasteva 2021-02-03  844  	if (fmt->which =3D=3D V4=
L2_SUBDEV_FORMAT_TRY) {
9746b11715c3949 Martina Krasteva 2021-02-03  845  		struct v4l2_mbus_framef=
mt *framefmt;
9746b11715c3949 Martina Krasteva 2021-02-03  846  =

0d346d2a6f54f06 Tomi Valkeinen   2021-06-10  847  		framefmt =3D v4l2_subde=
v_get_try_format(sd, sd_state, fmt->pad);
9746b11715c3949 Martina Krasteva 2021-02-03  848  		*framefmt =3D fmt->form=
at;
99a7e6eda2d21df Shravan Chippa   2022-07-28  849  	} else if (imx334->cur_m=
ode !=3D mode) {
9746b11715c3949 Martina Krasteva 2021-02-03  850  		ret =3D imx334_update_c=
ontrols(imx334, mode);
9746b11715c3949 Martina Krasteva 2021-02-03  851  		if (!ret)
9746b11715c3949 Martina Krasteva 2021-02-03  852  			imx334->cur_mode =3D m=
ode;
9746b11715c3949 Martina Krasteva 2021-02-03  853  	}
9746b11715c3949 Martina Krasteva 2021-02-03  854  =

9746b11715c3949 Martina Krasteva 2021-02-03  855  	mutex_unlock(&imx334->mu=
tex);
9746b11715c3949 Martina Krasteva 2021-02-03  856  =

9746b11715c3949 Martina Krasteva 2021-02-03  857  	return ret;
9746b11715c3949 Martina Krasteva 2021-02-03  858  }
9746b11715c3949 Martina Krasteva 2021-02-03  859  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4015566731517188250==--

