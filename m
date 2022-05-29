Content-Type: multipart/mixed; boundary="===============5048044110754988995=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [rostedt-trace:ftrace/core 6/53] kernel/trace/trace_events_hist.c:1540:6: warning: Branch condition evaluates to a garbage value [clang-analyzer-core.uninitialized.Branch]
Date: Sun, 29 May 2022 14:38:06 +0800
Message-ID: <202205291406.3dAf4MFq-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5048044110754988995==
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
commit: a7e6b7dcfb19988ad2968a1fafd29b600abbf133 [6/53] tracing: Separate h=
ist state updates from hist registration
:::::: branch date: 17 hours ago
:::::: commit date: 5 weeks ago
config: i386-randconfig-c001 (https://download.01.org/0day-ci/archive/20220=
529/202205291406.3dAf4MFq-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 134d7f=
9a4b97e9035150d970bd9e376043c4577e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-tra=
ce.git/commit/?id=3Da7e6b7dcfb19988ad2968a1fafd29b600abbf133
        git remote add rostedt-trace https://git.kernel.org/pub/scm/linux/k=
ernel/git/rostedt/linux-trace.git
        git fetch --no-tags rostedt-trace ftrace/core
        git checkout a7e6b7dcfb19988ad2968a1fafd29b600abbf133
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                  ^~~~~~~
   drivers/devfreq/devfreq.c:1750:2: warning: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(df->stats.time_in_state, 0, (df->profile->max_state *
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/devfreq/devfreq.c:1750:2: note: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11
           memset(df->stats.time_in_state, 0, (df->profile->max_state *
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/devfreq/devfreq.c:1752:2: warning: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(df->stats.trans_table, 0, array3_size(sizeof(unsigned int=
),
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/devfreq/devfreq.c:1752:2: note: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11
           memset(df->stats.trans_table, 0, array3_size(sizeof(unsigned int=
),
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/devfreq/devfreq.c:1785:9: warning: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", df->profile->polling_ms);
                  ^~~~~~~
   drivers/devfreq/devfreq.c:1785:9: note: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", df->profile->polling_ms);
                  ^~~~~~~
   drivers/devfreq/devfreq.c:1799:8: warning: Call to function 'sscanf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           ret =3D sscanf(buf, "%u", &value);
                 ^~~~~~
   drivers/devfreq/devfreq.c:1799:8: note: Call to function 'sscanf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sscanf_s' in case of C11
           ret =3D sscanf(buf, "%u", &value);
                 ^~~~~~
   drivers/devfreq/devfreq.c:1818:9: warning: Call to function 'sprintf' is=
 insecure as it does not provide bounding of the memory buffer or security =
checks introduced in the C11 standard. Replace with analogous functions tha=
t support length arguments or provides boundary checks such as 'sprintf_s' =
in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuffe=
rHandling]
           return sprintf(buf, "%s\n", timer_name[df->profile->timer]);
                  ^~~~~~~
   drivers/devfreq/devfreq.c:1818:9: note: Call to function 'sprintf' is in=
secure as it does not provide bounding of the memory buffer or security che=
cks introduced in the C11 standard. Replace with analogous functions that s=
upport length arguments or provides boundary checks such as 'sprintf_s' in =
case of C11
           return sprintf(buf, "%s\n", timer_name[df->profile->timer]);
                  ^~~~~~~
   drivers/devfreq/devfreq.c:1832:8: warning: Call to function 'sscanf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           ret =3D sscanf(buf, "%16s", str_timer);
                 ^~~~~~
   drivers/devfreq/devfreq.c:1832:8: note: Call to function 'sscanf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sscanf_s' in case of C11
           ret =3D sscanf(buf, "%16s", str_timer);
                 ^~~~~~
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   86 warnings generated.
   kernel/trace/trace_events_hist.c:759:2: warning: Call to function 'strcp=
y' is insecure as it does not provide bounding of the memory buffer. Replac=
e unbounded copy functions with analogous functions that support length arg=
uments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strc=
py]
           strcpy(last_cmd, HIST_PREFIX);
           ^~~~~~
   kernel/trace/trace_events_hist.c:759:2: note: Call to function 'strcpy' =
is insecure as it does not provide bounding of the memory buffer. Replace u=
nbounded copy functions with analogous functions that support length argume=
nts such as 'strlcpy'. CWE-119
           strcpy(last_cmd, HIST_PREFIX);
           ^~~~~~
   kernel/trace/trace_events_hist.c:762:2: warning: Call to function 'strnc=
at' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'strncat_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           strncat(last_cmd, str, len);
           ^~~~~~~
   kernel/trace/trace_events_hist.c:762:2: note: Call to function 'strncat'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'strncat_s' in case of C11
           strncat(last_cmd, str, len);
           ^~~~~~~
   kernel/trace/trace_events_hist.c:775:3: warning: Call to function 'snpri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'snprintf_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(last_cmd_loc, MAX_FILTER_STR_VAL, HIST_PREFIX "=
%s:%s", system, name);
                   ^~~~~~~~
   kernel/trace/trace_events_hist.c:775:3: note: Call to function 'snprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(last_cmd_loc, MAX_FILTER_STR_VAL, HIST_PREFIX "=
%s:%s", system, name);
                   ^~~~~~~~
   kernel/trace/trace_events_hist.c:1320:4: warning: Call to function 'strc=
at' is insecure as it does not provide bounding of the memory buffer. Repla=
ce unbounded copy functions with analogous functions that support length ar=
guments such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.str=
cpy]
                           strcat(full_name, field->system);
                           ^~~~~~
   kernel/trace/trace_events_hist.c:1320:4: note: Call to function 'strcat'=
 is insecure as it does not provide bounding of the memory buffer. Replace =
unbounded copy functions with analogous functions that support length argum=
ents such as 'strlcat'. CWE-119
                           strcat(full_name, field->system);
                           ^~~~~~
   kernel/trace/trace_events_hist.c:1321:4: warning: Call to function 'strc=
at' is insecure as it does not provide bounding of the memory buffer. Repla=
ce unbounded copy functions with analogous functions that support length ar=
guments such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.str=
cpy]
                           strcat(full_name, ".");
                           ^~~~~~
   kernel/trace/trace_events_hist.c:1321:4: note: Call to function 'strcat'=
 is insecure as it does not provide bounding of the memory buffer. Replace =
unbounded copy functions with analogous functions that support length argum=
ents such as 'strlcat'. CWE-119
                           strcat(full_name, ".");
                           ^~~~~~
   kernel/trace/trace_events_hist.c:1322:4: warning: Call to function 'strc=
at' is insecure as it does not provide bounding of the memory buffer. Repla=
ce unbounded copy functions with analogous functions that support length ar=
guments such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.str=
cpy]
                           strcat(full_name, field->event_name);
                           ^~~~~~
   kernel/trace/trace_events_hist.c:1322:4: note: Call to function 'strcat'=
 is insecure as it does not provide bounding of the memory buffer. Replace =
unbounded copy functions with analogous functions that support length argum=
ents such as 'strlcat'. CWE-119
                           strcat(full_name, field->event_name);
                           ^~~~~~
   kernel/trace/trace_events_hist.c:1323:4: warning: Call to function 'strc=
at' is insecure as it does not provide bounding of the memory buffer. Repla=
ce unbounded copy functions with analogous functions that support length ar=
guments such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.str=
cpy]
                           strcat(full_name, ".");
                           ^~~~~~
   kernel/trace/trace_events_hist.c:1323:4: note: Call to function 'strcat'=
 is insecure as it does not provide bounding of the memory buffer. Replace =
unbounded copy functions with analogous functions that support length argum=
ents such as 'strlcat'. CWE-119
                           strcat(full_name, ".");
                           ^~~~~~
   kernel/trace/trace_events_hist.c:1324:4: warning: Call to function 'strc=
at' is insecure as it does not provide bounding of the memory buffer. Repla=
ce unbounded copy functions with analogous functions that support length ar=
guments such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.str=
cpy]
                           strcat(full_name, field->name);
                           ^~~~~~
   kernel/trace/trace_events_hist.c:1324:4: note: Call to function 'strcat'=
 is insecure as it does not provide bounding of the memory buffer. Replace =
unbounded copy functions with analogous functions that support length argum=
ents such as 'strlcat'. CWE-119
                           strcat(full_name, field->name);
                           ^~~~~~
>> kernel/trace/trace_events_hist.c:1540:6: warning: Branch condition evalu=
ates to a garbage value [clang-analyzer-core.uninitialized.Branch]
           if (!attrs->keys_str) {
               ^
   kernel/trace/trace_events_hist.c:5802:19: note: Assuming field 'ref' is =
> 0
           if (WARN_ON_ONCE(data->ref <=3D 0))
                            ^
   include/asm-generic/bug.h:104:25: note: expanded from macro 'WARN_ON_ONC=
E'
           int __ret_warn_on =3D !!(condition);                      \
                                  ^~~~~~~~~
   kernel/trace/trace_events_hist.c:5802:6: note: Taking false branch
           if (WARN_ON_ONCE(data->ref <=3D 0))
               ^
   include/asm-generic/bug.h:105:2: note: expanded from macro 'WARN_ON_ONCE'
           if (unlikely(__ret_warn_on))                            \
           ^
   kernel/trace/trace_events_hist.c:5802:2: note: Taking false branch
           if (WARN_ON_ONCE(data->ref <=3D 0))
           ^
   kernel/trace/trace_events_hist.c:5805:2: note: Calling 'event_hist_trigg=
er_free'
           event_hist_trigger_free(data->named_data);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_events_hist.c:5764:19: note: Assuming field 'ref' is =
> 0
           if (WARN_ON_ONCE(data->ref <=3D 0))
                            ^
   include/asm-generic/bug.h:104:25: note: expanded from macro 'WARN_ON_ONC=
E'
           int __ret_warn_on =3D !!(condition);                      \
                                  ^~~~~~~~~
   kernel/trace/trace_events_hist.c:5764:6: note: Taking false branch
           if (WARN_ON_ONCE(data->ref <=3D 0))
               ^
   include/asm-generic/bug.h:105:2: note: expanded from macro 'WARN_ON_ONCE'
           if (unlikely(__ret_warn_on))                            \
           ^
   kernel/trace/trace_events_hist.c:5764:2: note: Taking false branch
           if (WARN_ON_ONCE(data->ref <=3D 0))
           ^
   kernel/trace/trace_events_hist.c:5768:6: note: Assuming field 'ref' is 0
           if (!data->ref) {
               ^~~~~~~~~~
   kernel/trace/trace_events_hist.c:5768:2: note: Taking true branch
           if (!data->ref) {
           ^
   kernel/trace/trace_events_hist.c:5769:7: note: Assuming field 'name' is =
null
                   if (data->name)
                       ^~~~~~~~~~
   kernel/trace/trace_events_hist.c:5769:3: note: Taking false branch
                   if (data->name)
                   ^
   kernel/trace/trace_events_hist.c:5776:3: note: Calling 'unregister_field=
_var_hists'
                   unregister_field_var_hists(hist_data);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_events_hist.c:5751:14: note: Assuming 'i' is < field =
'n_field_var_hists'
           for (i =3D 0; i < hist_data->n_field_var_hists; i++) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_events_hist.c:5751:2: note: Loop condition is true.  =
Entering loop body
           for (i =3D 0; i < hist_data->n_field_var_hists; i++) {
           ^
   kernel/trace/trace_events_hist.c:5754:9: note: Calling 'event_hist_trigg=
er_parse'
                   ret =3D event_hist_trigger_parse(&trigger_hist_cmd, file,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_events_hist.c:6215:2: note: Assuming 'debug_locks' is=
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
   kernel/trace/trace_events_hist.c:6215:2: note: Left side of '&&' is false
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
   kernel/trace/trace_events_hist.c:6215:2: note: Taking false branch
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
   kernel/trace/trace_events_hist.c:6215:2: note: Loop condition is false. =
 Exiting loop
           lockdep_assert_held(&event_mutex);
           ^
   include/linux/lockdep.h:316:2: note: expanded from macro 'lockdep_assert=
_held'
           lockdep_assert(lockdep_is_held(l) !=3D LOCK_STATE_NOT_HELD)
           ^
   include/linux/lockdep.h:310:2: note: expanded from macro 'lockdep_assert'
           do { WARN_ON(debug_locks && !(cond)); } while (0)

vim +1540 kernel/trace/trace_events_hist.c

9b1ae035c9304e Tom Zanussi             2018-01-15  1501  =

d0cd871ba0d613 Steven Rostedt (VMware  2019-04-01  1502) static struct hist=
_trigger_attrs *
d0cd871ba0d613 Steven Rostedt (VMware  2019-04-01  1503) parse_hist_trigger=
_attrs(struct trace_array *tr, char *trigger_str)
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  1504  {
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  1505  	struct hist_trigg=
er_attrs *attrs;
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  1506  	int ret =3D 0;
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  1507  =

7ef224d1d0e3a1 Tom Zanussi             2016-03-03  1508  	attrs =3D kzalloc=
(sizeof(*attrs), GFP_KERNEL);
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  1509  	if (!attrs)
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  1510  		return ERR_PTR(-=
ENOMEM);
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  1511  =

7ef224d1d0e3a1 Tom Zanussi             2016-03-03  1512  	while (trigger_st=
r) {
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  1513  		char *str =3D st=
rsep(&trigger_str, ":");
b527b638fd63ba Tom Zanussi             2019-06-28  1514  		char *rhs;
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  1515  =

b527b638fd63ba Tom Zanussi             2019-06-28  1516  		rhs =3D strchr(s=
tr, '=3D');
b527b638fd63ba Tom Zanussi             2019-06-28  1517  		if (rhs) {
b527b638fd63ba Tom Zanussi             2019-06-28  1518  			if (!strlen(++r=
hs)) {
b527b638fd63ba Tom Zanussi             2019-06-28  1519  				ret =3D -EINVA=
L;
4de26c8c967d55 Tom Zanussi             2019-06-28  1520  				hist_err(tr, H=
IST_ERR_EMPTY_ASSIGNMENT, errpos(str));
b527b638fd63ba Tom Zanussi             2019-06-28  1521  				goto free;
b527b638fd63ba Tom Zanussi             2019-06-28  1522  			}
d0cd871ba0d613 Steven Rostedt (VMware  2019-04-01  1523) 			ret =3D parse_a=
ssignment(tr, str, attrs);
9b1ae035c9304e Tom Zanussi             2018-01-15  1524  			if (ret)
9b1ae035c9304e Tom Zanussi             2018-01-15  1525  				goto free;
9b1ae035c9304e Tom Zanussi             2018-01-15  1526  		} else if (strcm=
p(str, "pause") =3D=3D 0)
83e99914c9e267 Tom Zanussi             2016-03-03  1527  			attrs->pause =
=3D true;
83e99914c9e267 Tom Zanussi             2016-03-03  1528  		else if ((strcmp=
(str, "cont") =3D=3D 0) ||
83e99914c9e267 Tom Zanussi             2016-03-03  1529  			 (strcmp(str, "=
continue") =3D=3D 0))
83e99914c9e267 Tom Zanussi             2016-03-03  1530  			attrs->cont =3D=
 true;
e86ae9baacfa9e Tom Zanussi             2016-03-03  1531  		else if (strcmp(=
str, "clear") =3D=3D 0)
e86ae9baacfa9e Tom Zanussi             2016-03-03  1532  			attrs->clear =
=3D true;
9b1ae035c9304e Tom Zanussi             2018-01-15  1533  		else {
0212e2aa30e112 Tom Zanussi             2018-01-15  1534  			ret =3D parse_a=
ction(str, attrs);
0212e2aa30e112 Tom Zanussi             2018-01-15  1535  			if (ret)
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  1536  				goto free;
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  1537  		}
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  1538  	}
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  1539  =

7ef224d1d0e3a1 Tom Zanussi             2016-03-03 @1540  	if (!attrs->keys_=
str) {
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  1541  		ret =3D -EINVAL;
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  1542  		goto free;
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  1543  	}
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  1544  =

a4072fe85ba367 Tom Zanussi             2018-01-15  1545  	if (!attrs->clock=
) {
a4072fe85ba367 Tom Zanussi             2018-01-15  1546  		attrs->clock =3D=
 kstrdup("global", GFP_KERNEL);
a4072fe85ba367 Tom Zanussi             2018-01-15  1547  		if (!attrs->cloc=
k) {
a4072fe85ba367 Tom Zanussi             2018-01-15  1548  			ret =3D -ENOMEM;
a4072fe85ba367 Tom Zanussi             2018-01-15  1549  			goto free;
a4072fe85ba367 Tom Zanussi             2018-01-15  1550  		}
a4072fe85ba367 Tom Zanussi             2018-01-15  1551  	}
a4072fe85ba367 Tom Zanussi             2018-01-15  1552  =

7ef224d1d0e3a1 Tom Zanussi             2016-03-03  1553  	return attrs;
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  1554   free:
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  1555  	destroy_hist_trig=
ger_attrs(attrs);
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  1556  =

7ef224d1d0e3a1 Tom Zanussi             2016-03-03  1557  	return ERR_PTR(re=
t);
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  1558  }
7ef224d1d0e3a1 Tom Zanussi             2016-03-03  1559  =


:::::: The code at line 1540 was first introduced by commit
:::::: 7ef224d1d0e3a1ade02d02c01ce1dcffb736d2c3 tracing: Add 'hist' event t=
rigger command

:::::: TO: Tom Zanussi <tom.zanussi@linux.intel.com>
:::::: CC: Steven Rostedt <rostedt@goodmis.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5048044110754988995==--

