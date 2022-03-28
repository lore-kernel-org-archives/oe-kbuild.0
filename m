Content-Type: multipart/mixed; boundary="===============6810554745920091140=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: sound/isa/cmi8330.c:597:2: warning: Call to function 'sprintf' is insecure as it does not provide bounding of the memory buffer or security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides b...
Date: Tue, 29 Mar 2022 03:22:53 +0800
Message-ID: <202203290320.A6EQApxx-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6810554745920091140==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Arnd Bergmann <arnd@arndb.de>
CC: Masahiro Yamada <masahiroy@kernel.org>
CC: Alex Shi <alexs@kernel.org>
CC: Nick Desaulniers <ndesaulniers@google.com>
CC: Miguel Ojeda <ojeda@kernel.org>
CC: Nathan Chancellor <nathan@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   ae085d7f9365de7da27ab5c0d16b12d51ea7fca9
commit: e8c07082a810fbb9db303a2b66b66b8d7e588b53 Kbuild: move to -std=3Dgnu=
11
date:   2 weeks ago
:::::: branch date: 17 hours ago
:::::: commit date: 2 weeks ago
config: i386-randconfig-c001-20220328 (https://download.01.org/0day-ci/arch=
ive/20220329/202203290320.A6EQApxx-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0f6d95=
01cf49ce02937099350d08f20c4af86f3d)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3De8c07082a810fbb9db303a2b66b66b8d7e588b53
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e8c07082a810fbb9db303a2b66b66b8d7e588b53
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/iio/chemical/sps30_serial.c:207:3: note: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(rsp, &priv->buf[SPS30_SERIAL_FRAME_MISO_DATA_OFFS=
ET], rsp_size);
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/iio/chemical/sps30_serial.c:342:2: warning: Call to function 'me=
mcpy' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memcpy_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(buf + 1, &period, sizeof(period));
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/iio/chemical/sps30_serial.c:342:2: note: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(buf + 1, &period, sizeof(period));
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   Suppressed 24 warnings (24 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   sound/i2c/tea6330t.c:339:2: warning: Call to function 'strcat' is insecu=
re as it does not provide bounding of the memory buffer. Replace unbounded =
copy functions with analogous functions that support length arguments such =
as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcat(card->mixername, ",TEA6330T");
           ^~~~~~
   sound/i2c/tea6330t.c:339:2: note: Call to function 'strcat' is insecure =
as it does not provide bounding of the memory buffer. Replace unbounded cop=
y functions with analogous functions that support length arguments such as =
'strlcat'. CWE-119
           strcat(card->mixername, ",TEA6330T");
           ^~~~~~
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   35 warnings generated.
   drivers/char/xillybus/xillybus_class.c:66:3: warning: Call to function '=
snprintf' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'snprintf_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(unit->name, UNITNAMELEN, "%s", prefix);
                   ^~~~~~~~
   drivers/char/xillybus/xillybus_class.c:66:3: note: Call to function 'snp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(unit->name, UNITNAMELEN, "%s", prefix);
                   ^~~~~~~~
   drivers/char/xillybus/xillybus_class.c:69:3: warning: Call to function '=
snprintf' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'snprintf_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(unit->name, UNITNAMELEN, "%s_%02d",
                   ^~~~~~~~
   drivers/char/xillybus/xillybus_class.c:69:3: note: Call to function 'snp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(unit->name, UNITNAMELEN, "%s_%02d",
                   ^~~~~~~~
   drivers/char/xillybus/xillybus_class.c:118:3: warning: Call to function =
'snprintf' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'snprintf_s' in case of C11 [cla=
ng-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(devname, sizeof(devname), "%s_%s",
                   ^~~~~~~~
   drivers/char/xillybus/xillybus_class.c:118:3: note: Call to function 'sn=
printf' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(devname, sizeof(devname), "%s_%s",
                   ^~~~~~~~
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   35 warnings generated.
   Suppressed 35 warnings (35 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   35 warnings generated.
   Suppressed 35 warnings (35 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   37 warnings generated.
   Suppressed 37 warnings (37 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   26 warnings generated.
   Suppressed 26 warnings (26 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   40 warnings generated.
   sound/isa/cmi8330.c:300:2: warning: Call to function 'strcpy' is insecur=
e as it does not provide bounding of the memory buffer. Replace unbounded c=
opy functions with analogous functions that support length arguments such a=
s 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(card->mixername, (acard->type =3D=3D CMI8329) ? "CMI8329"=
 : "CMI8330/C3D");
           ^~~~~~
   sound/isa/cmi8330.c:300:2: note: Call to function 'strcpy' is insecure a=
s it does not provide bounding of the memory buffer. Replace unbounded copy=
 functions with analogous functions that support length arguments such as '=
strlcpy'. CWE-119
           strcpy(card->mixername, (acard->type =3D=3D CMI8329) ? "CMI8329"=
 : "CMI8330/C3D");
           ^~~~~~
   sound/isa/cmi8330.c:440:2: warning: Call to function 'strcpy' is insecur=
e as it does not provide bounding of the memory buffer. Replace unbounded c=
opy functions with analogous functions that support length arguments such a=
s 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(pcm->name, (chip->type =3D=3D CMI8329) ? "CMI8329" : "CMI=
8330");
           ^~~~~~
   sound/isa/cmi8330.c:440:2: note: Call to function 'strcpy' is insecure a=
s it does not provide bounding of the memory buffer. Replace unbounded copy=
 functions with analogous functions that support length arguments such as '=
strlcpy'. CWE-119
           strcpy(pcm->name, (chip->type =3D=3D CMI8329) ? "CMI8329" : "CMI=
8330");
           ^~~~~~
   sound/isa/cmi8330.c:595:2: warning: Call to function 'strcpy' is insecur=
e as it does not provide bounding of the memory buffer. Replace unbounded c=
opy functions with analogous functions that support length arguments such a=
s 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(card->driver, (acard->type =3D=3D CMI8329) ? "CMI8329" : =
"CMI8330/C3D");
           ^~~~~~
   sound/isa/cmi8330.c:595:2: note: Call to function 'strcpy' is insecure a=
s it does not provide bounding of the memory buffer. Replace unbounded copy=
 functions with analogous functions that support length arguments such as '=
strlcpy'. CWE-119
           strcpy(card->driver, (acard->type =3D=3D CMI8329) ? "CMI8329" : =
"CMI8330/C3D");
           ^~~~~~
   sound/isa/cmi8330.c:596:2: warning: Call to function 'strcpy' is insecur=
e as it does not provide bounding of the memory buffer. Replace unbounded c=
opy functions with analogous functions that support length arguments such a=
s 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(card->shortname, (acard->type =3D=3D CMI8329) ? "C-Media =
CMI8329" : "C-Media CMI8330/C3D");
           ^~~~~~
   sound/isa/cmi8330.c:596:2: note: Call to function 'strcpy' is insecure a=
s it does not provide bounding of the memory buffer. Replace unbounded copy=
 functions with analogous functions that support length arguments such as '=
strlcpy'. CWE-119
           strcpy(card->shortname, (acard->type =3D=3D CMI8329) ? "C-Media =
CMI8329" : "C-Media CMI8330/C3D");
           ^~~~~~
>> sound/isa/cmi8330.c:597:2: warning: Call to function 'sprintf' is insecu=
re as it does not provide bounding of the memory buffer or security checks =
introduced in the C11 standard. Replace with analogous functions that suppo=
rt length arguments or provides boundary checks such as 'sprintf_s' in case=
 of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandli=
ng]
           sprintf(card->longname, "%s at 0x%lx, irq %d, dma %d",
           ^~~~~~~
   sound/isa/cmi8330.c:597:2: note: Call to function 'sprintf' is insecure =
as it does not provide bounding of the memory buffer or security checks int=
roduced in the C11 standard. Replace with analogous functions that support =
length arguments or provides boundary checks such as 'sprintf_s' in case of=
 C11
           sprintf(card->longname, "%s at 0x%lx, irq %d, dma %d",
           ^~~~~~~
   Suppressed 35 warnings (35 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   19 warnings generated.
   drivers/w1/slaves/w1_ds28e04.c:137:3: warning: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(buf, &data->memory[off], count);
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/w1/slaves/w1_ds28e04.c:137:3: note: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(buf, &data->memory[off], count);
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   22 warnings generated.
   Suppressed 22 warnings (22 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   22 warnings generated.
   Suppressed 22 warnings (22 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   23 warnings generated.
   drivers/iio/chemical/bme680_core.c:741:2: warning: Value stored to 'ret'=
 is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D regmap_read(data->regmap, BME680_REG_MEAS_STAT_0, &check=
);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/chemical/bme680_core.c:741:2: note: Value stored to 'ret' is=
 never read
           ret =3D regmap_read(data->regmap, BME680_REG_MEAS_STAT_0, &check=
);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 22 warnings (22 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   37 warnings generated.
   mm/dmapool.c:376:3: warning: Call to function 'memset' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureA=
PI.DeprecatedOrUnsafeBufferHandling]
                   memset(retval, 0, pool->size);
                   ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   mm/dmapool.c:376:3: note: Call to function 'memset' is insecure as it do=
es not provide security checks introduced in the C11 standard. Replace with=
 analogous functions that support length arguments or provides boundary che=
cks such as 'memset_s' in case of C11
                   memset(retval, 0, pool->size);
                   ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   mm/dmapool.c:425:3: warning: Call to function 'memset' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureA=
PI.DeprecatedOrUnsafeBufferHandling]
                   memset(vaddr, 0, pool->size);
                   ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   mm/dmapool.c:425:3: note: Call to function 'memset' is insecure as it do=
es not provide security checks introduced in the C11 standard. Replace with=
 analogous functions that support length arguments or provides boundary che=
cks such as 'memset_s' in case of C11
                   memset(vaddr, 0, pool->size);
                   ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   Suppressed 35 warnings (35 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   54 warnings generated.
   include/linux/list.h:137:13: warning: Use of memory after it is freed [c=
lang-analyzer-unix.Malloc]
           __list_del(entry->prev, entry->next);
                      ^
   mm/hugetlb.c:6219:6: note: Assuming 'from' is <=3D 'to'
           if (from > to) {
               ^~~~~~~~~
   mm/hugetlb.c:6219:2: note: Taking false branch
           if (from > to) {
           ^
   mm/hugetlb.c:6229:6: note: Assuming the condition is false
           if (vm_flags & VM_NORESERVE)
               ^~~~~~~~~~~~~~~~~~~~~~~
   mm/hugetlb.c:6229:2: note: Taking false branch
           if (vm_flags & VM_NORESERVE)
           ^
   mm/hugetlb.c:6238:6: note: Assuming 'vma' is non-null
           if (!vma || vma->vm_flags & VM_MAYSHARE) {
               ^~~~
   mm/hugetlb.c:6238:6: note: Left side of '||' is false
   mm/hugetlb.c:6238:14: note: Assuming the condition is true
           if (!vma || vma->vm_flags & VM_MAYSHARE) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/hugetlb.c:6238:2: note: Taking true branch
--
           ^
   kernel/trace/ftrace.c:4738:2: note: Taking true branch
           if (ftrace_hash_empty(old_hash))
           ^
   kernel/trace/ftrace.c:4739:3: note: Control jumps to line 4801
                   goto out_unlock;
                   ^
   kernel/trace/ftrace.c:4804:2: note: Calling 'release_probe'
           release_probe(probe);
           ^~~~~~~~~~~~~~~~~~~~
   kernel/trace/ftrace.c:4513:10: note: Assuming field 'ref' is > 0
           WARN_ON(probe->ref <=3D 0);
                   ^
   include/asm-generic/bug.h:121:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   kernel/trace/ftrace.c:4513:2: note: Taking false branch
           WARN_ON(probe->ref <=3D 0);
           ^
   include/asm-generic/bug.h:122:2: note: expanded from macro 'WARN_ON'
           if (unlikely(__ret_warn_on))                                    \
           ^
   kernel/trace/ftrace.c:4518:6: note: Assuming field 'ref' is 0
           if (!probe->ref) {
               ^~~~~~~~~~~
   kernel/trace/ftrace.c:4518:2: note: Taking true branch
           if (!probe->ref) {
           ^
   kernel/trace/ftrace.c:4524:7: note: Assuming field 'free' is null
                   if (probe_ops->free)
                       ^~~~~~~~~~~~~~~
   kernel/trace/ftrace.c:4524:3: note: Taking false branch
                   if (probe_ops->free)
                   ^
   kernel/trace/ftrace.c:4527:3: note: Memory is released
                   kfree(probe);
                   ^~~~~~~~~~~~
   kernel/trace/ftrace.c:4804:2: note: Returning; memory was released
           release_probe(probe);
           ^~~~~~~~~~~~~~~~~~~~
   kernel/trace/ftrace.c:4818:3: note: Returning; memory was released
                   unregister_ftrace_function_probe_func(NULL, tr, probe->p=
robe_ops);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
   kernel/trace/ftrace.c:4817:2: note: Loop condition is true.  Entering lo=
op body
           list_for_each_entry_safe(probe, n, &tr->func_probes, list)
           ^
   include/linux/list.h:725:2: note: expanded from macro 'list_for_each_ent=
ry_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \
           ^
   kernel/trace/ftrace.c:4818:3: note: Calling 'unregister_ftrace_function_=
probe_func'
                   unregister_ftrace_function_probe_func(NULL, tr, probe->p=
robe_ops);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
   kernel/trace/ftrace.c:4702:7: note: 'glob' is null
           if (!glob || !strlen(glob) || !strcmp(glob, "*"))
                ^~~~
   kernel/trace/ftrace.c:4702:12: note: Left side of '||' is true
           if (!glob || !strlen(glob) || !strcmp(glob, "*"))
                     ^
   kernel/trace/ftrace.c:4718:2: note: Loop condition is false. Execution c=
ontinues on line 4722
           list_for_each_entry(probe, &tr->func_probes, list) {
           ^
   include/linux/list.h:638:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   kernel/trace/ftrace.c:4722:6: note: Assuming the condition is false
           if (&probe->list =3D=3D &tr->func_probes)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/ftrace.c:4722:2: note: Taking false branch
           if (&probe->list =3D=3D &tr->func_probes)
           ^
   kernel/trace/ftrace.c:4726:8: note: Use of memory after it is freed
           if (!(probe->ops.flags & FTRACE_OPS_FL_INITIALIZED))
                 ^~~~~~~~~~~~~~~~
   kernel/trace/ftrace.c:7081:3: warning: Call to function 'memmove' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memmove_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memmove(rec, rec + 1,
                   ^~~~~~~
   kernel/trace/ftrace.c:7081:3: note: Call to function 'memmove' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memmove_s' in case of C11
                   memmove(rec, rec + 1,
                   ^~~~~~~
   kernel/trace/ftrace.c:7131:2: warning: Value stored to 'ret' is never re=
ad [clang-analyzer-deadcode.DeadStores]
           ret =3D ftrace_process_locs(NULL,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/ftrace.c:7131:2: note: Value stored to 'ret' is never read
           ret =3D ftrace_process_locs(NULL,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 41 warnings (38 in non-user code, 3 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   38 warnings generated.
   drivers/thermal/intel/intel_menlow.c:309:9: warning: Call to function 's=
printf' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'sprintf_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%lu", deci_kelvin_to_celsius(value));
                  ^~~~~~~
   drivers/thermal/intel/intel_menlow.c:309:9: note: Call to function 'spri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%lu", deci_kelvin_to_celsius(value));
                  ^~~~~~~
   drivers/thermal/intel/intel_menlow.c:332:7: warning: Call to function 's=
scanf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'sscanf_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           if (!sscanf(buf, "%d", &value))
                ^~~~~~
   drivers/thermal/intel/intel_menlow.c:332:7: note: Call to function 'ssca=
nf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'sscanf_s' in case of C11
           if (!sscanf(buf, "%d", &value))
                ^~~~~~
>> drivers/thermal/intel/intel_menlow.c:369:9: warning: Call to function 's=
printf' is insecure as it does not provide bounding of the memory buffer or=
 security checks introduced in the C11 standard. Replace with analogous fun=
ctions that support length arguments or provides boundary checks such as 's=
printf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrU=
nsafeBufferHandling]
           return sprintf(buf, "%s\n", bios_enabled ? "enabled" : "disabled=
");
                  ^~~~~~~
   drivers/thermal/intel/intel_menlow.c:369:9: note: Call to function 'spri=
ntf' is insecure as it does not provide bounding of the memory buffer or se=
curity checks introduced in the C11 standard. Replace with analogous functi=
ons that support length arguments or provides boundary checks such as 'spri=
ntf_s' in case of C11
           return sprintf(buf, "%s\n", bios_enabled ? "enabled" : "disabled=
");
                  ^~~~~~~
   Suppressed 35 warnings (35 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   64 warnings generated.
   drivers/pcmcia/pcmcia_cis.c:358:3: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(*get->buf, tuple->TupleData, tuple->TupleDataLen);
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/pcmcia/pcmcia_cis.c:358:3: note: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11
                   memcpy(*get->buf, tuple->TupleData, tuple->TupleDataLen);
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   Suppressed 63 warnings (63 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   35 warnings generated.
   Suppressed 35 warnings (35 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   drivers/pcmcia/rsrc_nonstatic.c:1104:8: warning: Call to function 'sscan=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'sscanf_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           ret =3D sscanf(buf, "+ 0x%lx - 0x%lx", &start_addr, &end_addr);
                 ^~~~~~
   drivers/pcmcia/rsrc_nonstatic.c:1104:8: note: Call to function 'sscanf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sscanf_s' in case of C11
           ret =3D sscanf(buf, "+ 0x%lx - 0x%lx", &start_addr, &end_addr);
                 ^~~~~~
   drivers/pcmcia/rsrc_nonstatic.c:1106:9: warning: Call to function 'sscan=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'sscanf_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   ret =3D sscanf(buf, "- 0x%lx - 0x%lx", &start_addr, &end=
_addr);
                         ^~~~~~
   drivers/pcmcia/rsrc_nonstatic.c:1106:9: note: Call to function 'sscanf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sscanf_s' in case of C11
                   ret =3D sscanf(buf, "- 0x%lx - 0x%lx", &start_addr, &end=
_addr);
                         ^~~~~~
   drivers/pcmcia/rsrc_nonstatic.c:1109:10: warning: Call to function 'ssca=
nf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'sscanf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           ret =3D sscanf(buf, "0x%lx - 0x%lx", &start_addr,
                                 ^~~~~~
   drivers/pcmcia/rsrc_nonstatic.c:1109:10: note: Call to function 'sscanf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sscanf_s' in case of C11
                           ret =3D sscanf(buf, "0x%lx - 0x%lx", &start_addr,
                                 ^~~~~~
   drivers/pcmcia/rsrc_nonstatic.c:1170:8: warning: Call to function 'sscan=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'sscanf_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           ret =3D sscanf(buf, "+ 0x%lx - 0x%lx", &start_addr, &end_addr);
                 ^~~~~~
   drivers/pcmcia/rsrc_nonstatic.c:1170:8: note: Call to function 'sscanf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sscanf_s' in case of C11
           ret =3D sscanf(buf, "+ 0x%lx - 0x%lx", &start_addr, &end_addr);
                 ^~~~~~
   drivers/pcmcia/rsrc_nonstatic.c:1172:9: warning: Call to function 'sscan=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'sscanf_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   ret =3D sscanf(buf, "- 0x%lx - 0x%lx", &start_addr, &end=
_addr);
                         ^~~~~~
   drivers/pcmcia/rsrc_nonstatic.c:1172:9: note: Call to function 'sscanf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sscanf_s' in case of C11
                   ret =3D sscanf(buf, "- 0x%lx - 0x%lx", &start_addr, &end=
_addr);
                         ^~~~~~
   drivers/pcmcia/rsrc_nonstatic.c:1175:10: warning: Call to function 'ssca=
nf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'sscanf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           ret =3D sscanf(buf, "0x%lx - 0x%lx", &start_addr,
                                 ^~~~~~
   drivers/pcmcia/rsrc_nonstatic.c:1175:10: note: Call to function 'sscanf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sscanf_s' in case of C11
                           ret =3D sscanf(buf, "0x%lx - 0x%lx", &start_addr,
                                 ^~~~~~
   Suppressed 35 warnings (35 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   drivers/iio/imu/inv_icm42600/inv_icm42600_gyro.c:407:2: warning: Call to=
 function 'memcpy' is insecure as it does not provide security checks intro=
duced in the C11 standard. Replace with analogous functions that support le=
ngth arguments or provides boundary checks such as 'memcpy_s' in case of C1=
1 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(data, st->buffer, sizeof(data));
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/iio/imu/inv_icm42600/inv_icm42600_gyro.c:407:2: note: Call to fu=
nction 'memcpy' is insecure as it does not provide security checks introduc=
ed in the C11 standard. Replace with analogous functions that support lengt=
h arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(data, st->buffer, sizeof(data));
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/iio/imu/inv_icm42600/inv_icm42600_gyro.c:788:3: warning: Call to=
 function 'memset' is insecure as it does not provide security checks intro=
duced in the C11 standard. Replace with analogous functions that support le=
ngth arguments or provides boundary checks such as 'memset_s' in case of C1=
1 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&buffer, 0, sizeof(buffer));
                   ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/iio/imu/inv_icm42600/inv_icm42600_gyro.c:788:3: note: Call to fu=
nction 'memset' is insecure as it does not provide security checks introduc=
ed in the C11 standard. Replace with analogous functions that support lengt=
h arguments or provides boundary checks such as 'memset_s' in case of C11
                   memset(&buffer, 0, sizeof(buffer));
                   ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/iio/imu/inv_icm42600/inv_icm42600_gyro.c:789:3: warning: Call to=
 function 'memcpy' is insecure as it does not provide security checks intro=
duced in the C11 standard. Replace with analogous functions that support le=
ngth arguments or provides boundary checks such as 'memcpy_s' in case of C1=
1 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&buffer.gyro, gyro, sizeof(buffer.gyro));
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/iio/imu/inv_icm42600/inv_icm42600_gyro.c:789:3: note: Call to fu=
nction 'memcpy' is insecure as it does not provide security checks introduc=
ed in the C11 standard. Replace with analogous functions that support lengt=
h arguments or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(&buffer.gyro, gyro, sizeof(buffer.gyro));
--
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ax25/af_ax25.c:984:2: note: Taking false branch
           if (sk->sk_type =3D=3D SOCK_SEQPACKET) {
           ^
   net/ax25/af_ax25.c:1042:3: note: Calling 'ax25_destroy_socket'
                   ax25_destroy_socket(ax25);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~
   net/ax25/af_ax25.c:299:2: note: Calling 'ax25_cb_del'
           ax25_cb_del(ax25);
           ^~~~~~~~~~~~~~~~~
   net/ax25/af_ax25.c:65:2: note: Taking true branch
           if (!hlist_unhashed(&ax25->ax25_node)) {
           ^
   net/ax25/af_ax25.c:69:3: note: Calling 'ax25_cb_put'
                   ax25_cb_put(ax25);
                   ^~~~~~~~~~~~~~~~~
   include/net/ax25.h:291:2: note: Taking true branch
           if (refcount_dec_and_test(&ax25->refcount)) {
           ^
   include/net/ax25.h:293:3: note: Memory is released
                   kfree(ax25);
                   ^~~~~~~~~~~
   net/ax25/af_ax25.c:69:3: note: Returning; memory was released via 1st pa=
rameter
                   ax25_cb_put(ax25);
                   ^~~~~~~~~~~~~~~~~
   net/ax25/af_ax25.c:299:2: note: Returning; memory was released via 1st p=
arameter
           ax25_cb_del(ax25);
           ^~~~~~~~~~~~~~~~~
   net/ax25/af_ax25.c:301:2: note: Use of memory after it is freed
           ax25_stop_heartbeat(ax25);
           ^                   ~~~~
   net/ax25/af_ax25.c:653:3: warning: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(devname, 0, sizeof(devname));
                   ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   net/ax25/af_ax25.c:653:3: note: Call to function 'memset' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memset_s' in case of C11
                   memset(devname, 0, sizeof(devname));
                   ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   net/ax25/af_ax25.c:1425:2: warning: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(fsa, 0, sizeof(*fsa));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   net/ax25/af_ax25.c:1425:2: note: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11
           memset(fsa, 0, sizeof(*fsa));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   net/ax25/af_ax25.c:1450:4: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(&fsa->fsa_digipeater[0],
                           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   net/ax25/af_ax25.c:1450:4: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
                           memcpy(&fsa->fsa_digipeater[0],
                           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   net/ax25/af_ax25.c:1676:3: warning: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(sax, 0, sizeof(struct full_sockaddr_ax25));
                   ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   net/ax25/af_ax25.c:1676:3: note: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11
                   memset(sax, 0, sizeof(struct full_sockaddr_ax25));
                   ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   Suppressed 83 warnings (83 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   22 warnings generated.
   sound/synth/emux/emux_oss.c:63:2: warning: Call to function 'strcpy' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(dev->name, emu->name);
           ^~~~~~
   sound/synth/emux/emux_oss.c:63:2: note: Call to function 'strcpy' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcpy'. CWE-119
           strcpy(dev->name, emu->name);
           ^~~~~~
   sound/synth/emux/emux_oss.c:110:2: warning: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&callback, 0, sizeof(callback));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   sound/synth/emux/emux_oss.c:110:2: note: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11
           memset(&callback, 0, sizeof(callback));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
>> sound/synth/emux/emux_oss.c:114:2: warning: Call to function 'sprintf' i=
s insecure as it does not provide bounding of the memory buffer or security=
 checks introduced in the C11 standard. Replace with analogous functions th=
at support length arguments or provides boundary checks such as 'sprintf_s'=
 in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuff=
erHandling]
           sprintf(tmpname, "%s OSS Port", emu->name);
           ^~~~~~~
   sound/synth/emux/emux_oss.c:114:2: note: Call to function 'sprintf' is i=
nsecure as it does not provide bounding of the memory buffer or security ch=
ecks introduced in the C11 standard. Replace with analogous functions that =
support length arguments or provides boundary checks such as 'sprintf_s' in=
 case of C11
           sprintf(tmpname, "%s OSS Port", emu->name);
           ^~~~~~~
   sound/synth/emux/emux_oss.c:484:2: warning: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&ev, 0, sizeof(ev));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   sound/synth/emux/emux_oss.c:484:2: note: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11
           memset(&ev, 0, sizeof(ev));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   61 warnings generated.
   Suppressed 61 warnings (61 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   63 warnings generated.
   net/802/psnap.c:84:2: warning: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecur=
eAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(skb_push(skb, 5), dl->type, 5);
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   net/802/psnap.c:84:2: note: Call to function 'memcpy' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memcpy_s' in case of C11
           memcpy(skb_push(skb, 5), dl->type, 5);
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   net/802/psnap.c:137:3: warning: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecu=
reAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(proto->type, desc, 5);
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   net/802/psnap.c:137:3: note: Call to function 'memcpy' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memcpy_s' in case of C11
                   memcpy(proto->type, desc, 5);
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   Suppressed 61 warnings (61 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   66 warnings generated.
   Suppressed 66 warnings (66 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   67 warnings generated.
   net/core/flow_offload.c:208:2: warning: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(cookie->cookie, data, len);
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   net/core/flow_offload.c:208:2: note: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11
           memcpy(cookie->cookie, data, len);
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   net/core/flow_offload.c:388:3: warning: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&bo, 0, sizeof(bo));
                   ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   net/core/flow_offload.c:388:3: note: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11
                   memset(&bo, 0, sizeof(bo));
                   ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   Suppressed 65 warnings (65 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   98 warnings generated.
   include/net/dst_metadata.h:74:18: warning: Access to field 'type' result=
s in a dereference of a null pointer (loaded from variable 'a') [clang-anal=
yzer-core.NullDereference]
           if (!a !=3D !b || a->type !=3D b->type)
                           ^
   net/core/gro.c:739:37: note: Calling 'dev_gro_receive'
           ret =3D napi_frags_finish(napi, skb, dev_gro_receive(napi, skb));
                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/gro.c:450:2: note: Taking false branch
           if (netif_elide_gro(skb->dev))
           ^
   net/core/gro.c:453:2: note: Calling 'gro_list_prepare'
           gro_list_prepare(&gro_list->list, skb);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/gro.c:327:2: note: Loop condition is true.  Entering loop body
           list_for_each_entry(p, head, list) {
           ^
   include/linux/list.h:638:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   net/core/gro.c:332:7: note: Assuming the condition is false
                   if (hash !=3D skb_get_hash_raw(p)) {
--
                           ^~~~~~~~~~~~~~~~
   Suppressed 69 warnings (69 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   69 warnings generated.
   Suppressed 69 warnings (69 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   99 warnings generated.
   Suppressed 99 warnings (99 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   67 warnings generated.
   Suppressed 67 warnings (67 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   99 warnings generated.
   Suppressed 99 warnings (99 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   72 warnings generated.
   Suppressed 72 warnings (72 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   69 warnings generated.
   Suppressed 69 warnings (69 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   57 warnings generated.
   Suppressed 57 warnings (57 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   86 warnings generated.
   Suppressed 86 warnings (86 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   80 warnings generated.
   Suppressed 80 warnings (80 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   67 warnings generated.
   Suppressed 67 warnings (67 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   38 warnings generated.
   sound/virtio/virtio_card.c:37:2: warning: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(event, 0, sizeof(*event));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   sound/virtio/virtio_card.c:37:2: note: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11
           memset(event, 0, sizeof(*event));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   sound/virtio/virtio_card.c:217:3: warning: Call to function 'snprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(snd->card->longname, sizeof(snd->card->longname=
),
                   ^~~~~~~~
   sound/virtio/virtio_card.c:217:3: note: Call to function 'snprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'snprintf_s' in case of C11
                   snprintf(snd->card->longname, sizeof(snd->card->longname=
),
                   ^~~~~~~~
   sound/virtio/virtio_card.c:222:3: warning: Call to function 'snprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(snd->card->longname, sizeof(snd->card->longname=
),
                   ^~~~~~~~
   sound/virtio/virtio_card.c:222:3: note: Call to function 'snprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'snprintf_s' in case of C11
                   snprintf(snd->card->longname, sizeof(snd->card->longname=
),
                   ^~~~~~~~
   Suppressed 35 warnings (35 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   68 warnings generated.
   net/core/net_namespace.c:115:2: warning: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&ng->ptr[MIN_PERNET_OPS_ID], &old_ng->ptr[MIN_PERNET_OPS_=
ID],
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   net/core/net_namespace.c:115:2: note: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11
           memcpy(&ng->ptr[MIN_PERNET_OPS_ID], &old_ng->ptr[MIN_PERNET_OPS_=
ID],
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   Suppressed 67 warnings (67 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   69 warnings generated.
   Suppressed 69 warnings (69 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   69 warnings generated.
   Suppressed 69 warnings (69 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   69 warnings generated.
   Suppressed 69 warnings (69 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   73 warnings generated.
   Suppressed 73 warnings (73 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   69 warnings generated.
   Suppressed 69 warnings (69 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   36 warnings generated.
>> sound/isa/ad1816a/ad1816a.c:150:2: warning: Call to function 'sprintf' i=
s insecure as it does not provide bounding of the memory buffer or security=
 checks introduced in the C11 standard. Replace with analogous functions th=
at support length arguments or provides boundary checks such as 'sprintf_s'=
 in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuff=
erHandling]
           sprintf(card->longname, "%s, SS at 0x%lx, irq %d, dma %d&%d",
           ^~~~~~~
   sound/isa/ad1816a/ad1816a.c:150:2: note: Call to function 'sprintf' is i=
nsecure as it does not provide bounding of the memory buffer or security ch=
ecks introduced in the C11 standard. Replace with analogous functions that =
support length arguments or provides boundary checks such as 'sprintf_s' in=
 case of C11
           sprintf(card->longname, "%s, SS at 0x%lx, irq %d, dma %d&%d",
           ^~~~~~~
   Suppressed 35 warnings (35 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   24 warnings generated.
   drivers/cpufreq/freq_table.c:257:12: warning: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   count +=3D sprintf(&buf[count], "%d ", pos->frequency);
                            ^~~~~~~
   drivers/cpufreq/freq_table.c:257:12: note: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11
                   count +=3D sprintf(&buf[count], "%d ", pos->frequency);
                            ^~~~~~~
   drivers/cpufreq/freq_table.c:259:11: warning: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           count +=3D sprintf(&buf[count], "\n");
                    ^~~~~~~
   drivers/cpufreq/freq_table.c:259:11: note: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11
           count +=3D sprintf(&buf[count], "\n");
                    ^~~~~~~
   Suppressed 22 warnings (22 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   22 warnings generated.
   Suppressed 22 warnings (22 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   22 warnings generated.
   Suppressed 22 warnings (22 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   94 warnings generated.
   net/ipv6/inet6_connection_sock.c:37:2: warning: Call to function 'memset=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(fl6, 0, sizeof(*fl6));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   net/ipv6/inet6_connection_sock.c:37:2: note: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11
           memset(fl6, 0, sizeof(*fl6));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   net/ipv6/inet6_connection_sock.c:87:2: warning: Call to function 'memset=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(fl6, 0, sizeof(*fl6));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   net/ipv6/inet6_connection_sock.c:87:2: note: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11
           memset(fl6, 0, sizeof(*fl6));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   Suppressed 92 warnings (92 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   84 warnings generated.
   net/ipv6/udp_offload.c:94:3: warning: Call to function 'memmove' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memmove_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memmove(packet_start-frag_hdr_sz, packet_start, unfrag_l=
en);
                   ^~~~~~~
   net/ipv6/udp_offload.c:94:3: note: Call to function 'memmove' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memmove_s' in case of C11
                   memmove(packet_start-frag_hdr_sz, packet_start, unfrag_l=
en);
                   ^~~~~~~
   Suppressed 83 warnings (83 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   77 warnings generated.
   Suppressed 77 warnings (77 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   77 warnings generated.
   Suppressed 77 warnings (77 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   65 warnings generated.
   net/hsr/hsr_framereg.c:393:2: warning: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&eth_hdr(skb)->h_source, node->macaddress_A, ETH_ALEN);
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   net/hsr/hsr_framereg.c:393:2: note: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11
           memcpy(&eth_hdr(skb)->h_source, node->macaddress_A, ETH_ALEN);
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   Suppressed 64 warnings (64 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   64 warnings generated.
   Suppressed 64 warnings (64 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   82 warnings generated.
   Suppressed 82 warnings (82 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   65 warnings generated.
   Suppressed 65 warnings (65 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   69 warnings generated.
   net/qrtr/af_qrtr.c:1061:3: warning: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(addr, 0, sizeof(*addr));
                   ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)

vim +597 sound/isa/cmi8330.c

^1da177e4c3f41 Linus Torvalds  2005-04-16  521  =

1bff292e9abec7 Bill Pemberton  2012-12-06  522  static int snd_cmi8330_prob=
e(struct snd_card *card, int dev)
acdcbc15426b91 Takashi Iwai    2005-11-17  523  {
acdcbc15426b91 Takashi Iwai    2005-11-17  524  	struct snd_cmi8330 *acard;
acdcbc15426b91 Takashi Iwai    2005-11-17  525  	int i, err;
48972cc5101dee Krzysztof Helt  2009-01-21  526  	struct snd_opl3 *opl3;
acdcbc15426b91 Takashi Iwai    2005-11-17  527  =

acdcbc15426b91 Takashi Iwai    2005-11-17  528  	acard =3D card->private_da=
ta;
760fc6b838d8c7 Krzysztof Helt  2008-07-31  529  	err =3D snd_wss_create(car=
d, wssport[dev] + 4, -1,
^1da177e4c3f41 Linus Torvalds  2005-04-16  530  			     wssirq[dev],
760fc6b838d8c7 Krzysztof Helt  2008-07-31  531  			     wssdma[dev], -1,
760fc6b838d8c7 Krzysztof Helt  2008-07-31  532  			     WSS_HW_DETECT, 0, &=
acard->wss);
760fc6b838d8c7 Krzysztof Helt  2008-07-31  533  	if (err < 0) {
69eb88825a7a56 Ondrej Zary     2009-07-04  534  		snd_printk(KERN_ERR PFX "=
AD1848 device busy??\n");
acdcbc15426b91 Takashi Iwai    2005-11-17  535  		return err;
^1da177e4c3f41 Linus Torvalds  2005-04-16  536  	}
ece11c9b6db5b9 Krzysztof Helt  2008-07-31  537  	if (acard->wss->hardware !=
=3D WSS_HW_CMI8330) {
69eb88825a7a56 Ondrej Zary     2009-07-04  538  		snd_printk(KERN_ERR PFX "=
AD1848 not found during probe\n");
acdcbc15426b91 Takashi Iwai    2005-11-17  539  		return -ENODEV;
^1da177e4c3f41 Linus Torvalds  2005-04-16  540  	}
^1da177e4c3f41 Linus Torvalds  2005-04-16  541  =

3e38150bf238bb Takashi Iwai    2021-06-08  542  	err =3D snd_sbdsp_create(c=
ard, sbport[dev],
^1da177e4c3f41 Linus Torvalds  2005-04-16  543  			       sbirq[dev],
^1da177e4c3f41 Linus Torvalds  2005-04-16  544  			       snd_sb16dsp_inter=
rupt,
^1da177e4c3f41 Linus Torvalds  2005-04-16  545  			       sbdma8[dev],
^1da177e4c3f41 Linus Torvalds  2005-04-16  546  			       sbdma16[dev],
3e38150bf238bb Takashi Iwai    2021-06-08  547  			       SB_HW_AUTO, &acar=
d->sb);
3e38150bf238bb Takashi Iwai    2021-06-08  548  	if (err < 0) {
69eb88825a7a56 Ondrej Zary     2009-07-04  549  		snd_printk(KERN_ERR PFX "=
SB16 device busy??\n");
acdcbc15426b91 Takashi Iwai    2005-11-17  550  		return err;
^1da177e4c3f41 Linus Torvalds  2005-04-16  551  	}
^1da177e4c3f41 Linus Torvalds  2005-04-16  552  	if (acard->sb->hardware !=
=3D SB_HW_16) {
69eb88825a7a56 Ondrej Zary     2009-07-04  553  		snd_printk(KERN_ERR PFX "=
SB16 not found during probe\n");
31028cbed26a8a Zhen Lei        2021-07-07  554  		return -ENODEV;
^1da177e4c3f41 Linus Torvalds  2005-04-16  555  	}
^1da177e4c3f41 Linus Torvalds  2005-04-16  556  =

760fc6b838d8c7 Krzysztof Helt  2008-07-31  557  	snd_wss_out(acard->wss, CS=
4231_MISC_INFO, 0x40); /* switch on MODE2 */
^1da177e4c3f41 Linus Torvalds  2005-04-16  558  	for (i =3D CMI8330_RMUX3D;=
 i <=3D CMI8330_CDINGAIN; i++)
760fc6b838d8c7 Krzysztof Helt  2008-07-31  559  		snd_wss_out(acard->wss, i,
760fc6b838d8c7 Krzysztof Helt  2008-07-31  560  			    snd_cmi8330_image[i =
- CMI8330_RMUX3D]);
^1da177e4c3f41 Linus Torvalds  2005-04-16  561  =

3e38150bf238bb Takashi Iwai    2021-06-08  562  	err =3D snd_cmi8330_mixer(=
card, acard);
3e38150bf238bb Takashi Iwai    2021-06-08  563  	if (err < 0) {
43bcd973d6d05d Takashi Iwai    2005-09-05  564  		snd_printk(KERN_ERR PFX "=
failed to create mixers\n");
acdcbc15426b91 Takashi Iwai    2005-11-17  565  		return err;
^1da177e4c3f41 Linus Torvalds  2005-04-16  566  	}
^1da177e4c3f41 Linus Torvalds  2005-04-16  567  =

3e38150bf238bb Takashi Iwai    2021-06-08  568  	err =3D snd_cmi8330_pcm(ca=
rd, acard);
3e38150bf238bb Takashi Iwai    2021-06-08  569  	if (err < 0) {
43bcd973d6d05d Takashi Iwai    2005-09-05  570  		snd_printk(KERN_ERR PFX "=
failed to create pcms\n");
acdcbc15426b91 Takashi Iwai    2005-11-17  571  		return err;
^1da177e4c3f41 Linus Torvalds  2005-04-16  572  	}
48972cc5101dee Krzysztof Helt  2009-01-21  573  	if (fmport[dev] !=3D SNDRV=
_AUTO_PORT) {
48972cc5101dee Krzysztof Helt  2009-01-21  574  		if (snd_opl3_create(card,
48972cc5101dee Krzysztof Helt  2009-01-21  575  				    fmport[dev], fmport=
[dev] + 2,
48972cc5101dee Krzysztof Helt  2009-01-21  576  				    OPL3_HW_AUTO, 0, &o=
pl3) < 0) {
48972cc5101dee Krzysztof Helt  2009-01-21  577  			snd_printk(KERN_ERR PFX
48972cc5101dee Krzysztof Helt  2009-01-21  578  				   "no OPL device at 0x=
%lx-0x%lx ?\n",
48972cc5101dee Krzysztof Helt  2009-01-21  579  				   fmport[dev], fmport[=
dev] + 2);
48972cc5101dee Krzysztof Helt  2009-01-21  580  		} else {
48972cc5101dee Krzysztof Helt  2009-01-21  581  			err =3D snd_opl3_hwdep_n=
ew(opl3, 0, 1, NULL);
48972cc5101dee Krzysztof Helt  2009-01-21  582  			if (err < 0)
48972cc5101dee Krzysztof Helt  2009-01-21  583  				return err;
48972cc5101dee Krzysztof Helt  2009-01-21  584  		}
48972cc5101dee Krzysztof Helt  2009-01-21  585  	}
48972cc5101dee Krzysztof Helt  2009-01-21  586  =

c97dff84e0d9a4 Krzysztof Helt  2009-01-29  587  	if (mpuport[dev] !=3D SNDR=
V_AUTO_PORT) {
c97dff84e0d9a4 Krzysztof Helt  2009-01-29  588  		if (snd_mpu401_uart_new(c=
ard, 0, MPU401_HW_MPU401,
c97dff84e0d9a4 Krzysztof Helt  2009-01-29  589  					mpuport[dev], 0, mpuir=
q[dev],
dba8b46992c559 Clemens Ladisch 2011-09-13  590  					NULL) < 0)
c97dff84e0d9a4 Krzysztof Helt  2009-01-29  591  			printk(KERN_ERR PFX "no =
MPU-401 device@0x%lx.\n",
c97dff84e0d9a4 Krzysztof Helt  2009-01-29  592  				mpuport[dev]);
c97dff84e0d9a4 Krzysztof Helt  2009-01-29  593  	}
^1da177e4c3f41 Linus Torvalds  2005-04-16  594  =

69eb88825a7a56 Ondrej Zary     2009-07-04  595  	strcpy(card->driver, (acar=
d->type =3D=3D CMI8329) ? "CMI8329" : "CMI8330/C3D");
69eb88825a7a56 Ondrej Zary     2009-07-04  596  	strcpy(card->shortname, (a=
card->type =3D=3D CMI8329) ? "C-Media CMI8329" : "C-Media CMI8330/C3D");
^1da177e4c3f41 Linus Torvalds  2005-04-16 @597  	sprintf(card->longname, "%=
s at 0x%lx, irq %d, dma %d",
^1da177e4c3f41 Linus Torvalds  2005-04-16  598  		card->shortname,
^1da177e4c3f41 Linus Torvalds  2005-04-16  599  		acard->wss->port,
^1da177e4c3f41 Linus Torvalds  2005-04-16  600  		wssirq[dev],
^1da177e4c3f41 Linus Torvalds  2005-04-16  601  		wssdma[dev]);
^1da177e4c3f41 Linus Torvalds  2005-04-16  602  =

acdcbc15426b91 Takashi Iwai    2005-11-17  603  	return snd_card_register(c=
ard);
acdcbc15426b91 Takashi Iwai    2005-11-17  604  }
43bcd973d6d05d Takashi Iwai    2005-09-05  605  =


:::::: The code at line 597 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6810554745920091140==--

