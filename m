Content-Type: multipart/mixed; boundary="===============0163077976299286262=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [RFC PATCH v4 05/17] iomap: Add gfp parameter to iomap_page_create()
Date: Sun, 22 May 2022 23:22:43 +0800
Message-ID: <202205222333.0epqETHu-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0163077976299286262==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220520183646.2002023-6-shr@fb.com>
References: <20220520183646.2002023-6-shr@fb.com>
TO: Stefan Roesch <shr@fb.com>

Hi Stefan,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on 0cdd776ec92c0fec768c7079331804d3e52d4b27]

url:    https://github.com/intel-lab-lkp/linux/commits/Stefan-Roesch/io-uri=
ng-xfs-support-async-buffered-writes/20220521-024152
base:   0cdd776ec92c0fec768c7079331804d3e52d4b27
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20522/202205222333.0epqETHu-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 1443db=
aba6f0e57be066995db9164f89fb57b413)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/cdb87406db4bfab0740=
dbd3950e9b39feed41f5e
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Stefan-Roesch/io-uring-xfs-support=
-async-buffered-writes/20220521-024152
        git checkout cdb87406db4bfab0740dbd3950e9b39feed41f5e
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   34 warnings generated.
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   34 warnings generated.
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   25 warnings generated.
   drivers/pps/sysfs.c:26:9: warning: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%lld.%09d#%d\n",
                  ^~~~~~~
   drivers/pps/sysfs.c:26:9: note: Call to function 'sprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%lld.%09d#%d\n",
                  ^~~~~~~
   drivers/pps/sysfs.c:40:9: warning: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%lld.%09d#%d\n",
                  ^~~~~~~
   drivers/pps/sysfs.c:40:9: note: Call to function 'sprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%lld.%09d#%d\n",
                  ^~~~~~~
   drivers/pps/sysfs.c:51:9: warning: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%4x\n", pps->info.mode);
                  ^~~~~~~
   drivers/pps/sysfs.c:51:9: note: Call to function 'sprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%4x\n", pps->info.mode);
                  ^~~~~~~
   drivers/pps/sysfs.c:60:9: warning: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", !!pps->info.echo);
                  ^~~~~~~
   drivers/pps/sysfs.c:60:9: note: Call to function 'sprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", !!pps->info.echo);
                  ^~~~~~~
   drivers/pps/sysfs.c:69:9: warning: Call to function 'sprintf' is insecur=
e as it does not provide bounding of the memory buffer or security checks i=
ntroduced in the C11 standard. Replace with analogous functions that suppor=
t length arguments or provides boundary checks such as 'sprintf_s' in case =
of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandlin=
g]
           return sprintf(buf, "%s\n", pps->info.name);
                  ^~~~~~~
   drivers/pps/sysfs.c:69:9: note: Call to function 'sprintf' is insecure a=
s it does not provide bounding of the memory buffer or security checks intr=
oduced in the C11 standard. Replace with analogous functions that support l=
ength arguments or provides boundary checks such as 'sprintf_s' in case of =
C11
           return sprintf(buf, "%s\n", pps->info.name);
                  ^~~~~~~
   drivers/pps/sysfs.c:78:9: warning: Call to function 'sprintf' is insecur=
e as it does not provide bounding of the memory buffer or security checks i=
ntroduced in the C11 standard. Replace with analogous functions that suppor=
t length arguments or provides boundary checks such as 'sprintf_s' in case =
of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandlin=
g]
           return sprintf(buf, "%s\n", pps->info.path);
                  ^~~~~~~
   drivers/pps/sysfs.c:78:9: note: Call to function 'sprintf' is insecure a=
