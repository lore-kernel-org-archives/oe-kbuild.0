Content-Type: multipart/mixed; boundary="===============7396831575942265428=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: net/compat.c:444:5: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
Date: Thu, 02 Jun 2022 05:40:09 +0800
Message-ID: <202206020541.rLhvboO3-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7396831575942265428==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check first_new_problem:=
 net/compat.c:444:5: warning: Assigned value is garbage or undefined [clang=
-analyzer-core.uninitialized.Assign]"
:::::: =


CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Kees Cook <keescook@chromium.org>
CC: Miguel Ojeda <ojeda@kernel.org>

Hi Kees,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   8eca6b0a647aabea3d1d2907dd6245fc436f98e7
commit: c80d92fbb67b2c80b8eeb8759ee79d676eb33520 compiler_types.h: Remove _=
_compiletime_object_size()
date:   8 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 8 months ago
config: x86_64-randconfig-c007-20220530 (https://download.01.org/0day-ci/ar=
chive/20220602/202206020541.rLhvboO3-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0776c4=
8f9b7e69fa447bee57c7c0985caa856be9)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dc80d92fbb67b2c80b8eeb8759ee79d676eb33520
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout c80d92fbb67b2c80b8eeb8759ee79d676eb33520
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   include/linux/printk.h:370:3: note: expanded from macro '__printk_index_=
emit'
                   if (__builtin_constant_p(_fmt) && __builtin_constant_p(_=
level)) { \
                   ^
   drivers/scsi/megaraid/megaraid_sas_base.c:8406:3: note: '?' condition is=
 true
                   dev_info(&instance->pdev->dev, "Driver unload is in prog=
ress "
                   ^
   include/linux/dev_printk.h:150:2: note: expanded from macro 'dev_info'
           dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), #=
#__VA_ARGS__)
           ^
   include/linux/dev_printk.h:109:3: note: expanded from macro 'dev_printk_=
index_wrap'
                   dev_printk_index_emit(level, fmt);                      \
                   ^
   include/linux/dev_printk.h:105:2: note: expanded from macro 'dev_printk_=
index_emit'
           printk_index_subsys_emit("%s %s: ", level, fmt)
           ^
   include/linux/printk.h:413:2: note: expanded from macro 'printk_index_su=
bsys_emit'
           __printk_index_emit(fmt, level, subsys_fmt_prefix)
           ^
   include/linux/printk.h:379:12: note: expanded from macro '__printk_index=
_emit'
                                   .fmt =3D __builtin_constant_p(_fmt) ? (_=
fmt) : NULL, \
                                          ^
   drivers/scsi/megaraid/megaraid_sas_base.c:8406:3: note: '?' condition is=
 true
                   dev_info(&instance->pdev->dev, "Driver unload is in prog=
ress "
                   ^
   include/linux/dev_printk.h:150:2: note: expanded from macro 'dev_info'
           dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), #=
#__VA_ARGS__)
           ^
   include/linux/dev_printk.h:109:3: note: expanded from macro 'dev_printk_=
index_wrap'
                   dev_printk_index_emit(level, fmt);                      \
                   ^
   include/linux/dev_printk.h:105:2: note: expanded from macro 'dev_printk_=
index_emit'
           printk_index_subsys_emit("%s %s: ", level, fmt)
           ^
   include/linux/printk.h:413:2: note: expanded from macro 'printk_index_su=
bsys_emit'
           __printk_index_emit(fmt, level, subsys_fmt_prefix)
           ^
   include/linux/printk.h:383:14: note: expanded from macro '__printk_index=
_emit'
                                   .level =3D __builtin_constant_p(_level) =
? (_level) : NULL, \
                                            ^
   drivers/scsi/megaraid/megaraid_sas_base.c:8406:3: note: Loop condition i=
s false.  Exiting loop
                   dev_info(&instance->pdev->dev, "Driver unload is in prog=
ress "
                   ^
   include/linux/dev_printk.h:150:2: note: expanded from macro 'dev_info'
           dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), #=
#__VA_ARGS__)
           ^
   include/linux/dev_printk.h:109:3: note: expanded from macro 'dev_printk_=
index_wrap'
                   dev_printk_index_emit(level, fmt);                      \
                   ^
   include/linux/dev_printk.h:105:2: note: expanded from macro 'dev_printk_=
index_emit'
           printk_index_subsys_emit("%s %s: ", level, fmt)
           ^
   include/linux/printk.h:413:2: note: expanded from macro 'printk_index_su=
bsys_emit'
           __printk_index_emit(fmt, level, subsys_fmt_prefix)
           ^
   include/linux/printk.h:369:2: note: expanded from macro '__printk_index_=
emit'
           do {                                                            \
           ^
   drivers/scsi/megaraid/megaraid_sas_base.c:8408:3: note: Control jumps to=
 line 8455
                   goto out;
                   ^
   drivers/scsi/megaraid/megaraid_sas_base.c:8455:6: note: 'sense' is null
           if (sense) {
               ^~~~~
   drivers/scsi/megaraid/megaraid_sas_base.c:8455:2: note: Taking false bra=
nch
           if (sense) {
           ^
   drivers/scsi/megaraid/megaraid_sas_base.c:8460:2: note: Loop condition i=
s true.  Entering loop body
           for (i =3D 0; i < ioc->sge_count; i++) {
           ^
   drivers/scsi/megaraid/megaraid_sas_base.c:8461:3: note: Taking true bran=
ch
                   if (kbuff_arr[i]) {
                   ^
   drivers/scsi/megaraid/megaraid_sas_base.c:8462:8: note: Assuming field '=
consistent_mask_64bit' is true
                           if (instance->consistent_mask_64bit)
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/megaraid/megaraid_sas_base.c:8462:4: note: Taking true bran=
ch
                           if (instance->consistent_mask_64bit)
                           ^
   drivers/scsi/megaraid/megaraid_sas_base.c:8464:6: note: Dereference of n=
ull pointer
                                           le32_to_cpu(kern_sge64[i].length=
),
                                           ^
   include/linux/byteorder/generic.h:89:21: note: expanded from macro 'le32=
_to_cpu'
   #define le32_to_cpu __le32_to_cpu
                       ^
   include/uapi/linux/byteorder/little_endian.h:34:50: note: expanded from =
macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                    ^~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   net/core/bpf_sk_storage.c:754:4: warning: Value stored to 'b' is never r=
ead [clang-analyzer-deadcode.DeadStores]
                           b =3D &smap->buckets[bucket_id++];
                           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/bpf_sk_storage.c:754:4: note: Value stored to 'b' is never read
                           b =3D &smap->buckets[bucket_id++];
                           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
>> net/compat.c:444:5: warning: Assigned value is garbage or undefined [cla=
ng-analyzer-core.uninitialized.Assign]
           a0 =3D a[0];
              ^
   net/compat.c:424:1: note: Calling '__se_compat_sys_socketcall'
   COMPAT_SYSCALL_DEFINE2(socketcall, int, call, u32 __user *, args)
   ^
   include/linux/compat.h:55:2: note: expanded from macro 'COMPAT_SYSCALL_D=
EFINE2'
           COMPAT_SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:205:2: note: expanded from macro =
'COMPAT_SYSCALL_DEFINEx'
           __IA32_COMPAT_SYS_STUBx(x, name, __VA_ARGS__)                   =
        \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:145:2: note: expanded from macro =
'__IA32_COMPAT_SYS_STUBx'
           __SYS_STUBx(ia32, compat_sys##name,                             \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:79:10: note: expanded from macro =
'__SYS_STUBx'
                   return __se_##name(__VA_ARGS__);                        \
                          ^~~~~~~~~~~~~~~~~~~~~~~~
   note: expanded from here
   net/compat.c:424:1: note: Calling '__do_compat_sys_socketcall'
   COMPAT_SYSCALL_DEFINE2(socketcall, int, call, u32 __user *, args)
   ^
   include/linux/compat.h:55:2: note: expanded from macro 'COMPAT_SYSCALL_D=
EFINE2'
           COMPAT_SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:209:10: note: expanded from macro=
 'COMPAT_SYSCALL_DEFINEx'
                   return __do_compat_sys##name(__MAP(x,__SC_DELOUSE,__VA_A=
RGS__));\
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   note: expanded from here
   net/compat.c:431:6: note: Assuming 'call' is >=3D SYS_SOCKET
           if (call < SYS_SOCKET || call > SYS_SENDMMSG)
               ^~~~~~~~~~~~~~~~~
   net/compat.c:431:6: note: Left side of '||' is false
   net/compat.c:431:27: note: Assuming 'call' is <=3D SYS_SENDMMSG
           if (call < SYS_SOCKET || call > SYS_SENDMMSG)
                                    ^~~~~~~~~~~~~~~~~~~
   net/compat.c:431:2: note: Taking false branch
           if (call < SYS_SOCKET || call > SYS_SENDMMSG)
           ^
   net/compat.c:434:6: note: Assuming the condition is false
           if (len > sizeof(a))
               ^~~~~~~~~~~~~~~
   net/compat.c:434:2: note: Taking false branch
           if (len > sizeof(a))
           ^
   net/compat.c:437:6: note: Calling 'copy_from_user'
           if (copy_from_user(a, args, len))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:191:2: note: Taking false branch
           if (likely(check_copy_size(to, n, false)))
           ^
   include/linux/uaccess.h:193:2: note: Returning without writing to '*to'
           return n;
           ^
   net/compat.c:437:6: note: Returning from 'copy_from_user'
           if (copy_from_user(a, args, len))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/compat.c:437:6: note: Assuming the condition is false
           if (copy_from_user(a, args, len))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/compat.c:437:2: note: Taking false branch
           if (copy_from_user(a, args, len))
           ^
   net/compat.c:440:8: note: Calling 'audit_socketcall_compat'
           ret =3D audit_socketcall_compat(len / sizeof(a[0]), a);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/audit.h:616:2: note: Returning without writing to '*args'
           return 0;
           ^
   include/linux/audit.h:616:2: note: Returning zero, which participates in=
 a condition later
           return 0;
           ^~~~~~~~
   net/compat.c:440:8: note: Returning from 'audit_socketcall_compat'
           ret =3D audit_socketcall_compat(len / sizeof(a[0]), a);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/compat.c:441:6: note: 'ret' is 0
           if (ret)
               ^~~
   net/compat.c:441:2: note: Taking false branch
           if (ret)
           ^
   net/compat.c:444:5: note: Assigned value is garbage or undefined
           a0 =3D a[0];
              ^ ~~~~
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   net/core/filter.c:1737:2: warning: Null pointer passed as 1st argument t=
o memory set function [clang-analyzer-unix.cstring.NullArg]
           memset(to, 0, len);
           ^
   net/core/filter.c:10218:57: note: Passing value via 3rd parameter 'to'
           return ____bpf_skb_load_bytes(reuse_kern->skb, offset, to, len);
                                                                  ^~
   net/core/filter.c:10218:9: note: Calling '____bpf_skb_load_bytes'
           return ____bpf_skb_load_bytes(reuse_kern->skb, offset, to, len);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/filter.c:1726:15: note: Assuming 'offset' is <=3D 65535
           if (unlikely(offset > 0xffff))
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
--
           ^
   fs/cifs/cifs_debug.h:79:3: note: expanded from macro 'cifs_dbg'
                   cifs_dbg_func(ratelimited, type, fmt, ##__VA_ARGS__);   \
                   ^
   fs/cifs/cifs_debug.h:62:52: note: expanded from macro 'cifs_dbg_func'
   #define cifs_dbg_func(ratefunc, type, fmt, ...)                         \
                                                                           ^
   fs/cifs/cifssmb.c:2409:2: note: Loop condition is false.  Exiting loop
           cifs_dbg(FYI, "Posix Lock\n");
           ^
   fs/cifs/cifs_debug.h:74:38: note: expanded from macro 'cifs_dbg'
   #define cifs_dbg(type, fmt, ...)                                        \
                                                                           ^
   fs/cifs/cifssmb.c:2411:7: note: Calling 'small_smb_init'
           rc =3D small_smb_init(SMB_COM_TRANSACTION2, 15, tcon, (void **) =
&pSMB);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   fs/cifs/cifssmb.c:253:6: note: Assuming 'rc' is 0
           if (rc)
               ^~
   fs/cifs/cifssmb.c:253:2: note: Taking false branch
           if (rc)
           ^
   fs/cifs/cifssmb.c:257:6: note: Assuming the condition is false
           if (*request_buf =3D=3D NULL) {
               ^~~~~~~~~~~~~~~~~~~~
   fs/cifs/cifssmb.c:257:2: note: Taking false branch
           if (*request_buf =3D=3D NULL) {
           ^
   fs/cifs/cifssmb.c:265:6: note: Assuming 'tcon' is equal to NULL
           if (tcon !=3D NULL)
               ^~~~~~~~~~~~
   fs/cifs/cifssmb.c:265:2: note: Taking false branch
           if (tcon !=3D NULL)
           ^
   fs/cifs/cifssmb.c:268:2: note: Returning zero, which participates in a c=
ondition later
           return 0;
           ^~~~~~~~
   fs/cifs/cifssmb.c:2411:7: note: Returning from 'small_smb_init'
           rc =3D small_smb_init(SMB_COM_TRANSACTION2, 15, tcon, (void **) =
&pSMB);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   fs/cifs/cifssmb.c:2413:6: note: 'rc' is 0
           if (rc)
               ^~
   fs/cifs/cifssmb.c:2413:2: note: Taking false branch
           if (rc)
           ^
   fs/cifs/cifssmb.c:2431:6: note: Assuming 'pLockData' is null
           if (pLockData)
               ^~~~~~~~~
   fs/cifs/cifssmb.c:2431:2: note: Taking false branch
           if (pLockData)
           ^
   fs/cifs/cifssmb.c:2446:6: note: Assuming 'waitFlag' is true
           if (waitFlag) {
               ^~~~~~~~
   fs/cifs/cifssmb.c:2446:2: note: Taking true branch
           if (waitFlag) {
           ^
   fs/cifs/cifssmb.c:2463:6: note: 'waitFlag' is true
           if (waitFlag) {
               ^~~~~~~~
   fs/cifs/cifssmb.c:2463:2: note: Taking true branch
           if (waitFlag) {
           ^
   fs/cifs/cifssmb.c:2475:6: note: Assuming 'rc' is 0
           if (rc) {
               ^~
   fs/cifs/cifssmb.c:2475:2: note: Taking false branch
           if (rc) {
           ^
   fs/cifs/cifssmb.c:2477:13: note: 'pLockData' is null
           } else if (pLockData) {
                      ^~~~~~~~~
   fs/cifs/cifssmb.c:2477:9: note: Taking false branch
           } else if (pLockData) {
                  ^
   fs/cifs/cifssmb.c:2513:2: note: 2nd function call argument is an uniniti=
alized value
           free_rsp_buf(resp_buf_type, rsp_iov.iov_base);
           ^                           ~~~~~~~~~~~~~~~~
   fs/cifs/cifssmb.c:4526:3: warning: Value stored to 'byte_count' is never=
 read [clang-analyzer-deadcode.DeadStores]
                   byte_count +=3D name_len;
                   ^             ~~~~~~~~
   fs/cifs/cifssmb.c:4526:3: note: Value stored to 'byte_count' is never re=
ad
                   byte_count +=3D name_len;
                   ^             ~~~~~~~~
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   net/core/bpf_sk_storage.c:754:4: warning: Value stored to 'b' is never r=
ead [clang-analyzer-deadcode.DeadStores]
                           b =3D &smap->buckets[bucket_id++];
                           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/bpf_sk_storage.c:754:4: note: Value stored to 'b' is never read
                           b =3D &smap->buckets[bucket_id++];
                           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
>> net/compat.c:444:5: warning: Assigned value is garbage or undefined [cla=
ng-analyzer-core.uninitialized.Assign]
           a0 =3D a[0];
              ^
   net/compat.c:424:1: note: Calling '__se_compat_sys_socketcall'
   COMPAT_SYSCALL_DEFINE2(socketcall, int, call, u32 __user *, args)
   ^
   include/linux/compat.h:55:2: note: expanded from macro 'COMPAT_SYSCALL_D=
EFINE2'
           COMPAT_SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:205:2: note: expanded from macro =
'COMPAT_SYSCALL_DEFINEx'
           __IA32_COMPAT_SYS_STUBx(x, name, __VA_ARGS__)                   =
        \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:145:2: note: expanded from macro =
'__IA32_COMPAT_SYS_STUBx'
           __SYS_STUBx(ia32, compat_sys##name,                             \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:79:10: note: expanded from macro =
'__SYS_STUBx'
                   return __se_##name(__VA_ARGS__);                        \
                          ^~~~~~~~~~~~~~~~~~~~~~~~
   note: expanded from here
   net/compat.c:424:1: note: Calling '__do_compat_sys_socketcall'
   COMPAT_SYSCALL_DEFINE2(socketcall, int, call, u32 __user *, args)
   ^
   include/linux/compat.h:55:2: note: expanded from macro 'COMPAT_SYSCALL_D=
EFINE2'
           COMPAT_SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:209:10: note: expanded from macro=
 'COMPAT_SYSCALL_DEFINEx'
                   return __do_compat_sys##name(__MAP(x,__SC_DELOUSE,__VA_A=
RGS__));\
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   note: expanded from here
   net/compat.c:431:6: note: Assuming 'call' is >=3D SYS_SOCKET
           if (call < SYS_SOCKET || call > SYS_SENDMMSG)
               ^~~~~~~~~~~~~~~~~
   net/compat.c:431:6: note: Left side of '||' is false
   net/compat.c:431:27: note: Assuming 'call' is <=3D SYS_SENDMMSG
           if (call < SYS_SOCKET || call > SYS_SENDMMSG)
                                    ^~~~~~~~~~~~~~~~~~~
   net/compat.c:431:2: note: Taking false branch
           if (call < SYS_SOCKET || call > SYS_SENDMMSG)
           ^
   net/compat.c:434:6: note: Assuming the condition is false
           if (len > sizeof(a))
               ^~~~~~~~~~~~~~~
   net/compat.c:434:2: note: Taking false branch
           if (len > sizeof(a))
           ^
   net/compat.c:437:6: note: Calling 'copy_from_user'
           if (copy_from_user(a, args, len))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:191:2: note: Taking false branch
           if (likely(check_copy_size(to, n, false)))
           ^
   include/linux/uaccess.h:193:2: note: Returning without writing to '*to'
           return n;
           ^
   net/compat.c:437:6: note: Returning from 'copy_from_user'
           if (copy_from_user(a, args, len))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/compat.c:437:6: note: Assuming the condition is false
           if (copy_from_user(a, args, len))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/compat.c:437:2: note: Taking false branch
           if (copy_from_user(a, args, len))
           ^
   net/compat.c:440:8: note: Calling 'audit_socketcall_compat'
           ret =3D audit_socketcall_compat(len / sizeof(a[0]), a);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/audit.h:616:2: note: Returning without writing to '*args'
           return 0;
           ^
   include/linux/audit.h:616:2: note: Returning zero, which participates in=
 a condition later
           return 0;
           ^~~~~~~~
   net/compat.c:440:8: note: Returning from 'audit_socketcall_compat'
           ret =3D audit_socketcall_compat(len / sizeof(a[0]), a);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/compat.c:441:6: note: 'ret' is 0
           if (ret)
               ^~~
   net/compat.c:441:2: note: Taking false branch
           if (ret)
           ^
   net/compat.c:444:5: note: Assigned value is garbage or undefined
           a0 =3D a[0];
              ^ ~~~~
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   fs/namei.c:557:2: warning: 1st function call argument is an uninitialize=
d value [clang-analyzer-core.CallAndMessage]
           dput(path->dentry);
           ^
   fs/namei.c:4481:1: note: Calling '__se_sys_link'
   SYSCALL_DEFINE2(link, const char __user *, oldname, const char __user *,=
 newname)
   ^
   include/linux/syscalls.h:217:36: note: expanded from macro 'SYSCALL_DEFI=
NE2'
   #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS=
__)
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   include/linux/syscalls.h:227:2: note: expanded from macro 'SYSCALL_DEFIN=
Ex'
           __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:232:2: note: expanded from macro =
'__SYSCALL_DEFINEx'
           __IA32_SYS_STUBx(x, name, __VA_ARGS__)                          \

vim +444 net/compat.c

157b334aa84dc5 Dominik Brodowski  2018-03-16  423  =

361d93c46f688d Heiko Carstens     2014-03-03  424  COMPAT_SYSCALL_DEFINE2(s=
ocketcall, int, call, u32 __user *, args)
^1da177e4c3f41 Linus Torvalds     2005-04-16  425  {
62bc306e208343 Richard Guy Briggs 2017-01-17  426  	u32 a[AUDITSC_ARGS];
62bc306e208343 Richard Guy Briggs 2017-01-17  427  	unsigned int len;
^1da177e4c3f41 Linus Torvalds     2005-04-16  428  	u32 a0, a1;
62bc306e208343 Richard Guy Briggs 2017-01-17  429  	int ret;
^1da177e4c3f41 Linus Torvalds     2005-04-16  430  =

228e548e602061 Anton Blanchard    2011-05-02  431  	if (call < SYS_SOCKET |=
| call > SYS_SENDMMSG)
^1da177e4c3f41 Linus Torvalds     2005-04-16  432  		return -EINVAL;
62bc306e208343 Richard Guy Briggs 2017-01-17  433  	len =3D nas[call];
62bc306e208343 Richard Guy Briggs 2017-01-17  434  	if (len > sizeof(a))
62bc306e208343 Richard Guy Briggs 2017-01-17  435  		return -EINVAL;
62bc306e208343 Richard Guy Briggs 2017-01-17  436  =

62bc306e208343 Richard Guy Briggs 2017-01-17  437  	if (copy_from_user(a, a=
rgs, len))
^1da177e4c3f41 Linus Torvalds     2005-04-16  438  		return -EFAULT;
62bc306e208343 Richard Guy Briggs 2017-01-17  439  =

62bc306e208343 Richard Guy Briggs 2017-01-17  440  	ret =3D audit_socketcal=
l_compat(len / sizeof(a[0]), a);
62bc306e208343 Richard Guy Briggs 2017-01-17  441  	if (ret)
62bc306e208343 Richard Guy Briggs 2017-01-17  442  		return ret;
62bc306e208343 Richard Guy Briggs 2017-01-17  443  =

^1da177e4c3f41 Linus Torvalds     2005-04-16 @444  	a0 =3D a[0];

:::::: The code at line 444 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7396831575942265428==--

