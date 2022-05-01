Content-Type: multipart/mixed; boundary="===============6159296214868142618=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/misc/habanalabs/common/command_submission.c:899:2: warning: Use of memory after it is freed [clang-analyzer-unix.Malloc]
Date: Sun, 01 May 2022 20:06:01 +0800
Message-ID: <202205011955.pCLxikdY-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6159296214868142618==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Rasmus Villemoes <linux@rasmusvillemoes.dk>
CC: Miguel Ojeda <ojeda@kernel.org>
CC: Nick Desaulniers <ndesaulniers@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   57ae8a492116910bad2b3497ffe555b3a4b4180f
commit: e1edc277e6f6dfb372216522dfc57f9381c39e35 linux/container_of.h: swit=
ch to static_assert
date:   6 months ago
:::::: branch date: 19 hours ago
:::::: commit date: 6 months ago
config: arm-randconfig-c002-20220428 (https://download.01.org/0day-ci/archi=
ve/20220501/202205011955.pCLxikdY-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c59473=
aacce38cd7dd77eebceaf3c98c5707ab3b)
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
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/rtc/rtc-rx8025.c:197:3: warning: Value stored to 'status' is nev=
er read [clang-analyzer-deadcode.DeadStores]
                   status &=3D RX8025_BIT_CTRL2_DAFG;
                   ^
   drivers/rtc/rtc-rx8025.c:197:3: note: Value stored to 'status' is never =
