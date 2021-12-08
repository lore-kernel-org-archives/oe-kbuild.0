Content-Type: multipart/mixed; boundary="===============4487910166529465427=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/scsi/pm8001/pm80xx_hwi.c:4844:58: warning: Same expression on both sides of '&'. [knownConditionTrueFalse]
Date: Wed, 08 Dec 2021 20:16:21 +0800
Message-ID: <202112081912.a04On1SL-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4487910166529465427==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Ruksar Devadi <Ruksar.devadi@microchip.com>
CC: "Martin K. Petersen" <martin.petersen@oracle.com>
CC: Viswas G <Viswas.G@microchip.com>
CC: Ashokkumar N <Ashokkumar.N@microchip.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   2a987e65025e2b79c6d453b78cb5985ac6e5eb26
commit: 4f5deeb40f9cf721030a1bdfecb19584fca9091e scsi: pm80xx: Completing p=
ending I/O after fatal error
date:   8 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 8 months ago
compiler: powerpc-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/scsi/pm8001/pm80xx_hwi.c:4844:58: warning: Same expression on bo=
th sides of '&'. [knownConditionTrueFalse]
    payload.dtype_dlr_mcn_ir_retry =3D cpu_to_le32((retryFlag & 0x01) |
                                                            ^
   drivers/scsi/pm8001/pm80xx_hwi.c:4804:17: note: 'retryFlag' is assigned =
value '1' here.
    u8 retryFlag =3D 0x1;
                   ^
   drivers/scsi/pm8001/pm80xx_hwi.c:4844:58: note: Same expression on both =
sides of '&'.
    payload.dtype_dlr_mcn_ir_retry =3D cpu_to_le32((retryFlag & 0x01) |
                                                            ^
>> drivers/scsi/pm8001/pm8001_hwi.c:4489:51: warning: Same expression on bo=
th sides of '&'. [knownConditionTrueFalse]
    payload.dtype_dlr_retry =3D cpu_to_le32((retryFlag & 0x01) |
                                                     ^
   drivers/scsi/pm8001/pm8001_hwi.c:4454:17: note: 'retryFlag' is assigned =
value '1' here.
    u8 retryFlag =3D 0x1;
                   ^
   drivers/scsi/pm8001/pm8001_hwi.c:4489:51: note: Same expression on both =
sides of '&'.
    payload.dtype_dlr_retry =3D cpu_to_le32((retryFlag & 0x01) |
                                                     ^

vim +4844 drivers/scsi/pm8001/pm80xx_hwi.c

f5860992db55c9 Sakthivel K     2013-04-17  4790  =

6ad4a51764a032 Lee Jones       2020-07-21  4791  /*
f5860992db55c9 Sakthivel K     2013-04-17  4792   * see comments on pm8001_=
mpi_reg_resp.
f5860992db55c9 Sakthivel K     2013-04-17  4793   */
f5860992db55c9 Sakthivel K     2013-04-17  4794  static int pm80xx_chip_reg=
_dev_req(struct pm8001_hba_info *pm8001_ha,
f5860992db55c9 Sakthivel K     2013-04-17  4795  	struct pm8001_device *pm8=
001_dev, u32 flag)
f5860992db55c9 Sakthivel K     2013-04-17  4796  {
f5860992db55c9 Sakthivel K     2013-04-17  4797  	struct reg_dev_req payloa=
d;
f5860992db55c9 Sakthivel K     2013-04-17  4798  	u32	opc;
f5860992db55c9 Sakthivel K     2013-04-17  4799  	u32 stp_sspsmp_sata =3D 0=
x4;
f5860992db55c9 Sakthivel K     2013-04-17  4800  	struct inbound_queue_tabl=
e *circularQ;
f5860992db55c9 Sakthivel K     2013-04-17  4801  	u32 linkrate, phy_id;
f5860992db55c9 Sakthivel K     2013-04-17  4802  	int rc, tag =3D 0xdeadbee=
f;
f5860992db55c9 Sakthivel K     2013-04-17  4803  	struct pm8001_ccb_info *c=
cb;
f5860992db55c9 Sakthivel K     2013-04-17  4804  	u8 retryFlag =3D 0x1;
f5860992db55c9 Sakthivel K     2013-04-17  4805  	u16 firstBurstSize =3D 0;
f5860992db55c9 Sakthivel K     2013-04-17  4806  	u16 ITNT =3D 2000;
f5860992db55c9 Sakthivel K     2013-04-17  4807  	struct domain_device *dev=
 =3D pm8001_dev->sas_device;
f5860992db55c9 Sakthivel K     2013-04-17  4808  	struct domain_device *par=
ent_dev =3D dev->parent;
f5860992db55c9 Sakthivel K     2013-04-17  4809  	circularQ =3D &pm8001_ha-=
>inbnd_q_tbl[0];
f5860992db55c9 Sakthivel K     2013-04-17  4810  =

f5860992db55c9 Sakthivel K     2013-04-17  4811  	memset(&payload, 0, sizeo=
f(payload));
f5860992db55c9 Sakthivel K     2013-04-17  4812  	rc =3D pm8001_tag_alloc(p=
m8001_ha, &tag);
f5860992db55c9 Sakthivel K     2013-04-17  4813  	if (rc)
f5860992db55c9 Sakthivel K     2013-04-17  4814  		return rc;
f5860992db55c9 Sakthivel K     2013-04-17  4815  	ccb =3D &pm8001_ha->ccb_i=
nfo[tag];
f5860992db55c9 Sakthivel K     2013-04-17  4816  	ccb->device =3D pm8001_de=
v;
f5860992db55c9 Sakthivel K     2013-04-17  4817  	ccb->ccb_tag =3D tag;
f5860992db55c9 Sakthivel K     2013-04-17  4818  	payload.tag =3D cpu_to_le=
32(tag);
f5860992db55c9 Sakthivel K     2013-04-17  4819  =

f5860992db55c9 Sakthivel K     2013-04-17  4820  	if (flag =3D=3D 1) {
f5860992db55c9 Sakthivel K     2013-04-17  4821  		stp_sspsmp_sata =3D 0x02=
; /*direct attached sata */
f5860992db55c9 Sakthivel K     2013-04-17  4822  	} else {
aa9f8328fc5146 James Bottomley 2013-05-07  4823  		if (pm8001_dev->dev_type=
 =3D=3D SAS_SATA_DEV)
f5860992db55c9 Sakthivel K     2013-04-17  4824  			stp_sspsmp_sata =3D 0x0=
0; /* stp*/
aa9f8328fc5146 James Bottomley 2013-05-07  4825  		else if (pm8001_dev->dev=
_type =3D=3D SAS_END_DEVICE ||
aa9f8328fc5146 James Bottomley 2013-05-07  4826  			pm8001_dev->dev_type =
=3D=3D SAS_EDGE_EXPANDER_DEVICE ||
aa9f8328fc5146 James Bottomley 2013-05-07  4827  			pm8001_dev->dev_type =
=3D=3D SAS_FANOUT_EXPANDER_DEVICE)
f5860992db55c9 Sakthivel K     2013-04-17  4828  			stp_sspsmp_sata =3D 0x0=
1; /*ssp or smp*/
f5860992db55c9 Sakthivel K     2013-04-17  4829  	}
924a3541eab0d2 John Garry      2019-06-10  4830  	if (parent_dev && dev_is_=
expander(parent_dev->dev_type))
f5860992db55c9 Sakthivel K     2013-04-17  4831  		phy_id =3D parent_dev->e=
x_dev.ex_phy->phy_id;
f5860992db55c9 Sakthivel K     2013-04-17  4832  	else
f5860992db55c9 Sakthivel K     2013-04-17  4833  		phy_id =3D pm8001_dev->a=
ttached_phy;
f5860992db55c9 Sakthivel K     2013-04-17  4834  =

f5860992db55c9 Sakthivel K     2013-04-17  4835  	opc =3D OPC_INB_REG_DEV;
f5860992db55c9 Sakthivel K     2013-04-17  4836  =

f5860992db55c9 Sakthivel K     2013-04-17  4837  	linkrate =3D (pm8001_dev-=
>sas_device->linkrate < dev->port->linkrate) ?
f5860992db55c9 Sakthivel K     2013-04-17  4838  			pm8001_dev->sas_device-=
>linkrate : dev->port->linkrate;
f5860992db55c9 Sakthivel K     2013-04-17  4839  =

f5860992db55c9 Sakthivel K     2013-04-17  4840  	payload.phyid_portid =3D
f5860992db55c9 Sakthivel K     2013-04-17  4841  		cpu_to_le32(((pm8001_dev=
->sas_device->port->id) & 0xFF) |
f5860992db55c9 Sakthivel K     2013-04-17  4842  		((phy_id & 0xFF) << 8));
f5860992db55c9 Sakthivel K     2013-04-17  4843  =

f5860992db55c9 Sakthivel K     2013-04-17 @4844  	payload.dtype_dlr_mcn_ir_=
retry =3D cpu_to_le32((retryFlag & 0x01) |
f5860992db55c9 Sakthivel K     2013-04-17  4845  		((linkrate & 0x0F) << 24=
) |
f5860992db55c9 Sakthivel K     2013-04-17  4846  		((stp_sspsmp_sata & 0x03=
) << 28));
f5860992db55c9 Sakthivel K     2013-04-17  4847  	payload.firstburstsize_IT=
Nexustimeout =3D
f5860992db55c9 Sakthivel K     2013-04-17  4848  		cpu_to_le32(ITNT | (firs=
tBurstSize * 0x10000));
f5860992db55c9 Sakthivel K     2013-04-17  4849  =

f5860992db55c9 Sakthivel K     2013-04-17  4850  	memcpy(payload.sas_addr, =
pm8001_dev->sas_device->sas_addr,
f5860992db55c9 Sakthivel K     2013-04-17  4851  		SAS_ADDR_SIZE);
f5860992db55c9 Sakthivel K     2013-04-17  4852  =

91a43fa61f102e peter chang     2019-11-14  4853  	rc =3D pm8001_mpi_build_c=
md(pm8001_ha, circularQ, opc, &payload,
91a43fa61f102e peter chang     2019-11-14  4854  			sizeof(payload), 0);
5533abca06e071 Tomas Henzl     2014-07-09  4855  	if (rc)
5533abca06e071 Tomas Henzl     2014-07-09  4856  		pm8001_tag_free(pm8001_h=
a, tag);
f5860992db55c9 Sakthivel K     2013-04-17  4857  =

f5860992db55c9 Sakthivel K     2013-04-17  4858  	return rc;
f5860992db55c9 Sakthivel K     2013-04-17  4859  }
f5860992db55c9 Sakthivel K     2013-04-17  4860  =


:::::: The code at line 4844 was first introduced by commit
:::::: f5860992db55c9e36b0f120dff73f0c34abe510d [SCSI] pm80xx: Added SPCv/v=
e specific hardware functionalities and relevant changes in common files

:::::: TO: Sakthivel K <Sakthivel.SaravananKamalRaju@pmcs.com>
:::::: CC: James Bottomley <JBottomley@Parallels.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4487910166529465427==--

