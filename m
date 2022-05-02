Content-Type: multipart/mixed; boundary="===============1353892710769720846=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 386/7959] drivers/gpu/drm/solomon/ssd130x.c:359:21: warning: Value stored to 'drm' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Mon, 02 May 2022 19:15:55 +0800
Message-ID: <202205021924.Q4hri0P1-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1353892710769720846==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Javier Martinez Canillas <javierm@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   5469f0c06732a077c70a759a81f2a1f00b277694
commit: a97e753fd358e23155ae42c61292dfd57eb54c4a [386/7959] drm/ssd130x: Fi=
x rectangle updates
:::::: branch date: 3 days ago
:::::: commit date: 7 weeks ago
config: riscv-randconfig-c006-20220501 (https://download.01.org/0day-ci/arc=
hive/20220502/202205021924.Q4hri0P1-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 09325d=
36061e42b495d1f4c7e933e260eac260ed)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3Da97e753fd358e23155ae42c61292dfd57eb54c4a
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout a97e753fd358e23155ae42c61292dfd57eb54c4a
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   drivers/iio/imu/st_lsm6dsx/st_lsm6dsx.h:65:49: note: expanded from macro=
 'ST_LSM6DSX_SHIFT_VAL'
   #define ST_LSM6DSX_SHIFT_VAL(val, mask) (((val) << __ffs(mask)) & (mask))
                                                   ^
   drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_shub.c:561:2: note: Control jumps =
