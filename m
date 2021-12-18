Content-Type: multipart/mixed; boundary="===============3981137589773860311=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/hv/channel_mgmt.c:785:22: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
Date: Sat, 18 Dec 2021 13:24:23 +0800
Message-ID: <202112181331.jNASpDYL-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3981137589773860311==
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
head:   5d65f6f3df56021ec76761ea6986bc8139f537d2
commit: 7c9ff3deeee61b253715dcf968a6307af148c9b2 Drivers: hv: vmbus: Fix du=
plicate CPU assignments within a device
date:   5 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 5 months ago
config: x86_64-randconfig-c007-20211202 (https://download.01.org/0day-ci/ar=
chive/20211218/202112181331.jNASpDYL-lkp(a)intel.com/config)
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
   #define max_t(type, x, y)       __careful_cmp((type)(x), (type)(y), >)
                                   ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/minmax.h:104:48: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
                                   ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:38:14: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:31:25: note: expanded from macro '__cmp_once'
                   typeof(x) unique_x =3D (x);               \
                                         ^
   drivers/hwmon/lm75.h:27:14: note: '?' condition is false
           int ntemp =3D clamp_val(temp, LM75_TEMP_MIN, LM75_TEMP_MAX);
                       ^
   include/linux/minmax.h:137:32: note: expanded from macro 'clamp_val'
   #define clamp_val(val, lo, hi) clamp_t(typeof(val), val, lo, hi)
                                  ^
   include/linux/minmax.h:124:48: note: expanded from macro 'clamp_t'
   #define clamp_t(type, val, lo, hi) min_t(type, max_t(type, val, lo), hi)
                                                  ^
   include/linux/minmax.h:112:27: note: expanded from macro 'max_t'
   #define max_t(type, x, y)       __careful_cmp((type)(x), (type)(y), >)
                                   ^
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   drivers/hwmon/lm75.h:27:14: note: '__UNIQUE_ID___x193' is < '__UNIQUE_ID=
___y194'
           int ntemp =3D clamp_val(temp, LM75_TEMP_MIN, LM75_TEMP_MAX);
                       ^
   include/linux/minmax.h:137:32: note: expanded from macro 'clamp_val'
   #define clamp_val(val, lo, hi) clamp_t(typeof(val), val, lo, hi)
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:124:36: note: expanded from macro 'clamp_t'
   #define clamp_t(type, val, lo, hi) min_t(type, max_t(type, val, lo), hi)
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:104:27: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~
   drivers/hwmon/lm75.h:27:14: note: '?' condition is true
           int ntemp =3D clamp_val(temp, LM75_TEMP_MIN, LM75_TEMP_MAX);
                       ^
   include/linux/minmax.h:137:32: note: expanded from macro 'clamp_val'
   #define clamp_val(val, lo, hi) clamp_t(typeof(val), val, lo, hi)
                                  ^
   include/linux/minmax.h:124:36: note: expanded from macro 'clamp_t'
   #define clamp_t(type, val, lo, hi) min_t(type, max_t(type, val, lo), hi)
                                      ^
   include/linux/minmax.h:104:27: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
                                   ^
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   drivers/hwmon/lm75.h:29:12: note: 'ntemp' is < 0
           ntemp +=3D (ntemp < 0 ? -250 : 250);
                     ^~~~~
   drivers/hwmon/lm75.h:29:12: note: '?' condition is true
   drivers/hwmon/lm75.h:30:29: note: The result of the left shift is undefi=
ned because the left operand is negative
           return (u16)((ntemp / 500) << 7);
                        ~~~~~~~~~~~~~ ^
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
   8 warnings generated.
   Suppressed 8 warnings (7 in non-user code, 1 with check filters).
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

a119845f6e98c89 K. Y. Srinivasan         2012-12-01  714  =

