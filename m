Content-Type: multipart/mixed; boundary="===============3276356765844491013=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ardb:for-kernelci 13/17] arch/arm64/kernel/pi/early_map_kernel.c:134:31: warning: Comparing pointers that point to different objects [comparePointers]
Date: Thu, 07 Jul 2022 16:06:37 +0800
Message-ID: <202207071540.joMsMwGI-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3276356765844491013==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: arch/arm6=
4/kernel/pi/early_map_kernel.c:134:31: warning: Comparing pointers that poi=
nt to different objects [comparePointers]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Ard Biesheuvel <ardb@kernel.org>

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git for-ke=
rnelci
head:   3ed2d2fa189b2f472547045b3af344e7806f7779
commit: 32a20e7c99cc0d6b5948880ea9cfc14068b22f7b [13/17] arm64: head: move =
early kernel mapping and relocation code to C code
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
compiler: aarch64-linux-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 32a20e7c99cc0d6b5948880ea9cfc14068b22f7b
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> arch/arm64/kernel/pi/early_map_kernel.c:134:31: warning: Comparing point=
ers that point to different objects [comparePointers]
    for (rela =3D rela_start; rela < rela_end; rela++) {
                                 ^
   arch/arm64/kernel/pi/early_map_kernel.c:125:25: note: Variable declared =
here.
   extern const Elf64_Rela rela_start[], rela_end[];
                           ^
   arch/arm64/kernel/pi/early_map_kernel.c:134:14: note: Array decayed to p=
ointer here.
    for (rela =3D rela_start; rela < rela_end; rela++) {
                ^
   arch/arm64/kernel/pi/early_map_kernel.c:125:39: note: Variable declared =
here.
   extern const Elf64_Rela rela_start[], rela_end[];
                                         ^
   arch/arm64/kernel/pi/early_map_kernel.c:134:33: note: Array decayed to p=
ointer here.
    for (rela =3D rela_start; rela < rela_end; rela++) {
                                   ^
   arch/arm64/kernel/pi/early_map_kernel.c:134:31: note: Comparing pointers=
 that point to different objects
    for (rela =3D rela_start; rela < rela_end; rela++) {
                                 ^
   arch/arm64/kernel/pi/early_map_kernel.c:169:31: warning: Comparing point=
ers that point to different objects [comparePointers]
    for (relr =3D relr_start; relr < relr_end; relr++) {
                                 ^
   arch/arm64/kernel/pi/early_map_kernel.c:126:18: note: Variable declared =
here.
   extern const u64 relr_start[], relr_end[];
                    ^
   arch/arm64/kernel/pi/early_map_kernel.c:169:14: note: Array decayed to p=
ointer here.
    for (relr =3D relr_start; relr < relr_end; relr++) {
                ^
   arch/arm64/kernel/pi/early_map_kernel.c:126:32: note: Variable declared =
here.
   extern const u64 relr_start[], relr_end[];
                                  ^
   arch/arm64/kernel/pi/early_map_kernel.c:169:33: note: Array decayed to p=
ointer here.
    for (relr =3D relr_start; relr < relr_end; relr++) {
                                   ^
   arch/arm64/kernel/pi/early_map_kernel.c:169:31: note: Comparing pointers=
 that point to different objects
    for (relr =3D relr_start; relr < relr_end; relr++) {
                                 ^

vim +134 arch/arm64/kernel/pi/early_map_kernel.c

32a20e7c99cc0d6 Ard Biesheuvel 2022-06-29  127  =

32a20e7c99cc0d6 Ard Biesheuvel 2022-06-29  128  static void relocate_kernel=
(u64 offset)
32a20e7c99cc0d6 Ard Biesheuvel 2022-06-29  129  {
32a20e7c99cc0d6 Ard Biesheuvel 2022-06-29  130  	const Elf64_Rela *rela;
32a20e7c99cc0d6 Ard Biesheuvel 2022-06-29  131  	const u64 *relr;
32a20e7c99cc0d6 Ard Biesheuvel 2022-06-29  132  	u64 *place;
32a20e7c99cc0d6 Ard Biesheuvel 2022-06-29  133  =

32a20e7c99cc0d6 Ard Biesheuvel 2022-06-29 @134  	for (rela =3D rela_start; =
rela < rela_end; rela++) {
32a20e7c99cc0d6 Ard Biesheuvel 2022-06-29  135  		if (ELF64_R_TYPE(rela->r_=
info) !=3D R_AARCH64_RELATIVE)
32a20e7c99cc0d6 Ard Biesheuvel 2022-06-29  136  			continue;
32a20e7c99cc0d6 Ard Biesheuvel 2022-06-29  137  		place =3D (u64 *)(rela->r=
_offset + offset);
32a20e7c99cc0d6 Ard Biesheuvel 2022-06-29  138  		*place =3D rela->r_addend=
 + offset;
32a20e7c99cc0d6 Ard Biesheuvel 2022-06-29  139  	}
32a20e7c99cc0d6 Ard Biesheuvel 2022-06-29  140  =

32a20e7c99cc0d6 Ard Biesheuvel 2022-06-29  141  	if (!IS_ENABLED(CONFIG_REL=
R) || !offset)
32a20e7c99cc0d6 Ard Biesheuvel 2022-06-29  142  		return;
32a20e7c99cc0d6 Ard Biesheuvel 2022-06-29  143  =

32a20e7c99cc0d6 Ard Biesheuvel 2022-06-29  144  	/*
32a20e7c99cc0d6 Ard Biesheuvel 2022-06-29  145  	 * Apply RELR relocations.
32a20e7c99cc0d6 Ard Biesheuvel 2022-06-29  146  	 *
32a20e7c99cc0d6 Ard Biesheuvel 2022-06-29  147  	 * RELR is a compressed fo=
rmat for storing relative relocations. The
32a20e7c99cc0d6 Ard Biesheuvel 2022-06-29  148  	 * encoded sequence of ent=
ries looks like:
32a20e7c99cc0d6 Ard Biesheuvel 2022-06-29  149  	 * [ AAAAAAAA BBBBBBB1 BBB=
BBBB1 ... AAAAAAAA BBBBBB1 ... ]
32a20e7c99cc0d6 Ard Biesheuvel 2022-06-29  150  	 *
32a20e7c99cc0d6 Ard Biesheuvel 2022-06-29  151  	 * i.e. start with an addr=
ess, followed by any number of bitmaps. The
32a20e7c99cc0d6 Ard Biesheuvel 2022-06-29  152  	 * address entry encodes 1=
 relocation. The subsequent bitmap entries
32a20e7c99cc0d6 Ard Biesheuvel 2022-06-29  153  	 * encode up to 63 relocat=
ions each, at subsequent offsets following
32a20e7c99cc0d6 Ard Biesheuvel 2022-06-29  154  	 * the last address entry.
32a20e7c99cc0d6 Ard Biesheuvel 2022-06-29  155  	 *
32a20e7c99cc0d6 Ard Biesheuvel 2022-06-29  156  	 * The bitmap entries must=
 have 1 in the least significant bit. The
32a20e7c99cc0d6 Ard Biesheuvel 2022-06-29  157  	 * assumption here is that=
 an address cannot have 1 in lsb. Odd
32a20e7c99cc0d6 Ard Biesheuvel 2022-06-29  158  	 * addresses are not suppo=
rted. Any odd addresses are stored in the
32a20e7c99cc0d6 Ard Biesheuvel 2022-06-29  159  	 * RELA section, which is =
handled above.
32a20e7c99cc0d6 Ard Biesheuvel 2022-06-29  160  	 *
32a20e7c99cc0d6 Ard Biesheuvel 2022-06-29  161  	 * Excluding the least sig=
nificant bit in the bitmap, each non-zero bit
32a20e7c99cc0d6 Ard Biesheuvel 2022-06-29  162  	 * in the bitmap represent=
s a relocation to be applied to a
32a20e7c99cc0d6 Ard Biesheuvel 2022-06-29  163  	 * corresponding machine w=
ord that follows the base address word. The
32a20e7c99cc0d6 Ard Biesheuvel 2022-06-29  164  	 * second least significan=
t bit represents the machine word immediately
32a20e7c99cc0d6 Ard Biesheuvel 2022-06-29  165  	 * following the initial a=
ddress, and each bit that follows represents
32a20e7c99cc0d6 Ard Biesheuvel 2022-06-29  166  	 * the next word, in linea=
r order. As such, a single bitmap can encode
32a20e7c99cc0d6 Ard Biesheuvel 2022-06-29  167  	 * up to 63 relocations in=
 a 64-bit object.
32a20e7c99cc0d6 Ard Biesheuvel 2022-06-29  168  	 */
32a20e7c99cc0d6 Ard Biesheuvel 2022-06-29  169  	for (relr =3D relr_start; =
relr < relr_end; relr++) {
32a20e7c99cc0d6 Ard Biesheuvel 2022-06-29  170  		u64 *p, r =3D *relr;
32a20e7c99cc0d6 Ard Biesheuvel 2022-06-29  171  =

32a20e7c99cc0d6 Ard Biesheuvel 2022-06-29  172  		if ((r & 1) =3D=3D 0) {
32a20e7c99cc0d6 Ard Biesheuvel 2022-06-29  173  			place =3D (u64 *)(r + of=
fset);
32a20e7c99cc0d6 Ard Biesheuvel 2022-06-29  174  			*place++ +=3D offset;
32a20e7c99cc0d6 Ard Biesheuvel 2022-06-29  175  		} else {
32a20e7c99cc0d6 Ard Biesheuvel 2022-06-29  176  			for (p =3D place; r; p++=
) {
32a20e7c99cc0d6 Ard Biesheuvel 2022-06-29  177  				r >>=3D 1;
32a20e7c99cc0d6 Ard Biesheuvel 2022-06-29  178  				if (r & 1)
32a20e7c99cc0d6 Ard Biesheuvel 2022-06-29  179  					*p +=3D offset;
32a20e7c99cc0d6 Ard Biesheuvel 2022-06-29  180  			}
32a20e7c99cc0d6 Ard Biesheuvel 2022-06-29  181  			place +=3D 63;
32a20e7c99cc0d6 Ard Biesheuvel 2022-06-29  182  		}
32a20e7c99cc0d6 Ard Biesheuvel 2022-06-29  183  	}
32a20e7c99cc0d6 Ard Biesheuvel 2022-06-29  184  }
32a20e7c99cc0d6 Ard Biesheuvel 2022-06-29  185  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3276356765844491013==--

