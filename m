Content-Type: multipart/mixed; boundary="===============7746777571542086344=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/md/bcache/sysfs.c:1102:4: warning: Division by zero [clang-analyzer-core.DivideZero]
Date: Fri, 26 Nov 2021 14:13:16 +0800
Message-ID: <202111261418.1JpEdsM1-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7746777571542086344==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Kees Cook <keescook@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   8ced7ca3570333998ad2088d5a6275701970e28e
commit: a52f8a59aef46b59753e583bf4b28fccb069ce64 fortify: Explicitly disabl=
e Clang support
date:   9 weeks ago
:::::: branch date: 11 hours ago
:::::: commit date: 9 weeks ago
config: i386-randconfig-c001-20211115 (https://download.01.org/0day-ci/arch=
ive/20211126/202111261418.1JpEdsM1-lkp(a)intel.com/config)
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
        # save the config file to linux build tree
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

58f913dce2814a9 Peter Foley     2017-10-13  1032  =

cafe563591446cf Kent Overstreet 2013-03-23  1033  SHOW(__bch_cache)
cafe563591446cf Kent Overstreet 2013-03-23  1034  {
cafe563591446cf Kent Overstreet 2013-03-23  1035  	struct cache *ca =3D con=
tainer_of(kobj, struct cache, kobj);
cafe563591446cf Kent Overstreet 2013-03-23  1036  =

cafe563591446cf Kent Overstreet 2013-03-23  1037  	sysfs_hprint(bucket_size=
,	bucket_bytes(ca));
cafe563591446cf Kent Overstreet 2013-03-23  1038  	sysfs_hprint(block_size,=
	block_bytes(ca));
cafe563591446cf Kent Overstreet 2013-03-23  1039  	sysfs_print(nbuckets,		c=
a->sb.nbuckets);
cafe563591446cf Kent Overstreet 2013-03-23  1040  	sysfs_print(discard,		ca=
->discard);
cafe563591446cf Kent Overstreet 2013-03-23  1041  	sysfs_hprint(written, at=
omic_long_read(&ca->sectors_written) << 9);
cafe563591446cf Kent Overstreet 2013-03-23  1042  	sysfs_hprint(btree_writt=
en,
cafe563591446cf Kent Overstreet 2013-03-23  1043  		     atomic_long_read(&=
ca->btree_sectors_written) << 9);
cafe563591446cf Kent Overstreet 2013-03-23 @1044  	sysfs_hprint(metadata_wr=
itten,
cafe563591446cf Kent Overstreet 2013-03-23  1045  		     (atomic_long_read(=
&ca->meta_sectors_written) +
cafe563591446cf Kent Overstreet 2013-03-23  1046  		      atomic_long_read(=
&ca->btree_sectors_written)) << 9);
cafe563591446cf Kent Overstreet 2013-03-23  1047  =

cafe563591446cf Kent Overstreet 2013-03-23  1048  	sysfs_print(io_errors,
cafe563591446cf Kent Overstreet 2013-03-23  1049  		    atomic_read(&ca->io=
_errors) >> IO_ERROR_SHIFT);
cafe563591446cf Kent Overstreet 2013-03-23  1050  =

cafe563591446cf Kent Overstreet 2013-03-23  1051  	if (attr =3D=3D &sysfs_c=
ache_replacement_policy)
169ef1cf6171d35 Kent Overstreet 2013-03-28  1052  		return bch_snprint_stri=
ng_list(buf, PAGE_SIZE,
cafe563591446cf Kent Overstreet 2013-03-23  1053  					       cache_replace=
ment_policies,
cafe563591446cf Kent Overstreet 2013-03-23  1054  					       CACHE_REPLACE=
MENT(&ca->sb));
cafe563591446cf Kent Overstreet 2013-03-23  1055  =

cafe563591446cf Kent Overstreet 2013-03-23  1056  	if (attr =3D=3D &sysfs_p=
riority_stats) {
15754020524a565 Kent Overstreet 2014-02-25  1057  		struct bucket *b;
15754020524a565 Kent Overstreet 2014-02-25  1058  		size_t n =3D ca->sb.nbu=
ckets, i;
15754020524a565 Kent Overstreet 2014-02-25  1059  		size_t unused =3D 0, av=
ailable =3D 0, dirty =3D 0, meta =3D 0;
cafe563591446cf Kent Overstreet 2013-03-23  1060  		uint64_t sum =3D 0;
bbc77aa7fb72e61 Kent Overstreet 2013-05-28  1061  		/* Compute 31 quantiles=
 */
bbc77aa7fb72e61 Kent Overstreet 2013-05-28  1062  		uint16_t q[31], *p, *ca=
ched;
cafe563591446cf Kent Overstreet 2013-03-23  1063  		ssize_t ret;
cafe563591446cf Kent Overstreet 2013-03-23  1064  =

42bc47b35320e0e Kees Cook       2018-06-12  1065  		cached =3D p =3D vmallo=
c(array_size(sizeof(uint16_t),
42bc47b35320e0e Kees Cook       2018-06-12  1066  						ca->sb.nbuckets));
cafe563591446cf Kent Overstreet 2013-03-23  1067  		if (!p)
cafe563591446cf Kent Overstreet 2013-03-23  1068  			return -ENOMEM;
cafe563591446cf Kent Overstreet 2013-03-23  1069  =

cafe563591446cf Kent Overstreet 2013-03-23  1070  		mutex_lock(&ca->set->bu=
cket_lock);
15754020524a565 Kent Overstreet 2014-02-25  1071  		for_each_bucket(b, ca) {
15754020524a565 Kent Overstreet 2014-02-25  1072  			if (!GC_SECTORS_USED(b=
))
15754020524a565 Kent Overstreet 2014-02-25  1073  				unused++;
15754020524a565 Kent Overstreet 2014-02-25  1074  			if (GC_MARK(b) =3D=3D =
GC_MARK_RECLAIMABLE)
15754020524a565 Kent Overstreet 2014-02-25  1075  				available++;
15754020524a565 Kent Overstreet 2014-02-25  1076  			if (GC_MARK(b) =3D=3D =
GC_MARK_DIRTY)
15754020524a565 Kent Overstreet 2014-02-25  1077  				dirty++;
15754020524a565 Kent Overstreet 2014-02-25  1078  			if (GC_MARK(b) =3D=3D =
GC_MARK_METADATA)
15754020524a565 Kent Overstreet 2014-02-25  1079  				meta++;
15754020524a565 Kent Overstreet 2014-02-25  1080  		}
15754020524a565 Kent Overstreet 2014-02-25  1081  =

cafe563591446cf Kent Overstreet 2013-03-23  1082  		for (i =3D ca->sb.first=
_bucket; i < n; i++)
cafe563591446cf Kent Overstreet 2013-03-23  1083  			p[i] =3D ca->buckets[i=
].prio;
cafe563591446cf Kent Overstreet 2013-03-23  1084  		mutex_unlock(&ca->set->=
bucket_lock);
cafe563591446cf Kent Overstreet 2013-03-23  1085  =

58f913dce2814a9 Peter Foley     2017-10-13  1086  		sort(p, n, sizeof(uint1=
6_t), __bch_cache_cmp, NULL);
cafe563591446cf Kent Overstreet 2013-03-23  1087  =

cafe563591446cf Kent Overstreet 2013-03-23  1088  		while (n &&
cafe563591446cf Kent Overstreet 2013-03-23  1089  		       !cached[n - 1])
cafe563591446cf Kent Overstreet 2013-03-23  1090  			--n;
cafe563591446cf Kent Overstreet 2013-03-23  1091  =

cafe563591446cf Kent Overstreet 2013-03-23  1092  		while (cached < p + n &&
6751c1e3cff3aa7 Joe Perches     2021-02-10  1093  		       *cached =3D=3D B=
TREE_PRIO) {
6751c1e3cff3aa7 Joe Perches     2021-02-10  1094  			cached++;
6751c1e3cff3aa7 Joe Perches     2021-02-10  1095  			n--;
6751c1e3cff3aa7 Joe Perches     2021-02-10  1096  		}
cafe563591446cf Kent Overstreet 2013-03-23  1097  =

cafe563591446cf Kent Overstreet 2013-03-23  1098  		for (i =3D 0; i < n; i+=
+)
cafe563591446cf Kent Overstreet 2013-03-23  1099  			sum +=3D INITIAL_PRIO =
- cached[i];
cafe563591446cf Kent Overstreet 2013-03-23  1100  =

cafe563591446cf Kent Overstreet 2013-03-23  1101  		if (n)
cafe563591446cf Kent Overstreet 2013-03-23 @1102  			do_div(sum, n);
cafe563591446cf Kent Overstreet 2013-03-23  1103  =

bbc77aa7fb72e61 Kent Overstreet 2013-05-28  1104  		for (i =3D 0; i < ARRAY=
_SIZE(q); i++)
bbc77aa7fb72e61 Kent Overstreet 2013-05-28  1105  			q[i] =3D INITIAL_PRIO =
- cached[n * (i + 1) /
bbc77aa7fb72e61 Kent Overstreet 2013-05-28  1106  				(ARRAY_SIZE(q) + 1)];
cafe563591446cf Kent Overstreet 2013-03-23  1107  =

cafe563591446cf Kent Overstreet 2013-03-23  1108  		vfree(p);
cafe563591446cf Kent Overstreet 2013-03-23  1109  =

bbc77aa7fb72e61 Kent Overstreet 2013-05-28  1110  		ret =3D scnprintf(buf, =
PAGE_SIZE,
cafe563591446cf Kent Overstreet 2013-03-23  1111  				"Unused:		%zu%%\n"
15754020524a565 Kent Overstreet 2014-02-25  1112  				"Clean:		%zu%%\n"
15754020524a565 Kent Overstreet 2014-02-25  1113  				"Dirty:		%zu%%\n"
cafe563591446cf Kent Overstreet 2013-03-23  1114  				"Metadata:	%zu%%\n"
cafe563591446cf Kent Overstreet 2013-03-23  1115  				"Average:	%llu\n"
cafe563591446cf Kent Overstreet 2013-03-23  1116  				"Sectors per Q:	%zu\n"
cafe563591446cf Kent Overstreet 2013-03-23  1117  				"Quantiles:	[",
cafe563591446cf Kent Overstreet 2013-03-23  1118  				unused * 100 / (size_=
t) ca->sb.nbuckets,
15754020524a565 Kent Overstreet 2014-02-25  1119  				available * 100 / (si=
ze_t) ca->sb.nbuckets,
15754020524a565 Kent Overstreet 2014-02-25  1120  				dirty * 100 / (size_t=
) ca->sb.nbuckets,
15754020524a565 Kent Overstreet 2014-02-25  1121  				meta * 100 / (size_t)=
 ca->sb.nbuckets, sum,
bbc77aa7fb72e61 Kent Overstreet 2013-05-28  1122  				n * ca->sb.bucket_siz=
e / (ARRAY_SIZE(q) + 1));
bbc77aa7fb72e61 Kent Overstreet 2013-05-28  1123  =

bbc77aa7fb72e61 Kent Overstreet 2013-05-28  1124  		for (i =3D 0; i < ARRAY=
_SIZE(q); i++)
bbc77aa7fb72e61 Kent Overstreet 2013-05-28  1125  			ret +=3D scnprintf(buf=
 + ret, PAGE_SIZE - ret,
bbc77aa7fb72e61 Kent Overstreet 2013-05-28  1126  					 "%u ", q[i]);
bbc77aa7fb72e61 Kent Overstreet 2013-05-28  1127  		ret--;
cafe563591446cf Kent Overstreet 2013-03-23  1128  =

bbc77aa7fb72e61 Kent Overstreet 2013-05-28  1129  		ret +=3D scnprintf(buf =
+ ret, PAGE_SIZE - ret, "]\n");
cafe563591446cf Kent Overstreet 2013-03-23  1130  =

cafe563591446cf Kent Overstreet 2013-03-23  1131  		return ret;
cafe563591446cf Kent Overstreet 2013-03-23  1132  	}
cafe563591446cf Kent Overstreet 2013-03-23  1133  =

cafe563591446cf Kent Overstreet 2013-03-23  1134  	return 0;
cafe563591446cf Kent Overstreet 2013-03-23  1135  }
cafe563591446cf Kent Overstreet 2013-03-23  1136  SHOW_LOCKED(bch_cache)
cafe563591446cf Kent Overstreet 2013-03-23  1137  =


:::::: The code@line 1102 was first introduced by commit
:::::: cafe563591446cf80bfbc2fe3bc72a2e36cf1060 bcache: A block layer cache

:::::: TO: Kent Overstreet <koverstreet@google.com>
:::::: CC: Kent Overstreet <koverstreet@google.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7746777571542086344==--

