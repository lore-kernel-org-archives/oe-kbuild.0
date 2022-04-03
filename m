Content-Type: multipart/mixed; boundary="===============6389216168129676184=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [jimc:dyndbg-next 12/13] lib/dynamic_debug.c:609 param_set_dyndbg_class_strings() warn: this array is probably non-NULL. 'dcp->map->classes'
Date: Mon, 04 Apr 2022 05:46:50 +0800
Message-ID: <202204040559.Sb9yCTow-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6389216168129676184==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: Jim Cromie <jim.cromie@gmail.com>

tree:   https://github.com/jimc/linux.git dyndbg-next
head:   2d866e4162816ff445daf40b085b8dcd5b6d1e71
commit: 0b730377edaffc4db2eaa5a243a0af307e8471d0 [12/13] dyndbg: WIP add sy=
mbolic bitmap
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
config: x86_64-randconfig-m001-20220404 (https://download.01.org/0day-ci/ar=
chive/20220404/202204040559.Sb9yCTow-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-19) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
lib/dynamic_debug.c:609 param_set_dyndbg_class_strings() warn: this array i=
s probably non-NULL. 'dcp->map->classes'

Old smatch warnings:
lib/dynamic_debug.c:642 param_set_dyndbg_class_strings() error: uninitializ=
ed symbol 'inbits'.

vim +609 lib/dynamic_debug.c

360be1e8c2071b Jim Cromie 2022-04-01  594  =

0b730377edaffc Jim Cromie 2022-04-01  595  /* support for +/- symbolic-name=
 boolean list */
0b730377edaffc Jim Cromie 2022-04-01  596  static int param_set_dyndbg_clas=
s_strings(const char *instr, const struct kernel_param *kp)
0b730377edaffc Jim Cromie 2022-04-01  597  {
0b730377edaffc Jim Cromie 2022-04-01  598  	unsigned long inbits;
0b730377edaffc Jim Cromie 2022-04-01  599  	int idx_rc, matches =3D 0, totc=
t =3D 0;
0b730377edaffc Jim Cromie 2022-04-01  600  	char query[FMT_QUERY_SIZE];
0b730377edaffc Jim Cromie 2022-04-01  601  	const struct ddebug_classes_bit=
map_param *dcp =3D kp->arg;
0b730377edaffc Jim Cromie 2022-04-01  602  	bool negate =3D false;
0b730377edaffc Jim Cromie 2022-04-01  603  	char *cls, *p;
0b730377edaffc Jim Cromie 2022-04-01  604  =

0b730377edaffc Jim Cromie 2022-04-01  605  	if (!dcp || !dcp->map) {
0b730377edaffc Jim Cromie 2022-04-01  606  		pr_err("set_dyndbg_classes: no=
 bits=3D>queries map\n");
0b730377edaffc Jim Cromie 2022-04-01  607  		return -EINVAL;
0b730377edaffc Jim Cromie 2022-04-01  608  	}
0b730377edaffc Jim Cromie 2022-04-01 @609  	if (!dcp->map->classes) {
0b730377edaffc Jim Cromie 2022-04-01  610  		pr_err("module -get-classes: n=
o classes\n");
0b730377edaffc Jim Cromie 2022-04-01  611  		return -EINVAL;
0b730377edaffc Jim Cromie 2022-04-01  612  	}
0b730377edaffc Jim Cromie 2022-04-01  613  	cls =3D kstrdup(instr, GFP_KERN=
EL);
0b730377edaffc Jim Cromie 2022-04-01  614  =

0b730377edaffc Jim Cromie 2022-04-01  615  	for (p =3D strchr(cls, ','); cl=
s; cls =3D strchr(p, ',')) {
0b730377edaffc Jim Cromie 2022-04-01  616  		if (p)
0b730377edaffc Jim Cromie 2022-04-01  617  			*p++ =3D 0; /* chop and advan=
ce on comma */
0b730377edaffc Jim Cromie 2022-04-01  618  		if (*cls =3D=3D '!') {
0b730377edaffc Jim Cromie 2022-04-01  619  			negate =3D true;
0b730377edaffc Jim Cromie 2022-04-01  620  			cls++;
0b730377edaffc Jim Cromie 2022-04-01  621  		} else if (*(p - 1) =3D=3D '!'=
) {
0b730377edaffc Jim Cromie 2022-04-01  622  			negate =3D true;
0b730377edaffc Jim Cromie 2022-04-01  623  			*(p - 1) =3D '0';
0b730377edaffc Jim Cromie 2022-04-01  624  		}
0b730377edaffc Jim Cromie 2022-04-01  625  		idx_rc =3D match_string(dcp->m=
ap->classes, _DPRINTK_CLASS_DFLT, cls);
0b730377edaffc Jim Cromie 2022-04-01  626  		if (idx_rc < 0) {
0b730377edaffc Jim Cromie 2022-04-01  627  			pr_err("%s not found for modu=
le: %s\n", cls, KP_MOD_NAME);
0b730377edaffc Jim Cromie 2022-04-01  628  			return idx_rc;
0b730377edaffc Jim Cromie 2022-04-01  629  		}
0b730377edaffc Jim Cromie 2022-04-01  630  		if (negate =3D=3D test_bit(idx=
_rc, dcp->bits))
0b730377edaffc Jim Cromie 2022-04-01  631  			continue;
0b730377edaffc Jim Cromie 2022-04-01  632  =

0b730377edaffc Jim Cromie 2022-04-01  633  		snprintf(query, FMT_QUERY_SIZE=
, "class %s %c%s",
0b730377edaffc Jim Cromie 2022-04-01  634  			 cls, !!negate ? '-' : '+', d=
cp->flags);
0b730377edaffc Jim Cromie 2022-04-01  635  =

0b730377edaffc Jim Cromie 2022-04-01  636  		matches =3D ddebug_exec_querie=
s(query, KP_MOD_NAME);
0b730377edaffc Jim Cromie 2022-04-01  637  =

0b730377edaffc Jim Cromie 2022-04-01  638  		v2pr_info("%d matches on class=
:%s\n", matches, cls);
0b730377edaffc Jim Cromie 2022-04-01  639  		totct +=3D matches;
0b730377edaffc Jim Cromie 2022-04-01  640  	}
0b730377edaffc Jim Cromie 2022-04-01  641  	kfree(cls);
0b730377edaffc Jim Cromie 2022-04-01  642  	*dcp->bits =3D inbits;
0b730377edaffc Jim Cromie 2022-04-01  643  	vpr_info("total matches: %d\n",=
 totct);
0b730377edaffc Jim Cromie 2022-04-01  644  	return 0;
0b730377edaffc Jim Cromie 2022-04-01  645  }
0b730377edaffc Jim Cromie 2022-04-01  646  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6389216168129676184==--

