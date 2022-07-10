Content-Type: multipart/mixed; boundary="===============0177339555422679905=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [jimc:ddn3j 15/21] lib/dynamic_debug.c:194:34: warning: Uninitialized variables: dt.link, dt.maps, dt.num_ddebugs, dt.ddebugs [uninitvar]
Date: Mon, 11 Jul 2022 00:07:49 +0800
Message-ID: <202207110006.XaM1C2oB-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0177339555422679905==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: lib/dynam=
ic_debug.c:194:34: warning: Uninitialized variables: dt.link, dt.maps, dt.n=
um_ddebugs, dt.ddebugs [uninitvar]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: Jim Cromie <jim.cromie@gmail.com>

tree:   https://github.com/jimc/linux.git ddn3j
head:   717a666bd3fa45056435727f971badceaaebbed0
commit: abdeb5614def0bda0a11028e2b77731727d34c3e [15/21] dyndbg: validate c=
lass FOO by checking with module
:::::: branch date: 13 days ago
:::::: commit date: 3 weeks ago
compiler: s390-linux-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout abdeb5614def0bda0a11028e2b77731727d34c3e
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   lib/dynamic_debug.c:1162:44: warning: Subtracting pointers that point to=
 different objects [comparePointers]
    int num_classes =3D __stop___dyndbg_classes - __start___dyndbg_classes;
                                              ^
   lib/dynamic_debug.c:45:32: note: Variable declared here.
   extern struct ddebug_class_map __stop___dyndbg_classes[];
                                  ^
   lib/dynamic_debug.c:1162:20: note: Array decayed to pointer here.
    int num_classes =3D __stop___dyndbg_classes - __start___dyndbg_classes;
                      ^
   lib/dynamic_debug.c:44:32: note: Variable declared here.
   extern struct ddebug_class_map __start___dyndbg_classes[];
                                  ^
   lib/dynamic_debug.c:1162:46: note: Array decayed to pointer here.
    int num_classes =3D __stop___dyndbg_classes - __start___dyndbg_classes;
                                                ^
   lib/dynamic_debug.c:1162:44: note: Subtracting pointers that point to di=
fferent objects
    int num_classes =3D __stop___dyndbg_classes - __start___dyndbg_classes;
                                              ^
   lib/dynamic_debug.c:1176:14: warning: Comparing pointers that point to d=
