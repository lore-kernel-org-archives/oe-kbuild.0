Content-Type: multipart/mixed; boundary="===============5173047833364434794=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c:184:2: warning: Value stored to 'rem' is never read [clang-analyzer-deadcode.DeadStores]
Date: Sun, 09 Jan 2022 13:09:02 +0800
Message-ID: <202201091319.GI9nm5ou-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5173047833364434794==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@chromium.org>
CC: Abhinav Kumar <abhinavk@codeaurora.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   4634129ad9fdc89d10b597fc6f8f4336fb61e105
commit: d6d1439ec43808447d25ea5c17012ca713ef7c4e drm/msm/dsi: fuse dsi_pll_=
* code into dsi_phy_* code
date:   9 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 9 months ago
config: arm-randconfig-c002-20220106 (https://download.01.org/0day-ci/archi=
ve/20220109/202201091319.GI9nm5ou-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project ca7ffe=
09dc6e525109e3cd570cc5182ce568be13)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dd6d1439ec43808447d25ea5c17012ca713ef7c4e
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout d6d1439ec43808447d25ea5c17012ca713ef7c4e
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   kernel/trace/trace.c:352:2: warning: Access to field 'next' results in a=
 dereference of a null pointer [clang-analyzer-core.NullDereference]
           rcu_assign_pointer(*p, (*p)->next);
           ^
   include/linux/rcupdate.h:431:35: note: expanded from macro 'rcu_assign_p=
ointer'
           uintptr_t _r_a_p__v =3D (uintptr_t)(v);                         =
        \
                                            ^
   kernel/trace/trace.c:395:2: note: Value assigned to 'ftrace_exports_list'
           mutex_lock(&ftrace_export_lock);
           ^
   include/linux/mutex.h:167:26: note: expanded from macro 'mutex_lock'
   #define mutex_lock(lock) mutex_lock_nested(lock, 0)
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:397:8: note: Calling 'rm_ftrace_export'
           ret =3D rm_ftrace_export(&ftrace_exports_list, export);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:370:8: note: Calling 'rm_trace_export'
           ret =3D rm_trace_export(list, export);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:345:17: note: Assuming the condition is false
           for (p =3D list; *p !=3D NULL; p =3D &(*p)->next)
                          ^~~~~~~~~~
   kernel/trace/trace.c:345:17: note: Assuming pointer value is null
           for (p =3D list; *p !=3D NULL; p =3D &(*p)->next)
                          ^~~~~~~~~~
   kernel/trace/trace.c:345:2: note: Loop condition is false. Execution con=
tinues on line 349
           for (p =3D list; *p !=3D NULL; p =3D &(*p)->next)
           ^
   kernel/trace/trace.c:349:6: note: Assuming the condition is false
           if (*p !=3D export)
               ^~~~~~~~~~~~
   kernel/trace/trace.c:349:2: note: Taking false branch
           if (*p !=3D export)
           ^
   kernel/trace/trace.c:352:2: note: Access to field 'next' results in a de=
reference of a null pointer
           rcu_assign_pointer(*p, (*p)->next);
           ^
   include/linux/rcupdate.h:431:35: note: expanded from macro 'rcu_assign_p=
ointer'
           uintptr_t _r_a_p__v =3D (uintptr_t)(v);                         =
        \
                                            ^~~
   kernel/trace/trace.c:2443:3: warning: Call to function 'strcpy' is insec=
ure as it does not provide bounding of the memory buffer. Replace unbounded=
 copy functions with analogous functions that support length arguments such=
 as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(comm, "<idle>");
                   ^~~~~~
   kernel/trace/trace.c:2443:3: note: Call to function 'strcpy' is insecure=
 as it does not provide bounding of the memory buffer. Replace unbounded co=
py functions with analogous functions that support length arguments such as=
 'strlcpy'. CWE-119
                   strcpy(comm, "<idle>");
                   ^~~~~~
   kernel/trace/trace.c:2448:3: warning: Call to function 'strcpy' is insec=
