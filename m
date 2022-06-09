Content-Type: multipart/mixed; boundary="===============8892497086954666201=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: net/ipv4/tcp_bpf.c:169:2: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
Date: Thu, 09 Jun 2022 21:25:52 +0800
Message-ID: <202206092123.j3kzhjND-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8892497086954666201==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: net/ipv4/=
tcp_bpf.c:169:2: warning: Dereference of null pointer [clang-analyzer-core.=
NullDereference]"
:::::: =


CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Cong Wang <cong.wang@bytedance.com>
CC: Daniel Borkmann <daniel@iogearbox.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   6bfb56e93bcef41859c2d5ab234ffd80b691be35
commit: 9f2470fbc4cb4583c080bb729a998933ba61aca4 skmsg: Improve udp_bpf_rec=
vmsg() accuracy
date:   12 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 12 months ago
config: s390-randconfig-c005-20220605 (https://download.01.org/0day-ci/arch=
ive/20220609/202206092123.j3kzhjND-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0a90b7=
2c432d70aae035727ece4ba80ce820f381)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D9f2470fbc4cb4583c080bb729a998933ba61aca4
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 9f2470fbc4cb4583c080bb729a998933ba61aca4
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Ds390 clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c:74:6: note: Assuming the con=
dition is false
           if (num_entries > (SIZE_MAX - sizeof(struct amdgpu_bo_list))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c:74:2: note: Taking false bra=
nch
           if (num_entries > (SIZE_MAX - sizeof(struct amdgpu_bo_list))
           ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c:81:6: note: Assuming 'list' =
is non-null
           if (!list)
               ^~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c:81:2: note: Taking false bra=
nch
           if (!list)
           ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c:92:14: note: Assuming 'i' is=
 < 'num_entries'
           for (i =3D 0; i < num_entries; ++i) {
                       ^~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c:92:2: note: Loop condition i=
s true.  Entering loop body
           for (i =3D 0; i < num_entries; ++i) {
           ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c:99:7: note: Assuming 'gobj' =
is non-null
                   if (!gobj) {
                       ^~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c:99:3: note: Taking false bra=
nch
                   if (!gobj) {
                   ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c:104:22: note: Left side of '=
&&' is false
                   bo =3D amdgpu_bo_ref(gem_to_amdgpu_bo(gobj));
                                      ^
   drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu_gem.h:34:32: note: expanded =
from macro 'gem_to_amdgpu_bo'
   #define gem_to_amdgpu_bo(gobj) container_of((gobj), struct amdgpu_bo, tb=
o.base)
                                  ^
   include/linux/kernel.h:704:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c:104:22: note: Taking false b=
ranch
                   bo =3D amdgpu_bo_ref(gem_to_amdgpu_bo(gobj));
                                      ^
   drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu_gem.h:34:32: note: expanded =
from macro 'gem_to_amdgpu_bo'
   #define gem_to_amdgpu_bo(gobj) container_of((gobj), struct amdgpu_bo, tb=
o.base)
                                  ^
   include/linux/kernel.h:704:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
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
   drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c:104:22: note: Loop condition=
 is false.  Exiting loop
                   bo =3D amdgpu_bo_ref(gem_to_amdgpu_bo(gobj));
                                      ^
   drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu_gem.h:34:32: note: expanded =
from macro 'gem_to_amdgpu_bo'
   #define gem_to_amdgpu_bo(gobj) container_of((gobj), struct amdgpu_bo, tb=
o.base)
                                  ^
   include/linux/kernel.h:704:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
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
   drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c:108:7: note: Assuming 'userm=
m' is non-null
                   if (usermm) {
                       ^~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c:108:3: note: Taking true bra=
nch
                   if (usermm) {
                   ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c:109:18: note: Dereference of=
 null pointer
                           if (usermm !=3D current->mm) {
                                         ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:192:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   Suppressed 23 warnings (10 in non-user code, 13 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   26 warnings generated.
   Suppressed 26 warnings (14 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   26 warnings generated.
   Suppressed 26 warnings (14 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   27 warnings generated.
>> net/ipv4/tcp_bpf.c:169:2: warning: Dereference of null pointer [clang-an=
alyzer-core.NullDereference]
           DEFINE_WAIT_FUNC(wait, woken_wake_function);
           ^
   include/linux/wait.h:1148:14: note: expanded from macro 'DEFINE_WAIT_FUN=
C'
                   .private        =3D current,                            =
          \
                                     ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:192:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   net/ipv4/tcp_bpf.c:194:6: note: Assuming the condition is true
           if (unlikely(flags & MSG_ERRQUEUE))
               ^
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   net/ipv4/tcp_bpf.c:194:2: note: Taking false branch
           if (unlikely(flags & MSG_ERRQUEUE))
           ^
   net/ipv4/tcp_bpf.c:198:16: note: 'psock' is non-null
           if (unlikely(!psock))
                         ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   net/ipv4/tcp_bpf.c:198:2: note: Taking false branch
           if (unlikely(!psock))
           ^
   net/ipv4/tcp_bpf.c:200:6: note: Assuming the condition is false
           if (!skb_queue_empty(&sk->sk_receive_queue) &&
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv4/tcp_bpf.c:200:46: note: Left side of '&&' is false
           if (!skb_queue_empty(&sk->sk_receive_queue) &&
                                                       ^
   net/ipv4/tcp_bpf.c:208:6: note: Assuming 'copied' is 0
           if (!copied) {
               ^~~~~~~
   net/ipv4/tcp_bpf.c:208:2: note: Taking true branch
           if (!copied) {
           ^
   net/ipv4/tcp_bpf.c:213:10: note: Calling 'tcp_msg_wait_data'
                   data =3D tcp_msg_wait_data(sk, psock, flags, timeo, &err=
);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv4/tcp_bpf.c:169:2: note: Dereference of null pointer
           DEFINE_WAIT_FUNC(wait, woken_wake_function);
           ^
   include/linux/wait.h:1148:14: note: expanded from macro 'DEFINE_WAIT_FUN=
C'
                   .private        =3D current,                            =
          \
                                     ^~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:192:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   Suppressed 26 warnings (14 in non-user code, 12 with check filters).
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
   5 warnings generated.
   drivers/thermal/thermal_hwmon.c:96:3: warning: Call to function 'strcpy'=
 is insecure as it does not provide bounding of the memory buffer. Replace =
unbounded copy functions with analogous functions that support length argum=
ents such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(type, tz->type);
                   ^~~~~~
   drivers/thermal/thermal_hwmon.c:96:3: note: Call to function 'strcpy' is=
 insecure as it does not provide bounding of the memory buffer. Replace unb=
ounded copy functions with analogous functions that support length argument=
s such as 'strlcpy'. CWE-119
                   strcpy(type, tz->type);
                   ^~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   19 warnings generated.
   Suppressed 19 warnings (7 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   19 warnings generated.
   Suppressed 19 warnings (7 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (6 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (6 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (6 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (6 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (6 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (6 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
--
   include/linux/spinlock.h:354:2: note: Value assigned to field 'i_dirty_c=
aps', which participates in a condition later
           raw_spin_lock(&lock->rlock);
           ^
   include/linux/spinlock.h:225:29: note: expanded from macro 'raw_spin_loc=
k'
   #define raw_spin_lock(lock)     _raw_spin_lock(lock)
                                   ^~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:354:2: note: Value assigned to field 'i_auth_ca=
p', which participates in a condition later
           raw_spin_lock(&lock->rlock);
           ^
   include/linux/spinlock.h:225:29: note: expanded from macro 'raw_spin_loc=
k'
   #define raw_spin_lock(lock)     _raw_spin_lock(lock)
                                   ^~~~~~~~~~~~~~~~~~~~
   fs/ceph/caps.c:2206:2: note: Returning from 'spin_lock'
           spin_lock(&ci->i_ceph_lock);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ceph/caps.c:2208:6: note: Assuming field 'i_dirty_caps' is not equal =
to 0
           if (ci->i_dirty_caps && ci->i_auth_cap) {
               ^~~~~~~~~~~~~~~~
   fs/ceph/caps.c:2208:6: note: Left side of '&&' is true
   fs/ceph/caps.c:2208:26: note: Assuming field 'i_auth_cap' is non-null
           if (ci->i_dirty_caps && ci->i_auth_cap) {
                                   ^~~~~~~~~~~~~~
   fs/ceph/caps.c:2208:2: note: Taking true branch
           if (ci->i_dirty_caps && ci->i_auth_cap) {
           ^
   fs/ceph/caps.c:2212:7: note: Assuming 'session' is equal to field 'sessi=
on'
                   if (session !=3D cap->session) {
                       ^~~~~~~~~~~~~~~~~~~~~~~
   fs/ceph/caps.c:2212:3: note: Taking false branch
                   if (session !=3D cap->session) {
                   ^
   fs/ceph/caps.c:2220:7: note: Access to field 's_state' results in a dere=
ference of a null pointer (loaded from field 'session')
                   if (cap->session->s_state < CEPH_MDS_SESSION_OPEN) {
                       ^    ~~~~~~~
   fs/ceph/caps.c:2887:4: warning: Dereference of null pointer [clang-analy=
zer-core.NullDereference]
                           DEFINE_WAIT_FUNC(wait, woken_wake_function);
                           ^
   include/linux/wait.h:1148:14: note: expanded from macro 'DEFINE_WAIT_FUN=
C'
                   .private        =3D current,                            =
          \
                                     ^~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:192:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   fs/ceph/caps.c:2867:6: note: Assuming 'ret' is >=3D 0
           if (ret < 0)
               ^~~~~~~
   fs/ceph/caps.c:2867:2: note: Taking false branch
           if (ret < 0)
           ^
   fs/ceph/caps.c:2870:7: note: Assuming the condition is false
           if ((fi->fmode & CEPH_FILE_MODE_WR) &&
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ceph/caps.c:2870:38: note: Left side of '&&' is false
           if ((fi->fmode & CEPH_FILE_MODE_WR) &&
                                               ^
   fs/ceph/caps.c:2876:2: note: Loop condition is true.  Entering loop body
           while (true) {
           ^
   fs/ceph/caps.c:2878:7: note: Assuming the condition is false
                   if (atomic_read(&fi->num_locks))
                       ^
   include/asm-generic/atomic-instrumented.h:30:21: note: expanded from mac=
ro 'atomic_read'
   #define atomic_read atomic_read
                       ^
   fs/ceph/caps.c:2878:3: note: Taking false branch
                   if (atomic_read(&fi->num_locks))
                   ^
   fs/ceph/caps.c:2883:16: note: Assuming the condition is false
                   WARN_ON_ONCE(ret =3D=3D -EAGAIN);
                                ^
   include/asm-generic/bug.h:201:41: note: expanded from macro 'WARN_ON_ONC=
E'
   #define WARN_ON_ONCE(condition) WARN_ON(condition)
                                   ~~~~~~~~^~~~~~~~~~
   include/asm-generic/bug.h:188:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   fs/ceph/caps.c:2884:7: note: Assuming 'ret' is 0
                   if (!ret) {
                       ^~~~
   fs/ceph/caps.c:2884:3: note: Taking true branch
                   if (!ret) {
                   ^
   fs/ceph/caps.c:2887:4: note: Dereference of null pointer
                           DEFINE_WAIT_FUNC(wait, woken_wake_function);
                           ^
   include/linux/wait.h:1148:14: note: expanded from macro 'DEFINE_WAIT_FUN=
C'
                   .private        =3D current,                            =
          \
                                     ^~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:192:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   Suppressed 22 warnings (10 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   27 warnings generated.
>> net/ipv4/udp_bpf.c:42:2: warning: Dereference of null pointer [clang-ana=
lyzer-core.NullDereference]
           DEFINE_WAIT_FUNC(wait, woken_wake_function);
           ^
   include/linux/wait.h:1148:14: note: expanded from macro 'DEFINE_WAIT_FUN=
C'
                   .private        =3D current,                            =
          \
                                     ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:192:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   net/ipv4/udp_bpf.c:69:6: note: Assuming the condition is true
           if (unlikely(flags & MSG_ERRQUEUE))
               ^
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   net/ipv4/udp_bpf.c:69:2: note: Taking false branch
           if (unlikely(flags & MSG_ERRQUEUE))
           ^
   net/ipv4/udp_bpf.c:73:16: note: 'psock' is non-null
           if (unlikely(!psock))
                         ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   net/ipv4/udp_bpf.c:73:2: note: Taking false branch
           if (unlikely(!psock))
           ^
   net/ipv4/udp_bpf.c:76:2: note: Taking false branch
           if (!psock_has_data(psock)) {
           ^
   net/ipv4/udp_bpf.c:83:6: note: Assuming 'copied' is 0
           if (!copied) {
               ^~~~~~~
   net/ipv4/udp_bpf.c:83:2: note: Taking true branch
           if (!copied) {
           ^
   net/ipv4/udp_bpf.c:88:10: note: Calling 'udp_msg_wait_data'
                   data =3D udp_msg_wait_data(sk, psock, flags, timeo, &err=
);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv4/udp_bpf.c:42:2: note: Dereference of null pointer
           DEFINE_WAIT_FUNC(wait, woken_wake_function);
           ^
   include/linux/wait.h:1148:14: note: expanded from macro 'DEFINE_WAIT_FUN=
C'
                   .private        =3D current,                            =
          \
                                     ^~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:192:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   Suppressed 26 warnings (14 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   26 warnings generated.
   Suppressed 26 warnings (14 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   26 warnings generated.
   Suppressed 26 warnings (14 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (6 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   20 warnings generated.
   Suppressed 20 warnings (8 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   22 warnings generated.
   include/linux/uaccess.h:229:2: warning: Dereference of null pointer [cla=
ng-analyzer-core.NullDereference]
           current->pagefault_disabled++;
           ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:192:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   drivers/gpu/drm/qxl/qxl_object.c:215:6: note: Assuming field 'mem_type' =
is equal to TTM_PL_VRAM
           if (bo->tbo.mem.mem_type =3D=3D TTM_PL_VRAM)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/qxl/qxl_object.c:215:2: note: Taking true branch
           if (bo->tbo.mem.mem_type =3D=3D TTM_PL_VRAM)
           ^
   drivers/gpu/drm/qxl/qxl_object.c:223:9: note: Calling 'io_mapping_map_at=
omic_wc'
           return io_mapping_map_atomic_wc(map, offset + page_offset);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/io-mapping.h:171:2: note: Loop condition is false.  Exitin=
g loop
           preempt_disable();
           ^
   include/linux/preempt.h:175:27: note: expanded from macro 'preempt_disab=
le'
   #define preempt_disable() \
                             ^
   include/linux/io-mapping.h:172:2: note: Calling 'pagefault_disable'
           pagefault_disable();
           ^~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:246:2: note: Calling 'pagefault_disabled_inc'
           pagefault_disabled_inc();
           ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:229:2: note: Dereference of null pointer
           current->pagefault_disabled++;

vim +169 net/ipv4/tcp_bpf.c

a26527981af298 YueHaibing 2020-03-20  165  =

9f2470fbc4cb45 Cong Wang  2021-06-14  166  static int tcp_msg_wait_data(str=
uct sock *sk, struct sk_psock *psock, int flags,
9f2470fbc4cb45 Cong Wang  2021-06-14  167  			     long timeo, int *err)
9f2470fbc4cb45 Cong Wang  2021-06-14  168  {
9f2470fbc4cb45 Cong Wang  2021-06-14 @169  	DEFINE_WAIT_FUNC(wait, woken_wa=
ke_function);
9f2470fbc4cb45 Cong Wang  2021-06-14  170  	int ret =3D 0;
9f2470fbc4cb45 Cong Wang  2021-06-14  171  =

9f2470fbc4cb45 Cong Wang  2021-06-14  172  	if (sk->sk_shutdown & RCV_SHUTD=
OWN)
9f2470fbc4cb45 Cong Wang  2021-06-14  173  		return 1;
9f2470fbc4cb45 Cong Wang  2021-06-14  174  =

9f2470fbc4cb45 Cong Wang  2021-06-14  175  	if (!timeo)
9f2470fbc4cb45 Cong Wang  2021-06-14  176  		return ret;
9f2470fbc4cb45 Cong Wang  2021-06-14  177  =

9f2470fbc4cb45 Cong Wang  2021-06-14  178  	add_wait_queue(sk_sleep(sk), &w=
ait);
9f2470fbc4cb45 Cong Wang  2021-06-14  179  	sk_set_bit(SOCKWQ_ASYNC_WAITDAT=
A, sk);
9f2470fbc4cb45 Cong Wang  2021-06-14  180  	ret =3D sk_wait_event(sk, &time=
o,
9f2470fbc4cb45 Cong Wang  2021-06-14  181  			    !list_empty(&psock->ingre=
ss_msg) ||
9f2470fbc4cb45 Cong Wang  2021-06-14  182  			    !skb_queue_empty(&sk->sk_=
receive_queue), &wait);
9f2470fbc4cb45 Cong Wang  2021-06-14  183  	sk_clear_bit(SOCKWQ_ASYNC_WAITD=
ATA, sk);
9f2470fbc4cb45 Cong Wang  2021-06-14  184  	remove_wait_queue(sk_sleep(sk),=
 &wait);
9f2470fbc4cb45 Cong Wang  2021-06-14  185  	return ret;
9f2470fbc4cb45 Cong Wang  2021-06-14  186  }
9f2470fbc4cb45 Cong Wang  2021-06-14  187  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8892497086954666201==--

