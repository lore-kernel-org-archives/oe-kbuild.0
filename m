Content-Type: multipart/mixed; boundary="===============6348593337105256869=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2] sched/core: add forced idle accounting for cgroups
Date: Sun, 22 May 2022 14:35:18 +0800
Message-ID: <202205221414.PmwthuWY-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6348593337105256869==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220520235138.3140590-1-joshdon@google.com>
References: <20220520235138.3140590-1-joshdon@google.com>
TO: Josh Don <joshdon@google.com>
TO: Ingo Molnar <mingo@redhat.com>
TO: Peter Zijlstra <peterz@infradead.org>
TO: Juri Lelli <juri.lelli@redhat.com>
TO: Vincent Guittot <vincent.guittot@linaro.org>
TO: Tejun Heo <tj@kernel.org>
CC: Dietmar Eggemann <dietmar.eggemann@arm.com>
CC: Steven Rostedt <rostedt@goodmis.org>
CC: Ben Segall <bsegall@google.com>
CC: Mel Gorman <mgorman@suse.de>
CC: Daniel Bristot de Oliveira <bristot@redhat.com>
CC: Valentin Schneider <vschneid@redhat.com>
CC: linux-kernel(a)vger.kernel.org
CC: Cruz Zhao <CruzZhao@linux.alibaba.com>
CC: Josh Don <joshdon@google.com>

