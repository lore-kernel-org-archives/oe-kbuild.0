Content-Type: multipart/mixed; boundary="===============2905301441720936754=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:673:27: warning: Value stored to 'i915' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Tue, 04 Jan 2022 07:33:05 +0800
Message-ID: <202201040736.0SLkXp9X-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2905301441720936754==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
CC: Chris Wilson <chris@chris-wilson.co.uk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   c9e6606c7fe92b50a02ce51dda82586ebdf99b48
commit: 43aaadc67e6f59c670e8044adaeac7d2810904a4 drm/i915/guc: init engine =
directly in GuC submission mode
date:   12 months ago
:::::: branch date: 25 hours ago
:::::: commit date: 12 months ago
config: x86_64-randconfig-c007-20211231 (https://download.01.org/0day-ci/ar=
chive/20220104/202201040736.0SLkXp9X-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 441de7=
5f69e975b0c7690044560520f8538b4efb)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D43aaadc67e6f59c670e8044adaeac7d2810904a4
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 43aaadc67e6f59c670e8044adaeac7d2810904a4
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   drivers/gpu/drm/i915/i915_utils.h:52:25: note: expanded from macro 'WARN=
_ON_ONCE'
   #define WARN_ON_ONCE(x) WARN_ONCE((x), "%s", "WARN_ON_ONCE(" __stringify=
