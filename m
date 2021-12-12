Content-Type: multipart/mixed; boundary="===============7587049488372714121=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/hv/channel_mgmt.c:785:22: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
Date: Sun, 12 Dec 2021 18:57:13 +0800
Message-ID: <202112121844.0E86hxdz-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7587049488372714121==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Haiyang Zhang <haiyangz@microsoft.com>
CC: Wei Liu <wei.liu@kernel.org>
CC: Michael Kelley <mikelley@microsoft.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   a763d5a5abd65797aec3dd1bf01fe2ccbec32967
commit: 7c9ff3deeee61b253715dcf968a6307af148c9b2 Drivers: hv: vmbus: Fix du=
plicate CPU assignments within a device
date:   5 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 5 months ago
config: x86_64-randconfig-c007-20211202 (https://download.01.org/0day-ci/ar=
chive/20211212/202112121844.0E86hxdz-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 4b5532=
97ef3ee4dc2119d5429adf3072e90fac38)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D7c9ff3deeee61b253715dcf968a6307af148c9b2
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 7c9ff3deeee61b253715dcf968a6307af148c9b2
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   Suppressed 5 warnings (5 in non-user code).
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
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
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
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   drivers/w1/slaves/w1_ds28e17.c:723:2: warning: Call to function 'strcat'=
 is insecure as it does not provide bounding of the memory buffer. Replace =
unbounded copy functions with analogous functions that support length argum=
ents such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcat(data->adapter.name, sl->name);
           ^~~~~~
   drivers/w1/slaves/w1_ds28e17.c:723:2: note: Call to function 'strcat' is=
 insecure as it does not provide bounding of the memory buffer. Replace unb=
