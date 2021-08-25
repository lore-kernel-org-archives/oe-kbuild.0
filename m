Content-Type: multipart/mixed; boundary="===============2106215034459315188=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 9989/10077] drivers/scsi/lpfc/lpfc_els.c:3984:25: sparse: sparse: cast from restricted __be16
Date: Wed, 25 Aug 2021 16:59:14 +0800
Message-ID: <202108251605.Heox4NRV-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2106215034459315188==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: James Smart <jsmart2021@gmail.com>
CC: "Martin K. Petersen" <martin.petersen@oracle.com>
CC: Justin Tee <justin.tee@broadcom.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   372b2891c15acbf7b90d948b08ac174bde77102c
commit: 85a964c39cadef8f0798cb49292fac6062e664b4 [9989/10077] scsi: lpfc: A=
dd EDC ELS support
:::::: branch date: 23 hours ago
:::::: commit date: 29 hours ago
config: arm64-randconfig-s031-20210824 (attached as .config)
compiler: aarch64-linux-gcc (GCC) 11.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.3-348-gf0e6938b-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3D85a964c39cadef8f0798cb49292fac6062e664b4
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 85a964c39cadef8f0798cb49292fac6062e664b4
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.2.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Da=
rm64 SHELL=3D/bin/bash drivers/scsi/lpfc/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
   drivers/scsi/lpfc/lpfc_els.c:4565:38: sparse: sparse: cast to restricted=
 __be32
   drivers/scsi/lpfc/lpfc_els.c:4565:38: sparse: sparse: cast to restricted=
 __be32
   drivers/scsi/lpfc/lpfc_els.c:4565:38: sparse: sparse: cast to restricted=
 __be32
   drivers/scsi/lpfc/lpfc_els.c:4565:38: sparse: sparse: cast to restricted=
 __be32
   drivers/scsi/lpfc/lpfc_els.c:4565:38: sparse: sparse: cast to restricted=
 __be32
   drivers/scsi/lpfc/lpfc_els.c:4565:38: sparse: sparse: cast to restricted=
 __be32
   drivers/scsi/lpfc/lpfc_els.c:11118:33: sparse: sparse: cast to restricte=
d __be32
   drivers/scsi/lpfc/lpfc_els.c:11118:33: sparse: sparse: cast to restricte=
d __be32
   drivers/scsi/lpfc/lpfc_els.c:11118:33: sparse: sparse: cast to restricte=
d __be32
   drivers/scsi/lpfc/lpfc_els.c:11118:33: sparse: sparse: cast to restricte=
d __be32
   drivers/scsi/lpfc/lpfc_els.c:11118:33: sparse: sparse: cast to restricte=
d __be32
   drivers/scsi/lpfc/lpfc_els.c:11118:33: sparse: sparse: cast to restricte=
d __be32
   drivers/scsi/lpfc/lpfc_els.c:3984:25: sparse: sparse: cast to restricted=
 __be32
>> drivers/scsi/lpfc/lpfc_els.c:3984:25: sparse: sparse: cast from restrict=
ed __be16
   drivers/scsi/lpfc/lpfc_els.c:3984:25: sparse: sparse: cast to restricted=
 __be32
>> drivers/scsi/lpfc/lpfc_els.c:3984:25: sparse: sparse: cast from restrict=
ed __be16
   drivers/scsi/lpfc/lpfc_els.c:3984:25: sparse: sparse: cast to restricted=
 __be32
>> drivers/scsi/lpfc/lpfc_els.c:3984:25: sparse: sparse: cast from restrict=
ed __be16
   drivers/scsi/lpfc/lpfc_els.c:3984:25: sparse: sparse: cast to restricted=
 __be32
>> drivers/scsi/lpfc/lpfc_els.c:3984:25: sparse: sparse: cast from restrict=
ed __be16
   drivers/scsi/lpfc/lpfc_els.c:3984:25: sparse: sparse: cast to restricted=
 __be32
>> drivers/scsi/lpfc/lpfc_els.c:3984:25: sparse: sparse: cast from restrict=
ed __be16
   drivers/scsi/lpfc/lpfc_els.c:3984:25: sparse: sparse: cast to restricted=
 __be32
>> drivers/scsi/lpfc/lpfc_els.c:3984:25: sparse: sparse: cast from restrict=
ed __be16
   drivers/scsi/lpfc/lpfc_els.c:3984:25: sparse: sparse: cast to restricted=
 __be32
>> drivers/scsi/lpfc/lpfc_els.c:3984:25: sparse: sparse: cast from restrict=
ed __be16
   drivers/scsi/lpfc/lpfc_els.c:3984:25: sparse: sparse: cast to restricted=
 __be32
>> drivers/scsi/lpfc/lpfc_els.c:3984:25: sparse: sparse: cast from restrict=
ed __be16
   drivers/scsi/lpfc/lpfc_els.c:3984:25: sparse: sparse: cast to restricted=
 __be32
>> drivers/scsi/lpfc/lpfc_els.c:3984:25: sparse: sparse: cast from restrict=
ed __be16
   drivers/scsi/lpfc/lpfc_els.c:3984:25: sparse: sparse: cast to restricted=
 __be32
>> drivers/scsi/lpfc/lpfc_els.c:3984:25: sparse: sparse: cast from restrict=
ed __be16
   drivers/scsi/lpfc/lpfc_els.c:3984:25: sparse: sparse: cast to restricted=
 __be32
>> drivers/scsi/lpfc/lpfc_els.c:3984:25: sparse: sparse: cast from restrict=
ed __be16
   drivers/scsi/lpfc/lpfc_els.c:3984:25: sparse: sparse: cast to restricted=
 __be32
>> drivers/scsi/lpfc/lpfc_els.c:3984:25: sparse: sparse: cast from restrict=
ed __be16
   drivers/scsi/lpfc/lpfc_els.c:3984:25: sparse: sparse: cast to restricted=
 __be32
>> drivers/scsi/lpfc/lpfc_els.c:3984:25: sparse: sparse: cast from restrict=
ed __be16
   drivers/scsi/lpfc/lpfc_els.c:3984:25: sparse: sparse: cast to restricted=
 __be32
>> drivers/scsi/lpfc/lpfc_els.c:3984:25: sparse: sparse: cast from restrict=
ed __be16
   drivers/scsi/lpfc/lpfc_els.c:3984:25: sparse: sparse: cast to restricted=
 __be32
>> drivers/scsi/lpfc/lpfc_els.c:3984:25: sparse: sparse: cast from restrict=
ed __be16
   drivers/scsi/lpfc/lpfc_els.c:3984:25: sparse: sparse: cast to restricted=
 __be32
>> drivers/scsi/lpfc/lpfc_els.c:3984:25: sparse: sparse: cast from restrict=
ed __be16
   drivers/scsi/lpfc/lpfc_els.c:3984:25: sparse: sparse: cast to restricted=
 __be32
>> drivers/scsi/lpfc/lpfc_els.c:3984:25: sparse: sparse: cast from restrict=
ed __be16
   drivers/scsi/lpfc/lpfc_els.c:3984:25: sparse: sparse: cast to restricted=
 __be32
>> drivers/scsi/lpfc/lpfc_els.c:3984:25: sparse: sparse: cast from restrict=
ed __be16
   drivers/scsi/lpfc/lpfc_els.c:3984:25: sparse: sparse: cast to restricted=
 __be32
>> drivers/scsi/lpfc/lpfc_els.c:3984:25: sparse: sparse: cast from restrict=
ed __be16
   drivers/scsi/lpfc/lpfc_els.c:3984:25: sparse: sparse: cast to restricted=
 __be32
>> drivers/scsi/lpfc/lpfc_els.c:3984:25: sparse: sparse: cast from restrict=
ed __be16
   drivers/scsi/lpfc/lpfc_els.c:3984:25: sparse: sparse: cast to restricted=
 __be32
>> drivers/scsi/lpfc/lpfc_els.c:3984:25: sparse: sparse: cast from restrict=
ed __be16
   drivers/scsi/lpfc/lpfc_els.c:3984:25: sparse: sparse: cast to restricted=
 __be32
>> drivers/scsi/lpfc/lpfc_els.c:3984:25: sparse: sparse: cast from restrict=
ed __be16
   drivers/scsi/lpfc/lpfc_els.c:3984:25: sparse: sparse: cast to restricted=
 __be32
>> drivers/scsi/lpfc/lpfc_els.c:3984:25: sparse: sparse: cast from restrict=
ed __be16
   drivers/scsi/lpfc/lpfc_els.c:3984:25: sparse: sparse: cast to restricted=
 __be32
>> drivers/scsi/lpfc/lpfc_els.c:3984:25: sparse: sparse: cast from restrict=
ed __be16
   drivers/scsi/lpfc/lpfc_els.c:3984:25: sparse: sparse: cast to restricted=
 __be32
>> drivers/scsi/lpfc/lpfc_els.c:3984:25: sparse: sparse: cast from restrict=
ed __be16
   drivers/scsi/lpfc/lpfc_els.c:3984:25: sparse: sparse: cast to restricted=
 __be32
>> drivers/scsi/lpfc/lpfc_els.c:3984:25: sparse: sparse: cast from restrict=
ed __be16
   drivers/scsi/lpfc/lpfc_els.c:3984:25: sparse: sparse: cast to restricted=
 __be32
>> drivers/scsi/lpfc/lpfc_els.c:3984:25: sparse: sparse: cast from restrict=
ed __be16
   drivers/scsi/lpfc/lpfc_els.c:3984:25: sparse: sparse: cast to restricted=
 __be32
>> drivers/scsi/lpfc/lpfc_els.c:3984:25: sparse: sparse: cast from restrict=
ed __be16
   drivers/scsi/lpfc/lpfc_els.c:3984:25: sparse: sparse: cast to restricted=
 __be32
>> drivers/scsi/lpfc/lpfc_els.c:3984:25: sparse: sparse: cast from restrict=
ed __be16
   drivers/scsi/lpfc/lpfc_els.c:3984:25: sparse: sparse: cast to restricted=
 __be32
>> drivers/scsi/lpfc/lpfc_els.c:3984:25: sparse: sparse: cast from restrict=
ed __be16
   drivers/scsi/lpfc/lpfc_els.c:3984:25: sparse: sparse: cast to restricted=
 __be32
>> drivers/scsi/lpfc/lpfc_els.c:3984:25: sparse: sparse: cast from restrict=
ed __be16
   drivers/scsi/lpfc/lpfc_els.c:3984:25: sparse: sparse: cast to restricted=
 __be32
>> drivers/scsi/lpfc/lpfc_els.c:3984:25: sparse: sparse: cast from restrict=
ed __be16
   drivers/scsi/lpfc/lpfc_els.c:3984:25: sparse: sparse: cast to restricted=
 __be32
>> drivers/scsi/lpfc/lpfc_els.c:3984:25: sparse: sparse: cast from restrict=
ed __be16
   drivers/scsi/lpfc/lpfc_els.c:3984:25: sparse: sparse: cast to restricted=
 __be32
>> drivers/scsi/lpfc/lpfc_els.c:3984:25: sparse: sparse: cast from restrict=
ed __be16
   drivers/scsi/lpfc/lpfc_els.c:3984:25: sparse: sparse: cast to restricted=
 __be32
>> drivers/scsi/lpfc/lpfc_els.c:3984:25: sparse: sparse: cast from restrict=
ed __be16
   drivers/scsi/lpfc/lpfc_els.c:3984:25: sparse: sparse: cast to restricted=
 __be32
>> drivers/scsi/lpfc/lpfc_els.c:3984:25: sparse: sparse: cast from restrict=
ed __be16
   drivers/scsi/lpfc/lpfc_els.c:3984:25: sparse: sparse: cast to restricted=
 __be32
>> drivers/scsi/lpfc/lpfc_els.c:3984:25: sparse: sparse: cast from restrict=
ed __be16
   drivers/scsi/lpfc/lpfc_els.c:3984:25: sparse: sparse: cast to restricted=
 __be32
>> drivers/scsi/lpfc/lpfc_els.c:3984:25: sparse: sparse: cast from restrict=
ed __be16
   drivers/scsi/lpfc/lpfc_els.c:3984:25: sparse: sparse: cast to restricted=
 __be32
>> drivers/scsi/lpfc/lpfc_els.c:3984:25: sparse: sparse: cast from restrict=
ed __be16
   drivers/scsi/lpfc/lpfc_els.c:3984:25: sparse: sparse: cast to restricted=
 __be32
>> drivers/scsi/lpfc/lpfc_els.c:3984:25: sparse: sparse: cast from restrict=
ed __be16
   drivers/scsi/lpfc/lpfc_els.c:3984:25: sparse: sparse: cast to restricted=
 __be32
>> drivers/scsi/lpfc/lpfc_els.c:3984:25: sparse: sparse: cast from restrict=
ed __be16
   drivers/scsi/lpfc/lpfc_els.c:3984:25: sparse: sparse: cast to restricted=
 __be32
>> drivers/scsi/lpfc/lpfc_els.c:3984:25: sparse: sparse: cast from restrict=
ed __be16
   drivers/scsi/lpfc/lpfc_els.c:3984:25: sparse: sparse: cast to restricted=
 __be32
>> drivers/scsi/lpfc/lpfc_els.c:3984:25: sparse: sparse: cast from restrict=
ed __be16
   drivers/scsi/lpfc/lpfc_els.c:3984:25: sparse: sparse: cast to restricted=
 __be32
   drivers/scsi/lpfc/lpfc_els.c:3984:25: sparse: sparse: too many warnings

vim +3984 drivers/scsi/lpfc/lpfc_els.c

85a964c39cadef James Smart 2021-08-16  3842  =

85a964c39cadef James Smart 2021-08-16  3843  DECLARE_ENUM2STR_LOOKUP(lpfc_g=
et_tlv_dtag_nm, fc_ls_tlv_dtag,
85a964c39cadef James Smart 2021-08-16  3844  			FC_LS_TLV_DTAG_INIT);
85a964c39cadef James Smart 2021-08-16  3845  =

