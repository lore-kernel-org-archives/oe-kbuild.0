Content-Type: multipart/mixed; boundary="===============3815108261086873058=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 7388/9759] mm/shmem.c:1316:16: warning: Value stored to 'folio' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Sun, 08 May 2022 21:02:25 +0800
Message-ID: <202205082108.s73LU6wD-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3815108261086873058==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: "Matthew Wilcox (Oracle)" <willy@infradead.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   38a288f5941ef03752887ad86f2d85442358c99a
commit: b5a5d07ad0bbab66e0d24f93860423361d763453 [7388/9759] swap: turn get=
_swap_page() into folio_alloc_swap()
:::::: branch date: 2 days ago
:::::: commit date: 9 days ago
config: mips-randconfig-c004-20220508 (https://download.01.org/0day-ci/arch=
ive/20220508/202205082108.s73LU6wD-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project af4cf1=
c6b8ed0d8102fc5e69acdc2fcbbcdaa9a7)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3Db5a5d07ad0bbab66e0d24f93860423361d763453
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout b5a5d07ad0bbab66e0d24f93860423361d763453
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dmips clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-utils.c:48:2: note: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11
           memset(new_map + old_num, 0, (new_num - old_num) * sizeof(*new_m=
ap));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   Suppressed 37 warnings (37 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   37 warnings generated.
   Suppressed 37 warnings (37 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   37 warnings generated.
   Suppressed 37 warnings (37 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   37 warnings generated.
   Suppressed 37 warnings (37 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   37 warnings generated.
   Suppressed 37 warnings (37 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   37 warnings generated.
   Suppressed 37 warnings (37 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   38 warnings generated.
   drivers/gpio/gpio-tqmx86.c:318:27: warning: Access to field 'domain' res=
ults in a dereference of an undefined pointer value (loaded from variable '=
girq') [clang-analyzer-core.NullDereference]
           irq_domain_set_pm_device(girq->domain, dev);
                                    ^~~~
   drivers/gpio/gpio-tqmx86.c:234:2: note: 'girq' declared without an initi=
al value
           struct gpio_irq_chip *girq;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-tqmx86.c:240:6: note: Assuming 'irq' is >=3D 0
           if (irq < 0 && irq !=3D -ENXIO)
               ^~~~~~~
   drivers/gpio/gpio-tqmx86.c:240:14: note: Left side of '&&' is false
           if (irq < 0 && irq !=3D -ENXIO)
                       ^
   drivers/gpio/gpio-tqmx86.c:244:6: note: Assuming 'res' is non-null
           if (!res) {
               ^~~~
   drivers/gpio/gpio-tqmx86.c:244:2: note: Taking false branch
           if (!res) {
           ^
   drivers/gpio/gpio-tqmx86.c:250:6: note: Assuming 'io_base' is non-null
           if (!io_base)
               ^~~~~~~~
   drivers/gpio/gpio-tqmx86.c:250:2: note: Taking false branch
           if (!io_base)
           ^
   drivers/gpio/gpio-tqmx86.c:254:6: note: Assuming 'gpio' is non-null
           if (!gpio)
               ^~~~~
   drivers/gpio/gpio-tqmx86.c:254:2: note: Taking false branch
           if (!gpio)
           ^
   drivers/gpio/gpio-tqmx86.c:257:2: note: Loop condition is false.  Exitin=
g loop
           raw_spin_lock_init(&gpio->spinlock);
           ^
   include/linux/spinlock.h:102:39: note: expanded from macro 'raw_spin_loc=
k_init'
   # define raw_spin_lock_init(lock)                                       \
                                                                           ^
   drivers/gpio/gpio-tqmx86.c:279:6: note: Assuming 'irq' is <=3D 0
           if (irq > 0) {
               ^~~~~~~
   drivers/gpio/gpio-tqmx86.c:279:2: note: Taking false branch
           if (irq > 0) {
           ^
   drivers/gpio/gpio-tqmx86.c:313:6: note: Assuming 'ret' is 0
           if (ret) {
               ^~~
   drivers/gpio/gpio-tqmx86.c:313:2: note: Taking false branch
           if (ret) {
           ^
   drivers/gpio/gpio-tqmx86.c:318:27: note: Access to field 'domain' result=
s in a dereference of an undefined pointer value (loaded from variable 'gir=
q')
           irq_domain_set_pm_device(girq->domain, dev);
                                    ^~~~
   Suppressed 37 warnings (37 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   Suppressed 46 warnings (46 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   37 warnings generated.
   Suppressed 37 warnings (37 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   Suppressed 46 warnings (46 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   51 warnings generated.
>> mm/shmem.c:1316:16: warning: Value stored to 'folio' during its initiali=
zation is never read [clang-analyzer-deadcode.DeadStores]
           struct folio *folio =3D page_folio(page);
                         ^~~~~
   mm/shmem.c:1316:16: note: Value stored to 'folio' during its initializat=
ion is never read
           struct folio *folio =3D page_folio(page);
                         ^~~~~
   mm/shmem.c:1338:2: warning: Value stored to 'index' is never read [clang=
-analyzer-deadcode.DeadStores]
           index =3D page->index;
           ^       ~~~~~~~~~~~
   mm/shmem.c:1338:2: note: Value stored to 'index' is never read
           index =3D page->index;
           ^       ~~~~~~~~~~~
   mm/shmem.c:1530:24: warning: Value stored to 'mapping' during its initia=
lization is never read [clang-analyzer-deadcode.DeadStores]
           struct address_space *mapping =3D info->vfs_inode.i_mapping;
                                 ^~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/shmem.c:1530:24: note: Value stored to 'mapping' during its initializ=
ation is never read
           struct address_space *mapping =3D info->vfs_inode.i_mapping;
                                 ^~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/shmem.c:2269:3: warning: Call to function 'memset' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAP=
I.DeprecatedOrUnsafeBufferHandling]
                   memset(info, 0, (char *)inode - (char *)info);
                   ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   mm/shmem.c:2269:3: note: Call to function 'memset' is insecure as it doe=
s not provide security checks introduced in the C11 standard. Replace with =
analogous functions that support length arguments or provides boundary chec=
ks such as 'memset_s' in case of C11
                   memset(info, 0, (char *)inode - (char *)info);
                   ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   Suppressed 47 warnings (46 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   51 warnings generated.
   mm/util.c:63:3: warning: Call to function 'memcpy' is insecure as it doe=
s not provide security checks introduced in the C11 standard. Replace with =
analogous functions that support length arguments or provides boundary chec=
ks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.D=
eprecatedOrUnsafeBufferHandling]
                   memcpy(buf, s, len);
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
   mm/util.c:63:3: note: Call to function 'memcpy' is insecure as it does n=
ot provide security checks introduced in the C11 standard. Replace with ana=
logous functions that support length arguments or provides boundary checks =
such as 'memcpy_s' in case of C11
                   memcpy(buf, s, len);
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
   mm/util.c:109:3: warning: Call to function 'memcpy' is insecure as it do=
es not provide security checks introduced in the C11 standard. Replace with=
 analogous functions that support length arguments or provides boundary che=
cks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.=
DeprecatedOrUnsafeBufferHandling]
                   memcpy(buf, s, len);
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
   mm/util.c:109:3: note: Call to function 'memcpy' is insecure as it does =
not provide security checks introduced in the C11 standard. Replace with an=
alogous functions that support length arguments or provides boundary checks=
 such as 'memcpy_s' in case of C11
                   memcpy(buf, s, len);
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
   mm/util.c:131:3: warning: Call to function 'memcpy' is insecure as it do=
es not provide security checks introduced in the C11 standard. Replace with=
 analogous functions that support length arguments or provides boundary che=
cks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.=
DeprecatedOrUnsafeBufferHandling]
                   memcpy(p, src, len);
                   ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'

vim +/folio +1316 mm/shmem.c

^1da177e4c3f41 Linus Torvalds          2005-04-16  1310  =

^1da177e4c3f41 Linus Torvalds          2005-04-16  1311  /*
^1da177e4c3f41 Linus Torvalds          2005-04-16  1312   * Move the page f=
rom the page cache to the swap cache.
^1da177e4c3f41 Linus Torvalds          2005-04-16  1313   */
^1da177e4c3f41 Linus Torvalds          2005-04-16  1314  static int shmem_w=
ritepage(struct page *page, struct writeback_control *wbc)
^1da177e4c3f41 Linus Torvalds          2005-04-16  1315  {
b5a5d07ad0bbab Matthew Wilcox (Oracle  2022-04-29 @1316) 	struct folio *fol=
io =3D page_folio(page);
^1da177e4c3f41 Linus Torvalds          2005-04-16  1317  	struct shmem_inod=
e_info *info;
^1da177e4c3f41 Linus Torvalds          2005-04-16  1318  	struct address_sp=
ace *mapping;
^1da177e4c3f41 Linus Torvalds          2005-04-16  1319  	struct inode *ino=
de;
6922c0c7abd387 Hugh Dickins            2011-08-03  1320  	swp_entry_t swap;
6922c0c7abd387 Hugh Dickins            2011-08-03  1321  	pgoff_t index;
^1da177e4c3f41 Linus Torvalds          2005-04-16  1322  =

1e6decf30af5c5 Hugh Dickins            2021-09-02  1323  	/*
1e6decf30af5c5 Hugh Dickins            2021-09-02  1324  	 * If /sys/kernel=
/mm/transparent_hugepage/shmem_enabled is "always" or
1e6decf30af5c5 Hugh Dickins            2021-09-02  1325  	 * "force", drive=
rs/gpu/drm/i915/gem/i915_gem_shmem.c gets huge pages,
1e6decf30af5c5 Hugh Dickins            2021-09-02  1326  	 * and its shmem_=
writeback() needs them to be split when swapping.
1e6decf30af5c5 Hugh Dickins            2021-09-02  1327  	 */
1e6decf30af5c5 Hugh Dickins            2021-09-02  1328  	if (PageTransComp=
ound(page)) {
1e6decf30af5c5 Hugh Dickins            2021-09-02  1329  		/* Ensure the su=
bpages are still dirty */
1e6decf30af5c5 Hugh Dickins            2021-09-02  1330  		SetPageDirty(pag=
e);
1e6decf30af5c5 Hugh Dickins            2021-09-02  1331  		if (split_huge_p=
age(page) < 0)
1e6decf30af5c5 Hugh Dickins            2021-09-02  1332  			goto redirty;
1e6decf30af5c5 Hugh Dickins            2021-09-02  1333  		ClearPageDirty(p=
age);
1e6decf30af5c5 Hugh Dickins            2021-09-02  1334  	}
1e6decf30af5c5 Hugh Dickins            2021-09-02  1335  =

^1da177e4c3f41 Linus Torvalds          2005-04-16  1336  	BUG_ON(!PageLocke=
d(page));
^1da177e4c3f41 Linus Torvalds          2005-04-16  1337  	mapping =3D page-=
>mapping;
^1da177e4c3f41 Linus Torvalds          2005-04-16  1338  	index =3D page->i=
ndex;
^1da177e4c3f41 Linus Torvalds          2005-04-16  1339  	inode =3D mapping=
->host;
^1da177e4c3f41 Linus Torvalds          2005-04-16  1340  	info =3D SHMEM_I(=
inode);
^1da177e4c3f41 Linus Torvalds          2005-04-16  1341  	if (info->flags &=
 VM_LOCKED)
^1da177e4c3f41 Linus Torvalds          2005-04-16  1342  		goto redirty;
d9fe526a83b84e Hugh Dickins            2008-02-04  1343  	if (!total_swap_p=
ages)
^1da177e4c3f41 Linus Torvalds          2005-04-16  1344  		goto redirty;
^1da177e4c3f41 Linus Torvalds          2005-04-16  1345  =

d9fe526a83b84e Hugh Dickins            2008-02-04  1346  	/*
97b713ba3ebaa6 Christoph Hellwig       2015-01-14  1347  	 * Our capabiliti=
es prevent regular writeback or sync from ever calling
97b713ba3ebaa6 Christoph Hellwig       2015-01-14  1348  	 * shmem_writepag=
e; but a stacking filesystem might use ->writepage of
97b713ba3ebaa6 Christoph Hellwig       2015-01-14  1349  	 * its underlying=
 filesystem, in which case tmpfs should write out to
97b713ba3ebaa6 Christoph Hellwig       2015-01-14  1350  	 * swap only in r=
esponse to memory pressure, and not for the writeback
97b713ba3ebaa6 Christoph Hellwig       2015-01-14  1351  	 * threads or syn=
c.
d9fe526a83b84e Hugh Dickins            2008-02-04  1352  	 */
48f170fb7d7db8 Hugh Dickins            2011-07-25  1353  	if (!wbc->for_rec=
laim) {
48f170fb7d7db8 Hugh Dickins            2011-07-25  1354  		WARN_ON_ONCE(1);=
	/* Still happens? Tell us about it! */
48f170fb7d7db8 Hugh Dickins            2011-07-25  1355  		goto redirty;
48f170fb7d7db8 Hugh Dickins            2011-07-25  1356  	}
1635f6a74152f1 Hugh Dickins            2012-05-29  1357  =

1635f6a74152f1 Hugh Dickins            2012-05-29  1358  	/*
1635f6a74152f1 Hugh Dickins            2012-05-29  1359  	 * This is somewh=
at ridiculous, but without plumbing a SWAP_MAP_FALLOC
1635f6a74152f1 Hugh Dickins            2012-05-29  1360  	 * value into swa=
pfile.c, the only way we can correctly account for a
1635f6a74152f1 Hugh Dickins            2012-05-29  1361  	 * fallocated pag=
e arriving here is now to initialize it and write it.
1aac1400319d30 Hugh Dickins            2012-05-29  1362  	 *
1aac1400319d30 Hugh Dickins            2012-05-29  1363  	 * That's okay fo=
r a page already fallocated earlier, but if we have
1aac1400319d30 Hugh Dickins            2012-05-29  1364  	 * not yet comple=
ted the fallocation, then (a) we want to keep track
1aac1400319d30 Hugh Dickins            2012-05-29  1365  	 * of this page i=
n case we have to undo it, and (b) it may not be a
1aac1400319d30 Hugh Dickins            2012-05-29  1366  	 * good idea to c=
ontinue anyway, once we're pushing into swap.  So
1aac1400319d30 Hugh Dickins            2012-05-29  1367  	 * reactivate the=
 page, and let shmem_fallocate() quit when too many.
1635f6a74152f1 Hugh Dickins            2012-05-29  1368  	 */
1635f6a74152f1 Hugh Dickins            2012-05-29  1369  	if (!PageUptodate=
(page)) {
1aac1400319d30 Hugh Dickins            2012-05-29  1370  		if (inode->i_pri=
vate) {
1aac1400319d30 Hugh Dickins            2012-05-29  1371  			struct shmem_fa=
lloc *shmem_falloc;
1aac1400319d30 Hugh Dickins            2012-05-29  1372  			spin_lock(&inod=
e->i_lock);
1aac1400319d30 Hugh Dickins            2012-05-29  1373  			shmem_falloc =
=3D inode->i_private;
1aac1400319d30 Hugh Dickins            2012-05-29  1374  			if (shmem_fallo=
c &&
8e205f779d1443 Hugh Dickins            2014-07-23  1375  			    !shmem_fall=
oc->waitq &&
1aac1400319d30 Hugh Dickins            2012-05-29  1376  			    index >=3D =
shmem_falloc->start &&
1aac1400319d30 Hugh Dickins            2012-05-29  1377  			    index < shm=
em_falloc->next)
1aac1400319d30 Hugh Dickins            2012-05-29  1378  				shmem_falloc->=
nr_unswapped++;
1aac1400319d30 Hugh Dickins            2012-05-29  1379  			else
1aac1400319d30 Hugh Dickins            2012-05-29  1380  				shmem_falloc =
=3D NULL;
1aac1400319d30 Hugh Dickins            2012-05-29  1381  			spin_unlock(&in=
ode->i_lock);
1aac1400319d30 Hugh Dickins            2012-05-29  1382  			if (shmem_fallo=
c)
1aac1400319d30 Hugh Dickins            2012-05-29  1383  				goto redirty;
1aac1400319d30 Hugh Dickins            2012-05-29  1384  		}
1635f6a74152f1 Hugh Dickins            2012-05-29  1385  		clear_highpage(p=
age);
1635f6a74152f1 Hugh Dickins            2012-05-29  1386  		flush_dcache_pag=
e(page);
1635f6a74152f1 Hugh Dickins            2012-05-29  1387  		SetPageUptodate(=
page);
1635f6a74152f1 Hugh Dickins            2012-05-29  1388  	}
1635f6a74152f1 Hugh Dickins            2012-05-29  1389  =

b5a5d07ad0bbab Matthew Wilcox (Oracle  2022-04-29  1390) 	swap =3D folio_al=
loc_swap(folio);
48f170fb7d7db8 Hugh Dickins            2011-07-25  1391  	if (!swap.val)
48f170fb7d7db8 Hugh Dickins            2011-07-25  1392  		goto redirty;
d9fe526a83b84e Hugh Dickins            2008-02-04  1393  =

b1dea800ac3959 Hugh Dickins            2011-05-11  1394  	/*
b1dea800ac3959 Hugh Dickins            2011-05-11  1395  	 * Add inode to s=
hmem_unuse()'s list of swapped-out inodes,
6922c0c7abd387 Hugh Dickins            2011-08-03  1396  	 * if it's not al=
ready there.  Do it now before the page is
6922c0c7abd387 Hugh Dickins            2011-08-03  1397  	 * moved to swap =
cache, when its pagelock no longer protects
b1dea800ac3959 Hugh Dickins            2011-05-11  1398  	 * the inode from=
 eviction.  But don't unlock the mutex until
6922c0c7abd387 Hugh Dickins            2011-08-03  1399  	 * we've incremen=
ted swapped, because shmem_unuse_inode() will
6922c0c7abd387 Hugh Dickins            2011-08-03  1400  	 * prune a !swapp=
ed inode from the swaplist under this mutex.
b1dea800ac3959 Hugh Dickins            2011-05-11  1401  	 */
b1dea800ac3959 Hugh Dickins            2011-05-11  1402  	mutex_lock(&shmem=
_swaplist_mutex);
05bf86b4ccfd0f Hugh Dickins            2011-05-14  1403  	if (list_empty(&i=
nfo->swaplist))
b56a2d8af9147a Vineeth Remanan Pillai  2019-03-05  1404  		list_add(&info->=
swaplist, &shmem_swaplist);
b1dea800ac3959 Hugh Dickins            2011-05-11  1405  =

4afab1cd256e42 Yang Shi                2019-11-30  1406  	if (add_to_swap_c=
ache(page, swap,
3852f6768ede54 Joonsoo Kim             2020-08-11  1407  			__GFP_HIGH | __=
GFP_NOMEMALLOC | __GFP_NOWARN,
3852f6768ede54 Joonsoo Kim             2020-08-11  1408  			NULL) =3D=3D 0)=
 {
4595ef88d13613 Kirill A. Shutemov      2016-07-26  1409  		spin_lock_irq(&i=
nfo->lock);
6922c0c7abd387 Hugh Dickins            2011-08-03  1410  		shmem_recalc_ino=
de(inode);
267a4c76bbdb95 Hugh Dickins            2015-12-11  1411  		info->swapped++;
4595ef88d13613 Kirill A. Shutemov      2016-07-26  1412  		spin_unlock_irq(=
&info->lock);
6922c0c7abd387 Hugh Dickins            2011-08-03  1413  =

267a4c76bbdb95 Hugh Dickins            2015-12-11  1414  		swap_shmem_alloc=
(swap);
267a4c76bbdb95 Hugh Dickins            2015-12-11  1415  		shmem_delete_fro=
m_page_cache(page, swp_to_radix_entry(swap));
267a4c76bbdb95 Hugh Dickins            2015-12-11  1416  =

6922c0c7abd387 Hugh Dickins            2011-08-03  1417  		mutex_unlock(&sh=
mem_swaplist_mutex);
d9fe526a83b84e Hugh Dickins            2008-02-04  1418  		BUG_ON(page_mapp=
ed(page));
9fab5619bdd7f8 Hugh Dickins            2009-03-31  1419  		swap_writepage(p=
age, wbc);
^1da177e4c3f41 Linus Torvalds          2005-04-16  1420  		return 0;
^1da177e4c3f41 Linus Torvalds          2005-04-16  1421  	}
^1da177e4c3f41 Linus Torvalds          2005-04-16  1422  =

6922c0c7abd387 Hugh Dickins            2011-08-03  1423  	mutex_unlock(&shm=
em_swaplist_mutex);
75f6d6d29a40b5 Minchan Kim             2017-07-06  1424  	put_swap_page(pag=
e, swap);
^1da177e4c3f41 Linus Torvalds          2005-04-16  1425  redirty:
^1da177e4c3f41 Linus Torvalds          2005-04-16  1426  	set_page_dirty(pa=
ge);
d9fe526a83b84e Hugh Dickins            2008-02-04  1427  	if (wbc->for_recl=
aim)
d9fe526a83b84e Hugh Dickins            2008-02-04  1428  		return AOP_WRITE=
PAGE_ACTIVATE;	/* Return with page locked */
d9fe526a83b84e Hugh Dickins            2008-02-04  1429  	unlock_page(page);
d9fe526a83b84e Hugh Dickins            2008-02-04  1430  	return 0;
^1da177e4c3f41 Linus Torvalds          2005-04-16  1431  }
^1da177e4c3f41 Linus Torvalds          2005-04-16  1432  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3815108261086873058==--

