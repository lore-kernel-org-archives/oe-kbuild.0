Content-Type: multipart/mixed; boundary="===============0669519120668827929=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 net] af_unix: Do not call kmemdup() for init_net's sysctl table.
Date: Wed, 20 Jul 2022 14:35:22 +0800
Message-ID: <202207201427.L9FolDQx-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0669519120668827929==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: net/unix/=
sysctl_net_unix.c:47:3: warning: Argument to kfree() is the address of the =
global variable 'unix_table', which is not memory allocated by malloc() [cl=
ang-analyzer-unix.Malloc]"
:::::: =


CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220626082331.36119-1-kuniyu@amazon.com>
References: <20220626082331.36119-1-kuniyu@amazon.com>
TO: Kuniyuki Iwashima <kuniyu@amazon.com>

Hi Kuniyuki,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on net/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Kuniyuki-Iwashima/af=
_unix-Do-not-call-kmemdup-for-init_net-s-sysctl-table/20220626-162736
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net.git 3b89b=
511ea0c705cc418440e2abf9d692a556d84
:::::: branch date: 3 weeks ago
:::::: commit date: 3 weeks ago
config: s390-randconfig-c005-20220715 (https://download.01.org/0day-ci/arch=
ive/20220720/202207201427.L9FolDQx-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 07022e=
6cf9b5b3baa642be53d0b3c3f1c403dbfd)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/ba827e6db65fb677e56=
f718249dcacecad4d364d
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Kuniyuki-Iwashima/af_unix-Do-not-c=
all-kmemdup-for-init_net-s-sysctl-table/20220626-162736
        git checkout ba827e6db65fb677e56f718249dcacecad4d364d
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Ds390 clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                              ^~~~~
   lib/cpumask.c:270:9: warning: Dereference of null pointer [clang-analyze=
r-core.NullDereference]
           prev =3D __this_cpu_read(distribute_cpu_mask_prev);
                  ^
   include/linux/percpu-defs.h:446:2: note: expanded from macro '__this_cpu=
_read'
           raw_cpu_read(pcp);                                              \
           ^~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:420:28: note: expanded from macro 'raw_cpu_r=
ead'
   #define raw_cpu_read(pcp)               __pcpu_size_call_return(raw_cpu_=
read_, pcp)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~
   include/linux/percpu-defs.h:323:23: note: expanded from macro '__pcpu_si=
ze_call_return'
           case 4: pscr_ret__ =3D stem##4(variable); break;                =
  \
                                ^~~~~~~~~~~~~~~~~
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/asm-generic/percpu.h:44:31: note: expanded from macro 'arch_raw_=
cpu_ptr'
   #define arch_raw_cpu_ptr(ptr) SHIFT_PERCPU_PTR(ptr, __my_cpu_offset)
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:231:2: note: expanded from macro 'SHIFT_PERC=
PU_PTR'
           RELOC_HIDE((typeof(*(__p)) __kernel __force *)(__p), (__offset))
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:170:28: note: expanded from macro 'RELOC_HIDE'
       (typeof(ptr)) (__ptr + (off)); })
                              ^~~~~
   lib/cpumask.c:270:9: note: Loop condition is false.  Exiting loop
           prev =3D __this_cpu_read(distribute_cpu_mask_prev);
                  ^
   include/linux/percpu-defs.h:446:2: note: expanded from macro '__this_cpu=
_read'
           raw_cpu_read(pcp);                                              \
           ^
   include/linux/percpu-defs.h:420:28: note: expanded from macro 'raw_cpu_r=
ead'
   #define raw_cpu_read(pcp)               __pcpu_size_call_return(raw_cpu_=
read_, pcp)
                                           ^
   include/linux/percpu-defs.h:319:2: note: expanded from macro '__pcpu_siz=
e_call_return'
           __verify_pcpu_ptr(&(variable));                                 \
           ^
   include/linux/percpu-defs.h:217:37: note: expanded from macro '__verify_=
pcpu_ptr'
   #define __verify_pcpu_ptr(ptr)                                          \
                                                                           ^
   lib/cpumask.c:270:9: note: Control jumps to 'case 4:'  at line 270
           prev =3D __this_cpu_read(distribute_cpu_mask_prev);
                  ^
   include/linux/percpu-defs.h:446:2: note: expanded from macro '__this_cpu=
_read'
           raw_cpu_read(pcp);                                              \
           ^
   include/linux/percpu-defs.h:420:28: note: expanded from macro 'raw_cpu_r=
ead'
   #define raw_cpu_read(pcp)               __pcpu_size_call_return(raw_cpu_=
read_, pcp)
                                           ^
   include/linux/percpu-defs.h:320:2: note: expanded from macro '__pcpu_siz=
