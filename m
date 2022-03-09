Content-Type: multipart/mixed; boundary="===============6145066610141043698=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [davidhildenbrand:s390x_mkyoung 3/3] fs/gfs2/file.c:989:3: warning: Value stored to 'retried' is never read [clang-analyzer-deadcode.DeadStores]
Date: Wed, 09 Mar 2022 15:32:16 +0800
Message-ID: <202203091517.tNIeIM41-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6145066610141043698==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Andreas Gruenbacher <agruenba@redhat.com>
CC: David Hildenbrand <david@redhat.com>

tree:   git://github.com/davidhildenbrand/linux s390x_mkyoung
head:   72aef458f9af74990f40e716468a9bc6f5879650
commit: 72aef458f9af74990f40e716468a9bc6f5879650 [3/3] instrumentation
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: arm-randconfig-c002-20220308 (https://download.01.org/0day-ci/archi=
ve/20220309/202203091517.tNIeIM41-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a2e9c6=
8fcd4425fbce7380746e916966f00a39a0)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/davidhildenbrand/linux/commit/72aef458f9af7499=
0f40e716468a9bc6f5879650
        git remote add davidhildenbrand git://github.com/davidhildenbrand/l=
inux
        git fetch --no-tags davidhildenbrand s390x_mkyoung
        git checkout 72aef458f9af74990f40e716468a9bc6f5879650
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                                                      ^~~~
   include/asm-generic/bitops/fls.h:31:2: note: '?' condition is false
           if (!(x & 0xc0000000u)) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   include/asm-generic/bitops/fls.h:31:2: note: '?' condition is false
           if (!(x & 0xc0000000u)) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   include/asm-generic/bitops/fls.h:31:2: note: Taking false branch
           if (!(x & 0xc0000000u)) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   include/asm-generic/bitops/fls.h:35:6: note: Assuming the condition is f=
alse
           if (!(x & 0x80000000u)) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   include/asm-generic/bitops/fls.h:35:2: note: '?' condition is false
           if (!(x & 0x80000000u)) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   include/asm-generic/bitops/fls.h:35:2: note: '?' condition is false
           if (!(x & 0x80000000u)) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   include/asm-generic/bitops/fls.h:35:2: note: Taking false branch
           if (!(x & 0x80000000u)) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   include/asm-generic/bitops/fls.h:39:2: note: Returning the value 32 (loa=
ded from 'r')
           return r;
           ^~~~~~~~
   include/linux/bitops.h:155:10: note: Returning from 'fls'
                   return fls(l);
                          ^~~~~~
   include/linux/bitops.h:155:3: note: Returning the value 32
                   return fls(l);
                   ^~~~~~~~~~~~~
   include/linux/log2.h:57:16: note: Returning from 'fls_long'
           return 1UL << fls_long(n - 1);
                         ^~~~~~~~~~~~~~~
   include/linux/log2.h:57:13: note: The result of the left shift is undefi=
ned due to shifting by '32', which is greater or equal to the width of type=
 'unsigned long'
           return 1UL << fls_long(n - 1);
                      ^  ~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
>> fs/gfs2/file.c:989:3: warning: Value stored to 'retried' is never read [=
clang-analyzer-deadcode.DeadStores]
                   retried =3D false;
                   ^         ~~~~~
   fs/gfs2/file.c:989:3: note: Value stored to 'retried' is never read
                   retried =3D false;
                   ^         ~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   fs/gfs2/ops_fstype.c:856:2: warning: Value stored to 'jindex' is never r=
ead [clang-analyzer-deadcode.DeadStores]
           jindex =3D 0;
           ^        ~
   fs/gfs2/ops_fstype.c:856:2: note: Value stored to 'jindex' is never read
           jindex =3D 0;
           ^        ~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   fs/gfs2/inode.c:1493:4: warning: Value stored to 'error' is never read [=
clang-analyzer-deadcode.DeadStores]
                           error =3D 0;
                           ^       ~
   fs/gfs2/inode.c:1493:4: note: Value stored to 'error' is never read
                           error =3D 0;
                           ^       ~
   fs/gfs2/inode.c:1558:3: warning: Value stored to 'error' is never read [=
clang-analyzer-deadcode.DeadStores]
                   error =3D gfs2_unlink_inode(ndip, ndentry);
                   ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/gfs2/inode.c:1558:3: note: Value stored to 'error' is never read
                   error =3D gfs2_unlink_inode(ndip, ndentry);
                   ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   fs/gfs2/quota.c:839:2: warning: Value stored to 'err' is never read [cla=
ng-analyzer-deadcode.DeadStores]
           err =3D -EIO;
           ^     ~~~~
   fs/gfs2/quota.c:839:2: note: Value stored to 'err' is never read
           err =3D -EIO;
           ^     ~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/hwmon/pc87360.c:1450:12: warning: The right operand of '>=3D' is=
 a garbage value due to array index out of bounds [clang-analyzer-core.Unde=
finedBinaryOperatorResult]
                   if (init >=3D init_temp[i]) {
                            ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/hwmon/pc87360.c:1404:6: note: Assuming 'init' is < 2
           if (init >=3D 2 && data->innr) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/hwmon/pc87360.c:1404:16: note: Left side of '&&' is false
           if (init >=3D 2 && data->innr) {
                         ^
   drivers/hwmon/pc87360.c:1404:2: note: '?' condition is false
           if (init >=3D 2 && data->innr) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))