Hi Josh,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on tj-cgroup/for-next]
[also build test WARNING on tip/sched/core tip/master v5.18-rc7 next-202205=
20]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Josh-Don/sched-core-=
add-forced-idle-accounting-for-cgroups/20220521-075311
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tj/cgroup.git for-n=
ext
:::::: branch date: 31 hours ago
:::::: commit date: 31 hours ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20522/202205221414.PmwthuWY-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project b36976=
2beb70dfef22c7e793aed79b94d7dc0757)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/0575a42c9f10cda618b=
09b949cc42fe97abea479
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Josh-Don/sched-core-add-forced-idl=
e-accounting-for-cgroups/20220521-075311
        git checkout 0575a42c9f10cda618b09b949cc42fe97abea479
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   fs/ntfs3/inode.c:1394:3: note: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11
                   memcpy(Add2Ptr(attr, SIZEOF_RESIDENT), I30_NAME,
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
   fs/ntfs3/inode.c:1398:3: warning: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(root, dir_root, offsetof(struct INDEX_ROOT, ihdr)=
);
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
   fs/ntfs3/inode.c:1398:3: note: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11
                   memcpy(root, dir_root, offsetof(struct INDEX_ROOT, ihdr)=
);
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
   fs/ntfs3/inode.c:1526:4: warning: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(Add2Ptr(attr, SIZEOF_RESIDENT), rp, nsize=
);
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
   fs/ntfs3/inode.c:1526:4: note: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11
                           memcpy(Add2Ptr(attr, SIZEOF_RESIDENT), rp, nsize=
);
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
   fs/ntfs3/inode.c:1862:3: warning: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(buffer, "OneDrive", err);
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
   fs/ntfs3/inode.c:1862:3: note: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11
                   memcpy(buffer, "OneDrive", err);
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
   Suppressed 47 warnings (47 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   38 warnings generated.
>> kernel/cgroup/rstat.c:455:24: warning: The left expression of the compou=
nd assignment is an uninitialized value. The computed value will also be ga=
rbage [clang-analyzer-core.uninitialized.Assign]
                   bstat->forceidle_sum +=3D cpustat[CPUTIME_FORCEIDLE];
                                        ^
   kernel/cgroup/rstat.c:467:2: note: Taking false branch
           if (cgroup_parent(cgrp)) {
           ^
   kernel/cgroup/rstat.c:477:3: note: Calling 'root_cgroup_cputime'
                   root_cgroup_cputime(&bstat);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/cgroup/rstat.c:433:2: note: Assuming 'i' is < 'nr_cpu_ids'
           for_each_possible_cpu(i) {
           ^
   include/linux/cpumask.h:814:36: note: expanded from macro 'for_each_poss=
ible_cpu'
   #define for_each_possible_cpu(cpu) for_each_cpu((cpu), cpu_possible_mask)
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cpumask.h:278:3: note: expanded from macro 'for_each_cpu'
                   (cpu) < nr_cpu_ids;)
                   ^~~~~~~~~~~~~~~~~~
   kernel/cgroup/rstat.c:433:2: note: Loop condition is true.  Entering loo=
p body
           for_each_possible_cpu(i) {
           ^
   include/linux/cpumask.h:814:36: note: expanded from macro 'for_each_poss=
ible_cpu'
   #define for_each_possible_cpu(cpu) for_each_cpu((cpu), cpu_possible_mask)
                                      ^
   include/linux/cpumask.h:276:2: note: expanded from macro 'for_each_cpu'
           for ((cpu) =3D -1;                                \
           ^
   kernel/cgroup/rstat.c:455:24: note: The left expression of the compound =
assignment is an uninitialized value. The computed value will also be garba=
ge
                   bstat->forceidle_sum +=3D cpustat[CPUTIME_FORCEIDLE];
                   ~~~~~~~~~~~~~~~~~~~~ ^
>> kernel/cgroup/rstat.c:482:18: warning: Assigned value is garbage or unde=
fined [clang-analyzer-core.uninitialized.Assign]
                   forceidle_time =3D bstat.forceidle_sum;
                                  ^ ~~~~~~~~~~~~~~~~~~~
   kernel/cgroup/rstat.c:467:2: note: Taking false branch
           if (cgroup_parent(cgrp)) {
           ^
   kernel/cgroup/rstat.c:477:3: note: Calling 'root_cgroup_cputime'
                   root_cgroup_cputime(&bstat);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/cgroup/rstat.c:433:2: note: Assuming 'i' is >=3D 'nr_cpu_ids'
           for_each_possible_cpu(i) {
           ^
   include/linux/cpumask.h:814:36: note: expanded from macro 'for_each_poss=
ible_cpu'
   #define for_each_possible_cpu(cpu) for_each_cpu((cpu), cpu_possible_mask)
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cpumask.h:278:3: note: expanded from macro 'for_each_cpu'
                   (cpu) < nr_cpu_ids;)
                   ^~~~~~~~~~~~~~~~~~
   kernel/cgroup/rstat.c:433:2: note: Loop condition is false. Execution co=
ntinues on line 433
           for_each_possible_cpu(i) {
           ^
   include/linux/cpumask.h:814:36: note: expanded from macro 'for_each_poss=
ible_cpu'
   #define for_each_possible_cpu(cpu) for_each_cpu((cpu), cpu_possible_mask)
                                      ^
   include/linux/cpumask.h:276:2: note: expanded from macro 'for_each_cpu'
           for ((cpu) =3D -1;                                \
           ^
   kernel/cgroup/rstat.c:458:1: note: Returning without writing to 'bstat->=
forceidle_sum'
   }
   ^
   kernel/cgroup/rstat.c:477:3: note: Returning from 'root_cgroup_cputime'
                   root_cgroup_cputime(&bstat);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/cgroup/rstat.c:482:18: note: Assigned value is garbage or undefin=
ed
                   forceidle_time =3D bstat.forceidle_sum;
                                  ^ ~~~~~~~~~~~~~~~~~~~
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   25 warnings generated.
   Suppressed 25 warnings (25 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   25 warnings generated.
   Suppressed 25 warnings (25 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   25 warnings generated.
   Suppressed 25 warnings (25 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   26 warnings generated.
   Suppressed 26 warnings (26 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   47 warnings generated.
   drivers/iio/adc/ad7606.c:660:9: warning: Called function pointer is null=
 (null dereference) [clang-analyzer-core.CallAndMessage]
                   ret =3D st->bops->sw_mode_config(indio_dev);
                         ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/ad7606.c:575:6: note: Assuming 'indio_dev' is non-null
           if (!indio_dev)
               ^~~~~~~~~~
   drivers/iio/adc/ad7606.c:575:2: note: Taking false branch
           if (!indio_dev)
           ^
   drivers/iio/adc/ad7606.c:582:2: note: Loop condition is false.  Exiting =
loop
           mutex_init(&st->lock);
           ^
   include/linux/mutex.h:101:32: note: expanded from macro 'mutex_init'
   #define mutex_init(mutex)                                               \
                                                                           ^
   drivers/iio/adc/ad7606.c:592:2: note: Taking false branch
           if (IS_ERR(st->reg))
           ^
   drivers/iio/adc/ad7606.c:596:6: note: Assuming 'ret' is 0
           if (ret) {
               ^~~
   drivers/iio/adc/ad7606.c:596:2: note: Taking false branch
           if (ret) {
           ^
   drivers/iio/adc/ad7606.c:601:8: note: Calling 'devm_add_action_or_reset'
           ret =3D devm_add_action_or_reset(dev, ad7606_regulator_disable, =
st);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:255:6: note: Assuming 'ret' is 0, which participa=
tes in a condition later
           if (ret)
               ^~~
   include/linux/device.h:255:2: note: Taking false branch
           if (ret)
           ^
   include/linux/device.h:258:2: note: Returning zero (loaded from 'ret'), =
which participates in a condition later
           return ret;
           ^~~~~~~~~~
   drivers/iio/adc/ad7606.c:601:8: note: Returning from 'devm_add_action_or=
_reset'
           ret =3D devm_add_action_or_reset(dev, ad7606_regulator_disable, =
st);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/ad7606.c:602:6: note: 'ret' is 0
           if (ret)
               ^~~
   drivers/iio/adc/ad7606.c:602:2: note: Taking false branch
           if (ret)
           ^
   drivers/iio/adc/ad7606.c:607:6: note: Assuming field 'oversampling_num' =
is 0
           if (st->chip_info->oversampling_num) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/ad7606.c:607:2: note: Taking false branch
           if (st->chip_info->oversampling_num) {

vim +455 kernel/cgroup/rstat.c

041cd640b2f3c5 kernel/cgroup/stat.c  Tejun Heo    2017-09-25  418  =

936f2a70f2077f kernel/cgroup/rstat.c Boris Burkov 2020-05-27  419  /*
936f2a70f2077f kernel/cgroup/rstat.c Boris Burkov 2020-05-27  420   * compu=
te the cputime for the root cgroup by getting the per cpu data
936f2a70f2077f kernel/cgroup/rstat.c Boris Burkov 2020-05-27  421   * at a =
global level, then categorizing the fields in a manner consistent
936f2a70f2077f kernel/cgroup/rstat.c Boris Burkov 2020-05-27  422   * with =
how it is done by __cgroup_account_cputime_field for each bit of
936f2a70f2077f kernel/cgroup/rstat.c Boris Burkov 2020-05-27  423   * cpu t=
ime attributed to a cgroup.
936f2a70f2077f kernel/cgroup/rstat.c Boris Burkov 2020-05-27  424   */
0575a42c9f10cd kernel/cgroup/rstat.c Josh Don     2022-05-20  425  static v=
oid root_cgroup_cputime(struct cgroup_base_stat *bstat)
936f2a70f2077f kernel/cgroup/rstat.c Boris Burkov 2020-05-27  426  {
0575a42c9f10cd kernel/cgroup/rstat.c Josh Don     2022-05-20  427  	struct =
task_cputime *cputime =3D &bstat->cputime;
936f2a70f2077f kernel/cgroup/rstat.c Boris Burkov 2020-05-27  428  	int i;
936f2a70f2077f kernel/cgroup/rstat.c Boris Burkov 2020-05-27  429  =

936f2a70f2077f kernel/cgroup/rstat.c Boris Burkov 2020-05-27  430  	cputime=
->stime =3D 0;
936f2a70f2077f kernel/cgroup/rstat.c Boris Burkov 2020-05-27  431  	cputime=
->utime =3D 0;
936f2a70f2077f kernel/cgroup/rstat.c Boris Burkov 2020-05-27  432  	cputime=
->sum_exec_runtime =3D 0;
936f2a70f2077f kernel/cgroup/rstat.c Boris Burkov 2020-05-27  433  	for_eac=
h_possible_cpu(i) {
936f2a70f2077f kernel/cgroup/rstat.c Boris Burkov 2020-05-27  434  		struct=
 kernel_cpustat kcpustat;
936f2a70f2077f kernel/cgroup/rstat.c Boris Burkov 2020-05-27  435  		u64 *c=
pustat =3D kcpustat.cpustat;
936f2a70f2077f kernel/cgroup/rstat.c Boris Burkov 2020-05-27  436  		u64 us=
er =3D 0;
936f2a70f2077f kernel/cgroup/rstat.c Boris Burkov 2020-05-27  437  		u64 sy=
s =3D 0;
936f2a70f2077f kernel/cgroup/rstat.c Boris Burkov 2020-05-27  438  =

936f2a70f2077f kernel/cgroup/rstat.c Boris Burkov 2020-05-27  439  		kcpust=
at_cpu_fetch(&kcpustat, i);
936f2a70f2077f kernel/cgroup/rstat.c Boris Burkov 2020-05-27  440  =

936f2a70f2077f kernel/cgroup/rstat.c Boris Burkov 2020-05-27  441  		user +=
=3D cpustat[CPUTIME_USER];
936f2a70f2077f kernel/cgroup/rstat.c Boris Burkov 2020-05-27  442  		user +=
=3D cpustat[CPUTIME_NICE];
936f2a70f2077f kernel/cgroup/rstat.c Boris Burkov 2020-05-27  443  		cputim=
e->utime +=3D user;
936f2a70f2077f kernel/cgroup/rstat.c Boris Burkov 2020-05-27  444  =

936f2a70f2077f kernel/cgroup/rstat.c Boris Burkov 2020-05-27  445  		sys +=
=3D cpustat[CPUTIME_SYSTEM];
936f2a70f2077f kernel/cgroup/rstat.c Boris Burkov 2020-05-27  446  		sys +=
=3D cpustat[CPUTIME_IRQ];
936f2a70f2077f kernel/cgroup/rstat.c Boris Burkov 2020-05-27  447  		sys +=
=3D cpustat[CPUTIME_SOFTIRQ];
936f2a70f2077f kernel/cgroup/rstat.c Boris Burkov 2020-05-27  448  		cputim=
e->stime +=3D sys;
936f2a70f2077f kernel/cgroup/rstat.c Boris Burkov 2020-05-27  449  =

936f2a70f2077f kernel/cgroup/rstat.c Boris Burkov 2020-05-27  450  		cputim=
e->sum_exec_runtime +=3D user;
936f2a70f2077f kernel/cgroup/rstat.c Boris Burkov 2020-05-27  451  		cputim=
e->sum_exec_runtime +=3D sys;
936f2a70f2077f kernel/cgroup/rstat.c Boris Burkov 2020-05-27  452  		cputim=
e->sum_exec_runtime +=3D cpustat[CPUTIME_STEAL];
0575a42c9f10cd kernel/cgroup/rstat.c Josh Don     2022-05-20  453  =

0575a42c9f10cd kernel/cgroup/rstat.c Josh Don     2022-05-20  454  #ifdef C=
ONFIG_SCHED_CORE
0575a42c9f10cd kernel/cgroup/rstat.c Josh Don     2022-05-20 @455  		bstat-=
>forceidle_sum +=3D cpustat[CPUTIME_FORCEIDLE];
0575a42c9f10cd kernel/cgroup/rstat.c Josh Don     2022-05-20  456  #endif
936f2a70f2077f kernel/cgroup/rstat.c Boris Burkov 2020-05-27  457  	}
936f2a70f2077f kernel/cgroup/rstat.c Boris Burkov 2020-05-27  458  }
936f2a70f2077f kernel/cgroup/rstat.c Boris Burkov 2020-05-27  459  =

d4ff749b5e0f1e kernel/cgroup/rstat.c Tejun Heo    2018-04-26  460  void cgr=
oup_base_stat_cputime_show(struct seq_file *seq)
041cd640b2f3c5 kernel/cgroup/stat.c  Tejun Heo    2017-09-25  461  {
041cd640b2f3c5 kernel/cgroup/stat.c  Tejun Heo    2017-09-25  462  	struct =
cgroup *cgrp =3D seq_css(seq)->cgroup;
041cd640b2f3c5 kernel/cgroup/stat.c  Tejun Heo    2017-09-25  463  	u64 usa=
ge, utime, stime;
0575a42c9f10cd kernel/cgroup/rstat.c Josh Don     2022-05-20  464  	struct =
cgroup_base_stat bstat;
0575a42c9f10cd kernel/cgroup/rstat.c Josh Don     2022-05-20  465  	u64 __m=
aybe_unused forceidle_time;
041cd640b2f3c5 kernel/cgroup/stat.c  Tejun Heo    2017-09-25  466  =

936f2a70f2077f kernel/cgroup/rstat.c Boris Burkov 2020-05-27  467  	if (cgr=
oup_parent(cgrp)) {
6162cef0f741c7 kernel/cgroup/rstat.c Tejun Heo    2018-04-26  468  		cgroup=
_rstat_flush_hold(cgrp);
d4ff749b5e0f1e kernel/cgroup/rstat.c Tejun Heo    2018-04-26  469  		usage =
=3D cgrp->bstat.cputime.sum_exec_runtime;
936f2a70f2077f kernel/cgroup/rstat.c Boris Burkov 2020-05-27  470  		cputim=
e_adjust(&cgrp->bstat.cputime, &cgrp->prev_cputime,
936f2a70f2077f kernel/cgroup/rstat.c Boris Burkov 2020-05-27  471  			     =
  &utime, &stime);
0575a42c9f10cd kernel/cgroup/rstat.c Josh Don     2022-05-20  472  #ifdef C=
ONFIG_SCHED_CORE
0575a42c9f10cd kernel/cgroup/rstat.c Josh Don     2022-05-20  473  		forcei=
dle_time =3D cgrp->bstat.forceidle_sum;
0575a42c9f10cd kernel/cgroup/rstat.c Josh Don     2022-05-20  474  #endif
6162cef0f741c7 kernel/cgroup/rstat.c Tejun Heo    2018-04-26  475  		cgroup=
_rstat_flush_release();
936f2a70f2077f kernel/cgroup/rstat.c Boris Burkov 2020-05-27  476  	} else {
0575a42c9f10cd kernel/cgroup/rstat.c Josh Don     2022-05-20  477  		root_c=
group_cputime(&bstat);
0575a42c9f10cd kernel/cgroup/rstat.c Josh Don     2022-05-20  478  		usage =
=3D bstat.cputime.sum_exec_runtime;
0575a42c9f10cd kernel/cgroup/rstat.c Josh Don     2022-05-20  479  		utime =
=3D bstat.cputime.utime;
0575a42c9f10cd kernel/cgroup/rstat.c Josh Don     2022-05-20  480  		stime =
=3D bstat.cputime.stime;
0575a42c9f10cd kernel/cgroup/rstat.c Josh Don     2022-05-20  481  #ifdef C=
ONFIG_SCHED_CORE
0575a42c9f10cd kernel/cgroup/rstat.c Josh Don     2022-05-20 @482  		forcei=
dle_time =3D bstat.forceidle_sum;
0575a42c9f10cd kernel/cgroup/rstat.c Josh Don     2022-05-20  483  #endif
936f2a70f2077f kernel/cgroup/rstat.c Boris Burkov 2020-05-27  484  	}
041cd640b2f3c5 kernel/cgroup/stat.c  Tejun Heo    2017-09-25  485  =

041cd640b2f3c5 kernel/cgroup/stat.c  Tejun Heo    2017-09-25  486  	do_div(=
usage, NSEC_PER_USEC);
041cd640b2f3c5 kernel/cgroup/stat.c  Tejun Heo    2017-09-25  487  	do_div(=
utime, NSEC_PER_USEC);
041cd640b2f3c5 kernel/cgroup/stat.c  Tejun Heo    2017-09-25  488  	do_div(=
stime, NSEC_PER_USEC);
0575a42c9f10cd kernel/cgroup/rstat.c Josh Don     2022-05-20  489  	do_div(=
forceidle_time, NSEC_PER_USEC);
041cd640b2f3c5 kernel/cgroup/stat.c  Tejun Heo    2017-09-25  490  =

d41bf8c9deaed1 kernel/cgroup/stat.c  Tejun Heo    2017-10-23  491  	seq_pri=
ntf(seq, "usage_usec %llu\n"
d41bf8c9deaed1 kernel/cgroup/stat.c  Tejun Heo    2017-10-23  492  		   "us=
er_usec %llu\n"
d41bf8c9deaed1 kernel/cgroup/stat.c  Tejun Heo    2017-10-23  493  		   "sy=
stem_usec %llu\n",
d41bf8c9deaed1 kernel/cgroup/stat.c  Tejun Heo    2017-10-23  494  		   usa=
ge, utime, stime);
0575a42c9f10cd kernel/cgroup/rstat.c Josh Don     2022-05-20  495  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6348593337105256869==--

