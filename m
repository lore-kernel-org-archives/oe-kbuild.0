Content-Type: multipart/mixed; boundary="===============3233533646134579640=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [atishp04:isa_framework 5/8] arch/riscv/kernel/cpufeature.c:185 riscv_fill_hwcap() warn: should '1 << (*ext - 97)' be a 64 bit type?
Date: Fri, 11 Feb 2022 18:11:50 +0800
Message-ID: <202202111800.UsLSMdVt-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3233533646134579640==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Atish Patra <Atish.Patra@wdc.com>
CC: linux-kernel(a)vger.kernel.org
TO: Atish Patra <atishp@rivosinc.com>

tree:   https://github.com/atishp04/linux isa_framework
head:   db6ba78ead62e927c2057ba750765b070c8af8a6
commit: 8b657281e959412f7bc7688c26ddebca7ee69b90 [5/8] RISC-V: Implement mu=
lti-letter ISA extension probing framework
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: riscv-randconfig-m031-20220211 (https://download.01.org/0day-ci/arc=
hive/20220211/202202111800.UsLSMdVt-lkp(a)intel.com/config)
compiler: riscv32-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
arch/riscv/kernel/cpufeature.c:185 riscv_fill_hwcap() warn: should '1 << (*=
ext - 97)' be a 64 bit type?

Old smatch warnings:
arch/riscv/kernel/cpufeature.c:183 riscv_fill_hwcap() error: uninitialized =
symbol 'ext_long'.

vim +185 arch/riscv/kernel/cpufeature.c

6bcff51539ccae5 Anup Patel     2020-04-24   64  =

