Content-Type: multipart/mixed; boundary="===============2977280572445655127=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 1/2] drm: Introduce DRM_BRIDGE_OP_UPSTREAM_FIRST to alter bridge init order
Date: Fri, 18 Feb 2022 13:10:10 +0800
Message-ID: <202202181224.jg5yWUAo-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2977280572445655127==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
In-Reply-To: <4c6511bd7f4ce52aa3323141b6f0a68ae2773787.1645029005.git.dave.=
stevenson@raspberrypi.com>
References: <4c6511bd7f4ce52aa3323141b6f0a68ae2773787.1645029005.git.dave.s=
tevenson@raspberrypi.com>
TO: Dave Stevenson <dave.stevenson@raspberrypi.com>
TO: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
TO: Maxime Ripard <mripard@kernel.org>
TO: Thomas Zimmermann <tzimmermann@suse.de>
TO: David Airlie <airlied@linux.ie>
TO: Daniel Vetter <daniel@ffwll.ch>
TO: dri-devel(a)lists.freedesktop.org
CC: Marek Vasut <marex@denx.de>
CC: Jonas Karlman <jonas@kwiboo.se>
CC: Robert Foss <robert.foss@linaro.org>
CC: Neil Armstrong <narmstrong@baylibre.com>
CC: Douglas Anderson <dianders@chromium.org>
CC: Jernej Skrabec <jernej.skrabec@gmail.com>
CC: andrzej.hajda(a)gmail.com
CC: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
CC: Andrzej Hajda <andrzej.hajda@intel.com>
CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Dave Stevenson <dave.stevenson@raspberrypi.com>
CC: Jagan Teki <jagan@amarulasolutions.com>

Hi Dave,

I love your patch! Perhaps something to improve:

[auto build test WARNING on drm/drm-next]
[also build test WARNING on v5.17-rc4 next-20220217]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Dave-Stevenson/DSI-host-an=
d-peripheral-initialisation-ordering/20220217-010120
base:   git://anongit.freedesktop.org/drm/drm drm-next
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: mips-randconfig-c004-20220216 (https://download.01.org/0day-ci/arch=
ive/20220218/202202181224.jg5yWUAo-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0e628a=
783b935c70c80815db6c061ec84f884af5)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://github.com/0day-ci/linux/commit/a483cd9be6fb2c1fc1cbf88a0=
df3a28723630519
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Dave-Stevenson/DSI-host-and-periph=
eral-initialisation-ordering/20220217-010120
        git checkout a483cd9be6fb2c1fc1cbf88a0df3a28723630519
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dmips clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   include/linux/compiler_types.h:334:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:318:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   mm/zsmalloc.c:1901:2: note: Loop condition is false.  Exiting loop
           kunmap_atomic(s_addr);
           ^
   include/linux/highmem-internal.h:243:35: note: expanded from macro 'kunm=
