Content-Type: multipart/mixed; boundary="===============1217851966748172954=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/md/bcache/sysfs.c:1102:4: warning: Division by zero [clang-analyzer-core.DivideZero]
Date: Sun, 21 Nov 2021 19:07:03 +0800
Message-ID: <202111211953.H1JB2JBn-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1217851966748172954==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Kees Cook <keescook@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   923dcc5eb0c111eccd51cc7ce1658537e3c38b25
commit: a52f8a59aef46b59753e583bf4b28fccb069ce64 fortify: Explicitly disabl=
e Clang support
date:   8 weeks ago
:::::: branch date: 14 hours ago
:::::: commit date: 8 weeks ago
config: i386-randconfig-c001-20211115 (attached as .config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project fbe72e=
41b99dc7994daac300d208a955be3e4a0a)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Da52f8a59aef46b59753e583bf4b28fccb069ce64
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout a52f8a59aef46b59753e583bf4b28fccb069ce64
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   drivers/md/bcache/sysfs.h:67:3: note: expanded from macro 'sysfs_hprint'
                   strcat(buf, "\n");                                      \
                   ^~~~~~
   drivers/md/bcache/sysfs.c:740:2: warning: Call to function 'strcat' is i=
nsecure as it does not provide bounding of the memory buffer. Replace unbou=
nded copy functions with analogous functions that support length arguments =
such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           sysfs_hprint(btree_cache_size,          bch_cache_size(c));
           ^
   drivers/md/bcache/sysfs.h:67:3: note: expanded from macro 'sysfs_hprint'
                   strcat(buf, "\n");                                      \
                   ^~~~~~
   drivers/md/bcache/sysfs.c:740:2: note: Call to function 'strcat' is inse=
cure as it does not provide bounding of the memory buffer. Replace unbounde=
d copy functions with analogous functions that support length arguments suc=
h as 'strlcat'. CWE-119
           sysfs_hprint(btree_cache_size,          bch_cache_size(c));
           ^
   drivers/md/bcache/sysfs.h:67:3: note: expanded from macro 'sysfs_hprint'
                   strcat(buf, "\n");                                      \
                   ^~~~~~
   drivers/md/bcache/sysfs.c:751:2: warning: Call to function 'strcat' is i=
nsecure as it does not provide bounding of the memory buffer. Replace unbou=
nded copy functions with analogous functions that support length arguments =
such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           sysfs_hprint(average_key_size,  bch_average_key_size(c));
           ^
   drivers/md/bcache/sysfs.h:67:3: note: expanded from macro 'sysfs_hprint'
                   strcat(buf, "\n");                                      \
                   ^~~~~~
   drivers/md/bcache/sysfs.c:751:2: note: Call to function 'strcat' is inse=
cure as it does not provide bounding of the memory buffer. Replace unbounde=
d copy functions with analogous functions that support length arguments suc=
h as 'strlcat'. CWE-119
           sysfs_hprint(average_key_size,  bch_average_key_size(c));
           ^
   drivers/md/bcache/sysfs.h:67:3: note: expanded from macro 'sysfs_hprint'
                   strcat(buf, "\n");                                      \
                   ^~~~~~
   drivers/md/bcache/sysfs.c:778:2: warning: Call to function 'strcat' is i=
