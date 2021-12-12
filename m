Content-Type: multipart/mixed; boundary="===============2317226517888255616=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [android-common:android12-5.10 13773/13830] include/trace/hooks/binder.h:55:1: sparse: sparse: incorrect type in assignment (different address spaces)
Date: Sun, 12 Dec 2021 20:08:19 +0800
Message-ID: <202112122033.MQ1xJvAW-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2317226517888255616==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: cros-kernel-buildreports(a)googlegroups.com

tree:   https://android.googlesource.com/kernel/common android12-5.10
head:   2d6a43c0364d3bb0c5c00b0a32b27f4c7740e004
commit: 2f3f5731de0536a6a1048ae01e129cebec48e664 [13773/13830] ANDROID: GKI=
: Add vendor hook to binder transaction
:::::: branch date: 2 days ago
:::::: commit date: 4 weeks ago
config: x86_64-randconfig-s021-20211207 (https://download.01.org/0day-ci/ar=
chive/20211212/202112122033.MQ1xJvAW-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        git remote add android-common https://android.googlesource.com/kern=
el/common
        git fetch --no-tags android-common android12-5.10
        git checkout 2f3f5731de0536a6a1048ae01e129cebec48e664
        # save the config file to linux build tree
        mkdir build_dir
        make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3D=
build_dir ARCH=3Dx86_64 SHELL=3D/bin/bash drivers/android/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
   include/trace/hooks/sched.h:177:1: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct tracepoint_func *=
it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:177:1: sparse:     expected struct tracepoin=
t_func *it_func_ptr
   include/trace/hooks/sched.h:177:1: sparse:     got struct tracepoint_fun=
c [noderef] __rcu *funcs
   include/trace/hooks/sched.h:182:1: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct tracepoint_func *=
it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:182:1: sparse:     expected struct tracepoin=
t_func *it_func_ptr
   include/trace/hooks/sched.h:182:1: sparse:     got struct tracepoint_fun=
c [noderef] __rcu *funcs
   include/trace/hooks/sched.h:186:1: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct tracepoint_func *=
it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:186:1: sparse:     expected struct tracepoin=
t_func *it_func_ptr
   include/trace/hooks/sched.h:186:1: sparse:     got struct tracepoint_fun=
c [noderef] __rcu *funcs
   include/trace/hooks/sched.h:190:1: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct tracepoint_func *=
it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:190:1: sparse:     expected struct tracepoin=
t_func *it_func_ptr
   include/trace/hooks/sched.h:190:1: sparse:     got struct tracepoint_fun=
c [noderef] __rcu *funcs
   include/trace/hooks/sched.h:194:1: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct tracepoint_func *=
it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:194:1: sparse:     expected struct tracepoin=
t_func *it_func_ptr
   include/trace/hooks/sched.h:194:1: sparse:     got struct tracepoint_fun=
c [noderef] __rcu *funcs
   include/trace/hooks/sched.h:199:1: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct tracepoint_func *=
it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:199:1: sparse:     expected struct tracepoin=
t_func *it_func_ptr
   include/trace/hooks/sched.h:199:1: sparse:     got struct tracepoint_fun=
c [noderef] __rcu *funcs
   include/trace/hooks/sched.h:203:1: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct tracepoint_func *=
it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:203:1: sparse:     expected struct tracepoin=
t_func *it_func_ptr
   include/trace/hooks/sched.h:203:1: sparse:     got struct tracepoint_fun=
c [noderef] __rcu *funcs
   include/trace/hooks/sched.h:208:1: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct tracepoint_func *=
it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:208:1: sparse:     expected struct tracepoin=
t_func *it_func_ptr
   include/trace/hooks/sched.h:208:1: sparse:     got struct tracepoint_fun=
c [noderef] __rcu *funcs
   include/trace/hooks/sched.h:212:1: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct tracepoint_func *=
it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:212:1: sparse:     expected struct tracepoin=
t_func *it_func_ptr
   include/trace/hooks/sched.h:212:1: sparse:     got struct tracepoint_fun=
c [noderef] __rcu *funcs
   include/trace/hooks/sched.h:216:1: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct tracepoint_func *=
it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:216:1: sparse:     expected struct tracepoin=
t_func *it_func_ptr
   include/trace/hooks/sched.h:216:1: sparse:     got struct tracepoint_fun=
c [noderef] __rcu *funcs
   include/trace/hooks/sched.h:220:1: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct tracepoint_func *=
it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:220:1: sparse:     expected struct tracepoin=
t_func *it_func_ptr
   include/trace/hooks/sched.h:220:1: sparse:     got struct tracepoint_fun=
c [noderef] __rcu *funcs
   include/trace/hooks/sched.h:224:1: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct tracepoint_func *=
it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:224:1: sparse:     expected struct tracepoin=
t_func *it_func_ptr
   include/trace/hooks/sched.h:224:1: sparse:     got struct tracepoint_fun=
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
   include/trace/hooks/sched.h:251:1: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct tracepoint_func *=
it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:251:1: sparse:     expected struct tracepoin=
t_func *it_func_ptr
   include/trace/hooks/sched.h:251:1: sparse:     got struct tracepoint_fun=
c [noderef] __rcu *funcs
   include/trace/hooks/sched.h:256:1: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct tracepoint_func *=
it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:256:1: sparse:     expected struct tracepoin=
t_func *it_func_ptr
   include/trace/hooks/sched.h:256:1: sparse:     got struct tracepoint_fun=
c [noderef] __rcu *funcs
   include/trace/hooks/sched.h:273:1: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct tracepoint_func *=
it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:273:1: sparse:     expected struct tracepoin=
t_func *it_func_ptr
   include/trace/hooks/sched.h:273:1: sparse:     got struct tracepoint_fun=
c [noderef] __rcu *funcs
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
   include/trace/hooks/sched.h:381:1: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct tracepoint_func *=
it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:381:1: sparse:     expected struct tracepoin=
t_func *it_func_ptr
   include/trace/hooks/sched.h:381:1: sparse:     got struct tracepoint_fun=
c [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/=
trace/define_trace.h, include/trace/hooks/binder.h):
>> include/trace/hooks/binder.h:55:1: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct tracepoint_func *=
it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/binder.h:55:1: sparse:     expected struct tracepoin=
t_func *it_func_ptr
   include/trace/hooks/binder.h:55:1: sparse:     got struct tracepoint_fun=
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
   include/trace/hooks/ufshcd.h:22:1: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct tracepoint_func *=
it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/ufshcd.h:22:1: sparse:     expected struct tracepoin=
t_func *it_func_ptr
   include/trace/hooks/ufshcd.h:22:1: sparse:     got struct tracepoint_fun=
c [noderef] __rcu *funcs
   include/trace/hooks/ufshcd.h:26:1: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct tracepoint_func *=
it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/ufshcd.h:26:1: sparse:     expected struct tracepoin=
t_func *it_func_ptr
   include/trace/hooks/ufshcd.h:26:1: sparse:     got struct tracepoint_fun=
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
   include/trace/hooks/traps.h:25:1: sparse: sparse: incorrect type in assi=
gnment (different address spaces) @@     expected struct tracepoint_func *i=
t_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/traps.h:25:1: sparse:     expected struct tracepoint=
_func *it_func_ptr
   include/trace/hooks/traps.h:25:1: sparse:     got struct tracepoint_func=
 [noderef] __rcu *funcs
   include/trace/hooks/traps.h:30:1: sparse: sparse: incorrect type in assi=
gnment (different address spaces) @@     expected struct tracepoint_func *i=
t_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/traps.h:30:1: sparse:     expected struct tracepoint=
_func *it_func_ptr
   include/trace/hooks/traps.h:30:1: sparse:     got struct tracepoint_func=
 [noderef] __rcu *funcs
   include/trace/hooks/traps.h:34:1: sparse: sparse: incorrect type in assi=
gnment (different address spaces) @@     expected struct tracepoint_func *i=
t_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/traps.h:34:1: sparse:     expected struct tracepoint=
_func *it_func_ptr
   include/trace/hooks/traps.h:34:1: sparse:     got struct tracepoint_func=
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
--
   drivers/android/binder.c:1373:70: sparse: sparse: Using plain integer as=
 NULL pointer
   drivers/android/binder.c:2520:41: sparse: sparse: Using plain integer as=
 NULL pointer
   drivers/android/binder.c:4624:24: sparse: sparse: incorrect type in retu=
rn expression (different base types) @@     expected restricted __poll_t @@=
     got int @@
   drivers/android/binder.c:4624:24: sparse:     expected restricted __poll=
_t
   drivers/android/binder.c:4624:24: sparse:     got int
   drivers/android/binder.c: note: in included file:
>> include/trace/hooks/binder.h:55:1: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct tracepoint_func *=
it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/binder.h:55:1: sparse:     expected struct tracepoin=
t_func *it_func_ptr
   include/trace/hooks/binder.h:55:1: sparse:     got struct tracepoint_fun=
c [noderef] __rcu *funcs

vim +55 include/trace/hooks/binder.h

2f3f5731de0536 Liangliang Li  2021-11-10 @55  DECLARE_RESTRICTED_HOOK(andro=
id_rvh_binder_transaction,
2f3f5731de0536 Liangliang Li  2021-11-10  56  	TP_PROTO(struct binder_proc =
*target_proc, struct binder_proc *proc,
2f3f5731de0536 Liangliang Li  2021-11-10  57  		struct binder_thread *threa=
d, struct binder_transaction_data *tr),
2f3f5731de0536 Liangliang Li  2021-11-10  58  	TP_ARGS(target_proc, proc, t=
hread, tr), 1);
301e89472f3e00 Zhuguangqing   2021-03-09  59  DECLARE_HOOK(android_vh_binde=
r_preset,
301e89472f3e00 Zhuguangqing   2021-03-09  60  	TP_PROTO(struct hlist_head *=
hhead, struct mutex *lock),
301e89472f3e00 Zhuguangqing   2021-03-09  61  	TP_ARGS(hhead, lock));
35014985c266fa zhengding chen 2021-04-28  62  DECLARE_HOOK(android_vh_binde=
r_proc_transaction,
35014985c266fa zhengding chen 2021-04-28  63  	TP_PROTO(struct task_struct =
*caller_task, struct task_struct *binder_proc_task,
35014985c266fa zhengding chen 2021-04-28  64  		struct task_struct *binder_=
th_task, int node_debug_id,
35014985c266fa zhengding chen 2021-04-28  65  		unsigned int code, bool pen=
ding_async),
35014985c266fa zhengding chen 2021-04-28  66  	TP_ARGS(caller_task, binder_=
proc_task, binder_th_task, node_debug_id, code, pending_async));
35014985c266fa zhengding chen 2021-04-28  67  DECLARE_HOOK(android_vh_binde=
r_new_ref,
35014985c266fa zhengding chen 2021-04-28  68  	TP_PROTO(struct task_struct =
*proc, uint32_t ref_desc, int node_debug_id),
35014985c266fa zhengding chen 2021-04-28  69  	TP_ARGS(proc, ref_desc, node=
_debug_id));
35014985c266fa zhengding chen 2021-04-28  70  DECLARE_HOOK(android_vh_binde=
r_del_ref,
35014985c266fa zhengding chen 2021-04-28  71  	TP_PROTO(struct task_struct =
*proc, uint32_t ref_desc),
35014985c266fa zhengding chen 2021-04-28  72  	TP_ARGS(proc, ref_desc));
eabe9707f264c8 zhang chuang   2021-06-16  73  DECLARE_HOOK(android_vh_binde=
r_print_transaction_info,
eabe9707f264c8 zhang chuang   2021-06-16  74  	TP_PROTO(struct seq_file *m,=
 struct binder_proc *proc,
eabe9707f264c8 zhang chuang   2021-06-16  75  		 const char *prefix, struct=
 binder_transaction *t),
eabe9707f264c8 zhang chuang   2021-06-16  76  	TP_ARGS(m, proc, prefix, t));
301e89472f3e00 Zhuguangqing   2021-03-09  77  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2317226517888255616==--

