Content-Type: multipart/mixed; boundary="===============1128213766966432467=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/scsi/mpt3sas/mpt3sas_scsih.c:8201:26: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
Date: Fri, 03 Jun 2022 21:32:05 +0800
Message-ID: <202206032147.4ujnnqAE-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1128213766966432467==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check first_new_problem:=
 drivers/scsi/mpt3sas/mpt3sas_scsih.c:8201:26: warning: Assigned value is g=
arbage or undefined [clang-analyzer-core.uninitialized.Assign]"
:::::: =


CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Kees Cook <keescook@chromium.org>
CC: Nick Desaulniers <ndesaulniers@google.com>

Hi Kees,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   50fd82b3a9a9335df5d50c7ddcb81c81d358c4fc
commit: 281d0c962752fb40866dd8d4cade68656f34bd1f fortify: Add Clang support
date:   4 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 4 months ago
config: x86_64-randconfig-c007-20220530 (https://download.01.org/0day-ci/ar=
chive/20220603/202206032147.4ujnnqAE-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0776c4=
8f9b7e69fa447bee57c7c0985caa856be9)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D281d0c962752fb40866dd8d4cade68656f34bd1f
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 281d0c962752fb40866dd8d4cade68656f34bd1f
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:3693:2: note: Taking false branch
           if ((list_empty(&ioc->fw_event_list) && !ioc->current_event) ||
           ^
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:3702:6: note: Assuming field 'shost=
_recovery' is 0
           if (ioc->shost_recovery && ioc->current_event)
               ^~~~~~~~~~~~~~~~~~~
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:3702:26: note: Left side of '&&' is=
 false
           if (ioc->shost_recovery && ioc->current_event)
                                   ^
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:3706:10: note: Assuming 'fw_event' =
is null
           while ((fw_event =3D dequeue_next_fw_event(ioc)) ||
                   ^~~~~~~~
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:3706:9: note: Left side of '||' is =
false
           while ((fw_event =3D dequeue_next_fw_event(ioc)) ||
                  ^
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:3706:2: note: Loop condition is tru=
e.  Entering loop body
           while ((fw_event =3D dequeue_next_fw_event(ioc)) ||
           ^
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:3723:7: note: 'fw_event' is equal t=
o field 'current_event'
                   if (fw_event =3D=3D ioc->current_event &&
                       ^~~~~~~~
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:3723:7: note: Left side of '&&' is =
true
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:3724:7: note: Assuming field 'event=
' is equal to MPT3SAS_REMOVE_UNRESPONDING_DEVICES
                       ioc->current_event->event !=3D
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:3723:3: note: Taking false branch
                   if (fw_event =3D=3D ioc->current_event &&
                   ^
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:3738:17: note: Field 'event' is not=
 equal to MPT3SAS_PORT_ENABLE_COMPLETE
                   if (fw_event->event =3D=3D MPT3SAS_PORT_ENABLE_COMPLETE)=
 {
                                 ^
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:3738:3: note: Taking false branch
                   if (fw_event->event =3D=3D MPT3SAS_PORT_ENABLE_COMPLETE)=
 {
                   ^
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:3751:7: note: Assuming the conditio=
n is true
                   if (cancel_work_sync(&fw_event->work))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:3751:3: note: Taking true branch
                   if (cancel_work_sync(&fw_event->work))
                   ^
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:3752:4: note: Calling 'fw_event_wor=
k_put'
                           fw_event_work_put(fw_event);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:241:2: note: Calling 'kref_put'
           kref_put(&fw_work->refcount, fw_event_work_free);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kref.h:64:6: note: Assuming the condition is true
           if (refcount_dec_and_test(&kref->refcount)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kref.h:64:2: note: Taking true branch
           if (refcount_dec_and_test(&kref->refcount)) {
           ^
   include/linux/kref.h:65:3: note: Calling 'fw_event_work_free'
                   release(kref);
                   ^~~~~~~~~~~~~
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:231:2: note: Memory is released
           kfree(container_of(r, struct fw_event_work, refcount));
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kref.h:65:3: note: Returning; memory was released
                   release(kref);
                   ^~~~~~~~~~~~~
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:241:2: note: Returning; memory was =
released
           kref_put(&fw_work->refcount, fw_event_work_free);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:3752:4: note: Returning; memory was=
 released via 1st parameter
                           fw_event_work_put(fw_event);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:3754:3: note: Use of memory after i=
t is freed
                   fw_event_work_put(fw_event);
                   ^                 ~~~~~~~~
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:5440:3: warning: Call to function '=
strcat' is insecure as it does not provide bounding of the memory buffer. R=
eplace unbounded copy functions with analogous functions that support lengt=
h arguments such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI=
.strcpy]
                   strcat(desc_scsi_state, "response info ");
                   ^~~~~~
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:5440:3: note: Call to function 'str=
cat' is insecure as it does not provide bounding of the memory buffer. Repl=
ace unbounded copy functions with analogous functions that support length a=
rguments such as 'strlcat'. CWE-119
                   strcat(desc_scsi_state, "response info ");
                   ^~~~~~
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:5442:3: warning: Call to function '=
strcat' is insecure as it does not provide bounding of the memory buffer. R=
eplace unbounded copy functions with analogous functions that support lengt=
h arguments such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI=
.strcpy]
                   strcat(desc_scsi_state, "state terminated ");
                   ^~~~~~
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:5442:3: note: Call to function 'str=
cat' is insecure as it does not provide bounding of the memory buffer. Repl=
ace unbounded copy functions with analogous functions that support length a=
rguments such as 'strlcat'. CWE-119
                   strcat(desc_scsi_state, "state terminated ");
                   ^~~~~~
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:5444:3: warning: Call to function '=
strcat' is insecure as it does not provide bounding of the memory buffer. R=
eplace unbounded copy functions with analogous functions that support lengt=
h arguments such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI=
.strcpy]
                   strcat(desc_scsi_state, "no status ");
                   ^~~~~~
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:5444:3: note: Call to function 'str=
cat' is insecure as it does not provide bounding of the memory buffer. Repl=
ace unbounded copy functions with analogous functions that support length a=
rguments such as 'strlcat'. CWE-119
                   strcat(desc_scsi_state, "no status ");
                   ^~~~~~
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:5446:3: warning: Call to function '=
strcat' is insecure as it does not provide bounding of the memory buffer. R=
eplace unbounded copy functions with analogous functions that support lengt=
h arguments such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI=
.strcpy]
                   strcat(desc_scsi_state, "autosense failed ");
                   ^~~~~~
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:5446:3: note: Call to function 'str=
cat' is insecure as it does not provide bounding of the memory buffer. Repl=
ace unbounded copy functions with analogous functions that support length a=
rguments such as 'strlcat'. CWE-119
                   strcat(desc_scsi_state, "autosense failed ");
                   ^~~~~~
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:5448:3: warning: Call to function '=
strcat' is insecure as it does not provide bounding of the memory buffer. R=
eplace unbounded copy functions with analogous functions that support lengt=
h arguments such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI=
.strcpy]
                   strcat(desc_scsi_state, "autosense valid ");
                   ^~~~~~
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:5448:3: note: Call to function 'str=
cat' is insecure as it does not provide bounding of the memory buffer. Repl=
ace unbounded copy functions with analogous functions that support length a=
rguments such as 'strlcat'. CWE-119
                   strcat(desc_scsi_state, "autosense valid ");
                   ^~~~~~
>> drivers/scsi/mpt3sas/mpt3sas_scsih.c:8201:26: warning: Assigned value is=
 garbage or undefined [clang-analyzer-core.uninitialized.Assign]
                   pcie_device->nvme_mdts =3D
                                          ^
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:8090:7: note: Assuming the conditio=
n is false
           if ((mpt3sas_config_get_pcie_device_pg0(ioc, &mpi_reply,
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:8090:2: note: Taking false branch
           if ((mpt3sas_config_get_pcie_device_pg0(ioc, &mpi_reply,
           ^
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:8098:6: note: Assuming 'ioc_status'=
 is equal to MPI2_IOCSTATUS_SUCCESS
           if (ioc_status !=3D MPI2_IOCSTATUS_SUCCESS) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:8098:2: note: Taking false branch
           if (ioc_status !=3D MPI2_IOCSTATUS_SUCCESS) {
           ^
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:8108:6: note: Assuming the conditio=
n is false
           if (!(le32_to_cpu(pcie_device_pg0.Flags) &
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:8108:2: note: Taking false branch
           if (!(le32_to_cpu(pcie_device_pg0.Flags) &
           ^
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:8116:2: note: Taking false branch
           if (_scsih_check_pcie_access_status(ioc, wwid, handle,
           ^
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:8120:2: note: Taking false branch
           if (!(_scsih_is_nvme_pciescsi_device(le32_to_cpu
           ^
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:8124:16: note: Calling 'mpt3sas_get=
_pdev_by_wwid'
           pcie_device =3D mpt3sas_get_pdev_by_wwid(ioc, wwid);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:1134:2: note: Loop condition is fal=
se.  Exiting loop
           spin_lock_irqsave(&ioc->pcie_device_lock, flags);
           ^
   include/linux/spinlock.h:379:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:240:2: note: expanded from macro 'raw_spin_lock=
_irqsave'
           do {                                            \
           ^
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:1134:2: note: Loop condition is fal=
se.  Exiting loop
           spin_lock_irqsave(&ioc->pcie_device_lock, flags);
           ^
   include/linux/spinlock.h:377:43: note: expanded from macro 'spin_lock_ir=
qsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:1138:2: note: Returning pointer (lo=
aded from 'pcie_device'), which participates in a condition later
           return pcie_device;
           ^~~~~~~~~~~~~~~~~~
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:8124:16: note: Returning from 'mpt3=
sas_get_pdev_by_wwid'
           pcie_device =3D mpt3sas_get_pdev_by_wwid(ioc, wwid);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:8125:6: note: Assuming 'pcie_device=
' is null
           if (pcie_device) {
               ^~~~~~~~~~~
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:8125:2: note: Taking false branch
           if (pcie_device) {
           ^
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:8135:2: note: Taking false branch
           if (!(mpt3sas_scsih_is_pcie_scsi_device(
           ^
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:8156:16: note: Calling 'kzalloc'
           pcie_device =3D kzalloc(sizeof(struct _pcie_device), GFP_KERNEL);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:715:9: note: Calling 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:569:2: note: Taking false branch
           if (__builtin_constant_p(size)) {
           ^
   include/linux/slab.h:586:2: note: Returning pointer, which participates =
in a condition later
           return __kmalloc(size, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:715:9: note: Returning from 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:715:2: note: Returning pointer, which participates =
in a condition later
           return kmalloc(size, flags | __GFP_ZERO);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:8156:16: note: Returning from 'kzal=
loc'
           pcie_device =3D kzalloc(sizeof(struct _pcie_device), GFP_KERNEL);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:8157:6: note: Assuming 'pcie_device=
' is non-null
           if (!pcie_device) {
               ^~~~~~~~~~~~
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:8157:2: note: Taking false branch
           if (!pcie_device) {
           ^
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:8171:28: note: Assuming the conditi=
on is false
           pcie_device->fast_path =3D (le32_to_cpu(pcie_device_pg0.Flags) &
                                     ^
   include/linux/byteorder/generic.h:89:21: note: expanded from macro 'le32=
_to_cpu'
   #define le32_to_cpu __le32_to_cpu
                       ^
   include/uapi/linux/byteorder/little_endian.h:35:26: note: expanded from =
macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                            ^
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:8171:27: note: '?' condition is fal=
se
           pcie_device->fast_path =3D (le32_to_cpu(pcie_device_pg0.Flags) &
                                    ^
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:8176:6: note: Assuming field 'enclo=
sure_handle' is equal to 0
           if (pcie_device->enclosure_handle !=3D 0)
--
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:3693:2: note: Taking false branch
           if ((list_empty(&ioc->fw_event_list) && !ioc->current_event) ||
           ^
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:3702:6: note: Assuming field 'shost=
_recovery' is 0
           if (ioc->shost_recovery && ioc->current_event)
               ^~~~~~~~~~~~~~~~~~~
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:3702:26: note: Left side of '&&' is=
 false
           if (ioc->shost_recovery && ioc->current_event)
                                   ^
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:3706:10: note: Assuming 'fw_event' =
is null
           while ((fw_event =3D dequeue_next_fw_event(ioc)) ||
                   ^~~~~~~~
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:3706:9: note: Left side of '||' is =
false
           while ((fw_event =3D dequeue_next_fw_event(ioc)) ||
                  ^
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:3706:2: note: Loop condition is tru=
e.  Entering loop body
           while ((fw_event =3D dequeue_next_fw_event(ioc)) ||
           ^
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:3723:7: note: 'fw_event' is equal t=
o field 'current_event'
                   if (fw_event =3D=3D ioc->current_event &&
                       ^~~~~~~~
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:3723:7: note: Left side of '&&' is =
true
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:3724:7: note: Assuming field 'event=
' is equal to MPT3SAS_REMOVE_UNRESPONDING_DEVICES
                       ioc->current_event->event !=3D
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:3723:3: note: Taking false branch
                   if (fw_event =3D=3D ioc->current_event &&
                   ^
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:3738:17: note: Field 'event' is not=
 equal to MPT3SAS_PORT_ENABLE_COMPLETE
                   if (fw_event->event =3D=3D MPT3SAS_PORT_ENABLE_COMPLETE)=
 {
                                 ^
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:3738:3: note: Taking false branch
                   if (fw_event->event =3D=3D MPT3SAS_PORT_ENABLE_COMPLETE)=
 {
                   ^
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:3751:7: note: Assuming the conditio=
n is true
                   if (cancel_work_sync(&fw_event->work))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:3751:3: note: Taking true branch
                   if (cancel_work_sync(&fw_event->work))
                   ^
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:3752:4: note: Calling 'fw_event_wor=
k_put'
                           fw_event_work_put(fw_event);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:241:2: note: Calling 'kref_put'
           kref_put(&fw_work->refcount, fw_event_work_free);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kref.h:64:6: note: Assuming the condition is true
           if (refcount_dec_and_test(&kref->refcount)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kref.h:64:2: note: Taking true branch
           if (refcount_dec_and_test(&kref->refcount)) {
           ^
   include/linux/kref.h:65:3: note: Calling 'fw_event_work_free'
                   release(kref);
                   ^~~~~~~~~~~~~
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:231:2: note: Memory is released
           kfree(container_of(r, struct fw_event_work, refcount));
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kref.h:65:3: note: Returning; memory was released
                   release(kref);
                   ^~~~~~~~~~~~~
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:241:2: note: Returning; memory was =
released
           kref_put(&fw_work->refcount, fw_event_work_free);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:3752:4: note: Returning; memory was=
 released via 1st parameter
                           fw_event_work_put(fw_event);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:3754:3: note: Use of memory after i=
t is freed
                   fw_event_work_put(fw_event);
                   ^                 ~~~~~~~~
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:5440:3: warning: Call to function '=
strcat' is insecure as it does not provide bounding of the memory buffer. R=
eplace unbounded copy functions with analogous functions that support lengt=
h arguments such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI=
.strcpy]
                   strcat(desc_scsi_state, "response info ");
                   ^~~~~~
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:5440:3: note: Call to function 'str=
cat' is insecure as it does not provide bounding of the memory buffer. Repl=
ace unbounded copy functions with analogous functions that support length a=
rguments such as 'strlcat'. CWE-119
                   strcat(desc_scsi_state, "response info ");
                   ^~~~~~
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:5442:3: warning: Call to function '=
strcat' is insecure as it does not provide bounding of the memory buffer. R=
eplace unbounded copy functions with analogous functions that support lengt=
h arguments such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI=
.strcpy]
                   strcat(desc_scsi_state, "state terminated ");
                   ^~~~~~
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:5442:3: note: Call to function 'str=
cat' is insecure as it does not provide bounding of the memory buffer. Repl=
ace unbounded copy functions with analogous functions that support length a=
rguments such as 'strlcat'. CWE-119
                   strcat(desc_scsi_state, "state terminated ");
                   ^~~~~~
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:5444:3: warning: Call to function '=
strcat' is insecure as it does not provide bounding of the memory buffer. R=
eplace unbounded copy functions with analogous functions that support lengt=
h arguments such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI=
.strcpy]
                   strcat(desc_scsi_state, "no status ");
                   ^~~~~~
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:5444:3: note: Call to function 'str=
cat' is insecure as it does not provide bounding of the memory buffer. Repl=
ace unbounded copy functions with analogous functions that support length a=
rguments such as 'strlcat'. CWE-119
                   strcat(desc_scsi_state, "no status ");
                   ^~~~~~
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:5446:3: warning: Call to function '=
strcat' is insecure as it does not provide bounding of the memory buffer. R=
eplace unbounded copy functions with analogous functions that support lengt=
h arguments such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI=
.strcpy]
                   strcat(desc_scsi_state, "autosense failed ");
                   ^~~~~~
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:5446:3: note: Call to function 'str=
cat' is insecure as it does not provide bounding of the memory buffer. Repl=
ace unbounded copy functions with analogous functions that support length a=
rguments such as 'strlcat'. CWE-119
                   strcat(desc_scsi_state, "autosense failed ");
                   ^~~~~~
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:5448:3: warning: Call to function '=
strcat' is insecure as it does not provide bounding of the memory buffer. R=
eplace unbounded copy functions with analogous functions that support lengt=
h arguments such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI=
.strcpy]
                   strcat(desc_scsi_state, "autosense valid ");
                   ^~~~~~
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:5448:3: note: Call to function 'str=
cat' is insecure as it does not provide bounding of the memory buffer. Repl=
ace unbounded copy functions with analogous functions that support length a=
rguments such as 'strlcat'. CWE-119
                   strcat(desc_scsi_state, "autosense valid ");
                   ^~~~~~
>> drivers/scsi/mpt3sas/mpt3sas_scsih.c:8201:26: warning: Assigned value is=
 garbage or undefined [clang-analyzer-core.uninitialized.Assign]
                   pcie_device->nvme_mdts =3D
                                          ^
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:8090:7: note: Assuming the conditio=
n is false
           if ((mpt3sas_config_get_pcie_device_pg0(ioc, &mpi_reply,
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:8090:2: note: Taking false branch
           if ((mpt3sas_config_get_pcie_device_pg0(ioc, &mpi_reply,
           ^
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:8098:6: note: Assuming 'ioc_status'=
 is equal to MPI2_IOCSTATUS_SUCCESS
           if (ioc_status !=3D MPI2_IOCSTATUS_SUCCESS) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:8098:2: note: Taking false branch
           if (ioc_status !=3D MPI2_IOCSTATUS_SUCCESS) {
           ^
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:8108:6: note: Assuming the conditio=
n is false
           if (!(le32_to_cpu(pcie_device_pg0.Flags) &
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:8108:2: note: Taking false branch
           if (!(le32_to_cpu(pcie_device_pg0.Flags) &
           ^
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:8116:2: note: Taking false branch
           if (_scsih_check_pcie_access_status(ioc, wwid, handle,
           ^
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:8120:2: note: Taking false branch
           if (!(_scsih_is_nvme_pciescsi_device(le32_to_cpu
           ^
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:8124:16: note: Calling 'mpt3sas_get=
_pdev_by_wwid'
           pcie_device =3D mpt3sas_get_pdev_by_wwid(ioc, wwid);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:1134:2: note: Loop condition is fal=
se.  Exiting loop
           spin_lock_irqsave(&ioc->pcie_device_lock, flags);
           ^
   include/linux/spinlock.h:379:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:240:2: note: expanded from macro 'raw_spin_lock=
_irqsave'
           do {                                            \
           ^
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:1134:2: note: Loop condition is fal=
se.  Exiting loop
           spin_lock_irqsave(&ioc->pcie_device_lock, flags);
           ^
   include/linux/spinlock.h:377:43: note: expanded from macro 'spin_lock_ir=
qsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:1138:2: note: Returning pointer (lo=
aded from 'pcie_device'), which participates in a condition later
           return pcie_device;
           ^~~~~~~~~~~~~~~~~~
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:8124:16: note: Returning from 'mpt3=
sas_get_pdev_by_wwid'
           pcie_device =3D mpt3sas_get_pdev_by_wwid(ioc, wwid);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:8125:6: note: Assuming 'pcie_device=
' is null
           if (pcie_device) {
               ^~~~~~~~~~~
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:8125:2: note: Taking false branch
           if (pcie_device) {
           ^
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:8135:2: note: Taking false branch
           if (!(mpt3sas_scsih_is_pcie_scsi_device(
           ^
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:8156:16: note: Calling 'kzalloc'
           pcie_device =3D kzalloc(sizeof(struct _pcie_device), GFP_KERNEL);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:715:9: note: Calling 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:569:2: note: Taking false branch
           if (__builtin_constant_p(size)) {
           ^
   include/linux/slab.h:586:2: note: Returning pointer, which participates =
in a condition later
           return __kmalloc(size, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:715:9: note: Returning from 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:715:2: note: Returning pointer, which participates =
in a condition later
           return kmalloc(size, flags | __GFP_ZERO);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:8156:16: note: Returning from 'kzal=
loc'
           pcie_device =3D kzalloc(sizeof(struct _pcie_device), GFP_KERNEL);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:8157:6: note: Assuming 'pcie_device=
' is non-null
           if (!pcie_device) {
               ^~~~~~~~~~~~
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:8157:2: note: Taking false branch
           if (!pcie_device) {
           ^
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:8171:28: note: Assuming the conditi=
on is false
           pcie_device->fast_path =3D (le32_to_cpu(pcie_device_pg0.Flags) &
                                     ^
   include/linux/byteorder/generic.h:89:21: note: expanded from macro 'le32=
_to_cpu'
   #define le32_to_cpu __le32_to_cpu
                       ^
   include/uapi/linux/byteorder/little_endian.h:35:26: note: expanded from =
macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                            ^
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:8171:27: note: '?' condition is fal=
se
           pcie_device->fast_path =3D (le32_to_cpu(pcie_device_pg0.Flags) &
                                    ^
   drivers/scsi/mpt3sas/mpt3sas_scsih.c:8176:6: note: Assuming field 'enclo=
sure_handle' is equal to 0
           if (pcie_device->enclosure_handle !=3D 0)

vim +8201 drivers/scsi/mpt3sas/mpt3sas_scsih.c

c102e00cf4b8a9 Suganath Prabu Subramani 2017-10-31  8069  =

c102e00cf4b8a9 Suganath Prabu Subramani 2017-10-31  8070  /**
c102e00cf4b8a9 Suganath Prabu Subramani 2017-10-31  8071   * _scsih_pcie_ad=
d_device -  creating pcie device object
c102e00cf4b8a9 Suganath Prabu Subramani 2017-10-31  8072   * @ioc: per adap=
ter object
c102e00cf4b8a9 Suganath Prabu Subramani 2017-10-31  8073   * @handle: pcie =
device handle
c102e00cf4b8a9 Suganath Prabu Subramani 2017-10-31  8074   *
c102e00cf4b8a9 Suganath Prabu Subramani 2017-10-31  8075   * Creating end d=
evice object, stored in ioc->pcie_device_list.
c102e00cf4b8a9 Suganath Prabu Subramani 2017-10-31  8076   *
4beb4867f049ae Bart Van Assche          2018-06-15  8077   * Return: 1 mean=
s queue the event later, 0 means complete the event
c102e00cf4b8a9 Suganath Prabu Subramani 2017-10-31  8078   */
c102e00cf4b8a9 Suganath Prabu Subramani 2017-10-31  8079  static int
c102e00cf4b8a9 Suganath Prabu Subramani 2017-10-31  8080  _scsih_pcie_add_d=
evice(struct MPT3SAS_ADAPTER *ioc, u16 handle)
c102e00cf4b8a9 Suganath Prabu Subramani 2017-10-31  8081  {
c102e00cf4b8a9 Suganath Prabu Subramani 2017-10-31  8082  	Mpi26PCIeDeviceP=
age0_t pcie_device_pg0;
c102e00cf4b8a9 Suganath Prabu Subramani 2017-10-31  8083  	Mpi26PCIeDeviceP=
age2_t pcie_device_pg2;
c102e00cf4b8a9 Suganath Prabu Subramani 2017-10-31  8084  	Mpi2ConfigReply_=
t mpi_reply;
c102e00cf4b8a9 Suganath Prabu Subramani 2017-10-31  8085  	struct _pcie_dev=
ice *pcie_device;
22a923c315ba09 Chaitra P B              2018-04-24  8086  	struct _enclosur=
e_node *enclosure_dev;
c102e00cf4b8a9 Suganath Prabu Subramani 2017-10-31  8087  	u32 ioc_status;
c102e00cf4b8a9 Suganath Prabu Subramani 2017-10-31  8088  	u64 wwid;
c102e00cf4b8a9 Suganath Prabu Subramani 2017-10-31  8089  =

c102e00cf4b8a9 Suganath Prabu Subramani 2017-10-31  8090  	if ((mpt3sas_con=
fig_get_pcie_device_pg0(ioc, &mpi_reply,
c102e00cf4b8a9 Suganath Prabu Subramani 2017-10-31  8091  	    &pcie_device=
_pg0, MPI26_PCIE_DEVICE_PGAD_FORM_HANDLE, handle))) {
919d8a3f3fef99 Joe Perches              2018-09-17  8092  		ioc_err(ioc, "f=
ailure at %s:%d/%s()!\n",
919d8a3f3fef99 Joe Perches              2018-09-17  8093  			__FILE__, __LI=
NE__, __func__);
c102e00cf4b8a9 Suganath Prabu Subramani 2017-10-31  8094  		return 0;
c102e00cf4b8a9 Suganath Prabu Subramani 2017-10-31  8095  	}
c102e00cf4b8a9 Suganath Prabu Subramani 2017-10-31  8096  	ioc_status =3D l=
e16_to_cpu(mpi_reply.IOCStatus) &
c102e00cf4b8a9 Suganath Prabu Subramani 2017-10-31  8097  	    MPI2_IOCSTAT=
US_MASK;
c102e00cf4b8a9 Suganath Prabu Subramani 2017-10-31  8098  	if (ioc_status !=
=3D MPI2_IOCSTATUS_SUCCESS) {
919d8a3f3fef99 Joe Perches              2018-09-17  8099  		ioc_err(ioc, "f=
ailure at %s:%d/%s()!\n",
919d8a3f3fef99 Joe Perches              2018-09-17  8100  			__FILE__, __LI=
NE__, __func__);
c102e00cf4b8a9 Suganath Prabu Subramani 2017-10-31  8101  		return 0;
c102e00cf4b8a9 Suganath Prabu Subramani 2017-10-31  8102  	}
c102e00cf4b8a9 Suganath Prabu Subramani 2017-10-31  8103  =

c102e00cf4b8a9 Suganath Prabu Subramani 2017-10-31  8104  	set_bit(handle, =
ioc->pend_os_device_add);
c102e00cf4b8a9 Suganath Prabu Subramani 2017-10-31  8105  	wwid =3D le64_to=
_cpu(pcie_device_pg0.WWID);
c102e00cf4b8a9 Suganath Prabu Subramani 2017-10-31  8106  =

c102e00cf4b8a9 Suganath Prabu Subramani 2017-10-31  8107  	/* check if devi=
ce is present */
c102e00cf4b8a9 Suganath Prabu Subramani 2017-10-31  8108  	if (!(le32_to_cp=
u(pcie_device_pg0.Flags) &
c102e00cf4b8a9 Suganath Prabu Subramani 2017-10-31  8109  		MPI26_PCIEDEV0_=
FLAGS_DEVICE_PRESENT)) {
919d8a3f3fef99 Joe Perches              2018-09-17  8110  		ioc_err(ioc, "d=
evice is not present handle(0x04%x)!!!\n",
919d8a3f3fef99 Joe Perches              2018-09-17  8111  			handle);
c102e00cf4b8a9 Suganath Prabu Subramani 2017-10-31  8112  		return 0;
c102e00cf4b8a9 Suganath Prabu Subramani 2017-10-31  8113  	}
c102e00cf4b8a9 Suganath Prabu Subramani 2017-10-31  8114  =

c102e00cf4b8a9 Suganath Prabu Subramani 2017-10-31  8115  	/* check if ther=
e were any issues with discovery */
c102e00cf4b8a9 Suganath Prabu Subramani 2017-10-31  8116  	if (_scsih_check=
_pcie_access_status(ioc, wwid, handle,
c102e00cf4b8a9 Suganath Prabu Subramani 2017-10-31  8117  	    pcie_device_=
pg0.AccessStatus))
c102e00cf4b8a9 Suganath Prabu Subramani 2017-10-31  8118  		return 0;
c102e00cf4b8a9 Suganath Prabu Subramani 2017-10-31  8119  =

5bb309dbbbf215 Suganath Prabu           2019-08-03  8120  	if (!(_scsih_is_=
nvme_pciescsi_device(le32_to_cpu
5bb309dbbbf215 Suganath Prabu           2019-08-03  8121  	    (pcie_device=
_pg0.DeviceInfo))))
c102e00cf4b8a9 Suganath Prabu Subramani 2017-10-31  8122  		return 0;
c102e00cf4b8a9 Suganath Prabu Subramani 2017-10-31  8123  =

c102e00cf4b8a9 Suganath Prabu Subramani 2017-10-31  8124  	pcie_device =3D =
mpt3sas_get_pdev_by_wwid(ioc, wwid);
c102e00cf4b8a9 Suganath Prabu Subramani 2017-10-31  8125  	if (pcie_device)=
 {
c102e00cf4b8a9 Suganath Prabu Subramani 2017-10-31  8126  		clear_bit(handl=
e, ioc->pend_os_device_add);
c102e00cf4b8a9 Suganath Prabu Subramani 2017-10-31  8127  		pcie_device_put=
(pcie_device);
c102e00cf4b8a9 Suganath Prabu Subramani 2017-10-31  8128  		return 0;
c102e00cf4b8a9 Suganath Prabu Subramani 2017-10-31  8129  	}
c102e00cf4b8a9 Suganath Prabu Subramani 2017-10-31  8130  =

5bb309dbbbf215 Suganath Prabu           2019-08-03  8131  	/* PCIe Device P=
age 2 contains read-only information about a
5bb309dbbbf215 Suganath Prabu           2019-08-03  8132  	 * specific NVMe=
 device; therefore, this page is only
5bb309dbbbf215 Suganath Prabu           2019-08-03  8133  	 * valid for NVM=
e devices and skip for pcie devices of type scsi.
5bb309dbbbf215 Suganath Prabu           2019-08-03  8134  	 */
5bb309dbbbf215 Suganath Prabu           2019-08-03  8135  	if (!(mpt3sas_sc=
sih_is_pcie_scsi_device(
5bb309dbbbf215 Suganath Prabu           2019-08-03  8136  		le32_to_cpu(pci=
e_device_pg0.DeviceInfo)))) {
5bb309dbbbf215 Suganath Prabu           2019-08-03  8137  		if (mpt3sas_con=
fig_get_pcie_device_pg2(ioc, &mpi_reply,
5bb309dbbbf215 Suganath Prabu           2019-08-03  8138  		    &pcie_devic=
e_pg2, MPI2_SAS_DEVICE_PGAD_FORM_HANDLE,
5bb309dbbbf215 Suganath Prabu           2019-08-03  8139  		    handle)) {
5bb309dbbbf215 Suganath Prabu           2019-08-03  8140  			ioc_err(ioc,
5bb309dbbbf215 Suganath Prabu           2019-08-03  8141  			    "failure a=
t %s:%d/%s()!\n", __FILE__,
5bb309dbbbf215 Suganath Prabu           2019-08-03  8142  			    __LINE__, =
__func__);
5bb309dbbbf215 Suganath Prabu           2019-08-03  8143  			return 0;
5bb309dbbbf215 Suganath Prabu           2019-08-03  8144  		}
5bb309dbbbf215 Suganath Prabu           2019-08-03  8145  =

5bb309dbbbf215 Suganath Prabu           2019-08-03  8146  		ioc_status =3D =
le16_to_cpu(mpi_reply.IOCStatus) &
5bb309dbbbf215 Suganath Prabu           2019-08-03  8147  					MPI2_IOCSTAT=
US_MASK;
5bb309dbbbf215 Suganath Prabu           2019-08-03  8148  		if (ioc_status =
!=3D MPI2_IOCSTATUS_SUCCESS) {
5bb309dbbbf215 Suganath Prabu           2019-08-03  8149  			ioc_err(ioc,
5bb309dbbbf215 Suganath Prabu           2019-08-03  8150  			    "failure a=
t %s:%d/%s()!\n", __FILE__,
5bb309dbbbf215 Suganath Prabu           2019-08-03  8151  			    __LINE__, =
__func__);
5bb309dbbbf215 Suganath Prabu           2019-08-03  8152  			return 0;
5bb309dbbbf215 Suganath Prabu           2019-08-03  8153  		}
5bb309dbbbf215 Suganath Prabu           2019-08-03  8154  	}
5bb309dbbbf215 Suganath Prabu           2019-08-03  8155  =

c102e00cf4b8a9 Suganath Prabu Subramani 2017-10-31  8156  	pcie_device =3D =
kzalloc(sizeof(struct _pcie_device), GFP_KERNEL);
c102e00cf4b8a9 Suganath Prabu Subramani 2017-10-31  8157  	if (!pcie_device=
) {
919d8a3f3fef99 Joe Perches              2018-09-17  8158  		ioc_err(ioc, "f=
ailure at %s:%d/%s()!\n",
919d8a3f3fef99 Joe Perches              2018-09-17  8159  			__FILE__, __LI=
NE__, __func__);
c102e00cf4b8a9 Suganath Prabu Subramani 2017-10-31  8160  		return 0;
c102e00cf4b8a9 Suganath Prabu Subramani 2017-10-31  8161  	}
c102e00cf4b8a9 Suganath Prabu Subramani 2017-10-31  8162  =

c102e00cf4b8a9 Suganath Prabu Subramani 2017-10-31  8163  	kref_init(&pcie_=
device->refcount);
c102e00cf4b8a9 Suganath Prabu Subramani 2017-10-31  8164  	pcie_device->id =
=3D ioc->pcie_target_id++;
c102e00cf4b8a9 Suganath Prabu Subramani 2017-10-31  8165  	pcie_device->cha=
nnel =3D PCIE_CHANNEL;
c102e00cf4b8a9 Suganath Prabu Subramani 2017-10-31  8166  	pcie_device->han=
dle =3D handle;
3c090ce3f0fba1 Suganath Prabu           2019-08-03  8167  	pcie_device->acc=
ess_status =3D pcie_device_pg0.AccessStatus;
c102e00cf4b8a9 Suganath Prabu Subramani 2017-10-31  8168  	pcie_device->dev=
ice_info =3D le32_to_cpu(pcie_device_pg0.DeviceInfo);
c102e00cf4b8a9 Suganath Prabu Subramani 2017-10-31  8169  	pcie_device->wwi=
d =3D wwid;
c102e00cf4b8a9 Suganath Prabu Subramani 2017-10-31  8170  	pcie_device->por=
t_num =3D pcie_device_pg0.PortNum;
c102e00cf4b8a9 Suganath Prabu Subramani 2017-10-31  8171  	pcie_device->fas=
t_path =3D (le32_to_cpu(pcie_device_pg0.Flags) &
c102e00cf4b8a9 Suganath Prabu Subramani 2017-10-31  8172  	    MPI26_PCIEDE=
V0_FLAGS_FAST_PATH_CAPABLE) ? 1 : 0;
c102e00cf4b8a9 Suganath Prabu Subramani 2017-10-31  8173  =

c102e00cf4b8a9 Suganath Prabu Subramani 2017-10-31  8174  	pcie_device->enc=
losure_handle =3D
c102e00cf4b8a9 Suganath Prabu Subramani 2017-10-31  8175  	    le16_to_cpu(=
pcie_device_pg0.EnclosureHandle);
c102e00cf4b8a9 Suganath Prabu Subramani 2017-10-31  8176  	if (pcie_device-=
>enclosure_handle !=3D 0)
c102e00cf4b8a9 Suganath Prabu Subramani 2017-10-31  8177  		pcie_device->sl=
ot =3D le16_to_cpu(pcie_device_pg0.Slot);
c102e00cf4b8a9 Suganath Prabu Subramani 2017-10-31  8178  =

cf6bf9710cabba Chaitra P B              2018-04-24  8179  	if (le32_to_cpu(=
pcie_device_pg0.Flags) &
c102e00cf4b8a9 Suganath Prabu Subramani 2017-10-31  8180  	    MPI26_PCIEDE=
V0_FLAGS_ENCL_LEVEL_VALID) {
c102e00cf4b8a9 Suganath Prabu Subramani 2017-10-31  8181  		pcie_device->en=
closure_level =3D pcie_device_pg0.EnclosureLevel;
c102e00cf4b8a9 Suganath Prabu Subramani 2017-10-31  8182  		memcpy(&pcie_de=
vice->connector_name[0],
c102e00cf4b8a9 Suganath Prabu Subramani 2017-10-31  8183  		    &pcie_devic=
e_pg0.ConnectorName[0], 4);
c102e00cf4b8a9 Suganath Prabu Subramani 2017-10-31  8184  	} else {
c102e00cf4b8a9 Suganath Prabu Subramani 2017-10-31  8185  		pcie_device->en=
closure_level =3D 0;
c102e00cf4b8a9 Suganath Prabu Subramani 2017-10-31  8186  		pcie_device->co=
nnector_name[0] =3D '\0';
c102e00cf4b8a9 Suganath Prabu Subramani 2017-10-31  8187  	}
c102e00cf4b8a9 Suganath Prabu Subramani 2017-10-31  8188  =

c102e00cf4b8a9 Suganath Prabu Subramani 2017-10-31  8189  	/* get enclosure=
_logical_id */
22a923c315ba09 Chaitra P B              2018-04-24  8190  	if (pcie_device-=
>enclosure_handle) {
22a923c315ba09 Chaitra P B              2018-04-24  8191  		enclosure_dev =
=3D
22a923c315ba09 Chaitra P B              2018-04-24  8192  			mpt3sas_scsih_=
enclosure_find_by_handle(ioc,
22a923c315ba09 Chaitra P B              2018-04-24  8193  						pcie_device=
->enclosure_handle);
22a923c315ba09 Chaitra P B              2018-04-24  8194  		if (enclosure_d=
ev)
c102e00cf4b8a9 Suganath Prabu Subramani 2017-10-31  8195  			pcie_device->e=
nclosure_logical_id =3D
22a923c315ba09 Chaitra P B              2018-04-24  8196  			    le64_to_cp=
u(enclosure_dev->pg0.EnclosureLogicalID);
22a923c315ba09 Chaitra P B              2018-04-24  8197  	}
c102e00cf4b8a9 Suganath Prabu Subramani 2017-10-31  8198  	/* TODO -- Add d=
evice name once FW supports it */
5bb309dbbbf215 Suganath Prabu           2019-08-03  8199  	if (!(mpt3sas_sc=
sih_is_pcie_scsi_device(
5bb309dbbbf215 Suganath Prabu           2019-08-03  8200  	    le32_to_cpu(=
pcie_device_pg0.DeviceInfo)))) {
c102e00cf4b8a9 Suganath Prabu Subramani 2017-10-31 @8201  		pcie_device->nv=
me_mdts =3D
c102e00cf4b8a9 Suganath Prabu Subramani 2017-10-31  8202  		    le32_to_cpu=
(pcie_device_pg2.MaximumDataTransferSize);
d3f623ae8e0323 Sreekanth Reddy          2019-12-26  8203  		pcie_device->sh=
utdown_latency =3D
d3f623ae8e0323 Sreekanth Reddy          2019-12-26  8204  			le16_to_cpu(pc=
ie_device_pg2.ShutdownLatency);
d3f623ae8e0323 Sreekanth Reddy          2019-12-26  8205  		/*
d3f623ae8e0323 Sreekanth Reddy          2019-12-26  8206  		 * Set IOC's ma=
x_shutdown_latency to drive's RTD3 Entry Latency
d3f623ae8e0323 Sreekanth Reddy          2019-12-26  8207  		 * if drive's R=
TD3 Entry Latency is greater then IOC's
d3f623ae8e0323 Sreekanth Reddy          2019-12-26  8208  		 * max_shutdown=
_latency.
d3f623ae8e0323 Sreekanth Reddy          2019-12-26  8209  		 */
d3f623ae8e0323 Sreekanth Reddy          2019-12-26  8210  		if (pcie_device=
->shutdown_latency > ioc->max_shutdown_latency)
d3f623ae8e0323 Sreekanth Reddy          2019-12-26  8211  			ioc->max_shutd=
own_latency =3D
d3f623ae8e0323 Sreekanth Reddy          2019-12-26  8212  				pcie_device->=
shutdown_latency;
c1a6c5ac4278d4 Chaitra P B              2018-04-24  8213  		if (pcie_device=
_pg2.ControllerResetTO)
c1a6c5ac4278d4 Chaitra P B              2018-04-24  8214  			pcie_device->r=
eset_timeout =3D
c1a6c5ac4278d4 Chaitra P B              2018-04-24  8215  			    pcie_devic=
e_pg2.ControllerResetTO;
c1a6c5ac4278d4 Chaitra P B              2018-04-24  8216  		else
c1a6c5ac4278d4 Chaitra P B              2018-04-24  8217  			pcie_device->r=
eset_timeout =3D 30;
5bb309dbbbf215 Suganath Prabu           2019-08-03  8218  	} else
5bb309dbbbf215 Suganath Prabu           2019-08-03  8219  		pcie_device->re=
set_timeout =3D 30;
c102e00cf4b8a9 Suganath Prabu Subramani 2017-10-31  8220  =

c102e00cf4b8a9 Suganath Prabu Subramani 2017-10-31  8221  	if (ioc->wait_fo=
r_discovery_to_complete)
c102e00cf4b8a9 Suganath Prabu Subramani 2017-10-31  8222  		_scsih_pcie_dev=
ice_init_add(ioc, pcie_device);
c102e00cf4b8a9 Suganath Prabu Subramani 2017-10-31  8223  	else
c102e00cf4b8a9 Suganath Prabu Subramani 2017-10-31  8224  		_scsih_pcie_dev=
ice_add(ioc, pcie_device);
c102e00cf4b8a9 Suganath Prabu Subramani 2017-10-31  8225  =

c102e00cf4b8a9 Suganath Prabu Subramani 2017-10-31  8226  	pcie_device_put(=
pcie_device);
c102e00cf4b8a9 Suganath Prabu Subramani 2017-10-31  8227  	return 0;
c102e00cf4b8a9 Suganath Prabu Subramani 2017-10-31  8228  }
4318c73478474f Suganath Prabu Subramani 2017-10-31  8229  =


:::::: The code at line 8201 was first introduced by commit
:::::: c102e00cf4b8a9aa4a24be5ddbdcb28fc9765920 scsi: mpt3sas: API 's to su=
pport NVMe drive addition to SML

:::::: TO: Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.co=
m>
:::::: CC: Martin K. Petersen <martin.petersen@oracle.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1128213766966432467==--

