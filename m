Content-Type: multipart/mixed; boundary="===============5194744103133784999=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/mips/net/bpf_jit_comp64.c:126:37: warning: Logical disjunction always evaluates to true: imm64 >= 0xffffffffffff8000ULL || imm64 < 0x8000ULL. [incorrectLogicOperator]
Date: Thu, 15 Sep 2022 22:02:55 +0800
Message-ID: <202209152112.RpVStsF3-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5194744103133784999==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check first_new_problem:=
 arch/mips/net/bpf_jit_comp64.c:126:37: warning: Logical disjunction always=
 evaluates to true: imm64 >=3D 0xffffffffffff8000ULL || imm64 < 0x8000ULL. =
[incorrectLogicOperator]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Johan Almbladh <johan.almbladh@anyfinetworks.com>
CC: Andrii Nakryiko <andrii@kernel.org>
CC: Daniel Borkmann <daniel@iogearbox.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   3245cb65fd91cd514801bf91f5a3066d562f0ac4
commit: 01bdc58e94b46b88d4921f46f423bdeb8b137f28 mips, bpf: Enable eBPF JITs
date:   11 months ago
:::::: branch date: 29 hours ago
:::::: commit date: 11 months ago
compiler: mips64el-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 01bdc58e94b46b88d4921f46f423bdeb8b137f28
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> arch/mips/net/bpf_jit_comp64.c:126:37: warning: Logical disjunction alwa=
ys evaluates to true: imm64 >=3D 0xffffffffffff8000ULL || imm64 < 0x8000ULL=
. [incorrectLogicOperator]
    if (imm64 >=3D 0xffffffffffff8000ULL || imm64 < 0x8000ULL) {
                                       ^

vim +126 arch/mips/net/bpf_jit_comp64.c

fbc802de6b10669 Johan Almbladh 2021-10-05  122  =

fbc802de6b10669 Johan Almbladh 2021-10-05  123  /* dst =3D imm (64-bit) */
fbc802de6b10669 Johan Almbladh 2021-10-05  124  static void emit_mov_i64(st=
ruct jit_context *ctx, u8 dst, u64 imm64)
fbc802de6b10669 Johan Almbladh 2021-10-05  125  {
fbc802de6b10669 Johan Almbladh 2021-10-05 @126  	if (imm64 >=3D 0xfffffffff=
fff8000ULL || imm64 < 0x8000ULL) {
fbc802de6b10669 Johan Almbladh 2021-10-05  127  		emit(ctx, daddiu, dst, MI=
PS_R_ZERO, (s16)imm64);
fbc802de6b10669 Johan Almbladh 2021-10-05  128  	} else if (imm64 >=3D 0xff=
ffffff80000000ULL ||
fbc802de6b10669 Johan Almbladh 2021-10-05  129  		   (imm64 < 0x80000000 &&=
 imm64 > 0xffff)) {
fbc802de6b10669 Johan Almbladh 2021-10-05  130  		emit(ctx, lui, dst, (s16)=
(imm64 >> 16));
fbc802de6b10669 Johan Almbladh 2021-10-05  131  		emit(ctx, ori, dst, dst, =
(u16)imm64 & 0xffff);
fbc802de6b10669 Johan Almbladh 2021-10-05  132  	} else {
fbc802de6b10669 Johan Almbladh 2021-10-05  133  		u8 acc =3D MIPS_R_ZERO;
fbc802de6b10669 Johan Almbladh 2021-10-05  134  		int k;
fbc802de6b10669 Johan Almbladh 2021-10-05  135  =

fbc802de6b10669 Johan Almbladh 2021-10-05  136  		for (k =3D 0; k < 4; k++)=
 {
fbc802de6b10669 Johan Almbladh 2021-10-05  137  			u16 half =3D imm64 >> (4=
8 - 16 * k);
fbc802de6b10669 Johan Almbladh 2021-10-05  138  =

fbc802de6b10669 Johan Almbladh 2021-10-05  139  			if (acc =3D=3D dst)
fbc802de6b10669 Johan Almbladh 2021-10-05  140  				emit(ctx, dsll, dst, ds=
t, 16);
fbc802de6b10669 Johan Almbladh 2021-10-05  141  =

fbc802de6b10669 Johan Almbladh 2021-10-05  142  			if (half) {
fbc802de6b10669 Johan Almbladh 2021-10-05  143  				emit(ctx, ori, dst, acc=
, half);
fbc802de6b10669 Johan Almbladh 2021-10-05  144  				acc =3D dst;
fbc802de6b10669 Johan Almbladh 2021-10-05  145  			}
fbc802de6b10669 Johan Almbladh 2021-10-05  146  		}
fbc802de6b10669 Johan Almbladh 2021-10-05  147  	}
fbc802de6b10669 Johan Almbladh 2021-10-05  148  	clobber_reg(ctx, dst);
fbc802de6b10669 Johan Almbladh 2021-10-05  149  }
fbc802de6b10669 Johan Almbladh 2021-10-05  150  =


:::::: The code at line 126 was first introduced by commit
:::::: fbc802de6b10669bfe2d4ebc4dcf12563bba117c mips, bpf: Add new eBPF JIT=
 for 64-bit MIPS

:::::: TO: Johan Almbladh <johan.almbladh@anyfinetworks.com>
:::::: CC: Andrii Nakryiko <andrii@kernel.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5194744103133784999==--