(x) ")")
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/asm-generic/bug.h:159:15: note: expanded from macro 'WARN_ONCE'
           if (unlikely(__ret_warn_once && !__warned)) {           \
                        ^~~~~~~~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c:2970:7: note: Left side o=
f '&&' is false
           if (!access_ok(user, num_fences * sizeof(*user)))
                ^
   arch/x86/include/asm/uaccess.h:71:2: note: expanded from macro 'access_o=
k'
           WARN_ON_IN_IRQ();                                               \
           ^
   arch/x86/include/asm/uaccess.h:47:2: note: expanded from macro 'WARN_ON_=
IN_IRQ'
           WARN_ON_ONCE(!in_task() && !pagefault_disabled())
           ^
   drivers/gpu/drm/i915/i915_utils.h:52:25: note: expanded from macro 'WARN=
_ON_ONCE'
   #define WARN_ON_ONCE(x) WARN_ONCE((x), "%s", "WARN_ON_ONCE(" __stringify=
(x) ")")
                           ^
   include/asm-generic/bug.h:159:31: note: expanded from macro 'WARN_ONCE'
           if (unlikely(__ret_warn_once && !__warned)) {           \
                                        ^
   drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c:2970:7: note: Taking fals=
e branch
           if (!access_ok(user, num_fences * sizeof(*user)))
                ^
   arch/x86/include/asm/uaccess.h:71:2: note: expanded from macro 'access_o=
k'
           WARN_ON_IN_IRQ();                                               \
           ^
   arch/x86/include/asm/uaccess.h:47:2: note: expanded from macro 'WARN_ON_=
IN_IRQ'
           WARN_ON_ONCE(!in_task() && !pagefault_disabled())
           ^
   drivers/gpu/drm/i915/i915_utils.h:52:25: note: expanded from macro 'WARN=
_ON_ONCE'
   #define WARN_ON_ONCE(x) WARN_ONCE((x), "%s", "WARN_ON_ONCE(" __stringify=
(x) ")")
                           ^
   include/asm-generic/bug.h:159:2: note: expanded from macro 'WARN_ONCE'
           if (unlikely(__ret_warn_once && !__warned)) {           \
           ^
   drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c:2970:2: note: Taking fals=
e branch
           if (!access_ok(user, num_fences * sizeof(*user)))
           ^
   drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c:2976:6: note: Assuming 'f=
' is non-null
           if (!f)
               ^~
   drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c:2976:2: note: Taking fals=
e branch
           if (!f)
           ^
   drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c:2981:2: note: Loop condit=
ion is true.  Entering loop body
           while (num_fences--) {
           ^
   drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c:2986:7: note: Calling '__=
copy_from_user'
                   if (__copy_from_user(&user_fence, user++, sizeof(user_fe=
nce)))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   include/linux/uaccess.h:110:6: note: Assuming the condition is false
           if (should_fail_usercopy())
               ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:110:2: note: Taking false branch
           if (should_fail_usercopy())
           ^
   include/linux/uaccess.h:114:9: note: Calling 'raw_copy_from_user'
           return raw_copy_from_user(to, from, n);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/uaccess_64.h:52:9: note: Calling 'copy_user_generic'
           return copy_user_generic(dst, (__force void *)src, size);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/uaccess_64.h:46:2: note: Returning without writing =
to 'to->flags'
           return ret;
           ^
   arch/x86/include/asm/uaccess_64.h:52:9: note: Returning from 'copy_user_=
generic'
           return copy_user_generic(dst, (__force void *)src, size);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/uaccess_64.h:52:2: note: Returning without writing =
to 'dst->flags'
           return copy_user_generic(dst, (__force void *)src, size);
           ^
   include/linux/uaccess.h:114:9: note: Returning from 'raw_copy_from_user'
           return raw_copy_from_user(to, from, n);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:114:2: note: Returning without writing to 'to->f=
lags'
           return raw_copy_from_user(to, from, n);
           ^
   drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c:2986:7: note: Returning f=
rom '__copy_from_user'
                   if (__copy_from_user(&user_fence, user++, sizeof(user_fe=
nce)))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c:2986:7: note: Assuming th=
e condition is false
                   if (__copy_from_user(&user_fence, user++, sizeof(user_fe=
nce)))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c:2986:3: note: Taking fals=
e branch
                   if (__copy_from_user(&user_fence, user++, sizeof(user_fe=
nce)))
                   ^
   drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c:2989:24: note: The left o=
perand of '&' is a garbage value
                   if (user_fence.flags & __I915_EXEC_FENCE_UNKNOWN_FLAGS)
                       ~~~~~~~~~~~~~~~~ ^
   drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c:3037:3: warning: Value st=
ored to 'syncobj' is never read [clang-analyzer-deadcode.DeadStores]
                   syncobj =3D ptr_unpack_bits(eb->fences[n].syncobj, &flag=
s, 2);
                   ^
   drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c:3037:3: note: Value store=
d to 'syncobj' is never read
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
>> drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:673:27: warning: Value=
 stored to 'i915' during its initialization is never read [clang-analyzer-d=
eadcode.DeadStores]
           struct drm_i915_private *i915 =3D engine->i915;
                                    ^~~~   ~~~~~~~~~~~~
   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:673:27: note: Value st=
ored to 'i915' during its initialization is never read
           struct drm_i915_private *i915 =3D engine->i915;
                                    ^~~~   ~~~~~~~~~~~~
   Suppressed 12 warnings (11 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   drivers/gpu/drm/i915/gt/uc/intel_huc.c:91:2: warning: Value stored to 'c=
opied' is never read [clang-analyzer-deadcode.DeadStores]
           copied =3D intel_uc_fw_copy_rsa(&huc->fw, vaddr, vma->size);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gt/uc/intel_huc.c:91:2: note: Value stored to 'copi=
ed' is never read
           copied =3D intel_uc_fw_copy_rsa(&huc->fw, vaddr, vma->size);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   arch/x86/include/asm/atomic64_64.h:22:9: warning: Dereference of null po=
inter [clang-analyzer-core.NullDereference]
           return __READ_ONCE((v)->counter);
                  ^
   include/asm-generic/rwonce.h:44:24: note: expanded from macro '__READ_ON=
CE'
   #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(=
x))
                           ^
   mm/memcontrol.c:6422:26: note: Passing null pointer value via 2nd parame=
ter 'events'
           __memory_events_show(m, memcg->memory_events_local);
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/memcontrol.c:6422:2: note: Calling '__memory_events_show'
           __memory_events_show(m, memcg->memory_events_local);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/memcontrol.c:6402:46: note: Passing null pointer value via 1st parame=
ter 'v'
           seq_printf(m, "low %lu\n", atomic_long_read(&events[MEMCG_LOW]));
                                                       ^~~~~~~~~~~~~~~~~~
   mm/memcontrol.c:6402:29: note: Calling 'atomic_long_read'
           seq_printf(m, "low %lu\n", atomic_long_read(&events[MEMCG_LOW]));
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/atomic-long.h:29:23: note: Passing null pointer valu=
e via 1st parameter 'v'
           return atomic64_read(v);
                                ^
   include/asm-generic/atomic-long.h:29:9: note: Calling 'atomic64_read'
           return atomic64_read(v);
                  ^
   include/asm-generic/atomic-instrumented.h:840:23: note: expanded from ma=
cro 'atomic64_read'
   #define atomic64_read atomic64_read
                         ^
   include/asm-generic/atomic-instrumented.h:838:28: note: Passing null poi=
nter value via 1st parameter 'v'
           return arch_atomic64_read(v);
                                     ^
   include/asm-generic/atomic-instrumented.h:838:9: note: Calling 'arch_ato=
mic64_read'
           return arch_atomic64_read(v);
                  ^~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/atomic64_64.h:22:9: note: Dereference of null point=
er
           return __READ_ONCE((v)->counter);
                  ^
   include/asm-generic/rwonce.h:44:24: note: expanded from macro '__READ_ON=
CE'
   #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(=
x))
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   Suppressed 11 warnings (11 in non-user code).
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

