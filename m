Content-Type: multipart/mixed; boundary="===============1902449660285388141=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/media/platform/chips-media/coda-common.c:1719:14: warning: dereference of NULL '0' [CWE-476]
Date: Fri, 17 Jun 2022 00:31:48 +0800
Message-ID: <202206170042.22gvrBm0-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1902449660285388141==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: drivers/m=
edia/platform/chips-media/coda-common.c:1719:14: warning: dereference of NU=
LL '0' [CWE-476] [-Wanalyzer-null-dereference]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   30306f6194cadcc29c77f6ddcd416a75bf5c0232
commit: 64441979bda6c2d17fa40c022f7debec6c328793 media: platform: rename co=
da/ to chips-media/
date:   3 months ago
:::::: branch date: 19 hours ago
:::::: commit date: 3 months ago
config: arm-randconfig-c002-20220615 (https://download.01.org/0day-ci/archi=
ve/20220617/202206170042.22gvrBm0-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D64441979bda6c2d17fa40c022f7debec6c328793
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 64441979bda6c2d17fa40c022f7debec6c328793
        # save the config file
         ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


gcc-analyzer warnings: (new ones prefixed by >>)
   In file included from include/linux/kernel.h:26,
                    from include/linux/clk.h:13,
                    from drivers/media/platform/chips-media/coda-common.c:1=
0:
   drivers/media/platform/chips-media/coda-common.c: In function 'set_defau=
lt_params':
   include/linux/compiler-gcc.h:42:45: warning: dereference of NULL '*ctx.c=
odec' [CWE-476] [-Wanalyzer-null-dereference]
      42 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix=
), __COUNTER__)
         |                                             ^~~~~~~~~~~~
   include/linux/minmax.h:31:27: note: in definition of macro '__cmp_once'
      31 |                 typeof(x) unique_x =3D (x);               \
         |                           ^~~~~~~~
   include/linux/compiler_types.h:60:22: note: in expansion of macro '___PA=
STE'
      60 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler-gcc.h:42:29: note: in expansion of macro '__PASTE'
      42 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix=
), __COUNTER__)
         |                             ^~~~~~~
   include/linux/compiler_types.h:60:22: note: in expansion of macro '___PA=
STE'
      60 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler-gcc.h:42:37: note: in expansion of macro '__PASTE'
      42 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix=
), __COUNTER__)
         |                                     ^~~~~~~
   include/linux/minmax.h:38:34: note: in expansion of macro '__UNIQUE_ID'
      38 |                 __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(_=
_y), op))
         |                                  ^~~~~~~~~~~
   include/linux/minmax.h:45:25: note: in expansion of macro '__careful_cmp'
      45 | #define min(x, y)       __careful_cmp(x, y, <)
         |                         ^~~~~~~~~~~~~
   drivers/media/platform/chips-media/coda-common.c:1662:17: note: in expan=
sion of macro 'min'
    1662 |         max_w =3D min(ctx->codec->max_w, 1920U);
         |                 ^~~
     'set_default_params': event 1
       |
       | 1660 |         ctx->codec =3D coda_find_codec(ctx->dev, ctx->cvd->=
src_formats[0],
       |      |         ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~
       |      |                    |
       |      |                    (1) '*ctx.codec' is NULL
       | 1661 |                                      ctx->cvd->dst_formats[=
0]);
       |      |                                      ~~~~~~~~~~~~~~~~~~~~~~=
~~~
       |
     'set_default_params': event 2
       |
       |include/linux/compiler-gcc.h:42:45:
       |   42 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, p=
refix), __COUNTER__)
       |      |                                             ^~~~~~~~~~~~
       |      |                                             |
       |      |                                             (2) dereference=
 of NULL 'coda_find_codec(*ctx.dev, (int)*ctx_19(D)->cvd.src_formats[0], (i=
nt)*ctx_19(D)->cvd.dst_formats[0])'
   include/linux/minmax.h:31:27: note: in definition of macro '__cmp_once'
       |   31 |                 typeof(x) unique_x =3D (x);               \
       |      |                           ^~~~~~~~
   include/linux/compiler_types.h:60:22: note: in expansion of macro '___PA=
STE'
       |   60 | #define __PASTE(a,b) ___PASTE(a,b)
       |      |                      ^~~~~~~~
   include/linux/compiler-gcc.h:42:29: note: in expansion of macro '__PASTE'
       |   42 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, p=
refix), __COUNTER__)
       |      |                             ^~~~~~~
   include/linux/compiler_types.h:60:22: note: in expansion of macro '___PA=
STE'
       |   60 | #define __PASTE(a,b) ___PASTE(a,b)
       |      |                      ^~~~~~~~
   include/linux/compiler-gcc.h:42:37: note: in expansion of macro '__PASTE'
       |   42 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, p=