nsecure as it does not provide bounding of the memory buffer. Replace unbou=
nded copy functions with analogous functions that support length arguments =
such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           sysfs_hprint(congested,
           ^
   drivers/md/bcache/sysfs.h:67:3: note: expanded from macro 'sysfs_hprint'
                   strcat(buf, "\n");                                      \
                   ^~~~~~
   drivers/md/bcache/sysfs.c:778:2: note: Call to function 'strcat' is inse=
cure as it does not provide bounding of the memory buffer. Replace unbounde=
d copy functions with analogous functions that support length arguments suc=
h as 'strlcat'. CWE-119
           sysfs_hprint(congested,
           ^
   drivers/md/bcache/sysfs.h:67:3: note: expanded from macro 'sysfs_hprint'
                   strcat(buf, "\n");                                      \
                   ^~~~~~
   drivers/md/bcache/sysfs.c:1037:2: warning: Call to function 'strcat' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           sysfs_hprint(bucket_size,       bucket_bytes(ca));
           ^
   drivers/md/bcache/sysfs.h:67:3: note: expanded from macro 'sysfs_hprint'
                   strcat(buf, "\n");                                      \
                   ^~~~~~
   drivers/md/bcache/sysfs.c:1037:2: note: Call to function 'strcat' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcat'. CWE-119
           sysfs_hprint(bucket_size,       bucket_bytes(ca));
           ^
   drivers/md/bcache/sysfs.h:67:3: note: expanded from macro 'sysfs_hprint'
                   strcat(buf, "\n");                                      \
                   ^~~~~~
   drivers/md/bcache/sysfs.c:1038:2: warning: Call to function 'strcat' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           sysfs_hprint(block_size,        block_bytes(ca));
           ^
   drivers/md/bcache/sysfs.h:67:3: note: expanded from macro 'sysfs_hprint'
                   strcat(buf, "\n");                                      \
                   ^~~~~~
   drivers/md/bcache/sysfs.c:1038:2: note: Call to function 'strcat' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcat'. CWE-119
           sysfs_hprint(block_size,        block_bytes(ca));
           ^
   drivers/md/bcache/sysfs.h:67:3: note: expanded from macro 'sysfs_hprint'
                   strcat(buf, "\n");                                      \
                   ^~~~~~
   drivers/md/bcache/sysfs.c:1041:2: warning: Call to function 'strcat' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           sysfs_hprint(written, atomic_long_read(&ca->sectors_written) << =
9);
           ^
   drivers/md/bcache/sysfs.h:67:3: note: expanded from macro 'sysfs_hprint'
                   strcat(buf, "\n");                                      \
                   ^~~~~~
   drivers/md/bcache/sysfs.c:1041:2: note: Call to function 'strcat' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcat'. CWE-119
           sysfs_hprint(written, atomic_long_read(&ca->sectors_written) << =
9);
           ^
   drivers/md/bcache/sysfs.h:67:3: note: expanded from macro 'sysfs_hprint'
                   strcat(buf, "\n");                                      \
                   ^~~~~~
   drivers/md/bcache/sysfs.c:1042:2: warning: Call to function 'strcat' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           sysfs_hprint(btree_written,
           ^
   drivers/md/bcache/sysfs.h:67:3: note: expanded from macro 'sysfs_hprint'
                   strcat(buf, "\n");                                      \
                   ^~~~~~
   drivers/md/bcache/sysfs.c:1042:2: note: Call to function 'strcat' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcat'. CWE-119
           sysfs_hprint(btree_written,
           ^
   drivers/md/bcache/sysfs.h:67:3: note: expanded from macro 'sysfs_hprint'
                   strcat(buf, "\n");                                      \
                   ^~~~~~
   drivers/md/bcache/sysfs.c:1044:2: warning: Call to function 'strcat' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           sysfs_hprint(metadata_written,
           ^
   drivers/md/bcache/sysfs.h:67:3: note: expanded from macro 'sysfs_hprint'
                   strcat(buf, "\n");                                      \
                   ^~~~~~
   drivers/md/bcache/sysfs.c:1044:2: note: Call to function 'strcat' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcat'. CWE-119
           sysfs_hprint(metadata_written,
           ^
   drivers/md/bcache/sysfs.h:67:3: note: expanded from macro 'sysfs_hprint'
                   strcat(buf, "\n");                                      \
                   ^~~~~~
>> drivers/md/bcache/sysfs.c:1102:4: warning: Division by zero [clang-analy=
zer-core.DivideZero]
                           do_div(sum, n);
                           ^
   arch/x86/include/asm/div64.h:33:21: note: expanded from macro 'do_div'
                           __upper =3D __high % (__base);            \
                                     ~~~~~~~^~~~~~~~~~
   drivers/md/bcache/sysfs.c:1035:21: note: Left side of '&&' is false
           struct cache *ca =3D container_of(kobj, struct cache, kobj);
                              ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/md/bcache/sysfs.c:1035:21: note: '?' condition is true
           struct cache *ca =3D container_of(kobj, struct cache, kobj);
                              ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:317:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:297:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/md/bcache/sysfs.c:1035:21: note: Left side of '&&' is false
           struct cache *ca =3D container_of(kobj, struct cache, kobj);
                              ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/md/bcache/sysfs.c:1035:21: note: Taking false branch
           struct cache *ca =3D container_of(kobj, struct cache, kobj);
                              ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:317:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:305:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:297:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/md/bcache/sysfs.c:1035:21: note: Loop condition is false.  Exiti=
ng loop
           struct cache *ca =3D container_of(kobj, struct cache, kobj);
                              ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:317:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:305:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:295:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/md/bcache/sysfs.c:1037:2: note: '?' condition is false
           sysfs_hprint(bucket_size,       bucket_bytes(ca));
           ^
   drivers/md/bcache/sysfs.h:65:2: note: expanded from macro 'sysfs_hprint'
           if (attr =3D=3D &sysfs_ ## file) {                              =
    \
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/md/bcache/sysfs.c:1037:2: note: Assuming the condition is false
           sysfs_hprint(bucket_size,       bucket_bytes(ca));
           ^
   drivers/md/bcache/sysfs.h:65:2: note: expanded from macro 'sysfs_hprint'
           if (attr =3D=3D &sysfs_ ## file) {                              =
    \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:56:44: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'

vim +1102 drivers/md/bcache/sysfs.c

58f913dce2814a Peter Foley     2017-10-13  1032  =

cafe563591446c Kent Overstreet 2013-03-23  1033  SHOW(__bch_cache)
cafe563591446c Kent Overstreet 2013-03-23  1034  {
cafe563591446c Kent Overstreet 2013-03-23  1035  	struct cache *ca =3D cont=
ainer_of(kobj, struct cache, kobj);
cafe563591446c Kent Overstreet 2013-03-23  1036  =

cafe563591446c Kent Overstreet 2013-03-23  1037  	sysfs_hprint(bucket_size,=
	bucket_bytes(ca));
cafe563591446c Kent Overstreet 2013-03-23  1038  	sysfs_hprint(block_size,	=
block_bytes(ca));
cafe563591446c Kent Overstreet 2013-03-23  1039  	sysfs_print(nbuckets,		ca=
->sb.nbuckets);
cafe563591446c Kent Overstreet 2013-03-23  1040  	sysfs_print(discard,		ca-=
>discard);
cafe563591446c Kent Overstreet 2013-03-23  1041  	sysfs_hprint(written, ato=
mic_long_read(&ca->sectors_written) << 9);
cafe563591446c Kent Overstreet 2013-03-23  1042  	sysfs_hprint(btree_writte=
n,
cafe563591446c Kent Overstreet 2013-03-23  1043  		     atomic_long_read(&c=
a->btree_sectors_written) << 9);
cafe563591446c Kent Overstreet 2013-03-23  1044  	sysfs_hprint(metadata_wri=
tten,
cafe563591446c Kent Overstreet 2013-03-23  1045  		     (atomic_long_read(&=
ca->meta_sectors_written) +
cafe563591446c Kent Overstreet 2013-03-23  1046  		      atomic_long_read(&=
ca->btree_sectors_written)) << 9);
cafe563591446c Kent Overstreet 2013-03-23  1047  =

cafe563591446c Kent Overstreet 2013-03-23  1048  	sysfs_print(io_errors,
cafe563591446c Kent Overstreet 2013-03-23  1049  		    atomic_read(&ca->io_=
errors) >> IO_ERROR_SHIFT);
cafe563591446c Kent Overstreet 2013-03-23  1050  =

cafe563591446c Kent Overstreet 2013-03-23  1051  	if (attr =3D=3D &sysfs_ca=
che_replacement_policy)
169ef1cf6171d3 Kent Overstreet 2013-03-28  1052  		return bch_snprint_strin=
g_list(buf, PAGE_SIZE,
cafe563591446c Kent Overstreet 2013-03-23  1053  					       cache_replacem=
ent_policies,
cafe563591446c Kent Overstreet 2013-03-23  1054  					       CACHE_REPLACEM=
ENT(&ca->sb));
cafe563591446c Kent Overstreet 2013-03-23  1055  =

cafe563591446c Kent Overstreet 2013-03-23  1056  	if (attr =3D=3D &sysfs_pr=
iority_stats) {
15754020524a56 Kent Overstreet 2014-02-25  1057  		struct bucket *b;
15754020524a56 Kent Overstreet 2014-02-25  1058  		size_t n =3D ca->sb.nbuc=
kets, i;
15754020524a56 Kent Overstreet 2014-02-25  1059  		size_t unused =3D 0, ava=
ilable =3D 0, dirty =3D 0, meta =3D 0;
cafe563591446c Kent Overstreet 2013-03-23  1060  		uint64_t sum =3D 0;
bbc77aa7fb72e6 Kent Overstreet 2013-05-28  1061  		/* Compute 31 quantiles =
*/
bbc77aa7fb72e6 Kent Overstreet 2013-05-28  1062  		uint16_t q[31], *p, *cac=
hed;
cafe563591446c Kent Overstreet 2013-03-23  1063  		ssize_t ret;
cafe563591446c Kent Overstreet 2013-03-23  1064  =

42bc47b35320e0 Kees Cook       2018-06-12  1065  		cached =3D p =3D vmalloc=
(array_size(sizeof(uint16_t),
42bc47b35320e0 Kees Cook       2018-06-12  1066  						ca->sb.nbuckets));
cafe563591446c Kent Overstreet 2013-03-23  1067  		if (!p)
cafe563591446c Kent Overstreet 2013-03-23  1068  			return -ENOMEM;
cafe563591446c Kent Overstreet 2013-03-23  1069  =

cafe563591446c Kent Overstreet 2013-03-23  1070  		mutex_lock(&ca->set->buc=
ket_lock);
15754020524a56 Kent Overstreet 2014-02-25  1071  		for_each_bucket(b, ca) {
15754020524a56 Kent Overstreet 2014-02-25  1072  			if (!GC_SECTORS_USED(b))
15754020524a56 Kent Overstreet 2014-02-25  1073  				unused++;
15754020524a56 Kent Overstreet 2014-02-25  1074  			if (GC_MARK(b) =3D=3D G=
C_MARK_RECLAIMABLE)
15754020524a56 Kent Overstreet 2014-02-25  1075  				available++;
15754020524a56 Kent Overstreet 2014-02-25  1076  			if (GC_MARK(b) =3D=3D G=
C_MARK_DIRTY)
15754020524a56 Kent Overstreet 2014-02-25  1077  				dirty++;
15754020524a56 Kent Overstreet 2014-02-25  1078  			if (GC_MARK(b) =3D=3D G=
C_MARK_METADATA)
15754020524a56 Kent Overstreet 2014-02-25  1079  				meta++;
15754020524a56 Kent Overstreet 2014-02-25  1080  		}
15754020524a56 Kent Overstreet 2014-02-25  1081  =

cafe563591446c Kent Overstreet 2013-03-23  1082  		for (i =3D ca->sb.first_=
bucket; i < n; i++)
cafe563591446c Kent Overstreet 2013-03-23  1083  			p[i] =3D ca->buckets[i]=
.prio;
cafe563591446c Kent Overstreet 2013-03-23  1084  		mutex_unlock(&ca->set->b=
ucket_lock);
cafe563591446c Kent Overstreet 2013-03-23  1085  =

58f913dce2814a Peter Foley     2017-10-13  1086  		sort(p, n, sizeof(uint16=
_t), __bch_cache_cmp, NULL);
cafe563591446c Kent Overstreet 2013-03-23  1087  =

cafe563591446c Kent Overstreet 2013-03-23  1088  		while (n &&
cafe563591446c Kent Overstreet 2013-03-23  1089  		       !cached[n - 1])
cafe563591446c Kent Overstreet 2013-03-23  1090  			--n;
cafe563591446c Kent Overstreet 2013-03-23  1091  =

cafe563591446c Kent Overstreet 2013-03-23  1092  		while (cached < p + n &&
6751c1e3cff3aa Joe Perches     2021-02-10  1093  		       *cached =3D=3D BT=
REE_PRIO) {
6751c1e3cff3aa Joe Perches     2021-02-10  1094  			cached++;
6751c1e3cff3aa Joe Perches     2021-02-10  1095  			n--;
6751c1e3cff3aa Joe Perches     2021-02-10  1096  		}
cafe563591446c Kent Overstreet 2013-03-23  1097  =

cafe563591446c Kent Overstreet 2013-03-23  1098  		for (i =3D 0; i < n; i++)
cafe563591446c Kent Overstreet 2013-03-23  1099  			sum +=3D INITIAL_PRIO -=
 cached[i];
cafe563591446c Kent Overstreet 2013-03-23  1100  =

cafe563591446c Kent Overstreet 2013-03-23  1101  		if (n)
cafe563591446c Kent Overstreet 2013-03-23 @1102  			do_div(sum, n);
cafe563591446c Kent Overstreet 2013-03-23  1103  =

bbc77aa7fb72e6 Kent Overstreet 2013-05-28  1104  		for (i =3D 0; i < ARRAY_=
SIZE(q); i++)
bbc77aa7fb72e6 Kent Overstreet 2013-05-28  1105  			q[i] =3D INITIAL_PRIO -=
 cached[n * (i + 1) /
bbc77aa7fb72e6 Kent Overstreet 2013-05-28  1106  				(ARRAY_SIZE(q) + 1)];
cafe563591446c Kent Overstreet 2013-03-23  1107  =

cafe563591446c Kent Overstreet 2013-03-23  1108  		vfree(p);
cafe563591446c Kent Overstreet 2013-03-23  1109  =

bbc77aa7fb72e6 Kent Overstreet 2013-05-28  1110  		ret =3D scnprintf(buf, P=
AGE_SIZE,
cafe563591446c Kent Overstreet 2013-03-23  1111  				"Unused:		%zu%%\n"
15754020524a56 Kent Overstreet 2014-02-25  1112  				"Clean:		%zu%%\n"
15754020524a56 Kent Overstreet 2014-02-25  1113  				"Dirty:		%zu%%\n"
cafe563591446c Kent Overstreet 2013-03-23  1114  				"Metadata:	%zu%%\n"
cafe563591446c Kent Overstreet 2013-03-23  1115  				"Average:	%llu\n"
cafe563591446c Kent Overstreet 2013-03-23  1116  				"Sectors per Q:	%zu\n"
cafe563591446c Kent Overstreet 2013-03-23  1117  				"Quantiles:	[",
cafe563591446c Kent Overstreet 2013-03-23  1118  				unused * 100 / (size_t=
) ca->sb.nbuckets,
15754020524a56 Kent Overstreet 2014-02-25  1119  				available * 100 / (siz=
e_t) ca->sb.nbuckets,
15754020524a56 Kent Overstreet 2014-02-25  1120  				dirty * 100 / (size_t)=
 ca->sb.nbuckets,
15754020524a56 Kent Overstreet 2014-02-25  1121  				meta * 100 / (size_t) =
ca->sb.nbuckets, sum,
bbc77aa7fb72e6 Kent Overstreet 2013-05-28  1122  				n * ca->sb.bucket_size=
 / (ARRAY_SIZE(q) + 1));
bbc77aa7fb72e6 Kent Overstreet 2013-05-28  1123  =

bbc77aa7fb72e6 Kent Overstreet 2013-05-28  1124  		for (i =3D 0; i < ARRAY_=
SIZE(q); i++)
bbc77aa7fb72e6 Kent Overstreet 2013-05-28  1125  			ret +=3D scnprintf(buf =
+ ret, PAGE_SIZE - ret,
bbc77aa7fb72e6 Kent Overstreet 2013-05-28  1126  					 "%u ", q[i]);
bbc77aa7fb72e6 Kent Overstreet 2013-05-28  1127  		ret--;
cafe563591446c Kent Overstreet 2013-03-23  1128  =

bbc77aa7fb72e6 Kent Overstreet 2013-05-28  1129  		ret +=3D scnprintf(buf +=
 ret, PAGE_SIZE - ret, "]\n");
cafe563591446c Kent Overstreet 2013-03-23  1130  =

cafe563591446c Kent Overstreet 2013-03-23  1131  		return ret;
cafe563591446c Kent Overstreet 2013-03-23  1132  	}
cafe563591446c Kent Overstreet 2013-03-23  1133  =

cafe563591446c Kent Overstreet 2013-03-23  1134  	return 0;
cafe563591446c Kent Overstreet 2013-03-23  1135  }
cafe563591446c Kent Overstreet 2013-03-23  1136  SHOW_LOCKED(bch_cache)
cafe563591446c Kent Overstreet 2013-03-23  1137  =


:::::: The code@line 1102 was first introduced by commit
:::::: cafe563591446cf80bfbc2fe3bc72a2e36cf1060 bcache: A block layer cache

:::::: TO: Kent Overstreet <koverstreet@google.com>
:::::: CC: Kent Overstreet <koverstreet@google.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============1217851966748172954==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============1217851966748172954==--