e_call_return'
           switch(sizeof(variable)) {                                      \
           ^
   lib/cpumask.c:270:9: note: Loop condition is false.  Exiting loop
           prev =3D __this_cpu_read(distribute_cpu_mask_prev);
                  ^
   include/linux/percpu-defs.h:446:2: note: expanded from macro '__this_cpu=
_read'
           raw_cpu_read(pcp);                                              \
           ^
   include/linux/percpu-defs.h:420:28: note: expanded from macro 'raw_cpu_r=
ead'
   #define raw_cpu_read(pcp)               __pcpu_size_call_return(raw_cpu_=
read_, pcp)
                                           ^
   include/linux/percpu-defs.h:323:23: note: expanded from macro '__pcpu_si=
ze_call_return'
           case 4: pscr_ret__ =3D stem##4(variable); break;                =
  \
                                ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/asm-generic/percpu.h:67:3: note: expanded from macro 'raw_cpu_ge=
neric_read'
           *raw_cpu_ptr(&(pcp));                                           \
            ^
   include/linux/percpu-defs.h:241:2: note: expanded from macro 'raw_cpu_pt=
r'
           __verify_pcpu_ptr(ptr);                                         \
           ^
   include/linux/percpu-defs.h:217:37: note: expanded from macro '__verify_=
pcpu_ptr'
   #define __verify_pcpu_ptr(ptr)                                          \
                                                                           ^
   lib/cpumask.c:270:9: note: Dereference of null pointer
           prev =3D __this_cpu_read(distribute_cpu_mask_prev);
                  ^
   include/linux/percpu-defs.h:446:2: note: expanded from macro '__this_cpu=
_read'
           raw_cpu_read(pcp);                                              \
           ^~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:420:28: note: expanded from macro 'raw_cpu_r=
ead'
   #define raw_cpu_read(pcp)               __pcpu_size_call_return(raw_cpu_=
read_, pcp)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~
   include/linux/percpu-defs.h:323:23: note: expanded from macro '__pcpu_si=
