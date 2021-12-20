Content-Type: multipart/mixed; boundary="===============0451874977818090917=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: kernel/trace/trace_events_hist.c:1406:9: warning: Array access (via field 'field_var_str') results in a null pointer dereference [clang-analyzer-core.NullDereference]
Date: Mon, 20 Dec 2021 14:56:03 +0800
Message-ID: <202112201430.xuZdswUJ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0451874977818090917==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Tom Zanussi <zanussi@kernel.org>
CC: "Steven Rostedt (VMware)" <rostedt@goodmis.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   a7904a538933c525096ca2ccde1e60d0ee62c08e
commit: c910db943d35d4ac4b77570ece76e0799af24233 tracing: Dynamically alloc=
ate the per-elt hist_elt_data array
date:   3 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 3 months ago
config: i386-randconfig-c001-20211212 (https://download.01.org/0day-ci/arch=
ive/20211220/202112201430.xuZdswUJ-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 097a1c=
b1d5ebb3a0ec4bcaed8ba3ff6a8e33c00a)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dc910db943d35d4ac4b77570ece76e0799af24233
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout c910db943d35d4ac4b77570ece76e0799af24233
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                            ~~~~~~~~~~~~~ ^
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (3 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   34 warnings generated.
   kernel/trace/trace_events_hist.c:1146:4: warning: Call to function 'strc=
at' is insecure as it does not provide bounding of the memory buffer. Repla=
ce unbounded copy functions with analogous functions that support length ar=
guments such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.str=
cpy]
                           strcat(full_name, field->system);
                           ^~~~~~
   kernel/trace/trace_events_hist.c:1146:4: note: Call to function 'strcat'=
 is insecure as it does not provide bounding of the memory buffer. Replace =
unbounded copy functions with analogous functions that support length argum=
ents such as 'strlcat'. CWE-119
                           strcat(full_name, field->system);
                           ^~~~~~
   kernel/trace/trace_events_hist.c:1147:4: warning: Call to function 'strc=
at' is insecure as it does not provide bounding of the memory buffer. Repla=
ce unbounded copy functions with analogous functions that support length ar=
guments such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.str=
cpy]
                           strcat(full_name, ".");
                           ^~~~~~
   kernel/trace/trace_events_hist.c:1147:4: note: Call to function 'strcat'=
 is insecure as it does not provide bounding of the memory buffer. Replace =
unbounded copy functions with analogous functions that support length argum=
ents such as 'strlcat'. CWE-119
                           strcat(full_name, ".");
                           ^~~~~~
   kernel/trace/trace_events_hist.c:1148:4: warning: Call to function 'strc=
at' is insecure as it does not provide bounding of the memory buffer. Repla=
ce unbounded copy functions with analogous functions that support length ar=
guments such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.str=
cpy]
                           strcat(full_name, field->event_name);
                           ^~~~~~
   kernel/trace/trace_events_hist.c:1148:4: note: Call to function 'strcat'=
 is insecure as it does not provide bounding of the memory buffer. Replace =
unbounded copy functions with analogous functions that support length argum=
ents such as 'strlcat'. CWE-119
                           strcat(full_name, field->event_name);
                           ^~~~~~
   kernel/trace/trace_events_hist.c:1149:4: warning: Call to function 'strc=
at' is insecure as it does not provide bounding of the memory buffer. Repla=
ce unbounded copy functions with analogous functions that support length ar=
guments such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.str=
cpy]
                           strcat(full_name, ".");
                           ^~~~~~
   kernel/trace/trace_events_hist.c:1149:4: note: Call to function 'strcat'=
 is insecure as it does not provide bounding of the memory buffer. Replace =
unbounded copy functions with analogous functions that support length argum=
ents such as 'strlcat'. CWE-119
                           strcat(full_name, ".");
                           ^~~~~~
   kernel/trace/trace_events_hist.c:1150:4: warning: Call to function 'strc=
at' is insecure as it does not provide bounding of the memory buffer. Repla=
ce unbounded copy functions with analogous functions that support length ar=
guments such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.str=
cpy]
                           strcat(full_name, field->name);
                           ^~~~~~
   kernel/trace/trace_events_hist.c:1150:4: note: Call to function 'strcat'=
 is insecure as it does not provide bounding of the memory buffer. Replace =