ure as it does not provide bounding of the memory buffer. Replace unbounded=
 copy functions with analogous functions that support length arguments such=
 as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(comm, "<XXX>");
                   ^~~~~~
   kernel/trace/trace.c:2448:3: note: Call to function 'strcpy' is insecure=
 as it does not provide bounding of the memory buffer. Replace unbounded co=
py functions with analogous functions that support length arguments such as=
 'strlcpy'. CWE-119
                   strcpy(comm, "<XXX>");
                   ^~~~~~
   kernel/trace/trace.c:2453:3: warning: Call to function 'strcpy' is insec=
ure as it does not provide bounding of the memory buffer. Replace unbounded=
 copy functions with analogous functions that support length arguments such=
 as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(comm, "<...>");
                   ^~~~~~
   kernel/trace/trace.c:2453:3: note: Call to function 'strcpy' is insecure=
 as it does not provide bounding of the memory buffer. Replace unbounded co=
py functions with analogous functions that support length arguments such as=
 'strlcpy'. CWE-119
                   strcpy(comm, "<...>");
                   ^~~~~~
   kernel/trace/trace.c:2461:3: warning: Call to function 'strcpy' is insec=
ure as it does not provide bounding of the memory buffer. Replace unbounded=
 copy functions with analogous functions that support length arguments such=
 as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(comm, "<...>");
                   ^~~~~~
   kernel/trace/trace.c:2461:3: note: Call to function 'strcpy' is insecure=
 as it does not provide bounding of the memory buffer. Replace unbounded co=
py functions with analogous functions that support length arguments such as=
 'strlcpy'. CWE-119
                   strcpy(comm, "<...>");
                   ^~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   drivers/gpu/drm/msm/dsi/dsi_host.c:870:3: warning: Value stored to 'data=
' is never read [clang-analyzer-deadcode.DeadStores]
                   data =3D DSI_VID_CFG1_RGB_SWAP(SWAP_RGB);
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/dsi/dsi_host.c:870:3: note: Value stored to 'data' i=
s never read
                   data =3D DSI_VID_CFG1_RGB_SWAP(SWAP_RGB);
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   drivers/gpu/drm/msm/dsi/phy/dsi_phy.c:36:3: warning: Value stored to 'tm=
ax' is never read [clang-analyzer-deadcode.DeadStores]
                   tmax =3D 511;
                   ^      ~~~
   drivers/gpu/drm/msm/dsi/phy/dsi_phy.c:36:3: note: Value stored to 'tmax'=
 is never read
                   tmax =3D 511;
                   ^      ~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
>> drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c:184:2: warning: Value stored =
to 'rem' is never read [clang-analyzer-deadcode.DeadStores]
           rem =3D 0;
           ^     ~
   drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c:184:2: note: Value stored to =
'rem' is never read
           rem =3D 0;
           ^     ~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   drivers/gpu/drm/msm/msm_gem.c:1274:2: warning: 1st function call argumen=
t is an uninitialized value [clang-analyzer-core.CallAndMessage]
           drm_gem_object_put(obj);
           ^                  ~~~
   drivers/gpu/drm/msm/msm_gem.c:1225:2: note: 'obj' declared without an in=
itial value
           struct drm_gem_object *obj;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/msm_gem.c:1230:6: note: Assuming the condition is fa=
