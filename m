Content-Type: multipart/mixed; boundary="===============6550904045585459350=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ast-bpf:relo_core 9/19] tools/lib/bpf/relo_core.c:1025:7: warning: Branch condition evaluates to a garbage value [clang-analyzer-core.uninitialized.Branch]
Date: Mon, 15 Nov 2021 20:21:24 +0800
Message-ID: <202111152014.IySXN0cm-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6550904045585459350==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Alexei Starovoitov <ast@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ast/bpf.git relo_co=
re
head:   f17ef55e5e0bac0d11d3186cd1c468b5a1e047d7
commit: 03c354f8c71c2478c421d5552d284e0befb03861 [9/19] bpf: Prepare relo_c=
ore.c for kernel duty.
:::::: branch date: 20 hours ago
:::::: commit date: 3 days ago
config: arm-randconfig-c002-20211114 (attached as .config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project c3ddde=
eafb529e769cde87bd29ef6271ac6bfa5c)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/ast/bpf.git/commi=
t/?id=3D03c354f8c71c2478c421d5552d284e0befb03861
        git remote add ast-bpf https://git.kernel.org/pub/scm/linux/kernel/=
git/ast/bpf.git
        git fetch --no-tags ast-bpf relo_core
        git checkout 03c354f8c71c2478c421d5552d284e0befb03861
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   include/linux/compiler_types.h:305:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:297:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/media/cec/core/cec-api.c:677:4: note: Loop condition is false.  =
Exiting loop
                           list_first_entry(&fh->msgs, struct cec_msg_entry=
, list);
                           ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:494:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:317:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:305:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:295:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/media/cec/core/cec-api.c:680:3: note: Memory is released
                   kfree(entry);
                   ^~~~~~~~~~~~
   drivers/media/cec/core/cec-api.c:675:2: note: Loop condition is true.  E=
