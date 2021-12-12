Content-Type: multipart/mixed; boundary="===============6866842236806463636=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [android-common:android12-5.10 12515/13830] include/trace/hooks/ufshcd.h:22:1: sparse: sparse: incorrect type in assignment (different address spaces)
Date: Sun, 12 Dec 2021 18:36:50 +0800
Message-ID: <202112121802.U4d3U3XJ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6866842236806463636==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: cros-kernel-buildreports(a)googlegroups.com

tree:   https://android.googlesource.com/kernel/common android12-5.10
head:   2d6a43c0364d3bb0c5c00b0a32b27f4c7740e004
commit: e2e063f5074e2e14a96875e5e5670314a41e1c34 [12515/13830] ANDROID: scs=
i: ufs: add vendor hook to override key reprogramming
:::::: branch date: 2 days ago
:::::: commit date: 5 months ago
config: x86_64-randconfig-s021-20211207 (https://download.01.org/0day-ci/ar=
chive/20211212/202112121802.U4d3U3XJ-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        git remote add android-common https://android.googlesource.com/kern=
el/common
        git fetch --no-tags android-common android12-5.10
        git checkout e2e063f5074e2e14a96875e5e5670314a41e1c34
        # save the config file to linux build tree
        mkdir build_dir
        make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3D=
build_dir ARCH=3Dx86_64 SHELL=3D/bin/bash drivers/android/ drivers/pci/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
   include/trace/hooks/sched.h:281:1: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct tracepoint_func *=
it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:281:1: sparse:     expected struct tracepoin=
t_func *it_func_ptr
   include/trace/hooks/sched.h:281:1: sparse:     got struct tracepoint_fun=
c [noderef] __rcu *funcs
   include/trace/hooks/sched.h:286:1: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct tracepoint_func *=
it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:286:1: sparse:     expected struct tracepoin=
t_func *it_func_ptr
   include/trace/hooks/sched.h:286:1: sparse:     got struct tracepoint_fun=
c [noderef] __rcu *funcs
   include/trace/hooks/sched.h:289:1: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct tracepoint_func *=
it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:289:1: sparse:     expected struct tracepoin=
t_func *it_func_ptr
   include/trace/hooks/sched.h:289:1: sparse:     got struct tracepoint_fun=
c [noderef] __rcu *funcs
   include/trace/hooks/sched.h:294:1: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct tracepoint_func *=
it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:294:1: sparse:     expected struct tracepoin=
t_func *it_func_ptr
   include/trace/hooks/sched.h:294:1: sparse:     got struct tracepoint_fun=
c [noderef] __rcu *funcs
   include/trace/hooks/sched.h:306:1: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct tracepoint_func *=
it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:306:1: sparse:     expected struct tracepoin=
t_func *it_func_ptr
   include/trace/hooks/sched.h:306:1: sparse:     got struct tracepoint_fun=
c [noderef] __rcu *funcs
   include/trace/hooks/sched.h:310:1: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct tracepoint_func *=
it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:310:1: sparse:     expected struct tracepoin=
t_func *it_func_ptr
   include/trace/hooks/sched.h:310:1: sparse:     got struct tracepoint_fun=
c [noderef] __rcu *funcs
   include/trace/hooks/sched.h:322:1: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct tracepoint_func *=
it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:322:1: sparse:     expected struct tracepoin=
t_func *it_func_ptr
   include/trace/hooks/sched.h:322:1: sparse:     got struct tracepoint_fun=
c [noderef] __rcu *funcs
   include/trace/hooks/sched.h:326:1: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct tracepoint_func *=
it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:326:1: sparse:     expected struct tracepoin=
t_func *it_func_ptr
   include/trace/hooks/sched.h:326:1: sparse:     got struct tracepoint_fun=
c [noderef] __rcu *funcs
   include/trace/hooks/sched.h:333:1: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct tracepoint_func *=
it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:333:1: sparse:     expected struct tracepoin=
t_func *it_func_ptr
   include/trace/hooks/sched.h:333:1: sparse:     got struct tracepoint_fun=
c [noderef] __rcu *funcs
   include/trace/hooks/sched.h:337:1: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct tracepoint_func *=
it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:337:1: sparse:     expected struct tracepoin=
t_func *it_func_ptr
   include/trace/hooks/sched.h:337:1: sparse:     got struct tracepoint_fun=
c [noderef] __rcu *funcs
   include/trace/hooks/sched.h:341:1: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct tracepoint_func *=
it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:341:1: sparse:     expected struct tracepoin=
t_func *it_func_ptr
   include/trace/hooks/sched.h:341:1: sparse:     got struct tracepoint_fun=
c [noderef] __rcu *funcs
   include/trace/hooks/sched.h:345:1: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct tracepoint_func *=
it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:345:1: sparse:     expected struct tracepoin=
t_func *it_func_ptr
   include/trace/hooks/sched.h:345:1: sparse:     got struct tracepoint_fun=
c [noderef] __rcu *funcs
   include/trace/hooks/sched.h:349:1: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct tracepoint_func *=
it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:349:1: sparse:     expected struct tracepoin=
t_func *it_func_ptr
   include/trace/hooks/sched.h:349:1: sparse:     got struct tracepoint_fun=
c [noderef] __rcu *funcs
   include/trace/hooks/sched.h:369:1: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct tracepoint_func *=
it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:369:1: sparse:     expected struct tracepoin=
t_func *it_func_ptr
   include/trace/hooks/sched.h:369:1: sparse:     got struct tracepoint_fun=
c [noderef] __rcu *funcs
   include/trace/hooks/sched.h:373:1: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct tracepoint_func *=
it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:373:1: sparse:     expected struct tracepoin=
t_func *it_func_ptr
   include/trace/hooks/sched.h:373:1: sparse:     got struct tracepoint_fun=
c [noderef] __rcu *funcs
   include/trace/hooks/sched.h:377:1: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct tracepoint_func *=
it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:377:1: sparse:     expected struct tracepoin=
t_func *it_func_ptr
   include/trace/hooks/sched.h:377:1: sparse:     got struct tracepoint_fun=
c [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/=
trace/define_trace.h, include/trace/hooks/gic_v3.h):
   include/trace/hooks/gic_v3.h:18:1: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct tracepoint_func *=
it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/gic_v3.h:18:1: sparse:     expected struct tracepoin=
t_func *it_func_ptr
   include/trace/hooks/gic_v3.h:18:1: sparse:     got struct tracepoint_fun=
c [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/=
trace/define_trace.h, include/trace/hooks/cpufreq.h):
   include/trace/hooks/cpufreq.h:14:1: sparse: sparse: incorrect type in as=
signment (different address spaces) @@     expected struct tracepoint_func =
*it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/cpufreq.h:14:1: sparse:     expected struct tracepoi=
nt_func *it_func_ptr
   include/trace/hooks/cpufreq.h:14:1: sparse:     got struct tracepoint_fu=
nc [noderef] __rcu *funcs
   include/trace/hooks/cpufreq.h:31:1: sparse: sparse: incorrect type in as=
signment (different address spaces) @@     expected struct tracepoint_func =
*it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/cpufreq.h:31:1: sparse:     expected struct tracepoi=
nt_func *it_func_ptr
   include/trace/hooks/cpufreq.h:31:1: sparse:     got struct tracepoint_fu=
nc [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/=
trace/define_trace.h, include/trace/hooks/mm.h):
   include/trace/hooks/mm.h:19:1: sparse: sparse: incorrect type in assignm=
ent (different address spaces) @@     expected struct tracepoint_func *it_f=
unc_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/mm.h:19:1: sparse:     expected struct tracepoint_fu=
nc *it_func_ptr
   include/trace/hooks/mm.h:19:1: sparse:     got struct tracepoint_func [n=
oderef] __rcu *funcs
   include/trace/hooks/mm.h:22:1: sparse: sparse: incorrect type in assignm=
ent (different address spaces) @@     expected struct tracepoint_func *it_f=
unc_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/mm.h:22:1: sparse:     expected struct tracepoint_fu=
nc *it_func_ptr
   include/trace/hooks/mm.h:22:1: sparse:     got struct tracepoint_func [n=
oderef] __rcu *funcs
   include/trace/hooks/mm.h:25:1: sparse: sparse: incorrect type in assignm=
ent (different address spaces) @@     expected struct tracepoint_func *it_f=
unc_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/mm.h:25:1: sparse:     expected struct tracepoint_fu=
nc *it_func_ptr
   include/trace/hooks/mm.h:25:1: sparse:     got struct tracepoint_func [n=
oderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/=
trace/define_trace.h, include/trace/hooks/preemptirq.h):
   include/trace/hooks/preemptirq.h:14:1: sparse: sparse: incorrect type in=
 assignment (different address spaces) @@     expected struct tracepoint_fu=
nc *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/preemptirq.h:14:1: sparse:     expected struct trace=
point_func *it_func_ptr
   include/trace/hooks/preemptirq.h:14:1: sparse:     got struct tracepoint=
_func [noderef] __rcu *funcs
   include/trace/hooks/preemptirq.h:18:1: sparse: sparse: incorrect type in=
 assignment (different address spaces) @@     expected struct tracepoint_fu=
nc *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/preemptirq.h:18:1: sparse:     expected struct trace=
point_func *it_func_ptr
   include/trace/hooks/preemptirq.h:18:1: sparse:     got struct tracepoint=
_func [noderef] __rcu *funcs
   include/trace/hooks/preemptirq.h:22:1: sparse: sparse: incorrect type in=
 assignment (different address spaces) @@     expected struct tracepoint_fu=
nc *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/preemptirq.h:22:1: sparse:     expected struct trace=
point_func *it_func_ptr
   include/trace/hooks/preemptirq.h:22:1: sparse:     got struct tracepoint=
_func [noderef] __rcu *funcs
   include/trace/hooks/preemptirq.h:26:1: sparse: sparse: incorrect type in=
 assignment (different address spaces) @@     expected struct tracepoint_fu=
nc *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/preemptirq.h:26:1: sparse:     expected struct trace=
point_func *it_func_ptr
   include/trace/hooks/preemptirq.h:26:1: sparse:     got struct tracepoint=
_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/=
trace/define_trace.h, include/trace/hooks/bug.h):
   include/trace/hooks/bug.h:14:1: sparse: sparse: incorrect type in assign=