lse
           if (!msm_use_mmu(dev)) {
               ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/msm_gem.c:1230:2: note: Taking false branch
           if (!msm_use_mmu(dev)) {
           ^
   drivers/gpu/drm/msm/msm_gem.c:1237:8: note: Calling 'msm_gem_new_impl'
           ret =3D msm_gem_new_impl(dev, size, MSM_BO_WC, &obj);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/msm_gem.c:1091:2: note: Control jumps to 'case 13107=
2:'  at line 1094
           switch (flags & MSM_BO_CACHE_MASK) {
           ^
   drivers/gpu/drm/msm/msm_gem.c:1095:3: note:  Execution continues on line=
 1102
                   break;
                   ^
   drivers/gpu/drm/msm/msm_gem.c:1102:12: note: Calling 'kzalloc'
           msm_obj =3D kzalloc(sizeof(*msm_obj), GFP_KERNEL);
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:684:9: note: Calling 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:542:2: note: Taking false branch
           if (__builtin_constant_p(size)) {
           ^
   include/linux/slab.h:559:2: note: Returning pointer, which participates =
in a condition later
           return __kmalloc(size, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:684:9: note: Returning from 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:684:2: note: Returning pointer, which participates =
in a condition later
           return kmalloc(size, flags | __GFP_ZERO);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/msm_gem.c:1102:12: note: Returning from 'kzalloc'
           msm_obj =3D kzalloc(sizeof(*msm_obj), GFP_KERNEL);
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/msm_gem.c:1103:6: note: Assuming 'msm_obj' is null, =
which participates in a condition later
           if (!msm_obj)
               ^~~~~~~~
   drivers/gpu/drm/msm/msm_gem.c:1103:2: note: Taking true branch
           if (!msm_obj)
           ^
   drivers/gpu/drm/msm/msm_gem.c:1104:3: note: Returning without writing to=
 '*obj'
                   return -ENOMEM;
                   ^
   drivers/gpu/drm/msm/msm_gem.c:1104:3: note: Returning the value -12, whi=
ch participates in a condition later
                   return -ENOMEM;
                   ^~~~~~~~~~~~~~
   drivers/gpu/drm/msm/msm_gem.c:1237:8: note: Returning from 'msm_gem_new_=
impl'
           ret =3D msm_gem_new_impl(dev, size, MSM_BO_WC, &obj);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/msm_gem.c:1238:6: note: 'ret' is -12
           if (ret)
               ^~~
   drivers/gpu/drm/msm/msm_gem.c:1238:2: note: Taking true branch
           if (ret)
           ^
   drivers/gpu/drm/msm/msm_gem.c:1239:3: note: Control jumps to line 1274
                   goto fail;

vim +/rem +184 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c

d6d1439ec43808 Dmitry Baryshkov 2021-03-31  124  =

d6d1439ec43808 Dmitry Baryshkov 2021-03-31  125  /*
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  126   * Clock Callbacks
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  127   */
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  128  static int dsi_pll_28nm_cl=
k_set_rate(struct clk_hw *hw, unsigned long rate,
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  129  		unsigned long parent_rat=
e)
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  130  {
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  131  	struct msm_dsi_pll *pll =
=3D hw_clk_to_pll(hw);
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  132  	struct dsi_pll_28nm *pll_=
28nm =3D to_pll_28nm(pll);
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  133  	struct device *dev =3D &p=
ll_28nm->pdev->dev;
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  134  	void __iomem *base =3D pl=
l_28nm->mmio;
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  135  	unsigned long div_fbx1000=
, gen_vco_clk;
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  136  	u32 refclk_cfg, frac_n_mo=
de, frac_n_value;
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  137  	u32 sdm_cfg0, sdm_cfg1, s=
dm_cfg2, sdm_cfg3;
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  138  	u32 cal_cfg10, cal_cfg11;
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  139  	u32 rem;
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  140  	int i;
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  141  =

d6d1439ec43808 Dmitry Baryshkov 2021-03-31  142  	VERB("rate=3D%lu, parent'=
s=3D%lu", rate, parent_rate);
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  143  =

d6d1439ec43808 Dmitry Baryshkov 2021-03-31  144  	/* Force postdiv2 to be d=
iv-4 */
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  145  	pll_write(base + REG_DSI_=
28nm_PHY_PLL_POSTDIV2_CFG, 3);
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  146  =

d6d1439ec43808 Dmitry Baryshkov 2021-03-31  147  	/* Configure the Loop fil=
ter resistance */
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  148  	for (i =3D 0; i < LPFR_LU=
T_SIZE; i++)
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  149  		if (rate <=3D lpfr_lut[i=
].vco_rate)
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  150  			break;
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  151  	if (i =3D=3D LPFR_LUT_SIZ=
E) {
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  152  		DRM_DEV_ERROR(dev, "unab=
le to get loop filter resistance. vco=3D%lu\n",
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  153  				rate);
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  154  		return -EINVAL;
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  155  	}
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  156  	pll_write(base + REG_DSI_=
28nm_PHY_PLL_LPFR_CFG, lpfr_lut[i].resistance);
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  157  =

d6d1439ec43808 Dmitry Baryshkov 2021-03-31  158  	/* Loop filter capacitanc=
e values : c1 and c2 */
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  159  	pll_write(base + REG_DSI_=
28nm_PHY_PLL_LPFC1_CFG, 0x70);
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  160  	pll_write(base + REG_DSI_=
28nm_PHY_PLL_LPFC2_CFG, 0x15);
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  161  =

d6d1439ec43808 Dmitry Baryshkov 2021-03-31  162  	rem =3D rate % VCO_REF_CL=
K_RATE;
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  163  	if (rem) {
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  164  		refclk_cfg =3D DSI_28nm_=
PHY_PLL_REFCLK_CFG_DBLR;
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  165  		frac_n_mode =3D 1;
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  166  		div_fbx1000 =3D rate / (=
VCO_REF_CLK_RATE / 500);
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  167  		gen_vco_clk =3D div_fbx1=
000 * (VCO_REF_CLK_RATE / 500);
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  168  	} else {
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  169  		refclk_cfg =3D 0x0;
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  170  		frac_n_mode =3D 0;
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  171  		div_fbx1000 =3D rate / (=
VCO_REF_CLK_RATE / 1000);
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  172  		gen_vco_clk =3D div_fbx1=
000 * (VCO_REF_CLK_RATE / 1000);
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  173  	}
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  174  =

d6d1439ec43808 Dmitry Baryshkov 2021-03-31  175  	DBG("refclk_cfg =3D %d", =
refclk_cfg);
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  176  =

d6d1439ec43808 Dmitry Baryshkov 2021-03-31  177  	rem =3D div_fbx1000 % 100=
0;
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  178  	frac_n_value =3D (rem << =
16) / 1000;
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  179  =

d6d1439ec43808 Dmitry Baryshkov 2021-03-31  180  	DBG("div_fb =3D %lu", div=
_fbx1000);
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  181  	DBG("frac_n_value =3D %d"=
, frac_n_value);
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  182  =

d6d1439ec43808 Dmitry Baryshkov 2021-03-31  183  	DBG("Generated VCO Clock:=
 %lu", gen_vco_clk);
d6d1439ec43808 Dmitry Baryshkov 2021-03-31 @184  	rem =3D 0;
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  185  	sdm_cfg1 =3D pll_read(bas=
e + REG_DSI_28nm_PHY_PLL_SDM_CFG1);
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  186  	sdm_cfg1 &=3D ~DSI_28nm_P=
HY_PLL_SDM_CFG1_DC_OFFSET__MASK;
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  187  	if (frac_n_mode) {
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  188  		sdm_cfg0 =3D 0x0;
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  189  		sdm_cfg0 |=3D DSI_28nm_P=
HY_PLL_SDM_CFG0_BYP_DIV(0);
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  190  		sdm_cfg1 |=3D DSI_28nm_P=
HY_PLL_SDM_CFG1_DC_OFFSET(
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  191  				(u32)(((div_fbx1000 / =
1000) & 0x3f) - 1));
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  192  		sdm_cfg3 =3D frac_n_valu=
e >> 8;
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  193  		sdm_cfg2 =3D frac_n_valu=
e & 0xff;
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  194  	} else {
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  195  		sdm_cfg0 =3D DSI_28nm_PH=
Y_PLL_SDM_CFG0_BYP;
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  196  		sdm_cfg0 |=3D DSI_28nm_P=
HY_PLL_SDM_CFG0_BYP_DIV(
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  197  				(u32)(((div_fbx1000 / =
1000) & 0x3f) - 1));
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  198  		sdm_cfg1 |=3D DSI_28nm_P=
HY_PLL_SDM_CFG1_DC_OFFSET(0);
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  199  		sdm_cfg2 =3D 0;
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  200  		sdm_cfg3 =3D 0;
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  201  	}
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  202  =

d6d1439ec43808 Dmitry Baryshkov 2021-03-31  203  	DBG("sdm_cfg0=3D%d", sdm_=
cfg0);
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  204  	DBG("sdm_cfg1=3D%d", sdm_=
cfg1);
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  205  	DBG("sdm_cfg2=3D%d", sdm_=
cfg2);
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  206  	DBG("sdm_cfg3=3D%d", sdm_=
cfg3);
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  207  =

d6d1439ec43808 Dmitry Baryshkov 2021-03-31  208  	cal_cfg11 =3D (u32)(gen_v=
co_clk / (256 * 1000000));
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  209  	cal_cfg10 =3D (u32)((gen_=
vco_clk % (256 * 1000000)) / 1000000);
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  210  	DBG("cal_cfg10=3D%d, cal_=
cfg11=3D%d", cal_cfg10, cal_cfg11);
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  211  =

d6d1439ec43808 Dmitry Baryshkov 2021-03-31  212  	pll_write(base + REG_DSI_=
28nm_PHY_PLL_CHGPUMP_CFG, 0x02);
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  213  	pll_write(base + REG_DSI_=
28nm_PHY_PLL_CAL_CFG3,    0x2b);
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  214  	pll_write(base + REG_DSI_=
28nm_PHY_PLL_CAL_CFG4,    0x06);
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  215  	pll_write(base + REG_DSI_=
28nm_PHY_PLL_LKDET_CFG2,  0x0d);
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  216  =

d6d1439ec43808 Dmitry Baryshkov 2021-03-31  217  	pll_write(base + REG_DSI_=
28nm_PHY_PLL_SDM_CFG1, sdm_cfg1);
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  218  	pll_write(base + REG_DSI_=
28nm_PHY_PLL_SDM_CFG2,
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  219  		DSI_28nm_PHY_PLL_SDM_CFG=
2_FREQ_SEED_7_0(sdm_cfg2));
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  220  	pll_write(base + REG_DSI_=
28nm_PHY_PLL_SDM_CFG3,
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  221  		DSI_28nm_PHY_PLL_SDM_CFG=
3_FREQ_SEED_15_8(sdm_cfg3));
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  222  	pll_write(base + REG_DSI_=
28nm_PHY_PLL_SDM_CFG4, 0x00);
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  223  =

d6d1439ec43808 Dmitry Baryshkov 2021-03-31  224  	/* Add hardware recommend=
ed delay for correct PLL configuration */
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  225  	if (pll_28nm->vco_delay)
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  226  		udelay(pll_28nm->vco_del=
ay);
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  227  =

d6d1439ec43808 Dmitry Baryshkov 2021-03-31  228  	pll_write(base + REG_DSI_=
28nm_PHY_PLL_REFCLK_CFG, refclk_cfg);
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  229  	pll_write(base + REG_DSI_=
28nm_PHY_PLL_PWRGEN_CFG, 0x00);
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  230  	pll_write(base + REG_DSI_=
28nm_PHY_PLL_VCOLPF_CFG, 0x31);
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  231  	pll_write(base + REG_DSI_=
28nm_PHY_PLL_SDM_CFG0,   sdm_cfg0);
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  232  	pll_write(base + REG_DSI_=
28nm_PHY_PLL_CAL_CFG0,   0x12);
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  233  	pll_write(base + REG_DSI_=
28nm_PHY_PLL_CAL_CFG6,   0x30);
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  234  	pll_write(base + REG_DSI_=
28nm_PHY_PLL_CAL_CFG7,   0x00);
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  235  	pll_write(base + REG_DSI_=
28nm_PHY_PLL_CAL_CFG8,   0x60);
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  236  	pll_write(base + REG_DSI_=
28nm_PHY_PLL_CAL_CFG9,   0x00);
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  237  	pll_write(base + REG_DSI_=
28nm_PHY_PLL_CAL_CFG10,  cal_cfg10 & 0xff);
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  238  	pll_write(base + REG_DSI_=
28nm_PHY_PLL_CAL_CFG11,  cal_cfg11 & 0xff);
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  239  	pll_write(base + REG_DSI_=
28nm_PHY_PLL_EFUSE_CFG,  0x20);
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  240  =

d6d1439ec43808 Dmitry Baryshkov 2021-03-31  241  	return 0;
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  242  }
d6d1439ec43808 Dmitry Baryshkov 2021-03-31  243  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5173047833364434794==--

