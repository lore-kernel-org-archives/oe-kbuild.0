Content-Type: multipart/mixed; boundary="===============1194165505823079119=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 20/26] lpfc: Fix field overload in lpfc_iocbq data structure
Date: Tue, 19 Apr 2022 02:53:23 +0800
Message-ID: <202204190252.8068PeSp-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1194165505823079119==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220412222008.126521-21-jsmart2021@gmail.com>
References: <20220412222008.126521-21-jsmart2021@gmail.com>
TO: James Smart <jsmart2021@gmail.com>
TO: linux-scsi(a)vger.kernel.org
CC: James Smart <jsmart2021@gmail.com>
CC: Justin Tee <justin.tee@broadcom.com>

Hi James,

I love your patch! Perhaps something to improve:

[auto build test WARNING on jejb-scsi/for-next]
[also build test WARNING on mkp-scsi/for-next v5.18-rc3 next-20220414]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/James-Smart/lpfc-Upd=
ate-lpfc-to-revision-14-2-0-2/20220413-073746
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi.git for-n=
ext
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: x86_64-randconfig-m001-20220418 (https://download.01.org/0day-ci/ar=
chive/20220419/202204190252.8068PeSp-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-19) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/scsi/lpfc/lpfc_sli.c:22305 lpfc_sli_prep_wqe() error: we previously=
 assumed 'ndlp' could be null (see line 22298)

vim +/ndlp +22305 drivers/scsi/lpfc/lpfc_sli.c

561341425bcc70 James Smart 2022-02-24  22228  =

