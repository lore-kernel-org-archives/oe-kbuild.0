Content-Type: multipart/mixed; boundary="===============2157114131439702649=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: kernel/module/kallsyms.c:424:3: warning: Assignment of function parameter has no effect outside the function. [uselessAssignmentArg]
Date: Mon, 15 Aug 2022 17:06:37 +0800
Message-ID: <202208151610.fQxoYS4U-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2157114131439702649==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "commit no functional change"
:::::: Manual check reason: "low confidence static check warning: kernel/mo=
dule/kallsyms.c:424:3: warning: Assignment of function parameter has no eff=
ect outside the function. [uselessAssignmentArg]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Aaron Tomlin <atomlin@redhat.com>
CC: Luis Chamberlain <mcgrof@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   568035b01cfb107af8d2e4bd2fb9aea22cf5b868
commit: 91fb02f31505dc22262b13a129550f470ab90a79 module: Move kallsyms supp=
ort into a separate file
date:   4 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 4 months ago
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 91fb02f31505dc22262b13a129550f470ab90a79
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

cppcheck warnings: (new ones prefixed by >>)
>> kernel/module/main.c:357:20: warning: Local variable 'arr' shadows outer=
 variable [shadowVariable]
     struct symsearch arr[] =3D {
                      ^
   kernel/module/main.c:339:32: note: Shadowed declaration
    static const struct symsearch arr[] =3D {
                                  ^
   kernel/module/main.c:357:20: note: Shadow variable
     struct symsearch arr[] =3D {
                      ^

cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> kernel/module/kallsyms.c:424:3: warning: Assignment of function paramete=
r has no effect outside the function. [uselessAssignmentArg]
     symnum -=3D kallsyms->num_symtab;
     ^
   kernel/module/kallsyms.c:142:24: warning: Redundant assignment of 'mod->=
core_layout.size' to itself. [selfAssignment]
    mod->core_layout.size =3D debug_align(mod->core_layout.size);
                          ^
   kernel/module/kallsyms.c:157:24: warning: Redundant assignment of 'mod->=
init_layout.size' to itself. [selfAssignment]
    mod->init_layout.size =3D debug_align(mod->init_layout.size);
                          ^
   kernel/module/main.c:2113:26: warning: Redundant assignment of 'mod->cor=
e_layout.size' to itself. [selfAssignment]
      mod->core_layout.size =3D debug_align(mod->core_layout.size);
                            ^
   kernel/module/main.c:2117:26: warning: Redundant assignment of 'mod->cor=
e_layout.size' to itself. [selfAssignment]
      mod->core_layout.size =3D debug_align(mod->core_layout.size);
                            ^
   kernel/module/main.c:2121:26: warning: Redundant assignment of 'mod->cor=
e_layout.size' to itself. [selfAssignment]
      mod->core_layout.size =3D debug_align(mod->core_layout.size);
                            ^
   kernel/module/main.c:2125:26: warning: Redundant assignment of 'mod->cor=
e_layout.size' to itself. [selfAssignment]
      mod->core_layout.size =3D debug_align(mod->core_layout.size);
                            ^
   kernel/module/main.c:2147:26: warning: Redundant assignment of 'mod->ini=
t_layout.size' to itself. [selfAssignment]
      mod->init_layout.size =3D debug_align(mod->init_layout.size);
                            ^
   kernel/module/main.c:2151:26: warning: Redundant assignment of 'mod->ini=
t_layout.size' to itself. [selfAssignment]
      mod->init_layout.size =3D debug_align(mod->init_layout.size);
                            ^
   kernel/module/main.c:2162:26: warning: Redundant assignment of 'mod->ini=
t_layout.size' to itself. [selfAssignment]
      mod->init_layout.size =3D debug_align(mod->init_layout.size);
                            ^
>> kernel/module/main.c:2261:70: warning: Parameter 'debug' can be declared=
 with const [constParameter]
   static void dynamic_debug_remove(struct module *mod, struct _ddebug *deb=
ug)
                                                                        ^

vim +424 kernel/module/kallsyms.c

91fb02f31505dc Aaron Tomlin 2022-03-22  400  =

91fb02f31505dc Aaron Tomlin 2022-03-22  401  int module_get_kallsym(unsigne=
d int symnum, unsigned long *value, char *type,
91fb02f31505dc Aaron Tomlin 2022-03-22  402  		       char *name, char *mod=
ule_name, int *exported)
91fb02f31505dc Aaron Tomlin 2022-03-22  403  {
91fb02f31505dc Aaron Tomlin 2022-03-22  404  	struct module *mod;
91fb02f31505dc Aaron Tomlin 2022-03-22  405  =

91fb02f31505dc Aaron Tomlin 2022-03-22  406  	preempt_disable();
91fb02f31505dc Aaron Tomlin 2022-03-22  407  	list_for_each_entry_rcu(mod, =
&modules, list) {
91fb02f31505dc Aaron Tomlin 2022-03-22  408  		struct mod_kallsyms *kallsym=
s;
91fb02f31505dc Aaron Tomlin 2022-03-22  409  =

91fb02f31505dc Aaron Tomlin 2022-03-22  410  		if (mod->state =3D=3D MODULE=
_STATE_UNFORMED)
91fb02f31505dc Aaron Tomlin 2022-03-22  411  			continue;
91fb02f31505dc Aaron Tomlin 2022-03-22  412  		kallsyms =3D rcu_dereference=
_sched(mod->kallsyms);
91fb02f31505dc Aaron Tomlin 2022-03-22  413  		if (symnum < kallsyms->num_s=
ymtab) {
91fb02f31505dc Aaron Tomlin 2022-03-22  414  			const Elf_Sym *sym =3D &kal=
lsyms->symtab[symnum];
91fb02f31505dc Aaron Tomlin 2022-03-22  415  =

91fb02f31505dc Aaron Tomlin 2022-03-22  416  			*value =3D kallsyms_symbol_=
value(sym);
91fb02f31505dc Aaron Tomlin 2022-03-22  417  			*type =3D kallsyms->typetab=
[symnum];
91fb02f31505dc Aaron Tomlin 2022-03-22  418  			strscpy(name, kallsyms_symb=
ol_name(kallsyms, symnum), KSYM_NAME_LEN);
91fb02f31505dc Aaron Tomlin 2022-03-22  419  			strscpy(module_name, mod->n=
ame, MODULE_NAME_LEN);
91fb02f31505dc Aaron Tomlin 2022-03-22  420  			*exported =3D is_exported(n=
ame, *value, mod);
91fb02f31505dc Aaron Tomlin 2022-03-22  421  			preempt_enable();
91fb02f31505dc Aaron Tomlin 2022-03-22  422  			return 0;
91fb02f31505dc Aaron Tomlin 2022-03-22  423  		}
91fb02f31505dc Aaron Tomlin 2022-03-22 @424  		symnum -=3D kallsyms->num_sy=
mtab;
91fb02f31505dc Aaron Tomlin 2022-03-22  425  	}
91fb02f31505dc Aaron Tomlin 2022-03-22  426  	preempt_enable();
91fb02f31505dc Aaron Tomlin 2022-03-22  427  	return -ERANGE;
91fb02f31505dc Aaron Tomlin 2022-03-22  428  }
91fb02f31505dc Aaron Tomlin 2022-03-22  429  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2157114131439702649==--

