Content-Type: multipart/mixed; boundary="===============6814982890526952756=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [jimc:dd-diet-7a 32/46] lib/dynamic_debug.c:1454:2: warning: Subtracting pointers that point to different objects [comparePointers]
Date: Tue, 19 Apr 2022 01:21:41 +0800
Message-ID: <202204190149.ZFYeXgHe-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6814982890526952756==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: Jim Cromie <jim.cromie@gmail.com>

tree:   https://github.com/jimc/linux.git dd-diet-7a
head:   210a46eb237516e01e788734db942aef8b815e6c
commit: 279c4dccf11a157e5c836d5b824e259ced9bb17a [32/46] dyndbg: refine (be=
tter understand) loop invariants
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago
compiler: arc-elf-gcc (GCC) 11.2.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 279c4dccf11a157e5c836d5b824e259ced9bb17a
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   lib/dynamic_debug.c:657:33: warning: Boolean result is used in bitwise o=
peration. Clarify expression with parentheses. [clarifyCondition]
     if (test_bit(idx_rc, &inbits) ^ !!negate) {
                                   ^
   lib/dynamic_debug.c:1162:15: warning: Local variable 'p' shadows outer a=
rgument [shadowArgument]
     char const* p =3D ddebug_class_name(iter, dp);
                 ^
   lib/dynamic_debug.c:1142:55: note: Shadowed declaration
   static int ddebug_proc_show(struct seq_file *m, void *p)
                                                         ^
   lib/dynamic_debug.c:1162:15: note: Shadow variable
     char const* p =3D ddebug_class_name(iter, dp);
                 ^
>> lib/dynamic_debug.c:1454:2: warning: Subtracting pointers that point to =
different objects [comparePointers]
    v3pr_info("counted skew %d: sizes %lu vs %lun", skew,
    ^
   lib/dynamic_debug.c:46:23: note: Variable declared here.
   extern struct _ddebug __stop___dyndbg[];
                         ^
   lib/dynamic_debug.c:1454:2: note: Array decayed to pointer here.
    v3pr_info("counted skew %d: sizes %lu vs %lun", skew,
    ^
   lib/dynamic_debug.c:45:23: note: Variable declared here.
   extern struct _ddebug __start___dyndbg[];
                         ^
   lib/dynamic_debug.c:1454:2: note: Array decayed to pointer here.
    v3pr_info("counted skew %d: sizes %lu vs %lun", skew,
    ^
   lib/dynamic_debug.c:1454:2: note: Subtracting pointers that point to dif=
ferent objects
    v3pr_info("counted skew %d: sizes %lu vs %lun", skew,
    ^
>> lib/dynamic_debug.c:1454:2: warning: Subtracting pointers that point to =
different objects [comparePointers]
    v3pr_info("counted skew %d: sizes %lu vs %lun", skew,
    ^
   lib/dynamic_debug.c:48:28: note: Variable declared here.
   extern struct _ddebug_site __stop___dyndbg_sites[];
                              ^
   lib/dynamic_debug.c:1454:2: note: Array decayed to pointer here.
    v3pr_info("counted skew %d: sizes %lu vs %lun", skew,
    ^
   lib/dynamic_debug.c:47:28: note: Variable declared here.
   extern struct _ddebug_site __start___dyndbg_sites[];
                              ^
   lib/dynamic_debug.c:1454:2: note: Array decayed to pointer here.
    v3pr_info("counted skew %d: sizes %lu vs %lun", skew,
    ^
   lib/dynamic_debug.c:1454:2: note: Subtracting pointers that point to dif=
ferent objects
    v3pr_info("counted skew %d: sizes %lu vs %lun", skew,
    ^
   lib/dynamic_debug.c:1093:60: warning: Parameter 'pos' can be declared wi=
th const [constParameter]
   static void *ddebug_proc_start(struct seq_file *m, loff_t *pos)
                                                              ^
   lib/dynamic_debug.c:1116:57: warning: Parameter 'p' can be declared with=
 const [constParameter]
   static void *ddebug_proc_next(struct seq_file *m, void *p, loff_t *pos)
                                                           ^
   lib/dynamic_debug.c:190:13: warning: Uninitialized variable: dt->classes=
 [uninitvar]
      if (!dt->classes)
               ^
   lib/dynamic_debug.c:176:21: note: Assuming condition is false
     if (query->module &&
                       ^
   lib/dynamic_debug.c:190:13: note: Uninitialized variable: dt->classes
      if (!dt->classes)
               ^
   lib/dynamic_debug.c:1238:20: warning: Uninitialized variable: dt->mod_na=
me [uninitvar]
      if (!strcmp(dt->mod_name, map->mod_name)) {
                      ^
   lib/dynamic_debug.c:1344:11: warning: Uninitialized variable: dt->mod_na=
me [uninitvar]
     if (dt->mod_name =3D=3D mod_name) {
             ^
   lib/dynamic_debug.c:1227:12: warning: Uninitialized variable: dt->mod_na=
me [uninitvar]
      if (dt->mod_name =3D=3D map->mod->name) {
              ^
   lib/dynamic_debug.c:111:12: warning: Using argument fb that points at un=
initialized variable flags [ctuuninitvar]
    char *p =3D fb->buf;
              ^
   lib/dynamic_debug.c:1157:27: note: Calling function ddebug_describe_flag=
s, 2nd argument is uninitialized
        ddebug_describe_flags(dp->flags, &flags));
                             ^
   lib/dynamic_debug.c:111:12: note: Using argument fb
    char *p =3D fb->buf;
              ^

vim +1454 lib/dynamic_debug.c

6a5c083de2f5fb Thomas Renninger  2010-08-06  1392  =

6a5c083de2f5fb Thomas Renninger  2010-08-06  1393  static int __init dynami=
c_debug_init(void)
6a5c083de2f5fb Thomas Renninger  2010-08-06  1394  {
f7c47ff9b92986 Jim Cromie        2022-02-19  1395  	struct _ddebug *iter, *=
iter_mod_start;
1f87159f2e01a7 Jim Cromie        2022-02-19  1396  	struct _ddebug_site *si=
te, *site_mod_start;
0f198609be5581 Jim Cromie        2022-02-19  1397  	const char *modname;
b48420c1d3019c Jim Cromie        2012-04-27  1398  	char *cmdline;
85fd794b7d2e51 Jim Cromie        2022-02-19  1399  	int ret;
235cbd89480d19 Jim Cromie        2022-02-19  1400  	int entries, mod_sites,=
 mod_ct;
279c4dccf11a15 Jim Cromie        2022-02-19  1401  	int skew =3D 0;
6a5c083de2f5fb Thomas Renninger  2010-08-06  1402  =

e5ebffe18e5add Jim Cromie        2020-07-19  1403  	if (&__start___dyndbg =
=3D=3D &__stop___dyndbg) {
ceabef7dd71720 Orson Zhai        2020-06-07  1404  		if (IS_ENABLED(CONFIG_=
DYNAMIC_DEBUG)) {
f657fd21e16e3a Joe Perches       2012-12-05  1405  			pr_warn("_ddebug tabl=
e is empty in a CONFIG_DYNAMIC_DEBUG build\n");
b5b78f83854af1 Jim Cromie        2011-12-19  1406  			return 1;
b5b78f83854af1 Jim Cromie        2011-12-19  1407  		}
ceabef7dd71720 Orson Zhai        2020-06-07  1408  		pr_info("Ignore empty =
_ddebug table in a CONFIG_DYNAMIC_DEBUG_CORE build\n");
ceabef7dd71720 Orson Zhai        2020-06-07  1409  		ddebug_init_success =
=3D 1;
ceabef7dd71720 Orson Zhai        2020-06-07  1410  		return 0;
ceabef7dd71720 Orson Zhai        2020-06-07  1411  	}
f7c47ff9b92986 Jim Cromie        2022-02-19  1412  =

f7c47ff9b92986 Jim Cromie        2022-02-19  1413  	iter =3D iter_mod_start=
 =3D __start___dyndbg;
1f87159f2e01a7 Jim Cromie        2022-02-19  1414  	site =3D site_mod_start=
 =3D __start___dyndbg_sites;
29fd557638a5b6 Jim Cromie        2020-07-27  1415  	modname =3D iter->site-=
>_modname;
1f87159f2e01a7 Jim Cromie        2022-02-19  1416  	entries =3D mod_sites =
=3D mod_ct =3D 0;
235cbd89480d19 Jim Cromie        2022-02-19  1417  =

1f87159f2e01a7 Jim Cromie        2022-02-19  1418  	for (; iter < __stop___=
dyndbg; iter++, site++, entries++, mod_sites++) {
279c4dccf11a15 Jim Cromie        2022-02-19  1419  		/*
279c4dccf11a15 Jim Cromie        2022-02-19  1420  		 * BUG_ON didnt work h=
ere, cuz theres a slowly
279c4dccf11a15 Jim Cromie        2022-02-19  1421  		 * increasing skew bet=
ween the real pointer and the
279c4dccf11a15 Jim Cromie        2022-02-19  1422  		 * cursor, re-init to =
respect the skew (it's there),
279c4dccf11a15 Jim Cromie        2022-02-19  1423  		 * and to report each =
just once.
279c4dccf11a15 Jim Cromie        2022-02-19  1424  		 */
279c4dccf11a15 Jim Cromie        2022-02-19  1425  		if (site !=3D iter->si=
te) {
279c4dccf11a15 Jim Cromie        2022-02-19  1426  			v3pr_info(" skew chan=
ge: %ld at %d on %s.%s.%d\n",
279c4dccf11a15 Jim Cromie        2022-02-19  1427  				  (long)(iter->site =
- site), entries,
279c4dccf11a15 Jim Cromie        2022-02-19  1428  				  iter->site->_modna=
me, iter->site->_function, iter->lineno
279c4dccf11a15 Jim Cromie        2022-02-19  1429  				);
279c4dccf11a15 Jim Cromie        2022-02-19  1430  			skew +=3D (int)(iter-=
>site - site);
279c4dccf11a15 Jim Cromie        2022-02-19  1431  			site =3D iter->site;
279c4dccf11a15 Jim Cromie        2022-02-19  1432  		}
235cbd89480d19 Jim Cromie        2022-02-19  1433  =

29fd557638a5b6 Jim Cromie        2020-07-27  1434  		if (strcmp(modname, it=
er->site->_modname)) {
235cbd89480d19 Jim Cromie        2022-02-19  1435  			mod_ct++;
f7c47ff9b92986 Jim Cromie        2022-02-19  1436  			ret =3D ddebug_add_mo=
dule(iter_mod_start, mod_sites, modname);
e9d376f0fa66bd Jason Baron       2009-02-05  1437  			if (ret)
af442399fcf378 Jim Cromie        2012-04-27  1438  				goto out_err;
235cbd89480d19 Jim Cromie        2022-02-19  1439  			mod_sites =3D 0;
29fd557638a5b6 Jim Cromie        2020-07-27  1440  			modname =3D iter->sit=
e->_modname;
f7c47ff9b92986 Jim Cromie        2022-02-19  1441  			iter_mod_start =3D it=
er;
1f87159f2e01a7 Jim Cromie        2022-02-19  1442  			site_mod_start =3D si=
te;
e9d376f0fa66bd Jason Baron       2009-02-05  1443  		}
e9d376f0fa66bd Jason Baron       2009-02-05  1444  	}
f7c47ff9b92986 Jim Cromie        2022-02-19  1445  	ret =3D ddebug_add_modu=
le(iter_mod_start, mod_sites, modname);
b5b78f83854af1 Jim Cromie        2011-12-19  1446  	if (ret)
af442399fcf378 Jim Cromie        2012-04-27  1447  		goto out_err;
a648ec05bb950f Thomas Renninger  2010-08-06  1448  =

af442399fcf378 Jim Cromie        2012-04-27  1449  	ddebug_init_success =3D=
 1;
7af5662826f7b1 Jim Cromie        2021-05-24  1450  	vpr_info("%d prdebugs i=
n %d modules, %d KiB in ddebug tables, %d kiB in __dyndbg section\n",
235cbd89480d19 Jim Cromie        2022-02-19  1451  		 entries, mod_ct, (int=
)((mod_ct * sizeof(struct ddebug_table)) >> 10),
7af5662826f7b1 Jim Cromie        2021-05-24  1452  		 (int)((entries * size=
of(struct _ddebug)) >> 10));
af442399fcf378 Jim Cromie        2012-04-27  1453  =

279c4dccf11a15 Jim Cromie        2022-02-19 @1454  	v3pr_info("counted skew=
 %d: sizes %lu vs %lu\n", skew,
279c4dccf11a15 Jim Cromie        2022-02-19  1455  		  (__stop___dyndbg	 - =
__start___dyndbg),
279c4dccf11a15 Jim Cromie        2022-02-19  1456  		  (__stop___dyndbg_sit=
es - __start___dyndbg_sites));
279c4dccf11a15 Jim Cromie        2022-02-19  1457  =

b48420c1d3019c Jim Cromie        2012-04-27  1458  	/* now that ddebug tabl=
es are loaded, process all boot args
b48420c1d3019c Jim Cromie        2012-04-27  1459  	 * again to find and ac=
tivate queries given in dyndbg params.
b48420c1d3019c Jim Cromie        2012-04-27  1460  	 * While this has alrea=
dy been done for known boot params, it
b48420c1d3019c Jim Cromie        2012-04-27  1461  	 * ignored the unknown =
ones (dyndbg in particular).  Reusing
b48420c1d3019c Jim Cromie        2012-04-27  1462  	 * parse_args avoids ad=
-hoc parsing.  This will also attempt
b48420c1d3019c Jim Cromie        2012-04-27  1463  	 * to activate queries =
for not-yet-loaded modules, which is
b48420c1d3019c Jim Cromie        2012-04-27  1464  	 * slightly noisy if ve=
rbose, but harmless.
b48420c1d3019c Jim Cromie        2012-04-27  1465  	 */
b48420c1d3019c Jim Cromie        2012-04-27  1466  	cmdline =3D kstrdup(sav=
ed_command_line, GFP_KERNEL);
b48420c1d3019c Jim Cromie        2012-04-27  1467  	parse_args("dyndbg para=
ms", cmdline, NULL,
ecc8617053e0a9 Luis R. Rodriguez 2015-03-30  1468  		   0, 0, 0, NULL, &dde=
bug_dyndbg_boot_param_cb);
b48420c1d3019c Jim Cromie        2012-04-27  1469  	kfree(cmdline);
af442399fcf378 Jim Cromie        2012-04-27  1470  	return 0;
a648ec05bb950f Thomas Renninger  2010-08-06  1471  =

af442399fcf378 Jim Cromie        2012-04-27  1472  out_err:
e9d376f0fa66bd Jason Baron       2009-02-05  1473  	ddebug_remove_all_table=
s();
e9d376f0fa66bd Jason Baron       2009-02-05  1474  	return 0;
e9d376f0fa66bd Jason Baron       2009-02-05  1475  }
6a5c083de2f5fb Thomas Renninger  2010-08-06  1476  /* Allow early initializ=
ation for boot messages via boot param */
3ec5652ab70f6e Jim Cromie        2012-04-27  1477  early_initcall(dynamic_d=
ebug_init);
b48420c1d3019c Jim Cromie        2012-04-27  1478  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6814982890526952756==--

