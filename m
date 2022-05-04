Content-Type: multipart/mixed; boundary="===============7935252145088346665=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dpcd.c:195:2: warning: Undefined or garbage value returned to caller [clang-analyzer-core.uninitialized.UndefReturn]
Date: Wed, 04 May 2022 16:13:21 +0800
Message-ID: <202205041616.xcnyrLdi-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7935252145088346665==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Wesley Chalmers <Wesley.Chalmers@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Jun Lei <Jun.Lei@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   107c948d1d3e61d10aee9d0f7c3d81bbee9842af
commit: 9cf9498f668d4c78616ebd2fe2e5f3850b189c5b drm/amd/display: Partition=
 DPCD address space and break up transactions
date:   11 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 11 months ago
config: arm-randconfig-c002-20220428 (https://download.01.org/0day-ci/archi=
ve/20220504/202205041616.xcnyrLdi-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c59473=
aacce38cd7dd77eebceaf3c98c5707ab3b)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D9cf9498f668d4c78616ebd2fe2e5f3850b189c5b
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 9cf9498f668d4c78616ebd2fe2e5f3850b189c5b
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   drivers/base/cacheinfo.c:272:3: note: Loop condition is false. Execution=
 continues on line 286
                   for_each_cpu(sibling, &this_leaf->shared_cpu_map) {
                   ^
   include/linux/cpumask.h:179:2: note: expanded from macro 'for_each_cpu'
           for ((cpu) =3D 0; (cpu) < 1; (cpu)++, (void)mask)
           ^
   drivers/base/cacheinfo.c:286:3: note: Taking true branch
                   if (of_have_populated_dt())
                   ^
   drivers/base/cacheinfo.c:287:4: note: Value assigned to 'ci_cpu_cacheinf=
o.info_list'
                           of_node_put(this_leaf->fw_token);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/base/cacheinfo.c:270:26: note: Loop condition is false.  Exiting=
 loop
           for (index =3D 0; index < cache_leaves(cpu); index++) {
                                   ^
   drivers/base/cacheinfo.c:26:28: note: expanded from macro 'cache_leaves'
   #define cache_leaves(cpu)       (ci_cacheinfo(cpu)->num_leaves)
                                    ^
   drivers/base/cacheinfo.c:25:29: note: expanded from macro 'ci_cacheinfo'
   #define ci_cacheinfo(cpu)       (&per_cpu(ci_cpu_cacheinfo, cpu))
                                     ^
   include/linux/percpu-defs.h:269:29: note: expanded from macro 'per_cpu'
   #define per_cpu(var, cpu)       (*per_cpu_ptr(&(var), cpu))
                                     ^
   include/linux/percpu-defs.h:263:47: note: expanded from macro 'per_cpu_p=
tr'
   #define per_cpu_ptr(ptr, cpu)   ({ (void)(cpu); VERIFY_PERCPU_PTR(ptr); =
})
                                                   ^
   include/linux/percpu-defs.h:259:2: note: expanded from macro 'VERIFY_PER=
CPU_PTR'
           __verify_pcpu_ptr(__p);                                         \
           ^
   include/linux/percpu-defs.h:217:37: note: expanded from macro '__verify_=
pcpu_ptr'
   #define __verify_pcpu_ptr(ptr)                                          \
                                                                           ^
   drivers/base/cacheinfo.c:270:18: note: Assuming 'index' is < field 'num_=
