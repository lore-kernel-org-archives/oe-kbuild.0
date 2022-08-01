Content-Type: multipart/mixed; boundary="===============2961550265556124493=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [android-common:android13-5.15 1/2] include/trace/hooks/topology.h:22:1: sparse: sparse: incorrect type in assignment (different address spaces)
Date: Mon, 01 Aug 2022 17:49:08 +0800
Message-ID: <202208011748.SnFrocqB-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2961550265556124493==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: cros-kernel-buildreports(a)googlegroups.com

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   139d316361c397fbea5e128b766f649eab513b00
commit: 8c802d3f5ca471a5e7e73daea92dfc6c64e13f96 [1/2] ANDROID: arch_topolo=
gy: Add android_rvh_update_thermal_stats
:::::: branch date: 4 days ago
:::::: commit date: 5 days ago
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/202208=
01/202208011748.SnFrocqB-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        git remote add android-common https://android.googlesource.com/kern=
el/common
        git fetch --no-tags android-common android13-5.15
        git checkout 8c802d3f5ca471a5e7e73daea92dfc6c64e13f96
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3D=
build_dir ARCH=3Dx86_64 SHELL=3D/bin/bash drivers/android/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
   include/trace/hooks/sched.h:230:1: sparse:     expected struct tracepoin=
t_func *it_func_ptr
   include/trace/hooks/sched.h:230:1: sparse:     got struct tracepoint_fun=
c [noderef] __rcu *funcs
   include/trace/hooks/sched.h:234:1: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct tracepoint_func *=
it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:234:1: sparse:     expected struct tracepoin=
t_func *it_func_ptr
   include/trace/hooks/sched.h:234:1: sparse:     got struct tracepoint_fun=
c [noderef] __rcu *funcs
   include/trace/hooks/sched.h:238:1: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct tracepoint_func *=
it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:238:1: sparse:     expected struct tracepoin=
t_func *it_func_ptr
   include/trace/hooks/sched.h:238:1: sparse:     got struct tracepoint_fun=
c [noderef] __rcu *funcs
   include/trace/hooks/sched.h:242:1: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct tracepoint_func *=
it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:242:1: sparse:     expected struct tracepoin=
t_func *it_func_ptr
   include/trace/hooks/sched.h:242:1: sparse:     got struct tracepoint_fun=
c [noderef] __rcu *funcs
   include/trace/hooks/sched.h:246:1: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct tracepoint_func *=
it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:246:1: sparse:     expected struct tracepoin=
t_func *it_func_ptr
   include/trace/hooks/sched.h:246:1: sparse:     got struct tracepoint_fun=
c [noderef] __rcu *funcs
   include/trace/hooks/sched.h:250:1: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct tracepoint_func *=
it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:250:1: sparse:     expected struct tracepoin=
t_func *it_func_ptr
   include/trace/hooks/sched.h:250:1: sparse:     got struct tracepoint_fun=
c [noderef] __rcu *funcs
   include/trace/hooks/sched.h:254:1: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct tracepoint_func *=
it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:254:1: sparse:     expected struct tracepoin=
t_func *it_func_ptr
   include/trace/hooks/sched.h:254:1: sparse:     got struct tracepoint_fun=
c [noderef] __rcu *funcs
   include/trace/hooks/sched.h:258:1: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct tracepoint_func *=
it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:258:1: sparse:     expected struct tracepoin=
t_func *it_func_ptr
   include/trace/hooks/sched.h:258:1: sparse:     got struct tracepoint_fun=
c [noderef] __rcu *funcs
   include/trace/hooks/sched.h:262:1: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct tracepoint_func *=
it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:262:1: sparse:     expected struct tracepoin=
t_func *it_func_ptr
   include/trace/hooks/sched.h:262:1: sparse:     got struct tracepoint_fun=
c [noderef] __rcu *funcs
   include/trace/hooks/sched.h:266:1: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct tracepoint_func *=
it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:266:1: sparse:     expected struct tracepoin=
t_func *it_func_ptr
   include/trace/hooks/sched.h:266:1: sparse:     got struct tracepoint_fun=
c [noderef] __rcu *funcs
   include/trace/hooks/sched.h:292:1: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct tracepoint_func *=
it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:292:1: sparse:     expected struct tracepoin=
t_func *it_func_ptr
   include/trace/hooks/sched.h:292:1: sparse:     got struct tracepoint_fun=