ment (different address spaces) @@     expected struct tracepoint_func *it_=
func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/bug.h:14:1: sparse:     expected struct tracepoint_f=
unc *it_func_ptr
   include/trace/hooks/bug.h:14:1: sparse:     got struct tracepoint_func [=
noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/=
trace/define_trace.h, include/trace/hooks/fault.h):
   include/trace/hooks/fault.h:15:1: sparse: sparse: incorrect type in assi=
gnment (different address spaces) @@     expected struct tracepoint_func *i=
t_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/fault.h:15:1: sparse:     expected struct tracepoint=
_func *it_func_ptr
   include/trace/hooks/fault.h:15:1: sparse:     got struct tracepoint_func=
 [noderef] __rcu *funcs
   include/trace/hooks/fault.h:19:1: sparse: sparse: incorrect type in assi=
gnment (different address spaces) @@     expected struct tracepoint_func *i=
t_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/fault.h:19:1: sparse:     expected struct tracepoint=
_func *it_func_ptr
   include/trace/hooks/fault.h:19:1: sparse:     got struct tracepoint_func=
 [noderef] __rcu *funcs
   include/trace/hooks/fault.h:23:1: sparse: sparse: incorrect type in assi=
gnment (different address spaces) @@     expected struct tracepoint_func *i=
t_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/fault.h:23:1: sparse:     expected struct tracepoint=
_func *it_func_ptr
   include/trace/hooks/fault.h:23:1: sparse:     got struct tracepoint_func=
 [noderef] __rcu *funcs
   include/trace/hooks/fault.h:27:1: sparse: sparse: incorrect type in assi=
