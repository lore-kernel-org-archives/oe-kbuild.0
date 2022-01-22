Content-Type: multipart/mixed; boundary="===============5843091563649345829=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/scsi/lpfc/lpfc_ct.c:3955:2: warning: Value stored to 'size' is never read [clang-analyzer-deadcode.DeadStores]
Date: Sat, 22 Jan 2022 16:32:06 +0800
Message-ID: <202201221636.smRQbc1j-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5843091563649345829==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Gaurav Srivastava <gaurav.srivastava@broadcom.com>
CC: "Martin K. Petersen" <martin.petersen@oracle.com>
CC: Hannes Reinecke <hare@suse.de>
CC: James Smart <jsmart2021@gmail.com>
CC: Muneendra Kumar <muneendra.kumar@broadcom.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   9b57f458985742bd1c585f4c7f36d04634ce1143
commit: 742b0cf87a8f9219101d68a7b4c6317db057ac58 scsi: lpfc: vmid: Implemen=
t CT commands for appid
date:   8 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 8 months ago
config: arm-randconfig-c002-20220117 (https://download.01.org/0day-ci/archi=
ve/20220122/202201221636.smRQbc1j-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project c10cbb=
243cafc0cf42c3e922cb29183279444432)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D742b0cf87a8f9219101d68a7b4c6317db057ac58
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 742b0cf87a8f9219101d68a7b4c6317db057ac58
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
                                          ^
   include/linux/compiler.h:77:20: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:157:2: note: Taking true branch
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
           ^
   include/linux/uaccess.h:159:9: note: Calling 'raw_copy_from_user'
                   res =3D raw_copy_from_user(to, from, n);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/include/asm/uaccess.h:525:6: note: Value assigned to 'cmd.flags=
', which participates in a condition later
           n =3D arm_copy_from_user(to, from, n);
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/include/asm/uaccess.h:527:2: note: Returning value (loaded from=
 'n'), which participates in a condition later
           return n;
           ^~~~~~~~
   include/linux/uaccess.h:159:9: note: Returning from 'raw_copy_from_user'
                   res =3D raw_copy_from_user(to, from, n);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:161:6: note: Assuming 'res' is 0, which particip=
ates in a condition later
           if (unlikely(res))
               ^
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   include/linux/uaccess.h:161:2: note: Taking false branch
           if (unlikely(res))
           ^
   include/linux/uaccess.h:163:2: note: Returning zero (loaded from 'res'),=
 which participates in a condition later
           return res;
           ^~~~~~~~~~
   include/linux/uaccess.h:192:7: note: Returning from '_copy_from_user'
                   n =3D _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:193:2: note: Returning zero (loaded from 'n'), w=
