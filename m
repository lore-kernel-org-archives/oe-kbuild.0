Content-Type: multipart/mixed; boundary="===============4967923931929526141=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/cxl/acpi.c:25:17: warning: Value stored to 'dev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Tue, 25 Jan 2022 19:34:47 +0800
Message-ID: <202201251919.qYokQb4N-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4967923931929526141==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Dan Williams <dan.j.williams@intel.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   dd81e1c7d5fb126e5fbc5c9e334d7b3ec29a16a0
commit: 3b94ce7b7bc1b436465a93f19a50e0b495b429a1 cxl/acpi: Enumerate host b=
ridge root ports
date:   8 months ago
:::::: branch date: 2 days ago
:::::: commit date: 8 months ago
config: x86_64-randconfig-c007-20220124 (https://download.01.org/0day-ci/ar=
chive/20220125/202201251919.qYokQb4N-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 7b3d30=
728816403d1fd73cc5082e9fb761262bce)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D3b94ce7b7bc1b436465a93f19a50e0b495b429a1
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 3b94ce7b7bc1b436465a93f19a50e0b495b429a1
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   include/linux/compiler_types.h:306:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/i3c/master/svc-i3c-master.c:369:2: note: Control jumps to 'case =
1:'  at line 370
           switch (ibitype) {
           ^
   drivers/i3c/master/svc-i3c-master.c:371:9: note: Calling 'svc_i3c_master=
_dev_from_addr'
                   dev =3D svc_i3c_master_dev_from_addr(master, ibiaddr);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/i3c/master/svc-i3c-master.c:259:2: note: Loop condition is true.=
  Entering loop body
           for (i =3D 0; i < SVC_I3C_MAX_DEVS; i++)
           ^
   drivers/i3c/master/svc-i3c-master.c:260:7: note: Assuming the condition =
is false
                   if (master->addrs[i] =3D=3D ibiaddr)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/i3c/master/svc-i3c-master.c:260:3: note: Taking false branch
                   if (master->addrs[i] =3D=3D ibiaddr)
                   ^
   drivers/i3c/master/svc-i3c-master.c:259:2: note: Loop condition is true.=
  Entering loop body
           for (i =3D 0; i < SVC_I3C_MAX_DEVS; i++)
           ^
   drivers/i3c/master/svc-i3c-master.c:260:7: note: Assuming the condition =
is false
                   if (master->addrs[i] =3D=3D ibiaddr)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/i3c/master/svc-i3c-master.c:260:3: note: Taking false branch
                   if (master->addrs[i] =3D=3D ibiaddr)
                   ^
   drivers/i3c/master/svc-i3c-master.c:259:36: note: The value 2 is assigne=
d to 'i'
           for (i =3D 0; i < SVC_I3C_MAX_DEVS; i++)
                                             ^~~
   drivers/i3c/master/svc-i3c-master.c:259:2: note: Loop condition is true.=
  Entering loop body
           for (i =3D 0; i < SVC_I3C_MAX_DEVS; i++)
           ^
   drivers/i3c/master/svc-i3c-master.c:260:7: note: Assuming the condition =
is true
                   if (master->addrs[i] =3D=3D ibiaddr)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/i3c/master/svc-i3c-master.c:260:3: note: Taking true branch
                   if (master->addrs[i] =3D=3D ibiaddr)
                   ^
   drivers/i3c/master/svc-i3c-master.c:261:4: note:  Execution continues on=
 line 263
                           break;
                           ^
   drivers/i3c/master/svc-i3c-master.c:263:6: note: 'i' is not equal to SVC=
_I3C_MAX_DEVS
           if (i =3D=3D SVC_I3C_MAX_DEVS)
               ^
   drivers/i3c/master/svc-i3c-master.c:263:2: note: Taking false branch
           if (i =3D=3D SVC_I3C_MAX_DEVS)
           ^
   drivers/i3c/master/svc-i3c-master.c:266:2: note: Returning without writi=
ng to 'master->ibi.tbq_slot', which participates in a condition later
           return master->descs[i];
           ^
   drivers/i3c/master/svc-i3c-master.c:266:2: note: Returning pointer
           return master->descs[i];
           ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/i3c/master/svc-i3c-master.c:371:9: note: Returning from 'svc_i3c=
_master_dev_from_addr'
                   dev =3D svc_i3c_master_dev_from_addr(master, ibiaddr);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/i3c/master/svc-i3c-master.c:371:3: note: Value assigned to 'dev'
                   dev =3D svc_i3c_master_dev_from_addr(master, ibiaddr);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/i3c/master/svc-i3c-master.c:372:7: note: Assuming 'dev' is null
                   if (!dev)
                       ^~~~
   drivers/i3c/master/svc-i3c-master.c:372:3: note: Taking true branch
                   if (!dev)
                   ^
   drivers/i3c/master/svc-i3c-master.c:373:4: note: Calling 'svc_i3c_master=
_nack_ibi'
                           svc_i3c_master_nack_ibi(master);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/i3c/master/svc-i3c-master.c:337:1: note: Returning without writi=
ng to 'master->ibi.tbq_slot', which participates in a condition later
   }
   ^
   drivers/i3c/master/svc-i3c-master.c:373:4: note: Returning from 'svc_i3c=
