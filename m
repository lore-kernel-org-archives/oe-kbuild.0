Content-Type: multipart/mixed; boundary="===============6094023292655103085=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v5 03/13] perf/x86/amd: add AMD Fam19h Branch Sampling support
Date: Fri, 28 Jan 2022 16:35:10 +0800
Message-ID: <202201281639.FC1PUTSK-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6094023292655103085==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220126233454.3362047-4-eranian@google.com>
References: <20220126233454.3362047-4-eranian@google.com>
TO: Stephane Eranian <eranian@google.com>

Hi Stephane,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on next-20220125]
[cannot apply to tip/x86/core rafael-pm/linux-next tip/perf/core v5.17-rc1 =
v5.16 v5.16-rc8 v5.17-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Stephane-Eranian/perf-core=
-add-perf_clear_branch_entry_bitfields-helper/20220127-083516
base:    d25ee88530253138d0b20d43511ca5acbda4e9f7
:::::: branch date: 32 hours ago
:::::: commit date: 32 hours ago
config: x86_64-randconfig-c007-20220124 (https://download.01.org/0day-ci/ar=
chive/20220128/202201281639.FC1PUTSK-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 33b45e=
e44b1f32ffdbc995e6fec806271b4b3ba4)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/933d072f6e0c0409115a8038a=
89a56979a042d30
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Stephane-Eranian/perf-core-add-per=
f_clear_branch_entry_bitfields-helper/20220127-083516
        git checkout 933d072f6e0c0409115a8038a89a56979a042d30
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
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
   drivers/scsi/scsi_lib.c:223:2: note: Taking true branch
           if (IS_ERR(req))
           ^
   drivers/scsi/scsi_lib.c:224:3: note: Returning without writing to 'sshdr=
->response_code'
                   return PTR_ERR(req);
                   ^
   include/scsi/scsi_device.h:469:9: note: Returning from '__scsi_execute'
           return scsi_execute(sdev, cmd, data_direction, buffer,
                  ^
   include/scsi/scsi_device.h:460:2: note: expanded from macro 'scsi_execut=
e'
           __scsi_execute(sdev, cmd, data_direction, buffer, bufflen,      \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/scsi/scsi_device.h:469:2: note: Returning without writing to 'ss=
hdr->response_code'
           return scsi_execute(sdev, cmd, data_direction, buffer,
           ^
   drivers/scsi/scsi_lib.c:2202:11: note: Returning from 'scsi_execute_req'
           result =3D scsi_execute_req(sdev, cmd, DMA_FROM_DEVICE, buffer, =
len,
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   drivers/scsi/scsi_lib.c:2204:6: note: Assuming 'result' is >=3D 0
           if (result < 0)
               ^~~~~~~~~~
   drivers/scsi/scsi_lib.c:2204:2: note: Taking false branch
           if (result < 0)
           ^
   drivers/scsi/scsi_lib.c:2212:7: note: Calling 'scsi_status_is_good'
           if (!scsi_status_is_good(result)) {
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/scsi/scsi.h:198:6: note: 'status' is >=3D 0
           if (status < 0)
               ^~~~~~
   include/scsi/scsi.h:198:2: note: Taking false branch
           if (status < 0)
           ^
   include/scsi/scsi.h:201:6: note: Assuming the condition is true
           if (host_byte(status) =3D=3D DID_NO_CONNECT)
               ^
   include/scsi/scsi.h:124:29: note: expanded from macro 'host_byte'
   #define host_byte(result)   (((result) >> 16) & 0xff)
                               ^
   include/scsi/scsi.h:201:2: note: Taking true branch
           if (host_byte(status) =3D=3D DID_NO_CONNECT)
           ^
   include/scsi/scsi.h:202:3: note: Returning zero, which participates in a=
 condition later
                   return false;
                   ^~~~~~~~~~~~
   drivers/scsi/scsi_lib.c:2212:7: note: Returning from 'scsi_status_is_goo=
d'
           if (!scsi_status_is_good(result)) {
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/scsi_lib.c:2212:2: note: Taking true branch
           if (!scsi_status_is_good(result)) {
           ^
   drivers/scsi/scsi_lib.c:2213:7: note: Calling 'scsi_sense_valid'
                   if (scsi_sense_valid(sshdr)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~
   include/scsi/scsi_common.h:63:7: note: 'sshdr' is non-null
           if (!sshdr)
                ^~~~~
   include/scsi/scsi_common.h:63:2: note: Taking false branch
           if (!sshdr)
           ^
   include/scsi/scsi_common.h:66:31: note: The left operand of '&' is a gar=
bage value
           return (sshdr->response_code & 0x70) =3D=3D 0x70;
                   ~~~~~~~~~~~~~~~~~~~~ ^
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
   3 warnings generated.
>> arch/x86/events/amd/core.c:682:3: warning: Value stored to 'hwc' is neve=
r read [clang-analyzer-deadcode.DeadStores]
                   hwc =3D &cpuc->events[idx]->hw;
                   ^     ~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/events/amd/core.c:682:3: note: Value stored to 'hwc' is never r=
ead
                   hwc =3D &cpuc->events[idx]->hw;
                   ^     ~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
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
   1 warning generated.
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
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/dma-buf/dma-resv.c:525:34: warning: Access to field 'shared_coun=
t' results in a dereference of a null pointer (loaded from variable 'list')=
 [clang-analyzer-core.NullDereference]
                           RCU_INIT_POINTER(list->shared[list->shared_count=
++], f);
                                                         ^
   include/linux/rcupdate.h:860:14: note: expanded from macro 'RCU_INIT_POI=
NTER'
                   WRITE_ONCE(p, RCU_INITIALIZER(v)); \
                              ^
   include/asm-generic/rwonce.h:61:15: note: expanded from macro 'WRITE_ONC=
E'
           __WRITE_ONCE(x, val);                                           \
                        ^
   include/asm-generic/rwonce.h:55:27: note: expanded from macro '__WRITE_O=
NCE'
           *(volatile typeof(x) *)&(x) =3D (val);                          =
  \
                                    ^
   drivers/dma-buf/dma-resv.c:494:2: note: Assuming 'debug_locks' is 0
           dma_resv_assert_held(dst);
           ^
   include/linux/dma-resv.h:271:35: note: expanded from macro 'dma_resv_ass=
ert_held'
   #define dma_resv_assert_held(obj) lockdep_assert_held(&(obj)->lock.base)
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   drivers/dma-buf/dma-resv.c:494:2: note: Left side of '&&' is false
           dma_resv_assert_held(dst);
           ^
   include/linux/dma-resv.h:271:35: note: expanded from macro 'dma_resv_ass=
ert_held'
   #define dma_resv_assert_held(obj) lockdep_assert_held(&(obj)->lock.base)
                                     ^
   include/linux/lockdep.h:316:2: note: expanded from macro 'lockdep_assert=
_held'
           lockdep_assert(lockdep_is_held(l) !=3D LOCK_STATE_NOT_HELD)
           ^
   include/linux/lockdep.h:310:27: note: expanded from macro 'lockdep_asser=
t'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
                                    ^
   drivers/dma-buf/dma-resv.c:494:2: note: Taking false branch
           dma_resv_assert_held(dst);
           ^
   include/linux/dma-resv.h:271:35: note: expanded from macro 'dma_resv_ass=
ert_held'
   #define dma_resv_assert_held(obj) lockdep_assert_held(&(obj)->lock.base)
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
   drivers/dma-buf/dma-resv.c:494:2: note: Loop condition is false.  Exitin=
g loop
           dma_resv_assert_held(dst);
           ^
   include/linux/dma-resv.h:271:35: note: expanded from macro 'dma_resv_ass=
ert_held'
   #define dma_resv_assert_held(obj) lockdep_assert_held(&(obj)->lock.base)
                                     ^
   include/linux/lockdep.h:316:2: note: expanded from macro 'lockdep_assert=
_held'
           lockdep_assert(lockdep_is_held(l) !=3D LOCK_STATE_NOT_HELD)
           ^
   include/linux/lockdep.h:310:2: note: expanded from macro 'lockdep_assert'

vim +/hwc +682 arch/x86/events/amd/core.c

933d072f6e0c04 Stephane Eranian 2022-01-26  672  =

933d072f6e0c04 Stephane Eranian 2022-01-26  673  static void amd_pmu_enable=
_all(int added)
933d072f6e0c04 Stephane Eranian 2022-01-26  674  {
933d072f6e0c04 Stephane Eranian 2022-01-26  675  	struct cpu_hw_events *cpu=
c =3D this_cpu_ptr(&cpu_hw_events);
933d072f6e0c04 Stephane Eranian 2022-01-26  676  	struct hw_perf_event *hwc;
933d072f6e0c04 Stephane Eranian 2022-01-26  677  	int idx;
933d072f6e0c04 Stephane Eranian 2022-01-26  678  =

933d072f6e0c04 Stephane Eranian 2022-01-26  679  	amd_brs_enable_all();
933d072f6e0c04 Stephane Eranian 2022-01-26  680  =

933d072f6e0c04 Stephane Eranian 2022-01-26  681  	for (idx =3D 0; idx < x86=
_pmu.num_counters; idx++) {
933d072f6e0c04 Stephane Eranian 2022-01-26 @682  		hwc =3D &cpuc->events[id=
x]->hw;
933d072f6e0c04 Stephane Eranian 2022-01-26  683  =

933d072f6e0c04 Stephane Eranian 2022-01-26  684  		/* only activate events =
which are marked as active */
933d072f6e0c04 Stephane Eranian 2022-01-26  685  		if (!test_bit(idx, cpuc-=
>active_mask))
933d072f6e0c04 Stephane Eranian 2022-01-26  686  			continue;
933d072f6e0c04 Stephane Eranian 2022-01-26  687  =

933d072f6e0c04 Stephane Eranian 2022-01-26  688  		amd_pmu_enable_event(cpu=
c->events[idx]);
933d072f6e0c04 Stephane Eranian 2022-01-26  689  	}
933d072f6e0c04 Stephane Eranian 2022-01-26  690  }
933d072f6e0c04 Stephane Eranian 2022-01-26  691  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6094023292655103085==--

