Content-Type: multipart/mixed; boundary="===============3943599447223049335=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 11838/13468] drivers/nvdimm/pmem.c:354:17: warning: Value stored to 'dev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Sun, 22 May 2022 13:12:54 +0800
Message-ID: <202205221313.nmZTDW6e-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3943599447223049335==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Jane Chu <jane.chu@oracle.com>
CC: Dan Williams <dan.j.williams@intel.com>
CC: Christoph Hellwig <hch@lst.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   18ecd30af1a8402c162cca1bd58771c0e5be7815
commit: f42e8e5088b9e791c8f7ac661f68e29a4996a4e3 [11838/13468] pmem: implem=
ent pmem_recovery_write()
:::::: branch date: 2 days ago
:::::: commit date: 5 days ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20522/202205221313.nmZTDW6e-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 853fa8=
ee225edf2d0de94b0dcbd31bea916e825e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3Df42e8e5088b9e791c8f7ac661f68e29a4996a4e3
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout f42e8e5088b9e791c8f7ac661f68e29a4996a4e3
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   fs/efs/symlink.c:32:2: note: Call to function 'memcpy' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memcpy_s' in case of C11
           memcpy(link, bh->b_data, (size > EFS_BLOCKSIZE) ? EFS_BLOCKSIZE =
: size);
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
   fs/efs/symlink.c:38:3: warning: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecu=
reAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(link + EFS_BLOCKSIZE, bh->b_data, size - EFS_BLOC=
KSIZE);
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
   fs/efs/symlink.c:38:3: note: Call to function 'memcpy' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memcpy_s' in case of C11
                   memcpy(link + EFS_BLOCKSIZE, bh->b_data, size - EFS_BLOC=
KSIZE);
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
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   drivers/regulator/max8907-regulator.c:296:2: warning: Call to function '=
memcpy' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memcpy_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(pmic->desc, max8907_regulators, sizeof(pmic->desc));
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
   drivers/regulator/max8907-regulator.c:296:2: note: Call to function 'mem=
cpy' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(pmic->desc, max8907_regulators, sizeof(pmic->desc));
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
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   52 warnings generated.
>> drivers/nvdimm/pmem.c:354:17: warning: Value stored to 'dev' during its =
initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D pmem->bb.dev;
                          ^~~   ~~~~~~~~~~~~
   drivers/nvdimm/pmem.c:354:17: note: Value stored to 'dev' during its ini=
tialization is never read
           struct device *dev =3D pmem->bb.dev;
                          ^~~   ~~~~~~~~~~~~
   drivers/nvdimm/pmem.c:401:9: warning: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", !!dax_write_cache_enabled(pmem->dax_=
dev));
                  ^~~~~~~
   drivers/nvdimm/pmem.c:401:9: note: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", !!dax_write_cache_enabled(pmem->dax_=