85a964c39cadef James Smart 2021-08-16  3846  /**
85a964c39cadef James Smart 2021-08-16  3847   * lpfc_cmpl_els_edc - Complet=
ion callback function for EDC
85a964c39cadef James Smart 2021-08-16  3848   * @phba: pointer to lpfc hba =
data structure.
85a964c39cadef James Smart 2021-08-16  3849   * @cmdiocb: pointer to lpfc c=
ommand iocb data structure.
85a964c39cadef James Smart 2021-08-16  3850   * @rspiocb: pointer to lpfc r=
esponse iocb data structure.
85a964c39cadef James Smart 2021-08-16  3851   *
85a964c39cadef James Smart 2021-08-16  3852   * This routine is the complet=
ion callback function for issuing the Exchange
85a964c39cadef James Smart 2021-08-16  3853   * Diagnostic Capabilities (ED=
C) command. The driver issues an EDC to
85a964c39cadef James Smart 2021-08-16  3854   * notify the FPort of its Con=
gestion and Link Fault capabilities.  This
85a964c39cadef James Smart 2021-08-16  3855   * routine parses the FPort's =
response and decides on the least common
85a964c39cadef James Smart 2021-08-16  3856   * values applicable to both F=
Port and NPort for Warnings and Alarms that
85a964c39cadef James Smart 2021-08-16  3857   * are communicated via hardwa=
re signals.
85a964c39cadef James Smart 2021-08-16  3858   **/
85a964c39cadef James Smart 2021-08-16  3859  static void
85a964c39cadef James Smart 2021-08-16  3860  lpfc_cmpl_els_edc(struct lpfc_=
hba *phba, struct lpfc_iocbq *cmdiocb,
85a964c39cadef James Smart 2021-08-16  3861  		  struct lpfc_iocbq *rspiocb)
85a964c39cadef James Smart 2021-08-16  3862  {
85a964c39cadef James Smart 2021-08-16  3863  	IOCB_t *irsp;
85a964c39cadef James Smart 2021-08-16  3864  	struct fc_els_edc_resp *edc_r=
sp;
85a964c39cadef James Smart 2021-08-16  3865  	struct fc_tlv_desc *tlv;
85a964c39cadef James Smart 2021-08-16  3866  	struct fc_diag_cg_sig_desc *p=
cgd;
85a964c39cadef James Smart 2021-08-16  3867  	struct fc_diag_lnkflt_desc *p=
lnkflt;
85a964c39cadef James Smart 2021-08-16  3868  	struct lpfc_dmabuf *pcmd, *pr=
sp;
85a964c39cadef James Smart 2021-08-16  3869  	const char *dtag_nm;
85a964c39cadef James Smart 2021-08-16  3870  	u32 *pdata, dtag;
85a964c39cadef James Smart 2021-08-16  3871  	int desc_cnt =3D 0, bytes_rem=
ain;
85a964c39cadef James Smart 2021-08-16  3872  	bool rcv_cap_desc =3D false;
85a964c39cadef James Smart 2021-08-16  3873  	struct lpfc_nodelist *ndlp;
85a964c39cadef James Smart 2021-08-16  3874  =

85a964c39cadef James Smart 2021-08-16  3875  	irsp =3D &rspiocb->iocb;
85a964c39cadef James Smart 2021-08-16  3876  	ndlp =3D cmdiocb->context1;
85a964c39cadef James Smart 2021-08-16  3877  =

85a964c39cadef James Smart 2021-08-16  3878  	lpfc_debugfs_disc_trc(phba->p=
port, LPFC_DISC_TRC_ELS_CMD,
85a964c39cadef James Smart 2021-08-16  3879  			      "EDC cmpl:    status:=
x%x/x%x did:x%x",
85a964c39cadef James Smart 2021-08-16  3880  			      irsp->ulpStatus, irsp=
->un.ulpWord[4],
85a964c39cadef James Smart 2021-08-16  3881  			      irsp->un.elsreq64.rem=
oteID);
85a964c39cadef James Smart 2021-08-16  3882  =

85a964c39cadef James Smart 2021-08-16  3883  	/* ELS cmd tag <ulpIoTag> com=
pletes */
85a964c39cadef James Smart 2021-08-16  3884  	lpfc_printf_log(phba, KERN_IN=
FO, LOG_ELS | LOG_CGN_MGMT,
85a964c39cadef James Smart 2021-08-16  3885  			"4201 EDC cmd tag x%x compl=
etes Data: x%x x%x x%x\n",
85a964c39cadef James Smart 2021-08-16  3886  			irsp->ulpIoTag, irsp->ulpSt=
atus,
85a964c39cadef James Smart 2021-08-16  3887  			irsp->un.ulpWord[4], irsp->=
ulpTimeout);
85a964c39cadef James Smart 2021-08-16  3888  =

85a964c39cadef James Smart 2021-08-16  3889  	pcmd =3D (struct lpfc_dmabuf =
*)cmdiocb->context2;
85a964c39cadef James Smart 2021-08-16  3890  	if (!pcmd)
85a964c39cadef James Smart 2021-08-16  3891  		goto out;
85a964c39cadef James Smart 2021-08-16  3892  =

85a964c39cadef James Smart 2021-08-16  3893  	pdata =3D (u32 *)pcmd->virt;
85a964c39cadef James Smart 2021-08-16  3894  	if (!pdata)
85a964c39cadef James Smart 2021-08-16  3895  		goto out;
85a964c39cadef James Smart 2021-08-16  3896  =

85a964c39cadef James Smart 2021-08-16  3897  	/* Need to clear signal value=
s, send features MB and RDF with FPIN. */
85a964c39cadef James Smart 2021-08-16  3898  	if (irsp->ulpStatus)
85a964c39cadef James Smart 2021-08-16  3899  		goto out;
85a964c39cadef James Smart 2021-08-16  3900  =

85a964c39cadef James Smart 2021-08-16  3901  	prsp =3D list_get_first(&pcmd=
->list, struct lpfc_dmabuf, list);
85a964c39cadef James Smart 2021-08-16  3902  	if (!prsp)
85a964c39cadef James Smart 2021-08-16  3903  		goto out;
85a964c39cadef James Smart 2021-08-16  3904  =

85a964c39cadef James Smart 2021-08-16  3905  	edc_rsp =3D prsp->virt;
85a964c39cadef James Smart 2021-08-16  3906  	if (!edc_rsp)
85a964c39cadef James Smart 2021-08-16  3907  		goto out;
85a964c39cadef James Smart 2021-08-16  3908  =

85a964c39cadef James Smart 2021-08-16  3909  	/* ELS cmd tag <ulpIoTag> com=
pletes */
85a964c39cadef James Smart 2021-08-16  3910  	lpfc_printf_log(phba, KERN_IN=
FO, LOG_ELS | LOG_CGN_MGMT,
85a964c39cadef James Smart 2021-08-16  3911  			"4676 Fabric EDC Rsp: "
85a964c39cadef James Smart 2021-08-16  3912  			"0x%02x, 0x%08x\n",
85a964c39cadef James Smart 2021-08-16  3913  			edc_rsp->acc_hdr.la_cmd,
85a964c39cadef James Smart 2021-08-16  3914  			be32_to_cpu(edc_rsp->desc_l=
ist_len));
85a964c39cadef James Smart 2021-08-16  3915  =

85a964c39cadef James Smart 2021-08-16  3916  	/*
85a964c39cadef James Smart 2021-08-16  3917  	 * Payload length in bytes is=
 the response descriptor list
85a964c39cadef James Smart 2021-08-16  3918  	 * length minus the 12 bytes =
of Link Service Request
85a964c39cadef James Smart 2021-08-16  3919  	 * Information descriptor in =
the reply.
85a964c39cadef James Smart 2021-08-16  3920  	 */
85a964c39cadef James Smart 2021-08-16  3921  	bytes_remain =3D be32_to_cpu(=
edc_rsp->desc_list_len) -
85a964c39cadef James Smart 2021-08-16  3922  				   sizeof(struct fc_els_ls=
ri_desc);
85a964c39cadef James Smart 2021-08-16  3923  	if (bytes_remain <=3D 0)
85a964c39cadef James Smart 2021-08-16  3924  		goto out;
85a964c39cadef James Smart 2021-08-16  3925  =

85a964c39cadef James Smart 2021-08-16  3926  	tlv =3D edc_rsp->desc;
85a964c39cadef James Smart 2021-08-16  3927  =

85a964c39cadef James Smart 2021-08-16  3928  	/*
85a964c39cadef James Smart 2021-08-16  3929  	 * cycle through EDC diagnost=
ic descriptors to find the
85a964c39cadef James Smart 2021-08-16  3930  	 * congestion signaling capab=
ility descriptor
85a964c39cadef James Smart 2021-08-16  3931  	 */
85a964c39cadef James Smart 2021-08-16  3932  	while (bytes_remain) {
85a964c39cadef James Smart 2021-08-16  3933  		if (bytes_remain < FC_TLV_DE=
SC_HDR_SZ) {
85a964c39cadef James Smart 2021-08-16  3934  			lpfc_printf_log(phba, KERN_=
WARNING, LOG_CGN_MGMT,
85a964c39cadef James Smart 2021-08-16  3935  					"6461 Truncated TLV hdr o=
n "
85a964c39cadef James Smart 2021-08-16  3936  					"Diagnostic descriptor[%d=
]\n",
85a964c39cadef James Smart 2021-08-16  3937  					desc_cnt);
85a964c39cadef James Smart 2021-08-16  3938  			goto out;
85a964c39cadef James Smart 2021-08-16  3939  		}
85a964c39cadef James Smart 2021-08-16  3940  =

85a964c39cadef James Smart 2021-08-16  3941  		dtag =3D be32_to_cpu(tlv->de=
sc_tag);
85a964c39cadef James Smart 2021-08-16  3942  		switch (dtag) {
85a964c39cadef James Smart 2021-08-16  3943  		case ELS_DTAG_LNK_FAULT_CAP:
85a964c39cadef James Smart 2021-08-16  3944  			if (bytes_remain < FC_TLV_D=
ESC_SZ_FROM_LENGTH(tlv) ||
85a964c39cadef James Smart 2021-08-16  3945  			    FC_TLV_DESC_SZ_FROM_LEN=
GTH(tlv) !=3D
85a964c39cadef James Smart 2021-08-16  3946  					sizeof(struct fc_diag_lnk=
flt_desc)) {
85a964c39cadef James Smart 2021-08-16  3947  				lpfc_printf_log(
85a964c39cadef James Smart 2021-08-16  3948  					phba, KERN_WARNING, LOG_C=
GN_MGMT,
85a964c39cadef James Smart 2021-08-16  3949  					"6462 Truncated Link Faul=
t Diagnostic "
85a964c39cadef James Smart 2021-08-16  3950  					"descriptor[%d]: %d vs 0x=
%zx 0x%zx\n",
85a964c39cadef James Smart 2021-08-16  3951  					desc_cnt, bytes_remain,
85a964c39cadef James Smart 2021-08-16  3952  					FC_TLV_DESC_SZ_FROM_LENGT=
H(tlv),
85a964c39cadef James Smart 2021-08-16  3953  					sizeof(struct fc_diag_cg_=
sig_desc));
85a964c39cadef James Smart 2021-08-16  3954  				goto out;
85a964c39cadef James Smart 2021-08-16  3955  			}
85a964c39cadef James Smart 2021-08-16  3956  			plnkflt =3D (struct fc_diag=
_lnkflt_desc *)tlv;
85a964c39cadef James Smart 2021-08-16  3957  			lpfc_printf_log(
85a964c39cadef James Smart 2021-08-16  3958  				phba, KERN_INFO, LOG_ELS |=
 LOG_CGN_MGMT,
85a964c39cadef James Smart 2021-08-16  3959  				"4617 Link Fault Desc Data=
: 0x%08x 0x%08x "
85a964c39cadef James Smart 2021-08-16  3960  				"0x%08x 0x%08x 0x%08x\n",
85a964c39cadef James Smart 2021-08-16  3961  				be32_to_cpu(plnkflt->desc_=
tag),
85a964c39cadef James Smart 2021-08-16  3962  				be32_to_cpu(plnkflt->desc_=
len),
85a964c39cadef James Smart 2021-08-16  3963  				be32_to_cpu(
85a964c39cadef James Smart 2021-08-16  3964  					plnkflt->degrade_activate=
_threshold),
85a964c39cadef James Smart 2021-08-16  3965  				be32_to_cpu(
85a964c39cadef James Smart 2021-08-16  3966  					plnkflt->degrade_deactiva=
te_threshold),
85a964c39cadef James Smart 2021-08-16  3967  				be32_to_cpu(plnkflt->fec_d=
egrade_interval));
85a964c39cadef James Smart 2021-08-16  3968  			break;
85a964c39cadef James Smart 2021-08-16  3969  		case ELS_DTAG_CG_SIGNAL_CAP:
85a964c39cadef James Smart 2021-08-16  3970  			if (bytes_remain < FC_TLV_D=
ESC_SZ_FROM_LENGTH(tlv) ||
85a964c39cadef James Smart 2021-08-16  3971  			    FC_TLV_DESC_SZ_FROM_LEN=
GTH(tlv) !=3D
85a964c39cadef James Smart 2021-08-16  3972  					sizeof(struct fc_diag_cg_=
sig_desc)) {
85a964c39cadef James Smart 2021-08-16  3973  				lpfc_printf_log(
85a964c39cadef James Smart 2021-08-16  3974  					phba, KERN_WARNING, LOG_C=
GN_MGMT,
85a964c39cadef James Smart 2021-08-16  3975  					"6463 Truncated Cgn Signa=
l Diagnostic "
85a964c39cadef James Smart 2021-08-16  3976  					"descriptor[%d]: %d vs 0x=
%zx 0x%zx\n",
85a964c39cadef James Smart 2021-08-16  3977  					desc_cnt, bytes_remain,
85a964c39cadef James Smart 2021-08-16  3978  					FC_TLV_DESC_SZ_FROM_LENGT=
H(tlv),
85a964c39cadef James Smart 2021-08-16  3979  					sizeof(struct fc_diag_cg_=
sig_desc));
85a964c39cadef James Smart 2021-08-16  3980  				goto out;
85a964c39cadef James Smart 2021-08-16  3981  			}
85a964c39cadef James Smart 2021-08-16  3982  =

85a964c39cadef James Smart 2021-08-16  3983  			pcgd =3D (struct fc_diag_cg=
_sig_desc *)tlv;
85a964c39cadef James Smart 2021-08-16 @3984  			lpfc_printf_log(
85a964c39cadef James Smart 2021-08-16  3985  				phba, KERN_INFO, LOG_ELS |=
 LOG_CGN_MGMT,
85a964c39cadef James Smart 2021-08-16  3986  				"4616 CGN Desc Data: 0x%08=
x 0x%08x "
85a964c39cadef James Smart 2021-08-16  3987  				"0x%08x 0x%04x 0x%04x 0x%0=
8x 0x%04x 0x%04x\n",
85a964c39cadef James Smart 2021-08-16  3988  				be32_to_cpu(pcgd->desc_tag=
),
85a964c39cadef James Smart 2021-08-16  3989  				be32_to_cpu(pcgd->desc_len=
),
85a964c39cadef James Smart 2021-08-16  3990  				be32_to_cpu(pcgd->xmt_sign=
al_capability),
85a964c39cadef James Smart 2021-08-16  3991  				be32_to_cpu(pcgd->xmt_sign=
al_frequency.count),
85a964c39cadef James Smart 2021-08-16  3992  				be32_to_cpu(pcgd->xmt_sign=
al_frequency.units),
85a964c39cadef James Smart 2021-08-16  3993  				be32_to_cpu(pcgd->rcv_sign=
al_capability),
85a964c39cadef James Smart 2021-08-16  3994  				be32_to_cpu(pcgd->rcv_sign=
al_frequency.count),
85a964c39cadef James Smart 2021-08-16  3995  				be32_to_cpu(pcgd->rcv_sign=
al_frequency.units));
85a964c39cadef James Smart 2021-08-16  3996  =

85a964c39cadef James Smart 2021-08-16  3997  			/* Compare driver and Fport=
 capabilities and choose
85a964c39cadef James Smart 2021-08-16  3998  			 * least common.
85a964c39cadef James Smart 2021-08-16  3999  			 */
85a964c39cadef James Smart 2021-08-16  4000  			lpfc_least_capable_settings=
(phba, pcgd);
85a964c39cadef James Smart 2021-08-16  4001  			rcv_cap_desc =3D true;
85a964c39cadef James Smart 2021-08-16  4002  			break;
85a964c39cadef James Smart 2021-08-16  4003  		default:
85a964c39cadef James Smart 2021-08-16  4004  			dtag_nm =3D lpfc_get_tlv_dt=
ag_nm(dtag);
85a964c39cadef James Smart 2021-08-16  4005  			lpfc_printf_log(phba, KERN_=
WARNING, LOG_CGN_MGMT,
85a964c39cadef James Smart 2021-08-16  4006  					"4919 unknown Diagnostic "
85a964c39cadef James Smart 2021-08-16  4007  					"Descriptor[%d]: tag x%x =
(%s)\n",
85a964c39cadef James Smart 2021-08-16  4008  					desc_cnt, dtag, dtag_nm);
85a964c39cadef James Smart 2021-08-16  4009  		}
85a964c39cadef James Smart 2021-08-16  4010  =

85a964c39cadef James Smart 2021-08-16  4011  		bytes_remain -=3D FC_TLV_DES=
C_SZ_FROM_LENGTH(tlv);
85a964c39cadef James Smart 2021-08-16  4012  		tlv =3D fc_tlv_next_desc(tlv=
);
85a964c39cadef James Smart 2021-08-16  4013  		desc_cnt++;
85a964c39cadef James Smart 2021-08-16  4014  	}
85a964c39cadef James Smart 2021-08-16  4015  =

85a964c39cadef James Smart 2021-08-16  4016  out:
85a964c39cadef James Smart 2021-08-16  4017  	if (!rcv_cap_desc) {
85a964c39cadef James Smart 2021-08-16  4018  		phba->cgn_reg_fpin =3D LPFC_=
CGN_FPIN_ALARM | LPFC_CGN_FPIN_WARN;
85a964c39cadef James Smart 2021-08-16  4019  		phba->cgn_reg_signal =3D EDC=
_CG_SIG_NOTSUPPORTED;
85a964c39cadef James Smart 2021-08-16  4020  		phba->cgn_sig_freq =3D 0;
85a964c39cadef James Smart 2021-08-16  4021  		lpfc_printf_log(phba, KERN_W=
ARNING, LOG_ELS | LOG_CGN_MGMT,
85a964c39cadef James Smart 2021-08-16  4022  				"4202 EDC rsp error - send=
ing RDF "
85a964c39cadef James Smart 2021-08-16  4023  				"for FPIN only.\n");
85a964c39cadef James Smart 2021-08-16  4024  	}
85a964c39cadef James Smart 2021-08-16  4025  =

85a964c39cadef James Smart 2021-08-16  4026  	lpfc_config_cgn_signal(phba);
85a964c39cadef James Smart 2021-08-16  4027  =

85a964c39cadef James Smart 2021-08-16  4028  	/* Check to see if link went =
down during discovery */
85a964c39cadef James Smart 2021-08-16  4029  	lpfc_els_chk_latt(phba->pport=
);
85a964c39cadef James Smart 2021-08-16  4030  	lpfc_debugfs_disc_trc(phba->p=
port, LPFC_DISC_TRC_ELS_CMD,
85a964c39cadef James Smart 2021-08-16  4031  			      "EDC Cmpl:     did:x%=
x refcnt %d",
85a964c39cadef James Smart 2021-08-16  4032  			      ndlp->nlp_DID, kref_r=
ead(&ndlp->kref), 0);
85a964c39cadef James Smart 2021-08-16  4033  	lpfc_els_free_iocb(phba, cmdi=
ocb);
85a964c39cadef James Smart 2021-08-16  4034  	lpfc_nlp_put(ndlp);
85a964c39cadef James Smart 2021-08-16  4035  }
85a964c39cadef James Smart 2021-08-16  4036  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============2106215034459315188==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