hich participates in a condition later
           return n;
           ^~~~~~~~
   drivers/nvme/host/ioctl.c:191:6: note: Returning from 'copy_from_user'
           if (copy_from_user(&cmd, ucmd, sizeof(cmd)))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/host/ioctl.c:191:2: note: Taking false branch
           if (copy_from_user(&cmd, ucmd, sizeof(cmd)))
           ^
   drivers/nvme/host/ioctl.c:193:6: note: Assuming field 'flags' is 0
           if (cmd.flags)
               ^~~~~~~~~
   drivers/nvme/host/ioctl.c:193:2: note: Taking false branch
           if (cmd.flags)
           ^
   drivers/nvme/host/ioctl.c:195:6: note: 'ns' is null
           if (ns && cmd.nsid !=3D ns->head->ns_id) {
               ^~
   drivers/nvme/host/ioctl.c:195:9: note: Left side of '&&' is false
           if (ns && cmd.nsid !=3D ns->head->ns_id) {
                  ^
   drivers/nvme/host/ioctl.c:215:6: note: Assuming field 'timeout_ms' is 0
           if (cmd.timeout_ms)
               ^~~~~~~~~~~~~~
   drivers/nvme/host/ioctl.c:215:2: note: Taking false branch
           if (cmd.timeout_ms)
           ^
   drivers/nvme/host/ioctl.c:218:32: note: 'ns' is null
           status =3D nvme_submit_user_cmd(ns ? ns->queue : ctrl->admin_q, =
&c,
                                         ^~
   drivers/nvme/host/ioctl.c:218:32: note: '?' condition is false
   drivers/nvme/host/ioctl.c:218:11: note: Calling 'nvme_submit_user_cmd'
           status =3D nvme_submit_user_cmd(ns ? ns->queue : ctrl->admin_q, =
&c,
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/host/ioctl.c:63:30: note: Assuming 'ns' is null
           struct block_device *bdev =3D ns ? ns->disk->part0 : NULL;
                                       ^~
   drivers/nvme/host/ioctl.c:63:30: note: '?' condition is false
   drivers/nvme/host/ioctl.c:70:2: note: Taking true branch
           if (IS_ERR(req))
           ^
   drivers/nvme/host/ioctl.c:71:3: note: Returning without writing to '*res=
ult'
                   return PTR_ERR(req);
                   ^
   drivers/nvme/host/ioctl.c:218:11: note: Returning from 'nvme_submit_user=
_cmd'
           status =3D nvme_submit_user_cmd(ns ? ns->queue : ctrl->admin_q, =
&c,
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/host/ioctl.c:223:6: note: 'status' is >=3D 0
           if (status >=3D 0) {
               ^~~~~~
   drivers/nvme/host/ioctl.c:223:2: note: Taking true branch
           if (status >=3D 0) {
           ^
   drivers/nvme/host/ioctl.c:224:7: note: Assigned value is garbage or unde=
fined
                   if (put_user(result, &ucmd->result))
                       ^
   arch/arm/include/asm/uaccess.h:406:2: note: expanded from macro 'put_use=
r'
           __put_user_switch((x), (ptr), __pu_err, __put_user_check);      \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/include/asm/uaccess.h:389:3: note: expanded from macro '__put_u=
ser_switch'
                   __typeof__(*(ptr)) __pu_val =3D (x);                    =
  \
                   ^                             ~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
>> drivers/scsi/lpfc/lpfc_ct.c:3955:2: warning: Value stored to 'size' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           size =3D 0;
           ^      ~
   drivers/scsi/lpfc/lpfc_ct.c:3955:2: note: Value stored to 'size' is neve=
r read
           size =3D 0;
           ^      ~
   Suppressed 16 warnings (7 in non-user code, 9 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   21 warnings generated.
   drivers/scsi/lpfc/lpfc_els.c:4463:24: warning: Access to field 'virt' re=
sults in a dereference of a null pointer (loaded from variable 'buf_ptr') [=
clang-analyzer-core.NullDereference]
                   lpfc_mbuf_free(phba, buf_ptr->virt, buf_ptr->phys);
                                        ^
   drivers/scsi/lpfc/lpfc_els.c:10789:6: note: Assuming 'ndlp' is non-null
           if (!ndlp || ndlp->nlp_state !=3D NLP_STE_UNMAPPED_NODE)
               ^~~~~
   drivers/scsi/lpfc/lpfc_els.c:10789:6: note: Left side of '||' is false
   drivers/scsi/lpfc/lpfc_els.c:10789:15: note: Assuming field 'nlp_state' =
is equal to NLP_STE_UNMAPPED_NODE
           if (!ndlp || ndlp->nlp_state !=3D NLP_STE_UNMAPPED_NODE)
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/lpfc/lpfc_els.c:10789:2: note: Taking false branch
           if (!ndlp || ndlp->nlp_state !=3D NLP_STE_UNMAPPED_NODE)
           ^
   drivers/scsi/lpfc/lpfc_els.c:10792:9: note: Assuming the condition is tr=
ue
           prsp =3D list_get_first(&dmabuf->list, struct lpfc_dmabuf, list);
                  ^
   drivers/scsi/lpfc/lpfc_scsi.h:38:3: note: expanded from macro 'list_get_=
first'
           (list_empty(list)) ? NULL :                             \
            ^~~~~~~~~~~~~~~~
   drivers/scsi/lpfc/lpfc_els.c:10792:9: note: '?' condition is true
           prsp =3D list_get_first(&dmabuf->list, struct lpfc_dmabuf, list);
                  ^
   drivers/scsi/lpfc/lpfc_scsi.h:38:2: note: expanded from macro 'list_get_=
first'
           (list_empty(list)) ? NULL :                             \
           ^
   drivers/scsi/lpfc/lpfc_els.c:10793:7: note: 'prsp' is null
           if (!prsp)
                ^~~~
   drivers/scsi/lpfc/lpfc_els.c:10793:2: note: Taking true branch
           if (!prsp)
           ^
   drivers/scsi/lpfc/lpfc_els.c:10794:3: note: Control jumps to line 10822
                   goto out;
                   ^
   drivers/scsi/lpfc/lpfc_els.c:10823:2: note: Calling 'lpfc_els_free_iocb'
           lpfc_els_free_iocb(phba, icmdiocb);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/lpfc/lpfc_els.c:4527:15: note: Field 'context2' is non-null
           if (elsiocb->context2) {
                        ^
   drivers/scsi/lpfc/lpfc_els.c:4527:2: note: Taking true branch
           if (elsiocb->context2) {
           ^
   drivers/scsi/lpfc/lpfc_els.c:4528:7: note: Assuming the condition is fal=
se
                   if (elsiocb->iocb_flag & LPFC_DELAY_MEM_FREE) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/lpfc/lpfc_els.c:4528:3: note: Taking false branch
                   if (elsiocb->iocb_flag & LPFC_DELAY_MEM_FREE) {
                   ^
   drivers/scsi/lpfc/lpfc_els.c:4555:4: note: Calling 'lpfc_els_free_data'
                           lpfc_els_free_data(phba, buf_ptr1);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/lpfc/lpfc_els.c:4459:6: note: Assuming the condition is true
           if (!list_empty(&buf_ptr1->list)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/lpfc/lpfc_els.c:4459:2: note: Taking true branch
           if (!list_empty(&buf_ptr1->list)) {
           ^
   drivers/scsi/lpfc/lpfc_els.c:4460:37: note: Null pointer value stored to=
 'buf_ptr'
                   list_remove_head(&buf_ptr1->list, buf_ptr,
                                                     ^
   drivers/scsi/lpfc/lpfc_scsi.h:30:2: note: expanded from macro 'list_remo=
ve_head'
           entry =3D NULL;                                           \
           ^~~~~~~~~~~~
   drivers/scsi/lpfc/lpfc_els.c:4460:3: note: Assuming the condition is fal=
se
                   list_remove_head(&buf_ptr1->list, buf_ptr,
                   ^
   drivers/scsi/lpfc/lpfc_scsi.h:31:6: note: expanded from macro 'list_remo=
ve_head'
           if (!list_empty(list)) {                                \
               ^~~~~~~~~~~~~~~~~
   drivers/scsi/lpfc/lpfc_els.c:4460:3: note: Taking false branch
                   list_remove_head(&buf_ptr1->list, buf_ptr,
                   ^
   drivers/scsi/lpfc/lpfc_scsi.h:31:2: note: expanded from macro 'list_remo=
ve_head'
           if (!list_empty(list)) {                                \
           ^
   drivers/scsi/lpfc/lpfc_els.c:4460:3: note: Loop condition is false.  Exi=
ting loop
                   list_remove_head(&buf_ptr1->list, buf_ptr,
                   ^
   drivers/scsi/lpfc/lpfc_scsi.h:29:2: note: expanded from macro 'list_remo=
ve_head'
           do {                                                    \
           ^
   drivers/scsi/lpfc/lpfc_els.c:4463:24: note: Access to field 'virt' resul=
ts in a dereference of a null pointer (loaded from variable 'buf_ptr')
                   lpfc_mbuf_free(phba, buf_ptr->virt, buf_ptr->phys);
                                        ^~~~~~~
   drivers/scsi/lpfc/lpfc_els.c:4913:3: warning: Value stored to 'pcmd' is =
never read [clang-analyzer-deadcode.DeadStores]
                   pcmd +=3D sizeof(uint32_t);
                   ^       ~~~~~~~~~~~~~~~~
   drivers/scsi/lpfc/lpfc_els.c:4913:3: note: Value stored to 'pcmd' is nev=
er read
                   pcmd +=3D sizeof(uint32_t);
                   ^       ~~~~~~~~~~~~~~~~
   drivers/scsi/lpfc/lpfc_els.c:8477:4: warning: Value stored to 'cmd' is n=
ever read [clang-analyzer-deadcode.DeadStores]

vim +/size +3955 drivers/scsi/lpfc/lpfc_ct.c

742b0cf87a8f92 Gaurav Srivastava 2021-06-08  3883  =

742b0cf87a8f92 Gaurav Srivastava 2021-06-08  3884  /**
742b0cf87a8f92 Gaurav Srivastava 2021-06-08  3885   * lpfc_vmid_cmd - Build=
 and send a FDMI cmd to the specified NPort
742b0cf87a8f92 Gaurav Srivastava 2021-06-08  3886   * @vport: pointer to a =
host virtual N_Port data structure.
742b0cf87a8f92 Gaurav Srivastava 2021-06-08  3887   * @ndlp: ndlp to send F=
DMI cmd to (if NULL use FDMI_DID)
742b0cf87a8f92 Gaurav Srivastava 2021-06-08  3888   * cmdcode: FDMI command=
 to send
742b0cf87a8f92 Gaurav Srivastava 2021-06-08  3889   * mask: Mask of HBA or =
PORT Attributes to send
742b0cf87a8f92 Gaurav Srivastava 2021-06-08  3890   *
742b0cf87a8f92 Gaurav Srivastava 2021-06-08  3891   * Builds and sends a FD=
MI command using the CT subsystem.
742b0cf87a8f92 Gaurav Srivastava 2021-06-08  3892   */
742b0cf87a8f92 Gaurav Srivastava 2021-06-08  3893  int
742b0cf87a8f92 Gaurav Srivastava 2021-06-08  3894  lpfc_vmid_cmd(struct lpf=
c_vport *vport,
742b0cf87a8f92 Gaurav Srivastava 2021-06-08  3895  	      int cmdcode, stru=
ct lpfc_vmid *vmid)
742b0cf87a8f92 Gaurav Srivastava 2021-06-08  3896  {
742b0cf87a8f92 Gaurav Srivastava 2021-06-08  3897  	struct lpfc_hba *phba =
=3D vport->phba;
742b0cf87a8f92 Gaurav Srivastava 2021-06-08  3898  	struct lpfc_dmabuf *mp,=
 *bmp;
742b0cf87a8f92 Gaurav Srivastava 2021-06-08  3899  	struct lpfc_sli_ct_requ=
est *ctreq;
742b0cf87a8f92 Gaurav Srivastava 2021-06-08  3900  	struct ulp_bde64 *bpl;
742b0cf87a8f92 Gaurav Srivastava 2021-06-08  3901  	u32 size;
742b0cf87a8f92 Gaurav Srivastava 2021-06-08  3902  	u32 rsp_size;
742b0cf87a8f92 Gaurav Srivastava 2021-06-08  3903  	u8 *data;
742b0cf87a8f92 Gaurav Srivastava 2021-06-08  3904  	struct lpfc_vmid_rapp_i=
dent_list *rap;
742b0cf87a8f92 Gaurav Srivastava 2021-06-08  3905  	struct lpfc_vmid_dapp_i=
dent_list *dap;
742b0cf87a8f92 Gaurav Srivastava 2021-06-08  3906  	u8 retry =3D 0;
742b0cf87a8f92 Gaurav Srivastava 2021-06-08  3907  	struct lpfc_nodelist *n=
dlp;
742b0cf87a8f92 Gaurav Srivastava 2021-06-08  3908  =

742b0cf87a8f92 Gaurav Srivastava 2021-06-08  3909  	void (*cmpl)(struct lpf=
c_hba *phba, struct lpfc_iocbq *cmdiocb,
742b0cf87a8f92 Gaurav Srivastava 2021-06-08  3910  		     struct lpfc_iocbq=
 *rspiocb);
742b0cf87a8f92 Gaurav Srivastava 2021-06-08  3911  =

742b0cf87a8f92 Gaurav Srivastava 2021-06-08  3912  	ndlp =3D lpfc_findnode_=
did(vport, FDMI_DID);
742b0cf87a8f92 Gaurav Srivastava 2021-06-08  3913  	if (!ndlp || ndlp->nlp_=
state !=3D NLP_STE_UNMAPPED_NODE)
742b0cf87a8f92 Gaurav Srivastava 2021-06-08  3914  		return 0;
742b0cf87a8f92 Gaurav Srivastava 2021-06-08  3915  =

742b0cf87a8f92 Gaurav Srivastava 2021-06-08  3916  	cmpl =3D lpfc_cmpl_ct_c=
md_vmid;
742b0cf87a8f92 Gaurav Srivastava 2021-06-08  3917  =

742b0cf87a8f92 Gaurav Srivastava 2021-06-08  3918  	/* fill in BDEs for com=
mand */
742b0cf87a8f92 Gaurav Srivastava 2021-06-08  3919  	/* Allocate buffer for =
command payload */
742b0cf87a8f92 Gaurav Srivastava 2021-06-08  3920  	mp =3D kmalloc(sizeof(*=
mp), GFP_KERNEL);
742b0cf87a8f92 Gaurav Srivastava 2021-06-08  3921  	if (!mp)
742b0cf87a8f92 Gaurav Srivastava 2021-06-08  3922  		goto vmid_free_mp_exit;
742b0cf87a8f92 Gaurav Srivastava 2021-06-08  3923  =

742b0cf87a8f92 Gaurav Srivastava 2021-06-08  3924  	mp->virt =3D lpfc_mbuf_=
alloc(phba, 0, &mp->phys);
742b0cf87a8f92 Gaurav Srivastava 2021-06-08  3925  	if (!mp->virt)
742b0cf87a8f92 Gaurav Srivastava 2021-06-08  3926  		goto vmid_free_mp_virt=
_exit;
742b0cf87a8f92 Gaurav Srivastava 2021-06-08  3927  =

742b0cf87a8f92 Gaurav Srivastava 2021-06-08  3928  	/* Allocate buffer for =
Buffer ptr list */
742b0cf87a8f92 Gaurav Srivastava 2021-06-08  3929  	bmp =3D kmalloc(sizeof(=
*bmp), GFP_KERNEL);
742b0cf87a8f92 Gaurav Srivastava 2021-06-08  3930  	if (!bmp)
742b0cf87a8f92 Gaurav Srivastava 2021-06-08  3931  		goto vmid_free_bmp_exi=
t;
742b0cf87a8f92 Gaurav Srivastava 2021-06-08  3932  =

742b0cf87a8f92 Gaurav Srivastava 2021-06-08  3933  	bmp->virt =3D lpfc_mbuf=
_alloc(phba, 0, &bmp->phys);
742b0cf87a8f92 Gaurav Srivastava 2021-06-08  3934  	if (!bmp->virt)
742b0cf87a8f92 Gaurav Srivastava 2021-06-08  3935  		goto vmid_free_bmp_vir=
t_exit;
742b0cf87a8f92 Gaurav Srivastava 2021-06-08  3936  =

742b0cf87a8f92 Gaurav Srivastava 2021-06-08  3937  	INIT_LIST_HEAD(&mp->lis=
t);
742b0cf87a8f92 Gaurav Srivastava 2021-06-08  3938  	INIT_LIST_HEAD(&bmp->li=
st);
742b0cf87a8f92 Gaurav Srivastava 2021-06-08  3939  =

742b0cf87a8f92 Gaurav Srivastava 2021-06-08  3940  	lpfc_printf_vlog(vport,=
 KERN_INFO, LOG_DISCOVERY,
742b0cf87a8f92 Gaurav Srivastava 2021-06-08  3941  			 "3275 VMID Request D=
ata: x%x x%x x%x\n",
742b0cf87a8f92 Gaurav Srivastava 2021-06-08  3942  			 vport->fc_flag, vpor=
t->port_state, cmdcode);
742b0cf87a8f92 Gaurav Srivastava 2021-06-08  3943  	ctreq =3D (struct lpfc_=
sli_ct_request *)mp->virt;
742b0cf87a8f92 Gaurav Srivastava 2021-06-08  3944  	data =3D mp->virt;
742b0cf87a8f92 Gaurav Srivastava 2021-06-08  3945  	/* First populate the C=
T_IU preamble */
742b0cf87a8f92 Gaurav Srivastava 2021-06-08  3946  	memset(data, 0, LPFC_BP=
L_SIZE);
742b0cf87a8f92 Gaurav Srivastava 2021-06-08  3947  	ctreq->RevisionId.bits.=
Revision =3D SLI_CT_REVISION;
742b0cf87a8f92 Gaurav Srivastava 2021-06-08  3948  	ctreq->RevisionId.bits.=
InId =3D 0;
742b0cf87a8f92 Gaurav Srivastava 2021-06-08  3949  =

742b0cf87a8f92 Gaurav Srivastava 2021-06-08  3950  	ctreq->FsType =3D SLI_C=
T_MANAGEMENT_SERVICE;
742b0cf87a8f92 Gaurav Srivastava 2021-06-08  3951  	ctreq->FsSubType =3D SL=
I_CT_APP_SEV_Subtypes;
742b0cf87a8f92 Gaurav Srivastava 2021-06-08  3952  =

742b0cf87a8f92 Gaurav Srivastava 2021-06-08  3953  	ctreq->CommandResponse.=
bits.CmdRsp =3D cpu_to_be16(cmdcode);
742b0cf87a8f92 Gaurav Srivastava 2021-06-08  3954  	rsp_size =3D LPFC_BPL_S=
IZE;
742b0cf87a8f92 Gaurav Srivastava 2021-06-08 @3955  	size =3D 0;

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5843091563649345829==--