unbounded copy functions with analogous functions that support length argum=
ents such as 'strlcat'. CWE-119
                           strcat(full_name, field->name);
                           ^~~~~~
   kernel/trace/trace_events_hist.c:1389:3: warning: Call to function 'strc=
py' is insecure as it does not provide bounding of the memory buffer. Repla=
ce unbounded copy functions with analogous functions that support length ar=
guments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.str=
cpy]
                   strcpy(comm, "<idle>");
                   ^~~~~~
   kernel/trace/trace_events_hist.c:1389:3: note: Call to function 'strcpy'=
 is insecure as it does not provide bounding of the memory buffer. Replace =
unbounded copy functions with analogous functions that support length argum=
ents such as 'strlcpy'. CWE-119
                   strcpy(comm, "<idle>");
                   ^~~~~~
   kernel/trace/trace_events_hist.c:1394:3: warning: Call to function 'strc=
py' is insecure as it does not provide bounding of the memory buffer. Repla=
ce unbounded copy functions with analogous functions that support length ar=
guments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.str=
cpy]
                   strcpy(comm, "<XXX>");
                   ^~~~~~
   kernel/trace/trace_events_hist.c:1394:3: note: Call to function 'strcpy'=
 is insecure as it does not provide bounding of the memory buffer. Replace =
unbounded copy functions with analogous functions that support length argum=
ents such as 'strlcpy'. CWE-119
                   strcpy(comm, "<XXX>");
                   ^~~~~~
