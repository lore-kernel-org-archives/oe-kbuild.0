Content-Type: multipart/mixed; boundary="===============0101043952484195426=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ceph-client:wip-fscrypt 51/63] fs/ceph/inode.c:2278:9: warning: Value stored to 'i_size' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Tue, 22 Feb 2022 14:31:26 +0800
Message-ID: <202202221428.B92vzGmy-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0101043952484195426==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: ceph-devel(a)vger.kernel.org
TO: Xiubo Li <xiubli@redhat.com>
CC: Jeff Layton <jlayton@kernel.org>

tree:   https://github.com/ceph/ceph-client.git wip-fscrypt
head:   4ec0d0e0cc68c6525ace02e7a8a5bb57a4242997
commit: 198de1e330730790cd177912db20bd05d3f635d4 [51/63] ceph: add truncate=
 size handling support for fscrypt
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20222/202202221428.B92vzGmy-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc=
04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ceph/ceph-client/commit/198de1e330730790cd1779=
12db20bd05d3f635d4
        git remote add ceph-client https://github.com/ceph/ceph-client.git
        git fetch --no-tags ceph-client wip-fscrypt
        git checkout 198de1e330730790cd177912db20bd05d3f635d4
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   arch/x86/kernel/cpu/resctrl/rdtgroup.c:2868:2: note: Taking true branch
           if (IS_ERR(kn)) {
           ^
   arch/x86/kernel/cpu/resctrl/rdtgroup.c:2871:3: note: Control jumps to li=
ne 2923
                   goto out_free_rgrp;
                   ^
   arch/x86/kernel/cpu/resctrl/rdtgroup.c:2923:2: note: Memory is released
           kfree(rdtgrp);
           ^~~~~~~~~~~~~
   arch/x86/kernel/cpu/resctrl/rdtgroup.c:2947:8: note: Returning; memory w=
as released via 5th parameter
           ret =3D mkdir_rdt_prepare(parent_kn, name, mode, RDTMON_GROUP, &=
rdtgrp);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   arch/x86/kernel/cpu/resctrl/rdtgroup.c:2948:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   arch/x86/kernel/cpu/resctrl/rdtgroup.c:2948:2: note: Taking false branch
           if (ret)
           ^
   arch/x86/kernel/cpu/resctrl/rdtgroup.c:2951:10: note: Use of memory afte=
r it is freed
           prgrp =3D rdtgrp->mon.parent;
                   ^~~~~~~~~~~~~~~~~~
   arch/x86/kernel/cpu/resctrl/rdtgroup.c:2980:7: warning: Use of memory af=
ter it is freed [clang-analyzer-unix.Malloc]
           kn =3D rdtgrp->kn;
                ^
   arch/x86/kernel/cpu/resctrl/rdtgroup.c:3041:6: note: Assuming the condit=
ion is false
           if (strchr(name, '\n'))
               ^~~~~~~~~~~~~~~~~~
   arch/x86/kernel/cpu/resctrl/rdtgroup.c:3041:2: note: Taking false branch
           if (strchr(name, '\n'))
           ^
   arch/x86/kernel/cpu/resctrl/rdtgroup.c:3049:6: note: Assuming 'rdt_alloc=
_capable' is true
           if (rdt_alloc_capable && parent_kn =3D=3D rdtgroup_default.kn)
               ^~~~~~~~~~~~~~~~~
   arch/x86/kernel/cpu/resctrl/rdtgroup.c:3049:6: note: Left side of '&&' i=
s true
   arch/x86/kernel/cpu/resctrl/rdtgroup.c:3049:27: note: Assuming 'parent_k=
n' is equal to field 'kn'
           if (rdt_alloc_capable && parent_kn =3D=3D rdtgroup_default.kn)
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/cpu/resctrl/rdtgroup.c:3049:2: note: Taking true branch
           if (rdt_alloc_capable && parent_kn =3D=3D rdtgroup_default.kn)
           ^
   arch/x86/kernel/cpu/resctrl/rdtgroup.c:3050:10: note: Calling 'rdtgroup_=
mkdir_ctrl_mon'
                   return rdtgroup_mkdir_ctrl_mon(parent_kn, name, mode);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/cpu/resctrl/rdtgroup.c:2976:8: note: Calling 'mkdir_rdt_=
prepare'
           ret =3D mkdir_rdt_prepare(parent_kn, name, mode, RDTCTRL_GROUP, =
&rdtgrp);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   arch/x86/kernel/cpu/resctrl/rdtgroup.c:2841:7: note: 'prdtgrp' is non-nu=
ll
           if (!prdtgrp) {
                ^~~~~~~
   arch/x86/kernel/cpu/resctrl/rdtgroup.c:2841:2: note: Taking false branch
           if (!prdtgrp) {
           ^
   arch/x86/kernel/cpu/resctrl/rdtgroup.c:2846:6: note: 'rtype' is not equa=
l to RDTMON_GROUP
           if (rtype =3D=3D RDTMON_GROUP &&
               ^~~~~
   arch/x86/kernel/cpu/resctrl/rdtgroup.c:2846:28: note: Left side of '&&' =
is false
           if (rtype =3D=3D RDTMON_GROUP &&
                                     ^
   arch/x86/kernel/cpu/resctrl/rdtgroup.c:2856:6: note: Assuming 'rdtgrp' i=
s non-null
           if (!rdtgrp) {
               ^~~~~~~
   arch/x86/kernel/cpu/resctrl/rdtgroup.c:2856:2: note: Taking false branch
           if (!rdtgrp) {
           ^
   arch/x86/kernel/cpu/resctrl/rdtgroup.c:2868:2: note: Taking true branch
           if (IS_ERR(kn)) {
           ^
   arch/x86/kernel/cpu/resctrl/rdtgroup.c:2871:3: note: Control jumps to li=
ne 2923
                   goto out_free_rgrp;
                   ^
   arch/x86/kernel/cpu/resctrl/rdtgroup.c:2923:2: note: Memory is released
           kfree(rdtgrp);
           ^~~~~~~~~~~~~
   arch/x86/kernel/cpu/resctrl/rdtgroup.c:2976:8: note: Returning; memory w=
as released via 5th parameter
           ret =3D mkdir_rdt_prepare(parent_kn, name, mode, RDTCTRL_GROUP, =
&rdtgrp);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   arch/x86/kernel/cpu/resctrl/rdtgroup.c:2977:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   arch/x86/kernel/cpu/resctrl/rdtgroup.c:2977:2: note: Taking false branch
           if (ret)
           ^
   arch/x86/kernel/cpu/resctrl/rdtgroup.c:2980:7: note: Use of memory after=
 it is freed
           kn =3D rdtgrp->kn;
                ^~~~~~~~~~
   arch/x86/kernel/cpu/resctrl/rdtgroup.c:2987:2: warning: Value stored to =
'ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D 0;
           ^     ~
   arch/x86/kernel/cpu/resctrl/rdtgroup.c:2987:2: note: Value stored to 're=
t' is never read
           ret =3D 0;
           ^     ~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
>> fs/ceph/inode.c:2278:9: warning: Value stored to 'i_size' during its ini=
tialization is never read [clang-analyzer-deadcode.DeadStores]
           loff_t i_size =3D i_size_read(inode);
                  ^~~~~~   ~~~~~~~~~~~~~~~~~~
   fs/ceph/inode.c:2278:9: note: Value stored to 'i_size' during its initia=
lization is never read
           loff_t i_size =3D i_size_read(inode);
                  ^~~~~~   ~~~~~~~~~~~~~~~~~~
>> fs/ceph/inode.c:2345:3: warning: Value stored to 'ret' is never read [cl=
ang-analyzer-deadcode.DeadStores]
                   ret =3D 0;
                   ^     ~
   fs/ceph/inode.c:2345:3: note: Value stored to 'ret' is never read
                   ret =3D 0;
                   ^     ~
   fs/ceph/inode.c:2378:2: warning: 1st function call argument is an uninit=
ialized value [clang-analyzer-core.CallAndMessage]
           kunmap_local(iov.iov_base);
           ^
   include/linux/highmem-internal.h:252:2: note: expanded from macro 'kunma=
p_local'
           __kunmap_local(__addr);                                 \
           ^              ~~~~~~
   fs/ceph/inode.c:2283:6: note: Assuming 'ret' is >=3D 0
           if (ret < 0)
               ^~~~~~~
   fs/ceph/inode.c:2283:2: note: Taking false branch
           if (ret < 0)
           ^
   fs/ceph/inode.c:2288:2: note: Taking false branch
           dout("%s size %lld -> %lld got cap refs on %s, issued %s\n", __f=
unc__,
           ^
   include/linux/ceph/ceph_debug.h:35:25: note: expanded from macro 'dout'
   # define dout(fmt, ...) pr_debug(" " fmt, ##__VA_ARGS__)
                           ^
   include/linux/printk.h:576:2: note: expanded from macro 'pr_debug'
           no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:131:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   fs/ceph/inode.c:2293:6: note: Assuming the condition is false
           if (issued & (CEPH_CAP_FILE_BUFFER))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ceph/inode.c:2293:2: note: Taking false branch
           if (issued & (CEPH_CAP_FILE_BUFFER))
           ^
   fs/ceph/inode.c:2297:6: note: Assuming 'page' is equal to NULL
           if (page =3D=3D NULL) {
               ^~~~~~~~~~~~
   fs/ceph/inode.c:2297:2: note: Taking true branch
           if (page =3D=3D NULL) {
           ^
   fs/ceph/inode.c:2299:3: note: Control jumps to line 2376
                   goto out;
                   ^
   fs/ceph/inode.c:2376:2: note: Taking false branch
           dout("%s %p size dropping cap refs on %s\n", __func__,
           ^
   include/linux/ceph/ceph_debug.h:35:25: note: expanded from macro 'dout'
   # define dout(fmt, ...) pr_debug(" " fmt, ##__VA_ARGS__)
                           ^
   include/linux/printk.h:576:2: note: expanded from macro 'pr_debug'
           no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:131:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   fs/ceph/inode.c:2378:2: note: Taking false branch
           kunmap_local(iov.iov_base);
           ^
   include/linux/highmem-internal.h:251:2: note: expanded from macro 'kunma=
p_local'
           BUILD_BUG_ON(__same_type((__addr), struct page *));     \
           ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
           BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:346:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:334:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:326:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   fs/ceph/inode.c:2378:2: note: Loop condition is false.  Exiting loop
           kunmap_local(iov.iov_base);
           ^
   include/linux/highmem-internal.h:251:2: note: expanded from macro 'kunma=
p_local'
           BUILD_BUG_ON(__same_type((__addr), struct page *));     \
           ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
           BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:346:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:334:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:318:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   fs/ceph/inode.c:2378:2: note: 1st function call argument is an uninitial=
ized value
           kunmap_local(iov.iov_base);

vim +/i_size +2278 fs/ceph/inode.c

069ec826c8d190 Jeff Layton 2020-09-03  2255  =

198de1e3307307 Xiubo Li    2022-01-12  2256  /*
198de1e3307307 Xiubo Li    2022-01-12  2257   * Transfer the encrypted last=
 block to the MDS and the MDS
198de1e3307307 Xiubo Li    2022-01-12  2258   * will help update it when tr=
uncating a smaller size.
198de1e3307307 Xiubo Li    2022-01-12  2259   *
198de1e3307307 Xiubo Li    2022-01-12  2260   * We don't support a PAGE_SIZ=
E that is smaller than the
198de1e3307307 Xiubo Li    2022-01-12  2261   * CEPH_FSCRYPT_BLOCK_SIZE.
198de1e3307307 Xiubo Li    2022-01-12  2262   */
198de1e3307307 Xiubo Li    2022-01-12  2263  static int fill_fscrypt_trunca=
te(struct inode *inode,
198de1e3307307 Xiubo Li    2022-01-12  2264  				 struct ceph_mds_request *=
req,
198de1e3307307 Xiubo Li    2022-01-12  2265  				 struct iattr *attr)
198de1e3307307 Xiubo Li    2022-01-12  2266  {
198de1e3307307 Xiubo Li    2022-01-12  2267  	struct ceph_inode_info *ci =
=3D ceph_inode(inode);
198de1e3307307 Xiubo Li    2022-01-12  2268  	int boff =3D attr->ia_size % =
CEPH_FSCRYPT_BLOCK_SIZE;
198de1e3307307 Xiubo Li    2022-01-12  2269  	loff_t pos, orig_pos =3D roun=
d_down(attr->ia_size, CEPH_FSCRYPT_BLOCK_SIZE);
198de1e3307307 Xiubo Li    2022-01-12  2270  	u64 block =3D orig_pos >> CEP=
H_FSCRYPT_BLOCK_SHIFT;
198de1e3307307 Xiubo Li    2022-01-12  2271  	struct ceph_pagelist *pagelis=
t =3D NULL;
198de1e3307307 Xiubo Li    2022-01-12  2272  	struct kvec iov;
198de1e3307307 Xiubo Li    2022-01-12  2273  	struct iov_iter iter;
198de1e3307307 Xiubo Li    2022-01-12  2274  	struct page *page =3D NULL;
198de1e3307307 Xiubo Li    2022-01-12  2275  	struct ceph_fscrypt_truncate_=
size_header header;
198de1e3307307 Xiubo Li    2022-01-12  2276  	int retry_op =3D 0;
198de1e3307307 Xiubo Li    2022-01-12  2277  	int len =3D CEPH_FSCRYPT_BLOC=
K_SIZE;
198de1e3307307 Xiubo Li    2022-01-12 @2278  	loff_t i_size =3D i_size_read=
(inode);
198de1e3307307 Xiubo Li    2022-01-12  2279  	int got, ret, issued;
198de1e3307307 Xiubo Li    2022-01-12  2280  	u64 objver;
198de1e3307307 Xiubo Li    2022-01-12  2281  =

198de1e3307307 Xiubo Li    2022-01-12  2282  	ret =3D __ceph_get_caps(inode=
, NULL, CEPH_CAP_FILE_RD, 0, -1, &got);
198de1e3307307 Xiubo Li    2022-01-12  2283  	if (ret < 0)
198de1e3307307 Xiubo Li    2022-01-12  2284  		return ret;
198de1e3307307 Xiubo Li    2022-01-12  2285  =

198de1e3307307 Xiubo Li    2022-01-12  2286  	issued =3D __ceph_caps_issued=
(ci, NULL);
198de1e3307307 Xiubo Li    2022-01-12  2287  =

198de1e3307307 Xiubo Li    2022-01-12  2288  	dout("%s size %lld -> %lld go=
t cap refs on %s, issued %s\n", __func__,
198de1e3307307 Xiubo Li    2022-01-12  2289  	     i_size, attr->ia_size, c=
eph_cap_string(got),
198de1e3307307 Xiubo Li    2022-01-12  2290  	     ceph_cap_string(issued));
198de1e3307307 Xiubo Li    2022-01-12  2291  =

198de1e3307307 Xiubo Li    2022-01-12  2292  	/* Try to writeback the dirty=
 pagecaches */
198de1e3307307 Xiubo Li    2022-01-12  2293  	if (issued & (CEPH_CAP_FILE_B=
UFFER))
198de1e3307307 Xiubo Li    2022-01-12  2294  		filemap_write_and_wait(inode=
->i_mapping);
198de1e3307307 Xiubo Li    2022-01-12  2295  =

198de1e3307307 Xiubo Li    2022-01-12  2296  	page =3D __page_cache_alloc(G=
FP_KERNEL);
198de1e3307307 Xiubo Li    2022-01-12  2297  	if (page =3D=3D NULL) {
198de1e3307307 Xiubo Li    2022-01-12  2298  		ret =3D -ENOMEM;
198de1e3307307 Xiubo Li    2022-01-12  2299  		goto out;
198de1e3307307 Xiubo Li    2022-01-12  2300  	}
198de1e3307307 Xiubo Li    2022-01-12  2301  =

198de1e3307307 Xiubo Li    2022-01-12  2302  	pagelist =3D ceph_pagelist_al=
loc(GFP_KERNEL);
198de1e3307307 Xiubo Li    2022-01-12  2303  	if (!pagelist) {
198de1e3307307 Xiubo Li    2022-01-12  2304  		ret =3D -ENOMEM;
198de1e3307307 Xiubo Li    2022-01-12  2305  		goto out;
198de1e3307307 Xiubo Li    2022-01-12  2306  	}
198de1e3307307 Xiubo Li    2022-01-12  2307  =

198de1e3307307 Xiubo Li    2022-01-12  2308  	iov.iov_base =3D kmap_local_p=
age(page);
198de1e3307307 Xiubo Li    2022-01-12  2309  	iov.iov_len =3D len;
198de1e3307307 Xiubo Li    2022-01-12  2310  	iov_iter_kvec(&iter, READ, &i=
ov, 1, len);
198de1e3307307 Xiubo Li    2022-01-12  2311  =

198de1e3307307 Xiubo Li    2022-01-12  2312  	pos =3D orig_pos;
198de1e3307307 Xiubo Li    2022-01-12  2313  	ret =3D __ceph_sync_read(inod=
e, &pos, &iter, &retry_op, &objver);
198de1e3307307 Xiubo Li    2022-01-12  2314  	ceph_put_cap_refs(ci, got);
198de1e3307307 Xiubo Li    2022-01-12  2315  	if (ret < 0)
198de1e3307307 Xiubo Li    2022-01-12  2316  		goto out;
198de1e3307307 Xiubo Li    2022-01-12  2317  =

198de1e3307307 Xiubo Li    2022-01-12  2318  	/* Insert the header first */
198de1e3307307 Xiubo Li    2022-01-12  2319  	header.ver =3D 1;
198de1e3307307 Xiubo Li    2022-01-12  2320  	header.compat =3D 1;
198de1e3307307 Xiubo Li    2022-01-12  2321  	header.change_attr =3D cpu_to=
_le64(inode_peek_iversion_raw(inode));
198de1e3307307 Xiubo Li    2022-01-12  2322  =

198de1e3307307 Xiubo Li    2022-01-12  2323  	/*
198de1e3307307 Xiubo Li    2022-01-12  2324  	 * Always set the block_size =
to CEPH_FSCRYPT_BLOCK_SIZE,
198de1e3307307 Xiubo Li    2022-01-12  2325  	 * because in MDS it may need=
 this to do the truncate.
198de1e3307307 Xiubo Li    2022-01-12  2326  	 */
198de1e3307307 Xiubo Li    2022-01-12  2327  	header.block_size =3D cpu_to_=
le32(CEPH_FSCRYPT_BLOCK_SIZE);
198de1e3307307 Xiubo Li    2022-01-12  2328  =

198de1e3307307 Xiubo Li    2022-01-12  2329  	/*
198de1e3307307 Xiubo Li    2022-01-12  2330  	 * If we hit a hole here, we =
should just skip filling
198de1e3307307 Xiubo Li    2022-01-12  2331  	 * the fscrypt for the reques=
t, because once the fscrypt
198de1e3307307 Xiubo Li    2022-01-12  2332  	 * is enabled, the file will =
be split into many blocks
198de1e3307307 Xiubo Li    2022-01-12  2333  	 * with the size of CEPH_FSCR=
YPT_BLOCK_SIZE, if there
198de1e3307307 Xiubo Li    2022-01-12  2334  	 * has a hole, the hole size =
should be multiple of block
198de1e3307307 Xiubo Li    2022-01-12  2335  	 * size.
198de1e3307307 Xiubo Li    2022-01-12  2336  	 *
198de1e3307307 Xiubo Li    2022-01-12  2337  	 * If the Rados object doesn'=
t exist, it will be set to 0.
198de1e3307307 Xiubo Li    2022-01-12  2338  	 */
198de1e3307307 Xiubo Li    2022-01-12  2339  	if (!objver) {
198de1e3307307 Xiubo Li    2022-01-12  2340  		dout("%s hit hole, ppos %lld=
 < size %lld\n", __func__,
198de1e3307307 Xiubo Li    2022-01-12  2341  		     pos, i_size);
198de1e3307307 Xiubo Li    2022-01-12  2342  =

198de1e3307307 Xiubo Li    2022-01-12  2343  		header.data_len =3D cpu_to_l=
e32(8 + 8 + 4);
198de1e3307307 Xiubo Li    2022-01-12  2344  		header.file_offset =3D 0;
198de1e3307307 Xiubo Li    2022-01-12 @2345  		ret =3D 0;
198de1e3307307 Xiubo Li    2022-01-12  2346  	} else {
198de1e3307307 Xiubo Li    2022-01-12  2347  		header.data_len =3D cpu_to_l=
e32(8 + 8 + 4 + CEPH_FSCRYPT_BLOCK_SIZE);
198de1e3307307 Xiubo Li    2022-01-12  2348  		header.file_offset =3D cpu_t=
o_le64(orig_pos);
198de1e3307307 Xiubo Li    2022-01-12  2349  =

198de1e3307307 Xiubo Li    2022-01-12  2350  		/* truncate and zero out the=
 extra contents for the last block */
198de1e3307307 Xiubo Li    2022-01-12  2351  		memset(iov.iov_base + boff, =
0, PAGE_SIZE - boff);
198de1e3307307 Xiubo Li    2022-01-12  2352  =

198de1e3307307 Xiubo Li    2022-01-12  2353  		/* encrypt the last block */
198de1e3307307 Xiubo Li    2022-01-12  2354  		ret =3D ceph_fscrypt_encrypt=
_block_inplace(inode, page,
198de1e3307307 Xiubo Li    2022-01-12  2355  						    CEPH_FSCRYPT_BLOCK_S=
IZE,
198de1e3307307 Xiubo Li    2022-01-12  2356  						    0, block,
198de1e3307307 Xiubo Li    2022-01-12  2357  						    GFP_KERNEL);
198de1e3307307 Xiubo Li    2022-01-12  2358  		if (ret)
198de1e3307307 Xiubo Li    2022-01-12  2359  			goto out;
198de1e3307307 Xiubo Li    2022-01-12  2360  	}
198de1e3307307 Xiubo Li    2022-01-12  2361  =

198de1e3307307 Xiubo Li    2022-01-12  2362  	/* Insert the header */
198de1e3307307 Xiubo Li    2022-01-12  2363  	ret =3D ceph_pagelist_append(=
pagelist, &header, sizeof(header));
198de1e3307307 Xiubo Li    2022-01-12  2364  	if (ret)
198de1e3307307 Xiubo Li    2022-01-12  2365  		goto out;
198de1e3307307 Xiubo Li    2022-01-12  2366  =

198de1e3307307 Xiubo Li    2022-01-12  2367  	if (header.block_size) {
198de1e3307307 Xiubo Li    2022-01-12  2368  		/* Append the last block con=
tents to pagelist */
198de1e3307307 Xiubo Li    2022-01-12  2369  		ret =3D ceph_pagelist_append=
(pagelist, iov.iov_base,
198de1e3307307 Xiubo Li    2022-01-12  2370  					   CEPH_FSCRYPT_BLOCK_SIZ=
E);
198de1e3307307 Xiubo Li    2022-01-12  2371  		if (ret)
198de1e3307307 Xiubo Li    2022-01-12  2372  			goto out;
198de1e3307307 Xiubo Li    2022-01-12  2373  	}
198de1e3307307 Xiubo Li    2022-01-12  2374  	req->r_pagelist =3D pagelist;
198de1e3307307 Xiubo Li    2022-01-12  2375  out:
198de1e3307307 Xiubo Li    2022-01-12  2376  	dout("%s %p size dropping cap=
 refs on %s\n", __func__,
198de1e3307307 Xiubo Li    2022-01-12  2377  	     inode, ceph_cap_string(g=
ot));
198de1e3307307 Xiubo Li    2022-01-12  2378  	kunmap_local(iov.iov_base);
198de1e3307307 Xiubo Li    2022-01-12  2379  	if (page)
198de1e3307307 Xiubo Li    2022-01-12  2380  		__free_pages(page, 0);
198de1e3307307 Xiubo Li    2022-01-12  2381  	if (ret && pagelist)
198de1e3307307 Xiubo Li    2022-01-12  2382  		ceph_pagelist_release(pageli=
st);
198de1e3307307 Xiubo Li    2022-01-12  2383  	return ret;
198de1e3307307 Xiubo Li    2022-01-12  2384  }
198de1e3307307 Xiubo Li    2022-01-12  2385  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0101043952484195426==--

