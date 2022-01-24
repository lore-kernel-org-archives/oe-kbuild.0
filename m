Content-Type: multipart/mixed; boundary="===============8499527726133868013=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [chrome-os:chromeos-5.10 7805/9999] drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_req_lat_if.c:2068:4: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
Date: Tue, 25 Jan 2022 06:23:10 +0800
Message-ID: <202201250306.oM6RFmtL-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8499527726133868013==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: cros-kernel-buildreports(a)googlegroups.com
TO: Guenter Roeck <groeck@google.com>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chr=
omeos-5.10
head:   26a3cf7b7d542f4ff85e2855ab69140bff097a50
commit: ed87340a6d1e040dd01d1d1ae1a12f1a7e504559 [7805/9999] CHROMIUM: medi=
a: mtk-vcodec: Add vp9 slice api driver for mt8192
:::::: branch date: 3 days ago
:::::: commit date: 10 weeks ago
config: arm-randconfig-c002-20220120 (https://download.01.org/0day-ci/archi=
ve/20220125/202201250306.oM6RFmtL-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 7b3d30=
728816403d1fd73cc5082e9fb761262bce)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        git remote add chrome-os https://chromium.googlesource.com/chromium=
os/third_party/kernel
        git fetch --no-tags chrome-os chromeos-5.10
        git checkout ed87340a6d1e040dd01d1d1ae1a12f1a7e504559
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           for (; rl[1].length; rl++)
           ^
   fs/ntfs/mft.c:1817:6: note: Calling 'IS_ERR'
           if (IS_ERR(mrec)) {
               ^~~~~~~~~~~~
   include/linux/err.h:36:2: note: Returning the value 1, which participate=
s in a condition later
           return IS_ERR_VALUE((unsigned long)ptr);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ntfs/mft.c:1817:6: note: Returning from 'IS_ERR'
           if (IS_ERR(mrec)) {
               ^~~~~~~~~~~~
   fs/ntfs/mft.c:1817:2: note: Taking true branch
           if (IS_ERR(mrec)) {
           ^
   fs/ntfs/mft.c:1820:3: note: Control jumps to line 1953
                   goto undo_alloc;
                   ^
   fs/ntfs/mft.c:1953:6: note: Assuming the condition is false
           if (ntfs_cluster_free(mft_ni, old_last_vcn, -1, ctx) < 0) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ntfs/mft.c:1953:2: note: Taking false branch
           if (ntfs_cluster_free(mft_ni, old_last_vcn, -1, ctx) < 0) {
           ^
   fs/ntfs/mft.c:1958:6: note: Access to field 'attr' results in a derefere=
nce of a null pointer (loaded from variable 'ctx')
           a =3D ctx->attr;
               ^~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   drivers/clk/sprd/pll.c:200:2: warning: Value stored to 'width' is never =
read [clang-analyzer-deadcode.DeadStores]
           width =3D pwidth(pll, PLL_KINT);
           ^
   drivers/clk/sprd/pll.c:200:2: note: Value stored to 'width' is never read
   3 warnings generated.
   Suppressed 3 warnings (3 with check filters).
   2 warnings generated.
   drivers/dax/bus.c:827:7: warning: Value stored to 'is_shrink' during its=
 initialization is never read [clang-analyzer-deadcode.DeadStores]
           bool is_shrink =3D resource_size(res) > size;
                ^~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dax/bus.c:827:7: note: Value stored to 'is_shrink' during its in=
itialization is never read
           bool is_shrink =3D resource_size(res) > size;
                ^~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dax/bus.c:1117:17: warning: Value stored to 'dev' during its ini=
tialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D &dev_dax->dev;
                          ^~~   ~~~~~~~~~~~~~
   drivers/dax/bus.c:1117:17: note: Value stored to 'dev' during its initia=
lization is never read
           struct device *dev =3D &dev_dax->dev;
                          ^~~   ~~~~~~~~~~~~~
   3 warnings generated.
   drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_req_lat_if.c:523:3: warn=
ing: Access to field 'id' results in a dereference of a null pointer (loade=
d from field 'ctx') [clang-analyzer-core.NullDereference]
                   mtk_vcodec_err(instance, "invalid ctx or vsi 0x%px 0x%px=
\n",
                   ^
   drivers/media/platform/mtk-vcodec/vdec/../mtk_vcodec_util.h:38:9: note: =
expanded from macro 'mtk_vcodec_err'
                  ((struct mtk_vcodec_ctx *)h->ctx)->id, __func__, ##args)
                  ^
   drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_req_lat_if.c:1750:6: not=
e: Assuming 'instance' is non-null
           if (!instance)
               ^~~~~~~~~
   drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_req_lat_if.c:1750:2: not=
e: Taking false branch
           if (!instance)
           ^
   drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_req_lat_if.c:1759:8: not=
e: Value assigned to field 'ctx'
           ret =3D vpu_dec_init(&instance->vpu);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_req_lat_if.c:1760:6: not=
e: Assuming 'ret' is 0
           if (ret) {
               ^~~
   drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_req_lat_if.c:1760:2: not=
e: Taking false branch
           if (ret) {
           ^
   drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_req_lat_if.c:1769:6: not=
e: Assuming 'vsi' is non-null
           if (!vsi) {
               ^~~~
   drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_req_lat_if.c:1769:2: not=
e: Taking false branch
           if (!vsi) {
           ^
   drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_req_lat_if.c:1777:6: not=
e: Assuming field 'core_vsi' is non-null
           if (!instance->core_vsi) {
               ^~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_req_lat_if.c:1777:2: not=
e: Taking false branch
           if (!instance->core_vsi) {
           ^
   drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_req_lat_if.c:1788:8: not=
e: Calling 'vdec_vp9_slice_init_default_frame_ctx'
           ret =3D vdec_vp9_slice_init_default_frame_ctx(instance);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_req_lat_if.c:522:6: note=
: Assuming 'ctx' is null
           if (!ctx || !vsi) {
               ^~~~
   drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_req_lat_if.c:522:11: not=
e: Left side of '||' is true
           if (!ctx || !vsi) {
                    ^
   drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_req_lat_if.c:523:3: note=
: Access to field 'id' results in a dereference of a null pointer (loaded f=
rom field 'ctx')
                   mtk_vcodec_err(instance, "invalid ctx or vsi 0x%px 0x%px=
\n",
                   ^
   drivers/media/platform/mtk-vcodec/vdec/../mtk_vcodec_util.h:38:9: note: =
expanded from macro 'mtk_vcodec_err'
                  ((struct mtk_vcodec_ctx *)h->ctx)->id, __func__, ##args)
                  ^                            ~~~
   include/linux/printk.h:343:33: note: expanded from macro 'pr_err'
           printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
                                          ^~~~~~~~~~~
>> drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_req_lat_if.c:2068:4: war=
ning: Dereference of null pointer [clang-analyzer-core.NullDereference]
                           pfc->vsi.trans.dma_addr_end);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_req_lat_if.c:2005:6: not=
e: Assuming 'lat_buf' is non-null
           if (!lat_buf)
               ^~~~~~~~
   drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_req_lat_if.c:2005:2: not=
e: Taking false branch
           if (!lat_buf)
           ^
   drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_req_lat_if.c:2008:2: not=
e: Value assigned to 'pfc'
           pfc =3D lat_buf->private_data;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_req_lat_if.c:2010:6: not=
e: Assuming 'pfc' is null
           if (!pfc || !ctx)
               ^~~~
   drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_req_lat_if.c:2010:11: no=
te: Left side of '||' is true
           if (!pfc || !ctx)
                    ^
   drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_req_lat_if.c:2011:3: not=
e: Control jumps to line 2065
                   goto err;
                   ^
   drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_req_lat_if.c:2065:6: not=
e: Assuming 'ctx' is non-null
           if (ctx) {
               ^~~
   drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_req_lat_if.c:2065:2: not=
e: Taking true branch
           if (ctx) {
           ^
   drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_req_lat_if.c:2068:4: not=
e: Dereference of null pointer
                           pfc->vsi.trans.dma_addr_end);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   lib/math/reciprocal_div.c:48:14: warning: The result of the left shift i=
s undefined due to shifting by '64', which is greater or equal to the width=
 of type 'unsigned long long' [clang-analyzer-core.UndefinedBinaryOperatorR=
esult]
           mlow =3D 1ULL << (32 + l);
                       ^  ~~~~~~~~
   lib/math/reciprocal_div.c:44:7: note: Assuming 'l' is equal to 32
           WARN(l =3D=3D 32,
                ^
   include/asm-generic/bug.h:128:25: note: expanded from macro 'WARN'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   lib/math/reciprocal_div.c:44:2: note: Taking true branch
           WARN(l =3D=3D 32,
           ^
   include/asm-generic/bug.h:129:2: note: expanded from macro 'WARN'
           if (unlikely(__ret_warn_on))                                    \
           ^
   lib/math/reciprocal_div.c:44:2: note: Loop condition is false.  Exiting =
loop
           WARN(l =3D=3D 32,
           ^
   include/asm-generic/bug.h:130:3: note: expanded from macro 'WARN'
                   __WARN_printf(TAINT_WARN, format);                      \
                   ^
   include/asm-generic/bug.h:88:3: note: expanded from macro '__WARN_printf'
                   instrumentation_begin();                                \
                   ^
   include/linux/instrumentation.h:53:34: note: expanded from macro 'instru=
mentation_begin'
   # define instrumentation_begin()        do { } while(0)
                                           ^
   lib/math/reciprocal_div.c:44:2: note: Loop condition is false.  Exiting =
loop
           WARN(l =3D=3D 32,
           ^
   include/asm-generic/bug.h:130:3: note: expanded from macro 'WARN'
                   __WARN_printf(TAINT_WARN, format);                      \
                   ^
   include/asm-generic/bug.h:90:3: note: expanded from macro '__WARN_printf'
                   instrumentation_end();                                  \
                   ^
   include/linux/instrumentation.h:54:33: note: expanded from macro 'instru=
mentation_end'
   # define instrumentation_end()          do { } while(0)
                                           ^
   lib/math/reciprocal_div.c:44:2: note: Loop condition is false.  Exiting =
loop
           WARN(l =3D=3D 32,
           ^
   include/asm-generic/bug.h:130:3: note: expanded from macro 'WARN'
                   __WARN_printf(TAINT_WARN, format);                      \
                   ^
   include/asm-generic/bug.h:87:38: note: expanded from macro '__WARN_print=
f'
   #define __WARN_printf(taint, arg...) do {                               \
                                        ^
   lib/math/reciprocal_div.c:48:14: note: The result of the left shift is u=
ndefined due to shifting by '64', which is greater or equal to the width of=
 type 'unsigned long long'
           mlow =3D 1ULL << (32 + l);
                       ^  ~~~~~~~~
   2 warnings generated.
   drivers/clk/clk.c:423:19: warning: Value stored to 'parent' during its i=
nitialization is never read [clang-analyzer-deadcode.DeadStores]
           struct clk_core *parent =3D ERR_PTR(-ENOENT);
                            ^~~~~~   ~~~~~~~~~~~~~~~~
   drivers/clk/clk.c:423:19: note: Value stored to 'parent' during its init=
ialization is never read
           struct clk_core *parent =3D ERR_PTR(-ENOENT);
                            ^~~~~~   ~~~~~~~~~~~~~~~~
   drivers/clk/clk.c:1930:3: warning: Value stored to 'best_parent_rate' is=
 never read [clang-analyzer-deadcode.DeadStores]
                   best_parent_rate =3D parent->rate;
                   ^                  ~~~~~~~~~~~~
   drivers/clk/clk.c:1930:3: note: Value stored to 'best_parent_rate' is ne=
ver read
                   best_parent_rate =3D parent->rate;
                   ^                  ~~~~~~~~~~~~
   2 warnings generated.
   drivers/clk/clk-divider.c:330:9: warning: Division by zero [clang-analyz=
er-core.DivideZero]
                   now =3D DIV_ROUND_UP_ULL((u64)parent_rate, i);
                         ^
   include/linux/kernel.h:91:2: note: expanded from macro 'DIV_ROUND_UP_ULL'

vim +2068 drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_req_lat_if.c

ed87340a6d1e04 Yunfei Dong 2021-01-21  1995  =

ed87340a6d1e04 Yunfei Dong 2021-01-21  1996  static int vdec_vp9_slice_core=
_decode(
ed87340a6d1e04 Yunfei Dong 2021-01-21  1997  	struct vdec_lat_buf *lat_buf)
ed87340a6d1e04 Yunfei Dong 2021-01-21  1998  {
ed87340a6d1e04 Yunfei Dong 2021-01-21  1999  	struct vdec_vp9_slice_instanc=
e *instance;
ed87340a6d1e04 Yunfei Dong 2021-01-21  2000  	struct vdec_vp9_slice_pfc *pf=
c;
ed87340a6d1e04 Yunfei Dong 2021-01-21  2001  	struct mtk_vcodec_ctx *ctx =
=3D NULL;
ed87340a6d1e04 Yunfei Dong 2021-01-21  2002  	struct vdec_fb *fb =3D NULL;
ed87340a6d1e04 Yunfei Dong 2021-01-21  2003  	int ret =3D -EINVAL;
ed87340a6d1e04 Yunfei Dong 2021-01-21  2004  =

ed87340a6d1e04 Yunfei Dong 2021-01-21  2005  	if (!lat_buf)
ed87340a6d1e04 Yunfei Dong 2021-01-21  2006  		goto err;
ed87340a6d1e04 Yunfei Dong 2021-01-21  2007  =

ed87340a6d1e04 Yunfei Dong 2021-01-21  2008  	pfc =3D lat_buf->private_data;
ed87340a6d1e04 Yunfei Dong 2021-01-21  2009  	ctx =3D lat_buf->ctx;
ed87340a6d1e04 Yunfei Dong 2021-01-21  2010  	if (!pfc || !ctx)
ed87340a6d1e04 Yunfei Dong 2021-01-21  2011  		goto err;
ed87340a6d1e04 Yunfei Dong 2021-01-21  2012  =

ed87340a6d1e04 Yunfei Dong 2021-01-21  2013  	instance =3D ctx->drv_handle;
ed87340a6d1e04 Yunfei Dong 2021-01-21  2014  	if (!instance)
ed87340a6d1e04 Yunfei Dong 2021-01-21  2015  		goto err;
ed87340a6d1e04 Yunfei Dong 2021-01-21  2016  =

ed87340a6d1e04 Yunfei Dong 2021-01-21  2017  	fb =3D ctx->dev->vdec_pdata->=
get_cap_buffer(ctx);
ed87340a6d1e04 Yunfei Dong 2021-01-21  2018  	if (!fb) {
ed87340a6d1e04 Yunfei Dong 2021-01-21  2019  		ret =3D -EBUSY;
ed87340a6d1e04 Yunfei Dong 2021-01-21  2020  		goto err;
ed87340a6d1e04 Yunfei Dong 2021-01-21  2021  	}
ed87340a6d1e04 Yunfei Dong 2021-01-21  2022  =

ed87340a6d1e04 Yunfei Dong 2021-01-21  2023  	ret =3D vdec_vp9_slice_setup_=
core(instance, fb, lat_buf, pfc);
ed87340a6d1e04 Yunfei Dong 2021-01-21  2024  	if (ret) {
ed87340a6d1e04 Yunfei Dong 2021-01-21  2025  		mtk_vcodec_err(instance, "vd=
ec_vp9_slice_setup_core\n");
ed87340a6d1e04 Yunfei Dong 2021-01-21  2026  		goto err;
ed87340a6d1e04 Yunfei Dong 2021-01-21  2027  	}
ed87340a6d1e04 Yunfei Dong 2021-01-21  2028  	vdec_vp9_slice_vsi_to_remote(=
&pfc->vsi, instance->core_vsi);
ed87340a6d1e04 Yunfei Dong 2021-01-21  2029  =

ed87340a6d1e04 Yunfei Dong 2021-01-21  2030  	ret =3D vpu_dec_core(&instanc=
e->vpu);
ed87340a6d1e04 Yunfei Dong 2021-01-21  2031  	if (ret) {
ed87340a6d1e04 Yunfei Dong 2021-01-21  2032  		mtk_vcodec_err(instance, "vp=
u_dec_core\n");
ed87340a6d1e04 Yunfei Dong 2021-01-21  2033  		goto err;
ed87340a6d1e04 Yunfei Dong 2021-01-21  2034  	}
ed87340a6d1e04 Yunfei Dong 2021-01-21  2035  =

ed87340a6d1e04 Yunfei Dong 2021-01-21  2036  	if (instance->irq) {
ed87340a6d1e04 Yunfei Dong 2021-01-21  2037  		ret =3D mtk_vcodec_wait_for_=
comp_done_ctx(ctx,
ed87340a6d1e04 Yunfei Dong 2021-01-21  2038  			MTK_INST_IRQ_RECEIVED,
ed87340a6d1e04 Yunfei Dong 2021-01-21  2039  			WAIT_INTR_TIMEOUT_MS, MTK_V=
DEC_CORE);
ed87340a6d1e04 Yunfei Dong 2021-01-21  2040  		/* update remote vsi if deco=
de timeout */
ed87340a6d1e04 Yunfei Dong 2021-01-21  2041  		if (ret) {
ed87340a6d1e04 Yunfei Dong 2021-01-21  2042  			mtk_vcodec_err(instance, "V=
P9 core timeout\n");
ed87340a6d1e04 Yunfei Dong 2021-01-21  2043  			writel(1, &instance->core_v=
si->state.timeout);
ed87340a6d1e04 Yunfei Dong 2021-01-21  2044  		}
ed87340a6d1e04 Yunfei Dong 2021-01-21  2045  		vpu_dec_core_end(&instance->=
vpu);
ed87340a6d1e04 Yunfei Dong 2021-01-21  2046  	}
ed87340a6d1e04 Yunfei Dong 2021-01-21  2047  =

ed87340a6d1e04 Yunfei Dong 2021-01-21  2048  	vdec_vp9_slice_vsi_from_remot=
e(&pfc->vsi, instance->core_vsi, 1);
ed87340a6d1e04 Yunfei Dong 2021-01-21  2049  	ret =3D vdec_vp9_slice_update=
_core(instance, lat_buf, pfc);
ed87340a6d1e04 Yunfei Dong 2021-01-21  2050  	if (ret) {
ed87340a6d1e04 Yunfei Dong 2021-01-21  2051  		mtk_vcodec_err(instance, "vd=
ec_vp9_slice_update_core\n");
ed87340a6d1e04 Yunfei Dong 2021-01-21  2052  		goto err;
ed87340a6d1e04 Yunfei Dong 2021-01-21  2053  	}
ed87340a6d1e04 Yunfei Dong 2021-01-21  2054  =

ed87340a6d1e04 Yunfei Dong 2021-01-21  2055  	pfc->vsi.trans.dma_addr_end +=
=3D ctx->msg_queue.wdma_addr.dma_addr;
ed87340a6d1e04 Yunfei Dong 2021-01-21  2056  	mtk_vcodec_debug(instance, "c=
ore dma_addr_end 0x%llx\n",
ed87340a6d1e04 Yunfei Dong 2021-01-21  2057  		pfc->vsi.trans.dma_addr_end);
ed87340a6d1e04 Yunfei Dong 2021-01-21  2058  	vdec_msg_queue_update_ube_rpt=
r(&ctx->msg_queue,
ed87340a6d1e04 Yunfei Dong 2021-01-21  2059  		pfc->vsi.trans.dma_addr_end);
ed87340a6d1e04 Yunfei Dong 2021-01-21  2060  	ctx->dev->vdec_pdata->cap_to_=
disp(ctx, fb, 0);
ed87340a6d1e04 Yunfei Dong 2021-01-21  2061  =

ed87340a6d1e04 Yunfei Dong 2021-01-21  2062  	return 0;
ed87340a6d1e04 Yunfei Dong 2021-01-21  2063  =

ed87340a6d1e04 Yunfei Dong 2021-01-21  2064  err:
ed87340a6d1e04 Yunfei Dong 2021-01-21  2065  	if (ctx) {
ed87340a6d1e04 Yunfei Dong 2021-01-21  2066  		/* always update read pointe=
r */
ed87340a6d1e04 Yunfei Dong 2021-01-21  2067  		vdec_msg_queue_update_ube_rp=
tr(&ctx->msg_queue,
ed87340a6d1e04 Yunfei Dong 2021-01-21 @2068  			pfc->vsi.trans.dma_addr_end=
);
ed87340a6d1e04 Yunfei Dong 2021-01-21  2069  =

ed87340a6d1e04 Yunfei Dong 2021-01-21  2070  		if (fb)
ed87340a6d1e04 Yunfei Dong 2021-01-21  2071  			ctx->dev->vdec_pdata->cap_t=
o_disp(ctx, fb, 1);
ed87340a6d1e04 Yunfei Dong 2021-01-21  2072  	}
ed87340a6d1e04 Yunfei Dong 2021-01-21  2073  	return ret;
ed87340a6d1e04 Yunfei Dong 2021-01-21  2074  }
ed87340a6d1e04 Yunfei Dong 2021-01-21  2075  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8499527726133868013==--

