Content-Type: multipart/mixed; boundary="===============0436547865240211891=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v11 5/8] cgroup/cpuset: Add a new isolated cpus.partition type
Date: Sat, 14 May 2022 14:58:38 +0800
Message-ID: <202205141448.IsSkb0uH-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0436547865240211891==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220510153413.400020-6-longman@redhat.com>
References: <20220510153413.400020-6-longman@redhat.com>
TO: Waiman Long <longman@redhat.com>
TO: Tejun Heo <tj@kernel.org>
TO: Zefan Li <lizefan.x@bytedance.com>
TO: Johannes Weiner <hannes@cmpxchg.org>
TO: Jonathan Corbet <corbet@lwn.net>
TO: Shuah Khan <skhan@linuxfoundation.org>
CC: cgroups(a)vger.kernel.org
CC: linux-kernel(a)vger.kernel.org
CC: linux-doc(a)vger.kernel.org
CC: linux-kselftest(a)vger.kernel.org
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Roman Gushchin <guro@fb.com>
CC: Phil Auld <pauld@redhat.com>
CC: Peter Zijlstra <peterz@infradead.org>
CC: Juri Lelli <juri.lelli@redhat.com>
CC: Frederic Weisbecker <frederic@kernel.org>
CC: Marcelo Tosatti <mtosatti@redhat.com>
CC: "Michal Koutn=C3=BD" <mkoutny@suse.com>
CC: Waiman Long <longman@redhat.com>

Hi Waiman,

I love your patch! Perhaps something to improve:

