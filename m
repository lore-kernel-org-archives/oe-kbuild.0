Content-Type: multipart/mixed; boundary="===============8323834304408987596=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [RFC PATCH bpf-next v2 4/9] bpf: Replace PTR_TO_XXX_OR_NULL with PTR_TO_XXX | PTR_MAYBE_NULL
Date: Fri, 03 Dec 2021 07:50:34 +0800
Message-ID: <202112030712.qtXfXqLl-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8323834304408987596==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20211130012948.380602-5-haoluo@google.com>
References: <20211130012948.380602-5-haoluo@google.com>
TO: Hao Luo <haoluo@google.com>

Hi Hao,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on bpf-next/master]

url:    https://github.com/0day-ci/linux/commits/Hao-Luo/Introduce-composab=
le-bpf-types/20211130-093143
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git ma=
ster
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-c007-20211202 (https://download.01.org/0day-ci/ar=
chive/20211203/202112030712.qtXfXqLl-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 4b5532=
97ef3ee4dc2119d5429adf3072e90fac38)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/9e92c0a723fc173ac102b3bb2=
7df479a01f32896
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Hao-Luo/Introduce-composable-bpf-t=
ypes/20211130-093143
        git checkout 9e92c0a723fc173ac102b3bb27df479a01f32896
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   include/linux/rcupdate.h:390:48: note: expanded from macro '__rcu_derefe=
rence_check'
           typeof(*p) *________p1 =3D (typeof(*p) *__force)READ_ONCE(p); \
                                                         ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:335:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:323:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:307:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/pci/p2pdma.c:536:11: note: Dereference of null pointer
           p2pdma =3D rcu_dereference(provider->p2pdma);
                    ^
   include/linux/rcupdate.h:597:28: note: expanded from macro 'rcu_derefere=
nce'
   #define rcu_dereference(p) rcu_dereference_check(p, 0)
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:529:2: note: expanded from macro 'rcu_dereferen=
ce_check'
           __rcu_dereference_check((p), (c) || rcu_read_lock_held(), __rcu)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:390:48: note: expanded from macro '__rcu_derefe=
rence_check'
           typeof(*p) *________p1 =3D (typeof(*p) *__force)READ_ONCE(p); \
                                                         ^~~~~~~~~~~~
   include/asm-generic/rwonce.h:50:2: note: expanded from macro 'READ_ONCE'
           __READ_ONCE(x);                                                 \
           ^~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:44:24: note: expanded from macro '__READ_ON=
CE'
   #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(=
x))
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   kernel/trace/trace.c:361:2: warning: Access to field 'next' results in a=
 dereference of a null pointer [clang-analyzer-core.NullDereference]
           rcu_assign_pointer(*p, (*p)->next);
           ^
   include/linux/rcupdate.h:447:35: note: expanded from macro 'rcu_assign_p=
ointer'
           uintptr_t _r_a_p__v =3D (uintptr_t)(v);                         =
        \
                                            ^
   kernel/trace/trace.c:404:2: note: Value assigned to 'ftrace_exports_list'
           mutex_lock(&ftrace_export_lock);
           ^
   include/linux/mutex.h:187:26: note: expanded from macro 'mutex_lock'
   #define mutex_lock(lock) mutex_lock_nested(lock, 0)
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:406:8: note: Calling 'rm_ftrace_export'
           ret =3D rm_ftrace_export(&ftrace_exports_list, export);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:379:8: note: Calling 'rm_trace_export'
           ret =3D rm_trace_export(list, export);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:354:17: note: Assuming the condition is false
           for (p =3D list; *p !=3D NULL; p =3D &(*p)->next)
                          ^~~~~~~~~~
   kernel/trace/trace.c:354:17: note: Assuming pointer value is null
           for (p =3D list; *p !=3D NULL; p =3D &(*p)->next)
                          ^~~~~~~~~~
   kernel/trace/trace.c:354:2: note: Loop condition is false. Execution con=
tinues on line 358
           for (p =3D list; *p !=3D NULL; p =3D &(*p)->next)
           ^
   kernel/trace/trace.c:358:6: note: Assuming the condition is false
           if (*p !=3D export)
               ^~~~~~~~~~~~
   kernel/trace/trace.c:358:2: note: Taking false branch
           if (*p !=3D export)
           ^
   kernel/trace/trace.c:361:2: note: Access to field 'next' results in a de=
