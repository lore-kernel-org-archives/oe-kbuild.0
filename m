Content-Type: multipart/mixed; boundary="===============1203134882913161953=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [jimc:dyndbg-next 16/16] lib/dynamic_debug.c:203:8: warning: Branch condition evaluates to a garbage value [clang-analyzer-core.uninitialized.Branch]
Date: Wed, 01 Jun 2022 09:47:04 +0800
Message-ID: <202206010948.qN4YYduL-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1203134882913161953==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: lib/dynam=
ic_debug.c:203:8: warning: Branch condition evaluates to a garbage value [c=
lang-analyzer-core.uninitialized.Branch]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: Jim Cromie <jim.cromie@gmail.com>

tree:   https://github.com/jimc/linux.git dyndbg-next
head:   519000e6161f69c599038a4be3de19489a8caef6
commit: 519000e6161f69c599038a4be3de19489a8caef6 [16/16] dyndbg: nouveau's =
got like levels man
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: x86_64-randconfig-c007-20220530 (https://download.01.org/0day-ci/ar=
chive/20220601/202206010948.qN4YYduL-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0776c4=
8f9b7e69fa447bee57c7c0985caa856be9)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/jimc/linux/commit/519000e6161f69c599038a4be3de=
19489a8caef6
        git remote add jimc https://github.com/jimc/linux.git
        git fetch --no-tags jimc dyndbg-next
        git checkout 519000e6161f69c599038a4be3de19489a8caef6
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/io_uring.c:10075:2: note: Loop condition is false.  Exiting loop
           do {
           ^
   fs/io_uring.c:10107:2: note: Loop condition is false. Execution continue=
s on line 10122
           while (!list_empty(&ctx->tctx_list)) {
           ^
   fs/io_uring.c:10126:2: note: Calling 'io_ring_ctx_free'
           io_ring_ctx_free(ctx);
           ^~~~~~~~~~~~~~~~~~~~~
   fs/io_uring.c:9929:6: note: Assuming field 'mm_account' is null
           if (ctx->mm_account) {
               ^~~~~~~~~~~~~~~
   fs/io_uring.c:9929:2: note: Taking false branch
           if (ctx->mm_account) {
           ^
   fs/io_uring.c:9940:6: note: Assuming field 'buf_data' is null
           if (ctx->buf_data)
               ^~~~~~~~~~~~~
   fs/io_uring.c:9940:2: note: Taking false branch
           if (ctx->buf_data)
           ^
   fs/io_uring.c:9942:6: note: Assuming field 'file_data' is null
           if (ctx->file_data)
               ^~~~~~~~~~~~~~
   fs/io_uring.c:9942:2: note: Taking false branch
           if (ctx->file_data)
           ^
   fs/io_uring.c:9944:6: note: Assuming field 'rings' is null
           if (ctx->rings)
               ^~~~~~~~~~
   fs/io_uring.c:9944:2: note: Taking false branch
           if (ctx->rings)
           ^
   fs/io_uring.c:9947:2: note: Calling 'io_flush_apoll_cache'
           io_flush_apoll_cache(ctx);
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/io_uring.c:9917:2: note: Loop condition is true.  Entering loop body
           while (!list_empty(&ctx->apoll_cache)) {
           ^
   fs/io_uring.c:9921:3: note: Memory is released
                   kfree(apoll);
                   ^~~~~~~~~~~~
   fs/io_uring.c:9917:2: note: Loop condition is true.  Entering loop body
           while (!list_empty(&ctx->apoll_cache)) {
           ^
   fs/io_uring.c:9920:3: note: Calling 'list_del'
                   list_del(&apoll->poll.wait.entry);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:148:2: note: Calling '__list_del_entry'
           __list_del_entry(entry);
           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:134:2: note: Taking false branch
           if (!__list_del_entry_valid(entry))
           ^
   include/linux/list.h:137:13: note: Use of memory after it is freed
           __list_del(entry->prev, entry->next);
                      ^~~~~~~~~~~
   Suppressed 16 warnings (16 in non-user code).
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
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   22 warnings generated.
>> lib/dynamic_debug.c:203:8: warning: Branch condition evaluates to a garb=
age value [clang-analyzer-core.uninitialized.Branch]
                           if (!map) {
                               ^~~~
   lib/dynamic_debug.c:182:2: note: 'map' declared without an initial value
           struct ddebug_known_classes_map *map;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:187:2: note: Loop condition is true.  Entering loop =
body
           list_for_each_entry(dt, &ddebug_tables, link) {
           ^
   include/linux/list.h:638:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   lib/dynamic_debug.c:190:7: note: Assuming field 'module' is null
                   if (query->module &&
                       ^~~~~~~~~~~~~
   lib/dynamic_debug.c:190:21: note: Left side of '&&' is false
                   if (query->module &&
                                     ^
   lib/dynamic_debug.c:195:17: note: Calling 'ddebug_validate_classname'
                   query_class =3D ddebug_validate_classname(dt, query->cla=
ss_string, &map);
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~
   lib/dynamic_debug.c:154:6: note: Assuming 'class_string' is null
           if (!class_string)
               ^~~~~~~~~~~~~
   lib/dynamic_debug.c:154:2: note: Taking true branch
           if (!class_string)
           ^
   lib/dynamic_debug.c:155:3: note: Returning without writing to '*mapout'
                   return _DPRINTK_CLASS_DFLT;
                   ^
   lib/dynamic_debug.c:195:17: note: Returning from 'ddebug_validate_classn=
ame'
                   query_class =3D ddebug_validate_classname(dt, query->cla=
ss_string, &map);
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~
   lib/dynamic_debug.c:196:7: note: 'query_class' is >=3D 0
                   if (query_class < 0)
                       ^~~~~~~~~~~
   lib/dynamic_debug.c:196:3: note: Taking false branch
                   if (query_class < 0)
                   ^
   lib/dynamic_debug.c:199:15: note: Assuming 'i' is < field 'num_ddebugs'
                   for (i =3D 0; i < dt->num_ddebugs; i++) {
                               ^~~~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:199:3: note: Loop condition is true.  Entering loop =
body
                   for (i =3D 0; i < dt->num_ddebugs; i++) {
                   ^
   lib/dynamic_debug.c:203:8: note: Branch condition evaluates to a garbage=
 value
                           if (!map) {
                               ^~~~
   lib/dynamic_debug.c:624:2: warning: Call to function 'snprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(query, QUERY_SIZE, "class %s %c%s", dcp->map->classes[b=
itpos],
           ^~~~~~~~
   lib/dynamic_debug.c:624:2: note: Call to function 'snprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'snprintf_s' in case of C11
           snprintf(query, QUERY_SIZE, "class %s %c%s", dcp->map->classes[b=
itpos],
           ^~~~~~~~
   lib/dynamic_debug.c:769:11: warning: Call to function 'snprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           pos +=3D snprintf(buf + pos, remaining(pos), "<i=
ntr> ");
                                  ^~~~~~~~
   lib/dynamic_debug.c:769:11: note: Call to function 'snprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'snprintf_s' in case of C11
                           pos +=3D snprintf(buf + pos, remaining(pos), "<i=
ntr> ");
                                  ^~~~~~~~
   lib/dynamic_debug.c:771:11: warning: Call to function 'snprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           pos +=3D snprintf(buf + pos, remaining(pos), "[%=
d] ",
                                  ^~~~~~~~
   lib/dynamic_debug.c:771:11: note: Call to function 'snprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'snprintf_s' in case of C11
                           pos +=3D snprintf(buf + pos, remaining(pos), "[%=
d] ",
                                  ^~~~~~~~
   lib/dynamic_debug.c:776:10: warning: Call to function 'snprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   pos +=3D snprintf(buf + pos, remaining(pos), "%s:",
                          ^~~~~~~~
   lib/dynamic_debug.c:776:10: note: Call to function 'snprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'snprintf_s' in case of C11
                   pos +=3D snprintf(buf + pos, remaining(pos), "%s:",
                          ^~~~~~~~
   lib/dynamic_debug.c:779:10: warning: Call to function 'snprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   pos +=3D snprintf(buf + pos, remaining(pos), "%s:",
                          ^~~~~~~~
   lib/dynamic_debug.c:779:10: note: Call to function 'snprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'snprintf_s' in case of C11
                   pos +=3D snprintf(buf + pos, remaining(pos), "%s:",
                          ^~~~~~~~
   lib/dynamic_debug.c:782:10: warning: Call to function 'snprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   pos +=3D snprintf(buf + pos, remaining(pos), "%d:",
                          ^~~~~~~~
   lib/dynamic_debug.c:782:10: note: Call to function 'snprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'snprintf_s' in case of C11
                   pos +=3D snprintf(buf + pos, remaining(pos), "%d:",
                          ^~~~~~~~
   lib/dynamic_debug.c:785:10: warning: Call to function 'snprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   pos +=3D snprintf(buf + pos, remaining(pos), " ");
                          ^~~~~~~~
   lib/dynamic_debug.c:785:10: note: Call to function 'snprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'snprintf_s' in case of C11
                   pos +=3D snprintf(buf + pos, remaining(pos), " ");
                          ^~~~~~~~
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   fs/ntfs3/xattr.c:966:3: warning: 2nd function call argument is an uninit=
ialized value [clang-analyzer-core.CallAndMessage]
                   i_uid_write(inode, (uid_t)le32_to_cpu(value[0]));
                   ^                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ntfs3/xattr.c:960:6: note: Calling 'ntfs_get_ea'
           if (ntfs_get_ea(inode, "$LXUID", sizeof("$LXUID") - 1, &value[0],
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ntfs3/xattr.c:209:6: note: Assuming the condition is false
           if (!(ni->ni_flags & NI_FLAG_EA))

vim +203 lib/dynamic_debug.c

f657fd21e16e3a Joe Perches     2012-12-05  167  =

e9d376f0fa66bd Jason Baron     2009-02-05  168  /*
85f7f6c0edb841 Jim Cromie      2011-12-19  169   * Search the tables for _d=
debug's which match the given `query' and
85f7f6c0edb841 Jim Cromie      2011-12-19  170   * apply the `flags' and `m=
ask' to them.  Returns number of matching
85f7f6c0edb841 Jim Cromie      2011-12-19  171   * callsites, normally the =
same as number of changes.  If verbose,
85f7f6c0edb841 Jim Cromie      2011-12-19  172   * logs the changes.  Takes=
 ddebug_lock.
e9d376f0fa66bd Jason Baron     2009-02-05  173   */
85f7f6c0edb841 Jim Cromie      2011-12-19  174  static int ddebug_change(co=
nst struct ddebug_query *query,
84da83a6ffc0b7 Jim Cromie      2020-07-19  175  			 struct flag_settings *m=
odifiers)
e9d376f0fa66bd Jason Baron     2009-02-05  176  {
e9d376f0fa66bd Jason Baron     2009-02-05  177  	int i;
e9d376f0fa66bd Jason Baron     2009-02-05  178  	struct ddebug_table *dt;
e9d376f0fa66bd Jason Baron     2009-02-05  179  	unsigned int newflags;
e9d376f0fa66bd Jason Baron     2009-02-05  180  	unsigned int nfound =3D 0;
d9df95baf80420 Jim Cromie      2022-01-31  181  	struct flagsbuf fbuf, nbuf;
519000e6161f69 Jim Cromie      2022-05-27  182  	struct ddebug_known_classe=
s_map *map;
0389d9432ddc3b Jim Cromie      2022-04-01  183  	int query_class;
e9d376f0fa66bd Jason Baron     2009-02-05  184  =

e9d376f0fa66bd Jason Baron     2009-02-05  185  	/* search for matching dde=
bugs */
e9d376f0fa66bd Jason Baron     2009-02-05  186  	mutex_lock(&ddebug_lock);
e9d376f0fa66bd Jason Baron     2009-02-05  187  	list_for_each_entry(dt, &d=
debug_tables, link) {
e9d376f0fa66bd Jason Baron     2009-02-05  188  =

e9d376f0fa66bd Jason Baron     2009-02-05  189  		/* match against the modu=
le name */
578b1e0701af34 Changbin Du     2014-01-23  190  		if (query->module &&
578b1e0701af34 Changbin Du     2014-01-23  191  		    !match_wildcard(query=
->module, dt->mod_name))
e9d376f0fa66bd Jason Baron     2009-02-05  192  			continue;
e9d376f0fa66bd Jason Baron     2009-02-05  193  =

0389d9432ddc3b Jim Cromie      2022-04-01  194  		/* validate class-string =
against module's known classes */
519000e6161f69 Jim Cromie      2022-05-27  195  		query_class =3D ddebug_va=
lidate_classname(dt, query->class_string, &map);
0389d9432ddc3b Jim Cromie      2022-04-01  196  		if (query_class < 0)
0389d9432ddc3b Jim Cromie      2022-04-01  197  			continue;
0389d9432ddc3b Jim Cromie      2022-04-01  198  =

e9d376f0fa66bd Jason Baron     2009-02-05  199  		for (i =3D 0; i < dt->num=
_ddebugs; i++) {
e9d376f0fa66bd Jason Baron     2009-02-05  200  			struct _ddebug *dp =3D &=
dt->ddebugs[i];
e9d376f0fa66bd Jason Baron     2009-02-05  201  =

0389d9432ddc3b Jim Cromie      2022-04-01  202  			/* match against query-c=
lass, either valid input or default */
519000e6161f69 Jim Cromie      2022-05-27 @203  			if (!map) {
519000e6161f69 Jim Cromie      2022-05-27  204  				if (query_class !=3D dp=
->class_id)
519000e6161f69 Jim Cromie      2022-05-27  205  					continue;
519000e6161f69 Jim Cromie      2022-05-27  206  			} else {
519000e6161f69 Jim Cromie      2022-05-27  207  				switch (map->map_type) {
519000e6161f69 Jim Cromie      2022-05-27  208  				case DD_CLS_DISJOINT:
0389d9432ddc3b Jim Cromie      2022-04-01  209  					if (query_class !=3D d=
p->class_id)
0389d9432ddc3b Jim Cromie      2022-04-01  210  						continue;
519000e6161f69 Jim Cromie      2022-05-27  211  					break;
519000e6161f69 Jim Cromie      2022-05-27  212  				case DD_CLS_VERBOSE:
519000e6161f69 Jim Cromie      2022-05-27  213  					if (query_class < dp->=
class_id &&
519000e6161f69 Jim Cromie      2022-05-27  214  					    query_class >=3D m=
ap->base)
519000e6161f69 Jim Cromie      2022-05-27  215  						continue;
519000e6161f69 Jim Cromie      2022-05-27  216  					break;
519000e6161f69 Jim Cromie      2022-05-27  217  				case DD_CLS_PRIORITY:
519000e6161f69 Jim Cromie      2022-05-27  218  					if (query_class > dp->=
class_id &&
519000e6161f69 Jim Cromie      2022-05-27  219  					    query_class < map-=
>base + map->length)
519000e6161f69 Jim Cromie      2022-05-27  220  						continue;
519000e6161f69 Jim Cromie      2022-05-27  221  					break;
519000e6161f69 Jim Cromie      2022-05-27  222  				default:
519000e6161f69 Jim Cromie      2022-05-27  223  					BUG_ON("illegal enum v=
alue\n");
519000e6161f69 Jim Cromie      2022-05-27  224  				}
519000e6161f69 Jim Cromie      2022-05-27  225  			}
0389d9432ddc3b Jim Cromie      2022-04-01  226  =

e9d376f0fa66bd Jason Baron     2009-02-05  227  			/* match against the sou=
rce filename */
d6a238d25014d0 Jim Cromie      2011-12-19  228  			if (query->filename &&
578b1e0701af34 Changbin Du     2014-01-23  229  			    !match_wildcard(quer=
y->filename, dp->filename) &&
578b1e0701af34 Changbin Du     2014-01-23  230  			    !match_wildcard(quer=
y->filename,
578b1e0701af34 Changbin Du     2014-01-23  231  					   kbasename(dp->filen=
ame)) &&
578b1e0701af34 Changbin Du     2014-01-23  232  			    !match_wildcard(quer=
y->filename,
578b1e0701af34 Changbin Du     2014-01-23  233  					   trim_prefix(dp->fil=
ename)))
e9d376f0fa66bd Jason Baron     2009-02-05  234  				continue;
e9d376f0fa66bd Jason Baron     2009-02-05  235  =

e9d376f0fa66bd Jason Baron     2009-02-05  236  			/* match against the fun=
ction */
d6a238d25014d0 Jim Cromie      2011-12-19  237  			if (query->function &&
578b1e0701af34 Changbin Du     2014-01-23  238  			    !match_wildcard(quer=
y->function, dp->function))
e9d376f0fa66bd Jason Baron     2009-02-05  239  				continue;
e9d376f0fa66bd Jason Baron     2009-02-05  240  =

e9d376f0fa66bd Jason Baron     2009-02-05  241  			/* match against the for=
mat */
4b334484fa7f44 Jim Cromie      2020-07-19  242  			if (query->format) {
4b334484fa7f44 Jim Cromie      2020-07-19  243  				if (*query->format =3D=
=3D '^') {
4b334484fa7f44 Jim Cromie      2020-07-19  244  					char *p;
4b334484fa7f44 Jim Cromie      2020-07-19  245  					/* anchored search. ma=
tch must be at beginning */
4b334484fa7f44 Jim Cromie      2020-07-19  246  					p =3D strstr(dp->forma=
t, query->format+1);
4b334484fa7f44 Jim Cromie      2020-07-19  247  					if (p !=3D dp->format)
4b334484fa7f44 Jim Cromie      2020-07-19  248  						continue;
4b334484fa7f44 Jim Cromie      2020-07-19  249  				} else if (!strstr(dp->=
format, query->format))
e9d376f0fa66bd Jason Baron     2009-02-05  250  					continue;
4b334484fa7f44 Jim Cromie      2020-07-19  251  			}
e9d376f0fa66bd Jason Baron     2009-02-05  252  =

e9d376f0fa66bd Jason Baron     2009-02-05  253  			/* match against the lin=
e number range */
e9d376f0fa66bd Jason Baron     2009-02-05  254  			if (query->first_lineno =
&&
e9d376f0fa66bd Jason Baron     2009-02-05  255  			    dp->lineno < query->=
first_lineno)
e9d376f0fa66bd Jason Baron     2009-02-05  256  				continue;
e9d376f0fa66bd Jason Baron     2009-02-05  257  			if (query->last_lineno &&
e9d376f0fa66bd Jason Baron     2009-02-05  258  			    dp->lineno > query->=
last_lineno)
e9d376f0fa66bd Jason Baron     2009-02-05  259  				continue;
e9d376f0fa66bd Jason Baron     2009-02-05  260  =

e9d376f0fa66bd Jason Baron     2009-02-05  261  			nfound++;
e9d376f0fa66bd Jason Baron     2009-02-05  262  =

84da83a6ffc0b7 Jim Cromie      2020-07-19  263  			newflags =3D (dp->flags =
& modifiers->mask) | modifiers->flags;
e9d376f0fa66bd Jason Baron     2009-02-05  264  			if (newflags =3D=3D dp->=
flags)
e9d376f0fa66bd Jason Baron     2009-02-05  265  				continue;
e9666d10a5677a Masahiro Yamada 2018-12-31  266  #ifdef CONFIG_JUMP_LABEL
9049fc745300c5 Jason Baron     2016-08-03  267  			if (dp->flags & _DPRINTK=
_FLAGS_PRINT) {
4e833e8f218649 Jim Cromie      2022-01-31  268  				if (!(newflags & _DPRIN=
TK_FLAGS_PRINT))
9049fc745300c5 Jason Baron     2016-08-03  269  					static_branch_disable(=
&dp->key.dd_key_true);
4e833e8f218649 Jim Cromie      2022-01-31  270  			} else if (newflags & _D=
PRINTK_FLAGS_PRINT) {
9049fc745300c5 Jason Baron     2016-08-03  271  				static_branch_enable(&d=
p->key.dd_key_true);
4e833e8f218649 Jim Cromie      2022-01-31  272  			}
9049fc745300c5 Jason Baron     2016-08-03  273  #endif
d9df95baf80420 Jim Cromie      2022-01-31  274  			v4pr_info("changed %s:%d=
 [%s]%s %s -> %s\n",
2b6783191da721 Jim Cromie      2011-12-19  275  				  trim_prefix(dp->filen=
ame), dp->lineno,
e9d376f0fa66bd Jason Baron     2009-02-05  276  				  dt->mod_name, dp->fun=
ction,
d9df95baf80420 Jim Cromie      2022-01-31  277  				  ddebug_describe_flags=
(dp->flags, &fbuf),
d9df95baf80420 Jim Cromie      2022-01-31  278  				  ddebug_describe_flags=
(newflags, &nbuf));
d9df95baf80420 Jim Cromie      2022-01-31  279  			dp->flags =3D newflags;
e9d376f0fa66bd Jason Baron     2009-02-05  280  		}
e9d376f0fa66bd Jason Baron     2009-02-05  281  	}
e9d376f0fa66bd Jason Baron     2009-02-05  282  	mutex_unlock(&ddebug_lock);
e9d376f0fa66bd Jason Baron     2009-02-05  283  =

e9d376f0fa66bd Jason Baron     2009-02-05  284  	if (!nfound && verbose)
4ad275e5cb576f Joe Perches     2011-08-11  285  		pr_info("no matches for q=
uery\n");
85f7f6c0edb841 Jim Cromie      2011-12-19  286  =

85f7f6c0edb841 Jim Cromie      2011-12-19  287  	return nfound;
e9d376f0fa66bd Jason Baron     2009-02-05  288  }
e9d376f0fa66bd Jason Baron     2009-02-05  289  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1203134882913161953==--