read
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (8 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (8 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (8 in non-user code, 3 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   Suppressed 30 warnings (9 in non-user code, 21 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   22 warnings generated.
   Suppressed 22 warnings (9 in non-user code, 13 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   drivers/gpu/drm/amd/amdgpu/atom.c:960:2: warning: Value stored to 'dst' =
is never read [clang-analyzer-deadcode.DeadStores]
           dst =3D atom_get_dst(ctx, arg, attr, ptr, &saved, 1);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/atom.c:960:2: note: Value stored to 'dst' is =
never read
           dst =3D atom_get_dst(ctx, arg, attr, ptr, &saved, 1);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/atom.c:979:2: warning: Value stored to 'dst' =
is never read [clang-analyzer-deadcode.DeadStores]
           dst =3D atom_get_dst(ctx, arg, attr, ptr, &saved, 1);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/atom.c:979:2: note: Value stored to 'dst' is =
never read
           dst =3D atom_get_dst(ctx, arg, attr, ptr, &saved, 1);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/atom.c:1386:2: warning: Value stored to 'str_=
off' is never read [clang-analyzer-deadcode.DeadStores]
           str_off =3D 0;
           ^         ~
   drivers/gpu/drm/amd/amdgpu/atom.c:1386:2: note: Value stored to 'str_off=
' is never read
           str_off =3D 0;
           ^         ~
   drivers/gpu/drm/amd/amdgpu/atom.c:1409:2: warning: Value stored to 'off_=
to_vbios_str' is never read [clang-analyzer-deadcode.DeadStores]
           off_to_vbios_str =3D 0;
           ^                  ~
   drivers/gpu/drm/amd/amdgpu/atom.c:1409:2: note: Value stored to 'off_to_=
vbios_str' is never read
           off_to_vbios_str =3D 0;
           ^                  ~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
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
   9 warnings generated.
>> drivers/misc/habanalabs/common/command_submission.c:899:2: warning: Use =
of memory after it is freed [clang-analyzer-unix.Malloc]
           list_for_each_entry_safe(job, tmp, &cs->job_list, cs_node)
           ^
   include/linux/list.h:717:13: note: expanded from macro 'list_for_each_en=
try_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \
                      ^
   include/linux/list.h:524:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:513:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/container_of.h:18:25: note: expanded from macro 'container=
_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
                                  ^
   drivers/misc/habanalabs/common/command_submission.c:1965:6: note: 'rc' i=
s 0
           if (rc)
               ^~
   drivers/misc/habanalabs/common/command_submission.c:1965:2: note: Taking=
 false branch
           if (rc)
           ^
   drivers/misc/habanalabs/common/command_submission.c:1971:6: note: Assumi=
ng field 'queue_index' is < field 'max_queues'
           if (chunk->queue_index >=3D hdev->asic_prop.max_queues) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/habanalabs/common/command_submission.c:1971:2: note: Taking=
 false branch
           if (chunk->queue_index >=3D hdev->asic_prop.max_queues) {
           ^
   drivers/misc/habanalabs/common/command_submission.c:1984:6: note: Assumi=
ng field 'supports_sync_stream' is not equal to 0
           if (!hw_queue_prop->supports_sync_stream) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/habanalabs/common/command_submission.c:1984:2: note: Taking=
 false branch
           if (!hw_queue_prop->supports_sync_stream) {
           ^
   drivers/misc/habanalabs/common/command_submission.c:1994:6: note: Assumi=
ng 'cs_type' is not equal to CS_TYPE_COLLECTIVE_WAIT
           if (cs_type =3D=3D CS_TYPE_COLLECTIVE_WAIT) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/habanalabs/common/command_submission.c:1994:2: note: Taking=
 false branch
           if (cs_type =3D=3D CS_TYPE_COLLECTIVE_WAIT) {
           ^
   drivers/misc/habanalabs/common/command_submission.c:2016:18: note: Assum=
ing 'cs_type' is not equal to CS_TYPE_WAIT
           is_wait_cs =3D !!(cs_type =3D=3D CS_TYPE_WAIT ||
                           ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/habanalabs/common/command_submission.c:2016:18: note: Left =
side of '||' is false
   drivers/misc/habanalabs/common/command_submission.c:2017:4: note: 'cs_ty=
pe' is not equal to CS_TYPE_COLLECTIVE_WAIT
                           cs_type =3D=3D CS_TYPE_COLLECTIVE_WAIT);
                           ^~~~~~~
   drivers/misc/habanalabs/common/command_submission.c:2019:23: note: Assum=
ing the condition is false
           cs_encaps_signals =3D !!(flags & HL_CS_FLAGS_ENCAP_SIGNALS);
                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/habanalabs/common/command_submission.c:2021:6: note: 'is_wa=
it_cs' is false
           if (is_wait_cs) {
               ^~~~~~~~~~
   drivers/misc/habanalabs/common/command_submission.c:2021:2: note: Taking=
 false branch
           if (is_wait_cs) {
           ^
   drivers/misc/habanalabs/common/command_submission.c:2113:7: note: Callin=
g 'allocate_cs'
           rc =3D allocate_cs(hdev, ctx, cs_type, ULLONG_MAX, &cs, flags, t=
imeout);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   drivers/misc/habanalabs/common/command_submission.c:778:6: note: Assumin=
g 'cs' is non-null
           if (!cs)
               ^~~
   drivers/misc/habanalabs/common/command_submission.c:778:2: note: Taking =
false branch
           if (!cs)
           ^
   drivers/misc/habanalabs/common/command_submission.c:781:7: note: 'cs' is=
 non-null
           if (!cs) {
                ^~
   drivers/misc/habanalabs/common/command_submission.c:781:2: note: Taking =
false branch
           if (!cs) {
           ^
   drivers/misc/habanalabs/common/command_submission.c:794:19: note: Assumi=
ng the condition is false
           cs->timestamp =3D !!(flags & HL_CS_FLAGS_TIMESTAMP);
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/habanalabs/common/command_submission.c:798:3: note: Assumin=
g field 'skip_reset_on_timeout' is 0
                   hdev->skip_reset_on_timeout ||
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/habanalabs/common/command_submission.c:798:3: note: Left si=
de of '||' is false
   drivers/misc/habanalabs/common/command_submission.c:799:4: note: Assumin=
g the condition is false
                   !!(flags & HL_CS_FLAGS_SKIP_RESET_ON_TIMEOUT);
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/habanalabs/common/command_submission.c:802:2: note: Loop co=
ndition is false.  Exiting loop
           INIT_DELAYED_WORK(&cs->work_tdr, cs_timedout);
           ^
   include/linux/workqueue.h:267:2: note: expanded from macro 'INIT_DELAYED=
_WORK'
           __INIT_DELAYED_WORK(_work, _func, 0)
           ^
   include/linux/workqueue.h:252:3: note: expanded from macro '__INIT_DELAY=
ED_WORK'
                   INIT_WORK(&(_work)->work, (_func));                     \
                   ^
   include/linux/workqueue.h:245:2: note: expanded from macro 'INIT_WORK'
           __INIT_WORK((_work), (_func), 0)
           ^
   include/linux/workqueue.h:225:2: note: expanded from macro '__INIT_WORK'
           do {                                                            \
           ^
   drivers/misc/habanalabs/common/command_submission.c:802:2: note: Loop co=
ndition is false.  Exiting loop
           INIT_DELAYED_WORK(&cs->work_tdr, cs_timedout);
           ^
   include/linux/workqueue.h:267:2: note: expanded from macro 'INIT_DELAYED=
_WORK'
           __INIT_DELAYED_WORK(_work, _func, 0)
           ^

vim +899 drivers/misc/habanalabs/common/command_submission.c

eff6f4a0e70b7b drivers/misc/habanalabs/command_submission.c        Oded Gab=
bay 2019-02-16  892  =

eff6f4a0e70b7b drivers/misc/habanalabs/command_submission.c        Oded Gab=
bay 2019-02-16  893  static void cs_rollback(struct hl_device *hdev, struct=
 hl_cs *cs)
eff6f4a0e70b7b drivers/misc/habanalabs/command_submission.c        Oded Gab=
bay 2019-02-16  894  {
eff6f4a0e70b7b drivers/misc/habanalabs/command_submission.c        Oded Gab=
bay 2019-02-16  895  	struct hl_cs_job *job, *tmp;
eff6f4a0e70b7b drivers/misc/habanalabs/command_submission.c        Oded Gab=
bay 2019-02-16  896  =

2795c8891577c4 drivers/misc/habanalabs/common/command_submission.c Ofir Bit=
ton 2020-12-08  897  	staged_cs_put(hdev, cs);
2795c8891577c4 drivers/misc/habanalabs/common/command_submission.c Ofir Bit=
ton 2020-12-08  898  =

eff6f4a0e70b7b drivers/misc/habanalabs/command_submission.c        Oded Gab=
bay 2019-02-16 @899  	list_for_each_entry_safe(job, tmp, &cs->job_list, cs_=
node)
649c4592124b0c drivers/misc/habanalabs/common/command_submission.c Tomer Ta=
yar 2020-08-10  900  		complete_job(hdev, job);
eff6f4a0e70b7b drivers/misc/habanalabs/command_submission.c        Oded Gab=
bay 2019-02-16  901  }
eff6f4a0e70b7b drivers/misc/habanalabs/command_submission.c        Oded Gab=
bay 2019-02-16  902  =


:::::: The code at line 899 was first introduced by commit
:::::: eff6f4a0e70b7bcf4674f471a768860a74e638a6 habanalabs: add command sub=
mission module

:::::: TO: Oded Gabbay <oded.gabbay@gmail.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6159296214868142618==--