gnment (different address spaces) @@     expected struct tracepoint_func *i=
t_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/fault.h:27:1: sparse:     expected struct tracepoint=
_func *it_func_ptr
   include/trace/hooks/fault.h:27:1: sparse:     got struct tracepoint_func=
 [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/=
trace/define_trace.h, include/trace/hooks/ufshcd.h):
>> include/trace/hooks/ufshcd.h:22:1: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct tracepoint_func *=
it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/ufshcd.h:22:1: sparse:     expected struct tracepoin=
t_func *it_func_ptr
   include/trace/hooks/ufshcd.h:22:1: sparse:     got struct tracepoint_fun=
c [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/=
trace/define_trace.h, include/trace/hooks/cgroup.h):
   include/trace/hooks/cgroup.h:15:1: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct tracepoint_func *=
it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/cgroup.h:15:1: sparse:     expected struct tracepoin=
t_func *it_func_ptr
   include/trace/hooks/cgroup.h:15:1: sparse:     got struct tracepoint_fun=
c [noderef] __rcu *funcs
   include/trace/hooks/cgroup.h:18:1: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct tracepoint_func *=
it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/cgroup.h:18:1: sparse:     expected struct tracepoin=
t_func *it_func_ptr
   include/trace/hooks/cgroup.h:18:1: sparse:     got struct tracepoint_fun=
