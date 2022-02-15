Content-Type: multipart/mixed; boundary="===============5047496012730339937=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/s390/kernel/module.c:358 apply_rela() warn: '49396' 49396 can't fit into 32767 '*&insn[8]'
Date: Tue, 15 Feb 2022 08:49:26 +0800
Message-ID: <202202150856.WNWOs6OU-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5047496012730339937==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Ilya Leoshkevich <iii@linux.ibm.com>
CC: Heiko Carstens <hca@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   d567f5db412ed52de0b3b3efca4a451263de6108
commit: f3b7e73b2c6619884351a3a0a7468642f852b8a2 s390/module: fix loading m=
odules with a lot of relocations
date:   3 weeks ago
:::::: branch date: 7 hours ago
:::::: commit date: 3 weeks ago
config: s390-randconfig-m031-20220214 (https://download.01.org/0day-ci/arch=
ive/20220215/202202150856.WNWOs6OU-lkp(a)intel.com/config)
compiler: s390-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
arch/s390/kernel/module.c:358 apply_rela() warn: '49396' 49396 can't fit in=
to 32767 '*&insn[8]'

vim +358 arch/s390/kernel/module.c

083e14c09b7ae0 Martin Schwidefsky 2013-01-11  234  =

083e14c09b7ae0 Martin Schwidefsky 2013-01-11  235  static int apply_rela(El=
f_Rela *rela, Elf_Addr base, Elf_Sym *symtab,
be2422612a580e Peter Zijlstra     2020-04-29  236  		      const char *strt=
ab, struct module *me,
be2422612a580e Peter Zijlstra     2020-04-29  237  		      void *(*write)(v=
oid *dest, const void *src, size_t len))
^1da177e4c3f41 Linus Torvalds     2005-04-16  238  {
^1da177e4c3f41 Linus Torvalds     2005-04-16  239  	struct mod_arch_syminfo=
 *info;
^1da177e4c3f41 Linus Torvalds     2005-04-16  240  	Elf_Addr loc, val;
^1da177e4c3f41 Linus Torvalds     2005-04-16  241  	int r_type, r_sym;
72a6b43e4bbb81 Heiko Carstens     2013-02-27  242  	int rc =3D -ENOEXEC;
^1da177e4c3f41 Linus Torvalds     2005-04-16  243  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  244  	/* This is where to mak=
e the change */
^1da177e4c3f41 Linus Torvalds     2005-04-16  245  	loc =3D base + rela->r_=
offset;
^1da177e4c3f41 Linus Torvalds     2005-04-16  246  	/* This is the symbol i=
t is referring to.  Note that all
^1da177e4c3f41 Linus Torvalds     2005-04-16  247  	   undefined symbols ha=
ve been resolved.  */
^1da177e4c3f41 Linus Torvalds     2005-04-16  248  	r_sym =3D ELF_R_SYM(rel=
a->r_info);
^1da177e4c3f41 Linus Torvalds     2005-04-16  249  	r_type =3D ELF_R_TYPE(r=
ela->r_info);
^1da177e4c3f41 Linus Torvalds     2005-04-16  250  	info =3D me->arch.symin=
fo + r_sym;
^1da177e4c3f41 Linus Torvalds     2005-04-16  251  	val =3D symtab[r_sym].s=
t_value;
^1da177e4c3f41 Linus Torvalds     2005-04-16  252  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  253  	switch (r_type) {
e80cfc31d872b6 Hendrik Brueckner  2012-10-31  254  	case R_390_NONE:	/* No =
relocation.  */
e80cfc31d872b6 Hendrik Brueckner  2012-10-31  255  		rc =3D 0;
e80cfc31d872b6 Hendrik Brueckner  2012-10-31  256  		break;
^1da177e4c3f41 Linus Torvalds     2005-04-16  257  	case R_390_8:		/* Direc=
t 8 bit.   */
^1da177e4c3f41 Linus Torvalds     2005-04-16  258  	case R_390_12:		/* Dire=
ct 12 bit.  */
^1da177e4c3f41 Linus Torvalds     2005-04-16  259  	case R_390_16:		/* Dire=
ct 16 bit.  */
^1da177e4c3f41 Linus Torvalds     2005-04-16  260  	case R_390_20:		/* Dire=
ct 20 bit.  */
^1da177e4c3f41 Linus Torvalds     2005-04-16  261  	case R_390_32:		/* Dire=
ct 32 bit.  */
^1da177e4c3f41 Linus Torvalds     2005-04-16  262  	case R_390_64:		/* Dire=
ct 64 bit.  */
^1da177e4c3f41 Linus Torvalds     2005-04-16  263  		val +=3D rela->r_adden=
d;
^1da177e4c3f41 Linus Torvalds     2005-04-16  264  		if (r_type =3D=3D R_39=
0_8)
be2422612a580e Peter Zijlstra     2020-04-29  265  			rc =3D apply_rela_bit=
s(loc, val, 0, 8, 0, write);
^1da177e4c3f41 Linus Torvalds     2005-04-16  266  		else if (r_type =3D=3D=
 R_390_12)
be2422612a580e Peter Zijlstra     2020-04-29  267  			rc =3D apply_rela_bit=
s(loc, val, 0, 12, 0, write);
^1da177e4c3f41 Linus Torvalds     2005-04-16  268  		else if (r_type =3D=3D=
 R_390_16)
be2422612a580e Peter Zijlstra     2020-04-29  269  			rc =3D apply_rela_bit=
s(loc, val, 0, 16, 0, write);
^1da177e4c3f41 Linus Torvalds     2005-04-16  270  		else if (r_type =3D=3D=
 R_390_20)
be2422612a580e Peter Zijlstra     2020-04-29  271  			rc =3D apply_rela_bit=
s(loc, val, 1, 20, 0, write);
^1da177e4c3f41 Linus Torvalds     2005-04-16  272  		else if (r_type =3D=3D=
 R_390_32)
be2422612a580e Peter Zijlstra     2020-04-29  273  			rc =3D apply_rela_bit=
s(loc, val, 0, 32, 0, write);
^1da177e4c3f41 Linus Torvalds     2005-04-16  274  		else if (r_type =3D=3D=
 R_390_64)
be2422612a580e Peter Zijlstra     2020-04-29  275  			rc =3D apply_rela_bit=
s(loc, val, 0, 64, 0, write);
^1da177e4c3f41 Linus Torvalds     2005-04-16  276  		break;
^1da177e4c3f41 Linus Torvalds     2005-04-16  277  	case R_390_PC16:	/* PC =
relative 16 bit.  */
^1da177e4c3f41 Linus Torvalds     2005-04-16  278  	case R_390_PC16DBL:	/* =
PC relative 16 bit shifted by 1.  */
^1da177e4c3f41 Linus Torvalds     2005-04-16  279  	case R_390_PC32DBL:	/* =
PC relative 32 bit shifted by 1.  */
^1da177e4c3f41 Linus Torvalds     2005-04-16  280  	case R_390_PC32:	/* PC =
relative 32 bit.  */
^1da177e4c3f41 Linus Torvalds     2005-04-16  281  	case R_390_PC64:	/* PC =
relative 64 bit.	*/
^1da177e4c3f41 Linus Torvalds     2005-04-16  282  		val +=3D rela->r_adden=
d - loc;
^1da177e4c3f41 Linus Torvalds     2005-04-16  283  		if (r_type =3D=3D R_39=
0_PC16)
be2422612a580e Peter Zijlstra     2020-04-29  284  			rc =3D apply_rela_bit=
s(loc, val, 1, 16, 0, write);
^1da177e4c3f41 Linus Torvalds     2005-04-16  285  		else if (r_type =3D=3D=
 R_390_PC16DBL)
be2422612a580e Peter Zijlstra     2020-04-29  286  			rc =3D apply_rela_bit=
s(loc, val, 1, 16, 1, write);
^1da177e4c3f41 Linus Torvalds     2005-04-16  287  		else if (r_type =3D=3D=
 R_390_PC32DBL)
be2422612a580e Peter Zijlstra     2020-04-29  288  			rc =3D apply_rela_bit=
s(loc, val, 1, 32, 1, write);
^1da177e4c3f41 Linus Torvalds     2005-04-16  289  		else if (r_type =3D=3D=
 R_390_PC32)
be2422612a580e Peter Zijlstra     2020-04-29  290  			rc =3D apply_rela_bit=
s(loc, val, 1, 32, 0, write);
^1da177e4c3f41 Linus Torvalds     2005-04-16  291  		else if (r_type =3D=3D=
 R_390_PC64)
be2422612a580e Peter Zijlstra     2020-04-29  292  			rc =3D apply_rela_bit=
s(loc, val, 1, 64, 0, write);
^1da177e4c3f41 Linus Torvalds     2005-04-16  293  		break;
^1da177e4c3f41 Linus Torvalds     2005-04-16  294  	case R_390_GOT12:	/* 12=
 bit GOT offset.  */
^1da177e4c3f41 Linus Torvalds     2005-04-16  295  	case R_390_GOT16:	/* 16=
 bit GOT offset.  */
^1da177e4c3f41 Linus Torvalds     2005-04-16  296  	case R_390_GOT20:	/* 20=
 bit GOT offset.  */
^1da177e4c3f41 Linus Torvalds     2005-04-16  297  	case R_390_GOT32:	/* 32=
 bit GOT offset.  */
^1da177e4c3f41 Linus Torvalds     2005-04-16  298  	case R_390_GOT64:	/* 64=
 bit GOT offset.  */
^1da177e4c3f41 Linus Torvalds     2005-04-16  299  	case R_390_GOTENT:	/* 3=
2 bit PC rel. to GOT entry shifted by 1. */
^1da177e4c3f41 Linus Torvalds     2005-04-16  300  	case R_390_GOTPLT12:	/*=
 12 bit offset to jump slot.	*/
^1da177e4c3f41 Linus Torvalds     2005-04-16  301  	case R_390_GOTPLT20:	/*=
 20 bit offset to jump slot.  */
^1da177e4c3f41 Linus Torvalds     2005-04-16  302  	case R_390_GOTPLT16:	/*=
 16 bit offset to jump slot.  */
^1da177e4c3f41 Linus Torvalds     2005-04-16  303  	case R_390_GOTPLT32:	/*=
 32 bit offset to jump slot.  */
^1da177e4c3f41 Linus Torvalds     2005-04-16  304  	case R_390_GOTPLT64:	/*=
 64 bit offset to jump slot.	*/
^1da177e4c3f41 Linus Torvalds     2005-04-16  305  	case R_390_GOTPLTENT:	/=
* 32 bit rel. offset to jump slot >> 1. */
^1da177e4c3f41 Linus Torvalds     2005-04-16  306  		if (info->got_initiali=
zed =3D=3D 0) {
be2422612a580e Peter Zijlstra     2020-04-29  307  			Elf_Addr *gotent =3D =
me->core_layout.base +
be2422612a580e Peter Zijlstra     2020-04-29  308  					   me->arch.got_off=
set +
^1da177e4c3f41 Linus Torvalds     2005-04-16  309  					   info->got_offset;
be2422612a580e Peter Zijlstra     2020-04-29  310  =

be2422612a580e Peter Zijlstra     2020-04-29  311  			write(gotent, &val, s=
izeof(*gotent));
^1da177e4c3f41 Linus Torvalds     2005-04-16  312  			info->got_initialized=
 =3D 1;
^1da177e4c3f41 Linus Torvalds     2005-04-16  313  		}
^1da177e4c3f41 Linus Torvalds     2005-04-16  314  		val =3D info->got_offs=
et + rela->r_addend;
^1da177e4c3f41 Linus Torvalds     2005-04-16  315  		if (r_type =3D=3D R_39=
0_GOT12 ||
^1da177e4c3f41 Linus Torvalds     2005-04-16  316  		    r_type =3D=3D R_39=
0_GOTPLT12)
be2422612a580e Peter Zijlstra     2020-04-29  317  			rc =3D apply_rela_bit=
s(loc, val, 0, 12, 0, write);
^1da177e4c3f41 Linus Torvalds     2005-04-16  318  		else if (r_type =3D=3D=
 R_390_GOT16 ||
^1da177e4c3f41 Linus Torvalds     2005-04-16  319  			 r_type =3D=3D R_390_=
GOTPLT16)
be2422612a580e Peter Zijlstra     2020-04-29  320  			rc =3D apply_rela_bit=
s(loc, val, 0, 16, 0, write);
^1da177e4c3f41 Linus Torvalds     2005-04-16  321  		else if (r_type =3D=3D=
 R_390_GOT20 ||
^1da177e4c3f41 Linus Torvalds     2005-04-16  322  			 r_type =3D=3D R_390_=
GOTPLT20)
be2422612a580e Peter Zijlstra     2020-04-29  323  			rc =3D apply_rela_bit=
s(loc, val, 1, 20, 0, write);
^1da177e4c3f41 Linus Torvalds     2005-04-16  324  		else if (r_type =3D=3D=
 R_390_GOT32 ||
^1da177e4c3f41 Linus Torvalds     2005-04-16  325  			 r_type =3D=3D R_390_=
GOTPLT32)
be2422612a580e Peter Zijlstra     2020-04-29  326  			rc =3D apply_rela_bit=
s(loc, val, 0, 32, 0, write);
^1da177e4c3f41 Linus Torvalds     2005-04-16  327  		else if (r_type =3D=3D=
 R_390_GOT64 ||
^1da177e4c3f41 Linus Torvalds     2005-04-16  328  			 r_type =3D=3D R_390_=
GOTPLT64)
be2422612a580e Peter Zijlstra     2020-04-29  329  			rc =3D apply_rela_bit=
s(loc, val, 0, 64, 0, write);
083e14c09b7ae0 Martin Schwidefsky 2013-01-11  330  		else if (r_type =3D=3D=
 R_390_GOTENT ||
083e14c09b7ae0 Martin Schwidefsky 2013-01-11  331  			 r_type =3D=3D R_390_=
GOTPLTENT) {
7523e4dc5057e1 Rusty Russell      2015-11-26  332  			val +=3D (Elf_Addr) m=
e->core_layout.base - loc;
be2422612a580e Peter Zijlstra     2020-04-29  333  			rc =3D apply_rela_bit=
s(loc, val, 1, 32, 1, write);
083e14c09b7ae0 Martin Schwidefsky 2013-01-11  334  		}
^1da177e4c3f41 Linus Torvalds     2005-04-16  335  		break;
^1da177e4c3f41 Linus Torvalds     2005-04-16  336  	case R_390_PLT16DBL:	/*=
 16 bit PC rel. PLT shifted by 1.  */
^1da177e4c3f41 Linus Torvalds     2005-04-16  337  	case R_390_PLT32DBL:	/*=
 32 bit PC rel. PLT shifted by 1.  */
^1da177e4c3f41 Linus Torvalds     2005-04-16  338  	case R_390_PLT32:	/* 32=
 bit PC relative PLT address.  */
^1da177e4c3f41 Linus Torvalds     2005-04-16  339  	case R_390_PLT64:	/* 64=
 bit PC relative PLT address.  */
^1da177e4c3f41 Linus Torvalds     2005-04-16  340  	case R_390_PLTOFF16:	/*=
 16 bit offset from GOT to PLT. */
^1da177e4c3f41 Linus Torvalds     2005-04-16  341  	case R_390_PLTOFF32:	/*=
 32 bit offset from GOT to PLT. */
^1da177e4c3f41 Linus Torvalds     2005-04-16  342  	case R_390_PLTOFF64:	/*=
 16 bit offset from GOT to PLT. */
^1da177e4c3f41 Linus Torvalds     2005-04-16  343  		if (info->plt_initiali=
zed =3D=3D 0) {
f3b7e73b2c6619 Ilya Leoshkevich   2022-01-19  344  			unsigned char insn[PL=
T_ENTRY_SIZE];
f3b7e73b2c6619 Ilya Leoshkevich   2022-01-19  345  			char *plt_base;
f3b7e73b2c6619 Ilya Leoshkevich   2022-01-19  346  			char *ip;
be2422612a580e Peter Zijlstra     2020-04-29  347  =

f3b7e73b2c6619 Ilya Leoshkevich   2022-01-19  348  			plt_base =3D me->core=
_layout.base + me->arch.plt_offset;
f3b7e73b2c6619 Ilya Leoshkevich   2022-01-19  349  			ip =3D plt_base + inf=
o->plt_offset;
f3b7e73b2c6619 Ilya Leoshkevich   2022-01-19  350  			*(int *)insn =3D 0x0d=
10e310;	/* basr 1,0  */
f3b7e73b2c6619 Ilya Leoshkevich   2022-01-19  351  			*(int *)&insn[4] =3D =
0x100c0004;	/* lg	1,12(1) */
6e179d64126b90 Martin Schwidefsky 2018-03-23  352  			if (IS_ENABLED(CONFIG=
_EXPOLINE) && !nospec_disable) {
f3b7e73b2c6619 Ilya Leoshkevich   2022-01-19  353  				char *jump_r1;
f3b7e73b2c6619 Ilya Leoshkevich   2022-01-19  354  =

f3b7e73b2c6619 Ilya Leoshkevich   2022-01-19  355  				jump_r1 =3D plt_base=
 + me->arch.plt_size -
f3b7e73b2c6619 Ilya Leoshkevich   2022-01-19  356  					PLT_ENTRY_SIZE;
f3b7e73b2c6619 Ilya Leoshkevich   2022-01-19  357  				/* brcl	0xf,__jump_r=
1 */
f3b7e73b2c6619 Ilya Leoshkevich   2022-01-19 @358  				*(short *)&insn[8] =
=3D 0xc0f4;
f3b7e73b2c6619 Ilya Leoshkevich   2022-01-19  359  				*(int *)&insn[10] =
=3D (jump_r1 - (ip + 8)) / 2;
f19fbd5ed642dc Martin Schwidefsky 2018-01-26  360  			} else {
f3b7e73b2c6619 Ilya Leoshkevich   2022-01-19  361  				*(int *)&insn[8] =3D=
 0x07f10000;	/* br %r1 */
f19fbd5ed642dc Martin Schwidefsky 2018-01-26  362  			}
f3b7e73b2c6619 Ilya Leoshkevich   2022-01-19  363  			*(long *)&insn[14] =
=3D val;
be2422612a580e Peter Zijlstra     2020-04-29  364  =

be2422612a580e Peter Zijlstra     2020-04-29  365  			write(ip, insn, sizeo=
f(insn));
^1da177e4c3f41 Linus Torvalds     2005-04-16  366  			info->plt_initialized=
 =3D 1;
^1da177e4c3f41 Linus Torvalds     2005-04-16  367  		}
^1da177e4c3f41 Linus Torvalds     2005-04-16  368  		if (r_type =3D=3D R_39=
0_PLTOFF16 ||
504665a91498f4 Martin Schwidefsky 2009-03-26  369  		    r_type =3D=3D R_39=
0_PLTOFF32 ||
504665a91498f4 Martin Schwidefsky 2009-03-26  370  		    r_type =3D=3D R_39=
0_PLTOFF64)
^1da177e4c3f41 Linus Torvalds     2005-04-16  371  			val =3D me->arch.plt_=
offset - me->arch.got_offset +
^1da177e4c3f41 Linus Torvalds     2005-04-16  372  				info->plt_offset + r=
ela->r_addend;
504665a91498f4 Martin Schwidefsky 2009-03-26  373  		else {
504665a91498f4 Martin Schwidefsky 2009-03-26  374  			if (!((r_type =3D=3D =
R_390_PLT16DBL &&
504665a91498f4 Martin Schwidefsky 2009-03-26  375  			       val - loc + 0x=
ffffUL < 0x1ffffeUL) ||
504665a91498f4 Martin Schwidefsky 2009-03-26  376  			      (r_type =3D=3D =
R_390_PLT32DBL &&
504665a91498f4 Martin Schwidefsky 2009-03-26  377  			       val - loc + 0x=
ffffffffULL < 0x1fffffffeULL)))
7523e4dc5057e1 Rusty Russell      2015-11-26  378  				val =3D (Elf_Addr) m=
e->core_layout.base +
504665a91498f4 Martin Schwidefsky 2009-03-26  379  					me->arch.plt_offset=
 +
504665a91498f4 Martin Schwidefsky 2009-03-26  380  					info->plt_offset;
504665a91498f4 Martin Schwidefsky 2009-03-26  381  			val +=3D rela->r_adde=
nd - loc;
504665a91498f4 Martin Schwidefsky 2009-03-26  382  		}
^1da177e4c3f41 Linus Torvalds     2005-04-16  383  		if (r_type =3D=3D R_39=
0_PLT16DBL)
be2422612a580e Peter Zijlstra     2020-04-29  384  			rc =3D apply_rela_bit=
s(loc, val, 1, 16, 1, write);
^1da177e4c3f41 Linus Torvalds     2005-04-16  385  		else if (r_type =3D=3D=
 R_390_PLTOFF16)
be2422612a580e Peter Zijlstra     2020-04-29  386  			rc =3D apply_rela_bit=
s(loc, val, 0, 16, 0, write);
^1da177e4c3f41 Linus Torvalds     2005-04-16  387  		else if (r_type =3D=3D=
 R_390_PLT32DBL)
be2422612a580e Peter Zijlstra     2020-04-29  388  			rc =3D apply_rela_bit=
s(loc, val, 1, 32, 1, write);
^1da177e4c3f41 Linus Torvalds     2005-04-16  389  		else if (r_type =3D=3D=
 R_390_PLT32 ||
^1da177e4c3f41 Linus Torvalds     2005-04-16  390  			 r_type =3D=3D R_390_=
PLTOFF32)
be2422612a580e Peter Zijlstra     2020-04-29  391  			rc =3D apply_rela_bit=
s(loc, val, 0, 32, 0, write);
^1da177e4c3f41 Linus Torvalds     2005-04-16  392  		else if (r_type =3D=3D=
 R_390_PLT64 ||
^1da177e4c3f41 Linus Torvalds     2005-04-16  393  			 r_type =3D=3D R_390_=
PLTOFF64)
be2422612a580e Peter Zijlstra     2020-04-29  394  			rc =3D apply_rela_bit=
s(loc, val, 0, 64, 0, write);
^1da177e4c3f41 Linus Torvalds     2005-04-16  395  		break;
^1da177e4c3f41 Linus Torvalds     2005-04-16  396  	case R_390_GOTOFF16:	/*=
 16 bit offset to GOT.  */
^1da177e4c3f41 Linus Torvalds     2005-04-16  397  	case R_390_GOTOFF32:	/*=
 32 bit offset to GOT.  */
^1da177e4c3f41 Linus Torvalds     2005-04-16  398  	case R_390_GOTOFF64:	/*=
 64 bit offset to GOT. */
^1da177e4c3f41 Linus Torvalds     2005-04-16  399  		val =3D val + rela->r_=
addend -
7523e4dc5057e1 Rusty Russell      2015-11-26  400  			((Elf_Addr) me->core_=
layout.base + me->arch.got_offset);
^1da177e4c3f41 Linus Torvalds     2005-04-16  401  		if (r_type =3D=3D R_39=
0_GOTOFF16)
be2422612a580e Peter Zijlstra     2020-04-29  402  			rc =3D apply_rela_bit=
s(loc, val, 0, 16, 0, write);
^1da177e4c3f41 Linus Torvalds     2005-04-16  403  		else if (r_type =3D=3D=
 R_390_GOTOFF32)
be2422612a580e Peter Zijlstra     2020-04-29  404  			rc =3D apply_rela_bit=
s(loc, val, 0, 32, 0, write);
^1da177e4c3f41 Linus Torvalds     2005-04-16  405  		else if (r_type =3D=3D=
 R_390_GOTOFF64)
be2422612a580e Peter Zijlstra     2020-04-29  406  			rc =3D apply_rela_bit=
s(loc, val, 0, 64, 0, write);
^1da177e4c3f41 Linus Torvalds     2005-04-16  407  		break;
^1da177e4c3f41 Linus Torvalds     2005-04-16  408  	case R_390_GOTPC:	/* 32=
 bit PC relative offset to GOT. */
^1da177e4c3f41 Linus Torvalds     2005-04-16  409  	case R_390_GOTPCDBL:	/*=
 32 bit PC rel. off. to GOT shifted by 1. */
7523e4dc5057e1 Rusty Russell      2015-11-26  410  		val =3D (Elf_Addr) me-=
>core_layout.base + me->arch.got_offset +
^1da177e4c3f41 Linus Torvalds     2005-04-16  411  			rela->r_addend - loc;
^1da177e4c3f41 Linus Torvalds     2005-04-16  412  		if (r_type =3D=3D R_39=
0_GOTPC)
be2422612a580e Peter Zijlstra     2020-04-29  413  			rc =3D apply_rela_bit=
s(loc, val, 1, 32, 0, write);
^1da177e4c3f41 Linus Torvalds     2005-04-16  414  		else if (r_type =3D=3D=
 R_390_GOTPCDBL)
be2422612a580e Peter Zijlstra     2020-04-29  415  			rc =3D apply_rela_bit=
s(loc, val, 1, 32, 1, write);
^1da177e4c3f41 Linus Torvalds     2005-04-16  416  		break;
^1da177e4c3f41 Linus Torvalds     2005-04-16  417  	case R_390_COPY:
^1da177e4c3f41 Linus Torvalds     2005-04-16  418  	case R_390_GLOB_DAT:	/*=
 Create GOT entry.  */
^1da177e4c3f41 Linus Torvalds     2005-04-16  419  	case R_390_JMP_SLOT:	/*=
 Create PLT entry.  */
^1da177e4c3f41 Linus Torvalds     2005-04-16  420  	case R_390_RELATIVE:	/*=
 Adjust by program base.  */
^1da177e4c3f41 Linus Torvalds     2005-04-16  421  		/* Only needed if we w=
ant to support loading of =

^1da177e4c3f41 Linus Torvalds     2005-04-16  422  		   modules linked with=
 -shared. */
083e14c09b7ae0 Martin Schwidefsky 2013-01-11  423  		return -ENOEXEC;
^1da177e4c3f41 Linus Torvalds     2005-04-16  424  	default:
083e14c09b7ae0 Martin Schwidefsky 2013-01-11  425  		printk(KERN_ERR "modul=
e %s: unknown relocation: %u\n",
^1da177e4c3f41 Linus Torvalds     2005-04-16  426  		       me->name, r_typ=
e);
^1da177e4c3f41 Linus Torvalds     2005-04-16  427  		return -ENOEXEC;
^1da177e4c3f41 Linus Torvalds     2005-04-16  428  	}
083e14c09b7ae0 Martin Schwidefsky 2013-01-11  429  	if (rc) {
083e14c09b7ae0 Martin Schwidefsky 2013-01-11  430  		printk(KERN_ERR "modul=
e %s: relocation error for symbol %s "
083e14c09b7ae0 Martin Schwidefsky 2013-01-11  431  		       "(r_type %i, va=
lue 0x%lx)\n",
083e14c09b7ae0 Martin Schwidefsky 2013-01-11  432  		       me->name, strta=
b + symtab[r_sym].st_name,
083e14c09b7ae0 Martin Schwidefsky 2013-01-11  433  		       r_type, (unsign=
ed long) val);
083e14c09b7ae0 Martin Schwidefsky 2013-01-11  434  		return rc;
083e14c09b7ae0 Martin Schwidefsky 2013-01-11  435  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  436  	return 0;
^1da177e4c3f41 Linus Torvalds     2005-04-16  437  }
^1da177e4c3f41 Linus Torvalds     2005-04-16  438  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5047496012730339937==--

