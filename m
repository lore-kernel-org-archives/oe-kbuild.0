Content-Type: multipart/mixed; boundary="===============6580709814911200127=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [jimc:dyn-drm-trc 11/28] lib/dynamic_debug.c:661:33: warning: Boolean result is used in bitwise operation. Clarify expression with parentheses. [clarifyCondition]
Date: Mon, 02 May 2022 08:52:06 +0800
Message-ID: <202205020811.Qt9WJBaX-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6580709814911200127==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: Jim Cromie <jim.cromie@gmail.com>

tree:   https://github.com/jimc/linux.git dyn-drm-trc
head:   801130a0306cf592b0ef268d7b68bbb1bfcce2f9
commit: b482f3f01a316465458b09cf963ce5c652ccb976 [11/28] dyndbg: support sy=
mbolic class-names in bitmap
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
compiler: ia64-linux-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout b482f3f01a316465458b09cf963ce5c652ccb976
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> lib/dynamic_debug.c:661:33: warning: Boolean result is used in bitwise o=
peration. Clarify expression with parentheses. [clarifyCondition]
     if (test_bit(idx_rc, &inbits) ^ !!negate) {
                                   ^
   lib/dynamic_debug.c:171:14: warning: Redundant initialization for 'query=
_class'. The initialized value is overwritten before it is read. [redundant=
Initialization]
    query_class =3D idx + dt->classes->base;
                ^
   lib/dynamic_debug.c:152:18: note: query_class is initialized
    int query_class =3D -ENOENT;
                    ^
   lib/dynamic_debug.c:171:14: note: query_class is overwritten
    query_class =3D idx + dt->classes->base;
                ^
>> lib/dynamic_debug.c:1065:15: warning: Local variable 'p' shadows outer a=
rgument [shadowArgument]
     char const* p =3D ddebug_class_name(iter, dp);
                 ^
   lib/dynamic_debug.c:1045:55: note: Shadowed declaration
   static int ddebug_proc_show(struct seq_file *m, void *p)
                                                         ^
   lib/dynamic_debug.c:1065:15: note: Shadow variable
     char const* p =3D ddebug_class_name(iter, dp);
                 ^
