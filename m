Content-Type: multipart/mixed; boundary="===============8133610559245475510=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [atishp04:isa_framework 3/8] arch/riscv/kernel/cpufeature.c:153:19: warning: Branch condition evaluates to a garbage value [clang-analyzer-core.uninitialized.Branch]
Date: Fri, 11 Feb 2022 01:22:48 +0800
Message-ID: <202202110140.ppKC5Jch-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8133610559245475510==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: Atish Patra <Atish.Patra@wdc.com>
CC: linux-kernel(a)vger.kernel.org
TO: Tsukasa OI <research_trasio@irq.a4lg.com>
CC: Atish Patra <atishp@rivosinc.com>

tree:   https://github.com/atishp04/linux isa_framework
head:   44c1fe0a3dd4148430c3b2e161d97b27f0095e07
commit: 8ab665498145b5628aa844456ec9ec3b6594e879 [3/8] riscv: cpufeature: M=
inimal parser for "riscv, isa" strings
:::::: branch date: 9 hours ago
:::::: commit date: 18 hours ago
config: riscv-randconfig-c006-20220209 (https://download.01.org/0day-ci/arc=
hive/20220211/202202110140.ppKC5Jch-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project aa845d=
7a245d85c441d0bd44fc7b6c3be8f3de8d)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/atishp04/linux/commit/8ab665498145b5628aa84445=
6ec9ec3b6594e879
        git remote add atishp04 https://github.com/atishp04/linux
        git fetch --no-tags atishp04 isa_framework
        git checkout 8ab665498145b5628aa844456ec9ec3b6594e879
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
               ^~~~~~~~~~
   fs/xfs/xfs_fsmap.c:744:2: note: Taking true branch
           if (info->last)
           ^
   fs/xfs/xfs_fsmap.c:745:44: note: Passing null pointer value via 1st para=
meter 'cur'
                   return xfs_getfsmap_datadev_bnobt_helper(*curpp, &key[1]=
, info);
                                                            ^~~~~~
   fs/xfs/xfs_fsmap.c:745:10: note: Calling 'xfs_getfsmap_datadev_bnobt_hel=
