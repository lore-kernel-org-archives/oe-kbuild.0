Content-Type: multipart/mixed; boundary="===============5103785534406576691=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [jimc:ddn3j 13/21] lib/dynamic_debug.c:1070:44: warning: Subtracting pointers that point to different objects [comparePointers]
Date: Sun, 10 Jul 2022 22:35:41 +0800
Message-ID: <202207102258.SscySmlD-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5103785534406576691==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: lib/dynam=
ic_debug.c:1070:44: warning: Subtracting pointers that point to different o=
bjects [comparePointers]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: Jim Cromie <jim.cromie@gmail.com>

tree:   https://github.com/jimc/linux.git ddn3j
head:   717a666bd3fa45056435727f971badceaaebbed0
commit: 97c4bd16cf4cf6a091996f8e5b2d4af84697c7d4 [13/21] kernel/module: add=
 __dyndbg_classes section
:::::: branch date: 13 days ago
:::::: commit date: 3 weeks ago
compiler: s390-linux-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 97c4bd16cf4cf6a091996f8e5b2d4af84697c7d4
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> lib/dynamic_debug.c:1070:44: warning: Subtracting pointers that point to=
 different objects [comparePointers]
    int num_classes =3D __stop___dyndbg_classes - __start___dyndbg_classes;
                                              ^
   lib/dynamic_debug.c:45:32: note: Variable declared here.
   extern struct ddebug_class_map __stop___dyndbg_classes[];
                                  ^
   lib/dynamic_debug.c:1070:20: note: Array decayed to pointer here.
    int num_classes =3D __stop___dyndbg_classes - __start___dyndbg_classes;
                      ^
   lib/dynamic_debug.c:44:32: note: Variable declared here.
   extern struct ddebug_class_map __start___dyndbg_classes[];
                                  ^
   lib/dynamic_debug.c:1070:46: note: Array decayed to pointer here.
    int num_classes =3D __stop___dyndbg_classes - __start___dyndbg_classes;
                                                ^
   lib/dynamic_debug.c:1070:44: note: Subtracting pointers that point to di=
fferent objects
    int num_classes =3D __stop___dyndbg_classes - __start___dyndbg_classes;
                                              ^
   lib/dynamic_debug.c:1084:14: warning: Comparing pointers that point to d=