ounded copy functions with analogous functions that support length argument=
s such as 'strlcat'. CWE-119
           strcat(data->adapter.name, sl->name);
           ^~~~~~
   Suppressed 7 warnings (7 in non-user code).
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
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
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
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
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
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
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
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
>> drivers/hv/channel_mgmt.c:785:22: warning: Assigned value is garbage or =
undefined [clang-analyzer-core.uninitialized.Assign]
           channel->target_cpu =3D target_cpu;
                               ^
   drivers/hv/channel_mgmt.c:608:2: note: Left side of '&&' is false
           list_for_each_entry(channel, &vmbus_connection.chn_list, listent=
ry) {
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/hv/channel_mgmt.c:608:2: note: Taking false branch
           list_for_each_entry(channel, &vmbus_connection.chn_list, listent=
ry) {
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:328:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:316:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:308:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/hv/channel_mgmt.c:608:2: note: Loop condition is false.  Exiting=
 loop
           list_for_each_entry(channel, &vmbus_connection.chn_list, listent=
ry) {
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:328:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:316:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/hv/channel_mgmt.c:608:2: note: Loop condition is false. Executio=
n continues on line 619
           list_for_each_entry(channel, &vmbus_connection.chn_list, listent=
ry) {
           ^
   include/linux/list.h:628:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   drivers/hv/channel_mgmt.c:619:2: note: Calling 'init_vp_index'
           init_vp_index(newchannel);
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hv/channel_mgmt.c:732:2: note: 'target_cpu' declared without an =
initial value
           u32 target_cpu;
           ^~~~~~~~~~~~~~
   drivers/hv/channel_mgmt.c:735:7: note: Assuming the condition is false
           if ((vmbus_proto_version =3D=3D VERSION_WS2008) ||
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hv/channel_mgmt.c:735:6: note: Left side of '||' is false
           if ((vmbus_proto_version =3D=3D VERSION_WS2008) ||
               ^
   drivers/hv/channel_mgmt.c:736:7: note: Assuming the condition is false
               (vmbus_proto_version =3D=3D VERSION_WIN7) || (!perf_chn) ||
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hv/channel_mgmt.c:735:6: note: Left side of '||' is false
           if ((vmbus_proto_version =3D=3D VERSION_WS2008) ||
               ^
   drivers/hv/channel_mgmt.c:736:48: note: Assuming 'perf_chn' is true
               (vmbus_proto_version =3D=3D VERSION_WIN7) || (!perf_chn) ||
                                                         ^~~~~~~~~
   drivers/hv/channel_mgmt.c:735:6: note: Left side of '||' is false
           if ((vmbus_proto_version =3D=3D VERSION_WS2008) ||
               ^
   drivers/hv/channel_mgmt.c:737:6: note: Assuming the condition is false
               !alloc_cpumask_var(&available_mask, GFP_KERNEL)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hv/channel_mgmt.c:735:2: note: Taking false branch
           if ((vmbus_proto_version =3D=3D VERSION_WS2008) ||
           ^
   drivers/hv/channel_mgmt.c:752:14: note: Assuming the condition is false
           for (i =3D 1; i <=3D ncpu + 1; i++) {
                       ^~~~~~~~~~~~~

vim +785 drivers/hv/channel_mgmt.c

a119845f6e98c8 K. Y. Srinivasan         2012-12-01  714  =

a119845f6e98c8 K. Y. Srinivasan         2012-12-01  715  /*
a119845f6e98c8 K. Y. Srinivasan         2012-12-01  716   * Starting with W=
in8, we can statically distribute the incoming
1f656ff3fdddc2 K. Y. Srinivasan         2015-05-30  717   * channel interru=
pt load by binding a channel to VCPU.
1f656ff3fdddc2 K. Y. Srinivasan         2015-05-30  718   *
1f656ff3fdddc2 K. Y. Srinivasan         2015-05-30  719   * For pre-win8 ho=
sts or non-performance critical channels we assign the
d570aec0f2154e Andrea Parri (Microsoft  2020-04-06  720)  * VMBUS_CONNECT_C=
PU.
8ef4c4abbbcdcd Andrea Parri (Microsoft  2020-04-06  721)  *
8ef4c4abbbcdcd Andrea Parri (Microsoft  2020-04-06  722)  * Starting with w=
in8, performance critical channels will be distributed
8ef4c4abbbcdcd Andrea Parri (Microsoft  2020-04-06  723)  * evenly among al=
l the available NUMA nodes.  Once the node is assigned,
8ef4c4abbbcdcd Andrea Parri (Microsoft  2020-04-06  724)  * we will assign =
the CPU based on a simple round robin scheme.
a119845f6e98c8 K. Y. Srinivasan         2012-12-01  725   */
afaa33da08abd1 Andrea Parri (Microsoft  2020-05-22  726) static void init_v=
p_index(struct vmbus_channel *channel)
a119845f6e98c8 K. Y. Srinivasan         2012-12-01  727  {
afaa33da08abd1 Andrea Parri (Microsoft  2020-05-22  728) 	bool perf_chn =3D=
 hv_is_perf_channel(channel);
7c9ff3deeee61b Haiyang Zhang            2021-07-16  729  	u32 i, ncpu =3D n=
um_online_cpus();
25355252607ca2 Dexuan Cui               2018-09-23  730  	cpumask_var_t ava=
ilable_mask;
9f01ec53458d9e K. Y. Srinivasan         2015-08-05  731  	struct cpumask *a=
lloced_mask;
8ef4c4abbbcdcd Andrea Parri (Microsoft  2020-04-06  732) 	u32 target_cpu;
8ef4c4abbbcdcd Andrea Parri (Microsoft  2020-04-06  733) 	int numa_node;
a119845f6e98c8 K. Y. Srinivasan         2012-12-01  734  =

a119845f6e98c8 K. Y. Srinivasan         2012-12-01  735  	if ((vmbus_proto_=
version =3D=3D VERSION_WS2008) ||
25355252607ca2 Dexuan Cui               2018-09-23  736  	    (vmbus_proto_=
version =3D=3D VERSION_WIN7) || (!perf_chn) ||
25355252607ca2 Dexuan Cui               2018-09-23  737  	    !alloc_cpumas=
k_var(&available_mask, GFP_KERNEL)) {
a119845f6e98c8 K. Y. Srinivasan         2012-12-01  738  		/*
a119845f6e98c8 K. Y. Srinivasan         2012-12-01  739  		 * Prior to win8=
, all channel interrupts are
d570aec0f2154e Andrea Parri (Microsoft  2020-04-06  740) 		 * delivered on =
VMBUS_CONNECT_CPU.
a119845f6e98c8 K. Y. Srinivasan         2012-12-01  741  		 * Also if the c=
hannel is not a performance critical
d570aec0f2154e Andrea Parri (Microsoft  2020-04-06  742) 		 * channel, bind=
 it to VMBUS_CONNECT_CPU.
d570aec0f2154e Andrea Parri (Microsoft  2020-04-06  743) 		 * In case alloc=
_cpumask_var() fails, bind it to
d570aec0f2154e Andrea Parri (Microsoft  2020-04-06  744) 		 * VMBUS_CONNECT=
_CPU.
a119845f6e98c8 K. Y. Srinivasan         2012-12-01  745  		 */
d570aec0f2154e Andrea Parri (Microsoft  2020-04-06  746) 		channel->target_=
cpu =3D VMBUS_CONNECT_CPU;
afaa33da08abd1 Andrea Parri (Microsoft  2020-05-22  747) 		if (perf_chn)
afaa33da08abd1 Andrea Parri (Microsoft  2020-05-22  748) 			hv_set_alloced_=
cpu(VMBUS_CONNECT_CPU);
d3ba720dd58cdf K. Y. Srinivasan         2014-04-08  749  		return;
a119845f6e98c8 K. Y. Srinivasan         2012-12-01  750  	}
ce59fec836a9b4 Vitaly Kuznetsov         2015-05-06  751  =

7c9ff3deeee61b Haiyang Zhang            2021-07-16  752  	for (i =3D 1; i <=
=3D ncpu + 1; i++) {
1f656ff3fdddc2 K. Y. Srinivasan         2015-05-30  753  		while (true) {
8ef4c4abbbcdcd Andrea Parri (Microsoft  2020-04-06  754) 			numa_node =3D n=
ext_numa_node_id++;
8ef4c4abbbcdcd Andrea Parri (Microsoft  2020-04-06  755) 			if (numa_node =
=3D=3D nr_node_ids) {
8ef4c4abbbcdcd Andrea Parri (Microsoft  2020-04-06  756) 				next_numa_node=
_id =3D 0;
509879bdb30b8e K. Y. Srinivasan         2016-09-02  757  				continue;
509879bdb30b8e K. Y. Srinivasan         2016-09-02  758  			}
8ef4c4abbbcdcd Andrea Parri (Microsoft  2020-04-06  759) 			if (cpumask_emp=
ty(cpumask_of_node(numa_node)))
1f656ff3fdddc2 K. Y. Srinivasan         2015-05-30  760  				continue;
1f656ff3fdddc2 K. Y. Srinivasan         2015-05-30  761  			break;
1f656ff3fdddc2 K. Y. Srinivasan         2015-05-30  762  		}
8ef4c4abbbcdcd Andrea Parri (Microsoft  2020-04-06  763) 		alloced_mask =3D=
 &hv_context.hv_numa_map[numa_node];
1f656ff3fdddc2 K. Y. Srinivasan         2015-05-30  764  =

9f01ec53458d9e K. Y. Srinivasan         2015-08-05  765  		if (cpumask_weig=
ht(alloced_mask) =3D=3D
8ef4c4abbbcdcd Andrea Parri (Microsoft  2020-04-06  766) 		    cpumask_weig=
ht(cpumask_of_node(numa_node))) {
ce59fec836a9b4 Vitaly Kuznetsov         2015-05-06  767  			/*
1f656ff3fdddc2 K. Y. Srinivasan         2015-05-30  768  			 * We have cycl=
ed through all the CPUs in the node;
1f656ff3fdddc2 K. Y. Srinivasan         2015-05-30  769  			 * reset the al=
loced map.
ce59fec836a9b4 Vitaly Kuznetsov         2015-05-06  770  			 */
9f01ec53458d9e K. Y. Srinivasan         2015-08-05  771  			cpumask_clear(a=
lloced_mask);
ce59fec836a9b4 Vitaly Kuznetsov         2015-05-06  772  		}
ce59fec836a9b4 Vitaly Kuznetsov         2015-05-06  773  =

7c9ff3deeee61b Haiyang Zhang            2021-07-16  774  		cpumask_xor(avai=
lable_mask, alloced_mask,
7c9ff3deeee61b Haiyang Zhang            2021-07-16  775  			    cpumask_of_=
node(numa_node));
79fd8e706637a5 Vitaly Kuznetsov         2016-01-27  776  =

8ef4c4abbbcdcd Andrea Parri (Microsoft  2020-04-06  777) 		target_cpu =3D c=
pumask_first(available_mask);
8ef4c4abbbcdcd Andrea Parri (Microsoft  2020-04-06  778) 		cpumask_set_cpu(=
target_cpu, alloced_mask);
1f656ff3fdddc2 K. Y. Srinivasan         2015-05-30  779  =

7c9ff3deeee61b Haiyang Zhang            2021-07-16  780  		if (channel->off=
ermsg.offer.sub_channel_index >=3D ncpu ||
7c9ff3deeee61b Haiyang Zhang            2021-07-16  781  		    i > ncpu || =
!hv_cpuself_used(target_cpu, channel))
7c9ff3deeee61b Haiyang Zhang            2021-07-16  782  			break;
7c9ff3deeee61b Haiyang Zhang            2021-07-16  783  	}
7c9ff3deeee61b Haiyang Zhang            2021-07-16  784  =

8ef4c4abbbcdcd Andrea Parri (Microsoft  2020-04-06 @785) 	channel->target_c=
pu =3D target_cpu;
25355252607ca2 Dexuan Cui               2018-09-23  786  =

25355252607ca2 Dexuan Cui               2018-09-23  787  	free_cpumask_var(=
available_mask);
a119845f6e98c8 K. Y. Srinivasan         2012-12-01  788  }
a119845f6e98c8 K. Y. Srinivasan         2012-12-01  789  =


:::::: The code at line 785 was first introduced by commit
:::::: 8ef4c4abbbcdcd9d4bc0fd9454df03e6dac24b73 Drivers: hv: vmbus: Remove =
the unused HV_LOCALIZED channel affinity logic

:::::: TO: Andrea Parri (Microsoft) <parri.andrea@gmail.com>
:::::: CC: Wei Liu <wei.liu@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7587049488372714121==--

