Content-Type: multipart/mixed; boundary="===============1577906557878676147=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [l1k:smsc95xx_5.17 642/888] drivers/gpu/drm/drm_bridge.c:828:9: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
Date: Sun, 10 Apr 2022 06:08:26 +0800
Message-ID: <202204100630.oouy9wkS-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1577906557878676147==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Dave Stevenson <dave.stevenson@raspberrypi.com>
CC: Dom Cobley <popcornmix@gmail.com>

tree:   https://github.com/l1k/linux smsc95xx_5.17
head:   240f56c27361c195cd502d95aba51c6b8e5b808c
commit: 6f6042987b769f796264e6a449dc80555aa7f5b8 [642/888] drm/bridge: Intr=
oduce pre_enable_upstream_first to alter bridge init order
:::::: branch date: 31 hours ago
:::::: commit date: 3 weeks ago
config: riscv-randconfig-c006-20220408 (https://download.01.org/0day-ci/arc=
hive/20220410/202204100630.oouy9wkS-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 893e1c=
18b98d8bbc7b8d7d22cc2c348f65c72ad9)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/l1k/linux/commit/6f6042987b769f796264e6a449dc8=
0555aa7f5b8
        git remote add l1k https://github.com/l1k/linux
        git fetch --no-tags l1k smsc95xx_5.17
        git checkout 6f6042987b769f796264e6a449dc80555aa7f5b8
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                           ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/base/cacheinfo.c:270:2: note: Loop condition is true.  Entering =
loop body
           for (index =3D 0; index < cache_leaves(cpu); index++) {
           ^
   drivers/base/cacheinfo.c:272:3: note: Loop condition is true.  Entering =
loop body
                   for_each_cpu(sibling, &this_leaf->shared_cpu_map) {
                   ^
   include/linux/cpumask.h:190:2: note: expanded from macro 'for_each_cpu'
           for ((cpu) =3D 0; (cpu) < 1; (cpu)++, (void)mask)
           ^
   drivers/base/cacheinfo.c:275:8: note: Assuming 'sibling' is not equal to=
 'cpu'
                           if (sibling =3D=3D cpu) /* skip itself */
                               ^~~~~~~~~~~~~~
   drivers/base/cacheinfo.c:275:4: note: Taking false branch
                           if (sibling =3D=3D cpu) /* skip itself */
                           ^
   drivers/base/cacheinfo.c:279:21: note: Field 'info_list' is non-null
                           if (!sib_cpu_ci->info_list)
                                            ^
   drivers/base/cacheinfo.c:279:4: note: Taking false branch
                           if (!sib_cpu_ci->info_list)
                           ^
   drivers/base/cacheinfo.c:272:3: note: Loop condition is false. Execution=
 continues on line 286
                   for_each_cpu(sibling, &this_leaf->shared_cpu_map) {
                   ^
   include/linux/cpumask.h:190:2: note: expanded from macro 'for_each_cpu'
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
   include/linux/cpumask.h:190:2: note: expanded from macro 'for_each_cpu'
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
   include/linux/cpumask.h:190:2: note: expanded from macro 'for_each_cpu'
           for ((cpu) =3D 0; (cpu) < 1; (cpu)++, (void)mask)
           ^
   drivers/base/cacheinfo.c:286:3: note: Taking true branch
                   if (of_have_populated_dt())
                   ^
   drivers/base/cacheinfo.c:287:16: note: Access to field 'fw_token' result=
s in a dereference of a null pointer (loaded from variable 'this_leaf')
                           of_node_put(this_leaf->fw_token);
                                       ^~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
>> drivers/gpu/drm/drm_bridge.c:828:9: warning: Assigned value is garbage o=
r undefined [clang-analyzer-core.uninitialized.Assign]
                           iter =3D limit;
                                ^
   drivers/gpu/drm/drm_bridge.c:583:2: note: Calling 'drm_atomic_bridge_cha=
in_pre_enable'
           drm_atomic_bridge_chain_pre_enable(bridge, NULL);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_bridge.c:783:35: note: 'limit' declared without an i=
nitial value
           struct drm_bridge *iter, *next, *limit;
                                            ^~~~~
   drivers/gpu/drm/drm_bridge.c:785:6: note: Assuming 'bridge' is non-null
           if (!bridge)
               ^~~~~~~
   drivers/gpu/drm/drm_bridge.c:785:2: note: Taking false branch
           if (!bridge)
           ^
   drivers/gpu/drm/drm_bridge.c:790:2: note: Loop condition is true.  Enter=
ing loop body
           list_for_each_entry_reverse(iter, &encoder->bridge_chain, chain_=
node) {
           ^
   include/linux/list.h:649:2: note: expanded from macro 'list_for_each_ent=
ry_reverse'
           for (pos =3D list_last_entry(head, typeof(*pos), member);       =
  \
           ^
   drivers/gpu/drm/drm_bridge.c:791:7: note: Assuming field 'pre_enable_ups=
tream_first' is false
                   if (iter->pre_enable_upstream_first) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_bridge.c:791:3: note: Taking false branch
                   if (iter->pre_enable_upstream_first) {
                   ^
   drivers/gpu/drm/drm_bridge.c:823:3: note: Calling 'drm_atomic_bridge_cal=
l_pre_enable'
                   drm_atomic_bridge_call_pre_enable(iter, old_state);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_bridge.c:748:6: note: 'old_state' is null
           if (old_state && bridge->funcs->atomic_pre_enable) {
               ^~~~~~~~~
   drivers/gpu/drm/drm_bridge.c:748:16: note: Left side of '&&' is false
           if (old_state && bridge->funcs->atomic_pre_enable) {
                         ^
   drivers/gpu/drm/drm_bridge.c:758:13: note: Assuming field 'pre_enable' i=
s non-null
           } else if (bridge->funcs->pre_enable) {
                      ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_bridge.c:758:9: note: Taking true branch
           } else if (bridge->funcs->pre_enable) {
                  ^
   drivers/gpu/drm/drm_bridge.c:759:3: note: Value assigned to field 'pre_e=
nable_upstream_first', which participates in a condition later
                   bridge->funcs->pre_enable(bridge);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_bridge.c:823:3: note: Returning from 'drm_atomic_bri=
dge_call_pre_enable'
                   drm_atomic_bridge_call_pre_enable(iter, old_state);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_bridge.c:825:7: note: Assuming field 'pre_enable_ups=
tream_first' is true
                   if (iter->pre_enable_upstream_first)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_bridge.c:825:3: note: Taking true branch
                   if (iter->pre_enable_upstream_first)
                   ^
   drivers/gpu/drm/drm_bridge.c:828:9: note: Assigned value is garbage or u=
ndefined
                           iter =3D limit;
                                ^ ~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
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
   Suppressed 3 warnings (3 in non-user code).
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
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
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

vim +828 drivers/gpu/drm/drm_bridge.c

5ade071ba13e3b Sean Paul       2019-06-11  762  =

5ade071ba13e3b Sean Paul       2019-06-11  763  /**
ea099adfdf4bf3 Boris Brezillon 2019-12-03  764   * drm_atomic_bridge_chain_=
pre_enable - prepares for enabling all bridges in
ea099adfdf4bf3 Boris Brezillon 2019-12-03  765   *					the encoder chain
5ade071ba13e3b Sean Paul       2019-06-11  766   * @bridge: bridge control =
structure
f3fdbc721b8bc9 Boris Brezillon 2019-12-03  767   * @old_state: old atomic s=
tate
5ade071ba13e3b Sean Paul       2019-06-11  768   *
5ade071ba13e3b Sean Paul       2019-06-11  769   * Calls &drm_bridge_funcs.=
atomic_pre_enable (falls back on
5ade071ba13e3b Sean Paul       2019-06-11  770   * &drm_bridge_funcs.pre_en=
able) op for all the bridges in the encoder chain,
5ade071ba13e3b Sean Paul       2019-06-11  771   * starting from the last b=
ridge to the first. These are called before calling
5ade071ba13e3b Sean Paul       2019-06-11  772   * &drm_encoder_helper_func=
s.atomic_enable
5ade071ba13e3b Sean Paul       2019-06-11  773   *
6f6042987b769f Dave Stevenson  2021-12-16  774   * If a bridge sets @pre_en=
able_upstream_first, then the pre_enable for the
6f6042987b769f Dave Stevenson  2021-12-16  775   * upstream bridge will be =
called before pre_enable of this bridge.
6f6042987b769f Dave Stevenson  2021-12-16  776   *
5ade071ba13e3b Sean Paul       2019-06-11  777   * Note: the bridge passed =
should be the one closest to the encoder
5ade071ba13e3b Sean Paul       2019-06-11  778   */
ea099adfdf4bf3 Boris Brezillon 2019-12-03  779  void drm_atomic_bridge_chai=
n_pre_enable(struct drm_bridge *bridge,
f3fdbc721b8bc9 Boris Brezillon 2019-12-03  780  					struct drm_atomic_stat=
e *old_state)
5ade071ba13e3b Sean Paul       2019-06-11  781  {
05193dc3819702 Boris Brezillon 2019-12-03  782  	struct drm_encoder *encode=
r;
6f6042987b769f Dave Stevenson  2021-12-16  783  	struct drm_bridge *iter, *=
next, *limit;
05193dc3819702 Boris Brezillon 2019-12-03  784  =

5ade071ba13e3b Sean Paul       2019-06-11  785  	if (!bridge)
5ade071ba13e3b Sean Paul       2019-06-11  786  		return;
5ade071ba13e3b Sean Paul       2019-06-11  787  =

05193dc3819702 Boris Brezillon 2019-12-03  788  	encoder =3D bridge->encode=
r;
6f6042987b769f Dave Stevenson  2021-12-16  789  =

05193dc3819702 Boris Brezillon 2019-12-03  790  	list_for_each_entry_revers=
e(iter, &encoder->bridge_chain, chain_node) {
6f6042987b769f Dave Stevenson  2021-12-16  791  		if (iter->pre_enable_upst=
ream_first) {
6f6042987b769f Dave Stevenson  2021-12-16  792  			next =3D iter;
6f6042987b769f Dave Stevenson  2021-12-16  793  			limit =3D bridge;
6f6042987b769f Dave Stevenson  2021-12-16  794  			list_for_each_entry_from=
_reverse(next,
6f6042987b769f Dave Stevenson  2021-12-16  795  							 &encoder->bridge_ch=
ain,
6f6042987b769f Dave Stevenson  2021-12-16  796  							 chain_node) {
6f6042987b769f Dave Stevenson  2021-12-16  797  				if (next =3D=3D bridge)
6f6042987b769f Dave Stevenson  2021-12-16  798  					break;
41cf57124e0245 Boris Brezillon 2020-01-28  799  =

6f6042987b769f Dave Stevenson  2021-12-16  800  				if (!next->pre_enable_u=
pstream_first) {
6f6042987b769f Dave Stevenson  2021-12-16  801  					/* Found first bridge =
that does NOT
6f6042987b769f Dave Stevenson  2021-12-16  802  					 * request upstream to=
 be enabled first
6f6042987b769f Dave Stevenson  2021-12-16  803  					 */
6f6042987b769f Dave Stevenson  2021-12-16  804  					limit =3D list_prev_en=
try(next, chain_node);
6f6042987b769f Dave Stevenson  2021-12-16  805  					break;
6f6042987b769f Dave Stevenson  2021-12-16  806  				}
6f6042987b769f Dave Stevenson  2021-12-16  807  			}
41cf57124e0245 Boris Brezillon 2020-01-28  808  =

6f6042987b769f Dave Stevenson  2021-12-16  809  			list_for_each_entry_from=
(next, &encoder->bridge_chain, chain_node) {
6f6042987b769f Dave Stevenson  2021-12-16  810  				/* Call requested upstr=
eam bridge pre_enable
6f6042987b769f Dave Stevenson  2021-12-16  811  				 * in order.
6f6042987b769f Dave Stevenson  2021-12-16  812  				 */
6f6042987b769f Dave Stevenson  2021-12-16  813  				if (next =3D=3D iter)
6f6042987b769f Dave Stevenson  2021-12-16  814  					/* At the first bridgg=
e to request upstream
6f6042987b769f Dave Stevenson  2021-12-16  815  					 * bridges called firs=
t.
6f6042987b769f Dave Stevenson  2021-12-16  816  					 */
6f6042987b769f Dave Stevenson  2021-12-16  817  					break;
6f6042987b769f Dave Stevenson  2021-12-16  818  =

6f6042987b769f Dave Stevenson  2021-12-16  819  				drm_atomic_bridge_call_=
pre_enable(next, old_state);
6f6042987b769f Dave Stevenson  2021-12-16  820  			}
41cf57124e0245 Boris Brezillon 2020-01-28  821  		}
5ade071ba13e3b Sean Paul       2019-06-11  822  =

6f6042987b769f Dave Stevenson  2021-12-16  823  		drm_atomic_bridge_call_pr=
e_enable(iter, old_state);
6f6042987b769f Dave Stevenson  2021-12-16  824  =

6f6042987b769f Dave Stevenson  2021-12-16  825  		if (iter->pre_enable_upst=
ream_first)
6f6042987b769f Dave Stevenson  2021-12-16  826  			/* Jump all bridges that=
 we have already pre_enabled
6f6042987b769f Dave Stevenson  2021-12-16  827  			 */
6f6042987b769f Dave Stevenson  2021-12-16 @828  			iter =3D limit;
6f6042987b769f Dave Stevenson  2021-12-16  829  =

05193dc3819702 Boris Brezillon 2019-12-03  830  		if (iter =3D=3D bridge)
05193dc3819702 Boris Brezillon 2019-12-03  831  			break;
05193dc3819702 Boris Brezillon 2019-12-03  832  	}
5ade071ba13e3b Sean Paul       2019-06-11  833  }
ea099adfdf4bf3 Boris Brezillon 2019-12-03  834  EXPORT_SYMBOL(drm_atomic_br=
idge_chain_pre_enable);
5ade071ba13e3b Sean Paul       2019-06-11  835  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1577906557878676147==--

