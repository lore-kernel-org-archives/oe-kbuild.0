Content-Type: multipart/mixed; boundary="===============7949694954282144828=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/drm_mipi_dbi.c:262:52: warning: Either the condition '!fb' is redundant or there is possible null pointer dereference: fb.
Date: Thu, 18 Feb 2021 11:39:33 +0800
Message-ID: <202102181123.diAJuYPD-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7949694954282144828==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Daniel Vetter <daniel.vetter@ffwll.ch>
CC: "Noralf Tr=C3=B8nnes" <noralf@tronnes.org>
CC: Emil Velikov <emil.l.velikov@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   f40ddce88593482919761f74910f42f4b84c004b
commit: 7e06886bbfca73717e45a0f20cdb4053793c191b drm/mipi-dbi: Remove ->ena=
bled
date:   8 months ago
:::::: branch date: 3 days ago
:::::: commit date: 8 months ago
compiler: riscv64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/gpu/drm/drm_mipi_dbi.c:262:52: warning: Either the condition '!f=
b' is redundant or there is possible null pointer dereference: fb. [nullPoi=
nterRedundantCheck]
    struct mipi_dbi_dev *dbidev =3D drm_to_mipi_dbi_dev(fb->dev);
                                                      ^
   drivers/gpu/drm/drm_mipi_dbi.c:271:14: note: Assuming that condition '!f=
b' is not redundant
    if (WARN_ON(!fb))
                ^
   drivers/gpu/drm/drm_mipi_dbi.c:262:52: note: Null pointer dereference
    struct mipi_dbi_dev *dbidev =3D drm_to_mipi_dbi_dev(fb->dev);
                                                      ^

vim +262 drivers/gpu/drm/drm_mipi_dbi.c

f41a8a69890d08 drivers/gpu/drm/drm_mipi_dbi.c     Geert Uytterhoeven 2020-0=
1-15  257  =

af74138160e194 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes     2=
019-01-15  258  static void mipi_dbi_fb_dirty(struct drm_framebuffer *fb, s=
truct drm_rect *rect)
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes     2=
017-01-22  259  {
7c9f1312cfca15 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes     2=
019-07-22  260  	struct drm_gem_object *gem =3D drm_gem_fb_get_obj(fb, 0);
7c9f1312cfca15 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes     2=
019-07-22  261  	struct drm_gem_cma_object *cma_obj =3D to_drm_gem_cma_obj(=
gem);
84137b866e834a drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes     2=
019-07-22 @262  	struct mipi_dbi_dev *dbidev =3D drm_to_mipi_dbi_dev(fb->de=
v);
af74138160e194 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes     2=
019-01-15  263  	unsigned int height =3D rect->y2 - rect->y1;
af74138160e194 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes     2=
019-01-15  264  	unsigned int width =3D rect->x2 - rect->x1;
84137b866e834a drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes     2=
019-07-22  265  	struct mipi_dbi *dbi =3D &dbidev->dbi;
36b5057216236a drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes     2=
019-07-22  266  	bool swap =3D dbi->swap_bytes;
9d5645ad1b979c drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes     2=
019-02-25  267  	int idx, ret =3D 0;
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes     2=
017-01-22  268  	bool full;
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes     2=
017-01-22  269  	void *tr;
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes     2=
017-01-22  270  =

7e06886bbfca73 drivers/gpu/drm/drm_mipi_dbi.c     Daniel Vetter      2020-0=
6-12  271  	if (WARN_ON(!fb))
af74138160e194 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes     2=
019-01-15  272  		return;
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes     2=
017-01-22  273  =

9d5645ad1b979c drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes     2=
019-02-25  274  	if (!drm_dev_enter(fb->dev, &idx))
9d5645ad1b979c drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes     2=
019-02-25  275  		return;
9d5645ad1b979c drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes     2=
019-02-25  276  =

af74138160e194 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes     2=
019-01-15  277  	full =3D width =3D=3D fb->width && height =3D=3D fb->heigh=
t;
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes     2=
017-01-22  278  =

b051b3459bbae9 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes     2=
019-01-15  279  	DRM_DEBUG_KMS("Flushing [FB:%d] " DRM_RECT_FMT "\n", fb->b=
ase.id, DRM_RECT_ARG(rect));
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes     2=
017-01-22  280  =

36b5057216236a drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes     2=
019-07-22  281  	if (!dbi->dc || !full || swap ||
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes     2=
017-01-22  282  	    fb->format->format =3D=3D DRM_FORMAT_XRGB8888) {
440961d20959e8 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes     2=
019-07-22  283  		tr =3D dbidev->tx_buf;
440961d20959e8 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes     2=
019-07-22  284  		ret =3D mipi_dbi_buf_copy(dbidev->tx_buf, fb, rect, swap);
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes     2=
017-01-22  285  		if (ret)
af74138160e194 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes     2=
019-01-15  286  			goto err_msg;
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes     2=
017-01-22  287  	} else {
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes     2=
017-01-22  288  		tr =3D cma_obj->vaddr;
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes     2=
017-01-22  289  	}
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes     2=
017-01-22  290  =

f41a8a69890d08 drivers/gpu/drm/drm_mipi_dbi.c     Geert Uytterhoeven 2020-0=
1-15  291  	mipi_dbi_set_window_address(dbidev, rect->x1, rect->x2 - 1, rec=
t->y1,
f41a8a69890d08 drivers/gpu/drm/drm_mipi_dbi.c     Geert Uytterhoeven 2020-0=
1-15  292  				    rect->y2 - 1);
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes     2=
017-01-22  293  =

36b5057216236a drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes     2=
019-07-22  294  	ret =3D mipi_dbi_command_buf(dbi, MIPI_DCS_WRITE_MEMORY_ST=
ART, tr,
af74138160e194 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes     2=
019-01-15  295  				   width * height * 2);
af74138160e194 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes     2=
019-01-15  296  err_msg:
af74138160e194 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes     2=
019-01-15  297  	if (ret)
af74138160e194 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes     2=
019-01-15  298  		dev_err_once(fb->dev->dev, "Failed to update display %d\n=
", ret);
9d5645ad1b979c drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes     2=
019-02-25  299  =

9d5645ad1b979c drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes     2=
019-02-25  300  	drm_dev_exit(idx);
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes     2=
017-01-22  301  }
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes     2=
017-01-22  302  =


:::::: The code at line 262 was first introduced by commit
:::::: 84137b866e834ac937582b04ae9bed0a72356a6a drm/tinydrm: Split struct m=
ipi_dbi in two

:::::: TO: Noralf Tr=C3=B8nnes <noralf@tronnes.org>
:::::: CC: Noralf Tr=C3=B8nnes <noralf@tronnes.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7949694954282144828==--

