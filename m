Content-Type: multipart/mixed; boundary="===============6707123159215143172=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [jimc:dyndbg-next 4/5] lib/dynamic_debug.c:637 param_set_dyndbg_class_strings() warn: this array is probably non-NULL. 'dcp->classes'
Date: Tue, 29 Mar 2022 20:50:37 +0800
Message-ID: <202203292020.KeXqcNTM-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6707123159215143172==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: Jim Cromie <jim.cromie@gmail.com>

tree:   https://github.com/jimc/linux.git dyndbg-next
head:   d5414e4a36850aa4acd1024e477a5da9efb2fb73
commit: b354c51c63aa31f1646329412608ffee1b34a629 [4/5] dyndbg: add DEFINE_D=
YNAMIC_DEBUG_CLASSES macro
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: x86_64-randconfig-m001-20220328 (https://download.01.org/0day-ci/ar=
chive/20220329/202203292020.KeXqcNTM-lkp(a)intel.com/config)
compiler: gcc-9 (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
lib/dynamic_debug.c:637 param_set_dyndbg_class_strings() warn: this array i=
s probably non-NULL. 'dcp->classes'
lib/dynamic_debug.c:658 param_set_dyndbg_class_strings() error: uninitializ=
ed symbol 'negate'.
lib/dynamic_debug.c:669 param_set_dyndbg_class_strings() error: uninitializ=
ed symbol 'inbits'.

vim +637 lib/dynamic_debug.c

b354c51c63aa31 Jim Cromie 2021-07-28  623  =

b354c51c63aa31 Jim Cromie 2021-07-28  624  static int param_set_dyndbg_clas=
s_strings(const char *instr, const struct kernel_param *kp)
b354c51c63aa31 Jim Cromie 2021-07-28  625  {
b354c51c63aa31 Jim Cromie 2021-07-28  626  	unsigned long inbits;
b354c51c63aa31 Jim Cromie 2021-07-28  627  	int idx_rc, matches =3D 0, totc=
t =3D 0;
b354c51c63aa31 Jim Cromie 2021-07-28  628  	char query[FMT_QUERY_SIZE];
b354c51c63aa31 Jim Cromie 2021-07-28  629  	struct dyndbg_classes_param *dc=
p =3D kp->arg;
b354c51c63aa31 Jim Cromie 2021-07-28  630  	bool negate;
b354c51c63aa31 Jim Cromie 2021-07-28  631  	char *cls, *p;
b354c51c63aa31 Jim Cromie 2021-07-28  632  =

b354c51c63aa31 Jim Cromie 2021-07-28  633  	if (!dcp) {
b354c51c63aa31 Jim Cromie 2021-07-28  634  		pr_err("set_dyndbg_classes: no=
 bits=3D>queries map\n");
b354c51c63aa31 Jim Cromie 2021-07-28  635  		return -EINVAL;
b354c51c63aa31 Jim Cromie 2021-07-28  636  	}
b354c51c63aa31 Jim Cromie 2021-07-28 @637  	if (!dcp->classes) {
b354c51c63aa31 Jim Cromie 2021-07-28  638  		pr_err("module -get-classes: n=
o classes\n");
b354c51c63aa31 Jim Cromie 2021-07-28  639  		return -EINVAL;
b354c51c63aa31 Jim Cromie 2021-07-28  640  	}
b354c51c63aa31 Jim Cromie 2021-07-28  641  	cls =3D kstrdup(instr, GFP_KERN=
EL);
b354c51c63aa31 Jim Cromie 2021-07-28  642  =

b354c51c63aa31 Jim Cromie 2021-07-28  643  	for (p =3D strchr(cls, ','); cl=
s; cls =3D strchr(p, ',')) {
b354c51c63aa31 Jim Cromie 2021-07-28  644  		if (p)
b354c51c63aa31 Jim Cromie 2021-07-28  645  			*p++ =3D 0; /* chop and advan=
ce on comma */
b354c51c63aa31 Jim Cromie 2021-07-28  646  		if (*cls =3D=3D '!') {
b354c51c63aa31 Jim Cromie 2021-07-28  647  			negate =3D true;
b354c51c63aa31 Jim Cromie 2021-07-28  648  			cls++;
b354c51c63aa31 Jim Cromie 2021-07-28  649  		} else if (*(p - 1) =3D=3D '!'=
) {
b354c51c63aa31 Jim Cromie 2021-07-28  650  			negate =3D true;
b354c51c63aa31 Jim Cromie 2021-07-28  651  			*(p - 1) =3D '0';
b354c51c63aa31 Jim Cromie 2021-07-28  652  		}
b354c51c63aa31 Jim Cromie 2021-07-28  653  		idx_rc =3D match_string(dcp->c=
lasses, _DPRINTK_CLASS_DFLT, cls);
b354c51c63aa31 Jim Cromie 2021-07-28  654  		if (idx_rc < 0) {
b354c51c63aa31 Jim Cromie 2021-07-28  655  			pr_err("%s not found for modu=
le: %s\n", cls, KP_MOD_NAME);
b354c51c63aa31 Jim Cromie 2021-07-28  656  			return idx_rc;
b354c51c63aa31 Jim Cromie 2021-07-28  657  		}
b354c51c63aa31 Jim Cromie 2021-07-28 @658  		if (negate =3D=3D test_bit(idx=
_rc, dcp->bits))
b354c51c63aa31 Jim Cromie 2021-07-28  659  			continue;
b354c51c63aa31 Jim Cromie 2021-07-28  660  =

b354c51c63aa31 Jim Cromie 2021-07-28  661  		snprintf(query, FMT_QUERY_SIZE=
, "class %s %c%s",
b354c51c63aa31 Jim Cromie 2021-07-28  662  			 cls, !!negate ? '-' : '+', d=
cp->flags);
b354c51c63aa31 Jim Cromie 2021-07-28  663  =

b354c51c63aa31 Jim Cromie 2021-07-28  664  		matches =3D ddebug_exec_querie=
s(query, KP_MOD_NAME);
b354c51c63aa31 Jim Cromie 2021-07-28  665  =

b354c51c63aa31 Jim Cromie 2021-07-28  666  		v2pr_info("%d matches on class=
:%s\n", matches, cls);
b354c51c63aa31 Jim Cromie 2021-07-28  667  		totct +=3D matches;
b354c51c63aa31 Jim Cromie 2021-07-28  668  	}
b354c51c63aa31 Jim Cromie 2021-07-28 @669  	*dcp->bits =3D inbits;
b354c51c63aa31 Jim Cromie 2021-07-28  670  	vpr_info("total matches: %d\n",=
 totct);
b354c51c63aa31 Jim Cromie 2021-07-28  671  	return 0;
b354c51c63aa31 Jim Cromie 2021-07-28  672  }
b354c51c63aa31 Jim Cromie 2021-07-28  673  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6707123159215143172==--

