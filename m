Content-Type: multipart/mixed; boundary="===============6277368413615893440=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [rostedt-trace:ftrace/core 24/24] kernel/trace/trace_events_hist.c:1521:6: warning: Branch condition evaluates to a garbage value [clang-analyzer-core.uninitialized.Branch]
Date: Mon, 13 Dec 2021 21:53:58 +0800
Message-ID: <202112132144.5GVZmljB-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6277368413615893440==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Tom Zanussi <zanussi@kernel.org>
CC: "Steven Rostedt (VMware)" <rostedt@goodmis.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace=
.git ftrace/core
head:   85c62c8c3749eec02ba81217bdcac26867dc262e
commit: 85c62c8c3749eec02ba81217bdcac26867dc262e [24/24] tracing: Have exis=
ting event_command.parse() implementations use helpers
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-c001-20211212 (https://download.01.org/0day-ci/arch=
ive/20211213/202112132144.5GVZmljB-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 097a1c=
b1d5ebb3a0ec4bcaed8ba3ff6a8e33c00a)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-tra=
ce.git/commit/?id=3D85c62c8c3749eec02ba81217bdcac26867dc262e
        git remote add rostedt-trace https://git.kernel.org/pub/scm/linux/k=
ernel/git/rostedt/linux-trace.git
        git fetch --no-tags rostedt-trace ftrace/core
        git checkout 85c62c8c3749eec02ba81217bdcac26867dc262e
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   include/linux/minmax.h:112:27: note: expanded from macro 'max_t'
   #define max_t(type, x, y)       __careful_cmp((type)(x), (type)(y), >)
                                   ^
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   drivers/hwmon/lm75.h:27:14: note: '__UNIQUE_ID___x226' is < '__UNIQUE_ID=
___y227'
           int ntemp =3D clamp_val(temp, LM75_TEMP_MIN, LM75_TEMP_MAX);
                       ^
   include/linux/minmax.h:137:32: note: expanded from macro 'clamp_val'
   #define clamp_val(val, lo, hi) clamp_t(typeof(val), val, lo, hi)
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:124:36: note: expanded from macro 'clamp_t'
   #define clamp_t(type, val, lo, hi) min_t(type, max_t(type, val, lo), hi)
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:104:27: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~
   drivers/hwmon/lm75.h:27:14: note: '?' condition is true
           int ntemp =3D clamp_val(temp, LM75_TEMP_MIN, LM75_TEMP_MAX);
                       ^
   include/linux/minmax.h:137:32: note: expanded from macro 'clamp_val'
   #define clamp_val(val, lo, hi) clamp_t(typeof(val), val, lo, hi)
                                  ^
   include/linux/minmax.h:124:36: note: expanded from macro 'clamp_t'
   #define clamp_t(type, val, lo, hi) min_t(type, max_t(type, val, lo), hi)
                                      ^
   include/linux/minmax.h:104:27: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
                                   ^
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   drivers/hwmon/lm75.h:29:12: note: 'ntemp' is < 0
           ntemp +=3D (ntemp < 0 ? -250 : 250);
                     ^~~~~
   drivers/hwmon/lm75.h:29:12: note: '?' condition is true
   drivers/hwmon/lm75.h:30:29: note: The result of the left shift is undefi=
ned because the left operand is negative
           return (u16)((ntemp / 500) << 7);
                        ~~~~~~~~~~~~~ ^
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   kernel/trace/trace_events_hist.c:1301:4: warning: Call to function 'strc=
at' is insecure as it does not provide bounding of the memory buffer. Repla=
ce unbounded copy functions with analogous functions that support length ar=
guments such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.str=
cpy]
                           strcat(full_name, field->system);
                           ^~~~~~
   kernel/trace/trace_events_hist.c:1301:4: note: Call to function 'strcat'=
 is insecure as it does not provide bounding of the memory buffer. Replace =
