Content-Type: multipart/mixed; boundary="===============8958503773474375979=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/rockchip/rockchip_rgb.c:153:2: warning: Value stored to 'connector' is never read [clang-analyzer-deadcode.DeadStores]
Date: Thu, 09 Dec 2021 03:18:01 +0800
Message-ID: <202112090339.fDIla36M-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8958503773474375979==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Alex Bee <knaerzche@gmail.com>
CC: Heiko Stuebner <heiko@sntech.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   2a987e65025e2b79c6d453b78cb5985ac6e5eb26
commit: 2e87bf389e1396b9f1360e1a7cdc27f423f56463 drm/rockchip: add DRM_BRID=
GE_ATTACH_NO_CONNECTOR flag to drm_bridge_attach
date:   3 months ago
:::::: branch date: 20 hours ago
:::::: commit date: 3 months ago
config: riscv-randconfig-c006-20211206 (https://download.01.org/0day-ci/arc=
hive/20211209/202112090339.fDIla36M-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project f50be8=
eb0a12a61d23db6cda452c693001d76898)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D2e87bf389e1396b9f1360e1a7cdc27f423f56463
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 2e87bf389e1396b9f1360e1a7cdc27f423f56463
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c:154:2: note: Calling 'nvkm=
_rdaux'
           nvkm_rdaux(dp->aux, DPCD_LC02, &sink_tp, 1);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/include/nvkm/subdev/i2c.h:171:6: note: Assuming =
