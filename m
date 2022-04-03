Content-Type: multipart/mixed; boundary="===============3112046626281718144=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/scsi/qla2xxx/qla_nvme.c:829 qla_nvme_register_hba() error: we previously assumed 'vha->nvme_local_port' could be null (see line 811)
Date: Sun, 03 Apr 2022 13:08:56 +0800
Message-ID: <202204031242.Z4zJ2uUJ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3112046626281718144==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Arun Easi <aeasi@marvell.com>
CC: "Martin K. Petersen" <martin.petersen@oracle.com>
CC: Himanshu Madhani <himanshu.madhani@oracle.com>
CC: Nilesh Javali <njavali@marvell.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   be2d3ecedd9911fbfd7e55cc9ceac5f8b79ae4cf
commit: db212f2eb3fb7f546366777e93c8f54614d39269 scsi: qla2xxx: Fix loss of=
 NVMe namespaces after driver reload test
date:   3 weeks ago
:::::: branch date: 9 hours ago
:::::: commit date: 3 weeks ago
config: parisc-randconfig-m031-20220403 (https://download.01.org/0day-ci/ar=
chive/20220403/202204031242.Z4zJ2uUJ-lkp(a)intel.com/config)
compiler: hppa-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/scsi/qla2xxx/qla_nvme.c:829 qla_nvme_register_hba() error: we previ=
ously assumed 'vha->nvme_local_port' could be null (see line 811)

vim +829 drivers/scsi/qla2xxx/qla_nvme.c

e84067d7430107 Duane Grigsby   2017-06-21  771  =