c [noderef] __rcu *funcs
   include/trace/hooks/sched.h:298:1: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct tracepoint_func *=
it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:298:1: sparse:     expected struct tracepoin=
t_func *it_func_ptr
   include/trace/hooks/sched.h:298:1: sparse:     got struct tracepoint_fun=
c [noderef] __rcu *funcs
   include/trace/hooks/sched.h:302:1: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct tracepoint_func *=
it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:302:1: sparse:     expected struct tracepoin=
t_func *it_func_ptr
   include/trace/hooks/sched.h:302:1: sparse:     got struct tracepoint_fun=
c [noderef] __rcu *funcs
   include/trace/hooks/sched.h:307:1: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct tracepoint_func *=
it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:307:1: sparse:     expected struct tracepoin=
t_func *it_func_ptr
   include/trace/hooks/sched.h:307:1: sparse:     got struct tracepoint_fun=
c [noderef] __rcu *funcs
   include/trace/hooks/sched.h:312:1: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct tracepoint_func *=
it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:312:1: sparse:     expected struct tracepoin=
t_func *it_func_ptr
   include/trace/hooks/sched.h:312:1: sparse:     got struct tracepoint_fun=
c [noderef] __rcu *funcs
   include/trace/hooks/sched.h:317:1: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct tracepoint_func *=
it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:317:1: sparse:     expected struct tracepoin=
t_func *it_func_ptr
   include/trace/hooks/sched.h:317:1: sparse:     got struct tracepoint_fun=
c [noderef] __rcu *funcs
   include/trace/hooks/sched.h:324:1: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct tracepoint_func *=
it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:324:1: sparse:     expected struct tracepoin=
t_func *it_func_ptr
   include/trace/hooks/sched.h:324:1: sparse:     got struct tracepoint_fun=
c [noderef] __rcu *funcs
   include/trace/hooks/sched.h:329:1: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct tracepoint_func *=
it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:329:1: sparse:     expected struct tracepoin=
t_func *it_func_ptr
   include/trace/hooks/sched.h:329:1: sparse:     got struct tracepoint_fun=
c [noderef] __rcu *funcs
   include/trace/hooks/sched.h:334:1: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct tracepoint_func *=
it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:334:1: sparse:     expected struct tracepoin=
t_func *it_func_ptr
   include/trace/hooks/sched.h:334:1: sparse:     got struct tracepoint_fun=
c [noderef] __rcu *funcs
   include/trace/hooks/sched.h:348:1: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct tracepoint_func *=
it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:348:1: sparse:     expected struct tracepoin=
t_func *it_func_ptr
   include/trace/hooks/sched.h:348:1: sparse:     got struct tracepoint_fun=
c [noderef] __rcu *funcs
   include/trace/hooks/sched.h:353:1: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct tracepoint_func *=
it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:353:1: sparse:     expected struct tracepoin=
t_func *it_func_ptr
   include/trace/hooks/sched.h:353:1: sparse:     got struct tracepoint_fun=
c [noderef] __rcu *funcs
   include/trace/hooks/sched.h:357:1: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct tracepoint_func *=
it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:357:1: sparse:     expected struct tracepoin=
t_func *it_func_ptr
   include/trace/hooks/sched.h:357:1: sparse:     got struct tracepoint_fun=
c [noderef] __rcu *funcs
   include/trace/hooks/sched.h:363:1: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct tracepoint_func *=
it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:363:1: sparse:     expected struct tracepoin=
t_func *it_func_ptr
   include/trace/hooks/sched.h:363:1: sparse:     got struct tracepoint_fun=
c [noderef] __rcu *funcs
   include/trace/hooks/sched.h:367:1: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct tracepoint_func *=
it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:367:1: sparse:     expected struct tracepoin=
t_func *it_func_ptr
   include/trace/hooks/sched.h:367:1: sparse:     got struct tracepoint_fun=
c [noderef] __rcu *funcs
   include/trace/hooks/sched.h:371:1: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct tracepoint_func *=
it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:371:1: sparse:     expected struct tracepoin=
t_func *it_func_ptr
   include/trace/hooks/sched.h:371:1: sparse:     got struct tracepoint_fun=
c [noderef] __rcu *funcs
   include/trace/hooks/sched.h:375:1: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct tracepoint_func *=