ifferent objects [comparePointers]
    for (; iter < __stop___dyndbg; iter++) {
                ^
   lib/dynamic_debug.c:42:23: note: Variable declared here.
   extern struct _ddebug __start___dyndbg[];
                         ^
   lib/dynamic_debug.c:1173:9: note: Array decayed to pointer here.
    iter =3D __start___dyndbg;
           ^
   lib/dynamic_debug.c:43:23: note: Variable declared here.
   extern struct _ddebug __stop___dyndbg[];
                         ^
   lib/dynamic_debug.c:1176:16: note: Array decayed to pointer here.
    for (; iter < __stop___dyndbg; iter++) {
                  ^
   lib/dynamic_debug.c:1176:14: note: Comparing pointers that point to diff=
erent objects
    for (; iter < __stop___dyndbg; iter++) {
                ^
   lib/dynamic_debug.c:857:60: warning: Parameter 'pos' can be declared wit=
h const [constParameter]
   static void *ddebug_proc_start(struct seq_file *m, loff_t *pos)
                                                              ^
   lib/dynamic_debug.c:880:57: warning: Parameter 'p' can be declared with =
const [constParameter]
   static void *ddebug_proc_next(struct seq_file *m, void *p, loff_t *pos)
                                                           ^
>> lib/dynamic_debug.c:194:34: warning: Uninitialized variables: dt.link, d=
t.maps, dt.num_ddebugs, dt.ddebugs [uninitvar]
      map =3D ddebug_find_valid_class(dt, query->class_string, &valid_class=
);
                                    ^
   lib/dynamic_debug.c:189:21: note: Assuming condition is false
     if (query->module &&
                       ^
   lib/dynamic_debug.c:189:21: note: Assuming condition is false
     if (query->module &&
                       ^
   lib/dynamic_debug.c:189:21: note: Assuming condition is false
     if (query->module &&
                       ^
   lib/dynamic_debug.c:189:21: note: Assuming condition is false
     if (query->module &&
                       ^
   lib/dynamic_debug.c:194:34: note: Uninitialized variables: dt.link, dt.m=
aps, dt.num_ddebugs, dt.ddebugs
      map =3D ddebug_find_valid_class(dt, query->class_string, &valid_class=
);
                                    ^
   lib/dynamic_debug.c:1106:11: warning: Uninitialized variable: dt->mod_na=
me [uninitvar]
     if (dt->mod_name =3D=3D mod_name) {
             ^
   lib/dynamic_debug.c:105:12: warning: Using argument fb that points at un=
initialized variable flags [ctuuninitvar]
    char *p =3D fb->buf;
              ^
   lib/dynamic_debug.c:929:27: note: Calling function ddebug_describe_flags=
, 2nd argument is uninitialized
        ddebug_describe_flags(dp->flags, &flags));
                             ^
   lib/dynamic_debug.c:105:12: note: Using argument fb
    char *p =3D fb->buf;
              ^

vim +194 lib/dynamic_debug.c

abdeb5614def0b Jim Cromie      2022-04-01  165  =

abdeb5614def0b Jim Cromie      2022-04-01  166  #define __outvar /* filled =
by callee */
e9d376f0fa66bd Jason Baron     2009-02-05  167  /*
85f7f6c0edb841 Jim Cromie      2011-12-19  168   * Search the tables for _d=
debug's which match the given `query' and
85f7f6c0edb841 Jim Cromie      2011-12-19  169   * apply the `flags' and `m=
ask' to them.  Returns number of matching
85f7f6c0edb841 Jim Cromie      2011-12-19  170   * callsites, normally the =
same as number of changes.  If verbose,
85f7f6c0edb841 Jim Cromie      2011-12-19  171   * logs the changes.  Takes=
 ddebug_lock.
e9d376f0fa66bd Jason Baron     2009-02-05  172   */
85f7f6c0edb841 Jim Cromie      2011-12-19  173  static int ddebug_change(co=
nst struct ddebug_query *query,
84da83a6ffc0b7 Jim Cromie      2020-07-19  174  			 struct flag_settings *m=
odifiers)
e9d376f0fa66bd Jason Baron     2009-02-05  175  {
e9d376f0fa66bd Jason Baron     2009-02-05  176  	int i;
e9d376f0fa66bd Jason Baron     2009-02-05  177  	struct ddebug_table *dt;
e9d376f0fa66bd Jason Baron     2009-02-05  178  	unsigned int newflags;
e9d376f0fa66bd Jason Baron     2009-02-05  179  	unsigned int nfound =3D 0;
90686c5cb845e7 Jim Cromie      2022-01-31  180  	struct flagsbuf fbuf, nbuf;
abdeb5614def0b Jim Cromie      2022-04-01  181  	struct ddebug_class_map *m=
ap =3D NULL;
abdeb5614def0b Jim Cromie      2022-04-01  182  	int __outvar valid_class;
e9d376f0fa66bd Jason Baron     2009-02-05  183  =

e9d376f0fa66bd Jason Baron     2009-02-05  184  	/* search for matching dde=
bugs */
e9d376f0fa66bd Jason Baron     2009-02-05  185  	mutex_lock(&ddebug_lock);
e9d376f0fa66bd Jason Baron     2009-02-05  186  	list_for_each_entry(dt, &d=
debug_tables, link) {
e9d376f0fa66bd Jason Baron     2009-02-05  187  =

e9d376f0fa66bd Jason Baron     2009-02-05  188  		/* match against the modu=
le name */
578b1e0701af34 Changbin Du     2014-01-23  189  		if (query->module &&
578b1e0701af34 Changbin Du     2014-01-23  190  		    !match_wildcard(query=
->module, dt->mod_name))
e9d376f0fa66bd Jason Baron     2009-02-05  191  			continue;
e9d376f0fa66bd Jason Baron     2009-02-05  192  =

abdeb5614def0b Jim Cromie      2022-04-01  193  		if (query->class_string) {
abdeb5614def0b Jim Cromie      2022-04-01 @194  			map =3D ddebug_find_vali=
d_class(dt, query->class_string, &valid_class);
abdeb5614def0b Jim Cromie      2022-04-01  195  			if (!map)
abdeb5614def0b Jim Cromie      2022-04-01  196  				continue;
abdeb5614def0b Jim Cromie      2022-04-01  197  		} else {
abdeb5614def0b Jim Cromie      2022-04-01  198  			/* constrain query, do n=
ot touch class'd callsites */
abdeb5614def0b Jim Cromie      2022-04-01  199  			valid_class =3D _DPRINTK=
_CLASS_DFLT;
abdeb5614def0b Jim Cromie      2022-04-01  200  		}
abdeb5614def0b Jim Cromie      2022-04-01  201  =

e9d376f0fa66bd Jason Baron     2009-02-05  202  		for (i =3D 0; i < dt->num=
_ddebugs; i++) {
e9d376f0fa66bd Jason Baron     2009-02-05  203  			struct _ddebug *dp =3D &=
dt->ddebugs[i];
e9d376f0fa66bd Jason Baron     2009-02-05  204  =

abdeb5614def0b Jim Cromie      2022-04-01  205  			/* match site against qu=
ery-class */
abdeb5614def0b Jim Cromie      2022-04-01  206  			if (dp->class_id !=3D va=
lid_class)
abdeb5614def0b Jim Cromie      2022-04-01  207  			    continue;
abdeb5614def0b Jim Cromie      2022-04-01  208  =

e9d376f0fa66bd Jason Baron     2009-02-05  209  			/* match against the sou=
rce filename */
d6a238d25014d0 Jim Cromie      2011-12-19  210  			if (query->filename &&
578b1e0701af34 Changbin Du     2014-01-23  211  			    !match_wildcard(quer=
y->filename, dp->filename) &&
578b1e0701af34 Changbin Du     2014-01-23  212  			    !match_wildcard(quer=
y->filename,
578b1e0701af34 Changbin Du     2014-01-23  213  					   kbasename(dp->filen=
ame)) &&
578b1e0701af34 Changbin Du     2014-01-23  214  			    !match_wildcard(quer=
y->filename,
578b1e0701af34 Changbin Du     2014-01-23  215  					   trim_prefix(dp->fil=
ename)))
e9d376f0fa66bd Jason Baron     2009-02-05  216  				continue;
e9d376f0fa66bd Jason Baron     2009-02-05  217  =

e9d376f0fa66bd Jason Baron     2009-02-05  218  			/* match against the fun=
ction */
d6a238d25014d0 Jim Cromie      2011-12-19  219  			if (query->function &&
578b1e0701af34 Changbin Du     2014-01-23  220  			    !match_wildcard(quer=
y->function, dp->function))
e9d376f0fa66bd Jason Baron     2009-02-05  221  				continue;
e9d376f0fa66bd Jason Baron     2009-02-05  222  =

e9d376f0fa66bd Jason Baron     2009-02-05  223  			/* match against the for=
mat */
4b334484fa7f44 Jim Cromie      2020-07-19  224  			if (query->format) {
4b334484fa7f44 Jim Cromie      2020-07-19  225  				if (*query->format =3D=
=3D '^') {
4b334484fa7f44 Jim Cromie      2020-07-19  226  					char *p;
4b334484fa7f44 Jim Cromie      2020-07-19  227  					/* anchored search. ma=
tch must be at beginning */
4b334484fa7f44 Jim Cromie      2020-07-19  228  					p =3D strstr(dp->forma=
t, query->format+1);
4b334484fa7f44 Jim Cromie      2020-07-19  229  					if (p !=3D dp->format)
4b334484fa7f44 Jim Cromie      2020-07-19  230  						continue;
4b334484fa7f44 Jim Cromie      2020-07-19  231  				} else if (!strstr(dp->=
format, query->format))
e9d376f0fa66bd Jason Baron     2009-02-05  232  					continue;
4b334484fa7f44 Jim Cromie      2020-07-19  233  			}
e9d376f0fa66bd Jason Baron     2009-02-05  234  =

e9d376f0fa66bd Jason Baron     2009-02-05  235  			/* match against the lin=
e number range */
e9d376f0fa66bd Jason Baron     2009-02-05  236  			if (query->first_lineno =
&&
e9d376f0fa66bd Jason Baron     2009-02-05  237  			    dp->lineno < query->=
first_lineno)
e9d376f0fa66bd Jason Baron     2009-02-05  238  				continue;
e9d376f0fa66bd Jason Baron     2009-02-05  239  			if (query->last_lineno &&
e9d376f0fa66bd Jason Baron     2009-02-05  240  			    dp->lineno > query->=
last_lineno)
e9d376f0fa66bd Jason Baron     2009-02-05  241  				continue;
e9d376f0fa66bd Jason Baron     2009-02-05  242  =

e9d376f0fa66bd Jason Baron     2009-02-05  243  			nfound++;
e9d376f0fa66bd Jason Baron     2009-02-05  244  =

84da83a6ffc0b7 Jim Cromie      2020-07-19  245  			newflags =3D (dp->flags =
& modifiers->mask) | modifiers->flags;
e9d376f0fa66bd Jason Baron     2009-02-05  246  			if (newflags =3D=3D dp->=
flags)
e9d376f0fa66bd Jason Baron     2009-02-05  247  				continue;
e9666d10a5677a Masahiro Yamada 2018-12-31  248  #ifdef CONFIG_JUMP_LABEL
9049fc745300c5 Jason Baron     2016-08-03  249  			if (dp->flags & _DPRINTK=
_FLAGS_PRINT) {
4e833e8f218649 Jim Cromie      2022-01-31  250  				if (!(newflags & _DPRIN=
TK_FLAGS_PRINT))
9049fc745300c5 Jason Baron     2016-08-03  251  					static_branch_disable(=
&dp->key.dd_key_true);
4e833e8f218649 Jim Cromie      2022-01-31  252  			} else if (newflags & _D=
PRINTK_FLAGS_PRINT) {
9049fc745300c5 Jason Baron     2016-08-03  253  				static_branch_enable(&d=
p->key.dd_key_true);
4e833e8f218649 Jim Cromie      2022-01-31  254  			}
9049fc745300c5 Jason Baron     2016-08-03  255  #endif
90686c5cb845e7 Jim Cromie      2022-01-31  256  			v4pr_info("changed %s:%d=
 [%s]%s %s =3D> %s\n",
2b6783191da721 Jim Cromie      2011-12-19  257  				  trim_prefix(dp->filen=
ame), dp->lineno,
e9d376f0fa66bd Jason Baron     2009-02-05  258  				  dt->mod_name, dp->fun=
ction,
90686c5cb845e7 Jim Cromie      2022-01-31  259  				  ddebug_describe_flags=
(dp->flags, &fbuf),
90686c5cb845e7 Jim Cromie      2022-01-31  260  				  ddebug_describe_flags=
(newflags, &nbuf));
90686c5cb845e7 Jim Cromie      2022-01-31  261  			dp->flags =3D newflags;
e9d376f0fa66bd Jason Baron     2009-02-05  262  		}
e9d376f0fa66bd Jason Baron     2009-02-05  263  	}
e9d376f0fa66bd Jason Baron     2009-02-05  264  	mutex_unlock(&ddebug_lock);
e9d376f0fa66bd Jason Baron     2009-02-05  265  =

e9d376f0fa66bd Jason Baron     2009-02-05  266  	if (!nfound && verbose)
4ad275e5cb576f Joe Perches     2011-08-11  267  		pr_info("no matches for q=
uery\n");
85f7f6c0edb841 Jim Cromie      2011-12-19  268  =

85f7f6c0edb841 Jim Cromie      2011-12-19  269  	return nfound;
e9d376f0fa66bd Jason Baron     2009-02-05  270  }
e9d376f0fa66bd Jason Baron     2009-02-05  271  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0177339555422679905==--

