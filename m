Content-Type: multipart/mixed; boundary="===============3176298903726358686=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/infiniband/sw/siw/siw_cm.c:205:10: warning: Use of memory after it is freed [clang-analyzer-unix.Malloc]
Date: Tue, 11 Jan 2022 00:37:30 +0800
Message-ID: <202201110054.Upprtfhi-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3176298903726358686==
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
head:   df0cc57e057f18e44dac8e6c18aba47ab53202f9
commit: e1edc277e6f6dfb372216522dfc57f9381c39e35 linux/container_of.h: swit=
ch to static_assert
date:   9 weeks ago
:::::: branch date: 18 hours ago
:::::: commit date: 9 weeks ago
config: riscv-randconfig-c006-20211207 (https://download.01.org/0day-ci/arc=
hive/20220111/202201110054.Upprtfhi-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 097a1c=
b1d5ebb3a0ec4bcaed8ba3ff6a8e33c00a)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3De1edc277e6f6dfb372216522dfc57f9381c39e35
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e1edc277e6f6dfb372216522dfc57f9381c39e35
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   include/linux/list.h:137:13: note: Use of memory after it is freed
           __list_del(entry->prev, entry->next);
                      ^~~~~~~~~~~
   include/linux/list.h:149:14: warning: Use of memory after it is freed [c=
lang-analyzer-unix.Malloc]
           entry->next =3D LIST_POISON1;
                       ^
   sound/core/rawmidi.c:1854:9: note: Calling 'snd_rawmidi_free'
           return snd_rawmidi_free(rmidi);
                  ^~~~~~~~~~~~~~~~~~~~~~~
   sound/core/rawmidi.c:1832:6: note: Assuming 'rmidi' is non-null
           if (!rmidi)
               ^~~~~~
   sound/core/rawmidi.c:1832:2: note: Taking false branch
           if (!rmidi)
           ^
   sound/core/rawmidi.c:1838:6: note: Assuming field 'ops' is null
           if (rmidi->ops && rmidi->ops->dev_unregister)
               ^~~~~~~~~~
   sound/core/rawmidi.c:1838:17: note: Left side of '&&' is false
           if (rmidi->ops && rmidi->ops->dev_unregister)
                          ^
   sound/core/rawmidi.c:1842:2: note: Calling 'snd_rawmidi_free_substreams'
           snd_rawmidi_free_substreams(&rmidi->streams[SNDRV_RAWMIDI_STREAM=
_INPUT]);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   sound/core/rawmidi.c:1823:2: note: Loop condition is true.  Entering loo=
p body
           while (!list_empty(&stream->substreams)) {
           ^
   sound/core/rawmidi.c:1826:3: note: Memory is released
                   kfree(substream);
                   ^~~~~~~~~~~~~~~~
   sound/core/rawmidi.c:1823:2: note: Loop condition is true.  Entering loo=
p body
           while (!list_empty(&stream->substreams)) {
           ^
   sound/core/rawmidi.c:1825:3: note: Calling 'list_del'
                   list_del(&substream->list);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:149:14: note: Use of memory after it is freed
           entry->next =3D LIST_POISON1;
           ~~~~~~~~~~~ ^
   sound/core/rawmidi.c:599:2: warning: Call to function 'strcpy' is insecu=
re as it does not provide bounding of the memory buffer. Replace unbounded =
copy functions with analogous functions that support length arguments such =
as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(info->id, rmidi->id);
           ^~~~~~
   sound/core/rawmidi.c:599:2: note: Call to function 'strcpy' is insecure =
as it does not provide bounding of the memory buffer. Replace unbounded cop=
y functions with analogous functions that support length arguments such as =
'strlcpy'. CWE-119
           strcpy(info->id, rmidi->id);
           ^~~~~~
   sound/core/rawmidi.c:600:2: warning: Call to function 'strcpy' is insecu=
re as it does not provide bounding of the memory buffer. Replace unbounded =
copy functions with analogous functions that support length arguments such =
as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(info->name, rmidi->name);
           ^~~~~~
   sound/core/rawmidi.c:600:2: note: Call to function 'strcpy' is insecure =
as it does not provide bounding of the memory buffer. Replace unbounded cop=
y functions with analogous functions that support length arguments such as =
'strlcpy'. CWE-119
           strcpy(info->name, rmidi->name);
           ^~~~~~
   sound/core/rawmidi.c:601:2: warning: Call to function 'strcpy' is insecu=
re as it does not provide bounding of the memory buffer. Replace unbounded =
copy functions with analogous functions that support length arguments such =
as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(info->subname, substream->name);
           ^~~~~~
   sound/core/rawmidi.c:601:2: note: Call to function 'strcpy' is insecure =
as it does not provide bounding of the memory buffer. Replace unbounded cop=
y functions with analogous functions that support length arguments such as =
'strlcpy'. CWE-119
           strcpy(info->subname, substream->name);
           ^~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/infiniband/ulp/srpt/ib_srpt.c:3044:20: warning: Value stored to =
'device' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct ib_device *device =3D sdev->device;
                             ^~~~~~   ~~~~~~~~~~~~
   drivers/infiniband/ulp/srpt/ib_srpt.c:3044:20: note: Value stored to 'de=
vice' during its initialization is never read
           struct ib_device *device =3D sdev->device;
                             ^~~~~~   ~~~~~~~~~~~~
   drivers/infiniband/ulp/srpt/ib_srpt.c:3090:20: warning: Value stored to =
'device' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct ib_device *device =3D sdev->device;
                             ^~~~~~   ~~~~~~~~~~~~
   drivers/infiniband/ulp/srpt/ib_srpt.c:3090:20: note: Value stored to 'de=
vice' during its initialization is never read
           struct ib_device *device =3D sdev->device;
                             ^~~~~~   ~~~~~~~~~~~~
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
   14 warnings generated.
>> drivers/infiniband/sw/siw/siw_cm.c:205:10: warning: Use of memory after =
it is freed [clang-analyzer-unix.Malloc]
                           kfree(cep->mpa_timer); /* not needed again */
                                 ^
   drivers/infiniband/sw/siw/siw_cm.c:1728:2: note: Calling 'siw_cancel_mpa=
timer'
           siw_cancel_mpatimer(cep);
           ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/sw/siw/siw_cm.c:202:6: note: Assuming field 'mpa_time=
r' is non-null
           if (cep->mpa_timer) {
               ^~~~~~~~~~~~~~
   drivers/infiniband/sw/siw/siw_cm.c:202:2: note: Taking true branch
           if (cep->mpa_timer) {
           ^
   drivers/infiniband/sw/siw/siw_cm.c:203:7: note: Assuming the condition i=
s true
                   if (cancel_delayed_work(&cep->mpa_timer->work)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/sw/siw/siw_cm.c:203:3: note: Taking true branch
                   if (cancel_delayed_work(&cep->mpa_timer->work)) {
                   ^
   drivers/infiniband/sw/siw/siw_cm.c:204:4: note: Calling 'siw_cep_put'
                           siw_cep_put(cep);
                           ^~~~~~~~~~~~~~~~
   drivers/infiniband/sw/siw/siw_cm.c:441:10: note: Assuming the condition =
is false
           WARN_ON(kref_read(&cep->ref) < 1);
                   ^
   include/asm-generic/bug.h:166:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   drivers/infiniband/sw/siw/siw_cm.c:442:2: note: Calling 'kref_put'
           kref_put(&cep->ref, __siw_cep_dealloc);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kref.h:64:2: note: Taking true branch
           if (refcount_dec_and_test(&kref->refcount)) {
           ^
   include/linux/kref.h:65:3: note: Calling '__siw_cep_dealloc'
                   release(kref);
                   ^~~~~~~~~~~~~
   drivers/infiniband/sw/siw/siw_cm.c:255:2: note: Assuming field 'listen_c=
ep' is non-null
           WARN_ON(cep->listen_cep);
           ^
   include/asm-generic/bug.h:166:23: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                ^~~~~~~~~~~~
   drivers/infiniband/sw/siw/siw_cm.c:260:6: note: Assuming the condition i=
s false
           if (!list_empty(&cep->work_freelist))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/sw/siw/siw_cm.c:260:2: note: Taking false branch
           if (!list_empty(&cep->work_freelist))
           ^
   drivers/infiniband/sw/siw/siw_cm.c:264:2: note: Loop condition is false.=
  Exiting loop
           spin_lock_irqsave(&sdev->lock, flags);
           ^
   include/linux/spinlock.h:392:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:253:2: note: expanded from macro 'raw_spin_lock=
_irqsave'
           do {                                            \
           ^
   drivers/infiniband/sw/siw/siw_cm.c:264:2: note: Loop condition is false.=
  Exiting loop
           spin_lock_irqsave(&sdev->lock, flags);
           ^
   include/linux/spinlock.h:390:43: note: expanded from macro 'spin_lock_ir=
qsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   drivers/infiniband/sw/siw/siw_cm.c:269:2: note: Memory is released
           kfree(cep);
           ^~~~~~~~~~
   include/linux/kref.h:65:3: note: Returning; memory was released
                   release(kref);
                   ^~~~~~~~~~~~~
   drivers/infiniband/sw/siw/siw_cm.c:442:2: note: Returning; memory was re=
leased
           kref_put(&cep->ref, __siw_cep_dealloc);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/sw/siw/siw_cm.c:204:4: note: Returning; memory was re=
leased via 1st parameter
                           siw_cep_put(cep);
                           ^~~~~~~~~~~~~~~~
   drivers/infiniband/sw/siw/siw_cm.c:205:10: note: Use of memory after it =
is freed
                           kfree(cep->mpa_timer); /* not needed again */
                                 ^~~~~~~~~~~~~~
   drivers/infiniband/sw/siw/siw_cm.c:420:14: warning: Use of memory after =
it is freed [clang-analyzer-unix.Malloc]
                   cep->state =3D SIW_EPSTATE_CLOSED;
                   ~~~~~~~~~~ ^
   drivers/infiniband/sw/siw/siw_cm.c:379:6: note: Assuming field 'cep' is =
non-null
           if (!qp->cep)
               ^~~~~~~~
   drivers/infiniband/sw/siw/siw_cm.c:379:2: note: Taking false branch
           if (!qp->cep)
           ^
   drivers/infiniband/sw/siw/siw_cm.c:382:6: note: Assuming 'schedule' is 0
           if (schedule) {
               ^~~~~~~~
   drivers/infiniband/sw/siw/siw_cm.c:382:2: note: Taking false branch
           if (schedule) {
           ^
   drivers/infiniband/sw/siw/siw_cm.c:387:7: note: Assuming field 'state' i=
s not equal to SIW_EPSTATE_CLOSED
                   if (cep->state =3D=3D SIW_EPSTATE_CLOSED) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/sw/siw/siw_cm.c:387:3: note: Taking false branch
                   if (cep->state =3D=3D SIW_EPSTATE_CLOSED) {
                   ^
   drivers/infiniband/sw/siw/siw_cm.c:393:7: note: Assuming field 'valid' i=
s 0
                   if (qp->term_info.valid)

vim +205 drivers/infiniband/sw/siw/siw_cm.c

6c52fdc244b5cc Bernard Metzler 2019-06-20  198  =

6c52fdc244b5cc Bernard Metzler 2019-06-20  199  static void siw_cancel_mpat=
imer(struct siw_cep *cep)
6c52fdc244b5cc Bernard Metzler 2019-06-20  200  {
6c52fdc244b5cc Bernard Metzler 2019-06-20  201  	spin_lock_bh(&cep->lock);
6c52fdc244b5cc Bernard Metzler 2019-06-20  202  	if (cep->mpa_timer) {
6c52fdc244b5cc Bernard Metzler 2019-06-20  203  		if (cancel_delayed_work(&=
cep->mpa_timer->work)) {
6c52fdc244b5cc Bernard Metzler 2019-06-20  204  			siw_cep_put(cep);
6c52fdc244b5cc Bernard Metzler 2019-06-20 @205  			kfree(cep->mpa_timer); /=
* not needed again */
6c52fdc244b5cc Bernard Metzler 2019-06-20  206  		}
6c52fdc244b5cc Bernard Metzler 2019-06-20  207  		cep->mpa_timer =3D NULL;
6c52fdc244b5cc Bernard Metzler 2019-06-20  208  	}
6c52fdc244b5cc Bernard Metzler 2019-06-20  209  	spin_unlock_bh(&cep->lock);
6c52fdc244b5cc Bernard Metzler 2019-06-20  210  }
6c52fdc244b5cc Bernard Metzler 2019-06-20  211  =


:::::: The code at line 205 was first introduced by commit
:::::: 6c52fdc244b5ccc468006fd65a504d4ee33743c7 rdma/siw: connection manage=
ment

:::::: TO: Bernard Metzler <bmt@zurich.ibm.com>
:::::: CC: Jason Gunthorpe <jgg@mellanox.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3176298903726358686==--