H4sICDT+JWEAAy5jb25maWcAnDxbc9s2s+/9FZr0pX1oPt0sO3PGDyAJUqhIggZISfYLR3WU1FPH
zpHttvn3ZxfgBQBB29/pZJoIuwAWi8XesODPP/08IS/Pj98Oz3e3h/v7H5Ovx4fj6fB8/Dz5cnd/
/J9JxCc5Lyc0YuVHQE7vHl7+/c/h9G21nJx9nC0/Tn873c4nm+Pp4Xg/CR8fvtx9fYH+d48PP/38
U8jzmCV1GNZbKiTjeV3SfXn54XA43f65Wv52j6P99vX2dvJLEoa/Tmazj/OP0w9GPyZrgFz+aJuS
fqzL2Ww6n0475JTkSQfrmolUY+RVPwY0tWjzxXk/QhohahBHPSo0+VENwNQgdw1jE5nVCS95P4oD
qHlVFlXphbM8ZTkdgHJeF4LHLKV1nNekLEWPwsRVveNi07cEFUujkmW0LkkAXSQXxmzlWlACS81j
Dv8DFIldYbd+niRq8+8nT8fnl+/9/rGclTXNtzURsHSWsfJyMe8o5FmBdJVUGpOkPCRpy6EPHyzK
aknS0miMaEyqtFTTeJrXXJY5yejlh18eHh+Ov34AQhsUuSPF5O5p8vD4jDS3PeW13LLCkJqCS7av
s6uKVsjbrv+OlOG6Vs3mMB08FFzKOqMZF9fIdRKuPdNVkqYsMOSrgsPS/1yTLQXOwUQKAMQBa1IH
vW9VGwF7Onl6+ePpx9Pz8Vu/EQnNqWCh2nKQh8AQFBMk13w3DqlTuqWpH07jmIYlQ4LjuM60aHjw
MpYIUuLeGssUEYAkbEotqKR55O8arllhC2/EM8Jyu02yzIdUrxkVyMtrGxoTWVLOejCQk0cpyJ+f
CFawISCTDIGjAC+hCsazrDI5gVO3FFsjKlq5CGnUHEOWJz1UFkRI2vTohNCkO6JBlcTSFtbjw+fJ
4xdHZtw1KHWwHQhfCw7hwG5ALvLS4JgSWlQ/JQs3dSA4iUJinnJPbwtNyXJ59+14evKJ8/qmLqA/
j1hoLhiUHUAY8NB7KDU4rtLUcxbhLzQxdSlIuNHM7U+zA9M7MT6HF7JmyRrlWzFU+HdisOJO/RWx
oxcoNNW/m+pCMX1H8rJTgD2K4if89DETsfrt7ejF5iovBNt24/E49pJtD9wPUQhKs6IEpuR+brUI
W55WeUnEtWdjGhxDJzedQg59Bs2WapHhGg5MyAVteRAW1X/Kw9Nfk2dg9eQA9D89H56fJofb28eX
h+e7h689Y7ZMwCxFVZNQzeVIhZJtG+wh3zMISr99stUZs2Yxt1qvgmwTWyUUkpnkwM9uoyIm0X5H
3t16Bwu6QwF0M8nTVmMrFoqwmsihGJXA/xpgw43SjR2h8LOmezi/pc8CWyOoMZ0mMC1SjdHoEA9o
0FRF1NeO59kB4MCyhKOA7klmyhJCcgobIWkSBilTeqpjqs2UfrFso//hFX+2WYMmd5SBoyEbEUY9
2W6AvP3z+Pnl/niafDkenl9Oxyct2o1TAf5sVqgVerff09vSILIqCnD7wHWsMlIHBLzj0JLJxrNk
eTmbXzjqp+vsQscGs9s7Aaa5kl9j0kTwqjBMTEESqlUANVxa8LjCxPlZb+AvS7Olm2Y8nx1QAM32
fqCYMFHbkN46xGC7wHLvWFT6vDw4/2M9dXvBIun3IjVcRBkZpzSGM3KjeOD2W1cJLdPA17UA11MZ
bEMV8xApaWDj80V0y0LqmQ46ggp7pScc+djd0cayuWNlTIavsUS5Mz71wcNNh0NKYky3puGm4CCX
aIRLbRIsM0GqkqueBuBawuZGFDRZSEpTIFxIvZ0bqoKmxPAzUd6AaypMEcYY6jfJYBzJK3AojBBG
RHVyY7q70BBAw9xSpFGd3tiiYcL2fj9E9eLjoKVPhKP6RpYG6QHnaIDx35Zi4GCAM3ZD0UNS+81F
BkfbFhcHTcI/PHNCuMdFAS4x+DQitzgflilYkJAqa6+1eA/XpsWcMAONwkCohXfREg4JxiutD+RH
Utv9GkasnXe/m6OiSJ/f1x0+kMuNF+TIeddO01g5Nh7OBQRiAXRzDf1VgQPr/KzNUEY5Gro5zIp9
uDb2lRbcdg0lS3KSxpGXMLVMG9aOg36+mSSRa0czE8Y9/RivK2FZDRJtGayx2Q/pLENZItxvZUvi
CLRJzi0FCdMGRAhmi0QD3OCQ15kxattSWxFQ16r4jWce498eblDgiYx6EmAZedg6qe3YsAnWUZf0
ysfRLKBRZOolxQA8eLUbk6lGoKneZkA4N5Mc4Wy6bJ2LJiFXHE9fHk/fDg+3xwn9+/gA/iEB/yFE
DxFClN7t886l1LNvxs4Leec0PQe2mZ6ltfn+gyTTKhg1DphwIhAVqYyX0YX4TCSOZKNxPxoJYC8F
OCON7+KOrQw0uou1AA3BsxG6TUTMiID75ztDcl3FcUq1+6O4SkpbthUL0HEviCgZ8cW6cG5KmikD
iclIFrOw9fBNfyBmqT+mURpX2VJp7qmdBOwlPlste9FYLQMzaLXyHwpVL02uWVxezpY2CH6UdVG2
4HMfNIsa6Jl15rKMgCeVgxll4J6CRricrV5DIPvLxdSP0MpRO9Cnd6DBcP18EGCEGx18NA6z4RSk
KU1IWiv2gnLYkrSil9N/Px8Pn6fGf52ZBI8H3JDhQHp8iBjjlCRyCG8DjPWOsmTty83IKvO0kpQF
AlwekHfLy9GLXxeo2ZAFYJmb/Kd25g21nxmOzYaKnKZ1xiFEy6kZcMVgMykR6XWohzIUVqLT0yof
KS8X/hCkUolONyul/NwNalt9pdCoveL+8IyaCIT3/nhr30LoFGyIJ8RymZvp8j3znBHdKS2spLxu
LIqUDsYJwmx+sTgbGwnAy0/TC1+3muGaRjtSkbJ82I+VmGQc7SXCTJaBQzndX+fcZSjmHvdnTuNm
MZgRhAW0dkgKn8uiMZLZxhlnzSRzh6ZoOa8H42c0YiCWm7HRMyr5kA/ZFozFaJd96Ex+BYd6MIag
JHUmdhFyKokvytdgOMJ2clszdjF3Wygpy9SVJ9QTKUY+cZGQoXxe51cQl3k9HYVQ0kR4uhXCZ350
j3WVR3bEabbPx/pVOSswz+7QvwWPHUIyV67Aw0OFzgbT7FEVjTP7BhacFTa8MVCeQ276PHGfTVHN
YFUmx9Pp8HyY/PN4+utwAq/k89Pk77vD5PnP4+RwDy7Kw+H57u/j0+TL6fDtiFim2kCjhBdsBKJK
NAgphWgmJBBt2otCPCpAqVZZfTFfLWafRpZnI547iCNoy+nq0yvzzT4tz/1bZqEt5tNz65Rb0OVi
OfvkQiGCQ09X6XEXcYSa2XS+PJ9dvGP5s9nq7Gw+fw8msGmxOn8P5tli+mm+eA/m/GJ1MT1/k22z
5Woxn4/ybXa2nHsY14OnF8uZFfOHZMsA0mLM54tzn81w0RazpeGDDaFnr0DPl2erUehiOpudeQgs
9/N+BK+YxtXv4BlVHdZ0Bl7NzBwKlX/K0Pp3DFnNVtPpxdS/7aic65ikGy4MgZr693ME2UepQr2K
YjhJ057c6crYVt9oFKKqmZHp3DIwUMAfkYG6DvOiRTQcIx6Cj4E3TZ3WxiQ6s93s/59aciV5uVGO
tt8oIcJs1WAMT+vK19nB2RLt+S5WozO0KMvz4RQd7OKt7pdLJwwouq7DyKLpcWHIK0RKAYbSOeyO
zx9ChJSh3W1wrGBLZQ4zn/elQTIzPOtcqOzq5fysCwXWvCzSSs1iJ8WNX+Aayyam6eIhDKshvkbi
VAodkWrmJgIkLXXeVd9AgaNiDIt3GS1IJRJAUwuIPkMw41aEvL7Bk+G/1Lyp52dTz+oBsJhOh6P4
cSHUsmMtfaENTv8geOgSKBCdYnxUJOD9mteARBC8cxu2eG7ZOuI2dE/9CWcFwcnGCj2IXNdR5Xoc
DXhPfSKlro8xJqxv4Lhzgc7UbG5c4eQYQDWREYSQNPWxTXAVwGOiz3Nv4pwnuavLMhBT4Ibf6Uek
kiQJJsKjSNQksDwvHcyaPVsX6e+Lj7MJlmXdPYNP9YIJAN+1lJ5hvatJHAXZKAkFMSJA2GXc6TQi
hRi2wgkgJc9Y6GrH1ygyqJ6PU22T5CYpVSvsO8RD5TgzQcMP6Rqd06Br8V66SoF3FuuBlmvaGwGy
8vPIOIjecx0Il8DuEKKTYUUZZngRUIlciYPtnusNgL6DtjBmoFgSTA8IgnmOkg6ZMLpAgwnLdzKB
ZJXahgElAN5e1EuXOWUaYB4u8ZA1OqVB1tnbZJnTnw3lJih92YLxrcEOA/9wWjhHHKPIQXbRZpSm
KyupO1rm26PRhRrMOH/3saeO1nEmGx3IJlRuPXFTIWkV8TrPfGwVVCVIbQuiGYW3T5i4t7LsHSTj
UZViUj/BG6axkqGwsbKYzsM9o2GJ91nXEvoZXp0NRpPblE662fDYYnLwCNM9fscw1ZCvMItUoWd/
V0jhzMmyMpI10GLk4jNmTmWNqlNfj/8cT5Nvh4fD1+O344NnTlnJwirLaxqMu2cHIDesUPcahhnO
aplSWgxbmoRgn3rO1F2sgvkKgrJ6Rza4sxtpDda1NqWm4G5Yg/bwxOewFZk1mrpFsFpItMW7zMgD
whrWIZu6BQ47hOnG+t2mV3Xtn7Gu3VVd8B3IDI1jFjLal3e91t/DaheDm3fxeF1gGTlETq5VWtYn
+k1yLgALo24O8IpTsqGj1sqDAe6zMWNy1xZqNRhZh9EmZhDGPt8fjVOBhUqROX3bom9/CyyrFGxr
1XV2KAnf1imYOaeKwgRnNK/8DqCJVVLf/WVUagxlDmWbccYwrl3IJDpBuHayrRsOba8JGwsZMgNi
akML1uyz3x6A+BXyfDbbWyMZ8eWQMKN6TPO+24n4dPzfl+PD7Y/J0+3h3qqgQ+aAjriyeY4til1Y
jo4xygjYrcDqgMhId6cUoHWDsbdRfTC6ccNOeNQkKPX3d8FrXghX/ptZeB5RIMx/f+7tATCYZqtu
mEdi1EEfFYBWJUtH2DtWnmHh+PjhQ+y4MDJZu+TRre7XN4JiLqeTvS+u7E0+uycJ0DRrbDFr2uoi
JWVEt/Yha64/arKVLa571li2X121wLE8CGIZk40cRpU8arHWO3cmiDQKULTiumBvzifD7G0klfGf
T314LtZsvhxjgIZfrN41zCdzmAZ6xQW7skY3VIxHqZjggWVQEhHfnb79cziZ6nTIHfTEeMj9VTw9
lrK5r+pQGRb9aLb8aJAxhMs8idkavN+NxxRHzES2I4I216leHHDtmF+JAETXLPmyDzsI05qSpp5s
s7VzMo1SNXXHVOLbjf1sWuNhZeErCEIa+Swl4MBWkwttGzBol6ecRPoKuFFgvqIDWFHoYzgEqYJB
ZMP3tdiVbqhexzHBu/Bc4q2wr1oqzJbn+32dbwUxPMC2WcKERnNJIWzI9yXwy5wo4TzBJ1bNpg3y
JOCRT36h/z4fH57u/gCz2kkqwzqXL4fb468T+fL9++Ppuddc6NhTaaaysAXTWZkEvYgZ58gBCkxt
ZbTeCVIUlrOD0K6muLRrWxAGrMJm0FJBjdsxUi3nDtMUNbYS81ZXrBvUKKpaQ3Cfc4mIISkkRmAa
2SUW3W1vuAfOhH5utakhAmDJoKxFMSlkc/3AbWTypny+LkDeooyYuum/2cjubIARiKQV4mCTDP0X
z40fFxsvsZqyNjgwWWg+arTbke6Qg497PVA3Cix5WNv6Qj+zOX49HSZf2oVoA2rU9aMCr9nWLLRX
TUGRWRmukXFa8EA5O4FCU7VBwsK+8oXfXnHClG5FUnaj9ng8DQd2Uz2pNFK22FLLNZmfrTSWz7vp
sM5m866IyTPIrJ1oLEHczeZFHJ+utpypDr7oiHFA2eKVftlyHJisMYdtgF3iQxGWs2nE4nesgFA5
QmAH8U9igusw9GWyfJiBGUgPELCiyIsSrgn8ASfIrjlqoAVPr2eL6VkLdWnN1xbGe0gNusCvLZMz
cl7H3z4fv8M5sbMv3ay/V1kBAWrgDcUHZU76eViXLahyOCRJjnn9MLTyuApx4+2+EbT0AuIqV4VQ
eHnJBWj/32noPucEtDxza4t1hQjWpK053zhAULLKHrCk4pXn5aWE9augVr99HCIoIJYp6ysv33UR
aBcWX7el9kOEDaWFW6HfAdGu6Gq2EWDEBDCiBk/Nu279chrcowqQdmtW0uYBkTkWvt1TL7ZZLs13
2nocmaGH1LyMdrdF0AQEDRNvyvbpna7JoMIb64jHdhTfaI92XO8gKKJEv6BwYKrOFynwtWNg2FCF
t2Q+7vTi/TrUU2OdZVUNRn6tcqposjEj6QXj8y0fSrOLWmZrSWI6LIDXxDSnqNlEvP92MJp++gn7
CCzilZUl69cpaYiXbK+AmitPI9vqdhlDNIbCnUhhIx2gnaQeS16bqtDNeoMz5y0Wts17iroXP7gw
SBS6CHBozCfT2I7vSMf64c2TM7BmPB+86zXBbz7PVFhvv9HMOAp85V7A6+bMbW6VYY733Kik8amW
R6K0cAIMS+hdraae+iqgrnkm5gMCfYEhVZ0APhXBo+NRXQrU3nr4Jreqop0BbJhTTm09RC55gWGe
7pGSa259xCKFba0D2B4InSIzP6sLqBdzGF+x30cgMkbLYg/1tfU9+luejdZLPI6tJOQIwjDv3luA
EoxQ2d7Yi93ePECjILd7e+lk4vRkN5/LEPXaBy1ggxfz9sLLthB452E+nvA91IeObl2m2sGxV1j2
4Wvee4AAtw89tKcD0chvfxyejp8nf+kbru+nxy93TY64D54BrWHQ6FUDkRqt/ZhJ+1i9fXrwykwW
s/AzMFhww+xSbqPZe0/5Tp+tkyDYTHxLZbpP6pWQxJcwl8a1VHNOPetuT7B6A52Cz2S6NUHzHrj7
qV8YBjIZZM0NmPWxkf5VIoZzrPQ+WGxANbj/QzAWr1j30OphbZMIUAU8/kQAou2CchSmpcmbu0Kw
BCPMC9PCYqv+/k1Nc+V5M5cDAzBW66UB6V9VF4fT8x1u46T88d280VfvaLSH1FwA2vEpF3mP488q
sv0bGFzGfox2hIwlpMcwzmFJBLMAvWiR8NUxMxlx6e8ayAiTCZuxmCMDR3kPxz/wUISfC8B83P5i
5SO4gp4qr9mNbyiqKPN1web2BrV3PxL2Bk9BVYsxxreDVLmfARsI2sirXZtU3GD113K7uvAPahwN
H9nttagjh6YUZ1eYk7IlG9rQiWF80Cwis4wQG9Udr/5OEO8/BGDIOvRiXFcuRhCxNEngXqR68OY6
8L4paOFBbOX07fn6o2U/0iYyn1miok+thMAMftk6z0kbqUqwWmRG1kypYN0ZDi/4H6ZLLHaSZmNA
ZTFHYO3rUv31p0ihObUI4xC3s9j5uw7aOyuYI0UQBaakKNBZbaqzaufyrfct9BvZNiPcY/S1GzpD
/e/x9uX5gDlN/H7bRD3LfDZEI2B5nGEtYuzM0gO6gq9BbIVAu06z40SSVwjCR9uGCYIOzYvYXinp
eWQoWOFN5Gs4fjrA9CEFbeLOPoc7slTFh+z47fH0w7ha8pTDtMWpxrHv61X3YLBNV7UHbZuXcYP3
cC6GG6ETWdbJIKuBCQv1jNg+F6ocuIXht9qMA6Hf45lfdDEH1HS1WE1l8qD3G+3NakbB3beEnO/V
+SkAVnK76suF+ayT5xGiye2U4SNSdcZVOfbSR0ODBpGVRh0sKEBX13IzdIMOW5ykmK9NvXMVFPWX
FU96PpFmEtaGim/hlciFIUqo0my1+wR8fS113W/pvtDdSEPO291TzAXpUn0ul9NPdvDXqeWGVzFh
aSWGQjFoH4mJ+48LeOCwlh35P8rerblxJEkX/CuyedjTbTu1jQtx4VnrBxAASZRwEwIkoXyBqZWs
KllnpvJIypmq/fUbHhEA4uIB5sxYV4r+OeJ+8fDwcH/EpEWUu+LOA5SNGR5msXdZuAofdb/yqW3k
W8hPO/nw/8nfN6UiJ34i/BE8ktKkxGSPXekGSge2vAbQNs+7TtU8cZeHMwtXfwLdVHPMOwGr4Mg3
VOW0P3O07FUvomoAEKR9pqjlZ+WlYoKONZGAjIeMdN0n3CEazWxkD5SlscifNcBeIquCT63mKZKp
VOky8siGOngS2WMbJnsu3uZpkSgnRvs6Py+ksk6A/qBtflANocn9Dtb7vJ5UsmwHqa8f8OIGjFGM
rYMuAve58jYBflNZOJF6DERk9Ze4PJcp4pNlZpTYDBj2nfQh/AJlBlyqatSkPCiXZIyo+0yRMSr8
g8K9SB+1lPiak2vUnLRqY97njwZB+naR8yv8XcaQtczbT95j9S6UzitabgUonAsut7DtYtPZNVRa
RAXadmzrVkmM/h6zY2oS4Xq71XIAepd0mCUrG1RtoXzBaQc4IOXVabB+Nfanmlv3y5lVrBq4i4lH
2Jqa+wLVNvBEz7KtOZBOmZSRRN83J4OwFEpRrUBXjAnmGIshysCYKNIgVdPJQabuU9wcpuCVgL3W
lpteF0ZUZx/nS1uMDM2BkLvkgpGBRHsRNOPSWIek6Z8HVJswg7sCH/YzQ3rSWHSGC8340jQZkvOx
l8fuQiacbmZ2fNyV2AI/M5zzQ0KQJOszQoQDiSoBz1CJleuc1w1arMccHVczXpR0t2sKgn6cpdo4
Mlo4OyCF2e2UW5DZ1zCe2ARP7WN8B3XDLbgEw9SNq0y0qKs4LfQq3mml0OCp8v/8j/+6/v70/h9q
a1ZZQGwODtsz9vyzapUByCYLoxm7GkXgAT1cbFVJh/l2gG/bvoW7H0KKvbqpsG+pbMtuD6hAUbWq
88G8n2/K5CzF08JpghoWM+nr2xW2eXp6/Li+2ZyXLwkZgsMC0b/oGL3HoH1SFVS4oVvHyodj2cgV
Ap9gdc2EQIVKuUATYGXmF6zEAu771oIUXWpBEKe/Ck7LvysaMta2TEmhZdqvNdbUHIfylFNW5cs6
MX4bVQKaXhmg6aUAGpXF2W2/AVQJeTjlXZLlCsSunQlCglIrtsf1vofzu3IBCTQ1L1r6srmYghzj
1D1iAlHr9l68j5EH/Z6XHp3FALI6Y9Nvb26qQGt2v3b5XqU9nBpZ2ceT/ZU3pJKZ+dhUgcFcyVIU
Vd4FCpcRVRqYtgyPSodk9Hgx94aS24JY8txfMqQjeR9xiwNVGlUwbCwP84Bhq83AVFXvd8+vX//1
8u36+e7rK6hRFQsh+eNRXymVVD6e3n6/yno95dM+6Q65PmBkhlp9eYF9XIM/RYu4azLv7XkJFmS6
IVzK3FstH91nKkKsDfT16eP5j6utgSrm+B+0Hv1ja+k9wYStxCaXfoZCWIxntKv7j3QkIdohiFkx
JYPsf0BQmTuodiz0w4uCVQkmcKpcmjMzjjH7QjRtgVj2dpVpLWmmRFvJAPA6x5cUvSgrlWQ8VZLa
MqJZ/GxONepjV+Ooc/28qmd1O41in6j2lgJnngZxT7+U40yUpj4T/Q0jJ9KVSlh/eOJeqT2Tu4+3
p2/vYAINt/Afr8+vX+6+vD59vvvX05enb8+gGHmfbd3lYtEEmXn/iAvTMgc9iell4UByFEdKNGEK
3Ug4OeLpkpRJDEsl36frLCncCePvOj2Fi0kqU4PJJMm6e05pznuzauWutIxZARq5Z0YliUGpTB7Z
0Sgn1Q9mcajUba6urMnotm1tNTpY58EUS99UK99U/JuizvJBHYFP379/eXlmC+LdH9cv39m3Wjnr
PeqsWnR6LkQ/keb//gl5fw8Hpi5hxx7J/JnSuRBi0rkgMtElsWMSEAFBxY6JQT0dqFKHnhtIMkhW
cDaw6Kc4aCTEpTaNTtuNQkWrS7ucrlskcuq8w/+q7O8c1EQN5Ytlt8d7sIYYNPWh1Bc+KHxyQe/d
1/rYcsIpMvV2YtfyauJlylLj0Auk6czLBhoQ7tK0yN6NUSZXg30HbJ7p7Bbl89EqW3NbyiI8Exyf
nv+tWW1NySMFkJPXEpA3qVTVlcLvRaPBNJXjEYxYqixAK2j9AF5lYNYeNn5hV6omvFICGxvkq/Uw
z1PRDSo2jvSHZqcBFE0PBySbU+NeiVcFv7gnzFG29ZLIfONcFDiA8McKlsS10ifaC7seHpMX2OoB
UJkod7yUUrVNoiew67ww3qB9XHo9ruzlsw8/I8LMIpi+8kzLM8aO5yrb1kIdD+cOz07iqc7oYpnl
qSaucYr9ZqGUd3z6w1PbJSkxmXiQvQmWSSv1cntsdIExz3ModIA3Lh+gR9TRdJYqTwSzGmxESQOh
2TDbC9qNCTOQU9bDmTr9ecb7UuJD9cwSQ6buChJSY0KQhFf69Y+cqmV2SSyw6Cvaw6bN6zO5FPSI
JqcqkcfzUKLutmQeuP2VnzScxa2WSTG0ozNQNk0LtozYkGe2YViqKrDYjcrDg+nUIFtUi1uqKk1G
GQ+kUak1UdrnSHBdNBuMrEksqhY4s/iw88PhWFPUPHS9PdU6JZhzoBZumcGOtcv3qfyopZPjzHR7
wl7FSPotFmSkG7itFjz5UbXKg/y5iEXCtNRdob5DXCCuvMamIVtAhnF3Io+jCMMwDc0HI1wX6bs8
qRDTWykxJiBO+j/5vvru4/quxr9i62jXtCMdF8X0+kPs7cZHGiDffk/pHZOKSmysEYTF7fO/rx93
3dPnl9f5pCj7QOFr3bIk0t90/oMJQmlz0UHL3KFesLqGzEHAkuH/8YK7b6IKn6//9fJ8NR1H7NqH
HJ4OqUvGI3u3Dur5DLuclRiOmXSLL+i0a+TkHhMtHMDkgmWtgPPQkl3l0R8g2aqEnWw1AISDxvCr
u/UVb7xALEij7rlc6qMLWcYLYjirga/ORnHOg0HSZm3K3CGXKZz6ICAM+n4ImJJ+6+of7sscMrB8
ceiMzH9N6k9jQf/yVfr9OYHuatMilyN1AERO9aZQSQMERVBr1oKyT88ttZCYwxHwu2I0BEdT1D0c
4GkUOVqCQKL9lRhpMWDKCTdqgp5mD+1rNFgL4JWog/JRdaOclV5LCWvz5B5v6F8TcA6qEvOKCHNn
teNjN3Qw+V7tTP2zKW/Lh205YF+JgkEjWz6cOGz9Spq9HhpwnlAnsrt7mRwHaBMqhq2JMphtwolK
JjnJgIz58WZwD2+9SBAP2npAzBxECxr0Kt0lJpW1qkE9TeNmUlibdVWXhR2zDAWXIkT/Tlt05gVV
2rB3ENQlzzqF0u1BolGZatknmiDQio3mLfAEcuWf9VhP2Y5ESVK+0mE/MxWvyF7EnVhoSUNaTpPz
R0O2LjDJy73FDwZF93nSn5gREdfaco+CX35cP15fP/6w73n9+JAmWkGOabHrWffhJWE4yQrckEEw
pJXn+OiOyfGWzqJBaRWg7rWxzsnnIzqNoXW7c6k2NyWMJFMlL6D393qJ5SZoKiI/2qS0+Y3F4knR
1pqSxLKnwlvX4qY8FLxH3Rxcii4vFXuBC7xgVSNEpfsDnOxkB+MlIzArSfClo6wRghsmWV6CsT17
z0fXJUvkwYk/zeHZvIgPNDb1CTMem7m7/OFEC8/cx4JNXX7IdmaRmdn/9CASWMD2jyB8k66mxUE2
PdBapl2WTEbIa+W9aLOuSlIGYKcdAcFt3HQPNHBDWuk5X7e/LywB4kCa3qIRJ5NCDYFIf6+o9Rhs
vZBmqLoe5+1xVF7+TRR4NNr3j8bTqhmHfrId/CUNMupMkySVFuaGWeft0VB/F9OYcaLBwQZTT4Cj
chFJQ5DocYoWvdQPpdM6qZPhEFcR9e4ZpodqYcKMqlVLbzBahxc4cmnpQaGnTNOR2djsbZIzOOdJ
qp2k/uO+dZKj1F/cmYL87kv/YboNlYhmoFwAjYDeIJbBfNnJDjimVxvwBTDIdYbfiWVQMIy02OoG
EPjUVnMe275SC1iRwiCgwdQBg2XnnmilW5lErAX6ExbRDSDF8hwIeZpoxeP6RyqPnUo926LB1Vys
ETtcFQGPCYnsvx9I0/NIpVlBFwAmN7kZjlvnQpypmUzg8mKdw+JJ02TLOw/+gw4fRQUkjaoUF8ll
FnJs5yflwP38+u3j7fULhDA2BBjWe0mXnZPuXhth/OQ21hd10IMpWFq48uEDqFNYJDkFeqakx/pG
tmkDVqAg6rMZEvPP1na8XEY3i+KmtknE4yCpJWEkMXOUcpx9ug6iLrIZCj4++6LU5ySEtVJjQ0lk
yMY6zFm9RTwoOjBsVVDYxBxT85piYzFW+zBdCf6l4NAXvlZLI9YZm3pNQ2WjptZ4qyKlJZrKMw3K
7Pr+8vu3Czg3g/HJzHMMb37s++yiJZhdppTUlatLwPmgXmntSzhymukBFRmlevA2tlJVQ2g0OT2L
JJ3rD5iwDh+BsNY3+tCbqGh1VmO/sYFQaKt9boRa40OPLkNUtIutHZ10fZunoT6QOdVslVw4rjxc
jKzuiw51/clAKO9oDBojxBzjnT2grvWmGRtNTDWNsD9FG0c+hayNPf6g9fVfdI18+QLwdW1sVs2u
OOeFnuNExhpvxsRIVCu+9DpMO+0KanqGZS8d15I8fb5CcFgGLwv/O2ZBxDJNkyynG9UyC6xr1K+R
5+YIy6R7uJnz/GIf35Pm/Sr/9vn768s3vawQToi500KzVz6ck3r/75eP5z9u7oDkIq5S+lyJurue
xHw+GMpRkQKBoDx3FgT28AU2vqTONPZWDdiZ0p0zUwdIlRZ46HJg3Z1ME6I2/eX56e3z3b/eXj7/
LmvLHvNatitmP8dGuU3lNLoJN5jlMEflt0+C0pBjIQvnXdIWmexpQRDGnhR0NJl08MjJHh+Ax6Ml
nuwEi6e63TD2AzOdJEgSqt3d8umpAp8yslw/YemxknXPE7mCHMaUK+FZk3ZP318+g2sGPiY+m26T
pQoGEbYjzHm2ZBwGtGWCUIlbKn9B1wVMZzmxdAOZdux5DFvKvLhWfHkW56y7Rn9+eeJekI55qbhC
UMhUEO+PEF5Dusc/91WL+qMhPR36Sanuhh1PbvbgvDsV7C2w6qMaLCJlk7b9ZXF2q5PYMTSjCUkW
9eBoIJkzUQq8fMe87/F6IaVf+MDiXjxRkVNB3kTr3lxFNWZNFXf7dZYdL0xn3RKuHnFMo0pNzzTD
LHIDanMhFMedGqaO01lQDv7taHUWMMc1Bh9wp75hXi8lpYIEn08l/ZHsqGDeF7KJGzjWVRbMLj8o
j6j577HwUoNGyqJCvqVSmOxCUxAvrkGqKmU9Ehl1DybNlzJn77jBYxwbVHtVmQHgnm2izF/nSqNx
P3ZN25TN4dFsNAaLYHaqKy1zjnIF9Y93oUw1fLdzX1QQ7Hws8RutyWn/oSA7+olNXe2OSbuCDfih
ZolFWVrUueDS+ZIXeNmYt/N8V2CLHSlAUwYhWpRxwBVBB3kUTELiFMCd8y/mICKQ7sh/YxOelHDd
oX0nqCe66K4oTatjoRZQEEzXTBMAkghy9l0U6FJvz7JDU9eGq0kWs5stqtgafKjVdavqUXumXhr+
jaJwbfbQsr3lMoWi4D8n63dETgC8FvS94kqUErkLBxS6b3a/KoTssU6qQimVGWuN0pTJ3OxVvwTN
nnk9784QhlIWuTgAaluFxl0HPaoJKuEm26RTX1oIAp0acRxt1fOigFwvxsyUJ7iGcGZSRYUDOTml
yadcDdEMd6jlW5p16olw+gbkfkJo/fui9T303DqxgqGUUQ5GZd5M2Ou5f8Y6zu0jxbf8xN/tsrvP
L+/wZIhKpNfnpx/v9KgA45TKCa9vd2D8KQoBoaavn+X1bK7sDn/WO+FkwKKfTqgarmAhilos/jhl
jF1YyP5aWKuO7X2fZmf5Ul4miz0CDPMXKV1huBiSwrR0gygOG3AuByoUtmeKY+65lLsMIRJZtpyp
NcpLqWCTmss2XQrI5svs+ao+V7l5JAbqaLigmjoOPkHsq+AbHm8q6RWjN4YcLxXqSo6B+2TX8VCW
MlU1DeaMqUbQjIU5jZnJo6uuUl2uIXh5f5a23annssALhpEeUWWvXQtRlWao4FY9qksVeA3tldgZ
xb7SbjEZKRoG2Ww6JVvfIxtHoiU9xEwmRHl4RSWUsiFwyS2ikWCbw5EKPqVy+cuj7dBzN9wVIV+I
UM6k7+QlK2kzso0dL5GvlwpSelvH8XWKpwS+JXlNmo7Qk1DpBQEeR3fi2R3dKMKCvU4MrBxb+ab8
WKWhHyin3Yy4YYzHyAZbpfaIXnwQZUHJLuPA4suKa5/5+0VvofnjEQprku1zqeHAHdtID7aKgpup
z44FuHzR7Aqm1cUTexD3TZdDEBZJ5TONAEano8NT3rQIcpkfkvQRSVzgVTKEsRzTXtC3fjqEBrXI
+jHeHtucDAaW567jbGQhVyvxXK1d5Dr6RT6jaad8iTgmhNBTUS+7GOqvfz693xXf3j/efoDvove7
9z/oYeyz9PLuy8u3K+xQzy/f4U/22Ryo43/89XKGY6p/euxtJT0hFfIuD7n+e7aIErECulwEJ5nV
IHl6lL1WptV4vtdGTlKmzWTOpY8o/VppAfBBdUx2SZ2MiSxRg2mvNLrPbVIXyiojSOychYk4Ap6K
Mqk15SWVtT0BI2RhKGIMZADB4a+sPikyFh9PPmYCl+7eF4gai7JnMMriOGEpiyjE3cdf3693f6N9
/e//vPt4+n79z7s0+4UO3r9jEguxxKw7dhxGrZGmbyXNxvyBNOYlR8UIY3o0GqIG7UuvNxA9ih4U
e2xGJcyMVEQkXRqhn0b8u9YZpC3Q5t+nKLlg/8UQAsGALfSy2JEEA9i9GFE8+zOoa+e05qGm10Nr
jEsJFj/yDgV01f8KI4HvKj0oGG/o4bDzOZOyrU3YhmP4vsZSrgfvZ3gG2roNfhe9yz0jAW3Y+HTD
ov/HZo5Wg2NL9BlBubfDMBgVonTaAdjuyDpYV2NzapJCptaPijQaZPFVEMAfMLtcF5aP//Q9nYMH
tMpyemIbK/LPwHEcnYXvEbpLURWtINyw8WWXH4QFEFgl1L1ZL8q4RY9TE7zdaPUCAuKrmS1v55WG
rc6nSl/GmPsd8kjMcoGiB1MHMjSn2XiK+qCiggBbT+v8QrcmTLcxcXCZQdprJsCcp3RL9lGqBzOY
GYcd8n/SkzH21RruYakWftXpq0EF15oPerOd9uSYmoOUk3UDaJwHsRvX2CAaH7s/MzNX1++ZOsfh
0oFju8MKO3LTvznAkK0wR5CMWnO0PXaojCswOTpCsZOPVOxnI9VL/FKTJzVqzyG238F3t66+CO11
uyWZqosyfFNprfMF3H+qNq0TGYzRbV+RPh/0QfRYBX4a01nrWRHQBwvFFHicZralro13chkGLj0X
FYTGBaOfcYQbvWEXHlzgYlwPdJOnQhedPI5W6ocyUU7IM3Hav5Tdsd2nRhsCEQ1BoLJlqb8N/rSu
jVCLbbTRMrxkkbvVu0AT/RmtrVJkH2ur2JGPxXzn3CM11j3C8836mJekaPARnR3VusrShSa2LvI0
2CWyMyLy9oHSsZUWUdjItCpjtzBZ3iseASgZHNcmnUKCJnIMimtSTKZNECo0WWuzUNlYlgNjaCan
/Lfeg4IqtBOIglwwMHEUtuGCx01FF7mpkbKK3SP28gqyYNK53Yhcz77cq6vFxMUDiYCvhORABRH4
gb/CgkTo0KGCgmIUBQEbICIZXVng3o8785dzOUEos6LNbWFq+b5gA0mdtOTYWHEIEQW3A+cCPPBq
JVdysagnKXTpCjrW1H7N4LKGqL9la0BIUb30zcDxLRxzFRJ4z0AiY2fVJKXKZfyUdxZXkNUyPG0M
TEa0gieLGUxWsZ0Ebxh+K66Uel8m3G+vnAI90xc9pmeBDjSeR4tWYa2ObW9ZhUWkgebRo80IVyCg
TcGuuk5EC7/BKXCyQ9tCwKg1+/SpLJgJmizI6WmlPaZgFOByTuUuZvI8v3P97ebub/uXt+uF/u/v
pqJgX3Q5PA+RiiEoY3OUlSQzmexaDyErl0gLtSGP8tlytVDT1/wtgni6Na2dheZI2NCkN3VmWWlA
k7x8DOU6nBI5KuNM0le6/IEFhDX8eWqdqkB9nmCCbpWk4PJBqhEl9InidIr5hCh9otOU38o3zB/A
8nN++r80S9Llpwx3QXHosdcjtFxE1rfSOtG/SGO8vRDU6doRu4cAl2Kl5umZBdWkvyFWc6k4lux3
iMfErmhwz2b9Sao4b5RlJp/q8cxGSdcQMpa4DuCc95jxlrhLUl0sloqOjPk4UChwRa18QU71Ia/A
V6x0nu1ShYf/plKncjUhiE5gEvmDbMmMgVFTSzT3CW6qrfMnJlmqDLJ4N+VX0MXToFJ+z9HuJDTI
8i4WfLNw+xnlEM7IMEvxalDU5qFbuIRJbJnldaFnRElW7xwTzl5D7E6dang8oQwAAzs3vKwkMrPF
ko22AW4uq1l4t3PoWEHsqXRQgp9JZa0o3UpR6NGV9LIkLRHZky86Fwo7WmR9FNHhrnIwqhd4OFVf
qBWsS8+j8hJJQfECFYn+G8uCHklyOr5znMqS7hNyXyqTXOboQUvWd49ycEsZ53k6ai9Y7sEriIwm
G+Dzd37z9JKp+vGN+aFQ1qJKMUOFuUyFtazpRl8zmz83HT31YwvyY3tsDIcvUzI8WA1+/pXZsqSl
0jO+mcxM9Gih7EZ57/rucDPtMkmZbI46+5X5ei1KNxW2cf2MuL7q5fhEckpV8kneJfI6kZseLWRl
89qiPc+ZSePZwzOnwkvdF6pzrAdrdDv5y84u3kwsUIvmZndyp92o/xSVK1V8XO/qBK2SsMVXhChF
2Qe/rSpJvleWQ54ltOU0v6xY6dPkXJxulF3oQKT5JpQivepgZKaOLuqUZMJ9JKUNRtMdakmI9dZj
4Tljb2AnmD/uNb4SwfOszt3kVilIKi83dZHiHcpiVSlD9ABBxop5mmDFHOBpl+oZjUowDm4JkeGJ
SIXINHGXbv9lodgSe66zGQzCmBEl9Cr7DMnqUtRwOhnjjaQ2oiV2HWni0m8DLxwsq0KmPwI2WeDh
qKyN3eWessDz39xmSDkhcDr9x3ZRxmEfyV6AJbzk7JBEyf3jMbnc35pn+Sd4AXeLa590dHfA9AIy
U5fn8A5ZPtDmik4WjFP3VYIvggC2D2wztOJs6bCzHIqkpkW1fp7D0cliSsuwUXXJu9CLHL2CWBgq
zS2F1C6HpjlYjkES12yUfJPxlFxy+yoruNhTuFtM7AUk+LRBqvZrpWzz901HF4ubCSbdGbfEkpko
R1I30nypymEz5mrAW06ClRY7KAOqmt4wkmm+PDEar1NklsCmeKIYuRj6joVqmgFqTLb9kKOFh41G
iu0vWn67PR3cKy4ypQ5Fg/zqnQ6Tfmk72h3RxrctgHyUaC+OUcZH9EH8Pk/KekD3oDrpIWEJmwlL
BiT2Yw/fYOSkcioO4mp3latr6kYd2/XeFtBr+kouIXuZLbTsFWjK81oPLic+i/2ttOsgJteCxK3U
LBX0bI6u5PKdi0w+RdEzTZpnipVu2aZTQbHWa+7x3qVpNDdlNRH4Lq8PVEa5KZe2eU0S+td6lfit
4FL+hzLxFcOLhzKtVQb4rUtmgmqfpjTLgS4z2hFj+d5y2SGX9AR2bRX+VkTi67KbDdnlcKi5uWd3
tCM1+wuUDZyB2lxHCh6SVKAtk5uMDIddPuL6OfnLPH9ARz2LGb6n/1PvJVFdPKVC7PZUPqjJSRWl
6rOOpFvP8d1bNSfFzcYhFblx0iVNCvpP2b0XoZM/kR9hAIF+QlQxR06kZ6vnjZxOSiWPSds+VnQo
YA3GVJuyhgHu8ZXl6WQrymPdtOTxZsv0+fHU31zrb3OcC+zOWGK4FJ+UlZP/Hi+B4r9jpvqOovUU
dPZoiYWUQcsjcRW1yWdyJfWjpf24STS2v2WZsmFl+R43tLrfK5pyugW32MLOjNaLVn7Gc3zUPBkB
QXJYQC5c2T2nXebZ2HfFAS6CKYSVuqCH8VH7jOxNZ6FVUdxBEjY3c0llJMN8J4wHeDqO5p1kcNWr
fjOpTGyf8K1yp2r1Jx2HntgurYKNu3EsiVE4pLuJllZaMVM6nRhv4tg1qdHMKuc6po+HGp7L2fLl
9zBT9y3n/CIFXxj4Z+KkrpYhS87FUnNBLNK25LlLO//Qa0zMS8ZwSR71CpRgcte7juumlqIIAV9N
cCK6zgEH4njw6P9p4OLGRQOYEGvSuK8WC7l3jUE4ia16VRaOpqeCEt26LZWtmR1HUuop10M7pptg
7H9NXJcPA3wxpHwWnmlU97HjG+PoASu1wISIoDaDEAg04uRtR6HCvmfM+j53nQGNn5l3CR2wRUr0
b7IWpHLPUkpA+zR2jU5hn23ilc/iMNIGOiNuVeIZLA5Iricvnq0c6JrldfBfbAhzRwzMSldRwasv
YveXuslyTTff7DXClFinXJgDUXM3zGiaGpnREtLmeaaXpOh3iRJHnlFT2Be6RhE2ZuRUF3i8K8bB
9anGh4fWokphKHvas89Xkq3Oin9CTiNpCkYDlU5vhqTTrj3GJtUV/oxctA8bx93ai0YZYifEHqoy
WPih+qcwyGAao+rHl4+X71+ufyrb19TzY3UazPEA1Gk7c73EwsD2E9Uxho7zjrMVd2KE7rAVglkN
lfmQdzaOCsLNz0YobUqsezbFxqFNlbcHCP/Mruhk21b9Me4I7MEakUpBpRI6HIimb16gVi3uS6oV
ob412adtGy1wCZCwFEh5lE6IdKQKN/jaNR0AadJrrPfJRTlBA62F0L8n7dOuL2M3UITThYw5CQAU
VC6xfJ4FIv2fIhFPJQbhx40GPYcF2o5uFGPi9sSWZqnh/17Cxhx16yZz1ErUegFwXaQdB6DaFQiS
VdtQNr2Y6KTbRrL4L9FjlE5XmyjQG3JCtsGAttqhDD1nrb1qEINiJD+Qr3YmuUpJFPvGGGCGHPTc
Qezeq+SmIqcdsYQbnNg+JafuhJ/h5pSG2PNdRz/CG3z3SVlZ3DZNLA9UDrlcLAr7iYnKk4E7YH52
2cTK0iWYjUQv2qMxvUiRd10yamqquV5HevjH7OHnufCQuq6LTU5/zFNlxbjgsVwuskXXMSuVnRZ+
6xHHNEh9Gc+o2nUco+07I126hNnSVaIEtWlBG4Ge5aUTclIPmmdRelbuG0zrsE868W5uEvmTdjet
DGzbALvAL9f39zua7LJhXJSWgV/j8UKULf7Ih8qY9p1k/9G1FTkowLzhKDnNgl010K70lU7caAZh
zFBNyRx6H3PlW5DMovY7K+sdt9r89v3Hh/msc0msbk+98dXx6e0zc55U/KO5018f5p1iuA8/wZHG
vezqgFPBcfC9qvgW7GnREtTVDIPpOZLCempK9BCRATeXQJgpCbZZM+ukS8e1vOnQ4clp3zWgbE5a
gl8rch4mHq+mDrLQqKV/YhB+95dUue7tZh5qWCfNdrFYt/N+/+Pp7ekZIggifoz6Hj/0QQnpkZE9
fkUdrLP3ebIQV7bs/WujuGxtlRDURUsX4mNSZ6Uad7GCF0pgU5c2sg0HA5jTRN2KnyPslTOzCEfK
x1Nl5yOmKuj2ir07g+XXN5xAir2RzwUiHmcNZnPBy9Fc8q7Z77W07qlwuquUpZcfkhjCWCiMnddb
psJR2IxCidSZ6zxGsZVuYpwmsV6YXY+WRc5tZ7QjtsZf6HStM9XSayYyh4O0AFWOXzAsjLtk42Ob
8MLBjiBUHjl4siQl4UO7UeWlBWvwMOALg27mJiVbDZBpimGqr9iFTvrK9zDAcMu6QFaTIenr/h5L
dHani1W87fPVbmPDDktV8q2LlZZuh6jN/MIygIwkP1VJ2hZMBJSRQkeYbWxQyOL/q0/p/1q01AqZ
8RVEd/TCqSZb4UH8ycDBEeb4RS66DBaUUufo9a3MVp/OTS/fFgGIJnymFRlZSF5Lkntg6HOzXnTw
+f6n1tvYEdVfzlCU5SOcwlnoN5OOcKqOWGay6suMkY1YLZNLW2NzmkUu0ZH0nNAzTwCzK0ou5nip
+RZFqQ809K5Juox2irLysf6lJ/0E3TcAPNKvlI2LErlihethFhUMK0f6x8t3VNSC4dLtuAxAEy3L
vD6g4YF5+priZKEqSp2JXPbpxndCE2jTZBtsXBvwp94WDCpqEGzxLUDwdDm6B3rwNlVKw8y3Koe0
LTNZal5tQjVr4QMV3mBasifCXeU8MJIvv7++vXz88fVdGRtUejw0u6JXSwjENt3rrcLJCTpqtTzm
fGcBDfwILgNCKLLuaDkp/Y/X9w/cXbKWf0FPfHiY4RkPMZu6GR18o1JVFgWh7Zsqi5WTJ2v9YgiO
macnVMRovDMGKY5RgNIWxbDRU6iZeQcmODOU2YLQoX/SvyMFCYItFvxYoKHvqNlT2jbUJtBZNjQR
BLrMKqvLX+8f1693/wKXkLyL7v72lfbdl7/url//df38+fr57h+C65fXb7880yH8d7MX4bxia3BN
ac63l61rUnh4SbrD05lQgLlOok2zZBj0GkF8q9gPDOKsfNfI941qRsvo3IGpdRAKc2o7DtuBrp2X
Fw4q7NTyI0G+mkCwJuanWLdZ02B70E2NccV/hM6pej1gaHGg4krZoEHUKZ5TSbTXP8qr/Ixb6jGU
iWq2QWxuA2wHkd1PyK96+TQ9HMukVnw1czrRWreoDjphMGY3lXXLFrfrY3jT+oM2o379tIlibebR
E7R3r5KYFaCxA4E4bNsX+zDQ86r6KPT0De4cbgaDcSDGukPPAFmBWycxnB+/rHgDYxJXXTIYP2Ew
6FLqhaEbzHpMTMZU0UmIayEYjJpzMGQwJjQl3Zg13BmhxeCTMZzsZemKwjZmuntf6xzip97G1Rfr
IwvhIGsR+Bpe9ap5EqO2HW7YxkCbeMdOZfuNlgEjRhrxVIf0gO9dtDlEHuuHU6JZrAPAPCRbsuXe
k3et6k4ckMmJsrUqs5dlPLoS27+mgDmW3C+VJvaIu0WtT+bIPzKt7HRCu9VnGgQimnbP/E8q0H97
+gLb6D+40PP0+en7BxYbgi+wDbxbPnlGB2elxdyZbS6tF7q2NXTxGawO0GbX9PvTp09jQwp7a/ZF
bfiBVJu7oDsxO10YqtTm4w8u1IqqSwKEWu1FLJYr1TVkzNNxDj8nYXuiePSzSpzKUC0VU7+ZJBxF
Ygj40ATv0+bGC+45dBtzhAVE5xssO/32R6qTUQ3ZTXwK0f8oRURdV3QIFwnAtZrn9BZLVbQF4zna
3FKh1m6qb3zCFJ106/VDOUAyI1eEHugr5opeDqinKJCY77vl5Mo19EQO6fI+HSsY+csL+MyUZc8j
c65jeUTStkgok76l6bw+/xsNY9O3oxvEMbgYSfGtU2UBp65o/5rZzLpi/fQ4uewXwMhi08vRoopa
ORdL/HDo3J/qdPJQKmVB/8Kz4ICkdYJhihyL1eJSGd6PPE/Ng9Gp1E6FNuXYM2PoC80J3VVuHDvY
d1kSB87Yntq1z6nM5SpX8hNQ0fXSJ06sakl01EQmCywTAd9birp/og9u4AxYDeguu8dFq7kcyRBR
4Q5/KDExtUlZWSzHJxZaNMuL27le9zF7Mm582qR5aXHwM5dyttgjltPNnJgq9M0NEaB3wDOsWA/M
1C1G1U+RKn084ENQgNj2qfOEZtrsbOlio8w4dUpA6Fu+CH0XGXgM8GKs+AwKMFf0CkeITEzEyknN
MFxLll8+qAe0CRNGs8qiNGE1wTKsSWu3XVuYPEjzBk97kwdWqvVptcs7Kv2Nu8MGtS+f26BCKkiJ
sRzbXKHXFjqypjD6A9pY5sFMXxaGxEyQEr0AKTDQI3SRojv0ajOxExLby1vca43KSHacEV0GKjpX
1haCsk3A/UxbTGJAd/12fX96v/v+8u354+0LYhQ3LW/cmhZZRY5ju0d2AE63jG0KwoY6oeaKvEdU
HghPFydRtN2i6+6Co5E7zFTQTXLGI9zu0kxnrf0XrgBZeiXUXS9L/JNlwfS5Jpe7VpTwRuOGP1ff
cDUTbz2P+Mb+PTOikQVMtmS9qzc/k4qfoDth9ynBNNkSvF7Xzc9VYYNsiQt4Iwv/51pz81PzZpOu
jeRNvtbvm2QV3SFo96m2fEOOkSdHqtCxcLOCbW0tRtHolvg4sd1arYDJR0fNhAbRTyQRW2ckQ7H7
GI3JTyx9xqrhr7bF5ifaYtBG2BTY0LLZGLvD/P5SA4wIvwodoqitYdgAYEpDTIykQKjZfcxQ22Xw
6DJeXfo0Yw2FvN94WysUWqFoE6Ll4WC4vkExruOtyc+4qtZdHYh65HCZ7HpIK08Bgi3IOCjmwzMG
geaZ208TQ6IJa8hYZkh+M0oF7zWYlBlyhJC/RhbgBR4I0vVSycId1pESg4s/50U4vbVBKJfIn2S+
6vr55am//tsu9OUQ+0YxC5qFWQtR8fkk06tGsZKRoTbpCvQcU/Ve5Kw3ALuyWZNuGAO6qld97Fou
wmUWb20GQAldtMZhhAtMgKgiJMKwjbAkaUXQDR1KGUY3KxKtN1PsxuiCD8h2bUdjDMgsoHQ/xOmB
iy5gtOr+NkK3DOtYNVLP1Vj2Mnk8DDtkfZkf5FqgmJ6zMMUX+ywZkP1phsSXZk3nR1Pr3cbTWZ8C
ZZMe6+SQYPfIc0Jg44Qs1SnZRCWmVjmDYX7dF1jh+6o9R9Gqoil/OBVlsev4qzoBwiFPeZgtCCwG
Gbh8HsuiKvp/Bu4cHqTZawfH6ZOie1CVh1yxajLrgV640ZRihjWTxrOrUYUmV6PqQW8ZETSMvrMY
c12/vr79dff16fv36+c7po1BLHLYl9HGHgSAMXBrD7krOJkp0tCxIeFWVSLn6Y/RVq8e/XCXd91j
W4BpiIZKNh06eTgQ3QqEY9zcw6gAYuahwGVLItcdtNQW4w41teyihbuVwbzg17paWrk2PMd9D/84
8vWxPBBk//8K3OkaDEaGuxpbiY7lRS+NFt6D0ZinlzOmDuLwrJbXPmtTS4BQPlh3cUgivWWrFuJR
mIlxuwj7QKsG3MhbgLhGnb9gKJ0QOyZzEK6zpI7TPh2wG3E+gFPZ6SsnZeb8oceLJMg8umg1u5O9
jKTYFxbDBo7XLQR9Qa0YOQNWfLriMS8DK+k+whJsx21GAQvoxqHWDD3ZKA8FOdG4smdkU7RmZGln
UMhDHAQa7ZJmW3+jp6u9815oI9np5MlsQK35UGK2MHw9g1gWsqEgn1hZ73uTD69ZorAu0LOtHqNe
//z+9O2zIhfzrLI2COJYy0pQ1QChAqn1tfRwGZWbemkjccxZCHTPOqWZFa6vN7agIsVhSKSPhTbd
x0FkNnnfFqkXu9iePw2srSizdOWutR/fGPfZervussgJ1PuZie7GqGHGAqOf0Wq61eVs+zBLto7s
znkh6uMZzEY00q9J/Wns+1Ijl62/3fgGMY6CUE9UF83mvobrSnQQ0JMFrojiPWi/xOTLSunFYB9i
7cnUD+ItMgKKigoFWYKaAokxQmjJzDUHyJ6rTxRGjkN9wDLy1vXM/B+qIcb9wHH8Um4cf6VhLlWs
+WLW0UAZwMhAFRbXxY2FQTd45uOwV67PeW8Kq0WDZla/Kql4gD9ZFhN3FSzoGkj/cDGl4MSScx5Z
cSP2TipLuMriibQBaxuwbTLaRi0LbuI0p4ykwJI4v7x9/Hj6okvSSrsfDnQXThQjVt52TXp/auXy
o6lN31ykrru48PxwEurdX/77RRhFVU/vH0oRKCe3/6H/9J3swHNBMuJtZK+HKhJ7GEKFK3kwyJ+4
F/xGceGxiP4LAzkotl9IBeWKky9P/3VV6yxsu465LBPPdFLllVZ6DkB9HWwtVzli+8cxePvJdonF
cEhhdjHVh5pciJQeAM/HgViOC6B84Ts2wLXWxse1sSoPZkAgcwTOgOesGFCrgGupXe5sbIgbISNG
jIxZDwCPV3lQT0m3sBAX+6ZFuyChcGCEMyamYdDYtHOlDAuH3dNDWlyJIvPjk0VngT/7RLUBlXn0
Qx/KBF5baCqWUGgyZ0UqW07cooj/uJEKeysjvynGS9Wn3jawxFOXy9SHPq51lZggdFEpVmM0FdGO
N5LRjgsyhL0hlfGVE5TJ9vPjpOOW5Ei5u5zFFq6U9+YieRRTipF6kSwh1PB0de0zcmrb8hGnms6e
FdTu8rUFR3vAigkKQgmSZOm4S/oeQpwviwQTr0ZYkE+tQWZJqlSwORTUOXewEbZmL7Ic47it4lC1
BASjVHDnCMcvXKUwfZ2kfbzdBIo6YMLSi+e4+JXAxAKrJnrfJzPI661Cdy10z6SX+aEZ87NvImRH
sKpTMlKsKeAhkaP8TSntHjw1YLMGqDadOnjMHrBGnOCsH090NNEu1R2KmI3KjmArjUqPPW7kbJBm
FQjSgAyZ5FYNE4cFOHxhqrWpSaWRpiH0nEzHmY/0TjcELtY9BWmhoCu50QLHW8c3MxOlxVKFMyV6
QzUx6HrJJTM2Lla+LHs/lEN9LfR044ZeaSLQ4psgirD8eJzTRjCFAX6Sk1Iyjrk6S+uF8u35ROfW
cZV80TNBdGRu3ABdNxiEmmzJHF4Q4alG8h2KBARugAweAGL5HCAD29gChAOSFK2ov0EbXBy7sbEx
DdVDcjrkfNPfuNg0OTRlti8I5ux6Hu594PjImO16usgG6DpF9zmLl+r9KS9FqfhuuNIfp5S4jhyo
ZG6rbLvdBop5TVcHfejGN3cWeHs1JoHqAEQJp8d+0jOsotDlRPGORQsYwo5P9dMHPWKax1aS16Tp
CN21oo0rh1CW6TFGr1xHfqmoAoENCG3A1gL4ljxcdZJL0NZDreYWjj4a5NsVGdjYARfPjkIh7iRJ
4ohsqUZYQx17tBRg5YyRU/XJ6AwMxbgHt14NiyeJlr6j61SKP/uZk1dt8Gd6P7RIpjvw83vurQAE
GusqYuIZ4bpGg+zyyhll5xv2iO+eChPSxEVwDx69sHRJm9D9cyXNfeTSk/feTBSA2NsfMCTwowCp
9aEM3JhUKOA5KEBFvwQrNwXwU9PMwC4XUbd6E8uxOIauusvPLbarEtQHpcTQKhHvJzpcNKor2Az1
cWRSf01lUWqi0nWzcz1siLBY5YccASarBARiG06AVZRD0ai9Ecf50O1a5UDqwsSXAB3VAHnoDYPC
4VlS9TbIYGdAiPYqh/CdcOIBacnDbXtkltAJ14rNWFxkkWdAiOwwAGyR8UHpvhv5yEigSIguhQzw
t1gLMGiztoAzjsCWnb2EW+yTtPUdfD2ryqHLDzcmaJ+GqlgxAy3x/Bg9dc4Z5PXec8FjmmU6Vl0U
KGbL8yipQpQa4VR8WlURJgdKMDIEyirGJnwVoxnHlozj9cFbVlv8ykZiWBsfFEaLsw08H+0rBm3W
uopzIFO5TePID5E2AWDjIWOx7lOuGi+Icisx42lPZ5+PlROgKFqb1JQjih0P/dj6pmnmIImPredN
mo6t9pZTwrC67+NAeTlSKU69Zj6cDMKkF4ZYJRgU4dqYWbCBUAh71Lv1xNEmY0dCB12B96QdfZun
ynlnHdP9vsV0K7Og05Kt5yQ7s3pFTdoTPfu3pCVYAYrODzyLaY3EEzre2oilHODuHcm+a0mwcZBF
uSBlGLs+KsWXlRc4IXZTqGyu6JrBAVz3KzH5+EW+vPsEvoMv1Xy7wxQp6q6GVZsinhPhQhbHgpv7
Md1d4huF9zebDb5nxWGM7batF1voW+yQ0hbVRnvCusyzMAo3PXbKnVmGnEoDSPkegg351XXiBBFw
SN9mWYoLMnT/2zgb9NmLxBL4YYRKAac004OkIhwePoWHrM3d1aw/laESM2luhksFGz6WqGwBaajK
9YYR9hTocWbXW+6CZg563FwbTBTHZCpK9v9EyRucnGKJcJdnyLmvyqmMh+xneZW6G0xIoYDnWoAQ
lOpo61Qk3UTV2so2sWzRbY6jO81m3Bi4PYkCrPpVFYao1EKPta4XZ7GL3bguTCTi9kY6QKsc42Jm
USeegxn/ywwDdo6r6XaNDYQ+jZB1vz9WKSY091WrxPZV6EjvMTpSRUrf4H0KyOpeRRkCF8nqXCRh
HCYI0Luei9T83IMjf6wMl9iPIh8zx5Q5YhedsgBtXcw6SuHwEK0MA5CqMToyzTgd1iCwmUfxkm41
PSI2cSisEXUHhUIvOiIqEo7kKMRu6dD2MJ6SL5d1INkmuHPPFe/WBEKFNIQUO9nJB5GNP4GFqH6E
2FdpAZEi8K8nVEslKxr9m6WOEgO+SlMG9jVBo9MAzOOlQOYs5K0tG5XNmplgs1gi7NIqQXMAwFA6
M1+ov/349vzx8vrNGuym2mdmCF9KEx7xySOpDpgwwXiWq1SJyp3XH1q6ihqJEj9ysdVhAjWTEObP
CAxqLS9v2WdJ78WRYw1SDCzg6vJENJsNjlT0BLEv8yFtMP3awnMsU7M+EElv66AHLQZPpqdGtkPr
OYNVy8X6RDjsynLMcBU4ZsNR5TtOXU8aHv2gUseM+oGeLiPH+Glsxi1n+QW3BJlmvV+kliepMApA
l+yjTjomVDbhhQSFilo5yc50o3pARW8SZtBHPnHRG0oGKqbCQAED93sqq6iHD4bwl8nMJ4e1fQ5J
n1+a7p6MB2LvWiqf+eLe3jZqtGtTRhto7h2frwrZC8aeIPP4WIR0l7f5KREcQTBMDkoEQMXQsWUd
rdJoaTUBGmJkFCl27wiI4gkYcuNBG1vZFyEjP5DQG1QaM9hOq0aLSA/QfV5pdtEKzIwBHPsI57ht
WpmmBHy2zjfmKnWy/jaoAUqNQ3MdAPoWn1IzQ2x5Bi4Y4q2Dq+9m3LOvCAzXn3MaOCZiM7QPFV3b
RNvqbTUpVlXyYmWs0ut+yI3h3OX9yVIMyc5jWZAETb/+Mhks+zhLuIoVyxugMdOFrq308q05BWLl
nw20ZWK/ieXrW04Tl/Vq9dOgD2LMnI+h97F8BGAkfp2ubft5qkVCYNRiE4UDCtDJlvNpqi/R0pFa
plaBeuaYiXZnV4zl/jGmkwxb3JPdEDgOKv8QelCxyRPCf2snR7ZgdGbpp6fUF/RI6Pt0NexJit+Y
Apv+ZITT4iiOkQTLyjpg2fOPJRkwA3Ed2QqFP9OQ9T+cEmkDSHrOoWbP6Ojl2wx7boSVmlYH3cQl
XHkgI6UXI1T+esQs3BZ9pyTBHpIYpYqRqCdIF300dsxkRIYNnwlLTpllaFKO0Nmsyq2X0vUiH5k8
ZeUHvjZWlvc5Gn1+zyMT2WMabclUX/CxfKRLXFVa64pPTb0uZtKT4wbV6gnQ11csYSpqLAfz0xyD
hnUYRbaopy8+qy+b2DVGTdccK/6AzCrLTyziaRr6sQWhh4ChOu2RFcb36JhnMYys5QUexkG0taaH
DcHVidVeb9T5DaZ28Em90DyCyNLQMckSuDQ9qQnONlJjrvUT276YjMSXLDkmh+0cOn0vXxjopNmW
2QB4mPZzU/aKDcLCAHGXTknJQoidKtXWeOGCwGmkpRWb+ZA2WdipKHdQHq4pEEh5EYbBaTlWFY4q
CEfp1YyTLPC3MZp2Tf9pUURzJLsg4j2lFfLQnOQzLQ6KsW6A4kSLdrB2ftMQtIzzoQxDXFlXqiCe
vPFpiIv3zT6pAz8IMMleY4pjNHFhg2vQ+SEJQwpS0oOiZazA3Z0XuetjBbG/kUAqa0RoCzHEw/Nl
tsbY+qiyBJZii9395veqwCNhfCdb/57yhFGI1cw8aqlYENs+M17i6iiqBVCY4nCztaQeh6E98ThG
XTeqPFt8vWFQYOnL6dh4K3F2hrS2i2Z+oKPejeTT1qVth877qg02Lt4hbRwHeGNSBF+Wq/Yh2lr7
kJ4qUaWkxoKuQvwllA0J0CWUIVt7YUJcx6AyxTfGnHZUXhD9gCAhu8ICpAndm9ClzXwHIWH7eHDw
r/anT7nrWDqkPdN1FH1jo/Hgqy2DtigkHbCt2NEKqs74NRDCKZ+5iQtSJflCuW9O6ZGkXZ7XVAyD
kBCrNdXO3xKgn8IliAqeKL3fxA667s/aAqzwTGuwXkhakhBtcoooxlQyUp099BviVW3iWEoDILkx
X0lQxVGIDn/++gBFykNAxyReIiaH75qGKMFpdYZzl+93uPTDGdqL5WtNmJchdmIZz1WFik7kMXYd
+d5UgWJPFf01MMIMGxYeMNpwQ9+yxk+ahVtJhJ5v2+G4KgF9SaozRejCjukoNNT18UsHjQ1/KWMw
WWSTSR3xMzlR4XQ9p/m1l3lQWVzyIKmf4Rr5RgnOD3QcjUX7sHFc3E/owmt1mKGyBJbOZctimeyK
HeaVKzXUhUCpm77YKz6HgNoWtUEY6WoKsnD9q3QIzSG4HzDAM1ctTA/L8Bj5qK0QA/XzCRCFB74G
o4L7PgMy3ttBabgfW7os4SGuGE+PPQThSKVOQSDanD+xD/K00RtlaRCMTA/SpbKwTegu684sRCbJ
yzyFzxfPodNR/uOv72rwb9ENScUukHkOuJaIMdKza9kcxv6M8SqcEDGvp6f5hVVRazCeLslYAPVb
uZKsu5nf5OzNnht7r4xmJvutVFtqyuNcZHkzKp4IRcs17M2QEs08O++m6SLcoXy+vm7Kl28//rx7
/Q6aFelOn6d83pSSaL3QVAWbRIfuzml3t4UOJ9lZV8JwgCtgqqJmMk59yCX5kaX5a5sfRKhVDany
yoMH7rwB5nZl2L5MyHEsadIsaDDSQZztUivP4hkxIY+1Xj+6J8PjdYSaVby9i4OsssJaVxr4UpTV
pe314T93IvTdythAEmOpZS+/v3w8fbnrz2YHw2iouAvKOVug1agfCMadDLQXk7YHRaIbqp9lj3UC
1+isH7HWZkwsGC9dW8BnxVg2ED+iOagj9FTmkuMBUU2kIvIiMhuk8FqLkKi/vXz5uL5dP989vdOC
fLk+f8DfH3f/a8+Au6/yx//LbH4Qx28vAuAXyb4ITIPE0zaqhY5MMUan47qRY0otiDLezPSqpCwb
ZPTyD8lBGevL+sTNhpSzB5+fabLPIeoirqXnPFXVisV6hcnuqlMsY9wp53huCzqpCtIq3roRnpSO
xZPRqrSa4WYT0iKrRgcT6AcBw+zlqPwwGAtS7O2573JbCSHKJu2F5tRTUX6/s8PGAqk91ORUuoZR
ZmOtLQySEttnycs3m4CR+RyztgELQfOnniAPwEklEX1cgot7AMwm42eWLK0KsyAiDgwVOLCbSMEj
Qnwx3wdG4kIo4tYvm7EwyrUgEFddeTUlkghaugNVxm4GdBZwLyW2VNl3Y1n0xgiccmUMBTKnlmK1
fDrzkWxthaTa+BE9wLV7Iy89LKZMhcJ73UCQEgiGvrWPAcFy7pFpBO5RWeor853x0AljrxWziiuI
0fgcGDiipTp9hIm6ouuY8WBKDBGE37mnBBmKPaUnWDA9WCNnMWNeItUS0R360NHV4WzM6bTJEp0G
EYzPWYPSW9lV8kyOmQhkTHjYfvr8fh08t+ZKMWFVZuS2fEeLnhsdo8F46pNMBhZVXZmkxpAVR5/c
M1e75ZQzHtZhUWutH2WOar+6ZQ3emIMA1GGOYLH1BazmzOWtGHewE2DA8Wx0siDz1XdvLqMUzvKy
T5CaTdBYQdXtC6ZYVPeZuV5O2K9mt82fpUZVJuiMrMDz8twdkDL3sFXaVzW2nZzz+mS2w6mOC20I
6e3BWLqmp+MR7WYQJnXpxjRwrtJ/gPn2HQjYIhKwIomTijD7bprC2fh6//J2vYDrur8VeZ7fuf52
8/e7BEkFyrIvujzrz2tHPNl3MCc9fXt++fLl6e0vXchNfnx+eaWHwudX8G/5n3ff316fr+/vr1Tu
faJpfn35UzHRFv1xZrYkemv3WRJtVP3ADGxj1BeHwPMk3LiBMSsYXdbLiilHWn/jGOSU+L6snp6o
gS8rfRdq6XvGvOrLs+85SZF6viFynbLE9TdI9S5VjD+PXWB/q6d2br2IVK2x49Il7XHc9fuRY3PX
/lxH8QB6GZkZ5dEzLUZJGMQxOn6UL5fD/Upq9DgObjDsezPDfb2WQN7ERuWBHMruHhUyaJQwKMY6
RQDwzcrqvYOAIdbCUzQI9RwpUX0kzMn3xMHjs4gxW8YhrUQYIStQkkQuaiYm40ZbsSvoaGM07UTH
Wqs/t4GrquElAL07nvFI8XAkyBcvdjZIcpft1sHNeSUG7Ep2gV3HTPfcDr6HRhcSrZwMW4+p4KXB
C9PjSZk9+nrGWjgyWjgdvCDeKI6Ytekg5XL9tpK2/CBfIsfGusSmS4TUnAP2RQZw3xwMjLxFyYFq
Y6IA+qzReLZ+vDWWx+Q+jpFReiSx5yBtOLeX1IYvX+mq9l/Xr9dvH3fPf7x8Nxrz1GbhxvFdY93m
gHBfoORjprnse//gLM+vlIeupWAThmYLS2YUeEdiLMjWFFgmJOvuPn58u77Nyc5f6xDfq1/en690
m/52ff3xfvfH9ct36VO9WSPfMfq1Crxoi4we3LRuEgjZATUT9hOTJGEvCq9aW+gFXOqmY6pOuT/V
TAPLN5Mf7x+vX1/+vyvo5FiDyA/CFn5hpL1UWMaofOHGnmKXqaKxt10DFXNjI13ZOklDt7HsuEgB
8ySIQtuXDLR8WfWeowY+0VHUHsFg8q3JcycXOOb6ljI/9K5iqC1jQ+o5isGpggXKRbaKbaxYNZT0
Q9lXlolGxiWSQNPNhsSOb23EZPDc0PJcxOh/F49sKzPuU8exhMcz2NCXXTqTpfNEgTxbxfIN7rxA
TZ/uao61aeKYuShx1nTVojCnZOtYYuKpM9fTYjeibEW/dX381lpm6+h2Yr8mm0eH77jd3lbJh8rN
XNrMqLsng3FHW2Mjr43YmiUvZu9Xdgzcv71++6CfzGctZn38/kHlkae3z3d/e3/6oCvsy8f173e/
SazSUY/0OyfeSkcHQVSdSHDi2dk6fyJE1+QMqbRpsoZKnAh2UUMnmboSMWocZ8R3VfEOq9/z07++
XO/+7zt6iKV748fby9MXtabqxU833CO9AdC0DKdelmnFLmAea6Wu43ij2o0uZLPQFPuF/ExnUGlw
4+qtyYiy0R3LqvddI/9PJe00HxN5F1Tv6eDoKsffqVM92UHLNCYc1YZt5t1i5xtpJGAfbS1vC0Vv
xE6MC/dTbzmOJTzKlICHeigD9JwTd9j6eqmmNSJznbWyMS7eU5glz5L9oDYgXctC12xAnpKt0zga
YSNC7zQ6Tgc9S0I3TSNHOrXwJZwNrF0cJrIp6tLeTEiZB3R/97efm3WkpRIMZlcjquJF+krDiR4y
Un1jzNM5jb9hBbAMN1GM7x5LtTa2stVDHzp62ejEC9CJ5wf28ZoVO2jyCrMMkvFUzYuSIyAbdeZ0
TBks4C0yU0VtsReoACf7LZcJlI/y1LUOFZjFfmiMzcyj26duywHUjauacgHQ9aUX+7YcOKoPBFiQ
tcXpU+bS3Rgu7ZtMHqSp2CKsKy4sBbE+lXhLqT5tJLpt1vOlMJryT3pCs69f3z7+uEu+Xt9enp++
/eP+9e369O2uX2bOP1K2h2X92VpIOhDp+Vab200XuNobjoms2QBK6C6t/EDfYMpD1vu+nr6gBig1
TPR8ywPtFetIgbnraFtPcooDz8NoI20MlH7elHq+LGmLXCwEjFD1w8DD3ZHsf7KEbS1O68R0i9c2
DLaieo6p0GdlUOWC/+t2weTxmMI7IlwM2ahyrmJjI6V99/rty19CwPxHW5Z6zSnJtsexfZBWnm4M
5lqzgOrLWX6wz9PJDkjYir3f/fb6xuUktYp0efe3w+Ov2iisd0dPH5lA2xq01pzGjGqbIfDaaKOP
ekb0XIyoyWWgBjAW0fJA4kOJKdZm1JSBk35HxWDr0kjXojAM/tS/KgYvcALMh4qQqzsqEph7Ayz+
qM07gMemOxE/0SpK0qb3cj2hY17mdW70ePr69evrt7uCjuK3356er3d/y+vA8Tz377JBGBIxeNo8
nC1uvssFDO1qXz1DmUcl9SrLvLdiBTi8PX3/4+X5/e79x/fvdBGX1GOHZEw6WTnJCczq7NCemMWZ
gJjhKnOqpD7Dlensuu2SoDMNbtqL9nT2jWfXWVcZzZxQmphQsrJMJvPLwLenr9e7f/347Tfa6pn0
gUh7jwkqYDglro+XE6+gSfZ/aFegGbIcd0/P//7y8vsfH3TtK9Nssh1dGn3Oi6LcPhJsKAvUOAui
8ZTF4dgrjEtHLfh9n3mBMlEXjD83X01ef8G5IOyi+FLK1lELqDupWBD9gfiCJBm883KskLr4LuDk
gWW1HlhcF6kZQvm4KH2V1FkjB/FcIMkdgoHptuJSVufAc6ISNxdf2HYZPUDhWh6pUbp0SGvMkkfK
L89kZcuNMTh9f8wqJXqgsUJIV/HNqcac6oGdZnNMCzDF6st8zOusSCRDL8mOUyXOFmFzFkAFk+G+
KzALC4BPZVuMih9inlRda290gUzb7TgeEzIe00xB9EwhGCaeX1LXtN5pPtb5Rcw9MknDqrIfwl4a
Zr6QRJbvk1NJh1jekYL0et57mnBRFxBMjdY7x/1HsXRu2fiynugPegaUNLZdk53SviwIpgScuOiy
l+ygC4c+7+qkHI8no6mAb08wT2ui9wjrPhbfhezMXmdPEU6kpcMEDGqSx396MlwtoTqhQY+v7x90
p52300x3fsd6P4wGxzE6eRxgVHKqUgVGB8NhYVpjqQtnM6LFLykXPHKhTq/6e4x6zncntCRgqGft
dBEg0VLEfKmhTu0g5hztv7HvEbTvYUCT9JgbrcPwPcF2bjnLyUM5kjigTVc0tQWjnS8/alcxOSy5
goALQLSsxkMak4XgkXVnnFuYrdW4Out5pzVhjtoAvtVW0ihSJ9Nw8lzn2AKTJQ0wvHXDwexlAPzQ
wwb4nk5Smq6eqpq1KJttnaUHbjNPUsauu0KmhdKW4C4GmX4bYcVk/U1sYxtQ9jhHBE5UPp2M4ujf
R/MUCisHl8ju0i9P7++YFM6W/Y5ZuFkKcMm0Wd8zZRYPB9X0+f++Y3XvqdhwyOkG+x0kcXr4vCMp
Kahg+HG3K+9hzxhJdvf16a/pPuPpy/vr3b+ud9+u18/Xz/8vzfaqpHS8fvnOzo5fX9+udy/ffnvV
yz1xYvUuvj79/vLtd0lmllfXLI3VkxKjFmlH64PdI1C4aLXHE5x2xpaehT7Cyk/+GSNg3VGcHihU
SHX8KthP6hsCTrWZzrNJmdXEIm0AYmTCyL4xtYE4HpLsgL7GWVgs6Y36Isap9OBjNH1/wqRyBrFJ
kHV6Cwigse7kDOeFRz/NwJ0OPdiY46f98vRBB97Xu8OXH9e78umv65s2ftj3WiSEGTiBKzbrgsNY
fv20iTam9qRiM7ZK6JD/fJUMGdgkLZqxqeUoqawQF9kF5URh4qFeNgZYHQTPHKvdzTjmhptWAbW9
uGxyR8xj3pwCvP1Yy4HvQ0i9pDi5OrS8ZEUr3uyFDchavqZUysgPuEvdGQfj+Ko1yuQhiXlGD3CN
xNPn368f/8h+PH35hYp4VzYA7t6u/+fHy9uVy9ScZTqQ3H2wtfP6DTTMn5FG9kDOLtpj3qEPCmYu
uTMNTH0oOdPP4JCSYF/0HT2I0YWUEHp8Ic3emCBLuqx8TVZgpkVsrTiCWVGeaCuIoI7mkrhgK4vC
zFORypIyX54wREQNtqBM/tLLxGKlhuZMhx5l/Wi4sWYrCCERu7mYedUzFvpRXhWhMeQoEfVdw44g
2ak/aXUl+ZnkWp9D/N5ejXrMyKYkkz62XU4I/TdKQ9uCnj4yd+uaFJdVzUkfUvs+ozJpqZ+ik5ZO
Y+PdG6OO1R6iFZKeh9DUy0fPnfSf8wF7b86qpAl0dDjTM++52HV6BBhW5uaSdHQM2wQnkNp0IR7C
YzNpbl8M6qtBPlpAh7G/qNRHymfsmPkn1kID/vSJbY0nGEg7L3AHq2xJ6Dma/uEHjraLTMhGsadm
bVTU9yNteWaIZi6YtOEbQpdpTElDz3Bc3ixq/uRX7tReGxHsHSLzMKPNtyFJO+MEecqTQ5nTRGyH
WPofnsU8pdo//np/eX76wjd4fE61x0c5p7ppeWppXpytDc8iJIIHnZWjjC87r2FiwUBEbsoIAlWy
QRa7u0YZz0V+UQU+EDMiZ66FUG6tVF5OExedOHVV+JRZxr22jQsQmmfMuuSiqj0EKgT7sT5V4+60
38NzN0/quevby/c/rm+0+ItORO24sk19Tz+VT+fBU6at4YcO20+mM5u1o6XTF24gwIYQvGHFDdNY
v58h61XYtx1OSY2cSRiVJskO24Z8ChXC7scA3NGPjKap897zIg8lwqNRtHfn16BK5vxpMT38nGzr
UXaqqsf5iCwPV7TH1WVpR6W0tiHKQ1jW6yM88Nc0VKcxh11I56zTSiflJqk9UhG0Nxhzg5GcdsRk
7OqsIDqxgksNMe51TJ9D+/F0To1C8UO8oRCmf+rfT1SzujNi1FpG0HrNDEj1lo/1NpqRuU3V3WSC
5eaxTpaZe0/7e0S9bWhspoAqgcfCNvEkJqMnJGzpknnpElL897crGP2/vl8/wy3pby+//3h7QnTm
n/JOUyQBZTzWLbb30iFt35Sgs1cXbGOUnWrmIcNOhwytGDbKFxQVpbU5oJUf0VJpHPYOO4yXfJcm
huKRbkDIgVdZem732JRR/9jKb6bYz7FPVS/4MxXVlnJ0DxuKbCTHySftzTj8HtP0gLaIyIe56Yqx
m0LOcMx8QnwlIDIHSE8L4SphHjggfCMXqTys+7++X39JuQnv9y/XP69v/8iu0q878t8vH89/YHe/
PFXwyNIWPqt4oPs5k3rjf5qRXsIEfK58e/q43lVwwjaEPl6arIWoQbrClWP1uWC+njh+q6CW/BTV
MD18j+RS9EosENlgsL10JH+Ad+ImkWRxJL8imcj6e5cqHXdlk94jJHGTtigpAdHXF6Cl3WPbN8ZZ
lr9e5g+Yb15UQTqaXgFISVfRfwo9R+63g2T0b9RsgXJkR+SzTFxt4e8BFo6y36PBkmYO4qd44uzy
5kby4I4kq/A7GeASKivUUfsMVwNLTS+FBOKROYCnGRLFUxqlgeptPBI9uaRMG3t1qsHW/H2xp+JA
puYhHNSoRN6SKmE8Xviz9qJ7MJrZB+94tqqJplVT7Kui0WMMCLKWdXbUS0cpEPUCEtXLCRDbeuAq
2MQlV4byXNlFynsnSjozZ23KJGactLXoOac/nuos7watKS/6bz5oDequPOX7Ii/1rrgsylSleSlw
LPxoG6dnD3/0w5nufeRLfPMS4OSMQWvFI/xT7PXUziewj7akdiJHvbGhN0K6ZGpt2+UQ5u0eSqbl
e6oHjZQ+HHWuI3nQxkxDjsUuEekpJd6llRf7ludfMFl67AaJzb2LYuNa5RXpixTjBisLsCFYCsUs
CpjpE0bjfuZQpDqVNJOmVPVXjGHXgbqpBo0dnYjpEdzeZcbyTlmxi0OWwoolEsOTpHc99Ukpp9dU
vgm2mB6O4x0dylp1EuKHSog+ToWYrL5ZtbQKfQ8ziF/gIDY+609dVxC6SNYFvmwzLmZFho3ZBfWM
pE3TMwMP0RdlM7qVI4DNVEe1PmR07svbnhddPb0NGiCED5xmR2fT+HDa5UbSAuuSB3vylmBRvMgQ
HGij14MSA6TJ2kALSWjgwTAIAyp7hsIRv0ZUDO8YEZyD8ygGajaCvlot4Al9vX9EHBjSJ/1Jn7d6
LBhGnI0P1RLMrmjtbbHLvNjBlcG8xr0fWGKoMbwm1rFHz+XDTnbzx6dKmoAzY51apsFWeazEB6QR
8W2eE8GfGrHpPUdnlGOjqeUGa8/QEo2RMRTEd/el726tw11wcHWhtuQxA4R/fXn59u+/uX9ngn13
2DGcJvbj22c4cXy/PoO5PZw+xTp59zf6g+7oRX2o/m4smjtQoWNiJ5+bRugtPsAgIp91PavKocv1
HoJgMHr3sIBbiMnhsshgTkj4t0b8Ld56rW+u7+RQ+S7qsocv2lPkHX08HGYN/f7L0/sfzPlG//pG
D3TqLqRMjn4TqAFGBDkO1NCgc9f2by+//24mJOz19Ik6mfGx2EUWrKGb6LHpjUJM+JEeFvpdnmDX
kgrjbMhqTSptT/bBPjElaV+ci/7xNqc14JzCNdluqsssa9CX7x9wB/1+98FbdZkY9fWDOz8VCpO7
v0Hjfzy9/X79+Dve9uzGjRR53Vsamrv3tDZOm9TohbLCRNczxVexlkIPkr4F1RxXJWmaQwzjoqRt
PY1cuh48/fvHd6j0O1zlv3+/Xp//UDxc4BxTqgX9b02Fz1qS5Rcam9YQHNcO8mKtfJwrKikJpkfK
LK/grzY50NULaUqJO8ky0WNoXguM6KElPghtpR7mJLDqj+kKousSJDwdDrsNitDBLEn75bC51eRN
2vHyYW12ri4JxMs+d9pZX7ACeewGOaoXc4FbXNC8irYpdpasGDaqelw7n+2OTmIkXYsXQtk6JKDr
O7wTAaAnDnXq6jhN9SwnnGdJapqpAVVuAMZV5ockfYTdcY+bhjMuo8oqTM/vqCKJgdIBXP+qz1EX
9QwdQJWtVQl0pBoJOZ/zEldpoMQO6cGZ604lTOe+uVxAPKb0kPqIXXIASsBQSj49S8Tp8cx/vH08
O/+hpmobNIDVZ75ycDdxPW3J6dGXcjIE1qLu9yudNbNoQcHVonRnpoY0thzwRwTZG/LA9JUZonhC
kt0u+JQTH0Py5tMWow8xlpKwSEc+0OPUCXpGXN+J9F5ckDGlc+fUoTF0JMZogyYdarHOBHJ8rOIg
xOX+iYefkFaypdJ7uHUcM18zZtcCGLGcJ4yFAVrJrSNB6kdIAxakdD0lgpACeGgDCAyN3yVYBsoQ
mKm26T4OPGSkMEALo65gPmr7pLCEtnRjBKg2bh9jzc/o4yXrkeGpB/icgQffuzfJZqyWqVR6lK3p
AyRu7dyFKQR0QgPcCQ7iB/7WScxk9/TggBWjo7PQxelB7OL8XoAVLq98B3W1OH969h2s5YDuo4Os
g0Bda31Oggr7jmR03sfG+gYe0KzrG138RrZ1MxugmR9OSua6iCw1voe6EJAGoccdDiK1pO2yTde+
7gbhE0a1C15drOni5eErBUUCPD6WxBAgEwbWwzgY90lVlI+WlCnDesphvLV8Gnkxrv6VeTY/wRPf
KkO0QcdbRryNg0UGnhn0MKQyHVnr5hCk5mzZY6r+eQD3927UJ8hkqTZxj/cqIP5avYEhQNu+IlXo
bSxRsOb1bWNThM2jtA1SZ21cwUBH1hr9Ja9M12JHTe2TepFFgzmz6BeJ5oTU4xIK5NNj/SCbnU/0
JfyTkVndD6prTjZPX7/9AlqFG0tHQqqthwcznEeRdu83A8VhvoLQ9+dqyJAv9qQc931FZe+kQ5dO
dv+5NojY/ei561Mz8UaxPj0m55zdJ3Y92mYUWsknb7f+gIyJc7dxMXpb4rssJSO7GDz262izY8IX
YCSpEJHVMK6ZC9XHgYMPVAhKsD5O4SJtrcHPWLq095Is8VELlHm88ogs2Of7nv7luJYwovMiVGGv
SSaYv7UxG6Ns2SUIlq2wHl2blVU8YN1rPAKYmwe9QpfQ8Ywu9aQ+24547EPtin+m917kIhuAEU11
pkchLkCz8+3alh8ptsxSp1hkpT5zNWU8stSApaixToGGnVy/vb++rUsUh6bM9gW7D52Tzug45M/W
jWQptDvtsQBYEIALIspZTA7FhxjGIdo9dG1hoQCxY51g0lRYgkrycg+nX2IgxzxpLVR2whfavSlo
lVq7pYjJaRCPKNAatEmd4zEYTxaN8XlvA5iCz4x9IMFqOAD4zV6mK5oQQa/y+oQxy70tJ8EUR9Zs
x3PWJmZylWyoKog7CGmlxu7hBapU5xcSeUyrrCzqfETG3sSt5k9/gfGWSRk189iZzmy4MDXfPj3L
gZBaPSt4JjUWTS/bRnNiV9QHjaaziF5YisOoeNg2jp0JNz/TPoFC4aOGwSDMEOFMA+lL4YDi+e31
/fW3j7vjX9+vb7+c737/cX3/UKwNZ8fU66xTkQ9d/qi41xCEMSfSqpo24O5VrhOnWLVoM8yvU9g8
Lz7l4/3un56ziVfYqmSQOR0jy6og6cokE1wFSUYjgJDA2rSMVK9zEuBhxw0ZD9H01LvBBYhRR8Yy
jqYXq2FrZ6DyVwuYVG1JG6doqCAFTYCkwVmoSOCHwIGOSJ019HVWlZEuA7EsuclkYxRR6TlFqfQk
WmG9QhEnvlVW9vnKQEwIVkL4ykIPN46HFab3YvRIJeGyg2CZvMHJgSUbNLyxhHsD9mFFxRH0+lUw
7MvANVs/oUs4/Z/rjdi4A7QoumZca+KCGaJ6zn1qpJ6GA5yMGgOo2pSec7EcswfXQ4MQc7ymLP2Y
eG5gdp7AGiRZBlWodYvG4YYZlnCZ7NrUMrPo7Ewwu/wFzhKk6Sld21cX4LRWVGbw9uAjX5IA1QPP
6RbWpTH2gkC1LZw7hP7nkvTpMZNDiMpoAgm7jo+MrgUOkNkmw8hyKMMhPlhmhhA9zBh83nopPW+1
lL7iuNiEAwdbxiSGwaIqmTlL6IPQQ68PVKZo8LFlQKB0d9n8RE5bF9U+Gkzo2pCB6qZwIzQ0j86E
NtyE+SuYuXbOWGhNc8yQNUfZIzVxGtkjcRNgZIdEZ43ACw9f5WbYx0/+0/rZ1H2eTjVa3eXoTonX
KestHrMn/LFmVsCuIx/3BXigItexzcwKVvtwwGpWpC1fn9YK+7Brki7zHGSy/drhDXqf079O6vu/
qZGYWze2cyMFmtHVduZM2Yqow1noSk6smVSrCVT5BqtwlUOD4FtWGHj421yZZW3hAwbllliiRzid
b3RYF9RsB8FmFkcqBOn6LECmPgkRabpSHrYuSdOjJt1BDYQ9pzWDKc+jfrsqgdcsgTBwTJGN0rMT
trZyAJwv2NPlPKQ4VJikcK7uY2etw+g2bC54sDcjibEte104vuf/lsWKRCUvi5g8LN9Ha8PE0lsY
uWtOvXLmFpCmAJKpYz4k6hsvBRWJ5krvk96w6pqxSWmGNcWxo0nP3tvkAs1XDSoBbilNYtdWcuDv
idx2TS8/0MnLMqmbAfE5yM1cx2PTt+VJcfAoEIsCqinppB0aPAIa0/+npXQnPlFoyfI26dQmrppa
5V5oywURVyJ+eX3+t2xHDM56u+tv17frt+fr3efr+8vv8oPfIlWf3EGKpI117ffkAvnnUleTO5Ls
3jYjpkpMthv4nJC4tptYn3gTarPxkFiORRgEA9qMRIvTrUCtZe+cOYrA37h4uhQKrJCr748StrEo
FySWSNd0TNiucmM0xKXEk2ZpHjkhWjTAtrJLdBljLr9HOVquhLJLtDIfSGtrTuAgCX7xI7Ed8qqo
b3KZWnukobyqJYaSaU5hKODfQ47d7AHDQ9MVD/ocKYnreHECDu0z1GGulINmrSchZZMe6+SQdCg6
W8FgxW6G2i5ATUznFLcHkOdU1XrcxHi9ErsscuMBnzv7YsizSSUtNVLCXt4TldhcaPerR8+JGqHU
rU7dJcV9Uo69q5F7d0zTE3QJDmTFWQPSyotcd8zOrd6/aw/uBD6Gvu3sKDGMBy1Ks8Zz39QJ2qgF
3aJSpFhj+nioUT8/E8Ox87DvaoLdWC4o+hHBn/+w9ZbOvV3edY+3VsdjQVfAMD37mjSj4FvLOAdQ
e7RnYQtD68FN5opuLIvSC1VLaUPFdUGXg3+tY0Ek8Zz0px3KLAFQXtvq3YDDQaSYcGWrygEwUMAT
YKV3HqPW1s7j7gPXYeW1HTeC/fb79dvL8x15TRGHcFTKy+uClvAgvfZBMP1yXMe8YGcHw5UP1e1Q
R9H9UGYaXOU0qEKxjybe03WFNhgqLaGthYwoycHknH5PT2RpoSctgezFlhgMuOTHwlH0139D/ksn
yUs/ldzp4oSLlXCZ7+ByC4foek8LYRnBgqWoDpq1+ArzOctT3Lbc5D0We565lSPvjzc4dll7g4Nu
izerePCzn6yiixuIKVxhFGLHBY0n2lpKDdDcL1YG3ivWanGeNv+JvmCsaXIrQ9Gzqyx5fYul2h/S
/WGN40Z/hRH60FDh0S1SDFAMrNtdyZj5OP1JZl78n2LGzJwVntj1beckAEOrEkvl+ukyMeafne6M
mXfnzzJXP58wso7YuCP8kYLGFWNW1iqPfleiQvLAtJ2kldVaWtAn37vstP31y+vvdEP5Lmyc3y3L
OlghdvlBsTg0GMAJryoR6xyVKknrcHtMCH6sEfjq1wT+XM//XID3/vIGV9LAj3SFI89vcaTtCZTu
towOw26HAsmAr0eUrj/blJOb/EUrY2G9oyWtE+mTjv439V2fddGtIax7klYEPbaaoBdOIOFzX5O6
aJlX+dmyl8FHnxJrehFEvnP09Lo4ifzEcjkm8Ah92L2g8hXiTPSxnKINusPOaORgSSUuRt2h1BSt
YbTJre0CcBSjX0XoUj+hW6ywaqyOhYzq3md0g6UUYMQQzTTE2mIboilEeAttcZXVDOO13QZ4Yonl
OAgMFAwPDvooZcKjg7PR2oQc6TjVy5Am8D7+oJoNzgg9JXgA45AvILVwAIITZfoLPKWRHHOmzqfa
wdN0HZN7WChRRUi3hvYtjtJlUHlEIetYhZ+lGwo3KhGeaqVixE/Dzew3xXKuIUF7Bl+5isZ7ToL7
lBp9L3DWkxGMG1RzLsBATQXJJ/BCWz4G68b9uSIFG89ZK1XSVeFmvVggShDWyimqIhBslKE59VoP
eDfLyZk8SxEYuvFvtQobAsW+ONv0XuDYrBxJk+7bQ6KOQQXyvRVQvVombZf9VLn0FwVLCoCAntBS
aO4Xe9dWrWVu9GDrYN2PKcPktM2SQXmoQNcgp859Go/nFHe/IWXO3+VgN00X0ha16oVxoenPUhZA
fU4uAdDSchllCOzv0ZLKTNZXH0eSV+Mp1gKZSLIwef3x9ow50AQvKWMjGR5zSts1u1wZQqRLNT21
UPTOnlbm0kzKWY4gLSteHuk+WuZ3RwZwGZN2t0blVZhLsO/7qnPolLWVoBhaWFO1FKc1WqczUTfU
qaBi1xPIEp1EO21j1JQSg4L2mkbmE0Uj8ldAZiuLSGZmFZdBzl/qjH2frnCJh2LWphJ9n+0gTg4d
GGmlTLS0bEnkumvlAGf5ttRrOrq73KzdpNmz92DNWqunoyUxOkyUuS2oxE87VLVL5Bhdc3zPutoB
B/dmaomFOc2IluDTNulEm2OaILpZ8SiPWrFV+pife9J3eVJZOZqmHC9Nd590EOZyYYOLwryjrXOi
7I4TB+rVL6jcSzrV6pnJDV2H/T9eWrq1Tpw0ra0cgBlKxAtD2thRdhYKnaOKPXLB/SYmfUV3pbZQ
dltOtMQ9Es0utuoqRY1XRPdxUWpsL5XaMPBQ0Rhv7FJw7Fr7SAV3o8L5CQH/mGmletzt7+2fwhar
LwFacr0+rVglfgX/qNBCWKrTKNBKMtOr/oS+/hbCakP6Cv2OFgUTj+Z+7gukpGC6lPQFGrFpmo6D
YkZ0jH1Y1/5/yq6tuXEdR/+V1DzNVO3ssSTbsR/mQZZkWx3JYkTZcZ8XVSbxdLuqE/cm6ZnT++uX
ICkJoED32ZfEAsD7DSTBD2W94Ne0jk3NtV2+8GgdkCD4bN4I10qj4zSCQ3UzZQQ+tFDS1Exo2cCb
Q7ZDJ6qtAjRd97OVvfTgySop8minoxOidninlyeVxny6Gh+EOKt8HzDOi1V1pGO23O5HBPOoscuD
qoKSBOssfGzYvlZEESnlHGT52SNWq2IES1X9oIYejRO0qFAUe8nQNam9W+frSr+7+Uc4691590u1
DTZMHxr+x5ebBmwUpQRvJWW8U/9QY5iLRScf5hpylIqt0hHgTVcjVRHX4EwcVO5x/WtQ9lgkAMeH
IeiNK3I5LhRoVCJNfKUCNliO1G7tmiVMJYJxedVElZTp/SgRrV6qze2GT0RPYm4YXRKIn1uhlY69
V38PGBBM02LsEMeQBlgp42Ht9Hp6Oz/daOaNePxy0rB1yE2dk0grNg14AXbjHThqyMa/YvfPOK/I
6VVN/lIARzU4qv5FsWic+lnaepRU75k5lrLZqpV/g6CEq7WRGgXCgG16cHViwxLYU/2wUt2oGwUG
jXaSGzo37nTXtk1NsmeXcifTmDoCjRNAPJQSlQgmMBpvR+mgyNKmXeW7VM2s5FS2F+u8SK8+Q72q
f109e/Q3HegQsXEdolYeOOtpGS0naqP8wNQfcLr65+wX1Kh16siMPTci+5zVF48exV0ggwx2erl8
nL6/XZ6YJ9pZWTWZa04zUNvEQQRDawcJ66xrB7FXupYTLRRRJry6Leo9ipBJ0fi5yAsAsaucOqpN
Vh27Cs26nx9mVzhxKgVHLzFe40AWMUt+SCgcnOaoJd+BQab8h2SnuqEqEb+K3UXg0ZStZMOtZ27r
2TmIaW/TD76/vH9hugC1AtafAD5euzRsrWYouhwbgM/1c4BwhSsd8EskIEvOeNEI9G/Uh1KT0qFx
BxunB7VSjw5O1Mp981f58/3j9HJTvd4kX8/f/wbYn0/nf6kZPB0jr8B5gCjbVM2j+W6MW9DdTMkL
g4VgL9Pi3QF3IUvVl22xJP4HO2cUoGDYLj8MpI7H54ZIZRmSGkdS9gmwdjpcmUxhjXEpW1brWAyM
vJV6jU7hEUPuqkqMOCKMuyDo+EKzruZynBm83VwGWkvLea/jPV+u61Gbrt4uj89Plxe+oN0BmaDe
OCEyjWiPbUI10cUotFJ9BFQfLLl3EDaOVhBUCTafxiX4Ufy2fjud3p8elR5yf3nL753CDNPSPk/U
1nu3yXc8wgZsrsGphA+jOBVxDAfkO1l5MDoghjoRJduMv8qqwTf+7/LIt4bZDCaH0NPhdR8A4z02
8VG8xqrvKKZ//OGrMHvIeF9u+HMxy98J3i8RE7mOPdNehG+K88fJZGn14/wNEJz7yYnz/5A3mR7L
UP9NXRWFe1hnU/3zsRswB2R8wUxrdq/hLvNKa4jZDbRWc3brOib2SkAFH1btQx0LRmXg7a0GJm1x
xB4M8TrACa44uqD3Px6/qRHkGepmRwfYF/f0lkMzQMEAEMB05V/vE8F3ErMYKq1JbSh8es9GrnJH
8SgKvOfTpFKpwEUVp3Qq0awqUeusV6tKARG9EOSltdFuytzDqcsG3ABiWBaripVbh+Qu8d3iDrK+
LEEY7achG0UmQldjk8R5tCH1i+ZY5aJrkt2q17iTsF0BT+SD9Ue/M0i2w9W1Sx/u4hnyhCVT/DrM
4E9we/585gnIQsVhfuAJuOCNBZDE7S8lPAYHg8Q0+aUEayOC+HHA1SQxRDHksQVDDSA7SUxPbxOW
NGpLRJ7ywqQpBwY1X2EEllyLITafiYClznlhbK+CyXwkIV8Q3jYF8W/5VGKmYspq5cP3GkJO2YcK
iD/jM+qBqkQCvNEjEvB0UyTBdlPEj9m6Jd20P4XZ1OTWE53OmNWOzUsvdXV3oDXe3hjFEjtDCqmR
Akd0iDVPR2TBHOwIOAWsyzGCR88fL9iW1XvXUcvqXhT0/gxuxvRRUwCOCOn5AuKCqYyseD/OOJLF
3BVjhJbTaylFU08UUMNGZr3H1qCIXlQPdDUaeAL7pUNk2CnAu6mRuUUvE07aQ1U0cARuK/Ba5qKR
tJMsuQuyby/4noWl4IAi321i9uDY8EdrtCKLeo9PXmxy+a6J21LmNlGcob2+tB5v77RKdzx/O7+O
tXe7ynPc3iXInzob6LIJ1ZEd1nV235252c+bzUUJvl6wJmlZ7aY6WLegbbUzXj5wwbCY0r/gWibe
JZyGSCShe8j4gLobZoO7ESnixMOGg9FchyWFYI5CYGjb4ao9x1tJ/iQVNmZIih7h6h1Zm6ZggcDx
TbdnWfVdFC2X4LJhzB+apM0OxgnGqGo1oyvGrvKcTLLSQrCHr1S2n4jTdY5nuSbRh5Fmr/fHx9Pl
9SY9/fv8dBq7ZzXCbZwm7ac4uXNj0e6CRsQyPgbT2S0BDR9YUTTjrHytgAsv35Gb3YyAWFm6UbbV
1k3j3TEJ1s1ieRux3jqMgCxnMwphZhnaTzTv4m2QSDh0ZcwGt8lRyDq0zMqq/owGQuoYaogiuA3b
kkzE1nYhrWPq+8zQsxVvvdWd2aRizas28Ay3CNXOxHMYHGdlTky4WkugdzsbwfvlPWQruGQ5EARF
OIoB44Nd1rTJmtLzNSmdeSLY7jI+etiGl6iHp/HieNRDuiEneaKIZmraZyPpbBZq4TglNTec6zIJ
3ertBKwZSOn0ARins2kYwvxwzUJV1hVrJqDnHRppt7xmnhi7BfUqPwinrgCJPtDhW+eyE/MGao5H
fw6YqPv1mtgf9LQ2WbFk6uiJ0M1JIMsF/6TVTu5LNzFzma+kKNk67MpSNofmJ7kIHcKMRHWqEhbF
XiTEIvKhc6jz0yEPMQ5HdCRzet4eH+w/PZ2+nd4uL6cPes6dHotoirf1hkDRVjQR+0+xBCq1KuMA
+xRR39PJ6NuGGeaNMlGzsnYwxtvWpnHIbs7SOMLwj6qx6xTjXRjC0iFghx/rYyEXy3kYrzkaLZyu
/sZks43iYy49PHCm4fDvjjIlD+A1ASSZYt0dk093gXFA281OSRRihPeyjNX+cDYi0BwD0XmErkiL
6Yyzt1Kc5WwWtK6ra011olAkfo9ZHhPVwB43xsdkHrKrtmzuFlFA9+WKtIpnPEqN05VN9359/Hb5
cvNxuXk+fzl/PH4DR3hKDflwdb70drIMai4bihXigwf1PcfdyXyrZUWpnkrFqOOiwP6EFXu5xOZL
APR0BJtxPI7MPRCl6bubuIxnaWg55ApFA0UAg191s7rId6HLt9wkgTfvAU0wLXajhLLdISsqAaDS
TZY4XmHpWuOEBLvZogbljs+Cvm85hjOah+3RgQXuLt35SJSCfZu6KRsfU96aKUQCiCaeGC0cP81V
0STh9DZwCIuZQ8Bg96CnRtjzEoAYzWnZykREahHnh4V9pK9R9OcTT26xlFKKAWedZNy+uYxrShXh
PFy61baL97c+byZgru2tUKNWKwWNz6NWow/QEVhTBePdoD1WTnYG7Tv3JTyIHK4krQUUnzpo0sfZ
n+vKU7H1DrxKLdw66nc9pkr54zLth8UTr/bA4sYqdRduyyode14mmqKpRDwR93SXlK5lWrLChkOD
aDN/3YBEEVffk0VA1USgSrUMcVOldewFHkNxRA/FHKhO/If1PJjQfBxypfhoREpKt+9hjl29dRP+
tckdT//rt8vrx032+kxvONXqXGcyid0zWRo9CmxNIb5/O//rTLSlbZlMrQew3riglzJpPn5/fFJ5
BLw032o0rBiBvSLpDGR/Gdik8fX0cn5SDOO4AkfZFGqEim0rs53ErnEMI/u9GnFWZTanSht8O2B7
iSRI23l87/S4JI0mbi/UNBIPpJ3XOUxVG4EVGink6JMGPfy+WB5JXbmVYNx5nJ87dx6q2W+Sy8vL
5RUfmPECWJErpa0jaXNgLtGVMGDIoTof7sBdnjHNkaJLaZyNMdPRJWkWeJ6tb3POZfuK6jaPpj/7
FKDZZM4hzylGhPuB+p5Oifozmy1D8CaNz4E1NaoJwfhoRN/LOS1GKqqmNQ5ZO4qcTilsb7d6KzFu
PZyHEX49qBbdWUBX5dkCPwBRSzAAD43myHg8ocbu3NtoHP3Z7JYs6mZac7I3eEi51hx9h3r+8fLy
0x7cIhsQ1crpviw/q62cUoqc5jenrZrv55hNoLtDwQL9Fpb0YpIh4zP97fQ/P06vTz9v5M/Xj6+n
9/P/gjP6NJW/iaJQIuj9njYcfvy4vP2Wnt8/3s7//AH+YXC3vypn/Pt9fXw//b1QYqfnm+Jy+X7z
V5XO327+1efjHeUDx/3/DdmF+0UJyej68vPt8v50+X5Sre1MvatyE8zJPArf7mZ3fYxlqHRydudX
in00wQeUlsBOAlqp4fehmsVsQ/NmE4UTsuL4C2am09Pjt4+vaM7rqG8fN/Xjx+mmvLyeP+gStM6m
U/rECg5sJwGLiG1ZIc4TGz1i4hyZ/Px4OT+fP36iRhnmuzKMWB0m3TZUS9+msFniHhUoTkgchW4b
GeLZxXy7bb1t9iz0hsxvJ9g5LHyHpFVGBbLobGr+OKvGejk9vv94O72clL7yQ1UQ6YW50wvzoRf2
fbCSC4LF2FGo3F15nDt7tEObJ+U0nBtRbqOmRFSvneteSw72MIPpzoUs56k8+ujXwrR5xPKWqZz4
6H1b9Vhu3rrVdV+cv3z9YPtX+iltZURB/RF3f1S9m7VaKSLSp9S3Gpzk7VksUrmMJh6jEmB6DGLk
bRRifW21DW7xvALfeK1P1MIXYI+3QCCv80uVuYh8zycUl0NR5qxdz0aEsZhgNzSGogo7mZBj8vxe
ztUwigv+RrZXiWQRLicBhwVMRbDDXU0JqPfeTzIOQhayvBb1ZIZHeBdxUUYz7DezaGoCaF4cVKNO
E2zBFx+nFIbeUtDB5K6KgwhPCZUAFwIoXqFyGk4sbaiRPAgiDr0KGI4BSXMXRazfCDUo9odcUuXI
kuiwaxIZTbFrHU3Ax8JdNTWqtok/ak1YuAR83AaEWxyXIkxn2IHlXs6CRYhMNw7JrqBVaygUGu2Q
lXpfyvYpw2RNcQ7FnJxm/64aRbVBgKcNOi0YW9PHL6+nD3M4OdYS4rvFEntb19/U2u1uslyyPkLs
QXkZb5BOiIjO6W+8iYKAHBon0SycjqdEHZbXJLpoXXbXzmo/PFtMIy/DXRI7dl1GgXcN+RyX8TZW
/+QsIssiW7Wm0n98+zh//3b6gxpTw25uT3aNRNCuqk/fzq+j9kIrA8PXAs3b+csXUBX/fvOu9uzP
Ss1/PbkHD9vaPlc29zPckgkPocDNRr0Xje96p3vm/2ciM7JEkjZsk2+2TVFVgmfLz3ItSUZsVfAF
tuvjq9LatMfwx9cvP76p398v72fQ67lVU8/001ZUkt09/ZnYiF7+/fKhFuwzc7s1C/GckoIPMvIc
DnaKUxYoCraME+qHB0hqSuJOxEThqrGevLH5VtWJtbiiFEsLVuuNzgQxe6a30zsoLax+shKT+aTk
gRhXpfBcrRVbNS2iqTYVSsfBGrCYoFGfJwJwGcjOpQiCmfvtzFCiiALqkq2Us7lHlQJWxOF72qlK
1JkcT2Ca6qxisyntAlsRTubcRPS7iJUWhA4zLMFVHkf1P6iMr+fXL9ysMmbalrz8cX4BzR/6/vP5
3ZwFjpaRzs1FebcSAINzzMu8wecBoO04vrGKPI1r/cSiPbD9fRUQnU/kFOKrXqcA08cFlfV6gu2G
j8uIwgAqysyjx0JYTpWDpZy6TD8Us6iYHMe1f7XO7PPR98s3gOL0XxD2Dw+vSpqJ//TyHQ4w6JDD
U9skVjN5hh2pl8VxOZlTfxCG5oFUakqlNHMOMzQDnXWp7yAgdlKNmsFZkBTNCFMypzNl6dXSZoWj
VZ9gwMjEC5w8Re/RgSAf8ibZNtSsCRjQsUTlcRkDAk1VcTZEOmxWr2kyTR3vpH2V33WUMmuNmZBu
LvV5s3o7P39hbNNAtFHa8nRBg6/ju4yEvzy+PXPBc5BWm6kZlh5Zwg13aA/ETsdoIPX9zdPX83fk
W7brS/U93EIhdbEu2w32wm4JrSjHNLW0tbv6H4FLP4SM8CHiaG3eSB+deqxyeOaVHd7dCnBZXGIU
/bho17gsq6S8nUSLtgig4IhuLc+KkNIttFZuLLS6ybxHDVKyak7LyQkqOOyGJ/44mk8avSbOndfj
xpRLKWYJiIucA+PrpVQ7caEBK1Uz+ZmvCBeJKFKdCD8HyOkC1OT6nmVjkHqfTJeV7UKO0umi6d4c
4u2mUlvBuQcMuERgoAZVqx3Qnaq0NMPYL/oWGiSoSad9oIUPaVSSSk42GVE+gbprjMreVUFvPV2P
hwM2reaY2hJbFxu3TgfboPKpMrZS/ZLTpMEt90bjHCdbNWVRywPM46fEEvxg424WCzh877pZt7lw
hz5qXBEndzCN+Qz7t9DBtHMKRbWPJYfkGA7qE8CLm63n9Y7lH2XAHocatn72iw3HLFnbo4xTs4PY
H50d5Oaidhze62XKsMFA5BpbI0tuHq6I3IXs6YhhFvGuoU6CLN3cUnnDlclWtFKNpuNsHFgPF39Q
g34NKNOqvVduPYOlhkvDSHKE0T/8ZBlkZBo68v3isqwjLUrLrdc4p4QWytNbRo3J6UZmBvU4st4r
hje6bl4ah+1nrE2x554fGCkA2cRhLf5m5wHG9UDDS3HeYwi2qFH0t59v5I9/vuvXGcOCD56kaljO
t0iZR8S2zEWuNmOYDeTuthTszauGqO3A1h6q2L4PAQCYFPIzLhqETeKd0bGSDF5B0XSNQYmKZEQG
kCaUV5IdxV7qUJ4kLUwPWL27QfWoWKw0frIndAcsUWghmjHLC8L4l0ztFDVj09f478C9mgMQ0lUA
km28iwvszZmR46qqA1dQGeK8KOoG0v6iutzSsGp3RVunRz3VANSjfmQ8RTF1MzBGTbKT4bXKALZx
HJo6UdaQv7iJR2UGhtM73EqBgl1JtAcVreraPJxhmONh1HFkDkCSHl5cHCo3y/q9gfapdDXjZX5U
y1Df2J7MWzS30aiy0G8s/Zalw4IKKs6ooKAlq0VxVzFN3WmVJj6Sf7MMtof6aB06++rfCtZKMaUJ
GKC96HamX7YUe6UB1kw31EpE1znGjFFRzesQFe9EA2AzAwlL7JuSU9mw2OI4xDNiJ2rDPfklH1Kh
XHGM23CxK5Uyg/c9hDVuD2AxbVGWIroyh2q2TYeGAwhQf+cD9h6/YuiIRzkurSJvU+pXs6ObTs6q
xnqK1zpRK7M6pe5k9VATSSyulU3p0luA3S3TUo2IiRu+SrKiamzknji09jvuSBZJ4X4xmU+Z/meR
BO+nk8AXONeBj77AMGhChn6PD4sG6rg7aDpMqFvpYcidUBvwrGwqApXpBHZ7IGLpnuiLfNRapNRX
Gk17InE9pgOnjjWKlj/o4E7Brj+Y179PFF4GfB0nHnZWlomHpSdI28G9/HELUX4ic25hp0KpEfKV
v38MP1rjBzDwzyLzlWPUUe0OOBXggycbrWYdcDEMYS3gXdC6l6T+laB72TaaU3qGqT+qIFpHEVe0
PPs2Tnv/djWLXtvn4sZM7uqcyIwrfDj72I57MthmguF3EKnMq+rztuggOLWCTuU0+XY6uWU0a323
p8jqYzS1m23G8ZoGYl7vLaetCLm3vyBiXj6OUk7LRTBn6HE5n009E/mn2zDI2of8dyYp/dgzMecT
rTNANM/T+HCsk4vMmQbgiWzg+B4yygxs/O+yrFzFn/VY91YNFfXPRkZOe3NQqtVo8AxsNzW8ITOG
7sarAz4QEmRf2AeBF/EJRZXK0yJTiX3KWHjxtBEEr6hMSHHMHvT0Bs6n9G3JizG0Q0fQww1irUqq
8RK4HmO46IhVE0pyAqQfIntDp3JP0Tc6ZRpe31KOxi4VmSWS+NMymSul2UlmqNcrZe336vjNuGp/
clcD3x3WbftQ5413Pz2Fd4YjzGX7TOH57XJ+RvfTu7SuMBqJJWgUWED4FvSFNuGu2aNBGoF5RCr/
8Zd/nl+fT2//9fU/9se/X5/Nr7/4k2bRgbsy9Oek+Wp3SPMSKQyrQoOnqcbA0Fq7FBjkOyni3JFo
0GbNfAyzwlrHyPX2+GhBWobAioYDQ34UibtWOtBsHjRsF9hAuER9Pp2PZIFcJRV2t2Qfm2cUNMWI
d2c1GYCekkFK+SpCX271ozsnSVC6u/Toy6n7tag9LuJsYeHllExjrmoHPYmWpaeTTJj4YH/u5M4m
pFcvlRkKptavqTqNKxk1Nvc6avaRnAUDZatd7g5S1e1GYGwY84RrVG0af/hXman5vmirAM4wdoda
u8UwRsoPNx9vj0/6yt+953N9HDQlXOor/X0VKz2dfyZmJQA4EA0ZYDhvA4Akq32dZB2qJcvbKnWk
WWVxw3LXTU0QV8wq12zJimRpoDWxpsGWvWm244hUYnxkSku8FplociayDox7sKge1/6QlueM+v8q
e7bltnVdfyXTp31m2rUSx0mThzzQEmVzRbeIku3kxZOmbutZbZLJ5ey9ztcfgBQlXkC7+6WNAYh3
ggAIgJl0BDz4uSm5isvflFUayw0qQD1VVo1I3g+LYtFZspQF11HCLkomLq9QsBnHTAWUkMSH22v4
M8wEWdWawv65kQtYsh0uLIFpdOZwbJxYjgJWOcOO6/JW1DlfK8bre+IRmTY7jJecf76cWKoxAt37
QoT0rzhRjntBM2pgN7WbR0rQrwPkotCOAdYlrCj63JZtQ3kdKNc8+LsEQctdaQaKB0Ac473dHqKp
+4yQ6iZaiP/+Z4xmU0k4XE4jLSXe9HPwWt8irz86pPOKVb6MSekyk8ErMXFzGbnOjYCkxX5+w51J
xidybjqWppwMphkeImmT2QaE59ZJTa1ZhS7RfOE+ZFKhFzTaQ9LCg2I+eXtteu4eOm5q93N7pMV4
O29WwpIFx9eQUpUtwrWmLBn6aLXAbSXewEvyXjpTDw7Yr7rxdTvZ2NJKD9isWeu+DGMQdSUF7MSE
zrdhqCRPOhB0KR0WSE51lfZXp79V9unhsqd+d6ZOySHKFOc1aBp9I+KvWWpZbfCX/4ADZoadqemy
hB4uJMrdTvMGIJAmznuKFrmeC6ohprQxKiE2iBbe6q8FHU89m7RlrcC3rajNuw5qR0j/zMlmScWJ
IsFNV9nGzbU3OU5hDbWbEVGVOboEyaSxj0EL0/CaicYvb8UaOmXk2owAUR8obROvo1WiYZSjfevP
sYFQa3DAqfnvn3xz5magaDq81CgBqfRDpz2aKOiAh2cSVhT96thYC8/woSuRUburFPkwFmalT4JV
oEC4cugB6r8IGYxB7Fu/hobaswqnx3FPxephGW36EFVJ1Y93M+j5KyKPV9xVJVeUNIPVuuP4m+Q8
uEVcNqUhoOWqlzdrd0QFvt4DCFFSCxQ+42XS3NZ9jyjwhuXuszAuVuhdo37TNeCisNflAAo5x4ia
dQKEPFi3Yl4yPEPpMSurFhacpX4PAEueUCCVwJEWnpmmICowHGfUbBEA8nir7g6UzIGJeSh7WwPY
nh6Zh+fWrBExxqGxbWNLyzdZAbzxxAdY54n6ynFLZF1bZdI91zTM33kwOvS6rGBCcnbrFDHCYNen
okFJLXV5JkXC8hUDvTGr8rxa7a1qg8agdaS8EhegWvXkdFqUa5h71d9DhAWHgatqZwn0eTUefmwd
V9pMqtOZNPf11Jo8/dRUxZ/pMlVC2SiTjQtTVpd4s04Oe5dmZopM4XSBOrCjkn9mrP2Tr/FfkGTd
KoeF3jrTWEj4zlsIyyzKfQFhntdKQBFFVe1qevrZFn2iH5etd7QpgCf7KFizcmTcfR3T5uTX7fvX
p6Nv9BirJFZki/S7RwuRp43tqnvNm9Jup7HIjc6xRU1bQNE5cni0ctHNgUfM7JLiIKX1WtPCiywF
hsqdFP6D8+VczNHNIfG+0v8FGxtU9SVrvCEY7dPh4FnGeyETdYDgI6W8oKNjgRXiI6sxOkOV21Of
S7OQrj7sXp8uLs4uP518sMrM5bDCNlMy+sYh+Xz62S19xHw+i2Au7MBkD+Nc3nk4KqbfI/kc/5z0
5PNITmLtOp9EMadRzDSKOdvTTCoAxCO5jBR8eXoeLfjy7GD/L0/jo385pR2H3ZZ9nkaJgOPiYttQ
gT9OIScT9xEJH0lFuSANk4kQ7sCYOk/88gyCum208aexDw/3k06JaFPEJtrgg7VsEPGZGDpMXXM7
BNPISAUr87oSFxvyhWyD7NyiCpagvZ+VITjhIFcmfg0aA+Jc11CGzYGkqUCtJYu9bUSe294tBjNn
PKcrnIN8Rz39bPAC2uqlNh9QZUe+e+x0nmwoyNLXQi5cRNdmTsRpmlO2va4UuAlswh60KTHHei7u
mNIJzAUeZR+sNqsb+4R3LFY6g9X24f0FA+uenjH01hJg8OFzu3b8DeLlTcfRPBaKZeao540UcDSB
PA5fYG79SO79Bh0DU1UsbUbSas8+EkBs0gWoYbxRY0G+H9GroJu04FI5a7eNSFzbZE9CihoLtuTw
T5PyEpqCeg3KriBeg6KHCf7sggIySrIDkQU1JH3pYttOWas8MnlTwCTr14wOoEEqaRdXH/58/bJ7
/PP9dfvy6+nr9tOP7c9nvPMdZd+C6T6ii3K6qZph8GdVRXoW9JLnOHZ2Dq1cFlcfft4/fsVETx/x
n69P/378+M/9r3v4df/1eff48fX+2xYK3H39uHt8237HFfbxy/O3D3rRXW9fHrc/j37cv3zdqgDZ
cfH1b3n9enr552j3uMN8Lbv/u+9zTA1KpmhxQEADLysn8TMilBINkzP0wjUfGJoM+IFFQkpskXYY
dLwbQwo4f3cNJjCYBGVDsHVFeVv6eck0DITUpL71oWsn+Z8C1Tc+pGEiPYdVn1RLS3zFjYVXL1p6
f/nn+e3p6OHpZXv09HKkl48dh4zEIHPW0i8BrRXOE8oOeBLCOUtJYEgqrxNRL+wd4CHCT0BeX5DA
kLSxH5MZYSThID4HDY+2hMUaf13XIfV1XYcloHUrJA2eCnfh4QfIL+zV79IPbw0rSyXJYr0P+Lpt
WEjuEs+zk8lF0eVBa8oup4Fhw2v1fwBW/xFrqGsXcF4EcPcFbbOCRBGWMOSQ13ru+5efu4dPf2//
OXpQu+P7y/3zj3+CTdFIRoxuSoVxmHqSsJU8ScOFC0CycJ40gNg3V7Kgo83NEHbNkk/Ozk4cqVL7
Lr2//cDEEw/3b9uvR/xR9R0Tcvx79/bjiL2+Pj3sFCq9f7u3NX9TdEJJMmZV2MFs5oMFyBFsclxX
+a2bHWlgDnMhTyYXxEAYlJrPeLWS34iA9cEoLhicBEsz4TOVtBCPz9dgkpNZQlSfZJTzoEG24R5N
2pB/cvuxgx6WK6OMC6uykK7W7XKBa6ISkJL65yq9jbeID3sK4mzbhROG9vZh0Bb3rz9iY1awsHEL
CrimurHUlCaPyvb1LayhSU4n4ZcKHFayJg+HWc6u+SQcWg0PRxIKb0+OU/uJE7O4yfKj41ukUwJG
0AlYpyqciFqCTZGe0OGK/dJf2G+4jcDJ2TkFPjshjuEFOw2BxSnRGokW9FlF32z1NKv6zM3FppnI
7vnH9iVcRMz1Nh6hm5ZyPhomr1plgpxtjRhzlwd7mhUc9ErKUWigQOXHy31u4cIpROg5URcdtmKE
rcjp17PLcEZ4UzsxcMNMheusXVXk8PTwsXd6bp5+PWPqG5Pk1e9ElrOWupExzOyuCiq6mIbrLL8L
GwqwRbjB76Q6/3XKF1BCnn4dle+/vmxfTMpZuqWslAKftiVv5kxvmhkahMsuqFRhevYVjIHCwfY/
UDB1JiAiAP4l2pZjSGNT2UK/JdFtKKHbIGg5eMBagrXfk4Fm7ygNVL00Hy2Fl0q2rGbojxjxpR54
B9snUGKPNv0bfLbK8nP35eUeFLSXp/e33SNxDOVi1nOREN4zeRN6vY8mPB/1/cCSKyq9LckCNGpv
Hfu+HkS1/SUMZCQ6jQyAOZ1AihV3/Opybx+jR5lT0r5W7i3hoCCIRJGja7Ei2esSzQArUdKpPywy
mZ+endAs2iCjd8cWpXqnjLEidjzYNJHKhiLiLiIU9V+HOsgWrAlXGKLMU6aEPqy+PKtjY6sekmP7
DrGRrE3Jk3wkgJn9nXIEIfCNWEq1cqqYHE9JdQ1okoTyNrcI0Bs/TdzRYEvR4XvplAnN+rQUwMnX
ZNM0apOU5dnZeh1pW5W0vCrbtV8T2Q/dpjtxoDs3tunRheNIRVqC2J6rw9461BaL2hw6Bxs1fPBb
bYAD6HAj8LH3vac+UIli3vLEnJxUOSYW4lB9Otzr8MZIFjyXoorUthRNS3qWO7s64+uE59EVDeL4
/hJUhgDJI7umyCtM9jVfhyYbDx+6FjnNnHQHl4qJyKsSqeR7kFv3N93+YJEQAltIo+Q3xQYmdnJe
eVsUHK8E1G0ChtiSyLqb5T2N7GYu2frs+HKTcLTriwR9e7Vj70hQXyfyQvncIxbLoCg+Y3SLxEvP
ATveqig8mrPwc+qaQ8zx4qHm2gtN+QZiY4QlymP682/KuPN69A2D43bfH3VWwIcf24e/d4/frXAV
5V5g39I0wj4kQry8+vDBw2proTUywfcBxUbJItPjy/OBksMfKWtuDzYGpLXkOhey/Q0KJVLiX9jq
8SZIkzV8WemxUyS0+9FvjKapfSZKbL/yUsvMdORR4VXb7Gs3F1UP28x4mcBKbqi7THQOZA3QlnNb
5sMsY85ozODY4fjcuTUhStJTMh+FNfmJQMkvk/p2kzUqV4C9hG2SnJcRLL7i2rXCdlExqEyUKfzT
wOxAExx2UjWpIONsG1FwDGiZOW+369tAlod11JhKznWtly3wa/8hTjUQ6KaXFPU6WcyVW2fDM48C
XYQyNAn0UTIieAQeywAuAvpnWbX6knKkgA5rZz0nNCZpEgzGbR11Pjk5dylCQ1SyEW23cb9ybWEJ
vkVvx3u6GGBwfHZ7EWHWFgntDNGTsGYVMwkgXk/tCDp3FP/E/WW5GoECEJr8Eiulp2/jw7RqbaiR
aLCaG7xjYQQJ7J+0Ktyx6lEX08ngeOxCUx7C71BrAb01d1jfnVbKPGh+VxElI5QqOb+bktTTRULD
6fbJNiXIFZiiX98h2F45GrJZX1C+LT1SRbbX1GeCndNLqcezhg5pHdHtAvb+PhpMQkNxjh49S/7y
u+ddGo3jsJnf2bknLcQMEBMS01urPC5kOw+YNYdvhsoqrxzV0YaiQ4TNBBwcVGnjZq43s3KdXrLc
c3Jes6YB+UjxLlvokVUigFWp8wAI7DNCBSbZodQapEJJHK6KcOfJZgyYr+wr5FK1XyPgvHAiRhUO
EZgkAo1DPmtGHMPcAe3mfOqwFMTAaOSswVjYBXdzgw1cW/K2q8NGDfgWDtK0WpV7SNT9OqKzqqEP
kIDKSbM6kCAWlktNtFeuRNXmM7d7ZVUaSnyqt3axA6quqtxFNTyg7g8gAoMmvECwdxAwe+TWMxO3
T1SR81xvA4udq5iQIQbBQtTdpnHbd2Of7XnlZM7C3/u8osq8D2kxxed3+Iq5tV2aG7RWWVUUtQCm
bdUvCuc3/Mjs3NiYY6HB+8m2sbZPl8gJikeOLKbkLsMYlqm0BAEDnfMWwyarLGVEykj8RsVcbmzR
QmKEe25vDDn3VsSw/jDjgmtSBgA2vyoJ6k4HNW6yvJMLL3hO+2WjZ86K2XkgFCjlddV6MC2Hg3iH
j6MfDyjY0c5815hTzmpMNfuLzW3xXg0qmcsiELP98dOnsc7yINWaXPHhhmFw8THqkYI+v+we3/7W
ueh/bV+/h85ziY7CB7FxnoMsnQ9OJJ+jFDed4O3VdJwCrQsGJUxtdaWYVaiW8qYpWUHHSUQbO9zv
7H5uP73tfvWKy6sifdDwl7BrWQM1qSgbmLHphdUamIQajg/MrBFxYG84S7XpRlKeAguOubsxIAUW
h73/enajg8HQV75gbWKdFz5GNQ9jDJ3gJF0K8GFMdtCVSR9wBQwHD5FYmMGKAS/Vna4rdZLacXU2
fAQvgT2UGOHu5vOxG7Di7BqdJZG70Qrm786Mmkd1+bV7MAs23X55//4dfdLE4+vbyzu+debEahQM
jTeg77o5xd2GSn8Gsn6DbPTs+B2TyqFIERQYMk6fDm5J6MEXc7tU4389Tx32jr9jc6X400yyPgRT
3HG/pQobq+86wU9ReBO5+yzObw2vO1YY3MKJUcJIj+AKvPc0HModt5vygufrFp/VtfmxLgyx3jHq
IYyxNPBiUwWDhOOYoZT1qRKyKp1Daixzo5Vgr09NlbI2TIgUCDqKeLX2C7Yhg6bepp2TL1H99twj
e2Cfs8kvFk4JnrgRuA6CFBIipBltTXWJVHKDPfVh8M7BQjCh6sJxlHTxOlt/mJPBpfJm/cRi03k3
i164qm3Qr184EXNgUn4Nh+AoPChJQ5vyTs6Pj4/9ARloBwfcLNszCQM5hhduZELu4P6MUFJFJ51w
LQlCStqjOOak6qP46fW5hObPWxy+cCaXtELqf3h4E6CFv2PBETeCfa7Bi6q5Vd7LROE9VoXWqiRL
TQPahg6fDsvqTx08naJrQLNeJm2py0OAcgJy81zGCRaHCJaFrwOoS5geG94m29ig9h6LmwyFwbIa
zwDQFL08HKqM/Z3PMBf0WDz9G5Oq1CpLn1axr06Ojz0KzLdjWNHk7Mz/vlWGAmXaV3tBXh0HHujj
ueCt9oV+f0I7yiHRUfX0/PrxCJ9Ifn/WAsPi/vG7G6fJMPczyD5VRS4AB48ZSzp+dewilT7StVfW
zpZV1qKVFNVq3kJvK+q6T6M2C0wL2jLpcBHNCgbUUMnJqBlgwAIoA6ywyFSLLNtHjKTvyfBWzuoG
ZDsQFtPKSSO1fxh10AyIY1/fUQazD+zR659A+3sQ+3bNeU2nCuj3KZw5hXID0xcG6KI6Sh7/en3e
PaLbKrTz1/vb9j9b+GP79vDHH3/8j/XMHOYpUMXNlYakY2atE7SplkPSAh/csJUuoITV6cXUKzge
I9Hmo0moa/maBwezhG7j9z48Qr5aaQwcXdVKhbx4BM1K8iL4TLXQ4y8IS+2EQD0AzdLy6uTMBys3
Ydljz32sPlFU2rSe5HIfidJ1Nd00qEjAuZ+zBtRA3pnSJv6q6an3nEGsrQoU7HPOKReAsRhcDcof
rJeBpDsmmFYfrTCeNXScCuIaQSaZ8xl1ByBTXfyKidYyLxll/b9Y4qZIPbbAB7PcOQ50V0O4mhEv
1Z1SF2GpbLpScp6CsKDvAMKz81pz8ujQ9ngQk0FgkdzlzX9r7eHr/dv9EaoND3hdaKeO0rMjXPuz
YgU90GuNjDMPIwvYGW5QPiw3SlQHORrzd5ncKg7vizTTLT9pYJzKVrB8eIQNVjCpwWheYt/S04sL
JV98GYiCx7/AVDixr1DKUaaE4SyZnDil9stgNFAAkN+QOXrM44FOJz1GddMr941n6tVonTQGdDm0
N9m3YNDKBRxauZZfW25yJlsGcfWQKzTWEviVqDLYMfZj5w2rFzRNelsyZBl++kcCuVmJdoGGTV+k
69GFUkpUtJmdr1uR4Ls+aiKQUhlM/EKS/kNdirVYVKvVU3deE3WtiXuUKEvgrMsyu6d8iRZxpHeO
ORxnnA/9jmEwPlZRvbVCrhyzpD6g0V5Mdiuozyi3fkU9YXg8+5OCwo2y9QZFhwthWNTkKqDPEGe6
SZKhMNjW6GpCCXnWodf4s9WPGWzo+dzVsPCxONADifa5wx0UrNW7sN+LVc7aeHGVLCshOfGh0uP3
ftsv+H5Ry2CxyhJ0q0UVrmKDGJQwd0X1sgScPvginRphT+5ycDxmPjPo3u0AQ33VdzxcnQSmr8Mf
Z5PzGZ+XdpdlB/XNuN5ldjl1FsDMEvPhdAmmja7Hxm0JbMgnxadwzIvW/oT0+z9UiMdtS99WjQeD
xQr23WuZ6liursBwEpytqPGa0eF/XRNNYGbWWMsavKuMSFR2w2xSmosN6ScVE0l53toJ0a2BRVbl
leMMcHg1qBVhR59UUsH9y6/zqacomTkX+DCm4cIiJf1DK9CP8TFzu64BiC5P11KFtUv8i3ZMGaj7
TMe8LabrQ6QtGcs44HHveimVLGQr6OYCos8eqN3L8CwlxQx/1OzbqHb7+obiMWqlydP/bl/uvztv
0l93tJWINA85RuW6iNqQDNPM1OKNl2f3u+StzqRM0FFMdU/SPyZymTPK8I8obZr2dD2vuCEpg18u
bNRrbjJb0DsRqURlhMg4TYa6UQTtNsbcguyzFF67QfvavCWBNVdLc5ha3XWp8ZcxAis/pwaN+q4J
DEnwqq3pCtzxnku3QwUSDms40ybd4/9Mj49HM1cD0poSSbSRwERQjZaC65TcS8rkVcD+X3DnCESw
dKQgBUrF8tx5rmFm9DiljEb5o/KF8Vmi7TvjohxfGQ+nlWt8NYrQfu18C5G2qH4s+Nq92dAd1jfY
Oq+HDJEycReudgUGREtmwVbowd/UKSthpQ/zr9sVsOvsRysUaG38gdxmYG6/zMsy6FI0aPqIWcb1
qDi+ewoEB5UH8d0AlMcoNH48kYO2ZaIpQLunZVndTzgF2W0c7xjmo8uYFwnIi/4Y+n4K/Wwqf1zh
L3Aog4CqPCU6U7t7YYGepfCJvwx7EHmo7Ds/xhKUMaQQUuKCTKtEcQeKUWmryUxovu7kT/T8Jv4f
HipW2UO8AgA=
--===============2106215034459315188==--

