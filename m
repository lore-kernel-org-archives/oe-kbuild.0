Content-Type: multipart/mixed; boundary="===============6893813995268528323=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] [SCSI] megaraid_sas: Fix possible divide-by-zero bugs in megaraid_sas_fp.c
Date: Sun, 22 Aug 2021 03:14:10 +0800
Message-ID: <202108220354.rWD3Bhe6-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6893813995268528323==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: clang-built-linux(a)googlegroups.com
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20210811131647.9300-1-islituo@gmail.com>
References: <20210811131647.9300-1-islituo@gmail.com>
TO: Tuo Li <islituo@gmail.com>
TO: kashyap.desai(a)broadcom.com
TO: sumit.saxena(a)broadcom.com
TO: shivasharan.srikanteshwara(a)broadcom.com
TO: jejb(a)linux.ibm.com
TO: martin.petersen(a)oracle.com
CC: megaraidlinux.pdl(a)broadcom.com
CC: linux-scsi(a)vger.kernel.org
CC: linux-kernel(a)vger.kernel.org
CC: baijiaju1990(a)gmail.com
CC: Tuo Li <islituo@gmail.com>

Hi Tuo,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on mkp-scsi/for-next]
[also build test WARNING on scsi/for-next linux/master linus/master v5.14-r=
c6 next-20210820]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Tuo-Li/megaraid_sas-Fix-po=
ssible-divide-by-zero-bugs-in-megaraid_sas_fp-c/20210811-211944
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mkp/scsi.git for-ne=
xt
:::::: branch date: 10 days ago
:::::: commit date: 10 days ago
config: x86_64-randconfig-c001-20210810 (attached as .config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project d39ebd=
ae674c8efc84ebe8dc32716ec353220530)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/5397652c5a3ddb7ddee62fa67=
2ab5fd2065b1e5c
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Tuo-Li/megaraid_sas-Fix-possible-d=
ivide-by-zero-bugs-in-megaraid_sas_fp-c/20210811-211944
        git checkout 5397652c5a3ddb7ddee62fa672ab5fd2065b1e5c
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           if (req->long_data) {
           ^
   drivers/memstick/host/rtsx_pci_ms.c:352:9: note: Calling 'ms_transfer_da=
ta'
                   err =3D ms_transfer_data(host, req->data_dir,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/memstick/host/rtsx_pci_ms.c:137:18: note: Assuming field 'type' =
is not equal to MEMSTICK_TYPE_PRO
           bool pro_card =3D card->id.type =3D=3D MEMSTICK_TYPE_PRO;
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/memstick/host/rtsx_pci_ms.c:140:20: note: Assuming 'data_dir' is=
 equal to 0
                           __func__, tpc, (data_dir =3D=3D READ) ? "READ" :=
 "WRITE",
                                           ^
   include/linux/dev_printk.h:126:46: note: expanded from macro 'dev_dbg'
           dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__)
                                                       ^~~~~~~~~~~
   drivers/memstick/host/rtsx_pci_ms.c:140:19: note: '?' condition is true
                           __func__, tpc, (data_dir =3D=3D READ) ? "READ" :=
 "WRITE",
                                          ^
   drivers/memstick/host/rtsx_pci_ms.c:143:6: note: 'data_dir' is equal to =
READ
           if (data_dir =3D=3D READ) {
               ^~~~~~~~
   drivers/memstick/host/rtsx_pci_ms.c:143:2: note: Taking true branch
           if (data_dir =3D=3D READ) {
           ^
   drivers/memstick/host/rtsx_pci_ms.c:145:16: note: 'pro_card' is false
                   trans_mode =3D pro_card ? MS_TM_AUTO_READ : MS_TM_NORMAL=
_READ;
                                ^~~~~~~~
   drivers/memstick/host/rtsx_pci_ms.c:145:16: note: '?' condition is false
   drivers/memstick/host/rtsx_pci_ms.c:154:6: note: 'pro_card' is false
           if (pro_card) {
               ^~~~~~~~
   drivers/memstick/host/rtsx_pci_ms.c:154:2: note: Taking false branch
           if (pro_card) {
           ^
   drivers/memstick/host/rtsx_pci_ms.c:180:8: note: Value assigned to field=
 'need_card_int', which participates in a condition later
           err =3D rtsx_pci_transfer_data(pcr, sg, 1, data_dir =3D=3D READ,=
 10000);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/memstick/host/rtsx_pci_ms.c:181:6: note: Assuming 'err' is >=3D 0
           if (err < 0) {
               ^~~~~~~
   drivers/memstick/host/rtsx_pci_ms.c:181:2: note: Taking false branch
           if (err < 0) {
           ^
   drivers/memstick/host/rtsx_pci_ms.c:187:6: note: 'pro_card' is false
           if (pro_card) {
               ^~~~~~~~
   drivers/memstick/host/rtsx_pci_ms.c:187:2: note: Taking false branch
           if (pro_card) {
           ^
   drivers/memstick/host/rtsx_pci_ms.c:192:7: note: Assuming the condition =
is false
                   if (val & (MS_CRC16_ERR | MS_RDY_TIMEOUT))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/memstick/host/rtsx_pci_ms.c:192:3: note: Taking false branch
                   if (val & (MS_CRC16_ERR | MS_RDY_TIMEOUT))
                   ^
   drivers/memstick/host/rtsx_pci_ms.c:352:9: note: Returning from 'ms_tran=
sfer_data'
                   err =3D ms_transfer_data(host, req->data_dir,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/memstick/host/rtsx_pci_ms.c:363:6: note: 'err' is >=3D 0
           if (err < 0)
               ^~~
   drivers/memstick/host/rtsx_pci_ms.c:363:2: note: Taking false branch
           if (err < 0)
           ^
   drivers/memstick/host/rtsx_pci_ms.c:366:6: note: Assuming field 'need_ca=
rd_int' is not equal to 0
           if (req->need_card_int && (host->ifmode =3D=3D MEMSTICK_SERIAL))=
 {
               ^~~~~~~~~~~~~~~~~~
   drivers/memstick/host/rtsx_pci_ms.c:366:6: note: Left side of '&&' is tr=
ue
   drivers/memstick/host/rtsx_pci_ms.c:366:29: note: Assuming field 'ifmode=
' is not equal to MEMSTICK_SERIAL
           if (req->need_card_int && (host->ifmode =3D=3D MEMSTICK_SERIAL))=
 {
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/memstick/host/rtsx_pci_ms.c:366:2: note: Taking false branch
           if (req->need_card_int && (host->ifmode =3D=3D MEMSTICK_SERIAL))=
 {
           ^
   drivers/memstick/host/rtsx_pci_ms.c:373:11: note: Field 'need_card_int' =
is not equal to 0
           if (req->need_card_int) {
                    ^
   drivers/memstick/host/rtsx_pci_ms.c:373:2: note: Taking true branch
           if (req->need_card_int) {
           ^
   drivers/memstick/host/rtsx_pci_ms.c:374:3: note: 4th function call argum=
ent is an uninitialized value
                   dev_dbg(ms_dev(host), "int_reg: 0x%02x\n", int_reg);
                   ^
   include/linux/dev_printk.h:126:2: note: expanded from macro 'dev_dbg'
           dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__)
           ^                                           ~~~~~~~~~~~
   drivers/memstick/host/rtsx_pci_ms.c:451:4: warning: Value stored to 'err=
' is never read [clang-analyzer-deadcode.DeadStores]
                           err =3D ms_power_on(host);
                           ^     ~~~~~~~~~~~~~~~~~
   drivers/memstick/host/rtsx_pci_ms.c:451:4: note: Value stored to 'err' i=
s never read
                           err =3D ms_power_on(host);
                           ^     ~~~~~~~~~~~~~~~~~
   drivers/memstick/host/rtsx_pci_ms.c:453:4: warning: Value stored to 'err=
' is never read [clang-analyzer-deadcode.DeadStores]
                           err =3D ms_power_off(host);
                           ^     ~~~~~~~~~~~~~~~~~~
   drivers/memstick/host/rtsx_pci_ms.c:453:4: note: Value stored to 'err' i=
s never read
                           err =3D ms_power_off(host);
                           ^     ~~~~~~~~~~~~~~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
>> drivers/scsi/megaraid/megaraid_sas_fp.c:951:34: warning: The result of t=
he left shift is undefined because the left operand is negative [clang-anal=
yzer-core.UndefinedBinaryOperatorResult]
                                       (u16)(rightmostParityArm << RAID_CTX=
_R56_P_ARM_SHIFT);
                                                                ^
   drivers/scsi/megaraid/megaraid_sas_fp.c:1013:6: note: Assuming field 'ro=
wDataSize' is not equal to 0
           if (raid->rowDataSize =3D=3D 0) {
               ^~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/megaraid/megaraid_sas_fp.c:1013:2: note: Taking false branch
           if (raid->rowDataSize =3D=3D 0) {
           ^
   drivers/scsi/megaraid/megaraid_sas_fp.c:1043:15: note: Field 'IoforUneve=
nSpan' is 0
           if (io_info->IoforUnevenSpan) {
                        ^
   drivers/scsi/megaraid/megaraid_sas_fp.c:1043:2: note: Taking false branch
           if (io_info->IoforUnevenSpan) {
           ^
   drivers/scsi/megaraid/megaraid_sas_fp.c:1088:6: note: Assuming field 'fp=
Capable' is 0
           if (raid->capability.fpCapable) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/megaraid/megaraid_sas_fp.c:1088:2: note: Taking false branch
           if (raid->capability.fpCapable) {
           ^
   drivers/scsi/megaraid/megaraid_sas_fp.c:1102:6: note: Assuming 'numRows'=
 is equal to 1
           if (numRows =3D=3D 1) {
               ^~~~~~~~~~~~
   drivers/scsi/megaraid/megaraid_sas_fp.c:1102:2: note: Taking true branch
           if (numRows =3D=3D 1) {
           ^
   drivers/scsi/megaraid/megaraid_sas_fp.c:1104:7: note: Assuming 'num_stri=
ps' is not equal to 1
                   if (num_strips =3D=3D 1) {
                       ^~~~~~~~~~~~~~~
   drivers/scsi/megaraid/megaraid_sas_fp.c:1104:3: note: Taking false branch
                   if (num_strips =3D=3D 1) {
                   ^
   drivers/scsi/megaraid/megaraid_sas_fp.c:1157:15: note: Assuming field 'f=
pIoTimeoutForLd' is not equal to 0
                   cpu_to_le16(raid->fpIoTimeoutForLd ?
                               ^
   include/linux/byteorder/generic.h:90:21: note: expanded from macro 'cpu_=
to_le16'
   #define cpu_to_le16 __cpu_to_le16
                       ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from =
macro '__cpu_to_le16'
   #define __cpu_to_le16(x) ((__force __le16)(__u16)(x))
                                                     ^
   drivers/scsi/megaraid/megaraid_sas_fp.c:1157:15: note: '?' condition is =
true
                   cpu_to_le16(raid->fpIoTimeoutForLd ?
                               ^
   include/linux/byteorder/generic.h:90:21: note: expanded from macro 'cpu_=
to_le16'
   #define cpu_to_le16 __cpu_to_le16
                       ^
   drivers/scsi/megaraid/megaraid_sas_fp.c:1160:6: note: Assuming field 'ad=
apter_type' is not equal to INVADER_SERIES
           if (instance->adapter_type =3D=3D INVADER_SERIES)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/megaraid/megaraid_sas_fp.c:1160:2: note: Taking false branch
           if (instance->adapter_type =3D=3D INVADER_SERIES)
           ^
   drivers/scsi/megaraid/megaraid_sas_fp.c:1163:11: note: Assuming field 'a=
dapter_type' is not equal to THUNDERBOLT_SERIES
           else if (instance->adapter_type =3D=3D THUNDERBOLT_SERIES)
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/megaraid/megaraid_sas_fp.c:1163:7: note: Taking false branch
           else if (instance->adapter_type =3D=3D THUNDERBOLT_SERIES)
                ^
   drivers/scsi/megaraid/megaraid_sas_fp.c:1174:6: note: Assuming field 'r5=
6_div_offload' is true
           if (fusion->r56_div_offload && (raid->level >=3D 5) && !isRead) {
               ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/megaraid/megaraid_sas_fp.c:1174:6: note: Left side of '&&' =
is true
   drivers/scsi/megaraid/megaraid_sas_fp.c:1174:34: note: Assuming field 'l=
evel' is >=3D 5
           if (fusion->r56_div_offload && (raid->level >=3D 5) && !isRead) {
                                           ^~~~~~~~~~~~~~~~
   drivers/scsi/megaraid/megaraid_sas_fp.c:1174:6: note: Left side of '&&' =
is true
           if (fusion->r56_div_offload && (raid->level >=3D 5) && !isRead) {
               ^
   drivers/scsi/megaraid/megaraid_sas_fp.c:1174:55: note: Assuming 'isRead'=
 is 0
           if (fusion->r56_div_offload && (raid->level >=3D 5) && !isRead) {
                                                                ^~~~~~~
   drivers/scsi/megaraid/megaraid_sas_fp.c:1174:2: note: Taking true branch
           if (fusion->r56_div_offload && (raid->level >=3D 5) && !isRead) {
           ^
   drivers/scsi/megaraid/megaraid_sas_fp.c:1175:3: note: Calling 'mr_get_ph=
y_params_r56_rmw'
                   mr_get_phy_params_r56_rmw(instance, ld, start_strip, io_=
info,
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   drivers/scsi/megaraid/megaraid_sas_fp.c:923:2: note: The value -1 is ass=
igned to 'rightmostParityArm'
           rightmostParityArm =3D (arms - 1) - mega_mod64(rowNum, arms);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/megaraid/megaraid_sas_fp.c:930:6: note: Assuming field 'spa=
nDepth' is equal to 1
           if (raid->spanDepth =3D=3D 1) {
               ^~~~~~~~~~~~~~~~~~~~
   drivers/scsi/megaraid/megaraid_sas_fp.c:930:2: note: Taking true branch
           if (raid->spanDepth =3D=3D 1) {
           ^
   drivers/scsi/megaraid/megaraid_sas_fp.c:938:6: note: Assuming field 'lev=
el' is not equal to 6
           if (raid->level =3D=3D 6) {
               ^~~~~~~~~~~~~~~~
   drivers/scsi/megaraid/megaraid_sas_fp.c:938:2: note: Taking false branch
           if (raid->level =3D=3D 6) {
           ^
   drivers/scsi/megaraid/megaraid_sas_fp.c:951:34: note: The result of the =
left shift is undefined because the left operand is negative
                                       (u16)(rightmostParityArm << RAID_CTX=
_R56_P_ARM_SHIFT);
                                             ~~~~~~~~~~~~~~~~~~ ^
   drivers/scsi/megaraid/megaraid_sas_fp.c:1386:3: warning: Value stored to=
 'bestArm' is never read [clang-analyzer-deadcode.DeadStores]
                   bestArm =3D arm;
                   ^         ~~~
   drivers/scsi/megaraid/megaraid_sas_fp.c:1386:3: note: Value stored to 'b=
estArm' is never read

vim +951 drivers/scsi/megaraid/megaraid_sas_fp.c

9c915a8c99bce6 Adam Radford       2010-12-21  893  =

7fc557005c454f Chandrakanth Patil 2019-06-25  894  /*
7fc557005c454f Chandrakanth Patil 2019-06-25  895   * mr_get_phy_params_r56=
_rmw -  Calculate parameters for R56 CTIO write operation
7fc557005c454f Chandrakanth Patil 2019-06-25  896   * @instance:			Adapter =
soft state
7fc557005c454f Chandrakanth Patil 2019-06-25  897   * @ld:				LD index
7fc557005c454f Chandrakanth Patil 2019-06-25  898   * @stripNo:			Strip Num=
ber
7fc557005c454f Chandrakanth Patil 2019-06-25  899   * @io_info:			IO info s=
tructure pointer
7fc557005c454f Chandrakanth Patil 2019-06-25  900   * pRAID_Context:		RAID =
context pointer
7fc557005c454f Chandrakanth Patil 2019-06-25  901   * map:				RAID map poin=
ter
7fc557005c454f Chandrakanth Patil 2019-06-25  902   *
7fc557005c454f Chandrakanth Patil 2019-06-25  903   * This routine calculat=
es the logical arm, data Arm, row number and parity arm
7fc557005c454f Chandrakanth Patil 2019-06-25  904   * for R56 CTIO write op=
eration.
7fc557005c454f Chandrakanth Patil 2019-06-25  905   */
7fc557005c454f Chandrakanth Patil 2019-06-25  906  static void mr_get_phy_p=
arams_r56_rmw(struct megasas_instance *instance,
7fc557005c454f Chandrakanth Patil 2019-06-25  907  			    u32 ld, u64 strip=
No,
7fc557005c454f Chandrakanth Patil 2019-06-25  908  			    struct IO_REQUEST=
_INFO *io_info,
7fc557005c454f Chandrakanth Patil 2019-06-25  909  			    struct RAID_CONTE=
XT_G35 *pRAID_Context,
7fc557005c454f Chandrakanth Patil 2019-06-25  910  			    struct MR_DRV_RAI=
D_MAP_ALL *map)
7fc557005c454f Chandrakanth Patil 2019-06-25  911  {
7fc557005c454f Chandrakanth Patil 2019-06-25  912  	struct MR_LD_RAID  *rai=
d =3D MR_LdRaidGet(ld, map);
7fc557005c454f Chandrakanth Patil 2019-06-25  913  	u8          span, dataA=
rms, arms, dataArm, logArm;
7fc557005c454f Chandrakanth Patil 2019-06-25  914  	s8          rightmostPa=
rityArm, PParityArm;
7fc557005c454f Chandrakanth Patil 2019-06-25  915  	u64         rowNum;
7fc557005c454f Chandrakanth Patil 2019-06-25  916  	u64 *pdBlock =3D &io_in=
fo->pdBlock;
7fc557005c454f Chandrakanth Patil 2019-06-25  917  =

7fc557005c454f Chandrakanth Patil 2019-06-25  918  	dataArms =3D raid->rowD=
ataSize;
7fc557005c454f Chandrakanth Patil 2019-06-25  919  	arms =3D raid->rowSize;
7fc557005c454f Chandrakanth Patil 2019-06-25  920  =

7fc557005c454f Chandrakanth Patil 2019-06-25  921  	rowNum =3D  mega_div64_=
32(stripNo, dataArms);
7fc557005c454f Chandrakanth Patil 2019-06-25  922  	/* parity disk arm, fir=
st arm is 0 */
7fc557005c454f Chandrakanth Patil 2019-06-25  923  	rightmostParityArm =3D =
(arms - 1) - mega_mod64(rowNum, arms);
7fc557005c454f Chandrakanth Patil 2019-06-25  924  =

7fc557005c454f Chandrakanth Patil 2019-06-25  925  	/* logical arm within r=
ow */
7fc557005c454f Chandrakanth Patil 2019-06-25  926  	logArm =3D  mega_mod64(=
stripNo, dataArms);
7fc557005c454f Chandrakanth Patil 2019-06-25  927  	/* physical arm for dat=
a */
7fc557005c454f Chandrakanth Patil 2019-06-25  928  	dataArm =3D mega_mod64(=
(rightmostParityArm + 1 + logArm), arms);
7fc557005c454f Chandrakanth Patil 2019-06-25  929  =

7fc557005c454f Chandrakanth Patil 2019-06-25  930  	if (raid->spanDepth =3D=
=3D 1) {
7fc557005c454f Chandrakanth Patil 2019-06-25  931  		span =3D 0;
7fc557005c454f Chandrakanth Patil 2019-06-25  932  	} else {
7fc557005c454f Chandrakanth Patil 2019-06-25  933  		span =3D (u8)MR_GetSpa=
nBlock(ld, rowNum, pdBlock, map);
7fc557005c454f Chandrakanth Patil 2019-06-25  934  		if (span =3D=3D SPAN_I=
NVALID)
7fc557005c454f Chandrakanth Patil 2019-06-25  935  			return;
7fc557005c454f Chandrakanth Patil 2019-06-25  936  	}
7fc557005c454f Chandrakanth Patil 2019-06-25  937  =

7fc557005c454f Chandrakanth Patil 2019-06-25  938  	if (raid->level =3D=3D =
6) {
7fc557005c454f Chandrakanth Patil 2019-06-25  939  		/* P Parity arm, note =
this can go negative adjust if negative */
7fc557005c454f Chandrakanth Patil 2019-06-25  940  		PParityArm =3D (arms -=
 2) - mega_mod64(rowNum, arms);
7fc557005c454f Chandrakanth Patil 2019-06-25  941  =

7fc557005c454f Chandrakanth Patil 2019-06-25  942  		if (PParityArm < 0)
7fc557005c454f Chandrakanth Patil 2019-06-25  943  			PParityArm +=3D arms;
7fc557005c454f Chandrakanth Patil 2019-06-25  944  =

7fc557005c454f Chandrakanth Patil 2019-06-25  945  		/* rightmostParityArm =
is P-Parity for RAID 5 and Q-Parity for RAID */
7fc557005c454f Chandrakanth Patil 2019-06-25  946  		pRAID_Context->flow_sp=
ecific.r56_arm_map =3D rightmostParityArm;
7fc557005c454f Chandrakanth Patil 2019-06-25  947  		pRAID_Context->flow_sp=
ecific.r56_arm_map |=3D
7fc557005c454f Chandrakanth Patil 2019-06-25  948  				    (u16)(PParityArm=
 << RAID_CTX_R56_P_ARM_SHIFT);
7fc557005c454f Chandrakanth Patil 2019-06-25  949  	} else {
7fc557005c454f Chandrakanth Patil 2019-06-25  950  		pRAID_Context->flow_sp=
ecific.r56_arm_map |=3D
7fc557005c454f Chandrakanth Patil 2019-06-25 @951  				    (u16)(rightmostP=
arityArm << RAID_CTX_R56_P_ARM_SHIFT);
7fc557005c454f Chandrakanth Patil 2019-06-25  952  	}
7fc557005c454f Chandrakanth Patil 2019-06-25  953  =

7fc557005c454f Chandrakanth Patil 2019-06-25  954  	pRAID_Context->reg_lock=
_row_lba =3D cpu_to_le64(rowNum);
7fc557005c454f Chandrakanth Patil 2019-06-25  955  	pRAID_Context->flow_spe=
cific.r56_arm_map |=3D
7fc557005c454f Chandrakanth Patil 2019-06-25  956  				   (u16)(logArm << R=
AID_CTX_R56_LOG_ARM_SHIFT);
7fc557005c454f Chandrakanth Patil 2019-06-25  957  	cpu_to_le16s(&pRAID_Con=
text->flow_specific.r56_arm_map);
7fc557005c454f Chandrakanth Patil 2019-06-25  958  	pRAID_Context->span_arm=
 =3D (span << RAID_CTX_SPANARM_SPAN_SHIFT) | dataArm;
7fc557005c454f Chandrakanth Patil 2019-06-25  959  	pRAID_Context->raid_fla=
gs =3D (MR_RAID_FLAGS_IO_SUB_TYPE_R56_DIV_OFFLOAD <<
7fc557005c454f Chandrakanth Patil 2019-06-25  960  				    MR_RAID_CTX_RAID=
_FLAGS_IO_SUB_TYPE_SHIFT);
7fc557005c454f Chandrakanth Patil 2019-06-25  961  =

7fc557005c454f Chandrakanth Patil 2019-06-25  962  	return;
7fc557005c454f Chandrakanth Patil 2019-06-25  963  }
7fc557005c454f Chandrakanth Patil 2019-06-25  964  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--===============6893813995268528323==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

H4sICNKxIGEAAy5jb25maWcAlDzLdty2kvt8RR9nkywSS7Ks2DNHCzQJdiNNEgwA9kMbnrbU8tVc
PTwtKdf++6nCgwRAUPdOFo5YVXgX6o3++aefZ+T15elh/3J3vb+//zH7eng8HPcvh5vZ7d394b9n
OZ/VXM1oztTvQFzePb5+f//900V3cT77+Pvp+e8nvx2vz2arw/HxcD/Lnh5v776+Qgd3T48//fxT
xuuCLbos69ZUSMbrTtGtunx3fb9//Dr7+3B8BroZ9vL7yeyXr3cv//X+Pfz7cHc8Ph3f39///dB9
Oz79z+H6Zfb58Pnmj5OPn08Pf5zdXl/8cXH25fzL5/3Z2cWXi0+Hm9MPJ3+cn37+cvvrOzfqYhj2
8sSbCpNdVpJ6cfmjB+JnT3t6fgL/ORyR2GBRtwM5gBzt2YePJ2cOXubj8QAGzcsyH5qXHl04Fkwu
I3VXsnrlTW4AdlIRxbIAt4TZEFl1C674JKLjrWpaNeAV56XsZNs0XKhO0FIk27IahqUjVM27RvCC
lbQr6o4o5bVm4q9uw4W3gHnLylyxinaKzKGJhCG9mSwFJbBJdcHhHyCR2BR45+fZQvPi/ez58PL6
beAmVjPV0XrdEQGbySqmLj+cAbmbI68anJmiUs3unmePTy/YQ7/7PCOl2/5371LgjrT+Xur5d5KU
yqNfkjXtVlTUtOwWV6wZyH3MHDBnaVR5VZE0Zns11YJPIc7TiCupkO/6rfHm6+9MjNezfosA5/4W
fnv1dmueOJdgLXETXEiiTU4L0pZKc4R3Ng685FLVpKKX7355fHo8DJJBbkjjjyJ3cs2aLDnphku2
7aq/WtrSxBQ2RGXLTmO9ayK4lF1FKy52eD1IthyQraQlm/vDkxaka6JvfZREQP+aAmYJPFq62wEX
bfb8+uX5x/PL4WG4HQtaU8EyfQ/hks69afkoueSbNIYWBc0Uw6GLoqvMfYzoGlrnrNaXPd1JxRYC
RBVcMY8xRQ4okDobEDgSekg3zZb+bUJIzivC6hAmWZUi6paMCtyy3bjzSrL0hC0iOY7G8apqJ9ZJ
lAD2gGMB+aG4SFPhcsVa70dX8ZyGQxRcZDS3gpD5ekk2REhqJ92zi99zTuftopAh5x4eb2ZPtxGD
DLqOZyvJWxjTMG/OvRE1t/kk+mr9SDVek5LlRNGuJFJ12S4rE6ymxf564NwIrfuja1or+SaymwtO
8gwGepusAg4g+Z9tkq7ismsbnHIkLc0Vz5pWT1dIrYQiJfYmjb6P6u4B7JnUlQSVvep4TeHOefNa
XsE1EoznWqH3pwu6FTAsL2lSHBl00ZblNDolSthiiWxoZ68HtGwymnev95oi2igKoO5PnyE0v2xI
rXqhO5DoXYHP1JYg1Ygrhqb9eiwILtiG7CRsYmJtjsbNQAudoIe2bgRbDwRFkegG5LLAy9nlQEtF
OK0GTCTgwCSwa6vc39BwyT0DCUqrRsEJaYNq0C8WvuZlWysidmktZKgS03btMw7NPdGRLUGmZFxQ
dxLAu+/V/vmfsxc48Nke5vr8sn95nu2vr59eH1/uHr9GHIvMTjLdr5FK/WzWDIzGEI3XLDlzlFJa
Cgy0U6rOzJmsI70ylzlqsoyCToVO1DSmW3/wp4lXFC1mmd5SyZJi8z/YJ8/YhE1gkpdatvvd6S0X
WTuTCXkAR9YBzp8rfHZ0CwIhdcbSEPvNIxCuVPdhpV0CNQK1OU3BlSBZhMCOYSPLEo3rylfqiKkp
nJqki2xeMqn8mxCuP7Sn56w+86bJVuaPMUSfsL9VbLUERQlSLGndY/8gW5asUJdnJz4cz6oiWw9/
ejbcIlYr8K9IQaM+Tj8EPNrW0nox5oKh8nE3TF7/43Dzen84zm4P+5fX4+FZg+1mJLCBFLXOGHhX
bUW6OQGfNAusgUHWzlFvw+htXZGmU+W8K8pWejam9dNgTadnn6Ie+nFibLYQvG2kv9Vgwmap6zov
V5Y8bm72ZYAWhIkuickKUOukzjcsV8vgKii/QWJ0O1LD8mCyFizy0DkJsQVcnist3eN2y3ZBYStT
TRvQDb6FghyJw1vMaA9yumYZHYGBOpRfbiFUFIkJoR5JCS6LrpjMptepDcNhJHSDwJoESek5Ishr
3reW0j4ANWIAwCX73zVVwTecV7ZqODAW2hrKKJ9AIaFn7fjGd7+AF3IKqgyM6PDIB66gJdlNsCLs
tzZUhcde+ptU0LGxVz3/UOSRyw6AyFMHiHXQhwnkU36tJubTqPPEtAFhvXO3Ds5RiYcyEO4xb+Bc
2BVFN0FzChcVSIbAhojJJPyREo55x0WzJDVIEeEJcTTElGeHGUHH8tOLmAZUVEYb7cdoNREb0pls
VjBLUIc4TX+Kk7otGqcCA40h43lDw71EN3RsMBrGGYELWGLueyPGeO9N30Dmx99dXTE/9uOdBi0L
Z1G5JqMFu3YE/Da00r1ZtYpuo0+4UV73DQ8WxxY1KQuPRfQCfID2enyAXILE9uQ98yJGjHetCBVK
vmYwTbt/MjpMrSzwJLTRXOTdJg5yjSjA/fJdYJjLnAjB/MNc4Ui7So4hXXCGA3QO5hXsFfI+CNAE
hd5rFA8YtAill51YpAFRNQ5zg/XXWXSuq6zyxYOkgQMOTWmeJ1WTuQYwcBd7tRoIc+rWlY4WOKPB
Rs6bw/H26fiwf7w+zOjfh0cwOAnYDRmanOCeDcZjsnMt7VND9NbHfziM63BdmTGMWxFcG1m281i9
YMyVgF2iveFBrpckpU6xA787MofTEAvq/LO4C62z0bTsBNxrXiUFbUiIsSYwhFMnJJdtUYD91hAY
MRG30ctDU7EhQjFShr4aBr3THoyWh1r3Bd51GMN2xBfnc9+L3up8SvDtKzKpRJtpoZvTDDxUb7Ym
rt9ppaAu3x3uby/Of/v+6eK3i3M/tL0C5eoMP2+pimQrY+6PcEHES9+aCm1NUaPlbiItl2ef3iIg
WwzLJwkcu7iOJvoJyKC70wtH14fAJOlyP47uEAF3esBeTnT6qALGNoOTndNlXZFn405AVLK5wLhX
jhZJQrQg8+Aw2wQO2AcG7ZoFsJIfC9LuL1XGGDSutaDeurSP5VBa/kBXAuNuy9ZPFgV0msWTZGY+
bE5FbaKSoCElm/s60/oKEkO9U2jtjOiNIaWznz0SDFprwmihuPFlp7ajG9BJX+yG3kqrg9necRWg
0ikR5S7DqKqv9vIdmLsYpV7uJIPzioLYzcJ4cCVIONB6HyOnSZKamquBZ0QzIx20rG6OT9eH5+en
4+zlxzcTG/A8PXer/DXgugpKVCuoscFD1PaMNGH4D6FVo+O+CSGz4GVeMBm6S1SB4cDqdLwQ+zMM
CfabKBN9IgXdKjhmZJ2RJYPotVlT0KmbykSP5owrloc9GXDZSBn3R6phdOtAJbpmXBZdNfesJgeJ
VRL22TOPTcWAM1q2IjCdjVvCK+DUAtyFXi6kdPsOLhZYTGBgL1rqh5jhuAjGxAJdYWFmXukIlCOR
Dat1ZH1iM5drFDvlHHiyWzuOdHgahDvhs2vWqX40YrmugqYG1MXn2yP0Qid6k3iXBz8vaG0Mkjgx
EXafSgK6ISMpAByMEXG4n6UKrWToZ3wOccAxQeECNxb+J3DGkqPt5IYfsnOZqMf7MIRIVp/S8Eam
E4oVmprp9Cro8NC8iXWPb/+66yRqDFpnBBh5FNZCmvI0QF74OCWzsEOwe7fZchEZI5g7WYcQUNus
aistWwqQtuXu8uLcJ9AcAC5jJf3iAPLhTMvDLnA4tYyptlOSEseAq2yExxhMqnwMXO4WfpzSgTOw
aUkrxoirJeFbP/m3bKjhI484167hkIgDC9EkBxNnBgZLoAlqrZMl2rCgled0gXbP6eezNB6zoyms
M5ETuABmxJqsRhmBKhtLvypD3zeVlNf8g5URndVTPu/xLqW8BBUc3TWMQ8wFX8Fd16ENTP1OjFCF
0QwLwjBsSRckS2dELJVhijcpgD+mB4b2f9KsT1f5/tHD0+Pdy9MxSIx43pfVZW2dRfJvTCNIk9K8
Y8IM0xX08iHdmVaRfBMqp97TmJi6v97Ti5HbQWUDhlR8313GFkzNtnR5/GBjGW9K/IeKlMBin1aw
CHcTWCZ4ZtLeg6hzwPEBjihIlaebcqyuQhFYkKS1oM8Y5M/DyB5iUyzxUVuF4W7kTACLdIs5GtQj
wyVriKnLkoplKRbHYwMDBO50JnaNr9pCBGga7ZnMdylPGLMCqc61kaztRdMVSVjxPXroN8DTEtdn
jSTMgXobwEq8hKWzizDt39LLk+83h/3Nifefv2ENjmXu7igWHuFHZ4MhZHD5uMSQjGibOLHmmEAJ
P9IEX2i4M8Wu6CTc7k6/CycTZLhfaNlo0eqIT4MFkHgPwXSQ4FmgOCBhnkOjTeQisk4rEnkKbcVG
drY1pM3ZWI8EPbYV3U3JU+tfya0+S0x3pzsdKNKp2wQlxu8naeVim5gRLQKlCZ9wXdp5spflVXd6
cpKyva+6s48nfj8A+RCSRr2ku7mEbkKNuBSY7fa7XtEtTaVWNBxd+PiCodtokE0rFhhP8uICBiHZ
YjQEAk31TzrPI4hcdnlbNSnd4XxbED3geJx8Pw2vIZYmZESF0sBwIWYJMGYa8p6OHOhWftDSjUJK
tqhhlLNgEOdoW+4syY63gdAaBjQkqSPhqinbhbVth7INsBnQWK98gtSRGk/DJxqFJde55H7fVjJF
Si6ZMYkot7wud291hdUd6cOscvTRcV1JZcdzVsAO5mqcztAxkxI0Q4NpXz+4+FY8YsSgJM87p8B8
XLVs8HQw6GYCKXiUvR4xVtHTvw7HGZgW+6+Hh8Pjix6JZA2bPX3DSm8/+mEiRp7ZaUNIQ+LVLcuG
n2jv2waq1YtOpdgffNaSUk9+OkjsywIchZbGpTvakBXV3nfQWQ+1JcanA9sH2EXmNwu6iCISOJN8
jbm7PIEyk3dwf/q2IEOlRBKgs9LzYzd/GQsRqzhZxuhQmDUVV8Nj9HCjL8fiWpTAZnC+auMgXcUW
S2VzQtik8QOnGgJMrUDnm7lpI1d6MWfP125sIGeRDMGYvppMdJFk04iiyVU8+YbFoIhvNEzQdcfX
VAiWUz/YGU4MJHai3tKnINlg9mrAnCgwmnYxtFXK9041cA1j84iwIHUEUSSPIHkQyNAg7ZQLCrwg
ZYSy5VLgnFlfYwrN8tH+9shoBqwBvzgEhVI9PQJZLMDG0tmXaI1L8CpIGUH74KB9ehChs1YqDndO
ggjV6CHfP4hAs4NoA7bNQpA8XuFbuNHVNLPKkKN4KkZmpsVrRUDwi6g3t0GMh561YdF5fGxoUSbX
W1G15LlvRRsOWyST7RoHf6mhM/wCDyBrBVO7WC4NV5o0lE3Bbco8nAEikprQbGajUjWYGudVJUf3
b6tKnsq9uZ2GvwsZeM9onfAG2CytRuzF45FTjEI3jPxY1q36QAEw9qw4Hv739fB4/WP2fL2/N3GC
oDIQ7+BUjWGidd8xu7k/eK+nsMYwuI0O0i34GqyuPEgJBsiK+g+XApSigVEU4FycNZnhNigXk/Xt
kX7uXrGe9h/G5czOgvm3loWpIn59doDZL3DlZoeX699/9cIycAuNlx7oToBWlflI6U5Am+i5m6vJ
JmJYK3TS63nIH1h3MvcXPjE/M/e7x/3xx4w+vN7vI2NJh0P9EIs3xvaDV45kDdkxaESCYbf24twY
7HD6QT3meCp6hsXd8eFf++Nhlh/v/g6KDWjuiR34sL6kBRRMVBt0lY35GMRJ/cQPfJpSnQiEz9oq
8JbRLgbDWbuGhbUF/VPJ8A3GvEC57luWA8K/8sWmywpbGpSUPwvOFyXtJz8q2oVZzH6h318Oj893
X+4Pw+4wLJG43V8ffp3J12/fno4v3kbB1NdESG+3AEJlaN4gTGBKooI9Iylz1GzBaryliMDiVYcc
cuZ+pxtBmiZIaiMWfSksVMe0MKgjwctwmhlpZIsJUU3jbyZiJ97R6WEzdtZbYkGjHO4SqlJ9MePH
YpYb/z8bHeyqLb/pjzBcrcsJx1OyClOigYC2HnircnT46vD1uJ/dupnc6AvhV/FOEDj06CoFGnO1
DmriMBHVwkW9mvJy0GRZbz+eetceE9RLctrVLIadfbyIoeBBt7L34lwpyv54/Y+7l8M1+om/3Ry+
wdRR8o5cORN/iAqjdNwihDlTJsg2uJQVSCAReMwrk8dPrPbPtmpAm8396KN58KqDXRimLFSQG7RY
7XmPsebJSu8HtbWWiViEmqEFOg7g6cp0xepubh8I+h0xWDP6yInCjVVcmmCgmJhPIXiThttu0Asv
UtWVRVub0B/4KWig68RF9MQOyIL6xaFOT/e4BO8tQqLCQ6nAFi1vE6+wwJ02doF5n5aIfIHKURi8
sHW2YwJJXXB5AmkD7NVo083MzQthUwXVbZZMUfvQwO8La1FkH5HSr7NMiyRdzU1dVTyerDAUY98B
xwcEZiRcyDo31SGWjUJrwdCZesHk2eGb5cmGy003h7WaEuoIV7EtsO6Alno6EZGu2Aa+a0UNS4RT
CWov4+LEBKtg4RzGNXQFuSl+ceXpo04S47sKRGG3CIOXqSNNXfUUNlHWWVVtB04juIjWW8PAUhKN
b1NSJJb1zFUxTz5s2juejJUXlvMweBZR2HYmRzqBy3k7UTllTTbWZJ156OmepSdoMdU10Kd2DXw4
JHgDZavPfGlsMW8+PtZHWQLfRV2PaqSGXgPMZNbKhaBKxeNfZJggAFng5+gRbt/TjWa9YUhr+VCX
9sTMilIPXEotGVdBlUgSjbav7i2im3gMF6uP8TO4+IJzvEBtngRXMdjJ9Fonq4BBsPwuwaGTdImh
zMUAPBYQxzE+zYUaCZNBe0Mkh5K80PJc7UbryF02kmYgmDweBlSLsUVUwVhjj5c+sX10y/Bxp3n+
nTgIHBpxQMI3dUzSKxw9gstLpJYQ1LHG5gTOIakJw1ZDaWyiX6+udaoTnyTRlUVrckzlxNM0XG9f
aI9NBNhgZh6x9RXAoRc8byP1hOJHsoUN5n8YuZ0WTyKDpPdb58wU06T2G5mtP63BOO6hbwqnIcO0
MovGW0onklABiQuMT4knbZwoMIGU+xUKsfFKet9Axc0Nfyebp1DD4vCB8Yczl8sLLZLeaAXLKrBM
h9wU6HG/ij8ZtfbeQ4wLFBwvOSN7GjP6pRhjDti3ydYqS0mUqTdJoQKw7xtAbLmHDYlbjV7JEBYx
Lk/G17992T8fbmb/NA8gvh2fbu/iWB2S2ZN8a480mfvhG7MdQ53/GyMFe4K/SoTuEquT7wT+jXPm
ugKVU+EDIv/m63cwEp9+eJUNRrT6bGFZTuedtcufTkciTVvbR+/pxgadrmQcjOgpPPYjRdb/5s7E
Lxo4ymQIzyLx0AWa1PHj+hg/+cs3MeHES7+YLP5dmpgQuXWDLzUlWgX9I8yOVZqv0yvSbiCWmCwv
371//nL3+P7h6Qa46cvhXXSs5il4nJKbh6Wt+EAStKK+OJEMHp7xggTC2xyi8FnlXC5Gj749nPkl
mwiOMd8FphPeQHXqNCjncARXPP1sx+FB93KlyugHCcZY2JXN1MNlm4rXNrcI57iZq7hfAHXVX8lT
9vaP4W8AgACdeqLak2VcjobokXEZZrTAcU21h5ZYx96ED5YQbiSzE+6pnylo9seXO5QvM/Xjm320
bjvQj6CM42pT1ymelTmXA2kYjvPBQ9g/GjFg3VFoG1dR/YWxxBEMjW//kSOCdRbe/EQSH17de4Et
aMe4Kf7JwZDTiuvhDaR76p6iWe3mYcjUIeZFOvUTzumnfp/BUPOMXiLr0+Grre0h4kMBLXZHlu2Q
z1ccAyCi8n7eSasK09gYxz7bw80H3T+B1OcxgestEP3rV/nwimEgmcbEjcUm3XQE77UxZgxMHLdp
8MKTPNcyWUvYlDHmnnl2c1rg/9wPviRpTTmPjacPFEMVi8kVfD9c/x9nX7bcOI4s+iuOebgxJ+LU
bS4SRT30A0VSEspcYIJa7BeFu8pn2jG1Rdk90/P3JxPggiUh9b0dUdWlzCR2JBKJXP54f0btNYZL
vJMGuO/aUtuwZlv3KJ04QjGFGqQYfQvLFqMeZQpfgxcYfwSMoViRd0wX5QYwBg2Y1zGWPahoZq28
p0uyv/XL1+8//3NXz+91rgHQNWPS2RK1zppDRmEoYriGg4hbUqjjYLpkG746FLZCDoNW7fRjc2jx
FM3FWhaD7ehANei8DVnDwFCep7yCWxDvFY9Di/0FVcNAhrbe/bDRtcUASyf32UThrb4rkQ2YPi/7
R2n91V162/FUOcu0eN8zVWia8nDW3AvK1HtclXIWVPytovt1EawTo3N+Vyxz+Bz4/sRbmJNmNNTX
WC2l1vDJ70rt2++5E/wvr8pMGe2SJ++2a+HLU0bLjbknECIuvFkVQpI8cdoU8EkM3ttaT0eYvHJd
cRCSb1/jU4XeSZilsutMXaYMkUE2Ter7Jcmo/Lp2LVLeRep8MlQqEwWX3rKmUgkFPdN3d4Tor9zK
6V92W3+bAGGpd73ExqqkhslgLmXelb1iLhOj8/Oy8bOmnC6Szcv7v7///Cfc5lyOBzvy3tQ4KAjM
fUYNHJzm2m0ffwG3Nh4GJcz+el72lcetbtvV8lAjsRir5b70+NIUsC0wih55JWGN2TvGVZQODMdH
Lx8+GzpKZyBKBQxEvNEDPcrfl2Kfc6syBEtzYF9lSNBlHY3HfjPuufYp5A5P2LI+UNbriuLSH5qm
NERrECeAHbf3rKRnQ3147GkjKMRu28M13FwtXQFOyyXb+3Fw1/QjGffo/SV26q4OxAVpgfqcj2Cz
+EPB/QtYUnTZ6QYFYmFegGO19LLF2uGfu2t3k4kmP2x0DdR4bI34X//26Y/fXj/9zSy9Lpa04gFm
NjGX6TEZ1jpqvejATZJIBepBX6FL4VGeYO+Ta1ObXJ3bhJhcsw0144kfa61ZHSVY7/QaYJeko8Ze
opsCRM4L+qj2j7x0vlYr7UpTkdPwaogd7dkJklCOvh8vyl1yqU636pNk+zqjfXfVNPPqekEwB/L1
kpYMOCws32cYTxRPqzrr7q/SgEwndTlwMNbcOp91YvXiR6sU+BUk8J4i97STYWQ2DzfuCnqKel94
5ayn47lUkaeGTceKnSc2KjINQQtkxyprLmkQhbQmpyhz+JpuSZXT3tpwYa/oWTpHS7qojNN+T3zf
+qpPqvbEM09szbIssU/LhXc8nBh6c5dzKjhP0aBhAdyBjqZaYwMTlUktEFlYy8vmKE6sz2mudSTE
C2O/YHR773FQc88ZqALQ0VXuhV8QUi0FkdRLUcUYNQTZuY/qoev9FTS5oJgoR2EWFZVwROS6iUfH
NfG228pwpsbFGe+M3VlpRdBQhhtXvLMZtnHQJ2JDvBpFjSavMiFIj1h5UGPETPF4MeMubB60H1Ji
QU23cpUxZea795e3d+vBRbbsvvfFjJUbuWvh/G3hitLS/s5O8RZCl9W1VZHVXVb4xsSzzzb01sy2
MDidj7FtMYoYMaYn1pVVaQZAybc73Meho5qdEN9eXj6/3b1/v/vtBfqJ6pnPqJq5g5NKEmjazQGC
lya8Eu2l3ai8mQUao97eM9K+G8d+zc25XfNR0frVnCRAnK/M4ZpfiX6SZ8wT37Lke1hJNKdstp4w
/QIOQl/MbJR3tzSOOshHVohxk/Buq108uxaaZ8TKk+wEd2ctjDgjaCgBF3xNdZixqlVcdYCU/R7z
cIz8b9w3xcu/Xj8RxtjKAIEJ7crs/oKDboObvjb4g8SgLS71gbJCBenVfD6WSPlk5XuANxTy9o8h
mr6xzAEs1VPAT0jmyMpM8Nr+AmFXHusnEulchkFpyAIG17MDVzT0IpqI5zibnhovvK/N/taCOQAy
rQDiHg6su7fHxt0sGq5TT9+jltBMUSK9kPrDxvB9ARhGWff5WssoPDnD00jquMqGOgGwFEP3IldR
nlmdR0UlMjUngikimR48Rjars4aKZ0J3GJAlDtaBRn9UCCZqPQ42yMYq1ICWY6ONubBNTWNzVeJ8
fli4y1O/XC5JX3Ob0gnNrVOIPZ9CQqIDyafv395/fv+C4aI/24wA6bc9/B0GgTlomPHEea6dEE4D
5EI+Y0RDTSF1rK2ZUIM+B9qYGZj8XoXj2MOtYK+eNgcm9vb6j28nNIXH7uTf4R+O14T8vjhZDSpO
Y0kWFD0Aaej4gbGTB9+jHfUOLPcniLmN3DGD4HCtzer54/tvMBWvXxD9YvdpViz6qdSZ/vz5BYO0
SPQ8z5iCgRqfPCvKRn/R0qHUSI0oYrh0FDVml4+rKFSFkjLX7aZPL7z0Gp7Wd/nt84/vr9/ejcdm
ZC1NIc2byeqND6ei3v79+v7pd3rHGGWL0yD492XuLd9fmiahnKuLdYZpFeVZ5wlhnXFmiZ6zY8br
p+HEv2ttBfNBGXHty8p4izTAg72IlgPp2Nd8axwxIwzE6oM9wuM9o8+aIqt8UQx4p+qcPL9kLH+n
Q5MXzJfvsGB+zj3ZnkYno1kGOfddNrvy/E3TwE3UyqRcdZR+pJkoR9McYs+jZ9ggzrn+OkNLp/cE
abiDZ6PxRjoNJFpiqDwhHnWCJCiPnUdlpQjwDWMoBs53tPSlNJhIlMnX64FUpXWauLB4FFpsQk1Y
naPGSXHBkw0K0cdDhUE8N3AU9Ey3KevKnfFqo35fmJ66YYAJuPzhO+JXG851L4MBWNe61cZYqp71
Y4TFutK2zpTlcYEJGrZmaDZYRJK3jeaspmmdu70mx9LPUt7Wn7AZXiXQC1j1Z9ZD7Jm77zUX0LEk
jVO0cLmwjeAn7K4hF2rda16X8EMuAWyIZa3z4/nnm2nY0qON9Ura3AizCM3oyUa1WwoKgyzjtl1B
KbcdfLVVJmcfQm2o7CKk/5W0Y6VtiBx6tLGewq04dkNj3+WQHOCfcOyiTY2KZ93/fP72pnxc76rn
/ziDtKnuYXOacyvBLWluPOHgkmT4mvYeBbAPwWzMdBsvsDC9bCG2BRXxQ9QDpT6DLXf64n2yRuRk
lIXR/6Say+HhXVb/0rX1L9svz29wHP7++sMVROXC2jKzMR/LoswtFoXwHd43BrDRGCgB9YryZcSy
F9WolKl7c3+R+UIumnUUgY2uYhcmFutnIQGLCBiKlJjC9KuNyepC2Ps2l7GussyFHnpW2eMAI+6d
sI6MCyr3+0agl7cmxl6ZOSXFPv/4gcqxASjVSJLq+RNGE7Kmt0VeeB5VjsIcEjQtwfPhKwF0zPh0
3Bi1KjWjVukkVdn8SiJwJlXSmIhCt0a0Mx2DpsYZDDx1yup0uxKjm9IN33GMe4kmLgZabPLL7nw2
BwKWxCo5w1SYYJbvB6DRylJsIv805/dpsHDLEvkmumyrTOzt4pqyf3/54imtWiyCndVavOia7ZTX
p2N3adrOLh0vEM56He8/N9aXypX08uV/PqCQ/fz67eXzHZQ5nJ40l+F1vlyGVoMlDKO6b6VBhdlA
hfRpVOTYVdADp2N7q1s6G+kL9cUMwwBlfdtjHDZUsOpmTwMWxCoxGMaEUUqcN1HduxJ08fr2zw/t
tw85jpujEDQKKdp8F5MTcXuMlZ4eRH5ztBGinLyt0YEDA3G+8zs7yU9HSaV7/vcvcE4/wy3qi6zl
7n8US5ovjkS9cEPNKmspagh3nerIoidwebZ1eiIR9ZlRR+yEx81OfjjGIvLy66Feedu+TpTB+sjo
CJcDxRAzfVeP41q/vn0yBw6EgkHr4/Ye/8JsqS4GpP92T40lE/dtI/OwXkOq03wyvjAZoo9W2uia
fJ0mxYyV9qa2KTeb/tSxnojhkeewCf4By95VqkwFARHRZoCiomCf1bXlZOAhgcG/uogG6o0Zuo9q
4fSAhRtS9qPiMGB3/0f9P7rjeX33VZmtkVxSkplz9iATa89y11DF7YL1Qg4ba8sB4HKqpCOk2LdV
YTM+SbApN8ODYBSYo4hYNMClY6CMFLvqUFIVW/4tCJbXX+PyaUoBLeYAZb0nlAlg79vNx7lIAIwr
VYcZ91P4bdnFAWSIK0LUYcfJUz7fZs4VH+CiO3yPMAGX98yQIWfqy5ZtqXDeGoV8CGFGBKgRm53T
dLVOrnwPB5kmQxtmfNKGTyo3ahi+IdzkmDzj/fun7190RXbDTb384Mejt2p07WkOVYU/iGaNJFtN
/M6Lrq2t3rGC5sXj96giFQLPecbj6HwmiZ9o+WAso4K7mNMfCZXG0SpLa2rjpWtOK7/96rar6Da0
QnEamxt4caZzFIx4uktyCPGZPi+OeoR9HTzoYTQnZRN9mjVu40boM7lN8PWTqBRfpdTtfHqV0p4m
5CM04qlhskbJxgopniuJ51iX7msEQq3QNtMAH2ujE5JUmaZlPW1+Ikk8j9US5zUDk8is29kGQePp
oDd+kgcILVbZiLbD8KUiro5BpAcQLJbR8nwpeNuTQKnf00a4ONT1I7I/YnzZpsawKRoH2GdNr99T
eratL7ZbiwSuzueQKjIX6zgSi0AT+EGQqlqBySEwlTozElnu+YVVeuhMXoh1GkSZ/k7PRBWtg8BI
EKxgEfV6N45eDyRLM/L0iNrsw9Xq2reyHevAuJvs6zyJlxHxVSHCJNVUDqLLDAZWnC5ndBKTbMr3
fD29n/jCdqnXvosotqUu/aCNZtcL7UqYR/Issn7DUoBmZd0lCmFQhu1Ulhwvro6kpeCw4yPttBiA
U/R3E1xn5yRdLR34Os7PiVMIK/pLut7zUpwdXFmGQbAwRC6zmVPHNqswcNangvqujxoWFr841Hz0
zh+iiP35/HbHvr29//zjq0yy9/b780+4gr2jXhJrv/uCkt9n2LivP/Cf+qWuR6URufX/P8qluIG9
vTM0A5VJDMg0FWMEej3p0giCP/NczdD+bFy4juqx6FjntDX8rmxOD/SaLvM9Jcls8vpy1HJMqN+X
Xvc5los6q3IMYaSbBUyL3bxK7rNN1mSXTANhul794fXIs8Z4P1cA6zVjhI6WA6NaROfSSgeCRoLD
jdzZPDK4Yd1qp1+XMbgu9r2RjBGp7Ad/BFokhqONhMgcxttpycq2DI1Q0cT/Dqvon/999/784+W/
7/LiA+wdLeLmJFoYsWfzfaegFOuZPtGDlY4f7LS5nN3LCcJcu7HKjkwngwWHf+NrZm+PVtXudoZx
lITKYJTylc0YkX7cWG/WzAgMcTvMxXwyIGabKwT9vipDVsq/HSKjeAz9R0w1wiu2gf8RCOVBbNaF
cGn8IUhvD0XTca0vo/LI6r41hqcxT4p2mCLGkmoMnHzcUYFAv1rNzM+7TazI/OOGRItbRJvmHF2h
2ZSRg7TWXQwHLfwn95s1ynsu7H0E1OuzFC3NdgAcxt435BkaCVglZfssXC0CG5rlsiHm4s5Yvjrr
+uYBgO98QiaAHPKuaCk4Bwq41srgN3BPvdTi1yWq3+ejYCCS7/pkjFSHVJ2CyiyNuvgaZDITY+A2
SZoWAPdWSZjtIQAyGOMZOgBudHb9Vzq7vtpZi1DvqtsaXw/Xf6mH64U1nQiw43GrQ+Hobn8J81PL
eIhVaVdbHw8ycru5cguOFwDaQlq1FjV+4vEKh8u6vBaU15/i2NCiSNdTgSwoD7emPBmR0yZEXVPA
jFWb9kyUYwuXEwIHztxIILnFJDTCYZOW0zuluSe+uoaPqFJZXHcWUIA03fMH5nDuw1bsczKDseJE
IHFyq6zNQcDpxnILLN+HrJiSqkGP3capF4D0zA5SHD96+KfMCSnrGy/u2soajAgxWSTtpa0Go2G5
sx4ReC34ySDgnONwHdo8dTsY336loIP85xzOVOcUjrvHPTpRk7nzRmyGVppm/ZxnFoTVtVvyE+OX
kvOQ9tWbaQTaKuW9d78JlXjeGtXHehnnKfAY6jI6dLdzG8U7ZWFzpU1A4slaJPEPco2iEjFwin+o
slsHvGA1XL78+CKP18s/r/Am7Pd6tfA171SswrU7Xn5HBjWltTymfYXyOg2kOsP8Sim0rvTF0i3p
spl1cZhODj2MjEB9gWUiiqBe+gfoUVUAeCy7TYshGDG8sImS8b5MkKm4lRU98bYwooVJKDdXgrrp
aqaj/359/x2w3z6I7fbu2/P7679e7l7HCOCa1C0r3ed2pXW7wXBslTTxrxiw/cBqAH5EvtiNvUF8
Xh718DsIemg79mDVBvs5D5PobIGlOKda99WqXbAqot3zJHZL+8DUtEJXqQWlsoIycDyY0WPVb7yq
uDD9cBpg+mE2mzgpXE6aLQ3I+Ualoi6VZXkXxuvF3d+3rz9fTvDnv9z7LYhbJbpCac0YIJfWGscJ
ITacdsWcKCwvSgfdikf9GexqU7XZyHI4PFvMxiYtMKlTCGpWUqjlG2QrljZtU/gcdqWelcRg63cH
n2Fx+SDDyF+J/OBTRKMPf+mzO8py9JqlDdm4F3U8+zBocerxvNmAZHEoaIX4zuMJDO0TtiH33C/4
l2g9DmH9gW4gwC9HOWldK+CiTX99pF8uhscJfBTUveSq2pNdEWRkerWWGL260YV1bNIRBKq2u8S5
+axVVjHdyLaDU5/u5SPft2QEIa2erMh4XxrZfQeQtN3CHXWjgF1pLvyyD+PQF2Jj/KiC2y6DSoyn
fwFsvSUtZY1P+9JM+gBCCnBreuyVxrMXtzpRZ09WJokmmybo1rfGWQg/0zAM7WcvTXkP38YeT/O6
uJx3m1uNBS7Q9MzQAWUPnmBR+nddTi41GUW9NSTerK98vvBV6EV49AeA8c3OjWWy6dqssDbCZkGf
spu8Rr5DuzugsohE5L6V07Nd29BbDgujd5zKfofvJ74Pb6wl6HCemQmUNw2VDlj7ZvYb0jkm5fNv
fHRkB2Nc+/2hQccKqdGmhRWd5HibZLPz8CWNpvPQVOzhYPvQOEirEUQv92UlTOOHAXTp6WU8oemp
n9D0GpzRN1vGuu5guoaLdP0n9cpofCXy1uRSjLJJ0j+RUeIMXqHMXknuNrfmjM6fNK64yRIL80BR
kYYqRt0U9a8G5+i5oiqi424IWEAen12tPEy4ZV6IN2V0s+3lkzSI0wdZQi4NRz1QA+cdptu62LzG
LUkloDJGnnT80T7ZH7JTafqhsptTzNJoqWtNdRS+1Bl9odMuIziw6QJPlJ0d7WcMcA9TYGffJ/Zh
Z2J8xS18LQOE7xuPImNbhwG9xtjuxrBLf1iM/aeP28f6xgzXWXcsK2NO6mPt43Ti3hMCR9w/Uuoc
vSKoJWta02C6Oi8unjgOgFs6F04dK05X0VvK/dYaLnMt3os0XYbwLe1Dcy+e0nQhH2//wkTYmxb6
vlrEN+QLNYWl7remYx87Yyvi7zDwTMi2zKrmRnVN1g+VzaxRgejLjUjjlDRa0csse7TvM2RXEXmW
0/FMqmTN4rq2aS0rqO0Nzt2YfWIgxJb/b7wyjdeBeWRE97dnvjmCGGCcbVKBVdAXN+3D9t7MVd/v
2xu7fQj1WDY71phx9veZzG1IDvhjif6lW3ZDMudlIzB5hfHM2t5k/ErBqn/0UGXx2WPQ+FB5hV0o
E5X6PvQD6cmnN+SA5hemavshR+McX4C1rr65JLrC6FqXBIsbewFDZ/SlIUJkHp1CGsZrj10eovqW
3kBdGibrW41oSuPdTsdhcKyORImsBqnGsEMXeAZ6zCf1L0s9C5mOaCu4wMMfYzMLj4oI4JiUM791
ixQMWKupNV9HQUzZ9xlfmS8qTKwDj26fiXB9Y6JFLYy1UXKWh77ygHYdhp4LGyIXt3isaHN0oTzT
mhrRy2PE6F5fw8L/C1N3aExOwvljDYvYJ/QCO6WldYzr1XhOEXa40YjHpuVwczUk71N+OVc7a/e6
3/bl/tAbrFRBbnxlfoFhU0C4wFCHwhNMsa9I1xmtzKN5DsDPS4cJZ+lzkOErSAXT2lM2/FqxJ/Zk
Wf8ryOW09C24iSAmRW2t8Ckiy/TtYLWJbLNiniiXA012Zn72OtBUFcyHj2ZbFPSKAUmK+6PZig1e
DWjV1v7RF84LJdzBekPHD7E9hOsTqMXqcLBajZUn4C/nNFxYH8ia9t/f3j+8vX5+uTuIzWQch1Qv
L5+H+GuIGSPRZZ+ff7y//HTfOk6KNWq/ZjVrrU4mCtfvzSNrf+URErBLn2RkFlrrcQV1lKZVI7Cj
joFAjbdJD6qDo8FgZy1amtLT0zFRL6mnWb3Q+a5EIUsQ/bxjqt8JCHSXDboGCjdJERRSt7jUEfrT
qw7vPfRPj4UuJOgoqd4tG1Npc8rcfC74jPXl5e3tDpC6YfHpZD/MDHvJ+EA351CPWronxswr6zMq
rGkWcvjIenG4eIKfDLYgPh2TqlQw6q1WvmXNgfRmqVgU5EFw1FYz/Lhw5TtiQSbDKfV++e3HH+9e
u1zW8IM2p/LnpSoL7T1VwbZbzAIgIz1aGJWb4t4IrKIwddZ37DxgptAWX55hmqYnccMBePisPYjS
F6dUkXxsHy0CA10elduVBcRR+aqPii82ofrgvnzctMqwcb6uDzBgdZTQoKH5chlp1o8mJk29mPU8
vjOmv9/QzXjow4CM12ZQrAKi0Ic+ChOqhcUQvrZL0iWBru6xMW550r3YJZchBjDaamlYUE34Ps+S
RUj55+kk6SJMyQFQa+za11WdxlFMfoyomN70WgXnVbykrkMzSS7IrtW8CyNaAz/RNOWp9zypTjQY
jhiVUtSb4UQ0X62cGWirYsvEfsiTTI6E6NtTdsro5/qZ6tDck25pWjk1L8nBaIEN0O8J2jzHsP7p
O8xMVEeXvj3keyv9g0N3qhZBTK3vs3c35RmHO9SNBmzIOLjzpPeYs8s0/NP42nWmhoH0PYpaSSLD
xlMahQGN4yLyriyNG5cGvqQpr9MkoHaMTpYVq3S19hWisOh4c7MY7THWQHRhEIWD6w6FR8HuUp/N
DDkUwaWPV/RtSqc+AA9i55zRNiU66eYQhUEY3+iYpIq8A4QyGeZ/YXmTxmF6ozCdehks6RHJH9O8
r7NQN6l38bswDHxDlj/2veB+9bZLu/DZZumkRbYOlpGvUkyWyjvKolSn2mc1F3vDfkpHl2XPfBWU
u6zKPE+wDtngZ36b+pzHAXmx1akGwdC3CHZtW5BHk9FzVpQl93Vu/whA+HuReLiSTgy3YViUtyrE
oHjlPT3OIhGPqyT0tWZ3aJ5urYbyvt9GYbSiF2lpXB1NTEu36ZShivUkDU7JLxWBiuFHNhtO8DBM
A0p3Z5DlYhkEnt1V1yIMFx5cWW3Rep5xH4HYRUmc0v2r5Q8ax+pzcqguvfD2jTXl2fMMYlRyvwqp
lzSdBoQMGUnTu9EKuAX0y3NAG3DrpPLfHYaH+GukJ/LpwCBDS+c4Xp6HwaDaL/m7Z40Ufbo6n6+t
koPYyBhfrbBUUuRSCeNVGtOTJv/NQLiOfVVBFyQjuj1vQBkFAaVBcKlWvokb0Bf2Fyrs6guZNcvg
EqzChPE0B2HCf6iLPoziyIert73wdUGKlbeadU6T5cIzJ1wky2B19pX/VPZJFN069J8sw3HjwGwr
tunY5bhdBnQbunZfD3JDTJfBHoRh4mDULT0zDDXqIFUyQUlhXc0WY9ArHWQ5S0uYqCk7KonaBlpb
R4havFbBUTF4Zdv0YehAIhuiy+kDZOFADE2RgnlSxQxII22N0oE+//wsA+SyX9o72xF2iCAz/CRC
3FgU8ueFpcEisoHwtxlvQIHzPo3ylSmhKQzPuntP2JOBIGdckL4tEg2LD9B2M7rsZDdhsBVFYrcR
IqrprATDt11+IWrJuFn3oBCj1CfqA6USIHtzGJfW9Mkuq0vX1nBQ9VHzOVnDU4ovpW36/fnn8yfU
bTthRgyX+6OmGcuVAbbK0qlSqgqdciSgYBdRoYw3D9CJpJ7BmN+2MLy6MYfiOr3w3nzBUq6BEkyu
nUqmK8NwyXZu+yFs4c/X5y9u9C0lJav8m7nhi68QaWTHEJnAl6LkXSnj4l4Jgap/YARc0hFhslwG
2eWYAch0fNeItqiTv6dxziAb1erREnREec46GtN0l4OMH7ygsB3ITqwuJxJydMozap49Oax0wkzw
EobwiKXdGMDiZOStN1E0vOujND3TuIrrOl4dUxuO2wqB4ZYHZ6QpHtH3bx+QHtorl5d8Z3IjQqjv
sX94IyGW04ga59E/DBPlNEOhRWEGQtKA3kXyUdREmwTbMtK8ccBXaLP+4BSmwN66RJ43Z+6MrcjD
hInV+Uw1ZMTZWhibcJPXSey5PQ4kw5nwsc929nLzkF5flcO7LBeSzumtifYOimHIP8Ou0eP8y7zM
v4ZOyzvuOz0BuRUwR1y21p4EiWLNtirPJD5HmwmY3kvBdgykQF0A8pL4VwLv3D2GS5use0RIZ7e5
41PAVIO7W9/Wed9Vo9LeHqxGRRspMjIT5qRQxtNS9w667Mik2k371FoGgRj+rvekkt4fc28erqF9
MqAKnXapk4+081BVXBts7eXc98A0OD75eQ7jNQORsCkq3chJQgv8U+ZtUVoImaGkMJxZFVyG1pF6
eUOyn3Gi7+iE1apCaWugJbMxi9efcRUA+JdT0SnD7IGttxKZa6rdbrWHP15vqLrnKTyB7NkUZPzn
jHP0gNJDuJ6sNFeYXbskV9LRDiNWHr2OKHtOqsph6nb5vszvZcpRbaX0Ofzh2hOrBDBhXaMGqANA
RnzJO1My0nFSZU1dMTUaYDSsKXWRS8c2h2Pb62FxEdkYCpF8NxhFGDRTsQYUNpkJyLuNWdSxR0fk
rj0/ut0VfRw/cT0Ymo1x1C1llXtyEsCZUD3CjlbZG+fKRrjOZiZaO3ScjW+3unesK/VrF0a5WEG4
P2DGKU7ZkhkkGPtnSv2iHpThFHZf1/XEIiozF8xiCwLyznBtRqi8K2F4W2N/4pKSgeepzYnIPXxV
HrWtCcD6cB6bVf/x5f31x5eXP6Hb2EQZgZtqJxyfG3UxgyKrqmx2xjPeUKykoN+nJgIr87hDUfX5
Ig6oB9+RgufZerkIzfGZEX86vb1w1uBx5iJgpO3xlLnRxy+utKKuzjmv1PV1DHp2bTT174csRmZa
O0QImVTGAGXVrt3MeUax3Olai2lY5tka7MjuoBCA//797f1GmihVPAuX8dLTUYlNYnuqJfhM6cMk
ti5Wy8TqhYRdxCLVoz4OGHQVtacBvUBrUiaTfDANrPlnKlaaUQYTtW9jcMbOC7vORirwfHUqO3tY
wQdrzphYLtdLB5joWqsBtk7OdiOPjHJtHDBcmtTKOUP+4F7FZbm5jGs085n/vL2/fL37DXP0DFkJ
/v4VVsOX/9y9fP3t5TNa8/0yUH2AyximK/gvs8gc+aNpsaH2hmC7RgbGsQPmW2hRZeQ9yCLT7oa+
kjbZY99lzJNixiqOtAhEorIuj5G5/4d49xbkIjNvwon4UWb7sZfIfVnzikz/jpxbWmHYnwBXuh5C
H4m6+9jPFgWrrSRuGnKyn1XRSf+EE+wbiPWA+kUxgufBUNPDAIYw157S+6wVIIBOl/f2/XfF3IbC
tUVmrqCZPWrArWBGQAofLzNWt8r0qUMqSx6cgEM4VE9fFAmGisXw6C7fx5hL3tfvmQQZ8g0SX9os
XQqYWqbn/MoxIzlAhjxF+rYoThqCuqrCtYj+smYoWQBq74lIKjgZBMpIZSbktYYJFie6udhev0Ps
ZdjDWU5ROnXBrBwYM/jLK8Z11ZL+YtxDEFnmIrkZhAp+XjELbnqOFI4eE2FDXUTaSY5SJUMPrXsl
8f+HQElNKYlx49jPuIHFTI34ByZne37//tM9tnsOTfz+6Z8aYu419CtcpunFEY/VnpcZsu8Gw3M0
n2zK/tR299KbAPsEl/UaExphSu23l5c72MTAFj7L5GLAK2TFb//XMDh32jN1b5Clpv6OqfUGxEWm
Wtdz6LJGSZwuPcpR2wN8ZqrLsST4F12FQmg3PNxwfnFtbFUm4lWknQAT/MyjYE3AjcSwAxBtWRKi
kDrnUSyC1HzbtLEuRsCcWIqHEXMOl6StxkTQ11tDlhgRbV5WLX3jnRo0JbEVtsBuUY6HrzsUcEXu
uscjK09ut6rH5qwi8LljAV+xLSurwsVZlvXTTFQF5pm4L13UBq6even2ObUva5q2wc+uDkVeFhlm
v6at6qZ5L5tj2fkMMUeqsrrfo6bZqtOmqmvWi82h27n9UUEJZF/d0YF5JQfhI74FeAYIoZ7RrsoT
8zRDHJqOiXKcQqejPdupCh1W1AGDe3t+u/vx+u3T+88vlCuLj8RpH6zQJtsZh8E4hA8HJp/TD5qW
CFey8dAxAGTuFUxcMKRnWYZT3NR2a8m4Kt+ZEettLIV1D7Z3tWI9nh2k7spWeo8JeDlS5kYS7eSt
llBpZhxMOR1qlb7m6/OPHyDMyyYQ4p38coWRVTFmN7l2VY+l1t7XIOCEvDfHmQq3IuHFKeOUsYBE
mi9nStju8X9BGFjdnRj+eD+wK9p1XlWDxO+rE/2IJrEsp3wSJUp6Ex9zq531Jk3E6my1UmR1tiwi
WJft5mDj5EuQDXwUua7YkcDjOV0urfpOebGOF2cLaicvH6fnsh3uvqMewr86lLAB5/mHAYsv41fX
z3YVpil1EqmR7FPDsEh10z+8gIrD0O7YiTUYKc4p6CTCJF+kpCx9tRPTXVhCX/78AVKRcUUZMhuO
vhbWflBwOweITdR4IrjJ9Ymp2snHkXk3B05/JTzyDrbUb8X2AhigZsKmGbOy9xbPt+nSWcs9Z3mU
hoGuzyIGUHGfbfEXBjayKx4sgU3gx6x5uvR6jlcJVvdsC1jxdOV0H8dslehWVRLc5ct+mcbO3Dqm
Yiaa8DEwR0kkyzRxBu+hPqeJ1QLHw2CEog+/BT3VabwkgOv1wtjY7sBPieGdCbGWq1Kz+Tq26VPz
HVmN7SSteVcyCCbt3llhcN9EX9fQHhNUyStUtHBWf1fkcUQGzVMz1xbZkVWVke6a6Lns+vH15/sf
cLWxWJsxIrtdV+6y3sgiLvsEl6wD18edLG385hSOp3L44d+vgyajfn57N6o8hcPNXLoktYboPuMK
ES1SOkibThSeKB3HTGGqtma42Bn6F6K9ej/El+d/vZhdGFQoIPvXRvkKLuqSAmOnpNuC3hcNRafr
MmhIhwuzlMRTcxTTiFT3pDC+iANvW2PaXcukudlW3dZbRyyDM41YpYEPEXp6VwYLHyZcEYtgmGxN
2MdnXZVSgLrNSKw4cD7kLCfg3oRCvMgUocECBpEvK3K4dvawXCn/LeD26TpaTp+PHZT804aiqm+A
6fHPVOHXXJ1QB7XDBxo4xwLT4WH8Oj9FQUg9m4wEODtJQH2qJvTGpylZq8TQ/GEkERvK7mHsEWBn
bqeCE1nAsZzNQ7SyUn1YKK9pkU23L6hcalOfLLFgbCrAQ/1Y1+gN+DRZqMkh26swlK2BRNjLBqEg
/W0PJdzIs8OudNuAPiMrPMZ9mIhacRJHn3BjJ0A4gxUXx2735Mo3M7qNqEHSuFIsSk7Ryi0U4Wnq
wu1cwHMj5IohZ30qs4+TJSVozAT5Ikyiyq22KHv56iJHapEsE3IYlLjnrBc5QOsV3WxE0efMRMOj
JKL8eEcCWM2LcHl2K5aIdUBVjKhoubpR6ipeuh0FxBKrIxGpt7rlmmQtOkVyJjoh6k28IFaIco1Y
E/tNYqJw5bIOuWlwmqP1InS3yGgfRm3Vrl8G5AE61tr168Vy6bb/kIswCCJiuIr1eq07fnTNsk/C
1N71+5ORUVr+vByZmddDAoeXoj0RRKVREf0Ji+khSeKG9YfdoTvotnoWKiZwxWoRLjzwlILX6D+r
N91EUQeXSZH4Sl17EHFII8LVytOOdbTwRKuaaHro39Wkk5LC01FAJbRRp0axCrwfr66O0r63HTUG
hIiv58kU+SrxzM0ZM0Wjs1ADVwRPAKyB9j7FIMtX6rkPA6RwJ2Wb1eFy7wpgcyJPXpV0mu+5Dxsz
z8sER6t0At6fOdnjHP7KWHfJLR9gLyEXlPHVSCUTFtC9LkQSkfOFmUgj6riaCMqqAvZYkx9L2cWO
9uGQseU9XMDpoFDTtKxCuJJQEZN1ijTa7ogpXS3j1VK4iMETUTrau1+JfF8XVLe2PVwXD33WkzEl
RqpdtQxTQY4LoKKANPadKEA4zshPVwkt4E4EykqDcgkdSfZsn4QxsUDZps5KssWA4SUlmU0EqFUe
zghigpe+yHvzAi5v7FhblzrCP+aL6yMCW7kLo+h6AyrWlJ5kVCPF9OLijJs6y5dU6xRqdcXPQKMj
YxqaFBFZO0hexPmCiChcehCRp6ho4fsiIZaMQhCVo4yqy9Q6PAkSog6JCYkDVCKSlBpeRK0pAVIj
iMNVTPI2TDB8nblJiphuUpIsiBGUiCUxUBKxpgcEWrimW5jzOPAEwZmyUucJGSVtwnMRxSk5Rd0K
+BAhUFW1adQ4w1d0vB+N4JpUAGhiAABKCGlVnVLLrU7J9qbUmq1TsrY1WS65s+o1Wdt6GcULeoAA
tbi2ohQF0Vqep6s4IVcBohbRtVXe9LlSOzJMqucW3uQ9bCByThG1ujprQLFKA2J4ELEOyIFoeF6v
ztcODPnOstZWJa8tS/WJsqadVXQxOkoSnzgfXe3cpqwufFu6ndvw7NKJJCBnZCv4JaYUcNp5ecm3
W04IHQUX6yjINi6GNYIfOswsyMmBYF28jK7yK6BI1M3GRaRBQtyRWMfFchFQn4gqSUE+otd5tAwS
ygrdOK3Ifa0QaFt+qMznBY0kTkPyOEV+v4zJaCTWAUP0VZ0jASlqAy4KVqSWyCShDlrFwikehJjF
YuE7ftIkpcIbTRSoaSPGEODrFcVDWL2II+IDXierZNETnIGfSzh0CY74sFyIj2GQZsTGFz0vipxm
VnDcLAKQLq6fWbDo4mS1vkp0yIs1HUZIp4iom9a54GUYRVT7nqqEzm8xdW7TC0b0GW60xJADmNpv
AI7/JMELGpxThQym8y4LqUuQacidWcKdZhFQKiKNIgoD8iwAVIKK+2ujU4t8saqp1g6YNTnsCruJ
rwprcONC9duYxJ4qBimuHoWSIiZPA9H3YkXqXudW1gklmsIFMYzSIg1JITQrxCqNrm3kDAY2pbUa
rMmigFKs6gR6OmgNHkd0mX2+okN7TAT7Ol9evxD1NQ+DG7sYSa4tNUlADhlgFlfXGRJQGwvgy5AQ
yjBcd84PtHYDkEmakPfpYx9G4XUB+9inERm7fiQ4pfFqFe+o4hGVhmQqWI0CcxU7jZaIyIcg96/E
LK92BkgqOKl6T8JugyrxpKbUqGAv7ulsOiZRub+muhnsO1w2jq+ev3695uEz7TD0D7R01hOuvw9C
/YyTonJmBKIeQBhUGAO4kl0aaUSf9QyDTZKxngaisi47aD7GFxk8gOfU84FbZkuNz4g8dUzGrrz0
nZV2eqQoSuWYs2sxr3bJLydG5jOk6LeoORT7zMwBQVFifBmMWExm1Ro/cIok8FMTafQma3byLxo9
N8NyZt525cNIeXUGMe1X5smGONKgUei8ZJRtu7ZyhkDI7y9f0F/g51cqEow02Vbzn1dZrUVqAclv
qug4ulJpOH6P7/M11yo0yhRtfil6OARasbU8rE2C8Xt9EwFFvAjOV9uNBNrHA0LusrHdne4nrT5J
tE8mE4qrdVpDle/dShWqz9GZt60wsI/uJEXOwPipbjXhlDt67s9jO0KcRL0TomlP2WN7oB0IJioV
30D6OWOSUNi51AkwkWOEYumIAgXrvGEiEI9iSzPsucpOeudceFcOJTmvb6fn90+/f/7+jzv+8+X9
9evL9z/e73bfYby+fTdMscYi56Jw1xGjZBIAuyUG1yZq2paTI2vR8YxObUTR6yxqKN/ssBOpfD6l
2m1PhnCYn16L9XJ1rg/b62TDU8eVaBCSg8TzqrNZi7sclZnjDLasf8eRkLHWMMBdnlWUj8+pyHqM
4ahLDINF0JXmDnFm3OY+MdahsZTb3sHsncAUJ6Kg8aXZxQwWGwQGtajxmWpWlj8cMK236ugILI6Y
JwHGB8FzMIGK1ejWbREDdBUGoT1W5QY4T5wuEE4MlHyZSkuzBsEx9wswLTM+DJS0ZT3P6YUy13jo
2rHVRI1ss4KyVX3TN/h2IyjPx1O2Bb5g9YklcRCUYmPXMBOUeBHz1C8Zcs0KYqZhFbZOZQib0hlx
nz9tn67CaGuOIwLNWdpzotY9B5pLMwaQYWYkd7SVtqYHrnPuEEo9axh7et0c5XRq/UoC7xDBVcRa
XXgBHu37rcYAJl5tVkNPZ5FHmk2bMLzm2Ft5kMI9LQF0ulptzcYAcO0AMUXdk106LtmSw5U8vhrp
Rq2IkpklNmwdxGcblq8C3PVG1RhlPArtCTmr4LPOScZz9uG357eXzzOLz59/fjY4O4Z8zK80Gco1
g9jBZuCtEGxjBJYSG+MHFos5a3TSeaxmPHXZAawoWHv185HA8718we8st6xNXmdE0xFsEamqc+ah
nvCGdd6EEGT+Q4kf2kV9OjYZk53lNe0iaBD6HJcUkW0zO8dp+Z8/vn1Cj103T9S4yLaFI9ghLMv7
dL1YZmStkkDEK9I3YEQanrO1lDctDw9JmfVRugqsaHoSI8PxY5A0K5H5jNxXOZkzBSlgZJbrwDRG
lXAUXcL6RKV6kSWPJqEOzA50i5gaA/bQgyT7jGIMmUx1wupmrFjiIDNZcY4mDPVsMyIToqgkdmCh
GU8KobusL9H7W1x2ZOhf2dU8jM//S9qVNLeNLOn7/AqdpvtFTMcjAAKEDj4UAZCsFjajQIr0haF2
y7aiZcsjyW+e//1kVmGpJYvqmDl4YX5ZK2rJqsrlaPXMQDSNmCUgVSNN2o4nS1jPZCiLeZfq0Z+E
4Flk0iDH0VWOloVaU9/vWXczud8g6lu2GRrszcUjAb29GL6OxyOh/BbrY39LayNYjNmux4MT7RbB
4q26TUnbFM6NQeeY8gz5d/hobyUzU1vJlpjffIR6e/Ty9yIhTccQlFZWWQWCQ2N+xsHOyvoyUjWe
fEOY0djMaNSmt7OSmrzxio7BMTCsVgkZfXKGY2ulUdQ0cacw0q/pN/yJIV1eZEivF9T9+4SGsVMZ
qXhMEFOL2CeRrmMy0mRisxpFvQmDNamFh3jdHwtnAYMDI6Udh5CrVz5STN2wiWqaEMnclXmWXdOu
X6bk5bECUZ3Xyse1zJPkm3RBvTBITB2kzHxEkVkXQ5LKl6vk6LgnklAVL+iLcInenFIYqZTCqIRl
5KLh3A0/Hj4+P90/3n98fX769vDx5UrZFfIxbpkbNEwyTFvB6IPz72dkVMayI0aaEQKB5c6OU7bR
9ZJ6y1CgtAOwkkCWZbX39ljLSjiR0deQrUiCRewJSiJVygP6dWZ0xe8tVTGk1NP8DF9b64Wrqz62
bzQpdRoOQJzQTw1ajr4RqxmKusmuPW3XGEJP9KSBBRbnSI93MlwnUMLfiLF9Tm6vg0Eqmfa2DMJV
dCHiPQ6dKopJjX1ZuDKntbrdspZFmmUELzPWHECY8mLHPzQ182ocyppX6dKjkTnAUeAYMFkM9qYz
XCkZXhsH+minq69ZMp5DvgpSj3dlnQmkRNo6xcyJfILVWIaLPLvDRI8CjG+NVp5kzBbZ7geUmJ6F
aoN3iW6nyMjnUopI9QXv4kFmujfTNGemhkxEr1nhzLHhR3SO3pQ92xZ0JujHd6+cL4t95TFpmtnx
RUY+yJAJHHaQhrap6evPAFFUokWimQ1PbWlCnRE0njyOdCFDQ9RZjK6BOtK9Vb76tJfLtw5YM0Id
2TR0HKoXc59Ch5FI4kciDxKEAdVXgIS6CxILIdNsWB1HsW6JZGFp6ul8zzFnZlBHK6oJCjnEEVlZ
LsrraEHWCFXdwlXAKIxQ+9ZAkBpWAd0Qib01iqTlIb0Amkzkydpk0XcIEzFlFw1TG9BbxQNXsqIk
iplH6uXpu5YBWR4oDCxNltd0B0owoU4+Jk96HVEfzjmMWJB+G2FB+mnFhsjlhDpwWWi6oGRnmymk
u3C4erAiEhn4ylTvNUHoiMuFZ20An4hcMqo2XgYJ2eo2TWPfxwMsuTxmq/b96jpc0EMTz33knZvF
Qo55RMygtSYW09KExfTWvFDH1TerqOv8zwg6n1nGnjVwPGZezLvdpMcFOavazf5DESw8PdseYO19
o96SJyWXUQldk+VKocb0i2mBGCbuoNS8HYaOiXaNXvNQxcCIVdrz+kRlOR6VqczsI7EGwYl8QW5a
9nFcR5IgIdsMiKHOryPVISS7UIRVyxbkFoaQCDw7ioirdJVQly8aT7nFl0e6XDjCLxJGDwsA03B5
ecZKnlVN5Y0avQHMOg+WhFFC1kkdSEPP2kUddz1M1/7sA3+1hlOvr+i3ljDtrEll4XU8oAnag+d1
Irk6UL2xCKnT1RtMcu6VbM3XZKg6+6KoQze5mhplyTvjvqTLhjgdHX29IXEMb0G62hjvpX7qlLrp
0ZOSpgVVFehOHLHhydhMkO1Wkf7sIhkL87kdV5t2X4oiRZisKrJ0jNdix/Lm1mYzqjJW4ytJhkMV
ugm06y/267w7SFf2oiiLbHJUX93/+XA3nvBef36/Nx4vh8azCsMFEU/mFiOrWdlsz/3hb/BiFJ0e
TnY0s8HaMXRF5XT/0LK880GjW0IfLh3PzJjmmM/pkzHhgedFczZiNQx91Ehj8HKOJXF4+PP+aVk+
fPvx76un73iQ1q4ZVT6HZakNnZlmntM1On7GAj5ja7xvKgaWH7xnbsWhztsVr+UuV28LPfYdZl8V
VQh/zPZJZFMysTuXkNwK7aHQ2xqj5ZhEJk51pqvIUR2ijUEtCILTXXYfw5ryfo9fT/WEeox/vL97
uceWy8/25e5VOlC+l26X/3QL6e7/+8f9y+sVU89AxbEtOl4VNQxK3RGqt3L69JlukSVxuAu++vTw
+Hr/DGXfvcDHwMtj/P/r1S8bCVx91RP/YrcW38edgas+JG/30TnjjWHhgL/P647nW/oWUCWVud7A
EuBzk6smG8tZ21vrqp7Per8JrdV6phPDWtJhaDW6JdqM5JX6unxL5lexEo6/voTCTqTGX99ujRE5
LwfqhV/YvZqxTXHOMm4XpHT65Rqo9/eYSOqaeeec7WtBUdHTtkUavIY6BQz6b5ngYXcU3g8y8pmt
1pFDn5n9Mc32qTusouflQIaHKml9a1yAL3QtFCTXWU+nH3iVuY0+cPj3wiiGVCHltmBEUSgw1h5z
npoTDYO3w9aV8bJk6JlLbpXm/nj37ePD4+Pd809Cm0PtfH3P5Fu3UsfupFNOxXt19+P16bdp/v/x
8+oXBhRFcHP+xd4keDc89cus7378+fD0X1f/wrVUOpF/vgOCVtzL/7e8dZ/qxu8TUXfzNBETh3gj
Foa9vaIKxlbKoey8N8rqy/bAXvvxyXRQqiXT7RkVuTmsjPAGw3a+r6XVhSyh//FtDqbxf+8SLWeM
79GWBVnquc9ZGl7TVVLg6ugFA0ADL3qd6ubjBliweJX4UkrQk7Lqw8XRU6FjFi50200TixcLTyuP
2dKLVdlyCSeUaPo6T0+PLxjmAISs+8en71ff7v/n6tMzbLIwX1/c7dedf5Jn+3z3/Qu+xjrhIthW
OzfAD3SsqpviIkk5sjdIQo8IhwRY+meCUurY9prsfdgyjLmlrWqKIGM5btu9eBckOiRueY8++Rvj
gJCbIWeUhQTQ5sDGsxGDRv6POTnqqUPdmg4DWkiLkjOqId+IcUnaPN99vb/648enTzAtcjtg8mZ9
zqocfY/MLQGaPA2ddJL2f95VMpoPfObcSJXnmfFbmh8cCsFccQbLhT9wZik7dSgxgaxpT1AGcwBe
sW2xLrmZRJwEnRcCZF4I6HlNnwRrBeIN39bnooaBTFnojCU2ehwN7IBiU3QdyMq6diQywwgwfN9j
57DspsT45POYAmoF+9cQfszMuuelrGqvVIvdT/tlDNRDOArHvuNdRzoxAKytQqsHgAL9uYEDD0dN
hhq6lU6andZFFy7Mqz6djoOCTooBYvWmMwHiCqvN78cr0dufBzozSEgZAUEYbnR5xYZbGdVL8oIX
kN3WHC1oIKOCR+k1FkGu1PSsbGUgMjpjkIUMWXIgeV66R1Se7qxSJDANIjoxX+merIFQFukiXqXm
rGIdzByMNl+bIdpwOEpfyJ6agQBs2khPRO/T/8xB1pzg8x1sccD0p0DfryaSNrd+mqBVW6CcM28N
EN16Go+YXoqeTlDX5khnB/XcbZPMU/9MZlmmB1xBgAu7MC7OEakKOIJBbGRhbGzqN8xyXDgxUmi2
ETb3+TjEsORrmKC9sSuc66KBRZSb1b85deb6F+Ube5IgSTXQ1/2SwzsvDk2TN01gVhbE0jAyl004
Fhe1ucay7sbgaavIXr1gs4Ut0Vcz9K2yPfbL2NfvkwdNsyulRsNcFTQu2MhrnU0HR2DYbQz+qoC5
VzdVYW4Qa2ij7iB0pskj/tbag0fM0nHGNe4EmwwdRFkOHZR5vaiAlc+jIYFwtQqsh+dBiiGlEblV
re8+/vX48PnL69V/XpVZPt7CEeG2AFWXUcMlL2UTME5Ng3HumBm/6fMwjihkUhifDQAmbHjavViy
9NNIZSwvw2/LIqdAwXasYxTiqPQbUJrazqwNkHR5OfNQ2sEzSr0GUgUplZaLBZVVpNyZUcVgiF4y
zs3MMz2ZfHUxUyVWK/MA3bYqW7px6zwJSH1irWFddszqmk5vmdZOI/2N8aydDdCaf1JdzZ6+vTw9
ghT38PL98W489rjnHDxTZHYU+nxfVac3yPBvua9q8S5d0HjX3Ip3YTytIR2rYA/eoA2fkzMBDk6i
MZJ7xTrD+TzF3TW9zw6eznyQsHt2UzSHwXP8GCL6ct+N+ZbNVtue8Bc6X8SQwbDckoCUOPWWaFhW
7vswXJJjwDmmTldnzV5f7UWte9moczu0OZLarDIJHbutQNDU5xKSGyHQuQB1X6dyOY9RFI1kg/m2
J1l+qpm0scAnBGFUXB54YcPMxbsoNPMcX6ZgNzwzOoYlVgmkjvNG2BWCb7tuRDEIJZ60MxMc0W/s
LHyyo8Tk/fHaVMaUlcYHhjrzd4V9nam6VbT2h5CzypMJK9FK3EpQ9S2jLKUUJpKlnUAUHWfleR8k
sc+XDiZt9x5PN1hx+D4Vq8Ojk7ll/aKCgua/Mby20+8lJpqe7Q4jSMCRG2/vQZT4UOheBZBhAxLn
LfeoLcu2NR53pYAdSe1yiaBINQpTVoNQ/jI1+1SbeO6urjuuTUj4MUdv6Lui3vaGcRPgMBeJGu2d
bMbgccNtmPh+//Hh7lHWwblfRn62RCtsMw+WdXvjuWAinjeUvqaEW3WBaabZ4xcie1k2uShvOLUu
I6jCS5oVy3Ycfp3sYrJmv2XUbEKwYugzwMoIpnzOb4qTcLKSV4veGmcnGHPkSwmi8JG2jQycqGc7
U63eM3IuKnERLouMDGsswQ/QFHsYVGve2WNjY8bZlrSy6XhD3tsgfOAHVppbAJKhPKm/5K3vzYkS
mnfSnr7szZVJlVPciob2hyGreerkJm42iOMTmZ0V7+k5j9jvbE2Kf4j1t7zeMauEm6LGEK29XXKZ
2cEDkFjkNqFuDo1dQQwwiJPOO2DhtFvBJynMzCrouM6uR8VO8v3cpIL4IgedXbIM+4r+QHxF47rW
2WMJ9vqey89t51f31JaLCCz6xY0151iN/mlgvOmxSGciDP95y5MJip5hIFkrG1gCQNolicYtsk4n
rmt0GD6coJGMdxZQMtQUgJHqrB0AnYQra5o8KLPSytAICwYjg/bMpeBK7D0eyyReVHZ6HcXnYvT8
Zfad6AvmLAtALErc/UkFJ8mxr9tSV3OUA6/i1pKD+o1McONKciL6txN1dXAmpoEAmb//vTkNhc8b
sEb359tzdz7CciQK0n2RRHcw/53+2eOGfG7Jizi5ynFeNb1V9SOvK6f0D0XXYJ29H/XDKYe9lzy/
qG+OHuDOu/3a6idFz/aiR5VV+cva5svBB+9oikjIClMYTVOImSqIVttKOvBYPI8MDb23zfB528Ce
bE0NLQylXgHNMRkXO2/d5JsaMGAJdL5kFuqNrMqvxEYBws0bY64C7M2ZTD4JtHphoyQn1udml/Ez
vsDAMVS9DM1rD+K6PplGRtWpvuP0soAM+7Ll57VniCED/Lf2WaUgLt0v7Zg477LcKt2TQrnJkD2G
TNhUW5UJ6e2Xny8PH2HMlXc/5zd1vaPrppUZHrOC01eJiKowuk4Th/6+UJKVDcu3BX1b38OCdEG/
Em8O1AMspWpYGTej7W0HR0AMA05nOODu/eic3XkNxx5tHZ9I4/k5nc4sqHK1Z4aGIjCj3sykh1Jl
/xT5P5Hzavf08oq3HKNGmmPEjImdxyIkinyXeZweAHq7FtQCixArM31lkrXjG1iycrPK2Xqlm2gh
6SCVNCtTzQeBPdSGJ/BVSKcCwIDnEtgpz4Z/HFnK+51N2on3VvUaseNrNgxyDah6/ZuASN/zjKBM
HahF8havDx//olSAhiT7WqAOGZw+9pVppSvgMKM+PtVWMQ0Vp7C3v/VYuPwelbHdTtjvUqiszxEZ
Inpi62I9+sBMpr5DXdxaIhn+GtRDCZpSISURKbuCKNcYgY4kw7pDgbCG49x5d4vBwuqtKQTIDsPL
V+eryPTTjfZXg8xYHxjqOopaR4swvmY2ud1b1WYiSpYxc2rL0Gk1JW2otmRVoryiW21EekzZDEtY
Wm4vrBpIYugSEzOk4US+Jn2OTPAiOFp5TaZLOlHFsA6dFgx0r2sY5LFjFaqy0dsBFTRkQnXD0oEY
W/aqIzmePHb7MxxsEC2i9WgyDM3igGGrOX01Mrfb4z5hYkhIk0kJ2/6GJdF9cJLkyYrCO7zyUEXH
MNMN7nHEMvQY2qtO6KP42jtynTcnNUQmaz+d2mcMTWVsapnF18HRnoea2xizPoP546U5Ef/bygzf
8JJrogdEFGzKKLi+8KEGntB0AmAtLlefnp6v/nh8+PbXr8E/pMDSbddXw8vPDwxrTYnnV7/OJ5R/
WMvTGk96lVNj5TjEX9uqPGatx8vRyADjxdd7aCVv9R16w0vXR+c7KN8ib0wrsa2iYGmP41IeyJSG
0uPdyxep7tk/PX/8cmG97vA5PXY6pOvT2AzjO32a/vnh82c3I5S1t8YFvU62X1YMrIHtZtf0TiVG
POeC2sUNnqrPPSXvCpDz1gXrPTihEGbgmdyN6JqxDI7OvKeeGww+ci2emjd4sTW/t+zvh++vaEzx
cvWqOn0e9/X9q7J2QEuJTw+fr37Fb/N69/z5/tUe9NM36FgtuKGWYbZUqdzT3dSiX15vR9RFnxfU
I4qVB97m154SpCcW3/Dptes3VF9BN4aWWgwLghPIL7CBlIX2ZDre+N/99eM7dpZ8qnz5fn//8Yvh
ELgt2M2+Naf4fAdApdYP1Rteg/BbU+J8kTOQ5/sGH/JE1u212zgJOUqaSNVHi+Qqiy3LTq5HaJ3H
OYJIarGKPZ4GJMxTjClDbZkKjgwl44EWurQiClzqUY/prvjipZs2JsqIA5e2igzD5x66RVfvRAKG
QUnSIB2Qqa2ISemX7IkcnRw6lovKuKhi6/3GNZFCaytUfjVded5KOnX+V/lo2gHy97lqDsWs96tX
CFHnKdVmEEW5wWOrt1nIBEtgS18CWI2bptL+CIsuXt3O9cXAwWWmrbK7fLlcpYsxaItN10cw2igs
aNt7Xm0x9ivnqF9E3eb1QXKjG2cDW6jtMi3r5GN3i/rYOhnVswfw3cIid438cLF2vSABdd6Bg5gQ
zGPVNXQDSBLnhrxQ1RkM3RUNkEczIq1qxNTUPTfNWnlzzjhVJiIt2ptui5p377ULMgByNCkaAD3r
MysykxPElKwRkUmU2m3T+6kGwJp/tFi7vW6qiKRqk4RLk2t3cPM7bADgMJD28k4pMBGLr24kp941
kt56rlokWFn704zybjKWIrpWPV9rm89469fBrIM29MX4xC3N7brTsD0ZtRvxmvYad8hb6v3tIL3v
YiojM0mtC+q5SmH4nCWGu9Jh35iuVdCt3svTp9er3c/v98+/Ha4+S5tM9yVePjVok1o9PTg6LAN9
jSoHtgQ9WpS8Uaas2PH+m1fnCrULhgL0opEs91OYNttCjHIU0S3IifqexaHPdk4eKAAWNS3cA05u
t7Lskxiaz4URxgMw+LPGF5dZwdQoclvb4pIJg6DWyxpLTY63+Crm8k37EW/6co3cdh3aA6oAzHX0
tLKFmZFV2ssiEpVOv0ZAO/fzsVQKdTo9ay1OWdy53eYyUAzuiNpjCzEKjAeyEx0QEnagItfKUb8n
ccimKnFb7p78Q3G+Wb8LF8v0AhscjnXOhcVacZFRRp0DvG7Izh1Qeef81SKO+5Zddy6Yqwg1psnK
VRC4WQFZX4F1ckKS9buvmZwGIZV3airo6QB1wTbhVYS1+uqkZFVbQmfyBt30c9KmxOBsszBKkNGp
3IQnkcTtNsGSnOrSpE52mwri5yJ0xxITQVIFRA8AskjtBhBMHouamSH13CJpWdAuiWeGZEk1qA8N
bzgaOfCQ3VEkyTFNXpFFhkeXXFVRyHpiMGzKOKD8V41fGGUY3gThOaVGEkoUvGvOl7uY42jk4eKG
Wj4Hniw5oveMhvjOVZslthaqVY/8fRBSL4IDXgNLj0EQYncwDhhVsIQqj8t8iydI6N1tZivZGt2J
Xx6uMGvZxYyAIWeXvhgwVOZNyAzsyavssZvxxeJ9RPSDiENKK3HKl19YmdMwjj3uxqePB38RAW80
lGEZwSJyp5gGx6alHsEQXGiFzpeQq+bMkJDBlx2+cBGFF2sUhpdWlZkPT/0XOiaKF+6epMGWGd/E
gCHBeBKSrq9NptUxcteUAYPdaenDrgNinZuxlEh3QCxYBe5EnbDwEhZdwKh6DljizfOck7PJ2EQv
j29tE1WvjXReahv9W1nx8MLGjnB0cUPLUBrNxsa9sfXBFnuxTnkfGS7RRvKplu/UgWGTP4BbEOZ2
bc6pxX6THKnHs3EryVq1UBFywvt1w7o8pGrzexeZL70D/QZvMfeoe+hAmdQlkVu7k92EER9hwPIL
YpViqTA9nXMFyR2oKpZU06oCm07vXkn8v6w92XLjSI6/4qinmYjpLYnU+dAPFElJLPMyk5JV9cJw
2+oqxdqWw8dO13z9Apk8gCRoV8fuS7kEgHkfABKHmM6XElB/OwJn0ZYJfD6SzpL2dnt3paT6rmB5
IBgmoarpllUMpsLhp2YCY40miFKjyyhD6crGwM3Un1m8rkRgJbC3l+YvakEHOWN31sMBCxAk/dJM
SyVwke1KlnaLyDXSnavhVXjwBv0cGWFdg2hwqUpvY6omWt4YeizQFiUwCjrmtjGTg6Pl5fXm++nx
u22B5d3eHu+Pz+eH42tjddWYr3GMoX68uT9/15E1Tt9Przf3+EgAxfW+fY+OltSg/zj9dnd6PpqA
4KzMukdeUM7dMZnBGtCm8OE1f1SueQu5ebq5BbJHDOg12KW2vvl8YvHWjUfYh+UY1bpuCPwxaPXz
8fXH8eXEBm6QRhOlx9d/n5//W3fy53+Oz/+6iB6ejne6Yl8ctOnSNWxkXf4vllAvjVdYKvDl8fn7
zwu9DHABRT6tIJwvpuwCrEF95/x2WQ2Vqistji/ne9SIfLjGPqJsDTyFxd811/gRTyXmr95wJtJM
t+ONxYN+4VIk1a0JHfQtKzxmck/AVeCLUTIpybfCnY0oB0SRq9234aLHHxUdJ7HrDn2vkcWHZXh7
NQu/hnaQNRMxLko2u+ZJ3nu8ez6f7shKUdskTOhSbEjIc1I94Jp5EFrSuHPVLmldI9bXZflVuwiW
GQZ9RG2S+n026ePRhbBGu06D3qhqnW88DCRD1PlppL4qlfPMEwZaaR2o5aki0kRpvpN0tJRmuyLq
nESrtLMkz9IwLbm53bAmXKP0VPQ+CKJEzGaDOCv92aWaDyVkOUSw5A+R0vFaxKkJ4wB1wBjbsVOj
J2j1hmpMVa24qT56O9c4zQSbwIti3ViKfsNKB+xyr+KB1yuSogzjNUs6X0xC3UaXM2+i5I0d80Bf
U38G+FGtkmzNLPh33nWo6YQKzGmBnyl8Cbuudnnglb081khQbndpgK6mMY2+ekh4C/LQu+KQQ+TB
WcRhmwjW89cyrKHdsPthsQ2kRzXEVLi74pC+ahkwLRrN3vOEvKWhdKauV7uSeUhpZ8Bqk3AvQk/B
fMdeXma5OGMa37RCaqXGs+YgJF1xYBiGwAKbemyoNSJ8BRjlCaawl3yb17svUal2vYIbuM5ez2zz
NzkeN/5lWGI+COnBN68DsHRLrO59tc1K9On7SUhZJzFACHCAHYFx8FDoF0tDRqFt2GXuGQcN2nWG
qLxYiUF4RWL92LD2fDRKicKhyvomGhxdGzSj7cuHNZrTbbAoM1gw1rFsUNlSx4n8bCquA705B3d1
zQM4tdMfsY9BrPbK3MMhLhsCGMeUtARB0qn2A6atTcLZNM6u7SNjvyrZK1eiemdQ997vhylcraG2
Npaug9qrrLeyG/gVNbvXA14bwHekjUX8qqyK9WUUx2yyauTWMs2w0HxnYzV+knM7rM17x0fupZ52
IX2PCC7eMkzms57DUtuYHDiRohmLjvFzfKPwgAkAgrSM2EGexId2AdFR6UL8BzRlQL0A6EY1oEKV
/cWkPdv8fow04gWlno7Huwtlgk6Wx9sfj2eQhH5enNokcoP+UdorsDKRuzWoWFvBWC13qV+vy65q
pyOcVesivGru/Xf2Bya/tPOOWQRlGzK6920JUnUcYoQjyWSRFFAAdxrrLOt2GcCnwYjk0mtJPXT+
DvH2JAJYAHFvEQLuLZsOZ+c/p7VWuzKSjiccNjycurqaWFFVHuXMW9rfFlkSti2QDasSuA69NOvW
t3SC7PSi6Uoi91KNcquaSaAmZC1OO1NXWV6EGzlSS0O6ycmua4Bw/ufxjk1h26Iia2qWLmBvH8IS
IsG6GgjGlgD2nyuykiytqc02uj+3LjvafhsDaBbHP4/PRxSp70B2//7I9AiRr+QbAWtU+cJmwBsd
w69V1G8pTdojIpeTBbOIJlgVTd2JnCzTopr+CtV48OWQEE1+hUiM/0RI/MAP56PZQLcQK8fVokRK
B5b0WUAn2gqTwkQqBLB1PkVxzEGOwr+bMBXRNONhH7v3pyK8Dr6fWM+2WN4mqfyNlBK2idxNz6rt
tcqjVLuLsSWuzm/PUrZxbSJVZcTS00Bg063ozokvw32J1rc0DJr+WdWVdZSrOLApAaowXwdTTAfX
wM6sWiut5rBCXzR/G+Vw1pWzyYrqHMS+tB96UbzKmFK9ZQiTrTSAuU/FIEyM4VWJKYKXadm9GNO/
KNtTtVLmKRrp1tB41KDIgDoDahOkGDVpp9sLjbzIb74ftRE9c1huAkV9QEoOKV2TYfIlfq3BG6Oh
HO7fEu6R3YY44GXrqrFb5B8lXq9He8+2X0Yh0zSzXzmUUBhRq8dNWRV2QKgjkRGdP4KMX8dZnn+t
rnsawLpc34uxKSamrlhYcVUVIWaa6RsSDnWxNqE0/XloNKMP59fj0/P5VvKRhhqyMsQwVuL1IXxs
Cn16ePne39VFnih2l2qAtumVXhs0MqXprjREhyDc8GgTNgYBNrY1Qu2az5rZ3v0Y3wzF5WaIYGM/
3l2fno8kBLVBwLD8Q/18eT0+XGSPF/6P09M/0a/h9vQn7IfAehJ5AF4WwOrss5Fu9JYC2sSWfD7f
3N2eH4Y+FPFGr3/IP6+fj8eX2xvYjlfn5+hqqJCPSI0jzX8lh6ECejiNDHUak4v49Ho02NXb6R49
b9pB6jtURWVI3TrxJwbUIuo8OoW/XoNu0NXbzT2M1eBginjC+2XoQd6TlA6n+9PjX0NlStjWKeaX
VlDHgKMyEYWc5piuf15szkD4eKYDWaOAR9/XDv9wfgRwYtDgfZQIjg68lLyUBhtlBMhKK2Bj6Ram
BG0iW+l4pQXByR7t2/3VdKLnJd7116g8umaFBxRbmwLCv15vz4/17uwXY4gxF331xdMO623rG9Qh
dxaSlUyNXysP+FnqSWPgPGpnDWx1MO5kOethgTV2XZpstIPr1Jk2PC/TKbNqq+FFuVjOXU/ojEqm
UzFdZo1voloInwIKFjj86zoD+a21db50dVMOCn5UJvalBKv8lQjmVziDGzUT4XQ6LDrY11mT+deX
OgY88xZCcO0MB1yt1ELzXxpHmnzTI9W1Ktw4LYlDSdR1E7z3wQJ3JXbMEWtcT8UnP6s3fE1wiN0J
YeFrgB05WYPnQ/nfV4k3pmkr4TdzMzO/6+edFubD6rSVzRRqPwcFnrOQ5KzAc6nlNbJjAZe1DEhO
LKpxA69M60OsFsuZ460HOk6CGpkmu4E1Y2WDwNeqARwq8iz85UEFSzoBGjDQisuD/+VyPBozA83E
dx3xeTdJvPmEmrLUAHvKESznAQbMYkIjFQBgOZ2OK55gsIbaAGKGl+gkKlMGmDn0jFPl5cIdM1tJ
BK08O/Tn/8VIpF3j89FyXEzFpQBIZykrFQA1G82qyCh3vMIDVkNWIgLlcikZiHpoF3RAw0KyQ0wa
8z5sseAw38fMo2MOxLzisJE2uUdDo4fpPgT5oQlXTP1mtgfmvxClHgZQZ2WaeBIWrPSdyZxMsgbQ
HEYaoO+nbml5h7E7k+IvoP5nNh7zhZy7k4G88NoUAmO1mKTA2DSp0NyZOUve7tTbYW7ort1aBNjj
Ve9bHpVtft0qMkV0D70tZi/X3BEAfspMpUymXLvF3SoPNNsBUtxgGAxVJjCTrFelrmi0GNswBccD
2fIIS4CbMBNM30VM7lSYB7E/Wo3k9pbVfj0bj3hLal3OoRmxv2uItcbsSMCk33FlJRybRYgyrvwa
0P+4lqCe7oEvtvb7NvEnzlQup/vgly2zuj0+riN8/D1zLP/H8UFHA1PHxxfGkHtl7AGzsG0i5tF7
WaPCb1mNEy/ncMYvZ/zNs2/4vlqw3e9d8bNc+YE7quoMiN0i1dChtCfYoqjA3Exqkw+YHatc9Uto
VtW3xfLABtIeIRPK+HRXA7RplQ9C2PmRBxSur2jDfOnN/TCAbtgrsmTl8ulFnqj2qduMamvkqPwk
IvPJbMAYzmgFVN7U1PaiE/h6SIuXoE2w+YwGV09gbf5n1uErZqbT20ZeztMRyyQWTF3uXQ6QiW2I
2KGmS1e2ogHcbDkbmPogzzAVBTuaAjWZDPj6JDPHdUWrIu8wHdtXz3ThSGpyuGcmc4cd0qX2PJtO
5/LFb449oBDPkHfHt10hd28PD03M/m7U9bQZ0VsHVGcvgRbOcPzyQ1mP1ogu8kuq3Zo62xbmjX28
/dnafv4Hg/wEgfqcx3GjojJ6bK3PvXk9P38OTi+vz6c/3tDMlS7id+k0Yf7j5uX4Wwxkx7uL+Hx+
uvgH1PPPiz/bdryQdtCy/+6XXXKWd3vI9sr3n8/nl9vz0xGGrtvU7cG6Gc+GBAlPOcClfSREbL4W
GZMhknznjqgQXwPEXW6+FgUNjRLkjKjc1NFEeuu231dz3B5v7l9/kEOtgT6/XhQ3r8eL5Px4erWG
xluHk8lIct5ArcZoTJ0XaohDT36xeIKkLTLteXs43Z1ef5J5apqSOJgcikqH21J8N9uiEeuIB50P
fGckWqWysLeYoYKn3dqWyhFPnW25cwj3rKL5iAeEQoitU2k6bneytr6AMwaDcj0cb17eno8PR+CF
3mDQyCCskmg8YwI6/uaLan3I1GJOZ6aB2JLiZXKYSX2L0n0V+cnEmVFlAIXaIj7iYIXP6hUuq4tw
PccqmQWKqHs5nHM3Ns4VcctAjXr7pobbVv3vjLGJ1KVT4AhnRGPZJsqAX2AJMVWGF+wOsBOoqVOM
e4NdvzFcfSPZc9TLA7V0B1yYNXIpCviemrsObchqO55PeaYlgIjaGD+BTxfU6xAAzD0TBA+H+5Ji
SEbx+RsQsykpa5M7Xj6i/tQGAgMwGq2J2qDhhVTsLEdj5qDMcY6kvNWoMecFqKpHnD9CkBcZOza+
KG/siJ65RV6Mpg7pYVwWzGcz3sN8T3zmywMn5AQdvuTjFFFMdZRm3tgVxzfL0UOP1JZDO52RhpEj
aTzmhvoImUjlqfLSdal/Juyg3T5SDhE9WxDfo6Wv3An1cdeAOdf81DNXwvRMZ3JiLo1bSKoFjVky
1QKC5nNpXgAzmbpkZHZqOl44zKxy76exPQ0W0pVGaR8mWoom8rOGzCkknjGN6jeYKpiZMb0U+SFj
AszcfH88vhrtl3j8XC6Wc+ka1giqBr4cLZfsBDCK2cTbpFSUbIE97aG3gaPsg5sSPwzLLAnLsOBs
T+K7U2fSP491VTKL07TCRrdWyIk/XUyIDYeF4OuxQRaJyyKhcTi/Mb96ibf14I8yEWy7GDzStJgJ
e7t/PT3dH/9iQpcWKndM9mWE9T1/e396HJ5rKtmmfhyl7Ti/Pynm4aFNUcavPaFKXWcTlvLiN/Rt
erwDeefxaGtu6mxbjZA9KLFoi89il5cSJaErMW4k5pQiYjtdExisjz2Y1N2QG1tf3I/AappU7Y/f
3+7h/0/nl5N213t/jOukBo2tdWq7gLSb9uMKmMjxdH4F5uIkvNxMnTnRXwYYicRlbPR0wqMMoIQ7
GsuB4BAHB550FOaxZscFEcFqm9huGGHKecZJvhyPZImDf2LEwefjCzJYAh+/ykezUbKhR1TuLEb2
794rUryFs1baA0GuXGpWzi70kJv0bvORdMdEfj4esfMCZO8x1bya3/ysAZjLidR0pg9fYkyPkAGe
GJEu03LUR2IvMVR3800nYge2uTOakSPtW+4B80YcqmtAe9w3wrc9Tx0b/IiOji99HVgfWc/4+a/T
A0o1uEfuTi9Gcdqbf82jTSmjEkcBWslHZVjtycZIVmPGf+botNxZ+KzRj5YHklbFeiQrmtRh6YqX
GiCm7JqAIkgMC+QG3JHDOOh9PHXjUS/ZLxnSdwfi/9c71Rzix4cnVMyI+43shjJMiEtGEh+Wo5lm
3brlqmGiSq5MgIEn1g3695xxZUk+HkvBCUo40Sm3qn/XPFlztAtdIJxwuZKZtSQczEWSXzPrcnP1
FlcXtz9OT/1geYBBU0+moo+rdSRPca+ctpjc8y9tF0XthgrHMcZLEtegSYwY5Zlfam9UYoynwnLA
rdFsuu3XC/X2x4u2J+p6UweKrABNTPc7YJVE6FRl0G1tOv/LJkECeUThQ99LTUBkTKEiXvArP6ku
s9TD4pzKqsIUEWDGyqrMisIyeRCodCMfJIzy4n3GUWsFw5gcFskV1s5xSXRAF6i24wyZH7zKWaRJ
tVU8XDNDYo+GRyb3vdzOYsMoEi/Pt1kaVkmQzGbiUkCyzA/jDFX/RUAdpBFlmBRtiJ0lK2J/w5Fh
k8WkOZHYKiGNQvMuaPUAY7HqL7fj85/n5wd9nj0YfR5zBmrqe4esPb89JhrDz8ofTooz6TWl7xie
BkVGDZ9rQLWK0Bu2dq7pdjfDisbJVgGNV++nP04YS/xfP/5d/+d/Hu/M/z4NFa99bJqYwwMPoLUT
e3snrtJ9ECUJbfMqvtThLfMklDxnUgySS0xkU514PCL2ykhREvtx/EENrXPjWt/wVR4J85PuGU7/
NJx6D4jP5irwEutjEL3CNtT+9vri9fnmVnMRfW8yVSbiSjBLvNyKQygU2SpA8w2xNKsN7HOclt7T
aA+pbfeF0cYyq2RTNF/4e+Lip5GrIgo2xBKsJlwXYfgt7GHrh/ccF5qf7fKYikW6POPQ1AFhwji8
e7ZAcLAWXY8VC9EEP3WKHFxWaRZIdpxIkniq7ALy9xEsYxyBe9ojkIwLoJRPHco0ZBWi6R4vIfOp
LUTYPn/CfyWbWwpuORx0soSBPGgx0pbbJet3EN5BQNvMl46smEW87WLLkEkvtmBfD9BrZ55UWU5W
Dw3qYPESKsokOyQVR8mKJlBEgLFi8cuC8RRaSPf7HqA1uomdxZwUjFDv0xQI6xLK33lBQKNhdy4z
pb+Cizovd0XPueIqpExopphboglbMRTlV2OVHXS4kUa5MbB5BT1h3gF971FDad/zt2F1jYlChbDT
HgokIIysFVqFKZHLAVyUGV+MGhIeSsdKDF6DqoNXllIhgHfxE26W6+qKMxXBUvSlLdzQqNDfFSyX
A2Am/QInv1Dg5J0CrYDAX1YBk7rw92Dycig1Wenh5nxtpPDSrcR794tGkApp8zmYtLhrz1q9kwBA
f4UaMswZJsaotmrH301q+D0TlhBztctK+ag4DA06oxBDJCAiS+E6CO3MFwSDPqVRYbfn2ivkhDwH
aVQayWCtHGvZYBZ7R56eVVlYQ9RA2Cx1XEuDhUUAwhEeApvCyv7SJy52KXD4KdBVw4kaDPVQtwzW
U7DUSqGxRbiuQIQxGSQaRiWK67Ggd6TTW6nk/kQ2SV74wpoND7iO7FPCwOqki5kY2AATL2gHRyty
Gzp3oJnhV0YhtwekpuJrrnXDP0UwcCgbRW9hPT70PGhB/YgcHWq1i+DehemLNqmHN4DYIdVm72hO
ZRsQGYDJA9U1weun/Whg9WmO9vlJpOCuTOVZG961GoPBkbRPmRjCgFL6NGwKRnNfq/oAZjBrc613
mL9dGpUMhjD2vloLsINiNu6owOgK8Ofd7ztKL772gJtYZzEG//gpkKKMchioMMUVchiI5ULoDjBb
urcD5SQhjFaWs11fm2je/jgyJmyt9IUhXvI1tSEPfiuy5HOwD/Q9313zHa+jsiVI2vJY74J1M85N
4XKBRj2eqc9rr/wcHvDftLSqbBdiyU7GRMF31mzuDZG0J7yy9fz0gRnHBA2/T9x5d3rY5RtI802U
oWOlCsvfP729/rn41J5qZbMEKaC3gzW0uJaZq/e6b3QDL8e3u/PFn9KwoDupNQoadDkQk0MjMbsc
3V4aiEOCqeUjZgOvUcB3xkERpvYXmFEas4/grb8jY3cZFikdS0uYLZOct1gDPrjSDU2P37PwEUpa
M+k5d7vbwNGzou2oQbrnMlRLlKgLTWzn4CGigeRpzaINMd6ZX4QsL0WbwQVDgqVl5FstMn/W9moH
yW7vFb3rs9EU9RcNudswQQReaybQjrRj4KAGLv6SUpHL3GJT8Dd9YNC/mUGLgQxwyRrJQlQiRF0P
6M8MeSVboBZZVlbpAE+BX+INUecuC1Kx5zURrmIQqoCIdyyIlHYn3wW5lOsbSKSntE2hfWHgHs9o
YkDgKuyfhhcmFdreF2qXFjSejfldbRRz7/aBg0dYdVmsuPmcIW+6EaWa1cdc5j6mOpJHrvlokPv3
w3wrn71+RA9I/KUPDEWzVyAQU8Zcd81p8wR1VSDVdehdVvk17pet3BCk2uWYS2YYPyQ3amTv+O6g
spK6w6NNcQ4r56s8iobwF9qnrtN3abLAG+KbvWGWepnLM5TGdInHbeai3z+dXs6LxXT52/gTRTc3
aAU3KP+wxcxd9oDFcXPJBoiRLKajgYIXPDOuhfuFgtmrMMcNmCr/b2VPshxHjut9vkLRpzcR7h6X
LGvkgw5ZmawqduWmXFSSLhmyXG0r2lpCyxv7ff0DQDKTC5jyHLrlApDcCYAkFo+IswjwSKy3VQ/z
IYo5infr+O1uHR/PdOvTW59/sgNvuxg3Na/3Ffea6ZIcfYq3izW7QhJQLnHVDSeRRi0OZ1oFyNgM
UVo/t0xT1cJdbgZ86LfeIHhTO5uCfy63KWKzavDHfJv+zYM/8eDFh0iHjyL0H/0ubyt5MvBK14jm
08ghukhSkMkFG1nT4FOB6d/d9ig4nBL7pvLnmnBNlXQy4a9kRqLLRua55CxEDMk6EblM/T4TBtS6
7WzxEhrOp1gdKcpedlzzaUjeaj6c8LeSzcuIFH23OrGLznL+aacvZcq/P8hq2J3ZxzTnUlc5YO1v
Xp/Q4iJIN4pCzq4ef8PR+KwXeM/sHzPNuUE0rQRlsuyQvpHl2iljqcvhLB2avsXUhlStfQur7lg0
hh0AjDqabYYKKif7vTgV3XXINKQyWpC+FMUUlu16zLhoqWLBPa+BuLr7WJBWs7mhQmbWKRWtrfJE
3y6FRdSJ/2xnple96V1w9wsUQQ+OtJkoYeh6SrRZX6q0fYnrBe0TOeegoIQVFIEJDLlDOGjKeJXU
Vn1jx0WhS+OUisAQTRuR1/a1FIumXp/+9q/nz7f3/3p93j/dPXzZ//5t//3ReSweB6ktvDaFJF1V
VJf8+9NIk9R1Aq3gueFIlVdJVkt+b49EaBo7T4GRd1vRST7FlVUbHBoqUBjzlmcAEyUwK6TmWIG5
O7ZndwROF478Qov0BOCD1uah5gHtpPQuxkDu7CfinHt/N4fqaf8llriAfp/+9v36/gu60r3D/315
+M/9u5/Xd9fw6/rL4+39u+frv/ZQ4O2XdxgA9SuytHefH//6TXG57f7pfv/94Nv105c92d9N3E69
be7vHp4wduoturjc/t+19uIz6nhKx3fKOYlHcokhSYPc4izVlWjsYC8IgvWeboEVlcKdixEFO8yU
Htn3DilWEaeju2lYFPMXF4aUrjqcEGrTMyw/RgYdH+LRndcXNePTDCwcusG3MwAh06/M23P69PPx
5eHg5uFpf/DwdKDYgDU/RIx38E6wPgd8GMJFkrHAkLTdprLe2EzLQ4Sf4PmVBYakjZPNZoSxhOPR
LWh4tCVJrPHbug6pt/ZzuikBsyGEpKDhJGumXA13070pVM+/CbsfjlcXJqWPS7VeLQ5Pit4KoaMR
ZZ/nATUCw6bX9Dcogf4wi6LvNqCHBHAvlapeEpLSK6mb3dfP329vfv97//Pghpbw16frx28/7Yt2
M7WxTIgKnXFKosaJNGyZSLNN0DIAOnmbDLRRYL/Ols1aYUaqb87F4cePi09BgRMKI7ob45Pk9eUb
mrrfXL/svxyIexoPdAH4z+3Lt4Pk+fnh5pZQ2fXLdbC107QIurNmYOkGFNPk8H1d5ZfoAWZrkuMO
X8t2ccj7BHg08I+2lEPbipmhaMWZPGfGT0BLgK869hgqSiG5hKNC8xx2dBlOZrpahh3twn2Xdi0z
58uALm92AV3F1FFzjblgdiSo1rsmCflGuRnnIY6i0Z3DJ+cXh0HbEsw13vVFuJwxXJ7Zf5vr52+x
gQaFMSh1UyRMj3EYwnV0XrhREIwryP75JaysST8cMhNLYKXHMwuI0DNbENGY+ZjjhRcXrABa5slW
HIZLQsHDmdVwvZGD+rvF+0yuuH4pTKx1a2pcsN6mTcsjKEOEk4FQy42Mg3Gbv5CwKcmYmTeYNdy4
yBasm7DZ8ptkEdSIQFjMrfgQygTgSR+P48iPi0ONZAqFLznwxwUnYAHBObmMLJ2pvgOdb1mtmcJ2
dSQdsjWLA80wps0zy1hJt9vHb47z1shZw0UGsKGTLKtux4LnpguUx92Kv0jxKIK3Fh8fWWFpggH4
ZSg9DeKtD7UkAV7265SHcVKVoYrrCeI+cswE4Vb9M3wFKMMVR1C7/f46Uib3geIi2g+DyARTq0+6
or8z7dKyneucRr3ZN1A/ayc4qgsnWRTroKGZmUOLJDp5bREW3e0qXH0xeGyuDTpSk4sePuySyyiN
0ym1gx/uHtHFzT0Jm1ld5c4Tt9EsrqqgDydHHJ/Kr2ZmCZCbUDhftV1mtMnm+v7Lw91B+Xr3ef9k
outwLU3KVg5pzR2xsmaJL/Zlz2NYXUBhOMlKGE4rQ0QA/FPi8V6gd5J74WadkzDy/MwzqEdoTqK/
RNyUkUdejw5Pw/FpIvYvy5V/TP9++/np+unnwdPD68vtPaN75XLJCgKCN2m4P7QFxbkgEqOs+FQW
zrhscStvoppZgUCkmIpVUowkFGhOc62jEtdi67g0W9V8KY7DkwUfVaemlVfidLGYbWpUXXeKmmvm
bAnB6YwjGjUef+I2O3bNJu1lgQmGZEpX/GjiEFrKYeyav+js+UypWzBVi3KZvPm2v/n79v6r40RD
9jC4StJtLtvxLYO3q/uFsk03l7JMmsuhhsK6ldk1eXS7NInMjofayWdtYMNSlCnwKPZtAc2ckwZo
y7VwbceSmJXrUoIeiBnXLK5u/B5BRSxTvPtvqsKzKbVJclFGsKXoKFFSG6JWsswwrSiM8tJ9Skur
JmOf9mD4CjGUfbGE5lomMfSEkuRhHZjb3fM5MCgPTNsBjYPSor5IN8pipxErjwLveVeohGk/GWl3
eiwDFibIn1JHlXDYXTqkqewcPSRdOEesdAgPV9Dcrh/crz4cej9HbzlXGyNMLlOxvIxdfVgkvHAm
gqTZKdHvfQmzx3/kqlKpo6ekVhB32PzhOTk9mX6NZ1prM5RZVVh9ZloA+gdlc22Us4oFRW8xH36F
LAhkmqveXCkW60FB22FKRihXMik1E/2dBbfppzgEoO4wxROYK//iCsGWVxz9ppO7R6O8V20LMw2X
ia1FamDSFBys28D+CxCYrDcsd5n+GcDcu9OpQ8P6Slob0kIsAXHIYvIrOxy+hSCVMdjzzCNoQ9n3
qrxyIqXaUCx2YQ3lMrXUdbJ2P0/yAc/SFido2yqVsPtBvCZNY6vfyEGA99iOoQpE3jIOT0K4E+8f
fqCvwwQoqZ0KAUx43W08HCLQeBWfWn3DVMQlWdYMHSj/igUHrK5q0J8cCPtyfI+f6NqdrLp86TYw
rTak4MJiq5zLLarPJCZlOZFp7ZyEa9e5mkeLWZCTzPiSaSHqvkja7VCtVvRq5mCGxhns7MyWH3nl
pETC33OspszR7HD6HvMOYTrUCYKOzeh0CuLSWgx92h6iBJX2KYWUMrNkz7O2ChfyWnQYXqhaZQkT
rQC/ocxcgy17VhUec0OzVoSzlvVIf/LjxCvh5Ie9Gdq1mWZ/6aBftJtCCwDa7Tak7rUXyirv243y
fQuJyAzByX6sbdTT7S6xswgSKBN11XkwdXIB9QKTULwfUbD4nbWgZmSSp04gMk9nm7Z8uUCblSoj
J2T39dkomgR9fLq9f/lbRTq52z9/DS1wSE3c0hROjdJANB31jCjSbUc2yOhElA22Pz/8AS6GPk7r
HHS8fHxE/HeU4qyXojs9miatbdFeJShhpMAXf9O4TOSJc6rNLsukkIx5MYf3ciqAFrWsQCsZRNMA
lZNvB6nhv3NM2d0Ke4Kiozvebdx+3//+cnuntfRnIr1R8KdwLlRd+rAbwNBlqE+JJ059nrAtaIi8
OYRFlO2SZjV0sI3o3ciMMGst4X50FKmWkJwRYp1scLJxM1HThiWdRiY+ly3RfVLWPEdoYBbIXRI2
z9GJvVtqWP8Y28D2JWhEktFrLqDsSjYAVwmeYe2yub5VV1qRkoddIdsi6VJLtPkYahM6eV76+107
JjtMR5WuRJsyOsd0O3Vvr6JfXif/sPMA6v2e7T+/fv2KphDy/vnl6RUjplorqkjWklx1mjOLOU7A
0QxDlJRo7/2PxTR4Np0KghMdP9cwzcC0Nf7cwGtXCKIr0Ld9phy0ZolZoRF73sKasr/H38wHkyRY
tol2Y5VXAmuxxCXi7MIUMXC/mjuBpFaBS8xXZ5/EbCSpaAEJ/+HbX7QbuerCVmbyPG6xo0iq5Z/o
fYgXNjNUwHD5RxGFFnA+nkHDhliXBR9EiB378XsUhYpkfsJTNUk2gmB0ppGO8PJo9aR0hhiHl9gI
aIQrjCuya6R7AlUFazHAW38SRUz+KKwl6B24SJr80mxDDwejDGwHmE9dgehrT4+PXHxPsnDoQP88
PXnP4sYwEZYuYpqLeHXIxds7r+52CwyXKj/FoKwxpFOANyBTiAoiZY1zFGUj6GRSYfwokE7A4T8E
dWoa0kL6clui0WLVyLUs/aZrSuDLvcBrwXItPMat6OAE1avc2FAnTXtLabXdm13dl3WJi0Oheae5
X+LQLhdUXmIh60MXu+CeUdvIjeVauhxqT+KiwwQhrp2vKg7xdJ6JWQrDWNpbhmCw5tqqdE4NU2mD
c22l4E0FUjAZ3EU+8lxFs7sIW7fj/PTH27UOnaKsptFvT4vTQJ3PNqxB8byIb1reLw1ZxOgWKcjp
LMaT9GTC4SMHWR/WbzBxNYQUib5VnptTzbBpMo0UGDYKD6Fzgk2Vdl4M9dok0PWacs7zbf/DX6hE
Nl1v34fOglW6QrIEDZaT0ozwUN56LF3x+iTk9RMCLWW8k7pi8AobvibYWMz/l6xDiY1G9Xg4K6tJ
TmVZ4wWkoTLmxdRKqBye0zcEYdlHsL392QGZ35yFRkFIf1A9PD6/O8BkHa+PSovcXN9/tY970JEU
jXAr53LHASuOebpwkXQJ0HenIzvGW+u+ZlKetdWqC5GTfwYc4jCdW2ETUh3ci0GUWLfy/TTcTabx
6pIGGwx7pnB9ricq0zZ2NyJq2PQw+SRVrbWq9OURNY7L0SR5p0ZPZNRm62YvRuIP/u5MSc3MNZ4h
BUl1hF1F88tBeeXAWePLKx4wGFGiWI4XWkgB3fMpwYgr2mcarmx3u+OwbYWolWBRb1RosTiJy/95
fry9RytG6MLd68v+xx7+sX+5+eOPP/5pBT7GoCxU5JruUcZLp/EqozpnQ7MoRJPsVBElDCj/aEVo
7GEg6PBpphMX9iOz3qLQLTfdvWZ/PPlupzAgYqod+aT4Ne1ax3VeQalhHtcjPw5RBwB8OWlPFx99
MF0DtBp77GOVyNE3PkTyaY6EbrwU3VFQkWzSPk+a4awXvSnt0OdtmjoqIJXeBeMkRB0KNT3LylRB
69mcsKaBg52PN7jeG8E0FfaF3LjWV85n3EGwzVTxu0R2lhO4udL7L5a4KVKNLfD8Ve4IKRc+lIX0
F0j4zXSDN8HoQgN9PPqyFSKDHa50eUZ/UQpURPb8rfTdL9cv1weo6N7g87QT70XPkmRHTmsBiA1r
btkLPUIpdzt8pLVlDKlxAymioCPi4UP6ap3DKSONd6tKGxiespMJvTErG6G0ZzVxxVxSy+yHX29A
MlDeRQbufTE9SAIOo2NN3zGDg0SoTtG91yikDhdOBXohOCWLMzY+m4l37fQ3UOHP9F1XQ7rcjIqp
gmnBWQVDW7IbCdq+ARmZK7W4EybOssXaAFqml11lx2ZEqyLrnjqQByWlNQCU450Ik7XqS3XTN49d
N0m94WnMBfPK22AMctjJboOPNL6qy5HpQFF4G/8r5EkTlKrRBUWPhGrR6sEjwXA+tFKQUt8zeIWg
JdmlBwSOgLfJumgPmeqqfKRqTepKSHoG8VOAUw4+oncOoLgUcO200OE0nI26EaKAHd+c8d0JyjOn
TL8gTRiuolWwdVCho3cw/Q279r01xh8zJ4EaSeXRnIEuvJotgxS1kMBMzg62TtDZqi3hqC/CQcDk
ItwHGEzVW+p6oenF5MZnoq+HtoTz3abitvwS5A7MJvBOCpbnOy8auLZ2QQdQ+iASbMZEY6bso4l/
2DLsAgpdCibVo2FWen8pgnBhuE95lyVsP590g7ZdOltKIL3V+pYlitVgsGjZ8g/UE8eeds0blKbC
JKd3bxxKfo3qKewSkD51IF7Ymv8r4jGAK22XTORw+GE/GtdXvFxrp+s70BilNTm43WNi05mtMIgP
ynWZAdvbpHLx4dMRmRHgbQZnPZBgglDXY59AQ9JfZLKtob18UxWVtUIiV1Y2nXoVfZuOXhOirTUq
HtPozQ72m0i2tCpnCnBDRWtoUxctsO1cCjtIsUaqX24MRo06X2HKJtzGRYa2gdxzjia1TskaYd1U
UYBzqR+S3CdUFX1B0wSq7Y+TY06/83TvQD6EunlIo2789Ws25kMYMWgjr98ZSK70Nf9VpKxsuY58
QDkkLjLb406sJF72De71qj6j50sykvDE+rQvGRMPbDsaR2FYfT6kvhFjld6y7y9O+JBJFoXgLMRH
fB/YAowo/83QV0PJoADvYSKxtuokbk9AJRilyCuYZjxuxKNGiV439WOwYTA9OsnjMTdab1/uVNaC
qnEeKEa4ejunfRrJSeyuatt+pNs/v+DJFO+K0of/3T9df3XyjW17ntmZUxgaUFBmtD/Vu7m9p+uC
J2NHvhSdCnr/xgdGaqkIm2O1k0aSyLzNE+ddGGHq+SL2GuIVx4YtoVKKZCtMwBpenCKVrMwJLE6z
wmuHX2iK9eDuNKRITTsYDrhNq/PgersF7ak6N/LDe+yqzpm2NKDGk46rLsuMY8v4Wb7NIqkh6L6y
kCVaZPABGYmi9QLZuthMnke8u5bTgQ823YweskTjyRm8bYwZZ122JeaMcgJrBk6xERagrrKOj1hT
auruRlwgV54ZLWU7poLZsPGONFWb1pdB8VtAdG66ApdAeRDMVJ8m5QxaWbrF8X0fCUpD2ItAUXHx
GLt4BcI8TtHgdWTwiuUNcczzibCgpsYGNd8WwYBCh73o4C5eP1HNjAheXvhRmL066rkRR18SsrqK
ZWggR4ilfOtUQaWtZFPsEjYAsJp+EwDY6wQJ3vhipDhMfgAutSCLamZBOO+KMzxGFCmcVWd3Dfmn
RIzlTCERpV6NDG57lB9hH1burZeNovsOFbZqUlbvHFaNDh1Qt3/vrEFsezeXsPfPDUdmpf2saA9C
6yj70f8Hj197rz8vAgA=
--===============6893813995268528323==--

