Content-Type: multipart/mixed; boundary="===============8455870376220585492=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [pci:pci/enumeration 1/1] drivers/pci/access.c:209:17: sparse: sparse: context imbalance in 'pci_wait_cfg' - unexpected unlock
Date: Tue, 30 Jun 2020 13:08:40 +0800
Message-ID: <202006301333.uxRTaFBe%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8455870376220585492==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-pci(a)vger.kernel.org
TO: Bjorn Helgaas <helgaas@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci.git pci=
/enumeration
head:   9062dcba53dd1dcfa32e4c1970acdf33660a2cdf
commit: 9062dcba53dd1dcfa32e4c1970acdf33660a2cdf [1/1] PCI: Fix locking of =
pci_cfg_wait queue
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: i386-randconfig-s002-20200630 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-13) 9.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.2-3-gfa153962-dirty
        git checkout 9062dcba53dd1dcfa32e4c1970acdf33660a2cdf
        # save the attached .config to linux build tree
        make W=3D1 C=3D CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=
=3Di386 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

   drivers/char/ipmi/ipmi_msghandler.c:210:17: sparse: sparse: incompatible=
 types in comparison expression (different address spaces):
   drivers/char/ipmi/ipmi_msghandler.c:210:17: sparse:    struct ipmi_user =
[noderef] <asn:4> *
   drivers/char/ipmi/ipmi_msghandler.c:210:17: sparse:    struct ipmi_user *
   drivers/char/ipmi/ipmi_msghandler.c:1223:9: sparse: sparse: incompatible=
 types in comparison expression (different address spaces):
   drivers/char/ipmi/ipmi_msghandler.c:1223:9: sparse:    struct ipmi_user =
[noderef] <asn:4> *
   drivers/char/ipmi/ipmi_msghandler.c:1223:9: sparse:    struct ipmi_user *
   drivers/char/ipmi/ipmi_msghandler.c:1292:9: sparse: sparse: incompatible=
 types in comparison expression (different address spaces):
   drivers/char/ipmi/ipmi_msghandler.c:1292:9: sparse:    struct ipmi_user =
[noderef] <asn:4> *
   drivers/char/ipmi/ipmi_msghandler.c:1292:9: sparse:    struct ipmi_user *
   drivers/char/ipmi/ipmi_msghandler.c:3597:25: sparse: sparse: cast remove=
s address space '<asn:4>' of expression
   drivers/char/ipmi/ipmi_msghandler.c:204:25: sparse: sparse: context imba=
lance in 'acquire_ipmi_user' - different lock contexts for basic block
   include/linux/srcu.h:179:9: sparse: sparse: context imbalance in 'releas=
e_ipmi_user' - unexpected unlock
   drivers/char/ipmi/ipmi_msghandler.c:893:16: sparse: sparse: context imba=
lance in 'deliver_response' - different lock contexts for basic block
   drivers/char/ipmi/ipmi_msghandler.c:1275:13: sparse: sparse: context imb=
alance in '_ipmi_destroy_user' - wrong count at exit
>> drivers/pci/access.c:209:17: sparse: sparse: context imbalance in 'pci_w=
ait_cfg' - unexpected unlock
   drivers/char/ipmi/ipmi_msghandler.c:1357:5: sparse: sparse: context imba=
lance in 'ipmi_get_version' - wrong count at exit
   drivers/char/ipmi/ipmi_msghandler.c:1379:5: sparse: sparse: context imba=
lance in 'ipmi_set_my_address' - wrong count at exit
   drivers/char/ipmi/ipmi_msghandler.c:1401:5: sparse: sparse: context imba=
lance in 'ipmi_get_my_address' - wrong count at exit
   drivers/char/ipmi/ipmi_msghandler.c:1423:5: sparse: sparse: context imba=
lance in 'ipmi_set_my_LUN' - wrong count at exit
   drivers/char/ipmi/ipmi_msghandler.c:1445:5: sparse: sparse: context imba=
lance in 'ipmi_get_my_LUN' - wrong count at exit
   drivers/char/ipmi/ipmi_msghandler.c:1467:5: sparse: sparse: context imba=
