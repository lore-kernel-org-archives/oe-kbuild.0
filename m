Content-Type: multipart/mixed; boundary="===============0984819094985754967=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [daniel-thompson:clang-analyzer/initial_review 7/7] kernel/bpf/syscall.c:747:2: warning: Null pointer passed as 1st argument to memory set function [clang-analyzer-unix.cstring.NullArg]
Date: Mon, 09 May 2022 05:41:56 +0800
Message-ID: <202205090556.edTCutdb-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0984819094985754967==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Daniel Thompson <daniel.thompson@linaro.org>

tree:   https://git.linaro.org/people/daniel.thompson/linux.git clang-analy=
zer/initial_review
head:   ad6525bf355a301ca52b1dc3639fa340409c79b9
commit: ad6525bf355a301ca52b1dc3639fa340409c79b9 [7/7] [RFC] linux/err.h: R=
efactor IS_ERR_VALUE(x) to improve clang reasoning
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20509/202205090556.edTCutdb-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5e004f=
b787698440a387750db7f8028e7cb14cfc)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add daniel-thompson https://git.linaro.org/people/daniel=
.thompson/linux.git
        git fetch --no-tags daniel-thompson clang-analyzer/initial_review
        git checkout ad6525bf355a301ca52b1dc3639fa340409c79b9
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   crypto/ecc.c:918:2: note: Taking false branch
           if (strncmp(curve->name, "nist_", 5) !=3D 0) {
           ^
   crypto/ecc.c:934:2: note: Control jumps to the 'default' case at line 944
           switch (ndigits) {
           ^
   crypto/ecc.c:945:3: note: Assuming the condition is false
                   pr_err_ratelimited("ecc: unsupported digits size!\n");
                   ^
   include/linux/printk.h:654:2: note: expanded from macro 'pr_err_ratelimi=
ted'
           printk_ratelimited(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:639:6: note: expanded from macro 'printk_ratelimi=
ted'
           if (__ratelimit(&_rs))                                          \
               ^~~~~~~~~~~~~~~~~
   include/linux/ratelimit_types.h:41:28: note: expanded from macro '__rate=
limit'
   #define __ratelimit(state) ___ratelimit(state, __func__)
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/ecc.c:945:3: note: Taking false branch
                   pr_err_ratelimited("ecc: unsupported digits size!\n");
                   ^
   include/linux/printk.h:654:2: note: expanded from macro 'pr_err_ratelimi=
ted'
           printk_ratelimited(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:639:2: note: expanded from macro 'printk_ratelimi=
ted'
           if (__ratelimit(&_rs))                                          \
           ^
   crypto/ecc.c:946:3: note: Returning without writing to '*result'
                   return false;
                   ^
   crypto/ecc.c:982:2: note: Returning from 'vli_mmod_fast'
           vli_mmod_fast(result, product, curve);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/ecc.c:983:1: note: Returning without writing to '*result'
   }
   ^
   crypto/ecc.c:1568:2: note: Returning from 'vli_mod_square_fast'
           vli_mod_square_fast(xxx, pk->x, curve); /* x^2 */
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/ecc.c:1569:2: note: Calling 'vli_mod_mult_fast'
           vli_mod_mult_fast(xxx, xxx, pk->x, curve); /* x^3 */
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/ecc.c:971:2: note: Calling 'vli_mult'
           vli_mult(product, left, right, curve->g.ndigits);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/ecc.c:401:14: note: Assuming the condition is true
           for (k =3D 0; k < ndigits * 2 - 1; k++) {
                       ^~~~~~~~~~~~~~~~~~~
   crypto/ecc.c:401:2: note: Loop condition is true.  Entering loop body
           for (k =3D 0; k < ndigits * 2 - 1; k++) {
           ^
   crypto/ecc.c:404:7: note: Assuming 'k' is < 'ndigits'
                   if (k < ndigits)
                       ^~~~~~~~~~~
   crypto/ecc.c:404:3: note: Taking true branch
                   if (k < ndigits)
                   ^
   crypto/ecc.c:405:4: note: The value 0 is assigned to 'min'
                           min =3D 0;
                           ^~~~~~~
   crypto/ecc.c:409:8: note: The value 0 is assigned to 'i'
                   for (i =3D min; i <=3D k && i < ndigits; i++) {
                        ^~~~~~~
   crypto/ecc.c:409:17: note: 'i' is <=3D 'k'
                   for (i =3D min; i <=3D k && i < ndigits; i++) {
                                 ^
   crypto/ecc.c:409:17: note: Left side of '&&' is true
   crypto/ecc.c:409:27: note: 'i' is < 'ndigits'
                   for (i =3D min; i <=3D k && i < ndigits; i++) {
                                           ^
   crypto/ecc.c:409:3: note: Loop condition is true.  Entering loop body
                   for (i =3D min; i <=3D k && i < ndigits; i++) {
                   ^
   crypto/ecc.c:412:14: note: 1st function call argument is an uninitialize=
d value
                           product =3D mul_64_64(left[i], right[k - i]);
                                     ^         ~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   26 warnings generated.
   Suppressed 26 warnings (26 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (8 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
>> kernel/bpf/syscall.c:747:2: warning: Null pointer passed as 1st argument=
 to memory set function [clang-analyzer-unix.cstring.NullArg]
           memset(dst, 0, size);
           ^
   kernel/bpf/syscall.c:4758:2: note: Control jumps to 'case BPF_MAP_CREATE=
:'  at line 4759
           switch (cmd) {
           ^
   kernel/bpf/syscall.c:4764:3: note:  Execution continues on line 4771
                   break;
                   ^
   kernel/bpf/syscall.c:4771:9: note: Calling '__sys_bpf'
           return __sys_bpf(cmd, KERNEL_BPFPTR(attr), attr_size);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/syscall.c:4600:6: note: Assuming 'sysctl_unprivileged_bpf_dis=
abled' is 0
           if (sysctl_unprivileged_bpf_disabled && !bpf_capable())
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/syscall.c:4600:39: note: Left side of '&&' is false
           if (sysctl_unprivileged_bpf_disabled && !bpf_capable())
                                                ^
   kernel/bpf/syscall.c:4604:6: note: 'err' is 0
           if (err)
               ^~~
   kernel/bpf/syscall.c:4604:2: note: Taking false branch
           if (err)
           ^
   kernel/bpf/syscall.c:4606:9: note: Assuming '__UNIQUE_ID___x903' is >=3D=
 '__UNIQUE_ID___y904'
           size =3D min_t(u32, size, sizeof(attr));
                  ^
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
                            ^~~~~~~~~~
   kernel/bpf/syscall.c:4606:9: note: '?' condition is false
           size =3D min_t(u32, size, sizeof(attr));
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
   kernel/bpf/syscall.c:4610:6: note: Calling 'copy_from_bpfptr'
           if (copy_from_bpfptr(&attr, uattr, size) !=3D 0)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bpfptr.h:57:9: note: Calling 'copy_from_bpfptr_offset'
           return copy_from_bpfptr_offset(dst, src, 0, size);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bpfptr.h:52:9: note: Calling 'copy_from_sockptr_offset'
           return copy_from_sockptr_offset(dst, (sockptr_t) src, offset, si=
ze);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   include/linux/sockptr.h:47:2: note: Taking false branch
           if (!sockptr_is_kernel(src))
           ^
   include/linux/bpfptr.h:52:9: note: Returning from 'copy_from_sockptr_off=
set'
           return copy_from_sockptr_offset(dst, (sockptr_t) src, offset, si=
ze);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   include/linux/bpfptr.h:57:9: note: Returning from 'copy_from_bpfptr_offs=
et'
           return copy_from_bpfptr_offset(dst, src, 0, size);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/syscall.c:4610:6: note: Returning from 'copy_from_bpfptr'
           if (copy_from_bpfptr(&attr, uattr, size) !=3D 0)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/syscall.c:4610:2: note: Taking false branch
           if (copy_from_bpfptr(&attr, uattr, size) !=3D 0)
           ^
   kernel/bpf/syscall.c:4614:6: note: Assuming 'err' is >=3D 0
           if (err < 0)
               ^~~~~~~
   kernel/bpf/syscall.c:4614:2: note: Taking false branch
           if (err < 0)
           ^
   kernel/bpf/syscall.c:4617:2: note: Control jumps to 'case BPF_MAP_CREATE=
:' @line 4618
           switch (cmd) {
           ^
   kernel/bpf/syscall.c:4619:9: note: Calling 'map_create'
                   err =3D map_create(&attr);
                         ^~~~~~~~~~~~~~~~~
   kernel/bpf/syscall.c:839:8: note: Assuming the condition is false
           err =3D CHECK_ATTR(BPF_MAP_CREATE);
                 ^
   kernel/bpf/syscall.c:733:2: note: expanded from macro 'CHECK_ATTR'
           memchr_inv((void *) &attr->CMD##_LAST_FIELD + \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/syscall.c:840:6: note: 'err' is 0
           if (err)
               ^~~
   kernel/bpf/syscall.c:840:2: note: Taking false branch
           if (err)
--
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/sed-opal.c:402:10: note: Returning from 'opal_discovery0_step'
           error =3D opal_discovery0_step(dev);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~
   block/sed-opal.c:403:6: note: 'error' is 0
           if (error)
               ^~~~~
   block/sed-opal.c:403:2: note: Taking false branch
           if (error)
           ^
   block/sed-opal.c:406:2: note: Loop condition is true.  Entering loop body
           for (state =3D 0; state < n_steps; state++) {
           ^
   block/sed-opal.c:407:11: note: Calling 'execute_step'
                   error =3D execute_step(dev, &steps[state], state);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/sed-opal.c:384:28: note: Passing null pointer value via 2nd parame=
ter 'data'
           int error =3D step->fn(dev, step->data);
                                     ^~~~~~~~~~
   block/sed-opal.c:384:14: note: Calling 'start_SIDASP_opal_session'
           int error =3D step->fn(dev, step->data);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~
   block/sed-opal.c:1458:6: note: Assuming 'key' is null
           if (!key) {
               ^~~~
   block/sed-opal.c:1458:2: note: Taking true branch
           if (!key) {
           ^
   block/sed-opal.c:1459:3: note: 'okey' initialized to a null pointer value
                   const struct opal_key *okey =3D data;
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/sed-opal.c:1464:8: note: Access to field 'key_len' results in a de=
reference of a null pointer (loaded from variable 'okey')
                                                    okey->key_len);
                                                    ^~~~
   block/sed-opal.c:1492:8: warning: Access to field 'key_len' results in a=
 dereference of a null pointer (loaded from variable 'okey') [clang-analyze=
r-core.NullDereference]
                                             okey->key_len);
                                             ^
   block/sed-opal.c:2628:6: note: Assuming the condition is false
           if (!capable(CAP_SYS_ADMIN))
               ^~~~~~~~~~~~~~~~~~~~~~~
   block/sed-opal.c:2628:2: note: Taking false branch
           if (!capable(CAP_SYS_ADMIN))
           ^
   block/sed-opal.c:2630:6: note: Assuming 'dev' is non-null
           if (!dev)
               ^~~~
   block/sed-opal.c:2630:2: note: Taking false branch
           if (!dev)
           ^
   block/sed-opal.c:2632:6: note: Assuming field 'supported' is true
           if (!dev->supported)
               ^~~~~~~~~~~~~~~
   block/sed-opal.c:2632:2: note: Taking false branch
           if (!dev->supported)
           ^
   block/sed-opal.c:2636:2: note: Taking false branch
           if (IS_ERR(p))
           ^
   block/sed-opal.c:2639:2: note: Control jumps to 'case 1091072232:'  at l=
ine 2682
           switch (cmd) {
           ^
   block/sed-opal.c:2683:9: note: Calling 'opal_reverttper'
                   ret =3D opal_reverttper(dev, p, true);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/sed-opal.c:2337:2: note: field 'data' initialized to a null pointe=
r value
           const struct opal_step psid_revert_steps[] =3D {
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/sed-opal.c:2346:6: note: 'psid' is true
           if (psid)
               ^~~~
   block/sed-opal.c:2346:2: note: Taking true branch
           if (psid)
           ^
   block/sed-opal.c:2347:9: note: Calling 'execute_steps'
                   ret =3D execute_steps(dev, psid_revert_steps,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/sed-opal.c:403:6: note: 'error' is 0
           if (error)
               ^~~~~
   block/sed-opal.c:403:2: note: Taking false branch
           if (error)
           ^
   block/sed-opal.c:406:2: note: Loop condition is true.  Entering loop body
           for (state =3D 0; state < n_steps; state++) {
           ^
   block/sed-opal.c:407:11: note: Calling 'execute_step'
                   error =3D execute_step(dev, &steps[state], state);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/sed-opal.c:384:28: note: Passing null pointer value via 2nd parame=
ter 'data'
           int error =3D step->fn(dev, step->data);
                                     ^~~~~~~~~~
   block/sed-opal.c:384:14: note: Calling 'start_PSID_opal_session'
           int error =3D step->fn(dev, step->data);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~
   block/sed-opal.c:1487:2: note: 'okey' initialized to a null pointer value
           const struct opal_key *okey =3D data;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/sed-opal.c:1492:8: note: Access to field 'key_len' results in a de=
reference of a null pointer (loaded from variable 'okey')
                                             okey->key_len);
                                             ^~~~
>> block/sed-opal.c:1499:18: warning: Dereference of null pointer [clang-an=
alyzer-core.NullDereference]
           size_t keylen =3D session->opal_key.key_len;
                           ^
   block/sed-opal.c:2628:6: note: Assuming the condition is false
           if (!capable(CAP_SYS_ADMIN))
               ^~~~~~~~~~~~~~~~~~~~~~~
   block/sed-opal.c:2628:2: note: Taking false branch
           if (!capable(CAP_SYS_ADMIN))
           ^
   block/sed-opal.c:2630:6: note: Assuming 'dev' is non-null
           if (!dev)
               ^~~~
   block/sed-opal.c:2630:2: note: Taking false branch
           if (!dev)
           ^
   block/sed-opal.c:2632:6: note: Assuming field 'supported' is true
           if (!dev->supported)
               ^~~~~~~~~~~~~~~
   block/sed-opal.c:2632:2: note: Taking false branch
           if (!dev->supported)
           ^
   block/sed-opal.c:2636:2: note: Taking false branch
           if (IS_ERR(p))
           ^
   block/sed-opal.c:2639:2: note: Control jumps to 'case 1091596518:'  at l=
ine 2676
           switch (cmd) {
           ^
   block/sed-opal.c:2677:9: note: Calling 'opal_erase_locking_range'
                   ret =3D opal_erase_locking_range(dev, p);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/sed-opal.c:2185:2: note: field 'data' initialized to a null pointe=
r value
           const struct opal_step erase_steps[] =3D {
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/sed-opal.c:2194:8: note: Calling 'execute_steps'
           ret =3D execute_steps(dev, erase_steps, ARRAY_SIZE(erase_steps));
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/sed-opal.c:403:6: note: 'error' is 0
           if (error)
               ^~~~~
   block/sed-opal.c:403:2: note: Taking false branch
           if (error)
           ^
   block/sed-opal.c:406:2: note: Loop condition is true.  Entering loop body
           for (state =3D 0; state < n_steps; state++) {
           ^
   block/sed-opal.c:407:11: note: Calling 'execute_step'
                   error =3D execute_step(dev, &steps[state], state);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/sed-opal.c:384:28: note: Passing null pointer value via 2nd parame=
ter 'data'
           int error =3D step->fn(dev, step->data);
                                     ^~~~~~~~~~
   block/sed-opal.c:384:14: note: Calling 'start_auth_opal_session'
           int error =3D step->fn(dev, step->data);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~
   block/sed-opal.c:1497:2: note: 'session' initialized to a null pointer v=
alue
           struct opal_session_info *session =3D data;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/sed-opal.c:1499:18: note: Dereference of null pointer
           size_t keylen =3D session->opal_key.key_len;
                           ^~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   fs/binfmt_elf.c:1317:3: warning: Value stored to 'error' is never read [=
clang-analyzer-deadcode.DeadStores]
                   error =3D vm_mmap(NULL, 0, PAGE_SIZE, PROT_READ | PROT_E=
XEC,
                   ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   fs/binfmt_elf.c:1317:3: note: Value stored to 'error' is never read
                   error =3D vm_mmap(NULL, 0, PAGE_SIZE, PROT_READ | PROT_E=
XEC,
                   ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   fs/binfmt_elf.c:1470:23: warning: Access to field 'name' results in a de=
reference of a null pointer (loaded from variable 'men') [clang-analyzer-co=
re.NullDereference]
           en.n_namesz =3D strlen(men->name) + 1;
                                ^
   fs/binfmt_elf.c:2194:6: note: Assuming the condition is false
           if (dump_vma_snapshot(cprm, &vma_count, &vma_meta, &vma_data_siz=
e))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   fs/binfmt_elf.c:2194:2: note: Taking false branch
           if (dump_vma_snapshot(cprm, &vma_count, &vma_meta, &vma_data_siz=
e))
           ^
   fs/binfmt_elf.c:2209:12: note: Assuming 'segs' is <=3D PN_XNUM
           e_phnum =3D segs > PN_XNUM ? PN_XNUM : segs;
                     ^~~~~~~~~~~~~~
   fs/binfmt_elf.c:2209:12: note: '?' condition is false
   fs/binfmt_elf.c:2215:7: note: Calling 'fill_note_info'
           if (!fill_note_info(&elf, e_phnum, &info, cprm->siginfo, cprm->r=
egs))
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   fs/binfmt_elf.c:1824:2: note: Null pointer value stored to 'info.thread'
           info->thread =3D NULL;
           ^~~~~~~~~~~~~~~~~~~
   fs/binfmt_elf.c:1827:6: note: Assuming 'psinfo' is not equal to NULL
--
                   ^
   include/linux/err.h:89:9: note: Assuming the condition is true
           return IS_ERR_VALUE((unsigned long)ptr);
                  ^
   include/linux/err.h:58:14: note: expanded from macro 'IS_ERR_VALUE'
                   _l !=3D 0 && -MAX_ERRNO <=3D _l;                        =
           \
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   fs/ext4/verity.c:51:7: note: Returning from 'IS_ERR'
                   if (IS_ERR(page))
                       ^~~~~~~~~~~~
   fs/ext4/verity.c:51:3: note: Taking true branch
                   if (IS_ERR(page))
                   ^
   fs/ext4/verity.c:52:4: note: Returning without writing to '*buf'
                           return PTR_ERR(page);
                           ^
   fs/ext4/verity.c:52:4: note: Returning value, which participates in a co=
ndition later
                           return PTR_ERR(page);
                           ^~~~~~~~~~~~~~~~~~~~
   fs/ext4/verity.c:315:8: note: Returning from 'pagecache_read'
           err =3D pagecache_read(inode, &desc_size_disk, sizeof(desc_size_=
disk),
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   fs/ext4/verity.c:317:6: note: Assuming 'err' is 0
           if (err)
               ^~~
   fs/ext4/verity.c:317:2: note: Taking false branch
           if (err)
           ^
   fs/ext4/verity.c:319:12: note: Assigned value is garbage or undefined
           desc_size =3D le32_to_cpu(desc_size_disk);
                     ^
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   fs/fs-writeback.c:148:3: warning: Argument to kfree() is the address of =
the local variable 'work', which is not memory allocated by malloc() [clang=
-analyzer-unix.Malloc]
                   kfree(work);
                   ^
   fs/fs-writeback.c:2702:6: note: Assuming the condition is false
           if (bdi =3D=3D &noop_backing_dev_info)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fs-writeback.c:2702:2: note: Taking false branch
           if (bdi =3D=3D &noop_backing_dev_info)
           ^
   fs/fs-writeback.c:2704:2: note: Taking false branch
           WARN_ON(!rwsem_is_locked(&sb->s_umount));
           ^
   include/asm-generic/bug.h:122:2: note: expanded from macro 'WARN_ON'
           if (unlikely(__ret_warn_on))                                    \
           ^
   fs/fs-writeback.c:2708:2: note: Calling 'bdi_split_work_to_wbs'
           bdi_split_work_to_wbs(bdi, &work, false);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fs-writeback.c:1204:2: note: Loop condition is false.  Exiting loop
           might_sleep();
           ^
   include/linux/kernel.h:138:2: note: expanded from macro 'might_sleep'
           do { __might_sleep(__FILE__, __LINE__); might_resched(); } while=
 (0)
           ^
   fs/fs-writeback.c:1206:7: note: 'skip_if_busy' is false
           if (!skip_if_busy || !writeback_in_progress(&bdi->wb)) {
                ^~~~~~~~~~~~
   fs/fs-writeback.c:1206:20: note: Left side of '||' is true
           if (!skip_if_busy || !writeback_in_progress(&bdi->wb)) {
                             ^
   fs/fs-writeback.c:1208:3: note: Calling 'wb_queue_work'
                   wb_queue_work(&bdi->wb, base_work);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fs-writeback.c:163:6: note: Assuming field 'done' is null
           if (work->done)
               ^~~~~~~~~~
   fs/fs-writeback.c:163:2: note: Taking false branch
           if (work->done)
           ^
   fs/fs-writeback.c:168:6: note: Assuming the condition is false
           if (test_bit(WB_registered, &wb->state)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fs-writeback.c:168:2: note: Taking false branch
           if (test_bit(WB_registered, &wb->state)) {
           ^
   fs/fs-writeback.c:172:3: note: Calling 'finish_writeback_work'
                   finish_writeback_work(wb, work);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fs-writeback.c:147:6: note: Assuming field 'auto_free' is not equal t=
o 0
           if (work->auto_free)
               ^~~~~~~~~~~~~~~
   fs/fs-writeback.c:147:2: note: Taking true branch
           if (work->auto_free)
           ^
   fs/fs-writeback.c:148:3: note: Argument to kfree() is the address of the=
 local variable 'work', which is not memory allocated by malloc()
                   kfree(work);
                   ^     ~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
>> drivers/net/phy/mdio_bus.c:497:2: warning: Null pointer passed as 1st ar=
gument to string copy function [clang-analyzer-unix.cstring.NullArg]
           strncpy(mdiodev->modalias, bi->modalias,
           ^       ~~~~~~~~~~~~~~~~~
   drivers/net/phy/mdio_bus.c:494:2: note: Taking false branch
           if (IS_ERR(mdiodev))
           ^
   drivers/net/phy/mdio_bus.c:497:2: note: Null pointer passed as 1st argum=
ent to string copy function
           strncpy(mdiodev->modalias, bi->modalias,
           ^       ~~~~~~~~~~~~~~~~~
   drivers/net/phy/mdio_bus.c:689:21: warning: Value stored to 'phydev' dur=
ing its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct phy_device *phydev =3D ERR_PTR(-ENODEV);
                              ^~~~~~   ~~~~~~~~~~~~~~~~
   drivers/net/phy/mdio_bus.c:689:21: note: Value stored to 'phydev' during=
 its initialization is never read
           struct phy_device *phydev =3D ERR_PTR(-ENODEV);
                              ^~~~~~   ~~~~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
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
   9 warnings generated.
   drivers/net/phy/sfp-bus.c:510:2: warning: Access to field 'attach' resul=
ts in a dereference of a null pointer (loaded from field 'upstream_ops') [c=
lang-analyzer-core.NullDereference]
           bus->upstream_ops->attach(bus->upstream, bus);
           ^
   drivers/net/phy/sfp-bus.c:694:6: note: Assuming 'bus' is non-null
           if (!bus)
               ^~~~
   drivers/net/phy/sfp-bus.c:694:2: note: Taking false branch
           if (!bus)
           ^
   drivers/net/phy/sfp-bus.c:699:2: note: Value assigned to field 'upstream=
_ops'
           bus->upstream_ops =3D ops;
           ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/phy/sfp-bus.c:702:6: note: Assuming field 'sfp' is non-null
           if (bus->sfp) {
               ^~~~~~~~
   drivers/net/phy/sfp-bus.c:702:2: note: Taking true branch
           if (bus->sfp) {
           ^
   drivers/net/phy/sfp-bus.c:703:9: note: Calling 'sfp_register_bus'
                   ret =3D sfp_register_bus(bus);
                         ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/phy/sfp-bus.c:497:6: note: Assuming 'ops' is null
           if (ops) {
               ^~~
   drivers/net/phy/sfp-bus.c:497:2: note: Taking false branch
           if (ops) {
           ^
   drivers/net/phy/sfp-bus.c:508:6: note: Assuming field 'started' is false
           if (bus->started)
               ^~~~~~~~~~~~
   drivers/net/phy/sfp-bus.c:508:2: note: Taking false branch
           if (bus->started)
           ^
   drivers/net/phy/sfp-bus.c:510:2: note: Access to field 'attach' results =
in a dereference of a null pointer (loaded from field 'upstream_ops')
           bus->upstream_ops->attach(bus->upstream, bus);
           ^    ~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   net/sctp/sm_sideeffect.c:812:41: warning: Access to field 'skb' results =
in a dereference of a null pointer (loaded from variable 'chunk') [clang-an=
alyzer-core.NullDereference]
           hbinfo =3D (struct sctp_sender_hb_info *)chunk->skb->data;
                                                  ^
   net/sctp/sm_sideeffect.c:1274:21: note: 'chunk' initialized to a null po=
inter value
           struct sctp_chunk *chunk =3D NULL, *new_obj;
                              ^~~~~
   net/sctp/sm_sideeffect.c:1285:6: note: Assuming 'event_type' is equal to=
 SCTP_EVENT_T_TIMEOUT
           if (SCTP_EVENT_T_TIMEOUT !=3D event_type)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sctp/sm_sideeffect.c:1285:2: note: Taking false branch
           if (SCTP_EVENT_T_TIMEOUT !=3D event_type)
           ^
   net/sctp/sm_sideeffect.c:1295:2: note: Loop condition is true.  Entering=
 loop body
           while (NULL !=3D (cmd =3D sctp_next_cmd(commands))) {
           ^
   net/sctp/sm_sideeffect.c:1296:3: note: Control jumps to 'case SCTP_CMD_T=
RANSPORT_ON:'  at line 1658
                   switch (cmd->verb) {
                   ^
   net/sctp/sm_sideeffect.c:1660:45: note: Passing null pointer value via 4=
th parameter 'chunk'
                           sctp_cmd_transport_on(commands, asoc, t, chunk);
                                                                    ^~~~~
   net/sctp/sm_sideeffect.c:1660:4: note: Calling 'sctp_cmd_transport_on'
                           sctp_cmd_transport_on(commands, asoc, t, chunk);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sctp/sm_sideeffect.c:775:6: note: Assuming field 'state' is >=3D SCT=
P_STATE_SHUTDOWN_PENDING
           if (t->asoc->state < SCTP_STATE_SHUTDOWN_PENDING)
--
                                               ^
   fs/nilfs2/mdt.c:291:2: note: Taking false branch
           if (unlikely(start > end))
           ^
   fs/nilfs2/mdt.c:294:8: note: Calling 'nilfs_mdt_read_block'
           ret =3D nilfs_mdt_read_block(inode, start, true, out_bh);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nilfs2/mdt.c:170:22: note: 'first_bh' declared without an initial val=
ue
           struct buffer_head *first_bh, *bh;
                               ^~~~~~~~
   fs/nilfs2/mdt.c:175:8: note: Calling 'nilfs_mdt_submit_block'
           err =3D nilfs_mdt_submit_block(inode, block, REQ_OP_READ, 0, &fi=
rst_bh);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   fs/nilfs2/mdt.c:122:15: note: Assuming 'bh' is non-null
           if (unlikely(!bh))
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   fs/nilfs2/mdt.c:122:2: note: Taking false branch
           if (unlikely(!bh))
           ^
   fs/nilfs2/mdt.c:126:6: note: Assuming the condition is false
           if (buffer_uptodate(bh))
               ^~~~~~~~~~~~~~~~~~~
   fs/nilfs2/mdt.c:126:2: note: Taking false branch
           if (buffer_uptodate(bh))
           ^
   fs/nilfs2/mdt.c:129:2: note: Taking false branch
           if (mode_flags & REQ_RAHEAD) {
           ^
   fs/nilfs2/mdt.c:137:6: note: Assuming the condition is false
           if (buffer_uptodate(bh)) {
               ^~~~~~~~~~~~~~~~~~~
   fs/nilfs2/mdt.c:137:2: note: Taking false branch
           if (buffer_uptodate(bh)) {
           ^
   fs/nilfs2/mdt.c:143:6: note: Assuming 'ret' is not equal to 0
           if (unlikely(ret)) {
               ^
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   fs/nilfs2/mdt.c:143:2: note: Taking true branch
           if (unlikely(ret)) {
           ^
   fs/nilfs2/mdt.c:145:3: note: Control jumps to line 160
                   goto failed_bh;
                   ^
   fs/nilfs2/mdt.c:164:2: note: Returning without writing to '*out_bh'
           return ret;
           ^
   fs/nilfs2/mdt.c:175:8: note: Returning from 'nilfs_mdt_submit_block'
           err =3D nilfs_mdt_submit_block(inode, block, REQ_OP_READ, 0, &fi=
rst_bh);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   fs/nilfs2/mdt.c:176:6: note: Assuming the condition is true
           if (err =3D=3D -EEXIST) /* internal code */
               ^~~~~~~~~~~~~~
   fs/nilfs2/mdt.c:176:2: note: Taking true branch
           if (err =3D=3D -EEXIST) /* internal code */
           ^
   fs/nilfs2/mdt.c:177:3: note: Control jumps to line 208
                   goto out;
                   ^
   fs/nilfs2/mdt.c:208:10: note: Assigned value is garbage or undefined
           *out_bh =3D first_bh;
                   ^ ~~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
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
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (4 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
>> drivers/hwmon/applesmc.c:415:7: warning: Null pointer passed as 1st argu=
ment to string comparison function [clang-analyzer-unix.cstring.NullArg]
                   if (strcmp(entry->key, key) < 0)
                       ^
   drivers/hwmon/applesmc.c:1313:6: note: Assuming the condition is false
           if (!dmi_check_system(applesmc_whitelist)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/applesmc.c:1313:2: note: Taking false branch
           if (!dmi_check_system(applesmc_whitelist)) {
           ^
   drivers/hwmon/applesmc.c:1319:6: note: Assuming the condition is false
           if (!request_region(APPLESMC_DATA_PORT, APPLESMC_NR_PORTS,
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/applesmc.c:1319:2: note: Taking false branch
           if (!request_region(APPLESMC_DATA_PORT, APPLESMC_NR_PORTS,
           ^
   drivers/hwmon/applesmc.c:1326:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/hwmon/applesmc.c:1326:2: note: Taking false branch
           if (ret)
           ^
   drivers/hwmon/applesmc.c:1331:2: note: Taking false branch
           if (IS_ERR(pdev)) {
           ^
   drivers/hwmon/applesmc.c:1337:8: note: Calling 'applesmc_init_smcreg'
           ret =3D applesmc_init_smcreg();
                 ^~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/applesmc.c:656:2: note: Loop condition is true.  Entering =
loop body
           for (ms =3D 0; ms < INIT_TIMEOUT_MSECS; ms +=3D INIT_WAIT_MSECS)=
 {
           ^
   drivers/hwmon/applesmc.c:657:9: note: Calling 'applesmc_init_smcreg_try'
                   ret =3D applesmc_init_smcreg_try();
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/applesmc.c:573:6: note: Assuming field 'init_complete' is =
false
           if (s->init_complete)
               ^~~~~~~~~~~~~~~~
   drivers/hwmon/applesmc.c:573:2: note: Taking false branch
           if (s->init_complete)
           ^
   drivers/hwmon/applesmc.c:577:6: note: 'ret' is 0
           if (ret)
               ^~~
   drivers/hwmon/applesmc.c:577:2: note: Taking false branch
           if (ret)
           ^
   drivers/hwmon/applesmc.c:580:6: note: Assuming field 'cache' is null
           if (s->cache && s->key_count !=3D count) {
               ^~~~~~~~
   drivers/hwmon/applesmc.c:580:15: note: Left side of '&&' is false
           if (s->cache && s->key_count !=3D count) {
                        ^
   drivers/hwmon/applesmc.c:588:10: note: Field 'cache' is null
           if (!s->cache)
                   ^
   drivers/hwmon/applesmc.c:588:2: note: Taking true branch
           if (!s->cache)
           ^
   drivers/hwmon/applesmc.c:590:6: note: Assuming field 'cache' is non-null
           if (!s->cache)
               ^~~~~~~~~
   drivers/hwmon/applesmc.c:590:2: note: Taking false branch
           if (!s->cache)
           ^
   drivers/hwmon/applesmc.c:594:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/hwmon/applesmc.c:594:2: note: Taking false branch
           if (ret)
           ^
   drivers/hwmon/applesmc.c:597:6: note: Assuming field 'fan_count' is <=3D=
 10
           if (s->fan_count > 10)
               ^~~~~~~~~~~~~~~~~
   drivers/hwmon/applesmc.c:597:2: note: Taking false branch
           if (s->fan_count > 10)
           ^
   drivers/hwmon/applesmc.c:600:8: note: Calling 'applesmc_get_lower_bound'
           ret =3D applesmc_get_lower_bound(&s->temp_begin, "T");
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/applesmc.c:408:9: note: Assuming 'begin' is not equal to '=
end'
           while (begin !=3D end) {
                  ^~~~~~~~~~~~
   drivers/hwmon/applesmc.c:408:2: note: Loop condition is true.  Entering =
loop body
           while (begin !=3D end) {
           ^
   drivers/hwmon/applesmc.c:411:3: note: Taking false branch
                   if (IS_ERR(entry)) {
                   ^
   drivers/hwmon/applesmc.c:415:7: note: Null pointer passed as 1st argumen=
t to string comparison function
                   if (strcmp(entry->key, key) < 0)
                       ^      ~~~~~~~~~~
>> drivers/hwmon/applesmc.c:437:7: warning: Null pointer passed as 2nd argu=
ment to string comparison function [clang-analyzer-unix.cstring.NullArg]
                   if (strcmp(key, entry->key) < 0)
                       ^
   drivers/hwmon/applesmc.c:989:8: note: Calling 'applesmc_read_key'
           ret =3D applesmc_read_key(KEY_COUNT_KEY, buffer, 4);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/applesmc.c:468:10: note: Calling 'applesmc_get_entry_by_ke=
y'
           entry =3D applesmc_get_entry_by_key(key);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/applesmc.c:453:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/hwmon/applesmc.c:453:2: note: Taking false branch
           if (ret)
           ^
   drivers/hwmon/applesmc.c:455:8: note: Calling 'applesmc_get_upper_bound'
           ret =3D applesmc_get_upper_bound(&end, key);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/applesmc.c:430:9: note: Assuming 'begin' is not equal to '=
end'
           while (begin !=3D end) {
                  ^~~~~~~~~~~~
   drivers/hwmon/applesmc.c:430:2: note: Loop condition is true.  Entering =
loop body
           while (begin !=3D end) {
           ^
   drivers/hwmon/applesmc.c:433:3: note: Taking false branch
                   if (IS_ERR(entry)) {
                   ^
   drivers/hwmon/applesmc.c:437:7: note: Null pointer passed as 2nd argumen=
t to string comparison function
                   if (strcmp(key, entry->key) < 0)
                       ^           ~~~~~~~~~~
   drivers/hwmon/applesmc.c:510:27: warning: The left operand of '<<' is a =
garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           *value =3D ((s16)buffer[0] << 8) | buffer[1];
                                    ^
   drivers/hwmon/applesmc.c:959:2: note: Calling 'applesmc_calibrate'
           applesmc_calibrate();
           ^~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/applesmc.c:719:2: note: Calling 'applesmc_read_s16'
           applesmc_read_s16(MOTION_SENSOR_X_KEY, &rest_x);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/applesmc.c:506:8: note: Calling 'applesmc_read_key'
           ret =3D applesmc_read_key(key, buffer, 2);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/applesmc.c:469:6: note: Calling 'IS_ERR'
           if (IS_ERR(entry))
               ^~~~~~~~~~~~~
   include/linux/err.h:89:9: note: Assuming '_l' is not equal to 0, which p=
articipates in a condition later
           return IS_ERR_VALUE((unsigned long)ptr);
                  ^
   include/linux/err.h:58:3: note: expanded from macro 'IS_ERR_VALUE'
                   _l !=3D 0 && -MAX_ERRNO <=3D _l;                        =
           \
                   ^~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/err.h:89:9: note: Left side of '&&' is true
           return IS_ERR_VALUE((unsigned long)ptr);
                  ^
   include/linux/err.h:58:3: note: expanded from macro 'IS_ERR_VALUE'
                   _l !=3D 0 && -MAX_ERRNO <=3D _l;                        =
           \
                   ^
   include/linux/err.h:89:9: note: Assuming the condition is true
           return IS_ERR_VALUE((unsigned long)ptr);
                  ^
   include/linux/err.h:58:14: note: expanded from macro 'IS_ERR_VALUE'
                   _l !=3D 0 && -MAX_ERRNO <=3D _l;                        =
           \
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/hwmon/applesmc.c:469:6: note: Returning from 'IS_ERR'
           if (IS_ERR(entry))
               ^~~~~~~~~~~~~
   drivers/hwmon/applesmc.c:469:2: note: Taking true branch
           if (IS_ERR(entry))
           ^
   drivers/hwmon/applesmc.c:470:3: note: Returning without writing to '*buf=
fer'
                   return PTR_ERR(entry);
                   ^
   drivers/hwmon/applesmc.c:470:3: note: Returning value, which participate=
s in a condition later
                   return PTR_ERR(entry);
                   ^~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/applesmc.c:506:8: note: Returning from 'applesmc_read_key'
           ret =3D applesmc_read_key(key, buffer, 2);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/applesmc.c:507:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/hwmon/applesmc.c:507:2: note: Taking false branch
           if (ret)
           ^
   drivers/hwmon/applesmc.c:510:27: note: The left operand of '<<' is a gar=
bage value
           *value =3D ((s16)buffer[0] << 8) | buffer[1];
                          ~~~~~~~~~ ^
   drivers/hwmon/applesmc.c:527:16: warning: The left operand of '!=3D' is =
a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
                                   (buffer[0] !=3D 0x00 || buffer[1] !=3D 0=
x00))
                                              ^
   drivers/hwmon/applesmc.c:696:2: note: Calling 'applesmc_device_init'
           applesmc_device_init();
           ^~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/applesmc.c:522:6: note: Assuming field 'has_accelerometer'=
 is true
           if (!smcreg.has_accelerometer)
--
                       ^~~~~~~~~~~
   net/sunrpc/cache.c:1077:3: note: Taking true branch
                   if (!cq->reader) {
                   ^
   net/sunrpc/cache.c:1079:8: note: Assuming 'ch' is equal to field 'item'
                           if (cr->item !=3D ch)
                               ^~~~~~~~~~~~~~
   net/sunrpc/cache.c:1079:4: note: Taking false branch
                           if (cr->item !=3D ch)
                           ^
   net/sunrpc/cache.c:1081:8: note: Assuming the condition is false
                           if (test_bit(CACHE_PENDING, &ch->flags))
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sunrpc/cache.c:1081:4: note: Taking false branch
                           if (test_bit(CACHE_PENDING, &ch->flags))
                           ^
   net/sunrpc/cache.c:1084:8: note: Assuming field 'readers' is equal to 0
                           if (cr->readers !=3D 0)
                               ^~~~~~~~~~~~~~~~
   net/sunrpc/cache.c:1084:4: note: Taking false branch
                           if (cr->readers !=3D 0)
                           ^
   net/sunrpc/cache.c:1076:2: note: Loop condition is false. Execution cont=
inues on line 1088
           list_for_each_entry_safe(cq, tmp, &detail->queue, list)
           ^
   include/linux/list.h:725:2: note: expanded from macro 'list_for_each_ent=
ry_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \
           ^
   net/sunrpc/cache.c:1089:2: note: Loop condition is true.  Entering loop =
body
           while (!list_empty(&dequeued)) {
           ^
   net/sunrpc/cache.c:1094:3: note: Memory is released
                   kfree(cr);
                   ^~~~~~~~~
   net/sunrpc/cache.c:1089:2: note: Loop condition is true.  Entering loop =
body
           while (!list_empty(&dequeued)) {
           ^
   net/sunrpc/cache.c:1091:3: note: Calling 'list_del'
                   list_del(&cr->q.list);
                   ^~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:149:14: note: Use of memory after it is freed
           entry->next =3D LIST_POISON1;
           ~~~~~~~~~~~ ^
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
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
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
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
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
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
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
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
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
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
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
>> drivers/scsi/scsi_lib.c:1129:2: warning: Null pointer passed as 1st argu=
ment to memory set function [clang-analyzer-unix.cstring.NullArg]
           memset(req->__cmd, 0, sizeof(req->__cmd));
           ^
   drivers/scsi/scsi_lib.c:2287:12: note: Calling 'scsi_execute_req'
                   result =3D scsi_execute_req(sdev, cmd, DMA_NONE, NULL, 0=
, sshdr,
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   include/scsi/scsi_device.h:469:9: note: Null is equal to null
           return scsi_execute(sdev, cmd, data_direction, buffer,
                  ^
   include/scsi/scsi_device.h:458:15: note: expanded from macro 'scsi_execu=
te'
           BUILD_BUG_ON((sense) !=3D NULL &&                               =
  \
           ~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:19: note: expanded from macro 'BUILD_BUG_ON'
           BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
           ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:58: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~
   include/linux/compiler_types.h:346:22: note: expanded from macro 'compil=
etime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   include/linux/compiler_types.h:334:23: note: expanded from macro '_compi=
letime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:326:9: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
   include/scsi/scsi_device.h:469:9: note: Left side of '&&' is false
           return scsi_execute(sdev, cmd, data_direction, buffer,
                  ^
   include/scsi/scsi_device.h:458:31: note: expanded from macro 'scsi_execu=
te'
           BUILD_BUG_ON((sense) !=3D NULL &&                               =
  \
                                        ^
   include/scsi/scsi_device.h:469:9: note: Taking false branch
           return scsi_execute(sdev, cmd, data_direction, buffer,
                  ^
   include/scsi/scsi_device.h:458:2: note: expanded from macro 'scsi_execut=
e'
           BUILD_BUG_ON((sense) !=3D NULL &&                               =
  \
           ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
           BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:346:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:334:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:326:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   include/scsi/scsi_device.h:469:9: note: Loop condition is false.  Exitin=
g loop
           return scsi_execute(sdev, cmd, data_direction, buffer,
                  ^
   include/scsi/scsi_device.h:458:2: note: expanded from macro 'scsi_execut=
e'
           BUILD_BUG_ON((sense) !=3D NULL &&                               =
  \
           ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
           BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:346:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:334:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:318:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   include/scsi/scsi_device.h:469:9: note: Calling '__scsi_execute'
           return scsi_execute(sdev, cmd, data_direction, buffer,
                  ^
   include/scsi/scsi_device.h:460:2: note: expanded from macro 'scsi_execut=
e'
           __scsi_execute(sdev, cmd, data_direction, buffer, bufflen,      \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/scsi_lib.c:220:4: note: 'data_direction' is not equal to DM=
A_TO_DEVICE
                           data_direction =3D=3D DMA_TO_DEVICE ?
                           ^~~~~~~~~~~~~~
   drivers/scsi/scsi_lib.c:220:4: note: '?' condition is false
   drivers/scsi/scsi_lib.c:222:4: note: '?' condition is false
                           rq_flags & RQF_PM ? BLK_MQ_REQ_PM : 0);
                           ^
   drivers/scsi/scsi_lib.c:219:8: note: Calling 'scsi_alloc_request'
           req =3D scsi_alloc_request(sdev->request_queue,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/scsi_lib.c:1145:2: note: Taking true branch
           if (!IS_ERR(rq))
           ^
   drivers/scsi/scsi_lib.c:1146:3: note: Calling 'scsi_initialize_rq'
                   scsi_initialize_rq(rq);
                   ^~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/scsi_lib.c:1129:2: note: Null pointer passed as 1st argumen=
t to memory set function
           memset(req->__cmd, 0, sizeof(req->__cmd));
           ^      ~~~~~~~~~~
   include/scsi/scsi_common.h:66:31: warning: The left operand of '&' is a =
garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
--
               ^~~~~~~~~~~~
   net/wireless/nl80211.c:948:2: note: Taking true branch
           if (!cb->args[0]) {
           ^
   net/wireless/nl80211.c:951:8: note: 'attrbuf' is non-null, which partici=
pates in a condition later
                   if (!attrbuf) {
                        ^~~~~~~
   net/wireless/nl80211.c:951:3: note: Taking false branch
                   if (!attrbuf) {
                   ^
   net/wireless/nl80211.c:959:9: note: Calling 'nlmsg_parse_deprecated'
                   err =3D nlmsg_parse_deprecated(cb->nlh,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/netlink.h:772:9: note: Calling '__nlmsg_parse'
           return __nlmsg_parse(nlh, hdrlen, tb, maxtype, policy,
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/netlink.h:728:6: note: Assuming the condition is false
           if (nlh->nlmsg_len < nlmsg_msg_size(hdrlen)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/netlink.h:728:2: note: Taking false branch
           if (nlh->nlmsg_len < nlmsg_msg_size(hdrlen)) {
           ^
   include/net/netlink.h:733:2: note: Returning value, which participates i=
n a condition later
           return __nla_parse(tb, maxtype, nlmsg_attrdata(nlh, hdrlen),
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/netlink.h:772:9: note: Returning from '__nlmsg_parse'
           return __nlmsg_parse(nlh, hdrlen, tb, maxtype, policy,
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/netlink.h:772:2: note: Returning value, which participates i=
n a condition later
           return __nlmsg_parse(nlh, hdrlen, tb, maxtype, policy,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/wireless/nl80211.c:959:9: note: Returning from 'nlmsg_parse_deprecat=
ed'
                   err =3D nlmsg_parse_deprecated(cb->nlh,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/wireless/nl80211.c:963:7: note: Assuming 'err' is 0
                   if (err) {
                       ^~~
   net/wireless/nl80211.c:963:3: note: Taking false branch
                   if (err) {
                   ^
   net/wireless/nl80211.c:972:7: note: Calling 'IS_ERR'
                   if (IS_ERR(*wdev)) {
                       ^~~~~~~~~~~~~
   include/linux/err.h:89:9: note: Assuming '_l' is not equal to 0, which p=
articipates in a condition later
           return IS_ERR_VALUE((unsigned long)ptr);
                  ^
   include/linux/err.h:58:3: note: expanded from macro 'IS_ERR_VALUE'
                   _l !=3D 0 && -MAX_ERRNO <=3D _l;                        =
           \
                   ^~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/err.h:89:9: note: Left side of '&&' is true
           return IS_ERR_VALUE((unsigned long)ptr);
                  ^
   include/linux/err.h:58:3: note: expanded from macro 'IS_ERR_VALUE'
                   _l !=3D 0 && -MAX_ERRNO <=3D _l;                        =
           \
                   ^
   include/linux/err.h:89:9: note: Assuming the condition is true
           return IS_ERR_VALUE((unsigned long)ptr);
                  ^
   include/linux/err.h:58:14: note: expanded from macro 'IS_ERR_VALUE'
                   _l !=3D 0 && -MAX_ERRNO <=3D _l;                        =
           \
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   net/wireless/nl80211.c:972:7: note: Returning from 'IS_ERR'
                   if (IS_ERR(*wdev)) {
                       ^~~~~~~~~~~~~
   net/wireless/nl80211.c:972:3: note: Taking true branch
                   if (IS_ERR(*wdev)) {
                   ^
   net/wireless/nl80211.c:974:4: note: Returning without writing to '*rdev'
                           return PTR_ERR(*wdev);
                           ^
   net/wireless/nl80211.c:974:4: note: Returning value, which participates =
in a condition later
                           return PTR_ERR(*wdev);
                           ^~~~~~~~~~~~~~~~~~~~~
   net/wireless/nl80211.c:9890:8: note: Returning from 'nl80211_prepare_wde=
v_dump'
           res =3D nl80211_prepare_wdev_dump(cb, &rdev, &wdev, attrbuf);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/wireless/nl80211.c:9891:6: note: Assuming 'res' is 0
           if (res) {
               ^~~
   net/wireless/nl80211.c:9891:2: note: Taking false branch
           if (res) {
           ^
   net/wireless/nl80211.c:9901:6: note: Assuming field 'netdev' is null
           if (!wdev->netdev) {
               ^~~~~~~~~~~~~
   net/wireless/nl80211.c:9901:2: note: Taking true branch
           if (!wdev->netdev) {
           ^
   net/wireless/nl80211.c:9903:3: note: Control jumps to line 9937
                   goto out_err;
                   ^
   net/wireless/nl80211.c:9938:2: note: 1st function call argument is an un=
initialized value
           wiphy_unlock(&rdev->wiphy);
           ^            ~~~~~~~~~~~~
>> net/wireless/nl80211.c:14150:18: warning: Dereference of null pointer [c=
lang-analyzer-core.NullDereference]
           for (i =3D 0; i < (*rdev)->wiphy.n_vendor_commands; i++) {
                           ^
   net/wireless/nl80211.c:14212:8: note: Calling 'nl80211_prepare_vendor_du=
mp'
           err =3D nl80211_prepare_vendor_dump(skb, cb, &rdev, &wdev);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/wireless/nl80211.c:14097:6: note: Assuming the condition is false
           if (cb->args[0]) {
               ^~~~~~~~~~~
   net/wireless/nl80211.c:14097:2: note: Taking false branch
           if (cb->args[0]) {
           ^
   net/wireless/nl80211.c:14120:12: note: Calling 'kcalloc'
           attrbuf =3D kcalloc(NUM_NL80211_ATTR, sizeof(*attrbuf), GFP_KERN=
EL);
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:652:9: note: Calling 'kmalloc_array'
           return kmalloc_array(n, size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:617:2: note: Taking false branch
           if (unlikely(check_mul_overflow(n, size, &bytes)))
           ^
   include/linux/slab.h:619:30: note: Left side of '&&' is false
           if (__builtin_constant_p(n) && __builtin_constant_p(size))
                                       ^
   include/linux/slab.h:621:2: note: Returning pointer, which participates =
in a condition later
           return __kmalloc(bytes, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:652:9: note: Returning from 'kmalloc_array'
           return kmalloc_array(n, size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:652:2: note: Returning pointer, which participates =
in a condition later
           return kmalloc_array(n, size, flags | __GFP_ZERO);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/wireless/nl80211.c:14120:12: note: Returning from 'kcalloc'
           attrbuf =3D kcalloc(NUM_NL80211_ATTR, sizeof(*attrbuf), GFP_KERN=
EL);
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/wireless/nl80211.c:14121:6: note: Assuming 'attrbuf' is non-null
           if (!attrbuf)
               ^~~~~~~~
   net/wireless/nl80211.c:14121:2: note: Taking false branch
           if (!attrbuf)
           ^
   net/wireless/nl80211.c:14124:8: note: Calling 'nlmsg_parse_deprecated'
           err =3D nlmsg_parse_deprecated(cb->nlh,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/netlink.h:772:9: note: Calling '__nlmsg_parse'
           return __nlmsg_parse(nlh, hdrlen, tb, maxtype, policy,
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/netlink.h:728:6: note: Assuming the condition is false
           if (nlh->nlmsg_len < nlmsg_msg_size(hdrlen)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/netlink.h:728:2: note: Taking false branch
           if (nlh->nlmsg_len < nlmsg_msg_size(hdrlen)) {
           ^
   include/net/netlink.h:733:9: note: Assigning value, which participates i=
n a condition later
           return __nla_parse(tb, maxtype, nlmsg_attrdata(nlh, hdrlen),
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/netlink.h:733:2: note: Returning value, which participates i=
n a condition later
           return __nla_parse(tb, maxtype, nlmsg_attrdata(nlh, hdrlen),
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/netlink.h:772:9: note: Returning from '__nlmsg_parse'
           return __nlmsg_parse(nlh, hdrlen, tb, maxtype, policy,
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/netlink.h:772:2: note: Returning value, which participates i=
n a condition later
           return __nlmsg_parse(nlh, hdrlen, tb, maxtype, policy,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/wireless/nl80211.c:14124:8: note: Returning from 'nlmsg_parse_deprec=
ated'
           err =3D nlmsg_parse_deprecated(cb->nlh,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/wireless/nl80211.c:14128:6: note: Assuming 'err' is 0
           if (err)
               ^~~
   net/wireless/nl80211.c:14128:2: note: Taking false branch
           if (err)
           ^
   net/wireless/nl80211.c:14131:6: note: Assuming the condition is false
           if (!attrbuf[NL80211_ATTR_VENDOR_ID] ||
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/wireless/nl80211.c:14131:6: note: Left side of '||' is false
   net/wireless/nl80211.c:14132:6: note: Assuming the condition is false
               !attrbuf[NL80211_ATTR_VENDOR_SUBCMD]) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/wireless/nl80211.c:14131:2: note: Taking false branch
           if (!attrbuf[NL80211_ATTR_VENDOR_ID] ||
           ^
   net/wireless/nl80211.c:14138:2: note: Taking false branch
           if (IS_ERR(*wdev))
           ^
   net/wireless/nl80211.c:14141:2: note: Value assigned to 'rdev'
           *rdev =3D __cfg80211_rdev_from_attrs(sock_net(skb->sk), attrbuf);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/wireless/nl80211.c:14142:6: note: Calling 'IS_ERR'
           if (IS_ERR(*rdev)) {
               ^~~~~~~~~~~~~
   include/linux/err.h:89:9: note: Assuming '_l' is equal to 0
           return IS_ERR_VALUE((unsigned long)ptr);
                  ^
   include/linux/err.h:58:3: note: expanded from macro 'IS_ERR_VALUE'
                   _l !=3D 0 && -MAX_ERRNO <=3D _l;                        =
           \
                   ^~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'

vim +747 kernel/bpf/syscall.c

aa79781b65b9cf Daniel Borkmann    2015-10-29  730  =

99c55f7d47c0dc Alexei Starovoitov 2014-09-26  731  /* helper macro to check=
 that unused fields 'union bpf_attr' are zero */
99c55f7d47c0dc Alexei Starovoitov 2014-09-26  732  #define CHECK_ATTR(CMD) \
99c55f7d47c0dc Alexei Starovoitov 2014-09-26  733  	memchr_inv((void *) &at=
tr->CMD##_LAST_FIELD + \
99c55f7d47c0dc Alexei Starovoitov 2014-09-26  734  		   sizeof(attr->CMD##_=
LAST_FIELD), 0, \
99c55f7d47c0dc Alexei Starovoitov 2014-09-26  735  		   sizeof(*attr) - \
99c55f7d47c0dc Alexei Starovoitov 2014-09-26  736  		   offsetof(union bpf_=
attr, CMD##_LAST_FIELD) - \
99c55f7d47c0dc Alexei Starovoitov 2014-09-26  737  		   sizeof(attr->CMD##_=
LAST_FIELD)) !=3D NULL
99c55f7d47c0dc Alexei Starovoitov 2014-09-26  738  =

8e7ae2518f5265 Martin KaFai Lau   2020-03-13  739  /* dst and src must have=
 at least "size" number of bytes.
8e7ae2518f5265 Martin KaFai Lau   2020-03-13  740   * Return strlen on succ=
ess and < 0 on error.
cb4d2b3f03d8ee Martin KaFai Lau   2017-09-27  741   */
8e7ae2518f5265 Martin KaFai Lau   2020-03-13  742  int bpf_obj_name_cpy(cha=
r *dst, const char *src, unsigned int size)
cb4d2b3f03d8ee Martin KaFai Lau   2017-09-27  743  {
8e7ae2518f5265 Martin KaFai Lau   2020-03-13  744  	const char *end =3D src=
 + size;
8e7ae2518f5265 Martin KaFai Lau   2020-03-13  745  	const char *orig_src =
=3D src;
cb4d2b3f03d8ee Martin KaFai Lau   2017-09-27  746  =

8e7ae2518f5265 Martin KaFai Lau   2020-03-13 @747  	memset(dst, 0, size);
3e0ddc4f3ff143 Daniel Borkmann    2019-04-09  748  	/* Copy all isalnum(), =
'_' and '.' chars. */
cb4d2b3f03d8ee Martin KaFai Lau   2017-09-27  749  	while (src < end && *sr=
c) {
3e0ddc4f3ff143 Daniel Borkmann    2019-04-09  750  		if (!isalnum(*src) &&
3e0ddc4f3ff143 Daniel Borkmann    2019-04-09  751  		    *src !=3D '_' && *=
src !=3D '.')
cb4d2b3f03d8ee Martin KaFai Lau   2017-09-27  752  			return -EINVAL;
cb4d2b3f03d8ee Martin KaFai Lau   2017-09-27  753  		*dst++ =3D *src++;
cb4d2b3f03d8ee Martin KaFai Lau   2017-09-27  754  	}
cb4d2b3f03d8ee Martin KaFai Lau   2017-09-27  755  =

8e7ae2518f5265 Martin KaFai Lau   2020-03-13  756  	/* No '\0' found in "si=
ze" number of bytes */
cb4d2b3f03d8ee Martin KaFai Lau   2017-09-27  757  	if (src =3D=3D end)
cb4d2b3f03d8ee Martin KaFai Lau   2017-09-27  758  		return -EINVAL;
cb4d2b3f03d8ee Martin KaFai Lau   2017-09-27  759  =

8e7ae2518f5265 Martin KaFai Lau   2020-03-13  760  	return src - orig_src;
cb4d2b3f03d8ee Martin KaFai Lau   2017-09-27  761  }
cb4d2b3f03d8ee Martin KaFai Lau   2017-09-27  762  =


:::::: The code@line 747 was first introduced by commit
:::::: 8e7ae2518f5265f0ef09d561748098fde5a87ccd bpf: Sanitize the bpf_struc=
t_ops tcp-cc name

:::::: TO: Martin KaFai Lau <kafai@fb.com>
:::::: CC: Daniel Borkmann <daniel@iogearbox.net>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0984819094985754967==--