refix), __COUNTER__)
       |      |                                     ^~~~~~~
   include/linux/minmax.h:38:34: note: in expansion of macro '__UNIQUE_ID'
       |   38 |                 __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE=
_ID(__y), op))
       |      |                                  ^~~~~~~~~~~
   include/linux/minmax.h:45:25: note: in expansion of macro '__careful_cmp'
       |   45 | #define min(x, y)       __careful_cmp(x, y, <)
       |      |                         ^~~~~~~~~~~~~
   drivers/media/platform/chips-media/coda-common.c:1662:17: note: in expan=
sion of macro 'min'
       | 1662 |         max_w =3D min(ctx->codec->max_w, 1920U);
       |      |                 ^~~
       |
   drivers/media/platform/chips-media/coda-common.c: In function 'coda_queu=
e_setup':
>> drivers/media/platform/chips-media/coda-common.c:1719:14: warning: deref=
erence of NULL '0' [CWE-476] [-Wanalyzer-null-dereference]
    1719 |         size =3D q_data->sizeimage;
         |         ~~~~~^~~~~~~~~~~~~~~~~~~
     'coda_queue_setup': event 1
       |
       |drivers/media/platform/chips-media/coda.h:328:9:
       |  328 |         switch (type) {
       |      |         ^~~~~~
       |      |         |
       |      |         (1) following 'default:' branch...
       |
     'coda_queue_setup': events 2-3
       |
       |drivers/media/platform/chips-media/coda-common.c:1719:14:
       | 1719 |         size =3D q_data->sizeimage;
       |      |         ~~~~~^~~~~~~~~~~~~~~~~~~
       |      |              |
       |      |              (2) ...to here
       |      |              (3) dereference of NULL '<unknown>'
       |
   drivers/media/platform/chips-media/coda-common.c: In function 'coda_buf_=
prepare':
   drivers/media/platform/chips-media/coda-common.c:1750:43: warning: deref=
erence of NULL '0' [CWE-476] [-Wanalyzer-null-dereference]
    1750 |         if (vb2_plane_size(vb, 0) < q_data->sizeimage) {
         |                                     ~~~~~~^~~~~~~~~~~
     'coda_buf_prepare': event 1
       |
       |drivers/media/platform/chips-media/coda.h:328:9:
       |  328 |         switch (type) {
       |      |         ^~~~~~
       |      |         |
       |      |         (1) following 'default:' branch...
       |
     'coda_buf_prepare': events 2-3
       |
       |drivers/media/platform/chips-media/coda-common.c:1740:12:
       | 1740 |         if (V4L2_TYPE_IS_OUTPUT(vb->vb2_queue->type)) {
       |      |            ^
       |      |            |
       |      |            (2) ...to here
       |      |            (3) following 'false' branch...
       |
     'coda_buf_prepare': event 4
       |
       |cc1:
       | (4): ...to here
       |
     'coda_buf_prepare': event 5
       |
       |include/media/videobuf2-core.h:1192:12:
       | 1192 |         if (plane_no < vb->num_planes)
       |      |            ^
       |      |            |
       |      |            (5) following 'false' branch...
       |
     'coda_buf_prepare': events 6-7
       |
       |drivers/media/platform/chips-media/coda-common.c:1750:43:
       | 1750 |         if (vb2_plane_size(vb, 0) < q_data->sizeimage) {
       |      |                                     ~~~~~~^~~~~~~~~~~
       |      |                                           |
       |      |                                           (6) ...to here
       |      |                                           (7) dereference o=
f NULL '<unknown>'
       |
   drivers/media/platform/chips-media/coda-common.c: In function 'coda_open=
':
   drivers/media/platform/chips-media/coda-common.c:2628:34: warning: deref=
erence of NULL '0' [CWE-476] [-Wanalyzer-null-dereference]
    2628 |         ctx->inst_type =3D ctx->cvd->type;
         |                          ~~~~~~~~^~~~~~
     'coda_open': events 1-8
       |
       | 2596 | static int coda_open(struct file *file)
       |      |            ^~~~~~~~~
       |      |            |
       |      |            (1) entry to 'coda_open'
       |......
       | 2607 |         if (!ctx)
       |      |            ~
       |      |            |
       |      |            (2) following 'false' branch (when 'ctx' is non-=
NULL)...
       |......
       | 2610 |         if (dev->devtype->product =3D=3D CODA_DX6)
       |      |             ~~~~~~~~~~~~
       |      |                |
       |      |                (3) ...to here
       |......
       | 2613 |         if (idx < 0) {
       |      |            ~
       |      |            |
       |      |            (4) following 'false' branch...
       |......
       | 2618 |         name =3D kasprintf(GFP_KERNEL, "context%d", idx);
       |      |                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                |
       |      |                (5) ...to here
       | 2619 |         if (!name) {
       |      |            ~
       |      |            |
       |      |            (6) following 'false' branch (when 'name' is non=
-NULL)...
       |......
       | 2624 |         ctx->debugfs_entry =3D debugfs_create_dir(name, dev=
->debugfs_root);
       |      |                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~
       |      |                              |

vim +/0 +1719 drivers/media/platform/chips-media/coda-common.c

186b250a072537 drivers/media/video/coda.c                Javier Martin 2012=
-07-26  1706  =

186b250a072537 drivers/media/video/coda.c                Javier Martin 2012=
-07-26  1707  /*
186b250a072537 drivers/media/video/coda.c                Javier Martin 2012=
-07-26  1708   * Queue operations
186b250a072537 drivers/media/video/coda.c                Javier Martin 2012=
-07-26  1709   */
df9ecb0cad14b9 drivers/media/platform/coda/coda-common.c Hans Verkuil  2015=
-10-28  1710  static int coda_queue_setup(struct vb2_queue *vq,
186b250a072537 drivers/media/video/coda.c                Javier Martin 2012=
-07-26  1711  				unsigned int *nbuffers, unsigned int *nplanes,
36c0f8b32c4bd4 drivers/media/platform/coda/coda-common.c Hans Verkuil  2016=
-04-15  1712  				unsigned int sizes[], struct device *alloc_devs[])
186b250a072537 drivers/media/video/coda.c                Javier Martin 2012=
-07-26  1713  {
186b250a072537 drivers/media/video/coda.c                Javier Martin 2012=
-07-26  1714  	struct coda_ctx *ctx =3D vb2_get_drv_priv(vq);
e34db0661dc794 drivers/media/platform/coda.c             Philipp Zabel 2012=
-08-29  1715  	struct coda_q_data *q_data;
186b250a072537 drivers/media/video/coda.c                Javier Martin 2012=
-07-26  1716  	unsigned int size;
186b250a072537 drivers/media/video/coda.c                Javier Martin 2012=
-07-26  1717  =

e34db0661dc794 drivers/media/platform/coda.c             Philipp Zabel 2012=
-08-29  1718  	q_data =3D get_q_data(ctx, vq->type);
e34db0661dc794 drivers/media/platform/coda.c             Philipp Zabel 2012=
-08-29 @1719  	size =3D q_data->sizeimage;
186b250a072537 drivers/media/video/coda.c                Javier Martin 2012=
-07-26  1720  =

0eecc61947ed32 drivers/media/platform/coda/coda-common.c Philipp Zabel 2019=
-04-08  1721  	if (*nplanes)
0eecc61947ed32 drivers/media/platform/coda/coda-common.c Philipp Zabel 2019=
-04-08  1722  		return sizes[0] < size ? -EINVAL : 0;
0eecc61947ed32 drivers/media/platform/coda/coda-common.c Philipp Zabel 2019=
-04-08  1723  =

186b250a072537 drivers/media/video/coda.c                Javier Martin 2012=
-07-26  1724  	*nplanes =3D 1;
186b250a072537 drivers/media/video/coda.c                Javier Martin 2012=
-07-26  1725  	sizes[0] =3D size;
186b250a072537 drivers/media/video/coda.c                Javier Martin 2012=
-07-26  1726  =

8f90d15e6d5471 drivers/media/platform/coda/coda-common.c Philipp Zabel 2018=
-11-05  1727  	coda_dbg(1, ctx, "get %d buffer(s) of size %d each.\n", *nbu=
ffers,
8f90d15e6d5471 drivers/media/platform/coda/coda-common.c Philipp Zabel 2018=
-11-05  1728  		 size);
186b250a072537 drivers/media/video/coda.c                Javier Martin 2012=
-07-26  1729  =

186b250a072537 drivers/media/video/coda.c                Javier Martin 2012=
-07-26  1730  	return 0;
186b250a072537 drivers/media/video/coda.c                Javier Martin 2012=
-07-26  1731  }
186b250a072537 drivers/media/video/coda.c                Javier Martin 2012=
-07-26  1732  =


:::::: The code@line 1719 was first introduced by commit
:::::: e34db0661dc7945e5412a568f38dd170c78099d1 [media] media: coda: set up=
 buffers to be sized as negotiated with s_fmt

:::::: TO: Philipp Zabel <p.zabel@pengutronix.de>
:::::: CC: Mauro Carvalho Chehab <mchehab@redhat.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1902449660285388141==--