3df952ae2ac81fb Jisheng Zhang  2021-05-16   65  void __init riscv_fill_hwca=
p(void)
e2c0cdfba7f6992 Palmer Dabbelt 2017-07-10   66  {
dd81c8ab819d360 Johan Hovold   2019-01-18   67  	struct device_node *node;
e2c0cdfba7f6992 Palmer Dabbelt 2017-07-10   68  	const char *isa;
d4d5a22e24d477a Tsukasa OI     2021-12-02   69  	char print_str[NUM_ALPHA_E=
XTS + 1];
f4fd878dfb479e6 Tsukasa OI     2021-12-02   70  	int i, j;
e2c0cdfba7f6992 Palmer Dabbelt 2017-07-10   71  	static unsigned long isa2h=
wcap[256] =3D {0};
e2c0cdfba7f6992 Palmer Dabbelt 2017-07-10   72  =

e2c0cdfba7f6992 Palmer Dabbelt 2017-07-10   73  	isa2hwcap['i'] =3D isa2hwc=
ap['I'] =3D COMPAT_HWCAP_ISA_I;
e2c0cdfba7f6992 Palmer Dabbelt 2017-07-10   74  	isa2hwcap['m'] =3D isa2hwc=
ap['M'] =3D COMPAT_HWCAP_ISA_M;
e2c0cdfba7f6992 Palmer Dabbelt 2017-07-10   75  	isa2hwcap['a'] =3D isa2hwc=
ap['A'] =3D COMPAT_HWCAP_ISA_A;
e2c0cdfba7f6992 Palmer Dabbelt 2017-07-10   76  	isa2hwcap['f'] =3D isa2hwc=
ap['F'] =3D COMPAT_HWCAP_ISA_F;
e2c0cdfba7f6992 Palmer Dabbelt 2017-07-10   77  	isa2hwcap['d'] =3D isa2hwc=
ap['D'] =3D COMPAT_HWCAP_ISA_D;
e2c0cdfba7f6992 Palmer Dabbelt 2017-07-10   78  	isa2hwcap['c'] =3D isa2hwc=
ap['C'] =3D COMPAT_HWCAP_ISA_C;
e2c0cdfba7f6992 Palmer Dabbelt 2017-07-10   79  =

e2c0cdfba7f6992 Palmer Dabbelt 2017-07-10   80  	elf_hwcap =3D 0;
e2c0cdfba7f6992 Palmer Dabbelt 2017-07-10   81  =

6bcff51539ccae5 Anup Patel     2020-04-24   82  	bitmap_zero(riscv_isa, RIS=
CV_ISA_EXT_MAX);
6bcff51539ccae5 Anup Patel     2020-04-24   83  =

dd81c8ab819d360 Johan Hovold   2019-01-18   84  	for_each_of_cpu_node(node)=
 {
fbdc6193dc706c8 Atish Patra    2019-02-22   85  		unsigned long this_hwcap =
=3D 0;
8b657281e959412 Atish Patra    2022-02-08   86  		uint64_t this_isa =3D 0;
fbdc6193dc706c8 Atish Patra    2019-02-22   87  =

fbdc6193dc706c8 Atish Patra    2019-02-22   88  		if (riscv_of_processor_ha=
rtid(node) < 0)
fbdc6193dc706c8 Atish Patra    2019-02-22   89  			continue;
e2c0cdfba7f6992 Palmer Dabbelt 2017-07-10   90  =

e2c0cdfba7f6992 Palmer Dabbelt 2017-07-10   91  		if (of_property_read_stri=
ng(node, "riscv,isa", &isa)) {
7265d103902c0bc Johan Hovold   2019-01-18   92  			pr_warn("Unable to find =
\"riscv,isa\" devicetree entry\n");
fbdc6193dc706c8 Atish Patra    2019-02-22   93  			continue;
e2c0cdfba7f6992 Palmer Dabbelt 2017-07-10   94  		}
e2c0cdfba7f6992 Palmer Dabbelt 2017-07-10   95  =

6bcff51539ccae5 Anup Patel     2020-04-24   96  #if IS_ENABLED(CONFIG_32BIT)
6bcff51539ccae5 Anup Patel     2020-04-24   97  		if (!strncmp(isa, "rv32",=
 4))
f4fd878dfb479e6 Tsukasa OI     2021-12-02   98  			isa +=3D 4;
6bcff51539ccae5 Anup Patel     2020-04-24   99  #elif IS_ENABLED(CONFIG_64B=
IT)
6bcff51539ccae5 Anup Patel     2020-04-24  100  		if (!strncmp(isa, "rv64",=
 4))
f4fd878dfb479e6 Tsukasa OI     2021-12-02  101  			isa +=3D 4;
6bcff51539ccae5 Anup Patel     2020-04-24  102  #endif
f4fd878dfb479e6 Tsukasa OI     2021-12-02  103  		for (; *isa; ++isa) {
f4fd878dfb479e6 Tsukasa OI     2021-12-02  104  			const char *ext =3D isa+=
+;
cc3c2c529f62560 Tsukasa OI     2021-12-02  105  			const char *ext_end =3D =
isa;
f4fd878dfb479e6 Tsukasa OI     2021-12-02  106  			bool ext_long, ext_err =
=3D false;
f4fd878dfb479e6 Tsukasa OI     2021-12-02  107  =

f4fd878dfb479e6 Tsukasa OI     2021-12-02  108  			switch (*ext) {
f4fd878dfb479e6 Tsukasa OI     2021-12-02  109  			case 's':
f4fd878dfb479e6 Tsukasa OI     2021-12-02  110  			case 'x':
f4fd878dfb479e6 Tsukasa OI     2021-12-02  111  			case 'z':
f4fd878dfb479e6 Tsukasa OI     2021-12-02  112  				/**
f4fd878dfb479e6 Tsukasa OI     2021-12-02  113  				 * 's' is a special cas=
e because:
f4fd878dfb479e6 Tsukasa OI     2021-12-02  114  				 * It can be present in=
 base extension for supervisor
f4fd878dfb479e6 Tsukasa OI     2021-12-02  115  				 * Multi-letter extensi=
ons can start with 's' as well for
f4fd878dfb479e6 Tsukasa OI     2021-12-02  116  				 * Supervisor extension=
s (i.e. sstc, sscofpmf, svinval)
f4fd878dfb479e6 Tsukasa OI     2021-12-02  117  				 */
f4fd878dfb479e6 Tsukasa OI     2021-12-02  118  				if (*ext =3D=3D 's' && =
ext[-1] !=3D '_')
f4fd878dfb479e6 Tsukasa OI     2021-12-02  119  					break;
f4fd878dfb479e6 Tsukasa OI     2021-12-02  120  				ext_long =3D true;
f4fd878dfb479e6 Tsukasa OI     2021-12-02  121  				/* Multi-letter extensi=
on must be delimited */
f4fd878dfb479e6 Tsukasa OI     2021-12-02  122  				for (; *isa && *isa !=
=3D '_'; ++isa)
cc3c2c529f62560 Tsukasa OI     2021-12-02  123  					if (unlikely(!islower(=
*isa)
cc3c2c529f62560 Tsukasa OI     2021-12-02  124  						     && !isdigit(*isa=
)))
f4fd878dfb479e6 Tsukasa OI     2021-12-02  125  						ext_err =3D true;
cc3c2c529f62560 Tsukasa OI     2021-12-02  126  				 /* Parse backwards */
cc3c2c529f62560 Tsukasa OI     2021-12-02  127  				ext_end =3D isa;
cc3c2c529f62560 Tsukasa OI     2021-12-02  128  				if (unlikely(ext_err))
cc3c2c529f62560 Tsukasa OI     2021-12-02  129  					break;
cc3c2c529f62560 Tsukasa OI     2021-12-02  130  				if (!isdigit(ext_end[-1=
]))
cc3c2c529f62560 Tsukasa OI     2021-12-02  131  					break;
cc3c2c529f62560 Tsukasa OI     2021-12-02  132  				/* Skip the minor versi=
on */
cc3c2c529f62560 Tsukasa OI     2021-12-02  133  				while (isdigit(*--ext_e=
nd))
cc3c2c529f62560 Tsukasa OI     2021-12-02  134  					;
cc3c2c529f62560 Tsukasa OI     2021-12-02  135  				if (ext_end[0] !=3D 'p'
cc3c2c529f62560 Tsukasa OI     2021-12-02  136  				    || !isdigit(ext_end=
[-1])) {
cc3c2c529f62560 Tsukasa OI     2021-12-02  137  					/* Advance it to offse=
t the pre-decrement */
cc3c2c529f62560 Tsukasa OI     2021-12-02  138  					++ext_end;
cc3c2c529f62560 Tsukasa OI     2021-12-02  139  					break;
cc3c2c529f62560 Tsukasa OI     2021-12-02  140  				}
cc3c2c529f62560 Tsukasa OI     2021-12-02  141  				/* Skip the major versi=
on */
cc3c2c529f62560 Tsukasa OI     2021-12-02  142  				while (isdigit(*--ext_e=
nd))
cc3c2c529f62560 Tsukasa OI     2021-12-02  143  					;
cc3c2c529f62560 Tsukasa OI     2021-12-02  144  				++ext_end;
f4fd878dfb479e6 Tsukasa OI     2021-12-02  145  				break;
f4fd878dfb479e6 Tsukasa OI     2021-12-02  146  			default:
f4fd878dfb479e6 Tsukasa OI     2021-12-02  147  				ext_long =3D false;
cc3c2c529f62560 Tsukasa OI     2021-12-02  148  				if (unlikely(!islower(*=
ext))) {
f4fd878dfb479e6 Tsukasa OI     2021-12-02  149  					ext_err =3D true;
f4fd878dfb479e6 Tsukasa OI     2021-12-02  150  					break;
f4fd878dfb479e6 Tsukasa OI     2021-12-02  151  				}
f4fd878dfb479e6 Tsukasa OI     2021-12-02  152  				/* Find next extension =
*/
f4fd878dfb479e6 Tsukasa OI     2021-12-02  153  				if (!isdigit(*isa))
f4fd878dfb479e6 Tsukasa OI     2021-12-02  154  					break;
cc3c2c529f62560 Tsukasa OI     2021-12-02  155  				/* Skip the minor versi=
on */
f4fd878dfb479e6 Tsukasa OI     2021-12-02  156  				while (isdigit(*++isa))
f4fd878dfb479e6 Tsukasa OI     2021-12-02  157  					;
f4fd878dfb479e6 Tsukasa OI     2021-12-02  158  				if (*isa !=3D 'p')
f4fd878dfb479e6 Tsukasa OI     2021-12-02  159  					break;
f4fd878dfb479e6 Tsukasa OI     2021-12-02  160  				if (!isdigit(*++isa)) {
f4fd878dfb479e6 Tsukasa OI     2021-12-02  161  					--isa;
f4fd878dfb479e6 Tsukasa OI     2021-12-02  162  					break;
f4fd878dfb479e6 Tsukasa OI     2021-12-02  163  				}
cc3c2c529f62560 Tsukasa OI     2021-12-02  164  				/* Skip the major versi=
on */
f4fd878dfb479e6 Tsukasa OI     2021-12-02  165  				while (isdigit(*++isa))
f4fd878dfb479e6 Tsukasa OI     2021-12-02  166  					;
f4fd878dfb479e6 Tsukasa OI     2021-12-02  167  				break;
f4fd878dfb479e6 Tsukasa OI     2021-12-02  168  			}
f4fd878dfb479e6 Tsukasa OI     2021-12-02  169  			if (*isa !=3D '_')
f4fd878dfb479e6 Tsukasa OI     2021-12-02  170  				--isa;
cc3c2c529f62560 Tsukasa OI     2021-12-02  171  =

8b657281e959412 Atish Patra    2022-02-08  172  #define SET_ISA_EXT_MAP(nam=
e, bit)						\
8b657281e959412 Atish Patra    2022-02-08  173  			do {							\
8b657281e959412 Atish Patra    2022-02-08  174  				if ((ext_end - ext =3D=
=3D sizeof(name) - 1) &&	\
8b657281e959412 Atish Patra    2022-02-08  175  				     !memcmp(ext, name,=
 sizeof(name) - 1)) {    \
8b657281e959412 Atish Patra    2022-02-08  176  					this_isa |=3D (1UL << =
bit);		\
8b657281e959412 Atish Patra    2022-02-08  177  					pr_info("Found ISA ext=
ension %s", name);\
8b657281e959412 Atish Patra    2022-02-08  178  				}						\
8b657281e959412 Atish Patra    2022-02-08  179  			} while (false)						\
8b657281e959412 Atish Patra    2022-02-08  180  =

cc3c2c529f62560 Tsukasa OI     2021-12-02  181  			if (unlikely(ext_err))
f4fd878dfb479e6 Tsukasa OI     2021-12-02  182  				continue;
cc3c2c529f62560 Tsukasa OI     2021-12-02  183  			if (!ext_long) {
f4fd878dfb479e6 Tsukasa OI     2021-12-02  184  				this_hwcap |=3D isa2hwc=
ap[(unsigned char)(*ext)];
f4fd878dfb479e6 Tsukasa OI     2021-12-02 @185  				this_isa |=3D (1UL << (=
*ext - 'a'));
6bcff51539ccae5 Anup Patel     2020-04-24  186  			}
8b657281e959412 Atish Patra    2022-02-08  187  #undef SET_ISA_EXT_MAP
cc3c2c529f62560 Tsukasa OI     2021-12-02  188  		}
fbdc6193dc706c8 Atish Patra    2019-02-22  189  =

fbdc6193dc706c8 Atish Patra    2019-02-22  190  		/*
fbdc6193dc706c8 Atish Patra    2019-02-22  191  		 * All "okay" hart should=
 have same isa. Set HWCAP based on
fbdc6193dc706c8 Atish Patra    2019-02-22  192  		 * common capabilities of=
 every "okay" hart, in case they don't
fbdc6193dc706c8 Atish Patra    2019-02-22  193  		 * have.
fbdc6193dc706c8 Atish Patra    2019-02-22  194  		 */
fbdc6193dc706c8 Atish Patra    2019-02-22  195  		if (elf_hwcap)
fbdc6193dc706c8 Atish Patra    2019-02-22  196  			elf_hwcap &=3D this_hwca=
p;
fbdc6193dc706c8 Atish Patra    2019-02-22  197  		else
fbdc6193dc706c8 Atish Patra    2019-02-22  198  			elf_hwcap =3D this_hwcap;
6bcff51539ccae5 Anup Patel     2020-04-24  199  =

8b657281e959412 Atish Patra    2022-02-08  200  		if (riscv_isa[0]) {
8b657281e959412 Atish Patra    2022-02-08  201  #if IS_ENABLED(CONFIG_32BIT)
8b657281e959412 Atish Patra    2022-02-08  202  			riscv_isa[0] &=3D this_i=
sa & 0xFFFFFFFF;
8b657281e959412 Atish Patra    2022-02-08  203  			riscv_isa[1] &=3D this_i=
sa >> 32;
8b657281e959412 Atish Patra    2022-02-08  204  #else
6bcff51539ccae5 Anup Patel     2020-04-24  205  			riscv_isa[0] &=3D this_i=
sa;
8b657281e959412 Atish Patra    2022-02-08  206  #endif
8b657281e959412 Atish Patra    2022-02-08  207  		} else {
8b657281e959412 Atish Patra    2022-02-08  208  #if IS_ENABLED(CONFIG_32BIT)
8b657281e959412 Atish Patra    2022-02-08  209  			riscv_isa[0] =3D this_is=
a & 0xFFFFFFFF;
8b657281e959412 Atish Patra    2022-02-08  210  			riscv_isa[1] =3D this_is=
a >> 32;
8b657281e959412 Atish Patra    2022-02-08  211  #else
6bcff51539ccae5 Anup Patel     2020-04-24  212  			riscv_isa[0] =3D this_is=
a;
8b657281e959412 Atish Patra    2022-02-08  213  #endif
8b657281e959412 Atish Patra    2022-02-08  214  		}
fbdc6193dc706c8 Atish Patra    2019-02-22  215  	}
e2c0cdfba7f6992 Palmer Dabbelt 2017-07-10  216  =

86e581e31078578 Palmer Dabbelt 2018-08-27  217  	/* We don't support system=
s with F but without D, so mask those out
86e581e31078578 Palmer Dabbelt 2018-08-27  218  	 * here. */
86e581e31078578 Palmer Dabbelt 2018-08-27  219  	if ((elf_hwcap & COMPAT_HW=
CAP_ISA_F) && !(elf_hwcap & COMPAT_HWCAP_ISA_D)) {
7265d103902c0bc Johan Hovold   2019-01-18  220  		pr_info("This kernel does=
 not support systems with F but not D\n");
86e581e31078578 Palmer Dabbelt 2018-08-27  221  		elf_hwcap &=3D ~COMPAT_HW=
CAP_ISA_F;
86e581e31078578 Palmer Dabbelt 2018-08-27  222  	}
86e581e31078578 Palmer Dabbelt 2018-08-27  223  =

6bcff51539ccae5 Anup Patel     2020-04-24  224  	memset(print_str, 0, sizeo=
f(print_str));
d4d5a22e24d477a Tsukasa OI     2021-12-02  225  	for (i =3D 0, j =3D 0; i <=
 NUM_ALPHA_EXTS; i++)
6bcff51539ccae5 Anup Patel     2020-04-24  226  		if (riscv_isa[0] & BIT_MA=
SK(i))
6bcff51539ccae5 Anup Patel     2020-04-24  227  			print_str[j++] =3D (char=
)('a' + i);
6bcff51539ccae5 Anup Patel     2020-04-24  228  	pr_info("riscv: ISA extens=
ions %s\n", print_str);
6bcff51539ccae5 Anup Patel     2020-04-24  229  =

6bcff51539ccae5 Anup Patel     2020-04-24  230  	memset(print_str, 0, sizeo=
f(print_str));
d4d5a22e24d477a Tsukasa OI     2021-12-02  231  	for (i =3D 0, j =3D 0; i <=
 NUM_ALPHA_EXTS; i++)
6bcff51539ccae5 Anup Patel     2020-04-24  232  		if (elf_hwcap & BIT_MASK(=
i))
6bcff51539ccae5 Anup Patel     2020-04-24  233  			print_str[j++] =3D (char=
)('a' + i);
6bcff51539ccae5 Anup Patel     2020-04-24  234  	pr_info("riscv: ELF capabi=
lities %s\n", print_str);
9411ec60c23d868 Alan Kao       2018-10-09  235  =


:::::: The code@line 185 was first introduced by commit
:::::: f4fd878dfb479e6db102addfdf545a32b76fbecd RISC-V: Minimal parser for =
"riscv, isa" strings

:::::: TO: Tsukasa OI <research_trasio@irq.a4lg.com>
:::::: CC: Atish Patra <atishp@rivosinc.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3233533646134579640==--