>> lib/dynamic_debug.c:1321:14: warning: Comparing pointers that point to d=
ifferent objects [comparePointers]
    for (; iter < __stop___dyndbg; iter++) {
                ^
   lib/dynamic_debug.c:42:23: note: Variable declared here.
   extern struct _ddebug __start___dyndbg[];
                         ^
   lib/dynamic_debug.c:1318:9: note: Array decayed to pointer here.
    iter =3D __start___dyndbg;
           ^
   lib/dynamic_debug.c:43:23: note: Variable declared here.
   extern struct _ddebug __stop___dyndbg[];
                         ^
   lib/dynamic_debug.c:1321:16: note: Array decayed to pointer here.
    for (; iter < __stop___dyndbg; iter++) {
                  ^
   lib/dynamic_debug.c:1321:14: note: Comparing pointers that point to diff=
erent objects
    for (; iter < __stop___dyndbg; iter++) {
                ^
>> lib/dynamic_debug.c:996:60: warning: Parameter 'pos' can be declared wit=
h const [constParameter]
   static void *ddebug_proc_start(struct seq_file *m, loff_t *pos)
                                                              ^
>> lib/dynamic_debug.c:1019:57: warning: Parameter 'p' can be declared with=
 const [constParameter]
   static void *ddebug_proc_next(struct seq_file *m, void *p, loff_t *pos)
                                                           ^
   lib/dynamic_debug.c:202:36: warning: Uninitialized variables: dt.link, d=
t.classes, dt.num_ddebugs, dt.ddebugs [uninitvar]
     query_class =3D validate_classname(dt, query->class_string);
                                      ^
   lib/dynamic_debug.c:197:21: note: Assuming condition is false
     if (query->module &&
                       ^
   lib/dynamic_debug.c:197:21: note: Assuming condition is false
     if (query->module &&
                       ^
   lib/dynamic_debug.c:197:21: note: Assuming condition is false
     if (query->module &&
                       ^
   lib/dynamic_debug.c:197:21: note: Assuming condition is false
     if (query->module &&
                       ^
   lib/dynamic_debug.c:202:36: note: Uninitialized variables: dt.link, dt.c=
lasses, dt.num_ddebugs, dt.ddebugs
     query_class =3D validate_classname(dt, query->class_string);
                                      ^
>> lib/dynamic_debug.c:1141:20: warning: Uninitialized variable: dt->mod_na=
me [uninitvar]
      if (!strcmp(dt->mod_name, map->mod_name)) {
                      ^
   lib/dynamic_debug.c:1252:11: warning: Uninitialized variable: dt->mod_na=
me [uninitvar]
     if (dt->mod_name =3D=3D mod_name) {
             ^
   lib/dynamic_debug.c:1130:12: warning: Uninitialized variable: dt->mod_na=
me [uninitvar]
      if (dt->mod_name =3D=3D map->mod->name) {
              ^
>> lib/dynamic_debug.c:105:12: warning: Using argument fb that points at un=
initialized variable flags [ctuuninitvar]
    char *p =3D fb->buf;
              ^
   lib/dynamic_debug.c:1060:27: note: Calling function ddebug_describe_flag=
s, 2nd argument is uninitialized
        ddebug_describe_flags(dp->flags, &flags));
                             ^
   lib/dynamic_debug.c:105:12: note: Using argument fb
    char *p =3D fb->buf;
              ^

vim +661 lib/dynamic_debug.c

3faa991cff50e3 Jim Cromie 2022-04-01  620  =

b482f3f01a3164 Jim Cromie 2022-04-06  621  /* support for [+-] symbolic-nam=
e boolean list */
b482f3f01a3164 Jim Cromie 2022-04-06  622  static int param_set_dyndbg_clas=
s_strings(const char *instr, const struct kernel_param *kp)
b482f3f01a3164 Jim Cromie 2022-04-06  623  {
b482f3f01a3164 Jim Cromie 2022-04-06  624  	const struct ddebug_classes_bit=
map_param *dcp =3D kp->arg;
b482f3f01a3164 Jim Cromie 2022-04-06  625  	unsigned long inbits;
b482f3f01a3164 Jim Cromie 2022-04-06  626  	int idx_rc, totct =3D 0;
b482f3f01a3164 Jim Cromie 2022-04-06  627  	bool negate;
b482f3f01a3164 Jim Cromie 2022-04-06  628  	char *cls, *p;
b482f3f01a3164 Jim Cromie 2022-04-06  629  =

b482f3f01a3164 Jim Cromie 2022-04-06  630  	if (!dcp || !dcp->map) {
b482f3f01a3164 Jim Cromie 2022-04-06  631  		pr_err("set_dyndbg_classes: no=
 bits=3D>queries map\n");
b482f3f01a3164 Jim Cromie 2022-04-06  632  		return -EINVAL;
b482f3f01a3164 Jim Cromie 2022-04-06  633  	}
b482f3f01a3164 Jim Cromie 2022-04-06  634  =

b482f3f01a3164 Jim Cromie 2022-04-06  635  	cls =3D kstrdup(instr, GFP_KERN=
EL);
b482f3f01a3164 Jim Cromie 2022-04-06  636  	p =3D strchr(cls, '\n');
b482f3f01a3164 Jim Cromie 2022-04-06  637  	if (p)
b482f3f01a3164 Jim Cromie 2022-04-06  638  		*p =3D '\0';
b482f3f01a3164 Jim Cromie 2022-04-06  639  =

b482f3f01a3164 Jim Cromie 2022-04-06  640  	inbits =3D *dcp->bits;
b482f3f01a3164 Jim Cromie 2022-04-06  641  	vpr_info("set_dyndbg_class_stri=
ngs: %s on 0x%lx\n", cls, inbits);
b482f3f01a3164 Jim Cromie 2022-04-06  642  =

b482f3f01a3164 Jim Cromie 2022-04-06  643  	for (; cls; cls =3D p) {
b482f3f01a3164 Jim Cromie 2022-04-06  644  		p =3D strchr(cls, ',');
b482f3f01a3164 Jim Cromie 2022-04-06  645  		if (p)
b482f3f01a3164 Jim Cromie 2022-04-06  646  			*p++ =3D '\0';
b482f3f01a3164 Jim Cromie 2022-04-06  647  =

b482f3f01a3164 Jim Cromie 2022-04-06  648  		if (*cls =3D=3D '-') {
b482f3f01a3164 Jim Cromie 2022-04-06  649  			negate =3D true;
b482f3f01a3164 Jim Cromie 2022-04-06  650  			cls++;
b482f3f01a3164 Jim Cromie 2022-04-06  651  		} else {
b482f3f01a3164 Jim Cromie 2022-04-06  652  			negate =3D false;
b482f3f01a3164 Jim Cromie 2022-04-06  653  			if (*cls =3D=3D '+')
b482f3f01a3164 Jim Cromie 2022-04-06  654  				cls++;
b482f3f01a3164 Jim Cromie 2022-04-06  655  		}
b482f3f01a3164 Jim Cromie 2022-04-06  656  		idx_rc =3D match_string(dcp->m=
ap->classes, -1, cls);
b482f3f01a3164 Jim Cromie 2022-04-06  657  		if (idx_rc < 0) {
b482f3f01a3164 Jim Cromie 2022-04-06  658  			pr_err("%s not found for modu=
le: %s\n", cls, dcp->map->mod_name);
b482f3f01a3164 Jim Cromie 2022-04-06  659  			continue;
b482f3f01a3164 Jim Cromie 2022-04-06  660  		}
b482f3f01a3164 Jim Cromie 2022-04-06 @661  		if (test_bit(idx_rc, &inbits) =
^ !!negate) {
b482f3f01a3164 Jim Cromie 2022-04-06  662  			v3pr_info("no change on %s\n"=
, cls);
b482f3f01a3164 Jim Cromie 2022-04-06  663  			continue;
b482f3f01a3164 Jim Cromie 2022-04-06  664  		}
b482f3f01a3164 Jim Cromie 2022-04-06  665  =

b482f3f01a3164 Jim Cromie 2022-04-06  666  		totct +=3D do_callback_changes=
(dcp, idx_rc, &inbits);
b482f3f01a3164 Jim Cromie 2022-04-06  667  =

b482f3f01a3164 Jim Cromie 2022-04-06  668  		inbits ^=3D BIT(idx_rc);
b482f3f01a3164 Jim Cromie 2022-04-06  669  	}
b482f3f01a3164 Jim Cromie 2022-04-06  670  	kfree(cls);
b482f3f01a3164 Jim Cromie 2022-04-06  671  	*dcp->bits =3D inbits;
b482f3f01a3164 Jim Cromie 2022-04-06  672  	vpr_info("total matches: %d\n",=
 totct);
b482f3f01a3164 Jim Cromie 2022-04-06  673  	return 0;
b482f3f01a3164 Jim Cromie 2022-04-06  674  }
b482f3f01a3164 Jim Cromie 2022-04-06  675  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6580709814911200127==--