unbounded copy functions with analogous functions that support length argum=
ents such as 'strlcat'. CWE-119
                           strcat(full_name, field->system);
                           ^~~~~~
   kernel/trace/trace_events_hist.c:1302:4: warning: Call to function 'strc=
at' is insecure as it does not provide bounding of the memory buffer. Repla=
ce unbounded copy functions with analogous functions that support length ar=
guments such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.str=
cpy]
                           strcat(full_name, ".");
                           ^~~~~~
   kernel/trace/trace_events_hist.c:1302:4: note: Call to function 'strcat'=
 is insecure as it does not provide bounding of the memory buffer. Replace =
unbounded copy functions with analogous functions that support length argum=
ents such as 'strlcat'. CWE-119
                           strcat(full_name, ".");
                           ^~~~~~
   kernel/trace/trace_events_hist.c:1303:4: warning: Call to function 'strc=
at' is insecure as it does not provide bounding of the memory buffer. Repla=
ce unbounded copy functions with analogous functions that support length ar=
guments such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.str=
cpy]
                           strcat(full_name, field->event_name);
                           ^~~~~~
   kernel/trace/trace_events_hist.c:1303:4: note: Call to function 'strcat'=
 is insecure as it does not provide bounding of the memory buffer. Replace =
unbounded copy functions with analogous functions that support length argum=
ents such as 'strlcat'. CWE-119
                           strcat(full_name, field->event_name);
                           ^~~~~~
   kernel/trace/trace_events_hist.c:1304:4: warning: Call to function 'strc=
at' is insecure as it does not provide bounding of the memory buffer. Repla=
ce unbounded copy functions with analogous functions that support length ar=
guments such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.str=
cpy]
                           strcat(full_name, ".");
                           ^~~~~~
   kernel/trace/trace_events_hist.c:1304:4: note: Call to function 'strcat'=
 is insecure as it does not provide bounding of the memory buffer. Replace =
unbounded copy functions with analogous functions that support length argum=
ents such as 'strlcat'. CWE-119
                           strcat(full_name, ".");
                           ^~~~~~
   kernel/trace/trace_events_hist.c:1305:4: warning: Call to function 'strc=
at' is insecure as it does not provide bounding of the memory buffer. Repla=
ce unbounded copy functions with analogous functions that support length ar=
guments such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.str=
cpy]
                           strcat(full_name, field->name);
                           ^~~~~~
   kernel/trace/trace_events_hist.c:1305:4: note: Call to function 'strcat'=
 is insecure as it does not provide bounding of the memory buffer. Replace =
unbounded copy functions with analogous functions that support length argum=
ents such as 'strlcat'. CWE-119
                           strcat(full_name, field->name);
                           ^~~~~~
