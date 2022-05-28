Content-Type: multipart/mixed; boundary="===============5702140960324777278=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [rostedt-trace:ftrace/core 3/53] kernel/trace/trace_events_hist.c:2155:4: warning: Potential leak of memory pointed to by 'ref_field' [clang-analyzer-unix.Malloc]
Date: Sun, 29 May 2022 01:35:57 +0800
Message-ID: <202205290140.WVfzthcG-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5702140960324777278==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Tom Zanussi <zanussi@kernel.org>
CC: "Steven Rostedt (Google)" <rostedt@goodmis.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace=
.git ftrace/core
head:   b39181f7c6907dc66ff937b74758671fa6ba430c
commit: b8cc44a4d3c19296dfd1be1a018a8523e09ab919 [3/53] tracing: Remove log=
ic for registering multiple event triggers at a time
:::::: branch date: 4 hours ago
:::::: commit date: 5 weeks ago
config: i386-randconfig-c001 (https://download.01.org/0day-ci/archive/20220=
529/202205290140.WVfzthcG-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 134d7f=
9a4b97e9035150d970bd9e376043c4577e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-tra=
ce.git/commit/?id=3Db8cc44a4d3c19296dfd1be1a018a8523e09ab919
        git remote add rostedt-trace https://git.kernel.org/pub/scm/linux/k=
ernel/git/rostedt/linux-trace.git
        git fetch --no-tags rostedt-trace ftrace/core
        git checkout b8cc44a4d3c19296dfd1be1a018a8523e09ab919
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                   ^
   kernel/trace/trace_events_hist.c:3950:14: note: Calling 'create_var_ref'
                           var_ref =3D create_var_ref(hist_data, hist_field,
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_events_hist.c:2142:14: note: Assuming 'i' is >=3D fie=
ld 'n_var_refs'
           for (i =3D 0; i < hist_data->n_var_refs; i++) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_events_hist.c:2142:2: note: Loop condition is false. =
Execution continues on line 2151
           for (i =3D 0; i < hist_data->n_var_refs; i++) {
           ^
   kernel/trace/trace_events_hist.c:2151:14: note: Calling 'create_hist_fie=
ld'
           ref_field =3D create_hist_field(var_field->hist_data, NULL, flag=
s, NULL);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   kernel/trace/trace_events_hist.c:1910:6: note: 'field' is null
           if (field && is_function_field(field))
               ^~~~~
   kernel/trace/trace_events_hist.c:1910:12: note: Left side of '&&' is fal=
se
           if (field && is_function_field(field))
                     ^
   kernel/trace/trace_events_hist.c:1913:15: note: Calling 'kzalloc'
           hist_field =3D kzalloc(sizeof(struct hist_field), GFP_KERNEL);
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:714:9: note: Uninitialized value stored to field 'n=
ame'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:714:2: note: Returning pointer, which participates =
in a condition later
           return kmalloc(size, flags | __GFP_ZERO);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_events_hist.c:1913:15: note: Returning from 'kzalloc'
           hist_field =3D kzalloc(sizeof(struct hist_field), GFP_KERNEL);
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_events_hist.c:1914:6: note: Assuming 'hist_field' is =
non-null
           if (!hist_field)
               ^~~~~~~~~~~
   kernel/trace/trace_events_hist.c:1914:2: note: Taking false branch
           if (!hist_field)
           ^
   kernel/trace/trace_events_hist.c:1921:6: note: Left side of '||' is false
           if (flags & HIST_FIELD_FL_EXPR || flags & HIST_FIELD_FL_ALIAS)
               ^
   kernel/trace/trace_events_hist.c:1921:2: note: Taking false branch
           if (flags & HIST_FIELD_FL_EXPR || flags & HIST_FIELD_FL_ALIAS)
           ^
   kernel/trace/trace_events_hist.c:1924:2: note: Taking true branch
           if (flags & HIST_FIELD_FL_VAR_REF) {
           ^
   kernel/trace/trace_events_hist.c:1926:3: note: Control jumps to line 2013
                   goto out;
                   ^
   kernel/trace/trace_events_hist.c:2016:6: note: 'var_name' is null
           if (var_name) {
               ^~~~~~~~
   kernel/trace/trace_events_hist.c:2016:2: note: Taking false branch
           if (var_name) {
           ^
   kernel/trace/trace_events_hist.c:2022:2: note: Returning pointer (loaded=
 from 'hist_field'), which participates in a condition later
           return hist_field;
           ^~~~~~~~~~~~~~~~~
   kernel/trace/trace_events_hist.c:2151:14: note: Returning from 'create_h=
ist_field'
           ref_field =3D create_hist_field(var_field->hist_data, NULL, flag=
s, NULL);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   kernel/trace/trace_events_hist.c:2152:6: note: 'ref_field' is non-null
           if (ref_field) {
               ^~~~~~~~~
   kernel/trace/trace_events_hist.c:2152:2: note: Taking true branch
           if (ref_field) {
           ^
   kernel/trace/trace_events_hist.c:2153:7: note: Calling 'init_var_ref'
                   if (init_var_ref(ref_field, var_field, system, event_nam=
e)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   kernel/trace/trace_events_hist.c:2059:6: note: 'system' is non-null
           if (system) {
               ^~~~~~
   kernel/trace/trace_events_hist.c:2059:2: note: Taking true branch
           if (system) {
           ^
   kernel/trace/trace_events_hist.c:2061:7: note: Assuming field 'system' i=
s non-null
                   if (!ref_field->system)
                       ^~~~~~~~~~~~~~~~~~
   kernel/trace/trace_events_hist.c:2061:3: note: Taking false branch
                   if (!ref_field->system)
                   ^
   kernel/trace/trace_events_hist.c:2065:6: note: 'event_name' is non-null
           if (event_name) {
               ^~~~~~~~~~
   kernel/trace/trace_events_hist.c:2065:2: note: Taking true branch
           if (event_name) {
           ^
   kernel/trace/trace_events_hist.c:2067:7: note: Assuming field 'event_nam=
e' is null
                   if (!ref_field->event_name) {
                       ^~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_events_hist.c:2067:3: note: Taking true branch
                   if (!ref_field->event_name) {
                   ^
   kernel/trace/trace_events_hist.c:2069:4: note: Control jumps to line 2095
                           goto free;
                           ^
   kernel/trace/trace_events_hist.c:2097:2: note: 1st function call argumen=
t is an uninitialized value
           kfree(ref_field->name);
           ^     ~~~~~~~~~~~~~~~
>> kernel/trace/trace_events_hist.c:2155:4: warning: Potential leak of memo=
ry pointed to by 'ref_field' [clang-analyzer-unix.Malloc]
                           return NULL;
                           ^
   kernel/trace/trace_events_hist.c:4646:14: note: Assuming 'i' is < field =
'n_actions'
           for (i =3D 0; i < hist_data->attrs->n_actions; i++) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_events_hist.c:4646:2: note: Loop condition is true.  =
Entering loop body
           for (i =3D 0; i < hist_data->attrs->n_actions; i++) {
           ^
   kernel/trace/trace_events_hist.c:4649:7: note: Assuming field 'handler' =
is equal to HANDLER_ONMATCH
                   if (data->handler =3D=3D HANDLER_ONMATCH) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_events_hist.c:4649:3: note: Taking true branch
                   if (data->handler =3D=3D HANDLER_ONMATCH) {
                   ^
   kernel/trace/trace_events_hist.c:4650:10: note: Calling 'onmatch_create'
                           ret =3D onmatch_create(hist_data, data);
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_events_hist.c:4058:9: note: Calling 'action_create'
           return action_create(hist_data, data);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_events_hist.c:4004:6: note: Assuming field 'action' i=
s equal to ACTION_TRACE
           if (data->action =3D=3D ACTION_TRACE)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_events_hist.c:4004:2: note: Taking true branch
           if (data->action =3D=3D ACTION_TRACE)
           ^
   kernel/trace/trace_events_hist.c:4005:10: note: Calling 'trace_action_cr=
eate'
                   return trace_action_create(hist_data, data);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_events_hist.c:3895:2: note: Assuming 'debug_locks' is=
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
   kernel/trace/trace_events_hist.c:3895:2: note: Left side of '&&' is false
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
   kernel/trace/trace_events_hist.c:3895:2: note: Taking false branch
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
   kernel/trace/trace_events_hist.c:3895:2: note: Loop condition is false. =
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
   kernel/trace/trace_events_hist.c:3897:6: note: Assuming field 'use_trace=
_keyword' is false
           if (data->use_trace_keyword)
               ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_events_hist.c:3897:2: note: Taking false branch
           if (data->use_trace_keyword)
           ^
   kernel/trace/trace_events_hist.c:3903:6: note: Assuming 'event' is non-n=
ull
           if (!event) {
               ^~~~~~
   kernel/trace/trace_events_hist.c:3903:2: note: Taking false branch
           if (!event) {
           ^
   kernel/trace/trace_events_hist.c:3910:14: note: Assuming 'i' is < field =
'n_params'
           for (i =3D 0; i < data->n_params; i++) {
                       ^~~~~~~~~~~~~~~~~~
   kernel/trace/trace_events_hist.c:3910:2: note: Loop condition is true.  =
Entering loop body
           for (i =3D 0; i < data->n_params; i++) {
           ^
   kernel/trace/trace_events_hist.c:3914:7: note: Assuming 'param' is non-n=
ull
                   if (!param) {
                       ^~~~~~
   kernel/trace/trace_events_hist.c:3914:3: note: Taking false branch
                   if (!param) {
                   ^
   kernel/trace/trace_events_hist.c:3920:7: note: Assuming 'param' is non-n=
ull
                   if (!param) {
                       ^~~~~~
   kernel/trace/trace_events_hist.c:3920:3: note: Taking false branch
                   if (!param) {

vim +/ref_field +2155 kernel/trace/trace_events_hist.c

d380dcde9a07ca Tom Zanussi             2020-01-29  2117  =

de40f033d4e84e Tom Zanussi             2018-12-18  2118  /**
de40f033d4e84e Tom Zanussi             2018-12-18  2119   * create_var_ref =
- Create a variable reference and attach it to trigger
de40f033d4e84e Tom Zanussi             2018-12-18  2120   * @hist_data: The=
 trigger that will be referencing the variable
de40f033d4e84e Tom Zanussi             2018-12-18  2121   * @var_field: The=
 VAR field to create a reference to
de40f033d4e84e Tom Zanussi             2018-12-18  2122   * @system: The op=
tional system string
de40f033d4e84e Tom Zanussi             2018-12-18  2123   * @event_name: Th=
e optional event_name string
de40f033d4e84e Tom Zanussi             2018-12-18  2124   *
de40f033d4e84e Tom Zanussi             2018-12-18  2125   * Given a variabl=
e hist_field, create a VAR_REF hist_field that
de40f033d4e84e Tom Zanussi             2018-12-18  2126   * represents a re=
ference to it.
de40f033d4e84e Tom Zanussi             2018-12-18  2127   *
de40f033d4e84e Tom Zanussi             2018-12-18  2128   * This function a=
lso adds the reference to the trigger that
de40f033d4e84e Tom Zanussi             2018-12-18  2129   * now references =
the variable.
de40f033d4e84e Tom Zanussi             2018-12-18  2130   *
de40f033d4e84e Tom Zanussi             2018-12-18  2131   * Return: The VAR=
_REF field if successful, NULL if not
de40f033d4e84e Tom Zanussi             2018-12-18  2132   */
de40f033d4e84e Tom Zanussi             2018-12-18  2133  static struct hist=
_field *create_var_ref(struct hist_trigger_data *hist_data,
de40f033d4e84e Tom Zanussi             2018-12-18  2134  					 struct hist_=
field *var_field,
067fe038e70f6e Tom Zanussi             2018-01-15  2135  					 char *system=
, char *event_name)
067fe038e70f6e Tom Zanussi             2018-01-15  2136  {
067fe038e70f6e Tom Zanussi             2018-01-15  2137  	unsigned long fla=
gs =3D HIST_FIELD_FL_VAR_REF;
067fe038e70f6e Tom Zanussi             2018-01-15  2138  	struct hist_field=
 *ref_field;
8bcebc77e85f3d Steven Rostedt (VMware  2020-01-20  2139) 	int i;
8bcebc77e85f3d Steven Rostedt (VMware  2020-01-20  2140) =

8bcebc77e85f3d Steven Rostedt (VMware  2020-01-20  2141) 	/* Check if the v=
ariable already exists */
8bcebc77e85f3d Steven Rostedt (VMware  2020-01-20  2142) 	for (i =3D 0; i <=
 hist_data->n_var_refs; i++) {
8bcebc77e85f3d Steven Rostedt (VMware  2020-01-20  2143) 		ref_field =3D hi=
st_data->var_refs[i];
8bcebc77e85f3d Steven Rostedt (VMware  2020-01-20  2144) 		if (ref_field->v=
ar.idx =3D=3D var_field->var.idx &&
8bcebc77e85f3d Steven Rostedt (VMware  2020-01-20  2145) 		    ref_field->v=
ar.hist_data =3D=3D var_field->hist_data) {
8bcebc77e85f3d Steven Rostedt (VMware  2020-01-20  2146) 			get_hist_field(=
ref_field);
8bcebc77e85f3d Steven Rostedt (VMware  2020-01-20  2147) 			return ref_fiel=
d;
8bcebc77e85f3d Steven Rostedt (VMware  2020-01-20  2148) 		}
8bcebc77e85f3d Steven Rostedt (VMware  2020-01-20  2149) 	}
067fe038e70f6e Tom Zanussi             2018-01-15  2150  =

067fe038e70f6e Tom Zanussi             2018-01-15  2151  	ref_field =3D cre=
ate_hist_field(var_field->hist_data, NULL, flags, NULL);
067fe038e70f6e Tom Zanussi             2018-01-15  2152  	if (ref_field) {
067fe038e70f6e Tom Zanussi             2018-01-15  2153  		if (init_var_ref=
(ref_field, var_field, system, event_name)) {
067fe038e70f6e Tom Zanussi             2018-01-15  2154  			destroy_hist_fi=
eld(ref_field, 0);
067fe038e70f6e Tom Zanussi             2018-01-15 @2155  			return NULL;
067fe038e70f6e Tom Zanussi             2018-01-15  2156  		}
de40f033d4e84e Tom Zanussi             2018-12-18  2157  =

de40f033d4e84e Tom Zanussi             2018-12-18  2158  		hist_data->var_r=
efs[hist_data->n_var_refs] =3D ref_field;
de40f033d4e84e Tom Zanussi             2018-12-18  2159  		ref_field->var_r=
ef_idx =3D hist_data->n_var_refs++;
067fe038e70f6e Tom Zanussi             2018-01-15  2160  	}
067fe038e70f6e Tom Zanussi             2018-01-15  2161  =

067fe038e70f6e Tom Zanussi             2018-01-15  2162  	return ref_field;
067fe038e70f6e Tom Zanussi             2018-01-15  2163  }
067fe038e70f6e Tom Zanussi             2018-01-15  2164  =


:::::: The code at line 2155 was first introduced by commit
:::::: 067fe038e70f6e64960d26a79c4df5f1413d0f13 tracing: Add variable refer=
ence handling to hist triggers

:::::: TO: Tom Zanussi <tom.zanussi@linux.intel.com>
:::::: CC: Steven Rostedt (VMware) <rostedt@goodmis.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5702140960324777278==--

