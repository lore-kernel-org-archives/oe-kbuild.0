Content-Type: multipart/mixed; boundary="===============2537021791367157852=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ast-bpf:relo_core 6/12] tools/lib/bpf/relo_core.c:1045:7: warning: Branch condition evaluates to a garbage value [clang-analyzer-core.uninitialized.Branch]
Date: Fri, 17 Sep 2021 16:16:02 +0800
Message-ID: <202109171655.eFNA5lKx-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2537021791367157852==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Alexei Starovoitov <ast@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ast/bpf.git relo_co=
re
head:   bfeace99ce76472f92786d795eae779e8598e0e8
commit: 4b90a10711faf2b6751abe62a88422411c054c80 [6/12] bpf: Prepare relo_c=
ore.c for kernel duty.
:::::: branch date: 7 hours ago
:::::: commit date: 9 hours ago
config: riscv-randconfig-c006-20210916 (attached as .config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project c8b3d7=
d6d6de37af68b2f379d0e37304f78e115f)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/ast/bpf.git/commi=
t/?id=3D4b90a10711faf2b6751abe62a88422411c054c80
        git remote add ast-bpf https://git.kernel.org/pub/scm/linux/kernel/=
git/ast/bpf.git
        git fetch --no-tags ast-bpf relo_core
        git checkout 4b90a10711faf2b6751abe62a88422411c054c80
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   Suppressed 14 warnings (7 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (11 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (11 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (11 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (11 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (6 in non-user code, 7 with check filters).
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
   13 warnings generated.
   Suppressed 13 warnings (6 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (9 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (8 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (7 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   drivers/iio/accel/bma220_spi.c:63:8: warning: Excessive padding in 'stru=
ct bma220_data' (86 padding bytes, where 22 is optimal). =

   Optimal fields order: =

   tx_buf, =

   spi_device, =

   scan, =

   lock, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct bma220_data {
   ~~~~~~~^~~~~~~~~~~~~
   drivers/iio/accel/bma220_spi.c:63:8: note: Excessive padding in 'struct =
bma220_data' (86 padding bytes, where 22 is optimal). Optimal fields order:=
 tx_buf, spi_device, scan, lock, consider reordering the fields or adding e=
xplicit padding members
   struct bma220_data {
   ~~~~~~~^~~~~~~~~~~~~
   Suppressed 15 warnings (8 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (6 in non-user code, 7 with check filters).
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
   12 warnings generated.
   Suppressed 12 warnings (5 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (5 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   drivers/clocksource/timer-of.c:191:3: warning: Value stored to 'flags' i=
s never read [clang-analyzer-deadcode.DeadStores]
                   flags |=3D TIMER_OF_IRQ;
                   ^
   drivers/clocksource/timer-of.c:191:3: note: Value stored to 'flags' is n=
ever read
   Suppressed 14 warnings (7 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (5 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (8 in non-user code, 8 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
>> tools/lib/bpf/relo_core.c:1045:7: warning: Branch condition evaluates to=
 a garbage value [clang-analyzer-core.uninitialized.Branch]
                   if (res->fail_memsz_adjust) {
                       ^
   tools/lib/bpf/relo_core.c:1235:6: note: Assuming 'local_type' is non-null
           if (!local_type)
               ^~~~~~~~~~~
   tools/lib/bpf/relo_core.c:1235:2: note: Taking false branch
           if (!local_type)
           ^
   tools/lib/bpf/relo_core.c:1239:6: note: Assuming 'local_name' is non-null
           if (!local_name)
               ^~~~~~~~~~~
   tools/lib/bpf/relo_core.c:1239:2: note: Taking false branch
           if (!local_name)
           ^
   tools/lib/bpf/relo_core.c:1243:6: note: Calling 'str_is_empty'
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
   tools/lib/bpf/relo_core.c:1243:6: note: Returning from 'str_is_empty'
           if (str_is_empty(spec_str))
               ^~~~~~~~~~~~~~~~~~~~~~
   tools/lib/bpf/relo_core.c:1243:2: note: Taking false branch
           if (str_is_empty(spec_str))
           ^
   tools/lib/bpf/relo_core.c:1247:6: note: Assuming 'err' is 0
           if (err) {
               ^~~
   tools/lib/bpf/relo_core.c:1247:2: note: Taking false branch
           if (err) {
           ^
   tools/lib/bpf/relo_core.c:1255:2: note: Loop condition is false.  Exitin=
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
   tools/lib/bpf/relo_core.c:1261:12: note: Field 'kind' is equal to BPF_TY=
PE_ID_LOCAL
           if (relo->kind =3D=3D BPF_TYPE_ID_LOCAL) {
                     ^
   tools/lib/bpf/relo_core.c:1261:2: note: Taking true branch
           if (relo->kind =3D=3D BPF_TYPE_ID_LOCAL) {
           ^
   tools/lib/bpf/relo_core.c:1266:3: note: Control jumps to line 1360
                   goto patch_insn;
                   ^
   tools/lib/bpf/relo_core.c:1360:8: note: Calling 'bpf_core_patch_insn'
           err =3D bpf_core_patch_insn(prog_name, insn, insn_idx, relo, rel=
o_idx, &targ_res);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~
   tools/lib/bpf/relo_core.c:1001:11: note: Field 'poison' is false
           if (res->poison) {
                    ^
   tools/lib/bpf/relo_core.c:1001:2: note: Taking false branch
           if (res->poison) {
           ^
   tools/lib/bpf/relo_core.c:1015:2: note: Control jumps to 'case 3:'  at l=
ine 1034
           switch (class) {
           ^
   tools/lib/bpf/relo_core.c:1035:12: note: Field 'validate' is true
                   if (res->validate && insn->off !=3D orig_val) {
                            ^
   tools/lib/bpf/relo_core.c:1035:7: note: Left side of '&&' is true
                   if (res->validate && insn->off !=3D orig_val) {
                       ^
   tools/lib/bpf/relo_core.c:1035:24: note: Assuming 'orig_val' is equal to=
 field 'off'
                   if (res->validate && insn->off !=3D orig_val) {
                                        ^~~~~~~~~~~~~~~~~~~~~
   tools/lib/bpf/relo_core.c:1035:3: note: Taking false branch
                   if (res->validate && insn->off !=3D orig_val) {
                   ^
   tools/lib/bpf/relo_core.c:1040:7: note: Assuming the condition is false
                   if (new_val > SHRT_MAX) {
                       ^~~~~~~~~~~~~~~~~~
   tools/lib/bpf/relo_core.c:1040:3: note: Taking false branch
                   if (new_val > SHRT_MAX) {
                   ^
   tools/lib/bpf/relo_core.c:1045:7: note: Branch condition evaluates to a =
garbage value
                   if (res->fail_memsz_adjust) {
                       ^~~~~~~~~~~~~~~~~~~~~~
   Suppressed 7 warnings (6 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
   drivers/misc/habanalabs/gaudi/gaudi.c:1111:2: warning: Value stored to '=
cb_size' is never read [clang-analyzer-deadcode.DeadStores]
           cb_size +=3D gaudi_gen_wait_cb(hdev, &wait_prop);
           ^          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/habanalabs/gaudi/gaudi.c:1111:2: note: Value stored to 'cb_=
size' is never read
           cb_size +=3D gaudi_gen_wait_cb(hdev, &wait_prop);
           ^          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/habanalabs/gaudi/gaudi.c:1144:2: warning: Value stored to '=
cb_size' is never read [clang-analyzer-deadcode.DeadStores]

vim +1045 tools/lib/bpf/relo_core.c

b0588390dbcedc Alexei Starovoitov 2021-07-20   974  =

b0588390dbcedc Alexei Starovoitov 2021-07-20   975  /*
b0588390dbcedc Alexei Starovoitov 2021-07-20   976   * Patch relocatable BP=
F instruction.
b0588390dbcedc Alexei Starovoitov 2021-07-20   977   *
b0588390dbcedc Alexei Starovoitov 2021-07-20   978   * Patched value is det=
ermined by relocation kind and target specification.
b0588390dbcedc Alexei Starovoitov 2021-07-20   979   * For existence reloca=
tions target spec will be NULL if field/type is not found.
b0588390dbcedc Alexei Starovoitov 2021-07-20   980   * Expected insn->imm v=
alue is determined using relocation kind and local
b0588390dbcedc Alexei Starovoitov 2021-07-20   981   * spec, and is checked=
 before patching instruction. If actual insn->imm value
b0588390dbcedc Alexei Starovoitov 2021-07-20   982   * is wrong, bail out w=
ith error.
b0588390dbcedc Alexei Starovoitov 2021-07-20   983   *
b0588390dbcedc Alexei Starovoitov 2021-07-20   984   * Currently supported =
classes of BPF instruction are:
b0588390dbcedc Alexei Starovoitov 2021-07-20   985   * 1. rX =3D <imm> (ass=
ignment with immediate operand);
b0588390dbcedc Alexei Starovoitov 2021-07-20   986   * 2. rX +=3D <imm> (ar=
ithmetic operations with immediate operand);
b0588390dbcedc Alexei Starovoitov 2021-07-20   987   * 3. rX =3D <imm64> (l=
oad with 64-bit immediate value);
b0588390dbcedc Alexei Starovoitov 2021-07-20   988   * 4. rX =3D *(T *)(rY =
+ <off>), where T is one of {u8, u16, u32, u64};
b0588390dbcedc Alexei Starovoitov 2021-07-20   989   * 5. *(T *)(rX + <off>=
) =3D rY, where T is one of {u8, u16, u32, u64};
b0588390dbcedc Alexei Starovoitov 2021-07-20   990   * 6. *(T *)(rX + <off>=
) =3D <imm>, where T is one of {u8, u16, u32, u64}.
b0588390dbcedc Alexei Starovoitov 2021-07-20   991   */
b0588390dbcedc Alexei Starovoitov 2021-07-20   992  static int bpf_core_pat=
ch_insn(const char *prog_name, struct bpf_insn *insn,
b0588390dbcedc Alexei Starovoitov 2021-07-20   993  			       int insn_idx,=
 const struct bpf_core_relo *relo,
b0588390dbcedc Alexei Starovoitov 2021-07-20   994  			       int relo_idx,=
 const struct bpf_core_relo_res *res)
b0588390dbcedc Alexei Starovoitov 2021-07-20   995  {
b0588390dbcedc Alexei Starovoitov 2021-07-20   996  	__u32 orig_val, new_va=
l;
b0588390dbcedc Alexei Starovoitov 2021-07-20   997  	__u8 class;
b0588390dbcedc Alexei Starovoitov 2021-07-20   998  =

b0588390dbcedc Alexei Starovoitov 2021-07-20   999  	class =3D BPF_CLASS(in=
sn->code);
b0588390dbcedc Alexei Starovoitov 2021-07-20  1000  =

b0588390dbcedc Alexei Starovoitov 2021-07-20  1001  	if (res->poison) {
b0588390dbcedc Alexei Starovoitov 2021-07-20  1002  poison:
b0588390dbcedc Alexei Starovoitov 2021-07-20  1003  		/* poison second part=
 of ldimm64 to avoid confusing error from
b0588390dbcedc Alexei Starovoitov 2021-07-20  1004  		 * verifier about "un=
known opcode 00"
b0588390dbcedc Alexei Starovoitov 2021-07-20  1005  		 */
b0588390dbcedc Alexei Starovoitov 2021-07-20  1006  		if (is_ldimm64_insn(i=
nsn))
b0588390dbcedc Alexei Starovoitov 2021-07-20  1007  			bpf_core_poison_insn=
(prog_name, relo_idx, insn_idx + 1, insn + 1);
b0588390dbcedc Alexei Starovoitov 2021-07-20  1008  		bpf_core_poison_insn(=
prog_name, relo_idx, insn_idx, insn);
b0588390dbcedc Alexei Starovoitov 2021-07-20  1009  		return 0;
b0588390dbcedc Alexei Starovoitov 2021-07-20  1010  	}
b0588390dbcedc Alexei Starovoitov 2021-07-20  1011  =

b0588390dbcedc Alexei Starovoitov 2021-07-20  1012  	orig_val =3D res->orig=
_val;
b0588390dbcedc Alexei Starovoitov 2021-07-20  1013  	new_val =3D res->new_v=
al;
b0588390dbcedc Alexei Starovoitov 2021-07-20  1014  =

b0588390dbcedc Alexei Starovoitov 2021-07-20  1015  	switch (class) {
b0588390dbcedc Alexei Starovoitov 2021-07-20  1016  	case BPF_ALU:
b0588390dbcedc Alexei Starovoitov 2021-07-20  1017  	case BPF_ALU64:
b0588390dbcedc Alexei Starovoitov 2021-07-20  1018  		if (BPF_SRC(insn->cod=
e) !=3D BPF_K)
b0588390dbcedc Alexei Starovoitov 2021-07-20  1019  			return -EINVAL;
b0588390dbcedc Alexei Starovoitov 2021-07-20  1020  		if (res->validate && =
insn->imm !=3D orig_val) {
b0588390dbcedc Alexei Starovoitov 2021-07-20  1021  			pr_warn("prog '%s': =
relo #%d: unexpected insn #%d (ALU/ALU64) value: got %u, exp %u -> %u\n",
b0588390dbcedc Alexei Starovoitov 2021-07-20  1022  				prog_name, relo_idx,
b0588390dbcedc Alexei Starovoitov 2021-07-20  1023  				insn_idx, insn->imm=
, orig_val, new_val);
b0588390dbcedc Alexei Starovoitov 2021-07-20  1024  			return -EINVAL;
b0588390dbcedc Alexei Starovoitov 2021-07-20  1025  		}
b0588390dbcedc Alexei Starovoitov 2021-07-20  1026  		orig_val =3D insn->im=
m;
b0588390dbcedc Alexei Starovoitov 2021-07-20  1027  		insn->imm =3D new_val;
b0588390dbcedc Alexei Starovoitov 2021-07-20  1028  		pr_debug("prog '%s': =
relo #%d: patched insn #%d (ALU/ALU64) imm %u -> %u\n",
b0588390dbcedc Alexei Starovoitov 2021-07-20  1029  			 prog_name, relo_idx=
, insn_idx,
b0588390dbcedc Alexei Starovoitov 2021-07-20  1030  			 orig_val, new_val);
b0588390dbcedc Alexei Starovoitov 2021-07-20  1031  		break;
b0588390dbcedc Alexei Starovoitov 2021-07-20  1032  	case BPF_LDX:
b0588390dbcedc Alexei Starovoitov 2021-07-20  1033  	case BPF_ST:
b0588390dbcedc Alexei Starovoitov 2021-07-20  1034  	case BPF_STX:
b0588390dbcedc Alexei Starovoitov 2021-07-20  1035  		if (res->validate && =
insn->off !=3D orig_val) {
b0588390dbcedc Alexei Starovoitov 2021-07-20  1036  			pr_warn("prog '%s': =
relo #%d: unexpected insn #%d (LDX/ST/STX) value: got %u, exp %u -> %u\n",
b0588390dbcedc Alexei Starovoitov 2021-07-20  1037  				prog_name, relo_idx=
, insn_idx, insn->off, orig_val, new_val);
b0588390dbcedc Alexei Starovoitov 2021-07-20  1038  			return -EINVAL;
b0588390dbcedc Alexei Starovoitov 2021-07-20  1039  		}
b0588390dbcedc Alexei Starovoitov 2021-07-20  1040  		if (new_val > SHRT_MA=
X) {
b0588390dbcedc Alexei Starovoitov 2021-07-20  1041  			pr_warn("prog '%s': =
relo #%d: insn #%d (LDX/ST/STX) value too big: %u\n",
b0588390dbcedc Alexei Starovoitov 2021-07-20  1042  				prog_name, relo_idx=
, insn_idx, new_val);
b0588390dbcedc Alexei Starovoitov 2021-07-20  1043  			return -ERANGE;
b0588390dbcedc Alexei Starovoitov 2021-07-20  1044  		}
b0588390dbcedc Alexei Starovoitov 2021-07-20 @1045  		if (res->fail_memsz_a=
djust) {
b0588390dbcedc Alexei Starovoitov 2021-07-20  1046  			pr_warn("prog '%s': =
relo #%d: insn #%d (LDX/ST/STX) accesses field incorrectly. "
b0588390dbcedc Alexei Starovoitov 2021-07-20  1047  				"Make sure you are =
accessing pointers, unsigned integers, or fields of matching type and size.=
\n",
b0588390dbcedc Alexei Starovoitov 2021-07-20  1048  				prog_name, relo_idx=
, insn_idx);
b0588390dbcedc Alexei Starovoitov 2021-07-20  1049  			goto poison;
b0588390dbcedc Alexei Starovoitov 2021-07-20  1050  		}
b0588390dbcedc Alexei Starovoitov 2021-07-20  1051  =

b0588390dbcedc Alexei Starovoitov 2021-07-20  1052  		orig_val =3D insn->of=
f;
b0588390dbcedc Alexei Starovoitov 2021-07-20  1053  		insn->off =3D new_val;
b0588390dbcedc Alexei Starovoitov 2021-07-20  1054  		pr_debug("prog '%s': =
relo #%d: patched insn #%d (LDX/ST/STX) off %u -> %u\n",
b0588390dbcedc Alexei Starovoitov 2021-07-20  1055  			 prog_name, relo_idx=
, insn_idx, orig_val, new_val);
b0588390dbcedc Alexei Starovoitov 2021-07-20  1056  =

b0588390dbcedc Alexei Starovoitov 2021-07-20  1057  		if (res->new_sz !=3D =
res->orig_sz) {
b0588390dbcedc Alexei Starovoitov 2021-07-20  1058  			int insn_bytes_sz, i=
nsn_bpf_sz;
b0588390dbcedc Alexei Starovoitov 2021-07-20  1059  =

b0588390dbcedc Alexei Starovoitov 2021-07-20  1060  			insn_bytes_sz =3D in=
sn_bpf_size_to_bytes(insn);
b0588390dbcedc Alexei Starovoitov 2021-07-20  1061  			if (insn_bytes_sz !=
=3D res->orig_sz) {
b0588390dbcedc Alexei Starovoitov 2021-07-20  1062  				pr_warn("prog '%s':=
 relo #%d: insn #%d (LDX/ST/STX) unexpected mem size: got %d, exp %u\n",
b0588390dbcedc Alexei Starovoitov 2021-07-20  1063  					prog_name, relo_id=
x, insn_idx, insn_bytes_sz, res->orig_sz);
b0588390dbcedc Alexei Starovoitov 2021-07-20  1064  				return -EINVAL;
b0588390dbcedc Alexei Starovoitov 2021-07-20  1065  			}
b0588390dbcedc Alexei Starovoitov 2021-07-20  1066  =

b0588390dbcedc Alexei Starovoitov 2021-07-20  1067  			insn_bpf_sz =3D insn=
_bytes_to_bpf_size(res->new_sz);
b0588390dbcedc Alexei Starovoitov 2021-07-20  1068  			if (insn_bpf_sz < 0)=
 {
b0588390dbcedc Alexei Starovoitov 2021-07-20  1069  				pr_warn("prog '%s':=
 relo #%d: insn #%d (LDX/ST/STX) invalid new mem size: %u\n",
b0588390dbcedc Alexei Starovoitov 2021-07-20  1070  					prog_name, relo_id=
x, insn_idx, res->new_sz);
b0588390dbcedc Alexei Starovoitov 2021-07-20  1071  				return -EINVAL;
b0588390dbcedc Alexei Starovoitov 2021-07-20  1072  			}
b0588390dbcedc Alexei Starovoitov 2021-07-20  1073  =

b0588390dbcedc Alexei Starovoitov 2021-07-20  1074  			insn->code =3D BPF_M=
ODE(insn->code) | insn_bpf_sz | BPF_CLASS(insn->code);
b0588390dbcedc Alexei Starovoitov 2021-07-20  1075  			pr_debug("prog '%s':=
 relo #%d: patched insn #%d (LDX/ST/STX) mem_sz %u -> %u\n",
b0588390dbcedc Alexei Starovoitov 2021-07-20  1076  				 prog_name, relo_id=
x, insn_idx, res->orig_sz, res->new_sz);
b0588390dbcedc Alexei Starovoitov 2021-07-20  1077  		}
b0588390dbcedc Alexei Starovoitov 2021-07-20  1078  		break;
b0588390dbcedc Alexei Starovoitov 2021-07-20  1079  	case BPF_LD: {
b0588390dbcedc Alexei Starovoitov 2021-07-20  1080  		__u64 imm;
b0588390dbcedc Alexei Starovoitov 2021-07-20  1081  =

b0588390dbcedc Alexei Starovoitov 2021-07-20  1082  		if (!is_ldimm64_insn(=
insn) ||
b0588390dbcedc Alexei Starovoitov 2021-07-20  1083  		    insn[0].src_reg !=
=3D 0 || insn[0].off !=3D 0 ||
b0588390dbcedc Alexei Starovoitov 2021-07-20  1084  		    insn[1].code !=3D=
 0 || insn[1].dst_reg !=3D 0 ||
b0588390dbcedc Alexei Starovoitov 2021-07-20  1085  		    insn[1].src_reg !=
=3D 0 || insn[1].off !=3D 0) {
b0588390dbcedc Alexei Starovoitov 2021-07-20  1086  			pr_warn("prog '%s': =
relo #%d: insn #%d (LDIMM64) has unexpected form\n",
b0588390dbcedc Alexei Starovoitov 2021-07-20  1087  				prog_name, relo_idx=
, insn_idx);
b0588390dbcedc Alexei Starovoitov 2021-07-20  1088  			return -EINVAL;
b0588390dbcedc Alexei Starovoitov 2021-07-20  1089  		}
b0588390dbcedc Alexei Starovoitov 2021-07-20  1090  =

b0588390dbcedc Alexei Starovoitov 2021-07-20  1091  		imm =3D insn[0].imm +=
 ((__u64)insn[1].imm << 32);
b0588390dbcedc Alexei Starovoitov 2021-07-20  1092  		if (res->validate && =
imm !=3D orig_val) {
b0588390dbcedc Alexei Starovoitov 2021-07-20  1093  			pr_warn("prog '%s': =
relo #%d: unexpected insn #%d (LDIMM64) value: got %llu, exp %u -> %u\n",
b0588390dbcedc Alexei Starovoitov 2021-07-20  1094  				prog_name, relo_idx,
b0588390dbcedc Alexei Starovoitov 2021-07-20  1095  				insn_idx, (unsigned=
 long long)imm,
b0588390dbcedc Alexei Starovoitov 2021-07-20  1096  				orig_val, new_val);
b0588390dbcedc Alexei Starovoitov 2021-07-20  1097  			return -EINVAL;
b0588390dbcedc Alexei Starovoitov 2021-07-20  1098  		}
b0588390dbcedc Alexei Starovoitov 2021-07-20  1099  =

b0588390dbcedc Alexei Starovoitov 2021-07-20  1100  		insn[0].imm =3D new_v=
al;
b0588390dbcedc Alexei Starovoitov 2021-07-20  1101  		insn[1].imm =3D 0; /*=
 currently only 32-bit values are supported */
b0588390dbcedc Alexei Starovoitov 2021-07-20  1102  		pr_debug("prog '%s': =
relo #%d: patched insn #%d (LDIMM64) imm64 %llu -> %u\n",
b0588390dbcedc Alexei Starovoitov 2021-07-20  1103  			 prog_name, relo_idx=
, insn_idx,
b0588390dbcedc Alexei Starovoitov 2021-07-20  1104  			 (unsigned long long=
)imm, new_val);
b0588390dbcedc Alexei Starovoitov 2021-07-20  1105  		break;
b0588390dbcedc Alexei Starovoitov 2021-07-20  1106  	}
b0588390dbcedc Alexei Starovoitov 2021-07-20  1107  	default:
b0588390dbcedc Alexei Starovoitov 2021-07-20  1108  		pr_warn("prog '%s': r=
elo #%d: trying to relocate unrecognized insn #%d, code:0x%x, src:0x%x, dst=
:0x%x, off:0x%x, imm:0x%x\n",
b0588390dbcedc Alexei Starovoitov 2021-07-20  1109  			prog_name, relo_idx,=
 insn_idx, insn->code,
b0588390dbcedc Alexei Starovoitov 2021-07-20  1110  			insn->src_reg, insn-=
>dst_reg, insn->off, insn->imm);
b0588390dbcedc Alexei Starovoitov 2021-07-20  1111  		return -EINVAL;
b0588390dbcedc Alexei Starovoitov 2021-07-20  1112  	}
b0588390dbcedc Alexei Starovoitov 2021-07-20  1113  =

b0588390dbcedc Alexei Starovoitov 2021-07-20  1114  	return 0;
b0588390dbcedc Alexei Starovoitov 2021-07-20  1115  }
b0588390dbcedc Alexei Starovoitov 2021-07-20  1116  =


:::::: The code at line 1045 was first introduced by commit
:::::: b0588390dbcedcd74fab6ffb8afe8d52380fd8b6 libbpf: Split CO-RE logic i=
nto relo_core.c.

:::::: TO: Alexei Starovoitov <ast@kernel.org>
:::::: CC: Andrii Nakryiko <andrii@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============2537021791367157852==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============2537021791367157852==--