dev));
                  ^~~~~~~
   Suppressed 50 warnings (50 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   56 warnings generated.
   drivers/nvdimm/btt.c:226:2: warning: Call to function 'snprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(dirname, 32, "arena%d", idx);
           ^~~~~~~~
   drivers/nvdimm/btt.c:226:2: note: Call to function 'snprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'snprintf_s' in case of C11
           snprintf(dirname, 32, "arena%d", idx);
           ^~~~~~~~
   drivers/nvdimm/btt.c:351:3: warning: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(ent, &log.ent[arena->log_index[ret_ent]], LOG_ENT=
_SIZE);
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
   drivers/nvdimm/btt.c:351:3: note: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11
                   memcpy(ent, &log.ent[arena->log_index[ret_ent]], LOG_ENT=
_SIZE);
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
   drivers/nvdimm/btt.c:497:2: warning: Undefined or garbage value returned=
 to caller [clang-analyzer-core.uninitialized.UndefReturn]
           return ret;
           ^
   drivers/nvdimm/btt.c:1668:6: note: Assuming field 'uuid' is non-null
           if (!nd_btt->uuid || !nd_btt->ndns || !nd_btt->lbasize) {
               ^~~~~~~~~~~~~
   drivers/nvdimm/btt.c:1668:6: note: Left side of '||' is false
   drivers/nvdimm/btt.c:1668:23: note: Assuming field 'ndns' is non-null
           if (!nd_btt->uuid || !nd_btt->ndns || !nd_btt->lbasize) {
                                ^~~~~~~~~~~~~
   drivers/nvdimm/btt.c:1668:6: note: Left side of '||' is false
           if (!nd_btt->uuid || !nd_btt->ndns || !nd_btt->lbasize) {
               ^
   drivers/nvdimm/btt.c:1668:40: note: Assuming field 'lbasize' is not equa=
l to 0
           if (!nd_btt->uuid || !nd_btt->ndns || !nd_btt->lbasize) {
                                                 ^~~~~~~~~~~~~~~~
   drivers/nvdimm/btt.c:1668:2: note: Taking false branch
           if (!nd_btt->uuid || !nd_btt->ndns || !nd_btt->lbasize) {
           ^
   drivers/nvdimm/btt.c:1674:6: note: Assuming 'btt_sb' is non-null
           if (!btt_sb)
               ^~~~~~~
   drivers/nvdimm/btt.c:1674:2: note: Taking false branch
           if (!btt_sb)
           ^
   drivers/nvdimm/btt.c:1679:6: note: Assuming 'rc' is 0
           if (rc)
               ^~
   drivers/nvdimm/btt.c:1679:2: note: Taking false branch
           if (rc)
           ^
   drivers/nvdimm/btt.c:1691:6: note: Assuming the condition is false
           if (rawsize < ARENA_MIN_SIZE) {
               ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvdimm/btt.c:1691:2: note: Taking false branch
           if (rawsize < ARENA_MIN_SIZE) {
           ^
   drivers/nvdimm/btt.c:1698:8: note: Calling 'btt_init'
           btt =3D btt_init(nd_btt, rawsize, nd_btt->lbasize, nd_btt->uuid,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvdimm/btt.c:1588:6: note: Assuming 'btt' is non-null
           if (!btt)
               ^~~~
   drivers/nvdimm/btt.c:1588:2: note: Taking false branch
           if (!btt)
           ^
   drivers/nvdimm/btt.c:1594:23: note: Assuming 'lbasize' is < 4096
           btt->sector_size =3D ((lbasize >=3D 4096) ? 4096 : 512);
                                ^~~~~~~~~~~~~~~
   drivers/nvdimm/btt.c:1594:22: note: '?' condition is false
           btt->sector_size =3D ((lbasize >=3D 4096) ? 4096 : 512);
                               ^
   drivers/nvdimm/btt.c:1596:2: note: Loop condition is false.  Exiting loop
           mutex_init(&btt->init_lock);

vim +/dev +354 drivers/nvdimm/pmem.c

c1d6e828a35df5 Dan Williams 2017-01-24  334  =

f42e8e5088b9e7 Jane Chu     2022-05-13  335  /*
f42e8e5088b9e7 Jane Chu     2022-05-13  336   * The recovery write thread s=
tarted out as a normal pwrite thread and
f42e8e5088b9e7 Jane Chu     2022-05-13  337   * when the filesystem was tol=
d about potential media error in the
f42e8e5088b9e7 Jane Chu     2022-05-13  338   * range, filesystem turns the=
 normal pwrite to a dax_recovery_write.
f42e8e5088b9e7 Jane Chu     2022-05-13  339   *
f42e8e5088b9e7 Jane Chu     2022-05-13  340   * The recovery write consists=
 of clearing media poison, clearing page
f42e8e5088b9e7 Jane Chu     2022-05-13  341   * HWPoison bit, reenable page=
-wide read-write permission, flush the
f42e8e5088b9e7 Jane Chu     2022-05-13  342   * caches and finally write.  =
A competing pread thread will be held
f42e8e5088b9e7 Jane Chu     2022-05-13  343   * off during the recovery pro=
cess since data read back might not be
f42e8e5088b9e7 Jane Chu     2022-05-13  344   * valid, and this is achieved=
 by clearing the badblock records after
f42e8e5088b9e7 Jane Chu     2022-05-13  345   * the recovery write is compl=
ete. Competing recovery write threads
f42e8e5088b9e7 Jane Chu     2022-05-13  346   * are already serialized by w=
riter lock held by dax_iomap_rw().
f42e8e5088b9e7 Jane Chu     2022-05-13  347   */
047218ec904da1 Jane Chu     2022-04-22  348  static size_t pmem_recovery_wr=
ite(struct dax_device *dax_dev, pgoff_t pgoff,
047218ec904da1 Jane Chu     2022-04-22  349  		void *addr, size_t bytes, st=
ruct iov_iter *i)
047218ec904da1 Jane Chu     2022-04-22  350  {
f42e8e5088b9e7 Jane Chu     2022-05-13  351  	struct pmem_device *pmem =3D =
dax_get_private(dax_dev);
f42e8e5088b9e7 Jane Chu     2022-05-13  352  	size_t olen, len, off;
f42e8e5088b9e7 Jane Chu     2022-05-13  353  	phys_addr_t pmem_off;
f42e8e5088b9e7 Jane Chu     2022-05-13 @354  	struct device *dev =3D pmem->=
bb.dev;
f42e8e5088b9e7 Jane Chu     2022-05-13  355  	long cleared;
f42e8e5088b9e7 Jane Chu     2022-05-13  356  =

f42e8e5088b9e7 Jane Chu     2022-05-13  357  	off =3D offset_in_page(addr);
f42e8e5088b9e7 Jane Chu     2022-05-13  358  	len =3D PFN_PHYS(PFN_UP(off +=
 bytes));
f42e8e5088b9e7 Jane Chu     2022-05-13  359  	if (!is_bad_pmem(&pmem->bb, P=
FN_PHYS(pgoff) >> SECTOR_SHIFT, len))
f42e8e5088b9e7 Jane Chu     2022-05-13  360  		return _copy_from_iter_flush=
cache(addr, bytes, i);
f42e8e5088b9e7 Jane Chu     2022-05-13  361  =

f42e8e5088b9e7 Jane Chu     2022-05-13  362  	/*
f42e8e5088b9e7 Jane Chu     2022-05-13  363  	 * Not page-aligned range can=
not be recovered. This should not
f42e8e5088b9e7 Jane Chu     2022-05-13  364  	 * happen unless something el=
se went wrong.
f42e8e5088b9e7 Jane Chu     2022-05-13  365  	 */
f42e8e5088b9e7 Jane Chu     2022-05-13  366  	if (off || !PAGE_ALIGNED(byte=
s)) {
f42e8e5088b9e7 Jane Chu     2022-05-13  367  		dev_dbg(dev, "Found poison, =
but addr(%p) or bytes(%#zx) not page aligned\n",
f42e8e5088b9e7 Jane Chu     2022-05-13  368  			addr, bytes);
f42e8e5088b9e7 Jane Chu     2022-05-13  369  		return 0;
f42e8e5088b9e7 Jane Chu     2022-05-13  370  	}
f42e8e5088b9e7 Jane Chu     2022-05-13  371  =

f42e8e5088b9e7 Jane Chu     2022-05-13  372  	pmem_off =3D PFN_PHYS(pgoff) =
+ pmem->data_offset;
f42e8e5088b9e7 Jane Chu     2022-05-13  373  	cleared =3D __pmem_clear_pois=
on(pmem, pmem_off, len);
f42e8e5088b9e7 Jane Chu     2022-05-13  374  	if (cleared > 0 && cleared < =
len) {
f42e8e5088b9e7 Jane Chu     2022-05-13  375  		dev_dbg(dev, "poison cleared=
 only %ld out of %zu bytes\n",
f42e8e5088b9e7 Jane Chu     2022-05-13  376  			cleared, len);
f42e8e5088b9e7 Jane Chu     2022-05-13  377  		return 0;
f42e8e5088b9e7 Jane Chu     2022-05-13  378  	}
f42e8e5088b9e7 Jane Chu     2022-05-13  379  	if (cleared < 0) {
f42e8e5088b9e7 Jane Chu     2022-05-13  380  		dev_dbg(dev, "poison clear f=
ailed: %ld\n", cleared);
047218ec904da1 Jane Chu     2022-04-22  381  		return 0;
047218ec904da1 Jane Chu     2022-04-22  382  	}
047218ec904da1 Jane Chu     2022-04-22  383  =

f42e8e5088b9e7 Jane Chu     2022-05-13  384  	olen =3D _copy_from_iter_flus=
hcache(addr, bytes, i);
f42e8e5088b9e7 Jane Chu     2022-05-13  385  	pmem_clear_bb(pmem, to_sect(p=
mem, pmem_off), cleared >> SECTOR_SHIFT);
f42e8e5088b9e7 Jane Chu     2022-05-13  386  =

f42e8e5088b9e7 Jane Chu     2022-05-13  387  	return olen;
f42e8e5088b9e7 Jane Chu     2022-05-13  388  }
f42e8e5088b9e7 Jane Chu     2022-05-13  389  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3943599447223049335==--