it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:375:1: sparse:     expected struct tracepoin=
t_func *it_func_ptr
   include/trace/hooks/sched.h:375:1: sparse:     got struct tracepoint_fun=
c [noderef] __rcu *funcs
   include/trace/hooks/sched.h:379:1: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct tracepoint_func *=
it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:379:1: sparse:     expected struct tracepoin=
t_func *it_func_ptr
   include/trace/hooks/sched.h:379:1: sparse:     got struct tracepoint_fun=
c [noderef] __rcu *funcs
   include/trace/hooks/sched.h:391:1: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct tracepoint_func *=
it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:391:1: sparse:     expected struct tracepoin=
t_func *it_func_ptr
   include/trace/hooks/sched.h:391:1: sparse:     got struct tracepoint_fun=
c [noderef] __rcu *funcs
   include/trace/hooks/sched.h:395:1: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct tracepoint_func *=
it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:395:1: sparse:     expected struct tracepoin=
t_func *it_func_ptr
   include/trace/hooks/sched.h:395:1: sparse:     got struct tracepoint_fun=
c [noderef] __rcu *funcs
   include/trace/hooks/sched.h:399:1: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct tracepoint_func *=
it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:399:1: sparse:     expected struct tracepoin=
t_func *it_func_ptr
   include/trace/hooks/sched.h:399:1: sparse:     got struct tracepoint_fun=
c [noderef] __rcu *funcs
   include/trace/hooks/sched.h:415:1: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct tracepoint_func *=
it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:415:1: sparse:     expected struct tracepoin=
t_func *it_func_ptr
   include/trace/hooks/sched.h:415:1: sparse:     got struct tracepoint_fun=
c [noderef] __rcu *funcs
   include/trace/hooks/sched.h:436:1: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct tracepoint_func *=
it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:436:1: sparse:     expected struct tracepoin=
t_func *it_func_ptr
   include/trace/hooks/sched.h:436:1: sparse:     got struct tracepoint_fun=
c [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/=
trace/define_trace.h, include/trace/hooks/binder.h):
   include/trace/hooks/binder.h:40:1: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct tracepoint_func *=
it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/binder.h:40:1: sparse:     expected struct tracepoin=
t_func *it_func_ptr
   include/trace/hooks/binder.h:40:1: sparse:     got struct tracepoint_fun=
c [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/=
trace/define_trace.h, include/trace/hooks/topology.h):
>> include/trace/hooks/topology.h:22:1: sparse: sparse: incorrect type in a=
ssignment (different address spaces) @@     expected struct tracepoint_func=
 *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/topology.h:22:1: sparse:     expected struct tracepo=
int_func *it_func_ptr
   include/trace/hooks/topology.h:22:1: sparse:     got struct tracepoint_f=
unc [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/=
trace/define_trace.h, include/trace/hooks/gic_v3.h):
   include/trace/hooks/gic_v3.h:22:1: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct tracepoint_func *=
it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/gic_v3.h:22:1: sparse:     expected struct tracepoin=
t_func *it_func_ptr
   include/trace/hooks/gic_v3.h:22:1: sparse:     got struct tracepoint_fun=
c [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/=
trace/define_trace.h, include/trace/hooks/cpufreq.h):
   include/trace/hooks/cpufreq.h:13:1: sparse: sparse: incorrect type in as=
signment (different address spaces) @@     expected struct tracepoint_func =
*it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/cpufreq.h:13:1: sparse:     expected struct tracepoi=
nt_func *it_func_ptr
   include/trace/hooks/cpufreq.h:13:1: sparse:     got struct tracepoint_fu=
nc [noderef] __rcu *funcs
   include/trace/hooks/cpufreq.h:22:1: sparse: sparse: incorrect type in as=
signment (different address spaces) @@     expected struct tracepoint_func =
*it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/cpufreq.h:22:1: sparse:     expected struct tracepoi=
nt_func *it_func_ptr
   include/trace/hooks/cpufreq.h:22:1: sparse:     got struct tracepoint_fu=
nc [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/=
trace/define_trace.h, include/trace/hooks/mm.h):
   include/trace/hooks/mm.h:18:1: sparse: sparse: incorrect type in assignm=
ent (different address spaces) @@     expected struct tracepoint_func *it_f=
unc_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/mm.h:18:1: sparse:     expected struct tracepoint_fu=
nc *it_func_ptr
   include/trace/hooks/mm.h:18:1: sparse:     got struct tracepoint_func [n=
oderef] __rcu *funcs
   include/trace/hooks/mm.h:21:1: sparse: sparse: incorrect type in assignm=