561341425bcc70 James Smart 2022-02-24  22229  /**
561341425bcc70 James Smart 2022-02-24  22230   * lpfc_sli_prep_wqe - Prepar=
e WQE for the command to be posted
561341425bcc70 James Smart 2022-02-24  22231   * @phba: phba object
561341425bcc70 James Smart 2022-02-24  22232   * @job: job entry of the com=
mand to be posted.
561341425bcc70 James Smart 2022-02-24  22233   *
561341425bcc70 James Smart 2022-02-24  22234   * Fill the common fields of =
the wqe for each of the command.
561341425bcc70 James Smart 2022-02-24  22235   *
561341425bcc70 James Smart 2022-02-24  22236   * Return codes:
561341425bcc70 James Smart 2022-02-24  22237   *	None
561341425bcc70 James Smart 2022-02-24  22238   **/
561341425bcc70 James Smart 2022-02-24  22239  void
561341425bcc70 James Smart 2022-02-24  22240  lpfc_sli_prep_wqe(struct lpfc=
_hba *phba, struct lpfc_iocbq *job)
561341425bcc70 James Smart 2022-02-24  22241  {
561341425bcc70 James Smart 2022-02-24  22242  	u8 cmnd;
561341425bcc70 James Smart 2022-02-24  22243  	u32 *pcmd;
561341425bcc70 James Smart 2022-02-24  22244  	u32 if_type =3D 0;
561341425bcc70 James Smart 2022-02-24  22245  	u32 fip, abort_tag;
561341425bcc70 James Smart 2022-02-24  22246  	struct lpfc_nodelist *ndlp =
=3D NULL;
561341425bcc70 James Smart 2022-02-24  22247  	union lpfc_wqe128 *wqe =3D &=
job->wqe;
561341425bcc70 James Smart 2022-02-24  22248  	u32 els_id =3D LPFC_ELS_ID_D=
EFAULT;
561341425bcc70 James Smart 2022-02-24  22249  	u8 command_type =3D ELS_COMM=
AND_NON_FIP;
561341425bcc70 James Smart 2022-02-24  22250  =

561341425bcc70 James Smart 2022-02-24  22251  	fip =3D phba->hba_flag & HBA=
_FIP_SUPPORT;
561341425bcc70 James Smart 2022-02-24  22252  	/* The fcp commands will set=
 command type */
561341425bcc70 James Smart 2022-02-24  22253  	if (job->cmd_flag &  LPFC_IO=
_FCP)
561341425bcc70 James Smart 2022-02-24  22254  		command_type =3D FCP_COMMAN=
D;
561341425bcc70 James Smart 2022-02-24  22255  	else if (fip && (job->cmd_fl=
ag & LPFC_FIP_ELS_ID_MASK))
561341425bcc70 James Smart 2022-02-24  22256  		command_type =3D ELS_COMMAN=
D_FIP;
561341425bcc70 James Smart 2022-02-24  22257  	else
561341425bcc70 James Smart 2022-02-24  22258  		command_type =3D ELS_COMMAN=
D_NON_FIP;
561341425bcc70 James Smart 2022-02-24  22259  =

561341425bcc70 James Smart 2022-02-24  22260  	abort_tag =3D job->iotag;
561341425bcc70 James Smart 2022-02-24  22261  	cmnd =3D bf_get(wqe_cmnd, &w=
qe->els_req.wqe_com);
561341425bcc70 James Smart 2022-02-24  22262  =

561341425bcc70 James Smart 2022-02-24  22263  	switch (cmnd) {
561341425bcc70 James Smart 2022-02-24  22264  	case CMD_ELS_REQUEST64_WQE:
536304e3919a95 James Smart 2022-04-12  22265  		ndlp =3D job->ndlp;
561341425bcc70 James Smart 2022-02-24  22266  =

561341425bcc70 James Smart 2022-02-24  22267  		/* CCP CCPE PV PRI in word1=
0 were set in the memcpy */
561341425bcc70 James Smart 2022-02-24  22268  		if (command_type =3D=3D ELS=
_COMMAND_FIP)
561341425bcc70 James Smart 2022-02-24  22269  			els_id =3D ((job->cmd_flag=
 & LPFC_FIP_ELS_ID_MASK)
561341425bcc70 James Smart 2022-02-24  22270  				  >> LPFC_FIP_ELS_ID_SHIF=
T);
561341425bcc70 James Smart 2022-02-24  22271  =

561341425bcc70 James Smart 2022-02-24  22272  		if_type =3D bf_get(lpfc_sli=
_intf_if_type,
561341425bcc70 James Smart 2022-02-24  22273  				 &phba->sli4_hba.sli_intf=
);
561341425bcc70 James Smart 2022-02-24  22274  		if (if_type >=3D LPFC_SLI_I=
NTF_IF_TYPE_2) {
536304e3919a95 James Smart 2022-04-12  22275  			pcmd =3D (u32 *)job->cmd_d=
mabuf->virt;
561341425bcc70 James Smart 2022-02-24  22276  			if (pcmd && (*pcmd =3D=3D =
ELS_CMD_FLOGI ||
561341425bcc70 James Smart 2022-02-24  22277  				     *pcmd =3D=3D ELS_CMD=
_SCR ||
561341425bcc70 James Smart 2022-02-24  22278  				     *pcmd =3D=3D ELS_CMD=
_RDF ||
561341425bcc70 James Smart 2022-02-24  22279  				     *pcmd =3D=3D ELS_CMD=
_EDC ||
561341425bcc70 James Smart 2022-02-24  22280  				     *pcmd =3D=3D ELS_CMD=
_RSCN_XMT ||
561341425bcc70 James Smart 2022-02-24  22281  				     *pcmd =3D=3D ELS_CMD=
_FDISC ||
561341425bcc70 James Smart 2022-02-24  22282  				     *pcmd =3D=3D ELS_CMD=
_LOGO ||
561341425bcc70 James Smart 2022-02-24  22283  				     *pcmd =3D=3D ELS_CMD=
_QFPA ||
561341425bcc70 James Smart 2022-02-24  22284  				     *pcmd =3D=3D ELS_CMD=
_UVEM ||
561341425bcc70 James Smart 2022-02-24  22285  				     *pcmd =3D=3D ELS_CMD=
_PLOGI)) {
561341425bcc70 James Smart 2022-02-24  22286  				bf_set(els_req64_sp, &wqe=
->els_req, 1);
561341425bcc70 James Smart 2022-02-24  22287  				bf_set(els_req64_sid, &wq=
e->els_req,
561341425bcc70 James Smart 2022-02-24  22288  				       job->vport->fc_myD=
ID);
561341425bcc70 James Smart 2022-02-24  22289  =

561341425bcc70 James Smart 2022-02-24  22290  				if ((*pcmd =3D=3D ELS_CMD=
_FLOGI) &&
561341425bcc70 James Smart 2022-02-24  22291  				    !(phba->fc_topology =
=3D=3D
561341425bcc70 James Smart 2022-02-24  22292  				      LPFC_TOPOLOGY_LOOP))
561341425bcc70 James Smart 2022-02-24  22293  					bf_set(els_req64_sid, &w=
qe->els_req, 0);
561341425bcc70 James Smart 2022-02-24  22294  =

561341425bcc70 James Smart 2022-02-24  22295  				bf_set(wqe_ct, &wqe->els_=
req.wqe_com, 1);
561341425bcc70 James Smart 2022-02-24  22296  				bf_set(wqe_ctxt_tag, &wqe=
->els_req.wqe_com,
561341425bcc70 James Smart 2022-02-24  22297  				       phba->vpi_ids[job-=
>vport->vpi]);
536304e3919a95 James Smart 2022-04-12 @22298  			} else if (pcmd && ndlp) {
561341425bcc70 James Smart 2022-02-24  22299  				bf_set(wqe_ct, &wqe->els_=
req.wqe_com, 0);
561341425bcc70 James Smart 2022-02-24  22300  				bf_set(wqe_ctxt_tag, &wqe=
->els_req.wqe_com,
561341425bcc70 James Smart 2022-02-24  22301  				       phba->sli4_hba.rpi=
_ids[ndlp->nlp_rpi]);
561341425bcc70 James Smart 2022-02-24  22302  			}
561341425bcc70 James Smart 2022-02-24  22303  		}
561341425bcc70 James Smart 2022-02-24  22304  =

561341425bcc70 James Smart 2022-02-24 @22305  		bf_set(wqe_temp_rpi, &wqe->=
els_req.wqe_com,

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1194165505823079119==--