[auto build test WARNING on tj-cgroup/for-next]
[also build test WARNING on shuah-kselftest/next v5.18-rc6 next-20220513]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Waiman-Long/cgroup-c=
puset-cpu-partition-code-enhancements/20220510-233826
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tj/cgroup.git for-n=
ext
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: riscv-randconfig-c006-20220510 (https://download.01.org/0day-ci/arc=
hive/20220514/202205141448.IsSkb0uH-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 18dd12=
3c56754edf62c7042dcf23185c3727610f)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/ac471e6da8854bfc2a3=
c63e8c1bd36c7bf837550
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Waiman-Long/cgroup-cpuset-cpu-part=
ition-code-enhancements/20220510-233826
        git checkout ac471e6da8854bfc2a3c63e8c1bd36c7bf837550
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           return sprintf(page, "%u\n", bi->tag_size);
                  ^~~~~~~
   block/blk-integrity.c:258:9: note: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11
           return sprintf(page, "%u\n", bi->tag_size);
                  ^~~~~~~
   block/blk-integrity.c:263:9: warning: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(page, "%u\n",
                  ^~~~~~~
   block/blk-integrity.c:263:9: note: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11
           return sprintf(page, "%u\n",
                  ^~~~~~~
   block/blk-integrity.c:283:9: warning: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(page, "%d\n", (bi->flags & BLK_INTEGRITY_VERIFY) =
!=3D 0);
                  ^~~~~~~
   block/blk-integrity.c:283:9: note: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11
           return sprintf(page, "%d\n", (bi->flags & BLK_INTEGRITY_VERIFY) =
!=3D 0);
                  ^~~~~~~
   block/blk-integrity.c:302:9: warning: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(page, "%d\n", (bi->flags & BLK_INTEGRITY_GENERATE=
) !=3D 0);
                  ^~~~~~~
   block/blk-integrity.c:302:9: note: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11
           return sprintf(page, "%d\n", (bi->flags & BLK_INTEGRITY_GENERATE=
) !=3D 0);
                  ^~~~~~~
   block/blk-integrity.c:307:9: warning: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(page, "%u\n",
                  ^~~~~~~
   block/blk-integrity.c:307:9: note: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11
           return sprintf(page, "%u\n",
                  ^~~~~~~
   block/blk-integrity.c:437:2: warning: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(bi, 0, sizeof(*bi));
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
   block/blk-integrity.c:437:2: note: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11
           memset(bi, 0, sizeof(*bi));
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
   Suppressed 55 warnings (55 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   57 warnings generated.
   include/linux/bitmap.h:252:2: warning: Null pointer passed as 2nd argume=
nt to memory copy function [clang-analyzer-unix.cstring.NullArg]
           memcpy(dst, src, len);
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^
   kernel/cgroup/cpuset.c:3240:6: note: Left side of '&&' is true
           if (cpumask_empty(new_cpus) && !is_partition_valid(cs))
               ^
   kernel/cgroup/cpuset.c:3240:2: note: Taking true branch
           if (cpumask_empty(new_cpus) && !is_partition_valid(cs))
           ^
   kernel/cgroup/cpuset.c:3241:3: note: Calling 'cpumask_copy'
                   cpumask_copy(new_cpus, parent_cs(cs)->effective_cpus);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cpumask.h:612:34: note: Passing null pointer value via 2nd=
 parameter 'src'
           bitmap_copy(cpumask_bits(dstp), cpumask_bits(srcp), nr_cpumask_b=
its);
                                           ^
   include/linux/cpumask.h:26:29: note: expanded from macro 'cpumask_bits'
   #define cpumask_bits(maskp) ((maskp)->bits)
                               ^~~~~~~~~~~~~~~
   include/linux/cpumask.h:612:2: note: Calling 'bitmap_copy'
           bitmap_copy(cpumask_bits(dstp), cpumask_bits(srcp), nr_cpumask_b=
its);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   include/linux/bitmap.h:252:2: note: Null pointer passed as 2nd argument =
to memory copy function
           memcpy(dst, src, len);
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^                       ~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^                    ~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^
>> kernel/cgroup/cpuset.c:2176:3: warning: Value stored to 'sched_domain_re=
built' is never read [clang-analyzer-deadcode.DeadStores]
                   sched_domain_rebuilt =3D true;
                   ^                      ~~~~
   kernel/cgroup/cpuset.c:2176:3: note: Value stored to 'sched_domain_rebui=
lt' is never read
                   sched_domain_rebuilt =3D true;
                   ^                      ~~~~
   Suppressed 55 warnings (55 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   55 warnings generated.
   Suppressed 55 warnings (55 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   56 warnings generated.
   fs/reiserfs/tail_conversion.c:157:3: warning: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(kaddr + pgoff, 0, blk_size - total_tail);
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
   fs/reiserfs/tail_conversion.c:157:3: note: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11
                   memset(kaddr + pgoff, 0, blk_size - total_tail);
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
   Suppressed 55 warnings (55 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   79 warnings generated.
   fs/reiserfs/journal.c:116:2: warning: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(journal->j_hash_table, 0,
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
   fs/reiserfs/journal.c:116:2: note: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11
           memset(journal->j_hash_table, 0,
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
   fs/reiserfs/journal.c:167:3: warning: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(bn->data, 0, sb->s_blocksize);
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
   fs/reiserfs/journal.c:167:3: note: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11
                   memset(bn->data, 0, sb->s_blocksize);
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
   fs/reiserfs/journal.c:264:3: warning: Use of memory after it is freed [c=
lang-analyzer-unix.Malloc]
                   list_del(next);
                   ^
   fs/reiserfs/journal.c:1978:9: note: Calling 'do_journal_release'
           return do_journal_release(th, sb, 1);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/reiserfs/journal.c:1914:7: note: 'error' is 1
           if (!error && !sb_rdonly(sb)) {
                ^~~~~
   fs/reiserfs/journal.c:1914:13: note: Left side of '&&' is false
           if (!error && !sb_rdonly(sb)) {

vim +/sched_domain_rebuilt +2176 kernel/cgroup/cpuset.c

^1da177e4c3f41 kernel/cpuset.c        Linus Torvalds 2005-04-16  2110  =

522c26348b1fc7 kernel/cgroup/cpuset.c Waiman Long    2022-05-10  2111  /**
f9da322e864e5c kernel/cgroup/cpuset.c Tom Rix        2022-03-05  2112   * u=
pdate_prstate - update partition_root_state
522c26348b1fc7 kernel/cgroup/cpuset.c Waiman Long    2022-05-10  2113   * @=
cs: the cpuset to update
522c26348b1fc7 kernel/cgroup/cpuset.c Waiman Long    2022-05-10  2114   * @=
new_prs: new partition root state
522c26348b1fc7 kernel/cgroup/cpuset.c Waiman Long    2022-05-10  2115   * R=
eturn: 0 if successful, < 0 if error
ee8dde0cd2ce78 kernel/cgroup/cpuset.c Waiman Long    2018-11-08  2116   *
b94f9ac79a7395 kernel/cgroup/cpuset.c Waiman Long    2021-09-09  2117   * C=
all with cpuset_rwsem held.
ee8dde0cd2ce78 kernel/cgroup/cpuset.c Waiman Long    2018-11-08  2118   */
0f3adb8a1e5f36 kernel/cgroup/cpuset.c Waiman Long    2021-07-20  2119  stat=
ic int update_prstate(struct cpuset *cs, int new_prs)
ee8dde0cd2ce78 kernel/cgroup/cpuset.c Waiman Long    2018-11-08  2120  {
176c62d4270c63 kernel/cgroup/cpuset.c Waiman Long    2022-05-10  2121  	int=
 err =3D 0, old_prs =3D cs->partition_root_state;
ac471e6da8854b kernel/cgroup/cpuset.c Waiman Long    2022-05-10  2122  	boo=
l sched_domain_rebuilt =3D false;
ee8dde0cd2ce78 kernel/cgroup/cpuset.c Waiman Long    2018-11-08  2123  	str=
uct cpuset *parent =3D parent_cs(cs);
0f3adb8a1e5f36 kernel/cgroup/cpuset.c Waiman Long    2021-07-20  2124  	str=
uct tmpmasks tmpmask;
ee8dde0cd2ce78 kernel/cgroup/cpuset.c Waiman Long    2018-11-08  2125  =

6ba34d3c73674e kernel/cgroup/cpuset.c Waiman Long    2021-07-20  2126  	if =
(old_prs =3D=3D new_prs)
ee8dde0cd2ce78 kernel/cgroup/cpuset.c Waiman Long    2018-11-08  2127  		re=
turn 0;
ee8dde0cd2ce78 kernel/cgroup/cpuset.c Waiman Long    2018-11-08  2128  =

ee8dde0cd2ce78 kernel/cgroup/cpuset.c Waiman Long    2018-11-08  2129  	/*
176c62d4270c63 kernel/cgroup/cpuset.c Waiman Long    2022-05-10  2130  	 * =
For a previously invalid partition root, leave it at being
176c62d4270c63 kernel/cgroup/cpuset.c Waiman Long    2022-05-10  2131  	 * =
invalid if new_prs is not "member".
ee8dde0cd2ce78 kernel/cgroup/cpuset.c Waiman Long    2018-11-08  2132  	 */
ac471e6da8854b kernel/cgroup/cpuset.c Waiman Long    2022-05-10  2133  	if =
(new_prs && is_prs_invalid(old_prs)) {
ac471e6da8854b kernel/cgroup/cpuset.c Waiman Long    2022-05-10  2134  		cs=
->partition_root_state =3D -new_prs;
176c62d4270c63 kernel/cgroup/cpuset.c Waiman Long    2022-05-10  2135  		re=
turn 0;
ac471e6da8854b kernel/cgroup/cpuset.c Waiman Long    2022-05-10  2136  	}
ee8dde0cd2ce78 kernel/cgroup/cpuset.c Waiman Long    2018-11-08  2137  =

0f3adb8a1e5f36 kernel/cgroup/cpuset.c Waiman Long    2021-07-20  2138  	if =
(alloc_cpumasks(NULL, &tmpmask))
ee8dde0cd2ce78 kernel/cgroup/cpuset.c Waiman Long    2018-11-08  2139  		re=
turn -ENOMEM;
ee8dde0cd2ce78 kernel/cgroup/cpuset.c Waiman Long    2018-11-08  2140  =

6ba34d3c73674e kernel/cgroup/cpuset.c Waiman Long    2021-07-20  2141  	if =
(!old_prs) {
ee8dde0cd2ce78 kernel/cgroup/cpuset.c Waiman Long    2018-11-08  2142  		/*
ee8dde0cd2ce78 kernel/cgroup/cpuset.c Waiman Long    2018-11-08  2143  		 *=
 Turning on partition root requires setting the
ee8dde0cd2ce78 kernel/cgroup/cpuset.c Waiman Long    2018-11-08  2144  		 *=
 CS_CPU_EXCLUSIVE bit implicitly as well and cpus_allowed
176c62d4270c63 kernel/cgroup/cpuset.c Waiman Long    2022-05-10  2145  		 *=
 cannot be empty.
ee8dde0cd2ce78 kernel/cgroup/cpuset.c Waiman Long    2018-11-08  2146  		 */
176c62d4270c63 kernel/cgroup/cpuset.c Waiman Long    2022-05-10  2147  		if=
 (cpumask_empty(cs->cpus_allowed)) {
176c62d4270c63 kernel/cgroup/cpuset.c Waiman Long    2022-05-10  2148  			e=
rr =3D 1;
ee8dde0cd2ce78 kernel/cgroup/cpuset.c Waiman Long    2018-11-08  2149  			g=
oto out;
176c62d4270c63 kernel/cgroup/cpuset.c Waiman Long    2022-05-10  2150  		}
ee8dde0cd2ce78 kernel/cgroup/cpuset.c Waiman Long    2018-11-08  2151  =

ee8dde0cd2ce78 kernel/cgroup/cpuset.c Waiman Long    2018-11-08  2152  		er=
r =3D update_flag(CS_CPU_EXCLUSIVE, cs, 1);
ee8dde0cd2ce78 kernel/cgroup/cpuset.c Waiman Long    2018-11-08  2153  		if=
 (err)
ee8dde0cd2ce78 kernel/cgroup/cpuset.c Waiman Long    2018-11-08  2154  			g=
oto out;
ee8dde0cd2ce78 kernel/cgroup/cpuset.c Waiman Long    2018-11-08  2155  =

ee8dde0cd2ce78 kernel/cgroup/cpuset.c Waiman Long    2018-11-08  2156  		er=
r =3D update_parent_subparts_cpumask(cs, partcmd_enable,
0f3adb8a1e5f36 kernel/cgroup/cpuset.c Waiman Long    2021-07-20  2157  				=
		     NULL, &tmpmask);
ee8dde0cd2ce78 kernel/cgroup/cpuset.c Waiman Long    2018-11-08  2158  		if=
 (err) {
ee8dde0cd2ce78 kernel/cgroup/cpuset.c Waiman Long    2018-11-08  2159  			u=
pdate_flag(CS_CPU_EXCLUSIVE, cs, 0);
ee8dde0cd2ce78 kernel/cgroup/cpuset.c Waiman Long    2018-11-08  2160  			g=
oto out;
ee8dde0cd2ce78 kernel/cgroup/cpuset.c Waiman Long    2018-11-08  2161  		}
ac471e6da8854b kernel/cgroup/cpuset.c Waiman Long    2022-05-10  2162  =

ac471e6da8854b kernel/cgroup/cpuset.c Waiman Long    2022-05-10  2163  		if=
 (new_prs =3D=3D PRS_ISOLATED) {
ac471e6da8854b kernel/cgroup/cpuset.c Waiman Long    2022-05-10  2164  			/*
ac471e6da8854b kernel/cgroup/cpuset.c Waiman Long    2022-05-10  2165  			 =
* Disable the load balance flag should not return an
ac471e6da8854b kernel/cgroup/cpuset.c Waiman Long    2022-05-10  2166  			 =
* error unless the system is running out of memory.
ac471e6da8854b kernel/cgroup/cpuset.c Waiman Long    2022-05-10  2167  			 =
*/
ac471e6da8854b kernel/cgroup/cpuset.c Waiman Long    2022-05-10  2168  			u=
pdate_flag(CS_SCHED_LOAD_BALANCE, cs, 0);
ac471e6da8854b kernel/cgroup/cpuset.c Waiman Long    2022-05-10  2169  			s=
ched_domain_rebuilt =3D true;
ac471e6da8854b kernel/cgroup/cpuset.c Waiman Long    2022-05-10  2170  		}
ac471e6da8854b kernel/cgroup/cpuset.c Waiman Long    2022-05-10  2171  	} e=
lse if (old_prs && new_prs) {
ac471e6da8854b kernel/cgroup/cpuset.c Waiman Long    2022-05-10  2172  		/*
ac471e6da8854b kernel/cgroup/cpuset.c Waiman Long    2022-05-10  2173  		 *=
 A change in load balance state only, no change in cpumasks.
ac471e6da8854b kernel/cgroup/cpuset.c Waiman Long    2022-05-10  2174  		 */
ac471e6da8854b kernel/cgroup/cpuset.c Waiman Long    2022-05-10  2175  		up=
date_flag(CS_SCHED_LOAD_BALANCE, cs, (new_prs !=3D PRS_ISOLATED));
ac471e6da8854b kernel/cgroup/cpuset.c Waiman Long    2022-05-10 @2176  		sc=
hed_domain_rebuilt =3D true;
ac471e6da8854b kernel/cgroup/cpuset.c Waiman Long    2022-05-10  2177  		go=
to out;	/* Sched domain is rebuilt in update_flag() */
ee8dde0cd2ce78 kernel/cgroup/cpuset.c Waiman Long    2018-11-08  2178  	} e=
lse {
3881b86128d0be kernel/cgroup/cpuset.c Waiman Long    2018-11-08  2179  		/*
176c62d4270c63 kernel/cgroup/cpuset.c Waiman Long    2022-05-10  2180  		 *=
 Switching back to member is always allowed even if it
176c62d4270c63 kernel/cgroup/cpuset.c Waiman Long    2022-05-10  2181  		 *=
 disables child partitions.
3881b86128d0be kernel/cgroup/cpuset.c Waiman Long    2018-11-08  2182  		 */
176c62d4270c63 kernel/cgroup/cpuset.c Waiman Long    2022-05-10  2183  		up=
date_parent_subparts_cpumask(cs, partcmd_disable, NULL,
176c62d4270c63 kernel/cgroup/cpuset.c Waiman Long    2022-05-10  2184  				=
	       &tmpmask);
3881b86128d0be kernel/cgroup/cpuset.c Waiman Long    2018-11-08  2185  =

176c62d4270c63 kernel/cgroup/cpuset.c Waiman Long    2022-05-10  2186  		/*
176c62d4270c63 kernel/cgroup/cpuset.c Waiman Long    2022-05-10  2187  		 *=
 If there are child partitions, they will all become invalid.
176c62d4270c63 kernel/cgroup/cpuset.c Waiman Long    2022-05-10  2188  		 */
176c62d4270c63 kernel/cgroup/cpuset.c Waiman Long    2022-05-10  2189  		if=
 (unlikely(cs->nr_subparts_cpus)) {
176c62d4270c63 kernel/cgroup/cpuset.c Waiman Long    2022-05-10  2190  			s=
pin_lock_irq(&callback_lock);
176c62d4270c63 kernel/cgroup/cpuset.c Waiman Long    2022-05-10  2191  			c=
s->nr_subparts_cpus =3D 0;
176c62d4270c63 kernel/cgroup/cpuset.c Waiman Long    2022-05-10  2192  			c=
pumask_clear(cs->subparts_cpus);
176c62d4270c63 kernel/cgroup/cpuset.c Waiman Long    2022-05-10  2193  			c=
ompute_effective_cpumask(cs->effective_cpus, cs, parent);
176c62d4270c63 kernel/cgroup/cpuset.c Waiman Long    2022-05-10  2194  			s=
pin_unlock_irq(&callback_lock);
176c62d4270c63 kernel/cgroup/cpuset.c Waiman Long    2022-05-10  2195  		}
ee8dde0cd2ce78 kernel/cgroup/cpuset.c Waiman Long    2018-11-08  2196  =

ee8dde0cd2ce78 kernel/cgroup/cpuset.c Waiman Long    2018-11-08  2197  		/*=
 Turning off CS_CPU_EXCLUSIVE will not return error */
ee8dde0cd2ce78 kernel/cgroup/cpuset.c Waiman Long    2018-11-08  2198  		up=
date_flag(CS_CPU_EXCLUSIVE, cs, 0);
ac471e6da8854b kernel/cgroup/cpuset.c Waiman Long    2022-05-10  2199  =

ac471e6da8854b kernel/cgroup/cpuset.c Waiman Long    2022-05-10  2200  		if=
 (!is_sched_load_balance(cs)) {
ac471e6da8854b kernel/cgroup/cpuset.c Waiman Long    2022-05-10  2201  			/=
* Make sure load balance is on */
ac471e6da8854b kernel/cgroup/cpuset.c Waiman Long    2022-05-10  2202  			u=
pdate_flag(CS_SCHED_LOAD_BALANCE, cs, 1);
ac471e6da8854b kernel/cgroup/cpuset.c Waiman Long    2022-05-10  2203  			s=
ched_domain_rebuilt =3D true;
ac471e6da8854b kernel/cgroup/cpuset.c Waiman Long    2022-05-10  2204  		}
ee8dde0cd2ce78 kernel/cgroup/cpuset.c Waiman Long    2018-11-08  2205  	}
ee8dde0cd2ce78 kernel/cgroup/cpuset.c Waiman Long    2018-11-08  2206  =

ee8dde0cd2ce78 kernel/cgroup/cpuset.c Waiman Long    2018-11-08  2207  	upd=
ate_tasks_cpumask(parent);
ee8dde0cd2ce78 kernel/cgroup/cpuset.c Waiman Long    2018-11-08  2208  =

4716909cc5c566 kernel/cgroup/cpuset.c Waiman Long    2018-11-08  2209  	if =
(parent->child_ecpus_count)
0f3adb8a1e5f36 kernel/cgroup/cpuset.c Waiman Long    2021-07-20  2210  		up=
date_sibling_cpumasks(parent, cs, &tmpmask);
4716909cc5c566 kernel/cgroup/cpuset.c Waiman Long    2018-11-08  2211  =

ac471e6da8854b kernel/cgroup/cpuset.c Waiman Long    2022-05-10  2212  	if =
(!sched_domain_rebuilt)
ee8dde0cd2ce78 kernel/cgroup/cpuset.c Waiman Long    2018-11-08  2213  		re=
build_sched_domains_locked();
ee8dde0cd2ce78 kernel/cgroup/cpuset.c Waiman Long    2018-11-08  2214  out:
176c62d4270c63 kernel/cgroup/cpuset.c Waiman Long    2022-05-10  2215  	/*
176c62d4270c63 kernel/cgroup/cpuset.c Waiman Long    2022-05-10  2216  	 * =
Make partition invalid if an error happen
176c62d4270c63 kernel/cgroup/cpuset.c Waiman Long    2022-05-10  2217  	 */
176c62d4270c63 kernel/cgroup/cpuset.c Waiman Long    2022-05-10  2218  	if =
(err)
ac471e6da8854b kernel/cgroup/cpuset.c Waiman Long    2022-05-10  2219  		ne=
w_prs =3D -new_prs;
6ba34d3c73674e kernel/cgroup/cpuset.c Waiman Long    2021-07-20  2220  	spi=
n_lock_irq(&callback_lock);
6ba34d3c73674e kernel/cgroup/cpuset.c Waiman Long    2021-07-20  2221  	cs-=
>partition_root_state =3D new_prs;
6ba34d3c73674e kernel/cgroup/cpuset.c Waiman Long    2021-07-20  2222  	spi=
n_unlock_irq(&callback_lock);
176c62d4270c63 kernel/cgroup/cpuset.c Waiman Long    2022-05-10  2223  	/*
176c62d4270c63 kernel/cgroup/cpuset.c Waiman Long    2022-05-10  2224  	 * =
Update child cpusets, if present.
176c62d4270c63 kernel/cgroup/cpuset.c Waiman Long    2022-05-10  2225  	 * =
Force update if switching back to member.
176c62d4270c63 kernel/cgroup/cpuset.c Waiman Long    2022-05-10  2226  	 */
176c62d4270c63 kernel/cgroup/cpuset.c Waiman Long    2022-05-10  2227  	if =
(!list_empty(&cs->css.children))
176c62d4270c63 kernel/cgroup/cpuset.c Waiman Long    2022-05-10  2228  		up=
date_cpumasks_hier(cs, &tmpmask, !new_prs);
6ba34d3c73674e kernel/cgroup/cpuset.c Waiman Long    2021-07-20  2229  =

176c62d4270c63 kernel/cgroup/cpuset.c Waiman Long    2022-05-10  2230  	not=
ify_partition_change(cs, old_prs);
0f3adb8a1e5f36 kernel/cgroup/cpuset.c Waiman Long    2021-07-20  2231  	fre=
e_cpumasks(NULL, &tmpmask);
176c62d4270c63 kernel/cgroup/cpuset.c Waiman Long    2022-05-10  2232  	ret=
urn 0;
^1da177e4c3f41 kernel/cpuset.c        Linus Torvalds 2005-04-16  2233  }
^1da177e4c3f41 kernel/cpuset.c        Linus Torvalds 2005-04-16  2234  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0436547865240211891==--

