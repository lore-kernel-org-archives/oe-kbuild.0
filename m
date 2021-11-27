Content-Type: multipart/mixed; boundary="===============1238167432548906872=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/soc/qcom/rpmh.c:100:3: warning: Argument to kfree() is the address of a local stack variable, which is not memory allocated by malloc() [clang-analyzer-unix.Malloc]
Date: Sun, 28 Nov 2021 04:58:15 +0800
Message-ID: <202111280421.Mw8bmSGX-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1238167432548906872==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Rasmus Villemoes <linux@rasmusvillemoes.dk>
CC: Miguel Ojeda <ojeda@kernel.org>
CC: Nick Desaulniers <ndesaulniers@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   c5c17547b778975b3d83a73c8d84e8fb5ecf3ba5
commit: e1edc277e6f6dfb372216522dfc57f9381c39e35 linux/container_of.h: swit=
ch to static_assert
date:   3 weeks ago
:::::: branch date: 24 hours ago
:::::: commit date: 3 weeks ago
config: arm-randconfig-c002-20211118 (https://download.01.org/0day-ci/archi=
ve/20211128/202111280421.Mw8bmSGX-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project c46bec=
f500df2a7fb4b4fce16178a036c344315a)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3De1edc277e6f6dfb372216522dfc57f9381c39e35
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e1edc277e6f6dfb372216522dfc57f9381c39e35
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                       ^~~~~~~~~~~
   drivers/gpu/host1x/job.c:176:3: note: Taking false branch
                   if (IS_ERR(sgt)) {
                   ^
   drivers/gpu/host1x/job.c:181:7: note: Assuming 'sgt' is null
                   if (sgt) {
                       ^~~
   drivers/gpu/host1x/job.c:181:3: note: Taking false branch
                   if (sgt) {
                   ^
   drivers/gpu/host1x/job.c:213:35: note: Assigned value is garbage or unde=
fined
                   job->addr_phys[job->num_unpins] =3D phys_addr;
                                                   ^ ~~~~~~~~~
   drivers/gpu/host1x/job.c:296:35: warning: Assigned value is garbage or u=
ndefined [clang-analyzer-core.uninitialized.Assign]
                   job->addr_phys[job->num_unpins] =3D phys_addr;
                                                   ^
   drivers/gpu/host1x/job.c:639:8: note: Calling 'pin_job'
           err =3D pin_job(host, job);
                 ^~~~~~~~~~~~~~~~~~
   drivers/gpu/host1x/job.c:148:14: note: Assuming 'i' is >=3D field 'num_r=
elocs'
           for (i =3D 0; i < job->num_relocs; i++) {
                       ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/host1x/job.c:148:2: note: Loop condition is false. Execution=
 continues on line 223
           for (i =3D 0; i < job->num_relocs; i++) {
           ^
   drivers/gpu/host1x/job.c:223:6: note: Assuming field 'enable_firewall' i=
s false
           if (job->enable_firewall)
               ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/host1x/job.c:223:2: note: Taking false branch
           if (job->enable_firewall)
           ^
   drivers/gpu/host1x/job.c:226:14: note: Assuming 'i' is < field 'num_cmds'
           for (i =3D 0; i < job->num_cmds; i++) {
                       ^~~~~~~~~~~~~~~~~
   drivers/gpu/host1x/job.c:226:2: note: Loop condition is true.  Entering =
loop body
           for (i =3D 0; i < job->num_cmds; i++) {
           ^
   drivers/gpu/host1x/job.c:229:3: note: 'phys_addr' declared without an in=
itial value
                   dma_addr_t phys_addr;
                   ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/host1x/job.c:235:7: note: Assuming field 'is_wait' is false
                   if (job->cmds[i].is_wait)
                       ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/host1x/job.c:235:3: note: Taking false branch
                   if (job->cmds[i].is_wait)
                   ^
   drivers/gpu/host1x/job.c:241:7: note: Assuming field 'bo' is non-null
                   if (!g->bo) {
                       ^~~~~~
   drivers/gpu/host1x/job.c:241:3: note: Taking false branch
                   if (!g->bo) {
                   ^
   drivers/gpu/host1x/job.c:251:7: note: Assuming the condition is false
                   if (!iommu_get_domain_for_dev(host->dev))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/host1x/job.c:251:3: note: Taking false branch
                   if (!iommu_get_domain_for_dev(host->dev))
                   ^
   drivers/gpu/host1x/job.c:257:7: note: Calling 'IS_ERR'
                   if (IS_ERR(sgt)) {
                       ^~~~~~~~~~~
   include/linux/err.h:36:9: note: Assuming the condition is false
           return IS_ERR_VALUE((unsigned long)ptr);
                  ^
   include/linux/err.h:22:34: note: expanded from macro 'IS_ERR_VALUE'
   #define IS_ERR_VALUE(x) unlikely((unsigned long)(void *)(x) >=3D (unsign=
ed long)-MAX_ERRNO)
                           ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/err.h:36:2: note: Returning zero, which participates in a =
condition later
           return IS_ERR_VALUE((unsigned long)ptr);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/host1x/job.c:257:7: note: Returning from 'IS_ERR'
                   if (IS_ERR(sgt)) {
                       ^~~~~~~~~~~
   drivers/gpu/host1x/job.c:257:3: note: Taking false branch
                   if (IS_ERR(sgt)) {
                   ^
   drivers/gpu/host1x/job.c:262:7: note: Assuming field 'domain' is null
                   if (host->domain) {
                       ^~~~~~~~~~~~
   drivers/gpu/host1x/job.c:262:3: note: Taking false branch
                   if (host->domain) {
                   ^
   drivers/gpu/host1x/job.c:286:14: note: Assuming 'sgt' is null
                   } else if (sgt) {
                              ^~~
   drivers/gpu/host1x/job.c:286:10: note: Taking false branch
                   } else if (sgt) {
                          ^
   drivers/gpu/host1x/job.c:296:35: note: Assigned value is garbage or unde=
fined
                   job->addr_phys[job->num_unpins] =3D phys_addr;
                                                   ^ ~~~~~~~~~
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
>> drivers/soc/qcom/rpmh.c:100:3: warning: Argument to kfree() is the addre=
ss of a local stack variable, which is not memory allocated by malloc() [cl=
ang-analyzer-unix.Malloc]
                   kfree(rpm_msg);
                   ^
   drivers/soc/qcom/rpmh.c:268:6: note: 'ret' is 0
           if (ret)
               ^~~
   drivers/soc/qcom/rpmh.c:268:2: note: Taking false branch
           if (ret)
           ^
   drivers/soc/qcom/rpmh.c:271:8: note: Calling '__rpmh_write'
           ret =3D __rpmh_write(dev, state, &rpm_msg);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soc/qcom/rpmh.c:185:14: note: 'i' is < field 'num_cmds'
           for (i =3D 0; i < rpm_msg->msg.num_cmds; i++) {
                       ^
   drivers/soc/qcom/rpmh.c:185:2: note: Loop condition is true.  Entering l=
oop body
           for (i =3D 0; i < rpm_msg->msg.num_cmds; i++) {
           ^
   drivers/soc/qcom/rpmh.c:187:3: note: Taking false branch
                   if (IS_ERR(req))
                   ^
   drivers/soc/qcom/rpmh.c:185:14: note: Assuming 'i' is < field 'num_cmds'
           for (i =3D 0; i < rpm_msg->msg.num_cmds; i++) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soc/qcom/rpmh.c:185:2: note: Loop condition is true.  Entering l=
oop body
           for (i =3D 0; i < rpm_msg->msg.num_cmds; i++) {
           ^
   drivers/soc/qcom/rpmh.c:187:3: note: Taking false branch
                   if (IS_ERR(req))
                   ^
   drivers/soc/qcom/rpmh.c:185:14: note: Assuming 'i' is >=3D field 'num_cm=
ds'
           for (i =3D 0; i < rpm_msg->msg.num_cmds; i++) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soc/qcom/rpmh.c:185:2: note: Loop condition is false. Execution =
continues on line 191
           for (i =3D 0; i < rpm_msg->msg.num_cmds; i++) {
           ^
   drivers/soc/qcom/rpmh.c:191:6: note: 'state' is not equal to RPMH_ACTIVE=
_ONLY_STATE
           if (state =3D=3D RPMH_ACTIVE_ONLY_STATE) {
               ^~~~~
   drivers/soc/qcom/rpmh.c:191:2: note: Taking false branch
           if (state =3D=3D RPMH_ACTIVE_ONLY_STATE) {
           ^
   drivers/soc/qcom/rpmh.c:197:3: note: Calling 'rpmh_tx_done'
                   rpmh_tx_done(&rpm_msg->msg, ret);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soc/qcom/rpmh.c:88:6: note: 'r' is 0
           if (r)
               ^
   drivers/soc/qcom/rpmh.c:88:2: note: Taking false branch
           if (r)
           ^
   drivers/soc/qcom/rpmh.c:92:6: note: Assuming 'compl' is null
           if (!compl)
               ^~~~~~
   drivers/soc/qcom/rpmh.c:92:2: note: Taking true branch
           if (!compl)
           ^
   drivers/soc/qcom/rpmh.c:93:3: note: Control jumps to line 99
                   goto exit;
                   ^
   drivers/soc/qcom/rpmh.c:99:6: note: Assuming 'free' is true
           if (free)
               ^~~~
   drivers/soc/qcom/rpmh.c:99:2: note: Taking true branch
           if (free)
           ^
   drivers/soc/qcom/rpmh.c:100:3: note: Argument to kfree() is the address =
of a local stack variable, which is not memory allocated by malloc()
                   kfree(rpm_msg);
                   ^     ~~~~~~~
   1 warning generated.
   lib/glob.c:48:32: warning: Assigned value is garbage or undefined [clang=
-analyzer-core.uninitialized.Assign]
           char const *back_pat =3D NULL, *back_str =3D back_str;
                                         ^          ~~~~~~~~
   lib/glob.c:48:32: note: Assigned value is garbage or undefined
           char const *back_pat =3D NULL, *back_str =3D back_str;
                                         ^          ~~~~~~~~
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   drivers/slimbus/messaging.c:323:3: warning: Undefined or garbage value r=
eturned to caller [clang-analyzer-core.uninitialized.UndefReturn]
                   return buf;
                   ^      ~~~
   drivers/slimbus/messaging.c:317:2: note: 'buf' declared without an initi=
al value
           u8 buf;
           ^~~~~~
   drivers/slimbus/messaging.c:319:8: note: Calling 'slim_read'
           ret =3D slim_read(sdev, addr, 1, &buf);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/slimbus/messaging.c:300:2: note: Calling 'slim_fill_msg'
           slim_fill_msg(&msg, addr, count, val, NULL);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/slimbus/messaging.c:282:1: note: Returning without writing to 'm=
sg->rbuf'
   }
   ^
--
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/binfmt_elf.c:1815:3: note: Taking true branch
                   if (view->regsets[i].core_note_type !=3D 0)
                   ^
   fs/binfmt_elf.c:1814:14: note: Assuming 'i' is >=3D field 'n'
           for (i =3D 0; i < view->n; ++i)
                       ^~~~~~~~~~~
   fs/binfmt_elf.c:1814:2: note: Loop condition is false. Execution continu=
es on line 1822
           for (i =3D 0; i < view->n; ++i)
           ^
   fs/binfmt_elf.c:1822:6: note: Left side of '||' is false
           if (unlikely(info->thread_notes =3D=3D 0) ||
               ^
   include/linux/compiler.h:78:22: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                           ^
   fs/binfmt_elf.c:1823:15: note: Assuming field 'core_note_type' is equal =
to 1
               unlikely(view->regsets[0].core_note_type !=3D NT_PRSTATUS)) {
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   fs/binfmt_elf.c:1822:2: note: Taking false branch
           if (unlikely(info->thread_notes =3D=3D 0) ||
           ^
   fs/binfmt_elf.c:1837:2: note: Loop condition is false. Execution continu=
es on line 1861
           for (ct =3D &dump_task->mm->core_state->dumper; ct; ct =3D ct->n=
ext) {
           ^
   fs/binfmt_elf.c:1861:2: note: Loop condition is false. Execution continu=
es on line 1868
           for (t =3D info->thread; t !=3D NULL; t =3D t->next)
           ^
   fs/binfmt_elf.c:1877:2: note: Taking false branch
           if (fill_files_note(&info->files) =3D=3D 0)
           ^
   fs/binfmt_elf.c:2191:7: note: Returning from 'fill_note_info'
           if (!fill_note_info(&elf, e_phnum, &info, cprm->siginfo, cprm->r=
egs))
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   fs/binfmt_elf.c:2191:2: note: Taking false branch
           if (!fill_note_info(&elf, e_phnum, &info, cprm->siginfo, cprm->r=
egs))
           ^
   fs/binfmt_elf.c:2201:15: note: Calling 'get_note_info_size'
                   size_t sz =3D get_note_info_size(&info);
                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/binfmt_elf.c:1885:2: note: Returning without writing to 'info->thread'
           return info->size;
           ^
   fs/binfmt_elf.c:2201:15: note: Returning from 'get_note_info_size'
                   size_t sz =3D get_note_info_size(&info);
                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/binfmt_elf.c:2207:7: note: Assuming 'phdr4note' is non-null
                   if (!phdr4note)
                       ^~~~~~~~~~
   fs/binfmt_elf.c:2207:3: note: Taking false branch
                   if (!phdr4note)
                   ^
   fs/binfmt_elf.c:2220:6: note: Assuming 'e_phnum' is not equal to PN_XNUM
           if (e_phnum =3D=3D PN_XNUM) {
               ^~~~~~~~~~~~~~~~~~
   fs/binfmt_elf.c:2220:2: note: Taking false branch
           if (e_phnum =3D=3D PN_XNUM) {
           ^
   fs/binfmt_elf.c:2229:6: note: Assuming the condition is false
           if (!dump_emit(cprm, &elf, sizeof(elf)))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/binfmt_elf.c:2229:2: note: Taking false branch
           if (!dump_emit(cprm, &elf, sizeof(elf)))
           ^
   fs/binfmt_elf.c:2232:6: note: Assuming the condition is false
           if (!dump_emit(cprm, phdr4note, sizeof(*phdr4note)))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/binfmt_elf.c:2232:2: note: Taking false branch
           if (!dump_emit(cprm, phdr4note, sizeof(*phdr4note)))
           ^
   fs/binfmt_elf.c:2236:14: note: Assuming 'i' is >=3D 'vma_count'
           for (i =3D 0; i < vma_count; i++) {
                       ^~~~~~~~~~~~~
   fs/binfmt_elf.c:2236:2: note: Loop condition is false. Execution continu=
es on line 2260
           for (i =3D 0; i < vma_count; i++) {
           ^
   fs/binfmt_elf.c:2260:2: note: Taking false branch
           if (!elf_core_write_extra_phdrs(cprm, offset))
           ^
   fs/binfmt_elf.c:2264:7: note: Calling 'write_note_info'
           if (!write_note_info(&info, cprm))
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/binfmt_elf.c:1896:2: note: 't' initialized to a null pointer value
           struct elf_thread_core_info *t =3D info->thread;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/binfmt_elf.c:1901:18: note: Passing null pointer value via 1st parame=
ter 'men'
                   if (!writenote(&t->notes[0], cprm))
                                  ^~~~~~~~~~~~
   fs/binfmt_elf.c:1901:8: note: Calling 'writenote'
                   if (!writenote(&t->notes[0], cprm))
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/binfmt_elf.c:1446:23: note: Access to field 'name' results in a deref=
erence of a null pointer (loaded from variable 'men')
           en.n_namesz =3D strlen(men->name) + 1;
                                ^~~
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
>> drivers/soc/qcom/rpmh.c:100:3: warning: Argument to kfree() is the addre=
ss of a local stack variable, which is not memory allocated by malloc() [cl=
ang-analyzer-unix.Malloc]
                   kfree(rpm_msg);
                   ^
   drivers/soc/qcom/rpmh.c:268:6: note: 'ret' is 0
           if (ret)
               ^~~
   drivers/soc/qcom/rpmh.c:268:2: note: Taking false branch
           if (ret)
           ^
   drivers/soc/qcom/rpmh.c:271:8: note: Calling '__rpmh_write'
           ret =3D __rpmh_write(dev, state, &rpm_msg);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soc/qcom/rpmh.c:185:14: note: 'i' is < field 'num_cmds'
           for (i =3D 0; i < rpm_msg->msg.num_cmds; i++) {
                       ^
   drivers/soc/qcom/rpmh.c:185:2: note: Loop condition is true.  Entering l=
oop body
           for (i =3D 0; i < rpm_msg->msg.num_cmds; i++) {
           ^
   drivers/soc/qcom/rpmh.c:187:3: note: Taking false branch
                   if (IS_ERR(req))
                   ^
   drivers/soc/qcom/rpmh.c:185:14: note: Assuming 'i' is < field 'num_cmds'
           for (i =3D 0; i < rpm_msg->msg.num_cmds; i++) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soc/qcom/rpmh.c:185:2: note: Loop condition is true.  Entering l=
oop body
           for (i =3D 0; i < rpm_msg->msg.num_cmds; i++) {
           ^
   drivers/soc/qcom/rpmh.c:187:3: note: Taking false branch
                   if (IS_ERR(req))
                   ^
   drivers/soc/qcom/rpmh.c:185:14: note: Assuming 'i' is >=3D field 'num_cm=
ds'
           for (i =3D 0; i < rpm_msg->msg.num_cmds; i++) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soc/qcom/rpmh.c:185:2: note: Loop condition is false. Execution =
continues on line 191
           for (i =3D 0; i < rpm_msg->msg.num_cmds; i++) {
           ^
   drivers/soc/qcom/rpmh.c:191:6: note: 'state' is not equal to RPMH_ACTIVE=
_ONLY_STATE
           if (state =3D=3D RPMH_ACTIVE_ONLY_STATE) {
               ^~~~~
   drivers/soc/qcom/rpmh.c:191:2: note: Taking false branch
           if (state =3D=3D RPMH_ACTIVE_ONLY_STATE) {
           ^
   drivers/soc/qcom/rpmh.c:197:3: note: Calling 'rpmh_tx_done'
                   rpmh_tx_done(&rpm_msg->msg, ret);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soc/qcom/rpmh.c:88:6: note: 'r' is 0
           if (r)
               ^
   drivers/soc/qcom/rpmh.c:88:2: note: Taking false branch
           if (r)
           ^
   drivers/soc/qcom/rpmh.c:92:6: note: Assuming 'compl' is null
           if (!compl)
               ^~~~~~
   drivers/soc/qcom/rpmh.c:92:2: note: Taking true branch
           if (!compl)
           ^
   drivers/soc/qcom/rpmh.c:93:3: note: Control jumps to line 99
                   goto exit;
                   ^
   drivers/soc/qcom/rpmh.c:99:6: note: Assuming 'free' is true
           if (free)
               ^~~~
   drivers/soc/qcom/rpmh.c:99:2: note: Taking true branch
           if (free)
           ^
   drivers/soc/qcom/rpmh.c:100:3: note: Argument to kfree() is the address =
of a local stack variable, which is not memory allocated by malloc()
                   kfree(rpm_msg);
                   ^     ~~~~~~~
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
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
   18 warnings generated.
   Suppressed 18 warnings (16 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   21 warnings generated.
   drivers/iommu/arm/arm-smmu/arm-smmu.c:794:42: warning: The result of the=
 left shift is undefined due to shifting by '32', which is greater or equal=
 to the width of type 'unsigned long' [clang-analyzer-core.UndefinedBinaryO=
peratorResult]
                   domain->geometry.aperture_start =3D ~0UL << ias;
                                                          ^
   drivers/iommu/arm/arm-smmu/arm-smmu.c:1138:6: note: Assuming 'fwspec' is=
 non-null
           if (!fwspec || fwspec->ops !=3D &arm_smmu_ops) {
               ^~~~~~~
   drivers/iommu/arm/arm-smmu/arm-smmu.c:1138:6: note: Left side of '||' is=
 false
   drivers/iommu/arm/arm-smmu/arm-smmu.c:1138:17: note: Assuming the condit=
ion is false
           if (!fwspec || fwspec->ops !=3D &arm_smmu_ops) {
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu/arm-smmu.c:1138:2: note: Taking false branch
           if (!fwspec || fwspec->ops !=3D &arm_smmu_ops) {
           ^
   drivers/iommu/arm/arm-smmu/arm-smmu.c:1151:6: note: Assuming 'cfg' is no=
n-null
           if (!cfg)
               ^~~~
   drivers/iommu/arm/arm-smmu/arm-smmu.c:1151:2: note: Taking false branch
           if (!cfg)
           ^

vim +100 drivers/soc/qcom/rpmh.c

c1038456b02b86 Lina Iyer    2018-06-20   78  =

c1038456b02b86 Lina Iyer    2018-06-20   79  void rpmh_tx_done(const struct=
 tcs_request *msg, int r)
c1038456b02b86 Lina Iyer    2018-06-20   80  {
c1038456b02b86 Lina Iyer    2018-06-20   81  	struct rpmh_request *rpm_msg =
=3D container_of(msg, struct rpmh_request,
c1038456b02b86 Lina Iyer    2018-06-20   82  						    msg);
c1038456b02b86 Lina Iyer    2018-06-20   83  	struct completion *compl =3D =
rpm_msg->completion;
baef1c90aac7e5 Stephen Boyd 2019-01-15   84  	bool free =3D rpm_msg->needs_=
free;
c1038456b02b86 Lina Iyer    2018-06-20   85  =

c1038456b02b86 Lina Iyer    2018-06-20   86  	rpm_msg->err =3D r;
c1038456b02b86 Lina Iyer    2018-06-20   87  =

c1038456b02b86 Lina Iyer    2018-06-20   88  	if (r)
c1038456b02b86 Lina Iyer    2018-06-20   89  		dev_err(rpm_msg->dev, "RPMH =
TX fail in msg addr=3D%#x, err=3D%d\n",
c1038456b02b86 Lina Iyer    2018-06-20   90  			rpm_msg->msg.cmds[0].addr, =
r);
c1038456b02b86 Lina Iyer    2018-06-20   91  =

c8790cb6da58d3 Lina Iyer    2018-06-20   92  	if (!compl)
c8790cb6da58d3 Lina Iyer    2018-06-20   93  		goto exit;
c8790cb6da58d3 Lina Iyer    2018-06-20   94  =

c1038456b02b86 Lina Iyer    2018-06-20   95  	/* Signal the blocking thread=
 we are done */
c1038456b02b86 Lina Iyer    2018-06-20   96  	complete(compl);
564b5e24ccd4c8 Lina Iyer    2018-06-20   97  =

c8790cb6da58d3 Lina Iyer    2018-06-20   98  exit:
baef1c90aac7e5 Stephen Boyd 2019-01-15   99  	if (free)
564b5e24ccd4c8 Lina Iyer    2018-06-20 @100  		kfree(rpm_msg);
c1038456b02b86 Lina Iyer    2018-06-20  101  }
c1038456b02b86 Lina Iyer    2018-06-20  102  =


:::::: The code at line 100 was first introduced by commit
:::::: 564b5e24ccd4c840a7f84dfd952e5715dd9b3966 drivers: qcom: rpmh: allow =
requests to be sent asynchronously

:::::: TO: Lina Iyer <ilina@codeaurora.org>
:::::: CC: Andy Gross <andy.gross@linaro.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1238167432548906872==--

