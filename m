Content-Type: multipart/mixed; boundary="===============6540613638777859282=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [jimc:dyn-drm-trc 12/28] lib/dynamic_debug.c:188:37: warning: Uninitialized variables: dt.link, dt.maps, dt.num_ddebugs, dt.ddebugs [uninitvar]
Date: Mon, 02 May 2022 10:54:40 +0800
Message-ID: <202205021039.z61BwyUZ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6540613638777859282==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: Jim Cromie <jim.cromie@gmail.com>

tree:   https://github.com/jimc/linux.git dyn-drm-trc
head:   801130a0306cf592b0ef268d7b68bbb1bfcce2f9
commit: 6bea4df95e216a7200d7ce98298d72fba2f234b7 [12/28] dyndbg: change zer=
o-or-one classes-map to maps list
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
compiler: ia64-linux-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 6bea4df95e216a7200d7ce98298d72fba2f234b7
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   lib/dynamic_debug.c:651:33: warning: Boolean result is used in bitwise o=
peration. Clarify expression with parentheses. [clarifyCondition]
     if (test_bit(idx_rc, &inbits) ^ !!negate) {
                                   ^
   lib/dynamic_debug.c:1062:15: warning: Local variable 'p' shadows outer a=
rgument [shadowArgument]
     char const* p =3D ddebug_class_name(iter, dp);
                 ^
   lib/dynamic_debug.c:1042:55: note: Shadowed declaration
   static int ddebug_proc_show(struct seq_file *m, void *p)
                                                         ^
   lib/dynamic_debug.c:1062:15: note: Shadow variable
     char const* p =3D ddebug_class_name(iter, dp);
                 ^
   lib/dynamic_debug.c:1356:14: warning: Comparing pointers that point to d=
ifferent objects [comparePointers]
    for (; iter < __stop___dyndbg; iter++) {
                ^
   lib/dynamic_debug.c:42:23: note: Variable declared here.
   extern struct _ddebug __start___dyndbg[];
                         ^
   lib/dynamic_debug.c:1353:9: note: Array decayed to pointer here.
    iter =3D __start___dyndbg;
           ^
   lib/dynamic_debug.c:43:23: note: Variable declared here.
   extern struct _ddebug __stop___dyndbg[];
                         ^
   lib/dynamic_debug.c:1356:16: note: Array decayed to pointer here.
    for (; iter < __stop___dyndbg; iter++) {
                  ^
   lib/dynamic_debug.c:1356:14: note: Comparing pointers that point to diff=
erent objects
    for (; iter < __stop___dyndbg; iter++) {
                ^
   lib/dynamic_debug.c:986:60: warning: Parameter 'pos' can be declared wit=
h const [constParameter]
   static void *ddebug_proc_start(struct seq_file *m, loff_t *pos)
                                                              ^
   lib/dynamic_debug.c:1009:57: warning: Parameter 'p' can be declared with=
 const [constParameter]
   static void *ddebug_proc_next(struct seq_file *m, void *p, loff_t *pos)
                                                           ^
>> lib/dynamic_debug.c:188:37: warning: Uninitialized variables: dt.link, d=
t.maps, dt.num_ddebugs, dt.ddebugs [uninitvar]
      query_class =3D validate_classname(dt, query->class_string);
                                       ^
   lib/dynamic_debug.c:182:21: note: Assuming condition is false
     if (query->module &&
                       ^
   lib/dynamic_debug.c:182:21: note: Assuming condition is false
     if (query->module &&
                       ^
   lib/dynamic_debug.c:182:21: note: Assuming condition is false
     if (query->module &&
                       ^
   lib/dynamic_debug.c:182:21: note: Assuming condition is false
     if (query->module &&
                       ^
   lib/dynamic_debug.c:188:37: note: Uninitialized variables: dt.link, dt.m=
aps, dt.num_ddebugs, dt.ddebugs
      query_class =3D validate_classname(dt, query->class_string);
                                       ^
   lib/dynamic_debug.c:1139:20: warning: Uninitialized variable: dt->mod_na=
me [uninitvar]
      if (!strcmp(dt->mod_name, map->mod_name)) {
                      ^
   lib/dynamic_debug.c:1287:11: warning: Uninitialized variable: dt->mod_na=
me [uninitvar]
     if (dt->mod_name =3D=3D mod_name) {
             ^
>> lib/dynamic_debug.c:1158:35: warning: Unused variable: dmap [unusedVaria=
ble]
    struct ddebug_known_classes_map *dmap;
                                     ^
>> lib/dynamic_debug.c:1159:23: warning: Unused variable: dt [unusedVariabl=
e]
    struct ddebug_table *dt;
                         ^
   lib/dynamic_debug.c:1128:12: warning: Uninitialized variable: dt->mod_na=
me [uninitvar]
      if (dt->mod_name =3D=3D map->mod->name) {
              ^
   lib/dynamic_debug.c:1167:12: warning: Uninitialized variable: dt->mod_na=
me [uninitvar]
      if (dt->mod_name =3D=3D map->mod->name) {
              ^
   lib/dynamic_debug.c:103:12: warning: Using argument fb that points at un=
initialized variable flags [ctuuninitvar]
    char *p =3D fb->buf;
              ^
   lib/dynamic_debug.c:1057:27: note: Calling function ddebug_describe_flag=
s, 2nd argument is uninitialized
        ddebug_describe_flags(dp->flags, &flags));
                             ^
   lib/dynamic_debug.c:103:12: note: Using argument fb
    char *p =3D fb->buf;
              ^

vim +188 lib/dynamic_debug.c

f657fd21e16e3a Joe Perches     2012-12-05  160  =

e9d376f0fa66bd Jason Baron     2009-02-05  161  /*
85f7f6c0edb841 Jim Cromie      2011-12-19  162   * Search the tables for _d=
debug's which match the given `query' and
85f7f6c0edb841 Jim Cromie      2011-12-19  163   * apply the `flags' and `m=
ask' to them.  Returns number of matching
85f7f6c0edb841 Jim Cromie      2011-12-19  164   * callsites, normally the =
same as number of changes.  If verbose,
85f7f6c0edb841 Jim Cromie      2011-12-19  165   * logs the changes.  Takes=
 ddebug_lock.
e9d376f0fa66bd Jason Baron     2009-02-05  166   */
85f7f6c0edb841 Jim Cromie      2011-12-19  167  static int ddebug_change(co=
nst struct ddebug_query *query,
84da83a6ffc0b7 Jim Cromie      2020-07-19  168  			 struct flag_settings *m=
odifiers)
e9d376f0fa66bd Jason Baron     2009-02-05  169  {
e9d376f0fa66bd Jason Baron     2009-02-05  170  	int i;
e9d376f0fa66bd Jason Baron     2009-02-05  171  	struct ddebug_table *dt;
e9d376f0fa66bd Jason Baron     2009-02-05  172  	unsigned int newflags;
e9d376f0fa66bd Jason Baron     2009-02-05  173  	unsigned int nfound =3D 0;
2f57b9a2ae6687 Jim Cromie      2022-01-31  174  	struct flagsbuf fbuf, nbuf;
7a0a9f921a777d Jim Cromie      2022-04-01  175  	int query_class;
e9d376f0fa66bd Jason Baron     2009-02-05  176  =

e9d376f0fa66bd Jason Baron     2009-02-05  177  	/* search for matching dde=
bugs */
e9d376f0fa66bd Jason Baron     2009-02-05  178  	mutex_lock(&ddebug_lock);
e9d376f0fa66bd Jason Baron     2009-02-05  179  	list_for_each_entry(dt, &d=
debug_tables, link) {
e9d376f0fa66bd Jason Baron     2009-02-05  180  =

e9d376f0fa66bd Jason Baron     2009-02-05  181  		/* match against the modu=
le name */
578b1e0701af34 Changbin Du     2014-01-23  182  		if (query->module &&
578b1e0701af34 Changbin Du     2014-01-23  183  		    !match_wildcard(query=
->module, dt->mod_name))
e9d376f0fa66bd Jason Baron     2009-02-05  184  			continue;
e9d376f0fa66bd Jason Baron     2009-02-05  185  =

7a0a9f921a777d Jim Cromie      2022-04-01  186  		/* validate class-string =
against module's known classes */
6bea4df95e216a Jim Cromie      2022-04-28  187  		if (query->class_string) {
7a0a9f921a777d Jim Cromie      2022-04-01 @188  			query_class =3D validate=
_classname(dt, query->class_string);
7a0a9f921a777d Jim Cromie      2022-04-01  189  			if (query_class < 0)
7a0a9f921a777d Jim Cromie      2022-04-01  190  				continue;
6bea4df95e216a Jim Cromie      2022-04-28  191  		} else {
6bea4df95e216a Jim Cromie      2022-04-28  192  			/* queries w/o class per=
tain to default class only */
6bea4df95e216a Jim Cromie      2022-04-28  193  			query_class =3D _DPRINTK=
_CLASS_DFLT;
6bea4df95e216a Jim Cromie      2022-04-28  194  		}
7a0a9f921a777d Jim Cromie      2022-04-01  195  =

e9d376f0fa66bd Jason Baron     2009-02-05  196  		for (i =3D 0; i < dt->num=
_ddebugs; i++) {
e9d376f0fa66bd Jason Baron     2009-02-05  197  			struct _ddebug *dp =3D &=
dt->ddebugs[i];
e9d376f0fa66bd Jason Baron     2009-02-05  198  =

7a0a9f921a777d Jim Cromie      2022-04-01  199  			/* match against query-c=
lass, either valid input or default */
7a0a9f921a777d Jim Cromie      2022-04-01  200  			if (query_class !=3D dp-=
>class_id)
7a0a9f921a777d Jim Cromie      2022-04-01  201  				continue;
7a0a9f921a777d Jim Cromie      2022-04-01  202  =

e9d376f0fa66bd Jason Baron     2009-02-05  203  			/* match against the sou=
rce filename */
d6a238d25014d0 Jim Cromie      2011-12-19  204  			if (query->filename &&
578b1e0701af34 Changbin Du     2014-01-23  205  			    !match_wildcard(quer=
y->filename, dp->filename) &&
578b1e0701af34 Changbin Du     2014-01-23  206  			    !match_wildcard(quer=
y->filename,
578b1e0701af34 Changbin Du     2014-01-23  207  					   kbasename(dp->filen=
ame)) &&
578b1e0701af34 Changbin Du     2014-01-23  208  			    !match_wildcard(quer=
y->filename,
578b1e0701af34 Changbin Du     2014-01-23  209  					   trim_prefix(dp->fil=
ename)))
e9d376f0fa66bd Jason Baron     2009-02-05  210  				continue;
e9d376f0fa66bd Jason Baron     2009-02-05  211  =

e9d376f0fa66bd Jason Baron     2009-02-05  212  			/* match against the fun=
ction */
d6a238d25014d0 Jim Cromie      2011-12-19  213  			if (query->function &&
578b1e0701af34 Changbin Du     2014-01-23  214  			    !match_wildcard(quer=
y->function, dp->function))
e9d376f0fa66bd Jason Baron     2009-02-05  215  				continue;
e9d376f0fa66bd Jason Baron     2009-02-05  216  =

e9d376f0fa66bd Jason Baron     2009-02-05  217  			/* match against the for=
mat */
4b334484fa7f44 Jim Cromie      2020-07-19  218  			if (query->format) {
4b334484fa7f44 Jim Cromie      2020-07-19  219  				if (*query->format =3D=
=3D '^') {
4b334484fa7f44 Jim Cromie      2020-07-19  220  					char *p;
4b334484fa7f44 Jim Cromie      2020-07-19  221  					/* anchored search. ma=
tch must be at beginning */
4b334484fa7f44 Jim Cromie      2020-07-19  222  					p =3D strstr(dp->forma=
t, query->format+1);
4b334484fa7f44 Jim Cromie      2020-07-19  223  					if (p !=3D dp->format)
4b334484fa7f44 Jim Cromie      2020-07-19  224  						continue;
4b334484fa7f44 Jim Cromie      2020-07-19  225  				} else if (!strstr(dp->=
format, query->format))
e9d376f0fa66bd Jason Baron     2009-02-05  226  					continue;
4b334484fa7f44 Jim Cromie      2020-07-19  227  			}
e9d376f0fa66bd Jason Baron     2009-02-05  228  =

e9d376f0fa66bd Jason Baron     2009-02-05  229  			/* match against the lin=
e number range */
e9d376f0fa66bd Jason Baron     2009-02-05  230  			if (query->first_lineno =
&&
e9d376f0fa66bd Jason Baron     2009-02-05  231  			    dp->lineno < query->=
first_lineno)
e9d376f0fa66bd Jason Baron     2009-02-05  232  				continue;
e9d376f0fa66bd Jason Baron     2009-02-05  233  			if (query->last_lineno &&
e9d376f0fa66bd Jason Baron     2009-02-05  234  			    dp->lineno > query->=
last_lineno)
e9d376f0fa66bd Jason Baron     2009-02-05  235  				continue;
e9d376f0fa66bd Jason Baron     2009-02-05  236  =

e9d376f0fa66bd Jason Baron     2009-02-05  237  			nfound++;
e9d376f0fa66bd Jason Baron     2009-02-05  238  =

84da83a6ffc0b7 Jim Cromie      2020-07-19  239  			newflags =3D (dp->flags =
& modifiers->mask) | modifiers->flags;
e9d376f0fa66bd Jason Baron     2009-02-05  240  			if (newflags =3D=3D dp->=
flags)
e9d376f0fa66bd Jason Baron     2009-02-05  241  				continue;
e9666d10a5677a Masahiro Yamada 2018-12-31  242  #ifdef CONFIG_JUMP_LABEL
9049fc745300c5 Jason Baron     2016-08-03  243  			if (dp->flags & _DPRINTK=
_FLAGS_PRINT) {
30b87763e85d22 Jim Cromie      2022-01-31  244  				if (!(newflags & _DPRIN=
TK_FLAGS_PRINT))
9049fc745300c5 Jason Baron     2016-08-03  245  					static_branch_disable(=
&dp->key.dd_key_true);
30b87763e85d22 Jim Cromie      2022-01-31  246  			} else if (newflags & _D=
PRINTK_FLAGS_PRINT) {
9049fc745300c5 Jason Baron     2016-08-03  247  				static_branch_enable(&d=
p->key.dd_key_true);
30b87763e85d22 Jim Cromie      2022-01-31  248  			}
9049fc745300c5 Jason Baron     2016-08-03  249  #endif
2f57b9a2ae6687 Jim Cromie      2022-01-31  250  			v4pr_info("changed %s:%d=
 [%s]%s %s -> %s\n",
2b6783191da721 Jim Cromie      2011-12-19  251  				  trim_prefix(dp->filen=
ame), dp->lineno,
e9d376f0fa66bd Jason Baron     2009-02-05  252  				  dt->mod_name, dp->fun=
ction,
2f57b9a2ae6687 Jim Cromie      2022-01-31  253  				  ddebug_describe_flags=
(dp->flags, &fbuf),
2f57b9a2ae6687 Jim Cromie      2022-01-31  254  				  ddebug_describe_flags=
(newflags, &nbuf));
2f57b9a2ae6687 Jim Cromie      2022-01-31  255  			dp->flags =3D newflags;
e9d376f0fa66bd Jason Baron     2009-02-05  256  		}
e9d376f0fa66bd Jason Baron     2009-02-05  257  	}
e9d376f0fa66bd Jason Baron     2009-02-05  258  	mutex_unlock(&ddebug_lock);
e9d376f0fa66bd Jason Baron     2009-02-05  259  =

e9d376f0fa66bd Jason Baron     2009-02-05  260  	if (!nfound && verbose)
4ad275e5cb576f Joe Perches     2011-08-11  261  		pr_info("no matches for q=
uery\n");
85f7f6c0edb841 Jim Cromie      2011-12-19  262  =

85f7f6c0edb841 Jim Cromie      2011-12-19  263  	return nfound;
e9d376f0fa66bd Jason Baron     2009-02-05  264  }
e9d376f0fa66bd Jason Baron     2009-02-05  265  =


:::::: The code at line 188 was first introduced by commit
:::::: 7a0a9f921a777df09b2df90fcf0014df2a632ec4 dyndbg: validate class FOO =
on module

:::::: TO: Jim Cromie <jim.cromie@gmail.com>
:::::: CC: Jim Cromie <jim.cromie@gmail.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6540613638777859282==--

