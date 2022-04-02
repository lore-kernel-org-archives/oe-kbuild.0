Content-Type: multipart/mixed; boundary="===============3687811757724090308=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [jimc:dyndbg-next 6/9] lib/dynamic_debug.c:182:13: warning: Uninitialized variable: dt->classes [uninitvar]
Date: Sat, 02 Apr 2022 08:23:45 +0800
Message-ID: <202204020817.JPgR9StA-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3687811757724090308==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: Jim Cromie <jim.cromie@gmail.com>

Hi Jim,

First bad commit (maybe !=3D root cause):

tree:   https://github.com/jimc/linux.git dyndbg-next
head:   cbf7619d7b351330a112a46e892e6ebf0f185c0f
commit: 5c2ca6a45a6773cd282c54025857370789d02927 [6/9] dyndbg: remove "clas=
s <number>" query support
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
compiler: ia64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   lib/dynamic_debug.c:1265:14: warning: Comparing pointers that point to d=
ifferent objects [comparePointers]
    for (; iter < __stop___dyndbg; iter++) {
                ^
   lib/dynamic_debug.c:42:23: note: Variable declared here.
   extern struct _ddebug __start___dyndbg[];
                         ^
   lib/dynamic_debug.c:1262:9: note: Array decayed to pointer here.
    iter =3D __start___dyndbg;
           ^
   lib/dynamic_debug.c:43:23: note: Variable declared here.
   extern struct _ddebug __stop___dyndbg[];
                         ^
   lib/dynamic_debug.c:1265:16: note: Array decayed to pointer here.
    for (; iter < __stop___dyndbg; iter++) {
                  ^
   lib/dynamic_debug.c:1265:14: note: Comparing pointers that point to diff=
erent objects
    for (; iter < __stop___dyndbg; iter++) {
                ^
   lib/dynamic_debug.c:957:60: warning: Parameter 'pos' can be declared wit=
h const [constParameter]
   static void *ddebug_proc_start(struct seq_file *m, loff_t *pos)
                                                              ^
   lib/dynamic_debug.c:980:57: warning: Parameter 'p' can be declared with =
const [constParameter]
   static void *ddebug_proc_next(struct seq_file *m, void *p, loff_t *pos)
                                                           ^
>> lib/dynamic_debug.c:182:13: warning: Uninitialized variable: dt->classes=
 [uninitvar]
      if (!dt->classes)
               ^
   lib/dynamic_debug.c:170:21: note: Assuming condition is false
     if (query->module &&
                       ^
   lib/dynamic_debug.c:182:13: note: Uninitialized variable: dt->classes
      if (!dt->classes)
               ^
>> lib/dynamic_debug.c:1081:12: warning: Uninitialized variable: dt->mod_na=
me [uninitvar]
      if (dt->mod_name =3D=3D map->mod->name) {
              ^
   lib/dynamic_debug.c:1196:11: warning: Uninitialized variable: dt->mod_na=
me [uninitvar]
     if (dt->mod_name =3D=3D mod_name) {
             ^
>> lib/dynamic_debug.c:105:12: warning: Using argument fb that points at un=
initialized variable flags [ctuuninitvar]
    char *p =3D fb->buf;
              ^
   lib/dynamic_debug.c:1014:27: note: Calling function ddebug_describe_flag=
s, 2nd argument is uninitialized
        ddebug_describe_flags(dp->flags, &flags));
                             ^
   lib/dynamic_debug.c:105:12: note: Using argument fb
    char *p =3D fb->buf;
              ^

vim +182 lib/dynamic_debug.c

f678ce8cc3cb2ad Jim Cromie      2020-07-19  101  =

e9d376f0fa66bd6 Jason Baron     2009-02-05  102  /* format a string into bu=
f[] which describes the _ddebug's flags */
f678ce8cc3cb2ad Jim Cromie      2020-07-19  103  static char *ddebug_descri=
be_flags(unsigned int flags, struct flagsbuf *fb)
e9d376f0fa66bd6 Jason Baron     2009-02-05  104  {
f678ce8cc3cb2ad Jim Cromie      2020-07-19 @105  	char *p =3D fb->buf;
8ba6ebf583f12da Bart Van Assche 2011-01-23  106  	int i;
e9d376f0fa66bd6 Jason Baron     2009-02-05  107  =

8ba6ebf583f12da Bart Van Assche 2011-01-23  108  	for (i =3D 0; i < ARRAY_S=
IZE(opt_array); ++i)
f678ce8cc3cb2ad Jim Cromie      2020-07-19  109  		if (flags & opt_array[i]=
.flag)
8ba6ebf583f12da Bart Van Assche 2011-01-23  110  			*p++ =3D opt_array[i].o=
pt_char;
f678ce8cc3cb2ad Jim Cromie      2020-07-19  111  	if (p =3D=3D fb->buf)
5ca7d2a6c5e4f24 Jim Cromie      2011-12-19  112  		*p++ =3D '_';
e9d376f0fa66bd6 Jason Baron     2009-02-05  113  	*p =3D '\0';
e9d376f0fa66bd6 Jason Baron     2009-02-05  114  =

f678ce8cc3cb2ad Jim Cromie      2020-07-19  115  	return fb->buf;
e9d376f0fa66bd6 Jason Baron     2009-02-05  116  }
e9d376f0fa66bd6 Jason Baron     2009-02-05  117  =

481c0e33f1e71a7 Jim Cromie      2020-07-19  118  #define vnpr_info(lvl, fmt=
, ...)				\
574b3725e327531 Jim Cromie      2011-12-19  119  do {								\
481c0e33f1e71a7 Jim Cromie      2020-07-19  120  	if (verbose >=3D lvl)				=
	\
f657fd21e16e3ab Joe Perches     2012-12-05  121  		pr_info(fmt, ##__VA_ARGS=
__);			\
574b3725e327531 Jim Cromie      2011-12-19  122  } while (0)
574b3725e327531 Jim Cromie      2011-12-19  123  =

481c0e33f1e71a7 Jim Cromie      2020-07-19  124  #define vpr_info(fmt, ...)=
	vnpr_info(1, fmt, ##__VA_ARGS__)
481c0e33f1e71a7 Jim Cromie      2020-07-19  125  #define v2pr_info(fmt, ...=
)	vnpr_info(2, fmt, ##__VA_ARGS__)
09ee10ff804ec4b Jim Cromie      2021-10-19  126  #define v3pr_info(fmt, ...=
)	vnpr_info(3, fmt, ##__VA_ARGS__)
09ee10ff804ec4b Jim Cromie      2021-10-19  127  #define v4pr_info(fmt, ...=
)	vnpr_info(4, fmt, ##__VA_ARGS__)
481c0e33f1e71a7 Jim Cromie      2020-07-19  128  =

f657fd21e16e3ab Joe Perches     2012-12-05  129  static void vpr_info_dq(co=
nst struct ddebug_query *query, const char *msg)
f657fd21e16e3ab Joe Perches     2012-12-05  130  {
f657fd21e16e3ab Joe Perches     2012-12-05  131  	/* trim any trailing newl=
ines */
f657fd21e16e3ab Joe Perches     2012-12-05  132  	int fmtlen =3D 0;
f657fd21e16e3ab Joe Perches     2012-12-05  133  =

f657fd21e16e3ab Joe Perches     2012-12-05  134  	if (query->format) {
f657fd21e16e3ab Joe Perches     2012-12-05  135  		fmtlen =3D strlen(query-=
>format);
f657fd21e16e3ab Joe Perches     2012-12-05  136  		while (fmtlen && query->=
format[fmtlen - 1] =3D=3D '\n')
f657fd21e16e3ab Joe Perches     2012-12-05  137  			fmtlen--;
f657fd21e16e3ab Joe Perches     2012-12-05  138  	}
f657fd21e16e3ab Joe Perches     2012-12-05  139  =

f5fcce134ef6f2b Jim Cromie      2022-03-31  140  	v3pr_info("%s: func=3D\"%=
s\" file=3D\"%s\" module=3D\"%s\" format=3D\"%.*s\" lineno=3D%u-%u class=3D=
%s\n",
f657fd21e16e3ab Joe Perches     2012-12-05  141  		  msg,
f62fc08fdc51d18 Jim Cromie      2020-07-19  142  		  query->function ?: "",
f62fc08fdc51d18 Jim Cromie      2020-07-19  143  		  query->filename ?: "",
f62fc08fdc51d18 Jim Cromie      2020-07-19  144  		  query->module ?: "",
f62fc08fdc51d18 Jim Cromie      2020-07-19  145  		  fmtlen, query->format =
?: "",
f5fcce134ef6f2b Jim Cromie      2022-03-31  146  		  query->first_lineno, q=
uery->last_lineno, query->class_string);
f657fd21e16e3ab Joe Perches     2012-12-05  147  }
f657fd21e16e3ab Joe Perches     2012-12-05  148  =

e9d376f0fa66bd6 Jason Baron     2009-02-05  149  /*
85f7f6c0edb8414 Jim Cromie      2011-12-19  150   * Search the tables for _=
ddebug's which match the given `query' and
85f7f6c0edb8414 Jim Cromie      2011-12-19  151   * apply the `flags' and `=
mask' to them.  Returns number of matching
85f7f6c0edb8414 Jim Cromie      2011-12-19  152   * callsites, normally the=
 same as number of changes.  If verbose,
85f7f6c0edb8414 Jim Cromie      2011-12-19  153   * logs the changes.  Take=
s ddebug_lock.
e9d376f0fa66bd6 Jason Baron     2009-02-05  154   */
85f7f6c0edb8414 Jim Cromie      2011-12-19  155  static int ddebug_change(c=
onst struct ddebug_query *query,
84da83a6ffc0b73 Jim Cromie      2020-07-19  156  			 struct flag_settings *=
modifiers)
e9d376f0fa66bd6 Jason Baron     2009-02-05  157  {
e9d376f0fa66bd6 Jason Baron     2009-02-05  158  	int i;
e9d376f0fa66bd6 Jason Baron     2009-02-05  159  	struct ddebug_table *dt;
e9d376f0fa66bd6 Jason Baron     2009-02-05  160  	unsigned int newflags;
e9d376f0fa66bd6 Jason Baron     2009-02-05  161  	unsigned int nfound =3D 0;
a24be0adb0f355e Jim Cromie      2022-01-31  162  	struct flagsbuf fbuf, nbu=
f;
594522fe41b7214 Jim Cromie      2021-07-28  163  	int query_class;
e9d376f0fa66bd6 Jason Baron     2009-02-05  164  =

e9d376f0fa66bd6 Jason Baron     2009-02-05  165  	/* search for matching dd=
ebugs */
e9d376f0fa66bd6 Jason Baron     2009-02-05  166  	mutex_lock(&ddebug_lock);
e9d376f0fa66bd6 Jason Baron     2009-02-05  167  	list_for_each_entry(dt, &=
ddebug_tables, link) {
e9d376f0fa66bd6 Jason Baron     2009-02-05  168  =

e9d376f0fa66bd6 Jason Baron     2009-02-05  169  		/* match against the mod=
ule name */
578b1e0701af34f Changbin Du     2014-01-23  170  		if (query->module &&
578b1e0701af34f Changbin Du     2014-01-23  171  		    !match_wildcard(quer=
y->module, dt->mod_name))
e9d376f0fa66bd6 Jason Baron     2009-02-05  172  			continue;
e9d376f0fa66bd6 Jason Baron     2009-02-05  173  =

f5fcce134ef6f2b Jim Cromie      2022-03-31  174  		/* validate class-string=
 against module's known classes */
f5fcce134ef6f2b Jim Cromie      2022-03-31  175  		query_class =3D _DPRINTK=
_CLASS_DFLT;
f5fcce134ef6f2b Jim Cromie      2022-03-31  176  		if (query->class_string)=
 {
f5fcce134ef6f2b Jim Cromie      2022-03-31  177  			int idx;
f5fcce134ef6f2b Jim Cromie      2022-03-31  178  			/*
f5fcce134ef6f2b Jim Cromie      2022-03-31  179  			 * XXX single list will=
 need to be a for-list
f5fcce134ef6f2b Jim Cromie      2022-03-31  180  			 * so that modules can =
have 2 sets of class-decls
f5fcce134ef6f2b Jim Cromie      2022-03-31  181  			 */
f5fcce134ef6f2b Jim Cromie      2022-03-31 @182  			if (!dt->classes)
f5fcce134ef6f2b Jim Cromie      2022-03-31  183  				continue;
f5fcce134ef6f2b Jim Cromie      2022-03-31  184  =

f5fcce134ef6f2b Jim Cromie      2022-03-31  185  			idx =3D match_string(dt=
->classes->classes,
f5fcce134ef6f2b Jim Cromie      2022-03-31  186  					   _DPRINTK_CLASS_DFL=
T, query->class_string);
f5fcce134ef6f2b Jim Cromie      2022-03-31  187  			if (idx < 0)
f5fcce134ef6f2b Jim Cromie      2022-03-31  188  				continue;
f5fcce134ef6f2b Jim Cromie      2022-03-31  189  			else
f5fcce134ef6f2b Jim Cromie      2022-03-31  190  				query_class =3D idx; /=
* XXX: + dt->classes->base */
f5fcce134ef6f2b Jim Cromie      2022-03-31  191  		}
f5fcce134ef6f2b Jim Cromie      2022-03-31  192  =

e9d376f0fa66bd6 Jason Baron     2009-02-05  193  		for (i =3D 0; i < dt->nu=
m_ddebugs; i++) {
e9d376f0fa66bd6 Jason Baron     2009-02-05  194  			struct _ddebug *dp =3D =
&dt->ddebugs[i];
e9d376f0fa66bd6 Jason Baron     2009-02-05  195  =

f5fcce134ef6f2b Jim Cromie      2022-03-31  196  			/* match against query-=
class, either given-&-validated or default */
f5fcce134ef6f2b Jim Cromie      2022-03-31  197  			if (query_class !=3D dp=
->class_id)
594522fe41b7214 Jim Cromie      2021-07-28  198  				continue;
594522fe41b7214 Jim Cromie      2021-07-28  199  =

e9d376f0fa66bd6 Jason Baron     2009-02-05  200  			/* match against the so=
urce filename */
d6a238d25014d0f Jim Cromie      2011-12-19  201  			if (query->filename &&
578b1e0701af34f Changbin Du     2014-01-23  202  			    !match_wildcard(que=
ry->filename, dp->filename) &&
578b1e0701af34f Changbin Du     2014-01-23  203  			    !match_wildcard(que=
ry->filename,
578b1e0701af34f Changbin Du     2014-01-23  204  					   kbasename(dp->file=
name)) &&
578b1e0701af34f Changbin Du     2014-01-23  205  			    !match_wildcard(que=
ry->filename,
578b1e0701af34f Changbin Du     2014-01-23  206  					   trim_prefix(dp->fi=
lename)))
e9d376f0fa66bd6 Jason Baron     2009-02-05  207  				continue;
e9d376f0fa66bd6 Jason Baron     2009-02-05  208  =

e9d376f0fa66bd6 Jason Baron     2009-02-05  209  			/* match against the fu=
nction */
d6a238d25014d0f Jim Cromie      2011-12-19  210  			if (query->function &&
578b1e0701af34f Changbin Du     2014-01-23  211  			    !match_wildcard(que=
ry->function, dp->function))
e9d376f0fa66bd6 Jason Baron     2009-02-05  212  				continue;
e9d376f0fa66bd6 Jason Baron     2009-02-05  213  =

e9d376f0fa66bd6 Jason Baron     2009-02-05  214  			/* match against the fo=
rmat */
4b334484fa7f44b Jim Cromie      2020-07-19  215  			if (query->format) {
4b334484fa7f44b Jim Cromie      2020-07-19  216  				if (*query->format =3D=
=3D '^') {
4b334484fa7f44b Jim Cromie      2020-07-19  217  					char *p;
4b334484fa7f44b Jim Cromie      2020-07-19  218  					/* anchored search. m=
atch must be at beginning */
4b334484fa7f44b Jim Cromie      2020-07-19  219  					p =3D strstr(dp->form=
at, query->format+1);
4b334484fa7f44b Jim Cromie      2020-07-19  220  					if (p !=3D dp->format)
4b334484fa7f44b Jim Cromie      2020-07-19  221  						continue;
4b334484fa7f44b Jim Cromie      2020-07-19  222  				} else if (!strstr(dp-=
>format, query->format))
e9d376f0fa66bd6 Jason Baron     2009-02-05  223  					continue;
4b334484fa7f44b Jim Cromie      2020-07-19  224  			}
e9d376f0fa66bd6 Jason Baron     2009-02-05  225  =

e9d376f0fa66bd6 Jason Baron     2009-02-05  226  			/* match against the li=
ne number range */
e9d376f0fa66bd6 Jason Baron     2009-02-05  227  			if (query->first_lineno=
 &&
e9d376f0fa66bd6 Jason Baron     2009-02-05  228  			    dp->lineno < query-=
>first_lineno)
e9d376f0fa66bd6 Jason Baron     2009-02-05  229  				continue;
e9d376f0fa66bd6 Jason Baron     2009-02-05  230  			if (query->last_lineno =
&&
e9d376f0fa66bd6 Jason Baron     2009-02-05  231  			    dp->lineno > query-=
>last_lineno)
e9d376f0fa66bd6 Jason Baron     2009-02-05  232  				continue;
e9d376f0fa66bd6 Jason Baron     2009-02-05  233  =

e9d376f0fa66bd6 Jason Baron     2009-02-05  234  			nfound++;
e9d376f0fa66bd6 Jason Baron     2009-02-05  235  =

84da83a6ffc0b73 Jim Cromie      2020-07-19  236  			newflags =3D (dp->flags=
 & modifiers->mask) | modifiers->flags;
e9d376f0fa66bd6 Jason Baron     2009-02-05  237  			if (newflags =3D=3D dp-=
>flags)
e9d376f0fa66bd6 Jason Baron     2009-02-05  238  				continue;
e9666d10a5677a4 Masahiro Yamada 2018-12-31  239  #ifdef CONFIG_JUMP_LABEL
9049fc745300c5e Jason Baron     2016-08-03  240  			if (dp->flags & _DPRINT=
K_FLAGS_PRINT) {
b4deead228e6b6d Jim Cromie      2022-01-31  241  				if (!(newflags & _DPRI=
NTK_FLAGS_PRINT))
9049fc745300c5e Jason Baron     2016-08-03  242  					static_branch_disable=
(&dp->key.dd_key_true);
b4deead228e6b6d Jim Cromie      2022-01-31  243  			} else if (newflags & _=
DPRINTK_FLAGS_PRINT) {
9049fc745300c5e Jason Baron     2016-08-03  244  				static_branch_enable(&=
dp->key.dd_key_true);
b4deead228e6b6d Jim Cromie      2022-01-31  245  			}
9049fc745300c5e Jason Baron     2016-08-03  246  #endif
a24be0adb0f355e Jim Cromie      2022-01-31  247  			v4pr_info("changed %s:%=
d [%s]%s %s -> %s\n",
2b6783191da7211 Jim Cromie      2011-12-19  248  				  trim_prefix(dp->file=
name), dp->lineno,
e9d376f0fa66bd6 Jason Baron     2009-02-05  249  				  dt->mod_name, dp->fu=
nction,
a24be0adb0f355e Jim Cromie      2022-01-31  250  				  ddebug_describe_flag=
s(dp->flags, &fbuf),
a24be0adb0f355e Jim Cromie      2022-01-31  251  				  ddebug_describe_flag=
s(newflags, &nbuf));
a24be0adb0f355e Jim Cromie      2022-01-31  252  			dp->flags =3D newflags;
e9d376f0fa66bd6 Jason Baron     2009-02-05  253  		}
e9d376f0fa66bd6 Jason Baron     2009-02-05  254  	}
e9d376f0fa66bd6 Jason Baron     2009-02-05  255  	mutex_unlock(&ddebug_lock=
);
e9d376f0fa66bd6 Jason Baron     2009-02-05  256  =

e9d376f0fa66bd6 Jason Baron     2009-02-05  257  	if (!nfound && verbose)
4ad275e5cb576fa Joe Perches     2011-08-11  258  		pr_info("no matches for =
query\n");
85f7f6c0edb8414 Jim Cromie      2011-12-19  259  =

85f7f6c0edb8414 Jim Cromie      2011-12-19  260  	return nfound;
e9d376f0fa66bd6 Jason Baron     2009-02-05  261  }
e9d376f0fa66bd6 Jason Baron     2009-02-05  262  =


:::::: The code at line 182 was first introduced by commit
:::::: f5fcce134ef6f2b57fb835b118fdb60cb9e1a983 squash-w-next

:::::: TO: Jim Cromie <jim.cromie@gmail.com>
:::::: CC: Jim Cromie <jim.cromie@gmail.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3687811757724090308==--

