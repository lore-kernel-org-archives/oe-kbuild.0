Content-Type: multipart/mixed; boundary="===============1125272753566721975=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [atishp04:isa_framework 3/8] arch/riscv/kernel/cpufeature.c:153 riscv_fill_hwcap() error: uninitialized symbol 'ext_long'.
Date: Fri, 11 Feb 2022 16:29:28 +0800
Message-ID: <202202111616.z7nZoKYj-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1125272753566721975==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Atish Patra <Atish.Patra@wdc.com>
CC: linux-kernel(a)vger.kernel.org
TO: Tsukasa OI <research_trasio@irq.a4lg.com>
CC: Atish Patra <atishp@rivosinc.com>

tree:   https://github.com/atishp04/linux isa_framework
head:   db6ba78ead62e927c2057ba750765b070c8af8a6
commit: f4fd878dfb479e6db102addfdf545a32b76fbecd [3/8] RISC-V: Minimal pars=
er for "riscv, isa" strings
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: riscv-randconfig-m031-20220211 (https://download.01.org/0day-ci/arc=
hive/20220211/202202111616.z7nZoKYj-lkp(a)intel.com/config)
compiler: riscv32-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
arch/riscv/kernel/cpufeature.c:153 riscv_fill_hwcap() error: uninitialized =
symbol 'ext_long'.

vim +/ext_long +153 arch/riscv/kernel/cpufeature.c

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
6bcff51539ccae5 Anup Patel     2020-04-24   86  		unsigned long this_isa =
=3D 0;
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
f4fd878dfb479e6 Tsukasa OI     2021-12-02  105  			bool ext_long, ext_err =
=3D false;
f4fd878dfb479e6 Tsukasa OI     2021-12-02  106  =

f4fd878dfb479e6 Tsukasa OI     2021-12-02  107  			switch (*ext) {
f4fd878dfb479e6 Tsukasa OI     2021-12-02  108  			case 's':
f4fd878dfb479e6 Tsukasa OI     2021-12-02  109  			case 'x':
f4fd878dfb479e6 Tsukasa OI     2021-12-02  110  			case 'z':
f4fd878dfb479e6 Tsukasa OI     2021-12-02  111  				/**
f4fd878dfb479e6 Tsukasa OI     2021-12-02  112  				 * 's' is a special cas=
e because:
f4fd878dfb479e6 Tsukasa OI     2021-12-02  113  				 * It can be present in=
 base extension for supervisor
f4fd878dfb479e6 Tsukasa OI     2021-12-02  114  				 * Multi-letter extensi=
ons can start with 's' as well for
f4fd878dfb479e6 Tsukasa OI     2021-12-02  115  				 * Supervisor extension=
s (i.e. sstc, sscofpmf, svinval)
f4fd878dfb479e6 Tsukasa OI     2021-12-02  116  				 */
f4fd878dfb479e6 Tsukasa OI     2021-12-02  117  				if (*ext =3D=3D 's' && =
ext[-1] !=3D '_')
f4fd878dfb479e6 Tsukasa OI     2021-12-02  118  					break;
f4fd878dfb479e6 Tsukasa OI     2021-12-02  119  				ext_long =3D true;
f4fd878dfb479e6 Tsukasa OI     2021-12-02  120  				/* Multi-letter extensi=
on must be delimited */
f4fd878dfb479e6 Tsukasa OI     2021-12-02  121  				for (; *isa && *isa !=
=3D '_'; ++isa)
f4fd878dfb479e6 Tsukasa OI     2021-12-02  122  					if (!islower(*isa) && =
!isdigit(*isa))
f4fd878dfb479e6 Tsukasa OI     2021-12-02  123  						ext_err =3D true;
f4fd878dfb479e6 Tsukasa OI     2021-12-02  124  				/* ... but must be igno=
red. */
f4fd878dfb479e6 Tsukasa OI     2021-12-02  125  				break;
f4fd878dfb479e6 Tsukasa OI     2021-12-02  126  			default:
f4fd878dfb479e6 Tsukasa OI     2021-12-02  127  				ext_long =3D false;
f4fd878dfb479e6 Tsukasa OI     2021-12-02  128  				if (!islower(*ext)) {
f4fd878dfb479e6 Tsukasa OI     2021-12-02  129  					ext_err =3D true;
f4fd878dfb479e6 Tsukasa OI     2021-12-02  130  					break;
f4fd878dfb479e6 Tsukasa OI     2021-12-02  131  				}
f4fd878dfb479e6 Tsukasa OI     2021-12-02  132  				/* Find next extension =
*/
f4fd878dfb479e6 Tsukasa OI     2021-12-02  133  				if (!isdigit(*isa))
f4fd878dfb479e6 Tsukasa OI     2021-12-02  134  					break;
f4fd878dfb479e6 Tsukasa OI     2021-12-02  135  				while (isdigit(*++isa))
f4fd878dfb479e6 Tsukasa OI     2021-12-02  136  					;
f4fd878dfb479e6 Tsukasa OI     2021-12-02  137  				if (*isa !=3D 'p')
f4fd878dfb479e6 Tsukasa OI     2021-12-02  138  					break;
f4fd878dfb479e6 Tsukasa OI     2021-12-02  139  				if (!isdigit(*++isa)) {
f4fd878dfb479e6 Tsukasa OI     2021-12-02  140  					--isa;
f4fd878dfb479e6 Tsukasa OI     2021-12-02  141  					break;
f4fd878dfb479e6 Tsukasa OI     2021-12-02  142  				}
f4fd878dfb479e6 Tsukasa OI     2021-12-02  143  				while (isdigit(*++isa))
f4fd878dfb479e6 Tsukasa OI     2021-12-02  144  					;
f4fd878dfb479e6 Tsukasa OI     2021-12-02  145  				break;
f4fd878dfb479e6 Tsukasa OI     2021-12-02  146  			}
f4fd878dfb479e6 Tsukasa OI     2021-12-02  147  			if (*isa !=3D '_')
f4fd878dfb479e6 Tsukasa OI     2021-12-02  148  				--isa;
6bcff51539ccae5 Anup Patel     2020-04-24  149  			/*
f4fd878dfb479e6 Tsukasa OI     2021-12-02  150  			 * TODO: Full version-aw=
are handling including
f4fd878dfb479e6 Tsukasa OI     2021-12-02  151  			 * multi-letter extensio=
ns will be added in-future.
6bcff51539ccae5 Anup Patel     2020-04-24  152  			 */
f4fd878dfb479e6 Tsukasa OI     2021-12-02 @153  			if (ext_err || ext_long)
f4fd878dfb479e6 Tsukasa OI     2021-12-02  154  				continue;
f4fd878dfb479e6 Tsukasa OI     2021-12-02  155  			this_hwcap |=3D isa2hwca=
p[(unsigned char)(*ext)];
f4fd878dfb479e6 Tsukasa OI     2021-12-02  156  			this_isa |=3D (1UL << (*=
ext - 'a'));
6bcff51539ccae5 Anup Patel     2020-04-24  157  		}
fbdc6193dc706c8 Atish Patra    2019-02-22  158  =

