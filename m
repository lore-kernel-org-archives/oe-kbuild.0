Content-Type: multipart/mixed; boundary="===============3664998015867476644=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 5182/12845] drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c:718:4: warning: Value stored to 'res' is never read [clang-analyzer-deadcode.DeadStores]
Date: Wed, 16 Mar 2022 03:13:10 +0800
Message-ID: <202203160354.UzsrIfrQ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3664998015867476644==
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
head:   a32cd981a6da2373c093d471ee4405a915e217d5
commit: a6c40b178092f41b9d6cc8615697c14b1e5a1c3a [5182/12845] drm/amdgpu: S=
how IP discovery in sysfs
:::::: branch date: 6 hours ago
:::::: commit date: 4 weeks ago
config: riscv-randconfig-c006-20220310 (https://download.01.org/0day-ci/arc=
hive/20220316/202203160354.UzsrIfrQ-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 276ca8=
7382b8f16a65bddac700202924228982f6)
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
               ^~~~
   drivers/nvmem/core.c:1481:2: note: Taking false branch
           if (!buf)
           ^
   drivers/nvmem/core.c:1484:7: note: Calling '__nvmem_cell_read'
           rc =3D __nvmem_cell_read(nvmem, cell->entry, buf, len, cell->id);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvmem/core.c:1441:6: note: Assuming 'rc' is not equal to 0
           if (rc)
               ^~
   drivers/nvmem/core.c:1441:2: note: Taking true branch
           if (rc)
           ^
   drivers/nvmem/core.c:1484:7: note: Returning from '__nvmem_cell_read'
           rc =3D __nvmem_cell_read(nvmem, cell->entry, buf, len, cell->id);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvmem/core.c:1485:6: note: 'rc' is not equal to 0
           if (rc) {
               ^~
   drivers/nvmem/core.c:1485:2: note: Taking true branch
           if (rc) {
           ^
   drivers/nvmem/core.c:1691:8: note: Returning from 'nvmem_cell_read'
           buf =3D nvmem_cell_read(cell, len);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvmem/core.c:1693:6: note: Calling 'IS_ERR'
           if (IS_ERR(buf))
               ^~~~~~~~~~~
   include/linux/err.h:36:9: note: Assuming the condition is false
           return IS_ERR_VALUE((unsigned long)ptr);
                  ^
   include/linux/err.h:22:34: note: expanded from macro 'IS_ERR_VALUE'
   #define IS_ERR_VALUE(x) unlikely((unsigned long)(void *)(x) >=3D (unsign=
ed long)-MAX_ERRNO)
                           ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/err.h:36:2: note: Returning zero, which participates in a =
