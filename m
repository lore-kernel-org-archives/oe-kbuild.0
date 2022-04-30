Content-Type: multipart/mixed; boundary="===============6106417328808592317=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [agd5f:drm-next-5.19 250/267] drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c:410:2: warning: Value stored to 'offset' is never read [clang-analyzer-deadcode.DeadStores]
Date: Sun, 01 May 2022 02:12:12 +0800
Message-ID: <202205010224.x0oB4ZZo-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6106417328808592317==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Alex Deucher <alexander.deucher@amd.com>

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next-5.19
head:   3da2c38231a4c62dafdbd762a199cfacaccd0533
commit: f716113aacea122e44e7a28aa521318da65adc84 [250/267] drm/amdgpu/disco=
very: add additional validation
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-c002-20220428 (https://download.01.org/0day-ci/archi=
ve/20220501/202205010224.x0oB4ZZo-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 400775=
649969b9baf3bc2a510266e7912bb16ae9)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        git remote add agd5f https://gitlab.freedesktop.org/agd5f/linux.git
        git fetch --no-tags agd5f drm-next-5.19
        git checkout f716113aacea122e44e7a28aa521318da65adc84
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                   if ((c) && debug_lockdep_rcu_enabled() && !__warned) {  \
                        ^
   kernel/cred.c:361:22: note: Left side of '&&' is false
                   inc_rlimit_ucounts(task_ucounts(p), UCOUNT_RLIMIT_NPROC,=
 1);
                                      ^
   include/linux/cred.h:374:29: note: expanded from macro 'task_ucounts'
   #define task_ucounts(task)      (task_cred_xxx((task), ucounts))
                                    ^
   include/linux/cred.h:367:11: note: expanded from macro 'task_cred_xxx'
           ___val =3D __task_cred((task))->xxx;              \
                    ^
   include/linux/cred.h:321:2: note: expanded from macro '__task_cred'
           rcu_dereference((task)->real_cred)
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/rcupdate.h:531:2: note: expanded from macro 'rcu_dereferen=
ce_check'
           __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
           ^
   include/linux/rcupdate.h:392:2: note: expanded from macro '__rcu_derefer=
ence_check'
           RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_check() usage=
"); \
           ^
   include/linux/rcupdate.h:319:11: note: expanded from macro 'RCU_LOCKDEP_=
WARN'
                   if ((c) && debug_lockdep_rcu_enabled() && !__warned) {  \
                           ^
   kernel/cred.c:361:22: note: Loop condition is false.  Exiting loop
                   inc_rlimit_ucounts(task_ucounts(p), UCOUNT_RLIMIT_NPROC,=
 1);
                                      ^
   include/linux/cred.h:374:29: note: expanded from macro 'task_ucounts'
   #define task_ucounts(task)      (task_cred_xxx((task), ucounts))
                                    ^
   include/linux/cred.h:367:11: note: expanded from macro 'task_cred_xxx'
           ___val =3D __task_cred((task))->xxx;              \
                    ^
   include/linux/cred.h:321:2: note: expanded from macro '__task_cred'
           rcu_dereference((task)->real_cred)
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/rcupdate.h:531:2: note: expanded from macro 'rcu_dereferen=
ce_check'
           __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
           ^
   include/linux/rcupdate.h:392:2: note: expanded from macro '__rcu_derefer=
ence_check'
           RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_check() usage=
"); \
           ^
   include/linux/rcupdate.h:317:2: note: expanded from macro 'RCU_LOCKDEP_W=
ARN'
           do {                                                            \
           ^
   kernel/cred.c:361:22: note: Access to field 'ucounts' results in a deref=
erence of a null pointer
                   inc_rlimit_ucounts(task_ucounts(p), UCOUNT_RLIMIT_NPROC,=
 1);
                                      ^
   include/linux/cred.h:374:29: note: expanded from macro 'task_ucounts'
   #define task_ucounts(task)      (task_cred_xxx((task), ucounts))
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cred.h:367:11: note: expanded from macro 'task_cred_xxx'
           ___val =3D __task_cred((task))->xxx;              \
                    ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cred.h:321:2: note: expanded from macro '__task_cred'
           rcu_dereference((task)->real_cred)
           ^
   include/linux/rcupdate.h:603:28: note: expanded from macro 'rcu_derefere=
nce'
   #define rcu_dereference(p) rcu_dereference_check(p, 0)
                              ^
   include/linux/rcupdate.h:531:2: note: expanded from macro 'rcu_dereferen=
ce_check'
           __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
           ^
   include/linux/rcupdate.h:388:53: note: expanded from macro '__rcu_derefe=
rence_check'
   #define __rcu_dereference_check(p, local, c, space) \
                                                       ^
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   kernel/resource.c:91:2: warning: The expression is an uninitialized valu=
e. The computed value will also be garbage [clang-analyzer-core.uninitializ=
ed.Assign]
           (*pos)++;
           ^
   kernel/resource.c:1679:2: note: 'l' declared without an initial value
           loff_t l;
           ^~~~~~~~
   kernel/resource.c:1682:2: note: Loop condition is true.  Entering loop b=
ody
           for (p =3D p->child; p ; p =3D r_next(NULL, p, &l)) {
           ^
   kernel/resource.c:1687:7: note: Assuming the condition is true
                   if (p->start >=3D addr + size)
                       ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/resource.c:1687:3: note: Taking true branch
                   if (p->start >=3D addr + size)
                   ^
   kernel/resource.c:1688:4: note:  Execution continues on line 1682
                           continue;
                           ^
   kernel/resource.c:1682:29: note: Calling 'r_next'
           for (p =3D p->child; p ; p =3D r_next(NULL, p, &l)) {
                                      ^~~~~~~~~~~~~~~~~~~
   kernel/resource.c:91:2: note: The expression is an uninitialized value. =
The computed value will also be garbage
           (*pos)++;
           ^~~~~~
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   19 warnings generated.
>> drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c:410:2: warning: Value stor=
ed to 'offset' is never read [clang-analyzer-deadcode.DeadStores]
           offset =3D le16_to_cpu(info->offset);
           ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c:410:2: note: Value stored =
to 'offset' is never read
>> drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c:411:2: warning: Value stor=
ed to 'checksum' is never read [clang-analyzer-deadcode.DeadStores]
           checksum =3D le16_to_cpu(info->checksum);
           ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c:411:2: note: Value stored =
to 'checksum' is never read
   drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c:887:4: warning: Value stor=
ed to 'res' is never read [clang-analyzer-deadcode.DeadStores]
                           res =3D kobject_add(&ip_hw_instance->kobj, NULL,
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c:887:4: note: Value stored =
to 'res' is never read
                           res =3D kobject_add(&ip_hw_instance->kobj, NULL,
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   fs/fuse/cuse.c:359:2: warning: Value stored to 'rc' is never read [clang=
-analyzer-deadcode.DeadStores]
           rc =3D -ENOMEM;
           ^    ~~~~~~~
   fs/fuse/cuse.c:359:2: note: Value stored to 'rc' is never read
           rc =3D -ENOMEM;
           ^    ~~~~~~~
   fs/fuse/cuse.c:386:2: warning: Value stored to 'rc' is never read [clang=
-analyzer-deadcode.DeadStores]
           rc =3D -ENOMEM;
           ^    ~~~~~~~
   fs/fuse/cuse.c:386:2: note: Value stored to 'rc' is never read
           rc =3D -ENOMEM;
           ^    ~~~~~~~
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (16 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   20 warnings generated.
   fs/ext4/extents.c:3127:12: warning: Assigned value is garbage or undefin=
ed [clang-analyzer-core.uninitialized.Assign]
           ee_block  =3D le32_to_cpu(ex->ee_block);
                     ^
   fs/ext4/extents.c:3429:2: note: Taking false branch
           ext_debug(inode, "logical block %llu, max_blocks %u\n",
           ^
   fs/ext4/ext4.h:94:2: note: expanded from macro 'ext_debug'
           pr_debug("[%s/%d] EXT4-fs (%s): ino %lu: (%s, %d): %s:" fmt,    \
           ^
   include/linux/printk.h:576:2: note: expanded from macro 'pr_debug'
           no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:131:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   fs/ext4/extents.c:3435:6: note: Assuming the condition is false
           if (eof_block < map->m_lblk + map_len)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ext4/extents.c:3435:2: note: Taking false branch
           if (eof_block < map->m_lblk + map_len)
           ^
   fs/ext4/extents.c:3449:2: note: Taking false branch

vim +/offset +410 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c

03f6fb84bd0e98 Guchun Chen   2022-01-14  269  =

dffa11b4f74b15 Monk Liu      2020-03-04  270  static int amdgpu_discovery_i=
nit(struct amdgpu_device *adev)
f39f5bb1c9d68d Xiaojie Yuan  2019-06-20  271  {
f39f5bb1c9d68d Xiaojie Yuan  2019-06-20  272  	struct table_info *info;
f39f5bb1c9d68d Xiaojie Yuan  2019-06-20  273  	struct binary_header *bhdr;
f39f5bb1c9d68d Xiaojie Yuan  2019-06-20  274  	uint16_t offset;
f39f5bb1c9d68d Xiaojie Yuan  2019-06-20  275  	uint16_t size;
f39f5bb1c9d68d Xiaojie Yuan  2019-06-20  276  	uint16_t checksum;
f39f5bb1c9d68d Xiaojie Yuan  2019-06-20  277  	int r;
f39f5bb1c9d68d Xiaojie Yuan  2019-06-20  278  =

72de33f8f7ba0f Alex Deucher  2020-07-29  279  	adev->mman.discovery_tmr_siz=
e =3D DISCOVERY_TMR_SIZE;
72de33f8f7ba0f Alex Deucher  2020-07-29  280  	adev->mman.discovery_bin =3D=
 kzalloc(adev->mman.discovery_tmr_size, GFP_KERNEL);
72de33f8f7ba0f Alex Deucher  2020-07-29  281  	if (!adev->mman.discovery_bi=
n)
f39f5bb1c9d68d Xiaojie Yuan  2019-06-20  282  		return -ENOMEM;
f39f5bb1c9d68d Xiaojie Yuan  2019-06-20  283  =

f6dcaf0c07480f Hawking Zhang 2021-11-22  284  	r =3D amdgpu_discovery_read_=
binary_from_vram(adev, adev->mman.discovery_bin);
f39f5bb1c9d68d Xiaojie Yuan  2019-06-20  285  	if (r) {
2cb6577a303425 Hawking Zhang 2021-11-22  286  		dev_err(adev->dev, "failed =
to read ip discovery binary from vram\n");
2cb6577a303425 Hawking Zhang 2021-11-22  287  		r =3D -EINVAL;
f39f5bb1c9d68d Xiaojie Yuan  2019-06-20  288  		goto out;
f39f5bb1c9d68d Xiaojie Yuan  2019-06-20  289  	}
f39f5bb1c9d68d Xiaojie Yuan  2019-06-20  290  =

2cb6577a303425 Hawking Zhang 2021-11-22  291  	if (!amdgpu_discovery_verify=
_binary_signature(adev->mman.discovery_bin)) {
2cb6577a303425 Hawking Zhang 2021-11-22  292  		dev_warn(adev->dev, "get in=
valid ip discovery binary signature from vram\n");
2cb6577a303425 Hawking Zhang 2021-11-22  293  		/* retry read ip discovery =
binary from file */
2cb6577a303425 Hawking Zhang 2021-11-22  294  		r =3D amdgpu_discovery_read=
_binary_from_file(adev, adev->mman.discovery_bin);
2cb6577a303425 Hawking Zhang 2021-11-22  295  		if (r) {
2cb6577a303425 Hawking Zhang 2021-11-22  296  			dev_err(adev->dev, "failed=
 to read ip discovery binary from file\n");
f39f5bb1c9d68d Xiaojie Yuan  2019-06-20  297  			r =3D -EINVAL;
f39f5bb1c9d68d Xiaojie Yuan  2019-06-20  298  			goto out;
f39f5bb1c9d68d Xiaojie Yuan  2019-06-20  299  		}
2cb6577a303425 Hawking Zhang 2021-11-22  300  		/* check the ip discovery b=
inary signature */
2cb6577a303425 Hawking Zhang 2021-11-22  301  		if(!amdgpu_discovery_verify=
_binary_signature(adev->mman.discovery_bin)) {
2cb6577a303425 Hawking Zhang 2021-11-22  302  			dev_warn(adev->dev, "get i=
nvalid ip discovery binary signature from file\n");
f39f5bb1c9d68d Xiaojie Yuan  2019-06-20  303  			r =3D -EINVAL;
f39f5bb1c9d68d Xiaojie Yuan  2019-06-20  304  			goto out;
f39f5bb1c9d68d Xiaojie Yuan  2019-06-20  305  		}
2cb6577a303425 Hawking Zhang 2021-11-22  306  	}
2cb6577a303425 Hawking Zhang 2021-11-22  307  =

2cb6577a303425 Hawking Zhang 2021-11-22  308  	bhdr =3D (struct binary_head=
er *)adev->mman.discovery_bin;
f39f5bb1c9d68d Xiaojie Yuan  2019-06-20  309  =

8e84aa1bf2af81 Xiaojie Yuan  2019-03-27  310  	offset =3D offsetof(struct b=
inary_header, binary_checksum) +
f39f5bb1c9d68d Xiaojie Yuan  2019-06-20  311  		sizeof(bhdr->binary_checksu=
m);
fd08953b2de911 Yang Wang     2021-11-24  312  	size =3D le16_to_cpu(bhdr->b=
inary_size) - offset;
fd08953b2de911 Yang Wang     2021-11-24  313  	checksum =3D le16_to_cpu(bhd=
r->binary_checksum);
f39f5bb1c9d68d Xiaojie Yuan  2019-06-20  314  =

72de33f8f7ba0f Alex Deucher  2020-07-29  315  	if (!amdgpu_discovery_verify=
_checksum(adev->mman.discovery_bin + offset,
f39f5bb1c9d68d Xiaojie Yuan  2019-06-20  316  					      size, checksum)) {
2cb6577a303425 Hawking Zhang 2021-11-22  317  		dev_err(adev->dev, "invalid=
 ip discovery binary checksum\n");
f39f5bb1c9d68d Xiaojie Yuan  2019-06-20  318  		r =3D -EINVAL;
f39f5bb1c9d68d Xiaojie Yuan  2019-06-20  319  		goto out;
f39f5bb1c9d68d Xiaojie Yuan  2019-06-20  320  	}
f39f5bb1c9d68d Xiaojie Yuan  2019-06-20  321  =

f39f5bb1c9d68d Xiaojie Yuan  2019-06-20  322  	info =3D &bhdr->table_list[I=
P_DISCOVERY];
f39f5bb1c9d68d Xiaojie Yuan  2019-06-20  323  	offset =3D le16_to_cpu(info-=
>offset);
f39f5bb1c9d68d Xiaojie Yuan  2019-06-20  324  	checksum =3D le16_to_cpu(inf=
o->checksum);
f39f5bb1c9d68d Xiaojie Yuan  2019-06-20  325  =

f716113aacea12 Alex Deucher  2022-03-30  326  	if (offset) {
f716113aacea12 Alex Deucher  2022-03-30  327  		struct ip_discovery_header =
*ihdr =3D
f716113aacea12 Alex Deucher  2022-03-30  328  			(struct ip_discovery_heade=
r *)(adev->mman.discovery_bin + offset);
f39f5bb1c9d68d Xiaojie Yuan  2019-06-20  329  		if (le32_to_cpu(ihdr->signa=
ture) !=3D DISCOVERY_TABLE_SIGNATURE) {
2cb6577a303425 Hawking Zhang 2021-11-22  330  			dev_err(adev->dev, "invali=
d ip discovery data table signature\n");
f39f5bb1c9d68d Xiaojie Yuan  2019-06-20  331  			r =3D -EINVAL;
f39f5bb1c9d68d Xiaojie Yuan  2019-06-20  332  			goto out;
f39f5bb1c9d68d Xiaojie Yuan  2019-06-20  333  		}
f39f5bb1c9d68d Xiaojie Yuan  2019-06-20  334  =

72de33f8f7ba0f Alex Deucher  2020-07-29  335  		if (!amdgpu_discovery_verif=
y_checksum(adev->mman.discovery_bin + offset,
fd08953b2de911 Yang Wang     2021-11-24  336  						      le16_to_cpu(ihdr-=
>size), checksum)) {
2cb6577a303425 Hawking Zhang 2021-11-22  337  			dev_err(adev->dev, "invali=
d ip discovery data table checksum\n");
f39f5bb1c9d68d Xiaojie Yuan  2019-06-20  338  			r =3D -EINVAL;
f39f5bb1c9d68d Xiaojie Yuan  2019-06-20  339  			goto out;
f39f5bb1c9d68d Xiaojie Yuan  2019-06-20  340  		}
f716113aacea12 Alex Deucher  2022-03-30  341  	}
f39f5bb1c9d68d Xiaojie Yuan  2019-06-20  342  =

f39f5bb1c9d68d Xiaojie Yuan  2019-06-20  343  	info =3D &bhdr->table_list[G=
C];
f39f5bb1c9d68d Xiaojie Yuan  2019-06-20  344  	offset =3D le16_to_cpu(info-=
>offset);
f39f5bb1c9d68d Xiaojie Yuan  2019-06-20  345  	checksum =3D le16_to_cpu(inf=
o->checksum);
f716113aacea12 Alex Deucher  2022-03-30  346  =

f716113aacea12 Alex Deucher  2022-03-30  347  	if (offset) {
f716113aacea12 Alex Deucher  2022-03-30  348  		struct gpu_info_header *ghd=
r =3D
f716113aacea12 Alex Deucher  2022-03-30  349  			(struct gpu_info_header *)=
(adev->mman.discovery_bin + offset);
f716113aacea12 Alex Deucher  2022-03-30  350  =

f716113aacea12 Alex Deucher  2022-03-30  351  		if (le32_to_cpu(ghdr->table=
_id) !=3D GC_TABLE_ID) {
f716113aacea12 Alex Deucher  2022-03-30  352  			dev_err(adev->dev, "invali=
d ip discovery gc table id\n");
f716113aacea12 Alex Deucher  2022-03-30  353  			r =3D -EINVAL;
f716113aacea12 Alex Deucher  2022-03-30  354  			goto out;
f716113aacea12 Alex Deucher  2022-03-30  355  		}
f39f5bb1c9d68d Xiaojie Yuan  2019-06-20  356  =

72de33f8f7ba0f Alex Deucher  2020-07-29  357  		if (!amdgpu_discovery_verif=
y_checksum(adev->mman.discovery_bin + offset,
fd08953b2de911 Yang Wang     2021-11-24  358  						      le32_to_cpu(ghdr-=
>size), checksum)) {
2cb6577a303425 Hawking Zhang 2021-11-22  359  			dev_err(adev->dev, "invali=
d gc data table checksum\n");
f39f5bb1c9d68d Xiaojie Yuan  2019-06-20  360  			r =3D -EINVAL;
f39f5bb1c9d68d Xiaojie Yuan  2019-06-20  361  			goto out;
f39f5bb1c9d68d Xiaojie Yuan  2019-06-20  362  		}
f716113aacea12 Alex Deucher  2022-03-30  363  	}
f716113aacea12 Alex Deucher  2022-03-30  364  =

f716113aacea12 Alex Deucher  2022-03-30  365  	info =3D &bhdr->table_list[H=
ARVEST_INFO];
f716113aacea12 Alex Deucher  2022-03-30  366  	offset =3D le16_to_cpu(info-=
>offset);
f716113aacea12 Alex Deucher  2022-03-30  367  	checksum =3D le16_to_cpu(inf=
o->checksum);
f716113aacea12 Alex Deucher  2022-03-30  368  =

f716113aacea12 Alex Deucher  2022-03-30  369  	if (offset) {
f716113aacea12 Alex Deucher  2022-03-30  370  		struct harvest_info_header =
*hhdr =3D
f716113aacea12 Alex Deucher  2022-03-30  371  			(struct harvest_info_heade=
r *)(adev->mman.discovery_bin + offset);
f716113aacea12 Alex Deucher  2022-03-30  372  =

f716113aacea12 Alex Deucher  2022-03-30  373  		if (le32_to_cpu(hhdr->signa=
ture) !=3D HARVEST_TABLE_SIGNATURE) {
f716113aacea12 Alex Deucher  2022-03-30  374  			dev_err(adev->dev, "invali=
d ip discovery harvest table signature\n");
f716113aacea12 Alex Deucher  2022-03-30  375  			r =3D -EINVAL;
f716113aacea12 Alex Deucher  2022-03-30  376  			goto out;
f716113aacea12 Alex Deucher  2022-03-30  377  		}
f716113aacea12 Alex Deucher  2022-03-30  378  =

f716113aacea12 Alex Deucher  2022-03-30  379  		if (!amdgpu_discovery_verif=
y_checksum(adev->mman.discovery_bin + offset,
f716113aacea12 Alex Deucher  2022-03-30  380  						      sizeof(struct har=
vest_table), checksum)) {
f716113aacea12 Alex Deucher  2022-03-30  381  			dev_err(adev->dev, "invali=
d harvest data table checksum\n");
f716113aacea12 Alex Deucher  2022-03-30  382  			r =3D -EINVAL;
f716113aacea12 Alex Deucher  2022-03-30  383  			goto out;
f716113aacea12 Alex Deucher  2022-03-30  384  		}
f716113aacea12 Alex Deucher  2022-03-30  385  	}
f716113aacea12 Alex Deucher  2022-03-30  386  =

f716113aacea12 Alex Deucher  2022-03-30  387  	info =3D &bhdr->table_list[V=
CN_INFO];
f716113aacea12 Alex Deucher  2022-03-30  388  	offset =3D le16_to_cpu(info-=
>offset);
f716113aacea12 Alex Deucher  2022-03-30  389  	checksum =3D le16_to_cpu(inf=
o->checksum);
f716113aacea12 Alex Deucher  2022-03-30  390  =

f716113aacea12 Alex Deucher  2022-03-30  391  	if (offset) {
f716113aacea12 Alex Deucher  2022-03-30  392  		struct vcn_info_header *vhd=
r =3D
f716113aacea12 Alex Deucher  2022-03-30  393  			(struct vcn_info_header *)=
(adev->mman.discovery_bin + offset);
f716113aacea12 Alex Deucher  2022-03-30  394  =

f716113aacea12 Alex Deucher  2022-03-30  395  		if (le32_to_cpu(vhdr->table=
_id) !=3D VCN_INFO_TABLE_ID) {
f716113aacea12 Alex Deucher  2022-03-30  396  			dev_err(adev->dev, "invali=
d ip discovery vcn table id\n");
f716113aacea12 Alex Deucher  2022-03-30  397  			r =3D -EINVAL;
f716113aacea12 Alex Deucher  2022-03-30  398  			goto out;
f716113aacea12 Alex Deucher  2022-03-30  399  		}
f716113aacea12 Alex Deucher  2022-03-30  400  =

f716113aacea12 Alex Deucher  2022-03-30  401  		if (!amdgpu_discovery_verif=
y_checksum(adev->mman.discovery_bin + offset,
f716113aacea12 Alex Deucher  2022-03-30  402  						      le32_to_cpu(vhdr-=
>size_bytes), checksum)) {
f716113aacea12 Alex Deucher  2022-03-30  403  			dev_err(adev->dev, "invali=
d vcn data table checksum\n");
f716113aacea12 Alex Deucher  2022-03-30  404  			r =3D -EINVAL;
f716113aacea12 Alex Deucher  2022-03-30  405  			goto out;
f716113aacea12 Alex Deucher  2022-03-30  406  		}
f716113aacea12 Alex Deucher  2022-03-30  407  	}
f716113aacea12 Alex Deucher  2022-03-30  408  =

f716113aacea12 Alex Deucher  2022-03-30  409  	info =3D &bhdr->table_list[M=
ALL_INFO];
f716113aacea12 Alex Deucher  2022-03-30 @410  	offset =3D le16_to_cpu(info-=
>offset);
f716113aacea12 Alex Deucher  2022-03-30 @411  	checksum =3D le16_to_cpu(inf=
o->checksum);
f716113aacea12 Alex Deucher  2022-03-30  412  =

f716113aacea12 Alex Deucher  2022-03-30  413  	if (0 && offset) {
f716113aacea12 Alex Deucher  2022-03-30  414  		struct mall_info_header *mh=
dr =3D
f716113aacea12 Alex Deucher  2022-03-30  415  			(struct mall_info_header *=
)(adev->mman.discovery_bin + offset);
f716113aacea12 Alex Deucher  2022-03-30  416  =

f716113aacea12 Alex Deucher  2022-03-30  417  		if (le32_to_cpu(mhdr->table=
_id) !=3D MALL_INFO_TABLE_ID) {
f716113aacea12 Alex Deucher  2022-03-30  418  			dev_err(adev->dev, "invali=
d ip discovery mall table id\n");
f716113aacea12 Alex Deucher  2022-03-30  419  			r =3D -EINVAL;
f716113aacea12 Alex Deucher  2022-03-30  420  			goto out;
f716113aacea12 Alex Deucher  2022-03-30  421  		}
f716113aacea12 Alex Deucher  2022-03-30  422  =

f716113aacea12 Alex Deucher  2022-03-30  423  		if (!amdgpu_discovery_verif=
y_checksum(adev->mman.discovery_bin + offset,
f716113aacea12 Alex Deucher  2022-03-30  424  						      le32_to_cpu(mhdr-=
>size_bytes), checksum)) {
f716113aacea12 Alex Deucher  2022-03-30  425  			dev_err(adev->dev, "invali=
d mall data table checksum\n");
f716113aacea12 Alex Deucher  2022-03-30  426  			r =3D -EINVAL;
f716113aacea12 Alex Deucher  2022-03-30  427  			goto out;
f716113aacea12 Alex Deucher  2022-03-30  428  		}
f716113aacea12 Alex Deucher  2022-03-30  429  	}
f39f5bb1c9d68d Xiaojie Yuan  2019-06-20  430  =

f39f5bb1c9d68d Xiaojie Yuan  2019-06-20  431  	return 0;
f39f5bb1c9d68d Xiaojie Yuan  2019-06-20  432  =

f39f5bb1c9d68d Xiaojie Yuan  2019-06-20  433  out:
72de33f8f7ba0f Alex Deucher  2020-07-29  434  	kfree(adev->mman.discovery_b=
in);
72de33f8f7ba0f Alex Deucher  2020-07-29  435  	adev->mman.discovery_bin =3D=
 NULL;
f39f5bb1c9d68d Xiaojie Yuan  2019-06-20  436  =

f39f5bb1c9d68d Xiaojie Yuan  2019-06-20  437  	return r;
f39f5bb1c9d68d Xiaojie Yuan  2019-06-20  438  }
f39f5bb1c9d68d Xiaojie Yuan  2019-06-20  439  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6106417328808592317==--