>> kernel/trace/trace_events_hist.c:1521:6: warning: Branch condition evalu=
ates to a garbage value [clang-analyzer-core.uninitialized.Branch]
           if (!attrs->keys_str) {
               ^
   kernel/trace/trace_events_hist.c:5784:19: note: Assuming field 'ref' is =
> 0
           if (WARN_ON_ONCE(data->ref <=3D 0))
                            ^
   include/asm-generic/bug.h:104:25: note: expanded from macro 'WARN_ON_ONC=
E'
           int __ret_warn_on =3D !!(condition);                      \
                                  ^~~~~~~~~
   kernel/trace/trace_events_hist.c:5784:6: note: Taking false branch
           if (WARN_ON_ONCE(data->ref <=3D 0))
               ^
   include/asm-generic/bug.h:105:2: note: expanded from macro 'WARN_ON_ONCE'
           if (unlikely(__ret_warn_on))                            \
           ^
   kernel/trace/trace_events_hist.c:5784:2: note: Taking false branch
           if (WARN_ON_ONCE(data->ref <=3D 0))
           ^
   kernel/trace/trace_events_hist.c:5787:2: note: Calling 'event_hist_trigg=
er_free'
           event_hist_trigger_free(ops, data->named_data);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_events_hist.c:5744:19: note: Assuming field 'ref' is =
> 0
           if (WARN_ON_ONCE(data->ref <=3D 0))
                            ^
   include/asm-generic/bug.h:104:25: note: expanded from macro 'WARN_ON_ONC=
E'
           int __ret_warn_on =3D !!(condition);                      \
                                  ^~~~~~~~~
   kernel/trace/trace_events_hist.c:5744:6: note: Taking false branch
           if (WARN_ON_ONCE(data->ref <=3D 0))
               ^
   include/asm-generic/bug.h:105:2: note: expanded from macro 'WARN_ON_ONCE'
           if (unlikely(__ret_warn_on))                            \
           ^
   kernel/trace/trace_events_hist.c:5744:2: note: Taking false branch
           if (WARN_ON_ONCE(data->ref <=3D 0))
           ^
   kernel/trace/trace_events_hist.c:5748:6: note: Assuming field 'ref' is 0
           if (!data->ref) {
               ^~~~~~~~~~
   kernel/trace/trace_events_hist.c:5748:2: note: Taking true branch
           if (!data->ref) {
           ^
   kernel/trace/trace_events_hist.c:5749:7: note: Assuming field 'name' is =
null
                   if (data->name)
                       ^~~~~~~~~~
   kernel/trace/trace_events_hist.c:5749:3: note: Taking false branch
                   if (data->name)
                   ^
   kernel/trace/trace_events_hist.c:5756:3: note: Calling 'unregister_field=
_var_hists'
                   unregister_field_var_hists(hist_data);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_events_hist.c:5730:14: note: Assuming 'i' is < field =
'n_field_var_hists'
           for (i =3D 0; i < hist_data->n_field_var_hists; i++) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_events_hist.c:5730:2: note: Loop condition is true.  =
Entering loop body
           for (i =3D 0; i < hist_data->n_field_var_hists; i++) {
           ^
   kernel/trace/trace_events_hist.c:5733:9: note: Calling 'event_hist_trigg=
er_parse'
                   ret =3D event_hist_trigger_parse(&trigger_hist_cmd, file,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_events_hist.c:6167:2: note: Assuming 'debug_locks' is=
 0
           lockdep_assert_held(&event_mutex);
           ^
   include/linux/lockdep.h:316:2: note: expanded from macro 'lockdep_assert=
_held'
           lockdep_assert(lockdep_is_held(l) !=3D LOCK_STATE_NOT_HELD)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:310:15: note: expanded from macro 'lockdep_asser=
t'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
                        ^~~~~~~~~~~
   include/asm-generic/bug.h:121:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   kernel/trace/trace_events_hist.c:6167:2: note: Left side of '&&' is false
           lockdep_assert_held(&event_mutex);
           ^
   include/linux/lockdep.h:316:2: note: expanded from macro 'lockdep_assert=
_held'
           lockdep_assert(lockdep_is_held(l) !=3D LOCK_STATE_NOT_HELD)
           ^
   include/linux/lockdep.h:310:27: note: expanded from macro 'lockdep_asser=
t'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
                                    ^
   kernel/trace/trace_events_hist.c:6167:2: note: Taking false branch
           lockdep_assert_held(&event_mutex);
           ^
   include/linux/lockdep.h:316:2: note: expanded from macro 'lockdep_assert=
_held'
           lockdep_assert(lockdep_is_held(l) !=3D LOCK_STATE_NOT_HELD)
           ^
   include/linux/lockdep.h:310:7: note: expanded from macro 'lockdep_assert'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
                ^
   include/asm-generic/bug.h:122:2: note: expanded from macro 'WARN_ON'
           if (unlikely(__ret_warn_on))                                    \
           ^
   kernel/trace/trace_events_hist.c:6167:2: note: Loop condition is false. =
 Exiting loop
           lockdep_assert_held(&event_mutex);
           ^
   include/linux/lockdep.h:316:2: note: expanded from macro 'lockdep_assert=
_held'
           lockdep_assert(lockdep_is_held(l) !=3D LOCK_STATE_NOT_HELD)
           ^
   include/linux/lockdep.h:310:2: note: expanded from macro 'lockdep_assert'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
--
                   ^
   kernel/trace/trace_events_hist.c:3929:14: note: Calling 'create_var_ref'
                           var_ref =3D create_var_ref(hist_data, hist_field,
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_events_hist.c:2123:14: note: Assuming 'i' is >=3D fie=
ld 'n_var_refs'
           for (i =3D 0; i < hist_data->n_var_refs; i++) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_events_hist.c:2123:2: note: Loop condition is false. =
Execution continues on line 2132
           for (i =3D 0; i < hist_data->n_var_refs; i++) {
           ^
   kernel/trace/trace_events_hist.c:2132:14: note: Calling 'create_hist_fie=
ld'
           ref_field =3D create_hist_field(var_field->hist_data, NULL, flag=
s, NULL);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   kernel/trace/trace_events_hist.c:1891:6: note: 'field' is null
           if (field && is_function_field(field))
               ^~~~~
   kernel/trace/trace_events_hist.c:1891:12: note: Left side of '&&' is fal=
se
           if (field && is_function_field(field))
                     ^
   kernel/trace/trace_events_hist.c:1894:15: note: Calling 'kzalloc'
           hist_field =3D kzalloc(sizeof(struct hist_field), GFP_KERNEL);
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:724:9: note: Uninitialized value stored to field 'n=
ame'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:724:2: note: Returning pointer, which participates =
in a condition later
           return kmalloc(size, flags | __GFP_ZERO);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_events_hist.c:1894:15: note: Returning from 'kzalloc'
           hist_field =3D kzalloc(sizeof(struct hist_field), GFP_KERNEL);
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_events_hist.c:1895:6: note: Assuming 'hist_field' is =
non-null
           if (!hist_field)
               ^~~~~~~~~~~
   kernel/trace/trace_events_hist.c:1895:2: note: Taking false branch
           if (!hist_field)
           ^
   kernel/trace/trace_events_hist.c:1902:6: note: Left side of '||' is false
           if (flags & HIST_FIELD_FL_EXPR || flags & HIST_FIELD_FL_ALIAS)
               ^
   kernel/trace/trace_events_hist.c:1902:2: note: Taking false branch
           if (flags & HIST_FIELD_FL_EXPR || flags & HIST_FIELD_FL_ALIAS)
           ^
   kernel/trace/trace_events_hist.c:1905:2: note: Taking true branch
           if (flags & HIST_FIELD_FL_VAR_REF) {
           ^
   kernel/trace/trace_events_hist.c:1907:3: note: Control jumps to line 1994
                   goto out;
                   ^
   kernel/trace/trace_events_hist.c:1997:6: note: 'var_name' is null
           if (var_name) {
               ^~~~~~~~
   kernel/trace/trace_events_hist.c:1997:2: note: Taking false branch
           if (var_name) {
           ^
   kernel/trace/trace_events_hist.c:2003:2: note: Returning pointer (loaded=
 from 'hist_field'), which participates in a condition later
           return hist_field;
           ^~~~~~~~~~~~~~~~~
   kernel/trace/trace_events_hist.c:2132:14: note: Returning from 'create_h=
ist_field'
           ref_field =3D create_hist_field(var_field->hist_data, NULL, flag=
s, NULL);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   kernel/trace/trace_events_hist.c:2133:6: note: 'ref_field' is non-null
           if (ref_field) {
               ^~~~~~~~~
   kernel/trace/trace_events_hist.c:2133:2: note: Taking true branch
           if (ref_field) {
           ^
   kernel/trace/trace_events_hist.c:2134:7: note: Calling 'init_var_ref'
                   if (init_var_ref(ref_field, var_field, system, event_nam=
e)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   kernel/trace/trace_events_hist.c:2040:6: note: 'system' is non-null
           if (system) {
               ^~~~~~
   kernel/trace/trace_events_hist.c:2040:2: note: Taking true branch
           if (system) {
           ^
   kernel/trace/trace_events_hist.c:2042:7: note: Assuming field 'system' i=
s non-null
                   if (!ref_field->system)
                       ^~~~~~~~~~~~~~~~~~
   kernel/trace/trace_events_hist.c:2042:3: note: Taking false branch
                   if (!ref_field->system)
                   ^
   kernel/trace/trace_events_hist.c:2046:6: note: 'event_name' is non-null
           if (event_name) {
               ^~~~~~~~~~
   kernel/trace/trace_events_hist.c:2046:2: note: Taking true branch
           if (event_name) {
           ^
   kernel/trace/trace_events_hist.c:2048:7: note: Assuming field 'event_nam=
e' is null
                   if (!ref_field->event_name) {
                       ^~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_events_hist.c:2048:3: note: Taking true branch
                   if (!ref_field->event_name) {
                   ^
   kernel/trace/trace_events_hist.c:2050:4: note: Control jumps to line 2076
                           goto free;
                           ^
   kernel/trace/trace_events_hist.c:2078:2: note: 1st function call argumen=
t is an uninitialized value
           kfree(ref_field->name);
           ^     ~~~~~~~~~~~~~~~
>> kernel/trace/trace_events_hist.c:2136:4: warning: Potential leak of memo=
ry pointed to by 'ref_field' [clang-analyzer-unix.Malloc]
                           return NULL;
                           ^
   kernel/trace/trace_events_hist.c:3490:6: note: Assuming the condition is=
 false
           if (track_data_var_str[0] !=3D '$') {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_events_hist.c:3490:2: note: Taking false branch
           if (track_data_var_str[0] !=3D '$') {
           ^
   kernel/trace/trace_events_hist.c:3497:6: note: Assuming 'var_field' is n=
on-null
           if (!var_field) {
               ^~~~~~~~~~
   kernel/trace/trace_events_hist.c:3497:2: note: Taking false branch
           if (!var_field) {
           ^
   kernel/trace/trace_events_hist.c:3503:7: note: 'ref_field' is non-null
           if (!ref_field)
                ^~~~~~~~~
   kernel/trace/trace_events_hist.c:3503:2: note: Taking false branch
           if (!ref_field)
           ^
   kernel/trace/trace_events_hist.c:3508:6: note: Assuming field 'handler' =
is not equal to HANDLER_ONMAX
           if (data->handler =3D=3D HANDLER_ONMAX)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_events_hist.c:3508:2: note: Taking false branch
           if (data->handler =3D=3D HANDLER_ONMAX)
           ^
   kernel/trace/trace_events_hist.c:3510:2: note: Taking false branch
           if (IS_ERR(track_var)) {
           ^
   kernel/trace/trace_events_hist.c:3516:6: note: Assuming field 'handler' =
is not equal to HANDLER_ONCHANGE
           if (data->handler =3D=3D HANDLER_ONCHANGE)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_events_hist.c:3516:2: note: Taking false branch
           if (data->handler =3D=3D HANDLER_ONCHANGE)
           ^
   kernel/trace/trace_events_hist.c:3518:2: note: Taking false branch
           if (IS_ERR(track_var)) {
           ^
   kernel/trace/trace_events_hist.c:3525:8: note: Calling 'action_create'
           ret =3D action_create(hist_data, data);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_events_hist.c:3982:6: note: Assuming field 'action' i=
s equal to ACTION_TRACE
           if (data->action =3D=3D ACTION_TRACE)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_events_hist.c:3982:2: note: Taking true branch
           if (data->action =3D=3D ACTION_TRACE)
           ^
   kernel/trace/trace_events_hist.c:3983:10: note: Calling 'trace_action_cr=
eate'
                   return trace_action_create(hist_data, data);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_events_hist.c:3874:2: note: Assuming 'debug_locks' is=
 0
           lockdep_assert_held(&event_mutex);
           ^
   include/linux/lockdep.h:316:2: note: expanded from macro 'lockdep_assert=
_held'
           lockdep_assert(lockdep_is_held(l) !=3D LOCK_STATE_NOT_HELD)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:310:15: note: expanded from macro 'lockdep_asser=
t'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
                        ^~~~~~~~~~~
   include/asm-generic/bug.h:121:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   kernel/trace/trace_events_hist.c:3874:2: note: Left side of '&&' is false
           lockdep_assert_held(&event_mutex);
           ^
   include/linux/lockdep.h:316:2: note: expanded from macro 'lockdep_assert=
_held'
           lockdep_assert(lockdep_is_held(l) !=3D LOCK_STATE_NOT_HELD)
           ^
   include/linux/lockdep.h:310:27: note: expanded from macro 'lockdep_asser=
t'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
                                    ^
   kernel/trace/trace_events_hist.c:3874:2: note: Taking false branch
           lockdep_assert_held(&event_mutex);
           ^
   include/linux/lockdep.h:316:2: note: expanded from macro 'lockdep_assert=
_held'
           lockdep_assert(lockdep_is_held(l) !=3D LOCK_STATE_NOT_HELD)
           ^
   include/linux/lockdep.h:310:7: note: expanded from macro 'lockdep_assert'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
                ^
   include/asm-generic/bug.h:122:2: note: expanded from macro 'WARN_ON'
           if (unlikely(__ret_warn_on))                                    \
           ^
   kernel/trace/trace_events_hist.c:3874:2: note: Loop condition is false. =
 Exiting loop
           lockdep_assert_held(&event_mutex);
           ^
   include/linux/lockdep.h:316:2: note: expanded from macro 'lockdep_assert=
_held'
           lockdep_assert(lockdep_is_held(l) !=3D LOCK_STATE_NOT_HELD)
           ^
   include/linux/lockdep.h:310:2: note: expanded from macro 'lockdep_assert'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
           ^
   kernel/trace/trace_events_hist.c:3876:6: note: Assuming field 'use_trace=
_keyword' is false
           if (data->use_trace_keyword)
               ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_events_hist.c:3876:2: note: Taking false branch
           if (data->use_trace_keyword)
           ^
   kernel/trace/trace_events_hist.c:3882:6: note: Assuming 'event' is non-n=
ull
           if (!event) {

vim +1521 kernel/trace/trace_events_hist.c

9b1ae035c9304e Tom Zanussi             2018-01-15  1482  =

d0cd871ba0d613 Steven Rostedt (VMware  2019-04-01  1483) static struct hist=
_trigger_attrs *
d0cd871ba0d613 Steven Rostedt (VMware  2019-04-01  1484) parse_hist_trigger=
_attrs(struct trace_array *tr, char *trigger_str)
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  1485  {
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  1486  	struct hist_trigg=
er_attrs *attrs;
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  1487  	int ret =3D 0;
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  1488  =

7ef224d1d0e3a1 Tom Zanussi             2016-03-03  1489  	attrs =3D kzalloc=
(sizeof(*attrs), GFP_KERNEL);
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  1490  	if (!attrs)
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  1491  		return ERR_PTR(-=
ENOMEM);
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  1492  =

7ef224d1d0e3a1 Tom Zanussi             2016-03-03  1493  	while (trigger_st=
r) {
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  1494  		char *str =3D st=
rsep(&trigger_str, ":");
b527b638fd63ba Tom Zanussi             2019-06-28  1495  		char *rhs;
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  1496  =

b527b638fd63ba Tom Zanussi             2019-06-28  1497  		rhs =3D strchr(s=
tr, '=3D');
b527b638fd63ba Tom Zanussi             2019-06-28  1498  		if (rhs) {
b527b638fd63ba Tom Zanussi             2019-06-28  1499  			if (!strlen(++r=
hs)) {
b527b638fd63ba Tom Zanussi             2019-06-28  1500  				ret =3D -EINVA=
L;
4de26c8c967d55 Tom Zanussi             2019-06-28  1501  				hist_err(tr, H=
IST_ERR_EMPTY_ASSIGNMENT, errpos(str));
b527b638fd63ba Tom Zanussi             2019-06-28  1502  				goto free;
b527b638fd63ba Tom Zanussi             2019-06-28  1503  			}
d0cd871ba0d613 Steven Rostedt (VMware  2019-04-01  1504) 			ret =3D parse_a=
ssignment(tr, str, attrs);
9b1ae035c9304e Tom Zanussi             2018-01-15  1505  			if (ret)
9b1ae035c9304e Tom Zanussi             2018-01-15  1506  				goto free;
9b1ae035c9304e Tom Zanussi             2018-01-15  1507  		} else if (strcm=
p(str, "pause") =3D=3D 0)
83e99914c9e267 Tom Zanussi             2016-03-03  1508  			attrs->pause =
=3D true;
83e99914c9e267 Tom Zanussi             2016-03-03  1509  		else if ((strcmp=
(str, "cont") =3D=3D 0) ||
83e99914c9e267 Tom Zanussi             2016-03-03  1510  			 (strcmp(str, "=
continue") =3D=3D 0))
83e99914c9e267 Tom Zanussi             2016-03-03  1511  			attrs->cont =3D=
 true;
e86ae9baacfa9e Tom Zanussi             2016-03-03  1512  		else if (strcmp(=
str, "clear") =3D=3D 0)
e86ae9baacfa9e Tom Zanussi             2016-03-03  1513  			attrs->clear =
=3D true;
9b1ae035c9304e Tom Zanussi             2018-01-15  1514  		else {
0212e2aa30e112 Tom Zanussi             2018-01-15  1515  			ret =3D parse_a=
ction(str, attrs);
0212e2aa30e112 Tom Zanussi             2018-01-15  1516  			if (ret)
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  1517  				goto free;
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  1518  		}
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  1519  	}
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  1520  =

7ef224d1d0e3a1 Tom Zanussi             2016-03-03 @1521  	if (!attrs->keys_=
str) {
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  1522  		ret =3D -EINVAL;
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  1523  		goto free;
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  1524  	}
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  1525  =

a4072fe85ba367 Tom Zanussi             2018-01-15  1526  	if (!attrs->clock=
) {
a4072fe85ba367 Tom Zanussi             2018-01-15  1527  		attrs->clock =3D=
 kstrdup("global", GFP_KERNEL);
a4072fe85ba367 Tom Zanussi             2018-01-15  1528  		if (!attrs->cloc=
k) {
a4072fe85ba367 Tom Zanussi             2018-01-15  1529  			ret =3D -ENOMEM;
a4072fe85ba367 Tom Zanussi             2018-01-15  1530  			goto free;
a4072fe85ba367 Tom Zanussi             2018-01-15  1531  		}
a4072fe85ba367 Tom Zanussi             2018-01-15  1532  	}
a4072fe85ba367 Tom Zanussi             2018-01-15  1533  =

7ef224d1d0e3a1 Tom Zanussi             2016-03-03  1534  	return attrs;
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  1535   free:
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  1536  	destroy_hist_trig=
ger_attrs(attrs);
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  1537  =

7ef224d1d0e3a1 Tom Zanussi             2016-03-03  1538  	return ERR_PTR(re=
t);
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  1539  }
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  1540  =


:::::: The code at line 1521 was first introduced by commit
:::::: 7ef224d1d0e3a1ade02d02c01ce1dcffb736d2c3 tracing: Add 'hist' event t=
rigger command

:::::: TO: Tom Zanussi <tom.zanussi@linux.intel.com>
:::::: CC: Steven Rostedt <rostedt@goodmis.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6277368413615893440==--

