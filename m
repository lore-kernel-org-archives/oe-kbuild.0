Content-Type: multipart/mixed; boundary="===============1509595941495412376=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/hv/channel_mgmt.c:785 init_vp_index() error: uninitialized symbol 'target_cpu'.
Date: Mon, 18 Apr 2022 05:55:58 +0800
Message-ID: <202204180525.9FX5pouS-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1509595941495412376==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Haiyang Zhang <haiyangz@microsoft.com>
CC: Wei Liu <wei.liu@kernel.org>
CC: Michael Kelley <mikelley@microsoft.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   a1901b464e7e3e28956ae7423db2847dbbfb5be8
commit: 7c9ff3deeee61b253715dcf968a6307af148c9b2 Drivers: hv: vmbus: Fix du=
plicate CPU assignments within a device
date:   9 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 9 months ago
config: x86_64-randconfig-m031-20220418 (https://download.01.org/0day-ci/ar=
chive/20220418/202204180525.9FX5pouS-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-19) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/hv/channel_mgmt.c:785 init_vp_index() error: uninitialized symbol '=
target_cpu'.

vim +/target_cpu +785 drivers/hv/channel_mgmt.c

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

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1509595941495412376==--