ent (different address spaces) @@     expected struct tracepoint_func *it_f=
unc_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/mm.h:21:1: sparse:     expected struct tracepoint_fu=
nc *it_func_ptr
   include/trace/hooks/mm.h:21:1: sparse:     got struct tracepoint_func [n=
oderef] __rcu *funcs
   include/trace/hooks/mm.h:24:1: sparse: sparse: incorrect type in assignm=
ent (different address spaces) @@     expected struct tracepoint_func *it_f=
unc_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/mm.h:24:1: sparse:     expected struct tracepoint_fu=
nc *it_func_ptr
   include/trace/hooks/mm.h:24:1: sparse:     got struct tracepoint_func [n=
oderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/=
trace/define_trace.h, include/trace/hooks/preemptirq.h):
   include/trace/hooks/preemptirq.h:13:1: sparse: sparse: incorrect type in=
 assignment (different address spaces) @@     expected struct tracepoint_fu=
nc *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/preemptirq.h:13:1: sparse:     expected struct trace=
point_func *it_func_ptr
   include/trace/hooks/preemptirq.h:13:1: sparse:     got struct tracepoint=
_func [noderef] __rcu *funcs
   include/trace/hooks/preemptirq.h:17:1: sparse: sparse: incorrect type in=
 assignment (different address spaces) @@     expected struct tracepoint_fu=
nc *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/preemptirq.h:17:1: sparse:     expected struct trace=
point_func *it_func_ptr
   include/trace/hooks/preemptirq.h:17:1: sparse:     got struct tracepoint=
_func [noderef] __rcu *funcs
   include/trace/hooks/preemptirq.h:21:1: sparse: sparse: incorrect type in=
 assignment (different address spaces) @@     expected struct tracepoint_fu=
nc *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/preemptirq.h:21:1: sparse:     expected struct trace=
point_func *it_func_ptr
   include/trace/hooks/preemptirq.h:21:1: sparse:     got struct tracepoint=
_func [noderef] __rcu *funcs
   include/trace/hooks/preemptirq.h:25:1: sparse: sparse: incorrect type in=
 assignment (different address spaces) @@     expected struct tracepoint_fu=
nc *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/preemptirq.h:25:1: sparse:     expected struct trace=
point_func *it_func_ptr
   include/trace/hooks/preemptirq.h:25:1: sparse:     got struct tracepoint=
_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/=
trace/define_trace.h, include/trace/hooks/cgroup.h):
   include/trace/hooks/cgroup.h:27:1: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct tracepoint_func *=
it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/cgroup.h:27:1: sparse:     expected struct tracepoin=
t_func *it_func_ptr
   include/trace/hooks/cgroup.h:27:1: sparse:     got struct tracepoint_fun=
c [noderef] __rcu *funcs
   include/trace/hooks/cgroup.h:38:1: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct tracepoint_func *=
it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/cgroup.h:38:1: sparse:     expected struct tracepoin=
t_func *it_func_ptr
   include/trace/hooks/cgroup.h:38:1: sparse:     got struct tracepoint_fun=
c [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/=
trace/define_trace.h, include/trace/hooks/iommu.h):
   include/trace/hooks/iommu.h:16:1: sparse: sparse: incorrect type in assi=
gnment (different address spaces) @@     expected struct tracepoint_func *i=
t_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/iommu.h:16:1: sparse:     expected struct tracepoint=
_func *it_func_ptr
   include/trace/hooks/iommu.h:16:1: sparse:     got struct tracepoint_func=
 [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/=
trace/define_trace.h, include/trace/hooks/net.h):
   include/trace/hooks/net.h:25:1: sparse: sparse: incorrect type in assign=
ment (different address spaces) @@     expected struct tracepoint_func *it_=
func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/net.h:25:1: sparse:     expected struct tracepoint_f=
unc *it_func_ptr
   include/trace/hooks/net.h:25:1: sparse:     got struct tracepoint_func [=
noderef] __rcu *funcs
   include/trace/hooks/net.h:27:1: sparse: sparse: incorrect type in assign=
ment (different address spaces) @@     expected struct tracepoint_func *it_=
func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/net.h:27:1: sparse:     expected struct tracepoint_f=
unc *it_func_ptr
   include/trace/hooks/net.h:27:1: sparse:     got struct tracepoint_func [=
noderef] __rcu *funcs
   include/trace/hooks/net.h:29:1: sparse: sparse: incorrect type in assign=
