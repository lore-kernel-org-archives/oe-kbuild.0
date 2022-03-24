Content-Type: multipart/mixed; boundary="===============2768873220558752014=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [jimc:dyndbg-next 6/7] lib/dynamic_debug.c:649:18: warning: Either the condition 'p' is redundant or there is overflow in pointer subtraction. [nullPointerArithmeticRedundantCheck]
Date: Thu, 24 Mar 2022 23:54:36 +0800
Message-ID: <202203242305.yF45ZOsR-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2768873220558752014==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: Jim Cromie <jim.cromie@gmail.com>

tree:   https://github.com/jimc/linux.git dyndbg-next
head:   e603de8993c46111c3ceeee8a8b9d5e7fa9af7cd
commit: bd35fd3540c38d57ed3f80330e0f76417a4fa9e3 [6/7] dyndbg: WIP use symb=
olic class names
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
compiler: powerpc64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> lib/dynamic_debug.c:649:18: warning: Either the condition 'p' is redunda=
nt or there is overflow in pointer subtraction. [nullPointerArithmeticRedun=
dantCheck]
     } else if (*(p - 1) =3D=3D '!') {
                    ^
   lib/dynamic_debug.c:644:7: note: Assuming that condition 'p' is not redu=
ndant
     if (p)
         ^
   lib/dynamic_debug.c:649:18: note: Null pointer subtraction
     } else if (*(p - 1) =3D=3D '!') {
                    ^
>> lib/dynamic_debug.c:626:16: warning: Variable 'inbits' is not assigned a=
 value. [unassignedVariable]
    unsigned long inbits;
                  ^
>> lib/dynamic_debug.c:669:15: warning: Uninitialized variable: inbits [uni=
nitvar]
    *dcp->bits =3D inbits;
                 ^

vim +/p +649 lib/dynamic_debug.c

bd35fd3540c38d Jim Cromie 2022-03-21  623  =

bd35fd3540c38d Jim Cromie 2022-03-21  624  static int param_set_dyndbg_clas=
ses(const char *instr, const struct kernel_param *kp)
bd35fd3540c38d Jim Cromie 2022-03-21  625  {
bd35fd3540c38d Jim Cromie 2022-03-21 @626  	unsigned long inbits;
bd35fd3540c38d Jim Cromie 2022-03-21  627  	int idx_rc, matches =3D 0, totc=
t =3D 0;
bd35fd3540c38d Jim Cromie 2022-03-21  628  	char query[FMT_QUERY_SIZE];
bd35fd3540c38d Jim Cromie 2022-03-21  629  	struct dyndbg_classbits_param *=
dcp =3D kp->arg;
bd35fd3540c38d Jim Cromie 2022-03-21  630  	bool negate;
bd35fd3540c38d Jim Cromie 2022-03-21  631  	char *cls, *p;
bd35fd3540c38d Jim Cromie 2022-03-21  632  =

bd35fd3540c38d Jim Cromie 2022-03-21  633  	if (!dcp) {
bd35fd3540c38d Jim Cromie 2022-03-21  634  		pr_err("set_dyndbg_classbits: =
no bits=3D>queries map\n");
bd35fd3540c38d Jim Cromie 2022-03-21  635  		return -EINVAL;
bd35fd3540c38d Jim Cromie 2022-03-21  636  	}
bd35fd3540c38d Jim Cromie 2022-03-21  637  	if (!dcp->class_names) {
bd35fd3540c38d Jim Cromie 2022-03-21  638  		pr_err("module -get-classes: n=
o classes\n");
bd35fd3540c38d Jim Cromie 2022-03-21  639  		return -EINVAL;
bd35fd3540c38d Jim Cromie 2022-03-21  640  	}
bd35fd3540c38d Jim Cromie 2022-03-21  641  	cls =3D kstrdup(instr, GFP_KERN=
EL);
bd35fd3540c38d Jim Cromie 2022-03-21  642  =

bd35fd3540c38d Jim Cromie 2022-03-21  643  	for (p =3D strchr(cls, ','); cl=
s; cls =3D strchr(p, ',')) {
bd35fd3540c38d Jim Cromie 2022-03-21  644  		if (p)
bd35fd3540c38d Jim Cromie 2022-03-21  645  			*p++ =3D 0; /* chop and advan=
ce on comma */
bd35fd3540c38d Jim Cromie 2022-03-21  646  		if (*cls =3D=3D '!') {
bd35fd3540c38d Jim Cromie 2022-03-21  647  			negate =3D true;
bd35fd3540c38d Jim Cromie 2022-03-21  648  			cls++;
bd35fd3540c38d Jim Cromie 2022-03-21 @649  		} else if (*(p - 1) =3D=3D '!'=
) {
bd35fd3540c38d Jim Cromie 2022-03-21  650  			negate =3D true;
bd35fd3540c38d Jim Cromie 2022-03-21  651  			*(p - 1) =3D '0';
bd35fd3540c38d Jim Cromie 2022-03-21  652  		}
bd35fd3540c38d Jim Cromie 2022-03-21  653  		idx_rc =3D match_string(dcp->c=
lass_names, _DPRINTK_CLASS_DFLT, cls);
bd35fd3540c38d Jim Cromie 2022-03-21  654  		if (idx_rc < 0) {
bd35fd3540c38d Jim Cromie 2022-03-21  655  			pr_err("%s not found for modu=
le: %s\n", cls, KP_MOD_NAME);
bd35fd3540c38d Jim Cromie 2022-03-21  656  			return idx_rc;
bd35fd3540c38d Jim Cromie 2022-03-21  657  		}
bd35fd3540c38d Jim Cromie 2022-03-21  658  		if (negate =3D=3D test_bit(idx=
_rc, dcp->bits))
bd35fd3540c38d Jim Cromie 2022-03-21  659  			continue;
bd35fd3540c38d Jim Cromie 2022-03-21  660  =

bd35fd3540c38d Jim Cromie 2022-03-21  661  		snprintf(query, FMT_QUERY_SIZE=
, "class %s %c%s",
bd35fd3540c38d Jim Cromie 2022-03-21  662  			 cls, !!negate ? '-' : '+', d=
cp->flags);
bd35fd3540c38d Jim Cromie 2022-03-21  663  =

bd35fd3540c38d Jim Cromie 2022-03-21  664  		matches =3D ddebug_exec_querie=
s(query, KP_MOD_NAME);
bd35fd3540c38d Jim Cromie 2022-03-21  665  =

bd35fd3540c38d Jim Cromie 2022-03-21  666  		v2pr_info("%d matches on class=
:%s\n", matches, cls);
bd35fd3540c38d Jim Cromie 2022-03-21  667  		totct +=3D matches;
bd35fd3540c38d Jim Cromie 2022-03-21  668  	}
bd35fd3540c38d Jim Cromie 2022-03-21 @669  	*dcp->bits =3D inbits;
bd35fd3540c38d Jim Cromie 2022-03-21  670  	vpr_info("total matches: %d\n",=
 totct);
bd35fd3540c38d Jim Cromie 2022-03-21  671  	return 0;
bd35fd3540c38d Jim Cromie 2022-03-21  672  }
bd35fd3540c38d Jim Cromie 2022-03-21  673  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2768873220558752014==--

