Content-Type: multipart/mixed; boundary="===============4937681225980610158=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [jimc:ddn3h 20/23] lib/dynamic_debug.c:636 param_set_dyndbg_class_strings() warn: variable dereferenced before check 'dcp' (see line 630)
Date: Tue, 14 Jun 2022 21:28:48 +0800
Message-ID: <202206142148.900MvDQ7-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4937681225980610158==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: Jim Cromie <jim.cromie@gmail.com>

tree:   https://github.com/jimc/linux.git ddn3h
head:   4ec4d6e7cc8be5dbb9fc98fa7d186eb3c92279f6
commit: a989dd267981b06281b4d068bc5b1cf34fd24932 [20/23] dyndbg: support sy=
mbolic class-names in class_bitmap
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: parisc-randconfig-m031-20220613 (https://download.01.org/0day-ci/ar=
chive/20220614/202206142148.900MvDQ7-lkp(a)intel.com/config)
compiler: hppa-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
lib/dynamic_debug.c:636 param_set_dyndbg_class_strings() warn: variable der=
eferenced before check 'dcp' (see line 630)

vim +/dcp +636 lib/dynamic_debug.c

09e2e18f08c39d Jim Cromie 2022-04-01  625  =

a989dd267981b0 Jim Cromie 2022-04-06  626  /* support for [+-] symbolic-nam=
e boolean list */
a989dd267981b0 Jim Cromie 2022-04-06  627  static int param_set_dyndbg_clas=
s_strings(const char *instr, const struct kernel_param *kp)
a989dd267981b0 Jim Cromie 2022-04-06  628  {
a989dd267981b0 Jim Cromie 2022-04-06  629  	const struct ddebug_classes_bit=
map_param *dcp =3D kp->arg;
a989dd267981b0 Jim Cromie 2022-04-06 @630  	const struct ddebug_classes_map=
 *map =3D dcp->map;
a989dd267981b0 Jim Cromie 2022-04-06  631  	unsigned long inbits;
a989dd267981b0 Jim Cromie 2022-04-06  632  	int idx_rc, totct =3D 0;
a989dd267981b0 Jim Cromie 2022-04-06  633  	bool wanted;
a989dd267981b0 Jim Cromie 2022-04-06  634  	char *cls, *p;
a989dd267981b0 Jim Cromie 2022-04-06  635  =

a989dd267981b0 Jim Cromie 2022-04-06 @636  	if (!dcp || !dcp->map) {
a989dd267981b0 Jim Cromie 2022-04-06  637  		pr_err("set_dyndbg_classes: no=
 bits=3D>queries map\n");
a989dd267981b0 Jim Cromie 2022-04-06  638  		return -EINVAL;
a989dd267981b0 Jim Cromie 2022-04-06  639  	}
a989dd267981b0 Jim Cromie 2022-04-06  640  =

a989dd267981b0 Jim Cromie 2022-04-06  641  	cls =3D kstrdup(instr, GFP_KERN=
EL);
a989dd267981b0 Jim Cromie 2022-04-06  642  	p =3D strchr(cls, '\n');
a989dd267981b0 Jim Cromie 2022-04-06  643  	if (p)
a989dd267981b0 Jim Cromie 2022-04-06  644  		*p =3D '\0';
a989dd267981b0 Jim Cromie 2022-04-06  645  =

a989dd267981b0 Jim Cromie 2022-04-06  646  	inbits =3D *dcp->bits;
a989dd267981b0 Jim Cromie 2022-04-06  647  	vpr_info("set_dyndbg_class_stri=
ngs: %s on 0x%lx\n", cls, inbits);
a989dd267981b0 Jim Cromie 2022-04-06  648  =

a989dd267981b0 Jim Cromie 2022-04-06  649  	for (; cls; cls =3D p) {
a989dd267981b0 Jim Cromie 2022-04-06  650  		p =3D strchr(cls, ',');
a989dd267981b0 Jim Cromie 2022-04-06  651  		if (p)
a989dd267981b0 Jim Cromie 2022-04-06  652  			*p++ =3D '\0';
a989dd267981b0 Jim Cromie 2022-04-06  653  =

a989dd267981b0 Jim Cromie 2022-04-06  654  		if (*cls =3D=3D '-') {
a989dd267981b0 Jim Cromie 2022-04-06  655  			wanted =3D false;
a989dd267981b0 Jim Cromie 2022-04-06  656  			cls++;
a989dd267981b0 Jim Cromie 2022-04-06  657  		} else {
a989dd267981b0 Jim Cromie 2022-04-06  658  			wanted =3D true;
a989dd267981b0 Jim Cromie 2022-04-06  659  			if (*cls =3D=3D '+')
a989dd267981b0 Jim Cromie 2022-04-06  660  				cls++;
a989dd267981b0 Jim Cromie 2022-04-06  661  		}
a989dd267981b0 Jim Cromie 2022-04-06  662  		idx_rc =3D match_string(map->c=
lass_names, map->length, cls);
a989dd267981b0 Jim Cromie 2022-04-06  663  		if (idx_rc < 0) {
a989dd267981b0 Jim Cromie 2022-04-06  664  			pr_err("%s not found for modu=
le: %s\n", cls, map->mod_name);
a989dd267981b0 Jim Cromie 2022-04-06  665  			continue;
a989dd267981b0 Jim Cromie 2022-04-06  666  		}
a989dd267981b0 Jim Cromie 2022-04-06  667  =

a989dd267981b0 Jim Cromie 2022-04-06  668  		switch (map->map_type) {
a989dd267981b0 Jim Cromie 2022-04-06  669  		case DD_CLASS_TYPE_DISJOINT:
a989dd267981b0 Jim Cromie 2022-04-06  670  			if (test_bit(idx_rc, &inbits)=
 =3D=3D wanted) {
a989dd267981b0 Jim Cromie 2022-04-06  671  				v3pr_info("no change on %s\n=
", cls);
a989dd267981b0 Jim Cromie 2022-04-06  672  				continue;
a989dd267981b0 Jim Cromie 2022-04-06  673  			}
a989dd267981b0 Jim Cromie 2022-04-06  674  			inbits ^=3D BIT(idx_rc);
a989dd267981b0 Jim Cromie 2022-04-06  675  			break;
a989dd267981b0 Jim Cromie 2022-04-06  676  		case DD_CLASS_TYPE_LEVELS:
a989dd267981b0 Jim Cromie 2022-04-06  677  			/* bitmask must respect class=
map ranges, this does not */
a989dd267981b0 Jim Cromie 2022-04-06  678  			inbits =3D (1 << (idx_rc + wa=
nted)) - 1;
a989dd267981b0 Jim Cromie 2022-04-06  679  			break;
a989dd267981b0 Jim Cromie 2022-04-06  680  		default:
a989dd267981b0 Jim Cromie 2022-04-06  681  			pr_err("illegal map-type valu=
e %d\n", map->map_type);
a989dd267981b0 Jim Cromie 2022-04-06  682  		}
a989dd267981b0 Jim Cromie 2022-04-06  683  		vpr_info("set_dyndbg_classes: =
bit %d: %s\n", idx_rc, map->class_names[idx_rc]);
a989dd267981b0 Jim Cromie 2022-04-06  684  		totct +=3D ddebug_apply_class_=
bitmap(dcp, &inbits);
a989dd267981b0 Jim Cromie 2022-04-06  685  	}
a989dd267981b0 Jim Cromie 2022-04-06  686  	kfree(cls);
a989dd267981b0 Jim Cromie 2022-04-06  687  	*dcp->bits =3D inbits;
a989dd267981b0 Jim Cromie 2022-04-06  688  	vpr_info("total matches: %d\n",=
 totct);
a989dd267981b0 Jim Cromie 2022-04-06  689  	return 0;
a989dd267981b0 Jim Cromie 2022-04-06  690  }
a989dd267981b0 Jim Cromie 2022-04-06  691  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4937681225980610158==--