per'
                   return xfs_getfsmap_datadev_bnobt_helper(*curpp, &key[1]=
, info);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   fs/xfs/xfs_fsmap.c:371:26: note: Access to field 'bc_mp' results in a de=
reference of a null pointer (loaded from variable 'cur')
           struct xfs_mount                *mp =3D cur->bc_mp;
                                                 ^~~
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   fs/coda/dir.c:387:4: warning: Value stored to 'ret' is never read [clang=
-analyzer-deadcode.DeadStores]
                           ret =3D -EBADF;
                           ^     ~~~~~~
   fs/coda/dir.c:387:4: note: Value stored to 'ret' is never read
                           ret =3D -EBADF;
                           ^     ~~~~~~
   fs/coda/dir.c:394:4: warning: Value stored to 'ret' is never read [clang=
-analyzer-deadcode.DeadStores]
                           ret =3D -EBADF;
                           ^     ~~~~~~
   fs/coda/dir.c:394:4: note: Value stored to 'ret' is never read
                           ret =3D -EBADF;
                           ^     ~~~~~~
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   21 warnings generated.
   fs/coda/upcall.c:259:9: warning: Value stored to 's' is never read [clan=
g-analyzer-deadcode.DeadStores]
           s =3D ( new_length & ~0x3) +4; /* round up to word boundary */
           ^   ~~~~~~~~~~~~~~~~~~~~~~~
   fs/coda/upcall.c:259:9: note: Value stored to 's' is never read
           s =3D ( new_length & ~0x3) +4; /* round up to word boundary */
           ^   ~~~~~~~~~~~~~~~~~~~~~~~
   fs/coda/upcall.c:430:9: warning: Value stored to 's' is never read [clan=
g-analyzer-deadcode.DeadStores]
           s =3D (len & ~0x3) + 4;
           ^   ~~~~~~~~~~~~~~~~
   fs/coda/upcall.c:430:9: note: Value stored to 's' is never read
           s =3D (len & ~0x3) + 4;
           ^   ~~~~~~~~~~~~~~~~
   Suppressed 19 warnings (2 in non-user code, 17 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   init/do_mounts.c:194:2: warning: Call to function 'strcpy' is insecure a=
s it does not provide bounding of the memory buffer. Replace unbounded copy=
 functions with analogous functions that support length arguments such as '=
strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(s, name);
           ^~~~~~
   init/do_mounts.c:194:2: note: Call to function 'strcpy' is insecure as i=
t does not provide bounding of the memory buffer. Replace unbounded copy fu=
nctions with analogous functions that support length arguments such as 'str=
lcpy'. CWE-119
           strcpy(s, name);
           ^~~~~~
   Suppressed 10 warnings (3 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
>> arch/riscv/kernel/cpufeature.c:153:19: warning: Branch condition evaluat=
es to a garbage value [clang-analyzer-core.uninitialized.Branch]
                           if (ext_err || ext_long)
                                          ^~~~~~~~
   arch/riscv/kernel/cpufeature.c:84:23: note: Assuming 'node' is not equal=
 to null
           for_each_of_cpu_node(node) {
                                ^
   include/linux/of.h:1375:41: note: expanded from macro 'for_each_of_cpu_n=
ode'
           for (cpu =3D of_get_next_cpu_node(NULL); cpu !=3D NULL; \
                                                  ^~~~~~~~~~~
   arch/riscv/kernel/cpufeature.c:84:2: note: Loop condition is true.  Ente=
ring loop body
           for_each_of_cpu_node(node) {
           ^
   include/linux/of.h:1375:2: note: expanded from macro 'for_each_of_cpu_no=
de'
           for (cpu =3D of_get_next_cpu_node(NULL); cpu !=3D NULL; \
           ^
   arch/riscv/kernel/cpufeature.c:88:7: note: Assuming the condition is fal=
se
                   if (riscv_of_processor_hartid(node) < 0)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/cpufeature.c:88:3: note: Taking false branch
                   if (riscv_of_processor_hartid(node) < 0)
                   ^
   arch/riscv/kernel/cpufeature.c:91:7: note: Assuming the condition is fal=
se
                   if (of_property_read_string(node, "riscv,isa", &isa)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/cpufeature.c:91:3: note: Taking false branch
                   if (of_property_read_string(node, "riscv,isa", &isa)) {
                   ^
   arch/riscv/kernel/cpufeature.c:100:7: note: Assuming the condition is fa=
lse
                   if (!strncmp(isa, "rv64", 4))
                       ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/cpufeature.c:100:3: note: Taking false branch
                   if (!strncmp(isa, "rv64", 4))
                   ^
   arch/riscv/kernel/cpufeature.c:103:3: note: Loop condition is true.  Ent=
ering loop body
                   for (; *isa; ++isa) {
                   ^
   arch/riscv/kernel/cpufeature.c:105:9: note: 'ext_long' declared without =
an initial value
                           bool ext_long, ext_err =3D false;
                                ^~~~~~~~
   arch/riscv/kernel/cpufeature.c:107:4: note: Control jumps to 'case 115:'=
 @line 108
                           switch (*ext) {
                           ^
   arch/riscv/kernel/cpufeature.c:117:9: note: Left side of '&&' is true
                                   if (*ext =3D=3D 's' && ext[-1] !=3D '_')
                                       ^
   arch/riscv/kernel/cpufeature.c:117:24: note: Assuming the condition is t=
rue
                                   if (*ext =3D=3D 's' && ext[-1] !=3D '_')
                                                      ^~~~~~~~~~~~~~
   arch/riscv/kernel/cpufeature.c:117:5: note: Taking true branch
                                   if (*ext =3D=3D 's' && ext[-1] !=3D '_')
                                   ^
   arch/riscv/kernel/cpufeature.c:118:6: note:  Execution continues on line=
 147
                                           break;
                                           ^
   arch/riscv/kernel/cpufeature.c:147:8: note: Assuming the condition is fa=
lse
                           if (*isa !=3D '_')
                               ^~~~~~~~~~~
   arch/riscv/kernel/cpufeature.c:147:4: note: Taking false branch
                           if (*isa !=3D '_')
                           ^
   arch/riscv/kernel/cpufeature.c:153:8: note: 'ext_err' is false
                           if (ext_err || ext_long)
                               ^~~~~~~
   arch/riscv/kernel/cpufeature.c:153:8: note: Left side of '||' is false
   arch/riscv/kernel/cpufeature.c:153:19: note: Branch condition evaluates =
to a garbage value
                           if (ext_err || ext_long)
                                          ^~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   security/tomoyo/file.c:137:2: warning: Call to function 'strcat' is inse=
cure as it does not provide bounding of the memory buffer. Replace unbounde=
d copy functions with analogous functions that support length arguments suc=
h as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcat((char *) buf->name, "/");
           ^~~~~~
   security/tomoyo/file.c:137:2: note: Call to function 'strcat' is insecur=
e as it does not provide bounding of the memory buffer. Replace unbounded c=
opy functions with analogous functions that support length arguments such a=
s 'strlcat'. CWE-119
           strcat((char *) buf->name, "/");
           ^~~~~~
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   fs/fat/dir.c:45:18: warning: Access to field 'b_blocknr' results in a de=
reference of a null pointer (loaded from variable 'bh') [clang-analyzer-cor=
e.NullDereference]
           return ((loff_t)bh->b_blocknr << MSDOS_SB(sb)->dir_per_block_bit=
s)
                           ^
   fs/fat/dir.c:1298:9: note: Calling 'fat_get_entry'
           while (fat_get_entry(dir, &pos, &bh, &de) > -1) {
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fat/dir.c:121:10: note: Left side of '&&' is false

vim +153 arch/riscv/kernel/cpufeature.c

6bcff51539ccae Anup Patel     2020-04-24   64  =

3df952ae2ac81f Jisheng Zhang  2021-05-16   65  void __init riscv_fill_hwcap=
(void)
e2c0cdfba7f699 Palmer Dabbelt 2017-07-10   66  {
dd81c8ab819d36 Johan Hovold   2019-01-18   67  	struct device_node *node;
e2c0cdfba7f699 Palmer Dabbelt 2017-07-10   68  	const char *isa;
539af61430f4e3 Tsukasa OI     2021-12-02   69  	char print_str[NUM_ALPHA_EX=
TS + 1];
8ab665498145b5 Tsukasa OI     2021-12-02   70  	int i, j;
e2c0cdfba7f699 Palmer Dabbelt 2017-07-10   71  	static unsigned long isa2hw=
cap[256] =3D {0};
e2c0cdfba7f699 Palmer Dabbelt 2017-07-10   72  =

e2c0cdfba7f699 Palmer Dabbelt 2017-07-10   73  	isa2hwcap['i'] =3D isa2hwca=
p['I'] =3D COMPAT_HWCAP_ISA_I;
e2c0cdfba7f699 Palmer Dabbelt 2017-07-10   74  	isa2hwcap['m'] =3D isa2hwca=
p['M'] =3D COMPAT_HWCAP_ISA_M;
e2c0cdfba7f699 Palmer Dabbelt 2017-07-10   75  	isa2hwcap['a'] =3D isa2hwca=
p['A'] =3D COMPAT_HWCAP_ISA_A;
e2c0cdfba7f699 Palmer Dabbelt 2017-07-10   76  	isa2hwcap['f'] =3D isa2hwca=
p['F'] =3D COMPAT_HWCAP_ISA_F;
e2c0cdfba7f699 Palmer Dabbelt 2017-07-10   77  	isa2hwcap['d'] =3D isa2hwca=
p['D'] =3D COMPAT_HWCAP_ISA_D;
e2c0cdfba7f699 Palmer Dabbelt 2017-07-10   78  	isa2hwcap['c'] =3D isa2hwca=
p['C'] =3D COMPAT_HWCAP_ISA_C;
e2c0cdfba7f699 Palmer Dabbelt 2017-07-10   79  =

e2c0cdfba7f699 Palmer Dabbelt 2017-07-10   80  	elf_hwcap =3D 0;
e2c0cdfba7f699 Palmer Dabbelt 2017-07-10   81  =

6bcff51539ccae Anup Patel     2020-04-24   82  	bitmap_zero(riscv_isa, RISC=
V_ISA_EXT_MAX);
6bcff51539ccae Anup Patel     2020-04-24   83  =

dd81c8ab819d36 Johan Hovold   2019-01-18   84  	for_each_of_cpu_node(node) {
fbdc6193dc706c Atish Patra    2019-02-22   85  		unsigned long this_hwcap =
=3D 0;
6bcff51539ccae Anup Patel     2020-04-24   86  		unsigned long this_isa =3D=
 0;
fbdc6193dc706c Atish Patra    2019-02-22   87  =

fbdc6193dc706c Atish Patra    2019-02-22   88  		if (riscv_of_processor_har=
tid(node) < 0)
fbdc6193dc706c Atish Patra    2019-02-22   89  			continue;
e2c0cdfba7f699 Palmer Dabbelt 2017-07-10   90  =

e2c0cdfba7f699 Palmer Dabbelt 2017-07-10   91  		if (of_property_read_strin=
g(node, "riscv,isa", &isa)) {
7265d103902c0b Johan Hovold   2019-01-18   92  			pr_warn("Unable to find \=
"riscv,isa\" devicetree entry\n");
fbdc6193dc706c Atish Patra    2019-02-22   93  			continue;
e2c0cdfba7f699 Palmer Dabbelt 2017-07-10   94  		}
e2c0cdfba7f699 Palmer Dabbelt 2017-07-10   95  =

6bcff51539ccae Anup Patel     2020-04-24   96  #if IS_ENABLED(CONFIG_32BIT)
6bcff51539ccae Anup Patel     2020-04-24   97  		if (!strncmp(isa, "rv32", =
4))
8ab665498145b5 Tsukasa OI     2021-12-02   98  			isa +=3D 4;
6bcff51539ccae Anup Patel     2020-04-24   99  #elif IS_ENABLED(CONFIG_64BI=
T)
6bcff51539ccae Anup Patel     2020-04-24  100  		if (!strncmp(isa, "rv64", =
4))
8ab665498145b5 Tsukasa OI     2021-12-02  101  			isa +=3D 4;
6bcff51539ccae Anup Patel     2020-04-24  102  #endif
8ab665498145b5 Tsukasa OI     2021-12-02  103  		for (; *isa; ++isa) {
8ab665498145b5 Tsukasa OI     2021-12-02  104  			const char *ext =3D isa++;
8ab665498145b5 Tsukasa OI     2021-12-02  105  			bool ext_long, ext_err =
=3D false;
8ab665498145b5 Tsukasa OI     2021-12-02  106  =

8ab665498145b5 Tsukasa OI     2021-12-02  107  			switch (*ext) {
8ab665498145b5 Tsukasa OI     2021-12-02  108  			case 's':
8ab665498145b5 Tsukasa OI     2021-12-02  109  			case 'x':
8ab665498145b5 Tsukasa OI     2021-12-02  110  			case 'z':
8ab665498145b5 Tsukasa OI     2021-12-02  111  				/**
8ab665498145b5 Tsukasa OI     2021-12-02  112  				 * 's' is a special case=
 because:
8ab665498145b5 Tsukasa OI     2021-12-02  113  				 * It can be present in =
base extension for supervisor
8ab665498145b5 Tsukasa OI     2021-12-02  114  				 * Multi-letter extensio=
ns can start with 's' as well for
8ab665498145b5 Tsukasa OI     2021-12-02  115  				 * Supervisor extensions=
 (i.e. sstc, sscofpmf, svinval)
8ab665498145b5 Tsukasa OI     2021-12-02  116  				 */
8ab665498145b5 Tsukasa OI     2021-12-02  117  				if (*ext =3D=3D 's' && e=
xt[-1] !=3D '_')
8ab665498145b5 Tsukasa OI     2021-12-02  118  					break;
8ab665498145b5 Tsukasa OI     2021-12-02  119  				ext_long =3D true;
8ab665498145b5 Tsukasa OI     2021-12-02  120  				/* Multi-letter extensio=
n must be delimited */
8ab665498145b5 Tsukasa OI     2021-12-02  121  				for (; *isa && *isa !=3D=
 '_'; ++isa)
8ab665498145b5 Tsukasa OI     2021-12-02  122  					if (!islower(*isa) && !=
isdigit(*isa))
8ab665498145b5 Tsukasa OI     2021-12-02  123  						ext_err =3D true;
8ab665498145b5 Tsukasa OI     2021-12-02  124  				/* ... but must be ignor=
ed. */
8ab665498145b5 Tsukasa OI     2021-12-02  125  				break;
8ab665498145b5 Tsukasa OI     2021-12-02  126  			default:
8ab665498145b5 Tsukasa OI     2021-12-02  127  				ext_long =3D false;
8ab665498145b5 Tsukasa OI     2021-12-02  128  				if (!islower(*ext)) {
8ab665498145b5 Tsukasa OI     2021-12-02  129  					ext_err =3D true;
8ab665498145b5 Tsukasa OI     2021-12-02  130  					break;
8ab665498145b5 Tsukasa OI     2021-12-02  131  				}
8ab665498145b5 Tsukasa OI     2021-12-02  132  				/* Find next extension */
8ab665498145b5 Tsukasa OI     2021-12-02  133  				if (!isdigit(*isa))
8ab665498145b5 Tsukasa OI     2021-12-02  134  					break;
8ab665498145b5 Tsukasa OI     2021-12-02  135  				while (isdigit(*++isa))
8ab665498145b5 Tsukasa OI     2021-12-02  136  					;
8ab665498145b5 Tsukasa OI     2021-12-02  137  				if (*isa !=3D 'p')
8ab665498145b5 Tsukasa OI     2021-12-02  138  					break;
8ab665498145b5 Tsukasa OI     2021-12-02  139  				if (!isdigit(*++isa)) {
8ab665498145b5 Tsukasa OI     2021-12-02  140  					--isa;
8ab665498145b5 Tsukasa OI     2021-12-02  141  					break;
8ab665498145b5 Tsukasa OI     2021-12-02  142  				}
8ab665498145b5 Tsukasa OI     2021-12-02  143  				while (isdigit(*++isa))
8ab665498145b5 Tsukasa OI     2021-12-02  144  					;
8ab665498145b5 Tsukasa OI     2021-12-02  145  				break;
8ab665498145b5 Tsukasa OI     2021-12-02  146  			}
8ab665498145b5 Tsukasa OI     2021-12-02  147  			if (*isa !=3D '_')
8ab665498145b5 Tsukasa OI     2021-12-02  148  				--isa;
6bcff51539ccae Anup Patel     2020-04-24  149  			/*
8ab665498145b5 Tsukasa OI     2021-12-02  150  			 * TODO: Full version-awa=
re handling including
8ab665498145b5 Tsukasa OI     2021-12-02  151  			 * multi-letter extension=
s will be added in-future.
6bcff51539ccae Anup Patel     2020-04-24  152  			 */
8ab665498145b5 Tsukasa OI     2021-12-02 @153  			if (ext_err || ext_long)
8ab665498145b5 Tsukasa OI     2021-12-02  154  				continue;
8ab665498145b5 Tsukasa OI     2021-12-02  155  			this_hwcap |=3D isa2hwcap=
[(unsigned char)(*ext)];
8ab665498145b5 Tsukasa OI     2021-12-02  156  			this_isa |=3D (1UL << (*e=
xt - 'a'));
6bcff51539ccae Anup Patel     2020-04-24  157  		}
fbdc6193dc706c Atish Patra    2019-02-22  158  =

fbdc6193dc706c Atish Patra    2019-02-22  159  		/*
fbdc6193dc706c Atish Patra    2019-02-22  160  		 * All "okay" hart should =
have same isa. Set HWCAP based on
fbdc6193dc706c Atish Patra    2019-02-22  161  		 * common capabilities of =
every "okay" hart, in case they don't
fbdc6193dc706c Atish Patra    2019-02-22  162  		 * have.
fbdc6193dc706c Atish Patra    2019-02-22  163  		 */
fbdc6193dc706c Atish Patra    2019-02-22  164  		if (elf_hwcap)
fbdc6193dc706c Atish Patra    2019-02-22  165  			elf_hwcap &=3D this_hwcap;
fbdc6193dc706c Atish Patra    2019-02-22  166  		else
fbdc6193dc706c Atish Patra    2019-02-22  167  			elf_hwcap =3D this_hwcap;
6bcff51539ccae Anup Patel     2020-04-24  168  =

6bcff51539ccae Anup Patel     2020-04-24  169  		if (riscv_isa[0])
6bcff51539ccae Anup Patel     2020-04-24  170  			riscv_isa[0] &=3D this_is=
a;
6bcff51539ccae Anup Patel     2020-04-24  171  		else
6bcff51539ccae Anup Patel     2020-04-24  172  			riscv_isa[0] =3D this_isa;
fbdc6193dc706c Atish Patra    2019-02-22  173  	}
e2c0cdfba7f699 Palmer Dabbelt 2017-07-10  174  =

86e581e3107857 Palmer Dabbelt 2018-08-27  175  	/* We don't support systems=
 with F but without D, so mask those out
86e581e3107857 Palmer Dabbelt 2018-08-27  176  	 * here. */
86e581e3107857 Palmer Dabbelt 2018-08-27  177  	if ((elf_hwcap & COMPAT_HWC=
AP_ISA_F) && !(elf_hwcap & COMPAT_HWCAP_ISA_D)) {
7265d103902c0b Johan Hovold   2019-01-18  178  		pr_info("This kernel does =
not support systems with F but not D\n");
86e581e3107857 Palmer Dabbelt 2018-08-27  179  		elf_hwcap &=3D ~COMPAT_HWC=
AP_ISA_F;
86e581e3107857 Palmer Dabbelt 2018-08-27  180  	}
86e581e3107857 Palmer Dabbelt 2018-08-27  181  =

6bcff51539ccae Anup Patel     2020-04-24  182  	memset(print_str, 0, sizeof=
(print_str));
539af61430f4e3 Tsukasa OI     2021-12-02  183  	for (i =3D 0, j =3D 0; i < =
NUM_ALPHA_EXTS; i++)
6bcff51539ccae Anup Patel     2020-04-24  184  		if (riscv_isa[0] & BIT_MAS=
K(i))
6bcff51539ccae Anup Patel     2020-04-24  185  			print_str[j++] =3D (char)=
('a' + i);
6bcff51539ccae Anup Patel     2020-04-24  186  	pr_info("riscv: ISA extensi=
ons %s\n", print_str);
6bcff51539ccae Anup Patel     2020-04-24  187  =

6bcff51539ccae Anup Patel     2020-04-24  188  	memset(print_str, 0, sizeof=
(print_str));
539af61430f4e3 Tsukasa OI     2021-12-02  189  	for (i =3D 0, j =3D 0; i < =
NUM_ALPHA_EXTS; i++)
6bcff51539ccae Anup Patel     2020-04-24  190  		if (elf_hwcap & BIT_MASK(i=
))
6bcff51539ccae Anup Patel     2020-04-24  191  			print_str[j++] =3D (char)=
('a' + i);
6bcff51539ccae Anup Patel     2020-04-24  192  	pr_info("riscv: ELF capabil=
ities %s\n", print_str);
9411ec60c23d86 Alan Kao       2018-10-09  193  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============8133610559245475510==--

