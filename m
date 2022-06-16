Content-Type: multipart/mixed; boundary="===============4845566578219422206=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/media/platform/nxp/imx-pxp.c:1189:18: warning: dereference of NULL 'fmt' [CWE-476]
Date: Thu, 16 Jun 2022 21:47:11 +0800
Message-ID: <202206162111.DAGbfsUe-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4845566578219422206==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: drivers/m=
edia/platform/nxp/imx-pxp.c:1189:18: warning: dereference of NULL 'fmt' [CW=
E-476] [-Wanalyzer-null-dereference]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org
CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   30306f6194cadcc29c77f6ddcd416a75bf5c0232
commit: 46fb99951fe2c71adfd7f4ea4439af5ed5ebb7f7 media: platform: place NXP=
 drivers on a separate dir
date:   3 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 3 months ago
config: arm-randconfig-c002-20220615 (https://download.01.org/0day-ci/archi=
ve/20220616/202206162111.DAGbfsUe-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D46fb99951fe2c71adfd7f4ea4439af5ed5ebb7f7
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 46fb99951fe2c71adfd7f4ea4439af5ed5ebb7f7
        # save the config file
         ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


gcc-analyzer warnings: (new ones prefixed by >>)
   In function 'pxp_try_fmt_vid_cap':
>> drivers/media/platform/nxp/imx-pxp.c:1189:18: warning: dereference of NU=
LL 'fmt' [CWE-476] [-Wanalyzer-null-dereference]
    1189 |         if (!(fmt->types & MEM2MEM_CAPTURE)) {
         |               ~~~^~~~~~~
     'pxp_try_fmt_vid_cap': events 1-2
       |
       | 1178 | static int pxp_try_fmt_vid_cap(struct file *file, void *pri=
v,
       |      |            ^~~~~~~~~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 'pxp_try_fmt_vid_cap'
       |......
       | 1184 |         fmt =3D find_format(f);
       |      |               ~~~~~~~~~~~~~~
       |      |               |
       |      |               (2) calling 'find_format' from 'pxp_try_fmt_v=
id_cap'
       |
       +--> 'find_format': event 3
              |
              |  171 | static struct pxp_fmt *find_format(struct v4l2_forma=
t *f)
              |      |                        ^~~~~~~~~~~
              |      |                        |
              |      |                        (3) entry to 'find_format'
              |
            'find_format': events 4-6
              |
              |  176 |         for (k =3D 0; k < NUM_FORMATS; k++) {
              |  177 |                 fmt =3D &formats[k];
              |  178 |                 if (fmt->fourcc =3D=3D f->fmt.pix.pi=
xelformat)
              |      |                     ~~~~~~~~~~~
              |      |                        |
              |      |                        (5) ...to here
              |......
              |  182 |         if (k =3D=3D NUM_FORMATS)
              |      |            ~           =

              |      |            |
              |      |            (6) following 'true' branch (when 'k =3D=
=3D 20')...
              |
            'find_format': event 7
              |
              |cc1:
              | (7): ...to here
              |
       <------+
       |
     'pxp_try_fmt_vid_cap': events 8-11
       |
       | 1184 |         fmt =3D find_format(f);
       |      |               ^~~~~~~~~~~~~~
       |      |               |
       |      |               (8) return of NULL to 'pxp_try_fmt_vid_cap' f=
rom 'find_format'
       | 1185 |         if (!fmt) {
       |      |            ~   =

       |      |            |
       |      |            (9) following 'true' branch (when 'fmt' is NULL)=
...
       | 1186 |                 f->fmt.pix.pixelformat =3D formats[0].fourc=
c;
       |      |                                          ~~~~~~~~~~~~~~~~~
       |      |                                                    |
       |      |                                                    (10) ...=
to here
       | 1187 |                 fmt =3D find_format(f);
       |      |                       ~~~~~~~~~~~~~~
       |      |                       |
       |      |                       (11) calling 'find_format' from 'pxp_=
try_fmt_vid_cap'
       |
       +--> 'find_format': event 12
              |
              |  171 | static struct pxp_fmt *find_format(struct v4l2_forma=
t *f)
              |      |                        ^~~~~~~~~~~
              |      |                        |
              |      |                        (12) entry to 'find_format'
              |
            'find_format': events 13-15
              |
              |  176 |         for (k =3D 0; k < NUM_FORMATS; k++) {
              |  177 |                 fmt =3D &formats[k];
              |  178 |                 if (fmt->fourcc =3D=3D f->fmt.pix.pi=
xelformat)
              |      |                     ~~~~~~~~~~~
              |      |                        |
              |      |                        (14) ...to here
              |......
              |  182 |         if (k =3D=3D NUM_FORMATS)
              |      |            ~           =

              |      |            |
              |      |            (15) following 'true' branch (when 'k =3D=
=3D 20')...
              |
            'find_format': event 16
              |
              |cc1:
              | (16): ...to here
              |
       <------+
       |
     'pxp_try_fmt_vid_cap': events 17-18
       |
       | 1187 |                 fmt =3D find_format(f);
       |      |                       ^~~~~~~~~~~~~~
       |      |                       |
       |      |                       (17) return of NULL to 'pxp_try_fmt_v=
id_cap' from 'find_format'
       | 1188 |         }
       | 1189 |         if (!(fmt->types & MEM2MEM_CAPTURE)) {
       |      |               ~~~~~~~~~~
       |      |                  |
       |      |                  (18) dereference of NULL 'fmt'
--
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c: In function 'mxc_jpeg_by=
tesperline':
>> drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1207:19: warning: derefer=
ence of NULL '*ctx.out_q.fmt' [CWE-476] [-Wanalyzer-null-dereference]
    1207 |         if (q->fmt->fourcc =3D=3D V4L2_PIX_FMT_JPEG) {
         |             ~~~~~~^~~~~~~~
     'mxc_jpeg_set_default_params': events 1-2
       |
       | 1493 | static void mxc_jpeg_set_default_params(struct mxc_jpeg_ctx=
 *ctx)
       |      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |             |
       |      |             (1) entry to 'mxc_jpeg_set_default_params'
       |......
       | 1500 |         if (ctx->mxc_jpeg->mode =3D=3D MXC_JPEG_ENCODE) {
       |      |            ~ =

       |      |            |
       |      |            (2) following 'true' branch...
       |
     'mxc_jpeg_set_default_params': event 3
       |
       |cc1:
       | (3): ...to here
       |
     'mxc_jpeg_set_default_params': events 4-11
       |
       |  391 |         for (k =3D 0; k < MXC_JPEG_NUM_FORMATS; k++) {
       |      |                                               ~~~
       |      |                                                |
       |      |                                                (7) ...to he=
re
       |  392 |                 const struct mxc_jpeg_fmt *fmt =3D &mxc_for=
mats[k];
       |      |                                            ~~~
       |      |                                            |
       |      |                                            (5) ...to here
       |  393 | =

       |  394 |                 if (fmt->fourcc =3D=3D pixelformat)
       |      |                    ~   =

       |      |                    |
       |      |                    (6) following 'false' branch...
       |......
       | 1501 |                 out_q->fmt =3D mxc_jpeg_find_format(ctx, MX=
C_JPEG_DEFAULT_PFMT);
       |      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~
       |      |                            |
       |      |                            (8) '*ctx.out_q.fmt' is NULL
       |......
       | 1508 |         for (i =3D 0; i < 2; i++) {
       |      |                     ~~~~~
       |      |                       |
       |      |                       (9) following 'true' branch (when 'i =
!=3D 2')...
       | 1509 |                 q[i]->w =3D MXC_JPEG_DEFAULT_WIDTH;
       |      |                 ~~~~   =

       |      |                  |
       |      |                  (10) ...to here
       |......
       | 1513 |                 mxc_jpeg_bytesperline(q[i], 8);
       |      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                 |
       |      |                 (11) calling 'mxc_jpeg_bytesperline' from '=
mxc_jpeg_set_default_params'
       |
       +--> 'mxc_jpeg_bytesperline': events 12-14
              |
              | 1203 | static void mxc_jpeg_bytesperline(struct mxc_jpeg_q_=
data *q,
              |      |             ^~~~~~~~~~~~~~~~~~~~~
              |      |             |
              |      |             (12) entry to 'mxc_jpeg_bytesperline'
              |......
              | 1207 |         if (q->fmt->fourcc =3D=3D V4L2_PIX_FMT_JPEG)=
 {
              |      |             ~~~~~~~~~~~~~~
              |      |              |    |
              |      |              |    (14) dereference of NULL '*q.fmt'
              |      |              (13) '*ctx.out_q.fmt' is NULL
              |
>> drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1207:19: warning: derefer=
ence of NULL 'tmp_q.fmt' [CWE-476] [-Wanalyzer-null-dereference]
    1207 |         if (q->fmt->fourcc =3D=3D V4L2_PIX_FMT_JPEG) {
         |             ~~~~~~^~~~~~~~
     'mxc_jpeg_try_fmt_vid_out': events 1-2
       |
       | 1711 | static int mxc_jpeg_try_fmt_vid_out(struct file *file, void=
 *priv,
       |      |            ^~~~~~~~~~~~~~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 'mxc_jpeg_try_fmt_vid_out'
       |......
       | 1723 |         if (!V4L2_TYPE_IS_MULTIPLANAR(f->type)) {
       |      |            ~
       |      |            |
       |      |            (2) following 'false' branch...
       |
     'mxc_jpeg_try_fmt_vid_out': event 3
       |
       |cc1:
       | (3): ...to here
       |
     'mxc_jpeg_try_fmt_vid_out': events 4-6
       |
       |  391 |         for (k =3D 0; k < MXC_JPEG_NUM_FORMATS; k++) {
       |  392 |                 const struct mxc_jpeg_fmt *fmt =3D &mxc_for=
mats[k];
       |      |                                            ~~~
       |      |                                            |
       |      |                                            (5) ...to here
       |......
       | 1729 |         if (!fmt || fmt->flags !=3D q_type) {
       |      |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                  |
       |      |                  (6) following 'true' branch...
       |
     'mxc_jpeg_try_fmt_vid_out': event 7
       |
       | 1736 |                                 MXC_JPEG_DEFAULT_PFMT : V4L=
2_PIX_FMT_JPEG;
       |
     'mxc_jpeg_try_fmt_vid_out': events 8-12
       |
       |  391 |         for (k =3D 0; k < MXC_JPEG_NUM_FORMATS; k++) {
       |      |                                               ~~~
       |      |                                                |
       |      |                                                (11) ...to h=
ere
       |  392 |                 const struct mxc_jpeg_fmt *fmt =3D &mxc_for=
mats[k];
       |      |                                            ~~~
       |      |                                            |
       |      |                                            (9) ...to here
       |  393 | =

       |  394 |                 if (fmt->fourcc =3D=3D pixelformat)
       |      |                    ~   =

       |      |                    |
       |      |                    (10) following 'false' branch...
       |......
       | 1739 |         return mxc_jpeg_try_fmt(f, fmt, ctx, q_type);
       |      |                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                |
       |      |                (12) calling 'mxc_jpeg_try_fmt' from 'mxc_jp=
eg_try_fmt_vid_out'
       |
       +--> 'mxc_jpeg_try_fmt': events 13-14
              |
              | 1610 | static int mxc_jpeg_try_fmt(struct v4l2_format *f, c=
onst struct mxc_jpeg_fmt *fmt,
              |      |            ^~~~~~~~~~~~~~~~
              |      |            |
              |      |            (13) entry to 'mxc_jpeg_try_fmt'
              |......
              | 1655 |         mxc_jpeg_bytesperline(&tmp_q, 8);
              |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |         |
              |      |         (14) calling 'mxc_jpeg_bytesperline' from 'm=
xc_jpeg_try_fmt'
              |
              +--> 'mxc_jpeg_bytesperline': events 15-17
                     |
                     | 1203 | static void mxc_jpeg_bytesperline(struct mxc_=
jpeg_q_data *q,
                     |      |             ^~~~~~~~~~~~~~~~~~~~~
                     |      |             |
                     |      |             (15) entry to 'mxc_jpeg_bytesperl=
ine'
                     |......
                     | 1207 |         if (q->fmt->fourcc =3D=3D V4L2_PIX_FM=
T_JPEG) {
                     |      |             ~~~~~~~~~~~~~~
                     |      |              |    |
                     |      |              |    (17) dereference of NULL '*=
q.fmt'
                     |      |              (16) 'tmp_q.fmt' is NULL
                     |
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c: In function 'mxc_jpeg_si=
zeimage':
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1229:19: warning: derefer=
ence of NULL '*ctx.out_q.fmt' [CWE-476] [-Wanalyzer-null-dereference]
    1229 |         if (q->fmt->fourcc =3D=3D V4L2_PIX_FMT_JPEG) {
         |             ~~~~~~^~~~~~~~
     'mxc_jpeg_set_default_params': events 1-2
       |
       | 1493 | static void mxc_jpeg_set_default_params(struct mxc_jpeg_ctx=
 *ctx)
       |      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |             |
       |      |             (1) entry to 'mxc_jpeg_set_default_params'
       |......
       | 1500 |         if (ctx->mxc_jpeg->mode =3D=3D MXC_JPEG_ENCODE) {
       |      |            ~ =

       |      |            |
       |      |            (2) following 'true' branch...
       |
     'mxc_jpeg_set_default_params': event 3
       |
--
       |......
       | 1723 |         if (!V4L2_TYPE_IS_MULTIPLANAR(f->type)) {
       |      |            ~
       |      |            |
       |      |            (2) following 'false' branch...
       |
     'mxc_jpeg_try_fmt_vid_out': event 3
       |
       |cc1:
       | (3): ...to here
       |
     'mxc_jpeg_try_fmt_vid_out': events 4-6
       |
       |  391 |         for (k =3D 0; k < MXC_JPEG_NUM_FORMATS; k++) {
       |  392 |                 const struct mxc_jpeg_fmt *fmt =3D &mxc_for=
mats[k];
       |      |                                            ~~~
       |      |                                            |
       |      |                                            (5) ...to here
       |......
       | 1729 |         if (!fmt || fmt->flags !=3D q_type) {
       |      |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                  |
       |      |                  (6) following 'true' branch...
       |
     'mxc_jpeg_try_fmt_vid_out': event 7
       |
       | 1736 |                                 MXC_JPEG_DEFAULT_PFMT : V4L=
2_PIX_FMT_JPEG;
       |
     'mxc_jpeg_try_fmt_vid_out': events 8-12
       |
       |  391 |         for (k =3D 0; k < MXC_JPEG_NUM_FORMATS; k++) {
       |      |                                               ~~~
       |      |                                                |
       |      |                                                (11) ...to h=
ere
       |  392 |                 const struct mxc_jpeg_fmt *fmt =3D &mxc_for=
mats[k];
       |      |                                            ~~~
       |      |                                            |
       |      |                                            (9) ...to here
       |  393 | =

       |  394 |                 if (fmt->fourcc =3D=3D pixelformat)
       |      |                    ~   =

       |      |                    |
       |      |                    (10) following 'false' branch...
       |......
       | 1739 |         return mxc_jpeg_try_fmt(f, fmt, ctx, q_type);
       |      |                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                |
       |      |                (12) calling 'mxc_jpeg_try_fmt' from 'mxc_jp=
eg_try_fmt_vid_out'
       |
       +--> 'mxc_jpeg_try_fmt': events 13-14
              |
              | 1610 | static int mxc_jpeg_try_fmt(struct v4l2_format *f, c=
onst struct mxc_jpeg_fmt *fmt,
              |      |            ^~~~~~~~~~~~~~~~
              |      |            |
              |      |            (13) entry to 'mxc_jpeg_try_fmt'
              |......
              | 1655 |         mxc_jpeg_bytesperline(&tmp_q, 8);
              |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |         |
              |      |         (14) calling 'mxc_jpeg_bytesperline' from 'm=
xc_jpeg_try_fmt'
              |
              +--> 'mxc_jpeg_bytesperline': events 15-16
                     |
                     | 1203 | static void mxc_jpeg_bytesperline(struct mxc_=
jpeg_q_data *q,
                     |      |             ^~~~~~~~~~~~~~~~~~~~~
                     |      |             |
                     |      |             (15) entry to 'mxc_jpeg_bytesperl=
ine'
                     |......
                     | 1207 |         if (q->fmt->fourcc =3D=3D V4L2_PIX_FM=
T_JPEG) {
                     |      |             ~~~~~~
                     |      |              |
                     |      |              (16) 'tmp_q.fmt' is NULL
                     |
              <------+
              |
            'mxc_jpeg_try_fmt': events 17-18
              |
              | 1655 |         mxc_jpeg_bytesperline(&tmp_q, 8);
              |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |         |
              |      |         (17) returning to 'mxc_jpeg_try_fmt' from 'm=
xc_jpeg_bytesperline'
              | 1656 |         mxc_jpeg_sizeimage(&tmp_q);
              |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |         |
              |      |         (18) calling 'mxc_jpeg_sizeimage' from 'mxc_=
jpeg_try_fmt'
              |
              +--> 'mxc_jpeg_sizeimage': events 19-21
                     |
                     | 1227 | static void mxc_jpeg_sizeimage(struct mxc_jpe=
g_q_data *q)
                     |      |             ^~~~~~~~~~~~~~~~~~
                     |      |             |
                     |      |             (19) entry to 'mxc_jpeg_sizeimage'
                     | 1228 | {
                     | 1229 |         if (q->fmt->fourcc =3D=3D V4L2_PIX_FM=
T_JPEG) {
                     |      |             ~~~~~~~~~~~~~~
                     |      |              |    |
                     |      |              |    (21) dereference of NULL '*=
q.fmt'
                     |      |              (20) 'tmp_q.fmt' is NULL
                     |
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c: In function 'mxc_jpeg_tr=
y_fmt':
>> drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1624:33: warning: derefer=
ence of NULL 'fmt' [CWE-476] [-Wanalyzer-null-dereference]
    1624 |         pix_mp->num_planes =3D fmt->colplanes;
         |                              ~~~^~~~~~~~~~~
     'mxc_jpeg_try_fmt_vid_out': events 1-2
       |
       | 1711 | static int mxc_jpeg_try_fmt_vid_out(struct file *file, void=
 *priv,
       |      |            ^~~~~~~~~~~~~~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 'mxc_jpeg_try_fmt_vid_out'
       |......
       | 1723 |         if (!V4L2_TYPE_IS_MULTIPLANAR(f->type)) {
       |      |            ~
       |      |            |
       |      |            (2) following 'false' branch...
       |
     'mxc_jpeg_try_fmt_vid_out': event 3
       |
       |cc1:
       | (3): ...to here
       |
     'mxc_jpeg_try_fmt_vid_out': events 4-6
       |
       |  391 |         for (k =3D 0; k < MXC_JPEG_NUM_FORMATS; k++) {
       |  392 |                 const struct mxc_jpeg_fmt *fmt =3D &mxc_for=
mats[k];
       |      |                                            ~~~
       |      |                                            |
       |      |                                            (5) ...to here
       |......
       | 1729 |         if (!fmt || fmt->flags !=3D q_type) {
       |      |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                  |
       |      |                  (6) following 'true' branch...
       |
     'mxc_jpeg_try_fmt_vid_out': event 7
       |
       | 1736 |                                 MXC_JPEG_DEFAULT_PFMT : V4L=
2_PIX_FMT_JPEG;
       |
     'mxc_jpeg_try_fmt_vid_out': events 8-12
       |
       |  391 |         for (k =3D 0; k < MXC_JPEG_NUM_FORMATS; k++) {
       |      |                                               ~~~
       |      |                                                |
       |      |                                                (11) ...to h=
ere
       |  392 |                 const struct mxc_jpeg_fmt *fmt =3D &mxc_for=
mats[k];
       |      |                                            ~~~
       |      |                                            |
       |      |                                            (9) ...to here
       |  393 | =

       |  394 |                 if (fmt->fourcc =3D=3D pixelformat)
       |      |                    ~   =

       |      |                    |
       |      |                    (10) following 'false' branch...
       |......
       | 1739 |         return mxc_jpeg_try_fmt(f, fmt, ctx, q_type);
       |      |                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                |
       |      |                (12) calling 'mxc_jpeg_try_fmt' from 'mxc_jp=
eg_try_fmt_vid_out'
       |
       +--> 'mxc_jpeg_try_fmt': events 13-14
              |
              | 1610 | static int mxc_jpeg_try_fmt(struct v4l2_format *f, c=
onst struct mxc_jpeg_fmt *fmt,
              |      |            ^~~~~~~~~~~~~~~~
              |      |            |
              |      |            (13) entry to 'mxc_jpeg_try_fmt'
              |......
              | 1624 |         pix_mp->num_planes =3D fmt->colplanes;
              |      |                              ~~~~~~~~~~~~~~
              |      |                                 |
              |      |                                 (14) dereference of =
NULL 'fmt'
              |
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c: In function 'mxc_jpeg_s_=
fmt':
   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1776:50: warning: derefer=
ence of NULL '*ctx.out_q.fmt' [CWE-476] [-Wanalyzer-null-dereference]
    1776 |                                       q_data->fmt->h_align,
         |                                       ~~~~~~~~~~~^~~~~~~~~
     'mxc_jpeg_s_fmt': events 1-4
       |
       | 1742 | static int mxc_jpeg_s_fmt(struct mxc_jpeg_ctx *ctx,
       |      |            ^~~~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 'mxc_jpeg_s_fmt'
       |......
       | 1752 |         if (!vq)
       |      |            ~
       |      |            |
       |      |            (2) following 'false' branch (when 'vq' is non-N=
ULL)...
       |......
       | 1755 |         q_data =3D mxc_jpeg_get_q_data(ctx, f->type);
       |      |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                  |                         |
       |      |                  |                         (3) ...to here
       |      |                  (4) calling 'mxc_jpeg_get_q_data' from 'mx=
c_jpeg_s_fmt'
       |
       +--> 'mxc_jpeg_get_q_data': event 5
              |
              |  420 | static struct mxc_jpeg_q_data *mxc_jpeg_get_q_data(s=
truct mxc_jpeg_ctx *ctx,
              |      |                                ^~~~~~~~~~~~~~~~~~~
              |      |                                |
              |      |                                (5) entry to 'mxc_jpe=
g_get_q_data'
              |
            'mxc_jpeg_get_q_data': event 6
              |
              |cc1:
              | (6): following 'default:' branch...
              |
            'mxc_jpeg_get_q_data': event 7
              |
              |  424 |                 return &ctx->out_q;
              |      |                        ^~~~~~~~~~~
              |      |                        |
              |      |                        (7) ...to here
              |
       <------+
       |
     'mxc_jpeg_s_fmt': events 8-10
       |
       | 1755 |         q_data =3D mxc_jpeg_get_q_data(ctx, f->type);
       |      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                  |
       |      |                  (8) returning to 'mxc_jpeg_s_fmt' from 'mx=
c_jpeg_get_q_data'
       | 1756 | =

       | 1757 |         if (vb2_is_busy(vq)) {
       |      |            ~      =

       |      |            |
       |      |            (9) following 'false' branch...
       |......
       | 1762 |         q_data->fmt =3D mxc_jpeg_find_format(ctx, pix_mp->p=
ixelformat);
       |      |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
       |      |                       |
       |      |                       (10) ...to here
       |
     'mxc_jpeg_s_fmt': events 11-18
       |
       |  391 |         for (k =3D 0; k < MXC_JPEG_NUM_FORMATS; k++) {
       |      |                                               ~~~
       |      |                                                |
       |      |                                                (14) ...to h=
ere
       |  392 |                 const struct mxc_jpeg_fmt *fmt =3D &mxc_for=
mats[k];
       |      |                                            ~~~
       |      |                                            |
       |      |                                            (12) ...to here
       |  393 | =

       |  394 |                 if (fmt->fourcc =3D=3D pixelformat)
       |      |                    ~   =

       |      |                    |
       |      |                    (13) following 'false' branch...
       |......
       | 1762 |         q_data->fmt =3D mxc_jpeg_find_format(ctx, pix_mp->p=
ixelformat);
       |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
       |      |                     |
       |      |                     (15) '*ctx.out_q.fmt' is NULL
       |......
       | 1768 |         if (jpeg->mode =3D=3D MXC_JPEG_DECODE) {
       |      |            ~           =

       |      |            |
       |      |            (16) following 'true' branch...
       |......
       | 1773 |                 v4l_bound_align_image(&q_data->w_adjusted,
       |      |                                       ~~~~~~~~~~~~~~~~~~~
       |      |                                       |
       |      |                                       (17) ...to here
       |......
       | 1776 |                                       q_data->fmt->h_align,
       |      |                                       ~~~~~~~~~~~~~~~~~~~~
       |      |                                                  |
       |      |                                                  (18) deref=
erence of NULL '<unknown>'
       |
>> drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1776:50: warning: derefer=
ence of NULL '*ctx.cap_q.fmt' [CWE-476] [-Wanalyzer-null-dereference]
    1776 |                                       q_data->fmt->h_align,
         |                                       ~~~~~~~~~~~^~~~~~~~~
     'mxc_jpeg_s_fmt': events 1-4
       |
       | 1742 | static int mxc_jpeg_s_fmt(struct mxc_jpeg_ctx *ctx,
       |      |            ^~~~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 'mxc_jpeg_s_fmt'
       |......
       | 1752 |         if (!vq)
       |      |            ~
       |      |            |
       |      |            (2) following 'false' branch (when 'vq' is non-N=
ULL)...
       |......
       | 1755 |         q_data =3D mxc_jpeg_get_q_data(ctx, f->type);
       |      |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                  |                         |
       |      |                  |                         (3) ...to here
       |      |                  (4) calling 'mxc_jpeg_get_q_data' from 'mx=
c_jpeg_s_fmt'
       |
       +--> 'mxc_jpeg_get_q_data': event 5
              |
              |  420 | static struct mxc_jpeg_q_data *mxc_jpeg_get_q_data(s=
truct mxc_jpeg_ctx *ctx,
              |      |                                ^~~~~~~~~~~~~~~~~~~
              |      |                                |
              |      |                                (5) entry to 'mxc_jpe=
g_get_q_data'
              |
            'mxc_jpeg_get_q_data': event 6
              |
              |cc1:
              | (6): following 'case 2 ... 3:' branch...
              |
            'mxc_jpeg_get_q_data': event 7
              |
              |  425 |         return &ctx->cap_q;
              |      |                ^~~~~~~~~~~
              |      |                |
              |      |                (7) ...to here
              |
       <------+
       |
     'mxc_jpeg_s_fmt': events 8-10
       |
       | 1755 |         q_data =3D mxc_jpeg_get_q_data(ctx, f->type);
       |      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                  |
       |      |                  (8) returning to 'mxc_jpeg_s_fmt' from 'mx=
c_jpeg_get_q_data'
       | 1756 | =

       | 1757 |         if (vb2_is_busy(vq)) {
       |      |            ~      =

       |      |            |
       |      |            (9) following 'false' branch...
       |......
       | 1762 |         q_data->fmt =3D mxc_jpeg_find_format(ctx, pix_mp->p=
ixelformat);
       |      |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
       |      |                       |
       |      |                       (10) ...to here
       |
     'mxc_jpeg_s_fmt': events 11-18
       |
       |  391 |         for (k =3D 0; k < MXC_JPEG_NUM_FORMATS; k++) {
       |      |                                               ~~~
       |      |                                                |
       |      |                                                (14) ...to h=
ere
       |  392 |                 const struct mxc_jpeg_fmt *fmt =3D &mxc_for=
mats[k];
       |      |                                            ~~~
       |      |                                            |
       |      |                                            (12) ...to here
       |  393 | =

       |  394 |                 if (fmt->fourcc =3D=3D pixelformat)
       |      |                    ~   =

       |      |                    |
       |      |                    (13) following 'false' branch...
       |......
       | 1762 |         q_data->fmt =3D mxc_jpeg_find_format(ctx, pix_mp->p=
ixelformat);
       |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
       |      |                     |
       |      |                     (15) '*ctx.cap_q.fmt' is NULL
       |......
       | 1768 |         if (jpeg->mode =3D=3D MXC_JPEG_DECODE) {
       |      |            ~           =

       |      |            |
       |      |            (16) following 'true' branch...
       |......
       | 1773 |                 v4l_bound_align_image(&q_data->w_adjusted,
       |      |                                       ~~~~~~~~~~~~~~~~~~~
       |      |                                       |
       |      |                                       (17) ...to here
       |......
       | 1776 |                                       q_data->fmt->h_align,
       |      |                                       ~~~~~~~~~~~~~~~~~~~~
       |      |                                                  |
       |      |                                                  (18) deref=
erence of NULL '<unknown>'
       |
>> drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:1776:50: warning: derefer=
ence of NULL '0' [CWE-476] [-Wanalyzer-null-dereference]
    1776 |                                       q_data->fmt->h_align,
         |                                       ~~~~~~~~~~~^~~~~~~~~
     'mxc_jpeg_s_fmt_vid_cap.part.0': events 1-2
       |
       | 1806 | static int mxc_jpeg_s_fmt_vid_cap(struct file *file, void *=
priv,
       |      |            ^~~~~~~~~~~~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 'mxc_jpeg_s_fmt_vid_cap.part.0'
       |......
       | 1815 |         return mxc_jpeg_s_fmt(mxc_jpeg_fh_to_ctx(priv), f);
       |      |                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                |
       |      |                (2) calling 'mxc_jpeg_s_fmt' from 'mxc_jpeg_=
s_fmt_vid_cap.part.0'
       |
       +--> 'mxc_jpeg_s_fmt': events 3-6
              |
              | 1742 | static int mxc_jpeg_s_fmt(struct mxc_jpeg_ctx *ctx,
              |      |            ^~~~~~~~~~~~~~
              |      |            |
              |      |            (3) entry to 'mxc_jpeg_s_fmt'
              |......
              | 1752 |         if (!vq)
              |      |            ~
              |      |            |
              |      |            (4) following 'false' branch (when 'vq' i=
s non-NULL)...
              |......
              | 1755 |         q_data =3D mxc_jpeg_get_q_data(ctx, f->type);
              |      |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |                  |                         |
              |      |                  |                         (5) ...to=
 here
              |      |                  (6) calling 'mxc_jpeg_get_q_data' f=
rom 'mxc_jpeg_s_fmt'
              |
              +--> 'mxc_jpeg_get_q_data': event 7
                     |
                     |  420 | static struct mxc_jpeg_q_data *mxc_jpeg_get_q=
_data(struct mxc_jpeg_ctx *ctx,
                     |      |                                ^~~~~~~~~~~~~~=
~~~~~
                     |      |                                |
                     |      |                                (7) entry to '=
mxc_jpeg_get_q_data'
                     |
                   'mxc_jpeg_get_q_data': event 8
                     |
                     |cc1:
                     | (8): following 'default:' branch...
                     |
                   'mxc_jpeg_get_q_data': event 9
                     |
                     |  424 |                 return &ctx->out_q;
                     |      |                        ^~~~~~~~~~~
                     |      |                        |
                     |      |                        (9) ...to here
                     |
              <------+
              |
            'mxc_jpeg_s_fmt': events 10-12
              |
              | 1755 |         q_data =3D mxc_jpeg_get_q_data(ctx, f->type);
              |      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |                  |
              |      |                  (10) returning to 'mxc_jpeg_s_fmt' =
from 'mxc_jpeg_get_q_data'
              | 1756 | =

              | 1757 |         if (vb2_is_busy(vq)) {
              |      |            ~      =

              |      |            |
              |      |            (11) following 'false' branch...
              |......
              | 1762 |         q_data->fmt =3D mxc_jpeg_find_format(ctx, pi=
x_mp->pixelformat);
              |      |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~
              |      |                       |
              |      |                       (12) ...to here
              |
            'mxc_jpeg_s_fmt': events 13-20
              |
              |  391 |         for (k =3D 0; k < MXC_JPEG_NUM_FORMATS; k++)=
 {
              |      |                                               ~~~
              |      |                                                |
              |      |                                                (16) =
...to here
              |  392 |                 const struct mxc_jpeg_fmt *fmt =3D &=
mxc_formats[k];
              |      |                                            ~~~
              |      |                                            |
              |      |                                            (14) ...t=
o here
              |  393 | =

              |  394 |                 if (fmt->fourcc =3D=3D pixelformat)
              |      |                    ~   =

              |      |                    |
              |      |                    (15) following 'false' branch...
              |......
              | 1762 |         q_data->fmt =3D mxc_jpeg_find_format(ctx, pi=
x_mp->pixelformat);
              |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~
              |      |                     |
              |      |                     (17) '0' is NULL
              |......
              | 1768 |         if (jpeg->mode =3D=3D MXC_JPEG_DECODE) {
              |      |            ~           =

              |      |            |
              |      |            (18) following 'true' branch...
              |......
              | 1773 |                 v4l_bound_align_image(&q_data->w_adj=
usted,
              |      |                                       ~~~~~~~~~~~~~~=
~~~~~
              |      |                                       |
              |      |                                       (19) ...to here

vim +/fmt +1189 drivers/media/platform/nxp/imx-pxp.c

51abcf7fdb70b8 drivers/media/platform/imx-pxp.c Philipp Zabel 2018-09-06  1=
177  =

51abcf7fdb70b8 drivers/media/platform/imx-pxp.c Philipp Zabel 2018-09-06  1=
178  static int pxp_try_fmt_vid_cap(struct file *file, void *priv,
51abcf7fdb70b8 drivers/media/platform/imx-pxp.c Philipp Zabel 2018-09-06  1=
179  			       struct v4l2_format *f)
51abcf7fdb70b8 drivers/media/platform/imx-pxp.c Philipp Zabel 2018-09-06  1=
180  {
51abcf7fdb70b8 drivers/media/platform/imx-pxp.c Philipp Zabel 2018-09-06  1=
181  	struct pxp_fmt *fmt;
51abcf7fdb70b8 drivers/media/platform/imx-pxp.c Philipp Zabel 2018-09-06  1=
182  	struct pxp_ctx *ctx =3D file2ctx(file);
51abcf7fdb70b8 drivers/media/platform/imx-pxp.c Philipp Zabel 2018-09-06  1=
183  =

51abcf7fdb70b8 drivers/media/platform/imx-pxp.c Philipp Zabel 2018-09-06  1=
184  	fmt =3D find_format(f);
51abcf7fdb70b8 drivers/media/platform/imx-pxp.c Philipp Zabel 2018-09-06  1=
185  	if (!fmt) {
51abcf7fdb70b8 drivers/media/platform/imx-pxp.c Philipp Zabel 2018-09-06  1=
186  		f->fmt.pix.pixelformat =3D formats[0].fourcc;
51abcf7fdb70b8 drivers/media/platform/imx-pxp.c Philipp Zabel 2018-09-06  1=
187  		fmt =3D find_format(f);
51abcf7fdb70b8 drivers/media/platform/imx-pxp.c Philipp Zabel 2018-09-06  1=
188  	}
51abcf7fdb70b8 drivers/media/platform/imx-pxp.c Philipp Zabel 2018-09-06 @1=
189  	if (!(fmt->types & MEM2MEM_CAPTURE)) {
51abcf7fdb70b8 drivers/media/platform/imx-pxp.c Philipp Zabel 2018-09-06  1=
190  		v4l2_err(&ctx->dev->v4l2_dev,
51abcf7fdb70b8 drivers/media/platform/imx-pxp.c Philipp Zabel 2018-09-06  1=
191  			 "Fourcc format (0x%08x) invalid.\n",
51abcf7fdb70b8 drivers/media/platform/imx-pxp.c Philipp Zabel 2018-09-06  1=
192  			 f->fmt.pix.pixelformat);
51abcf7fdb70b8 drivers/media/platform/imx-pxp.c Philipp Zabel 2018-09-06  1=
193  		return -EINVAL;
51abcf7fdb70b8 drivers/media/platform/imx-pxp.c Philipp Zabel 2018-09-06  1=
194  	}
51abcf7fdb70b8 drivers/media/platform/imx-pxp.c Philipp Zabel 2018-09-06  1=
195  =

51abcf7fdb70b8 drivers/media/platform/imx-pxp.c Philipp Zabel 2018-09-06  1=
196  	f->fmt.pix.colorspace =3D ctx->colorspace;
51abcf7fdb70b8 drivers/media/platform/imx-pxp.c Philipp Zabel 2018-09-06  1=
197  	f->fmt.pix.xfer_func =3D ctx->xfer_func;
51abcf7fdb70b8 drivers/media/platform/imx-pxp.c Philipp Zabel 2018-09-06  1=
198  =

51abcf7fdb70b8 drivers/media/platform/imx-pxp.c Philipp Zabel 2018-09-06  1=
199  	pxp_fixup_colorimetry_cap(ctx, fmt->fourcc,
51abcf7fdb70b8 drivers/media/platform/imx-pxp.c Philipp Zabel 2018-09-06  1=
200  				  &f->fmt.pix.ycbcr_enc,
51abcf7fdb70b8 drivers/media/platform/imx-pxp.c Philipp Zabel 2018-09-06  1=
201  				  &f->fmt.pix.quantization);
51abcf7fdb70b8 drivers/media/platform/imx-pxp.c Philipp Zabel 2018-09-06  1=
202  =

51abcf7fdb70b8 drivers/media/platform/imx-pxp.c Philipp Zabel 2018-09-06  1=
203  	return pxp_try_fmt(f, fmt);
51abcf7fdb70b8 drivers/media/platform/imx-pxp.c Philipp Zabel 2018-09-06  1=
204  }
51abcf7fdb70b8 drivers/media/platform/imx-pxp.c Philipp Zabel 2018-09-06  1=
205  =


:::::: The code at line 1189 was first introduced by commit
:::::: 51abcf7fdb70b82b7f8a7c177271f29aed9866bd media: imx-pxp: add i.MX Pi=
xel Pipeline driver

:::::: TO: Philipp Zabel <p.zabel@pengutronix.de>
:::::: CC: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4845566578219422206==--

