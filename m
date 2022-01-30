Content-Type: multipart/mixed; boundary="===============7962292990790559366=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v6 10/14] media: Re-structure TI platform drivers
Date: Mon, 31 Jan 2022 06:28:39 +0800
Message-ID: <202201310557.YHxquGd1-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7962292990790559366==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220121142904.4091481-11-p.yadav@ti.com>
References: <20220121142904.4091481-11-p.yadav@ti.com>
TO: Pratyush Yadav <p.yadav@ti.com>

Hi Pratyush,

I love your patch! Perhaps something to improve:

[auto build test WARNING on media-tree/master]
[also build test WARNING on robh/for-next linus/master v5.17-rc1 next-20220=
128]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Pratyush-Yadav/CSI2RX-supp=
ort-on-J721E/20220121-223208
base:   git://linuxtv.org/media_tree.git master
:::::: branch date: 9 days ago
:::::: commit date: 9 days ago
config: riscv-randconfig-c006-20220125 (https://download.01.org/0day-ci/arc=
hive/20220131/202201310557.YHxquGd1-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project f32dcc=
b9a43b02ce4e540d6ba5dbbdb188f2dc7d)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/0day-ci/linux/commit/3e49ebcb767893f74b04baf77=
7762343d75d36b4
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Pratyush-Yadav/CSI2RX-support-on-J=
721E/20220121-223208
        git checkout 3e49ebcb767893f74b04baf777762343d75d36b4
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   drivers/mux/mmio.c:47:2: note: Taking false branch
           if (of_device_is_compatible(np, "mmio-mux"))
           ^
   drivers/mux/mmio.c:50:12: note: '?' condition is true
                   regmap =3D dev_get_regmap(dev->parent, NULL) ?: ERR_PTR(=
-ENODEV);
                            ^
   drivers/mux/mmio.c:51:6: note: Calling 'IS_ERR'
           if (IS_ERR(regmap)) {
               ^~~~~~~~~~~~~~
   include/linux/err.h:36:9: note: Assuming the condition is false
           return IS_ERR_VALUE((unsigned long)ptr);
                  ^
   include/linux/err.h:22:34: note: expanded from macro 'IS_ERR_VALUE'
   #define IS_ERR_VALUE(x) unlikely((unsigned long)(void *)(x) >=3D (unsign=
ed long)-MAX_ERRNO)
                           ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/err.h:36:2: note: Returning zero, which participates in a =