a119845f6e98c89 K. Y. Srinivasan         2012-12-01  715  /*
a119845f6e98c89 K. Y. Srinivasan         2012-12-01  716   * Starting with =
Win8, we can statically distribute the incoming
1f656ff3fdddc2f K. Y. Srinivasan         2015-05-30  717   * channel interr=
upt load by binding a channel to VCPU.
1f656ff3fdddc2f K. Y. Srinivasan         2015-05-30  718   *
1f656ff3fdddc2f K. Y. Srinivasan         2015-05-30  719   * For pre-win8 h=
osts or non-performance critical channels we assign the
d570aec0f2154e1 Andrea Parri (Microsoft  2020-04-06  720)  * VMBUS_CONNECT_=
CPU.
8ef4c4abbbcdcd9 Andrea Parri (Microsoft  2020-04-06  721)  *
8ef4c4abbbcdcd9 Andrea Parri (Microsoft  2020-04-06  722)  * Starting with =
win8, performance critical channels will be distributed
8ef4c4abbbcdcd9 Andrea Parri (Microsoft  2020-04-06  723)  * evenly among a=
ll the available NUMA nodes.  Once the node is assigned,
8ef4c4abbbcdcd9 Andrea Parri (Microsoft  2020-04-06  724)  * we will assign=
 the CPU based on a simple round robin scheme.
a119845f6e98c89 K. Y. Srinivasan         2012-12-01  725   */
afaa33da08abd10 Andrea Parri (Microsoft  2020-05-22  726) static void init_=
vp_index(struct vmbus_channel *channel)
a119845f6e98c89 K. Y. Srinivasan         2012-12-01  727  {
afaa33da08abd10 Andrea Parri (Microsoft  2020-05-22  728) 	bool perf_chn =
=3D hv_is_perf_channel(channel);
7c9ff3deeee61b2 Haiyang Zhang            2021-07-16  729  	u32 i, ncpu =3D =
num_online_cpus();
25355252607ca28 Dexuan Cui               2018-09-23  730  	cpumask_var_t av=
ailable_mask;
9f01ec53458d9e9 K. Y. Srinivasan         2015-08-05  731  	struct cpumask *=
alloced_mask;
8ef4c4abbbcdcd9 Andrea Parri (Microsoft  2020-04-06  732) 	u32 target_cpu;
8ef4c4abbbcdcd9 Andrea Parri (Microsoft  2020-04-06  733) 	int numa_node;
a119845f6e98c89 K. Y. Srinivasan         2012-12-01  734  =

a119845f6e98c89 K. Y. Srinivasan         2012-12-01  735  	if ((vmbus_proto=
_version =3D=3D VERSION_WS2008) ||
25355252607ca28 Dexuan Cui               2018-09-23  736  	    (vmbus_proto=
_version =3D=3D VERSION_WIN7) || (!perf_chn) ||
25355252607ca28 Dexuan Cui               2018-09-23  737  	    !alloc_cpuma=
sk_var(&available_mask, GFP_KERNEL)) {
a119845f6e98c89 K. Y. Srinivasan         2012-12-01  738  		/*
a119845f6e98c89 K. Y. Srinivasan         2012-12-01  739  		 * Prior to win=
8, all channel interrupts are
d570aec0f2154e1 Andrea Parri (Microsoft  2020-04-06  740) 		 * delivered on=
 VMBUS_CONNECT_CPU.
a119845f6e98c89 K. Y. Srinivasan         2012-12-01  741  		 * Also if the =
channel is not a performance critical
d570aec0f2154e1 Andrea Parri (Microsoft  2020-04-06  742) 		 * channel, bin=
d it to VMBUS_CONNECT_CPU.
d570aec0f2154e1 Andrea Parri (Microsoft  2020-04-06  743) 		 * In case allo=
c_cpumask_var() fails, bind it to
d570aec0f2154e1 Andrea Parri (Microsoft  2020-04-06  744) 		 * VMBUS_CONNEC=
T_CPU.
a119845f6e98c89 K. Y. Srinivasan         2012-12-01  745  		 */
d570aec0f2154e1 Andrea Parri (Microsoft  2020-04-06  746) 		channel->target=
_cpu =3D VMBUS_CONNECT_CPU;
afaa33da08abd10 Andrea Parri (Microsoft  2020-05-22  747) 		if (perf_chn)
afaa33da08abd10 Andrea Parri (Microsoft  2020-05-22  748) 			hv_set_alloced=
_cpu(VMBUS_CONNECT_CPU);
d3ba720dd58cdf6 K. Y. Srinivasan         2014-04-08  749  		return;
a119845f6e98c89 K. Y. Srinivasan         2012-12-01  750  	}
ce59fec836a9b4d Vitaly Kuznetsov         2015-05-06  751  =

7c9ff3deeee61b2 Haiyang Zhang            2021-07-16  752  	for (i =3D 1; i =
<=3D ncpu + 1; i++) {
1f656ff3fdddc2f K. Y. Srinivasan         2015-05-30  753  		while (true) {
8ef4c4abbbcdcd9 Andrea Parri (Microsoft  2020-04-06  754) 			numa_node =3D =
next_numa_node_id++;
8ef4c4abbbcdcd9 Andrea Parri (Microsoft  2020-04-06  755) 			if (numa_node =
=3D=3D nr_node_ids) {
8ef4c4abbbcdcd9 Andrea Parri (Microsoft  2020-04-06  756) 				next_numa_nod=
e_id =3D 0;
509879bdb30b8e1 K. Y. Srinivasan         2016-09-02  757  				continue;
509879bdb30b8e1 K. Y. Srinivasan         2016-09-02  758  			}
8ef4c4abbbcdcd9 Andrea Parri (Microsoft  2020-04-06  759) 			if (cpumask_em=
pty(cpumask_of_node(numa_node)))
1f656ff3fdddc2f K. Y. Srinivasan         2015-05-30  760  				continue;
1f656ff3fdddc2f K. Y. Srinivasan         2015-05-30  761  			break;
1f656ff3fdddc2f K. Y. Srinivasan         2015-05-30  762  		}
8ef4c4abbbcdcd9 Andrea Parri (Microsoft  2020-04-06  763) 		alloced_mask =
=3D &hv_context.hv_numa_map[numa_node];
1f656ff3fdddc2f K. Y. Srinivasan         2015-05-30  764  =

9f01ec53458d9e9 K. Y. Srinivasan         2015-08-05  765  		if (cpumask_wei=
ght(alloced_mask) =3D=3D
8ef4c4abbbcdcd9 Andrea Parri (Microsoft  2020-04-06  766) 		    cpumask_wei=
ght(cpumask_of_node(numa_node))) {
ce59fec836a9b4d Vitaly Kuznetsov         2015-05-06  767  			/*
1f656ff3fdddc2f K. Y. Srinivasan         2015-05-30  768  			 * We have cyc=
led through all the CPUs in the node;
1f656ff3fdddc2f K. Y. Srinivasan         2015-05-30  769  			 * reset the a=
lloced map.
ce59fec836a9b4d Vitaly Kuznetsov         2015-05-06  770  			 */
9f01ec53458d9e9 K. Y. Srinivasan         2015-08-05  771  			cpumask_clear(=
alloced_mask);
ce59fec836a9b4d Vitaly Kuznetsov         2015-05-06  772  		}
ce59fec836a9b4d Vitaly Kuznetsov         2015-05-06  773  =

7c9ff3deeee61b2 Haiyang Zhang            2021-07-16  774  		cpumask_xor(ava=
ilable_mask, alloced_mask,
7c9ff3deeee61b2 Haiyang Zhang            2021-07-16  775  			    cpumask_of=
_node(numa_node));
79fd8e706637a5c Vitaly Kuznetsov         2016-01-27  776  =

8ef4c4abbbcdcd9 Andrea Parri (Microsoft  2020-04-06  777) 		target_cpu =3D =
cpumask_first(available_mask);
8ef4c4abbbcdcd9 Andrea Parri (Microsoft  2020-04-06  778) 		cpumask_set_cpu=
(target_cpu, alloced_mask);
1f656ff3fdddc2f K. Y. Srinivasan         2015-05-30  779  =

7c9ff3deeee61b2 Haiyang Zhang            2021-07-16  780  		if (channel->of=
fermsg.offer.sub_channel_index >=3D ncpu ||
7c9ff3deeee61b2 Haiyang Zhang            2021-07-16  781  		    i > ncpu ||=
 !hv_cpuself_used(target_cpu, channel))
7c9ff3deeee61b2 Haiyang Zhang            2021-07-16  782  			break;
7c9ff3deeee61b2 Haiyang Zhang            2021-07-16  783  	}
7c9ff3deeee61b2 Haiyang Zhang            2021-07-16  784  =

8ef4c4abbbcdcd9 Andrea Parri (Microsoft  2020-04-06 @785) 	channel->target_=
cpu =3D target_cpu;
25355252607ca28 Dexuan Cui               2018-09-23  786  =

25355252607ca28 Dexuan Cui               2018-09-23  787  	free_cpumask_var=
(available_mask);
a119845f6e98c89 K. Y. Srinivasan         2012-12-01  788  }
a119845f6e98c89 K. Y. Srinivasan         2012-12-01  789  =


:::::: The code at line 785 was first introduced by commit
:::::: 8ef4c4abbbcdcd9d4bc0fd9454df03e6dac24b73 Drivers: hv: vmbus: Remove =
the unused HV_LOCALIZED channel affinity logic

:::::: TO: Andrea Parri (Microsoft) <parri.andrea@gmail.com>
:::::: CC: Wei Liu <wei.liu@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3981137589773860311==--

