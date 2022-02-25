Content-Type: multipart/mixed; boundary="===============0964125259811742366=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 5322/8646] drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c:718:4: warning: Value stored to 'res' is never read [clang-analyzer-deadcode.DeadStores]
Date: Sat, 26 Feb 2022 03:36:04 +0800
Message-ID: <202202260350.9eL7S2AV-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0964125259811742366==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Luben Tuikov <luben.tuikov@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   44948bd49d878dad6c9707e34f4a06df73c3a800
commit: a6c40b178092f41b9d6cc8615697c14b1e5a1c3a [5322/8646] drm/amdgpu: Sh=
ow IP discovery in sysfs
:::::: branch date: 17 hours ago
:::::: commit date: 11 days ago
config: riscv-randconfig-c006-20220225 (https://download.01.org/0day-ci/arc=
hive/20220226/202202260350.9eL7S2AV-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc=
04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3Da6c40b178092f41b9d6cc8615697c14b1e5a1c3a
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout a6c40b178092f41b9d6cc8615697c14b1e5a1c3a
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   5 warnings generated.
   drivers/gpu/drm/nouveau/dispnv50/wndw.c:492:19: warning: Dereference of =
null pointer [clang-analyzer-core.NullDereference]
                   harm->wndw.mask &=3D ~BIT(wndw->id);
                   ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/dispnv50/wndw.c:444:25: note: 'harm' initialized=
 to a null pointer value
           struct nv50_head_atom *harm =3D NULL, *asyh =3D NULL;
                                  ^~~~
   drivers/gpu/drm/nouveau/dispnv50/wndw.c:448:2: note: Taking false branch
           NV_ATOMIC(drm, "%s atomic_check\n", plane->name);
           ^
   drivers/gpu/drm/nouveau/nouveau_drv.h:272:2: note: expanded from macro '=
NV_ATOMIC'
           if (drm_debug_enabled(DRM_UT_ATOMIC))                           =
       \
           ^
   drivers/gpu/drm/nouveau/dispnv50/wndw.c:448:2: note: Loop condition is f=
alse.  Exiting loop
           NV_ATOMIC(drm, "%s atomic_check\n", plane->name);
           ^
   drivers/gpu/drm/nouveau/nouveau_drv.h:271:31: note: expanded from macro =
'NV_ATOMIC'
   #define NV_ATOMIC(drm,f,a...) do {                                      =
       \
                                 ^
   drivers/gpu/drm/nouveau/dispnv50/wndw.c:453:6: note: Assuming field 'crt=
c' is null
           if (asyw->state.crtc) {
               ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/dispnv50/wndw.c:453:2: note: Taking false branch
           if (asyw->state.crtc) {
           ^
   drivers/gpu/drm/nouveau/dispnv50/wndw.c:464:6: note: Assuming field 'crt=
c' is null
           if (armw->state.crtc) {
               ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/dispnv50/wndw.c:464:2: note: Taking false branch
           if (armw->state.crtc) {
           ^
   drivers/gpu/drm/nouveau/dispnv50/wndw.c:471:12: note: Field 'visible' is=
 false
           if (asyw->visible && wndw->func->xlut_set &&
                     ^
   drivers/gpu/drm/nouveau/dispnv50/wndw.c:471:20: note: Left side of '&&' =
is false
           if (asyw->visible && wndw->func->xlut_set &&
                             ^
   drivers/gpu/drm/nouveau/dispnv50/wndw.c:482:12: note: Field 'visible' is=
 false
           if (asyw->visible) {
                     ^
   drivers/gpu/drm/nouveau/dispnv50/wndw.c:482:2: note: Taking false branch
           if (asyw->visible) {
           ^
   drivers/gpu/drm/nouveau/dispnv50/wndw.c:490:6: note: Assuming field 'vis=
ible' is true
           if (armw->visible) {
               ^~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/dispnv50/wndw.c:490:2: note: Taking true branch
           if (armw->visible) {
           ^
   drivers/gpu/drm/nouveau/dispnv50/wndw.c:492:19: note: Dereference of nul=
l pointer
                   harm->wndw.mask &=3D ~BIT(wndw->id);
                   ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c:435:7: warning: Value stored to=
 'is_hi_req' during its initialization is never read [clang-analyzer-deadco=
de.DeadStores]
           bool is_hi_req =3D pstate =3D=3D AMDGPU_XGMI_PSTATE_MAX_VEGA20;
                ^~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c:435:7: note: Value stored to 'i=
s_hi_req' during its initialization is never read
           bool is_hi_req =3D pstate =3D=3D AMDGPU_XGMI_PSTATE_MAX_VEGA20;
                ^~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c:442:2: warning: Value stored to=
 'request_adev' is never read [clang-analyzer-deadcode.DeadStores]
           request_adev =3D hive->hi_req_gpu ? hive->hi_req_gpu : adev;
           ^              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c:442:2: note: Value stored to 'r=
equest_adev' is never read
           request_adev =3D hive->hi_req_gpu ? hive->hi_req_gpu : adev;
           ^              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c:443:2: warning: Value stored to=
 'init_low' is never read [clang-analyzer-deadcode.DeadStores]
           init_low =3D hive->pstate =3D=3D AMDGPU_XGMI_PSTATE_UNKNOWN;
           ^          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c:443:2: note: Value stored to 'i=
nit_low' is never read
           init_low =3D hive->pstate =3D=3D AMDGPU_XGMI_PSTATE_UNKNOWN;
           ^          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
>> drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c:718:4: warning: Value stor=
ed to 'res' is never read [clang-analyzer-deadcode.DeadStores]
                           res =3D kobject_add(&ip_hw_instance->kobj, NULL,
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c:718:4: note: Value stored =
to 'res' is never read
                           res =3D kobject_add(&ip_hw_instance->kobj, NULL,
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   fs/xfs/libxfs/xfs_rmap.c:244:2: warning: 4th function call argument is a=
n uninitialized value [clang-analyzer-core.CallAndMessage]
           xfs_warn(mp,
           ^
   fs/xfs/libxfs/xfs_rmap.c:2677:9: note: Assuming the condition is false
           ASSERT(XFS_RMAP_NON_INODE_OWNER(owner) ||
                  ^
   fs/xfs/libxfs/xfs_format.h:1433:43: note: expanded from macro 'XFS_RMAP_=
NON_INODE_OWNER'
   #define XFS_RMAP_NON_INODE_OWNER(owner) (!!((owner) & (1ULL << 63)))
                                             ^
   fs/xfs/xfs_linux.h:215:10: note: expanded from macro 'ASSERT'
           (likely(expr) ? (void)0 : asswarn(NULL, #expr, __FILE__, __LINE_=
_))
            ~~~~~~~^~~~~
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   fs/xfs/libxfs/xfs_rmap.c:2677:41: note: Left side of '||' is true
           ASSERT(XFS_RMAP_NON_INODE_OWNER(owner) ||
                                                  ^
   fs/xfs/libxfs/xfs_rmap.c:2677:2: note: '?' condition is true
           ASSERT(XFS_RMAP_NON_INODE_OWNER(owner) ||
           ^
   fs/xfs/xfs_linux.h:215:3: note: expanded from macro 'ASSERT'
           (likely(expr) ? (void)0 : asswarn(NULL, #expr, __FILE__, __LINE_=
_))
            ^
   include/linux/compiler.h:77:20: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                           ^
   fs/xfs/libxfs/xfs_rmap.c:2682:6: note: Assuming 'error' is 0
           if (error)
               ^~~~~
   fs/xfs/libxfs/xfs_rmap.c:2682:2: note: Taking false branch
           if (error)
           ^
   fs/xfs/libxfs/xfs_rmap.c:2684:6: note: Assuming 'has_record' is not equa=
l to 0
           if (!has_record) {
               ^~~~~~~~~~~
   fs/xfs/libxfs/xfs_rmap.c:2684:2: note: Taking false branch
           if (!has_record) {
           ^
   fs/xfs/libxfs/xfs_rmap.c:2689:10: note: Calling 'xfs_rmap_get_rec'
           error =3D xfs_rmap_get_rec(cur, &irec, &has_record);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_rmap.c:209:6: note: Assuming 'error' is 0
           if (error || !*stat)
               ^~~~~
   fs/xfs/libxfs/xfs_rmap.c:209:6: note: Left side of '||' is false
   fs/xfs/libxfs/xfs_rmap.c:209:15: note: Assuming the condition is false
           if (error || !*stat)
                        ^~~~~~
   fs/xfs/libxfs/xfs_rmap.c:209:2: note: Taking false branch
           if (error || !*stat)
           ^
   fs/xfs/libxfs/xfs_rmap.c:212:6: note: Calling 'xfs_rmap_btrec_to_irec'
           if (xfs_rmap_btrec_to_irec(rec, irec))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_rmap.c:187:24: note: '?' condition is false
           irec->rm_startblock =3D be32_to_cpu(rec->rmap.rm_startblock);
                                 ^
   include/linux/byteorder/generic.h:95:21: note: expanded from macro 'be32=
_to_cpu'
   #define be32_to_cpu __be32_to_cpu
                       ^
   include/uapi/linux/byteorder/little_endian.h:41:26: note: expanded from =
macro '__be32_to_cpu'
   #define __be32_to_cpu(x) __swab32((__force __u32)(__be32)(x))
                            ^
   include/uapi/linux/swab.h:118:3: note: expanded from macro '__swab32'
           (__builtin_constant_p((__u32)(x)) ?     \
            ^
   fs/xfs/libxfs/xfs_rmap.c:188:24: note: '?' condition is false
           irec->rm_blockcount =3D be32_to_cpu(rec->rmap.rm_blockcount);
                                 ^
   include/linux/byteorder/generic.h:95:21: note: expanded from macro 'be32=
_to_cpu'
   #define be32_to_cpu __be32_to_cpu
                       ^
   include/uapi/linux/byteorder/little_endian.h:41:26: note: expanded from =
macro '__be32_to_cpu'
   #define __be32_to_cpu(x) __swab32((__force __u32)(__be32)(x))
                            ^
   include/uapi/linux/swab.h:118:3: note: expanded from macro '__swab32'
           (__builtin_constant_p((__u32)(x)) ?     \
            ^
   fs/xfs/libxfs/xfs_rmap.c:189:19: note: '?' condition is false
           irec->rm_owner =3D be64_to_cpu(rec->rmap.rm_owner);
                            ^
   include/linux/byteorder/generic.h:93:21: note: expanded from macro 'be64=
_to_cpu'

vim +/res +718 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c

a6c40b178092f4 Luben Tuikov 2022-02-03  639  =

a6c40b178092f4 Luben Tuikov 2022-02-03  640  static int amdgpu_discovery_sy=
sfs_ips(struct amdgpu_device *adev,
a6c40b178092f4 Luben Tuikov 2022-02-03  641  				      struct ip_die_entry =
*ip_die_entry,
a6c40b178092f4 Luben Tuikov 2022-02-03  642  				      const size_t _ip_off=
set, const int num_ips)
a6c40b178092f4 Luben Tuikov 2022-02-03  643  {
a6c40b178092f4 Luben Tuikov 2022-02-03  644  	int ii, jj, kk, res;
a6c40b178092f4 Luben Tuikov 2022-02-03  645  =

a6c40b178092f4 Luben Tuikov 2022-02-03  646  	DRM_DEBUG("num_ips:%d", num_i=
ps);
a6c40b178092f4 Luben Tuikov 2022-02-03  647  =

a6c40b178092f4 Luben Tuikov 2022-02-03  648  	/* Find all IPs of a given HW=
 ID, and add their instance to
a6c40b178092f4 Luben Tuikov 2022-02-03  649  	 * #die/#hw_id/#instance/<att=
ributes>
a6c40b178092f4 Luben Tuikov 2022-02-03  650  	 */
a6c40b178092f4 Luben Tuikov 2022-02-03  651  	for (ii =3D 0; ii < HW_ID_MAX=
; ii++) {
a6c40b178092f4 Luben Tuikov 2022-02-03  652  		struct ip_hw_id *ip_hw_id =
=3D NULL;
a6c40b178092f4 Luben Tuikov 2022-02-03  653  		size_t ip_offset =3D _ip_off=
set;
a6c40b178092f4 Luben Tuikov 2022-02-03  654  =

a6c40b178092f4 Luben Tuikov 2022-02-03  655  		for (jj =3D 0; jj < num_ips;=
 jj++) {
a6c40b178092f4 Luben Tuikov 2022-02-03  656  			struct ip *ip;
a6c40b178092f4 Luben Tuikov 2022-02-03  657  			struct ip_hw_instance *ip_h=
w_instance;
a6c40b178092f4 Luben Tuikov 2022-02-03  658  =

a6c40b178092f4 Luben Tuikov 2022-02-03  659  			ip =3D (struct ip *)(adev->=
mman.discovery_bin + ip_offset);
a6c40b178092f4 Luben Tuikov 2022-02-03  660  			if (amdgpu_discovery_valida=
te_ip(ip) ||
a6c40b178092f4 Luben Tuikov 2022-02-03  661  			    le16_to_cpu(ip->hw_id) =
!=3D ii)
a6c40b178092f4 Luben Tuikov 2022-02-03  662  				goto next_ip;
a6c40b178092f4 Luben Tuikov 2022-02-03  663  =

a6c40b178092f4 Luben Tuikov 2022-02-03  664  			DRM_DEBUG("match:%d @ ip_of=
fset:%ld", ii, ip_offset);
a6c40b178092f4 Luben Tuikov 2022-02-03  665  =

a6c40b178092f4 Luben Tuikov 2022-02-03  666  			/* We have a hw_id match; r=
egister the hw
a6c40b178092f4 Luben Tuikov 2022-02-03  667  			 * block if not yet registe=
red.
a6c40b178092f4 Luben Tuikov 2022-02-03  668  			 */
a6c40b178092f4 Luben Tuikov 2022-02-03  669  			if (!ip_hw_id) {
a6c40b178092f4 Luben Tuikov 2022-02-03  670  				ip_hw_id =3D kzalloc(sizeo=
f(*ip_hw_id), GFP_KERNEL);
a6c40b178092f4 Luben Tuikov 2022-02-03  671  				if (!ip_hw_id)
a6c40b178092f4 Luben Tuikov 2022-02-03  672  					return -ENOMEM;
a6c40b178092f4 Luben Tuikov 2022-02-03  673  				ip_hw_id->hw_id =3D ii;
a6c40b178092f4 Luben Tuikov 2022-02-03  674  =

a6c40b178092f4 Luben Tuikov 2022-02-03  675  				kobject_set_name(&ip_hw_id=
->hw_id_kset.kobj, "%d", ii);
a6c40b178092f4 Luben Tuikov 2022-02-03  676  				ip_hw_id->hw_id_kset.kobj.=
kset =3D &ip_die_entry->ip_kset;
a6c40b178092f4 Luben Tuikov 2022-02-03  677  				ip_hw_id->hw_id_kset.kobj.=
ktype =3D &ip_hw_id_ktype;
a6c40b178092f4 Luben Tuikov 2022-02-03  678  				res =3D kset_register(&ip_=
hw_id->hw_id_kset);
a6c40b178092f4 Luben Tuikov 2022-02-03  679  				if (res) {
a6c40b178092f4 Luben Tuikov 2022-02-03  680  					DRM_ERROR("Couldn't regis=
ter ip_hw_id kset");
a6c40b178092f4 Luben Tuikov 2022-02-03  681  					kfree(ip_hw_id);
a6c40b178092f4 Luben Tuikov 2022-02-03  682  					return res;
a6c40b178092f4 Luben Tuikov 2022-02-03  683  				}
a6c40b178092f4 Luben Tuikov 2022-02-03  684  				if (hw_id_names[ii]) {
a6c40b178092f4 Luben Tuikov 2022-02-03  685  					res =3D sysfs_create_link=
(&ip_die_entry->ip_kset.kobj,
a6c40b178092f4 Luben Tuikov 2022-02-03  686  								&ip_hw_id->hw_id_kset.=
kobj,
a6c40b178092f4 Luben Tuikov 2022-02-03  687  								hw_id_names[ii]);
a6c40b178092f4 Luben Tuikov 2022-02-03  688  					if (res) {
a6c40b178092f4 Luben Tuikov 2022-02-03  689  						DRM_ERROR("Couldn't crea=
te IP link %s in IP Die:%s\n",
a6c40b178092f4 Luben Tuikov 2022-02-03  690  							  hw_id_names[ii],
a6c40b178092f4 Luben Tuikov 2022-02-03  691  							  kobject_name(&ip_die_=
entry->ip_kset.kobj));
a6c40b178092f4 Luben Tuikov 2022-02-03  692  					}
a6c40b178092f4 Luben Tuikov 2022-02-03  693  				}
a6c40b178092f4 Luben Tuikov 2022-02-03  694  			}
a6c40b178092f4 Luben Tuikov 2022-02-03  695  =

a6c40b178092f4 Luben Tuikov 2022-02-03  696  			/* Now register its instanc=
e.
a6c40b178092f4 Luben Tuikov 2022-02-03  697  			 */
a6c40b178092f4 Luben Tuikov 2022-02-03  698  			ip_hw_instance =3D kzalloc(=
struct_size(ip_hw_instance,
a6c40b178092f4 Luben Tuikov 2022-02-03  699  							     base_addr,
a6c40b178092f4 Luben Tuikov 2022-02-03  700  							     ip->num_base_addre=
ss),
a6c40b178092f4 Luben Tuikov 2022-02-03  701  						 GFP_KERNEL);
a6c40b178092f4 Luben Tuikov 2022-02-03  702  			if (!ip_hw_instance) {
a6c40b178092f4 Luben Tuikov 2022-02-03  703  				DRM_ERROR("no memory for i=
p_hw_instance");
a6c40b178092f4 Luben Tuikov 2022-02-03  704  				return -ENOMEM;
a6c40b178092f4 Luben Tuikov 2022-02-03  705  			}
a6c40b178092f4 Luben Tuikov 2022-02-03  706  			ip_hw_instance->hw_id =3D l=
e16_to_cpu(ip->hw_id); /* =3D=3D ii */
a6c40b178092f4 Luben Tuikov 2022-02-03  707  			ip_hw_instance->num_instanc=
e =3D ip->number_instance;
a6c40b178092f4 Luben Tuikov 2022-02-03  708  			ip_hw_instance->major =3D i=
p->major;
a6c40b178092f4 Luben Tuikov 2022-02-03  709  			ip_hw_instance->minor =3D i=
p->minor;
a6c40b178092f4 Luben Tuikov 2022-02-03  710  			ip_hw_instance->revision =
=3D ip->revision;
a6c40b178092f4 Luben Tuikov 2022-02-03  711  			ip_hw_instance->num_base_ad=
dresses =3D ip->num_base_address;
a6c40b178092f4 Luben Tuikov 2022-02-03  712  =

a6c40b178092f4 Luben Tuikov 2022-02-03  713  			for (kk =3D 0; kk < ip_hw_i=
nstance->num_base_addresses; kk++)
a6c40b178092f4 Luben Tuikov 2022-02-03  714  				ip_hw_instance->base_addr[=
kk] =3D ip->base_address[kk];
a6c40b178092f4 Luben Tuikov 2022-02-03  715  =

a6c40b178092f4 Luben Tuikov 2022-02-03  716  			kobject_init(&ip_hw_instanc=
e->kobj, &ip_hw_instance_ktype);
a6c40b178092f4 Luben Tuikov 2022-02-03  717  			ip_hw_instance->kobj.kset =
=3D &ip_hw_id->hw_id_kset;
a6c40b178092f4 Luben Tuikov 2022-02-03 @718  			res =3D kobject_add(&ip_hw_=
instance->kobj, NULL,
a6c40b178092f4 Luben Tuikov 2022-02-03  719  					  "%d", ip_hw_instance->n=
um_instance);
a6c40b178092f4 Luben Tuikov 2022-02-03  720  next_ip:
a6c40b178092f4 Luben Tuikov 2022-02-03  721  			ip_offset +=3D sizeof(*ip) =
+ 4 * (ip->num_base_address - 1);
a6c40b178092f4 Luben Tuikov 2022-02-03  722  		}
a6c40b178092f4 Luben Tuikov 2022-02-03  723  	}
a6c40b178092f4 Luben Tuikov 2022-02-03  724  =

a6c40b178092f4 Luben Tuikov 2022-02-03  725  	return 0;
a6c40b178092f4 Luben Tuikov 2022-02-03  726  }
a6c40b178092f4 Luben Tuikov 2022-02-03  727  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0964125259811742366==--

