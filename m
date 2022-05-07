Content-Type: multipart/mixed; boundary="===============0312604771310594111=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [daniel-thompson:clang-analyzer/initial_review 7/7] block/sed-opal.c:1499:18: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
Date: Sat, 07 May 2022 17:16:55 +0800
Message-ID: <202205071727.oXYwBLul-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0312604771310594111==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Daniel Thompson <daniel.thompson@linaro.org>

tree:   https://git.linaro.org/people/daniel.thompson/linux.git clang-analy=
zer/initial_review
head:   ad6525bf355a301ca52b1dc3639fa340409c79b9
commit: ad6525bf355a301ca52b1dc3639fa340409c79b9 [7/7] [RFC] linux/err.h: R=
efactor IS_ERR_VALUE(x) to improve clang reasoning
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20507/202205071727.oXYwBLul-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5e004f=
b787698440a387750db7f8028e7cb14cfc)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add daniel-thompson https://git.linaro.org/people/daniel=
.thompson/linux.git
        git fetch --no-tags daniel-thompson clang-analyzer/initial_review
        git checkout ad6525bf355a301ca52b1dc3639fa340409c79b9
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/sed-opal.c:402:10: note: Returning from 'opal_discovery0_step'
           error =3D opal_discovery0_step(dev);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~
   block/sed-opal.c:403:6: note: 'error' is 0
           if (error)
               ^~~~~
   block/sed-opal.c:403:2: note: Taking false branch
           if (error)
           ^
   block/sed-opal.c:406:2: note: Loop condition is true.  Entering loop body
           for (state =3D 0; state < n_steps; state++) {
           ^
   block/sed-opal.c:407:11: note: Calling 'execute_step'
                   error =3D execute_step(dev, &steps[state], state);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/sed-opal.c:384:28: note: Passing null pointer value via 2nd parame=
ter 'data'
           int error =3D step->fn(dev, step->data);
                                     ^~~~~~~~~~
   block/sed-opal.c:384:14: note: Calling 'start_SIDASP_opal_session'
           int error =3D step->fn(dev, step->data);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~
   block/sed-opal.c:1458:6: note: Assuming 'key' is null
           if (!key) {
               ^~~~
   block/sed-opal.c:1458:2: note: Taking true branch
           if (!key) {
           ^
   block/sed-opal.c:1459:3: note: 'okey' initialized to a null pointer value
                   const struct opal_key *okey =3D data;
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/sed-opal.c:1464:8: note: Access to field 'key_len' results in a de=
reference of a null pointer (loaded from variable 'okey')
                                                    okey->key_len);
                                                    ^~~~
   block/sed-opal.c:1492:8: warning: Access to field 'key_len' results in a=
 dereference of a null pointer (loaded from variable 'okey') [clang-analyze=
r-core.NullDereference]
                                             okey->key_len);
                                             ^
   block/sed-opal.c:2628:6: note: Assuming the condition is false
           if (!capable(CAP_SYS_ADMIN))
               ^~~~~~~~~~~~~~~~~~~~~~~
   block/sed-opal.c:2628:2: note: Taking false branch
           if (!capable(CAP_SYS_ADMIN))
           ^
   block/sed-opal.c:2630:6: note: Assuming 'dev' is non-null
           if (!dev)
               ^~~~
   block/sed-opal.c:2630:2: note: Taking false branch
           if (!dev)
           ^
   block/sed-opal.c:2632:6: note: Assuming field 'supported' is true
           if (!dev->supported)
               ^~~~~~~~~~~~~~~
   block/sed-opal.c:2632:2: note: Taking false branch
           if (!dev->supported)
           ^
   block/sed-opal.c:2636:2: note: Taking false branch
           if (IS_ERR(p))
           ^
   block/sed-opal.c:2639:2: note: Control jumps to 'case 1091072232:'  at l=
ine 2682
           switch (cmd) {
           ^
   block/sed-opal.c:2683:9: note: Calling 'opal_reverttper'
                   ret =3D opal_reverttper(dev, p, true);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/sed-opal.c:2337:2: note: field 'data' initialized to a null pointe=
r value
           const struct opal_step psid_revert_steps[] =3D {
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/sed-opal.c:2346:6: note: 'psid' is true
           if (psid)
               ^~~~
   block/sed-opal.c:2346:2: note: Taking true branch
           if (psid)
           ^
   block/sed-opal.c:2347:9: note: Calling 'execute_steps'
                   ret =3D execute_steps(dev, psid_revert_steps,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/sed-opal.c:403:6: note: 'error' is 0
           if (error)
               ^~~~~
   block/sed-opal.c:403:2: note: Taking false branch
           if (error)
           ^
   block/sed-opal.c:406:2: note: Loop condition is true.  Entering loop body
           for (state =3D 0; state < n_steps; state++) {
           ^
   block/sed-opal.c:407:11: note: Calling 'execute_step'
                   error =3D execute_step(dev, &steps[state], state);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/sed-opal.c:384:28: note: Passing null pointer value via 2nd parame=
ter 'data'
           int error =3D step->fn(dev, step->data);
                                     ^~~~~~~~~~
   block/sed-opal.c:384:14: note: Calling 'start_PSID_opal_session'
           int error =3D step->fn(dev, step->data);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~
   block/sed-opal.c:1487:2: note: 'okey' initialized to a null pointer value
           const struct opal_key *okey =3D data;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/sed-opal.c:1492:8: note: Access to field 'key_len' results in a de=
reference of a null pointer (loaded from variable 'okey')
                                             okey->key_len);
                                             ^~~~
>> block/sed-opal.c:1499:18: warning: Dereference of null pointer [clang-an=
alyzer-core.NullDereference]
           size_t keylen =3D session->opal_key.key_len;
                           ^
   block/sed-opal.c:2628:6: note: Assuming the condition is false
           if (!capable(CAP_SYS_ADMIN))
               ^~~~~~~~~~~~~~~~~~~~~~~
   block/sed-opal.c:2628:2: note: Taking false branch
           if (!capable(CAP_SYS_ADMIN))
           ^
   block/sed-opal.c:2630:6: note: Assuming 'dev' is non-null
           if (!dev)
               ^~~~
   block/sed-opal.c:2630:2: note: Taking false branch
           if (!dev)
           ^
   block/sed-opal.c:2632:6: note: Assuming field 'supported' is true
           if (!dev->supported)
               ^~~~~~~~~~~~~~~
   block/sed-opal.c:2632:2: note: Taking false branch
           if (!dev->supported)
           ^
   block/sed-opal.c:2636:2: note: Taking false branch
           if (IS_ERR(p))
           ^
   block/sed-opal.c:2639:2: note: Control jumps to 'case 1091596518:'  at l=
ine 2676
           switch (cmd) {
           ^
   block/sed-opal.c:2677:9: note: Calling 'opal_erase_locking_range'
                   ret =3D opal_erase_locking_range(dev, p);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/sed-opal.c:2185:2: note: field 'data' initialized to a null pointe=
r value
           const struct opal_step erase_steps[] =3D {
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/sed-opal.c:2194:8: note: Calling 'execute_steps'
           ret =3D execute_steps(dev, erase_steps, ARRAY_SIZE(erase_steps));
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/sed-opal.c:403:6: note: 'error' is 0
           if (error)
               ^~~~~
   block/sed-opal.c:403:2: note: Taking false branch
           if (error)
           ^
   block/sed-opal.c:406:2: note: Loop condition is true.  Entering loop body
           for (state =3D 0; state < n_steps; state++) {
           ^
   block/sed-opal.c:407:11: note: Calling 'execute_step'
                   error =3D execute_step(dev, &steps[state], state);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/sed-opal.c:384:28: note: Passing null pointer value via 2nd parame=
ter 'data'
           int error =3D step->fn(dev, step->data);
                                     ^~~~~~~~~~
   block/sed-opal.c:384:14: note: Calling 'start_auth_opal_session'
           int error =3D step->fn(dev, step->data);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~
   block/sed-opal.c:1497:2: note: 'session' initialized to a null pointer v=
alue
           struct opal_session_info *session =3D data;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/sed-opal.c:1499:18: note: Dereference of null pointer
           size_t keylen =3D session->opal_key.key_len;
                           ^~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   fs/overlayfs/export.c:498:17: warning: Value stored to 'ancestor' during=
 its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct dentry *ancestor =3D ERR_PTR(-EIO);
                          ^~~~~~~~   ~~~~~~~~~~~~~
   fs/overlayfs/export.c:498:17: note: Value stored to 'ancestor' during it=
s initialization is never read
           struct dentry *ancestor =3D ERR_PTR(-EIO);
                          ^~~~~~~~   ~~~~~~~~~~~~~
   include/linux/dcache.h:385:9: warning: Access to field 'd_flags' results=
 in a dereference of a null pointer (loaded from variable 'dentry') [clang-=
analyzer-core.NullDereference]
           return dentry->d_flags & DCACHE_ENTRY_TYPE;
                  ^
   fs/overlayfs/export.c:809:2: note: Taking false branch
           if (IS_ERR(fh))
           ^
   fs/overlayfs/export.c:813:6: note: Assuming 'err' is 0
           if (err)
               ^~~
   fs/overlayfs/export.c:813:2: note: Taking false branch
           if (err)
           ^
   fs/overlayfs/export.c:817:12: note: Assuming the condition is false
           dentry =3D (flags & OVL_FH_FLAG_PATH_UPPER) ?
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/overlayfs/export.c:817:11: note: '?' condition is false
           dentry =3D (flags & OVL_FH_FLAG_PATH_UPPER) ?
                    ^
   fs/overlayfs/export.c:819:4: note: Calling 'ovl_lower_fh_to_d'
                    ovl_lower_fh_to_d(sb, fh);
                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/overlayfs/export.c:708:6: note: Assuming 'err' is 0
           if (err)
               ^~~
   fs/overlayfs/export.c:708:2: note: Taking false branch
           if (err)
--
                  ^
   include/linux/err.h:58:14: note: expanded from macro 'IS_ERR_VALUE'
                   _l !=3D 0 && -MAX_ERRNO <=3D _l;                        =
           \
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   ipc/shm.c:180:6: note: Returning from 'IS_ERR'
           if (IS_ERR(ipcp))
               ^~~~~~~~~~~~
   ipc/shm.c:180:2: note: Taking true branch
           if (IS_ERR(ipcp))
           ^
   ipc/shm.c:181:3: note: Returning pointer, which participates in a condit=
ion later
                   return ERR_CAST(ipcp);
                   ^~~~~~~~~~~~~~~~~~~~~
   ipc/shm.c:1569:8: note: Returning from 'shm_obtain_object_check'
           shp =3D shm_obtain_object_check(ns, shmid);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   ipc/shm.c:1570:2: note: Taking true branch
           if (IS_ERR(shp)) {
           ^
   ipc/shm.c:1572:3: note: Control jumps to line 1675
                   goto out_unlock;
                   ^
   ipc/shm.c:1677:2: note: Returning without writing to '*raddr'
           return err;
           ^
   ipc/shm.c:1677:2: note: Returning value (loaded from 'err'), which parti=
cipates in a condition later
           return err;
           ^~~~~~~~~~
   ipc/shm.c:1685:8: note: Returning from 'do_shmat'
           err =3D do_shmat(shmid, shmaddr, shmflg, &ret, SHMLBA);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   ipc/shm.c:1686:6: note: Assuming 'err' is 0
           if (err)
               ^~~
   ipc/shm.c:1686:2: note: Taking false branch
           if (err)
           ^
   ipc/shm.c:1688:2: note: Loop condition is false.  Exiting loop
           force_successful_syscall_return();
           ^
   include/linux/ptrace.h:254:43: note: expanded from macro 'force_successf=
ul_syscall_return'
   #define force_successful_syscall_return() do { } while (0)
                                             ^
   ipc/shm.c:1689:2: note: Undefined or garbage value returned to caller
           return (long)ret;
           ^      ~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   kernel/trace/trace_events.c:1363:3: warning: Call to function 'strcat' i=
s insecure as it does not provide bounding of the memory buffer. Replace un=
bounded copy functions with analogous functions that support length argumen=
ts such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcat(buf, "*");
                   ^~~~~~
   kernel/trace/trace_events.c:1363:3: note: Call to function 'strcat' is i=
nsecure as it does not provide bounding of the memory buffer. Replace unbou=
nded copy functions with analogous functions that support length arguments =
such as 'strlcat'. CWE-119
                   strcat(buf, "*");
                   ^~~~~~
   kernel/trace/trace_events.c:1365:2: warning: Call to function 'strcat' i=
s insecure as it does not provide bounding of the memory buffer. Replace un=
bounded copy functions with analogous functions that support length argumen=
ts such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcat(buf, "\n");
           ^~~~~~
   kernel/trace/trace_events.c:1365:2: note: Call to function 'strcat' is i=
nsecure as it does not provide bounding of the memory buffer. Replace unbou=
nded copy functions with analogous functions that support length arguments =
such as 'strlcat'. CWE-119
           strcat(buf, "\n");
           ^~~~~~
   Suppressed 4 warnings (4 in non-user code).
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
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
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
   26 warnings generated.
   Suppressed 26 warnings (26 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (8 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
>> kernel/bpf/syscall.c:747:2: warning: Null pointer passed as 1st argument=
 to memory set function [clang-analyzer-unix.cstring.NullArg]
           memset(dst, 0, size);
           ^
   kernel/bpf/syscall.c:4758:2: note: Control jumps to 'case BPF_MAP_CREATE=
:'  at line 4759
           switch (cmd) {
           ^
   kernel/bpf/syscall.c:4764:3: note:  Execution continues on line 4771
                   break;
                   ^
   kernel/bpf/syscall.c:4771:9: note: Calling '__sys_bpf'
           return __sys_bpf(cmd, KERNEL_BPFPTR(attr), attr_size);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/syscall.c:4600:6: note: Assuming 'sysctl_unprivileged_bpf_dis=
abled' is 0
           if (sysctl_unprivileged_bpf_disabled && !bpf_capable())
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/syscall.c:4600:39: note: Left side of '&&' is false
           if (sysctl_unprivileged_bpf_disabled && !bpf_capable())
                                                ^
   kernel/bpf/syscall.c:4604:6: note: 'err' is 0
           if (err)
               ^~~
   kernel/bpf/syscall.c:4604:2: note: Taking false branch
           if (err)
           ^
   kernel/bpf/syscall.c:4606:9: note: Assuming '__UNIQUE_ID___x903' is >=3D=
 '__UNIQUE_ID___y904'
           size =3D min_t(u32, size, sizeof(attr));
                  ^
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
                            ^~~~~~~~~~
   kernel/bpf/syscall.c:4606:9: note: '?' condition is false
           size =3D min_t(u32, size, sizeof(attr));
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
   kernel/bpf/syscall.c:4610:6: note: Calling 'copy_from_bpfptr'
           if (copy_from_bpfptr(&attr, uattr, size) !=3D 0)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bpfptr.h:57:9: note: Calling 'copy_from_bpfptr_offset'
           return copy_from_bpfptr_offset(dst, src, 0, size);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bpfptr.h:52:9: note: Calling 'copy_from_sockptr_offset'
           return copy_from_sockptr_offset(dst, (sockptr_t) src, offset, si=
ze);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   include/linux/sockptr.h:47:2: note: Taking false branch
           if (!sockptr_is_kernel(src))
           ^
   include/linux/bpfptr.h:52:9: note: Returning from 'copy_from_sockptr_off=
set'
           return copy_from_sockptr_offset(dst, (sockptr_t) src, offset, si=
ze);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   include/linux/bpfptr.h:57:9: note: Returning from 'copy_from_bpfptr_offs=
et'
           return copy_from_bpfptr_offset(dst, src, 0, size);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/syscall.c:4610:6: note: Returning from 'copy_from_bpfptr'
           if (copy_from_bpfptr(&attr, uattr, size) !=3D 0)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/syscall.c:4610:2: note: Taking false branch
           if (copy_from_bpfptr(&attr, uattr, size) !=3D 0)
           ^
   kernel/bpf/syscall.c:4614:6: note: Assuming 'err' is >=3D 0
           if (err < 0)
               ^~~~~~~
   kernel/bpf/syscall.c:4614:2: note: Taking false branch
           if (err < 0)
           ^
   kernel/bpf/syscall.c:4617:2: note: Control jumps to 'case BPF_MAP_CREATE=
:' @line 4618
           switch (cmd) {
           ^
   kernel/bpf/syscall.c:4619:9: note: Calling 'map_create'
                   err =3D map_create(&attr);
                         ^~~~~~~~~~~~~~~~~
   kernel/bpf/syscall.c:839:8: note: Assuming the condition is false
           err =3D CHECK_ATTR(BPF_MAP_CREATE);
                 ^
   kernel/bpf/syscall.c:733:2: note: expanded from macro 'CHECK_ATTR'
           memchr_inv((void *) &attr->CMD##_LAST_FIELD + \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/syscall.c:840:6: note: 'err' is 0
           if (err)
               ^~~
   kernel/bpf/syscall.c:840:2: note: Taking false branch
           if (err)
--
   net/sched/cls_flow.c:316:3: note: Loop condition is false. Execution con=
tinues on line 322
                   for (n =3D 0; n < f->nkeys; n++) {
                   ^
   net/sched/cls_flow.c:322:7: note: Assuming field 'mode' is not equal to =
FLOW_MODE_HASH
                   if (f->mode =3D=3D FLOW_MODE_HASH)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/cls_flow.c:322:3: note: Taking false branch
                   if (f->mode =3D=3D FLOW_MODE_HASH)
                   ^
   net/sched/cls_flow.c:325:12: note: Assigned value is garbage or undefined
                           classid =3D keys[0];
                                   ^ ~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/acpi/acpica/dbhistry.c:73:2: warning: Call to function 'strcpy' =
is insecure as it does not provide bounding of the memory buffer. Replace u=
nbounded copy functions with analogous functions that support length argume=
nts such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(acpi_gbl_history_buffer[acpi_gbl_next_history_index].comm=
and,
           ^~~~~~
   drivers/acpi/acpica/dbhistry.c:73:2: note: Call to function 'strcpy' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcpy'. CWE-119
           strcpy(acpi_gbl_history_buffer[acpi_gbl_next_history_index].comm=
and,
           ^~~~~~
   Suppressed 3 warnings (3 in non-user code).
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
   drivers/leds/led-triggers.c:279:2: warning: Call to function 'strcpy' is=
 insecure as it does not provide bounding of the memory buffer. Replace unb=
ounded copy functions with analogous functions that support length argument=
s such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy((char *)trig->name, name);
           ^~~~~~
   drivers/leds/led-triggers.c:279:2: note: Call to function 'strcpy' is in=
secure as it does not provide bounding of the memory buffer. Replace unboun=
ded copy functions with analogous functions that support length arguments s=
uch as 'strlcpy'. CWE-119
           strcpy((char *)trig->name, name);
           ^~~~~~
   Suppressed 4 warnings (4 in non-user code).
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
   drivers/leds/trigger/ledtrig-cpu.c:54:7: warning: Value stored to 'is_ac=
tive' during its initialization is never read [clang-analyzer-deadcode.Dead=
Stores]
           bool is_active =3D trig->is_active;
                ^~~~~~~~~   ~~~~~~~~~~~~~~~
   drivers/leds/trigger/ledtrig-cpu.c:54:7: note: Value stored to 'is_activ=
e' during its initialization is never read
           bool is_active =3D trig->is_active;
                ^~~~~~~~~   ~~~~~~~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
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
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/hwmon/f71882fg.c:1801:4: warning: Division by zero [clang-analyz=
er-core.DivideZero]
                           / fan_from_reg(data->fan_full_speed[nr]);
   ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/f71882fg.c:1795:6: note: Assuming the condition is false
           if (data->pwm_enable & (1 << (2 * nr)))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/f71882fg.c:1795:2: note: Taking false branch
           if (data->pwm_enable & (1 << (2 * nr)))
           ^
   drivers/hwmon/f71882fg.c:1801:6: note: Calling 'fan_from_reg'
                           / fan_from_reg(data->fan_full_speed[nr]);
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/f71882fg.c:1148:9: note: Assuming 'reg' is 0
           return reg ? (1500000 / reg) : 0;
                  ^~~
   drivers/hwmon/f71882fg.c:1148:9: note: '?' condition is false
   drivers/hwmon/f71882fg.c:1148:2: note: Returning zero
           return reg ? (1500000 / reg) : 0;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/f71882fg.c:1801:6: note: Returning from 'fan_from_reg'
                           / fan_from_reg(data->fan_full_speed[nr]);
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/f71882fg.c:1801:4: note: Division by zero
                           / fan_from_reg(data->fan_full_speed[nr]);
   ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
>> drivers/net/phy/mdio_bus.c:497:2: warning: Null pointer passed as 1st ar=
gument to string copy function [clang-analyzer-unix.cstring.NullArg]
           strncpy(mdiodev->modalias, bi->modalias,
           ^       ~~~~~~~~~~~~~~~~~
   drivers/net/phy/mdio_bus.c:494:2: note: Taking false branch
           if (IS_ERR(mdiodev))
           ^
   drivers/net/phy/mdio_bus.c:497:2: note: Null pointer passed as 1st argum=
ent to string copy function
           strncpy(mdiodev->modalias, bi->modalias,
           ^       ~~~~~~~~~~~~~~~~~
   drivers/net/phy/mdio_bus.c:689:21: warning: Value stored to 'phydev' dur=
ing its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct phy_device *phydev =3D ERR_PTR(-ENODEV);
                              ^~~~~~   ~~~~~~~~~~~~~~~~
   drivers/net/phy/mdio_bus.c:689:21: note: Value stored to 'phydev' during=
 its initialization is never read
           struct phy_device *phydev =3D ERR_PTR(-ENODEV);
                              ^~~~~~   ~~~~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
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
   drivers/firmware/dmi_scan.c:78:3: warning: Call to function 'strcpy' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(str, bp);
                   ^~~~~~
   drivers/firmware/dmi_scan.c:78:3: note: Call to function 'strcpy' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcpy'. CWE-119
                   strcpy(str, bp);
                   ^~~~~~
   drivers/firmware/dmi_scan.c:287:2: warning: Call to function 'strcpy' is=
 insecure as it does not provide bounding of the memory buffer. Replace unb=
ounded copy functions with analogous functions that support length argument=
s such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy((char *)(dev + 1), name);
           ^~~~~~
   drivers/firmware/dmi_scan.c:287:2: note: Call to function 'strcpy' is in=
secure as it does not provide bounding of the memory buffer. Replace unboun=
ded copy functions with analogous functions that support length arguments s=
uch as 'strlcpy'. CWE-119
           strcpy((char *)(dev + 1), name);
           ^~~~~~
   drivers/firmware/dmi_scan.c:376:2: warning: Call to function 'strcpy' is=
 insecure as it does not provide bounding of the memory buffer. Replace unb=
ounded copy functions with analogous functions that support length argument=
s such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy((char *)&dev[1], name);
           ^~~~~~
   drivers/firmware/dmi_scan.c:376:2: note: Call to function 'strcpy' is in=
secure as it does not provide bounding of the memory buffer. Replace unboun=
ded copy functions with analogous functions that support length arguments s=
uch as 'strlcpy'. CWE-119
           strcpy((char *)&dev[1], name);
           ^~~~~~
   drivers/firmware/dmi_scan.c:555:2: warning: Value stored to 'c' is never=
 read [clang-analyzer-deadcode.DeadStores]
           c +=3D print_filtered(buf + c, len - c,
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/firmware/dmi_scan.c:555:2: note: Value stored to 'c' is never re=
ad
           c +=3D print_filtered(buf + c, len - c,
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
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
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/slimbus/messaging.c:323:3: warning: Undefined or garbage value r=
eturned to caller [clang-analyzer-core.uninitialized.UndefReturn]
                   return buf;
                   ^      ~~~
   drivers/slimbus/messaging.c:317:2: note: 'buf' declared without an initi=
al value
           u8 buf;
           ^~~~~~
   drivers/slimbus/messaging.c:319:8: note: Calling 'slim_read'
           ret =3D slim_read(sdev, addr, 1, &buf);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/slimbus/messaging.c:300:2: note: Calling 'slim_fill_msg'
           slim_fill_msg(&msg, addr, count, val, NULL);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/slimbus/messaging.c:282:1: note: Returning without writing to 'm=
sg->rbuf'
   }
   ^
   drivers/slimbus/messaging.c:300:2: note: Returning from 'slim_fill_msg'
           slim_fill_msg(&msg, addr, count, val, NULL);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/slimbus/messaging.c:302:9: note: Calling 'slim_xfer_msg'
           return slim_xfer_msg(sdev, &msg, SLIM_MSG_MC_REQUEST_VALUE);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/slimbus/messaging.c:242:6: note: Assuming 'ctrl' is non-null
           if (!ctrl)
               ^~~~~
   drivers/slimbus/messaging.c:242:2: note: Taking false branch
           if (!ctrl)
           ^
   drivers/slimbus/messaging.c:245:8: note: Calling 'slim_val_inf_sanity'
           ret =3D slim_val_inf_sanity(ctrl, msg, mc);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/slimbus/messaging.c:182:7: note: 'msg' is non-null
           if (!msg || msg->num_bytes > 16 ||
                ^~~
   drivers/slimbus/messaging.c:182:6: note: Left side of '||' is false
           if (!msg || msg->num_bytes > 16 ||
               ^
   drivers/slimbus/messaging.c:182:19: note: Field 'num_bytes' is <=3D 16
           if (!msg || msg->num_bytes > 16 ||
                            ^
   drivers/slimbus/messaging.c:182:6: note: Left side of '||' is false
           if (!msg || msg->num_bytes > 16 ||
--
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   arch/x86/include/asm/paravirt.h:55:2: warning: Assigned value is garbage=
 or undefined [clang-analyzer-core.uninitialized.Assign]
           PVOP_VCALL0(cpu.io_delay);
           ^
   arch/x86/include/asm/paravirt_types.h:512:2: note: expanded from macro '=
PVOP_VCALL0'
           __PVOP_VCALL(op)
           ^
   arch/x86/include/asm/paravirt_types.h:492:8: note: expanded from macro '=
__PVOP_VCALL'
           (void)____PVOP_CALL(, op, CLBR_ANY, PVOP_VCALL_CLOBBERS,        \
                 ^
   arch/x86/include/asm/paravirt_types.h:447:3: note: expanded from macro '=
____PVOP_CALL'
                   PVOP_CALL_ARGS;                                         \
                   ^
   arch/x86/include/asm/paravirt_types.h:405:16: note: expanded from macro =
'PVOP_CALL_ARGS'
           unsigned long __edi =3D __edi, __esi =3D __esi,             \
                         ^
   drivers/input/misc/pcspkr.c:119:2: note: Calling 'pcspkr_event'
           pcspkr_event(NULL, EV_SND, SND_BELL, 0);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/input/misc/pcspkr.c:29:6: note: 'type' is equal to EV_SND
           if (type !=3D EV_SND)
               ^~~~
   drivers/input/misc/pcspkr.c:29:2: note: Taking false branch
           if (type !=3D EV_SND)
           ^
   drivers/input/misc/pcspkr.c:32:2: note: Control jumps to 'case 1:'  at l=
ine 33
           switch (code) {
           ^
   drivers/input/misc/pcspkr.c:34:7: note: 'value' is 0
                   if (value)
                       ^~~~~
   drivers/input/misc/pcspkr.c:34:3: note: Taking false branch
                   if (value)
                   ^
   drivers/input/misc/pcspkr.c:36:3: note:  Execution continues on line 43
                   break;
                   ^
   drivers/input/misc/pcspkr.c:43:6: note: 'value' is <=3D 20
           if (value > 20 && value < 32767)
               ^~~~~
   drivers/input/misc/pcspkr.c:43:17: note: Left side of '&&' is false
           if (value > 20 && value < 32767)
                          ^
   drivers/input/misc/pcspkr.c:46:2: note: Loop condition is false.  Exitin=
g loop
           raw_spin_lock_irqsave(&i8253_lock, flags);
           ^
   include/linux/spinlock.h:240:2: note: expanded from macro 'raw_spin_lock=
_irqsave'
           do {                                            \
           ^
   drivers/input/misc/pcspkr.c:48:6: note: 'count' is 0
           if (count) {
               ^~~~~
   drivers/input/misc/pcspkr.c:48:2: note: Taking false branch
           if (count) {
           ^
   drivers/input/misc/pcspkr.c:58:8: note: Calling 'inb_p'
                   outb(inb_p(0x61) & 0xFC, 0x61);
                        ^
   arch/x86/include/asm/io.h:327:15: note: expanded from macro 'inb_p'
   #define inb_p inb_p
                 ^
   arch/x86/include/asm/io.h:320:1: note: Calling 'slow_down_io'
   BUILDIO(b, b, char)
   ^
   arch/x86/include/asm/io.h:284:2: note: expanded from macro 'BUILDIO'
           slow_down_io();                                                 \
           ^~~~~~~~~~~~~~
   arch/x86/include/asm/paravirt.h:55:2: note: Assigned value is garbage or=
 undefined
           PVOP_VCALL0(cpu.io_delay);
           ^
   arch/x86/include/asm/paravirt_types.h:512:2: note: expanded from macro '=
PVOP_VCALL0'
           __PVOP_VCALL(op)
           ^~~~~~~~~~~~~~~~
   arch/x86/include/asm/paravirt_types.h:492:8: note: expanded from macro '=
__PVOP_VCALL'
           (void)____PVOP_CALL(, op, CLBR_ANY, PVOP_VCALL_CLOBBERS,        \
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/paravirt_types.h:447:3: note: expanded from macro '=
____PVOP_CALL'
                   PVOP_CALL_ARGS;                                         \
                   ^~~~~~~~~~~~~~
   arch/x86/include/asm/paravirt_types.h:405:16: note: expanded from macro =
'PVOP_CALL_ARGS'
           unsigned long __edi =3D __edi, __esi =3D __esi,             \
                         ^       ~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
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
   16 warnings generated.
>> drivers/hwmon/applesmc.c:415:7: warning: Null pointer passed as 1st argu=
ment to string comparison function [clang-analyzer-unix.cstring.NullArg]
                   if (strcmp(entry->key, key) < 0)
                       ^
   drivers/hwmon/applesmc.c:1313:6: note: Assuming the condition is false
           if (!dmi_check_system(applesmc_whitelist)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/applesmc.c:1313:2: note: Taking false branch
           if (!dmi_check_system(applesmc_whitelist)) {
           ^
   drivers/hwmon/applesmc.c:1319:6: note: Assuming the condition is false
           if (!request_region(APPLESMC_DATA_PORT, APPLESMC_NR_PORTS,
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/applesmc.c:1319:2: note: Taking false branch
           if (!request_region(APPLESMC_DATA_PORT, APPLESMC_NR_PORTS,
           ^
   drivers/hwmon/applesmc.c:1326:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/hwmon/applesmc.c:1326:2: note: Taking false branch
           if (ret)
           ^
   drivers/hwmon/applesmc.c:1331:2: note: Taking false branch
           if (IS_ERR(pdev)) {
           ^
   drivers/hwmon/applesmc.c:1337:8: note: Calling 'applesmc_init_smcreg'
           ret =3D applesmc_init_smcreg();
                 ^~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/applesmc.c:656:2: note: Loop condition is true.  Entering =
loop body
           for (ms =3D 0; ms < INIT_TIMEOUT_MSECS; ms +=3D INIT_WAIT_MSECS)=
 {
           ^
   drivers/hwmon/applesmc.c:657:9: note: Calling 'applesmc_init_smcreg_try'
                   ret =3D applesmc_init_smcreg_try();
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/applesmc.c:573:6: note: Assuming field 'init_complete' is =
false
           if (s->init_complete)
               ^~~~~~~~~~~~~~~~
   drivers/hwmon/applesmc.c:573:2: note: Taking false branch
           if (s->init_complete)
           ^
   drivers/hwmon/applesmc.c:577:6: note: 'ret' is 0
           if (ret)
               ^~~
   drivers/hwmon/applesmc.c:577:2: note: Taking false branch
           if (ret)
           ^
   drivers/hwmon/applesmc.c:580:6: note: Assuming field 'cache' is null
           if (s->cache && s->key_count !=3D count) {
               ^~~~~~~~
   drivers/hwmon/applesmc.c:580:15: note: Left side of '&&' is false
           if (s->cache && s->key_count !=3D count) {
                        ^
   drivers/hwmon/applesmc.c:588:10: note: Field 'cache' is null
           if (!s->cache)
                   ^
   drivers/hwmon/applesmc.c:588:2: note: Taking true branch
           if (!s->cache)
           ^
   drivers/hwmon/applesmc.c:590:6: note: Assuming field 'cache' is non-null
           if (!s->cache)
               ^~~~~~~~~
   drivers/hwmon/applesmc.c:590:2: note: Taking false branch
           if (!s->cache)
           ^
   drivers/hwmon/applesmc.c:594:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/hwmon/applesmc.c:594:2: note: Taking false branch
           if (ret)
           ^
   drivers/hwmon/applesmc.c:597:6: note: Assuming field 'fan_count' is <=3D=
 10
           if (s->fan_count > 10)
               ^~~~~~~~~~~~~~~~~
   drivers/hwmon/applesmc.c:597:2: note: Taking false branch
           if (s->fan_count > 10)
           ^
   drivers/hwmon/applesmc.c:600:8: note: Calling 'applesmc_get_lower_bound'
           ret =3D applesmc_get_lower_bound(&s->temp_begin, "T");
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/applesmc.c:408:9: note: Assuming 'begin' is not equal to '=
end'
           while (begin !=3D end) {
                  ^~~~~~~~~~~~
   drivers/hwmon/applesmc.c:408:2: note: Loop condition is true.  Entering =
loop body
           while (begin !=3D end) {
           ^
   drivers/hwmon/applesmc.c:411:3: note: Taking false branch
                   if (IS_ERR(entry)) {
                   ^
   drivers/hwmon/applesmc.c:415:7: note: Null pointer passed as 1st argumen=
t to string comparison function
                   if (strcmp(entry->key, key) < 0)
                       ^      ~~~~~~~~~~
>> drivers/hwmon/applesmc.c:437:7: warning: Null pointer passed as 2nd argu=
ment to string comparison function [clang-analyzer-unix.cstring.NullArg]
                   if (strcmp(key, entry->key) < 0)
                       ^
   drivers/hwmon/applesmc.c:989:8: note: Calling 'applesmc_read_key'
           ret =3D applesmc_read_key(KEY_COUNT_KEY, buffer, 4);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/applesmc.c:468:10: note: Calling 'applesmc_get_entry_by_ke=
y'
           entry =3D applesmc_get_entry_by_key(key);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/applesmc.c:453:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/hwmon/applesmc.c:453:2: note: Taking false branch
           if (ret)
           ^
   drivers/hwmon/applesmc.c:455:8: note: Calling 'applesmc_get_upper_bound'
           ret =3D applesmc_get_upper_bound(&end, key);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/applesmc.c:430:9: note: Assuming 'begin' is not equal to '=
end'
           while (begin !=3D end) {
                  ^~~~~~~~~~~~
   drivers/hwmon/applesmc.c:430:2: note: Loop condition is true.  Entering =
loop body
           while (begin !=3D end) {
           ^
   drivers/hwmon/applesmc.c:433:3: note: Taking false branch
                   if (IS_ERR(entry)) {
                   ^
   drivers/hwmon/applesmc.c:437:7: note: Null pointer passed as 2nd argumen=
t to string comparison function
                   if (strcmp(key, entry->key) < 0)
                       ^           ~~~~~~~~~~
   drivers/hwmon/applesmc.c:510:27: warning: The left operand of '<<' is a =
garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           *value =3D ((s16)buffer[0] << 8) | buffer[1];
                                    ^
   drivers/hwmon/applesmc.c:959:2: note: Calling 'applesmc_calibrate'
           applesmc_calibrate();
           ^~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/applesmc.c:719:2: note: Calling 'applesmc_read_s16'
           applesmc_read_s16(MOTION_SENSOR_X_KEY, &rest_x);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/applesmc.c:506:8: note: Calling 'applesmc_read_key'
           ret =3D applesmc_read_key(key, buffer, 2);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/applesmc.c:469:6: note: Calling 'IS_ERR'
           if (IS_ERR(entry))
               ^~~~~~~~~~~~~
   include/linux/err.h:89:9: note: Assuming '_l' is not equal to 0, which p=
articipates in a condition later
           return IS_ERR_VALUE((unsigned long)ptr);
                  ^
   include/linux/err.h:58:3: note: expanded from macro 'IS_ERR_VALUE'
                   _l !=3D 0 && -MAX_ERRNO <=3D _l;                        =
           \
                   ^~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/err.h:89:9: note: Left side of '&&' is true
           return IS_ERR_VALUE((unsigned long)ptr);
                  ^
   include/linux/err.h:58:3: note: expanded from macro 'IS_ERR_VALUE'
                   _l !=3D 0 && -MAX_ERRNO <=3D _l;                        =
           \
                   ^
   include/linux/err.h:89:9: note: Assuming the condition is true
           return IS_ERR_VALUE((unsigned long)ptr);
                  ^
   include/linux/err.h:58:14: note: expanded from macro 'IS_ERR_VALUE'
                   _l !=3D 0 && -MAX_ERRNO <=3D _l;                        =
           \
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/hwmon/applesmc.c:469:6: note: Returning from 'IS_ERR'
           if (IS_ERR(entry))
               ^~~~~~~~~~~~~
   drivers/hwmon/applesmc.c:469:2: note: Taking true branch
           if (IS_ERR(entry))
           ^
   drivers/hwmon/applesmc.c:470:3: note: Returning without writing to '*buf=
fer'
                   return PTR_ERR(entry);
                   ^
   drivers/hwmon/applesmc.c:470:3: note: Returning value, which participate=
s in a condition later
                   return PTR_ERR(entry);
                   ^~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/applesmc.c:506:8: note: Returning from 'applesmc_read_key'
           ret =3D applesmc_read_key(key, buffer, 2);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/applesmc.c:507:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/hwmon/applesmc.c:507:2: note: Taking false branch
           if (ret)
           ^
   drivers/hwmon/applesmc.c:510:27: note: The left operand of '<<' is a gar=
bage value
           *value =3D ((s16)buffer[0] << 8) | buffer[1];
                          ~~~~~~~~~ ^
   drivers/hwmon/applesmc.c:527:16: warning: The left operand of '!=3D' is =
a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
                                   (buffer[0] !=3D 0x00 || buffer[1] !=3D 0=
x00))
                                              ^
   drivers/hwmon/applesmc.c:696:2: note: Calling 'applesmc_device_init'
           applesmc_device_init();
           ^~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/applesmc.c:522:6: note: Assuming field 'has_accelerometer'=
 is true
           if (!smcreg.has_accelerometer)
--
           ^
   drivers/input/touchscreen/wm97xx-core.c:436:13: note: Assuming the condi=
tion is true
           } else if (rc & RC_VALID) {
                      ^~~~~~~~~~~~~
   drivers/input/touchscreen/wm97xx-core.c:436:9: note: Taking true branch
           } else if (rc & RC_VALID) {
                  ^
   drivers/input/touchscreen/wm97xx-core.c:437:3: note: Taking false branch
                   dev_dbg(wm->dev,
                   ^
   include/linux/dev_printk.h:162:2: note: expanded from macro 'dev_dbg'
           if (0)                                                          \
           ^
   drivers/input/touchscreen/wm97xx-core.c:442:26: note: The left operand o=
f '&' is a garbage value
                   if (abs_x[0] > (data.x & 0xfff) ||
                                   ~~~~~~ ^
   Suppressed 4 warnings (4 in non-user code).
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
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/leds/uleds.c:150:4: warning: Value stored to 'retval' is never r=
ead [clang-analyzer-deadcode.DeadStores]
                           retval =3D copy_to_user(buffer, &udev->brightnes=
s,
                           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/uleds.c:150:4: note: Value stored to 'retval' is never read
                           retval =3D copy_to_user(buffer, &udev->brightnes=
s,
                           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/leds/flash/leds-lm3601x.c:226:3: warning: Value stored to 'ret' =
is never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D regmap_update_bits(led->regmap, LM3601X_CFG_REG,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/flash/leds-lm3601x.c:226:3: note: Value stored to 'ret' is =
never read
                   ret =3D regmap_update_bits(led->regmap, LM3601X_CFG_REG,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/flash/leds-lm3601x.c:230:3: warning: Value stored to 'ret' =
is never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D regmap_update_bits(led->regmap, LM3601X_ENABLE_R=
EG,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/flash/leds-lm3601x.c:230:3: note: Value stored to 'ret' is =
never read
                   ret =3D regmap_update_bits(led->regmap, LM3601X_ENABLE_R=
EG,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/flash/leds-lm3601x.c:234:3: warning: Value stored to 'ret' =
is never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D regmap_update_bits(led->regmap, LM3601X_ENABLE_R=
EG,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/flash/leds-lm3601x.c:234:3: note: Value stored to 'ret' is =
never read
                   ret =3D regmap_update_bits(led->regmap, LM3601X_ENABLE_R=
EG,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
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
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
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
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
>> drivers/scsi/scsi_lib.c:1129:2: warning: Null pointer passed as 1st argu=
ment to memory set function [clang-analyzer-unix.cstring.NullArg]
           memset(req->__cmd, 0, sizeof(req->__cmd));
           ^
   drivers/scsi/scsi_lib.c:2287:12: note: Calling 'scsi_execute_req'
                   result =3D scsi_execute_req(sdev, cmd, DMA_NONE, NULL, 0=
, sshdr,
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   include/scsi/scsi_device.h:469:9: note: Null is equal to null
           return scsi_execute(sdev, cmd, data_direction, buffer,
                  ^
   include/scsi/scsi_device.h:458:15: note: expanded from macro 'scsi_execu=
te'
           BUILD_BUG_ON((sense) !=3D NULL &&                               =
  \
           ~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:19: note: expanded from macro 'BUILD_BUG_ON'
           BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
           ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:58: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~
   include/linux/compiler_types.h:346:22: note: expanded from macro 'compil=
etime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   include/linux/compiler_types.h:334:23: note: expanded from macro '_compi=
letime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:326:9: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
   include/scsi/scsi_device.h:469:9: note: Left side of '&&' is false
           return scsi_execute(sdev, cmd, data_direction, buffer,
                  ^
   include/scsi/scsi_device.h:458:31: note: expanded from macro 'scsi_execu=
te'
           BUILD_BUG_ON((sense) !=3D NULL &&                               =
  \
                                        ^
   include/scsi/scsi_device.h:469:9: note: Taking false branch
           return scsi_execute(sdev, cmd, data_direction, buffer,
                  ^
   include/scsi/scsi_device.h:458:2: note: expanded from macro 'scsi_execut=
e'
           BUILD_BUG_ON((sense) !=3D NULL &&                               =
  \
           ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
           BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:346:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:334:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:326:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   include/scsi/scsi_device.h:469:9: note: Loop condition is false.  Exitin=
g loop
           return scsi_execute(sdev, cmd, data_direction, buffer,
                  ^
   include/scsi/scsi_device.h:458:2: note: expanded from macro 'scsi_execut=
e'
           BUILD_BUG_ON((sense) !=3D NULL &&                               =
  \
           ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
           BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:346:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:334:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:318:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   include/scsi/scsi_device.h:469:9: note: Calling '__scsi_execute'
           return scsi_execute(sdev, cmd, data_direction, buffer,
                  ^
   include/scsi/scsi_device.h:460:2: note: expanded from macro 'scsi_execut=
e'
           __scsi_execute(sdev, cmd, data_direction, buffer, bufflen,      \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/scsi_lib.c:220:4: note: 'data_direction' is not equal to DM=
A_TO_DEVICE
                           data_direction =3D=3D DMA_TO_DEVICE ?
                           ^~~~~~~~~~~~~~
   drivers/scsi/scsi_lib.c:220:4: note: '?' condition is false
   drivers/scsi/scsi_lib.c:222:4: note: '?' condition is false
                           rq_flags & RQF_PM ? BLK_MQ_REQ_PM : 0);
                           ^
   drivers/scsi/scsi_lib.c:219:8: note: Calling 'scsi_alloc_request'
           req =3D scsi_alloc_request(sdev->request_queue,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/scsi_lib.c:1145:2: note: Taking true branch
           if (!IS_ERR(rq))
           ^
   drivers/scsi/scsi_lib.c:1146:3: note: Calling 'scsi_initialize_rq'
                   scsi_initialize_rq(rq);
                   ^~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/scsi_lib.c:1129:2: note: Null pointer passed as 1st argumen=
t to memory set function
           memset(req->__cmd, 0, sizeof(req->__cmd));
           ^      ~~~~~~~~~~
   include/scsi/scsi_common.h:66:31: warning: The left operand of '&' is a =
garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
--
               ^~~~~~~~~~~~
   net/wireless/nl80211.c:948:2: note: Taking true branch
           if (!cb->args[0]) {
           ^
   net/wireless/nl80211.c:951:8: note: 'attrbuf' is non-null, which partici=
pates in a condition later
                   if (!attrbuf) {
                        ^~~~~~~
   net/wireless/nl80211.c:951:3: note: Taking false branch
                   if (!attrbuf) {
                   ^
   net/wireless/nl80211.c:959:9: note: Calling 'nlmsg_parse_deprecated'
                   err =3D nlmsg_parse_deprecated(cb->nlh,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/netlink.h:772:9: note: Calling '__nlmsg_parse'
           return __nlmsg_parse(nlh, hdrlen, tb, maxtype, policy,
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/netlink.h:728:6: note: Assuming the condition is false
           if (nlh->nlmsg_len < nlmsg_msg_size(hdrlen)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/netlink.h:728:2: note: Taking false branch
           if (nlh->nlmsg_len < nlmsg_msg_size(hdrlen)) {
           ^
   include/net/netlink.h:733:2: note: Returning value, which participates i=
n a condition later
           return __nla_parse(tb, maxtype, nlmsg_attrdata(nlh, hdrlen),
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/netlink.h:772:9: note: Returning from '__nlmsg_parse'
           return __nlmsg_parse(nlh, hdrlen, tb, maxtype, policy,
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/netlink.h:772:2: note: Returning value, which participates i=
n a condition later
           return __nlmsg_parse(nlh, hdrlen, tb, maxtype, policy,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/wireless/nl80211.c:959:9: note: Returning from 'nlmsg_parse_deprecat=
ed'
                   err =3D nlmsg_parse_deprecated(cb->nlh,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/wireless/nl80211.c:963:7: note: Assuming 'err' is 0
                   if (err) {
                       ^~~
   net/wireless/nl80211.c:963:3: note: Taking false branch
                   if (err) {
                   ^
   net/wireless/nl80211.c:972:7: note: Calling 'IS_ERR'
                   if (IS_ERR(*wdev)) {
                       ^~~~~~~~~~~~~
   include/linux/err.h:89:9: note: Assuming '_l' is not equal to 0, which p=
articipates in a condition later
           return IS_ERR_VALUE((unsigned long)ptr);
                  ^
   include/linux/err.h:58:3: note: expanded from macro 'IS_ERR_VALUE'
                   _l !=3D 0 && -MAX_ERRNO <=3D _l;                        =
           \
                   ^~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/err.h:89:9: note: Left side of '&&' is true
           return IS_ERR_VALUE((unsigned long)ptr);
                  ^
   include/linux/err.h:58:3: note: expanded from macro 'IS_ERR_VALUE'
                   _l !=3D 0 && -MAX_ERRNO <=3D _l;                        =
           \
                   ^
   include/linux/err.h:89:9: note: Assuming the condition is true
           return IS_ERR_VALUE((unsigned long)ptr);
                  ^
   include/linux/err.h:58:14: note: expanded from macro 'IS_ERR_VALUE'
                   _l !=3D 0 && -MAX_ERRNO <=3D _l;                        =
           \
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   net/wireless/nl80211.c:972:7: note: Returning from 'IS_ERR'
                   if (IS_ERR(*wdev)) {
                       ^~~~~~~~~~~~~
   net/wireless/nl80211.c:972:3: note: Taking true branch
                   if (IS_ERR(*wdev)) {
                   ^
   net/wireless/nl80211.c:974:4: note: Returning without writing to '*rdev'
                           return PTR_ERR(*wdev);
                           ^
   net/wireless/nl80211.c:974:4: note: Returning value, which participates =
in a condition later
                           return PTR_ERR(*wdev);
                           ^~~~~~~~~~~~~~~~~~~~~
   net/wireless/nl80211.c:9890:8: note: Returning from 'nl80211_prepare_wde=
v_dump'
           res =3D nl80211_prepare_wdev_dump(cb, &rdev, &wdev, attrbuf);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/wireless/nl80211.c:9891:6: note: Assuming 'res' is 0
           if (res) {
               ^~~
   net/wireless/nl80211.c:9891:2: note: Taking false branch
           if (res) {
           ^
   net/wireless/nl80211.c:9901:6: note: Assuming field 'netdev' is null
           if (!wdev->netdev) {
               ^~~~~~~~~~~~~
   net/wireless/nl80211.c:9901:2: note: Taking true branch
           if (!wdev->netdev) {
           ^
   net/wireless/nl80211.c:9903:3: note: Control jumps to line 9937
                   goto out_err;
                   ^
   net/wireless/nl80211.c:9938:2: note: 1st function call argument is an un=
initialized value
           wiphy_unlock(&rdev->wiphy);
           ^            ~~~~~~~~~~~~
>> net/wireless/nl80211.c:14150:18: warning: Dereference of null pointer [c=
lang-analyzer-core.NullDereference]
           for (i =3D 0; i < (*rdev)->wiphy.n_vendor_commands; i++) {
                           ^
   net/wireless/nl80211.c:14212:8: note: Calling 'nl80211_prepare_vendor_du=
mp'
           err =3D nl80211_prepare_vendor_dump(skb, cb, &rdev, &wdev);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/wireless/nl80211.c:14097:6: note: Assuming the condition is false
           if (cb->args[0]) {
               ^~~~~~~~~~~
   net/wireless/nl80211.c:14097:2: note: Taking false branch
           if (cb->args[0]) {
           ^
   net/wireless/nl80211.c:14120:12: note: Calling 'kcalloc'
           attrbuf =3D kcalloc(NUM_NL80211_ATTR, sizeof(*attrbuf), GFP_KERN=
EL);
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:652:9: note: Calling 'kmalloc_array'
           return kmalloc_array(n, size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:617:2: note: Taking false branch
           if (unlikely(check_mul_overflow(n, size, &bytes)))
           ^
   include/linux/slab.h:619:30: note: Left side of '&&' is false
           if (__builtin_constant_p(n) && __builtin_constant_p(size))
                                       ^
   include/linux/slab.h:621:2: note: Returning pointer, which participates =
in a condition later
           return __kmalloc(bytes, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:652:9: note: Returning from 'kmalloc_array'
           return kmalloc_array(n, size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:652:2: note: Returning pointer, which participates =
in a condition later
           return kmalloc_array(n, size, flags | __GFP_ZERO);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/wireless/nl80211.c:14120:12: note: Returning from 'kcalloc'
           attrbuf =3D kcalloc(NUM_NL80211_ATTR, sizeof(*attrbuf), GFP_KERN=
EL);
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/wireless/nl80211.c:14121:6: note: Assuming 'attrbuf' is non-null
           if (!attrbuf)
               ^~~~~~~~
   net/wireless/nl80211.c:14121:2: note: Taking false branch
           if (!attrbuf)
           ^
   net/wireless/nl80211.c:14124:8: note: Calling 'nlmsg_parse_deprecated'
           err =3D nlmsg_parse_deprecated(cb->nlh,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/netlink.h:772:9: note: Calling '__nlmsg_parse'
           return __nlmsg_parse(nlh, hdrlen, tb, maxtype, policy,
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/netlink.h:728:6: note: Assuming the condition is false
           if (nlh->nlmsg_len < nlmsg_msg_size(hdrlen)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/netlink.h:728:2: note: Taking false branch
           if (nlh->nlmsg_len < nlmsg_msg_size(hdrlen)) {
           ^
   include/net/netlink.h:733:9: note: Assigning value, which participates i=
n a condition later
           return __nla_parse(tb, maxtype, nlmsg_attrdata(nlh, hdrlen),
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/netlink.h:733:2: note: Returning value, which participates i=
n a condition later
           return __nla_parse(tb, maxtype, nlmsg_attrdata(nlh, hdrlen),
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/netlink.h:772:9: note: Returning from '__nlmsg_parse'
           return __nlmsg_parse(nlh, hdrlen, tb, maxtype, policy,
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/netlink.h:772:2: note: Returning value, which participates i=
n a condition later
           return __nlmsg_parse(nlh, hdrlen, tb, maxtype, policy,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/wireless/nl80211.c:14124:8: note: Returning from 'nlmsg_parse_deprec=
ated'
           err =3D nlmsg_parse_deprecated(cb->nlh,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/wireless/nl80211.c:14128:6: note: Assuming 'err' is 0
           if (err)
               ^~~
   net/wireless/nl80211.c:14128:2: note: Taking false branch
           if (err)
           ^
   net/wireless/nl80211.c:14131:6: note: Assuming the condition is false
           if (!attrbuf[NL80211_ATTR_VENDOR_ID] ||
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/wireless/nl80211.c:14131:6: note: Left side of '||' is false
   net/wireless/nl80211.c:14132:6: note: Assuming the condition is false
               !attrbuf[NL80211_ATTR_VENDOR_SUBCMD]) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/wireless/nl80211.c:14131:2: note: Taking false branch
           if (!attrbuf[NL80211_ATTR_VENDOR_ID] ||
           ^
   net/wireless/nl80211.c:14138:2: note: Taking false branch
           if (IS_ERR(*wdev))
           ^
   net/wireless/nl80211.c:14141:2: note: Value assigned to 'rdev'
           *rdev =3D __cfg80211_rdev_from_attrs(sock_net(skb->sk), attrbuf);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/wireless/nl80211.c:14142:6: note: Calling 'IS_ERR'
           if (IS_ERR(*rdev)) {
               ^~~~~~~~~~~~~
   include/linux/err.h:89:9: note: Assuming '_l' is equal to 0
           return IS_ERR_VALUE((unsigned long)ptr);
                  ^
   include/linux/err.h:58:3: note: expanded from macro 'IS_ERR_VALUE'
                   _l !=3D 0 && -MAX_ERRNO <=3D _l;                        =
           \
                   ^~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'

vim +1499 block/sed-opal.c

5e4c7cf60ec3ca Revanth Rajashekar 2019-06-27  1494  =

eed64951f15d63 Jon Derrick        2017-02-22  1495  static int start_auth_o=
pal_session(struct opal_dev *dev, void *data)
455a7b238cd6bc Scott Bauer        2017-02-03  1496  {
eed64951f15d63 Jon Derrick        2017-02-22  1497  	struct opal_session_in=
fo *session =3D data;
455a7b238cd6bc Scott Bauer        2017-02-03  1498  	u8 lk_ul_user[OPAL_UID=
_LENGTH];
eed64951f15d63 Jon Derrick        2017-02-22 @1499  	size_t keylen =3D sess=
ion->opal_key.key_len;
455a7b238cd6bc Scott Bauer        2017-02-03  1500  	int err =3D 0;
455a7b238cd6bc Scott Bauer        2017-02-03  1501  =

455a7b238cd6bc Scott Bauer        2017-02-03  1502  	u8 *key =3D session->o=
pal_key.key;
455a7b238cd6bc Scott Bauer        2017-02-03  1503  	u32 hsn =3D GENERIC_HO=
ST_SESSION_NUM;
455a7b238cd6bc Scott Bauer        2017-02-03  1504  =

e8b2922459cf15 David Kozub        2019-02-14  1505  	if (session->sum)
455a7b238cd6bc Scott Bauer        2017-02-03  1506  		err =3D build_locking=
_user(lk_ul_user, sizeof(lk_ul_user),
455a7b238cd6bc Scott Bauer        2017-02-03  1507  					 session->opal_key=
.lr);
e8b2922459cf15 David Kozub        2019-02-14  1508  	else if (session->who =
!=3D OPAL_ADMIN1 && !session->sum)
455a7b238cd6bc Scott Bauer        2017-02-03  1509  		err =3D build_locking=
_user(lk_ul_user, sizeof(lk_ul_user),
455a7b238cd6bc Scott Bauer        2017-02-03  1510  					 session->who - 1);
e8b2922459cf15 David Kozub        2019-02-14  1511  	else
e8b2922459cf15 David Kozub        2019-02-14  1512  		memcpy(lk_ul_user, op=
aluid[OPAL_ADMIN1_UID], OPAL_UID_LENGTH);
e8b2922459cf15 David Kozub        2019-02-14  1513  =

455a7b238cd6bc Scott Bauer        2017-02-03  1514  	if (err)
455a7b238cd6bc Scott Bauer        2017-02-03  1515  		return err;
455a7b238cd6bc Scott Bauer        2017-02-03  1516  =

e8b2922459cf15 David Kozub        2019-02-14  1517  	err =3D cmd_start(dev,=
 opaluid[OPAL_SMUID_UID],
e8b2922459cf15 David Kozub        2019-02-14  1518  			opalmethod[OPAL_STAR=
TSESSION]);
455a7b238cd6bc Scott Bauer        2017-02-03  1519  =

455a7b238cd6bc Scott Bauer        2017-02-03  1520  	add_token_u64(&err, de=
v, hsn);
455a7b238cd6bc Scott Bauer        2017-02-03  1521  	add_token_bytestring(&=
err, dev, opaluid[OPAL_LOCKINGSP_UID],
455a7b238cd6bc Scott Bauer        2017-02-03  1522  			     OPAL_UID_LENGTH=
);
455a7b238cd6bc Scott Bauer        2017-02-03  1523  	add_token_u8(&err, dev=
, 1);
455a7b238cd6bc Scott Bauer        2017-02-03  1524  	add_token_u8(&err, dev=
, OPAL_STARTNAME);
455a7b238cd6bc Scott Bauer        2017-02-03  1525  	add_token_u8(&err, dev=
, 0);
455a7b238cd6bc Scott Bauer        2017-02-03  1526  	add_token_bytestring(&=
err, dev, key, keylen);
455a7b238cd6bc Scott Bauer        2017-02-03  1527  	add_token_u8(&err, dev=
, OPAL_ENDNAME);
455a7b238cd6bc Scott Bauer        2017-02-03  1528  	add_token_u8(&err, dev=
, OPAL_STARTNAME);
455a7b238cd6bc Scott Bauer        2017-02-03  1529  	add_token_u8(&err, dev=
, 3);
455a7b238cd6bc Scott Bauer        2017-02-03  1530  	add_token_bytestring(&=
err, dev, lk_ul_user, OPAL_UID_LENGTH);
455a7b238cd6bc Scott Bauer        2017-02-03  1531  	add_token_u8(&err, dev=
, OPAL_ENDNAME);
455a7b238cd6bc Scott Bauer        2017-02-03  1532  =

455a7b238cd6bc Scott Bauer        2017-02-03  1533  	if (err) {
591c59d18f72c9 Scott Bauer        2017-04-07  1534  		pr_debug("Error build=
ing STARTSESSION command.\n");
455a7b238cd6bc Scott Bauer        2017-02-03  1535  		return err;
455a7b238cd6bc Scott Bauer        2017-02-03  1536  	}
455a7b238cd6bc Scott Bauer        2017-02-03  1537  =

455a7b238cd6bc Scott Bauer        2017-02-03  1538  	return finalize_and_se=
nd(dev, start_opal_session_cont);
455a7b238cd6bc Scott Bauer        2017-02-03  1539  }
455a7b238cd6bc Scott Bauer        2017-02-03  1540  =


:::::: The code at line 1499 was first introduced by commit
:::::: eed64951f15d63beac75e0f848ac03c14f8a4a6c block/sed: Embed function d=
ata into the function sequence

:::::: TO: Jon Derrick <jonathan.derrick@intel.com>
:::::: CC: Jens Axboe <axboe@fb.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0312604771310594111==--