ntering loop body
           while (!list_empty(&fh->msgs)) {
           ^
   drivers/media/cec/core/cec-api.c:677:4: note: Left side of '&&' is false
                           list_first_entry(&fh->msgs, struct cec_msg_entry=
, list);
                           ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:494:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/media/cec/core/cec-api.c:677:4: note: Taking false branch
                           list_first_entry(&fh->msgs, struct cec_msg_entry=
, list);
                           ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:494:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:317:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:305:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:297:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/media/cec/core/cec-api.c:677:4: note: Loop condition is false.  =
Exiting loop
                           list_first_entry(&fh->msgs, struct cec_msg_entry=
, list);
                           ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:494:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:317:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:305:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:295:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/media/cec/core/cec-api.c:679:3: note: Calling 'list_del'
                   list_del(&entry->list);
                   ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:147:14: note: Use of memory after it is freed
           entry->next =3D LIST_POISON1;
           ~~~~~~~~~~~ ^
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
>> tools/lib/bpf/relo_core.c:1025:7: warning: Branch condition evaluates to=
 a garbage value [clang-analyzer-core.uninitialized.Branch]
                   if (res->fail_memsz_adjust) {
                       ^
   tools/lib/bpf/relo_core.c:1215:6: note: Assuming 'local_type' is non-null
           if (!local_type)
               ^~~~~~~~~~~
   tools/lib/bpf/relo_core.c:1215:2: note: Taking false branch
           if (!local_type)
           ^
   tools/lib/bpf/relo_core.c:1219:6: note: Assuming 'local_name' is non-null
           if (!local_name)
               ^~~~~~~~~~~
   tools/lib/bpf/relo_core.c:1219:2: note: Taking false branch
           if (!local_name)
           ^
   tools/lib/bpf/relo_core.c:1223:6: note: Calling 'str_is_empty'
           if (str_is_empty(spec_str))
               ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/btf.h:149:9: note: Assuming 's' is non-null
           return !s || !s[0];
                  ^~
   include/linux/btf.h:149:9: note: Left side of '||' is false
   include/linux/btf.h:149:15: note: Assuming the condition is false
           return !s || !s[0];
                        ^~~~~
   include/linux/btf.h:149:2: note: Returning zero, which participates in a=
 condition later
           return !s || !s[0];
           ^~~~~~~~~~~~~~~~~~
   tools/lib/bpf/relo_core.c:1223:6: note: Returning from 'str_is_empty'
           if (str_is_empty(spec_str))
               ^~~~~~~~~~~~~~~~~~~~~~
   tools/lib/bpf/relo_core.c:1223:2: note: Taking false branch
           if (str_is_empty(spec_str))
           ^
   tools/lib/bpf/relo_core.c:1227:6: note: Assuming 'err' is 0
           if (err) {
               ^~~
   tools/lib/bpf/relo_core.c:1227:2: note: Taking false branch
           if (err) {
           ^
   tools/lib/bpf/relo_core.c:1241:12: note: Field 'kind' is equal to BPF_TY=
PE_ID_LOCAL
           if (relo->kind =3D=3D BPF_TYPE_ID_LOCAL) {
                     ^
   tools/lib/bpf/relo_core.c:1241:2: note: Taking true branch
           if (relo->kind =3D=3D BPF_TYPE_ID_LOCAL) {
           ^
   tools/lib/bpf/relo_core.c:1246:3: note: Control jumps to line 1340
                   goto patch_insn;
                   ^
   tools/lib/bpf/relo_core.c:1340:8: note: Calling 'bpf_core_patch_insn'
           err =3D bpf_core_patch_insn(prog_name, insn, insn_idx, relo, rel=
o_idx, &targ_res);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~
   tools/lib/bpf/relo_core.c:981:11: note: Field 'poison' is false
           if (res->poison) {
                    ^
   tools/lib/bpf/relo_core.c:981:2: note: Taking false branch
           if (res->poison) {
           ^
   tools/lib/bpf/relo_core.c:995:2: note: Control jumps to 'case 3:'  at li=
ne 1014
           switch (class) {
           ^
   tools/lib/bpf/relo_core.c:1015:12: note: Field 'validate' is true
                   if (res->validate && insn->off !=3D orig_val) {
                            ^
   tools/lib/bpf/relo_core.c:1015:7: note: Left side of '&&' is true
                   if (res->validate && insn->off !=3D orig_val) {
                       ^
   tools/lib/bpf/relo_core.c:1015:24: note: Assuming 'orig_val' is equal to=
 field 'off'
                   if (res->validate && insn->off !=3D orig_val) {
                                        ^~~~~~~~~~~~~~~~~~~~~
   tools/lib/bpf/relo_core.c:1015:3: note: Taking false branch
                   if (res->validate && insn->off !=3D orig_val) {
                   ^
   tools/lib/bpf/relo_core.c:1020:7: note: Assuming the condition is false
                   if (new_val > SHRT_MAX) {
                       ^~~~~~~~~~~~~~~~~~
   tools/lib/bpf/relo_core.c:1020:3: note: Taking false branch
                   if (new_val > SHRT_MAX) {
                   ^
   tools/lib/bpf/relo_core.c:1025:7: note: Branch condition evaluates to a =
garbage value
                   if (res->fail_memsz_adjust) {
                       ^~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.
   drivers/virtio/virtio_balloon.c:266:2: warning: Assigned value is garbag=
e or undefined [clang-analyzer-core.uninitialized.Assign]
           list_for_each_entry_safe(page, next, pages, lru) {
           ^
   include/linux/list.h:716:7: note: expanded from macro 'list_for_each_ent=
ry_safe'
                   n =3D list_next_entry(pos, member);                     =
  \
                       ^
   include/linux/list.h:555:2: note: expanded from macro 'list_next_entry'
           list_entry((pos)->member.next, typeof(*(pos)), member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:493:2: note: expanded from macro 'container_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
           ^
   drivers/virtio/virtio_balloon.c:1104:2: note: Calling 'remove_common'
           remove_common(vb);
           ^~~~~~~~~~~~~~~~~

vim +1025 tools/lib/bpf/relo_core.c

b0588390dbcedc Alexei Starovoitov 2021-07-20   954  =

b0588390dbcedc Alexei Starovoitov 2021-07-20   955  /*
b0588390dbcedc Alexei Starovoitov 2021-07-20   956   * Patch relocatable BP=
F instruction.
b0588390dbcedc Alexei Starovoitov 2021-07-20   957   *
b0588390dbcedc Alexei Starovoitov 2021-07-20   958   * Patched value is det=
ermined by relocation kind and target specification.
b0588390dbcedc Alexei Starovoitov 2021-07-20   959   * For existence reloca=
tions target spec will be NULL if field/type is not found.
b0588390dbcedc Alexei Starovoitov 2021-07-20   960   * Expected insn->imm v=
alue is determined using relocation kind and local
b0588390dbcedc Alexei Starovoitov 2021-07-20   961   * spec, and is checked=
 before patching instruction. If actual insn->imm value
b0588390dbcedc Alexei Starovoitov 2021-07-20   962   * is wrong, bail out w=
ith error.
b0588390dbcedc Alexei Starovoitov 2021-07-20   963   *
b0588390dbcedc Alexei Starovoitov 2021-07-20   964   * Currently supported =
classes of BPF instruction are:
b0588390dbcedc Alexei Starovoitov 2021-07-20   965   * 1. rX =3D <imm> (ass=
ignment with immediate operand);
b0588390dbcedc Alexei Starovoitov 2021-07-20   966   * 2. rX +=3D <imm> (ar=
ithmetic operations with immediate operand);
b0588390dbcedc Alexei Starovoitov 2021-07-20   967   * 3. rX =3D <imm64> (l=
oad with 64-bit immediate value);
b0588390dbcedc Alexei Starovoitov 2021-07-20   968   * 4. rX =3D *(T *)(rY =
+ <off>), where T is one of {u8, u16, u32, u64};
b0588390dbcedc Alexei Starovoitov 2021-07-20   969   * 5. *(T *)(rX + <off>=
) =3D rY, where T is one of {u8, u16, u32, u64};
b0588390dbcedc Alexei Starovoitov 2021-07-20   970   * 6. *(T *)(rX + <off>=
) =3D <imm>, where T is one of {u8, u16, u32, u64}.
b0588390dbcedc Alexei Starovoitov 2021-07-20   971   */
b0588390dbcedc Alexei Starovoitov 2021-07-20   972  static int bpf_core_pat=
ch_insn(const char *prog_name, struct bpf_insn *insn,
b0588390dbcedc Alexei Starovoitov 2021-07-20   973  			       int insn_idx,=
 const struct bpf_core_relo *relo,
b0588390dbcedc Alexei Starovoitov 2021-07-20   974  			       int relo_idx,=
 const struct bpf_core_relo_res *res)
b0588390dbcedc Alexei Starovoitov 2021-07-20   975  {
b0588390dbcedc Alexei Starovoitov 2021-07-20   976  	__u32 orig_val, new_va=
l;
b0588390dbcedc Alexei Starovoitov 2021-07-20   977  	__u8 class;
b0588390dbcedc Alexei Starovoitov 2021-07-20   978  =

b0588390dbcedc Alexei Starovoitov 2021-07-20   979  	class =3D BPF_CLASS(in=
sn->code);
b0588390dbcedc Alexei Starovoitov 2021-07-20   980  =

b0588390dbcedc Alexei Starovoitov 2021-07-20   981  	if (res->poison) {
b0588390dbcedc Alexei Starovoitov 2021-07-20   982  poison:
b0588390dbcedc Alexei Starovoitov 2021-07-20   983  		/* poison second part=
 of ldimm64 to avoid confusing error from
b0588390dbcedc Alexei Starovoitov 2021-07-20   984  		 * verifier about "un=
known opcode 00"
b0588390dbcedc Alexei Starovoitov 2021-07-20   985  		 */
b0588390dbcedc Alexei Starovoitov 2021-07-20   986  		if (is_ldimm64_insn(i=
nsn))
b0588390dbcedc Alexei Starovoitov 2021-07-20   987  			bpf_core_poison_insn=
(prog_name, relo_idx, insn_idx + 1, insn + 1);
b0588390dbcedc Alexei Starovoitov 2021-07-20   988  		bpf_core_poison_insn(=
prog_name, relo_idx, insn_idx, insn);
b0588390dbcedc Alexei Starovoitov 2021-07-20   989  		return 0;
b0588390dbcedc Alexei Starovoitov 2021-07-20   990  	}
b0588390dbcedc Alexei Starovoitov 2021-07-20   991  =

b0588390dbcedc Alexei Starovoitov 2021-07-20   992  	orig_val =3D res->orig=
_val;
b0588390dbcedc Alexei Starovoitov 2021-07-20   993  	new_val =3D res->new_v=
al;
b0588390dbcedc Alexei Starovoitov 2021-07-20   994  =

b0588390dbcedc Alexei Starovoitov 2021-07-20   995  	switch (class) {
b0588390dbcedc Alexei Starovoitov 2021-07-20   996  	case BPF_ALU:
b0588390dbcedc Alexei Starovoitov 2021-07-20   997  	case BPF_ALU64:
b0588390dbcedc Alexei Starovoitov 2021-07-20   998  		if (BPF_SRC(insn->cod=
e) !=3D BPF_K)
b0588390dbcedc Alexei Starovoitov 2021-07-20   999  			return -EINVAL;
b0588390dbcedc Alexei Starovoitov 2021-07-20  1000  		if (res->validate && =
insn->imm !=3D orig_val) {
b0588390dbcedc Alexei Starovoitov 2021-07-20  1001  			pr_warn("prog '%s': =
relo #%d: unexpected insn #%d (ALU/ALU64) value: got %u, exp %u -> %u\n",
b0588390dbcedc Alexei Starovoitov 2021-07-20  1002  				prog_name, relo_idx,
b0588390dbcedc Alexei Starovoitov 2021-07-20  1003  				insn_idx, insn->imm=
, orig_val, new_val);
b0588390dbcedc Alexei Starovoitov 2021-07-20  1004  			return -EINVAL;
b0588390dbcedc Alexei Starovoitov 2021-07-20  1005  		}
b0588390dbcedc Alexei Starovoitov 2021-07-20  1006  		orig_val =3D insn->im=
m;
b0588390dbcedc Alexei Starovoitov 2021-07-20  1007  		insn->imm =3D new_val;
b0588390dbcedc Alexei Starovoitov 2021-07-20  1008  		pr_debug("prog '%s': =
relo #%d: patched insn #%d (ALU/ALU64) imm %u -> %u\n",
b0588390dbcedc Alexei Starovoitov 2021-07-20  1009  			 prog_name, relo_idx=
, insn_idx,
b0588390dbcedc Alexei Starovoitov 2021-07-20  1010  			 orig_val, new_val);
b0588390dbcedc Alexei Starovoitov 2021-07-20  1011  		break;
b0588390dbcedc Alexei Starovoitov 2021-07-20  1012  	case BPF_LDX:
b0588390dbcedc Alexei Starovoitov 2021-07-20  1013  	case BPF_ST:
b0588390dbcedc Alexei Starovoitov 2021-07-20  1014  	case BPF_STX:
b0588390dbcedc Alexei Starovoitov 2021-07-20  1015  		if (res->validate && =
insn->off !=3D orig_val) {
b0588390dbcedc Alexei Starovoitov 2021-07-20  1016  			pr_warn("prog '%s': =
relo #%d: unexpected insn #%d (LDX/ST/STX) value: got %u, exp %u -> %u\n",
b0588390dbcedc Alexei Starovoitov 2021-07-20  1017  				prog_name, relo_idx=
, insn_idx, insn->off, orig_val, new_val);
b0588390dbcedc Alexei Starovoitov 2021-07-20  1018  			return -EINVAL;
b0588390dbcedc Alexei Starovoitov 2021-07-20  1019  		}
b0588390dbcedc Alexei Starovoitov 2021-07-20  1020  		if (new_val > SHRT_MA=
X) {
b0588390dbcedc Alexei Starovoitov 2021-07-20  1021  			pr_warn("prog '%s': =
relo #%d: insn #%d (LDX/ST/STX) value too big: %u\n",
b0588390dbcedc Alexei Starovoitov 2021-07-20  1022  				prog_name, relo_idx=
, insn_idx, new_val);
b0588390dbcedc Alexei Starovoitov 2021-07-20  1023  			return -ERANGE;
b0588390dbcedc Alexei Starovoitov 2021-07-20  1024  		}
b0588390dbcedc Alexei Starovoitov 2021-07-20 @1025  		if (res->fail_memsz_a=
djust) {
b0588390dbcedc Alexei Starovoitov 2021-07-20  1026  			pr_warn("prog '%s': =
relo #%d: insn #%d (LDX/ST/STX) accesses field incorrectly. "
b0588390dbcedc Alexei Starovoitov 2021-07-20  1027  				"Make sure you are =
accessing pointers, unsigned integers, or fields of matching type and size.=
\n",
b0588390dbcedc Alexei Starovoitov 2021-07-20  1028  				prog_name, relo_idx=
, insn_idx);
b0588390dbcedc Alexei Starovoitov 2021-07-20  1029  			goto poison;
b0588390dbcedc Alexei Starovoitov 2021-07-20  1030  		}
b0588390dbcedc Alexei Starovoitov 2021-07-20  1031  =

b0588390dbcedc Alexei Starovoitov 2021-07-20  1032  		orig_val =3D insn->of=
f;
b0588390dbcedc Alexei Starovoitov 2021-07-20  1033  		insn->off =3D new_val;
b0588390dbcedc Alexei Starovoitov 2021-07-20  1034  		pr_debug("prog '%s': =
relo #%d: patched insn #%d (LDX/ST/STX) off %u -> %u\n",
b0588390dbcedc Alexei Starovoitov 2021-07-20  1035  			 prog_name, relo_idx=
, insn_idx, orig_val, new_val);
b0588390dbcedc Alexei Starovoitov 2021-07-20  1036  =

b0588390dbcedc Alexei Starovoitov 2021-07-20  1037  		if (res->new_sz !=3D =
res->orig_sz) {
b0588390dbcedc Alexei Starovoitov 2021-07-20  1038  			int insn_bytes_sz, i=
nsn_bpf_sz;
b0588390dbcedc Alexei Starovoitov 2021-07-20  1039  =

b0588390dbcedc Alexei Starovoitov 2021-07-20  1040  			insn_bytes_sz =3D in=
sn_bpf_size_to_bytes(insn);
b0588390dbcedc Alexei Starovoitov 2021-07-20  1041  			if (insn_bytes_sz !=
=3D res->orig_sz) {
b0588390dbcedc Alexei Starovoitov 2021-07-20  1042  				pr_warn("prog '%s':=
 relo #%d: insn #%d (LDX/ST/STX) unexpected mem size: got %d, exp %u\n",
b0588390dbcedc Alexei Starovoitov 2021-07-20  1043  					prog_name, relo_id=
x, insn_idx, insn_bytes_sz, res->orig_sz);
b0588390dbcedc Alexei Starovoitov 2021-07-20  1044  				return -EINVAL;
b0588390dbcedc Alexei Starovoitov 2021-07-20  1045  			}
b0588390dbcedc Alexei Starovoitov 2021-07-20  1046  =

b0588390dbcedc Alexei Starovoitov 2021-07-20  1047  			insn_bpf_sz =3D insn=
_bytes_to_bpf_size(res->new_sz);
b0588390dbcedc Alexei Starovoitov 2021-07-20  1048  			if (insn_bpf_sz < 0)=
 {
b0588390dbcedc Alexei Starovoitov 2021-07-20  1049  				pr_warn("prog '%s':=
 relo #%d: insn #%d (LDX/ST/STX) invalid new mem size: %u\n",
b0588390dbcedc Alexei Starovoitov 2021-07-20  1050  					prog_name, relo_id=
x, insn_idx, res->new_sz);
b0588390dbcedc Alexei Starovoitov 2021-07-20  1051  				return -EINVAL;
b0588390dbcedc Alexei Starovoitov 2021-07-20  1052  			}
b0588390dbcedc Alexei Starovoitov 2021-07-20  1053  =

b0588390dbcedc Alexei Starovoitov 2021-07-20  1054  			insn->code =3D BPF_M=
ODE(insn->code) | insn_bpf_sz | BPF_CLASS(insn->code);
b0588390dbcedc Alexei Starovoitov 2021-07-20  1055  			pr_debug("prog '%s':=
 relo #%d: patched insn #%d (LDX/ST/STX) mem_sz %u -> %u\n",
b0588390dbcedc Alexei Starovoitov 2021-07-20  1056  				 prog_name, relo_id=
x, insn_idx, res->orig_sz, res->new_sz);
b0588390dbcedc Alexei Starovoitov 2021-07-20  1057  		}
b0588390dbcedc Alexei Starovoitov 2021-07-20  1058  		break;
b0588390dbcedc Alexei Starovoitov 2021-07-20  1059  	case BPF_LD: {
b0588390dbcedc Alexei Starovoitov 2021-07-20  1060  		__u64 imm;
b0588390dbcedc Alexei Starovoitov 2021-07-20  1061  =

b0588390dbcedc Alexei Starovoitov 2021-07-20  1062  		if (!is_ldimm64_insn(=
insn) ||
b0588390dbcedc Alexei Starovoitov 2021-07-20  1063  		    insn[0].src_reg !=
=3D 0 || insn[0].off !=3D 0 ||
b0588390dbcedc Alexei Starovoitov 2021-07-20  1064  		    insn[1].code !=3D=
 0 || insn[1].dst_reg !=3D 0 ||
b0588390dbcedc Alexei Starovoitov 2021-07-20  1065  		    insn[1].src_reg !=
=3D 0 || insn[1].off !=3D 0) {
b0588390dbcedc Alexei Starovoitov 2021-07-20  1066  			pr_warn("prog '%s': =
relo #%d: insn #%d (LDIMM64) has unexpected form\n",
b0588390dbcedc Alexei Starovoitov 2021-07-20  1067  				prog_name, relo_idx=
, insn_idx);
b0588390dbcedc Alexei Starovoitov 2021-07-20  1068  			return -EINVAL;
b0588390dbcedc Alexei Starovoitov 2021-07-20  1069  		}
b0588390dbcedc Alexei Starovoitov 2021-07-20  1070  =

b0588390dbcedc Alexei Starovoitov 2021-07-20  1071  		imm =3D insn[0].imm +=
 ((__u64)insn[1].imm << 32);
b0588390dbcedc Alexei Starovoitov 2021-07-20  1072  		if (res->validate && =
imm !=3D orig_val) {
b0588390dbcedc Alexei Starovoitov 2021-07-20  1073  			pr_warn("prog '%s': =
relo #%d: unexpected insn #%d (LDIMM64) value: got %llu, exp %u -> %u\n",
b0588390dbcedc Alexei Starovoitov 2021-07-20  1074  				prog_name, relo_idx,
b0588390dbcedc Alexei Starovoitov 2021-07-20  1075  				insn_idx, (unsigned=
 long long)imm,
b0588390dbcedc Alexei Starovoitov 2021-07-20  1076  				orig_val, new_val);
b0588390dbcedc Alexei Starovoitov 2021-07-20  1077  			return -EINVAL;
b0588390dbcedc Alexei Starovoitov 2021-07-20  1078  		}
b0588390dbcedc Alexei Starovoitov 2021-07-20  1079  =

b0588390dbcedc Alexei Starovoitov 2021-07-20  1080  		insn[0].imm =3D new_v=
al;
b0588390dbcedc Alexei Starovoitov 2021-07-20  1081  		insn[1].imm =3D 0; /*=
 currently only 32-bit values are supported */
b0588390dbcedc Alexei Starovoitov 2021-07-20  1082  		pr_debug("prog '%s': =
relo #%d: patched insn #%d (LDIMM64) imm64 %llu -> %u\n",
b0588390dbcedc Alexei Starovoitov 2021-07-20  1083  			 prog_name, relo_idx=
, insn_idx,
b0588390dbcedc Alexei Starovoitov 2021-07-20  1084  			 (unsigned long long=
)imm, new_val);
b0588390dbcedc Alexei Starovoitov 2021-07-20  1085  		break;
b0588390dbcedc Alexei Starovoitov 2021-07-20  1086  	}
b0588390dbcedc Alexei Starovoitov 2021-07-20  1087  	default:
b0588390dbcedc Alexei Starovoitov 2021-07-20  1088  		pr_warn("prog '%s': r=
elo #%d: trying to relocate unrecognized insn #%d, code:0x%x, src:0x%x, dst=
:0x%x, off:0x%x, imm:0x%x\n",
b0588390dbcedc Alexei Starovoitov 2021-07-20  1089  			prog_name, relo_idx,=
 insn_idx, insn->code,
b0588390dbcedc Alexei Starovoitov 2021-07-20  1090  			insn->src_reg, insn-=
>dst_reg, insn->off, insn->imm);
b0588390dbcedc Alexei Starovoitov 2021-07-20  1091  		return -EINVAL;
b0588390dbcedc Alexei Starovoitov 2021-07-20  1092  	}
b0588390dbcedc Alexei Starovoitov 2021-07-20  1093  =

b0588390dbcedc Alexei Starovoitov 2021-07-20  1094  	return 0;
b0588390dbcedc Alexei Starovoitov 2021-07-20  1095  }
b0588390dbcedc Alexei Starovoitov 2021-07-20  1096  =


:::::: The code at line 1025 was first introduced by commit
:::::: b0588390dbcedcd74fab6ffb8afe8d52380fd8b6 libbpf: Split CO-RE logic i=
nto relo_core.c.

:::::: TO: Alexei Starovoitov <ast@kernel.org>
:::::: CC: Andrii Nakryiko <andrii@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============6550904045585459350==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
sT6zWPUiPWcc3d3/AztNTHqSmQEA
--===============6550904045585459350==--