8777e4314d397c Quinn Tran      2018-08-02  772  int qla_nvme_register_hba(s=
truct scsi_qla_host *vha)
e84067d7430107 Duane Grigsby   2017-06-21  773  {
e84067d7430107 Duane Grigsby   2017-06-21  774  	struct nvme_fc_port_templa=
te *tmpl;
e84067d7430107 Duane Grigsby   2017-06-21  775  	struct qla_hw_data *ha;
e84067d7430107 Duane Grigsby   2017-06-21  776  	struct nvme_fc_port_info p=
info;
ca4fb89a3d714a Tianjia Zhang   2020-08-02  777  	int ret =3D -EINVAL;
e84067d7430107 Duane Grigsby   2017-06-21  778  =

bcda771b2f7e4f Arnd Bergmann   2017-06-30  779  	if (!IS_ENABLED(CONFIG_NVM=
E_FC))
8777e4314d397c Quinn Tran      2018-08-02  780  		return ret;
bcda771b2f7e4f Arnd Bergmann   2017-06-30  781  =

e84067d7430107 Duane Grigsby   2017-06-21  782  	ha =3D vha->hw;
e84067d7430107 Duane Grigsby   2017-06-21  783  	tmpl =3D &qla_nvme_fc_tran=
sport;
e84067d7430107 Duane Grigsby   2017-06-21  784  =

65120de26a5472 Shreyas Deodhar 2022-01-09  785  	if (ql2xnvme_queues < MIN_=
NVME_HW_QUEUES || ql2xnvme_queues > MAX_NVME_HW_QUEUES) {
65120de26a5472 Shreyas Deodhar 2022-01-09  786  		ql_log(ql_log_warn, vha, =
0xfffd,
65120de26a5472 Shreyas Deodhar 2022-01-09  787  		    "ql2xnvme_queues=3D%d=
 is out of range(MIN:%d - MAX:%d). Resetting ql2xnvme_queues to:%d\n",
65120de26a5472 Shreyas Deodhar 2022-01-09  788  		    ql2xnvme_queues, MIN_=
NVME_HW_QUEUES, MAX_NVME_HW_QUEUES,
65120de26a5472 Shreyas Deodhar 2022-01-09  789  		    DEF_NVME_HW_QUEUES);
65120de26a5472 Shreyas Deodhar 2022-01-09  790  		ql2xnvme_queues =3D DEF_N=
VME_HW_QUEUES;
65120de26a5472 Shreyas Deodhar 2022-01-09  791  	}
65120de26a5472 Shreyas Deodhar 2022-01-09  792  =

e84067d7430107 Duane Grigsby   2017-06-21  793  	qla_nvme_fc_transport.max_=
hw_queues =3D
65120de26a5472 Shreyas Deodhar 2022-01-09  794  	    min((uint8_t)(ql2xnvme=
_queues),
4a0a542fe5e427 Saurav Kashyap  2021-08-09  795  		(uint8_t)(ha->max_qpairs =
? ha->max_qpairs : 1));
e84067d7430107 Duane Grigsby   2017-06-21  796  =

65120de26a5472 Shreyas Deodhar 2022-01-09  797  	ql_log(ql_log_info, vha, 0=
xfffb,
65120de26a5472 Shreyas Deodhar 2022-01-09  798  	       "Number of NVME que=
ues used for this port: %d\n",
65120de26a5472 Shreyas Deodhar 2022-01-09  799  	    qla_nvme_fc_transport.=
max_hw_queues);
65120de26a5472 Shreyas Deodhar 2022-01-09  800  =

e84067d7430107 Duane Grigsby   2017-06-21  801  	pinfo.node_name =3D wwn_to=
_u64(vha->node_name);
e84067d7430107 Duane Grigsby   2017-06-21  802  	pinfo.port_name =3D wwn_to=
_u64(vha->port_name);
e84067d7430107 Duane Grigsby   2017-06-21  803  	pinfo.port_role =3D FC_POR=
T_ROLE_NVME_INITIATOR;
e84067d7430107 Duane Grigsby   2017-06-21  804  	pinfo.port_id =3D vha->d_i=
d.b24;
e84067d7430107 Duane Grigsby   2017-06-21  805  =

db212f2eb3fb7f Arun Easi       2022-03-10  806  	mutex_lock(&ha->vport_lock=
);
db212f2eb3fb7f Arun Easi       2022-03-10  807  	/*
db212f2eb3fb7f Arun Easi       2022-03-10  808  	 * Check again for nvme_lo=
cal_port to see if any other thread raced
db212f2eb3fb7f Arun Easi       2022-03-10  809  	 * with this one and finis=
hed registration.
db212f2eb3fb7f Arun Easi       2022-03-10  810  	 */
db212f2eb3fb7f Arun Easi       2022-03-10 @811  	if (!vha->nvme_local_port)=
 {
e84067d7430107 Duane Grigsby   2017-06-21  812  		ql_log(ql_log_info, vha, =
0xffff,
d7936a96e45c8a Darren Trap     2017-08-23  813  		    "register_localport: =
host-traddr=3Dnn-0x%llx:pn-0x%llx on portID:%x\n",
d7936a96e45c8a Darren Trap     2017-08-23  814  		    pinfo.node_name, pinf=
o.port_name, pinfo.port_id);
e84067d7430107 Duane Grigsby   2017-06-21  815  		qla_nvme_fc_transport.dma=
_boundary =3D vha->host->dma_boundary;
e84067d7430107 Duane Grigsby   2017-06-21  816  =

e84067d7430107 Duane Grigsby   2017-06-21  817  		ret =3D nvme_fc_register_=
localport(&pinfo, tmpl,
db212f2eb3fb7f Arun Easi       2022-03-10  818  						 get_device(&ha->pdev=
->dev),
db212f2eb3fb7f Arun Easi       2022-03-10  819  						 &vha->nvme_local_por=
t);
db212f2eb3fb7f Arun Easi       2022-03-10  820  		mutex_unlock(&ha->vport_l=
ock);
db212f2eb3fb7f Arun Easi       2022-03-10  821  	} else {
db212f2eb3fb7f Arun Easi       2022-03-10  822  		mutex_unlock(&ha->vport_l=
ock);
db212f2eb3fb7f Arun Easi       2022-03-10  823  		return 0;
db212f2eb3fb7f Arun Easi       2022-03-10  824  	}
e84067d7430107 Duane Grigsby   2017-06-21  825  	if (ret) {
e84067d7430107 Duane Grigsby   2017-06-21  826  		ql_log(ql_log_warn, vha, =
0xffff,
e84067d7430107 Duane Grigsby   2017-06-21  827  		    "register_localport f=
ailed: ret=3D%x\n", ret);
8777e4314d397c Quinn Tran      2018-08-02  828  	} else {
e84067d7430107 Duane Grigsby   2017-06-21 @829  		vha->nvme_local_port->pri=
vate =3D vha;
e84067d7430107 Duane Grigsby   2017-06-21  830  	}
8777e4314d397c Quinn Tran      2018-08-02  831  =

8777e4314d397c Quinn Tran      2018-08-02  832  	return ret;
8777e4314d397c Quinn Tran      2018-08-02  833  }
a04658594399e1 Bikash Hazarika 2021-01-11  834  =


:::::: The code at line 829 was first introduced by commit
:::::: e84067d7430107a982858f11c5239542b56a8449 scsi: qla2xxx: Add FC-NVMe =
F/W initialization and transport registration

:::::: TO: Duane Grigsby <duane.grigsby@cavium.com>
:::::: CC: Martin K. Petersen <martin.petersen@oracle.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3112046626281718144==--