leaves'
           for (index =3D 0; index < cache_leaves(cpu); index++) {
                           ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/base/cacheinfo.c:270:2: note: Loop condition is true.  Entering =
loop body
           for (index =3D 0; index < cache_leaves(cpu); index++) {
           ^
   drivers/base/cacheinfo.c:271:3: note: Value assigned to 'this_leaf'
                   this_leaf =3D this_cpu_ci->info_list + index;
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/base/cacheinfo.c:272:3: note: Loop condition is true.  Entering =
loop body
                   for_each_cpu(sibling, &this_leaf->shared_cpu_map) {
                   ^
   include/linux/cpumask.h:179:2: note: expanded from macro 'for_each_cpu'
           for ((cpu) =3D 0; (cpu) < 1; (cpu)++, (void)mask)
           ^
   drivers/base/cacheinfo.c:275:8: note: 'sibling' is not equal to 'cpu'
                           if (sibling =3D=3D cpu) /* skip itself */
                               ^~~~~~~
   drivers/base/cacheinfo.c:275:4: note: Taking false branch
                           if (sibling =3D=3D cpu) /* skip itself */
                           ^
   drivers/base/cacheinfo.c:279:8: note: Assuming field 'info_list' is null
                           if (!sib_cpu_ci->info_list)
                               ^~~~~~~~~~~~~~~~~~~~~~
   drivers/base/cacheinfo.c:279:4: note: Taking true branch
                           if (!sib_cpu_ci->info_list)
                           ^
   drivers/base/cacheinfo.c:280:5: note:  Execution continues on line 272
                                   continue;
                                   ^
   drivers/base/cacheinfo.c:272:3: note: Loop condition is false. Execution=
 continues on line 286
                   for_each_cpu(sibling, &this_leaf->shared_cpu_map) {
                   ^
   include/linux/cpumask.h:179:2: note: expanded from macro 'for_each_cpu'
           for ((cpu) =3D 0; (cpu) < 1; (cpu)++, (void)mask)
           ^
   drivers/base/cacheinfo.c:286:3: note: Taking true branch
                   if (of_have_populated_dt())
                   ^
   drivers/base/cacheinfo.c:287:16: note: Access to field 'fw_token' result=
s in a dereference of a null pointer (loaded from variable 'this_leaf')
                           of_node_put(this_leaf->fw_token);
                                       ^~~~~~~~~
   10 warnings generated.
   Suppressed 10 warnings (8 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_debug.c:66:32: warning:=
 Value stored to 'plane_state' during its initialization is never read [cla=
ng-analyzer-deadcode.DeadStores]
                   const struct dc_plane_state *plane_state =3D plane_state=
s[i];
                                                ^~~~~~~~~~~   ~~~~~~~~~~~~~=
~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_debug.c:66:32: note: Va=
lue stored to 'plane_state' during its initialization is never read
                   const struct dc_plane_state *plane_state =3D plane_state=
s[i];
                                                ^~~~~~~~~~~   ~~~~~~~~~~~~~=
~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_enc_cfg.c:199:2: w=
arning: Value stored to 'eng_id' is never read [clang-analyzer-deadcode.Dea=
dStores]
           eng_id =3D ENGINE_ID_UNKNOWN;
           ^        ~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_enc_cfg.c:199:2: n=
ote: Value stored to 'eng_id' is never read
           eng_id =3D ENGINE_ID_UNKNOWN;
           ^        ~~~~~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
>> drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dpcd.c:195:2: warn=
ing: Undefined or garbage value returned to caller [clang-analyzer-core.uni=
nitialized.UndefReturn]
           return status;
           ^      ~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dpcd.c:177:2: note=
: 'status' declared without an initial value
           enum dc_status status;
           ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dpcd.c:185:2: note=
: Loop condition is false. Execution continues on line 194
           while (size_left_to_read) {
           ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dpcd.c:195:2: note=
: Undefined or garbage value returned to caller
           return status;
           ^      ~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dpcd.c:217:2: warn=
ing: Undefined or garbage value returned to caller [clang-analyzer-core.uni=
nitialized.UndefReturn]
           return status;
           ^      ~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dpcd.c:206:2: note=
: 'status' declared without an initial value
           enum dc_status status;
           ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dpcd.c:208:2: note=
: Loop condition is false. Execution continues on line 217
           while (size) {
           ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dpcd.c:217:2: note=
: Undefined or garbage value returned to caller
           return status;
           ^      ~~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (7 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   fs/xfs/libxfs/xfs_ialloc.c:1260:23: warning: Assigned value is garbage o=
r undefined [clang-analyzer-core.uninitialized.Assign]
                                   pag->pagl_leftrec =3D trec.ir_startino;
                                                     ^ ~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_ialloc.c:1143:2: note: Assuming field 'pagi_init' is n=
ot equal to 0
           ASSERT(pag->pagi_init);
           ^
   fs/xfs/xfs_linux.h:212:3: note: expanded from macro 'ASSERT'
           (likely(expr) ? (void)0 : asswarn(NULL, #expr, __FILE__, __LINE_=
_))
            ^~~~~~~~~~~~
   include/linux/compiler.h:45:22: note: expanded from macro 'likely'
   #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:33:32: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                       ^~~~
   fs/xfs/libxfs/xfs_ialloc.c:1143:2: note: '?' condition is true
           ASSERT(pag->pagi_init);
           ^
   fs/xfs/xfs_linux.h:212:3: note: expanded from macro 'ASSERT'
           (likely(expr) ? (void)0 : asswarn(NULL, #expr, __FILE__, __LINE_=
_))
            ^
   include/linux/compiler.h:45:21: note: expanded from macro 'likely'
   #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
                           ^
   fs/xfs/libxfs/xfs_ialloc.c:1144:2: note: Assuming field 'pagi_inodeok' i=
s not equal to 0
           ASSERT(pag->pagi_inodeok);
           ^
   fs/xfs/xfs_linux.h:212:3: note: expanded from macro 'ASSERT'
           (likely(expr) ? (void)0 : asswarn(NULL, #expr, __FILE__, __LINE_=
_))
            ^~~~~~~~~~~~
   include/linux/compiler.h:45:22: note: expanded from macro 'likely'
   #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:33:32: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                       ^~~~
   fs/xfs/libxfs/xfs_ialloc.c:1144:2: note: '?' condition is true
           ASSERT(pag->pagi_inodeok);
           ^
   fs/xfs/xfs_linux.h:212:3: note: expanded from macro 'ASSERT'
           (likely(expr) ? (void)0 : asswarn(NULL, #expr, __FILE__, __LINE_=
_))
            ^
   include/linux/compiler.h:45:21: note: expanded from macro 'likely'
   #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
                           ^
   fs/xfs/libxfs/xfs_ialloc.c:1145:9: note: Assuming field 'pagi_freecount'=
 is > 0
           ASSERT(pag->pagi_freecount > 0);
                  ^
   fs/xfs/xfs_linux.h:212:10: note: expanded from macro 'ASSERT'
           (likely(expr) ? (void)0 : asswarn(NULL, #expr, __FILE__, __LINE_=
_))
                   ^~~~
   include/linux/compiler.h:45:39: note: expanded from macro 'likely'
   #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
                                             ^
   include/linux/compiler.h:33:34: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                         ^
   fs/xfs/libxfs/xfs_ialloc.c:1145:14: note: Field 'pagi_freecount' is > 0
           ASSERT(pag->pagi_freecount > 0);
                       ^
   fs/xfs/libxfs/xfs_ialloc.c:1145:2: note: '?' condition is true
           ASSERT(pag->pagi_freecount > 0);
           ^
   fs/xfs/xfs_linux.h:212:3: note: expanded from macro 'ASSERT'
           (likely(expr) ? (void)0 : asswarn(NULL, #expr, __FILE__, __LINE_=
_))

vim +195 drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dpcd.c

30adeee52d1eba Wesley Chalmers 2021-04-01  164  =

30adeee52d1eba Wesley Chalmers 2021-04-01  165  enum dc_status core_link_re=
ad_dpcd(
30adeee52d1eba Wesley Chalmers 2021-04-01  166  	struct dc_link *link,
30adeee52d1eba Wesley Chalmers 2021-04-01  167  	uint32_t address,
30adeee52d1eba Wesley Chalmers 2021-04-01  168  	uint8_t *data,
30adeee52d1eba Wesley Chalmers 2021-04-01  169  	uint32_t size)
30adeee52d1eba Wesley Chalmers 2021-04-01  170  {
30adeee52d1eba Wesley Chalmers 2021-04-01  171  	uint32_t extended_address;
9cf9498f668d4c Wesley Chalmers 2021-04-08  172  	uint32_t partitioned_addre=
ss;
30adeee52d1eba Wesley Chalmers 2021-04-01  173  	uint8_t *extended_data;
30adeee52d1eba Wesley Chalmers 2021-04-01  174  	uint32_t extended_size;
9cf9498f668d4c Wesley Chalmers 2021-04-08  175  	/* size of the remaining p=
artitioned address space */
9cf9498f668d4c Wesley Chalmers 2021-04-08  176  	uint32_t size_left_to_read;
30adeee52d1eba Wesley Chalmers 2021-04-01  177  	enum dc_status status;
9cf9498f668d4c Wesley Chalmers 2021-04-08  178  	/* size of the next partit=
ion to be read from */
9cf9498f668d4c Wesley Chalmers 2021-04-08  179  	uint32_t partition_size;
9cf9498f668d4c Wesley Chalmers 2021-04-08  180  	uint32_t data_index =3D 0;
30adeee52d1eba Wesley Chalmers 2021-04-01  181  =

30adeee52d1eba Wesley Chalmers 2021-04-01  182  	dpcd_extend_address_range(=
address, data, size, &extended_address, &extended_data, &extended_size);
9cf9498f668d4c Wesley Chalmers 2021-04-08  183  	partitioned_address =3D ex=
tended_address;
9cf9498f668d4c Wesley Chalmers 2021-04-08  184  	size_left_to_read =3D exte=
nded_size;
9cf9498f668d4c Wesley Chalmers 2021-04-08  185  	while (size_left_to_read) {
9cf9498f668d4c Wesley Chalmers 2021-04-08  186  		partition_size =3D dpcd_g=
et_next_partition_size(partitioned_address, size_left_to_read);
9cf9498f668d4c Wesley Chalmers 2021-04-08  187  		status =3D internal_link_=
read_dpcd(link, partitioned_address, &extended_data[data_index], partition_=
size);
9cf9498f668d4c Wesley Chalmers 2021-04-08  188  		if (status !=3D DC_OK)
9cf9498f668d4c Wesley Chalmers 2021-04-08  189  			break;
9cf9498f668d4c Wesley Chalmers 2021-04-08  190  		partitioned_address +=3D =
partition_size;
9cf9498f668d4c Wesley Chalmers 2021-04-08  191  		data_index +=3D partition=
_size;
9cf9498f668d4c Wesley Chalmers 2021-04-08  192  		size_left_to_read -=3D pa=
rtition_size;
9cf9498f668d4c Wesley Chalmers 2021-04-08  193  	}
30adeee52d1eba Wesley Chalmers 2021-04-01  194  	dpcd_reduce_address_range(=
extended_address, extended_data, extended_size, address, data, size);
30adeee52d1eba Wesley Chalmers 2021-04-01 @195  	return status;
30adeee52d1eba Wesley Chalmers 2021-04-01  196  }
30adeee52d1eba Wesley Chalmers 2021-04-01  197  =


:::::: The code at line 195 was first introduced by commit
:::::: 30adeee52d1ebadd8e4e594a54c7cf77250b91db drm/amd/display: Enforce DP=
CD Address ranges

:::::: TO: Wesley Chalmers <Wesley.Chalmers@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7935252145088346665==--

