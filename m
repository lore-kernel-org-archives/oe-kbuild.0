Content-Type: multipart/mixed; boundary="===============0381101347981668124=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/scsi/lpfc/lpfc_els.c:7696:38: sparse: sparse: invalid assignment: |=
Date: Mon, 02 May 2022 13:50:22 +0800
Message-ID: <202205021335.c9ZV3Vqo-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0381101347981668124==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: James Smart <jsmart2021@gmail.com>
CC: "Martin K. Petersen" <martin.petersen@oracle.com>
CC: Justin Tee <justin.tee@broadcom.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   672c0c5173427e6b3e2a9bbb7be51ceeec78093a
commit: 6831ce129f1948f50f2d2a57995d2ebd7a6fa0b4 scsi: lpfc: SLI path split=
: Refactor base ELS paths and the FLOGI path
date:   7 weeks ago
:::::: branch date: 9 hours ago
:::::: commit date: 7 weeks ago
config: arm-randconfig-s031-20220502 (https://download.01.org/0day-ci/archi=
ve/20220502/202205021335.c9ZV3Vqo-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D6831ce129f1948f50f2d2a57995d2ebd7a6fa0b4
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 6831ce129f1948f50f2d2a57995d2ebd7a6fa0b4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.3.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Da=
rm SHELL=3D/bin/bash drivers/scsi/lpfc/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
   drivers/scsi/lpfc/lpfc_els.c:6521:39: sparse:     expected unsigned int =
[usertype] function_flags
   drivers/scsi/lpfc/lpfc_els.c:6521:39: sparse:     got restricted __be32 =
[usertype]
   drivers/scsi/lpfc/lpfc_els.c:6522:22: sparse: sparse: incorrect type in =
assignment (different base types) @@     expected unsigned int [usertype] l=
ength @@     got restricted __be32 [usertype] @@
   drivers/scsi/lpfc/lpfc_els.c:6522:22: sparse:     expected unsigned int =
[usertype] length
   drivers/scsi/lpfc/lpfc_els.c:6522:22: sparse:     got restricted __be32 =
[usertype]
   drivers/scsi/lpfc/lpfc_els.c:6533:19: sparse: sparse: incorrect type in =
assignment (different base types) @@     expected unsigned int [usertype] t=
ag @@     got restricted __be32 [usertype] @@
   drivers/scsi/lpfc/lpfc_els.c:6533:19: sparse:     expected unsigned int =
[usertype] tag
   drivers/scsi/lpfc/lpfc_els.c:6533:19: sparse:     got restricted __be32 =
[usertype]
   drivers/scsi/lpfc/lpfc_els.c:6550:39: sparse: sparse: incorrect type in =
assignment (different base types) @@     expected unsigned int [usertype] f=
unction_flags @@     got restricted __be32 [usertype] @@
   drivers/scsi/lpfc/lpfc_els.c:6550:39: sparse:     expected unsigned int =
[usertype] function_flags
   drivers/scsi/lpfc/lpfc_els.c:6550:39: sparse:     got restricted __be32 =
[usertype]
   drivers/scsi/lpfc/lpfc_els.c:6551:22: sparse: sparse: incorrect type in =
assignment (different base types) @@     expected unsigned int [usertype] l=
ength @@     got restricted __be32 [usertype] @@
   drivers/scsi/lpfc/lpfc_els.c:6551:22: sparse:     expected unsigned int =
[usertype] length
   drivers/scsi/lpfc/lpfc_els.c:6551:22: sparse:     got restricted __be32 =
[usertype]
   drivers/scsi/lpfc/lpfc_els.c:6562:19: sparse: sparse: incorrect type in =
assignment (different base types) @@     expected unsigned int [usertype] t=
ag @@     got restricted __be32 [usertype] @@
   drivers/scsi/lpfc/lpfc_els.c:6562:19: sparse:     expected unsigned int =
[usertype] tag
   drivers/scsi/lpfc/lpfc_els.c:6562:19: sparse:     got restricted __be32 =
[usertype]
   drivers/scsi/lpfc/lpfc_els.c:6579:39: sparse: sparse: incorrect type in =
assignment (different base types) @@     expected unsigned int [usertype] f=
unction_flags @@     got restricted __be32 [usertype] @@
   drivers/scsi/lpfc/lpfc_els.c:6579:39: sparse:     expected unsigned int =
[usertype] function_flags
   drivers/scsi/lpfc/lpfc_els.c:6579:39: sparse:     got restricted __be32 =
[usertype]
   drivers/scsi/lpfc/lpfc_els.c:6580:22: sparse: sparse: incorrect type in =
assignment (different base types) @@     expected unsigned int [usertype] l=
ength @@     got restricted __be32 [usertype] @@
   drivers/scsi/lpfc/lpfc_els.c:6580:22: sparse:     expected unsigned int =
[usertype] length
   drivers/scsi/lpfc/lpfc_els.c:6580:22: sparse:     got restricted __be32 =
[usertype]
   drivers/scsi/lpfc/lpfc_els.c:6592:19: sparse: sparse: incorrect type in =
assignment (different base types) @@     expected unsigned int [usertype] t=
ag @@     got restricted __be32 [usertype] @@
   drivers/scsi/lpfc/lpfc_els.c:6592:19: sparse:     expected unsigned int =
[usertype] tag
   drivers/scsi/lpfc/lpfc_els.c:6592:19: sparse:     got restricted __be32 =
[usertype]
   drivers/scsi/lpfc/lpfc_els.c:6609:39: sparse: sparse: incorrect type in =
assignment (different base types) @@     expected unsigned int [usertype] f=
unction_flags @@     got restricted __be32 [usertype] @@
   drivers/scsi/lpfc/lpfc_els.c:6609:39: sparse:     expected unsigned int =
[usertype] function_flags
   drivers/scsi/lpfc/lpfc_els.c:6609:39: sparse:     got restricted __be32 =
[usertype]
   drivers/scsi/lpfc/lpfc_els.c:6610:22: sparse: sparse: incorrect type in =
assignment (different base types) @@     expected unsigned int [usertype] l=
ength @@     got restricted __be32 [usertype] @@
   drivers/scsi/lpfc/lpfc_els.c:6610:22: sparse:     expected unsigned int =
[usertype] length
   drivers/scsi/lpfc/lpfc_els.c:6610:22: sparse:     got restricted __be32 =
[usertype]
   drivers/scsi/lpfc/lpfc_els.c:6618:19: sparse: sparse: incorrect type in =
assignment (different base types) @@     expected unsigned int [usertype] t=
ag @@     got restricted __be32 [usertype] @@
   drivers/scsi/lpfc/lpfc_els.c:6618:19: sparse:     expected unsigned int =
[usertype] tag
   drivers/scsi/lpfc/lpfc_els.c:6618:19: sparse:     got restricted __be32 =
[usertype]
   drivers/scsi/lpfc/lpfc_els.c:6624:22: sparse: sparse: incorrect type in =
assignment (different base types) @@     expected unsigned int [usertype] l=
ength @@     got restricted __be32 [usertype] @@
   drivers/scsi/lpfc/lpfc_els.c:6624:22: sparse:     expected unsigned int =
[usertype] length
   drivers/scsi/lpfc/lpfc_els.c:6624:22: sparse:     got restricted __be32 =
[usertype]
   drivers/scsi/lpfc/lpfc_els.c:6633:19: sparse: sparse: incorrect type in =
assignment (different base types) @@     expected unsigned int [usertype] t=
ag @@     got restricted __be32 [usertype] @@
   drivers/scsi/lpfc/lpfc_els.c:6633:19: sparse:     expected unsigned int =
[usertype] tag
   drivers/scsi/lpfc/lpfc_els.c:6633:19: sparse:     got restricted __be32 =
[usertype]
   drivers/scsi/lpfc/lpfc_els.c:6635:36: sparse: sparse: incorrect type in =
assignment (different base types) @@     expected unsigned int [usertype] C=
orrectedBlocks @@     got restricted __be32 [usertype] @@
   drivers/scsi/lpfc/lpfc_els.c:6635:36: sparse:     expected unsigned int =
[usertype] CorrectedBlocks
   drivers/scsi/lpfc/lpfc_els.c:6635:36: sparse:     got restricted __be32 =
[usertype]
   drivers/scsi/lpfc/lpfc_els.c:6637:40: sparse: sparse: incorrect type in =
assignment (different base types) @@     expected unsigned int [usertype] U=
ncorrectableBlocks @@     got restricted __be32 [usertype] @@
   drivers/scsi/lpfc/lpfc_els.c:6637:40: sparse:     expected unsigned int =
[usertype] UncorrectableBlocks
   drivers/scsi/lpfc/lpfc_els.c:6637:40: sparse:     got restricted __be32 =
[usertype]
   drivers/scsi/lpfc/lpfc_els.c:6640:22: sparse: sparse: incorrect type in =
assignment (different base types) @@     expected unsigned int [usertype] l=
ength @@     got restricted __be32 [usertype] @@
   drivers/scsi/lpfc/lpfc_els.c:6640:22: sparse:     expected unsigned int =
[usertype] length
   drivers/scsi/lpfc/lpfc_els.c:6640:22: sparse:     got restricted __be32 =
[usertype]
   drivers/scsi/lpfc/lpfc_els.c:6651:19: sparse: sparse: incorrect type in =
assignment (different base types) @@     expected unsigned int [usertype] t=
ag @@     got restricted __be32 [usertype] @@
   drivers/scsi/lpfc/lpfc_els.c:6651:19: sparse:     expected unsigned int =
[usertype] tag
   drivers/scsi/lpfc/lpfc_els.c:6651:19: sparse:     got restricted __be32 =
[usertype]
   drivers/scsi/lpfc/lpfc_els.c:6689:37: sparse: sparse: incorrect type in =
assignment (different base types) @@     expected unsigned short [usertype]=
 speed @@     got restricted __be16 [usertype] @@
   drivers/scsi/lpfc/lpfc_els.c:6689:37: sparse:     expected unsigned shor=
t [usertype] speed
   drivers/scsi/lpfc/lpfc_els.c:6689:37: sparse:     got restricted __be16 =
[usertype]
   drivers/scsi/lpfc/lpfc_els.c:6717:44: sparse: sparse: incorrect type in =
assignment (different base types) @@     expected unsigned short [usertype]=
 capabilities @@     got restricted __be16 [usertype] @@
   drivers/scsi/lpfc/lpfc_els.c:6717:44: sparse:     expected unsigned shor=
t [usertype] capabilities
   drivers/scsi/lpfc/lpfc_els.c:6717:44: sparse:     got restricted __be16 =
[usertype]
   drivers/scsi/lpfc/lpfc_els.c:6718:22: sparse: sparse: incorrect type in =
assignment (different base types) @@     expected unsigned int [usertype] l=
ength @@     got restricted __be32 [usertype] @@
   drivers/scsi/lpfc/lpfc_els.c:6718:22: sparse:     expected unsigned int =
[usertype] length
   drivers/scsi/lpfc/lpfc_els.c:6718:22: sparse:     got restricted __be32 =
[usertype]
   drivers/scsi/lpfc/lpfc_els.c:6727:19: sparse: sparse: incorrect type in =
assignment (different base types) @@     expected unsigned int [usertype] t=
ag @@     got restricted __be32 [usertype] @@
   drivers/scsi/lpfc/lpfc_els.c:6727:19: sparse:     expected unsigned int =
[usertype] tag
   drivers/scsi/lpfc/lpfc_els.c:6727:19: sparse:     got restricted __be32 =
[usertype]
   drivers/scsi/lpfc/lpfc_els.c:6735:22: sparse: sparse: incorrect type in =
assignment (different base types) @@     expected unsigned int [usertype] l=
ength @@     got restricted __be32 [usertype] @@
   drivers/scsi/lpfc/lpfc_els.c:6735:22: sparse:     expected unsigned int =
[usertype] length
   drivers/scsi/lpfc/lpfc_els.c:6735:22: sparse:     got restricted __be32 =
[usertype]
   drivers/scsi/lpfc/lpfc_els.c:6744:19: sparse: sparse: incorrect type in =
assignment (different base types) @@     expected unsigned int [usertype] t=
ag @@     got restricted __be32 [usertype] @@
   drivers/scsi/lpfc/lpfc_els.c:6744:19: sparse:     expected unsigned int =
[usertype] tag
   drivers/scsi/lpfc/lpfc_els.c:6744:19: sparse:     got restricted __be32 =
[usertype]
   drivers/scsi/lpfc/lpfc_els.c:6759:22: sparse: sparse: incorrect type in =
assignment (different base types) @@     expected unsigned int [usertype] l=
ength @@     got restricted __be32 [usertype] @@
   drivers/scsi/lpfc/lpfc_els.c:6759:22: sparse:     expected unsigned int =
[usertype] length
   drivers/scsi/lpfc/lpfc_els.c:6759:22: sparse:     got restricted __be32 =
[usertype]
   drivers/scsi/lpfc/lpfc_els.c:6850:25: sparse: sparse: incorrect type in =
assignment (different base types) @@     expected unsigned int [usertype] l=
ength @@     got restricted __be32 [usertype] @@
   drivers/scsi/lpfc/lpfc_els.c:6850:25: sparse:     expected unsigned int =
[usertype] length
   drivers/scsi/lpfc/lpfc_els.c:6850:25: sparse:     got restricted __be32 =
[usertype]
   drivers/scsi/lpfc/lpfc_els.c:6858:22: sparse: sparse: cast to restricted=
 __le32
   drivers/scsi/lpfc/lpfc_els.c:6993:9: sparse: sparse: cast to restricted =
__be32
   drivers/scsi/lpfc/lpfc_els.c:6993:9: sparse: sparse: cast to restricted =
__be32
   drivers/scsi/lpfc/lpfc_els.c:6993:9: sparse: sparse: cast to restricted =
__be32
   drivers/scsi/lpfc/lpfc_els.c:6993:9: sparse: sparse: cast to restricted =
__be32
   drivers/scsi/lpfc/lpfc_els.c:6993:9: sparse: sparse: cast to restricted =
__be32
   drivers/scsi/lpfc/lpfc_els.c:6993:9: sparse: sparse: cast to restricted =
__be32
   drivers/scsi/lpfc/lpfc_els.c:6993:9: sparse: sparse: cast to restricted =
__be32
   drivers/scsi/lpfc/lpfc_els.c:6993:9: sparse: sparse: cast to restricted =
__be32
   drivers/scsi/lpfc/lpfc_els.c:7002:25: sparse: sparse: cast to restricted=
 __be32
   drivers/scsi/lpfc/lpfc_els.c:7004:36: sparse: sparse: cast to restricted=
 __be32
   drivers/scsi/lpfc/lpfc_els.c:7007:25: sparse: sparse: cast to restricted=
 __be32
   drivers/scsi/lpfc/lpfc_els.c:7212:17: sparse: sparse: cast to restricted=
 __be16
   drivers/scsi/lpfc/lpfc_els.c:7217:21: sparse: sparse: cast to restricted=
 __be16
   drivers/scsi/lpfc/lpfc_els.c:7227:17: sparse: sparse: cast to restricted=
 __be16
   drivers/scsi/lpfc/lpfc_els.c:7272:9: sparse: sparse: cast to restricted =
__be16
   drivers/scsi/lpfc/lpfc_els.c:7272:9: sparse: sparse: cast to restricted =
__be16
   drivers/scsi/lpfc/lpfc_els.c:7416:31: sparse: sparse: cast to restricted=
 __be32
   drivers/scsi/lpfc/lpfc_els.c:7419:44: sparse: sparse: cast to restricted=
 __be32
   drivers/scsi/lpfc/lpfc_els.c:7516:23: sparse: sparse: cast to restricted=
 __be32
   drivers/scsi/lpfc/lpfc_els.c:7577:23: sparse: sparse: cast to restricted=
 __be32
   drivers/scsi/lpfc/lpfc_els.c:7630:37: sparse: sparse: cast to restricted=
 __be32
   drivers/scsi/lpfc/lpfc_els.c:7691:42: sparse: sparse: cast to restricted=
 __be32
>> drivers/scsi/lpfc/lpfc_els.c:7696:38: sparse: sparse: invalid assignment=
: |=3D
>> drivers/scsi/lpfc/lpfc_els.c:7696:38: sparse:    left side has type unsi=
gned int
>> drivers/scsi/lpfc/lpfc_els.c:7696:38: sparse:    right side has type res=
tricted __be32
>> drivers/scsi/lpfc/lpfc_els.c:8207:33: sparse: sparse: incorrect type in =
assignment (different base types) @@     expected unsigned int [usertype] l=
inkFailureCnt @@     got restricted __be32 [usertype] @@
   drivers/scsi/lpfc/lpfc_els.c:8207:33: sparse:     expected unsigned int =
[usertype] linkFailureCnt
   drivers/scsi/lpfc/lpfc_els.c:8207:33: sparse:     got restricted __be32 =
[usertype]
   drivers/scsi/lpfc/lpfc_els.c:8208:30: sparse: sparse: too many warnings

vim +7696 drivers/scsi/lpfc/lpfc_els.c

ddcc50f0f3538e James Smart        2008-12-04  7538  =

e59058c44025d7 James Smart        2008-08-24  7539  /**
3621a710a7dbb2 James Smart        2009-04-06  7540   * lpfc_els_rcv_rscn - =
Process an unsolicited rscn iocb
e59058c44025d7 James Smart        2008-08-24  7541   * @vport: pointer to a=
 host virtual N_Port data structure.
e59058c44025d7 James Smart        2008-08-24  7542   * @cmdiocb: pointer to=
 lpfc command iocb data structure.
e59058c44025d7 James Smart        2008-08-24  7543   * @ndlp: pointer to a =
node-list data structure.
e59058c44025d7 James Smart        2008-08-24  7544   *
e59058c44025d7 James Smart        2008-08-24  7545   * This routine process=
es an unsolicited RSCN (Registration State Change
e59058c44025d7 James Smart        2008-08-24  7546   * Notification) IOCB. =
First, the payload of the unsolicited RSCN is walked
e59058c44025d7 James Smart        2008-08-24  7547   * to invoke fc_host_po=
st_event() routine to the FC transport layer. If the
e59058c44025d7 James Smart        2008-08-24  7548   * discover state machi=
ne is about to begin discovery, it just accepts the
e59058c44025d7 James Smart        2008-08-24  7549   * RSCN and the discove=
ry process will satisfy the RSCN. If this RSCN only
e59058c44025d7 James Smart        2008-08-24  7550   * contains N_Port IDs =
for other vports on this HBA, it just accepts the
e59058c44025d7 James Smart        2008-08-24  7551   * RSCN and ignore proc=
essing it. If the state machine is in the recovery
e59058c44025d7 James Smart        2008-08-24  7552   * state, the fc_rscn_i=
d_list of this @vport is walked and the
e59058c44025d7 James Smart        2008-08-24  7553   * lpfc_rscn_recovery_c=
heck() routine is invoked to send recovery event for
e59058c44025d7 James Smart        2008-08-24  7554   * all nodes that match=
 RSCN payload. Otherwise, the lpfc_els_handle_rscn()
e59058c44025d7 James Smart        2008-08-24  7555   * routine is invoked t=
o handle the RSCN event.
e59058c44025d7 James Smart        2008-08-24  7556   *
e59058c44025d7 James Smart        2008-08-24  7557   * Return code
e59058c44025d7 James Smart        2008-08-24  7558   *   0 - Just sent the =
acc response
e59058c44025d7 James Smart        2008-08-24  7559   *   1 - Sent the acc r=
esponse and waited for name server completion
e59058c44025d7 James Smart        2008-08-24  7560   **/
dea3101e0a5c89 James Bottomley    2005-04-17  7561  static int
2e0fef85e098f6 James Smart        2007-06-17  7562  lpfc_els_rcv_rscn(struc=
t lpfc_vport *vport, struct lpfc_iocbq *cmdiocb,
51ef4c26891a73 James Smart        2007-08-02  7563  		  struct lpfc_nodelis=
t *ndlp)
dea3101e0a5c89 James Bottomley    2005-04-17  7564  {
2e0fef85e098f6 James Smart        2007-06-17  7565  	struct Scsi_Host *shos=
t =3D lpfc_shost_from_vport(vport);
2e0fef85e098f6 James Smart        2007-06-17  7566  	struct lpfc_hba  *phba=
 =3D vport->phba;
dea3101e0a5c89 James Bottomley    2005-04-17  7567  	struct lpfc_dmabuf *pc=
md;
92d7f7b0cde3ad James Smart        2007-06-17  7568  	uint32_t *lp, *datap;
92d7f7b0cde3ad James Smart        2007-06-17  7569  	uint32_t payload_len, =
length, nportid, *cmd;
7f5f3d0d02aa2f James Smart        2008-02-08  7570  	int rscn_cnt;
92d7f7b0cde3ad James Smart        2007-06-17  7571  	int rscn_id =3D 0, hba=
_id =3D 0;
2332e6e475b016 James Smart        2019-11-04  7572  	int i, tmo;
dea3101e0a5c89 James Bottomley    2005-04-17  7573  =

dea3101e0a5c89 James Bottomley    2005-04-17  7574  	pcmd =3D (struct lpfc_=
dmabuf *) cmdiocb->context2;
dea3101e0a5c89 James Bottomley    2005-04-17  7575  	lp =3D (uint32_t *) pc=
md->virt;
dea3101e0a5c89 James Bottomley    2005-04-17  7576  =

92d7f7b0cde3ad James Smart        2007-06-17  7577  	payload_len =3D be32_t=
o_cpu(*lp++ & ~ELS_CMD_MASK);
dea3101e0a5c89 James Bottomley    2005-04-17  7578  	payload_len -=3D sizeo=
f(uint32_t);	/* take off word 0 */
dea3101e0a5c89 James Bottomley    2005-04-17  7579  	/* RSCN received */
e8b62011d88d6f James Smart        2007-08-02  7580  	lpfc_printf_vlog(vport=
, KERN_INFO, LOG_DISCOVERY,
e8b62011d88d6f James Smart        2007-08-02  7581  			 "0214 RSCN received=
 Data: x%x x%x x%x x%x\n",
7f5f3d0d02aa2f James Smart        2008-02-08  7582  			 vport->fc_flag, pay=
load_len, *lp,
7f5f3d0d02aa2f James Smart        2008-02-08  7583  			 vport->fc_rscn_id_c=
nt);
ddcc50f0f3538e James Smart        2008-12-04  7584  =

ddcc50f0f3538e James Smart        2008-12-04  7585  	/* Send an RSCN event =
to the management application */
ddcc50f0f3538e James Smart        2008-12-04  7586  	lpfc_send_rscn_event(v=
port, cmdiocb);
ddcc50f0f3538e James Smart        2008-12-04  7587  =

d2873e4c1ef293 James Smart        2006-08-18  7588  	for (i =3D 0; i < payl=
oad_len/sizeof(uint32_t); i++)
2e0fef85e098f6 James Smart        2007-06-17  7589  		fc_host_post_event(sh=
ost, fc_get_event_number(),
d2873e4c1ef293 James Smart        2006-08-18  7590  			FCH_EVT_RSCN, lp[i]);
d2873e4c1ef293 James Smart        2006-08-18  7591  =

f60cb93bbfecf1 James Smart        2019-05-14  7592  	/* Check if RSCN is co=
ming from a direct-connected remote NPort */
f60cb93bbfecf1 James Smart        2019-05-14  7593  	if (vport->fc_flag & F=
C_PT2PT) {
f60cb93bbfecf1 James Smart        2019-05-14  7594  		/* If so, just ACC it=
, no other action needed for now */
f60cb93bbfecf1 James Smart        2019-05-14  7595  		lpfc_printf_vlog(vpor=
t, KERN_INFO, LOG_ELS,
f60cb93bbfecf1 James Smart        2019-05-14  7596  				 "2024 pt2pt RSCN %=
08x Data: x%x x%x\n",
f60cb93bbfecf1 James Smart        2019-05-14  7597  				 *lp, vport->fc_fla=
g, payload_len);
f60cb93bbfecf1 James Smart        2019-05-14  7598  		lpfc_els_rsp_acc(vpor=
t, ELS_CMD_ACC, cmdiocb, ndlp, NULL);
6f2589f478795c James Smart        2019-05-14  7599  =

a6d10f24a04d65 James Smart        2019-08-14  7600  		/* Check to see if we=
 need to NVME rescan this target
a6d10f24a04d65 James Smart        2019-08-14  7601  		 * remoteport.
a6d10f24a04d65 James Smart        2019-08-14  7602  		 */
a6d10f24a04d65 James Smart        2019-08-14  7603  		if (ndlp->nlp_fc4_typ=
e & NLP_FC4_NVME &&
a6d10f24a04d65 James Smart        2019-08-14  7604  		    ndlp->nlp_type & =
(NLP_NVME_TARGET | NLP_NVME_DISCOVERY))
6f2589f478795c James Smart        2019-05-14  7605  			lpfc_nvme_rescan_por=
t(vport, ndlp);
f60cb93bbfecf1 James Smart        2019-05-14  7606  		return 0;
f60cb93bbfecf1 James Smart        2019-05-14  7607  	}
f60cb93bbfecf1 James Smart        2019-05-14  7608  =

dea3101e0a5c89 James Bottomley    2005-04-17  7609  	/* If we are about to =
begin discovery, just ACC the RSCN.
dea3101e0a5c89 James Bottomley    2005-04-17  7610  	 * Discovery processin=
g will satisfy it.
dea3101e0a5c89 James Bottomley    2005-04-17  7611  	 */
2e0fef85e098f6 James Smart        2007-06-17  7612  	if (vport->port_state =
<=3D LPFC_NS_QRY) {
858c9f6c19c6f9 James Smart        2007-06-17  7613  		lpfc_debugfs_disc_trc=
(vport, LPFC_DISC_TRC_ELS_UNSOL,
858c9f6c19c6f9 James Smart        2007-06-17  7614  			"RCV RSCN ignore: di=
d:x%x/ste:x%x flg:x%x",
858c9f6c19c6f9 James Smart        2007-06-17  7615  			ndlp->nlp_DID, vport=
->port_state, ndlp->nlp_flag);
858c9f6c19c6f9 James Smart        2007-06-17  7616  =

51ef4c26891a73 James Smart        2007-08-02  7617  		lpfc_els_rsp_acc(vpor=
t, ELS_CMD_ACC, cmdiocb, ndlp, NULL);
c9f8735beadfba Jamie Wellnitz     2006-02-28  7618  		return 0;
dea3101e0a5c89 James Bottomley    2005-04-17  7619  	}
dea3101e0a5c89 James Bottomley    2005-04-17  7620  =

92d7f7b0cde3ad James Smart        2007-06-17  7621  	/* If this RSCN just c=
ontains NPortIDs for other vports on this HBA,
92d7f7b0cde3ad James Smart        2007-06-17  7622  	 * just ACC and ignore=
 it.
92d7f7b0cde3ad James Smart        2007-06-17  7623  	 */
92d7f7b0cde3ad James Smart        2007-06-17  7624  	if ((phba->sli3_option=
s & LPFC_SLI3_NPIV_ENABLED) &&
3de2a653a127c4 James Smart        2007-08-02  7625  		!(vport->cfg_peer_por=
t_login)) {
92d7f7b0cde3ad James Smart        2007-06-17  7626  		i =3D payload_len;
92d7f7b0cde3ad James Smart        2007-06-17  7627  		datap =3D lp;
92d7f7b0cde3ad James Smart        2007-06-17  7628  		while (i > 0) {
92d7f7b0cde3ad James Smart        2007-06-17  7629  			nportid =3D *datap++;
92d7f7b0cde3ad James Smart        2007-06-17  7630  			nportid =3D ((be32_t=
o_cpu(nportid)) & Mask_DID);
92d7f7b0cde3ad James Smart        2007-06-17  7631  			i -=3D sizeof(uint32=
_t);
92d7f7b0cde3ad James Smart        2007-06-17  7632  			rscn_id++;
549e55cd2a1b83 James Smart        2007-08-02  7633  			if (lpfc_find_vport_=
by_did(phba, nportid))
92d7f7b0cde3ad James Smart        2007-06-17  7634  				hba_id++;
92d7f7b0cde3ad James Smart        2007-06-17  7635  		}
92d7f7b0cde3ad James Smart        2007-06-17  7636  		if (rscn_id =3D=3D hb=
a_id) {
92d7f7b0cde3ad James Smart        2007-06-17  7637  			/* ALL NPortIDs in R=
SCN are on HBA */
e8b62011d88d6f James Smart        2007-08-02  7638  			lpfc_printf_vlog(vpo=
rt, KERN_INFO, LOG_DISCOVERY,
d7c255b26d8e3f James Smart        2008-08-24  7639  					 "0219 Ignore RSCN=
 "
e8b62011d88d6f James Smart        2007-08-02  7640  					 "Data: x%x x%x x%=
x x%x\n",
e8b62011d88d6f James Smart        2007-08-02  7641  					 vport->fc_flag, p=
ayload_len,
7f5f3d0d02aa2f James Smart        2008-02-08  7642  					 *lp, vport->fc_rs=
cn_id_cnt);
858c9f6c19c6f9 James Smart        2007-06-17  7643  			lpfc_debugfs_disc_tr=
c(vport, LPFC_DISC_TRC_ELS_UNSOL,
858c9f6c19c6f9 James Smart        2007-06-17  7644  				"RCV RSCN vport:  d=
id:x%x/ste:x%x flg:x%x",
858c9f6c19c6f9 James Smart        2007-06-17  7645  				ndlp->nlp_DID, vpor=
t->port_state,
858c9f6c19c6f9 James Smart        2007-06-17  7646  				ndlp->nlp_flag);
858c9f6c19c6f9 James Smart        2007-06-17  7647  =

92d7f7b0cde3ad James Smart        2007-06-17  7648  			lpfc_els_rsp_acc(vpo=
rt, ELS_CMD_ACC, cmdiocb,
51ef4c26891a73 James Smart        2007-08-02  7649  				ndlp, NULL);
92d7f7b0cde3ad James Smart        2007-06-17  7650  			return 0;
92d7f7b0cde3ad James Smart        2007-06-17  7651  		}
92d7f7b0cde3ad James Smart        2007-06-17  7652  	}
92d7f7b0cde3ad James Smart        2007-06-17  7653  =

7f5f3d0d02aa2f James Smart        2008-02-08  7654  	spin_lock_irq(shost->h=
ost_lock);
7f5f3d0d02aa2f James Smart        2008-02-08  7655  	if (vport->fc_rscn_flu=
sh) {
7f5f3d0d02aa2f James Smart        2008-02-08  7656  		/* Another thread is =
walking fc_rscn_id_list on this vport */
7f5f3d0d02aa2f James Smart        2008-02-08  7657  		vport->fc_flag |=3D F=
C_RSCN_DISCOVERY;
97957244768600 James Smart        2009-12-21  7658  		spin_unlock_irq(shost=
->host_lock);
58da1ffb2b1234 James Smart        2008-04-07  7659  		/* Send back ACC */
58da1ffb2b1234 James Smart        2008-04-07  7660  		lpfc_els_rsp_acc(vpor=
t, ELS_CMD_ACC, cmdiocb, ndlp, NULL);
7f5f3d0d02aa2f James Smart        2008-02-08  7661  		return 0;
7f5f3d0d02aa2f James Smart        2008-02-08  7662  	}
7f5f3d0d02aa2f James Smart        2008-02-08  7663  	/* Indicate we are wal=
king fc_rscn_id_list on this vport */
7f5f3d0d02aa2f James Smart        2008-02-08  7664  	vport->fc_rscn_flush =
=3D 1;
7f5f3d0d02aa2f James Smart        2008-02-08  7665  	spin_unlock_irq(shost-=
>host_lock);
af901ca181d92a Andr=C3=A9 Goddard Rosa 2009-11-14  7666  	/* Get the array =
count after successfully have the token */
7f5f3d0d02aa2f James Smart        2008-02-08  7667  	rscn_cnt =3D vport->fc=
_rscn_id_cnt;
dea3101e0a5c89 James Bottomley    2005-04-17  7668  	/* If we are already p=
rocessing an RSCN, save the received
dea3101e0a5c89 James Bottomley    2005-04-17  7669  	 * RSCN payload buffer=
, cmdiocb->context2 to process later.
dea3101e0a5c89 James Bottomley    2005-04-17  7670  	 */
2e0fef85e098f6 James Smart        2007-06-17  7671  	if (vport->fc_flag & (=
FC_RSCN_MODE | FC_NDISC_ACTIVE)) {
858c9f6c19c6f9 James Smart        2007-06-17  7672  		lpfc_debugfs_disc_trc=
(vport, LPFC_DISC_TRC_ELS_UNSOL,
858c9f6c19c6f9 James Smart        2007-06-17  7673  			"RCV RSCN defer:  di=
d:x%x/ste:x%x flg:x%x",
858c9f6c19c6f9 James Smart        2007-06-17  7674  			ndlp->nlp_DID, vport=
->port_state, ndlp->nlp_flag);
858c9f6c19c6f9 James Smart        2007-06-17  7675  =

0937282036d9ae James Smart        2008-01-11  7676  		spin_lock_irq(shost->=
host_lock);
92d7f7b0cde3ad James Smart        2007-06-17  7677  		vport->fc_flag |=3D F=
C_RSCN_DEFERRED;
2332e6e475b016 James Smart        2019-11-04  7678  =

2332e6e475b016 James Smart        2019-11-04  7679  		/* Restart disctmo if=
 its already running */
2332e6e475b016 James Smart        2019-11-04  7680  		if (vport->fc_flag & =
FC_DISC_TMO) {
2332e6e475b016 James Smart        2019-11-04  7681  			tmo =3D ((phba->fc_r=
atov * 3) + 3);
2332e6e475b016 James Smart        2019-11-04  7682  			mod_timer(&vport->fc=
_disctmo,
2332e6e475b016 James Smart        2019-11-04  7683  				  jiffies + msecs_t=
o_jiffies(1000 * tmo));
2332e6e475b016 James Smart        2019-11-04  7684  		}
92d7f7b0cde3ad James Smart        2007-06-17  7685  		if ((rscn_cnt < FC_MA=
X_HOLD_RSCN) &&
2e0fef85e098f6 James Smart        2007-06-17  7686  		    !(vport->fc_flag =
& FC_RSCN_DISCOVERY)) {
2e0fef85e098f6 James Smart        2007-06-17  7687  			vport->fc_flag |=3D =
FC_RSCN_MODE;
2e0fef85e098f6 James Smart        2007-06-17  7688  			spin_unlock_irq(shos=
t->host_lock);
92d7f7b0cde3ad James Smart        2007-06-17  7689  			if (rscn_cnt) {
92d7f7b0cde3ad James Smart        2007-06-17  7690  				cmd =3D vport->fc_r=
scn_id_list[rscn_cnt-1]->virt;
92d7f7b0cde3ad James Smart        2007-06-17  7691  				length =3D be32_to_=
cpu(*cmd & ~ELS_CMD_MASK);
92d7f7b0cde3ad James Smart        2007-06-17  7692  			}
92d7f7b0cde3ad James Smart        2007-06-17  7693  			if ((rscn_cnt) &&
92d7f7b0cde3ad James Smart        2007-06-17  7694  			    (payload_len + l=
ength <=3D LPFC_BPL_SIZE)) {
92d7f7b0cde3ad James Smart        2007-06-17  7695  				*cmd &=3D ELS_CMD_M=
ASK;
7f5f3d0d02aa2f James Smart        2008-02-08 @7696  				*cmd |=3D cpu_to_be=
32(payload_len + length);
92d7f7b0cde3ad James Smart        2007-06-17  7697  				memcpy(((uint8_t *)=
cmd) + length, lp,
92d7f7b0cde3ad James Smart        2007-06-17  7698  				       payload_len);
92d7f7b0cde3ad James Smart        2007-06-17  7699  			} else {
92d7f7b0cde3ad James Smart        2007-06-17  7700  				vport->fc_rscn_id_l=
ist[rscn_cnt] =3D pcmd;
92d7f7b0cde3ad James Smart        2007-06-17  7701  				vport->fc_rscn_id_c=
nt++;
dea3101e0a5c89 James Bottomley    2005-04-17  7702  				/* If we zero, cmdi=
ocb->context2, the calling
dea3101e0a5c89 James Bottomley    2005-04-17  7703  				 * routine will not=
 try to free it.
dea3101e0a5c89 James Bottomley    2005-04-17  7704  				 */
dea3101e0a5c89 James Bottomley    2005-04-17  7705  				cmdiocb->context2 =
=3D NULL;
92d7f7b0cde3ad James Smart        2007-06-17  7706  			}
dea3101e0a5c89 James Bottomley    2005-04-17  7707  			/* Deferred RSCN */
e8b62011d88d6f James Smart        2007-08-02  7708  			lpfc_printf_vlog(vpo=
rt, KERN_INFO, LOG_DISCOVERY,
e8b62011d88d6f James Smart        2007-08-02  7709  					 "0235 Deferred RS=
CN "
dea3101e0a5c89 James Bottomley    2005-04-17  7710  					 "Data: x%x x%x x%=
x\n",
92d7f7b0cde3ad James Smart        2007-06-17  7711  					 vport->fc_rscn_id=
_cnt, vport->fc_flag,
2e0fef85e098f6 James Smart        2007-06-17  7712  					 vport->port_state=
);
dea3101e0a5c89 James Bottomley    2005-04-17  7713  		} else {
2e0fef85e098f6 James Smart        2007-06-17  7714  			vport->fc_flag |=3D =
FC_RSCN_DISCOVERY;
2e0fef85e098f6 James Smart        2007-06-17  7715  			spin_unlock_irq(shos=
t->host_lock);
dea3101e0a5c89 James Bottomley    2005-04-17  7716  			/* ReDiscovery RSCN =
*/
e8b62011d88d6f James Smart        2007-08-02  7717  			lpfc_printf_vlog(vpo=
rt, KERN_INFO, LOG_DISCOVERY,
e8b62011d88d6f James Smart        2007-08-02  7718  					 "0234 ReDiscovery=
 RSCN "
dea3101e0a5c89 James Bottomley    2005-04-17  7719  					 "Data: x%x x%x x%=
x\n",
92d7f7b0cde3ad James Smart        2007-06-17  7720  					 vport->fc_rscn_id=
_cnt, vport->fc_flag,
2e0fef85e098f6 James Smart        2007-06-17  7721  					 vport->port_state=
);
dea3101e0a5c89 James Bottomley    2005-04-17  7722  		}
7f5f3d0d02aa2f James Smart        2008-02-08  7723  		/* Indicate we are do=
ne walking fc_rscn_id_list on this vport */
7f5f3d0d02aa2f James Smart        2008-02-08  7724  		vport->fc_rscn_flush =
=3D 0;
dea3101e0a5c89 James Bottomley    2005-04-17  7725  		/* Send back ACC */
51ef4c26891a73 James Smart        2007-08-02  7726  		lpfc_els_rsp_acc(vpor=
t, ELS_CMD_ACC, cmdiocb, ndlp, NULL);
dea3101e0a5c89 James Bottomley    2005-04-17  7727  		/* send RECOVERY even=
t for ALL nodes that match RSCN payload */
2e0fef85e098f6 James Smart        2007-06-17  7728  		lpfc_rscn_recovery_ch=
eck(vport);
c9f8735beadfba Jamie Wellnitz     2006-02-28  7729  		return 0;
dea3101e0a5c89 James Bottomley    2005-04-17  7730  	}
858c9f6c19c6f9 James Smart        2007-06-17  7731  	lpfc_debugfs_disc_trc(=
vport, LPFC_DISC_TRC_ELS_UNSOL,
858c9f6c19c6f9 James Smart        2007-06-17  7732  		"RCV RSCN:        did=
:x%x/ste:x%x flg:x%x",
858c9f6c19c6f9 James Smart        2007-06-17  7733  		ndlp->nlp_DID, vport-=
>port_state, ndlp->nlp_flag);
858c9f6c19c6f9 James Smart        2007-06-17  7734  =

2e0fef85e098f6 James Smart        2007-06-17  7735  	spin_lock_irq(shost->h=
ost_lock);
2e0fef85e098f6 James Smart        2007-06-17  7736  	vport->fc_flag |=3D FC=
_RSCN_MODE;
2e0fef85e098f6 James Smart        2007-06-17  7737  	spin_unlock_irq(shost-=
>host_lock);
2e0fef85e098f6 James Smart        2007-06-17  7738  	vport->fc_rscn_id_list=
[vport->fc_rscn_id_cnt++] =3D pcmd;
7f5f3d0d02aa2f James Smart        2008-02-08  7739  	/* Indicate we are don=
e walking fc_rscn_id_list on this vport */
7f5f3d0d02aa2f James Smart        2008-02-08  7740  	vport->fc_rscn_flush =
=3D 0;
dea3101e0a5c89 James Bottomley    2005-04-17  7741  	/*
dea3101e0a5c89 James Bottomley    2005-04-17  7742  	 * If we zero, cmdiocb=
->context2, the calling routine will
dea3101e0a5c89 James Bottomley    2005-04-17  7743  	 * not try to free it.
dea3101e0a5c89 James Bottomley    2005-04-17  7744  	 */
dea3101e0a5c89 James Bottomley    2005-04-17  7745  	cmdiocb->context2 =3D =
NULL;
2e0fef85e098f6 James Smart        2007-06-17  7746  	lpfc_set_disctmo(vport=
);
dea3101e0a5c89 James Bottomley    2005-04-17  7747  	/* Send back ACC */
51ef4c26891a73 James Smart        2007-08-02  7748  	lpfc_els_rsp_acc(vport=
, ELS_CMD_ACC, cmdiocb, ndlp, NULL);
dea3101e0a5c89 James Bottomley    2005-04-17  7749  	/* send RECOVERY event=
 for ALL nodes that match RSCN payload */
2e0fef85e098f6 James Smart        2007-06-17  7750  	lpfc_rscn_recovery_che=
ck(vport);
2e0fef85e098f6 James Smart        2007-06-17  7751  	return lpfc_els_handle=
_rscn(vport);
dea3101e0a5c89 James Bottomley    2005-04-17  7752  }
dea3101e0a5c89 James Bottomley    2005-04-17  7753  =


:::::: The code at line 7696 was first introduced by commit
:::::: 7f5f3d0d02aa2f124e764aee5c775589ce72fd42 [SCSI] lpfc 8.2.5 : Miscell=
aneous discovery Fixes

:::::: TO: James Smart <James.Smart@Emulex.Com>
:::::: CC: James Bottomley <James.Bottomley@HansenPartnership.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0381101347981668124==--

