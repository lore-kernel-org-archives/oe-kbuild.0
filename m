Content-Type: multipart/mixed; boundary="===============4836482540463691397=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ast-bpf:relo_core 2/12] tools/lib/bpf/relo_core.c:1040:7: warning: Branch condition evaluates to a garbage value [clang-analyzer-core.uninitialized.Branch]
Date: Sat, 02 Oct 2021 03:25:43 +0800
Message-ID: <202110020338.pN0x3VmL-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4836482540463691397==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Alexei Starovoitov <ast@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ast/bpf.git relo_co=
re
head:   b59680f8f85fc73f14859ee02567897309ba8f65
commit: 28e76eb078b4674fecfda090ee4cbd80340a1d71 [2/12] bpf: Prepare relo_c=
ore.c for kernel duty.
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-c007-20210930 (attached as .config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 289810=
15526f2192440c18f18e8a20cd11b0779c)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/ast/bpf.git/commi=
t/?id=3D28e76eb078b4674fecfda090ee4cbd80340a1d71
        git remote add ast-bpf https://git.kernel.org/pub/scm/linux/kernel/=
git/ast/bpf.git
        git fetch --no-tags ast-bpf relo_core
        git checkout 28e76eb078b4674fecfda090ee4cbd80340a1d71
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
            ^
   include/linux/list.h:282:9: note: Left side of '||' is false
           return READ_ONCE(head->next) =3D=3D head;
                  ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:290:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   include/linux/list.h:282:9: note: Left side of '||' is false
           return READ_ONCE(head->next) =3D=3D head;
                  ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:290:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   include/linux/list.h:282:9: note: Left side of '||' is true
           return READ_ONCE(head->next) =3D=3D head;
                  ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:38: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                                               ^
   include/linux/list.h:282:9: note: Taking false branch
           return READ_ONCE(head->next) =3D=3D head;
                  ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
           ^
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:302:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   include/linux/list.h:282:9: note: Loop condition is false.  Exiting loop
           return READ_ONCE(head->next) =3D=3D head;
                  ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
           ^
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:300:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   include/linux/list.h:282:9: note: Dereference of null pointer
           return READ_ONCE(head->next) =3D=3D head;
                  ^
   include/asm-generic/rwonce.h:50:2: note: expanded from macro 'READ_ONCE'
           __READ_ONCE(x);                                                 \
           ^~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:44:24: note: expanded from macro '__READ_ON=
CE'
   #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(=
x))
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   kernel/gcov/fs.c:532:3: warning: Call to function 'strcpy' is insecure a=
s it does not provide bounding of the memory buffer. Replace unbounded copy=
 functions with analogous functions that support length arguments such as '=
strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(node->name, name);
                   ^~~~~~
   kernel/gcov/fs.c:532:3: note: Call to function 'strcpy' is insecure as i=
t does not provide bounding of the memory buffer. Replace unbounded copy fu=
nctions with analogous functions that support length arguments such as 'str=
lcpy'. CWE-119
                   strcpy(node->name, name);
                   ^~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