vim +/retried +989 fs/gfs2/file.c

967bcc91b044936 Andreas Gruenbacher 2018-06-19   937  =

967bcc91b044936 Andreas Gruenbacher 2018-06-19   938  static ssize_t gfs2_f=
ile_read_iter(struct kiocb *iocb, struct iov_iter *to)
967bcc91b044936 Andreas Gruenbacher 2018-06-19   939  {
20f829999c38b18 Andreas Gruenbacher 2020-07-01   940  	struct gfs2_inode *i=
p;
20f829999c38b18 Andreas Gruenbacher 2020-07-01   941  	struct gfs2_holder g=
h;
00bfe02f479688a Andreas Gruenbacher 2021-10-18   942  	size_t prev_count =
=3D 0, window_size =3D 0;
20f829999c38b18 Andreas Gruenbacher 2020-07-01   943  	size_t written =3D 0;
967bcc91b044936 Andreas Gruenbacher 2018-06-19   944  	ssize_t ret;
72aef458f9af749 Andreas Gruenbacher 2022-02-22   945  	bool retried =3D fal=
se;
967bcc91b044936 Andreas Gruenbacher 2018-06-19   946  =

00bfe02f479688a Andreas Gruenbacher 2021-10-18   947  	/*
00bfe02f479688a Andreas Gruenbacher 2021-10-18   948  	 * In this function,=
 we disable page faults when we're holding the
00bfe02f479688a Andreas Gruenbacher 2021-10-18   949  	 * inode glock while=
 doing I/O.  If a page fault occurs, we indicate
00bfe02f479688a Andreas Gruenbacher 2021-10-18   950  	 * that the inode gl=
ock may be dropped, fault in the pages manually,
00bfe02f479688a Andreas Gruenbacher 2021-10-18   951  	 * and retry.
00bfe02f479688a Andreas Gruenbacher 2021-10-18   952  	 */
00bfe02f479688a Andreas Gruenbacher 2021-10-18   953  =

967bcc91b044936 Andreas Gruenbacher 2018-06-19   954  	if (iocb->ki_flags &=
 IOCB_DIRECT) {
4c5c3010408d872 Andreas Gruenbacher 2020-06-29   955  		ret =3D gfs2_file_d=
irect_read(iocb, to, &gh);
967bcc91b044936 Andreas Gruenbacher 2018-06-19   956  		if (likely(ret !=3D=
 -ENOTBLK))
967bcc91b044936 Andreas Gruenbacher 2018-06-19   957  			return ret;
967bcc91b044936 Andreas Gruenbacher 2018-06-19   958  		iocb->ki_flags &=3D=
 ~IOCB_DIRECT;
967bcc91b044936 Andreas Gruenbacher 2018-06-19   959  	}
20f829999c38b18 Andreas Gruenbacher 2020-07-01   960  	iocb->ki_flags |=3D =
IOCB_NOIO;
20f829999c38b18 Andreas Gruenbacher 2020-07-01   961  	ret =3D generic_file=
_read_iter(iocb, to);
20f829999c38b18 Andreas Gruenbacher 2020-07-01   962  	iocb->ki_flags &=3D =
~IOCB_NOIO;
20f829999c38b18 Andreas Gruenbacher 2020-07-01   963  	if (ret >=3D 0) {
20f829999c38b18 Andreas Gruenbacher 2020-07-01   964  		if (!iov_iter_count=
(to))
20f829999c38b18 Andreas Gruenbacher 2020-07-01   965  			return ret;
20f829999c38b18 Andreas Gruenbacher 2020-07-01   966  		written =3D ret;
20f829999c38b18 Andreas Gruenbacher 2020-07-01   967  	} else {
20f829999c38b18 Andreas Gruenbacher 2020-07-01   968  		if (ret !=3D -EAGAI=
N)
20f829999c38b18 Andreas Gruenbacher 2020-07-01   969  			return ret;
20f829999c38b18 Andreas Gruenbacher 2020-07-01   970  		if (iocb->ki_flags =
& IOCB_NOWAIT)
20f829999c38b18 Andreas Gruenbacher 2020-07-01   971  			return ret;
20f829999c38b18 Andreas Gruenbacher 2020-07-01   972  	}
20f829999c38b18 Andreas Gruenbacher 2020-07-01   973  	ip =3D GFS2_I(iocb->=
ki_filp->f_mapping->host);
20f829999c38b18 Andreas Gruenbacher 2020-07-01   974  	gfs2_holder_init(ip-=
>i_gl, LM_ST_SHARED, 0, &gh);
00bfe02f479688a Andreas Gruenbacher 2021-10-18   975  retry:
20f829999c38b18 Andreas Gruenbacher 2020-07-01   976  	ret =3D gfs2_glock_n=
q(&gh);
20f829999c38b18 Andreas Gruenbacher 2020-07-01   977  	if (ret)
20f829999c38b18 Andreas Gruenbacher 2020-07-01   978  		goto out_uninit;
00bfe02f479688a Andreas Gruenbacher 2021-10-18   979  retry_under_glock:
00bfe02f479688a Andreas Gruenbacher 2021-10-18   980  	pagefault_disable();
20f829999c38b18 Andreas Gruenbacher 2020-07-01   981  	ret =3D generic_file=
_read_iter(iocb, to);
00bfe02f479688a Andreas Gruenbacher 2021-10-18   982  	pagefault_enable();
20f829999c38b18 Andreas Gruenbacher 2020-07-01   983  	if (ret > 0)
20f829999c38b18 Andreas Gruenbacher 2020-07-01   984  		written +=3D ret;
00bfe02f479688a Andreas Gruenbacher 2021-10-18   985  =

72aef458f9af749 Andreas Gruenbacher 2022-02-22   986  	if (retried) {
72aef458f9af749 Andreas Gruenbacher 2022-02-22   987  		if (ret =3D=3D -EFA=
ULT)
72aef458f9af749 Andreas Gruenbacher 2022-02-22   988  			atomic_inc(&GFS2_S=
B(&ip->i_inode)->sb_read_fault_race);
72aef458f9af749 Andreas Gruenbacher 2022-02-22  @989  		retried =3D false;
72aef458f9af749 Andreas Gruenbacher 2022-02-22   990  	}
72aef458f9af749 Andreas Gruenbacher 2022-02-22   991  =

00bfe02f479688a Andreas Gruenbacher 2021-10-18   992  	if (should_fault_in_=
pages(ret, to, &prev_count, &window_size)) {
00bfe02f479688a Andreas Gruenbacher 2021-10-18   993  		size_t leftover;
00bfe02f479688a Andreas Gruenbacher 2021-10-18   994  =

72aef458f9af749 Andreas Gruenbacher 2022-02-22   995  		atomic_inc(&GFS2_SB=
(&ip->i_inode)->sb_read_fault);
00bfe02f479688a Andreas Gruenbacher 2021-10-18   996  		gfs2_holder_allow_d=
emote(&gh);
00bfe02f479688a Andreas Gruenbacher 2021-10-18   997  		leftover =3D fault_=
in_iov_iter_writeable(to, window_size);
00bfe02f479688a Andreas Gruenbacher 2021-10-18   998  		gfs2_holder_disallo=
w_demote(&gh);
00bfe02f479688a Andreas Gruenbacher 2021-10-18   999  		if (leftover !=3D w=
indow_size) {
00bfe02f479688a Andreas Gruenbacher 2021-10-18  1000  			if (!gfs2_holder_q=
ueued(&gh)) {
00bfe02f479688a Andreas Gruenbacher 2021-10-18  1001  				if (written)
00bfe02f479688a Andreas Gruenbacher 2021-10-18  1002  					goto out_uninit;
72aef458f9af749 Andreas Gruenbacher 2022-02-22  1003  				atomic_inc(&GFS2_=
SB(&ip->i_inode)->sb_read_lock_stolen);
72aef458f9af749 Andreas Gruenbacher 2022-02-22  1004  				retried =3D true;
00bfe02f479688a Andreas Gruenbacher 2021-10-18  1005  				goto retry;
00bfe02f479688a Andreas Gruenbacher 2021-10-18  1006  			}
72aef458f9af749 Andreas Gruenbacher 2022-02-22  1007  			retried =3D true;
00bfe02f479688a Andreas Gruenbacher 2021-10-18  1008  			goto retry_under_g=
lock;
00bfe02f479688a Andreas Gruenbacher 2021-10-18  1009  		}
00bfe02f479688a Andreas Gruenbacher 2021-10-18  1010  	}
00bfe02f479688a Andreas Gruenbacher 2021-10-18  1011  	if (gfs2_holder_queu=
ed(&gh))
20f829999c38b18 Andreas Gruenbacher 2020-07-01  1012  		gfs2_glock_dq(&gh);
20f829999c38b18 Andreas Gruenbacher 2020-07-01  1013  out_uninit:
20f829999c38b18 Andreas Gruenbacher 2020-07-01  1014  	gfs2_holder_uninit(&=
gh);
20f829999c38b18 Andreas Gruenbacher 2020-07-01  1015  	return written ? wri=
tten : ret;
967bcc91b044936 Andreas Gruenbacher 2018-06-19  1016  }
967bcc91b044936 Andreas Gruenbacher 2018-06-19  1017  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6145066610141043698==--

