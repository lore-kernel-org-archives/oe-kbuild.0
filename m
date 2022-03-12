Content-Type: multipart/mixed; boundary="===============5018372814627834700=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/powerpc/net/bpf_jit_comp32.c:190:36: warning: Either the condition 'if(image&&rel<33554432&&rel>=-33554432)' is redundant or there is pointer arithmetic with NULL pointer. [nullPointerArithmeticRedundantCheck]
Date: Sat, 12 Mar 2022 21:17:17 +0800
Message-ID: <202203122140.UUCLMxrG-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5018372814627834700==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Christophe Leroy <christophe.leroy@csgroup.eu>
CC: Michael Ellerman <mpe@ellerman.id.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   68453767131a5deec1e8f9ac92a9042f929e585d
commit: ee7c3ec3b4b1222b30272624897826bc40d79bc5 powerpc/ebpf32: Use standa=
rd function call for functions within 32M distance
date:   11 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 11 months ago
compiler: powerpc-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> arch/powerpc/net/bpf_jit_comp32.c:190:36: warning: Either the condition =
'if(image&&rel<33554432&&rel>=3D-33554432)' is redundant or there is pointe=
r arithmetic with NULL pointer. [nullPointerArithmeticRedundantCheck]
    s32 rel =3D (s32)func - (s32)(image + ctx->idx);
                                      ^
   arch/powerpc/net/bpf_jit_comp32.c:192:5: note: Assuming that condition '=
if(image&&rel<33554432&&rel>=3D-33554432)' is not redundant
    if (image && rel < 0x2000000 && rel >=3D -0x2000000) {
       ^
   arch/powerpc/net/bpf_jit_comp32.c:190:36: note: Null pointer addition
    s32 rel =3D (s32)func - (s32)(image + ctx->idx);
                                      ^

vim +190 arch/powerpc/net/bpf_jit_comp32.c

51c66ad849a703 Christophe Leroy 2021-03-22  187  =

51c66ad849a703 Christophe Leroy 2021-03-22  188  void bpf_jit_emit_func_cal=
l_rel(u32 *image, struct codegen_context *ctx, u64 func)
51c66ad849a703 Christophe Leroy 2021-03-22  189  {
ee7c3ec3b4b122 Christophe Leroy 2021-04-12 @190  	s32 rel =3D (s32)func - (=
s32)(image + ctx->idx);
ee7c3ec3b4b122 Christophe Leroy 2021-04-12  191  =

ee7c3ec3b4b122 Christophe Leroy 2021-04-12  192  	if (image && rel < 0x2000=
000 && rel >=3D -0x2000000) {
ee7c3ec3b4b122 Christophe Leroy 2021-04-12  193  		PPC_BL_ABS(func);
ee7c3ec3b4b122 Christophe Leroy 2021-04-12  194  	} else {
51c66ad849a703 Christophe Leroy 2021-03-22  195  		/* Load function address=
 into r0 */
51c66ad849a703 Christophe Leroy 2021-03-22  196  		EMIT(PPC_RAW_LIS(__REG_R=
0, IMM_H(func)));
51c66ad849a703 Christophe Leroy 2021-03-22  197  		EMIT(PPC_RAW_ORI(__REG_R=
0, __REG_R0, IMM_L(func)));
51c66ad849a703 Christophe Leroy 2021-03-22  198  		EMIT(PPC_RAW_MTLR(__REG_=
R0));
51c66ad849a703 Christophe Leroy 2021-03-22  199  		EMIT(PPC_RAW_BLRL());
51c66ad849a703 Christophe Leroy 2021-03-22  200  	}
ee7c3ec3b4b122 Christophe Leroy 2021-04-12  201  }
51c66ad849a703 Christophe Leroy 2021-03-22  202  =


---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5018372814627834700==--