ment (different address spaces) @@     expected struct tracepoint_func *it_=
func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/net.h:29:1: sparse:     expected struct tracepoint_f=
unc *it_func_ptr
   include/trace/hooks/net.h:29:1: sparse:     got struct tracepoint_func [=
noderef] __rcu *funcs
   include/trace/hooks/net.h:31:1: sparse: sparse: incorrect type in assign=
ment (different address spaces) @@     expected struct tracepoint_func *it_=
func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/net.h:31:1: sparse:     expected struct tracepoint_f=
unc *it_func_ptr
   include/trace/hooks/net.h:31:1: sparse:     got struct tracepoint_func [=
noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/=
trace/define_trace.h, include/trace/hooks/vmscan.h):
   include/trace/hooks/vmscan.h:12:1: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct tracepoint_func *=
it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/vmscan.h:12:1: sparse:     expected struct tracepoin=
t_func *it_func_ptr
   include/trace/hooks/vmscan.h:12:1: sparse:     got struct tracepoint_fun=
c [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/=
trace/define_trace.h, include/trace/hooks/avc.h):
   include/trace/hooks/avc.h:14:1: sparse: sparse: incorrect type in assign=
ment (different address spaces) @@     expected struct tracepoint_func *it_=
func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/avc.h:14:1: sparse:     expected struct tracepoint_f=
unc *it_func_ptr
   include/trace/hooks/avc.h:14:1: sparse:     got struct tracepoint_func [=
noderef] __rcu *funcs
   include/trace/hooks/avc.h:18:1: sparse: sparse: incorrect type in assign=
ment (different address spaces) @@     expected struct tracepoint_func *it_=
func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/avc.h:18:1: sparse:     expected struct tracepoint_f=
unc *it_func_ptr
   include/trace/hooks/avc.h:18:1: sparse:     got struct tracepoint_func [=
noderef] __rcu *funcs
   include/trace/hooks/avc.h:22:1: sparse: sparse: incorrect type in assign=
ment (different address spaces) @@     expected struct tracepoint_func *it_=
func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/avc.h:22:1: sparse:     expected struct tracepoint_f=
unc *it_func_ptr
   include/trace/hooks/avc.h:22:1: sparse:     got struct tracepoint_func [=
noderef] __rcu *funcs
   include/trace/hooks/avc.h:26:1: sparse: sparse: too many warnings

vim +22 include/trace/hooks/topology.h

e209b3b88d9772ec Yun Hsiang             2020-08-13  12  =

e209b3b88d9772ec Yun Hsiang             2020-08-13  13  DECLARE_HOOK(androi=
d_vh_arch_set_freq_scale,
2f33651bdfae027a Greg Kroah-Hartman     2020-10-25  14  	TP_PROTO(const str=
uct cpumask *cpus, unsigned long freq,
2f33651bdfae027a Greg Kroah-Hartman     2020-10-25  15  		 unsigned long ma=
x, unsigned long *scale),
07f80e7c1e5f6a34 Yun Hsiang             2020-08-31  16  	TP_ARGS(cpus, freq=
, max, scale));
e209b3b88d9772ec Yun Hsiang             2020-08-13  17  =

93c605314b4232f9 Abhijeet Dharmapurikar 2021-05-04  18  DECLARE_HOOK(androi=
d_vh_update_topology_flags_workfn,
93c605314b4232f9 Abhijeet Dharmapurikar 2021-05-04  19  	TP_PROTO(void *unu=
sed),
93c605314b4232f9 Abhijeet Dharmapurikar 2021-05-04  20  	TP_ARGS(unused));
93c605314b4232f9 Abhijeet Dharmapurikar 2021-05-04  21  =

8c802d3f5ca471a5 Shaleen Agrawal        2021-10-21 @22  DECLARE_RESTRICTED_=
HOOK(android_rvh_update_thermal_stats,
8c802d3f5ca471a5 Shaleen Agrawal        2021-10-21  23  	TP_PROTO(int cpu),
8c802d3f5ca471a5 Shaleen Agrawal        2021-10-21  24  	TP_ARGS(cpu), 1);
8c802d3f5ca471a5 Shaleen Agrawal        2021-10-21  25  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2961550265556124493==--