reference of a null pointer
           rcu_assign_pointer(*p, (*p)->next);
           ^
   include/linux/rcupdate.h:447:35: note: expanded from macro 'rcu_assign_p=
ointer'
           uintptr_t _r_a_p__v =3D (uintptr_t)(v);                         =
        \
                                            ^~~
   kernel/trace/trace.c:2420:3: warning: Call to function 'strcpy' is insec=
ure as it does not provide bounding of the memory buffer. Replace unbounded=
 copy functions with analogous functions that support length arguments such=
 as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(comm, "<idle>");
                   ^~~~~~
   kernel/trace/trace.c:2420:3: note: Call to function 'strcpy' is insecure=
 as it does not provide bounding of the memory buffer. Replace unbounded co=
py functions with analogous functions that support length arguments such as=
 'strlcpy'. CWE-119
                   strcpy(comm, "<idle>");
                   ^~~~~~
   kernel/trace/trace.c:2425:3: warning: Call to function 'strcpy' is insec=
ure as it does not provide bounding of the memory buffer. Replace unbounded=
 copy functions with analogous functions that support length arguments such=
 as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(comm, "<XXX>");
                   ^~~~~~
   kernel/trace/trace.c:2425:3: note: Call to function 'strcpy' is insecure=
 as it does not provide bounding of the memory buffer. Replace unbounded co=
py functions with analogous functions that support length arguments such as=
 'strlcpy'. CWE-119
                   strcpy(comm, "<XXX>");
                   ^~~~~~
   kernel/trace/trace.c:2438:2: warning: Call to function 'strcpy' is insec=
ure as it does not provide bounding of the memory buffer. Replace unbounded=
 copy functions with analogous functions that support length arguments such=
 as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(comm, "<...>");
           ^~~~~~
   kernel/trace/trace.c:2438:2: note: Call to function 'strcpy' is insecure=
 as it does not provide bounding of the memory buffer. Replace unbounded co=
py functions with analogous functions that support length arguments such as=
 'strlcpy'. CWE-119
           strcpy(comm, "<...>");
           ^~~~~~
   kernel/trace/trace.c:3854:4: warning: Call to function 'strcpy' is insec=
ure as it does not provide bounding of the memory buffer. Replace unbounded=
 copy functions with analogous functions that support length arguments such=
 as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcpy(iter->fmt, "%s");
                           ^~~~~~
   kernel/trace/trace.c:3854:4: note: Call to function 'strcpy' is insecure=
 as it does not provide bounding of the memory buffer. Replace unbounded co=