c [noderef] __rcu *funcs
   include/trace/hooks/cgroup.h:21:1: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct tracepoint_func *=
it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/cgroup.h:21:1: sparse:     expected struct tracepoin=
t_func *it_func_ptr
   include/trace/hooks/cgroup.h:21:1: sparse:     got struct tracepoint_fun=
c [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/=
trace/define_trace.h, include/trace/hooks/traps.h):
   include/trace/hooks/traps.h:15:1: sparse: sparse: incorrect type in assi=
gnment (different address spaces) @@     expected struct tracepoint_func *i=
t_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/traps.h:15:1: sparse:     expected struct tracepoint=
_func *it_func_ptr
   include/trace/hooks/traps.h:15:1: sparse:     got struct tracepoint_func=
 [noderef] __rcu *funcs
   include/trace/hooks/traps.h:20:1: sparse: sparse: incorrect type in assi=
gnment (different address spaces) @@     expected struct tracepoint_func *i=
t_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/traps.h:20:1: sparse:     expected struct tracepoint=
_func *it_func_ptr
   include/trace/hooks/traps.h:20:1: sparse:     got struct tracepoint_func=
 [noderef] __rcu *funcs
   include/trace/hooks/traps.h:24:1: sparse: sparse: incorrect type in assi=
gnment (different address spaces) @@     expected struct tracepoint_func *i=
t_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/traps.h:24:1: sparse:     expected struct tracepoint=
_func *it_func_ptr
   include/trace/hooks/traps.h:24:1: sparse:     got struct tracepoint_func=
 [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/=
trace/define_trace.h, include/trace/hooks/typec.h):
   include/trace/hooks/typec.h:32:1: sparse: sparse: incorrect type in assi=
gnment (different address spaces) @@     expected struct tracepoint_func *i=
t_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/typec.h:32:1: sparse:     expected struct tracepoint=
_func *it_func_ptr
   include/trace/hooks/typec.h:32:1: sparse:     got struct tracepoint_func=
 [noderef] __rcu *funcs
   include/trace/hooks/typec.h:43:1: sparse: sparse: incorrect type in assi=
gnment (different address spaces) @@     expected struct tracepoint_func *i=
t_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/typec.h:43:1: sparse:     expected struct tracepoint=
_func *it_func_ptr
   include/trace/hooks/typec.h:43:1: sparse:     got struct tracepoint_func=
 [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/=
trace/define_trace.h, include/trace/hooks/vmscan.h):
   include/trace/hooks/vmscan.h:28:1: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct tracepoint_func *=
