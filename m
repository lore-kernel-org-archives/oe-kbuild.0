Content-Type: multipart/mixed; boundary="===============1962744250867940972=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/scsi/pm8001/pm8001_hwi.c:4489:51: warning: Same expression on both sides of '&'. [knownConditionTrueFalse]
Date: Thu, 03 Feb 2022 10:39:13 +0800
Message-ID: <202202030851.HLJaotH4-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1962744250867940972==
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
head:   9f7fb8de5d9bac17b6392a14af40baf555d9129b
commit: 4f5deeb40f9cf721030a1bdfecb19584fca9091e scsi: pm80xx: Completing p=
ending I/O after fatal error
date:   10 months ago
:::::: branch date: 28 hours ago
:::::: commit date: 10 months ago
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

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

vim +4489 drivers/scsi/pm8001/pm8001_hwi.c

dbf9bfe615717d1 jack wang       2009-10-14  4440  =

083645bab221290 Lee Jones       2020-07-21  4441  /*
f74cf271e692848 Sakthivel K     2013-02-27  4442   * see comments on pm8001=
_mpi_reg_resp.
dbf9bfe615717d1 jack wang       2009-10-14  4443   */
dbf9bfe615717d1 jack wang       2009-10-14  4444  static int pm8001_chip_re=
g_dev_req(struct pm8001_hba_info *pm8001_ha,
dbf9bfe615717d1 jack wang       2009-10-14  4445  	struct pm8001_device *pm=
8001_dev, u32 flag)
dbf9bfe615717d1 jack wang       2009-10-14  4446  {
dbf9bfe615717d1 jack wang       2009-10-14  4447  	struct reg_dev_req paylo=
ad;
dbf9bfe615717d1 jack wang       2009-10-14  4448  	u32	opc;
dbf9bfe615717d1 jack wang       2009-10-14  4449  	u32 stp_sspsmp_sata =3D =
0x4;
dbf9bfe615717d1 jack wang       2009-10-14  4450  	struct inbound_queue_tab=
le *circularQ;
dbf9bfe615717d1 jack wang       2009-10-14  4451  	u32 linkrate, phy_id;
72d0baa089ebd05 jack_wang       2009-11-05  4452  	int rc, tag =3D 0xdeadbe=
ef;
dbf9bfe615717d1 jack wang       2009-10-14  4453  	struct pm8001_ccb_info *=
ccb;
dbf9bfe615717d1 jack wang       2009-10-14  4454  	u8 retryFlag =3D 0x1;
dbf9bfe615717d1 jack wang       2009-10-14  4455  	u16 firstBurstSize =3D 0;
dbf9bfe615717d1 jack wang       2009-10-14  4456  	u16 ITNT =3D 2000;
dbf9bfe615717d1 jack wang       2009-10-14  4457  	struct domain_device *de=
v =3D pm8001_dev->sas_device;
dbf9bfe615717d1 jack wang       2009-10-14  4458  	struct domain_device *pa=
rent_dev =3D dev->parent;
dbf9bfe615717d1 jack wang       2009-10-14  4459  	circularQ =3D &pm8001_ha=
->inbnd_q_tbl[0];
dbf9bfe615717d1 jack wang       2009-10-14  4460  =

dbf9bfe615717d1 jack wang       2009-10-14  4461  	memset(&payload, 0, size=
of(payload));
dbf9bfe615717d1 jack wang       2009-10-14  4462  	rc =3D pm8001_tag_alloc(=
pm8001_ha, &tag);
dbf9bfe615717d1 jack wang       2009-10-14  4463  	if (rc)
dbf9bfe615717d1 jack wang       2009-10-14  4464  		return rc;
dbf9bfe615717d1 jack wang       2009-10-14  4465  	ccb =3D &pm8001_ha->ccb_=
info[tag];
dbf9bfe615717d1 jack wang       2009-10-14  4466  	ccb->device =3D pm8001_d=
ev;
dbf9bfe615717d1 jack wang       2009-10-14  4467  	ccb->ccb_tag =3D tag;
dbf9bfe615717d1 jack wang       2009-10-14  4468  	payload.tag =3D cpu_to_l=
e32(tag);
dbf9bfe615717d1 jack wang       2009-10-14  4469  	if (flag =3D=3D 1)
dbf9bfe615717d1 jack wang       2009-10-14  4470  		stp_sspsmp_sata =3D 0x0=
2; /*direct attached sata */
dbf9bfe615717d1 jack wang       2009-10-14  4471  	else {
aa9f8328fc51460 James Bottomley 2013-05-07  4472  		if (pm8001_dev->dev_typ=
e =3D=3D SAS_SATA_DEV)
dbf9bfe615717d1 jack wang       2009-10-14  4473  			stp_sspsmp_sata =3D 0x=
00; /* stp*/
aa9f8328fc51460 James Bottomley 2013-05-07  4474  		else if (pm8001_dev->de=
v_type =3D=3D SAS_END_DEVICE ||
aa9f8328fc51460 James Bottomley 2013-05-07  4475  			pm8001_dev->dev_type =
=3D=3D SAS_EDGE_EXPANDER_DEVICE ||
aa9f8328fc51460 James Bottomley 2013-05-07  4476  			pm8001_dev->dev_type =
=3D=3D SAS_FANOUT_EXPANDER_DEVICE)
dbf9bfe615717d1 jack wang       2009-10-14  4477  			stp_sspsmp_sata =3D 0x=
01; /*ssp or smp*/
dbf9bfe615717d1 jack wang       2009-10-14  4478  	}
924a3541eab0d28 John Garry      2019-06-10  4479  	if (parent_dev && dev_is=
_expander(parent_dev->dev_type))
dbf9bfe615717d1 jack wang       2009-10-14  4480  		phy_id =3D parent_dev->=
ex_dev.ex_phy->phy_id;
dbf9bfe615717d1 jack wang       2009-10-14  4481  	else
dbf9bfe615717d1 jack wang       2009-10-14  4482  		phy_id =3D pm8001_dev->=
attached_phy;
dbf9bfe615717d1 jack wang       2009-10-14  4483  	opc =3D OPC_INB_REG_DEV;
dbf9bfe615717d1 jack wang       2009-10-14  4484  	linkrate =3D (pm8001_dev=
->sas_device->linkrate < dev->port->linkrate) ?
dbf9bfe615717d1 jack wang       2009-10-14  4485  			pm8001_dev->sas_device=
->linkrate : dev->port->linkrate;
dbf9bfe615717d1 jack wang       2009-10-14  4486  	payload.phyid_portid =3D
dbf9bfe615717d1 jack wang       2009-10-14  4487  		cpu_to_le32(((pm8001_de=
v->sas_device->port->id) & 0x0F) |
dbf9bfe615717d1 jack wang       2009-10-14  4488  		((phy_id & 0x0F) << 4));
dbf9bfe615717d1 jack wang       2009-10-14 @4489  	payload.dtype_dlr_retry =
=3D cpu_to_le32((retryFlag & 0x01) |
dbf9bfe615717d1 jack wang       2009-10-14  4490  		((linkrate & 0x0F) * 0x=
1000000) |
dbf9bfe615717d1 jack wang       2009-10-14  4491  		((stp_sspsmp_sata & 0x0=
3) * 0x10000000));
dbf9bfe615717d1 jack wang       2009-10-14  4492  	payload.firstburstsize_I=
TNexustimeout =3D
dbf9bfe615717d1 jack wang       2009-10-14  4493  		cpu_to_le32(ITNT | (fir=
stBurstSize * 0x10000));
afc5ca9ddc6c223 jack wang       2009-12-07  4494  	memcpy(payload.sas_addr,=
 pm8001_dev->sas_device->sas_addr,
dbf9bfe615717d1 jack wang       2009-10-14  4495  		SAS_ADDR_SIZE);
91a43fa61f102e0 peter chang     2019-11-14  4496  	rc =3D pm8001_mpi_build_=
cmd(pm8001_ha, circularQ, opc, &payload,
91a43fa61f102e0 peter chang     2019-11-14  4497  			sizeof(payload), 0);
72d0baa089ebd05 jack_wang       2009-11-05  4498  	return rc;
dbf9bfe615717d1 jack wang       2009-10-14  4499  }
dbf9bfe615717d1 jack wang       2009-10-14  4500  =


:::::: The code at line 4489 was first introduced by commit
:::::: dbf9bfe615717d1145f263c0049fe2328e6ed395 [SCSI] pm8001: add SAS/SATA=
 HBA driver

:::::: TO: jack wang <jack_wang@usish.com>
:::::: CC: James Bottomley <James.Bottomley@suse.de>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1962744250867940972==--