'ret' is not equal to 0
           if (ret =3D=3D 0) {
               ^~~~~~~~
   drivers/gpu/drm/nouveau/include/nvkm/subdev/i2c.h:171:2: note: Taking fa=
lse branch
           if (ret =3D=3D 0) {
           ^
   drivers/gpu/drm/nouveau/include/nvkm/subdev/i2c.h:176:2: note: Returning=
 without writing to '*data'
           return ret;
           ^
   drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c:154:2: note: Returning fro=
m 'nvkm_rdaux'
           nvkm_rdaux(dp->aux, DPCD_LC02, &sink_tp, 1);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c:155:10: note: The left exp=
ression of the compound assignment is an uninitialized value. The computed =
value will also be garbage
           sink_tp &=3D ~DPCD_LC02_TRAINING_PATTERN_SET;
           ~~~~~~~ ^
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   drivers/gpu/drm/radeon/cik.c:2088:4: warning: Value stored to 'err' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                           err =3D -EINVAL;
                           ^     ~~~~~~~
   drivers/gpu/drm/radeon/cik.c:2088:4: note: Value stored to 'err' is neve=
r read
                           err =3D -EINVAL;
                           ^     ~~~~~~~
   drivers/gpu/drm/radeon/cik.c:2111:4: warning: Value stored to 'err' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                           err =3D -EINVAL;
                           ^     ~~~~~~~
   drivers/gpu/drm/radeon/cik.c:2111:4: note: Value stored to 'err' is neve=
r read
                           err =3D -EINVAL;
                           ^     ~~~~~~~
   drivers/gpu/drm/radeon/cik.c:2134:4: warning: Value stored to 'err' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                           err =3D -EINVAL;
                           ^     ~~~~~~~
   drivers/gpu/drm/radeon/cik.c:2134:4: note: Value stored to 'err' is neve=
r read
                           err =3D -EINVAL;
                           ^     ~~~~~~~
   drivers/gpu/drm/radeon/cik.c:2172:4: warning: Value stored to 'err' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                           err =3D -EINVAL;
                           ^     ~~~~~~~
   drivers/gpu/drm/radeon/cik.c:2172:4: note: Value stored to 'err' is neve=
r read
                           err =3D -EINVAL;
                           ^     ~~~~~~~
   drivers/gpu/drm/radeon/cik.c:2225:5: warning: Value stored to 'err' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                                   err =3D -EINVAL;
                                   ^     ~~~~~~~
   drivers/gpu/drm/radeon/cik.c:2225:5: note: Value stored to 'err' is neve=
r read
                                   err =3D -EINVAL;
                                   ^     ~~~~~~~
   drivers/gpu/drm/radeon/cik.c:3170:6: warning: Value stored to 'gb_addr_c=
onfig' during its initialization is never read [clang-analyzer-deadcode.Dea=
dStores]
           u32 gb_addr_config =3D RREG32(GB_ADDR_CONFIG);
               ^~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/cik.c:3170:6: note: Value stored to 'gb_addr_conf=
ig' during its initialization is never read
           u32 gb_addr_config =3D RREG32(GB_ADDR_CONFIG);
               ^~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/cik.c:5019:3: warning: Value stored to 'tmp' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                   tmp =3D RREG32(GRBM_SOFT_RESET);
                   ^
   drivers/gpu/drm/radeon/cik.c:5019:3: note: Value stored to 'tmp' is neve=
r read
   drivers/gpu/drm/radeon/cik.c:5033:3: warning: Value stored to 'tmp' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                   tmp =3D RREG32(SRBM_SOFT_RESET);
                   ^
   drivers/gpu/drm/radeon/cik.c:5033:3: note: Value stored to 'tmp' is neve=
r read
   drivers/gpu/drm/radeon/cik.c:6208:3: warning: Value stored to 'data' is =
never read [clang-analyzer-deadcode.DeadStores]
                   data =3D RREG32_UVD_CTX(UVD_CGC_MEM_CTRL);
                   ^
   drivers/gpu/drm/radeon/cik.c:6208:3: note: Value stored to 'data' is nev=
er read
   drivers/gpu/drm/radeon/cik.c:6520:3: warning: Value stored to 'data' is =
never read [clang-analyzer-deadcode.DeadStores]
                   data =3D RREG32(DB_RENDER_CONTROL);
                   ^
   drivers/gpu/drm/radeon/cik.c:6520:3: note: Value stored to 'data' is nev=
er read
   drivers/gpu/drm/radeon/cik.c:7933:4: warning: Value stored to 'queue_id'=
 is never read [clang-analyzer-deadcode.DeadStores]
                           queue_id =3D (ring_id & 0x7) >> 0;
                           ^          ~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/cik.c:7933:4: note: Value stored to 'queue_id' is=
 never read
                           queue_id =3D (ring_id & 0x7) >> 0;
                           ^          ~~~~~~~~~~~~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/gpu/drm/rockchip/cdn-dp-reg.c:685:2: warning: Value stored to 'r=
et' is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D cdn_dp_reg_write(dp, DP_VC_TABLE(15), val);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/rockchip/cdn-dp-reg.c:685:2: note: Value stored to 'ret'=
 is never read
           ret =3D cdn_dp_reg_write(dp, DP_VC_TABLE(15), val);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
>> drivers/gpu/drm/rockchip/rockchip_rgb.c:153:2: warning: Value stored to =
'connector' is never read [clang-analyzer-deadcode.DeadStores]
           connector =3D &rgb->connector;
           ^           ~~~~~~~~~~~~~~~
   drivers/gpu/drm/rockchip/rockchip_rgb.c:153:2: note: Value stored to 'co=
nnector' is never read
           connector =3D &rgb->connector;
           ^           ~~~~~~~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/gpu/drm/qxl/qxl_kms.c:163:24: warning: Array subscript is undefi=
ned [clang-analyzer-core.uninitialized.ArraySubscript]
                    (unsigned long long)pci_resource_end(pdev, sb),
                                        ^
   include/drm/drm_print.h:510:31: note: expanded from macro 'DRM_DEBUG_KMS'
           __drm_dbg(DRM_UT_KMS, fmt, ##__VA_ARGS__)
                                        ^~~~~~~~~~~
   include/linux/pci.h:1929:37: note: expanded from macro 'pci_resource_end'
   #define pci_resource_end(dev, bar)      ((dev)->resource[(bar)].end)
                                            ^               ~~~~~
   drivers/gpu/drm/qxl/qxl_kms.c:112:9: note: 'sb' declared without an init=
ial value
           int r, sb;
                  ^~
   drivers/gpu/drm/qxl/qxl_kms.c:116:2: note: Loop condition is false.  Exi=
ting loop
           mutex_init(&qdev->gem.mutex);
           ^
   include/linux/mutex.h:101:32: note: expanded from macro 'mutex_init'
   #define mutex_init(mutex)                                               \
                                                                           ^
   drivers/gpu/drm/qxl/qxl_kms.c:117:2: note: Loop condition is false.  Exi=
ting loop
           mutex_init(&qdev->update_area_mutex);
           ^
   include/linux/mutex.h:101:32: note: expanded from macro 'mutex_init'
   #define mutex_init(mutex)                                               \
                                                                           ^
   drivers/gpu/drm/qxl/qxl_kms.c:118:2: note: Loop condition is false.  Exi=
ting loop
           mutex_init(&qdev->release_mutex);
           ^
   include/linux/mutex.h:101:32: note: expanded from macro 'mutex_init'
   #define mutex_init(mutex)                                               \
                                                                           ^
   drivers/gpu/drm/qxl/qxl_kms.c:119:2: note: Loop condition is false.  Exi=
ting loop
           mutex_init(&qdev->surf_evict_mutex);
           ^
   include/linux/mutex.h:101:32: note: expanded from macro 'mutex_init'
   #define mutex_init(mutex)                                               \
                                                                           ^
   drivers/gpu/drm/qxl/qxl_kms.c:123:19: note: Assuming field 'end' is equa=
l to 0
           qdev->rom_size =3D pci_resource_len(pdev, 2);
                            ^
   include/linux/pci.h:1932:4: note: expanded from macro 'pci_resource_len'
           ((pci_resource_end((dev), (bar)) =3D=3D 0) ? 0 :    \
             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/pci.h:1929:36: note: expanded from macro 'pci_resource_end'
   #define pci_resource_end(dev, bar)      ((dev)->resource[(bar)].end)
                                           ^
   drivers/gpu/drm/qxl/qxl_kms.c:123:19: note: '?' condition is true
           qdev->rom_size =3D pci_resource_len(pdev, 2);
                            ^
   include/linux/pci.h:1932:3: note: expanded from macro 'pci_resource_len'
           ((pci_resource_end((dev), (bar)) =3D=3D 0) ? 0 :    \
            ^
   drivers/gpu/drm/qxl/qxl_kms.c:127:61: note: Assuming field 'end' is equa=
l to 0
           qdev->vram_mapping =3D io_mapping_create_wc(qdev->vram_base, pci=
_resource_len(pdev, 0));
                                                                      ^
   include/linux/pci.h:1932:4: note: expanded from macro 'pci_resource_len'
           ((pci_resource_end((dev), (bar)) =3D=3D 0) ? 0 :    \
             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/pci.h:1929:36: note: expanded from macro 'pci_resource_end'
   #define pci_resource_end(dev, bar)      ((dev)->resource[(bar)].end)
                                           ^
   drivers/gpu/drm/qxl/qxl_kms.c:127:61: note: '?' condition is true
           qdev->vram_mapping =3D io_mapping_create_wc(qdev->vram_base, pci=
_resource_len(pdev, 0));
                                                                      ^
   include/linux/pci.h:1932:3: note: expanded from macro 'pci_resource_len'
           ((pci_resource_end((dev), (bar)) =3D=3D 0) ? 0 :    \
            ^
   drivers/gpu/drm/qxl/qxl_kms.c:127:23: note: Calling 'io_mapping_create_w=
c'
           qdev->vram_mapping =3D io_mapping_create_wc(qdev->vram_base, pci=
_resource_len(pdev, 0));
                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~
   include/linux/io-mapping.h:203:10: note: Calling 'kmalloc'
           iomap =3D kmalloc(sizeof(*iomap), GFP_KERNEL);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:579:2: note: Taking false branch
           if (__builtin_constant_p(size)) {
           ^
   include/linux/slab.h:596:2: note: Returning pointer, which participates =
in a condition later
           return __kmalloc(size, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/io-mapping.h:203:10: note: Returning from 'kmalloc'
           iomap =3D kmalloc(sizeof(*iomap), GFP_KERNEL);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/io-mapping.h:204:6: note: Assuming 'iomap' is non-null, wh=
ich participates in a condition later
           if (!iomap)
               ^~~~~~
   include/linux/io-mapping.h:204:2: note: Taking false branch
           if (!iomap)
           ^
   include/linux/io-mapping.h:207:7: note: Calling 'io_mapping_init_wc'
           if (!io_mapping_init_wc(iomap, base, size)) {

vim +/connector +153 drivers/gpu/drm/rockchip/rockchip_rgb.c

1f0f01515172787 Sandy Huang       2018-08-30   73  =

1f0f01515172787 Sandy Huang       2018-08-30   74  struct rockchip_rgb *roc=
kchip_rgb_init(struct device *dev,
1f0f01515172787 Sandy Huang       2018-08-30   75  				       struct drm_cr=
tc *crtc,
1f0f01515172787 Sandy Huang       2018-08-30   76  				       struct drm_de=
vice *drm_dev)
1f0f01515172787 Sandy Huang       2018-08-30   77  {
1f0f01515172787 Sandy Huang       2018-08-30   78  	struct rockchip_rgb *rg=
b;
1f0f01515172787 Sandy Huang       2018-08-30   79  	struct drm_encoder *enc=
oder;
1f0f01515172787 Sandy Huang       2018-08-30   80  	struct device_node *por=
t, *endpoint;
1f0f01515172787 Sandy Huang       2018-08-30   81  	u32 endpoint_id;
1f0f01515172787 Sandy Huang       2018-08-30   82  	int ret =3D 0, child_co=
unt =3D 0;
1f0f01515172787 Sandy Huang       2018-08-30   83  	struct drm_panel *panel;
1f0f01515172787 Sandy Huang       2018-08-30   84  	struct drm_bridge *brid=
ge;
2e87bf389e1396b Alex Bee          2021-09-13   85  	struct drm_connector *c=
onnector;
1f0f01515172787 Sandy Huang       2018-08-30   86  =

1f0f01515172787 Sandy Huang       2018-08-30   87  	rgb =3D devm_kzalloc(de=
v, sizeof(*rgb), GFP_KERNEL);
1f0f01515172787 Sandy Huang       2018-08-30   88  	if (!rgb)
1f0f01515172787 Sandy Huang       2018-08-30   89  		return ERR_PTR(-ENOMEM=
);
1f0f01515172787 Sandy Huang       2018-08-30   90  =

1f0f01515172787 Sandy Huang       2018-08-30   91  	rgb->dev =3D dev;
1f0f01515172787 Sandy Huang       2018-08-30   92  	rgb->drm_dev =3D drm_de=
v;
1f0f01515172787 Sandy Huang       2018-08-30   93  =

1f0f01515172787 Sandy Huang       2018-08-30   94  	port =3D of_graph_get_p=
ort_by_id(dev->of_node, 0);
1f0f01515172787 Sandy Huang       2018-08-30   95  	if (!port)
1f0f01515172787 Sandy Huang       2018-08-30   96  		return ERR_PTR(-EINVAL=
);
1f0f01515172787 Sandy Huang       2018-08-30   97  =

1f0f01515172787 Sandy Huang       2018-08-30   98  	for_each_child_of_node(=
port, endpoint) {
1f0f01515172787 Sandy Huang       2018-08-30   99  		if (of_property_read_u=
32(endpoint, "reg", &endpoint_id))
1f0f01515172787 Sandy Huang       2018-08-30  100  			endpoint_id =3D 0;
1f0f01515172787 Sandy Huang       2018-08-30  101  =

7cd7943dc55e0f7 Heiko Stuebner    2020-01-21  102  		/* if subdriver (> 0) =
or error case (< 0), ignore entry */
7cd7943dc55e0f7 Heiko Stuebner    2020-01-21  103  		if (rockchip_drm_endpo=
int_is_subdriver(endpoint) !=3D 0)
1f0f01515172787 Sandy Huang       2018-08-30  104  			continue;
1f0f01515172787 Sandy Huang       2018-08-30  105  =

1f0f01515172787 Sandy Huang       2018-08-30  106  		child_count++;
1f0f01515172787 Sandy Huang       2018-08-30  107  		ret =3D drm_of_find_pa=
nel_or_bridge(dev->of_node, 0, endpoint_id,
1f0f01515172787 Sandy Huang       2018-08-30  108  						  &panel, &bridge);
a17ce9960b3628b Julia Lawall      2019-01-13  109  		if (!ret) {
a17ce9960b3628b Julia Lawall      2019-01-13  110  			of_node_put(endpoint);
1f0f01515172787 Sandy Huang       2018-08-30  111  			break;
1f0f01515172787 Sandy Huang       2018-08-30  112  		}
a17ce9960b3628b Julia Lawall      2019-01-13  113  	}
1f0f01515172787 Sandy Huang       2018-08-30  114  =

1f0f01515172787 Sandy Huang       2018-08-30  115  	of_node_put(port);
1f0f01515172787 Sandy Huang       2018-08-30  116  =

1f0f01515172787 Sandy Huang       2018-08-30  117  	/* if the rgb output is=
 not connected to anything, just return */
1f0f01515172787 Sandy Huang       2018-08-30  118  	if (!child_count)
1f0f01515172787 Sandy Huang       2018-08-30  119  		return NULL;
1f0f01515172787 Sandy Huang       2018-08-30  120  =

1f0f01515172787 Sandy Huang       2018-08-30  121  	if (ret < 0) {
1f0f01515172787 Sandy Huang       2018-08-30  122  		if (ret !=3D -EPROBE_D=
EFER)
1f0f01515172787 Sandy Huang       2018-08-30  123  			DRM_DEV_ERROR(dev, "f=
ailed to find panel or bridge %d\n", ret);
1f0f01515172787 Sandy Huang       2018-08-30  124  		return ERR_PTR(ret);
1f0f01515172787 Sandy Huang       2018-08-30  125  	}
1f0f01515172787 Sandy Huang       2018-08-30  126  =

1f0f01515172787 Sandy Huang       2018-08-30  127  	encoder =3D &rgb->encod=
er;
1f0f01515172787 Sandy Huang       2018-08-30  128  	encoder->possible_crtcs=
 =3D drm_crtc_mask(crtc);
1f0f01515172787 Sandy Huang       2018-08-30  129  =

0dbd735448bfdb0 Thomas Zimmermann 2020-03-05  130  	ret =3D drm_simple_enco=
der_init(drm_dev, encoder, DRM_MODE_ENCODER_NONE);
1f0f01515172787 Sandy Huang       2018-08-30  131  	if (ret < 0) {
1f0f01515172787 Sandy Huang       2018-08-30  132  		DRM_DEV_ERROR(drm_dev-=
>dev,
1f0f01515172787 Sandy Huang       2018-08-30  133  			      "failed to init=
ialize encoder: %d\n", ret);
1f0f01515172787 Sandy Huang       2018-08-30  134  		return ERR_PTR(ret);
1f0f01515172787 Sandy Huang       2018-08-30  135  	}
1f0f01515172787 Sandy Huang       2018-08-30  136  =

1f0f01515172787 Sandy Huang       2018-08-30  137  	drm_encoder_helper_add(=
encoder, &rockchip_rgb_encoder_helper_funcs);
1f0f01515172787 Sandy Huang       2018-08-30  138  =

1f0f01515172787 Sandy Huang       2018-08-30  139  	if (panel) {
89958b7cd9555a5 Laurent Pinchart  2019-09-04  140  		bridge =3D drm_panel_b=
ridge_add_typed(panel,
89958b7cd9555a5 Laurent Pinchart  2019-09-04  141  						    DRM_MODE_CONNE=
CTOR_LVDS);
1f0f01515172787 Sandy Huang       2018-08-30  142  		if (IS_ERR(bridge))
1f0f01515172787 Sandy Huang       2018-08-30  143  			return ERR_CAST(bridg=
e);
1f0f01515172787 Sandy Huang       2018-08-30  144  	}
1f0f01515172787 Sandy Huang       2018-08-30  145  =

1f0f01515172787 Sandy Huang       2018-08-30  146  	rgb->bridge =3D bridge;
1f0f01515172787 Sandy Huang       2018-08-30  147  =

2e87bf389e1396b Alex Bee          2021-09-13  148  	ret =3D drm_bridge_atta=
ch(encoder, rgb->bridge, NULL,
2e87bf389e1396b Alex Bee          2021-09-13  149  				DRM_BRIDGE_ATTACH_NO=
_CONNECTOR);
fb8d617f8fd64f5 Laurent Pinchart  2021-03-23  150  	if (ret)
1f0f01515172787 Sandy Huang       2018-08-30  151  		goto err_free_encoder;
1f0f01515172787 Sandy Huang       2018-08-30  152  =

2e87bf389e1396b Alex Bee          2021-09-13 @153  	connector =3D &rgb->con=
nector;
2e87bf389e1396b Alex Bee          2021-09-13  154  	connector =3D drm_bridg=
e_connector_init(rgb->drm_dev, encoder);
2e87bf389e1396b Alex Bee          2021-09-13  155  	if (IS_ERR(connector)) {
2e87bf389e1396b Alex Bee          2021-09-13  156  		DRM_DEV_ERROR(drm_dev-=
>dev,
2e87bf389e1396b Alex Bee          2021-09-13  157  			      "failed to init=
ialize bridge connector: %pe\n",
2e87bf389e1396b Alex Bee          2021-09-13  158  			      connector);
2e87bf389e1396b Alex Bee          2021-09-13  159  		ret =3D PTR_ERR(connec=
tor);
2e87bf389e1396b Alex Bee          2021-09-13  160  		goto err_free_encoder;
2e87bf389e1396b Alex Bee          2021-09-13  161  	}
2e87bf389e1396b Alex Bee          2021-09-13  162  =

2e87bf389e1396b Alex Bee          2021-09-13  163  	ret =3D drm_connector_a=
ttach_encoder(connector, encoder);
2e87bf389e1396b Alex Bee          2021-09-13  164  	if (ret < 0) {
2e87bf389e1396b Alex Bee          2021-09-13  165  		DRM_DEV_ERROR(drm_dev-=
>dev,
2e87bf389e1396b Alex Bee          2021-09-13  166  			      "failed to atta=
ch encoder: %d\n", ret);
2e87bf389e1396b Alex Bee          2021-09-13  167  		goto err_free_connecto=
r;
2e87bf389e1396b Alex Bee          2021-09-13  168  	}
2e87bf389e1396b Alex Bee          2021-09-13  169  =

1f0f01515172787 Sandy Huang       2018-08-30  170  	return rgb;
1f0f01515172787 Sandy Huang       2018-08-30  171  =

2e87bf389e1396b Alex Bee          2021-09-13  172  err_free_connector:
2e87bf389e1396b Alex Bee          2021-09-13  173  	drm_connector_cleanup(c=
onnector);
1f0f01515172787 Sandy Huang       2018-08-30  174  err_free_encoder:
1f0f01515172787 Sandy Huang       2018-08-30  175  	drm_encoder_cleanup(enc=
oder);
1f0f01515172787 Sandy Huang       2018-08-30  176  	return ERR_PTR(ret);
1f0f01515172787 Sandy Huang       2018-08-30  177  }
1f0f01515172787 Sandy Huang       2018-08-30  178  EXPORT_SYMBOL_GPL(rockch=
ip_rgb_init);
1f0f01515172787 Sandy Huang       2018-08-30  179  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8958503773474375979==--

