Content-Type: multipart/mixed; boundary="===============4669250935639819823=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [RFC PATCH 2/2] sbitmap: Spread sbitmap word allocation over NUMA nodes
Date: Wed, 11 May 2022 16:54:04 +0800
Message-ID: <202205111616.bVssFWeh-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4669250935639819823==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <1652181274-136198-3-git-send-email-john.garry@huawei.com>
References: <1652181274-136198-3-git-send-email-john.garry@huawei.com>
TO: John Garry <john.garry@huawei.com>

Hi John,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on axboe-block/for-next]
[also build test WARNING on linux/master linus/master v5.18-rc6 next-202205=
10]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/John-Garry/sbitmap-N=
UMA-node-spreading/20220510-192122
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.g=
it for-next
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
config: i386-randconfig-c001-20220509 (https://download.01.org/0day-ci/arch=
ive/20220511/202205111616.bVssFWeh-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 18dd12=
3c56754edf62c7042dcf23185c3727610f)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/9cb4cd7060790dcb3d7=
f9405c11a0da884a0c616
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review John-Garry/sbitmap-NUMA-node-sprea=
ding/20220510-192122
        git checkout 9cb4cd7060790dcb3d7f9405c11a0da884a0c616
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                           ^
   fs/ntfs/mft.c:1798:2: note: Taking false branch
           if (IS_ERR(rl)) {
           ^
   fs/ntfs/mft.c:1811:2: note: Taking false branch
           ntfs_debug("Allocated %lli clusters.", (long long)nr);
           ^
   fs/ntfs/debug.h:39:2: note: expanded from macro 'ntfs_debug'
           if (0)                                                          \
           ^
   fs/ntfs/mft.c:1811:2: note: Loop condition is false.  Exiting loop
           ntfs_debug("Allocated %lli clusters.", (long long)nr);
           ^
   fs/ntfs/debug.h:37:35: note: expanded from macro 'ntfs_debug'
   #define ntfs_debug(fmt, ...)                                            \
                                                                           ^
   fs/ntfs/mft.c:1813:2: note: Loop condition is false. Execution continues=
 on line 1816
           for (; rl[1].length; rl++)
           ^
   fs/ntfs/mft.c:1817:2: note: Taking true branch
           if (IS_ERR(mrec)) {
           ^
   fs/ntfs/mft.c:1820:3: note: Control jumps to line 1953
                   goto undo_alloc;
                   ^
   fs/ntfs/mft.c:1953:6: note: Assuming the condition is false
           if (ntfs_cluster_free(mft_ni, old_last_vcn, -1, ctx) < 0) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ntfs/mft.c:1953:2: note: Taking false branch
           if (ntfs_cluster_free(mft_ni, old_last_vcn, -1, ctx) < 0) {
           ^
   fs/ntfs/mft.c:1958:6: note: Access to field 'attr' results in a derefere=
nce of a null pointer (loaded from variable 'ctx')
           a =3D ctx->attr;
               ^~~
   fs/ntfs/mft.c:2019:2: warning: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecur=
eAPI.DeprecatedOrUnsafeBufferHandling]
           memset(m, 0, vol->mft_record_size);
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   fs/ntfs/mft.c:2019:2: note: Call to function 'memset' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memset_s' in case of C11
           memset(m, 0, vol->mft_record_size);
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   fs/ntfs/mft.c:2813:3: warning: Call to function 'memmove' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memmove_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
                   memmove(extent_nis, extent_nis + 1, (base_ni->nr_extents=
 - i) *
                   ^~~~~~~
   fs/ntfs/mft.c:2813:3: note: Call to function 'memmove' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memmove_s' in case of C11
                   memmove(extent_nis, extent_nis + 1, (base_ni->nr_extents=
 - i) *
                   ^~~~~~~
   fs/ntfs/mft.c:2893:4: warning: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecur=
eAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(extent_nis, base_ni->ext.extent_ntfs_inos,
                           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   fs/ntfs/mft.c:2893:4: note: Call to function 'memcpy' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memcpy_s' in case of C11
                           memcpy(extent_nis, base_ni->ext.extent_ntfs_inos,
                           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   20 warnings generated.
   lib/oid_registry.c:142:16: warning: Call to function 'snprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           ret =3D count =3D snprintf(buffer, bufsize, "%u.%u", n / 40, n %=
 40);
                         ^~~~~~~~
   lib/oid_registry.c:142:16: note: Call to function 'snprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'snprintf_s' in case of C11
           ret =3D count =3D snprintf(buffer, bufsize, "%u.%u", n / 40, n %=
 40);
                         ^~~~~~~~
   lib/oid_registry.c:149:3: warning: Value stored to 'num' is never read [=
clang-analyzer-deadcode.DeadStores]
                   num =3D 0;
                   ^     ~
   lib/oid_registry.c:149:3: note: Value stored to 'num' is never read
                   num =3D 0;
                   ^     ~
   lib/oid_registry.c:163:18: warning: Call to function 'snprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   ret +=3D count =3D snprintf(buffer, bufsize, ".%lu", num=
);
                                  ^~~~~~~~
   lib/oid_registry.c:163:18: note: Call to function 'snprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'snprintf_s' in case of C11
                   ret +=3D count =3D snprintf(buffer, bufsize, ".%lu", num=
);
                                  ^~~~~~~~
   lib/oid_registry.c:173:2: warning: Call to function 'snprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(buffer, bufsize, "(bad)");
           ^~~~~~~~
   lib/oid_registry.c:173:2: note: Call to function 'snprintf' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'snprintf_s' in case of C11
           snprintf(buffer, bufsize, "(bad)");
           ^~~~~~~~
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   19 warnings generated.
   Suppressed 19 warnings (12 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
>> lib/sbitmap.c:138:63: warning: The expression is an uninitialized value.=
 The computed value will also be garbage [clang-analyzer-core.uninitialized=
.Assign]
           for (index =3D 0, nid =3D 0; index < sb->map_nr; index++, map++,=
 map_nr_cnt++) {
                                                                        ^
   lib/sbitmap.c:481:8: note: Calling 'sbitmap_init_node'
           ret =3D sbitmap_init_node(&sbq->sb, depth, shift, flags, node,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/sbitmap.c:103:11: note: 'map_nr_cnt' declared without an initial val=
ue
           int nid, map_nr_cnt;
                    ^~~~~~~~~~
   lib/sbitmap.c:105:6: note: Assuming 'shift' is >=3D 0
           if (shift < 0)
               ^~~~~~~~~
   lib/sbitmap.c:105:2: note: Taking false branch
           if (shift < 0)
           ^
   lib/sbitmap.c:109:6: note: Assuming 'bits_per_word' is <=3D BITS_PER_LONG
           if (bits_per_word > BITS_PER_LONG)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/sbitmap.c:109:2: note: Taking false branch
           if (bits_per_word > BITS_PER_LONG)
           ^
   lib/sbitmap.c:117:6: note: Assuming 'depth' is not equal to 0
           if (depth =3D=3D 0) {
               ^~~~~~~~~~
   lib/sbitmap.c:117:2: note: Taking false branch
           if (depth =3D=3D 0) {
           ^
   lib/sbitmap.c:122:6: note: Assuming 'num_nodes' is <=3D field 'map_nr'
           if (sb->map_nr < num_nodes) {
               ^~~~~~~~~~~~~~~~~~~~~~
   lib/sbitmap.c:122:2: note: Taking false branch
           if (sb->map_nr < num_nodes) {
           ^
   lib/sbitmap.c:127:6: note: 'alloc_hint' is true
           if (alloc_hint) {
               ^~~~~~~~~~
   lib/sbitmap.c:127:2: note: Taking true branch
           if (alloc_hint) {
           ^
   lib/sbitmap.c:128:7: note: Calling 'init_alloc_hint'
                   if (init_alloc_hint(sb, flags))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/sbitmap.c:28:6: note: Assuming field 'alloc_hint' is non-null
           if (!sb->alloc_hint)
               ^~~~~~~~~~~~~~~
   lib/sbitmap.c:28:2: note: Taking false branch
           if (!sb->alloc_hint)
           ^
   lib/sbitmap.c:31:6: note: 'depth' is not equal to 0
           if (depth && !sb->round_robin) {
               ^~~~~
   lib/sbitmap.c:31:6: note: Left side of '&&' is true
   lib/sbitmap.c:31:15: note: Assuming field 'round_robin' is true
           if (depth && !sb->round_robin) {
                        ^~~~~~~~~~~~~~~~
   lib/sbitmap.c:31:2: note: Taking false branch
           if (depth && !sb->round_robin) {
           ^
   lib/sbitmap.c:39:2: note: Returning without writing to 'sb->map', which =
participates in a condition later
           return 0;
           ^
   lib/sbitmap.c:128:7: note: Returning from 'init_alloc_hint'
                   if (init_alloc_hint(sb, flags))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/sbitmap.c:128:3: note: Taking false branch
                   if (init_alloc_hint(sb, flags))
                   ^
   lib/sbitmap.c:135:6: note: Assuming field 'map' is non-null
           if (!sb->map)
               ^~~~~~~~
   lib/sbitmap.c:135:2: note: Taking false branch
           if (!sb->map)
           ^
   lib/sbitmap.c:138:27: note: 'index' is < field 'map_nr'
           for (index =3D 0, nid =3D 0; index < sb->map_nr; index++, map++,=
 map_nr_cnt++) {
                                    ^~~~~
   lib/sbitmap.c:138:2: note: Loop condition is true.  Entering loop body
           for (index =3D 0, nid =3D 0; index < sb->map_nr; index++, map++,=
 map_nr_cnt++) {
           ^
   lib/sbitmap.c:141:3: note: Taking true branch
                   if ((index % sb->map_nr_per_node) =3D=3D 0) {
                   ^
   lib/sbitmap.c:144:8: note: 'index' is equal to 0
                           if (index =3D=3D 0) {
                               ^~~~~
   lib/sbitmap.c:144:4: note: Taking true branch
                           if (index =3D=3D 0) {
                           ^
   lib/sbitmap.c:152:8: note: Assuming 'map' is non-null
                           if (!map)
                               ^~~~
   lib/sbitmap.c:152:4: note: Taking false branch
                           if (!map)
                           ^
   lib/sbitmap.c:138:63: note: The expression is an uninitialized value. Th=
e computed value will also be garbage
           for (index =3D 0, nid =3D 0; index < sb->map_nr; index++, map++,=
 map_nr_cnt++) {
                                                                        ^~~=
~~~~~~~
   Suppressed 30 warnings (29 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   36 warnings generated.
   Suppressed 36 warnings (36 in non-user code).

vim +138 lib/sbitmap.c

b2dbff1bb893d5 Jens Axboe    2018-12-11   95  =

88459642cba452 Omar Sandoval 2016-09-17   96  int sbitmap_init_node(struct =
sbitmap *sb, unsigned int depth, int shift,
c548e62bcf6adc Ming Lei      2021-01-22   97  		      gfp_t flags, int node=
, bool round_robin,
c548e62bcf6adc Ming Lei      2021-01-22   98  		      bool alloc_hint)
88459642cba452 Omar Sandoval 2016-09-17   99  {
88459642cba452 Omar Sandoval 2016-09-17  100  	unsigned int bits_per_word;
829ed3bea2e697 John Garry    2022-05-10  101  	struct sbitmap_word *map;
9cb4cd7060790d John Garry    2022-05-10  102  	int index, num_nodes =3D num=
_online_nodes();
9cb4cd7060790d John Garry    2022-05-10  103  	int nid, map_nr_cnt;
88459642cba452 Omar Sandoval 2016-09-17  104  =

2d13b1ea9f4aff Ming Lei      2021-01-22  105  	if (shift < 0)
2d13b1ea9f4aff Ming Lei      2021-01-22  106  		shift =3D sbitmap_calculate=
_shift(depth);
2d13b1ea9f4aff Ming Lei      2021-01-22  107  =

88459642cba452 Omar Sandoval 2016-09-17  108  	bits_per_word =3D 1U << shif=
t;
88459642cba452 Omar Sandoval 2016-09-17  109  	if (bits_per_word > BITS_PER=
_LONG)
88459642cba452 Omar Sandoval 2016-09-17  110  		return -EINVAL;
88459642cba452 Omar Sandoval 2016-09-17  111  =

88459642cba452 Omar Sandoval 2016-09-17  112  	sb->shift =3D shift;
88459642cba452 Omar Sandoval 2016-09-17  113  	sb->depth =3D depth;
88459642cba452 Omar Sandoval 2016-09-17  114  	sb->map_nr =3D DIV_ROUND_UP(=
sb->depth, bits_per_word);
efe1f3a1d5833c Ming Lei      2021-01-22  115  	sb->round_robin =3D round_ro=
bin;
88459642cba452 Omar Sandoval 2016-09-17  116  =

88459642cba452 Omar Sandoval 2016-09-17  117  	if (depth =3D=3D 0) {
88459642cba452 Omar Sandoval 2016-09-17  118  		sb->map =3D NULL;
88459642cba452 Omar Sandoval 2016-09-17  119  		return 0;
88459642cba452 Omar Sandoval 2016-09-17  120  	}
88459642cba452 Omar Sandoval 2016-09-17  121  =

9cb4cd7060790d John Garry    2022-05-10  122  	if (sb->map_nr < num_nodes) {
9cb4cd7060790d John Garry    2022-05-10  123  		sb->map_nr_per_node =3D 1;
9cb4cd7060790d John Garry    2022-05-10  124  	} else {
9cb4cd7060790d John Garry    2022-05-10  125  		sb->map_nr_per_node =3D sb-=
>map_nr / num_nodes;
9cb4cd7060790d John Garry    2022-05-10  126  	}
c548e62bcf6adc Ming Lei      2021-01-22  127  	if (alloc_hint) {
c548e62bcf6adc Ming Lei      2021-01-22  128  		if (init_alloc_hint(sb, fla=
gs))
c548e62bcf6adc Ming Lei      2021-01-22  129  			return -ENOMEM;
c548e62bcf6adc Ming Lei      2021-01-22  130  	} else {
c548e62bcf6adc Ming Lei      2021-01-22  131  		sb->alloc_hint =3D NULL;
c548e62bcf6adc Ming Lei      2021-01-22  132  	}
c548e62bcf6adc Ming Lei      2021-01-22  133  =

863a66cdb4df25 Ming Lei      2022-03-16  134  	sb->map =3D kvzalloc_node(sb=
->map_nr * sizeof(*sb->map), flags, node);
9cb4cd7060790d John Garry    2022-05-10  135  	if (!sb->map)
9cb4cd7060790d John Garry    2022-05-10  136  		goto err_map;
9cb4cd7060790d John Garry    2022-05-10  137  =

9cb4cd7060790d John Garry    2022-05-10 @138  	for (index =3D 0, nid =3D 0;=
 index < sb->map_nr; index++, map++, map_nr_cnt++) {
9cb4cd7060790d John Garry    2022-05-10  139  		struct sbitmap_word **_map;
9cb4cd7060790d John Garry    2022-05-10  140  =

9cb4cd7060790d John Garry    2022-05-10  141  		if ((index % sb->map_nr_per=
_node) =3D=3D 0) {
9cb4cd7060790d John Garry    2022-05-10  142  			int cnt;
9cb4cd7060790d John Garry    2022-05-10  143  =

9cb4cd7060790d John Garry    2022-05-10  144  			if (index =3D=3D 0) {
9cb4cd7060790d John Garry    2022-05-10  145  				cnt =3D sb->map_nr_per_no=
de +
9cb4cd7060790d John Garry    2022-05-10  146  					(sb->map_nr % sb->map_nr=
_per_node);
9cb4cd7060790d John Garry    2022-05-10  147  			} else {
9cb4cd7060790d John Garry    2022-05-10  148  				cnt =3D sb->map_nr_per_no=
de;
c548e62bcf6adc Ming Lei      2021-01-22  149  			}
88459642cba452 Omar Sandoval 2016-09-17  150  =

9cb4cd7060790d John Garry    2022-05-10  151  			map =3D kvzalloc_node(cnt =
* sizeof(**sb->map), flags, nid);
829ed3bea2e697 John Garry    2022-05-10  152  			if (!map)
9cb4cd7060790d John Garry    2022-05-10  153  				goto err_map_numa;
9cb4cd7060790d John Garry    2022-05-10  154  			nid++;
9cb4cd7060790d John Garry    2022-05-10  155  		}
829ed3bea2e697 John Garry    2022-05-10  156  =

829ed3bea2e697 John Garry    2022-05-10  157  		_map =3D &sb->map[index];
829ed3bea2e697 John Garry    2022-05-10  158  		*_map =3D map;
829ed3bea2e697 John Garry    2022-05-10  159  	}
829ed3bea2e697 John Garry    2022-05-10  160  =

88459642cba452 Omar Sandoval 2016-09-17  161  	return 0;
9cb4cd7060790d John Garry    2022-05-10  162  err_map_numa:
9cb4cd7060790d John Garry    2022-05-10  163  	for (index =3D 0; index < sb=
->map_nr; index++, map++) {
9cb4cd7060790d John Garry    2022-05-10  164  		if ((index % sb->map_nr_per=
_node) =3D=3D 0) {
9cb4cd7060790d John Garry    2022-05-10  165  			kfree(map);
9cb4cd7060790d John Garry    2022-05-10  166  		}
9cb4cd7060790d John Garry    2022-05-10  167  	}
9cb4cd7060790d John Garry    2022-05-10  168  err_map:
9cb4cd7060790d John Garry    2022-05-10  169  	free_percpu(sb->alloc_hint);
9cb4cd7060790d John Garry    2022-05-10  170  =

9cb4cd7060790d John Garry    2022-05-10  171  	return -ENOMEM;
88459642cba452 Omar Sandoval 2016-09-17  172  }
88459642cba452 Omar Sandoval 2016-09-17  173  EXPORT_SYMBOL_GPL(sbitmap_ini=
t_node);
88459642cba452 Omar Sandoval 2016-09-17  174  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4669250935639819823==--

