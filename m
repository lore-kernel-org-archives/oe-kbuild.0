Content-Type: multipart/mixed; boundary="===============3292291466684383561=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 17/17] fortify: Work around Clang inlining bugs
Date: Thu, 16 Dec 2021 23:37:54 +0800
Message-ID: <202112162317.HYiDRObX-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3292291466684383561==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20211213223331.135412-18-keescook@chromium.org>
References: <20211213223331.135412-18-keescook@chromium.org>
TO: Kees Cook <keescook@chromium.org>

Hi Kees,

I love your patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v5.16-rc5]
[cannot apply to rdma/for-next axboe-block/for-next kvm/queue tip/x86/core =
mkp-scsi/for-next jejb-scsi/for-next next-20211215]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Kees-Cook/Enable-strict-co=
mpile-time-memcpy-fortify-checks/20211214-064002
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
aa50faff4416c869b52dff68a937c84d29e12f4b
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-c007-20211215 (https://download.01.org/0day-ci/ar=
chive/20211216/202112162317.HYiDRObX-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project dd245b=
ab9fbb364faa1581e4f92ba3119a872fba)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/e5d600e1abbdd2034dbc84465=
4957a4ec1182dbf
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Kees-Cook/Enable-strict-compile-ti=
me-memcpy-fortify-checks/20211214-064002
        git checkout e5d600e1abbdd2034dbc844654957a4ec1182dbf
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
               ^
   fs/jfs/jfs_logmgr.c:892:8: note: Assuming field 'gcrtc' is > 0
               ((log->gcrtc > 0) || (tblk->bp->l_wqnext !=3D NULL) ||
                 ^~~~~~~~~~~~~~
   fs/jfs/jfs_logmgr.c:892:24: note: Left side of '||' is true
               ((log->gcrtc > 0) || (tblk->bp->l_wqnext !=3D NULL) ||
                                 ^
   fs/jfs/jfs_logmgr.c:897:3: note: Calling 'lmGCwrite'
                   lmGCwrite(log, 1);
                   ^~~~~~~~~~~~~~~~~
   fs/jfs/jfs_logmgr.c:751:2: note: 'xtblk' initialized to a null pointer v=
alue
           struct tblock *xtblk =3D NULL;
           ^~~~~~~~~~~~~~~~~~~~
   fs/jfs/jfs_logmgr.c:762:2: note: Loop condition is false. Execution cont=
inues on line 771
           list_for_each_entry(tblk, &log->cqueue, cqueue) {
           ^
   include/linux/list.h:630:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   fs/jfs/jfs_logmgr.c:771:2: note: Null pointer value stored to 'tblk'
           tblk =3D xtblk;           /* last tblk of the page */
           ^~~~~~~~~~~~
   fs/jfs/jfs_logmgr.c:776:23: note: Access to field 'bp' results in a dere=
ference of a null pointer (loaded from variable 'tblk')
           bp =3D (struct lbuf *) tblk->bp;
                                ^~~~
   fs/jfs/jfs_logmgr.c:1346:3: warning: Value stored to 'lp' is never read =
[clang-analyzer-deadcode.DeadStores]
                   lp =3D (struct logpage *) bp->l_ldata;
                   ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/jfs/jfs_logmgr.c:1346:3: note: Value stored to 'lp' is never read
                   lp =3D (struct logpage *) bp->l_ldata;
                   ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
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
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
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
   11 warnings generated.
   fs/dlm/config.c:723:4: warning: Call to function 'strcat' is insecure as=
 it does not provide bounding of the memory buffer. Replace unbounded copy =
functions with analogous functions that support length arguments such as 's=
trlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcat(buf, buf0);
                           ^~~~~~
   fs/dlm/config.c:723:4: note: Call to function 'strcat' is insecure as it=
 does not provide bounding of the memory buffer. Replace unbounded copy fun=
ctions with analogous functions that support length arguments such as 'strl=
cat'. CWE-119
                           strcat(buf, buf0);
                           ^~~~~~
>> include/linux/fortify-string.h:137:3: warning: Null pointer passed as 1s=
t argument to memory copy function [clang-analyzer-unix.cstring.NullArg]
                   __underlying_memcpy(p, q, len);
                   ^
   include/linux/fortify-string.h:43:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^
   fs/dlm/config.c:125:10: note: Passing null pointer value via 1st paramet=
er 'p'
           strlcpy(cl->cl_cluster_name, buf, sizeof(cl->cl_cluster_name));
                   ^
   include/linux/fortify-string.h:114:44: note: expanded from macro 'strlcp=
y'
   #define strlcpy(p, q, s) __fortify_strlcpy(p, q, s,                     \
                                              ^
   fs/dlm/config.c:125:2: note: Calling '__fortify_strlcpy'
           strlcpy(cl->cl_cluster_name, buf, sizeof(cl->cl_cluster_name));
           ^
   include/linux/fortify-string.h:114:26: note: expanded from macro 'strlcp=
y'
   #define strlcpy(p, q, s) __fortify_strlcpy(p, q, s,                     \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:125:27: note: Left side of '&&' is false
           if (p_size =3D=3D (size_t)-1 && q_size =3D=3D (size_t)-1)
                                    ^
   include/linux/fortify-string.h:128:9: note: 'q_len' is >=3D 'size'
           len =3D (q_len >=3D size) ? size - 1 : q_len;
                  ^~~~~
   include/linux/fortify-string.h:128:8: note: '?' condition is true
           len =3D (q_len >=3D size) ? size - 1 : q_len;
                 ^
   include/linux/fortify-string.h:129:33: note: Left side of '&&' is false
           if (__builtin_constant_p(size) && __builtin_constant_p(q_len) &&=
 size) {
                                          ^
   include/linux/fortify-string.h:134:6: note: 'size' is 64
           if (size) {
               ^~~~
   include/linux/fortify-string.h:134:2: note: Taking true branch
           if (size) {
           ^
   include/linux/fortify-string.h:135:7: note: 'len' is < 'p_size'
                   if (len >=3D p_size)
                       ^~~
   include/linux/fortify-string.h:135:3: note: Taking false branch
                   if (len >=3D p_size)
                   ^
   include/linux/fortify-string.h:137:3: note: Null pointer passed as 1st a=
rgument to memory copy function
                   __underlying_memcpy(p, q, len);
                   ^                   ~
   include/linux/fortify-string.h:43:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (4 in non-user code, 1 with check filters).
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
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (6 in non-user code, 1 with check filters).
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
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
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
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   fs/ntfs/inode.c:1840:3: warning: Value stored to 'err' is never read [cl=
ang-analyzer-deadcode.DeadStores]
                   err =3D -ENOMEM;
                   ^     ~~~~~~~
   fs/ntfs/inode.c:1840:3: note: Value stored to 'err' is never read
                   err =3D -ENOMEM;
                   ^     ~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.

vim +137 include/linux/fortify-string.h

a28a6e860c6cf2 Francis Laniel 2021-02-25  111  =

a28a6e860c6cf2 Francis Laniel 2021-02-25  112  /* defined after fortified s=
trlen to reuse it */
a28a6e860c6cf2 Francis Laniel 2021-02-25  113  extern size_t __real_strlcpy=
(char *, const char *, size_t) __RENAME(strlcpy);
e5d600e1abbdd2 Kees Cook      2021-12-13  114  #define strlcpy(p, q, s) __f=
ortify_strlcpy(p, q, s,			\
e5d600e1abbdd2 Kees Cook      2021-12-13  115  					   __builtin_object_siz=
e(p, 1),	\
e5d600e1abbdd2 Kees Cook      2021-12-13  116  					   __builtin_object_siz=
e(q, 1))
e5d600e1abbdd2 Kees Cook      2021-12-13  117  __FORTIFY_INLINE size_t __fo=
rtify_strlcpy(char *p, const char *q,
e5d600e1abbdd2 Kees Cook      2021-12-13  118  					  size_t size,
e5d600e1abbdd2 Kees Cook      2021-12-13  119  					  const size_t p_size,
e5d600e1abbdd2 Kees Cook      2021-12-13  120  					  const size_t q_size)
a28a6e860c6cf2 Francis Laniel 2021-02-25  121  {
3009f891bb9f32 Kees Cook      2021-08-02  122  	size_t q_len;	/* Full count=
 of source string length. */
3009f891bb9f32 Kees Cook      2021-08-02  123  	size_t len;	/* Count of cha=
racters going into destination. */
a28a6e860c6cf2 Francis Laniel 2021-02-25  124  =

a28a6e860c6cf2 Francis Laniel 2021-02-25  125  	if (p_size =3D=3D (size_t)-=
1 && q_size =3D=3D (size_t)-1)
a28a6e860c6cf2 Francis Laniel 2021-02-25  126  		return __real_strlcpy(p, q=
, size);
3009f891bb9f32 Kees Cook      2021-08-02  127  	q_len =3D strlen(q);
3009f891bb9f32 Kees Cook      2021-08-02  128  	len =3D (q_len >=3D size) ?=
 size - 1 : q_len;
3009f891bb9f32 Kees Cook      2021-08-02  129  	if (__builtin_constant_p(si=
ze) && __builtin_constant_p(q_len) && size) {
3009f891bb9f32 Kees Cook      2021-08-02  130  		/* Write size is always la=
rger than destination. */
3009f891bb9f32 Kees Cook      2021-08-02  131  		if (len >=3D p_size)
a28a6e860c6cf2 Francis Laniel 2021-02-25  132  			__write_overflow();
3009f891bb9f32 Kees Cook      2021-08-02  133  	}
3009f891bb9f32 Kees Cook      2021-08-02  134  	if (size) {
a28a6e860c6cf2 Francis Laniel 2021-02-25  135  		if (len >=3D p_size)
a28a6e860c6cf2 Francis Laniel 2021-02-25  136  			fortify_panic(__func__);
a28a6e860c6cf2 Francis Laniel 2021-02-25 @137  		__underlying_memcpy(p, q, =
len);
a28a6e860c6cf2 Francis Laniel 2021-02-25  138  		p[len] =3D '\0';
a28a6e860c6cf2 Francis Laniel 2021-02-25  139  	}
3009f891bb9f32 Kees Cook      2021-08-02  140  	return q_len;
a28a6e860c6cf2 Francis Laniel 2021-02-25  141  }
a28a6e860c6cf2 Francis Laniel 2021-02-25  142  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3292291466684383561==--