s it does not provide bounding of the memory buffer or security checks intr=
oduced in the C11 standard. Replace with analogous functions that support l=
ength arguments or provides boundary checks such as 'sprintf_s' in case of =
C11
           return sprintf(buf, "%s\n", pps->info.path);
                  ^~~~~~~
   Suppressed 19 warnings (19 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   50 warnings generated.
   fs/iomap/buffered-io.c:235:2: warning: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(addr, iomap->inline_data, size);
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
   fs/iomap/buffered-io.c:235:2: note: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11
           memcpy(addr, iomap->inline_data, size);
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
   fs/iomap/buffered-io.c:236:2: warning: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(addr + size, 0, PAGE_SIZE - poff - size);
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
   fs/iomap/buffered-io.c:236:2: note: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11
           memset(addr + size, 0, PAGE_SIZE - poff - size);
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
>> fs/iomap/buffered-io.c:554:21: warning: Value stored to 'iop' during its=
 initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct iomap_page *iop =3D to_iomap_page(folio);
                              ^~~   ~~~~~~~~~~~~~~~~~~~~
   fs/iomap/buffered-io.c:554:21: note: Value stored to 'iop' during its in=
itialization is never read
           struct iomap_page *iop =3D to_iomap_page(folio);
                              ^~~   ~~~~~~~~~~~~~~~~~~~~
   fs/iomap/buffered-io.c:697:2: warning: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(iomap_inline_data(iomap, pos), addr, copied);
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
   fs/iomap/buffered-io.c:697:2: note: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11
           memcpy(iomap_inline_data(iomap, pos), addr, copied);
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
   Suppressed 46 warnings (46 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   115 warnings generated.
   drivers/usb/early/xhci-dbc.c:204:2: warning: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(seg->trbs, 0, PAGE_SIZE);
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
   drivers/usb/early/xhci-dbc.c:204:2: note: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11
           memset(seg->trbs, 0, PAGE_SIZE);
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
   drivers/usb/early/xhci-dbc.c:241:2: warning: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(xdbc.table_base, 0, PAGE_SIZE);
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
   drivers/usb/early/xhci-dbc.c:241:2: note: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11
           memset(xdbc.table_base, 0, PAGE_SIZE);
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
   drivers/usb/early/xhci-dbc.c:242:2: warning: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(xdbc.out_buf, 0, PAGE_SIZE);
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
   drivers/usb/early/xhci-dbc.c:242:2: note: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11
           memset(xdbc.out_buf, 0, PAGE_SIZE);
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

vim +/iop +554 fs/iomap/buffered-io.c

afc51aaa22f26c Darrick J. Wong         2019-07-15  549  =

fad0a1ab34f777 Christoph Hellwig       2021-08-10  550  static int __iomap_=
write_begin(const struct iomap_iter *iter, loff_t pos,
bc6123a84a71b5 Matthew Wilcox (Oracle  2021-05-02  551) 		size_t len, struc=
t folio *folio)
afc51aaa22f26c Darrick J. Wong         2019-07-15  552  {
fad0a1ab34f777 Christoph Hellwig       2021-08-10  553  	const struct iomap=
 *srcmap =3D iomap_iter_srcmap(iter);
cdb87406db4bfa Stefan Roesch           2022-05-20 @554  	struct iomap_page =
*iop =3D to_iomap_page(folio);
1b5c1e36dc0e0f Christoph Hellwig       2021-08-10  555  	loff_t block_size =
=3D i_blocksize(iter->inode);
6cc19c5fad0908 Nikolay Borisov         2020-09-10  556  	loff_t block_start=
 =3D round_down(pos, block_size);
6cc19c5fad0908 Nikolay Borisov         2020-09-10  557  	loff_t block_end =
=3D round_up(pos + len, block_size);
431c0566bb6078 Matthew Wilcox (Oracle  2021-04-28  558) 	size_t from =3D of=
fset_in_folio(folio, pos), to =3D from + len;
431c0566bb6078 Matthew Wilcox (Oracle  2021-04-28  559) 	size_t poff, plen;
cdb87406db4bfa Stefan Roesch           2022-05-20  560  	gfp_t  gfp =3D GFP=
_NOFS | __GFP_NOFAIL;
afc51aaa22f26c Darrick J. Wong         2019-07-15  561  =

431c0566bb6078 Matthew Wilcox (Oracle  2021-04-28  562) 	if (folio_test_upt=
odate(folio))
afc51aaa22f26c Darrick J. Wong         2019-07-15  563  		return 0;
431c0566bb6078 Matthew Wilcox (Oracle  2021-04-28  564) 	folio_clear_error(=
folio);
afc51aaa22f26c Darrick J. Wong         2019-07-15  565  =

cdb87406db4bfa Stefan Roesch           2022-05-20  566  	iop =3D iomap_page=
_create(iter->inode, folio, gfp);
cdb87406db4bfa Stefan Roesch           2022-05-20  567  =

afc51aaa22f26c Darrick J. Wong         2019-07-15  568  	do {
431c0566bb6078 Matthew Wilcox (Oracle  2021-04-28  569) 		iomap_adjust_read=
_range(iter->inode, folio, &block_start,
afc51aaa22f26c Darrick J. Wong         2019-07-15  570  				block_end - blo=
ck_start, &poff, &plen);
afc51aaa22f26c Darrick J. Wong         2019-07-15  571  		if (plen =3D=3D 0)
afc51aaa22f26c Darrick J. Wong         2019-07-15  572  			break;
afc51aaa22f26c Darrick J. Wong         2019-07-15  573  =

b74b1293e6cae7 Christoph Hellwig       2021-08-10  574  		if (!(iter->flags=
 & IOMAP_UNSHARE) &&
32a38a49910439 Christoph Hellwig       2019-10-18  575  		    (from <=3D po=
ff || from >=3D poff + plen) &&
d3b404396977fd Christoph Hellwig       2019-10-18  576  		    (to <=3D poff=
 || to >=3D poff + plen))
d3b404396977fd Christoph Hellwig       2019-10-18  577  			continue;
d3b404396977fd Christoph Hellwig       2019-10-18  578  =

1b5c1e36dc0e0f Christoph Hellwig       2021-08-10  579  		if (iomap_block_n=
eeds_zeroing(iter, block_start)) {
b74b1293e6cae7 Christoph Hellwig       2021-08-10  580  			if (WARN_ON_ONCE=
(iter->flags & IOMAP_UNSHARE))
32a38a49910439 Christoph Hellwig       2019-10-18  581  				return -EIO;
431c0566bb6078 Matthew Wilcox (Oracle  2021-04-28  582) 			folio_zero_segme=
nts(folio, poff, from, to, poff + plen);
14284fedf59f16 Matthew Wilcox (Oracle  2020-09-10  583) 		} else {
431c0566bb6078 Matthew Wilcox (Oracle  2021-04-28  584) 			int status =3D i=
omap_read_folio_sync(block_start, folio,
14284fedf59f16 Matthew Wilcox (Oracle  2020-09-10  585) 					poff, plen, sr=
cmap);
d3b404396977fd Christoph Hellwig       2019-10-18  586  			if (status)
d3b404396977fd Christoph Hellwig       2019-10-18  587  				return status;
14284fedf59f16 Matthew Wilcox (Oracle  2020-09-10  588) 		}
431c0566bb6078 Matthew Wilcox (Oracle  2021-04-28  589) 		iomap_set_range_u=
ptodate(folio, iop, poff, plen);
afc51aaa22f26c Darrick J. Wong         2019-07-15  590  	} while ((block_st=
art +=3D plen) < block_end);
afc51aaa22f26c Darrick J. Wong         2019-07-15  591  =

d3b404396977fd Christoph Hellwig       2019-10-18  592  	return 0;
afc51aaa22f26c Darrick J. Wong         2019-07-15  593  }
afc51aaa22f26c Darrick J. Wong         2019-07-15  594  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0163077976299286262==--