vim +/i915 +673 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c

43aaadc67e6f59 Daniele Ceraolo Spurio 2021-01-12  670  =

43aaadc67e6f59 Daniele Ceraolo Spurio 2021-01-12  671  int intel_guc_submis=
sion_setup(struct intel_engine_cs *engine)
43aaadc67e6f59 Daniele Ceraolo Spurio 2021-01-12  672  {
43aaadc67e6f59 Daniele Ceraolo Spurio 2021-01-12 @673  	struct drm_i915_pri=
vate *i915 =3D engine->i915;
43aaadc67e6f59 Daniele Ceraolo Spurio 2021-01-12  674  =

43aaadc67e6f59 Daniele Ceraolo Spurio 2021-01-12  675  	/*
43aaadc67e6f59 Daniele Ceraolo Spurio 2021-01-12  676  	 * The setup relies=
 on several assumptions (e.g. irqs always enabled)
43aaadc67e6f59 Daniele Ceraolo Spurio 2021-01-12  677  	 * that are only va=
lid on gen11+
43aaadc67e6f59 Daniele Ceraolo Spurio 2021-01-12  678  	 */
43aaadc67e6f59 Daniele Ceraolo Spurio 2021-01-12  679  	GEM_BUG_ON(INTEL_GE=
N(i915) < 11);
43aaadc67e6f59 Daniele Ceraolo Spurio 2021-01-12  680  =

43aaadc67e6f59 Daniele Ceraolo Spurio 2021-01-12  681  	tasklet_init(&engin=
e->execlists.tasklet,
43aaadc67e6f59 Daniele Ceraolo Spurio 2021-01-12  682  		     guc_submissio=
n_tasklet, (unsigned long)engine);
43aaadc67e6f59 Daniele Ceraolo Spurio 2021-01-12  683  =

43aaadc67e6f59 Daniele Ceraolo Spurio 2021-01-12  684  	guc_default_vfuncs(=
engine);
43aaadc67e6f59 Daniele Ceraolo Spurio 2021-01-12  685  	guc_default_irqs(en=
gine);
43aaadc67e6f59 Daniele Ceraolo Spurio 2021-01-12  686  =

43aaadc67e6f59 Daniele Ceraolo Spurio 2021-01-12  687  	if (engine->class =
=3D=3D RENDER_CLASS)
43aaadc67e6f59 Daniele Ceraolo Spurio 2021-01-12  688  		rcs_submission_ove=
rride(engine);
43aaadc67e6f59 Daniele Ceraolo Spurio 2021-01-12  689  =

43aaadc67e6f59 Daniele Ceraolo Spurio 2021-01-12  690  	lrc_init_wa_ctx(eng=
ine);
43aaadc67e6f59 Daniele Ceraolo Spurio 2021-01-12  691  =

43aaadc67e6f59 Daniele Ceraolo Spurio 2021-01-12  692  	/* Finally, take ow=
nership and responsibility for cleanup! */
43aaadc67e6f59 Daniele Ceraolo Spurio 2021-01-12  693  	engine->sanitize =
=3D guc_sanitize;
43aaadc67e6f59 Daniele Ceraolo Spurio 2021-01-12  694  	engine->release =3D=
 guc_release;
43aaadc67e6f59 Daniele Ceraolo Spurio 2021-01-12  695  =

43aaadc67e6f59 Daniele Ceraolo Spurio 2021-01-12  696  	return 0;
43aaadc67e6f59 Daniele Ceraolo Spurio 2021-01-12  697  }
43aaadc67e6f59 Daniele Ceraolo Spurio 2021-01-12  698  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2905301441720936754==--