it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/vmscan.h:28:1: sparse:     expected struct tracepoin=
t_func *it_func_ptr
   include/trace/hooks/vmscan.h:28:1: sparse:     got struct tracepoint_fun=
c [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/=
trace/define_trace.h, include/trace/hooks/v4l2core.h):
   include/trace/hooks/v4l2core.h:47:1: sparse: sparse: incorrect type in a=
ssignment (different address spaces) @@     expected struct tracepoint_func=
 *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/v4l2core.h:47:1: sparse:     expected struct tracepo=
int_func *it_func_ptr
   include/trace/hooks/v4l2core.h:47:1: sparse:     got struct tracepoint_f=
unc [noderef] __rcu *funcs
   include/trace/hooks/v4l2core.h:52:1: sparse: sparse: incorrect type in a=
ssignment (different address spaces) @@     expected struct tracepoint_func=
 *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/v4l2core.h:52:1: sparse:     expected struct tracepo=
int_func *it_func_ptr
   include/trace/hooks/v4l2core.h:52:1: sparse:     got struct tracepoint_f=
unc [noderef] __rcu *funcs
   include/trace/hooks/v4l2core.h:57:1: sparse: sparse: incorrect type in a=
ssignment (different address spaces) @@     expected struct tracepoint_func=
 *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/v4l2core.h:57:1: sparse:     expected struct tracepo=
int_func *it_func_ptr
   include/trace/hooks/v4l2core.h:57:1: sparse:     got struct tracepoint_f=
unc [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/=
trace/define_trace.h, include/trace/hooks/v4l2mc.h):
   include/trace/hooks/v4l2mc.h:19:1: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct tracepoint_func *=
it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/v4l2mc.h:19:1: sparse:     expected struct tracepoin=
t_func *it_func_ptr
   include/trace/hooks/v4l2mc.h:19:1: sparse:     got struct tracepoint_fun=
c [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/=
trace/define_trace.h, include/trace/hooks/net.h):
   include/trace/hooks/net.h:23:1: sparse: sparse: incorrect type in assign=
ment (different address spaces) @@     expected struct tracepoint_func *it_=
func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/net.h:23:1: sparse:     expected struct tracepoint_f=
unc *it_func_ptr
   include/trace/hooks/net.h:23:1: sparse:     got struct tracepoint_func [=
noderef] __rcu *funcs
   include/trace/hooks/net.h:25:1: sparse: sparse: incorrect type in assign=
ment (different address spaces) @@     expected struct tracepoint_func *it_=
func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/net.h:25:1: sparse:     expected struct tracepoint_f=
unc *it_func_ptr
   include/trace/hooks/net.h:25:1: sparse:     got struct tracepoint_func [=
noderef] __rcu *funcs
   include/trace/hooks/net.h:27:1: sparse: sparse: too many warnings

vim +22 include/trace/hooks/ufshcd.h

1cfa4b71bebe6b Eric Biggers 2021-03-01  16  =

1cfa4b71bebe6b Eric Biggers 2021-03-01  17  DECLARE_HOOK(android_vh_ufs_fil=
l_prdt,
1cfa4b71bebe6b Eric Biggers 2021-03-01  18  	TP_PROTO(struct ufs_hba *hba, =
struct ufshcd_lrb *lrbp,
1cfa4b71bebe6b Eric Biggers 2021-03-01  19  		 unsigned int segments, int *=
err),
1cfa4b71bebe6b Eric Biggers 2021-03-01  20  	TP_ARGS(hba, lrbp, segments, e=
rr));
1cfa4b71bebe6b Eric Biggers 2021-03-01  21  =

e2e063f5074e2e Eric Biggers 2021-07-26 @22  DECLARE_RESTRICTED_HOOK(android=
_rvh_ufs_reprogram_all_keys,
e2e063f5074e2e Eric Biggers 2021-07-26  23  			TP_PROTO(struct ufs_hba *hba=
, int *err),
e2e063f5074e2e Eric Biggers 2021-07-26  24  			TP_ARGS(hba, err), 1);
e2e063f5074e2e Eric Biggers 2021-07-26  25  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6866842236806463636==--

