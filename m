Content-Type: multipart/mixed; boundary="===============3106915782963166838=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: [android-common:android-mainline 2/2] drivers/scsi/ufs/ufshcd.c:2451:72: warning: '(void*)hba->ucdl_base_addr' is of type 'void *'. When using void pointers in calculations, the behaviour is undefined. [arithOperationsOnVoidPointer]
Date: Wed, 08 Apr 2020 18:48:36 +0800
Message-ID: <202004081828.MnW96B0Z%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3106915782963166838==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: cros-kernel-buildreports(a)googlegroups.com

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   e990f09f7c35dcf7a2bb25d466a8e22b5ac3ddf1
commit: e990f09f7c35dcf7a2bb25d466a8e22b5ac3ddf1 [2/2] ANDROID: scsi: ufs: =
fix bad merge resolution with custom sg entry size
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

   drivers/scsi/ufs/ufshcd.c:3760:2: warning: Address of local auto-variabl=
e assigned to a function parameter. [autoVariables]
    hba->uic_async_done =3D &uic_async_done;
    ^
   drivers/scsi/ufs/ufshcd.c:7528:6: warning: Identical condition 'ret', se=
cond condition is always false [identicalConditionAfterEarlyExit]
    if (ret) {
        ^
   drivers/scsi/ufs/ufshcd.c:7524:6: note: If condition 'ret' is true, the =
function will return/exit
    if (ret)
        ^
   drivers/scsi/ufs/ufshcd.c:7528:6: note: Testing identical condition 'ret'
    if (ret) {
        ^
   drivers/scsi/ufs/ufshcd.c:7423:6: warning: Condition 'ret' is always fal=
se [knownConditionTrueFalse]
    if (ret) {
        ^
   drivers/scsi/ufs/ufshcd.c:7419:6: note: Assuming that condition 'ret' is=
 not redundant
    if (ret)
        ^
   drivers/scsi/ufs/ufshcd.c:7423:6: note: Condition 'ret' is always false
    if (ret) {
        ^
   drivers/scsi/ufs/ufshcd.c:7533:13: warning: Condition '!ret' is always t=
rue [knownConditionTrueFalse]
    } else if (!ret && on) {
               ^
   drivers/scsi/ufs/ufshcd.c:7528:6: note: Assuming that condition 'ret' is=
 not redundant
    if (ret) {
        ^
   drivers/scsi/ufs/ufshcd.c:7533:13: note: Condition '!ret' is always true
    } else if (!ret && on) {
               ^
   drivers/scsi/ufs/ufshcd.c:442:21: warning: The scope of the variable 'lr=
bp' can be reduced. [variableScope]
    struct ufshcd_lrb *lrbp;
                       ^
   drivers/scsi/ufs/ufshcd.c:443:6: warning: The scope of the variable 'prd=
t_length' can be reduced. [variableScope]
    int prdt_length;
        ^
   drivers/scsi/ufs/ufshcd.c:1368:6: warning: The scope of the variable 're=
t' can be reduced. [variableScope]
    int ret;
        ^
   drivers/scsi/ufs/ufshcd.c:1951:6: warning: The scope of the variable 'le=
n' can be reduced. [variableScope]
    int len;
        ^
   drivers/scsi/ufs/ufshcd.c:2159:26: warning: The scope of the variable 'p=
rd' can be reduced. [variableScope]
    struct ufshcd_sg_entry *prd;
                            ^
   drivers/scsi/ufs/ufshcd.c:2160:22: warning: The scope of the variable 's=
g' can be reduced. [variableScope]
    struct scatterlist *sg;
                        ^
   drivers/scsi/ufs/ufshcd.c:2163:6: warning: The scope of the variable 'i'=
 can be reduced. [variableScope]
    int i;
        ^
   drivers/scsi/ufs/ufshcd.c:4888:20: warning: The scope of the variable 'c=
md' can be reduced. [variableScope]
    struct scsi_cmnd *cmd;
                      ^
   drivers/scsi/ufs/ufshcd.c:6169:21: warning: The scope of the variable 'l=
rbp' can be reduced. [variableScope]
    struct ufshcd_lrb *lrbp;
                       ^
   drivers/scsi/ufs/ufshcd.c:6482:6: warning: The scope of the variable 'cu=
rr_uA' can be reduced. [variableScope]
    int curr_uA;
        ^
   drivers/scsi/ufs/ufshcd.c:772:29: warning: Clarify calculation precedenc=
e for '&' and '?'. [clarifyCalculation]
      MASK_RSP_EXCEPTION_EVENT ? true : false;
                               ^
   drivers/scsi/ufs/ufshcd.c:2184:22: warning: '(void*)prd' is of type 'voi=
d *'. When using void pointers in calculations, the behaviour is undefined.=
 [arithOperationsOnVoidPointer]
      prd =3D (void *)prd + hba->sg_entry_size;
                        ^
>> drivers/scsi/ufs/ufshcd.c:2451:72: warning: '(void*)hba->ucdl_base_addr'=
 is of type 'void *'. When using void pointers in calculations, the behavio=
ur is undefined. [arithOperationsOnVoidPointer]
    struct utp_transfer_cmd_desc *cmd_descp =3D (void *)hba->ucdl_base_addr=
 +
                                                                          ^
   drivers/scsi/ufs/ufshcd.c:2184:8: warning: Variable 'prd' is assigned a =
value that is never used. [unreadVariable]
      prd =3D (void *)prd + hba->sg_entry_size;
          ^

git remote add android-common https://android.googlesource.com/kernel/common
git remote update android-common
git checkout e990f09f7c35dcf7a2bb25d466a8e22b5ac3ddf1
vim +2451 drivers/scsi/ufs/ufshcd.c

2a8fa600445c452 Subhash Jadavani 2014-09-25  2448  =

4d2b8d40dd754e4 Bart Van Assche  2020-01-22  2449  static void ufshcd_init_=
lrb(struct ufs_hba *hba, struct ufshcd_lrb *lrb, int i)
4d2b8d40dd754e4 Bart Van Assche  2020-01-22  2450  {
e990f09f7c35dcf Eric Biggers     2020-04-07 @2451  	struct utp_transfer_cmd=
_desc *cmd_descp =3D (void *)hba->ucdl_base_addr +
e990f09f7c35dcf Eric Biggers     2020-04-07  2452  		i * sizeof_utp_transfe=
r_cmd_desc(hba);
4d2b8d40dd754e4 Bart Van Assche  2020-01-22  2453  	struct utp_transfer_req=
_desc *utrdlp =3D hba->utrdl_base_addr;
4d2b8d40dd754e4 Bart Van Assche  2020-01-22  2454  	dma_addr_t cmd_desc_ele=
ment_addr =3D hba->ucdl_dma_addr +
e990f09f7c35dcf Eric Biggers     2020-04-07  2455  		i * sizeof_utp_transfe=
r_cmd_desc(hba);
4d2b8d40dd754e4 Bart Van Assche  2020-01-22  2456  	u16 response_offset =3D=
 offsetof(struct utp_transfer_cmd_desc,
4d2b8d40dd754e4 Bart Van Assche  2020-01-22  2457  				       response_upiu=
);
4d2b8d40dd754e4 Bart Van Assche  2020-01-22  2458  	u16 prdt_offset =3D off=
setof(struct utp_transfer_cmd_desc, prd_table);
4d2b8d40dd754e4 Bart Van Assche  2020-01-22  2459  =

4d2b8d40dd754e4 Bart Van Assche  2020-01-22  2460  	lrb->utr_descriptor_ptr=
 =3D utrdlp + i;
4d2b8d40dd754e4 Bart Van Assche  2020-01-22  2461  	lrb->utrd_dma_addr =3D =
hba->utrdl_dma_addr +
4d2b8d40dd754e4 Bart Van Assche  2020-01-22  2462  		i * sizeof(struct utp_=
transfer_req_desc);
e990f09f7c35dcf Eric Biggers     2020-04-07  2463  	lrb->ucd_req_ptr =3D (s=
truct utp_upiu_req *)cmd_descp;
4d2b8d40dd754e4 Bart Van Assche  2020-01-22  2464  	lrb->ucd_req_dma_addr =
=3D cmd_desc_element_addr;
e990f09f7c35dcf Eric Biggers     2020-04-07  2465  	lrb->ucd_rsp_ptr =3D (s=
truct utp_upiu_rsp *)cmd_descp->response_upiu;
4d2b8d40dd754e4 Bart Van Assche  2020-01-22  2466  	lrb->ucd_rsp_dma_addr =
=3D cmd_desc_element_addr + response_offset;
e990f09f7c35dcf Eric Biggers     2020-04-07  2467  	lrb->ucd_prdt_ptr =3D (=
struct ufshcd_sg_entry *)cmd_descp->prd_table;
4d2b8d40dd754e4 Bart Van Assche  2020-01-22  2468  	lrb->ucd_prdt_dma_addr =
=3D cmd_desc_element_addr + prdt_offset;
4d2b8d40dd754e4 Bart Van Assche  2020-01-22  2469  }
4d2b8d40dd754e4 Bart Van Assche  2020-01-22  2470  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3106915782963166838==--