fbdc6193dc706c8 Atish Patra    2019-02-22  159  		/*
fbdc6193dc706c8 Atish Patra    2019-02-22  160  		 * All "okay" hart should=
 have same isa. Set HWCAP based on
fbdc6193dc706c8 Atish Patra    2019-02-22  161  		 * common capabilities of=
 every "okay" hart, in case they don't
fbdc6193dc706c8 Atish Patra    2019-02-22  162  		 * have.
fbdc6193dc706c8 Atish Patra    2019-02-22  163  		 */
fbdc6193dc706c8 Atish Patra    2019-02-22  164  		if (elf_hwcap)
fbdc6193dc706c8 Atish Patra    2019-02-22  165  			elf_hwcap &=3D this_hwca=
p;
fbdc6193dc706c8 Atish Patra    2019-02-22  166  		else
fbdc6193dc706c8 Atish Patra    2019-02-22  167  			elf_hwcap =3D this_hwcap;
6bcff51539ccae5 Anup Patel     2020-04-24  168  =

6bcff51539ccae5 Anup Patel     2020-04-24  169  		if (riscv_isa[0])
6bcff51539ccae5 Anup Patel     2020-04-24  170  			riscv_isa[0] &=3D this_i=
sa;
6bcff51539ccae5 Anup Patel     2020-04-24  171  		else
6bcff51539ccae5 Anup Patel     2020-04-24  172  			riscv_isa[0] =3D this_is=
a;
fbdc6193dc706c8 Atish Patra    2019-02-22  173  	}
e2c0cdfba7f6992 Palmer Dabbelt 2017-07-10  174  =

86e581e31078578 Palmer Dabbelt 2018-08-27  175  	/* We don't support system=
s with F but without D, so mask those out
86e581e31078578 Palmer Dabbelt 2018-08-27  176  	 * here. */
86e581e31078578 Palmer Dabbelt 2018-08-27  177  	if ((elf_hwcap & COMPAT_HW=
CAP_ISA_F) && !(elf_hwcap & COMPAT_HWCAP_ISA_D)) {
7265d103902c0bc Johan Hovold   2019-01-18  178  		pr_info("This kernel does=
 not support systems with F but not D\n");
86e581e31078578 Palmer Dabbelt 2018-08-27  179  		elf_hwcap &=3D ~COMPAT_HW=
CAP_ISA_F;
86e581e31078578 Palmer Dabbelt 2018-08-27  180  	}
86e581e31078578 Palmer Dabbelt 2018-08-27  181  =

6bcff51539ccae5 Anup Patel     2020-04-24  182  	memset(print_str, 0, sizeo=
f(print_str));
d4d5a22e24d477a Tsukasa OI     2021-12-02  183  	for (i =3D 0, j =3D 0; i <=
 NUM_ALPHA_EXTS; i++)
6bcff51539ccae5 Anup Patel     2020-04-24  184  		if (riscv_isa[0] & BIT_MA=
SK(i))
6bcff51539ccae5 Anup Patel     2020-04-24  185  			print_str[j++] =3D (char=
)('a' + i);
6bcff51539ccae5 Anup Patel     2020-04-24  186  	pr_info("riscv: ISA extens=
ions %s\n", print_str);
6bcff51539ccae5 Anup Patel     2020-04-24  187  =

6bcff51539ccae5 Anup Patel     2020-04-24  188  	memset(print_str, 0, sizeo=
f(print_str));
d4d5a22e24d477a Tsukasa OI     2021-12-02  189  	for (i =3D 0, j =3D 0; i <=
 NUM_ALPHA_EXTS; i++)
6bcff51539ccae5 Anup Patel     2020-04-24  190  		if (elf_hwcap & BIT_MASK(=
i))
6bcff51539ccae5 Anup Patel     2020-04-24  191  			print_str[j++] =3D (char=
)('a' + i);
6bcff51539ccae5 Anup Patel     2020-04-24  192  	pr_info("riscv: ELF capabi=
lities %s\n", print_str);
9411ec60c23d868 Alan Kao       2018-10-09  193  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============1125272753566721975==--