ifferent objects [comparePointers]
    for (; iter < __stop___dyndbg; iter++) {
                ^
   lib/dynamic_debug.c:42:23: note: Variable declared here.
   extern struct _ddebug __start___dyndbg[];
                         ^
   lib/dynamic_debug.c:1081:9: note: Array decayed to pointer here.
    iter =3D __start___dyndbg;
           ^
   lib/dynamic_debug.c:43:23: note: Variable declared here.
   extern struct _ddebug __stop___dyndbg[];
                         ^
   lib/dynamic_debug.c:1084:16: note: Array decayed to pointer here.
    for (; iter < __stop___dyndbg; iter++) {
                  ^
   lib/dynamic_debug.c:1084:14: note: Comparing pointers that point to diff=
erent objects
    for (; iter < __stop___dyndbg; iter++) {
                ^
   lib/dynamic_debug.c:821:60: warning: Parameter 'pos' can be declared wit=
h const [constParameter]
   static void *ddebug_proc_start(struct seq_file *m, loff_t *pos)
                                                              ^
   lib/dynamic_debug.c:844:57: warning: Parameter 'p' can be declared with =
const [constParameter]
   static void *ddebug_proc_next(struct seq_file *m, void *p, loff_t *pos)
                                                           ^
   lib/dynamic_debug.c:172:23: warning: Uninitialized variable: dt->num_dde=
bugs [uninitvar]
     for (i =3D 0; i < dt->num_ddebugs; i++) {
                         ^
   lib/dynamic_debug.c:168:21: note: Assuming condition is false
     if (query->module &&
                       ^
   lib/dynamic_debug.c:172:23: note: Uninitialized variable: dt->num_ddebugs
     for (i =3D 0; i < dt->num_ddebugs; i++) {
                         ^
>> lib/dynamic_debug.c:1014:11: warning: Uninitialized variable: dt->mod_na=
me [uninitvar]
     if (dt->mod_name =3D=3D mod_name) {
             ^
>> lib/dynamic_debug.c:104:12: warning: Using argument fb that points at un=
initialized variable flags [ctuuninitvar]
    char *p =3D fb->buf;
              ^
   lib/dynamic_debug.c:878:27: note: Calling function ddebug_describe_flags=
, 2nd argument is uninitialized
        ddebug_describe_flags(dp->flags, &flags));
                             ^
   lib/dynamic_debug.c:104:12: note: Using argument fb
    char *p =3D fb->buf;
              ^

vim +1070 lib/dynamic_debug.c

e9d376f0fa66bd Jason Baron        2009-02-05  1002  =

e9d376f0fa66bd Jason Baron        2009-02-05  1003  /*
e9d376f0fa66bd Jason Baron        2009-02-05  1004   * Called in response t=
o a module being unloaded.  Removes
e9d376f0fa66bd Jason Baron        2009-02-05  1005   * any ddebug_table's w=
hich point at the module.
e9d376f0fa66bd Jason Baron        2009-02-05  1006   */
ff49d74ad383f5 Yehuda Sadeh       2010-07-03  1007  int ddebug_remove_modul=
e(const char *mod_name)
e9d376f0fa66bd Jason Baron        2009-02-05  1008  {
e9d376f0fa66bd Jason Baron        2009-02-05  1009  	struct ddebug_table *d=
t, *nextdt;
e9d376f0fa66bd Jason Baron        2009-02-05  1010  	int ret =3D -ENOENT;
e9d376f0fa66bd Jason Baron        2009-02-05  1011  =

e9d376f0fa66bd Jason Baron        2009-02-05  1012  	mutex_lock(&ddebug_loc=
k);
e9d376f0fa66bd Jason Baron        2009-02-05  1013  	list_for_each_entry_sa=
fe(dt, nextdt, &ddebug_tables, link) {
4573fe15437c90 Rasmus Villemoes   2019-03-07 @1014  		if (dt->mod_name =3D=
=3D mod_name) {
e9d376f0fa66bd Jason Baron        2009-02-05  1015  			ddebug_table_free(dt=
);
e9d376f0fa66bd Jason Baron        2009-02-05  1016  			ret =3D 0;
4573fe15437c90 Rasmus Villemoes   2019-03-07  1017  			break;
e9d376f0fa66bd Jason Baron        2009-02-05  1018  		}
e9d376f0fa66bd Jason Baron        2009-02-05  1019  	}
e9d376f0fa66bd Jason Baron        2009-02-05  1020  	mutex_unlock(&ddebug_l=
ock);
7a5e202dfb8ab7 Jim Cromie         2021-10-13  1021  	if (!ret)
7a5e202dfb8ab7 Jim Cromie         2021-10-13  1022  		v2pr_info("removed mo=
dule \"%s\"\n", mod_name);
e9d376f0fa66bd Jason Baron        2009-02-05  1023  	return ret;
e9d376f0fa66bd Jason Baron        2009-02-05  1024  }
e9d376f0fa66bd Jason Baron        2009-02-05  1025  =

e9d376f0fa66bd Jason Baron        2009-02-05  1026  static void ddebug_remo=
ve_all_tables(void)
e9d376f0fa66bd Jason Baron        2009-02-05  1027  {
e9d376f0fa66bd Jason Baron        2009-02-05  1028  	mutex_lock(&ddebug_loc=
k);
e9d376f0fa66bd Jason Baron        2009-02-05  1029  	while (!list_empty(&dd=
ebug_tables)) {
e9d376f0fa66bd Jason Baron        2009-02-05  1030  		struct ddebug_table *=
dt =3D list_entry(ddebug_tables.next,
e9d376f0fa66bd Jason Baron        2009-02-05  1031  						      struct ddeb=
ug_table,
e9d376f0fa66bd Jason Baron        2009-02-05  1032  						      link);
e9d376f0fa66bd Jason Baron        2009-02-05  1033  		ddebug_table_free(dt);
e9d376f0fa66bd Jason Baron        2009-02-05  1034  	}
e9d376f0fa66bd Jason Baron        2009-02-05  1035  	mutex_unlock(&ddebug_l=
ock);
e9d376f0fa66bd Jason Baron        2009-02-05  1036  }
e9d376f0fa66bd Jason Baron        2009-02-05  1037  =

6a5c083de2f5fb Thomas Renninger   2010-08-06  1038  static __initdata int d=
debug_init_success;
6a5c083de2f5fb Thomas Renninger   2010-08-06  1039  =

239a5791ffd555 Greg Kroah-Hartman 2020-02-10  1040  static int __init dynam=
ic_debug_init_control(void)
e9d376f0fa66bd Jason Baron        2009-02-05  1041  {
239a5791ffd555 Greg Kroah-Hartman 2020-02-10  1042  	struct proc_dir_entry =
*procfs_dir;
239a5791ffd555 Greg Kroah-Hartman 2020-02-10  1043  	struct dentry *debugfs=
_dir;
6a5c083de2f5fb Thomas Renninger   2010-08-06  1044  =

6a5c083de2f5fb Thomas Renninger   2010-08-06  1045  	if (!ddebug_init_succe=
ss)
6a5c083de2f5fb Thomas Renninger   2010-08-06  1046  		return -ENODEV;
e9d376f0fa66bd Jason Baron        2009-02-05  1047  =

239a5791ffd555 Greg Kroah-Hartman 2020-02-10  1048  	/* Create the control =
file in debugfs if it is enabled */
239a5791ffd555 Greg Kroah-Hartman 2020-02-10  1049  	if (debugfs_initialize=
d()) {
239a5791ffd555 Greg Kroah-Hartman 2020-02-10  1050  		debugfs_dir =3D debug=
fs_create_dir("dynamic_debug", NULL);
239a5791ffd555 Greg Kroah-Hartman 2020-02-10  1051  		debugfs_create_file("=
control", 0644, debugfs_dir, NULL,
239a5791ffd555 Greg Kroah-Hartman 2020-02-10  1052  				    &ddebug_proc_fo=
ps);
239a5791ffd555 Greg Kroah-Hartman 2020-02-10  1053  	}
239a5791ffd555 Greg Kroah-Hartman 2020-02-10  1054  =

239a5791ffd555 Greg Kroah-Hartman 2020-02-10  1055  	/* Also create the con=
trol file in procfs */
239a5791ffd555 Greg Kroah-Hartman 2020-02-10  1056  	procfs_dir =3D proc_mk=
dir("dynamic_debug", NULL);
239a5791ffd555 Greg Kroah-Hartman 2020-02-10  1057  	if (procfs_dir)
239a5791ffd555 Greg Kroah-Hartman 2020-02-10  1058  		proc_create("control"=
, 0644, procfs_dir, &proc_fops);
9fd714cd7f4676 Greg Kroah-Hartman 2019-06-12  1059  =

6a5c083de2f5fb Thomas Renninger   2010-08-06  1060  	return 0;
6a5c083de2f5fb Thomas Renninger   2010-08-06  1061  }
6a5c083de2f5fb Thomas Renninger   2010-08-06  1062  =

6a5c083de2f5fb Thomas Renninger   2010-08-06  1063  static int __init dynam=
ic_debug_init(void)
6a5c083de2f5fb Thomas Renninger   2010-08-06  1064  {
6a5c083de2f5fb Thomas Renninger   2010-08-06  1065  	struct _ddebug *iter, =
*iter_start;
6a5c083de2f5fb Thomas Renninger   2010-08-06  1066  	const char *modname =
=3D NULL;
b48420c1d3019c Jim Cromie         2012-04-27  1067  	char *cmdline;
6a5c083de2f5fb Thomas Renninger   2010-08-06  1068  	int ret =3D 0;
4107692760db81 Jim Cromie         2012-04-27  1069  	int n =3D 0, entries =
=3D 0, modct =3D 0;
97c4bd16cf4cf6 Jim Cromie         2022-06-01 @1070  	int num_classes =3D __=
stop___dyndbg_classes - __start___dyndbg_classes;
6a5c083de2f5fb Thomas Renninger   2010-08-06  1071  =

e5ebffe18e5add Jim Cromie         2020-07-19  1072  	if (&__start___dyndbg =
=3D=3D &__stop___dyndbg) {
ceabef7dd71720 Orson Zhai         2020-06-07  1073  		if (IS_ENABLED(CONFIG=
_DYNAMIC_DEBUG)) {
f657fd21e16e3a Joe Perches        2012-12-05  1074  			pr_warn("_ddebug tab=
le is empty in a CONFIG_DYNAMIC_DEBUG build\n");
b5b78f83854af1 Jim Cromie         2011-12-19  1075  			return 1;
b5b78f83854af1 Jim Cromie         2011-12-19  1076  		}
ceabef7dd71720 Orson Zhai         2020-06-07  1077  		pr_info("Ignore empty=
 _ddebug table in a CONFIG_DYNAMIC_DEBUG_CORE build\n");
ceabef7dd71720 Orson Zhai         2020-06-07  1078  		ddebug_init_success =
=3D 1;
ceabef7dd71720 Orson Zhai         2020-06-07  1079  		return 0;
ceabef7dd71720 Orson Zhai         2020-06-07  1080  	}
e5ebffe18e5add Jim Cromie         2020-07-19  1081  	iter =3D __start___dyn=
dbg;
e9d376f0fa66bd Jason Baron        2009-02-05  1082  	modname =3D iter->modn=
ame;
e9d376f0fa66bd Jason Baron        2009-02-05  1083  	iter_start =3D iter;
e5ebffe18e5add Jim Cromie         2020-07-19  1084  	for (; iter < __stop__=
_dyndbg; iter++) {
4107692760db81 Jim Cromie         2012-04-27  1085  		entries++;
e9d376f0fa66bd Jason Baron        2009-02-05  1086  		if (strcmp(modname, i=
ter->modname)) {
4107692760db81 Jim Cromie         2012-04-27  1087  			modct++;
97c4bd16cf4cf6 Jim Cromie         2022-06-01  1088  			ret =3D ddebug_add_m=
odule(iter_start, n,
97c4bd16cf4cf6 Jim Cromie         2022-06-01  1089  						__start___dyndbg_=
classes, num_classes,
97c4bd16cf4cf6 Jim Cromie         2022-06-01  1090  						modname);
e9d376f0fa66bd Jason Baron        2009-02-05  1091  			if (ret)
af442399fcf378 Jim Cromie         2012-04-27  1092  				goto out_err;
e9d376f0fa66bd Jason Baron        2009-02-05  1093  			n =3D 0;
e9d376f0fa66bd Jason Baron        2009-02-05  1094  			modname =3D iter->mo=
dname;
e9d376f0fa66bd Jason Baron        2009-02-05  1095  			iter_start =3D iter;
e9d376f0fa66bd Jason Baron        2009-02-05  1096  		}
e9d376f0fa66bd Jason Baron        2009-02-05  1097  		n++;
e9d376f0fa66bd Jason Baron        2009-02-05  1098  	}
97c4bd16cf4cf6 Jim Cromie         2022-06-01  1099  	ret =3D ddebug_add_mod=
ule(iter_start, n,
97c4bd16cf4cf6 Jim Cromie         2022-06-01  1100  				__start___dyndbg_cl=
asses, num_classes, modname);
b5b78f83854af1 Jim Cromie         2011-12-19  1101  	if (ret)
af442399fcf378 Jim Cromie         2012-04-27  1102  		goto out_err;
a648ec05bb950f Thomas Renninger   2010-08-06  1103  =

af442399fcf378 Jim Cromie         2012-04-27  1104  	ddebug_init_success =
=3D 1;
7af5662826f7b1 Jim Cromie         2021-05-24  1105  	vpr_info("%d prdebugs =
in %d modules, %d KiB in ddebug tables, %d kiB in __dyndbg section\n",
7af5662826f7b1 Jim Cromie         2021-05-24  1106  		 entries, modct, (int=
)((modct * sizeof(struct ddebug_table)) >> 10),
7af5662826f7b1 Jim Cromie         2021-05-24  1107  		 (int)((entries * siz=
eof(struct _ddebug)) >> 10));
af442399fcf378 Jim Cromie         2012-04-27  1108  =

97c4bd16cf4cf6 Jim Cromie         2022-06-01  1109  	if (num_classes)
97c4bd16cf4cf6 Jim Cromie         2022-06-01  1110  		v2pr_info("  %d built=
in ddebug class-maps\n", num_classes);
97c4bd16cf4cf6 Jim Cromie         2022-06-01  1111  =

b48420c1d3019c Jim Cromie         2012-04-27  1112  	/* now that ddebug tab=
les are loaded, process all boot args
b48420c1d3019c Jim Cromie         2012-04-27  1113  	 * again to find and a=
ctivate queries given in dyndbg params.
b48420c1d3019c Jim Cromie         2012-04-27  1114  	 * While this has alre=
ady been done for known boot params, it
b48420c1d3019c Jim Cromie         2012-04-27  1115  	 * ignored the unknown=
 ones (dyndbg in particular).  Reusing
b48420c1d3019c Jim Cromie         2012-04-27  1116  	 * parse_args avoids a=
d-hoc parsing.  This will also attempt
b48420c1d3019c Jim Cromie         2012-04-27  1117  	 * to activate queries=
 for not-yet-loaded modules, which is
b48420c1d3019c Jim Cromie         2012-04-27  1118  	 * slightly noisy if v=
erbose, but harmless.
b48420c1d3019c Jim Cromie         2012-04-27  1119  	 */
b48420c1d3019c Jim Cromie         2012-04-27  1120  	cmdline =3D kstrdup(sa=
ved_command_line, GFP_KERNEL);
b48420c1d3019c Jim Cromie         2012-04-27  1121  	parse_args("dyndbg par=
ams", cmdline, NULL,
ecc8617053e0a9 Luis R. Rodriguez  2015-03-30  1122  		   0, 0, 0, NULL, &dd=
ebug_dyndbg_boot_param_cb);
b48420c1d3019c Jim Cromie         2012-04-27  1123  	kfree(cmdline);
af442399fcf378 Jim Cromie         2012-04-27  1124  	return 0;
a648ec05bb950f Thomas Renninger   2010-08-06  1125  =

af442399fcf378 Jim Cromie         2012-04-27  1126  out_err:
e9d376f0fa66bd Jason Baron        2009-02-05  1127  	ddebug_remove_all_tabl=
es();
e9d376f0fa66bd Jason Baron        2009-02-05  1128  	return 0;
e9d376f0fa66bd Jason Baron        2009-02-05  1129  }
6a5c083de2f5fb Thomas Renninger   2010-08-06  1130  /* Allow early initiali=
zation for boot messages via boot param */
3ec5652ab70f6e Jim Cromie         2012-04-27  1131  early_initcall(dynamic_=
debug_init);
b48420c1d3019c Jim Cromie         2012-04-27  1132  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5103785534406576691==--

