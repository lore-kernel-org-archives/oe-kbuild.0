Content-Type: multipart/mixed; boundary="===============8954744011327363996=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/arm/kernel/module-plts.c:65 get_module_plt() warn: we never enter this loop
Date: Tue, 14 Dec 2021 23:15:31 +0800
Message-ID: <202112142352.LfC1wryp-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8954744011327363996==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Alex Sverdlin <alexander.sverdlin@nokia.com>
CC: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   5472f14a37421d1bca3dddf33cabd3bd6dbefbbc
commit: 79f32b221b18c15a98507b101ef4beb52444cc6f ARM: 9079/1: ftrace: Add M=
ODULE_PLTS support
date:   6 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 6 months ago
config: arm-randconfig-m031-20211214 (https://download.01.org/0day-ci/archi=
ve/20211214/202112142352.LfC1wryp-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
arch/arm/kernel/module-plts.c:65 get_module_plt() warn: we never enter this=
 loop

vim +65 arch/arm/kernel/module-plts.c

79f32b221b18c1 Alex Sverdlin  2021-05-05   50  =

7d485f647c1f4a Ard Biesheuvel 2014-11-24   51  u32 get_module_plt(struct mo=
dule *mod, unsigned long loc, Elf32_Addr val)
7d485f647c1f4a Ard Biesheuvel 2014-11-24   52  {
b7ede5a1f5905a Ard Biesheuvel 2017-02-22   53  	struct mod_plt_sec *pltsec =
=3D !in_init(mod, loc) ? &mod->arch.core :
b7ede5a1f5905a Ard Biesheuvel 2017-02-22   54  							  &mod->arch.init;
79f32b221b18c1 Alex Sverdlin  2021-05-05   55  	struct plt_entries *plt;
79f32b221b18c1 Alex Sverdlin  2021-05-05   56  	int idx;
79f32b221b18c1 Alex Sverdlin  2021-05-05   57  =

79f32b221b18c1 Alex Sverdlin  2021-05-05   58  	/* cache the address, ELF h=
eader is available only during module load */
79f32b221b18c1 Alex Sverdlin  2021-05-05   59  	if (!pltsec->plt_ent)
79f32b221b18c1 Alex Sverdlin  2021-05-05   60  		pltsec->plt_ent =3D (struc=
t plt_entries *)pltsec->plt->sh_addr;
79f32b221b18c1 Alex Sverdlin  2021-05-05   61  	plt =3D pltsec->plt_ent;
b7ede5a1f5905a Ard Biesheuvel 2017-02-22   62  =

79f32b221b18c1 Alex Sverdlin  2021-05-05   63  	prealloc_fixed(pltsec, plt);
79f32b221b18c1 Alex Sverdlin  2021-05-05   64  =

79f32b221b18c1 Alex Sverdlin  2021-05-05  @65  	for (idx =3D 0; idx < ARRAY=
_SIZE(fixed_plts); ++idx)
79f32b221b18c1 Alex Sverdlin  2021-05-05   66  		if (plt->lit[idx] =3D=3D v=
al)
79f32b221b18c1 Alex Sverdlin  2021-05-05   67  			return (u32)&plt->ldr[idx=
];
35fa91eed817d2 Ard Biesheuvel 2016-08-16   68  =

79f32b221b18c1 Alex Sverdlin  2021-05-05   69  	idx =3D 0;
66e94ba3c8ea5f Ard Biesheuvel 2016-08-18   70  	/*
66e94ba3c8ea5f Ard Biesheuvel 2016-08-18   71  	 * Look for an existing ent=
ry pointing to 'val'. Given that the
66e94ba3c8ea5f Ard Biesheuvel 2016-08-18   72  	 * relocations are sorted, =
this will be the last entry we allocated.
66e94ba3c8ea5f Ard Biesheuvel 2016-08-18   73  	 * (if one exists).
66e94ba3c8ea5f Ard Biesheuvel 2016-08-18   74  	 */
b7ede5a1f5905a Ard Biesheuvel 2017-02-22   75  	if (pltsec->plt_count > 0) {
b7ede5a1f5905a Ard Biesheuvel 2017-02-22   76  		plt +=3D (pltsec->plt_coun=
t - 1) / PLT_ENT_COUNT;
b7ede5a1f5905a Ard Biesheuvel 2017-02-22   77  		idx =3D (pltsec->plt_count=
 - 1) % PLT_ENT_COUNT;
7d485f647c1f4a Ard Biesheuvel 2014-11-24   78  =

66e94ba3c8ea5f Ard Biesheuvel 2016-08-18   79  		if (plt->lit[idx] =3D=3D v=
al)
66e94ba3c8ea5f Ard Biesheuvel 2016-08-18   80  			return (u32)&plt->ldr[idx=
];
66e94ba3c8ea5f Ard Biesheuvel 2016-08-18   81  =

66e94ba3c8ea5f Ard Biesheuvel 2016-08-18   82  		idx =3D (idx + 1) % PLT_EN=
T_COUNT;
66e94ba3c8ea5f Ard Biesheuvel 2016-08-18   83  		if (!idx)
66e94ba3c8ea5f Ard Biesheuvel 2016-08-18   84  			plt++;
66e94ba3c8ea5f Ard Biesheuvel 2016-08-18   85  	}
66e94ba3c8ea5f Ard Biesheuvel 2016-08-18   86  =

b7ede5a1f5905a Ard Biesheuvel 2017-02-22   87  	pltsec->plt_count++;
b7ede5a1f5905a Ard Biesheuvel 2017-02-22   88  	BUG_ON(pltsec->plt_count * =
PLT_ENT_SIZE > pltsec->plt->sh_size);
7d485f647c1f4a Ard Biesheuvel 2014-11-24   89  =

66e94ba3c8ea5f Ard Biesheuvel 2016-08-18   90  	if (!idx)
7d485f647c1f4a Ard Biesheuvel 2014-11-24   91  		/* Populate a new set of e=
ntries */
7d485f647c1f4a Ard Biesheuvel 2014-11-24   92  		*plt =3D (struct plt_entri=
es){
7d485f647c1f4a Ard Biesheuvel 2014-11-24   93  			{ [0 ... PLT_ENT_COUNT - =
1] =3D PLT_ENT_LDR, },
7d485f647c1f4a Ard Biesheuvel 2014-11-24   94  			{ val, }
7d485f647c1f4a Ard Biesheuvel 2014-11-24   95  		};
66e94ba3c8ea5f Ard Biesheuvel 2016-08-18   96  	else
66e94ba3c8ea5f Ard Biesheuvel 2016-08-18   97  		plt->lit[idx] =3D val;
66e94ba3c8ea5f Ard Biesheuvel 2016-08-18   98  =

66e94ba3c8ea5f Ard Biesheuvel 2016-08-18   99  	return (u32)&plt->ldr[idx];
7d485f647c1f4a Ard Biesheuvel 2014-11-24  100  }
7d485f647c1f4a Ard Biesheuvel 2014-11-24  101  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8954744011327363996==--