ze_call_return'
           case 4: pscr_ret__ =3D stem##4(variable); break;                =
  \
                                ^~~~~~~~~~~~~~~~~
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/asm-generic/percpu.h:44:31: note: expanded from macro 'arch_raw_=
cpu_ptr'
   #define arch_raw_cpu_ptr(ptr) SHIFT_PERCPU_PTR(ptr, __my_cpu_offset)
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:231:2: note: expanded from macro 'SHIFT_PERC=
PU_PTR'
           RELOC_HIDE((typeof(*(__p)) __kernel __force *)(__p), (__offset))
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:170:28: note: expanded from macro 'RELOC_HIDE'
       (typeof(ptr)) (__ptr + (off)); })
                              ^~~~~
   Suppressed 57 warnings (45 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   102 warnings generated.
   Suppressed 102 warnings (90 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   103 warnings generated.
>> net/unix/sysctl_net_unix.c:47:3: warning: Argument to kfree() is the add=
ress of the global variable 'unix_table', which is not memory allocated by =
malloc() [clang-analyzer-unix.Malloc]
                   kfree(table);
                   ^     ~~~~~
   net/unix/sysctl_net_unix.c:29:6: note: Assuming the condition is true
           if (net_eq(net, &init_net)) {
               ^~~~~~~~~~~~~~~~~~~~~~
   net/unix/sysctl_net_unix.c:29:2: note: Taking true branch
           if (net_eq(net, &init_net)) {
           ^
   net/unix/sysctl_net_unix.c:40:6: note: Assuming field 'ctl' is equal to =
NULL
           if (net->unx.ctl =3D=3D NULL)
               ^~~~~~~~~~~~~~~~~~~~
   net/unix/sysctl_net_unix.c:40:2: note: Taking true branch
           if (net->unx.ctl =3D=3D NULL)
           ^
   net/unix/sysctl_net_unix.c:41:3: note: Control jumps to line 46
                   goto err_reg;
                   ^
   net/unix/sysctl_net_unix.c:46:6: note: Assuming the condition is true
           if (net_eq(net, &init_net))
               ^~~~~~~~~~~~~~~~~~~~~~
   net/unix/sysctl_net_unix.c:46:2: note: Taking true branch
           if (net_eq(net, &init_net))
           ^
   net/unix/sysctl_net_unix.c:47:3: note: Argument to kfree() is the addres=
s of the global variable 'unix_table', which is not memory allocated by mal=
loc()
                   kfree(table);
                   ^     ~~~~~
   Suppressed 102 warnings (90 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   103 warnings generated.
   net/decnet/dn_nsp_out.c:85:2: warning: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&fld, 0, sizeof(fld));
           ^
   include/linux/fortify-string.h:288:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:281:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   net/decnet/dn_nsp_out.c:85:2: note: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11
           memset(&fld, 0, sizeof(fld));
           ^
   include/linux/fortify-string.h:288:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:281:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   net/decnet/dn_nsp_out.c:555:3: warning: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(msg, dd, ddl);
                   ^
   include/linux/fortify-string.h:385:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:378:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   net/decnet/dn_nsp_out.c:555:3: note: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11
                   memcpy(msg, dd, ddl);
                   ^
   include/linux/fortify-string.h:385:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:378:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   Suppressed 101 warnings (89 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   99 warnings generated.
   Suppressed 99 warnings (87 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   102 warnings generated.
   include/net/sch_generic.h:868:2: warning: Dereference of null pointer [c=
lang-analyzer-core.NullDereference]
           this_cpu_sub(sch->cpu_qstats->backlog, qdisc_pkt_len(skb));
           ^
   include/linux/percpu-defs.h:519:33: note: expanded from macro 'this_cpu_=
sub'
   #define this_cpu_sub(pcp, val)          this_cpu_add(pcp, -(typeof(pcp))=
(val))
                                           ^
   include/linux/percpu-defs.h:509:33: note: expanded from macro 'this_cpu_=
add'
   #define this_cpu_add(pcp, val)          __pcpu_size_call(this_cpu_add_, =
pcp, val)
                                           ^
   include/linux/percpu-defs.h:379:11: note: expanded from macro '__pcpu_si=
ze_call'
                   case 4: stem##4(variable, __VA_ARGS__);break;           \
                           ^
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/asm-generic/percpu.h:44:31: note: expanded from macro 'arch_raw_=
cpu_ptr'
   #define arch_raw_cpu_ptr(ptr) SHIFT_PERCPU_PTR(ptr, __my_cpu_offset)

vim +/unix_table +47 net/unix/sysctl_net_unix.c

^1da177e4c3f41 Linus Torvalds    2005-04-16  24  =

2c8c1e7297e19b Alexey Dobriyan   2010-01-17  25  int __net_init unix_sysctl=
_register(struct net *net)
^1da177e4c3f41 Linus Torvalds    2005-04-16  26  {
1597fbc0faf88c Pavel Emelyanov   2007-12-01  27  	struct ctl_table *table;
1597fbc0faf88c Pavel Emelyanov   2007-12-01  28  =

ba827e6db65fb6 Kuniyuki Iwashima 2022-06-26  29  	if (net_eq(net, &init_net=
)) {
ba827e6db65fb6 Kuniyuki Iwashima 2022-06-26  30  		table =3D unix_table;
ba827e6db65fb6 Kuniyuki Iwashima 2022-06-26  31  	} else {
1597fbc0faf88c Pavel Emelyanov   2007-12-01  32  		table =3D kmemdup(unix_t=
able, sizeof(unix_table), GFP_KERNEL);
ba827e6db65fb6 Kuniyuki Iwashima 2022-06-26  33  		if (!table)
1597fbc0faf88c Pavel Emelyanov   2007-12-01  34  			goto err_alloc;
1597fbc0faf88c Pavel Emelyanov   2007-12-01  35  =

a0a53c8ba95451 Denis V. Lunev    2007-12-11  36  		table[0].data =3D &net->=
unx.sysctl_max_dgram_qlen;
ba827e6db65fb6 Kuniyuki Iwashima 2022-06-26  37  	}
ba827e6db65fb6 Kuniyuki Iwashima 2022-06-26  38  =

ec8f23ce0f4005 Eric W. Biederman 2012-04-19  39  	net->unx.ctl =3D register=
_net_sysctl(net, "net/unix", table);
a0a53c8ba95451 Denis V. Lunev    2007-12-11  40  	if (net->unx.ctl =3D=3D N=
ULL)
1597fbc0faf88c Pavel Emelyanov   2007-12-01  41  		goto err_reg;
1597fbc0faf88c Pavel Emelyanov   2007-12-01  42  =

1597fbc0faf88c Pavel Emelyanov   2007-12-01  43  	return 0;
1597fbc0faf88c Pavel Emelyanov   2007-12-01  44  =

1597fbc0faf88c Pavel Emelyanov   2007-12-01  45  err_reg:
ba827e6db65fb6 Kuniyuki Iwashima 2022-06-26  46  	if (net_eq(net, &init_net=
))
1597fbc0faf88c Pavel Emelyanov   2007-12-01 @47  		kfree(table);
1597fbc0faf88c Pavel Emelyanov   2007-12-01  48  err_alloc:
1597fbc0faf88c Pavel Emelyanov   2007-12-01  49  	return -ENOMEM;
^1da177e4c3f41 Linus Torvalds    2005-04-16  50  }
^1da177e4c3f41 Linus Torvalds    2005-04-16  51  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0669519120668827929==--