condition later
           return IS_ERR_VALUE((unsigned long)ptr);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvmem/core.c:1693:6: note: Returning from 'IS_ERR'
           if (IS_ERR(buf))
               ^~~~~~~~~~~
   drivers/nvmem/core.c:1693:2: note: Taking false branch
           if (IS_ERR(buf))
           ^
   drivers/nvmem/core.c:1700:6: note: Assuming 'nbits' is 0
           if (nbits)
               ^~~~~
   drivers/nvmem/core.c:1700:2: note: Taking false branch
           if (nbits)
           ^
   drivers/nvmem/core.c:1703:11: note: The left operand of '>' is a garbage=
 value
           if (*len > max_len) {
               ~~~~ ^
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
>> drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c:718:4: warning: Value stor=
ed to 'res' is never read [clang-analyzer-deadcode.DeadStores]
                           res =3D kobject_add(&ip_hw_instance->kobj, NULL,
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c:718:4: note: Value stored =
to 'res' is never read
                           res =3D kobject_add(&ip_hw_instance->kobj, NULL,
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/smu8_smumgr.c:96:2: wa=
rning: Value stored to 'elapsed_us' is never read [clang-analyzer-deadcode.=
DeadStores]
           elapsed_us =3D ktime_us_delta(ktime_get(), t_start);
           ^            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/smu8_smumgr.c:96:2: no=
te: Value stored to 'elapsed_us' is never read
           elapsed_us =3D ktime_us_delta(ktime_get(), t_start);
           ^            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
   drivers/gpu/drm/radeon/si.c:1814:4: warning: Value stored to 'err' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
                           err =3D -EINVAL;
                           ^     ~~~~~~~
   drivers/gpu/drm/radeon/si.c:1814:4: note: Value stored to 'err' is never=
 read
                           err =3D -EINVAL;
                           ^     ~~~~~~~
   drivers/gpu/drm/radeon/si.c:1837:4: warning: Value stored to 'err' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
                           err =3D -EINVAL;
                           ^     ~~~~~~~
   drivers/gpu/drm/radeon/si.c:1837:4: note: Value stored to 'err' is never=
 read
                           err =3D -EINVAL;
                           ^     ~~~~~~~
   drivers/gpu/drm/radeon/si.c:1860:4: warning: Value stored to 'err' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
                           err =3D -EINVAL;
                           ^     ~~~~~~~
   drivers/gpu/drm/radeon/si.c:1860:4: note: Value stored to 'err' is never=
 read
                           err =3D -EINVAL;
                           ^     ~~~~~~~
   drivers/gpu/drm/radeon/si.c:1891:4: warning: Value stored to 'err' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
                           err =3D -EINVAL;
                           ^     ~~~~~~~
   drivers/gpu/drm/radeon/si.c:1891:4: note: Value stored to 'err' is never=
 read
                           err =3D -EINVAL;
                           ^     ~~~~~~~
   drivers/gpu/drm/radeon/si.c:3613:3: warning: Value stored to 'r' is neve=
r read [clang-analyzer-deadcode.DeadStores]
                   r =3D radeon_ring_lock(rdev, ring, 2);
                   ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/si.c:3613:3: note: Value stored to 'r' is never r=
ead
                   r =3D radeon_ring_lock(rdev, ring, 2);
                   ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/si.c:3956:3: warning: Value stored to 'tmp' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
                   tmp =3D RREG32(GRBM_SOFT_RESET);
                   ^
   drivers/gpu/drm/radeon/si.c:3956:3: note: Value stored to 'tmp' is never=
 read
   drivers/gpu/drm/radeon/si.c:3970:3: warning: Value stored to 'tmp' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
                   tmp =3D RREG32(SRBM_SOFT_RESET);
                   ^
   drivers/gpu/drm/radeon/si.c:3970:3: note: Value stored to 'tmp' is never=
 read
   drivers/gpu/drm/radeon/si.c:5155:3: warning: Value stored to 'tmp' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
                   tmp =3D RREG32(DB_DEPTH_INFO);
                   ^
   drivers/gpu/drm/radeon/si.c:5155:3: note: Value stored to 'tmp' is never=
 read
   drivers/gpu/drm/radeon/si.c:5270:3: warning: Value stored to 'tmp' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
                   tmp =3D RREG32(DB_RENDER_CONTROL);
                   ^
   drivers/gpu/drm/radeon/si.c:5270:3: note: Value stored to 'tmp' is never=
 read
   drivers/gpu/drm/radeon/si.c:5396:10: warning: Although the value stored =
to 'data' is used in the enclosing expression, the value is never actually =
read from 'data' [clang-analyzer-deadcode.DeadStores]
                   orig =3D data =3D RREG32(CGTS_SM_CTRL_REG);
                          ^
   drivers/gpu/drm/radeon/si.c:5396:10: note: Although the value stored to =
'data' is used in the enclosing expression, the value is never actually rea=
d from 'data'
   drivers/gpu/drm/radeon/si.c:5554:11: warning: Although the value stored =
to 'data' is used in the enclosing expression, the value is never actually =
read from 'data' [clang-analyzer-deadcode.DeadStores]
                           orig =3D data =3D RREG32(DMA_CLK_CTRL + offset);
                                  ^
   drivers/gpu/drm/radeon/si.c:5554:11: note: Although the value stored to =
'data' is used in the enclosing expression, the value is never actually rea=
d from 'data'
   drivers/gpu/drm/radeon/si.c:6824:22: warning: Value stored to 'ring' dur=
ing its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct radeon_ring *ring =3D &rdev->ring[RADEON_RING_TYPE_GFX_IN=
DEX];
                               ^~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   drivers/gpu/drm/radeon/si.c:6824:22: note: Value stored to 'ring' during=
 its initialization is never read
           struct radeon_ring *ring =3D &rdev->ring[RADEON_RING_TYPE_GFX_IN=
DEX];
                               ^~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   Suppressed 6 warnings (6 in non-user code).
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

vim +/res +718 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c

a6c40b178092f41 Luben Tuikov 2022-02-03  639  =

a6c40b178092f41 Luben Tuikov 2022-02-03  640  static int amdgpu_discovery_s=
ysfs_ips(struct amdgpu_device *adev,
a6c40b178092f41 Luben Tuikov 2022-02-03  641  				      struct ip_die_entry=
 *ip_die_entry,
a6c40b178092f41 Luben Tuikov 2022-02-03  642  				      const size_t _ip_of=
fset, const int num_ips)
a6c40b178092f41 Luben Tuikov 2022-02-03  643  {
a6c40b178092f41 Luben Tuikov 2022-02-03  644  	int ii, jj, kk, res;
a6c40b178092f41 Luben Tuikov 2022-02-03  645  =

a6c40b178092f41 Luben Tuikov 2022-02-03  646  	DRM_DEBUG("num_ips:%d", num_=
ips);
a6c40b178092f41 Luben Tuikov 2022-02-03  647  =

a6c40b178092f41 Luben Tuikov 2022-02-03  648  	/* Find all IPs of a given H=
W ID, and add their instance to
a6c40b178092f41 Luben Tuikov 2022-02-03  649  	 * #die/#hw_id/#instance/<at=
tributes>
a6c40b178092f41 Luben Tuikov 2022-02-03  650  	 */
a6c40b178092f41 Luben Tuikov 2022-02-03  651  	for (ii =3D 0; ii < HW_ID_MA=
X; ii++) {
a6c40b178092f41 Luben Tuikov 2022-02-03  652  		struct ip_hw_id *ip_hw_id =
=3D NULL;
a6c40b178092f41 Luben Tuikov 2022-02-03  653  		size_t ip_offset =3D _ip_of=
fset;
a6c40b178092f41 Luben Tuikov 2022-02-03  654  =

a6c40b178092f41 Luben Tuikov 2022-02-03  655  		for (jj =3D 0; jj < num_ips=
; jj++) {
a6c40b178092f41 Luben Tuikov 2022-02-03  656  			struct ip *ip;
a6c40b178092f41 Luben Tuikov 2022-02-03  657  			struct ip_hw_instance *ip_=
hw_instance;
a6c40b178092f41 Luben Tuikov 2022-02-03  658  =

a6c40b178092f41 Luben Tuikov 2022-02-03  659  			ip =3D (struct ip *)(adev-=
>mman.discovery_bin + ip_offset);
a6c40b178092f41 Luben Tuikov 2022-02-03  660  			if (amdgpu_discovery_valid=
ate_ip(ip) ||
a6c40b178092f41 Luben Tuikov 2022-02-03  661  			    le16_to_cpu(ip->hw_id)=
 !=3D ii)
a6c40b178092f41 Luben Tuikov 2022-02-03  662  				goto next_ip;
a6c40b178092f41 Luben Tuikov 2022-02-03  663  =

a6c40b178092f41 Luben Tuikov 2022-02-03  664  			DRM_DEBUG("match:%d @ ip_o=
ffset:%ld", ii, ip_offset);
a6c40b178092f41 Luben Tuikov 2022-02-03  665  =

a6c40b178092f41 Luben Tuikov 2022-02-03  666  			/* We have a hw_id match; =
register the hw
a6c40b178092f41 Luben Tuikov 2022-02-03  667  			 * block if not yet regist=
ered.
a6c40b178092f41 Luben Tuikov 2022-02-03  668  			 */
a6c40b178092f41 Luben Tuikov 2022-02-03  669  			if (!ip_hw_id) {
a6c40b178092f41 Luben Tuikov 2022-02-03  670  				ip_hw_id =3D kzalloc(size=
of(*ip_hw_id), GFP_KERNEL);
a6c40b178092f41 Luben Tuikov 2022-02-03  671  				if (!ip_hw_id)
a6c40b178092f41 Luben Tuikov 2022-02-03  672  					return -ENOMEM;
a6c40b178092f41 Luben Tuikov 2022-02-03  673  				ip_hw_id->hw_id =3D ii;
a6c40b178092f41 Luben Tuikov 2022-02-03  674  =

a6c40b178092f41 Luben Tuikov 2022-02-03  675  				kobject_set_name(&ip_hw_i=
d->hw_id_kset.kobj, "%d", ii);
a6c40b178092f41 Luben Tuikov 2022-02-03  676  				ip_hw_id->hw_id_kset.kobj=
.kset =3D &ip_die_entry->ip_kset;
a6c40b178092f41 Luben Tuikov 2022-02-03  677  				ip_hw_id->hw_id_kset.kobj=
.ktype =3D &ip_hw_id_ktype;
a6c40b178092f41 Luben Tuikov 2022-02-03  678  				res =3D kset_register(&ip=
_hw_id->hw_id_kset);
a6c40b178092f41 Luben Tuikov 2022-02-03  679  				if (res) {
a6c40b178092f41 Luben Tuikov 2022-02-03  680  					DRM_ERROR("Couldn't regi=
ster ip_hw_id kset");
a6c40b178092f41 Luben Tuikov 2022-02-03  681  					kfree(ip_hw_id);
a6c40b178092f41 Luben Tuikov 2022-02-03  682  					return res;
a6c40b178092f41 Luben Tuikov 2022-02-03  683  				}
a6c40b178092f41 Luben Tuikov 2022-02-03  684  				if (hw_id_names[ii]) {
a6c40b178092f41 Luben Tuikov 2022-02-03  685  					res =3D sysfs_create_lin=
k(&ip_die_entry->ip_kset.kobj,
a6c40b178092f41 Luben Tuikov 2022-02-03  686  								&ip_hw_id->hw_id_kset=
.kobj,
a6c40b178092f41 Luben Tuikov 2022-02-03  687  								hw_id_names[ii]);
a6c40b178092f41 Luben Tuikov 2022-02-03  688  					if (res) {
a6c40b178092f41 Luben Tuikov 2022-02-03  689  						DRM_ERROR("Couldn't cre=
ate IP link %s in IP Die:%s\n",
a6c40b178092f41 Luben Tuikov 2022-02-03  690  							  hw_id_names[ii],
a6c40b178092f41 Luben Tuikov 2022-02-03  691  							  kobject_name(&ip_die=
_entry->ip_kset.kobj));
a6c40b178092f41 Luben Tuikov 2022-02-03  692  					}
a6c40b178092f41 Luben Tuikov 2022-02-03  693  				}
a6c40b178092f41 Luben Tuikov 2022-02-03  694  			}
a6c40b178092f41 Luben Tuikov 2022-02-03  695  =

a6c40b178092f41 Luben Tuikov 2022-02-03  696  			/* Now register its instan=
ce.
a6c40b178092f41 Luben Tuikov 2022-02-03  697  			 */
a6c40b178092f41 Luben Tuikov 2022-02-03  698  			ip_hw_instance =3D kzalloc=
(struct_size(ip_hw_instance,
a6c40b178092f41 Luben Tuikov 2022-02-03  699  							     base_addr,
a6c40b178092f41 Luben Tuikov 2022-02-03  700  							     ip->num_base_addr=
ess),
a6c40b178092f41 Luben Tuikov 2022-02-03  701  						 GFP_KERNEL);
a6c40b178092f41 Luben Tuikov 2022-02-03  702  			if (!ip_hw_instance) {
a6c40b178092f41 Luben Tuikov 2022-02-03  703  				DRM_ERROR("no memory for =
ip_hw_instance");
a6c40b178092f41 Luben Tuikov 2022-02-03  704  				return -ENOMEM;
a6c40b178092f41 Luben Tuikov 2022-02-03  705  			}
a6c40b178092f41 Luben Tuikov 2022-02-03  706  			ip_hw_instance->hw_id =3D =
le16_to_cpu(ip->hw_id); /* =3D=3D ii */
a6c40b178092f41 Luben Tuikov 2022-02-03  707  			ip_hw_instance->num_instan=
ce =3D ip->number_instance;
a6c40b178092f41 Luben Tuikov 2022-02-03  708  			ip_hw_instance->major =3D =
ip->major;
a6c40b178092f41 Luben Tuikov 2022-02-03  709  			ip_hw_instance->minor =3D =
ip->minor;
a6c40b178092f41 Luben Tuikov 2022-02-03  710  			ip_hw_instance->revision =
=3D ip->revision;
a6c40b178092f41 Luben Tuikov 2022-02-03  711  			ip_hw_instance->num_base_a=
ddresses =3D ip->num_base_address;
a6c40b178092f41 Luben Tuikov 2022-02-03  712  =

a6c40b178092f41 Luben Tuikov 2022-02-03  713  			for (kk =3D 0; kk < ip_hw_=
instance->num_base_addresses; kk++)
a6c40b178092f41 Luben Tuikov 2022-02-03  714  				ip_hw_instance->base_addr=
[kk] =3D ip->base_address[kk];
a6c40b178092f41 Luben Tuikov 2022-02-03  715  =

a6c40b178092f41 Luben Tuikov 2022-02-03  716  			kobject_init(&ip_hw_instan=
ce->kobj, &ip_hw_instance_ktype);
a6c40b178092f41 Luben Tuikov 2022-02-03  717  			ip_hw_instance->kobj.kset =
=3D &ip_hw_id->hw_id_kset;
a6c40b178092f41 Luben Tuikov 2022-02-03 @718  			res =3D kobject_add(&ip_hw=
_instance->kobj, NULL,
a6c40b178092f41 Luben Tuikov 2022-02-03  719  					  "%d", ip_hw_instance->=
num_instance);
a6c40b178092f41 Luben Tuikov 2022-02-03  720  next_ip:
a6c40b178092f41 Luben Tuikov 2022-02-03  721  			ip_offset +=3D sizeof(*ip)=
 + 4 * (ip->num_base_address - 1);
a6c40b178092f41 Luben Tuikov 2022-02-03  722  		}
a6c40b178092f41 Luben Tuikov 2022-02-03  723  	}
a6c40b178092f41 Luben Tuikov 2022-02-03  724  =

a6c40b178092f41 Luben Tuikov 2022-02-03  725  	return 0;
a6c40b178092f41 Luben Tuikov 2022-02-03  726  }
a6c40b178092f41 Luben Tuikov 2022-02-03  727  =


---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3664998015867476644==--

