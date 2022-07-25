Content-Type: multipart/mixed; boundary="===============3017159832795733351=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/media/platform/samsung/s5p-g2d/g2d.c:103 g2d_queue_setup() warn: passing a valid pointer to 'PTR_ERR'
Date: Mon, 25 Jul 2022 16:58:25 +0000
Message-ID: <202207240407.Rq1teGyc-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3017159832795733351==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   515f71412bb73ebd7f41f90e1684fc80b8730789
commit: a7f3b2d32dabd8e59854ec39ba257050b5e4949e media: platform: rename s5=
p-g2d/ to samsung/s5p-g2d/
date:   4 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 4 months ago
config: xtensa-randconfig-m041-20220721 (https://download.01.org/0day-ci/ar=
chive/20220724/202207240407.Rq1teGyc-lkp(a)intel.com/config)
compiler: xtensa-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/media/platform/samsung/s5p-g2d/g2d.c:103 g2d_queue_setup() warn: pa=
ssing a valid pointer to 'PTR_ERR'
drivers/media/platform/samsung/s5p-g2d/g2d.c:120 g2d_buf_prepare() warn: pa=
ssing a valid pointer to 'PTR_ERR'
drivers/media/platform/samsung/s5p-g2d/g2d.c:319 vidioc_g_fmt() warn: passi=
ng a valid pointer to 'PTR_ERR'
drivers/media/platform/samsung/s5p-g2d/g2d.c:381 vidioc_s_fmt() warn: passi=
ng a valid pointer to 'PTR_ERR'
drivers/media/platform/samsung/s5p-g2d/g2d.c:408 vidioc_g_selection() warn:=
 passing a valid pointer to 'PTR_ERR'
drivers/media/platform/samsung/s5p-g2d/g2d.c:459 vidioc_try_selection() war=
n: passing a valid pointer to 'PTR_ERR'
drivers/media/platform/samsung/s5p-g2d/g2d.c:490 vidioc_s_selection() warn:=
 passing a valid pointer to 'PTR_ERR'

vim +/PTR_ERR +103 drivers/media/platform/samsung/s5p-g2d/g2d.c

918847341af0f5f drivers/media/video/s5p-g2d/g2d.c    Kamil Debski 2011-10-0=
6   94  =

df9ecb0cad14b95 drivers/media/platform/s5p-g2d/g2d.c Hans Verkuil 2015-10-2=
8   95  static int g2d_queue_setup(struct vb2_queue *vq,
918847341af0f5f drivers/media/video/s5p-g2d/g2d.c    Kamil Debski 2011-10-0=
6   96  			   unsigned int *nbuffers, unsigned int *nplanes,
36c0f8b32c4bd4f drivers/media/platform/s5p-g2d/g2d.c Hans Verkuil 2016-04-1=
5   97  			   unsigned int sizes[], struct device *alloc_devs[])
918847341af0f5f drivers/media/video/s5p-g2d/g2d.c    Kamil Debski 2011-10-0=
6   98  {
918847341af0f5f drivers/media/video/s5p-g2d/g2d.c    Kamil Debski 2011-10-0=
6   99  	struct g2d_ctx *ctx =3D vb2_get_drv_priv(vq);
918847341af0f5f drivers/media/video/s5p-g2d/g2d.c    Kamil Debski 2011-10-0=
6  100  	struct g2d_frame *f =3D get_frame(ctx, vq->type);
918847341af0f5f drivers/media/video/s5p-g2d/g2d.c    Kamil Debski 2011-10-0=
6  101  =

918847341af0f5f drivers/media/video/s5p-g2d/g2d.c    Kamil Debski 2011-10-0=
6  102  	if (IS_ERR(f))
918847341af0f5f drivers/media/video/s5p-g2d/g2d.c    Kamil Debski 2011-10-0=
6 @103  		return PTR_ERR(f);
918847341af0f5f drivers/media/video/s5p-g2d/g2d.c    Kamil Debski 2011-10-0=
6  104  =

918847341af0f5f drivers/media/video/s5p-g2d/g2d.c    Kamil Debski 2011-10-0=
6  105  	sizes[0] =3D f->size;
918847341af0f5f drivers/media/video/s5p-g2d/g2d.c    Kamil Debski 2011-10-0=
6  106  	*nplanes =3D 1;
918847341af0f5f drivers/media/video/s5p-g2d/g2d.c    Kamil Debski 2011-10-0=
6  107  =

918847341af0f5f drivers/media/video/s5p-g2d/g2d.c    Kamil Debski 2011-10-0=
6  108  	if (*nbuffers =3D=3D 0)
918847341af0f5f drivers/media/video/s5p-g2d/g2d.c    Kamil Debski 2011-10-0=
6  109  		*nbuffers =3D 1;
918847341af0f5f drivers/media/video/s5p-g2d/g2d.c    Kamil Debski 2011-10-0=
6  110  =

918847341af0f5f drivers/media/video/s5p-g2d/g2d.c    Kamil Debski 2011-10-0=
6  111  	return 0;
918847341af0f5f drivers/media/video/s5p-g2d/g2d.c    Kamil Debski 2011-10-0=
6  112  }
918847341af0f5f drivers/media/video/s5p-g2d/g2d.c    Kamil Debski 2011-10-0=
6  113  =

918847341af0f5f drivers/media/video/s5p-g2d/g2d.c    Kamil Debski 2011-10-0=
6  114  static int g2d_buf_prepare(struct vb2_buffer *vb)
918847341af0f5f drivers/media/video/s5p-g2d/g2d.c    Kamil Debski 2011-10-0=
6  115  {
918847341af0f5f drivers/media/video/s5p-g2d/g2d.c    Kamil Debski 2011-10-0=
6  116  	struct g2d_ctx *ctx =3D vb2_get_drv_priv(vb->vb2_queue);
918847341af0f5f drivers/media/video/s5p-g2d/g2d.c    Kamil Debski 2011-10-0=
6  117  	struct g2d_frame *f =3D get_frame(ctx, vb->vb2_queue->type);
918847341af0f5f drivers/media/video/s5p-g2d/g2d.c    Kamil Debski 2011-10-0=
6  118  =

918847341af0f5f drivers/media/video/s5p-g2d/g2d.c    Kamil Debski 2011-10-0=
6  119  	if (IS_ERR(f))
918847341af0f5f drivers/media/video/s5p-g2d/g2d.c    Kamil Debski 2011-10-0=
6 @120  		return PTR_ERR(f);
918847341af0f5f drivers/media/video/s5p-g2d/g2d.c    Kamil Debski 2011-10-0=
6  121  	vb2_set_plane_payload(vb, 0, f->size);
918847341af0f5f drivers/media/video/s5p-g2d/g2d.c    Kamil Debski 2011-10-0=
6  122  	return 0;
918847341af0f5f drivers/media/video/s5p-g2d/g2d.c    Kamil Debski 2011-10-0=
6  123  }
918847341af0f5f drivers/media/video/s5p-g2d/g2d.c    Kamil Debski 2011-10-0=
6  124  =


:::::: The code at line 103 was first introduced by commit
:::::: 918847341af0f5f1907fc0b52549f0dc29192c03 [media] v4l: add G2D driver=
 for s5p device family

:::::: TO: Kamil Debski <k.debski@samsung.com>
:::::: CC: Mauro Carvalho Chehab <mchehab@redhat.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3017159832795733351==--

