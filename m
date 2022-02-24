Content-Type: multipart/mixed; boundary="===============8432257178330860916=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [jimc:dd-diet-6b 39/42] lib/dynamic_debug.c:1389:4: warning: The expression is an uninitialized value. The computed value will also be garbage [clang-analyzer-core.uninitialized.Assign]
Date: Fri, 25 Feb 2022 03:10:02 +0800
Message-ID: <202202250102.bJ81aMEh-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8432257178330860916==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: Jim Cromie <jim.cromie@gmail.com>

tree:   https://github.com/jimc/linux.git dd-diet-6b
head:   636668612180e545a9c1ebd3c1a844c646126611
commit: c795f2e561d3cd9d733860d2a7b2b73cc81c1617 [39/42] dyndbg: detect rep=
eated site recs in add_module
:::::: branch date: 35 hours ago
:::::: commit date: 35 hours ago
config: riscv-randconfig-c006-20220224 (https://download.01.org/0day-ci/arc=
hive/20220225/202202250102.bJ81aMEh-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc=
04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/jimc/linux/commit/c795f2e561d3cd9d733860d2a7b2=
b73cc81c1617
        git remote add jimc https://github.com/jimc/linux.git
        git fetch --no-tags jimc dd-diet-6b
        git checkout c795f2e561d3cd9d733860d2a7b2b73cc81c1617
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   fs/ocfs2/reservations.c:443:2: note: Taking true branch
           if (best_len =3D=3D 0)
           ^
   fs/ocfs2/reservations.c:444:3: note: Returning without writing to '*rsta=
rt'
                   return 0;
                   ^
   fs/ocfs2/reservations.c:589:10: note: Returning from 'ocfs2_resmap_find_=
free_bits'
                   clen =3D ocfs2_resmap_find_free_bits(resmap, wanted, gap=
_start,
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   fs/ocfs2/reservations.c:591:7: note: Assuming 'clen' is equal to 'wanted'
                   if (clen =3D=3D wanted) {
                       ^~~~~~~~~~~~~~
   fs/ocfs2/reservations.c:591:3: note: Taking true branch
                   if (clen =3D=3D wanted) {
                   ^
   fs/ocfs2/reservations.c:593:15: note: Assigned value is garbage or undef=
ined
                           best_start =3D cstart;
                                      ^ ~~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   lib/oid_registry.c:149:3: warning: Value stored to 'num' is never read [=
clang-analyzer-deadcode.DeadStores]
                   num =3D 0;
                   ^     ~
   lib/oid_registry.c:149:3: note: Value stored to 'num' is never read
                   num =3D 0;
                   ^     ~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
>> lib/dynamic_debug.c:1389:4: warning: The expression is an uninitialized =
value. The computed value will also be garbage [clang-analyzer-core.uniniti=
alized.Assign]
                           mod_ct++;
                           ^~~~~~
   lib/dynamic_debug.c:1356:26: note: 'mod_ct' declared without an initial =
value
           int entries, mod_sites, mod_ct, site_base;
                                   ^~~~~~
   lib/dynamic_debug.c:1360:2: note: Taking false branch
           if (&__start___dyndbg =3D=3D &__stop___dyndbg) {
           ^
   lib/dynamic_debug.c:1375:2: note: Loop condition is true.  Entering loop=
 body
           for (; iter < __stop___dyndbg; iter++, site++, entries++, mod_si=
tes++) {
           ^
   lib/dynamic_debug.c:1382:7: note: Assuming 'site' is not equal to field =
'site'
                   if (site !=3D iter->site) {
                       ^~~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:1382:3: note: Taking true branch
                   if (site !=3D iter->site) {
                   ^
   lib/dynamic_debug.c:1383:4: note: Assuming 'verbose' is < 3
                           v3pr_info(" skew change: %ld\n", (long)(iter->si=
te - site));
                           ^
   lib/dynamic_debug.c:132:29: note: expanded from macro 'v3pr_info'
   #define v3pr_info(fmt, ...)     vnpr_info(3, fmt, ##__VA_ARGS__)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:126:6: note: expanded from macro 'vnpr_info'
           if (verbose >=3D lvl)                                     \
               ^~~~~~~~~~~~~~
   lib/dynamic_debug.c:1383:4: note: Taking false branch
                           v3pr_info(" skew change: %ld\n", (long)(iter->si=
te - site));
                           ^
   lib/dynamic_debug.c:132:29: note: expanded from macro 'v3pr_info'
   #define v3pr_info(fmt, ...)     vnpr_info(3, fmt, ##__VA_ARGS__)
                                   ^
   lib/dynamic_debug.c:126:2: note: expanded from macro 'vnpr_info'
           if (verbose >=3D lvl)                                     \
           ^
   lib/dynamic_debug.c:1383:4: note: Loop condition is false.  Exiting loop
                           v3pr_info(" skew change: %ld\n", (long)(iter->si=
te - site));
                           ^
   lib/dynamic_debug.c:132:29: note: expanded from macro 'v3pr_info'
   #define v3pr_info(fmt, ...)     vnpr_info(3, fmt, ##__VA_ARGS__)
                                   ^
   lib/dynamic_debug.c:124:37: note: expanded from macro 'vnpr_info'
   #define vnpr_info(lvl, fmt, ...)                                \
                                                                   ^
   lib/dynamic_debug.c:1388:7: note: Assuming the condition is true
                   if (strcmp(modname, site->_modname)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:1388:3: note: Taking true branch
                   if (strcmp(modname, site->_modname)) {
                   ^
   lib/dynamic_debug.c:1389:4: note: The expression is an uninitialized val=
ue. The computed value will also be garbage
                           mod_ct++;
                           ^~~~~~
   lib/dynamic_debug.c:1411:35: warning: The left operand of '*' is a garba=
ge value [clang-analyzer-core.UndefinedBinaryOperatorResult]
                    entries, mod_ct, (int)((mod_ct * sizeof(struct ddebug_t=
able)) >> 10),
                                                   ^
   lib/dynamic_debug.c:130:48: note: expanded from macro 'vpr_info'
   #define vpr_info(fmt, ...)      vnpr_info(1, fmt, ##__VA_ARGS__)
                                                       ^~~~~~~~~~~
   lib/dynamic_debug.c:127:18: note: expanded from macro 'vnpr_info'
                   pr_info(fmt, ##__VA_ARGS__);                    \
                                  ^~~~~~~~~~~
   include/linux/printk.h:519:34: note: expanded from macro 'pr_info'
           printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
                                           ^~~~~~~~~~~
   include/linux/printk.h:446:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                              ^~~~~~~~~~~
   include/linux/printk.h:418:19: note: expanded from macro 'printk_index_w=
rap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                                   ^~~~~~~~~~~
   lib/dynamic_debug.c:1356:26: note: 'mod_ct' declared without an initial =
value
           int entries, mod_sites, mod_ct, site_base;
                                   ^~~~~~
   lib/dynamic_debug.c:1360:2: note: Taking false branch
           if (&__start___dyndbg =3D=3D &__stop___dyndbg) {
           ^
   lib/dynamic_debug.c:1375:2: note: Loop condition is false. Execution con=
tinues on line 1403
           for (; iter < __stop___dyndbg; iter++, site++, entries++, mod_si=
tes++) {
           ^
   lib/dynamic_debug.c:1406:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   lib/dynamic_debug.c:1406:2: note: Taking false branch
           if (ret)
           ^
   lib/dynamic_debug.c:1410:2: note: Assuming 'verbose' is >=3D 1
           vpr_info("%d prdebugs in %d modules, %d KiB in ddebug tables, %d=
 kiB in __dyndbg section\n",
           ^
   lib/dynamic_debug.c:130:28: note: expanded from macro 'vpr_info'
   #define vpr_info(fmt, ...)      vnpr_info(1, fmt, ##__VA_ARGS__)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:126:6: note: expanded from macro 'vnpr_info'
           if (verbose >=3D lvl)                                     \
               ^~~~~~~~~~~~~~
   lib/dynamic_debug.c:1410:2: note: Taking true branch
           vpr_info("%d prdebugs in %d modules, %d KiB in ddebug tables, %d=
 kiB in __dyndbg section\n",
           ^
   lib/dynamic_debug.c:130:28: note: expanded from macro 'vpr_info'
   #define vpr_info(fmt, ...)      vnpr_info(1, fmt, ##__VA_ARGS__)

vim +1389 lib/dynamic_debug.c

6a5c083de2f5fb Thomas Renninger  2010-08-06  1348  =

6a5c083de2f5fb Thomas Renninger  2010-08-06  1349  static int __init dynami=
c_debug_init(void)
6a5c083de2f5fb Thomas Renninger  2010-08-06  1350  {
f3fd9c3d013cf5 Jim Cromie        2022-02-19  1351  	struct _ddebug *iter, *=
iter_mod_start;
8ac021f1993474 Jim Cromie        2022-02-19  1352  	struct _ddebug_site *si=
te, *site_mod_start;
0312cd7c5bb3f3 Jim Cromie        2022-02-19  1353  	const char *modname;
b48420c1d3019c Jim Cromie        2012-04-27  1354  	char *cmdline;
f05b8cdbefa3db Jim Cromie        2022-02-19  1355  	int ret;
c795f2e561d3cd Jim Cromie        2021-05-18  1356  	int entries, mod_sites,=
 mod_ct, site_base;
f65612cd91317b Jim Cromie        2022-02-19  1357  	int skew =3D 0;
8dbbb1641cb4b3 Jim Cromie        2020-12-23  1358  	int mod_index =3D 0;
6a5c083de2f5fb Thomas Renninger  2010-08-06  1359  =

e5ebffe18e5add Jim Cromie        2020-07-19  1360  	if (&__start___dyndbg =
=3D=3D &__stop___dyndbg) {
ceabef7dd71720 Orson Zhai        2020-06-07  1361  		if (IS_ENABLED(CONFIG_=
DYNAMIC_DEBUG)) {
f657fd21e16e3a Joe Perches       2012-12-05  1362  			pr_warn("_ddebug tabl=
e is empty in a CONFIG_DYNAMIC_DEBUG build\n");
b5b78f83854af1 Jim Cromie        2011-12-19  1363  			return 1;
b5b78f83854af1 Jim Cromie        2011-12-19  1364  		}
ceabef7dd71720 Orson Zhai        2020-06-07  1365  		pr_info("Ignore empty =
_ddebug table in a CONFIG_DYNAMIC_DEBUG_CORE build\n");
ceabef7dd71720 Orson Zhai        2020-06-07  1366  		ddebug_init_success =
=3D 1;
ceabef7dd71720 Orson Zhai        2020-06-07  1367  		return 0;
ceabef7dd71720 Orson Zhai        2020-06-07  1368  	}
f3fd9c3d013cf5 Jim Cromie        2022-02-19  1369  =

f3fd9c3d013cf5 Jim Cromie        2022-02-19  1370  	iter =3D iter_mod_start=
 =3D __start___dyndbg;
8ac021f1993474 Jim Cromie        2022-02-19  1371  	site =3D site_mod_start=
 =3D __start___dyndbg_sites;
a5619002dc48eb Jim Cromie        2022-02-19  1372  	modname =3D site->_modn=
ame;
c795f2e561d3cd Jim Cromie        2021-05-18  1373  	entries =3D mod_sites =
=3D site_base =3D 0;
f0dc72a8714fb2 Jim Cromie        2022-02-19  1374  =

8ac021f1993474 Jim Cromie        2022-02-19  1375  	for (; iter < __stop___=
dyndbg; iter++, site++, entries++, mod_sites++) {
f65612cd91317b Jim Cromie        2022-02-19  1376  		/*
f65612cd91317b Jim Cromie        2022-02-19  1377  		 * BUG_ON didnt work h=
ere, cuz theres a slowly
f65612cd91317b Jim Cromie        2022-02-19  1378  		 * increasing skew bet=
ween the real pointer and the
f65612cd91317b Jim Cromie        2022-02-19  1379  		 * cursor, re-init to =
respect the skew (it's there),
f65612cd91317b Jim Cromie        2022-02-19  1380  		 * and to report each =
just once.
f65612cd91317b Jim Cromie        2022-02-19  1381  		 */
f65612cd91317b Jim Cromie        2022-02-19  1382  		if (site !=3D iter->si=
te) {
f65612cd91317b Jim Cromie        2022-02-19  1383  			v3pr_info(" skew chan=
ge: %ld\n", (long)(iter->site - site));
f65612cd91317b Jim Cromie        2022-02-19  1384  			skew +=3D (int)(iter-=
>site - site);
f65612cd91317b Jim Cromie        2022-02-19  1385  			site =3D iter->site;
f65612cd91317b Jim Cromie        2022-02-19  1386  		}
f0dc72a8714fb2 Jim Cromie        2022-02-19  1387  =

44b4a1ad1aa0a7 Jim Cromie        2020-12-15  1388  		if (strcmp(modname, si=
te->_modname)) {
f0dc72a8714fb2 Jim Cromie        2022-02-19 @1389  			mod_ct++;
8dbbb1641cb4b3 Jim Cromie        2020-12-23  1390  			ret =3D __ddebug_add_=
module(iter_mod_start, site_mod_start,
c795f2e561d3cd Jim Cromie        2021-05-18  1391  						  mod_sites, mod_i=
ndex, modname,
c795f2e561d3cd Jim Cromie        2021-05-18  1392  						  __start___dyndbg=
_sites, &site_base);
e9d376f0fa66bd Jason Baron       2009-02-05  1393  			if (ret)
af442399fcf378 Jim Cromie        2012-04-27  1394  				goto out_err;
1b34de4086568f Jim Cromie        2020-12-23  1395  =

a5619002dc48eb Jim Cromie        2022-02-19  1396  			modname =3D site->_mo=
dname;
f3fd9c3d013cf5 Jim Cromie        2022-02-19  1397  			iter_mod_start =3D it=
er;
8ac021f1993474 Jim Cromie        2022-02-19  1398  			site_mod_start =3D si=
te;
1b34de4086568f Jim Cromie        2020-12-23  1399  			mod_index +=3D mod_si=
tes;
1b34de4086568f Jim Cromie        2020-12-23  1400  			mod_sites =3D 0;
e9d376f0fa66bd Jason Baron       2009-02-05  1401  		}
e9d376f0fa66bd Jason Baron       2009-02-05  1402  	}
c795f2e561d3cd Jim Cromie        2021-05-18  1403  	ret =3D __ddebug_add_mo=
dule(iter_mod_start, site_mod_start,
c795f2e561d3cd Jim Cromie        2021-05-18  1404  				  mod_sites, mod_ind=
ex, modname,
c795f2e561d3cd Jim Cromie        2021-05-18  1405  				  __start___dyndbg_s=
ites, &site_base);
b5b78f83854af1 Jim Cromie        2011-12-19  1406  	if (ret)
af442399fcf378 Jim Cromie        2012-04-27  1407  		goto out_err;
a648ec05bb950f Thomas Renninger  2010-08-06  1408  =

af442399fcf378 Jim Cromie        2012-04-27  1409  	ddebug_init_success =3D=
 1;
7af5662826f7b1 Jim Cromie        2021-05-24  1410  	vpr_info("%d prdebugs i=
n %d modules, %d KiB in ddebug tables, %d kiB in __dyndbg section\n",
f0dc72a8714fb2 Jim Cromie        2022-02-19  1411  		 entries, mod_ct, (int=
)((mod_ct * sizeof(struct ddebug_table)) >> 10),
7af5662826f7b1 Jim Cromie        2021-05-24  1412  		 (int)((entries * size=
of(struct _ddebug)) >> 10));
af442399fcf378 Jim Cromie        2012-04-27  1413  =

f65612cd91317b Jim Cromie        2022-02-19  1414  	v3pr_info("counted skew=
 %d: sizes %lu vs %lu\n", skew,
f65612cd91317b Jim Cromie        2022-02-19  1415  		  (__stop___dyndbg - _=
_start___dyndbg), // sizeof(struct _ddebug),
f65612cd91317b Jim Cromie        2022-02-19  1416  		  (__stop___dyndbg_sit=
es - __start___dyndbg_sites)); // sizeof(struct _ddebug_site));
f65612cd91317b Jim Cromie        2022-02-19  1417  =

b48420c1d3019c Jim Cromie        2012-04-27  1418  	/* now that ddebug tabl=
es are loaded, process all boot args
b48420c1d3019c Jim Cromie        2012-04-27  1419  	 * again to find and ac=
tivate queries given in dyndbg params.
b48420c1d3019c Jim Cromie        2012-04-27  1420  	 * While this has alrea=
dy been done for known boot params, it
b48420c1d3019c Jim Cromie        2012-04-27  1421  	 * ignored the unknown =
ones (dyndbg in particular).  Reusing
b48420c1d3019c Jim Cromie        2012-04-27  1422  	 * parse_args avoids ad=
-hoc parsing.  This will also attempt
b48420c1d3019c Jim Cromie        2012-04-27  1423  	 * to activate queries =
for not-yet-loaded modules, which is
b48420c1d3019c Jim Cromie        2012-04-27  1424  	 * slightly noisy if ve=
rbose, but harmless.
b48420c1d3019c Jim Cromie        2012-04-27  1425  	 */
b48420c1d3019c Jim Cromie        2012-04-27  1426  	cmdline =3D kstrdup(sav=
ed_command_line, GFP_KERNEL);
b48420c1d3019c Jim Cromie        2012-04-27  1427  	parse_args("dyndbg para=
ms", cmdline, NULL,
ecc8617053e0a9 Luis R. Rodriguez 2015-03-30  1428  		   0, 0, 0, NULL, &dde=
bug_dyndbg_boot_param_cb);
b48420c1d3019c Jim Cromie        2012-04-27  1429  	kfree(cmdline);
af442399fcf378 Jim Cromie        2012-04-27  1430  	return 0;
a648ec05bb950f Thomas Renninger  2010-08-06  1431  =

af442399fcf378 Jim Cromie        2012-04-27  1432  out_err:
e9d376f0fa66bd Jason Baron       2009-02-05  1433  	ddebug_remove_all_table=
s();
e9d376f0fa66bd Jason Baron       2009-02-05  1434  	return 0;
e9d376f0fa66bd Jason Baron       2009-02-05  1435  }
6a5c083de2f5fb Thomas Renninger  2010-08-06  1436  /* Allow early initializ=
ation for boot messages via boot param */
3ec5652ab70f6e Jim Cromie        2012-04-27  1437  early_initcall(dynamic_d=
ebug_init);
b48420c1d3019c Jim Cromie        2012-04-27  1438  =


:::::: The code at line 1389 was first introduced by commit
:::::: f0dc72a8714fb25141f2a8b39dccc3fed792cdba dyndbg: rename counter vari=
ables

:::::: TO: Jim Cromie <jim.cromie@gmail.com>
:::::: CC: Jim Cromie <jim.cromie@gmail.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8432257178330860916==--

