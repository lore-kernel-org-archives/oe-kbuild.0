Content-Type: multipart/mixed; boundary="===============6102739290993993437=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/i915/i915_perf.c:1955:9: warning: Potential leak of memory pointed to by 'oa_bo' [clang-analyzer-unix.Malloc]
Date: Thu, 09 Dec 2021 22:31:47 +0800
Message-ID: <202112092208.YAeLjs1S-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6102739290993993437==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
CC: Daniel Vetter <daniel.vetter@ffwll.ch>
CC: "Thomas Hellstr=C3=B6m" <thomas.hellstrom@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   2a987e65025e2b79c6d453b78cb5985ac6e5eb26
commit: ef4985bac521f750d1ddc4da6428b381df1d99c0 drm/i915: Increase ww lock=
ing for perf.
date:   9 months ago
:::::: branch date: 2 days ago
:::::: commit date: 9 months ago
config: x86_64-randconfig-c007-20211208 (https://download.01.org/0day-ci/ar=
chive/20211209/202112092208.YAeLjs1S-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 097a1c=
b1d5ebb3a0ec4bcaed8ba3ff6a8e33c00a)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Def4985bac521f750d1ddc4da6428b381df1d99c0
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout ef4985bac521f750d1ddc4da6428b381df1d99c0
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:709:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:320:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:308:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:300:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/gpu/drm/i915/i915_perf.c:1942:2: note: Loop condition is false. =
 Exiting loop
           llist_for_each_entry(oa_bo, stream->oa_config_bos.first, node) {
           ^
   include/linux/llist.h:152:15: note: expanded from macro 'llist_for_each_=
entry'
           for ((pos) =3D llist_entry((node), typeof(*(pos)), member);     =
  \
                        ^
   include/linux/llist.h:81:2: note: expanded from macro 'llist_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:709:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:320:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:308:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:298:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/gpu/drm/i915/i915_perf.c:1942:2: note: Loop condition is false. =
Execution continues on line 1950
           llist_for_each_entry(oa_bo, stream->oa_config_bos.first, node) {
           ^
   include/linux/llist.h:152:2: note: expanded from macro 'llist_for_each_e=
ntry'
           for ((pos) =3D llist_entry((node), typeof(*(pos)), member);     =
  \
           ^
   drivers/gpu/drm/i915/i915_perf.c:1950:10: note: Calling 'alloc_oa_config=
_buffer'
           oa_bo =3D alloc_oa_config_buffer(stream, oa_config);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_perf.c:1856:10: note: Calling 'kzalloc'
           oa_bo =3D kzalloc(sizeof(*oa_bo), GFP_KERNEL);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:684:9: note: Uninitialized value stored to field 'v=
ma'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_perf.c:1856:10: note: Returning from 'kzalloc'
           oa_bo =3D kzalloc(sizeof(*oa_bo), GFP_KERNEL);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_perf.c:1857:6: note: Assuming 'oa_bo' is non-n=
ull
           if (!oa_bo)
               ^~~~~~
   drivers/gpu/drm/i915/i915_perf.c:1857:2: note: Taking false branch
           if (!oa_bo)
           ^
   drivers/gpu/drm/i915/i915_perf.c:1867:2: note: Taking true branch
           if (IS_ERR(obj)) {
           ^
   drivers/gpu/drm/i915/i915_perf.c:1869:3: note: Control jumps to line 1926
                   goto err_free;
                   ^
   drivers/gpu/drm/i915/i915_perf.c:1926:6: note: Assuming 'err' is 0
           if (err) {
               ^~~
   drivers/gpu/drm/i915/i915_perf.c:1926:2: note: Taking false branch
           if (err) {
           ^
   drivers/gpu/drm/i915/i915_perf.c:1950:10: note: Returning from 'alloc_oa=
_config_buffer'
           oa_bo =3D alloc_oa_config_buffer(stream, oa_config);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_perf.c:1951:6: note: Calling 'IS_ERR'
           if (IS_ERR(oa_bo))
               ^~~~~~~~~~~~~
   include/linux/err.h:36:9: note: Assuming the condition is false
           return IS_ERR_VALUE((unsigned long)ptr);
                  ^
   include/linux/err.h:22:34: note: expanded from macro 'IS_ERR_VALUE'
   #define IS_ERR_VALUE(x) unlikely((unsigned long)(void *)(x) >=3D (unsign=
ed long)-MAX_ERRNO)
                           ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/err.h:36:2: note: Returning zero, which participates in a =
condition later
           return IS_ERR_VALUE((unsigned long)ptr);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_perf.c:1951:6: note: Returning from 'IS_ERR'
           if (IS_ERR(oa_bo))
               ^~~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_perf.c:1951:2: note: Taking false branch
           if (IS_ERR(oa_bo))
           ^
   drivers/gpu/drm/i915/i915_perf.c:1955:9: note: 1st function call argumen=
t is an uninitialized value
           return i915_vma_get(oa_bo->vma);
                  ^            ~~~~~~~~~~
>> drivers/gpu/drm/i915/i915_perf.c:1955:9: warning: Potential leak of memo=
ry pointed to by 'oa_bo' [clang-analyzer-unix.Malloc]
           return i915_vma_get(oa_bo->vma);
                  ^
   drivers/gpu/drm/i915/i915_perf.c:3304:8: note: Calling 'i915_perf_ioctl_=
locked'
           ret =3D i915_perf_ioctl_locked(stream, cmd, arg);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_perf.c:3270:2: note: Control jumps to 'case 26=
882:'  at line 3277
           switch (cmd) {
           ^
   drivers/gpu/drm/i915/i915_perf.c:3278:10: note: Calling 'i915_perf_confi=
g_locked'
                   return i915_perf_config_locked(stream, arg);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_perf.c:3227:7: note: 'config' is non-null
           if (!config)
                ^~~~~~
   drivers/gpu/drm/i915/i915_perf.c:3227:2: note: Taking false branch
           if (!config)
           ^
   drivers/gpu/drm/i915/i915_perf.c:3230:6: note: Assuming 'config' is not =
equal to field 'oa_config'
           if (config !=3D stream->oa_config) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_perf.c:3230:2: note: Taking true branch
           if (config !=3D stream->oa_config) {
           ^
   drivers/gpu/drm/i915/i915_perf.c:3242:9: note: Calling 'emit_oa_config'
                   err =3D emit_oa_config(stream, config, oa_context(stream=
), NULL);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   drivers/gpu/drm/i915/i915_perf.c:1969:8: note: Calling 'get_oa_vma'
           vma =3D get_oa_vma(stream, oa_config);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_perf.c:1942:2: note: Left side of '&&' is false
           llist_for_each_entry(oa_bo, stream->oa_config_bos.first, node) {
           ^
   include/linux/llist.h:152:15: note: expanded from macro 'llist_for_each_=
entry'
           for ((pos) =3D llist_entry((node), typeof(*(pos)), member);     =
  \
                        ^
   include/linux/llist.h:81:2: note: expanded from macro 'llist_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:709:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/gpu/drm/i915/i915_perf.c:1942:2: note: Taking false branch
           llist_for_each_entry(oa_bo, stream->oa_config_bos.first, node) {
           ^
   include/linux/llist.h:152:15: note: expanded from macro 'llist_for_each_=
entry'
           for ((pos) =3D llist_entry((node), typeof(*(pos)), member);     =
  \
                        ^
   include/linux/llist.h:81:2: note: expanded from macro 'llist_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:709:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:320:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:308:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:300:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/gpu/drm/i915/i915_perf.c:1942:2: note: Loop condition is false. =
 Exiting loop
           llist_for_each_entry(oa_bo, stream->oa_config_bos.first, node) {
           ^
   include/linux/llist.h:152:15: note: expanded from macro 'llist_for_each_=
entry'
           for ((pos) =3D llist_entry((node), typeof(*(pos)), member);     =
  \
                        ^
   include/linux/llist.h:81:2: note: expanded from macro 'llist_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:709:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:320:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:308:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:298:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/gpu/drm/i915/i915_perf.c:1942:2: note: Loop condition is false. =
Execution continues on line 1950
           llist_for_each_entry(oa_bo, stream->oa_config_bos.first, node) {
           ^
   include/linux/llist.h:152:2: note: expanded from macro 'llist_for_each_e=
ntry'
           for ((pos) =3D llist_entry((node), typeof(*(pos)), member);     =
  \
           ^
   drivers/gpu/drm/i915/i915_perf.c:1950:10: note: Calling 'alloc_oa_config=
_buffer'
           oa_bo =3D alloc_oa_config_buffer(stream, oa_config);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_perf.c:1856:10: note: Calling 'kzalloc'
           oa_bo =3D kzalloc(sizeof(*oa_bo), GFP_KERNEL);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:684:9: note: Memory is allocated
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

vim +/oa_bo +1955 drivers/gpu/drm/i915/i915_perf.c

15d0ace1f876e0 Lionel Landwerlin 2019-10-12  1932  =

15d0ace1f876e0 Lionel Landwerlin 2019-10-12  1933  static struct i915_vma *
15d0ace1f876e0 Lionel Landwerlin 2019-10-12  1934  get_oa_vma(struct i915_p=
erf_stream *stream, struct i915_oa_config *oa_config)
15d0ace1f876e0 Lionel Landwerlin 2019-10-12  1935  {
15d0ace1f876e0 Lionel Landwerlin 2019-10-12  1936  	struct i915_oa_config_b=
o *oa_bo;
15d0ace1f876e0 Lionel Landwerlin 2019-10-12  1937  =

14bfcd3e0daeb0 Lionel Landwerlin 2019-07-10  1938  	/*
15d0ace1f876e0 Lionel Landwerlin 2019-10-12  1939  	 * Look for the buffer =
in the already allocated BOs attached
15d0ace1f876e0 Lionel Landwerlin 2019-10-12  1940  	 * to the stream.
d79651522e89c4 Robert Bragg      2016-11-07  1941  	 */
15d0ace1f876e0 Lionel Landwerlin 2019-10-12  1942  	llist_for_each_entry(oa=
_bo, stream->oa_config_bos.first, node) {
15d0ace1f876e0 Lionel Landwerlin 2019-10-12  1943  		if (oa_bo->oa_config =
=3D=3D oa_config &&
15d0ace1f876e0 Lionel Landwerlin 2019-10-12  1944  		    memcmp(oa_bo->oa_c=
onfig->uuid,
15d0ace1f876e0 Lionel Landwerlin 2019-10-12  1945  			   oa_config->uuid,
15d0ace1f876e0 Lionel Landwerlin 2019-10-12  1946  			   sizeof(oa_config->=
uuid)) =3D=3D 0)
15d0ace1f876e0 Lionel Landwerlin 2019-10-12  1947  			goto out;
15d0ace1f876e0 Lionel Landwerlin 2019-10-12  1948  	}
15d0ace1f876e0 Lionel Landwerlin 2019-10-12  1949  =

15d0ace1f876e0 Lionel Landwerlin 2019-10-12  1950  	oa_bo =3D alloc_oa_conf=
ig_buffer(stream, oa_config);
15d0ace1f876e0 Lionel Landwerlin 2019-10-12  1951  	if (IS_ERR(oa_bo))
15d0ace1f876e0 Lionel Landwerlin 2019-10-12  1952  		return ERR_CAST(oa_bo);
15d0ace1f876e0 Lionel Landwerlin 2019-10-12  1953  =

15d0ace1f876e0 Lionel Landwerlin 2019-10-12  1954  out:
15d0ace1f876e0 Lionel Landwerlin 2019-10-12 @1955  	return i915_vma_get(oa_=
bo->vma);
15d0ace1f876e0 Lionel Landwerlin 2019-10-12  1956  }
15d0ace1f876e0 Lionel Landwerlin 2019-10-12  1957  =


:::::: The code at line 1955 was first introduced by commit
:::::: 15d0ace1f876e01b9745cb22ee32e3770fe3a6d5 drm/i915/perf: execute OA c=
onfiguration from command stream

:::::: TO: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
:::::: CC: Chris Wilson <chris@chris-wilson.co.uk>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6102739290993993437==--