>> kernel/trace/trace_events_hist.c:1406:9: warning: Array access (via fiel=
d 'field_var_str') results in a null pointer dereference [clang-analyzer-co=
re.NullDereference]
                   kfree(elt_data->field_var_str[i]);
                         ^
   kernel/trace/trace_events_hist.c:1429:13: note: Calling 'kzalloc'
           elt_data =3D kzalloc(sizeof(*elt_data), GFP_KERNEL);
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:721:9: note: Calling 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:579:2: note: Taking false branch
           if (__builtin_constant_p(size)) {
           ^
   include/linux/slab.h:596:2: note: Returning pointer, which participates =
in a condition later
           return __kmalloc(size, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:721:9: note: Returning from 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:721:2: note: Returning pointer, which participates =
in a condition later
           return kmalloc(size, flags | __GFP_ZERO);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_events_hist.c:1429:13: note: Returning from 'kzalloc'
           elt_data =3D kzalloc(sizeof(*elt_data), GFP_KERNEL);
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_events_hist.c:1430:6: note: Assuming 'elt_data' is no=
n-null
           if (!elt_data)
               ^~~~~~~~~
   kernel/trace/trace_events_hist.c:1430:2: note: Taking false branch
           if (!elt_data)
           ^
   kernel/trace/trace_events_hist.c:1433:2: note: Assuming 'i' is >=3D fiel=
d 'n_fields'
           for_each_hist_field(i, hist_data) {
           ^
   kernel/trace/trace_events_hist.c:310:16: note: expanded from macro 'for_=
each_hist_field'
           for ((i) =3D 0; (i) < (hist_data)->n_fields; (i)++)
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_events_hist.c:1433:2: note: Loop condition is false. =
Execution continues on line 1446
           for_each_hist_field(i, hist_data) {
           ^
   kernel/trace/trace_events_hist.c:310:2: note: expanded from macro 'for_e=
ach_hist_field'
           for ((i) =3D 0; (i) < (hist_data)->n_fields; (i)++)
           ^
   kernel/trace/trace_events_hist.c:1448:6: note: Assuming 'n_str' is <=3D =
SYNTH_FIELDS_MAX
           if (n_str > SYNTH_FIELDS_MAX) {
               ^~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_events_hist.c:1448:2: note: Taking false branch
           if (n_str > SYNTH_FIELDS_MAX) {
           ^
   kernel/trace/trace_events_hist.c:1453:2: note: Taking false branch
           BUILD_BUG_ON(STR_VAR_LEN_MAX & (sizeof(u64) - 1));
           ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
           BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:328:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:316:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:308:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   kernel/trace/trace_events_hist.c:1453:2: note: Loop condition is false. =
 Exiting loop
           BUILD_BUG_ON(STR_VAR_LEN_MAX & (sizeof(u64) - 1));
           ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
           BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:328:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:316:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   kernel/trace/trace_events_hist.c:1457:28: note: Calling 'kcalloc'
           elt_data->field_var_str =3D kcalloc(n_str, sizeof(char *), GFP_K=
ERNEL);
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   include/linux/slab.h:660:9: note: Calling 'kmalloc_array'
           return kmalloc_array(n, size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:627:2: note: Taking false branch
           if (unlikely(check_mul_overflow(n, size, &bytes)))
           ^
   include/linux/slab.h:629:30: note: Left side of '&&' is false
           if (__builtin_constant_p(n) && __builtin_constant_p(size))
                                       ^
   include/linux/slab.h:631:2: note: Returning pointer
           return __kmalloc(bytes, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:660:9: note: Returning from 'kmalloc_array'
           return kmalloc_array(n, size, flags | __GFP_ZERO);

vim +/field_var_str +1406 kernel/trace/trace_events_hist.c

7ef224d1d0e3a1 Tom Zanussi 2016-03-03  1385  =

6b4827ad028a1a Tom Zanussi 2016-03-03  1386  static inline void save_comm(c=
har *comm, struct task_struct *task)
6b4827ad028a1a Tom Zanussi 2016-03-03  1387  {
6b4827ad028a1a Tom Zanussi 2016-03-03  1388  	if (!task->pid) {
6b4827ad028a1a Tom Zanussi 2016-03-03 @1389  		strcpy(comm, "<idle>");
6b4827ad028a1a Tom Zanussi 2016-03-03  1390  		return;
6b4827ad028a1a Tom Zanussi 2016-03-03  1391  	}
6b4827ad028a1a Tom Zanussi 2016-03-03  1392  =

6b4827ad028a1a Tom Zanussi 2016-03-03  1393  	if (WARN_ON_ONCE(task->pid < =
0)) {
6b4827ad028a1a Tom Zanussi 2016-03-03  1394  		strcpy(comm, "<XXX>");
6b4827ad028a1a Tom Zanussi 2016-03-03  1395  		return;
6b4827ad028a1a Tom Zanussi 2016-03-03  1396  	}
6b4827ad028a1a Tom Zanussi 2016-03-03  1397  =

27242c62b14124 Tom Zanussi 2019-03-05  1398  	strncpy(comm, task->comm, TAS=
K_COMM_LEN);
6b4827ad028a1a Tom Zanussi 2016-03-03  1399  }
6b4827ad028a1a Tom Zanussi 2016-03-03  1400  =

af6a29bcaf8ff2 Tom Zanussi 2018-01-15  1401  static void hist_elt_data_free=
(struct hist_elt_data *elt_data)
6b4827ad028a1a Tom Zanussi 2016-03-03  1402  {
02205a6752f223 Tom Zanussi 2018-01-15  1403  	unsigned int i;
02205a6752f223 Tom Zanussi 2018-01-15  1404  =

c910db943d35d4 Tom Zanussi 2021-09-02  1405  	for (i =3D 0; i < elt_data->n=
_field_var_str; i++)
02205a6752f223 Tom Zanussi 2018-01-15 @1406  		kfree(elt_data->field_var_st=
r[i]);
02205a6752f223 Tom Zanussi 2018-01-15  1407  =

c910db943d35d4 Tom Zanussi 2021-09-02  1408  	kfree(elt_data->field_var_str=
);
c910db943d35d4 Tom Zanussi 2021-09-02  1409  =

af6a29bcaf8ff2 Tom Zanussi 2018-01-15  1410  	kfree(elt_data->comm);
af6a29bcaf8ff2 Tom Zanussi 2018-01-15  1411  	kfree(elt_data);
6b4827ad028a1a Tom Zanussi 2016-03-03  1412  }
6b4827ad028a1a Tom Zanussi 2016-03-03  1413  =


:::::: The code at line 1406 was first introduced by commit
:::::: 02205a6752f223779a1b0e9e8ffacbea6e717851 tracing: Add support for 'f=
ield variables'

:::::: TO: Tom Zanussi <tom.zanussi@linux.intel.com>
:::::: CC: Steven Rostedt (VMware) <rostedt@goodmis.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0451874977818090917==--