ap_atomic'
   #define kunmap_atomic(__addr)                                   \
                                                                   ^
   mm/zsmalloc.c:1903:2: note: Calling 'replace_sub_page'
           replace_sub_page(class, zspage, newpage, page);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/zsmalloc.c:1801:2: note: Initializing to a null pointer value
           struct page *pages[ZS_MAX_PAGES_PER_ZSPAGE] =3D {NULL, };
           ^~~~~~~~~~~~~~~~~~
   mm/zsmalloc.c:1806:7: note: Assuming 'page' is not equal to 'oldpage'
                   if (page =3D=3D oldpage)
                       ^~~~~~~~~~~~~~~
   mm/zsmalloc.c:1806:3: note: Taking false branch
                   if (page =3D=3D oldpage)
                   ^
   mm/zsmalloc.c:1805:2: note: Loop condition is false.  Exiting loop
           do {
           ^
   mm/zsmalloc.c:1813:2: note: Calling 'create_page_chain'
           create_page_chain(class, zspage, pages);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/zsmalloc.c:1033:14: note: Assuming 'i' is < 'nr_pages'
           for (i =3D 0; i < nr_pages; i++) {
                       ^~~~~~~~~~~~
   mm/zsmalloc.c:1033:2: note: Loop condition is true.  Entering loop body
           for (i =3D 0; i < nr_pages; i++) {
           ^
   mm/zsmalloc.c:1037:7: note: 'i' is equal to 0
                   if (i =3D=3D 0) {
                       ^
   mm/zsmalloc.c:1037:3: note: Taking true branch
                   if (i =3D=3D 0) {
                   ^
   mm/zsmalloc.c:1040:17: note: Assuming field 'objs_per_zspage' is not equ=
al to 1
                           if (unlikely(class->objs_per_zspage =3D=3D 1 &&
                                        ^
   include/linux/compiler.h:48:41: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                                             ^
   include/linux/compiler.h:33:34: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                         ^
   mm/zsmalloc.c:1040:45: note: Left side of '&&' is false
                           if (unlikely(class->objs_per_zspage =3D=3D 1 &&
                                                                    ^
   mm/zsmalloc.c:1040:24: note: Field 'objs_per_zspage' is not equal to 1
                           if (unlikely(class->objs_per_zspage =3D=3D 1 &&
                                               ^
   mm/zsmalloc.c:1040:45: note: Left side of '&&' is false
                           if (unlikely(class->objs_per_zspage =3D=3D 1 &&
                                                                    ^
   mm/zsmalloc.c:1040:4: note: Taking false branch
                           if (unlikely(class->objs_per_zspage =3D=3D 1 &&
                           ^
   mm/zsmalloc.c:1033:28: note: The value 1 is assigned to 'i'
           for (i =3D 0; i < nr_pages; i++) {
                                     ^~~
   mm/zsmalloc.c:1033:14: note: Assuming 'i' is < 'nr_pages'
           for (i =3D 0; i < nr_pages; i++) {
                       ^~~~~~~~~~~~
   mm/zsmalloc.c:1033:2: note: Loop condition is true.  Entering loop body
           for (i =3D 0; i < nr_pages; i++) {
           ^
   mm/zsmalloc.c:1034:3: note: Null pointer value stored to 'page'
                   page =3D pages[i];
                   ^~~~~~~~~~~~~~~
   mm/zsmalloc.c:1035:20: note: Passing null pointer value via 1st paramete=
r 'page'
                   set_page_private(page, (unsigned long)zspage);
                                    ^~~~
   mm/zsmalloc.c:1035:3: note: Calling 'set_page_private'
                   set_page_private(page, (unsigned long)zspage);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mm_types.h:309:16: note: Dereference of null pointer
           page->private =3D private;
           ~~~~~~~~~~~~~~^~~~~~~~~
   mm/zsmalloc.c:934:2: warning: Value stored to 'next' is never read [clan=
g-analyzer-deadcode.DeadStores]
           next =3D page =3D get_first_page(zspage);
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/zsmalloc.c:934:2: note: Value stored to 'next' is never read
           next =3D page =3D get_first_page(zspage);
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
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
   3 warnings generated.
>> drivers/gpu/drm/drm_bridge.c:662:9: warning: Assigned value is garbage o=
r undefined [clang-analyzer-core.uninitialized.Assign]
                           iter =3D limit;
                                ^ ~~~~~
   drivers/gpu/drm/drm_bridge.c:625:35: note: 'limit' declared without an i=
nitial value
           struct drm_bridge *iter, *next, *limit;
                                            ^~~~~
   drivers/gpu/drm/drm_bridge.c:627:6: note: Assuming 'bridge' is non-null
           if (!bridge)
               ^~~~~~~
   drivers/gpu/drm/drm_bridge.c:627:2: note: Taking false branch
           if (!bridge)
           ^
   drivers/gpu/drm/drm_bridge.c:632:2: note: Loop condition is true.  Enter=
ing loop body
           list_for_each_entry_reverse(iter, &encoder->bridge_chain, chain_=
node) {
           ^
   include/linux/list.h:649:2: note: expanded from macro 'list_for_each_ent=
ry_reverse'
           for (pos =3D list_last_entry(head, typeof(*pos), member);       =
  \
           ^
   drivers/gpu/drm/drm_bridge.c:633:7: note: Assuming the condition is false
                   if (iter->ops & DRM_BRIDGE_OP_UPSTREAM_FIRST) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_bridge.c:633:3: note: Taking false branch
                   if (iter->ops & DRM_BRIDGE_OP_UPSTREAM_FIRST) {
                   ^
   drivers/gpu/drm/drm_bridge.c:658:7: note: Assuming field 'pre_enable' is=
 non-null
                   if (iter->funcs->pre_enable)
                       ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_bridge.c:658:3: note: Taking true branch
                   if (iter->funcs->pre_enable)
                   ^
   drivers/gpu/drm/drm_bridge.c:661:7: note: Assuming the condition is true
                   if (iter->ops & DRM_BRIDGE_OP_UPSTREAM_FIRST)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_bridge.c:661:3: note: Taking true branch
                   if (iter->ops & DRM_BRIDGE_OP_UPSTREAM_FIRST)
                   ^
   drivers/gpu/drm/drm_bridge.c:662:9: note: Assigned value is garbage or u=
ndefined
                           iter =3D limit;
                                ^ ~~~~~
   drivers/gpu/drm/drm_bridge.c:894:9: warning: Assigned value is garbage o=
r undefined [clang-analyzer-core.uninitialized.Assign]
                           iter =3D limit;
                                ^ ~~~~~
   drivers/gpu/drm/drm_bridge.c:859:35: note: 'limit' declared without an i=
nitial value
           struct drm_bridge *iter, *next, *limit;
                                            ^~~~~
   drivers/gpu/drm/drm_bridge.c:861:6: note: Assuming 'bridge' is non-null
           if (!bridge)
               ^~~~~~~
   drivers/gpu/drm/drm_bridge.c:861:2: note: Taking false branch
           if (!bridge)
           ^
   drivers/gpu/drm/drm_bridge.c:866:2: note: Loop condition is true.  Enter=
ing loop body
           list_for_each_entry_reverse(iter, &encoder->bridge_chain, chain_=
node) {
           ^
   include/linux/list.h:649:2: note: expanded from macro 'list_for_each_ent=
ry_reverse'
           for (pos =3D list_last_entry(head, typeof(*pos), member);       =
  \
           ^
   drivers/gpu/drm/drm_bridge.c:867:7: note: Assuming the condition is false
                   if (iter->ops & DRM_BRIDGE_OP_UPSTREAM_FIRST) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_bridge.c:867:3: note: Taking false branch
                   if (iter->ops & DRM_BRIDGE_OP_UPSTREAM_FIRST) {
                   ^
   drivers/gpu/drm/drm_bridge.c:893:7: note: Assuming the condition is true
                   if (iter->ops & DRM_BRIDGE_OP_UPSTREAM_FIRST)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_bridge.c:893:3: note: Taking true branch
                   if (iter->ops & DRM_BRIDGE_OP_UPSTREAM_FIRST)
                   ^
   drivers/gpu/drm/drm_bridge.c:894:9: note: Assigned value is garbage or u=
ndefined
                           iter =3D limit;
                                ^ ~~~~~
   Suppressed 1 warnings (1 in non-user code).
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
   2 warnings generated.
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
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
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/dma/sh/rcar-dmac.c:914:20: warning: The right operand of '|' is =
a garbage value due to array index out of bounds [clang-analyzer-core.Undef=
inedBinaryOperatorResult]
           desc->chcr =3D chcr | chcr_ts[desc->xfer_shift];
                             ^
   drivers/dma/sh/rcar-dmac.c:1235:6: note: Assuming field 'mid_rid' is >=
=3D 0
           if (rchan->mid_rid < 0 || buf_len < period_len) {
               ^~~~~~~~~~~~~~~~~~
   drivers/dma/sh/rcar-dmac.c:1235:6: note: Left side of '||' is false
   drivers/dma/sh/rcar-dmac.c:1235:28: note: Assuming 'buf_len' is >=3D 'pe=
riod_len'

vim +662 drivers/gpu/drm/drm_bridge.c

862e686ce402992 Archit Taneja    2015-05-21  608  =

862e686ce402992 Archit Taneja    2015-05-21  609  /**
ea099adfdf4bf35 Boris Brezillon  2019-12-03  610   * drm_bridge_chain_pre_e=
nable - prepares for enabling all bridges in the
ea099adfdf4bf35 Boris Brezillon  2019-12-03  611   *				 encoder chain
862e686ce402992 Archit Taneja    2015-05-21  612   * @bridge: bridge contro=
l structure
862e686ce402992 Archit Taneja    2015-05-21  613   *
4541d31e2ab547f Daniel Vetter    2017-01-02  614   * Calls &drm_bridge_func=
s.pre_enable op for all the bridges in the encoder
862e686ce402992 Archit Taneja    2015-05-21  615   * chain, starting from t=
he last bridge to the first. These are called
862e686ce402992 Archit Taneja    2015-05-21  616   * before calling the enc=
oder's commit op.
a483cd9be6fb2c1 Dave Stevenson   2022-02-16  617   * If a bridge sets the D=
RM_BRIDGE_OP_UPSTREAM_FIRST, then the pre_enable for
a483cd9be6fb2c1 Dave Stevenson   2022-02-16  618   * the previous bridge wi=
ll be called before pre_enable of this bridge.
862e686ce402992 Archit Taneja    2015-05-21  619   *
862e686ce402992 Archit Taneja    2015-05-21  620   * Note: the bridge passe=
d should be the one closest to the encoder
862e686ce402992 Archit Taneja    2015-05-21  621   */
ea099adfdf4bf35 Boris Brezillon  2019-12-03  622  void drm_bridge_chain_pre=
_enable(struct drm_bridge *bridge)
862e686ce402992 Archit Taneja    2015-05-21  623  {
05193dc38197021 Boris Brezillon  2019-12-03  624  	struct drm_encoder *enco=
der;
a483cd9be6fb2c1 Dave Stevenson   2022-02-16  625  	struct drm_bridge *iter,=
 *next, *limit;
05193dc38197021 Boris Brezillon  2019-12-03  626  =

862e686ce402992 Archit Taneja    2015-05-21  627  	if (!bridge)
862e686ce402992 Archit Taneja    2015-05-21  628  		return;
862e686ce402992 Archit Taneja    2015-05-21  629  =

05193dc38197021 Boris Brezillon  2019-12-03  630  	encoder =3D bridge->enco=
der;
a483cd9be6fb2c1 Dave Stevenson   2022-02-16  631  =

05193dc38197021 Boris Brezillon  2019-12-03  632  	list_for_each_entry_reve=
rse(iter, &encoder->bridge_chain, chain_node) {
a483cd9be6fb2c1 Dave Stevenson   2022-02-16  633  		if (iter->ops & DRM_BRI=
DGE_OP_UPSTREAM_FIRST) {
a483cd9be6fb2c1 Dave Stevenson   2022-02-16  634  			next =3D iter;
a483cd9be6fb2c1 Dave Stevenson   2022-02-16  635  			limit =3D bridge;
a483cd9be6fb2c1 Dave Stevenson   2022-02-16  636  			list_for_each_entry_fr=
om_reverse(next,
a483cd9be6fb2c1 Dave Stevenson   2022-02-16  637  							 &encoder->bridge_=
chain,
a483cd9be6fb2c1 Dave Stevenson   2022-02-16  638  							 chain_node) {
a483cd9be6fb2c1 Dave Stevenson   2022-02-16  639  				if (next =3D=3D bridg=
e)
a483cd9be6fb2c1 Dave Stevenson   2022-02-16  640  					break;
a483cd9be6fb2c1 Dave Stevenson   2022-02-16  641  =

a483cd9be6fb2c1 Dave Stevenson   2022-02-16  642  				if (!(next->ops &
a483cd9be6fb2c1 Dave Stevenson   2022-02-16  643  					DRM_BRIDGE_OP_UPSTRE=
AM_FIRST)) {
a483cd9be6fb2c1 Dave Stevenson   2022-02-16  644  					limit =3D list_prev_=
entry(next, chain_node);
a483cd9be6fb2c1 Dave Stevenson   2022-02-16  645  					break;
a483cd9be6fb2c1 Dave Stevenson   2022-02-16  646  				}
a483cd9be6fb2c1 Dave Stevenson   2022-02-16  647  			}
a483cd9be6fb2c1 Dave Stevenson   2022-02-16  648  =

a483cd9be6fb2c1 Dave Stevenson   2022-02-16  649  			list_for_each_entry_fr=
om(next, &encoder->bridge_chain, chain_node) {
a483cd9be6fb2c1 Dave Stevenson   2022-02-16  650  				if (next =3D=3D iter)
a483cd9be6fb2c1 Dave Stevenson   2022-02-16  651  					break;
a483cd9be6fb2c1 Dave Stevenson   2022-02-16  652  =

a483cd9be6fb2c1 Dave Stevenson   2022-02-16  653  				if (next->funcs->pre_=
enable)
a483cd9be6fb2c1 Dave Stevenson   2022-02-16  654  					next->funcs->pre_ena=
ble(next);
a483cd9be6fb2c1 Dave Stevenson   2022-02-16  655  			}
a483cd9be6fb2c1 Dave Stevenson   2022-02-16  656  		}
a483cd9be6fb2c1 Dave Stevenson   2022-02-16  657  =

05193dc38197021 Boris Brezillon  2019-12-03  658  		if (iter->funcs->pre_en=
able)
05193dc38197021 Boris Brezillon  2019-12-03  659  			iter->funcs->pre_enabl=
e(iter);
bab5cca7e609952 Douglas Anderson 2021-04-16  660  =

a483cd9be6fb2c1 Dave Stevenson   2022-02-16  661  		if (iter->ops & DRM_BRI=
DGE_OP_UPSTREAM_FIRST)
a483cd9be6fb2c1 Dave Stevenson   2022-02-16 @662  			iter =3D limit;
a483cd9be6fb2c1 Dave Stevenson   2022-02-16  663  =

bab5cca7e609952 Douglas Anderson 2021-04-16  664  		if (iter =3D=3D bridge)
bab5cca7e609952 Douglas Anderson 2021-04-16  665  			break;
05193dc38197021 Boris Brezillon  2019-12-03  666  	}
862e686ce402992 Archit Taneja    2015-05-21  667  }
ea099adfdf4bf35 Boris Brezillon  2019-12-03  668  EXPORT_SYMBOL(drm_bridge_=
chain_pre_enable);
862e686ce402992 Archit Taneja    2015-05-21  669  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2977280572445655127==--

