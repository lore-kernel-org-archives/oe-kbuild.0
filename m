Content-Type: multipart/mixed; boundary="===============1705842063739192471=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 2030/4328] drivers/gpu/drm/solomon/ssd130x.c:486:2: warning: Undefined or garbage value returned to caller [clang-analyzer-core.uninitialized.UndefReturn]
Date: Sat, 16 Apr 2022 15:43:30 +0800
Message-ID: <202204161520.o8hr3G3M-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1705842063739192471==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: "Chen-Yu Tsai" <wens@csie.org>
CC: Javier Martinez Canillas <javierm@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   40354149f4d738dc3492d9998e45b3f02950369a
commit: b0daaa5cfaa561477b8d3d10fb0697a2cce0c2ba [2030/4328] drm/ssd130x: S=
upport page addressing mode
:::::: branch date: 2 days ago
:::::: commit date: 9 days ago
config: riscv-randconfig-c006-20220414 (https://download.01.org/0day-ci/arc=
hive/20220416/202204161520.o8hr3G3M-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 6b7e6e=
a489f6dd45a9b0da9ac20871560917b9b0)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3Db0daaa5cfaa561477b8d3d10fb0697a2cce0c2ba
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout b0daaa5cfaa561477b8d3d10fb0697a2cce0c2ba
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   52 warnings generated.
   Suppressed 52 warnings (52 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   52 warnings generated.
   Suppressed 52 warnings (52 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   52 warnings generated.
   Suppressed 52 warnings (52 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   52 warnings generated.
   Suppressed 52 warnings (52 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   52 warnings generated.
   Suppressed 52 warnings (52 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   52 warnings generated.
   Suppressed 52 warnings (52 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   54 warnings generated.
   drivers/gpu/drm/nouveau/nvkm/subdev/bios/M0203.c:59:2: warning: Call to =
function 'memset' is insecure as it does not provide security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'memset_s' in case of C11=
 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(info, 0x00, sizeof(*info));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nvkm/subdev/bios/M0203.c:59:2: note: Call to fun=
ction 'memset' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(info, 0x00, sizeof(*info));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nvkm/subdev/bios/M0203.c:89:2: warning: Call to =
function 'memset' is insecure as it does not provide security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'memset_s' in case of C11=
 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(info, 0x00, sizeof(*info));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nvkm/subdev/bios/M0203.c:89:2: note: Call to fun=
ction 'memset' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(info, 0x00, sizeof(*info));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   Suppressed 52 warnings (52 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   56 warnings generated.
   drivers/gpu/drm/gud/gud_connector.c:212:2: warning: Call to function 'me=
mcpy' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memcpy_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(buf, ctx->buf + start, len);
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/gud/gud_connector.c:212:2: note: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(buf, ctx->buf + start, len);
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   Suppressed 55 warnings (55 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   57 warnings generated.
>> drivers/gpu/drm/solomon/ssd130x.c:486:2: warning: Undefined or garbage v=
alue returned to caller [clang-analyzer-core.uninitialized.UndefReturn]
           return ret;
           ^
   drivers/gpu/drm/solomon/ssd130x.c:618:6: note: Assuming 'fb' is non-null
           if (!fb)
               ^~~
   drivers/gpu/drm/solomon/ssd130x.c:618:2: note: Taking false branch
           if (!fb)
           ^
   drivers/gpu/drm/solomon/ssd130x.c:621:6: note: Assuming field 'active' i=
s true
           if (!pipe->crtc.state->active)
               ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/solomon/ssd130x.c:621:2: note: Taking false branch
           if (!pipe->crtc.state->active)
           ^
   drivers/gpu/drm/solomon/ssd130x.c:624:6: note: Assuming the condition is=
 false
           if (!drm_atomic_helper_damage_merged(old_plane_state, plane_stat=
e, &src_clip))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~
   drivers/gpu/drm/solomon/ssd130x.c:624:2: note: Taking false branch
           if (!drm_atomic_helper_damage_merged(old_plane_state, plane_stat=
e, &src_clip))
           ^
   drivers/gpu/drm/solomon/ssd130x.c:628:6: note: Assuming the condition is=
 false
           if (!drm_rect_intersect(&dst_clip, &src_clip))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/solomon/ssd130x.c:628:2: note: Taking false branch
           if (!drm_rect_intersect(&dst_clip, &src_clip))
           ^
   drivers/gpu/drm/solomon/ssd130x.c:631:6: note: Assuming the condition is=
 false
           if (!drm_dev_enter(drm, &idx))
               ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/solomon/ssd130x.c:631:2: note: Taking false branch
           if (!drm_dev_enter(drm, &idx))
           ^
   drivers/gpu/drm/solomon/ssd130x.c:634:2: note: Calling 'ssd130x_fb_blit_=
rect'
           ssd130x_fb_blit_rect(plane_state->fb, &shadow_plane_state->data[=
0], &dst_clip);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~
   drivers/gpu/drm/solomon/ssd130x.c:520:13: note: Assuming '__UNIQUE_ID___=
x354' is >=3D '__UNIQUE_ID___y355'
           rect->y2 =3D min_t(unsigned int, round_up(rect->y2, 8), ssd130x-=
>height);
                      ^
   include/linux/minmax.h:104:27: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~~~~~~~~
   drivers/gpu/drm/solomon/ssd130x.c:520:13: note: '?' condition is false
           rect->y2 =3D min_t(unsigned int, round_up(rect->y2, 8), ssd130x-=
>height);
                      ^
   include/linux/minmax.h:104:27: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
                                   ^
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   drivers/gpu/drm/solomon/ssd130x.c:524:6: note: Assuming 'buf' is non-null
           if (!buf)
               ^~~~
   drivers/gpu/drm/solomon/ssd130x.c:524:2: note: Taking false branch
           if (!buf)
           ^
   drivers/gpu/drm/solomon/ssd130x.c:529:2: note: Calling 'ssd130x_update_r=
ect'
           ssd130x_update_rect(ssd130x, buf, rect);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/solomon/ssd130x.c:394:6: note: 'ret' declared without an=
 initial value
           int ret, i, j, k;
               ^~~
   drivers/gpu/drm/solomon/ssd130x.c:397:21: note: Assuming the condition i=
s false
           drm_WARN_ONCE(drm, y % 8 !=3D 0, "y must be aligned to screen pa=
ge\n");
                              ^
   include/drm/drm_print.h:588:12: note: expanded from macro 'drm_WARN_ONCE'
           WARN_ONCE(condition, "%s %s: " format,                          \
                     ^~~~~~~~~
   include/asm-generic/bug.h:150:18: note: expanded from macro 'WARN_ONCE'
           DO_ONCE_LITE_IF(condition, WARN, 1, format)
                           ^~~~~~~~~
   include/linux/once_lite.h:15:27: note: expanded from macro 'DO_ONCE_LITE=
_IF'
                   bool __ret_do_once =3D !!(condition);                   =
  \
                                           ^~~~~~~~~
   drivers/gpu/drm/solomon/ssd130x.c:397:2: note: '__ret_do_once' is false
           drm_WARN_ONCE(drm, y % 8 !=3D 0, "y must be aligned to screen pa=
ge\n");
           ^
   include/drm/drm_print.h:588:2: note: expanded from macro 'drm_WARN_ONCE'
           WARN_ONCE(condition, "%s %s: " format,                          \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:150:2: note: expanded from macro 'WARN_ONCE'
           DO_ONCE_LITE_IF(condition, WARN, 1, format)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/once_lite.h:17:16: note: expanded from macro 'DO_ONCE_LITE=
_IF'
                   if (unlikely(__ret_do_once && !__already_done)) {       \

vim +486 drivers/gpu/drm/solomon/ssd130x.c

a61732e808672c Javier Martinez Canillas 2022-02-14  382  =

a61732e808672c Javier Martinez Canillas 2022-02-14  383  static int ssd130x=
_update_rect(struct ssd130x_device *ssd130x, u8 *buf,
a61732e808672c Javier Martinez Canillas 2022-02-14  384  			       struct d=
rm_rect *rect)
a61732e808672c Javier Martinez Canillas 2022-02-14  385  {
a61732e808672c Javier Martinez Canillas 2022-02-14  386  	unsigned int x =
=3D rect->x1;
a61732e808672c Javier Martinez Canillas 2022-02-14  387  	unsigned int y =
=3D rect->y1;
a61732e808672c Javier Martinez Canillas 2022-02-14  388  	unsigned int widt=
h =3D drm_rect_width(rect);
a61732e808672c Javier Martinez Canillas 2022-02-14  389  	unsigned int heig=
ht =3D drm_rect_height(rect);
a61732e808672c Javier Martinez Canillas 2022-02-14  390  	unsigned int line=
_length =3D DIV_ROUND_UP(width, 8);
a97e753fd358e2 Geert Uytterhoeven       2022-03-17  391  	unsigned int page=
s =3D DIV_ROUND_UP(height, 8);
a97e753fd358e2 Geert Uytterhoeven       2022-03-17  392  	struct drm_device=
 *drm =3D &ssd130x->drm;
a61732e808672c Javier Martinez Canillas 2022-02-14  393  	u32 array_idx =3D=
 0;
a61732e808672c Javier Martinez Canillas 2022-02-14  394  	int ret, i, j, k;
a61732e808672c Javier Martinez Canillas 2022-02-14  395  	u8 *data_array =
=3D NULL;
a61732e808672c Javier Martinez Canillas 2022-02-14  396  =

a97e753fd358e2 Geert Uytterhoeven       2022-03-17  397  	drm_WARN_ONCE(drm=
, y % 8 !=3D 0, "y must be aligned to screen page\n");
a97e753fd358e2 Geert Uytterhoeven       2022-03-17  398  =

a61732e808672c Javier Martinez Canillas 2022-02-14  399  	data_array =3D kc=
alloc(width, pages, GFP_KERNEL);
a61732e808672c Javier Martinez Canillas 2022-02-14  400  	if (!data_array)
a61732e808672c Javier Martinez Canillas 2022-02-14  401  		return -ENOMEM;
a61732e808672c Javier Martinez Canillas 2022-02-14  402  =

a61732e808672c Javier Martinez Canillas 2022-02-14  403  	/*
a61732e808672c Javier Martinez Canillas 2022-02-14  404  	 * The screen is =
divided in pages, each having a height of 8
a61732e808672c Javier Martinez Canillas 2022-02-14  405  	 * pixels, and th=
e width of the screen. When sending a byte of
a61732e808672c Javier Martinez Canillas 2022-02-14  406  	 * data to the co=
ntroller, it gives the 8 bits for the current
a61732e808672c Javier Martinez Canillas 2022-02-14  407  	 * column. I.e, t=
he first byte are the 8 bits of the first
a61732e808672c Javier Martinez Canillas 2022-02-14  408  	 * column, then t=
he 8 bits for the second column, etc.
a61732e808672c Javier Martinez Canillas 2022-02-14  409  	 *
a61732e808672c Javier Martinez Canillas 2022-02-14  410  	 *
a61732e808672c Javier Martinez Canillas 2022-02-14  411  	 * Representation=
 of the screen, assuming it is 5 bits
a61732e808672c Javier Martinez Canillas 2022-02-14  412  	 * wide. Each let=
ter-number combination is a bit that controls
a61732e808672c Javier Martinez Canillas 2022-02-14  413  	 * one pixel.
a61732e808672c Javier Martinez Canillas 2022-02-14  414  	 *
a61732e808672c Javier Martinez Canillas 2022-02-14  415  	 * A0 A1 A2 A3 A4
a61732e808672c Javier Martinez Canillas 2022-02-14  416  	 * B0 B1 B2 B3 B4
a61732e808672c Javier Martinez Canillas 2022-02-14  417  	 * C0 C1 C2 C3 C4
a61732e808672c Javier Martinez Canillas 2022-02-14  418  	 * D0 D1 D2 D3 D4
a61732e808672c Javier Martinez Canillas 2022-02-14  419  	 * E0 E1 E2 E3 E4
a61732e808672c Javier Martinez Canillas 2022-02-14  420  	 * F0 F1 F2 F3 F4
a61732e808672c Javier Martinez Canillas 2022-02-14  421  	 * G0 G1 G2 G3 G4
a61732e808672c Javier Martinez Canillas 2022-02-14  422  	 * H0 H1 H2 H3 H4
a61732e808672c Javier Martinez Canillas 2022-02-14  423  	 *
a61732e808672c Javier Martinez Canillas 2022-02-14  424  	 * If you want to=
 update this screen, you need to send 5 bytes:
a61732e808672c Javier Martinez Canillas 2022-02-14  425  	 *  (1) A0 B0 C0 =
D0 E0 F0 G0 H0
a61732e808672c Javier Martinez Canillas 2022-02-14  426  	 *  (2) A1 B1 C1 =
D1 E1 F1 G1 H1
a61732e808672c Javier Martinez Canillas 2022-02-14  427  	 *  (3) A2 B2 C2 =
D2 E2 F2 G2 H2
a61732e808672c Javier Martinez Canillas 2022-02-14  428  	 *  (4) A3 B3 C3 =
D3 E3 F3 G3 H3
a61732e808672c Javier Martinez Canillas 2022-02-14  429  	 *  (5) A4 B4 C4 =
D4 E4 F4 G4 H4
a61732e808672c Javier Martinez Canillas 2022-02-14  430  	 */
a61732e808672c Javier Martinez Canillas 2022-02-14  431  =

b0daaa5cfaa561 Chen-Yu Tsai             2022-04-07  432  	if (!ssd130x->pag=
e_address_mode) {
b0daaa5cfaa561 Chen-Yu Tsai             2022-04-07  433  		/* Set address r=
ange for horizontal addressing mode */
a61732e808672c Javier Martinez Canillas 2022-02-14  434  		ret =3D ssd130x_=
set_col_range(ssd130x, ssd130x->col_offset + x, width);
a61732e808672c Javier Martinez Canillas 2022-02-14  435  		if (ret < 0)
a61732e808672c Javier Martinez Canillas 2022-02-14  436  			goto out_free;
a61732e808672c Javier Martinez Canillas 2022-02-14  437  =

a61732e808672c Javier Martinez Canillas 2022-02-14  438  		ret =3D ssd130x_=
set_page_range(ssd130x, ssd130x->page_offset + y / 8, pages);
a61732e808672c Javier Martinez Canillas 2022-02-14  439  		if (ret < 0)
a61732e808672c Javier Martinez Canillas 2022-02-14  440  			goto out_free;
b0daaa5cfaa561 Chen-Yu Tsai             2022-04-07  441  	}
a61732e808672c Javier Martinez Canillas 2022-02-14  442  =

a97e753fd358e2 Geert Uytterhoeven       2022-03-17  443  	for (i =3D 0; i <=
 pages; i++) {
a61732e808672c Javier Martinez Canillas 2022-02-14  444  		int m =3D 8;
a61732e808672c Javier Martinez Canillas 2022-02-14  445  =

a61732e808672c Javier Martinez Canillas 2022-02-14  446  		/* Last page may=
 be partial */
a97e753fd358e2 Geert Uytterhoeven       2022-03-17  447  		if (8 * (y / 8 +=
 i + 1) > ssd130x->height)
a61732e808672c Javier Martinez Canillas 2022-02-14  448  			m =3D ssd130x->=
height % 8;
a97e753fd358e2 Geert Uytterhoeven       2022-03-17  449  		for (j =3D 0; j =
< width; j++) {
a61732e808672c Javier Martinez Canillas 2022-02-14  450  			u8 data =3D 0;
a61732e808672c Javier Martinez Canillas 2022-02-14  451  =

a61732e808672c Javier Martinez Canillas 2022-02-14  452  			for (k =3D 0; k=
 < m; k++) {
a61732e808672c Javier Martinez Canillas 2022-02-14  453  				u8 byte =3D bu=
f[(8 * i + k) * line_length + j / 8];
a61732e808672c Javier Martinez Canillas 2022-02-14  454  				u8 bit =3D (by=
te >> (j % 8)) & 1;
a61732e808672c Javier Martinez Canillas 2022-02-14  455  =

a61732e808672c Javier Martinez Canillas 2022-02-14  456  				data |=3D bit =
<< k;
a61732e808672c Javier Martinez Canillas 2022-02-14  457  			}
a61732e808672c Javier Martinez Canillas 2022-02-14  458  			data_array[arra=
y_idx++] =3D data;
a61732e808672c Javier Martinez Canillas 2022-02-14  459  		}
b0daaa5cfaa561 Chen-Yu Tsai             2022-04-07  460  =

b0daaa5cfaa561 Chen-Yu Tsai             2022-04-07  461  		/*
b0daaa5cfaa561 Chen-Yu Tsai             2022-04-07  462  		 * In page addre=
ssing mode, the start address needs to be reset,
b0daaa5cfaa561 Chen-Yu Tsai             2022-04-07  463  		 * and each page=
 then needs to be written out separately.
b0daaa5cfaa561 Chen-Yu Tsai             2022-04-07  464  		 */
b0daaa5cfaa561 Chen-Yu Tsai             2022-04-07  465  		if (ssd130x->pag=
e_address_mode) {
b0daaa5cfaa561 Chen-Yu Tsai             2022-04-07  466  			ret =3D ssd130x=
_set_page_pos(ssd130x,
b0daaa5cfaa561 Chen-Yu Tsai             2022-04-07  467  						   ssd130x->=
page_offset + i,
b0daaa5cfaa561 Chen-Yu Tsai             2022-04-07  468  						   ssd130x->=
col_offset + x);
b0daaa5cfaa561 Chen-Yu Tsai             2022-04-07  469  			if (ret < 0)
b0daaa5cfaa561 Chen-Yu Tsai             2022-04-07  470  				goto out_free;
b0daaa5cfaa561 Chen-Yu Tsai             2022-04-07  471  =

b0daaa5cfaa561 Chen-Yu Tsai             2022-04-07  472  			ret =3D ssd130x=
_write_data(ssd130x, data_array, width);
b0daaa5cfaa561 Chen-Yu Tsai             2022-04-07  473  			if (ret < 0)
b0daaa5cfaa561 Chen-Yu Tsai             2022-04-07  474  				goto out_free;
b0daaa5cfaa561 Chen-Yu Tsai             2022-04-07  475  =

b0daaa5cfaa561 Chen-Yu Tsai             2022-04-07  476  			array_idx =3D 0;
b0daaa5cfaa561 Chen-Yu Tsai             2022-04-07  477  		}
a61732e808672c Javier Martinez Canillas 2022-02-14  478  	}
a61732e808672c Javier Martinez Canillas 2022-02-14  479  =

b0daaa5cfaa561 Chen-Yu Tsai             2022-04-07  480  	/* Write out upda=
te in one go if we aren't using page addressing mode */
b0daaa5cfaa561 Chen-Yu Tsai             2022-04-07  481  	if (!ssd130x->pag=
e_address_mode)
a61732e808672c Javier Martinez Canillas 2022-02-14  482  		ret =3D ssd130x_=
write_data(ssd130x, data_array, width * pages);
a61732e808672c Javier Martinez Canillas 2022-02-14  483  =

a61732e808672c Javier Martinez Canillas 2022-02-14  484  out_free:
a61732e808672c Javier Martinez Canillas 2022-02-14  485  	kfree(data_array);
a61732e808672c Javier Martinez Canillas 2022-02-14 @486  	return ret;
a61732e808672c Javier Martinez Canillas 2022-02-14  487  }
a61732e808672c Javier Martinez Canillas 2022-02-14  488  =


:::::: The code at line 486 was first introduced by commit
:::::: a61732e808672cfa8c8c6028bcf9feacb953ef40 drm: Add driver for Solomon=
 SSD130x OLED displays

:::::: TO: Javier Martinez Canillas <javierm@redhat.com>
:::::: CC: Javier Martinez Canillas <javierm@redhat.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1705842063739192471==--