condition later
           return IS_ERR_VALUE((unsigned long)ptr);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mux/mmio.c:51:6: note: Returning from 'IS_ERR'
           if (IS_ERR(regmap)) {
               ^~~~~~~~~~~~~~
   drivers/mux/mmio.c:51:2: note: Taking false branch
           if (IS_ERR(regmap)) {
           ^
   drivers/mux/mmio.c:58:6: note: Assuming 'ret' is not equal to 0
           if (ret =3D=3D 0 || ret % 2)
               ^~~~~~~~
   drivers/mux/mmio.c:58:6: note: Left side of '||' is false
   drivers/mux/mmio.c:58:18: note: Assuming the condition is false
           if (ret =3D=3D 0 || ret % 2)
                           ^~~~~~~
   drivers/mux/mmio.c:58:2: note: Taking false branch
           if (ret =3D=3D 0 || ret % 2)
           ^
   drivers/mux/mmio.c:60:6: note: Assuming 'ret' is >=3D 0
           if (ret < 0) {
               ^~~~~~~
   drivers/mux/mmio.c:60:2: note: Taking false branch
           if (ret < 0) {
           ^
   drivers/mux/mmio.c:69:6: note: Calling 'IS_ERR'
           if (IS_ERR(mux_chip))
               ^~~~~~~~~~~~~~~~
   include/linux/err.h:36:9: note: Assuming the condition is false
           return IS_ERR_VALUE((unsigned long)ptr);
                  ^
   include/linux/err.h:22:34: note: expanded from macro 'IS_ERR_VALUE'
   #define IS_ERR_VALUE(x) unlikely((unsigned long)(void *)(x) >=3D (unsign=
ed long)-MAX_ERRNO)
                           ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/err.h:36:2: note: Returning zero, which participates in a =
condition later
           return IS_ERR_VALUE((unsigned long)ptr);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mux/mmio.c:69:6: note: Returning from 'IS_ERR'
           if (IS_ERR(mux_chip))
               ^~~~~~~~~~~~~~~~
   drivers/mux/mmio.c:69:2: note: Taking false branch
           if (IS_ERR(mux_chip))
           ^
   drivers/mux/mmio.c:74:14: note: Assuming 'i' is < 'num_fields'
           for (i =3D 0; i < num_fields; i++) {
                       ^~~~~~~~~~~~~~
   drivers/mux/mmio.c:74:2: note: Loop condition is true.  Entering loop bo=
dy
           for (i =3D 0; i < num_fields; i++) {
           ^
   drivers/mux/mmio.c:76:3: note: 'field' initialized here
                   struct reg_field field;
                   ^~~~~~~~~~~~~~~~~~~~~~
   drivers/mux/mmio.c:83:7: note: Assuming 'ret' is 0
                   if (!ret)
                       ^~~~
   drivers/mux/mmio.c:83:3: note: Taking true branch
                   if (!ret)
                   ^
   drivers/mux/mmio.c:86:7: note: Assuming 'ret' is >=3D 0
                   if (ret < 0) {
                       ^~~~~~~
   drivers/mux/mmio.c:86:3: note: Taking false branch
                   if (ret < 0) {
                   ^
   drivers/mux/mmio.c:96:7: note: Assuming the condition is false
                   if (mask !=3D GENMASK(field.msb, field.lsb)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mux/mmio.c:96:3: note: Taking false branch
                   if (mask !=3D GENMASK(field.msb, field.lsb)) {
                   ^
   drivers/mux/mmio.c:102:15: note: Passed-by-value struct argument contain=
s uninitialized data (e.g., field: 'id_size')
                   fields[i] =3D devm_regmap_field_alloc(dev, regmap, field=
);
                               ^                                    ~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
>> drivers/media/platform/ti/cal/cal-video.c:213:2: warning: Value stored t=
o 'ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D 0;
           ^     ~
   drivers/media/platform/ti/cal/cal-video.c:213:2: note: Value stored to '=
ret' is never read
           ret =3D 0;
           ^     ~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/media/platform/ti/vpe/vpe.c:2589:2: warning: Value stored to 'fu=
nc' is never read [clang-analyzer-deadcode.DeadStores]
           func =3D read_field_reg(dev, VPE_PID, VPE_PID_FUNC_MASK,
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/ti/vpe/vpe.c:2589:2: note: Value stored to 'func'=
 is never read
           func =3D read_field_reg(dev, VPE_PID, VPE_PID_FUNC_MASK,
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/log2.h:57:13: warning: The result of the left shift is und=
efined due to shifting by '32', which is greater or equal to the width of t=
ype 'unsigned long' [clang-analyzer-core.UndefinedBinaryOperatorResult]
           return 1UL << fls_long(n - 1);
                      ^
   drivers/media/platform/ti/vpe/vpe.c:1788:8: note: Calling 'vpe_try_fmt'
           ret =3D vpe_try_fmt(file, priv, f);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/ti/vpe/vpe.c:1725:6: note: Assuming field 'type' =
is not equal to V4L2_BUF_TYPE_VIDEO_OUTPUT
           if (V4L2_TYPE_IS_OUTPUT(f->type))
               ^
   include/uapi/linux/videodev2.h:165:3: note: expanded from macro 'V4L2_TY=
PE_IS_OUTPUT'
           ((type) =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT                   \
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/ti/vpe/vpe.c:1725:6: note: Left side of '||' is f=
alse
           if (V4L2_TYPE_IS_OUTPUT(f->type))
               ^
   include/uapi/linux/videodev2.h:165:3: note: expanded from macro 'V4L2_TY=
PE_IS_OUTPUT'
           ((type) =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT                   \
            ^
   drivers/media/platform/ti/vpe/vpe.c:1725:6: note: Assuming field 'type' =
is not equal to V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE
           if (V4L2_TYPE_IS_OUTPUT(f->type))
               ^
   include/uapi/linux/videodev2.h:166:6: note: expanded from macro 'V4L2_TY=
PE_IS_OUTPUT'
            || (type) =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE         \
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/ti/vpe/vpe.c:1725:6: note: Left side of '||' is f=
alse
           if (V4L2_TYPE_IS_OUTPUT(f->type))
               ^
   include/uapi/linux/videodev2.h:165:3: note: expanded from macro 'V4L2_TY=
PE_IS_OUTPUT'
           ((type) =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT                   \
            ^
   drivers/media/platform/ti/vpe/vpe.c:1725:6: note: Assuming field 'type' =
is not equal to V4L2_BUF_TYPE_VIDEO_OVERLAY
           if (V4L2_TYPE_IS_OUTPUT(f->type))
               ^
   include/uapi/linux/videodev2.h:167:6: note: expanded from macro 'V4L2_TY=
PE_IS_OUTPUT'
            || (type) =3D=3D V4L2_BUF_TYPE_VIDEO_OVERLAY               \
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/ti/vpe/vpe.c:1725:6: note: Left side of '||' is f=
alse
           if (V4L2_TYPE_IS_OUTPUT(f->type))
               ^
   include/uapi/linux/videodev2.h:165:3: note: expanded from macro 'V4L2_TY=
PE_IS_OUTPUT'
           ((type) =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT                   \
            ^
   drivers/media/platform/ti/vpe/vpe.c:1725:6: note: Assuming field 'type' =
is not equal to V4L2_BUF_TYPE_VIDEO_OUTPUT_OVERLAY
           if (V4L2_TYPE_IS_OUTPUT(f->type))
               ^
   include/uapi/linux/videodev2.h:168:6: note: expanded from macro 'V4L2_TY=
PE_IS_OUTPUT'
            || (type) =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT_OVERLAY        \
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/ti/vpe/vpe.c:1725:6: note: Left side of '||' is f=
alse
           if (V4L2_TYPE_IS_OUTPUT(f->type))
               ^
   include/uapi/linux/videodev2.h:165:3: note: expanded from macro 'V4L2_TY=
PE_IS_OUTPUT'
           ((type) =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT                   \
            ^
   drivers/media/platform/ti/vpe/vpe.c:1725:6: note: Assuming field 'type' =
is not equal to V4L2_BUF_TYPE_VBI_OUTPUT
           if (V4L2_TYPE_IS_OUTPUT(f->type))
               ^
   include/uapi/linux/videodev2.h:169:6: note: expanded from macro 'V4L2_TY=
PE_IS_OUTPUT'
            || (type) =3D=3D V4L2_BUF_TYPE_VBI_OUTPUT                  \
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/ti/vpe/vpe.c:1725:6: note: Left side of '||' is f=
alse
           if (V4L2_TYPE_IS_OUTPUT(f->type))
               ^
   include/uapi/linux/videodev2.h:165:3: note: expanded from macro 'V4L2_TY=
PE_IS_OUTPUT'
           ((type) =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT                   \
            ^
   drivers/media/platform/ti/vpe/vpe.c:1725:6: note: Assuming field 'type' =
is not equal to V4L2_BUF_TYPE_SLICED_VBI_OUTPUT
           if (V4L2_TYPE_IS_OUTPUT(f->type))
               ^
   include/uapi/linux/videodev2.h:170:6: note: expanded from macro 'V4L2_TY=
PE_IS_OUTPUT'
            || (type) =3D=3D V4L2_BUF_TYPE_SLICED_VBI_OUTPUT           \
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/ti/vpe/vpe.c:1725:6: note: Left side of '||' is f=
alse
           if (V4L2_TYPE_IS_OUTPUT(f->type))
               ^
   include/uapi/linux/videodev2.h:165:3: note: expanded from macro 'V4L2_TY=
PE_IS_OUTPUT'
           ((type) =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT                   \
            ^
   drivers/media/platform/ti/vpe/vpe.c:1725:6: note: Assuming field 'type' =
is not equal to V4L2_BUF_TYPE_SDR_OUTPUT
           if (V4L2_TYPE_IS_OUTPUT(f->type))
               ^
   include/uapi/linux/videodev2.h:171:6: note: expanded from macro 'V4L2_TY=
PE_IS_OUTPUT'
            || (type) =3D=3D V4L2_BUF_TYPE_SDR_OUTPUT                  \
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/ti/vpe/vpe.c:1725:6: note: Left side of '||' is f=
alse
           if (V4L2_TYPE_IS_OUTPUT(f->type))

vim +/ret +213 drivers/media/platform/ti/cal/cal-video.c

9d551891473e35 drivers/media/platform/ti-vpe/cal-video.c Laurent Pinchart 2=
020-07-06  191  =

e6a800d63a1239 drivers/media/platform/ti-vpe/cal-video.c Tomi Valkeinen   2=
021-06-14  192  static int cal_legacy_try_fmt_vid_cap(struct file *file, vo=
id *priv,
9d551891473e35 drivers/media/platform/ti-vpe/cal-video.c Laurent Pinchart 2=
020-07-06  193  				      struct v4l2_format *f)
9d551891473e35 drivers/media/platform/ti-vpe/cal-video.c Laurent Pinchart 2=
020-07-06  194  {
9d551891473e35 drivers/media/platform/ti-vpe/cal-video.c Laurent Pinchart 2=
020-07-06  195  	struct cal_ctx *ctx =3D video_drvdata(file);
51e8c97df58fcf drivers/media/platform/ti-vpe/cal-video.c Laurent Pinchart 2=
020-12-07  196  	const struct cal_format_info *fmtinfo;
9d551891473e35 drivers/media/platform/ti-vpe/cal-video.c Laurent Pinchart 2=
020-07-06  197  	struct v4l2_subdev_frame_size_enum fse;
9d551891473e35 drivers/media/platform/ti-vpe/cal-video.c Laurent Pinchart 2=
020-07-06  198  	int ret, found;
9d551891473e35 drivers/media/platform/ti-vpe/cal-video.c Laurent Pinchart 2=
020-07-06  199  =

51e8c97df58fcf drivers/media/platform/ti-vpe/cal-video.c Laurent Pinchart 2=
020-12-07  200  	fmtinfo =3D find_format_by_pix(ctx, f->fmt.pix.pixelformat=
);
51e8c97df58fcf drivers/media/platform/ti-vpe/cal-video.c Laurent Pinchart 2=
020-12-07  201  	if (!fmtinfo) {
9d551891473e35 drivers/media/platform/ti-vpe/cal-video.c Laurent Pinchart 2=
020-07-06  202  		ctx_dbg(3, ctx, "Fourcc format (0x%08x) not found.\n",
9d551891473e35 drivers/media/platform/ti-vpe/cal-video.c Laurent Pinchart 2=
020-07-06  203  			f->fmt.pix.pixelformat);
9d551891473e35 drivers/media/platform/ti-vpe/cal-video.c Laurent Pinchart 2=
020-07-06  204  =

9d551891473e35 drivers/media/platform/ti-vpe/cal-video.c Laurent Pinchart 2=
020-07-06  205  		/* Just get the first one enumerated */
51e8c97df58fcf drivers/media/platform/ti-vpe/cal-video.c Laurent Pinchart 2=
020-12-07  206  		fmtinfo =3D ctx->active_fmt[0];
51e8c97df58fcf drivers/media/platform/ti-vpe/cal-video.c Laurent Pinchart 2=
020-12-07  207  		f->fmt.pix.pixelformat =3D fmtinfo->fourcc;
9d551891473e35 drivers/media/platform/ti-vpe/cal-video.c Laurent Pinchart 2=
020-07-06  208  	}
9d551891473e35 drivers/media/platform/ti-vpe/cal-video.c Laurent Pinchart 2=
020-07-06  209  =

9d551891473e35 drivers/media/platform/ti-vpe/cal-video.c Laurent Pinchart 2=
020-07-06  210  	f->fmt.pix.field =3D ctx->v_fmt.fmt.pix.field;
9d551891473e35 drivers/media/platform/ti-vpe/cal-video.c Laurent Pinchart 2=
020-07-06  211  =

9d551891473e35 drivers/media/platform/ti-vpe/cal-video.c Laurent Pinchart 2=
020-07-06  212  	/* check for/find a valid width/height */
9d551891473e35 drivers/media/platform/ti-vpe/cal-video.c Laurent Pinchart 2=
020-07-06 @213  	ret =3D 0;
9d551891473e35 drivers/media/platform/ti-vpe/cal-video.c Laurent Pinchart 2=
020-07-06  214  	found =3D false;
9d551891473e35 drivers/media/platform/ti-vpe/cal-video.c Laurent Pinchart 2=
020-07-06  215  	fse.pad =3D 0;
51e8c97df58fcf drivers/media/platform/ti-vpe/cal-video.c Laurent Pinchart 2=
020-12-07  216  	fse.code =3D fmtinfo->code;
9d551891473e35 drivers/media/platform/ti-vpe/cal-video.c Laurent Pinchart 2=
020-07-06  217  	fse.which =3D V4L2_SUBDEV_FORMAT_ACTIVE;
9d551891473e35 drivers/media/platform/ti-vpe/cal-video.c Laurent Pinchart 2=
020-07-06  218  	for (fse.index =3D 0; ; fse.index++) {
27f86b9bff79e1 drivers/media/platform/ti-vpe/cal-video.c Tomi Valkeinen   2=
021-06-14  219  		ret =3D v4l2_subdev_call(ctx->phy->source, pad, enum_fram=
e_size,
9d551891473e35 drivers/media/platform/ti-vpe/cal-video.c Laurent Pinchart 2=
020-07-06  220  				       NULL, &fse);
9d551891473e35 drivers/media/platform/ti-vpe/cal-video.c Laurent Pinchart 2=
020-07-06  221  		if (ret)
9d551891473e35 drivers/media/platform/ti-vpe/cal-video.c Laurent Pinchart 2=
020-07-06  222  			break;
9d551891473e35 drivers/media/platform/ti-vpe/cal-video.c Laurent Pinchart 2=
020-07-06  223  =

9d551891473e35 drivers/media/platform/ti-vpe/cal-video.c Laurent Pinchart 2=
020-07-06  224  		if ((f->fmt.pix.width =3D=3D fse.max_width) &&
9d551891473e35 drivers/media/platform/ti-vpe/cal-video.c Laurent Pinchart 2=
020-07-06  225  		    (f->fmt.pix.height =3D=3D fse.max_height)) {
9d551891473e35 drivers/media/platform/ti-vpe/cal-video.c Laurent Pinchart 2=
020-07-06  226  			found =3D true;
9d551891473e35 drivers/media/platform/ti-vpe/cal-video.c Laurent Pinchart 2=
020-07-06  227  			break;
9d551891473e35 drivers/media/platform/ti-vpe/cal-video.c Laurent Pinchart 2=
020-07-06  228  		} else if ((f->fmt.pix.width >=3D fse.min_width) &&
9d551891473e35 drivers/media/platform/ti-vpe/cal-video.c Laurent Pinchart 2=
020-07-06  229  			 (f->fmt.pix.width <=3D fse.max_width) &&
9d551891473e35 drivers/media/platform/ti-vpe/cal-video.c Laurent Pinchart 2=
020-07-06  230  			 (f->fmt.pix.height >=3D fse.min_height) &&
9d551891473e35 drivers/media/platform/ti-vpe/cal-video.c Laurent Pinchart 2=
020-07-06  231  			 (f->fmt.pix.height <=3D fse.max_height)) {
9d551891473e35 drivers/media/platform/ti-vpe/cal-video.c Laurent Pinchart 2=
020-07-06  232  			found =3D true;
9d551891473e35 drivers/media/platform/ti-vpe/cal-video.c Laurent Pinchart 2=
020-07-06  233  			break;
9d551891473e35 drivers/media/platform/ti-vpe/cal-video.c Laurent Pinchart 2=
020-07-06  234  		}
9d551891473e35 drivers/media/platform/ti-vpe/cal-video.c Laurent Pinchart 2=
020-07-06  235  	}
9d551891473e35 drivers/media/platform/ti-vpe/cal-video.c Laurent Pinchart 2=
020-07-06  236  =

9d551891473e35 drivers/media/platform/ti-vpe/cal-video.c Laurent Pinchart 2=
020-07-06  237  	if (!found) {
9d551891473e35 drivers/media/platform/ti-vpe/cal-video.c Laurent Pinchart 2=
020-07-06  238  		/* use existing values as default */
9d551891473e35 drivers/media/platform/ti-vpe/cal-video.c Laurent Pinchart 2=
020-07-06  239  		f->fmt.pix.width =3D ctx->v_fmt.fmt.pix.width;
9d551891473e35 drivers/media/platform/ti-vpe/cal-video.c Laurent Pinchart 2=
020-07-06  240  		f->fmt.pix.height =3D  ctx->v_fmt.fmt.pix.height;
9d551891473e35 drivers/media/platform/ti-vpe/cal-video.c Laurent Pinchart 2=
020-07-06  241  	}
9d551891473e35 drivers/media/platform/ti-vpe/cal-video.c Laurent Pinchart 2=
020-07-06  242  =

9d551891473e35 drivers/media/platform/ti-vpe/cal-video.c Laurent Pinchart 2=
020-07-06  243  	/*
9d551891473e35 drivers/media/platform/ti-vpe/cal-video.c Laurent Pinchart 2=
020-07-06  244  	 * Use current colorspace for now, it will get
9d551891473e35 drivers/media/platform/ti-vpe/cal-video.c Laurent Pinchart 2=
020-07-06  245  	 * updated properly during s_fmt
9d551891473e35 drivers/media/platform/ti-vpe/cal-video.c Laurent Pinchart 2=
020-07-06  246  	 */
9d551891473e35 drivers/media/platform/ti-vpe/cal-video.c Laurent Pinchart 2=
020-07-06  247  	f->fmt.pix.colorspace =3D ctx->v_fmt.fmt.pix.colorspace;
455466400c4164 drivers/media/platform/ti-vpe/cal-video.c Laurent Pinchart 2=
020-12-07  248  	cal_calc_format_size(ctx, fmtinfo, f);
455466400c4164 drivers/media/platform/ti-vpe/cal-video.c Laurent Pinchart 2=
020-12-07  249  	return 0;
9d551891473e35 drivers/media/platform/ti-vpe/cal-video.c Laurent Pinchart 2=
020-07-06  250  }
9d551891473e35 drivers/media/platform/ti-vpe/cal-video.c Laurent Pinchart 2=
020-07-06  251  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7962292990790559366==--