lance in 'ipmi_get_maintenance_mode' - wrong count at exit
   drivers/char/ipmi/ipmi_msghandler.c:1492:5: sparse: sparse: context imba=
lance in 'ipmi_set_maintenance_mode' - wrong count at exit
   drivers/char/ipmi/ipmi_msghandler.c:1534:5: sparse: sparse: context imba=
lance in 'ipmi_set_gets_events' - wrong count at exit
   drivers/char/ipmi/ipmi_msghandler.c:1631:5: sparse: sparse: context imba=
lance in 'ipmi_register_for_cmd' - wrong count at exit
   drivers/char/ipmi/ipmi_msghandler.c:1676:5: sparse: sparse: context imba=
lance in 'ipmi_unregister_for_cmd' - wrong count at exit
   drivers/char/ipmi/ipmi_msghandler.c:1840:39: sparse: sparse: context imb=
alance in 'smi_send' - unexpected unlock
   drivers/char/ipmi/ipmi_msghandler.c:2288:5: sparse: sparse: context imba=
lance in 'ipmi_request_settime' - wrong count at exit
   drivers/char/ipmi/ipmi_msghandler.c:2327:5: sparse: sparse: context imba=
lance in 'ipmi_request_supply_msgs' - wrong count at exit
   drivers/pci/endpoint/functions/pci-epf-test.c:288:24: sparse: sparse: in=
correct type in argument 1 (different address spaces) @@     expected void =
*p @@     got void [noderef] <asn:2> *[assigned] dst_addr @@
   drivers/pci/endpoint/functions/pci-epf-test.c:288:24: sparse:     expect=
ed void *p
   drivers/pci/endpoint/functions/pci-epf-test.c:288:24: sparse:     got vo=
id [noderef] <asn:2> *[assigned] dst_addr
   drivers/pci/endpoint/functions/pci-epf-test.c:288:34: sparse: sparse: in=
correct type in argument 2 (different address spaces) @@     expected void =
const *q @@     got void [noderef] <asn:2> *[assigned] src_addr @@
   drivers/pci/endpoint/functions/pci-epf-test.c:288:34: sparse:     expect=
ed void const *q
   drivers/pci/endpoint/functions/pci-epf-test.c:288:34: sparse:     got vo=
id [noderef] <asn:2> *[assigned] src_addr
   drivers/char/ipmi/ipmi_msghandler.c:4452:39: sparse: sparse: context imb=
alance in 'handle_new_recv_msgs' - unexpected unlock
   drivers/char/ipmi/ipmi_msghandler.c:4509:9: sparse: sparse: context imba=
lance in 'smi_recv_tasklet' - different lock contexts for basic block
   drivers/char/ipmi/ipmi_msghandler.c:4544:39: sparse: sparse: context imb=
alance in 'ipmi_smi_msg_received' - unexpected unlock
   drivers/char/ipmi/ipmi_msghandler.c:4640:39: sparse: sparse: context imb=