>> tools/lib/bpf/relo_core.c:1040:7: warning: Branch condition evaluates to=
 a garbage value [clang-analyzer-core.uninitialized.Branch]
                   if (res->fail_memsz_adjust) {
                       ^
   tools/lib/bpf/relo_core.c:1230:6: note: Assuming 'local_type' is non-null
           if (!local_type)
               ^~~~~~~~~~~
   tools/lib/bpf/relo_core.c:1230:2: note: Taking false branch
           if (!local_type)
           ^
   tools/lib/bpf/relo_core.c:1234:6: note: Assuming 'local_name' is non-null
           if (!local_name)
               ^~~~~~~~~~~
   tools/lib/bpf/relo_core.c:1234:2: note: Taking false branch
           if (!local_name)
           ^
   tools/lib/bpf/relo_core.c:1238:6: note: Calling 'str_is_empty'
           if (str_is_empty(spec_str))
               ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/btf.h:148:9: note: Assuming 's' is non-null
           return !s || !s[0];
                  ^~
   include/linux/btf.h:148:9: note: Left side of '||' is false
   include/linux/btf.h:148:15: note: Assuming the condition is false
           return !s || !s[0];
                        ^~~~~
   include/linux/btf.h:148:2: note: Returning zero, which participates in a=
 condition later
           return !s || !s[0];
           ^~~~~~~~~~~~~~~~~~
   tools/lib/bpf/relo_core.c:1238:6: note: Returning from 'str_is_empty'
           if (str_is_empty(spec_str))
               ^~~~~~~~~~~~~~~~~~~~~~
   tools/lib/bpf/relo_core.c:1238:2: note: Taking false branch
           if (str_is_empty(spec_str))
           ^
   tools/lib/bpf/relo_core.c:1242:6: note: Assuming 'err' is 0
           if (err) {
               ^~~
   tools/lib/bpf/relo_core.c:1242:2: note: Taking false branch
           if (err) {
           ^
   tools/lib/bpf/relo_core.c:1250:2: note: Loop condition is false.  Exitin=
g loop
           pr_debug("prog '%s': relo #%d: kind <%s> (%d), spec is ", prog_n=
ame,
           ^
   tools/lib/bpf/relo_core.c:69:28: note: expanded from macro 'pr_debug'
   #define pr_debug(fmt, ...)      __pr(LIBBPF_DEBUG, fmt, ##__VA_ARGS__)
                                   ^
   tools/lib/bpf/relo_core.c:59:31: note: expanded from macro '__pr'
   #define __pr(level, fmt, ...)   \
                                   ^
   tools/lib/bpf/relo_core.c:1256:12: note: Field 'kind' is equal to BPF_TY=
PE_ID_LOCAL
           if (relo->kind =3D=3D BPF_TYPE_ID_LOCAL) {
                     ^
   tools/lib/bpf/relo_core.c:1256:2: note: Taking true branch
           if (relo->kind =3D=3D BPF_TYPE_ID_LOCAL) {
           ^
   tools/lib/bpf/relo_core.c:1261:3: note: Control jumps to line 1355
                   goto patch_insn;
                   ^
   tools/lib/bpf/relo_core.c:1355:8: note: Calling 'bpf_core_patch_insn'
           err =3D bpf_core_patch_insn(prog_name, insn, insn_idx, relo, rel=
o_idx, &targ_res);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~
   tools/lib/bpf/relo_core.c:996:11: note: Field 'poison' is false
           if (res->poison) {
                    ^
   tools/lib/bpf/relo_core.c:996:2: note: Taking false branch
           if (res->poison) {
           ^
   tools/lib/bpf/relo_core.c:1010:2: note: Control jumps to 'case 3:'  at l=
ine 1029
           switch (class) {
           ^
   tools/lib/bpf/relo_core.c:1030:12: note: Field 'validate' is true
                   if (res->validate && insn->off !=3D orig_val) {
                            ^
   tools/lib/bpf/relo_core.c:1030:7: note: Left side of '&&' is true
                   if (res->validate && insn->off !=3D orig_val) {
                       ^
   tools/lib/bpf/relo_core.c:1030:24: note: Assuming 'orig_val' is equal to=
 field 'off'
                   if (res->validate && insn->off !=3D orig_val) {
                                        ^~~~~~~~~~~~~~~~~~~~~
   tools/lib/bpf/relo_core.c:1030:3: note: Taking false branch
                   if (res->validate && insn->off !=3D orig_val) {
                   ^
   tools/lib/bpf/relo_core.c:1035:7: note: Assuming the condition is false
                   if (new_val > SHRT_MAX) {
                       ^~~~~~~~~~~~~~~~~~
   tools/lib/bpf/relo_core.c:1035:3: note: Taking false branch
                   if (new_val > SHRT_MAX) {
                   ^
   tools/lib/bpf/relo_core.c:1040:7: note: Branch condition evaluates to a =
garbage value
                   if (res->fail_memsz_adjust) {
                       ^~~~~~~~~~~~~~~~~~~~~~
   Suppressed 5 warnings (4 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).

vim +1040 tools/lib/bpf/relo_core.c

b0588390dbcedc Alexei Starovoitov 2021-07-20   969  =

b0588390dbcedc Alexei Starovoitov 2021-07-20   970  /*
b0588390dbcedc Alexei Starovoitov 2021-07-20   971   * Patch relocatable BP=
F instruction.
b0588390dbcedc Alexei Starovoitov 2021-07-20   972   *
b0588390dbcedc Alexei Starovoitov 2021-07-20   973   * Patched value is det=
ermined by relocation kind and target specification.
b0588390dbcedc Alexei Starovoitov 2021-07-20   974   * For existence reloca=
tions target spec will be NULL if field/type is not found.
b0588390dbcedc Alexei Starovoitov 2021-07-20   975   * Expected insn->imm v=
alue is determined using relocation kind and local
b0588390dbcedc Alexei Starovoitov 2021-07-20   976   * spec, and is checked=
 before patching instruction. If actual insn->imm value
b0588390dbcedc Alexei Starovoitov 2021-07-20   977   * is wrong, bail out w=
ith error.
b0588390dbcedc Alexei Starovoitov 2021-07-20   978   *
b0588390dbcedc Alexei Starovoitov 2021-07-20   979   * Currently supported =
classes of BPF instruction are:
b0588390dbcedc Alexei Starovoitov 2021-07-20   980   * 1. rX =3D <imm> (ass=
ignment with immediate operand);
b0588390dbcedc Alexei Starovoitov 2021-07-20   981   * 2. rX +=3D <imm> (ar=
ithmetic operations with immediate operand);
b0588390dbcedc Alexei Starovoitov 2021-07-20   982   * 3. rX =3D <imm64> (l=
oad with 64-bit immediate value);
b0588390dbcedc Alexei Starovoitov 2021-07-20   983   * 4. rX =3D *(T *)(rY =
+ <off>), where T is one of {u8, u16, u32, u64};
b0588390dbcedc Alexei Starovoitov 2021-07-20   984   * 5. *(T *)(rX + <off>=
) =3D rY, where T is one of {u8, u16, u32, u64};
b0588390dbcedc Alexei Starovoitov 2021-07-20   985   * 6. *(T *)(rX + <off>=
) =3D <imm>, where T is one of {u8, u16, u32, u64}.
b0588390dbcedc Alexei Starovoitov 2021-07-20   986   */
b0588390dbcedc Alexei Starovoitov 2021-07-20   987  static int bpf_core_pat=
ch_insn(const char *prog_name, struct bpf_insn *insn,
b0588390dbcedc Alexei Starovoitov 2021-07-20   988  			       int insn_idx,=
 const struct bpf_core_relo *relo,
b0588390dbcedc Alexei Starovoitov 2021-07-20   989  			       int relo_idx,=
 const struct bpf_core_relo_res *res)
b0588390dbcedc Alexei Starovoitov 2021-07-20   990  {
b0588390dbcedc Alexei Starovoitov 2021-07-20   991  	__u32 orig_val, new_va=
l;
b0588390dbcedc Alexei Starovoitov 2021-07-20   992  	__u8 class;
b0588390dbcedc Alexei Starovoitov 2021-07-20   993  =

b0588390dbcedc Alexei Starovoitov 2021-07-20   994  	class =3D BPF_CLASS(in=
sn->code);
b0588390dbcedc Alexei Starovoitov 2021-07-20   995  =

b0588390dbcedc Alexei Starovoitov 2021-07-20   996  	if (res->poison) {
b0588390dbcedc Alexei Starovoitov 2021-07-20   997  poison:
b0588390dbcedc Alexei Starovoitov 2021-07-20   998  		/* poison second part=
 of ldimm64 to avoid confusing error from
b0588390dbcedc Alexei Starovoitov 2021-07-20   999  		 * verifier about "un=
known opcode 00"
b0588390dbcedc Alexei Starovoitov 2021-07-20  1000  		 */
b0588390dbcedc Alexei Starovoitov 2021-07-20  1001  		if (is_ldimm64_insn(i=
nsn))
b0588390dbcedc Alexei Starovoitov 2021-07-20  1002  			bpf_core_poison_insn=
(prog_name, relo_idx, insn_idx + 1, insn + 1);
b0588390dbcedc Alexei Starovoitov 2021-07-20  1003  		bpf_core_poison_insn(=
prog_name, relo_idx, insn_idx, insn);
b0588390dbcedc Alexei Starovoitov 2021-07-20  1004  		return 0;
b0588390dbcedc Alexei Starovoitov 2021-07-20  1005  	}
b0588390dbcedc Alexei Starovoitov 2021-07-20  1006  =

b0588390dbcedc Alexei Starovoitov 2021-07-20  1007  	orig_val =3D res->orig=
_val;
b0588390dbcedc Alexei Starovoitov 2021-07-20  1008  	new_val =3D res->new_v=
al;
b0588390dbcedc Alexei Starovoitov 2021-07-20  1009  =

b0588390dbcedc Alexei Starovoitov 2021-07-20  1010  	switch (class) {
b0588390dbcedc Alexei Starovoitov 2021-07-20  1011  	case BPF_ALU:
b0588390dbcedc Alexei Starovoitov 2021-07-20  1012  	case BPF_ALU64:
b0588390dbcedc Alexei Starovoitov 2021-07-20  1013  		if (BPF_SRC(insn->cod=
e) !=3D BPF_K)
b0588390dbcedc Alexei Starovoitov 2021-07-20  1014  			return -EINVAL;
b0588390dbcedc Alexei Starovoitov 2021-07-20  1015  		if (res->validate && =
insn->imm !=3D orig_val) {
b0588390dbcedc Alexei Starovoitov 2021-07-20  1016  			pr_warn("prog '%s': =
relo #%d: unexpected insn #%d (ALU/ALU64) value: got %u, exp %u -> %u\n",
b0588390dbcedc Alexei Starovoitov 2021-07-20  1017  				prog_name, relo_idx,
b0588390dbcedc Alexei Starovoitov 2021-07-20  1018  				insn_idx, insn->imm=
, orig_val, new_val);
b0588390dbcedc Alexei Starovoitov 2021-07-20  1019  			return -EINVAL;
b0588390dbcedc Alexei Starovoitov 2021-07-20  1020  		}
b0588390dbcedc Alexei Starovoitov 2021-07-20  1021  		orig_val =3D insn->im=
m;
b0588390dbcedc Alexei Starovoitov 2021-07-20  1022  		insn->imm =3D new_val;
b0588390dbcedc Alexei Starovoitov 2021-07-20  1023  		pr_debug("prog '%s': =
relo #%d: patched insn #%d (ALU/ALU64) imm %u -> %u\n",
b0588390dbcedc Alexei Starovoitov 2021-07-20  1024  			 prog_name, relo_idx=
, insn_idx,
b0588390dbcedc Alexei Starovoitov 2021-07-20  1025  			 orig_val, new_val);
b0588390dbcedc Alexei Starovoitov 2021-07-20  1026  		break;
b0588390dbcedc Alexei Starovoitov 2021-07-20  1027  	case BPF_LDX:
b0588390dbcedc Alexei Starovoitov 2021-07-20  1028  	case BPF_ST:
b0588390dbcedc Alexei Starovoitov 2021-07-20  1029  	case BPF_STX:
b0588390dbcedc Alexei Starovoitov 2021-07-20  1030  		if (res->validate && =
insn->off !=3D orig_val) {
b0588390dbcedc Alexei Starovoitov 2021-07-20  1031  			pr_warn("prog '%s': =
relo #%d: unexpected insn #%d (LDX/ST/STX) value: got %u, exp %u -> %u\n",
b0588390dbcedc Alexei Starovoitov 2021-07-20  1032  				prog_name, relo_idx=
, insn_idx, insn->off, orig_val, new_val);
b0588390dbcedc Alexei Starovoitov 2021-07-20  1033  			return -EINVAL;
b0588390dbcedc Alexei Starovoitov 2021-07-20  1034  		}
b0588390dbcedc Alexei Starovoitov 2021-07-20  1035  		if (new_val > SHRT_MA=
X) {
b0588390dbcedc Alexei Starovoitov 2021-07-20  1036  			pr_warn("prog '%s': =
relo #%d: insn #%d (LDX/ST/STX) value too big: %u\n",
b0588390dbcedc Alexei Starovoitov 2021-07-20  1037  				prog_name, relo_idx=
, insn_idx, new_val);
b0588390dbcedc Alexei Starovoitov 2021-07-20  1038  			return -ERANGE;
b0588390dbcedc Alexei Starovoitov 2021-07-20  1039  		}
b0588390dbcedc Alexei Starovoitov 2021-07-20 @1040  		if (res->fail_memsz_a=
djust) {
b0588390dbcedc Alexei Starovoitov 2021-07-20  1041  			pr_warn("prog '%s': =
relo #%d: insn #%d (LDX/ST/STX) accesses field incorrectly. "
b0588390dbcedc Alexei Starovoitov 2021-07-20  1042  				"Make sure you are =
accessing pointers, unsigned integers, or fields of matching type and size.=
\n",
b0588390dbcedc Alexei Starovoitov 2021-07-20  1043  				prog_name, relo_idx=
, insn_idx);
b0588390dbcedc Alexei Starovoitov 2021-07-20  1044  			goto poison;
b0588390dbcedc Alexei Starovoitov 2021-07-20  1045  		}
b0588390dbcedc Alexei Starovoitov 2021-07-20  1046  =

b0588390dbcedc Alexei Starovoitov 2021-07-20  1047  		orig_val =3D insn->of=
f;
b0588390dbcedc Alexei Starovoitov 2021-07-20  1048  		insn->off =3D new_val;
b0588390dbcedc Alexei Starovoitov 2021-07-20  1049  		pr_debug("prog '%s': =
relo #%d: patched insn #%d (LDX/ST/STX) off %u -> %u\n",
b0588390dbcedc Alexei Starovoitov 2021-07-20  1050  			 prog_name, relo_idx=
, insn_idx, orig_val, new_val);
b0588390dbcedc Alexei Starovoitov 2021-07-20  1051  =

b0588390dbcedc Alexei Starovoitov 2021-07-20  1052  		if (res->new_sz !=3D =
res->orig_sz) {
b0588390dbcedc Alexei Starovoitov 2021-07-20  1053  			int insn_bytes_sz, i=
nsn_bpf_sz;
b0588390dbcedc Alexei Starovoitov 2021-07-20  1054  =

b0588390dbcedc Alexei Starovoitov 2021-07-20  1055  			insn_bytes_sz =3D in=
sn_bpf_size_to_bytes(insn);
b0588390dbcedc Alexei Starovoitov 2021-07-20  1056  			if (insn_bytes_sz !=
=3D res->orig_sz) {
b0588390dbcedc Alexei Starovoitov 2021-07-20  1057  				pr_warn("prog '%s':=
 relo #%d: insn #%d (LDX/ST/STX) unexpected mem size: got %d, exp %u\n",
b0588390dbcedc Alexei Starovoitov 2021-07-20  1058  					prog_name, relo_id=
x, insn_idx, insn_bytes_sz, res->orig_sz);
b0588390dbcedc Alexei Starovoitov 2021-07-20  1059  				return -EINVAL;
b0588390dbcedc Alexei Starovoitov 2021-07-20  1060  			}
b0588390dbcedc Alexei Starovoitov 2021-07-20  1061  =

b0588390dbcedc Alexei Starovoitov 2021-07-20  1062  			insn_bpf_sz =3D insn=
_bytes_to_bpf_size(res->new_sz);
b0588390dbcedc Alexei Starovoitov 2021-07-20  1063  			if (insn_bpf_sz < 0)=
 {
b0588390dbcedc Alexei Starovoitov 2021-07-20  1064  				pr_warn("prog '%s':=
 relo #%d: insn #%d (LDX/ST/STX) invalid new mem size: %u\n",
b0588390dbcedc Alexei Starovoitov 2021-07-20  1065  					prog_name, relo_id=
x, insn_idx, res->new_sz);
b0588390dbcedc Alexei Starovoitov 2021-07-20  1066  				return -EINVAL;
b0588390dbcedc Alexei Starovoitov 2021-07-20  1067  			}
b0588390dbcedc Alexei Starovoitov 2021-07-20  1068  =

b0588390dbcedc Alexei Starovoitov 2021-07-20  1069  			insn->code =3D BPF_M=
ODE(insn->code) | insn_bpf_sz | BPF_CLASS(insn->code);
b0588390dbcedc Alexei Starovoitov 2021-07-20  1070  			pr_debug("prog '%s':=
 relo #%d: patched insn #%d (LDX/ST/STX) mem_sz %u -> %u\n",
b0588390dbcedc Alexei Starovoitov 2021-07-20  1071  				 prog_name, relo_id=
x, insn_idx, res->orig_sz, res->new_sz);
b0588390dbcedc Alexei Starovoitov 2021-07-20  1072  		}
b0588390dbcedc Alexei Starovoitov 2021-07-20  1073  		break;
b0588390dbcedc Alexei Starovoitov 2021-07-20  1074  	case BPF_LD: {
b0588390dbcedc Alexei Starovoitov 2021-07-20  1075  		__u64 imm;
b0588390dbcedc Alexei Starovoitov 2021-07-20  1076  =

b0588390dbcedc Alexei Starovoitov 2021-07-20  1077  		if (!is_ldimm64_insn(=
insn) ||
b0588390dbcedc Alexei Starovoitov 2021-07-20  1078  		    insn[0].src_reg !=
=3D 0 || insn[0].off !=3D 0 ||
b0588390dbcedc Alexei Starovoitov 2021-07-20  1079  		    insn[1].code !=3D=
 0 || insn[1].dst_reg !=3D 0 ||
b0588390dbcedc Alexei Starovoitov 2021-07-20  1080  		    insn[1].src_reg !=
=3D 0 || insn[1].off !=3D 0) {
b0588390dbcedc Alexei Starovoitov 2021-07-20  1081  			pr_warn("prog '%s': =
relo #%d: insn #%d (LDIMM64) has unexpected form\n",
b0588390dbcedc Alexei Starovoitov 2021-07-20  1082  				prog_name, relo_idx=
, insn_idx);
b0588390dbcedc Alexei Starovoitov 2021-07-20  1083  			return -EINVAL;
b0588390dbcedc Alexei Starovoitov 2021-07-20  1084  		}
b0588390dbcedc Alexei Starovoitov 2021-07-20  1085  =

b0588390dbcedc Alexei Starovoitov 2021-07-20  1086  		imm =3D insn[0].imm +=
 ((__u64)insn[1].imm << 32);
b0588390dbcedc Alexei Starovoitov 2021-07-20  1087  		if (res->validate && =
imm !=3D orig_val) {
b0588390dbcedc Alexei Starovoitov 2021-07-20  1088  			pr_warn("prog '%s': =
relo #%d: unexpected insn #%d (LDIMM64) value: got %llu, exp %u -> %u\n",
b0588390dbcedc Alexei Starovoitov 2021-07-20  1089  				prog_name, relo_idx,
b0588390dbcedc Alexei Starovoitov 2021-07-20  1090  				insn_idx, (unsigned=
 long long)imm,
b0588390dbcedc Alexei Starovoitov 2021-07-20  1091  				orig_val, new_val);
b0588390dbcedc Alexei Starovoitov 2021-07-20  1092  			return -EINVAL;
b0588390dbcedc Alexei Starovoitov 2021-07-20  1093  		}
b0588390dbcedc Alexei Starovoitov 2021-07-20  1094  =

b0588390dbcedc Alexei Starovoitov 2021-07-20  1095  		insn[0].imm =3D new_v=
al;
b0588390dbcedc Alexei Starovoitov 2021-07-20  1096  		insn[1].imm =3D 0; /*=
 currently only 32-bit values are supported */
b0588390dbcedc Alexei Starovoitov 2021-07-20  1097  		pr_debug("prog '%s': =
relo #%d: patched insn #%d (LDIMM64) imm64 %llu -> %u\n",
b0588390dbcedc Alexei Starovoitov 2021-07-20  1098  			 prog_name, relo_idx=
, insn_idx,
b0588390dbcedc Alexei Starovoitov 2021-07-20  1099  			 (unsigned long long=
)imm, new_val);
b0588390dbcedc Alexei Starovoitov 2021-07-20  1100  		break;
b0588390dbcedc Alexei Starovoitov 2021-07-20  1101  	}
b0588390dbcedc Alexei Starovoitov 2021-07-20  1102  	default:
b0588390dbcedc Alexei Starovoitov 2021-07-20  1103  		pr_warn("prog '%s': r=
elo #%d: trying to relocate unrecognized insn #%d, code:0x%x, src:0x%x, dst=
:0x%x, off:0x%x, imm:0x%x\n",
b0588390dbcedc Alexei Starovoitov 2021-07-20  1104  			prog_name, relo_idx,=
 insn_idx, insn->code,
b0588390dbcedc Alexei Starovoitov 2021-07-20  1105  			insn->src_reg, insn-=
>dst_reg, insn->off, insn->imm);
b0588390dbcedc Alexei Starovoitov 2021-07-20  1106  		return -EINVAL;
b0588390dbcedc Alexei Starovoitov 2021-07-20  1107  	}
b0588390dbcedc Alexei Starovoitov 2021-07-20  1108  =

b0588390dbcedc Alexei Starovoitov 2021-07-20  1109  	return 0;
b0588390dbcedc Alexei Starovoitov 2021-07-20  1110  }
b0588390dbcedc Alexei Starovoitov 2021-07-20  1111  =


:::::: The code at line 1040 was first introduced by commit
:::::: b0588390dbcedcd74fab6ffb8afe8d52380fd8b6 libbpf: Split CO-RE logic i=
nto relo_core.c.

:::::: TO: Alexei Starovoitov <ast@kernel.org>
:::::: CC: Andrii Nakryiko <andrii@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============4836482540463691397==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
vxJclIJjAgA=
--===============4836482540463691397==--