_master_nack_ibi'
                           svc_i3c_master_nack_ibi(master);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/i3c/master/svc-i3c-master.c:376:3: note:  Execution continues on=
 line 392
                   break;
                   ^
   drivers/i3c/master/svc-i3c-master.c:392:6: note: Assuming the condition =
is true
           if (svc_i3c_master_error(master)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/i3c/master/svc-i3c-master.c:392:2: note: Taking true branch
           if (svc_i3c_master_error(master)) {
           ^
   drivers/i3c/master/svc-i3c-master.c:393:7: note: Assuming field 'tbq_slo=
t' is non-null
                   if (master->ibi.tbq_slot) {
                       ^~~~~~~~~~~~~~~~~~~~
   drivers/i3c/master/svc-i3c-master.c:393:3: note: Taking true branch
                   if (master->ibi.tbq_slot) {
                   ^
   drivers/i3c/master/svc-i3c-master.c:394:35: note: Passing null pointer v=
alue via 1st parameter 'dev'
                           data =3D i3c_dev_get_master_data(dev);
                                                          ^~~
   drivers/i3c/master/svc-i3c-master.c:394:11: note: Calling 'i3c_dev_get_m=
aster_data'
                           data =3D i3c_dev_get_master_data(dev);
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/i3c/master.h:557:9: note: Dereference of null pointer
           return dev->common.master_priv;
                  ^~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.
>> drivers/cxl/acpi.c:25:17: warning: Value stored to 'dev' during its init=
ialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D ctx->dev;
                          ^~~   ~~~~~~~~
   drivers/cxl/acpi.c:25:17: note: Value stored to 'dev' during its initial=
ization is never read
           struct device *dev =3D ctx->dev;
                          ^~~   ~~~~~~~~
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   drivers/dma-buf/dma-resv.c:507:26: warning: Array access (from variable =
'shared') results in a null pointer dereference [clang-analyzer-core.NullDe=
reference]
                   shared[shared_count++] =3D fence_excl;
                   ~~~~~~                 ^
   drivers/dma-buf/dma-resv.c:437:2: note: 'shared' initialized to a null p=
ointer value
           struct dma_fence **shared =3D NULL;
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma-buf/dma-resv.c:450:9: note: Loop condition is false. Executi=
on continues on line 450
                   seq =3D read_seqcount_begin(&obj->seq);
                         ^
   include/linux/seqlock.h:363:2: note: expanded from macro 'read_seqcount_=
begin'
           raw_read_seqcount_begin(s);                                     \
           ^
   include/linux/seqlock.h:348:18: note: expanded from macro 'raw_read_seqc=
ount_begin'
           unsigned _seq =3D __read_seqcount_begin(s);                     =
  \
                           ^
   include/linux/seqlock.h:333:2: note: expanded from macro '__read_seqcoun=
t_begin'
           while ((__seq =3D seqprop_sequence(s)) & 1)                     =
  \
           ^
   drivers/dma-buf/dma-resv.c:452:16: note: Left side of '||' is false
                   fence_excl =3D rcu_dereference(obj->fence_excl);
                                ^
   include/linux/rcupdate.h:572:28: note: expanded from macro 'rcu_derefere=
nce'
   #define rcu_dereference(p) rcu_dereference_check(p, 0)
                              ^
   include/linux/rcupdate.h:514:2: note: expanded from macro 'rcu_dereferen=
ce_check'
           __rcu_dereference_check((p), (c) || rcu_read_lock_held(), __rcu)
           ^
   include/linux/rcupdate.h:375:48: note: expanded from macro '__rcu_derefe=
rence_check'
           typeof(*p) *________p1 =3D (typeof(*p) *__force)READ_ONCE(p); \
                                                         ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:290:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   drivers/dma-buf/dma-resv.c:452:16: note: Left side of '||' is false
                   fence_excl =3D rcu_dereference(obj->fence_excl);
                                ^
   include/linux/rcupdate.h:572:28: note: expanded from macro 'rcu_derefere=
nce'
   #define rcu_dereference(p) rcu_dereference_check(p, 0)
                              ^
   include/linux/rcupdate.h:514:2: note: expanded from macro 'rcu_dereferen=
ce_check'
           __rcu_dereference_check((p), (c) || rcu_read_lock_held(), __rcu)
           ^
   include/linux/rcupdate.h:375:48: note: expanded from macro '__rcu_derefe=
rence_check'
           typeof(*p) *________p1 =3D (typeof(*p) *__force)READ_ONCE(p); \
                                                         ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:290:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   drivers/dma-buf/dma-resv.c:452:16: note: Left side of '||' is false
                   fence_excl =3D rcu_dereference(obj->fence_excl);
                                ^
   include/linux/rcupdate.h:572:28: note: expanded from macro 'rcu_derefere=
nce'
   #define rcu_dereference(p) rcu_dereference_check(p, 0)
                              ^
   include/linux/rcupdate.h:514:2: note: expanded from macro 'rcu_dereferen=
ce_check'
           __rcu_dereference_check((p), (c) || rcu_read_lock_held(), __rcu)
           ^
   include/linux/rcupdate.h:375:48: note: expanded from macro '__rcu_derefe=
rence_check'
           typeof(*p) *________p1 =3D (typeof(*p) *__force)READ_ONCE(p); \
                                                         ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:290:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   drivers/dma-buf/dma-resv.c:452:16: note: Left side of '||' is true
                   fence_excl =3D rcu_dereference(obj->fence_excl);
                                ^
   include/linux/rcupdate.h:572:28: note: expanded from macro 'rcu_derefere=
nce'
   #define rcu_dereference(p) rcu_dereference_check(p, 0)
                              ^
   include/linux/rcupdate.h:514:2: note: expanded from macro 'rcu_dereferen=
ce_check'
           __rcu_dereference_check((p), (c) || rcu_read_lock_held(), __rcu)
           ^
   include/linux/rcupdate.h:375:48: note: expanded from macro '__rcu_derefe=
rence_check'

vim +/dev +25 drivers/cxl/acpi.c

3b94ce7b7bc1b4 Dan Williams 2021-06-09  18  =

3b94ce7b7bc1b4 Dan Williams 2021-06-09  19  static int match_add_root_ports=
(struct pci_dev *pdev, void *data)
3b94ce7b7bc1b4 Dan Williams 2021-06-09  20  {
3b94ce7b7bc1b4 Dan Williams 2021-06-09  21  	struct cxl_walk_context *ctx =
=3D data;
3b94ce7b7bc1b4 Dan Williams 2021-06-09  22  	struct pci_bus *root_bus =3D c=
tx->root;
3b94ce7b7bc1b4 Dan Williams 2021-06-09  23  	struct cxl_port *port =3D ctx-=
>port;
3b94ce7b7bc1b4 Dan Williams 2021-06-09  24  	int type =3D pci_pcie_type(pde=
v);
3b94ce7b7bc1b4 Dan Williams 2021-06-09 @25  	struct device *dev =3D ctx->de=
v;
3b94ce7b7bc1b4 Dan Williams 2021-06-09  26  	u32 lnkcap, port_num;
3b94ce7b7bc1b4 Dan Williams 2021-06-09  27  	int rc;
3b94ce7b7bc1b4 Dan Williams 2021-06-09  28  =

3b94ce7b7bc1b4 Dan Williams 2021-06-09  29  	if (pdev->bus !=3D root_bus)
3b94ce7b7bc1b4 Dan Williams 2021-06-09  30  		return 0;
3b94ce7b7bc1b4 Dan Williams 2021-06-09  31  	if (!pci_is_pcie(pdev))
3b94ce7b7bc1b4 Dan Williams 2021-06-09  32  		return 0;
3b94ce7b7bc1b4 Dan Williams 2021-06-09  33  	if (type !=3D PCI_EXP_TYPE_ROO=
T_PORT)
3b94ce7b7bc1b4 Dan Williams 2021-06-09  34  		return 0;
3b94ce7b7bc1b4 Dan Williams 2021-06-09  35  	if (pci_read_config_dword(pdev=
, pci_pcie_cap(pdev) + PCI_EXP_LNKCAP,
3b94ce7b7bc1b4 Dan Williams 2021-06-09  36  				  &lnkcap) !=3D PCIBIOS_SUC=
CESSFUL)
3b94ce7b7bc1b4 Dan Williams 2021-06-09  37  		return 0;
3b94ce7b7bc1b4 Dan Williams 2021-06-09  38  =

3b94ce7b7bc1b4 Dan Williams 2021-06-09  39  	/* TODO walk DVSEC to find com=
ponent register base */
3b94ce7b7bc1b4 Dan Williams 2021-06-09  40  	port_num =3D FIELD_GET(PCI_EXP=
_LNKCAP_PN, lnkcap);
3b94ce7b7bc1b4 Dan Williams 2021-06-09  41  	rc =3D cxl_add_dport(port, &pd=
ev->dev, port_num, CXL_RESOURCE_NONE);
3b94ce7b7bc1b4 Dan Williams 2021-06-09  42  	if (rc) {
3b94ce7b7bc1b4 Dan Williams 2021-06-09  43  		ctx->error =3D rc;
3b94ce7b7bc1b4 Dan Williams 2021-06-09  44  		return rc;
3b94ce7b7bc1b4 Dan Williams 2021-06-09  45  	}
3b94ce7b7bc1b4 Dan Williams 2021-06-09  46  	ctx->count++;
3b94ce7b7bc1b4 Dan Williams 2021-06-09  47  =

3b94ce7b7bc1b4 Dan Williams 2021-06-09  48  	dev_dbg(dev, "add dport%d: %s\=
n", port_num, dev_name(&pdev->dev));
3b94ce7b7bc1b4 Dan Williams 2021-06-09  49  =

3b94ce7b7bc1b4 Dan Williams 2021-06-09  50  	return 0;
3b94ce7b7bc1b4 Dan Williams 2021-06-09  51  }
3b94ce7b7bc1b4 Dan Williams 2021-06-09  52  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4967923931929526141==--