alance in 'check_msg_timeout' - unexpected unlock
   drivers/pnp/pnpbios/core.c: In function 'pnp_dock_event':
   drivers/acpi/apei/apei-base.c:758:12: warning: no previous prototype for=
 'arch_apei_enable_cmcff' [-Wmissing-prototypes]
     758 | int __weak arch_apei_enable_cmcff(struct acpi_hest_header *hest_=
hdr,
         |            ^~~~~~~~~~~~~~~~~~~~~~
   drivers/acpi/apei/apei-base.c:765:13: warning: no previous prototype for=
 'arch_apei_report_mem_error' [-Wmissing-prototypes]
     765 | void __weak arch_apei_report_mem_error(int sev,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pnp/pnpbios/core.c:90:13: warning: variable 'value' set but not =
used [-Wunused-but-set-variable]
      90 |  int i =3D 0, value;
         |             ^~~~~
   drivers/acpi/apei/erst.c:272:13: sparse: sparse: incorrect type in assig=
nment (different address spaces) @@     expected void *src @@     got void =
[noderef] <asn:2> * @@
   drivers/acpi/apei/erst.c:272:13: sparse:     expected void *src
   drivers/acpi/apei/erst.c:272:13: sparse:     got void [noderef] <asn:2> *
   drivers/acpi/apei/erst.c:275:13: sparse: sparse: incorrect type in assig=
nment (different address spaces) @@     expected void *dst @@     got void =
[noderef] <asn:2> * @@
   drivers/acpi/apei/erst.c:275:13: sparse:     expected void *dst
   drivers/acpi/apei/erst.c:275:13: sparse:     got void [noderef] <asn:2> *
   drivers/acpi/apei/erst.c:277:25: sparse: sparse: incorrect type in argum=
ent 1 (different address spaces) @@     expected void volatile [noderef] <a=
sn:2> *addr @@     got void *src @@
   drivers/acpi/apei/erst.c:277:25: sparse:     expected void volatile [nod=
eref] <asn:2> *addr
   drivers/acpi/apei/erst.c:277:25: sparse:     got void *src
   drivers/acpi/apei/erst.c:283:17: sparse: sparse: incorrect type in argum=
ent 1 (different address spaces) @@     expected void volatile [noderef] <a=
sn:2> *addr @@     got void *src @@
   drivers/acpi/apei/erst.c:283:17: sparse:     expected void volatile [nod=
eref] <asn:2> *addr
   drivers/acpi/apei/erst.c:283:17: sparse:     got void *src
   drivers/acpi/apei/erst.c:284:17: sparse: sparse: incorrect type in argum=
ent 1 (different address spaces) @@     expected void volatile [noderef] <a=
sn:2> *addr @@     got void *dst @@
   drivers/acpi/apei/erst.c:284:17: sparse:     expected void volatile [nod=
eref] <asn:2> *addr
   drivers/acpi/apei/erst.c:284:17: sparse:     got void *dst
   drivers/acpi/apei/erst.c:792:27: sparse: sparse: incorrect type in argum=
ent 1 (different address spaces) @@     expected void *p @@     got void [n=
oderef] <asn:2> *static [toplevel] vaddr @@
   drivers/acpi/apei/erst.c:792:27: sparse:     expected void *p
   drivers/acpi/apei/erst.c:792:27: sparse:     got void [noderef] <asn:2> =
*static [toplevel] vaddr
   drivers/acpi/apei/erst.c:793:20: sparse: sparse: incorrect type in assig=
nment (different address spaces) @@     expected struct cper_record_header =
*rcd_erange @@     got void [noderef] <asn:2> *static [toplevel] vaddr @@
   drivers/acpi/apei/erst.c:793:20: sparse:     expected struct cper_record=
_header *rcd_erange
   drivers/acpi/apei/erst.c:793:20: sparse:     got void [noderef] <asn:2> =
*static [toplevel] vaddr
   drivers/acpi/apei/erst.c:830:17: sparse: sparse: incorrect type in assig=
nment (different address spaces) @@     expected struct cper_record_header =
*rcd_tmp @@     got void [noderef] <asn:2> * @@
   drivers/acpi/apei/erst.c:830:17: sparse:     expected struct cper_record=
_header *rcd_tmp
   drivers/acpi/apei/erst.c:830:17: sparse:     got void [noderef] <asn:2> *
   drivers/acpi/apei/bert.c:134:27: sparse: sparse: incorrect type in assig=
nment (different address spaces) @@     expected struct acpi_bert_region *b=
oot_error_region @@     got void [noderef] <asn:2> * @@
   drivers/acpi/apei/bert.c:134:27: sparse:     expected struct acpi_bert_r=
egion *boot_error_region
   drivers/acpi/apei/bert.c:134:27: sparse:     got void [noderef] <asn:2> *
   drivers/acpi/apei/bert.c:137:25: sparse: sparse: incorrect type in argum=
ent 1 (different address spaces) @@     expected void volatile [noderef] <a=
sn:2> *addr @@     got struct acpi_bert_region *boot_error_region @@
   drivers/acpi/apei/bert.c:137:25: sparse:     expected void volatile [nod=
eref] <asn:2> *addr
   drivers/acpi/apei/bert.c:137:25: sparse:     got struct acpi_bert_region=
 *boot_error_region
   drivers/pnp/pnpbios/bioscalls.c:63:43: sparse: sparse: cast truncates bi=
ts from constant value (c0000400 becomes 400)
   drivers/sfi/sfi_core.c:105:32: sparse: sparse: incorrect type in return =
expression (different address spaces) @@     expected void [noderef] <asn:2=
> * @@     got void * @@
   drivers/sfi/sfi_core.c:105:32: sparse:     expected void [noderef] <asn:=
2> *
   drivers/sfi/sfi_core.c:105:32: sparse:     got void *
   drivers/sfi/sfi_core.c:107:38: sparse: sparse: incorrect type in return =
expression (different address spaces) @@     expected void [noderef] <asn:2=
> * @@     got void * @@
   drivers/sfi/sfi_core.c:107:38: sparse:     expected void [noderef] <asn:=
2> *
   drivers/sfi/sfi_core.c:107:38: sparse:     got void *
   drivers/sfi/sfi_core.c:116:26: sparse: sparse: incorrect type in argumen=
t 1 (different address spaces) @@     expected void *addr @@     got void [=
noderef] <asn:2> *virt @@
   drivers/sfi/sfi_core.c:116:26: sparse:     expected void *addr
   drivers/sfi/sfi_core.c:116:26: sparse:     got void [noderef] <asn:2> *v=
irt
   drivers/sfi/sfi_core.c:118:32: sparse: sparse: incorrect type in argumen=
t 1 (different address spaces) @@     expected void *addr @@     got void [=
noderef] <asn:2> *virt @@
   drivers/sfi/sfi_core.c:118:32: sparse:     expected void *addr
   drivers/sfi/sfi_core.c:118:32: sparse:     got void [noderef] <asn:2> *v=
irt
   drivers/sfi/sfi_core.c:171:20: sparse: sparse: incorrect type in assignm=
ent (different address spaces) @@     expected struct sfi_table_header *th =
@@     got void [noderef] <asn:2> * @@
   drivers/sfi/sfi_core.c:171:20: sparse:     expected struct sfi_table_hea=
der *th
   drivers/sfi/sfi_core.c:171:20: sparse:     got void [noderef] <asn:2> *
   drivers/sfi/sfi_core.c:182:34: sparse: sparse: incorrect type in argumen=
t 1 (different address spaces) @@     expected void [noderef] <asn:2> *virt=
 @@     got struct sfi_table_header *[assigned] th @@
   drivers/sfi/sfi_core.c:182:34: sparse:     expected void [noderef] <asn:=
2> *virt
   drivers/sfi/sfi_core.c:182:34: sparse:     got struct sfi_table_header *=
[assigned] th
   drivers/sfi/sfi_core.c:184:30: sparse: sparse: incorrect type in return =
expression (different address spaces) @@     expected struct sfi_table_head=
er * @@     got void [noderef] <asn:2> * @@
   drivers/sfi/sfi_core.c:184:30: sparse:     expected struct sfi_table_hea=
der *
   drivers/sfi/sfi_core.c:184:30: sparse:     got void [noderef] <asn:2> *
   drivers/sfi/sfi_core.c:196:34: sparse: sparse: incorrect type in argumen=
t 1 (different address spaces) @@     expected void [noderef] <asn:2> *virt=
 @@     got struct sfi_table_header *th @@
   drivers/sfi/sfi_core.c:196:34: sparse:     expected void [noderef] <asn:=
2> *virt
   drivers/sfi/sfi_core.c:196:34: sparse:     got struct sfi_table_header *=
th
   drivers/sfi/sfi_core.c:318:17: sparse: sparse: incorrect type in assignm=
ent (different address spaces) @@     expected struct sfi_table_simple *sta=
tic [toplevel] syst_va @@     got void [noderef] <asn:2> * @@
   drivers/sfi/sfi_core.c:318:17: sparse:     expected struct sfi_table_sim=
ple *static [toplevel] syst_va
   drivers/sfi/sfi_core.c:318:17: sparse:     got void [noderef] <asn:2> *
   drivers/sfi/sfi_core.c:347:15: sparse: sparse: incorrect type in assignm=
ent (different address spaces) @@     expected void *start @@     got void =
[noderef] <asn:2> * @@
   drivers/sfi/sfi_core.c:347:15: sparse:     expected void *start
   drivers/sfi/sfi_core.c:347:15: sparse:     got void [noderef] <asn:2> *
   drivers/sfi/sfi_core.c:379:34: sparse: sparse: incorrect type in argumen=
t 1 (different address spaces) @@     expected void [noderef] <asn:2> *virt=
 @@     got void *start @@
   drivers/sfi/sfi_core.c:379:34: sparse:     expected void [noderef] <asn:=
2> *virt
   drivers/sfi/sfi_core.c:379:34: sparse:     got void *start
   drivers/sfi/sfi_core.c:383:26: sparse: sparse: incorrect type in argumen=
t 1 (different address spaces) @@     expected void [noderef] <asn:2> *virt=
 @@     got void *start @@
   drivers/sfi/sfi_core.c:383:26: sparse:     expected void [noderef] <asn:=
2> *virt
--
>> drivers/pci/access.c:209:17: sparse: sparse: context imbalance in 'pci_w=
ait_cfg' - unexpected unlock
   drivers/pci/endpoint/functions/pci-epf-test.c:288:24: sparse: sparse: in=
correct type in argument 1 (different address spaces) @@     expected void =
*p @@     got void [noderef] <asn:2> *[assigned] dst_addr @@
   drivers/pci/endpoint/functions/pci-epf-test.c:288:24: sparse:     expect=
ed void *p
   drivers/pci/endpoint/functions/pci-epf-test.c:288:24: sparse:     got vo=
id [noderef] <asn:2> *[assigned] dst_addr
   drivers/pci/endpoint/functions/pci-epf-test.c:288:34: sparse: sparse: in=
correct type in argument 2 (different address spaces) @@     expected void =
const *q @@     got void [noderef] <asn:2> *[assigned] src_addr @@
   drivers/pci/endpoint/functions/pci-epf-test.c:288:34: sparse:     expect=
ed void const *q
   drivers/pci/endpoint/functions/pci-epf-test.c:288:34: sparse:     got vo=
id [noderef] <asn:2> *[assigned] src_addr
   drivers/pci/endpoint/functions/pci-epf-test.c:189: warning: Function par=
ameter or member 'epf_test' not described in 'pci_epf_test_clean_dma_chan'
   drivers/pci/endpoint/functions/pci-epf-test.c:189: warning: Excess funct=
ion parameter 'epf' description in 'pci_epf_test_clean_dma_chan'
   include/linux/pci-ep-cfs.h:22:16: sparse: sparse: Using plain integer as=
 NULL pointer
   drivers/pci/endpoint/pci-epc-core.c:18: warning: cannot understand funct=
ion prototype: 'struct class *pci_epc_class; '
   include/linux/pci-ep-cfs.h:31:16: sparse: sparse: Using plain integer as=
 NULL pointer
   drivers/pci/hotplug/acpi_pcihp.c:69: warning: Function parameter or memb=
er 'pdev' not described in 'acpi_get_hp_hw_control_from_firmware'
   drivers/pci/hotplug/acpi_pcihp.c:69: warning: Excess function parameter =
'dev' description in 'acpi_get_hp_hw_control_from_firmware'
   drivers/pci/hotplug/acpi_pcihp.c:199: warning: Function parameter or mem=
ber 'handle' not described in 'acpi_pci_detect_ejectable'
   drivers/pci/endpoint/pci-epc-mem.c:16: warning: Incorrect use of kernel-=
doc format:  * pci_epc_mem_get_order() - determine the allocation order of =
a memory size
   drivers/pci/endpoint/pci-epc-mem.c:24: warning: Function parameter or me=
mber 'mem' not described in 'pci_epc_mem_get_order'
   drivers/pci/endpoint/pci-epc-mem.c:24: warning: Function parameter or me=
mber 'size' not described in 'pci_epc_mem_get_order'
   drivers/pci/endpoint/pci-epf-core.c:18: warning: Function parameter or m=
ember 'pci_epf_mutex' not described in 'DEFINE_MUTEX'
   drivers/pci/endpoint/pci-epf-core.c:80: warning: Function parameter or m=
ember 'epf' not described in 'pci_epf_free_space'
   drivers/pci/endpoint/pci-epf-core.c:107: warning: Function parameter or =
member 'epf' not described in 'pci_epf_alloc_space'
   drivers/pci/pci-driver.c:494:42: sparse: sparse: restricted pci_power_t =
degrades to integer
   drivers/pci/pci-driver.c:494:61: sparse: sparse: restricted pci_power_t =
degrades to integer
   drivers/pci/pci.c:877:13: sparse: sparse: restricted pci_power_t degrade=
s to integer
   drivers/pci/pci.c:877:21: sparse: sparse: restricted pci_power_t degrade=
s to integer
   drivers/pci/pci.c:877:31: sparse: sparse: restricted pci_power_t degrade=
s to integer
   drivers/pci/pci.c:877:39: sparse: sparse: restricted pci_power_t degrade=
s to integer
   drivers/pci/pci.c:886:35: sparse: sparse: restricted pci_power_t degrade=
s to integer
   drivers/pci/pci.c:886:54: sparse: sparse: restricted pci_power_t degrade=
s to integer
   drivers/pci/pci.c:887:19: sparse: sparse: restricted pci_power_t degrade=
s to integer
   drivers/pci/pci.c:887:37: sparse: sparse: restricted pci_power_t degrade=
s to integer
   drivers/pci/pci.c:917:23: sparse: sparse: invalid assignment: |=3D
   drivers/pci/pci.c:917:23: sparse:    left side has type unsigned short
   drivers/pci/pci.c:917:23: sparse:    right side has type restricted pci_=
power_t
   drivers/pci/pci.c:922:57: sparse: sparse: restricted pci_power_t degrade=
s to integer
   drivers/pci/pci.c:944:28: sparse: sparse: incorrect type in assignment (=
different base types) @@     expected restricted pci_power_t [usertype] cur=
rent_state @@     got int @@
   drivers/pci/pci.c:944:28: sparse:     expected restricted pci_power_t [u=
sertype] current_state
   drivers/pci/pci.c:944:28: sparse:     got int
   drivers/pci/pci.c:993:36: sparse: sparse: incorrect type in assignment (=
different base types) @@     expected restricted pci_power_t [usertype] cur=
rent_state @@     got int @@
   drivers/pci/pci.c:993:36: sparse:     expected restricted pci_power_t [u=
sertype] current_state
   drivers/pci/pci.c:993:36: sparse:     got int
   drivers/pci/pci.c:1171:13: sparse: sparse: restricted pci_power_t degrad=
es to integer
   drivers/pci/pci.c:1171:21: sparse: sparse: restricted pci_power_t degrad=
es to integer
   drivers/pci/pci.c:1173:18: sparse: sparse: restricted pci_power_t degrad=
es to integer
   drivers/pci/pci.c:1173:26: sparse: sparse: restricted pci_power_t degrad=
es to integer
   drivers/pci/pci.c:1196:13: sparse: sparse: restricted pci_power_t degrad=
es to integer
   drivers/pci/pci.c:1196:22: sparse: sparse: restricted pci_power_t degrad=
es to integer
   drivers/pci/pci.c:1203:46: sparse: sparse: restricted pci_power_t degrad=
es to integer
   drivers/pci/pci.c:1203:54: sparse: sparse: restricted pci_power_t degrad=
es to integer
   drivers/pci/pci.c:1746:36: sparse: sparse: incorrect type in assignment =
(different base types) @@     expected restricted pci_power_t [usertype] cu=
rrent_state @@     got int @@
   drivers/pci/pci.c:1746:36: sparse:     expected restricted pci_power_t [=
usertype] current_state
   drivers/pci/pci.c:1746:36: sparse:     got int
   drivers/pci/pci.c:2134:44: sparse: sparse: restricted pci_power_t degrad=
es to integer
   drivers/pci/pci.c:2435:61: sparse: sparse: restricted pci_power_t degrad=
es to integer
   drivers/pci/pci.c:2436:45: sparse: sparse: restricted pci_power_t degrad=
es to integer
   drivers/pci/pci.c:2602:20: sparse: sparse: restricted pci_power_t degrad=
es to integer
   drivers/pci/pci.c:2602:38: sparse: sparse: restricted pci_power_t degrad=
es to integer
   drivers/pci/pci.c:2625:49: sparse: sparse: restricted pci_power_t degrad=
es to integer
   drivers/pci/pci.c:2625:67: sparse: sparse: restricted pci_power_t degrad=
es to integer
   drivers/pci/pci.c:4625:13: sparse: sparse: invalid assignment: |=3D
   drivers/pci/pci.c:4625:13: sparse:    left side has type unsigned short
   drivers/pci/pci.c:4625:13: sparse:    right side has type restricted pci=
_power_t
   drivers/pci/pci.c:4630:13: sparse: sparse: invalid assignment: |=3D
   drivers/pci/pci.c:4630:13: sparse:    left side has type unsigned short
   drivers/pci/pci.c:4630:13: sparse:    right side has type restricted pci=
_power_t
   drivers/pci/vc.c:188: warning: Excess function parameter 'name' descript=
ion in 'pci_vc_do_save_buffer'
   drivers/pci/setup-bus.c:62: warning: Function parameter or member 'min_a=
lign' not described in 'add_to_list'
   drivers/pci/pci-acpi.c:1009:64: sparse: sparse: restricted pci_power_t d=
egrades to integer
   drivers/pci/pci-acpi.c:1013:17: sparse: sparse: restricted pci_power_t d=
egrades to integer
   drivers/pci/quirks.c:2287:57: sparse: sparse: restricted pci_power_t deg=
rades to integer
   drivers/pci/of.c:262: warning: Function parameter or member 'ib_resource=
s' not described in 'devm_of_pci_get_host_bridge_resources'
   drivers/pci/ats.c:196: warning: Function parameter or member 'pdev' not =
described in 'pci_enable_pri'
   drivers/pci/ats.c:196: warning: Function parameter or member 'reqs' not =
described in 'pci_enable_pri'
   drivers/pci/pci-pf-stub.c:20: warning: cannot understand function protot=
ype: 'const struct pci_device_id pci_pf_stub_whitelist[] =3D '
--
>> drivers/pci/access.c:209:17: sparse: sparse: context imbalance in 'pci_w=
ait_cfg' - unexpected unlock

# https://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci.git/commit/?i=
d=3D9062dcba53dd1dcfa32e4c1970acdf33660a2cdf
git remote add pci https://git.kernel.org/pub/scm/linux/kernel/git/helgaas/=
pci.git
git remote update pci
git checkout 9062dcba53dd1dcfa32e4c1970acdf33660a2cdf
vim +/pci_wait_cfg +209 drivers/pci/access.c

e04b0ea2e0f9c1 Brian King      2005-09-27  205  =

fb51ccbf217c1c Jan Kiszka      2011-11-04  206  static noinline void pci_wa=
it_cfg(struct pci_dev *dev)
7ea7e98fd8d023 Matthew Wilcox  2006-10-19  207  {
7ea7e98fd8d023 Matthew Wilcox  2006-10-19  208  	do {
511dd98ce8cf6d Thomas Gleixner 2010-02-17 @209  		raw_spin_unlock_irq(&pci_=
lock);
9062dcba53dd1d Bjorn Helgaas   2020-06-25  210  		wait_event(pci_cfg_wait, =
!dev->block_cfg_access);
511dd98ce8cf6d Thomas Gleixner 2010-02-17  211  		raw_spin_lock_irq(&pci_lo=
ck);
fb51ccbf217c1c Jan Kiszka      2011-11-04  212  	} while (dev->block_cfg_ac=
cess);
e04b0ea2e0f9c1 Brian King      2005-09-27  213  }
e04b0ea2e0f9c1 Brian King      2005-09-27  214  =


:::::: The code at line 209 was first introduced by commit
:::::: 511dd98ce8cf6dc4f8f2cb32a8af31ce9f4ba4a1 PCI: Convert pci_lock to ra=
w_spinlock

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Jesse Barnes <jbarnes@virtuousgeek.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============8455870376220585492==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============8455870376220585492==--