py functions with analogous functions that support length arguments such as=
 'strlcpy'. CWE-119
                           strcpy(iter->fmt, "%s");
                           ^~~~~~
   Suppressed 4 warnings (3 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
>> kernel/bpf/verifier.c:560:2: warning: Undefined or garbage value returne=
d to caller [clang-analyzer-core.uninitialized.UndefReturn]
           return str[BPF_BASE_TYPE(type)];
           ^
   kernel/bpf/verifier.c:11029:17: note: Assuming the condition is false
           bool pop_log =3D !(env->log.level & BPF_LOG_LEVEL2);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/verifier.c:11037:2: note: Loop condition is true.  Entering l=
oop body
           for (;;) {
           ^
   kernel/bpf/verifier.c:11043:7: note: Assuming 'insn_cnt' is > field 'ins=
n_idx'
                   if (env->insn_idx >=3D insn_cnt) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/verifier.c:11043:3: note: Taking false branch
                   if (env->insn_idx >=3D insn_cnt) {
                   ^
   kernel/bpf/verifier.c:11052:7: note: Assuming the condition is false
                   if (++env->insn_processed > BPF_COMPLEXITY_LIMIT_INSNS) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/verifier.c:11052:3: note: Taking false branch
                   if (++env->insn_processed > BPF_COMPLEXITY_LIMIT_INSNS) {
                   ^
   kernel/bpf/verifier.c:11060:7: note: Assuming 'err' is >=3D 0
                   if (err < 0)
                       ^~~~~~~
   kernel/bpf/verifier.c:11060:3: note: Taking false branch
                   if (err < 0)
                   ^
   kernel/bpf/verifier.c:11062:7: note: Assuming 'err' is not equal to 1
                   if (err =3D=3D 1) {
                       ^~~~~~~~
   kernel/bpf/verifier.c:11062:3: note: Taking false branch
                   if (err =3D=3D 1) {
                   ^
   kernel/bpf/verifier.c:11076:7: note: Assuming the condition is false
                   if (signal_pending(current))
                       ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/verifier.c:11076:3: note: Taking false branch
                   if (signal_pending(current))
                   ^
   kernel/bpf/verifier.c:11079:7: note: Assuming the condition is false
                   if (need_resched())
                       ^~~~~~~~~~~~~~
   kernel/bpf/verifier.c:11079:3: note: Taking false branch
                   if (need_resched())
                   ^
   kernel/bpf/verifier.c:11082:7: note: Assuming the condition is false
                   if (env->log.level & BPF_LOG_LEVEL2 ||
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/verifier.c:11082:7: note: Left side of '||' is false
   kernel/bpf/verifier.c:11083:8: note: Assuming the condition is false
                       (env->log.level & BPF_LOG_LEVEL && do_print_state)) {
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/verifier.c:11083:39: note: Left side of '&&' is false
                       (env->log.level & BPF_LOG_LEVEL && do_print_state)) {
                                                       ^
   kernel/bpf/verifier.c:11095:3: note: Taking false branch
                   if (env->log.level & BPF_LOG_LEVEL) {
                   ^
   kernel/bpf/verifier.c:11107:7: note: Assuming the condition is false
                   if (bpf_prog_is_dev_bound(env->prog->aux)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/verifier.c:11107:3: note: Taking false branch
                   if (bpf_prog_is_dev_bound(env->prog->aux)) {
                   ^
   kernel/bpf/verifier.c:11118:7: note: Assuming 'class' is not equal to BP=
F_ALU
                   if (class =3D=3D BPF_ALU || class =3D=3D BPF_ALU64) {
                       ^~~~~~~~~~~~~~~~
   kernel/bpf/verifier.c:11118:7: note: Left side of '||' is false
   kernel/bpf/verifier.c:11118:27: note: Assuming 'class' is equal to BPF_A=
LU64
                   if (class =3D=3D BPF_ALU || class =3D=3D BPF_ALU64) {
                                           ^~~~~~~~~~~~~~~~~~
   kernel/bpf/verifier.c:11118:3: note: Taking true branch
                   if (class =3D=3D BPF_ALU || class =3D=3D BPF_ALU64) {
                   ^
   kernel/bpf/verifier.c:11119:10: note: Calling 'check_alu_op'
                           err =3D check_alu_op(env, insn);
                                 ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/verifier.c:8174:6: note: Assuming 'opcode' is not equal to BP=
F_END
           if (opcode =3D=3D BPF_END || opcode =3D=3D BPF_NEG) {
               ^~~~~~~~~~~~~~~~~
   kernel/bpf/verifier.c:8174:6: note: Left side of '||' is false
   kernel/bpf/verifier.c:8174:27: note: Assuming 'opcode' is not equal to B=
PF_NEG
           if (opcode =3D=3D BPF_END || opcode =3D=3D BPF_NEG) {
                                    ^~~~~~~~~~~~~~~~~
   kernel/bpf/verifier.c:8174:2: note: Taking false branch
           if (opcode =3D=3D BPF_END || opcode =3D=3D BPF_NEG) {
           ^
   kernel/bpf/verifier.c:8207:13: note: Assuming 'opcode' is not equal to B=
PF_MOV
           } else if (opcode =3D=3D BPF_MOV) {
                      ^~~~~~~~~~~~~~~~~
   kernel/bpf/verifier.c:8207:9: note: Taking false branch
           } else if (opcode =3D=3D BPF_MOV) {
                  ^
   kernel/bpf/verifier.c:8286:13: note: Assuming 'opcode' is <=3D BPF_END
           } else if (opcode > BPF_END) {
                      ^~~~~~~~~~~~~~~~
   kernel/bpf/verifier.c:8286:9: note: Taking false branch
           } else if (opcode > BPF_END) {
                  ^
   kernel/bpf/verifier.c:8292:7: note: Assuming the condition is false
                   if (BPF_SRC(insn->code) =3D=3D BPF_X) {

vim +560 kernel/bpf/verifier.c

39491867ace594 Brendan Jackman    2021-03-04  531  =

17a5267067f3c3 Alexei Starovoitov 2014-09-26  532  /* string representation=
 of 'enum bpf_reg_type' */
9e92c0a723fc17 Hao Luo            2021-11-29  533  static const char * cons=
t reg_type_str(enum bpf_reg_type type)
9e92c0a723fc17 Hao Luo            2021-11-29  534  {
9e92c0a723fc17 Hao Luo            2021-11-29  535  	static const char * con=
st str[] =3D {
17a5267067f3c3 Alexei Starovoitov 2014-09-26  536  		[NOT_INIT]		=3D "?",
f1174f77b50c94 Edward Cree        2017-08-07  537  		[SCALAR_VALUE]		=3D "i=
nv",
17a5267067f3c3 Alexei Starovoitov 2014-09-26  538  		[PTR_TO_CTX]		=3D "ctx=
",
17a5267067f3c3 Alexei Starovoitov 2014-09-26  539  		[CONST_PTR_TO_MAP]	=3D=
 "map_ptr",
17a5267067f3c3 Alexei Starovoitov 2014-09-26  540  		[PTR_TO_MAP_VALUE]	=3D=
 "map_value",
17a5267067f3c3 Alexei Starovoitov 2014-09-26  541  		[PTR_TO_STACK]		=3D "f=
p",
969bf05eb3cedd Alexei Starovoitov 2016-05-05  542  		[PTR_TO_PACKET]		=3D "=
pkt",
de8f3a83b0a0fd Daniel Borkmann    2017-09-25  543  		[PTR_TO_PACKET_META]	=
=3D "pkt_meta",
969bf05eb3cedd Alexei Starovoitov 2016-05-05  544  		[PTR_TO_PACKET_END]	=
=3D "pkt_end",
d58e468b1112dc Petar Penkov       2018-09-14  545  		[PTR_TO_FLOW_KEYS]	=3D=
 "flow_keys",
c64b7983288e63 Joe Stringer       2018-10-02  546  		[PTR_TO_SOCKET]		=3D "=
sock",
46f8bc92758c62 Martin KaFai Lau   2019-02-09  547  		[PTR_TO_SOCK_COMMON]	=
=3D "sock_common",
655a51e536c09d Martin KaFai Lau   2019-02-09  548  		[PTR_TO_TCP_SOCK]	=3D =
"tcp_sock",
9df1c28bb75217 Matt Mullins       2019-04-26  549  		[PTR_TO_TP_BUFFER]	=3D=
 "tp_buffer",
fada7fdc83c0bf Jonathan Lemon     2019-06-06  550  		[PTR_TO_XDP_SOCK]	=3D =
"xdp_sock",
9e15db66136a14 Alexei Starovoitov 2019-10-15  551  		[PTR_TO_BTF_ID]		=3D "=
ptr_",
eaa6bcb71ef6ed Hao Luo            2020-09-29  552  		[PTR_TO_PERCPU_BTF_ID]=
	=3D "percpu_ptr_",
457f44363a8894 Andrii Nakryiko    2020-05-29  553  		[PTR_TO_MEM]		=3D "mem=
",
afbf21dce668ef Yonghong Song      2020-07-23  554  		[PTR_TO_RDONLY_BUF]	=
=3D "rdonly_buf",
afbf21dce668ef Yonghong Song      2020-07-23  555  		[PTR_TO_RDWR_BUF]	=3D =
"rdwr_buf",
69c087ba6225b5 Yonghong Song      2021-02-26  556  		[PTR_TO_FUNC]		=3D "fu=
nc",
69c087ba6225b5 Yonghong Song      2021-02-26  557  		[PTR_TO_MAP_KEY]	=3D "=
map_key",
17a5267067f3c3 Alexei Starovoitov 2014-09-26  558  	};
17a5267067f3c3 Alexei Starovoitov 2014-09-26  559  =

9e92c0a723fc17 Hao Luo            2021-11-29 @560  	return str[BPF_BASE_TYP=
E(type)];
9e92c0a723fc17 Hao Luo            2021-11-29  561  }
9e92c0a723fc17 Hao Luo            2021-11-29  562  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8323834304408987596==--

