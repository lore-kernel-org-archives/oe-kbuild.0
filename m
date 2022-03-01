Content-Type: multipart/mixed; boundary="===============8724355882820484168=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [mcgrof:modules-testing 1/14] kernel/module/main.c:2335 simplify_symbols() warn: passing zero to 'PTR_ERR'
Date: Tue, 01 Mar 2022 15:31:44 +0800
Message-ID: <202203011513.U7wMTzND-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8724355882820484168==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Aaron Tomlin <atomlin@redhat.com>
CC: Luis Chamberlain <mcgrof@kernel.org>
CC: Christophe Leroy <christophe.leroy@csgroup.eu>

Hi Aaron,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git mo=
dules-testing
head:   8ca5e1dab7c3e51c63f07cd86e004a4df9ac7e76
commit: ca05e0ce6be41fb4fa3afabd6f6ca7a4af54260d [1/14] module: Move all in=
to module/
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: i386-randconfig-m021-20220228 (https://download.01.org/0day-ci/arch=
ive/20220301/202203011513.U7wMTzND-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
kernel/module/main.c:2335 simplify_symbols() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +2335 kernel/module/main.c

ebfac7b778fac8b kernel/module.c Fangrui Song       2021-01-15  2281  =

9a4b9708f1f2eaf kernel/module.c Matti Linnanvuori  2007-11-08  2282  /* Cha=
nge all symbols so that st_value encodes the pointer directly. */
49668688dd5a5f4 kernel/module.c Rusty Russell      2010-08-05  2283  static=
 int simplify_symbols(struct module *mod, const struct load_info *info)
^1da177e4c3f415 kernel/module.c Linus Torvalds     2005-04-16  2284  {
49668688dd5a5f4 kernel/module.c Rusty Russell      2010-08-05  2285  	Elf_S=
hdr *symsec =3D &info->sechdrs[info->index.sym];
49668688dd5a5f4 kernel/module.c Rusty Russell      2010-08-05  2286  	Elf_S=
ym *sym =3D (void *)symsec->sh_addr;
^1da177e4c3f415 kernel/module.c Linus Torvalds     2005-04-16  2287  	unsig=
ned long secbase;
49668688dd5a5f4 kernel/module.c Rusty Russell      2010-08-05  2288  	unsig=
ned int i;
^1da177e4c3f415 kernel/module.c Linus Torvalds     2005-04-16  2289  	int r=
et =3D 0;
414fd31b2553aaf kernel/module.c Tim Abbott         2008-12-05  2290  	const=
 struct kernel_symbol *ksym;
^1da177e4c3f415 kernel/module.c Linus Torvalds     2005-04-16  2291  =

49668688dd5a5f4 kernel/module.c Rusty Russell      2010-08-05  2292  	for (=
i =3D 1; i < symsec->sh_size / sizeof(Elf_Sym); i++) {
49668688dd5a5f4 kernel/module.c Rusty Russell      2010-08-05  2293  		cons=
t char *name =3D info->strtab + sym[i].st_name;
49668688dd5a5f4 kernel/module.c Rusty Russell      2010-08-05  2294  =

^1da177e4c3f415 kernel/module.c Linus Torvalds     2005-04-16  2295  		swit=
ch (sym[i].st_shndx) {
^1da177e4c3f415 kernel/module.c Linus Torvalds     2005-04-16  2296  		case=
 SHN_COMMON:
80375980f1608f4 kernel/module.c Joe Mario          2014-02-08  2297  			/* =
Ignore common symbols */
80375980f1608f4 kernel/module.c Joe Mario          2014-02-08  2298  			if =
(!strncmp(name, "__gnu_lto", 9))
80375980f1608f4 kernel/module.c Joe Mario          2014-02-08  2299  				br=
eak;
80375980f1608f4 kernel/module.c Joe Mario          2014-02-08  2300  =

24b9f0d22081455 kernel/module.c Sergey Shtylyov    2020-11-07  2301  			/*
24b9f0d22081455 kernel/module.c Sergey Shtylyov    2020-11-07  2302  			 * =
We compiled with -fno-common.  These are not
24b9f0d22081455 kernel/module.c Sergey Shtylyov    2020-11-07  2303  			 * =
supposed to happen.
24b9f0d22081455 kernel/module.c Sergey Shtylyov    2020-11-07  2304  			 */
5e12416927975aa kernel/module.c Jim Cromie         2011-12-06  2305  			pr_=
debug("Common symbol: %s\n", name);
6da0b565150b323 kernel/module.c Ionut Alexa        2014-11-10  2306  			pr_=
warn("%s: please compile with -fno-common\n",
^1da177e4c3f415 kernel/module.c Linus Torvalds     2005-04-16  2307  			   =
    mod->name);
^1da177e4c3f415 kernel/module.c Linus Torvalds     2005-04-16  2308  			ret=
 =3D -ENOEXEC;
^1da177e4c3f415 kernel/module.c Linus Torvalds     2005-04-16  2309  			bre=
ak;
^1da177e4c3f415 kernel/module.c Linus Torvalds     2005-04-16  2310  =

^1da177e4c3f415 kernel/module.c Linus Torvalds     2005-04-16  2311  		case=
 SHN_ABS:
^1da177e4c3f415 kernel/module.c Linus Torvalds     2005-04-16  2312  			/* =
Don't need to do anything */
5e12416927975aa kernel/module.c Jim Cromie         2011-12-06  2313  			pr_=
debug("Absolute symbol: 0x%08lx\n",
^1da177e4c3f415 kernel/module.c Linus Torvalds     2005-04-16  2314  			   =
    (long)sym[i].st_value);
^1da177e4c3f415 kernel/module.c Linus Torvalds     2005-04-16  2315  			bre=
ak;
^1da177e4c3f415 kernel/module.c Linus Torvalds     2005-04-16  2316  =

1ce15ef4f60529c kernel/module.c Jessica Yu         2016-03-22  2317  		case=
 SHN_LIVEPATCH:
1ce15ef4f60529c kernel/module.c Jessica Yu         2016-03-22  2318  			/* =
Livepatch symbols are resolved by livepatch */
1ce15ef4f60529c kernel/module.c Jessica Yu         2016-03-22  2319  			bre=
ak;
1ce15ef4f60529c kernel/module.c Jessica Yu         2016-03-22  2320  =

^1da177e4c3f415 kernel/module.c Linus Torvalds     2005-04-16  2321  		case=
 SHN_UNDEF:
49668688dd5a5f4 kernel/module.c Rusty Russell      2010-08-05  2322  			ksy=
m =3D resolve_symbol_wait(mod, info, name);
^1da177e4c3f415 kernel/module.c Linus Torvalds     2005-04-16  2323  			/* =
Ok if resolved.  */
9bea7f23952d594 kernel/module.c Rusty Russell      2010-06-05  2324  			if =
(ksym && !IS_ERR(ksym)) {
7290d58095712a8 kernel/module.c Ard Biesheuvel     2018-08-21  2325  				sy=
m[i].st_value =3D kernel_symbol_value(ksym);
^1da177e4c3f415 kernel/module.c Linus Torvalds     2005-04-16  2326  				br=
eak;
414fd31b2553aaf kernel/module.c Tim Abbott         2008-12-05  2327  			}
414fd31b2553aaf kernel/module.c Tim Abbott         2008-12-05  2328  =

ebfac7b778fac8b kernel/module.c Fangrui Song       2021-01-15  2329  			/* =
Ok if weak or ignored.  */
ebfac7b778fac8b kernel/module.c Fangrui Song       2021-01-15  2330  			if =
(!ksym &&
ebfac7b778fac8b kernel/module.c Fangrui Song       2021-01-15  2331  			   =
 (ELF_ST_BIND(sym[i].st_info) =3D=3D STB_WEAK ||
ebfac7b778fac8b kernel/module.c Fangrui Song       2021-01-15  2332  			   =
  ignore_undef_symbol(info->hdr->e_machine, name)))
^1da177e4c3f415 kernel/module.c Linus Torvalds     2005-04-16  2333  				br=
eak;
^1da177e4c3f415 kernel/module.c Linus Torvalds     2005-04-16  2334  =

9bea7f23952d594 kernel/module.c Rusty Russell      2010-06-05 @2335  			ret=
 =3D PTR_ERR(ksym) ?: -ENOENT;
62267e0ecc9c00a kernel/module.c Jason A. Donenfeld 2018-06-22  2336  			pr_=
warn("%s: Unknown symbol %s (err %d)\n",
62267e0ecc9c00a kernel/module.c Jason A. Donenfeld 2018-06-22  2337  				mo=
d->name, name, ret);
^1da177e4c3f415 kernel/module.c Linus Torvalds     2005-04-16  2338  			bre=
ak;
^1da177e4c3f415 kernel/module.c Linus Torvalds     2005-04-16  2339  =

^1da177e4c3f415 kernel/module.c Linus Torvalds     2005-04-16  2340  		defa=
ult:
^1da177e4c3f415 kernel/module.c Linus Torvalds     2005-04-16  2341  			/* =
Divert to percpu allocation if a percpu var. */
49668688dd5a5f4 kernel/module.c Rusty Russell      2010-08-05  2342  			if =
(sym[i].st_shndx =3D=3D info->index.pcpu)
259354deaaf03d4 kernel/module.c Tejun Heo          2010-03-10  2343  				se=
cbase =3D (unsigned long)mod_percpu(mod);
^1da177e4c3f415 kernel/module.c Linus Torvalds     2005-04-16  2344  			else
49668688dd5a5f4 kernel/module.c Rusty Russell      2010-08-05  2345  				se=
cbase =3D info->sechdrs[sym[i].st_shndx].sh_addr;
^1da177e4c3f415 kernel/module.c Linus Torvalds     2005-04-16  2346  			sym=
[i].st_value +=3D secbase;
^1da177e4c3f415 kernel/module.c Linus Torvalds     2005-04-16  2347  			bre=
ak;
^1da177e4c3f415 kernel/module.c Linus Torvalds     2005-04-16  2348  		}
^1da177e4c3f415 kernel/module.c Linus Torvalds     2005-04-16  2349  	}
^1da177e4c3f415 kernel/module.c Linus Torvalds     2005-04-16  2350  =

^1da177e4c3f415 kernel/module.c Linus Torvalds     2005-04-16  2351  	retur=
n ret;
^1da177e4c3f415 kernel/module.c Linus Torvalds     2005-04-16  2352  }
^1da177e4c3f415 kernel/module.c Linus Torvalds     2005-04-16  2353  =


:::::: The code at line 2335 was first introduced by commit
:::::: 9bea7f23952d5948f8e5dfdff4de09bb9981fb5f module: fix bne2 "gave up w=
aiting for init of module libcrc32c"

:::::: TO: Rusty Russell <rusty@rustcorp.com.au>
:::::: CC: Rusty Russell <rusty@rustcorp.com.au>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8724355882820484168==--

