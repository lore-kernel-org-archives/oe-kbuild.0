Content-Type: multipart/mixed; boundary="===============3572644703854250459=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c:1448:63: warning: dereference of NULL 'fmt' [CWE-476]
Date: Fri, 17 Jun 2022 03:24:11 +0800
Message-ID: <202206170333.EAKzCei3-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3572644703854250459==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: drivers/m=
edia/platform/samsung/s5p-jpeg/jpeg-core.c:1448:63: warning: dereference of=
 NULL 'fmt' [CWE-476] [-Wanalyzer-null-dereference]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   30306f6194cadcc29c77f6ddcd416a75bf5c0232
commit: f4104b7851a8d8b9a70899dcbecdb393eb16cd8a media: platform: rename s5=
p-jpeg/ to samsung/s5p-jpeg/
date:   3 months ago
:::::: branch date: 22 hours ago
:::::: commit date: 3 months ago
config: arm-randconfig-c002-20220615 (https://download.01.org/0day-ci/archi=
ve/20220617/202206170333.EAKzCei3-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Df4104b7851a8d8b9a70899dcbecdb393eb16cd8a
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout f4104b7851a8d8b9a70899dcbecdb393eb16cd8a
        # save the config file
         ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


gcc-analyzer warnings: (new ones prefixed by >>)
   drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c: In function 'vidioc=
_try_fmt':
>> drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c:1448:63: warning: de=
reference of NULL 'fmt' [CWE-476] [-Wanalyzer-null-dereference]
    1448 |                                        S5P_JPEG_MAX_WIDTH, fmt->=
h_align,
         |                                                            ~~~^~=
~~~~~~~
     's5p_jpeg_try_fmt_vid_cap': events 1-2
       |
       | 1473 | static int s5p_jpeg_try_fmt_vid_cap(struct file *file, void=
 *priv,
       |      |            ^~~~~~~~~~~~~~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 's5p_jpeg_try_fmt_vid_cap'
       |......
       | 1481 |         fmt =3D s5p_jpeg_find_format(ctx, f->fmt.pix.pixelf=
ormat,
       |      |               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
       |      |               |
       |      |               (2) calling 's5p_jpeg_find_format' from 's5p_=
jpeg_try_fmt_vid_cap'
       | 1482 |                                                 FMT_TYPE_CA=
PTURE);
       |      |                                                 ~~~~~~~~~~~=
~~~~~~
       |
       +--> 's5p_jpeg_find_format': event 3
              |
              | 1365 | static struct s5p_jpeg_fmt *s5p_jpeg_find_format(str=
uct s5p_jpeg_ctx *ctx,
              |      |                             ^~~~~~~~~~~~~~~~~~~~
              |      |                             |
              |      |                             (3) entry to 's5p_jpeg_f=
ind_format'
              |
            's5p_jpeg_find_format': event 4
              |
              | 1376 |                                 SJPEG_FMT_FLAG_DEC_O=
UTPUT :
              |
            's5p_jpeg_find_format': event 5
              |
              |cc1:
              | (5): ...to here
              |
            's5p_jpeg_find_format': events 6-7
              |
              | 1379 |         for (k =3D 0; k < ARRAY_SIZE(sjpeg_formats);=
 k++) {
              | 1380 |                 struct s5p_jpeg_fmt *fmt =3D &sjpeg_=
formats[k];
              |      |                                      ~~~
              |      |                                      |
              |      |                                      (7) ...to here
              |
       <------+
       |
     's5p_jpeg_try_fmt_vid_cap': events 8-17
       |
       | 1481 |         fmt =3D s5p_jpeg_find_format(ctx, f->fmt.pix.pixelf=
ormat,
       |      |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
       |      |               |
       |      |               (8) returning to 's5p_jpeg_try_fmt_vid_cap' f=
rom 's5p_jpeg_find_format'
       | 1482 |                                                 FMT_TYPE_CA=
PTURE);
       |      |                                                 ~~~~~~~~~~~=
~~~~~~
       | 1483 |         if (!fmt) {
       |      |            ~   =

       |      |            |
       |      |            (9) following 'false' branch (when 'fmt' is non-=
NULL)...
       |......
       | 1490 |         if (!ctx->jpeg->variant->hw_ex4_compat || ctx->mode=
 !=3D S5P_JPEG_DECODE)
       |      |            ~ ~~~~~~~~~
       |      |            |    |
       |      |            |    (10) ...to here
       |      |            (11) following 'false' branch...
       |......
       | 1499 |         if ((fmt->flags & SJPEG_FMT_NON_RGB) &&
       |      |              ~~~~~~~~~~
       |      |                 |
       |      |                 (12) ...to here
       |......
       | 1518 |         if (ctx->subsampling =3D=3D V4L2_JPEG_CHROMA_SUBSAM=
PLING_420 &&
       |      |            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
       |      |            |                                               =
      |
       |      |            (13) following 'true' branch...                 =
      (15) following 'true' branch...
       | 1519 |             (ctx->out_q.w & 1) &&
       |      |             ~~~~~~~~~~~~~~~~~~
       |      |                        |
       |      |                        (14) ...to here
       | 1520 |             (pix->pixelformat =3D=3D V4L2_PIX_FMT_NV12 ||
       |      |              ~~~~~~~~~~~~~~~~
       |      |                 |
       |      |                 (16) ...to here
       |......
       | 1524 |                 fmt =3D s5p_jpeg_find_format(ctx, pix->pixe=
lformat,
       |      |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
       |      |                       |
       |      |                       (17) calling 's5p_jpeg_find_format' f=
rom 's5p_jpeg_try_fmt_vid_cap'
       | 1525 |                                                         FMT=
_TYPE_CAPTURE);
       |      |                                                         ~~~=
~~~~~~~~~~~~~~
       |
       +--> 's5p_jpeg_find_format': event 18
              |
              | 1365 | static struct s5p_jpeg_fmt *s5p_jpeg_find_format(str=
uct s5p_jpeg_ctx *ctx,
              |      |                             ^~~~~~~~~~~~~~~~~~~~
              |      |                             |
              |      |                             (18) entry to 's5p_jpeg_=
find_format'
              |
            's5p_jpeg_find_format': event 19
              |
              | 1376 |                                 SJPEG_FMT_FLAG_DEC_O=
UTPUT :
              |
            's5p_jpeg_find_format': event 20
              |
              |cc1:
              | (20): ...to here
              |
            's5p_jpeg_find_format': events 21-22
              |
              | 1379 |         for (k =3D 0; k < ARRAY_SIZE(sjpeg_formats);=
 k++) {
              | 1380 |                 struct s5p_jpeg_fmt *fmt =3D &sjpeg_=
formats[k];
              |      |                                      ~~~
              |      |                                      |
              |      |                                      (22) ...to here
              |
       <------+
       |
     's5p_jpeg_try_fmt_vid_cap': events 23-24
       |
       | 1524 |                 fmt =3D s5p_jpeg_find_format(ctx, pix->pixe=
lformat,
       |      |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
       |      |                       |
       |      |                       (23) return of NULL to 's5p_jpeg_try_=
fmt_vid_cap' from 's5p_jpeg_find_format'
       | 1525 |                                                         FMT=
_TYPE_CAPTURE);
       |      |                                                         ~~~=
~~~~~~~~~~~~~~
       |......
       | 1529 |         return vidioc_try_fmt(f, fmt, ctx, FMT_TYPE_CAPTURE=
);
       |      |                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                |
       |      |                (24) calling 'vidioc_try_fmt' from 's5p_jpeg=
_try_fmt_vid_cap'
       |
       +--> 'vidioc_try_fmt': events 25-30
              |
              | 1428 | static int vidioc_try_fmt(struct v4l2_format *f, str=
uct s5p_jpeg_fmt *fmt,
              |      |            ^~~~~~~~~~~~~~
              |      |            |
              |      |            (25) entry to 'vidioc_try_fmt'
              |......
              | 1435 |         else if (pix->field !=3D V4L2_FIELD_NONE)
              |      |                 ~
              |      |                 |
              |      |                 (26) following 'false' branch...
              |......
              | 1441 |         if (q_type =3D=3D FMT_TYPE_OUTPUT)
              |      |            ~
              |      |            |
              |      |            (27) ...to here
              |      |            (28) following 'false' branch (when 'q_ty=
pe !=3D 0')...
              |......
              | 1447 |                 jpeg_bound_align_image(ctx, &pix->wi=
dth, S5P_JPEG_MIN_WIDTH,
              |      |                                             ~~~~~~~~=
~~~
              |      |                                             |
              |      |                                             (29) ...=
to here
              | 1448 |                                        S5P_JPEG_MAX_=
WIDTH, fmt->h_align,
              |      |                                                     =
       ~~~~~~~~~~~~
              |      |                                                     =
          |
              |      |                                                     =
          (30) dereference of NULL 'fmt'
              |
   drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c: In function 's5p_jp=
eg_s_fmt':
>> drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c:1611:28: warning: de=
reference of NULL '*ct.out_q.fmt' [CWE-476] [-Wanalyzer-null-dereference]
    1611 |                 q_data->fmt->fourcc !=3D V4L2_PIX_FMT_JPEG)) {
         |                 ~~~~~~~~~~~^~~~~~~~
     's5p_jpeg_s_fmt': events 1-5
       |
       | 1323 |         if (type =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT)
       |      |            ~
       |      |            |
       |      |            (4) following 'true' branch...
       | 1324 |                 return &ctx->out_q;
       |      |                        ~~~~~~~~~~~
       |      |                        |
       |      |                        (5) ...to here
       |......
       | 1584 | static int s5p_jpeg_s_fmt(struct s5p_jpeg_ctx *ct, struct v=
4l2_format *f)
       |      |            ^~~~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 's5p_jpeg_s_fmt'
       |......
       | 1594 |         if (!vq)
       |      |            ~
       |      |            |
       |      |            (2) following 'false' branch (when 'vq' is non-N=
ULL)...
       |......
       | 1597 |         q_data =3D get_q_data(ct, f->type);
       |      |                                 ~~~~~~~
       |      |                                  |
       |      |                                  (3) ...to here
       |
     's5p_jpeg_s_fmt': event 6
       |
       |include/asm-generic/bug.h:161:35:
       |  161 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG=
(); } while (0)
       |      |                                   ^
       |      |                                   |
       |      |                                   (6) following 'false' bra=
nch...
   drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c:1598:9: note: in exp=
ansion of macro 'BUG_ON'
       | 1598 |         BUG_ON(q_data =3D=3D NULL);
       |      |         ^~~~~~
       |
     's5p_jpeg_s_fmt': event 7
       |
       |include/media/videobuf2-core.h:1136:18:
       | 1136 |         return (q->num_buffers > 0);
       |      |                 ~^~~~~~~~~~~~~
       |      |                  |
       |      |                  (7) ...to here
       |
     's5p_jpeg_s_fmt': event 8
       |
       |drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c:1600:12:
       | 1600 |         if (vb2_is_busy(vq)) {
       |      |            ^
       |      |            |
       |      |            (8) following 'false' branch...
       |
     's5p_jpeg_s_fmt': event 9
       |
       |cc1:
       | (9): ...to here
       |
     's5p_jpeg_s_fmt': event 10
       |
       |cc1:
       | (10): following 'case 2 ... 3:' branch...
       |
     's5p_jpeg_s_fmt': events 11-12
       |
       | 1605 |         f_type =3D V4L2_TYPE_IS_OUTPUT(f->type) ?
       |......
       | 1608 |         q_data->fmt =3D s5p_jpeg_find_format(ct, pix->pixel=
format, f_type);
       |      |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~
       |      |                       |
       |      |                       (12) calling 's5p_jpeg_find_format' f=
rom 's5p_jpeg_s_fmt'
       |
       +--> 's5p_jpeg_find_format': event 13
              |
              | 1365 | static struct s5p_jpeg_fmt *s5p_jpeg_find_format(str=
uct s5p_jpeg_ctx *ctx,
              |      |                             ^~~~~~~~~~~~~~~~~~~~
              |      |                             |
              |      |                             (13) entry to 's5p_jpeg_=
find_format'
              |
            's5p_jpeg_find_format': event 14
              |
              | 1376 |                                 SJPEG_FMT_FLAG_DEC_O=
UTPUT :
              |
            's5p_jpeg_find_format': event 15
              |
              |cc1:
              | (15): ...to here
              |
            's5p_jpeg_find_format': events 16-17
              |
              | 1379 |         for (k =3D 0; k < ARRAY_SIZE(sjpeg_formats);=
 k++) {
              | 1380 |                 struct s5p_jpeg_fmt *fmt =3D &sjpeg_=
formats[k];
              |      |                                      ~~~
              |      |                                      |
              |      |                                      (17) ...to here
              |
       <------+
       |
     's5p_jpeg_s_fmt': events 18-24
       |
       | 1608 |         q_data->fmt =3D s5p_jpeg_find_format(ct, pix->pixel=
format, f_type);
       |      |         ~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~
       |      |                     | |
       |      |                     | (18) returning to 's5p_jpeg_s_fmt' fr=
om 's5p_jpeg_find_format'
       |      |                     (19) '*ct.out_q.fmt' is NULL
       | 1609 |         if (ct->mode =3D=3D S5P_JPEG_ENCODE ||
       |      |            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |            |                            |
       |      |            |                            (21) ...to here
       |      |            |                            (22) following 'tru=
e' branch...
       |      |            (20) following 'false' branch...
       | 1610 |                 (ct->mode =3D=3D S5P_JPEG_DECODE &&
       |      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       | 1611 |                 q_data->fmt->fourcc !=3D V4L2_PIX_FMT_JPEG)=
) {
       |      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                            |
       |      |                            (23) ...to here
       |      |                            (24) dereference of NULL 's5p_jp=
eg_find_format(ct, *(struct v4l2_pix_format *)((char *)f + 4).pixelformat, =
 f_type)'
       |
>> drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c:1611:28: warning: de=
reference of NULL '*ct.cap_q.fmt' [CWE-476] [-Wanalyzer-null-dereference]
    1611 |                 q_data->fmt->fourcc !=3D V4L2_PIX_FMT_JPEG)) {
         |                 ~~~~~~~~~~~^~~~~~~~
     's5p_jpeg_s_fmt': events 1-7
       |
       | 1323 |         if (type =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT)
       |      |            ~
       |      |            |
       |      |            (4) following 'false' branch...
       | 1324 |                 return &ctx->out_q;
       | 1325 |         if (type =3D=3D V4L2_BUF_TYPE_VIDEO_CAPTURE)
       |      |            ~
       |      |            |
       |      |            (5) ...to here
       |      |            (6) following 'true' branch...
       | 1326 |                 return &ctx->cap_q;
       |      |                        ~~~~~~~~~~~
       |      |                        |
       |      |                        (7) ...to here
       |......
       | 1584 | static int s5p_jpeg_s_fmt(struct s5p_jpeg_ctx *ct, struct v=
4l2_format *f)
       |      |            ^~~~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 's5p_jpeg_s_fmt'
       |......
       | 1594 |         if (!vq)
       |      |            ~
       |      |            |
       |      |            (2) following 'false' branch (when 'vq' is non-N=
ULL)...
       |......
       | 1597 |         q_data =3D get_q_data(ct, f->type);
       |      |                                 ~~~~~~~
       |      |                                  |
       |      |                                  (3) ...to here
       |
     's5p_jpeg_s_fmt': event 8
       |
       |include/asm-generic/bug.h:161:35:
       |  161 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG=
(); } while (0)
       |      |                                   ^
       |      |                                   |
       |      |                                   (8) following 'false' bra=
nch...
   drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c:1598:9: note: in exp=
ansion of macro 'BUG_ON'
       | 1598 |         BUG_ON(q_data =3D=3D NULL);
       |      |         ^~~~~~
       |
     's5p_jpeg_s_fmt': event 9
       |
       |include/media/videobuf2-core.h:1136:18:
       | 1136 |         return (q->num_buffers > 0);
       |      |                 ~^~~~~~~~~~~~~
       |      |                  |
       |      |                  (9) ...to here
       |
     's5p_jpeg_s_fmt': event 10
       |
       |drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c:1600:12:
       | 1600 |         if (vb2_is_busy(vq)) {
       |      |            ^
       |      |            |
       |      |            (10) following 'false' branch...
       |
     's5p_jpeg_s_fmt': event 11
       |
       |cc1:
       | (11): ...to here
       |
     's5p_jpeg_s_fmt': event 12
       |
       |cc1:
       | (12): following 'default:' branch...
       |
     's5p_jpeg_s_fmt': event 13
       |
       |cc1:
       | (13): ...to here
       |
     's5p_jpeg_s_fmt': event 14
       |
       | 1608 |         q_data->fmt =3D s5p_jpeg_find_format(ct, pix->pixel=
format, f_type);
       |      |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~
       |      |                       |
       |      |                       (14) calling 's5p_jpeg_find_format' f=
rom 's5p_jpeg_s_fmt'
       |
       +--> 's5p_jpeg_find_format': event 15
              |
              | 1365 | static struct s5p_jpeg_fmt *s5p_jpeg_find_format(str=
uct s5p_jpeg_ctx *ctx,
              |      |                             ^~~~~~~~~~~~~~~~~~~~
              |      |                             |
              |      |                             (15) entry to 's5p_jpeg_=
find_format'
              |
            's5p_jpeg_find_format': event 16
              |
              | 1376 |                                 SJPEG_FMT_FLAG_DEC_O=
UTPUT :
              |
            's5p_jpeg_find_format': event 17
              |
              |cc1:
              | (17): ...to here
              |
            's5p_jpeg_find_format': events 18-19
              |
              | 1379 |         for (k =3D 0; k < ARRAY_SIZE(sjpeg_formats);=
 k++) {
              | 1380 |                 struct s5p_jpeg_fmt *fmt =3D &sjpeg_=
formats[k];
              |      |                                      ~~~
              |      |                                      |
              |      |                                      (19) ...to here
              |
       <------+
       |
     's5p_jpeg_s_fmt': events 20-26
       |
       | 1608 |         q_data->fmt =3D s5p_jpeg_find_format(ct, pix->pixel=
format, f_type);
       |      |         ~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~
       |      |                     | |
       |      |                     | (20) returning to 's5p_jpeg_s_fmt' fr=
om 's5p_jpeg_find_format'
       |      |                     (21) '*ct.cap_q.fmt' is NULL
       | 1609 |         if (ct->mode =3D=3D S5P_JPEG_ENCODE ||
       |      |            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |            |                            |
       |      |            |                            (23) ...to here
       |      |            |                            (24) following 'tru=
e' branch...
       |      |            (22) following 'false' branch...
       | 1610 |                 (ct->mode =3D=3D S5P_JPEG_DECODE &&
       |      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       | 1611 |                 q_data->fmt->fourcc !=3D V4L2_PIX_FMT_JPEG)=
) {
       |      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                            |
       |      |                            (25) ...to here
       |      |                            (26) dereference of NULL 's5p_jp=
eg_find_format(ct, *(struct v4l2_pix_format *)((char *)f + 4).pixelformat, =
 f_type)'
       |
>> drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c:1611:28: warning: de=
reference of NULL '0' [CWE-476] [-Wanalyzer-null-dereference]
    1611 |                 q_data->fmt->fourcc !=3D V4L2_PIX_FMT_JPEG)) {
         |                 ~~~~~~~~~~~^~~~~~~~
     's5p_jpeg_s_fmt_vid_cap.part.0': events 1-2
       |
       | 1673 | static int s5p_jpeg_s_fmt_vid_cap(struct file *file, void *=
priv,
       |      |            ^~~~~~~~~~~~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 's5p_jpeg_s_fmt_vid_cap.part.0'
       |......
       | 1682 |         return s5p_jpeg_s_fmt(fh_to_ctx(priv), f);
       |      |                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                |
       |      |                (2) calling 's5p_jpeg_s_fmt' from 's5p_jpeg_=
s_fmt_vid_cap.part.0'
       |
       +--> 's5p_jpeg_s_fmt': events 3-7
              |
              | 1323 |         if (type =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT)
              |      |            ~
              |      |            |
              |      |            (6) following 'true' branch...
              | 1324 |                 return &ctx->out_q;
              |      |                        ~~~~~~~~~~~
              |      |                        |
              |      |                        (7) ...to here
              |......
              | 1584 | static int s5p_jpeg_s_fmt(struct s5p_jpeg_ctx *ct, s=
truct v4l2_format *f)
              |      |            ^~~~~~~~~~~~~~
              |      |            |
              |      |            (3) entry to 's5p_jpeg_s_fmt'
              |......
              | 1594 |         if (!vq)
              |      |            ~
              |      |            |
              |      |            (4) following 'false' branch (when 'vq' i=
s non-NULL)...
              |......
              | 1597 |         q_data =3D get_q_data(ct, f->type);
              |      |                                 ~~~~~~~
              |      |                                  |
              |      |                                  (5) ...to here
              |
            's5p_jpeg_s_fmt': event 8
              |
              |include/asm-generic/bug.h:161:35:
              |  161 | #define BUG_ON(condition) do { if (unlikely(conditio=
n)) BUG(); } while (0)
              |      |                                   ^
              |      |                                   |
              |      |                                   (8) following 'fal=
se' branch...
   drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c:1598:9: note: in exp=
ansion of macro 'BUG_ON'
              | 1598 |         BUG_ON(q_data =3D=3D NULL);
              |      |         ^~~~~~
              |
            's5p_jpeg_s_fmt': event 9
              |
              |include/media/videobuf2-core.h:1136:18:
              | 1136 |         return (q->num_buffers > 0);
              |      |                 ~^~~~~~~~~~~~~
              |      |                  |
              |      |                  (9) ...to here
              |
            's5p_jpeg_s_fmt': event 10
              |
              |drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c:1600:12:
              | 1600 |         if (vb2_is_busy(vq)) {
              |      |            ^
              |      |            |
              |      |            (10) following 'false' branch...
              |
            's5p_jpeg_s_fmt': event 11
              |
              |cc1:
              | (11): ...to here
              |
            's5p_jpeg_s_fmt': event 12
              |
              |cc1:
              | (12): following 'case 2 ... 3:' branch...
              |
            's5p_jpeg_s_fmt': events 13-14
              |
              | 1605 |         f_type =3D V4L2_TYPE_IS_OUTPUT(f->type) ?
              |......
              | 1608 |         q_data->fmt =3D s5p_jpeg_find_format(ct, pix=
->pixelformat, f_type);
              |      |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~
              |      |                       |
              |      |                       (14) calling 's5p_jpeg_find_fo=
rmat' from 's5p_jpeg_s_fmt'
              |
              +--> 's5p_jpeg_find_format': event 15
                     |
                     | 1365 | static struct s5p_jpeg_fmt *s5p_jpeg_find_for=
mat(struct s5p_jpeg_ctx *ctx,
                     |      |                             ^~~~~~~~~~~~~~~~~=
~~~
                     |      |                             |
                     |      |                             (15) entry to 's5=
p_jpeg_find_format'
                     |
                   's5p_jpeg_find_format': event 16
                     |
                     | 1376 |                                 SJPEG_FMT_FLA=
G_DEC_OUTPUT :
                     |
                   's5p_jpeg_find_format': event 17
                     |
                     |cc1:

vim +/fmt +1448 drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c

bb677f3ac434cb drivers/media/video/s5p-jpeg/jpeg-core.c    Andrzej Pietrasi=
ewicz 2011-11-24  1427  =

bb677f3ac434cb drivers/media/video/s5p-jpeg/jpeg-core.c    Andrzej Pietrasi=
ewicz 2011-11-24  1428  static int vidioc_try_fmt(struct v4l2_format *f, st=
ruct s5p_jpeg_fmt *fmt,
bb677f3ac434cb drivers/media/video/s5p-jpeg/jpeg-core.c    Andrzej Pietrasi=
ewicz 2011-11-24  1429  			  struct s5p_jpeg_ctx *ctx, int q_type)
bb677f3ac434cb drivers/media/video/s5p-jpeg/jpeg-core.c    Andrzej Pietrasi=
ewicz 2011-11-24  1430  {
bb677f3ac434cb drivers/media/video/s5p-jpeg/jpeg-core.c    Andrzej Pietrasi=
ewicz 2011-11-24  1431  	struct v4l2_pix_format *pix =3D &f->fmt.pix;
bb677f3ac434cb drivers/media/video/s5p-jpeg/jpeg-core.c    Andrzej Pietrasi=
ewicz 2011-11-24  1432  =

bb677f3ac434cb drivers/media/video/s5p-jpeg/jpeg-core.c    Andrzej Pietrasi=
ewicz 2011-11-24  1433  	if (pix->field =3D=3D V4L2_FIELD_ANY)
bb677f3ac434cb drivers/media/video/s5p-jpeg/jpeg-core.c    Andrzej Pietrasi=
ewicz 2011-11-24  1434  		pix->field =3D V4L2_FIELD_NONE;
bb677f3ac434cb drivers/media/video/s5p-jpeg/jpeg-core.c    Andrzej Pietrasi=
ewicz 2011-11-24  1435  	else if (pix->field !=3D V4L2_FIELD_NONE)
bb677f3ac434cb drivers/media/video/s5p-jpeg/jpeg-core.c    Andrzej Pietrasi=
ewicz 2011-11-24  1436  		return -EINVAL;
bb677f3ac434cb drivers/media/video/s5p-jpeg/jpeg-core.c    Andrzej Pietrasi=
ewicz 2011-11-24  1437  =

bb677f3ac434cb drivers/media/video/s5p-jpeg/jpeg-core.c    Andrzej Pietrasi=
ewicz 2011-11-24  1438  	/* V4L2 specification suggests the driver corrects=
 the format struct
605b8920614017 drivers/media/platform/s5p-jpeg/jpeg-core.c Shuah Khan      =
      2016-07-14  1439  	 * if any of the dimensions is unsupported
605b8920614017 drivers/media/platform/s5p-jpeg/jpeg-core.c Shuah Khan      =
      2016-07-14  1440  	 */
80529ae5c13725 drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2013-12-18  1441  	if (q_type =3D=3D FMT_TYPE_OUTPUT)
e9e7dfe5ef577d drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2014-07-11  1442  		jpeg_bound_align_image(ctx, &pix->width, S5P_JPEG=
_MIN_WIDTH,
bb677f3ac434cb drivers/media/video/s5p-jpeg/jpeg-core.c    Andrzej Pietrasi=
ewicz 2011-11-24  1443  				       S5P_JPEG_MAX_WIDTH, 0,
bb677f3ac434cb drivers/media/video/s5p-jpeg/jpeg-core.c    Andrzej Pietrasi=
ewicz 2011-11-24  1444  				       &pix->height, S5P_JPEG_MIN_HEIGHT,
bb677f3ac434cb drivers/media/video/s5p-jpeg/jpeg-core.c    Andrzej Pietrasi=
ewicz 2011-11-24  1445  				       S5P_JPEG_MAX_HEIGHT, 0);
bb677f3ac434cb drivers/media/video/s5p-jpeg/jpeg-core.c    Andrzej Pietrasi=
ewicz 2011-11-24  1446  	else
e9e7dfe5ef577d drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2014-07-11  1447  		jpeg_bound_align_image(ctx, &pix->width, S5P_JPEG=
_MIN_WIDTH,
bb677f3ac434cb drivers/media/video/s5p-jpeg/jpeg-core.c    Andrzej Pietrasi=
ewicz 2011-11-24 @1448  				       S5P_JPEG_MAX_WIDTH, fmt->h_align,
bb677f3ac434cb drivers/media/video/s5p-jpeg/jpeg-core.c    Andrzej Pietrasi=
ewicz 2011-11-24  1449  				       &pix->height, S5P_JPEG_MIN_HEIGHT,
bb677f3ac434cb drivers/media/video/s5p-jpeg/jpeg-core.c    Andrzej Pietrasi=
ewicz 2011-11-24  1450  				       S5P_JPEG_MAX_HEIGHT, fmt->v_align);
bb677f3ac434cb drivers/media/video/s5p-jpeg/jpeg-core.c    Andrzej Pietrasi=
ewicz 2011-11-24  1451  =

bb677f3ac434cb drivers/media/video/s5p-jpeg/jpeg-core.c    Andrzej Pietrasi=
ewicz 2011-11-24  1452  	if (fmt->fourcc =3D=3D V4L2_PIX_FMT_JPEG) {
bb677f3ac434cb drivers/media/video/s5p-jpeg/jpeg-core.c    Andrzej Pietrasi=
ewicz 2011-11-24  1453  		if (pix->sizeimage <=3D 0)
bb677f3ac434cb drivers/media/video/s5p-jpeg/jpeg-core.c    Andrzej Pietrasi=
ewicz 2011-11-24  1454  			pix->sizeimage =3D PAGE_SIZE;
bb677f3ac434cb drivers/media/video/s5p-jpeg/jpeg-core.c    Andrzej Pietrasi=
ewicz 2011-11-24  1455  		pix->bytesperline =3D 0;
bb677f3ac434cb drivers/media/video/s5p-jpeg/jpeg-core.c    Andrzej Pietrasi=
ewicz 2011-11-24  1456  	} else {
bb677f3ac434cb drivers/media/video/s5p-jpeg/jpeg-core.c    Andrzej Pietrasi=
ewicz 2011-11-24  1457  		u32 bpl =3D pix->bytesperline;
bb677f3ac434cb drivers/media/video/s5p-jpeg/jpeg-core.c    Andrzej Pietrasi=
ewicz 2011-11-24  1458  =

bb677f3ac434cb drivers/media/video/s5p-jpeg/jpeg-core.c    Andrzej Pietrasi=
ewicz 2011-11-24  1459  		if (fmt->colplanes > 1 && bpl < pix->width)
bb677f3ac434cb drivers/media/video/s5p-jpeg/jpeg-core.c    Andrzej Pietrasi=
ewicz 2011-11-24  1460  			bpl =3D pix->width; /* planar */
bb677f3ac434cb drivers/media/video/s5p-jpeg/jpeg-core.c    Andrzej Pietrasi=
ewicz 2011-11-24  1461  =

bb677f3ac434cb drivers/media/video/s5p-jpeg/jpeg-core.c    Andrzej Pietrasi=
ewicz 2011-11-24  1462  		if (fmt->colplanes =3D=3D 1 && /* packed */
cc690904247fdb drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2013-11-25  1463  		    (bpl << 3) / fmt->depth < pix->width)
bb677f3ac434cb drivers/media/video/s5p-jpeg/jpeg-core.c    Andrzej Pietrasi=
ewicz 2011-11-24  1464  			bpl =3D (pix->width * fmt->depth) >> 3;
bb677f3ac434cb drivers/media/video/s5p-jpeg/jpeg-core.c    Andrzej Pietrasi=
ewicz 2011-11-24  1465  =

bb677f3ac434cb drivers/media/video/s5p-jpeg/jpeg-core.c    Andrzej Pietrasi=
ewicz 2011-11-24  1466  		pix->bytesperline =3D bpl;
bb677f3ac434cb drivers/media/video/s5p-jpeg/jpeg-core.c    Andrzej Pietrasi=
ewicz 2011-11-24  1467  		pix->sizeimage =3D (pix->width * pix->height * fm=
t->depth) >> 3;
bb677f3ac434cb drivers/media/video/s5p-jpeg/jpeg-core.c    Andrzej Pietrasi=
ewicz 2011-11-24  1468  	}
bb677f3ac434cb drivers/media/video/s5p-jpeg/jpeg-core.c    Andrzej Pietrasi=
ewicz 2011-11-24  1469  =

bb677f3ac434cb drivers/media/video/s5p-jpeg/jpeg-core.c    Andrzej Pietrasi=
ewicz 2011-11-24  1470  	return 0;
bb677f3ac434cb drivers/media/video/s5p-jpeg/jpeg-core.c    Andrzej Pietrasi=
ewicz 2011-11-24  1471  }
bb677f3ac434cb drivers/media/video/s5p-jpeg/jpeg-core.c    Andrzej Pietrasi=
ewicz 2011-11-24  1472  =

bb677f3ac434cb drivers/media/video/s5p-jpeg/jpeg-core.c    Andrzej Pietrasi=
ewicz 2011-11-24  1473  static int s5p_jpeg_try_fmt_vid_cap(struct file *fi=
le, void *priv,
bb677f3ac434cb drivers/media/video/s5p-jpeg/jpeg-core.c    Andrzej Pietrasi=
ewicz 2011-11-24  1474  				  struct v4l2_format *f)
bb677f3ac434cb drivers/media/video/s5p-jpeg/jpeg-core.c    Andrzej Pietrasi=
ewicz 2011-11-24  1475  {
275de24dc0076f drivers/media/video/s5p-jpeg/jpeg-core.c    Sylwester Nawroc=
ki    2012-02-17  1476  	struct s5p_jpeg_ctx *ctx =3D fh_to_ctx(priv);
337777a42d033b drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2013-11-22  1477  	struct v4l2_pix_format *pix =3D &f->fmt.pix;
bb677f3ac434cb drivers/media/video/s5p-jpeg/jpeg-core.c    Andrzej Pietrasi=
ewicz 2011-11-24  1478  	struct s5p_jpeg_fmt *fmt;
337777a42d033b drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2013-11-22  1479  	int ret;
bb677f3ac434cb drivers/media/video/s5p-jpeg/jpeg-core.c    Andrzej Pietrasi=
ewicz 2011-11-24  1480  =

80529ae5c13725 drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2013-12-18  1481  	fmt =3D s5p_jpeg_find_format(ctx, f->fmt.pix.pixel=
format,
80529ae5c13725 drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2013-12-18  1482  						FMT_TYPE_CAPTURE);
80529ae5c13725 drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2013-12-18  1483  	if (!fmt) {
bb677f3ac434cb drivers/media/video/s5p-jpeg/jpeg-core.c    Andrzej Pietrasi=
ewicz 2011-11-24  1484  		v4l2_err(&ctx->jpeg->v4l2_dev,
bb677f3ac434cb drivers/media/video/s5p-jpeg/jpeg-core.c    Andrzej Pietrasi=
ewicz 2011-11-24  1485  			 "Fourcc format (0x%08x) invalid.\n",
bb677f3ac434cb drivers/media/video/s5p-jpeg/jpeg-core.c    Andrzej Pietrasi=
ewicz 2011-11-24  1486  			 f->fmt.pix.pixelformat);
bb677f3ac434cb drivers/media/video/s5p-jpeg/jpeg-core.c    Andrzej Pietrasi=
ewicz 2011-11-24  1487  		return -EINVAL;
bb677f3ac434cb drivers/media/video/s5p-jpeg/jpeg-core.c    Andrzej Pietrasi=
ewicz 2011-11-24  1488  	}
bb677f3ac434cb drivers/media/video/s5p-jpeg/jpeg-core.c    Andrzej Pietrasi=
ewicz 2011-11-24  1489  =

6c96dbbc2aa9f5 drivers/media/platform/s5p-jpeg/jpeg-core.c Andrzej Pietrasi=
ewicz 2015-09-18  1490  	if (!ctx->jpeg->variant->hw_ex4_compat || ctx->mod=
e !=3D S5P_JPEG_DECODE)
2caeeb0c1672c6 drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2014-04-10  1491  		goto exit;
2caeeb0c1672c6 drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2014-04-10  1492  =

337777a42d033b drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2013-11-22  1493  	/*
337777a42d033b drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2013-11-22  1494  	 * The exynos4x12 device requires resulting YUV im=
age
337777a42d033b drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2013-11-22  1495  	 * subsampling not to be lower than the input jpeg=
 subsampling.
337777a42d033b drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2013-11-22  1496  	 * If this requirement is not met then downgrade t=
he requested
337777a42d033b drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2013-11-22  1497  	 * capture format to the one with subsampling equa=
l to the input jpeg.
337777a42d033b drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2013-11-22  1498  	 */
2caeeb0c1672c6 drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2014-04-10  1499  	if ((fmt->flags & SJPEG_FMT_NON_RGB) &&
337777a42d033b drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2013-11-22  1500  	    (fmt->subsampling < ctx->subsampling)) {
337777a42d033b drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2013-11-22  1501  		ret =3D s5p_jpeg_adjust_fourcc_to_subsampling(ctx=
->subsampling,
337777a42d033b drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2013-11-22  1502  							    fmt->fourcc,
337777a42d033b drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2013-11-22  1503  							    &pix->pixelformat,
337777a42d033b drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2013-11-22  1504  							    ctx);
337777a42d033b drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2013-11-22  1505  		if (ret < 0)
337777a42d033b drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2013-11-22  1506  			pix->pixelformat =3D V4L2_PIX_FMT_GREY;
337777a42d033b drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2013-11-22  1507  =

337777a42d033b drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2013-11-22  1508  		fmt =3D s5p_jpeg_find_format(ctx, pix->pixelforma=
t,
337777a42d033b drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2013-11-22  1509  							FMT_TYPE_CAPTURE);
337777a42d033b drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2013-11-22  1510  	}
337777a42d033b drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2013-11-22  1511  =

2caeeb0c1672c6 drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2014-04-10  1512  	/*
2caeeb0c1672c6 drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2014-04-10  1513  	 * Decompression of a JPEG file with 4:2:0 subsamp=
ling and odd
2caeeb0c1672c6 drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2014-04-10  1514  	 * width to the YUV 4:2:0 compliant formats produc=
es a raw image
2caeeb0c1672c6 drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2014-04-10  1515  	 * with broken luma component. Adjust capture form=
at to RGB565
2caeeb0c1672c6 drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2014-04-10  1516  	 * in such a case.
2caeeb0c1672c6 drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2014-04-10  1517  	 */
2caeeb0c1672c6 drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2014-04-10  1518  	if (ctx->subsampling =3D=3D V4L2_JPEG_CHROMA_SUBSA=
MPLING_420 &&
2caeeb0c1672c6 drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2014-04-10  1519  	    (ctx->out_q.w & 1) &&
2caeeb0c1672c6 drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2014-04-10  1520  	    (pix->pixelformat =3D=3D V4L2_PIX_FMT_NV12 ||
2caeeb0c1672c6 drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2014-04-10  1521  	     pix->pixelformat =3D=3D V4L2_PIX_FMT_NV21 ||
2caeeb0c1672c6 drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2014-04-10  1522  	     pix->pixelformat =3D=3D V4L2_PIX_FMT_YUV420))=
 {
2caeeb0c1672c6 drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2014-04-10  1523  		pix->pixelformat =3D V4L2_PIX_FMT_RGB565;
2caeeb0c1672c6 drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2014-04-10  1524  		fmt =3D s5p_jpeg_find_format(ctx, pix->pixelforma=
t,
2caeeb0c1672c6 drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2014-04-10  1525  							FMT_TYPE_CAPTURE);
2caeeb0c1672c6 drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2014-04-10  1526  	}
2caeeb0c1672c6 drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2014-04-10  1527  =

2caeeb0c1672c6 drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2014-04-10  1528  exit:
80529ae5c13725 drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2013-12-18  1529  	return vidioc_try_fmt(f, fmt, ctx, FMT_TYPE_CAPTUR=
E);
bb677f3ac434cb drivers/media/video/s5p-jpeg/jpeg-core.c    Andrzej Pietrasi=
ewicz 2011-11-24  1530  }
bb677f3ac434cb drivers/media/video/s5p-jpeg/jpeg-core.c    Andrzej Pietrasi=
ewicz 2011-11-24  1531  =

bb677f3ac434cb drivers/media/video/s5p-jpeg/jpeg-core.c    Andrzej Pietrasi=
ewicz 2011-11-24  1532  static int s5p_jpeg_try_fmt_vid_out(struct file *fi=
le, void *priv,
bb677f3ac434cb drivers/media/video/s5p-jpeg/jpeg-core.c    Andrzej Pietrasi=
ewicz 2011-11-24  1533  				  struct v4l2_format *f)
bb677f3ac434cb drivers/media/video/s5p-jpeg/jpeg-core.c    Andrzej Pietrasi=
ewicz 2011-11-24  1534  {
275de24dc0076f drivers/media/video/s5p-jpeg/jpeg-core.c    Sylwester Nawroc=
ki    2012-02-17  1535  	struct s5p_jpeg_ctx *ctx =3D fh_to_ctx(priv);
bb677f3ac434cb drivers/media/video/s5p-jpeg/jpeg-core.c    Andrzej Pietrasi=
ewicz 2011-11-24  1536  	struct s5p_jpeg_fmt *fmt;
bb677f3ac434cb drivers/media/video/s5p-jpeg/jpeg-core.c    Andrzej Pietrasi=
ewicz 2011-11-24  1537  =

80529ae5c13725 drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2013-12-18  1538  	fmt =3D s5p_jpeg_find_format(ctx, f->fmt.pix.pixel=
format,
80529ae5c13725 drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2013-12-18  1539  						FMT_TYPE_OUTPUT);
80529ae5c13725 drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2013-12-18  1540  	if (!fmt) {
bb677f3ac434cb drivers/media/video/s5p-jpeg/jpeg-core.c    Andrzej Pietrasi=
ewicz 2011-11-24  1541  		v4l2_err(&ctx->jpeg->v4l2_dev,
bb677f3ac434cb drivers/media/video/s5p-jpeg/jpeg-core.c    Andrzej Pietrasi=
ewicz 2011-11-24  1542  			 "Fourcc format (0x%08x) invalid.\n",
bb677f3ac434cb drivers/media/video/s5p-jpeg/jpeg-core.c    Andrzej Pietrasi=
ewicz 2011-11-24  1543  			 f->fmt.pix.pixelformat);
bb677f3ac434cb drivers/media/video/s5p-jpeg/jpeg-core.c    Andrzej Pietrasi=
ewicz 2011-11-24  1544  		return -EINVAL;
bb677f3ac434cb drivers/media/video/s5p-jpeg/jpeg-core.c    Andrzej Pietrasi=
ewicz 2011-11-24  1545  	}
bb677f3ac434cb drivers/media/video/s5p-jpeg/jpeg-core.c    Andrzej Pietrasi=
ewicz 2011-11-24  1546  =

80529ae5c13725 drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2013-12-18  1547  	return vidioc_try_fmt(f, fmt, ctx, FMT_TYPE_OUTPUT=
);
bb677f3ac434cb drivers/media/video/s5p-jpeg/jpeg-core.c    Andrzej Pietrasi=
ewicz 2011-11-24  1548  }
bb677f3ac434cb drivers/media/video/s5p-jpeg/jpeg-core.c    Andrzej Pietrasi=
ewicz 2011-11-24  1549  =

b2254d6fdd6c72 drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2014-04-10  1550  static int exynos4_jpeg_get_output_buffer_size(stru=
ct s5p_jpeg_ctx *ctx,
b2254d6fdd6c72 drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2014-04-10  1551  						struct v4l2_format *f,
b2254d6fdd6c72 drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2014-04-10  1552  						int fmt_depth)
b2254d6fdd6c72 drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2014-04-10  1553  {
b2254d6fdd6c72 drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2014-04-10  1554  	struct v4l2_pix_format *pix =3D &f->fmt.pix;
b2254d6fdd6c72 drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2014-04-10  1555  	u32 pix_fmt =3D f->fmt.pix.pixelformat;
b2254d6fdd6c72 drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2014-04-10  1556  	int w =3D pix->width, h =3D pix->height, wh_align;
77401dd7394c5d drivers/media/platform/s5p-jpeg/jpeg-core.c Andrzej Pietrasi=
ewicz 2015-12-08  1557  	int padding =3D 0;
b2254d6fdd6c72 drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2014-04-10  1558  =

b2254d6fdd6c72 drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2014-04-10  1559  	if (pix_fmt =3D=3D V4L2_PIX_FMT_RGB32 ||
77401dd7394c5d drivers/media/platform/s5p-jpeg/jpeg-core.c Andrzej Pietrasi=
ewicz 2015-12-08  1560  	    pix_fmt =3D=3D V4L2_PIX_FMT_RGB565 ||
b2254d6fdd6c72 drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2014-04-10  1561  	    pix_fmt =3D=3D V4L2_PIX_FMT_NV24 ||
b2254d6fdd6c72 drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2014-04-10  1562  	    pix_fmt =3D=3D V4L2_PIX_FMT_NV42 ||
b2254d6fdd6c72 drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2014-04-10  1563  	    pix_fmt =3D=3D V4L2_PIX_FMT_NV12 ||
b2254d6fdd6c72 drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2014-04-10  1564  	    pix_fmt =3D=3D V4L2_PIX_FMT_NV21 ||
b2254d6fdd6c72 drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2014-04-10  1565  	    pix_fmt =3D=3D V4L2_PIX_FMT_YUV420)
b2254d6fdd6c72 drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2014-04-10  1566  		wh_align =3D 4;
b2254d6fdd6c72 drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2014-04-10  1567  	else
b2254d6fdd6c72 drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2014-04-10  1568  		wh_align =3D 1;
b2254d6fdd6c72 drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2014-04-10  1569  =

e9e7dfe5ef577d drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2014-07-11  1570  	jpeg_bound_align_image(ctx, &w, S5P_JPEG_MIN_WIDTH,
b2254d6fdd6c72 drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2014-04-10  1571  			       S5P_JPEG_MAX_WIDTH, wh_align,
b2254d6fdd6c72 drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2014-04-10  1572  			       &h, S5P_JPEG_MIN_HEIGHT,
b2254d6fdd6c72 drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2014-04-10  1573  			       S5P_JPEG_MAX_HEIGHT, wh_align);
b2254d6fdd6c72 drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2014-04-10  1574  =

77401dd7394c5d drivers/media/platform/s5p-jpeg/jpeg-core.c Andrzej Pietrasi=
ewicz 2015-12-08  1575  	if (ctx->jpeg->variant->version =3D=3D SJPEG_EXYNO=
S4)
77401dd7394c5d drivers/media/platform/s5p-jpeg/jpeg-core.c Andrzej Pietrasi=
ewicz 2015-12-08  1576  		padding =3D PAGE_SIZE;
77401dd7394c5d drivers/media/platform/s5p-jpeg/jpeg-core.c Andrzej Pietrasi=
ewicz 2015-12-08  1577  =

77401dd7394c5d drivers/media/platform/s5p-jpeg/jpeg-core.c Andrzej Pietrasi=
ewicz 2015-12-08  1578  	return (w * h * fmt_depth >> 3) + padding;
b2254d6fdd6c72 drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2014-04-10  1579  }
b2254d6fdd6c72 drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2014-04-10  1580  =

5a71671af37275 drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2014-07-11  1581  static int exynos3250_jpeg_try_downscale(struct s5p=
_jpeg_ctx *ctx,
5a71671af37275 drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2014-07-11  1582  				   struct v4l2_rect *r);
5a71671af37275 drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2014-07-11  1583  =

bb677f3ac434cb drivers/media/video/s5p-jpeg/jpeg-core.c    Andrzej Pietrasi=
ewicz 2011-11-24  1584  static int s5p_jpeg_s_fmt(struct s5p_jpeg_ctx *ct, =
struct v4l2_format *f)
bb677f3ac434cb drivers/media/video/s5p-jpeg/jpeg-core.c    Andrzej Pietrasi=
ewicz 2011-11-24  1585  {
bb677f3ac434cb drivers/media/video/s5p-jpeg/jpeg-core.c    Andrzej Pietrasi=
ewicz 2011-11-24  1586  	struct vb2_queue *vq;
bb677f3ac434cb drivers/media/video/s5p-jpeg/jpeg-core.c    Andrzej Pietrasi=
ewicz 2011-11-24  1587  	struct s5p_jpeg_q_data *q_data =3D NULL;
bb677f3ac434cb drivers/media/video/s5p-jpeg/jpeg-core.c    Andrzej Pietrasi=
ewicz 2011-11-24  1588  	struct v4l2_pix_format *pix =3D &f->fmt.pix;
4a30d30b87e5aa drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2013-11-21  1589  	struct v4l2_ctrl *ctrl_subs;
5a71671af37275 drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2014-07-11  1590  	struct v4l2_rect scale_rect;
80529ae5c13725 drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2013-12-18  1591  	unsigned int f_type;
bb677f3ac434cb drivers/media/video/s5p-jpeg/jpeg-core.c    Andrzej Pietrasi=
ewicz 2011-11-24  1592  =

718cf4a9da22b2 drivers/media/platform/s5p-jpeg/jpeg-core.c Sylwester Nawroc=
ki    2013-08-25  1593  	vq =3D v4l2_m2m_get_vq(ct->fh.m2m_ctx, f->type);
bb677f3ac434cb drivers/media/video/s5p-jpeg/jpeg-core.c    Andrzej Pietrasi=
ewicz 2011-11-24  1594  	if (!vq)
bb677f3ac434cb drivers/media/video/s5p-jpeg/jpeg-core.c    Andrzej Pietrasi=
ewicz 2011-11-24  1595  		return -EINVAL;
bb677f3ac434cb drivers/media/video/s5p-jpeg/jpeg-core.c    Andrzej Pietrasi=
ewicz 2011-11-24  1596  =

bb677f3ac434cb drivers/media/video/s5p-jpeg/jpeg-core.c    Andrzej Pietrasi=
ewicz 2011-11-24  1597  	q_data =3D get_q_data(ct, f->type);
bb677f3ac434cb drivers/media/video/s5p-jpeg/jpeg-core.c    Andrzej Pietrasi=
ewicz 2011-11-24  1598  	BUG_ON(q_data =3D=3D NULL);
bb677f3ac434cb drivers/media/video/s5p-jpeg/jpeg-core.c    Andrzej Pietrasi=
ewicz 2011-11-24  1599  =

bb677f3ac434cb drivers/media/video/s5p-jpeg/jpeg-core.c    Andrzej Pietrasi=
ewicz 2011-11-24  1600  	if (vb2_is_busy(vq)) {
bb677f3ac434cb drivers/media/video/s5p-jpeg/jpeg-core.c    Andrzej Pietrasi=
ewicz 2011-11-24  1601  		v4l2_err(&ct->jpeg->v4l2_dev, "%s queue busy\n", =
__func__);
bb677f3ac434cb drivers/media/video/s5p-jpeg/jpeg-core.c    Andrzej Pietrasi=
ewicz 2011-11-24  1602  		return -EBUSY;
bb677f3ac434cb drivers/media/video/s5p-jpeg/jpeg-core.c    Andrzej Pietrasi=
ewicz 2011-11-24  1603  	}
bb677f3ac434cb drivers/media/video/s5p-jpeg/jpeg-core.c    Andrzej Pietrasi=
ewicz 2011-11-24  1604  =

80529ae5c13725 drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2013-12-18  1605  	f_type =3D V4L2_TYPE_IS_OUTPUT(f->type) ?
80529ae5c13725 drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2013-12-18  1606  			FMT_TYPE_OUTPUT : FMT_TYPE_CAPTURE;
80529ae5c13725 drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2013-12-18  1607  =

80529ae5c13725 drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2013-12-18  1608  	q_data->fmt =3D s5p_jpeg_find_format(ct, pix->pixe=
lformat, f_type);
19dc3e08663767 drivers/media/platform/s5p-jpeg/jpeg-core.c Andrzej Pietrasi=
ewicz 2017-08-11  1609  	if (ct->mode =3D=3D S5P_JPEG_ENCODE ||
19dc3e08663767 drivers/media/platform/s5p-jpeg/jpeg-core.c Andrzej Pietrasi=
ewicz 2017-08-11  1610  		(ct->mode =3D=3D S5P_JPEG_DECODE &&
19dc3e08663767 drivers/media/platform/s5p-jpeg/jpeg-core.c Andrzej Pietrasi=
ewicz 2017-08-11 @1611  		q_data->fmt->fourcc !=3D V4L2_PIX_FMT_JPEG)) {
19dc3e08663767 drivers/media/platform/s5p-jpeg/jpeg-core.c Andrzej Pietrasi=
ewicz 2017-08-11  1612  		q_data->w =3D pix->width;
19dc3e08663767 drivers/media/platform/s5p-jpeg/jpeg-core.c Andrzej Pietrasi=
ewicz 2017-08-11  1613  		q_data->h =3D pix->height;
19dc3e08663767 drivers/media/platform/s5p-jpeg/jpeg-core.c Andrzej Pietrasi=
ewicz 2017-08-11  1614  	}
b2254d6fdd6c72 drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2014-04-10  1615  	if (q_data->fmt->fourcc !=3D V4L2_PIX_FMT_JPEG) {
b2254d6fdd6c72 drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2014-04-10  1616  		/*
b2254d6fdd6c72 drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2014-04-10  1617  		 * During encoding Exynos4x12 SoCs access wider m=
emory area
b2254d6fdd6c72 drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2014-04-10  1618  		 * than it results from Image_x and Image_y value=
s written to
b2254d6fdd6c72 drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2014-04-10  1619  		 * the JPEG_IMAGE_SIZE register. In order to avoi=
d sysmmu
b2254d6fdd6c72 drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2014-04-10  1620  		 * page fault calculate proper buffer size in suc=
h a case.
b2254d6fdd6c72 drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2014-04-10  1621  		 */
6c96dbbc2aa9f5 drivers/media/platform/s5p-jpeg/jpeg-core.c Andrzej Pietrasi=
ewicz 2015-09-18  1622  		if (ct->jpeg->variant->hw_ex4_compat &&
b2254d6fdd6c72 drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2014-04-10  1623  		    f_type =3D=3D FMT_TYPE_OUTPUT && ct->mode =3D=
=3D S5P_JPEG_ENCODE)
b2254d6fdd6c72 drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2014-04-10  1624  			q_data->size =3D exynos4_jpeg_get_output_buffer_=
size(ct,
b2254d6fdd6c72 drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2014-04-10  1625  							f,
b2254d6fdd6c72 drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2014-04-10  1626  							q_data->fmt->depth);
bb677f3ac434cb drivers/media/video/s5p-jpeg/jpeg-core.c    Andrzej Pietrasi=
ewicz 2011-11-24  1627  		else
b2254d6fdd6c72 drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2014-04-10  1628  			q_data->size =3D q_data->w * q_data->h *
b2254d6fdd6c72 drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2014-04-10  1629  						q_data->fmt->depth >> 3;
b2254d6fdd6c72 drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2014-04-10  1630  	} else {
bb677f3ac434cb drivers/media/video/s5p-jpeg/jpeg-core.c    Andrzej Pietrasi=
ewicz 2011-11-24  1631  		q_data->size =3D pix->sizeimage;
b2254d6fdd6c72 drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2014-04-10  1632  	}
bb677f3ac434cb drivers/media/video/s5p-jpeg/jpeg-core.c    Andrzej Pietrasi=
ewicz 2011-11-24  1633  =

4a30d30b87e5aa drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2013-11-21  1634  	if (f_type =3D=3D FMT_TYPE_OUTPUT) {
4a30d30b87e5aa drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2013-11-21  1635  		ctrl_subs =3D v4l2_ctrl_find(&ct->ctrl_handler,
4a30d30b87e5aa drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2013-11-21  1636  					V4L2_CID_JPEG_CHROMA_SUBSAMPLING);
4a30d30b87e5aa drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2013-11-21  1637  		if (ctrl_subs)
4a30d30b87e5aa drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2013-11-21  1638  			v4l2_ctrl_s_ctrl(ctrl_subs, q_data->fmt->subsamp=
ling);
dfd96900b29601 drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2014-07-11  1639  		ct->crop_altered =3D false;
dfd96900b29601 drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2014-07-11  1640  	}
dfd96900b29601 drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2014-07-11  1641  =

dfd96900b29601 drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2014-07-11  1642  	/*
dfd96900b29601 drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2014-07-11  1643  	 * For decoding init crop_rect with capture buffer=
 dimmensions which
dfd96900b29601 drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2014-07-11  1644  	 * contain aligned dimensions of the input JPEG im=
age and do it only
dfd96900b29601 drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2014-07-11  1645  	 * if crop rectangle hasn't been altered by the us=
er space e.g. with
dfd96900b29601 drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2014-07-11  1646  	 * S_SELECTION ioctl. For encoding assign output b=
uffer dimensions.
dfd96900b29601 drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2014-07-11  1647  	 */
dfd96900b29601 drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2014-07-11  1648  	if (!ct->crop_altered &&
dfd96900b29601 drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2014-07-11  1649  	    ((ct->mode =3D=3D S5P_JPEG_DECODE && f_type =
=3D=3D FMT_TYPE_CAPTURE) ||
dfd96900b29601 drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2014-07-11  1650  	     (ct->mode =3D=3D S5P_JPEG_ENCODE && f_type =
=3D=3D FMT_TYPE_OUTPUT))) {
dfd96900b29601 drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2014-07-11  1651  		ct->crop_rect.width =3D pix->width;
dfd96900b29601 drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2014-07-11  1652  		ct->crop_rect.height =3D pix->height;
dfd96900b29601 drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2014-07-11  1653  	}
5a71671af37275 drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2014-07-11  1654  =

5a71671af37275 drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2014-07-11  1655  	/*
5a71671af37275 drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2014-07-11  1656  	 * Prevent downscaling to YUV420 format by more th=
an 2
7c15fd4bf3d367 drivers/media/platform/s5p-jpeg/jpeg-core.c Andrzej Pietrasi=
ewicz 2015-03-09  1657  	 * for Exynos3250/compatible SoC as it produces br=
oken raw image
5a71671af37275 drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2014-07-11  1658  	 * in such cases.
5a71671af37275 drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2014-07-11  1659  	 */
5a71671af37275 drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2014-07-11  1660  	if (ct->mode =3D=3D S5P_JPEG_DECODE &&
5a71671af37275 drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2014-07-11  1661  	    f_type =3D=3D FMT_TYPE_CAPTURE &&
7c15fd4bf3d367 drivers/media/platform/s5p-jpeg/jpeg-core.c Andrzej Pietrasi=
ewicz 2015-03-09  1662  	    ct->jpeg->variant->hw3250_compat &&
5a71671af37275 drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2014-07-11  1663  	    pix->pixelformat =3D=3D V4L2_PIX_FMT_YUV420 &&
5a71671af37275 drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2014-07-11  1664  	    ct->scale_factor > 2) {
5a71671af37275 drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2014-07-11  1665  		scale_rect.width =3D ct->out_q.w / 2;
5a71671af37275 drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2014-07-11  1666  		scale_rect.height =3D ct->out_q.h / 2;
5a71671af37275 drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2014-07-11  1667  		exynos3250_jpeg_try_downscale(ct, &scale_rect);
4a30d30b87e5aa drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2013-11-21  1668  	}
4a30d30b87e5aa drivers/media/platform/s5p-jpeg/jpeg-core.c Jacek Anaszewski=
      2013-11-21  1669  =

bb677f3ac434cb drivers/media/video/s5p-jpeg/jpeg-core.c    Andrzej Pietrasi=
ewicz 2011-11-24  1670  	return 0;
bb677f3ac434cb drivers/media/video/s5p-jpeg/jpeg-core.c    Andrzej Pietrasi=
ewicz 2011-11-24  1671  }
bb677f3ac434cb drivers/media/video/s5p-jpeg/jpeg-core.c    Andrzej Pietrasi=
ewicz 2011-11-24  1672  =


:::::: The code at line 1448 was first introduced by commit
:::::: bb677f3ac434cb1708938f1e76a41d9098affd05 [media] Exynos4 JPEG codec =
v4l2 driver

:::::: TO: Andrzej Pietrasiewicz <andrzej.p@samsung.com>
:::::: CC: Mauro Carvalho Chehab <mchehab@redhat.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3572644703854250459==--