to 'case IIO_CHAN_INFO_RAW:' @line 562
           switch (mask) {
           ^
   drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_shub.c:564:7: note: Assuming 'ret'=
 is 0
                   if (ret)
                       ^~~
   drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_shub.c:564:3: note: Taking false b=
ranch
                   if (ret)
                   ^
   drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_shub.c:567:9: note: Calling 'st_ls=
m6dsx_shub_read_oneshot'
                   ret =3D st_lsm6dsx_shub_read_oneshot(sensor, ch, val);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_shub.c:527:6: note: Assuming 'err'=
 is >=3D 0
           if (err < 0)
               ^~~~~~~
   drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_shub.c:527:2: note: Taking false b=
ranch
           if (err < 0)
           ^
   drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_shub.c:533:8: note: Assuming '__UN=
IQUE_ID___x252' is >=3D '__UNIQUE_ID___y253'
           len =3D min_t(int, sizeof(data), ch->scan_type.realbits >> 3);
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
   drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_shub.c:533:8: note: '?' condition =
is false
           len =3D min_t(int, sizeof(data), ch->scan_type.realbits >> 3);
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
   drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_shub.c:534:8: note: Calling 'st_ls=
m6dsx_shub_read'
           err =3D st_lsm6dsx_shub_read(sensor, ch->address, data, len);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_shub.c:298:6: note: Assuming the c=
ondition is true
           if (slv_addr + 2 =3D=3D aux_sens->addr)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_shub.c:298:2: note: Taking true br=
anch
           if (slv_addr + 2 =3D=3D aux_sens->addr)
           ^
   drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_shub.c:299:16: note: The result of=
 the left shift is undefined due to shifting '3' by '31', which is unrepres=
entable in the unsigned version of the return type 'int'
                   slv_config =3D ST_LSM6DSX_SHIFT_VAL(3, aux_sens->mask);
                                ^
   drivers/iio/imu/st_lsm6dsx/st_lsm6dsx.h:65:49: note: expanded from macro=
 'ST_LSM6DSX_SHIFT_VAL'
   #define ST_LSM6DSX_SHIFT_VAL(val, mask) (((val) << __ffs(mask)) & (mask))
                                             ~~~~~ ^
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c:424:2: warning: Value =
stored to 'reg' is never read [clang-analyzer-deadcode.DeadStores]
           reg =3D readl(dp->reg_base + ANALOGIX_DP_SYS_CTL_3);
           ^
   drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c:424:2: note: Value sto=
red to 'reg' is never read
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/gpu/drm/tiny/simpledrm.c:746:21: warning: Value stored to 'dev' =
during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct drm_device *dev =3D &sdev->dev;
                              ^~~   ~~~~~~~~~~
   drivers/gpu/drm/tiny/simpledrm.c:746:21: note: Value stored to 'dev' dur=
ing its initialization is never read
           struct drm_device *dev =3D &sdev->dev;
                              ^~~   ~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
>> drivers/gpu/drm/solomon/ssd130x.c:359:21: warning: Value stored to 'drm'=
 during its initialization is never read [clang-analyzer-deadcode.DeadStore=
s]
           struct drm_device *drm =3D &ssd130x->drm;
                              ^~~   ~~~~~~~~~~~~~
   drivers/gpu/drm/solomon/ssd130x.c:359:21: note: Value stored to 'drm' du=
ring its initialization is never read
           struct drm_device *drm =3D &ssd130x->drm;
                              ^~~   ~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   include/drm/drm_atomic.h:1031:9: warning: Access to field 'mode_changed'=
 results in a dereference of a null pointer (loaded from variable 'state') =
[clang-analyzer-core.NullDereference]
           return state->mode_changed || state->active_changed ||
                  ^
   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:966:2: note: 'crtc_state' init=
ialized to a null pointer value
           const struct drm_crtc_state *crtc_state =3D NULL;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:971:6: note: Assuming field 'c=
rtc' is null
           if (new_plane_state->crtc)
               ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:971:2: note: Taking false bran=
ch
           if (new_plane_state->crtc)
           ^
   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:980:6: note: Assuming 'ret' is=
 0
           if (ret) {
               ^~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:980:2: note: Taking false bran=
ch
           if (ret) {
           ^
   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:984:6: note: Assuming field 'v=
isible' is true
           if (!new_plane_state->visible)
               ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:984:2: note: Taking false bran=
ch
           if (!new_plane_state->visible)
           ^
   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:1001:17: note: Assuming the co=
ndition is false
           min_src_size =3D DPU_FORMAT_IS_YUV(fmt) ? 2 : 1;
                          ^
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h:49:3: note: expanded from ma=
cro 'DPU_FORMAT_IS_YUV'
           (test_bit(DPU_FORMAT_FLAG_YUV_BIT, (X)->flag))
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/non-atomic.h:120:18: note: expanded from macr=
o 'test_bit'
   #define test_bit arch_test_bit
                    ^
   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:1001:17: note: '?' condition i=
s false
           min_src_size =3D DPU_FORMAT_IS_YUV(fmt) ? 2 : 1;
                          ^
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h:49:2: note: expanded from ma=
cro 'DPU_FORMAT_IS_YUV'
           (test_bit(DPU_FORMAT_FLAG_YUV_BIT, (X)->flag))
           ^
   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:1003:29: note: Left side of '&=
&' is false
           if (DPU_FORMAT_IS_YUV(fmt) &&
                                      ^
   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:1011:9: note: Taking false bra=
nch
           } else if (!dpu_plane_validate_src(&src, &fb_rect, min_src_size)=
) {
                  ^
   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:1017:36: note: Left side of '&=
&' is false
           } else if (DPU_FORMAT_IS_YUV(fmt) &&
                                             ^
   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:1026:13: note: Assuming the co=
ndition is false
           } else if (drm_rect_width(&dst) < 0x1 || drm_rect_height(&dst) <=
 0x1) {
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:1026:13: note: Left side of '|=
|' is false
   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:1026:43: note: Assuming the co=
ndition is false
           } else if (drm_rect_width(&dst) < 0x1 || drm_rect_height(&dst) <=
 0x1) {
                                                    ^~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:1026:9: note: Taking false bra=
nch
           } else if (drm_rect_width(&dst) < 0x1 || drm_rect_height(&dst) <=
 0x1) {
                  ^
   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:1032:13: note: Assuming the co=
ndition is false
           } else if (drm_rect_width(&src) > max_linewidth) {
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:1032:9: note: Taking false bra=
nch
           } else if (drm_rect_width(&src) > max_linewidth) {
                  ^
   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:1038:58: note: Passing null po=
inter value via 1st parameter 'state'
           pstate->needs_qos_remap =3D drm_atomic_crtc_needs_modeset(crtc_s=
tate);
                                                                   ^~~~~~~~=
~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:1038:28: note: Calling 'drm_at=
omic_crtc_needs_modeset'
           pstate->needs_qos_remap =3D drm_atomic_crtc_needs_modeset(crtc_s=
tate);
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   include/drm/drm_atomic.h:1031:9: note: Access to field 'mode_changed' re=
sults in a dereference of a null pointer (loaded from variable 'state')
           return state->mode_changed || state->active_changed ||
                  ^~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).

vim +/drm +359 drivers/gpu/drm/solomon/ssd130x.c

a61732e808672c Javier Martinez Canillas 2022-02-14  349  =

a61732e808672c Javier Martinez Canillas 2022-02-14  350  static int ssd130x=
_update_rect(struct ssd130x_device *ssd130x, u8 *buf,
a61732e808672c Javier Martinez Canillas 2022-02-14  351  			       struct d=
rm_rect *rect)
a61732e808672c Javier Martinez Canillas 2022-02-14  352  {
a61732e808672c Javier Martinez Canillas 2022-02-14  353  	unsigned int x =
=3D rect->x1;
a61732e808672c Javier Martinez Canillas 2022-02-14  354  	unsigned int y =
=3D rect->y1;
a61732e808672c Javier Martinez Canillas 2022-02-14  355  	unsigned int widt=
h =3D drm_rect_width(rect);
a61732e808672c Javier Martinez Canillas 2022-02-14  356  	unsigned int heig=
ht =3D drm_rect_height(rect);
a61732e808672c Javier Martinez Canillas 2022-02-14  357  	unsigned int line=
_length =3D DIV_ROUND_UP(width, 8);
a97e753fd358e2 Geert Uytterhoeven       2022-03-17  358  	unsigned int page=
s =3D DIV_ROUND_UP(height, 8);
a97e753fd358e2 Geert Uytterhoeven       2022-03-17 @359  	struct drm_device=
 *drm =3D &ssd130x->drm;
a61732e808672c Javier Martinez Canillas 2022-02-14  360  	u32 array_idx =3D=
 0;
a61732e808672c Javier Martinez Canillas 2022-02-14  361  	int ret, i, j, k;
a61732e808672c Javier Martinez Canillas 2022-02-14  362  	u8 *data_array =
=3D NULL;
a61732e808672c Javier Martinez Canillas 2022-02-14  363  =

a97e753fd358e2 Geert Uytterhoeven       2022-03-17  364  	drm_WARN_ONCE(drm=
, y % 8 !=3D 0, "y must be aligned to screen page\n");
a97e753fd358e2 Geert Uytterhoeven       2022-03-17  365  =

a61732e808672c Javier Martinez Canillas 2022-02-14  366  	data_array =3D kc=
alloc(width, pages, GFP_KERNEL);
a61732e808672c Javier Martinez Canillas 2022-02-14  367  	if (!data_array)
a61732e808672c Javier Martinez Canillas 2022-02-14  368  		return -ENOMEM;
a61732e808672c Javier Martinez Canillas 2022-02-14  369  =

a61732e808672c Javier Martinez Canillas 2022-02-14  370  	/*
a61732e808672c Javier Martinez Canillas 2022-02-14  371  	 * The screen is =
divided in pages, each having a height of 8
a61732e808672c Javier Martinez Canillas 2022-02-14  372  	 * pixels, and th=
e width of the screen. When sending a byte of
a61732e808672c Javier Martinez Canillas 2022-02-14  373  	 * data to the co=
ntroller, it gives the 8 bits for the current
a61732e808672c Javier Martinez Canillas 2022-02-14  374  	 * column. I.e, t=
he first byte are the 8 bits of the first
a61732e808672c Javier Martinez Canillas 2022-02-14  375  	 * column, then t=
he 8 bits for the second column, etc.
a61732e808672c Javier Martinez Canillas 2022-02-14  376  	 *
a61732e808672c Javier Martinez Canillas 2022-02-14  377  	 *
a61732e808672c Javier Martinez Canillas 2022-02-14  378  	 * Representation=
 of the screen, assuming it is 5 bits
a61732e808672c Javier Martinez Canillas 2022-02-14  379  	 * wide. Each let=
ter-number combination is a bit that controls
a61732e808672c Javier Martinez Canillas 2022-02-14  380  	 * one pixel.
a61732e808672c Javier Martinez Canillas 2022-02-14  381  	 *
a61732e808672c Javier Martinez Canillas 2022-02-14  382  	 * A0 A1 A2 A3 A4
a61732e808672c Javier Martinez Canillas 2022-02-14  383  	 * B0 B1 B2 B3 B4
a61732e808672c Javier Martinez Canillas 2022-02-14  384  	 * C0 C1 C2 C3 C4
a61732e808672c Javier Martinez Canillas 2022-02-14  385  	 * D0 D1 D2 D3 D4
a61732e808672c Javier Martinez Canillas 2022-02-14  386  	 * E0 E1 E2 E3 E4
a61732e808672c Javier Martinez Canillas 2022-02-14  387  	 * F0 F1 F2 F3 F4
a61732e808672c Javier Martinez Canillas 2022-02-14  388  	 * G0 G1 G2 G3 G4
a61732e808672c Javier Martinez Canillas 2022-02-14  389  	 * H0 H1 H2 H3 H4
a61732e808672c Javier Martinez Canillas 2022-02-14  390  	 *
a61732e808672c Javier Martinez Canillas 2022-02-14  391  	 * If you want to=
 update this screen, you need to send 5 bytes:
a61732e808672c Javier Martinez Canillas 2022-02-14  392  	 *  (1) A0 B0 C0 =
D0 E0 F0 G0 H0
a61732e808672c Javier Martinez Canillas 2022-02-14  393  	 *  (2) A1 B1 C1 =
D1 E1 F1 G1 H1
a61732e808672c Javier Martinez Canillas 2022-02-14  394  	 *  (3) A2 B2 C2 =
D2 E2 F2 G2 H2
a61732e808672c Javier Martinez Canillas 2022-02-14  395  	 *  (4) A3 B3 C3 =
D3 E3 F3 G3 H3
a61732e808672c Javier Martinez Canillas 2022-02-14  396  	 *  (5) A4 B4 C4 =
D4 E4 F4 G4 H4
a61732e808672c Javier Martinez Canillas 2022-02-14  397  	 */
a61732e808672c Javier Martinez Canillas 2022-02-14  398  =

a61732e808672c Javier Martinez Canillas 2022-02-14  399  	ret =3D ssd130x_s=
et_col_range(ssd130x, ssd130x->col_offset + x, width);
a61732e808672c Javier Martinez Canillas 2022-02-14  400  	if (ret < 0)
a61732e808672c Javier Martinez Canillas 2022-02-14  401  		goto out_free;
a61732e808672c Javier Martinez Canillas 2022-02-14  402  =

a61732e808672c Javier Martinez Canillas 2022-02-14  403  	ret =3D ssd130x_s=
et_page_range(ssd130x, ssd130x->page_offset + y / 8, pages);
a61732e808672c Javier Martinez Canillas 2022-02-14  404  	if (ret < 0)
a61732e808672c Javier Martinez Canillas 2022-02-14  405  		goto out_free;
a61732e808672c Javier Martinez Canillas 2022-02-14  406  =

a97e753fd358e2 Geert Uytterhoeven       2022-03-17  407  	for (i =3D 0; i <=
 pages; i++) {
a61732e808672c Javier Martinez Canillas 2022-02-14  408  		int m =3D 8;
a61732e808672c Javier Martinez Canillas 2022-02-14  409  =

a61732e808672c Javier Martinez Canillas 2022-02-14  410  		/* Last page may=
 be partial */
a97e753fd358e2 Geert Uytterhoeven       2022-03-17  411  		if (8 * (y / 8 +=
 i + 1) > ssd130x->height)
a61732e808672c Javier Martinez Canillas 2022-02-14  412  			m =3D ssd130x->=
height % 8;
a97e753fd358e2 Geert Uytterhoeven       2022-03-17  413  		for (j =3D 0; j =
< width; j++) {
a61732e808672c Javier Martinez Canillas 2022-02-14  414  			u8 data =3D 0;
a61732e808672c Javier Martinez Canillas 2022-02-14  415  =

a61732e808672c Javier Martinez Canillas 2022-02-14  416  			for (k =3D 0; k=
 < m; k++) {
a61732e808672c Javier Martinez Canillas 2022-02-14  417  				u8 byte =3D bu=
f[(8 * i + k) * line_length + j / 8];
a61732e808672c Javier Martinez Canillas 2022-02-14  418  				u8 bit =3D (by=
te >> (j % 8)) & 1;
a61732e808672c Javier Martinez Canillas 2022-02-14  419  =

a61732e808672c Javier Martinez Canillas 2022-02-14  420  				data |=3D bit =
<< k;
a61732e808672c Javier Martinez Canillas 2022-02-14  421  			}
a61732e808672c Javier Martinez Canillas 2022-02-14  422  			data_array[arra=
y_idx++] =3D data;
a61732e808672c Javier Martinez Canillas 2022-02-14  423  		}
a61732e808672c Javier Martinez Canillas 2022-02-14  424  	}
a61732e808672c Javier Martinez Canillas 2022-02-14  425  =

a61732e808672c Javier Martinez Canillas 2022-02-14  426  	ret =3D ssd130x_w=
rite_data(ssd130x, data_array, width * pages);
a61732e808672c Javier Martinez Canillas 2022-02-14  427  =

a61732e808672c Javier Martinez Canillas 2022-02-14  428  out_free:
a61732e808672c Javier Martinez Canillas 2022-02-14  429  	kfree(data_array);
a61732e808672c Javier Martinez Canillas 2022-02-14  430  	return ret;
a61732e808672c Javier Martinez Canillas 2022-02-14  431  }
a61732e808672c Javier Martinez Canillas 2022-02-14  432  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1353892710769720846==--

