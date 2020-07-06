Content-Type: multipart/mixed; boundary="===============4206839634111278749=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/scsi/mpt3sas/mpt3sas_base.c:5025:16-34: WARNING: dma_alloc_coherent use in ioc -> request already zeroes out memory, so memset is not needed
Date: Tue, 07 Jul 2020 04:54:19 +0800
Message-ID: <202007070414.xDKTkW9d%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4206839634111278749==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Suganath Prabu <suganath-prabu.subramani@broadcom.com>
CC: "Martin K. Petersen" <martin.petersen@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   5c82ec00dd00c7a2b02d4b42cf59ae87592cb75f
commit: e224e03b0c6a2381ed1ea5325c846582d87d6fae scsi: mpt3sas: memset requ=
est frame before reusing
date:   11 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 11 months ago
config: ia64-randconfig-c024-20200706 (attached as .config)
compiler: ia64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


coccinelle warnings: (new ones prefixed by >>)

>> drivers/scsi/mpt3sas/mpt3sas_base.c:5025:16-34: WARNING: dma_alloc_coher=
ent use in ioc -> request already zeroes out memory,  so memset is not need=
ed

# https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3De224e03b0c6a2381ed1ea5325c846582d87d6fae
git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torval=
ds/linux.git
git remote update linus
git checkout e224e03b0c6a2381ed1ea5325c846582d87d6fae
vim +5025 drivers/scsi/mpt3sas/mpt3sas_base.c

e21fef6f331b39 Chaitra P B              2018-04-24  4781  =

f92363d1235949 Sreekanth Reddy          2012-11-30  4782  /**
f92363d1235949 Sreekanth Reddy          2012-11-30  4783   * _base_allocate=
_memory_pools - allocate start of day memory pools
f92363d1235949 Sreekanth Reddy          2012-11-30  4784   * @ioc: per adap=
ter object
f92363d1235949 Sreekanth Reddy          2012-11-30  4785   *
4beb4867f049ae Bart Van Assche          2018-06-15  4786   * Return: 0 succ=
ess, anything else error.
f92363d1235949 Sreekanth Reddy          2012-11-30  4787   */
f92363d1235949 Sreekanth Reddy          2012-11-30  4788  static int
98c56ad32c33f0 Calvin Owens             2016-07-28  4789  _base_allocate_me=
mory_pools(struct MPT3SAS_ADAPTER *ioc)
f92363d1235949 Sreekanth Reddy          2012-11-30  4790  {
f92363d1235949 Sreekanth Reddy          2012-11-30  4791  	struct mpt3sas_f=
acts *facts;
f92363d1235949 Sreekanth Reddy          2012-11-30  4792  	u16 max_sge_elem=
ents;
f92363d1235949 Sreekanth Reddy          2012-11-30  4793  	u16 chains_neede=
d_per_io;
cd33223b59a493 Chaitra P B              2018-04-24  4794  	u32 sz, total_sz=
, reply_post_free_sz, reply_post_free_array_sz;
f92363d1235949 Sreekanth Reddy          2012-11-30  4795  	u32 retry_sz;
016d5c35e27824 Suganath Prabu Subramani 2017-10-31  4796  	u16 max_request_=
credit, nvme_blocks_needed;
f92363d1235949 Sreekanth Reddy          2012-11-30  4797  	unsigned short s=
g_tablesize;
f92363d1235949 Sreekanth Reddy          2012-11-30  4798  	u16 sge_size;
93204b782a88f2 Chaitra P B              2018-04-24  4799  	int i, j;
93204b782a88f2 Chaitra P B              2018-04-24  4800  	struct chain_tra=
cker *ct;
f92363d1235949 Sreekanth Reddy          2012-11-30  4801  =

919d8a3f3fef99 Joe Perches              2018-09-17  4802  	dinitprintk(ioc,=
 ioc_info(ioc, "%s\n", __func__));
f92363d1235949 Sreekanth Reddy          2012-11-30  4803  =

f92363d1235949 Sreekanth Reddy          2012-11-30  4804  =

f92363d1235949 Sreekanth Reddy          2012-11-30  4805  	retry_sz =3D 0;
f92363d1235949 Sreekanth Reddy          2012-11-30  4806  	facts =3D &ioc->=
facts;
f92363d1235949 Sreekanth Reddy          2012-11-30  4807  =

f92363d1235949 Sreekanth Reddy          2012-11-30  4808  	/* command line =
tunables for max sgl entries */
f92363d1235949 Sreekanth Reddy          2012-11-30  4809  	if (max_sgl_entr=
ies !=3D -1)
f92363d1235949 Sreekanth Reddy          2012-11-30  4810  		sg_tablesize =
=3D max_sgl_entries;
471ef9d4e49825 Sreekanth Reddy          2015-11-11  4811  	else {
471ef9d4e49825 Sreekanth Reddy          2015-11-11  4812  		if (ioc->hba_mp=
i_version_belonged =3D=3D MPI2_VERSION)
471ef9d4e49825 Sreekanth Reddy          2015-11-11  4813  			sg_tablesize =
=3D MPT2SAS_SG_DEPTH;
f92363d1235949 Sreekanth Reddy          2012-11-30  4814  		else
f92363d1235949 Sreekanth Reddy          2012-11-30  4815  			sg_tablesize =
=3D MPT3SAS_SG_DEPTH;
471ef9d4e49825 Sreekanth Reddy          2015-11-11  4816  	}
f92363d1235949 Sreekanth Reddy          2012-11-30  4817  =

06f5f976a6ee0f Sreekanth Reddy          2017-10-10  4818  	/* max sgl entri=
es <=3D MPT_KDUMP_MIN_PHYS_SEGMENTS in KDUMP mode */
06f5f976a6ee0f Sreekanth Reddy          2017-10-10  4819  	if (reset_device=
s)
06f5f976a6ee0f Sreekanth Reddy          2017-10-10  4820  		sg_tablesize =
=3D min_t(unsigned short, sg_tablesize,
06f5f976a6ee0f Sreekanth Reddy          2017-10-10  4821  		   MPT_KDUMP_MI=
N_PHYS_SEGMENTS);
06f5f976a6ee0f Sreekanth Reddy          2017-10-10  4822  =

0448f0195124e3 Suganath Prabu Subramani 2018-02-07  4823  	if (ioc->is_mcpu=
_endpoint)
0448f0195124e3 Suganath Prabu Subramani 2018-02-07  4824  		ioc->shost->sg_=
tablesize =3D MPT_MIN_PHYS_SEGMENTS;
0448f0195124e3 Suganath Prabu Subramani 2018-02-07  4825  	else {
8a7e4c24e08fce Sreekanth Reddy          2015-11-11  4826  		if (sg_tablesiz=
e < MPT_MIN_PHYS_SEGMENTS)
8a7e4c24e08fce Sreekanth Reddy          2015-11-11  4827  			sg_tablesize =
=3D MPT_MIN_PHYS_SEGMENTS;
8a7e4c24e08fce Sreekanth Reddy          2015-11-11  4828  		else if (sg_tab=
lesize > MPT_MAX_PHYS_SEGMENTS) {
ad666a0f41d98e Sreekanth Reddy          2015-01-12  4829  			sg_tablesize =
=3D min_t(unsigned short, sg_tablesize,
65e8617fba1773 Ming Lin                 2016-04-04  4830  					SG_MAX_SEGME=
NTS);
919d8a3f3fef99 Joe Perches              2018-09-17  4831  			ioc_warn(ioc, =
"sg_tablesize(%u) is bigger than kernel defined SG_CHUNK_SIZE(%u)\n",
8a7e4c24e08fce Sreekanth Reddy          2015-11-11  4832  				 sg_tablesize=
, MPT_MAX_PHYS_SEGMENTS);
ad666a0f41d98e Sreekanth Reddy          2015-01-12  4833  		}
f92363d1235949 Sreekanth Reddy          2012-11-30  4834  		ioc->shost->sg_=
tablesize =3D sg_tablesize;
0448f0195124e3 Suganath Prabu Subramani 2018-02-07  4835  	}
f92363d1235949 Sreekanth Reddy          2012-11-30  4836  =

fd0331b32826dd Suganath prabu Subramani 2016-01-28  4837  	ioc->internal_de=
pth =3D min_t(int, (facts->HighPriorityCredit + (5)),
fd0331b32826dd Suganath prabu Subramani 2016-01-28  4838  		(facts->Request=
Credit / 4));
fd0331b32826dd Suganath prabu Subramani 2016-01-28  4839  	if (ioc->interna=
l_depth < INTERNAL_CMDS_COUNT) {
fd0331b32826dd Suganath prabu Subramani 2016-01-28  4840  		if (facts->Requ=
estCredit <=3D (INTERNAL_CMDS_COUNT +
fd0331b32826dd Suganath prabu Subramani 2016-01-28  4841  				INTERNAL_SCSI=
IO_CMDS_COUNT)) {
919d8a3f3fef99 Joe Perches              2018-09-17  4842  			ioc_err(ioc, "=
IOC doesn't have enough Request Credits, it has just %d number of credits\n=
",
919d8a3f3fef99 Joe Perches              2018-09-17  4843  				facts->Reques=
tCredit);
fd0331b32826dd Suganath prabu Subramani 2016-01-28  4844  			return -ENOMEM;
fd0331b32826dd Suganath prabu Subramani 2016-01-28  4845  		}
fd0331b32826dd Suganath prabu Subramani 2016-01-28  4846  		ioc->internal_d=
epth =3D 10;
fd0331b32826dd Suganath prabu Subramani 2016-01-28  4847  	}
fd0331b32826dd Suganath prabu Subramani 2016-01-28  4848  =

fd0331b32826dd Suganath prabu Subramani 2016-01-28  4849  	ioc->hi_priority=
_depth =3D ioc->internal_depth - (5);
f92363d1235949 Sreekanth Reddy          2012-11-30  4850  	/* command line =
tunables  for max controller queue depth */
f92363d1235949 Sreekanth Reddy          2012-11-30  4851  	if (max_queue_de=
pth !=3D -1 && max_queue_depth !=3D 0) {
f92363d1235949 Sreekanth Reddy          2012-11-30  4852  		max_request_cre=
dit =3D min_t(u16, max_queue_depth +
fd0331b32826dd Suganath prabu Subramani 2016-01-28  4853  			ioc->internal_=
depth, facts->RequestCredit);
f92363d1235949 Sreekanth Reddy          2012-11-30  4854  		if (max_request=
_credit > MAX_HBA_QUEUE_DEPTH)
f92363d1235949 Sreekanth Reddy          2012-11-30  4855  			max_request_cr=
edit =3D  MAX_HBA_QUEUE_DEPTH;
06f5f976a6ee0f Sreekanth Reddy          2017-10-10  4856  	} else if (reset=
_devices)
06f5f976a6ee0f Sreekanth Reddy          2017-10-10  4857  		max_request_cre=
dit =3D min_t(u16, facts->RequestCredit,
06f5f976a6ee0f Sreekanth Reddy          2017-10-10  4858  		    (MPT3SAS_KD=
UMP_SCSI_IO_DEPTH + ioc->internal_depth));
06f5f976a6ee0f Sreekanth Reddy          2017-10-10  4859  	else
f92363d1235949 Sreekanth Reddy          2012-11-30  4860  		max_request_cre=
dit =3D min_t(u16, facts->RequestCredit,
f92363d1235949 Sreekanth Reddy          2012-11-30  4861  		    MAX_HBA_QUE=
UE_DEPTH);
f92363d1235949 Sreekanth Reddy          2012-11-30  4862  =

fd0331b32826dd Suganath prabu Subramani 2016-01-28  4863  	/* Firmware main=
tains additional facts->HighPriorityCredit number of
fd0331b32826dd Suganath prabu Subramani 2016-01-28  4864  	 * credits for H=
iPriprity Request messages, so hba queue depth will be
fd0331b32826dd Suganath prabu Subramani 2016-01-28  4865  	 * sum of max_re=
quest_credit and high priority queue depth.
fd0331b32826dd Suganath prabu Subramani 2016-01-28  4866  	 */
fd0331b32826dd Suganath prabu Subramani 2016-01-28  4867  	ioc->hba_queue_d=
epth =3D max_request_credit + ioc->hi_priority_depth;
f92363d1235949 Sreekanth Reddy          2012-11-30  4868  =

f92363d1235949 Sreekanth Reddy          2012-11-30  4869  	/* request frame=
 size */
f92363d1235949 Sreekanth Reddy          2012-11-30  4870  	ioc->request_sz =
=3D facts->IOCRequestFrameSize * 4;
f92363d1235949 Sreekanth Reddy          2012-11-30  4871  =

f92363d1235949 Sreekanth Reddy          2012-11-30  4872  	/* reply frame s=
ize */
f92363d1235949 Sreekanth Reddy          2012-11-30  4873  	ioc->reply_sz =
=3D facts->ReplyFrameSize * 4;
f92363d1235949 Sreekanth Reddy          2012-11-30  4874  =

ebb3024e2fd557 Suganath prabu Subramani 2016-01-28  4875  	/* chain segment=
 size */
ebb3024e2fd557 Suganath prabu Subramani 2016-01-28  4876  	if (ioc->hba_mpi=
_version_belonged !=3D MPI2_VERSION) {
ebb3024e2fd557 Suganath prabu Subramani 2016-01-28  4877  		if (facts->IOCM=
axChainSegmentSize)
ebb3024e2fd557 Suganath prabu Subramani 2016-01-28  4878  			ioc->chain_seg=
ment_sz =3D
ebb3024e2fd557 Suganath prabu Subramani 2016-01-28  4879  					facts->IOCMa=
xChainSegmentSize *
ebb3024e2fd557 Suganath prabu Subramani 2016-01-28  4880  					MAX_CHAIN_EL=
EMT_SZ;
ebb3024e2fd557 Suganath prabu Subramani 2016-01-28  4881  		else
ebb3024e2fd557 Suganath prabu Subramani 2016-01-28  4882  		/* set to 128 b=
ytes size if IOCMaxChainSegmentSize is zero */
ebb3024e2fd557 Suganath prabu Subramani 2016-01-28  4883  			ioc->chain_seg=
ment_sz =3D DEFAULT_NUM_FWCHAIN_ELEMTS *
ebb3024e2fd557 Suganath prabu Subramani 2016-01-28  4884  						    MAX_CHA=
IN_ELEMT_SZ;
ebb3024e2fd557 Suganath prabu Subramani 2016-01-28  4885  	} else
ebb3024e2fd557 Suganath prabu Subramani 2016-01-28  4886  		ioc->chain_segm=
ent_sz =3D ioc->request_sz;
ebb3024e2fd557 Suganath prabu Subramani 2016-01-28  4887  =

f92363d1235949 Sreekanth Reddy          2012-11-30  4888  	/* calculate the=
 max scatter element size */
f92363d1235949 Sreekanth Reddy          2012-11-30  4889  	sge_size =3D max=
_t(u16, ioc->sge_size, ioc->sge_size_ieee);
f92363d1235949 Sreekanth Reddy          2012-11-30  4890  =

f92363d1235949 Sreekanth Reddy          2012-11-30  4891   retry_allocation:
f92363d1235949 Sreekanth Reddy          2012-11-30  4892  	total_sz =3D 0;
f92363d1235949 Sreekanth Reddy          2012-11-30  4893  	/* calculate num=
ber of sg elements left over in the 1st frame */
f92363d1235949 Sreekanth Reddy          2012-11-30  4894  	max_sge_elements=
 =3D ioc->request_sz - ((sizeof(Mpi2SCSIIORequest_t) -
f92363d1235949 Sreekanth Reddy          2012-11-30  4895  	    sizeof(Mpi2S=
GEIOUnion_t)) + sge_size);
f92363d1235949 Sreekanth Reddy          2012-11-30  4896  	ioc->max_sges_in=
_main_message =3D max_sge_elements/sge_size;
f92363d1235949 Sreekanth Reddy          2012-11-30  4897  =

f92363d1235949 Sreekanth Reddy          2012-11-30  4898  	/* now do the sa=
me for a chain buffer */
ebb3024e2fd557 Suganath prabu Subramani 2016-01-28  4899  	max_sge_elements=
 =3D ioc->chain_segment_sz - sge_size;
f92363d1235949 Sreekanth Reddy          2012-11-30  4900  	ioc->max_sges_in=
_chain_message =3D max_sge_elements/sge_size;
f92363d1235949 Sreekanth Reddy          2012-11-30  4901  =

f92363d1235949 Sreekanth Reddy          2012-11-30  4902  	/*
f92363d1235949 Sreekanth Reddy          2012-11-30  4903  	 *  MPT3SAS_SG_D=
EPTH =3D CONFIG_FUSION_MAX_SGE
f92363d1235949 Sreekanth Reddy          2012-11-30  4904  	 */
f92363d1235949 Sreekanth Reddy          2012-11-30  4905  	chains_needed_pe=
r_io =3D ((ioc->shost->sg_tablesize -
f92363d1235949 Sreekanth Reddy          2012-11-30  4906  	   ioc->max_sges=
_in_main_message)/ioc->max_sges_in_chain_message)
f92363d1235949 Sreekanth Reddy          2012-11-30  4907  	    + 1;
f92363d1235949 Sreekanth Reddy          2012-11-30  4908  	if (chains_neede=
d_per_io > facts->MaxChainDepth) {
f92363d1235949 Sreekanth Reddy          2012-11-30  4909  		chains_needed_p=
er_io =3D facts->MaxChainDepth;
f92363d1235949 Sreekanth Reddy          2012-11-30  4910  		ioc->shost->sg_=
tablesize =3D min_t(u16,
f92363d1235949 Sreekanth Reddy          2012-11-30  4911  		ioc->max_sges_i=
n_main_message + (ioc->max_sges_in_chain_message
f92363d1235949 Sreekanth Reddy          2012-11-30  4912  		* chains_needed=
_per_io), ioc->shost->sg_tablesize);
f92363d1235949 Sreekanth Reddy          2012-11-30  4913  	}
f92363d1235949 Sreekanth Reddy          2012-11-30  4914  	ioc->chains_need=
ed_per_io =3D chains_needed_per_io;
f92363d1235949 Sreekanth Reddy          2012-11-30  4915  =

f92363d1235949 Sreekanth Reddy          2012-11-30  4916  	/* reply free qu=
eue sizing - taking into account for 64 FW events */
f92363d1235949 Sreekanth Reddy          2012-11-30  4917  	ioc->reply_free_=
queue_depth =3D ioc->hba_queue_depth + 64;
f92363d1235949 Sreekanth Reddy          2012-11-30  4918  =

0448f0195124e3 Suganath Prabu Subramani 2018-02-07  4919  	/* mCPU manage s=
ingle counters for simplicity */
0448f0195124e3 Suganath Prabu Subramani 2018-02-07  4920  	if (ioc->is_mcpu=
_endpoint)
0448f0195124e3 Suganath Prabu Subramani 2018-02-07  4921  		ioc->reply_post=
_queue_depth =3D ioc->reply_free_queue_depth;
0448f0195124e3 Suganath Prabu Subramani 2018-02-07  4922  	else {
f92363d1235949 Sreekanth Reddy          2012-11-30  4923  		/* calculate re=
ply descriptor post queue depth */
f92363d1235949 Sreekanth Reddy          2012-11-30  4924  		ioc->reply_post=
_queue_depth =3D ioc->hba_queue_depth +
f92363d1235949 Sreekanth Reddy          2012-11-30  4925  			ioc->reply_fre=
e_queue_depth +  1;
f92363d1235949 Sreekanth Reddy          2012-11-30  4926  		/* align the re=
ply post queue on the next 16 count boundary */
f92363d1235949 Sreekanth Reddy          2012-11-30  4927  		if (ioc->reply_=
post_queue_depth % 16)
f92363d1235949 Sreekanth Reddy          2012-11-30  4928  			ioc->reply_pos=
t_queue_depth +=3D 16 -
f92363d1235949 Sreekanth Reddy          2012-11-30  4929  				(ioc->reply_p=
ost_queue_depth % 16);
0448f0195124e3 Suganath Prabu Subramani 2018-02-07  4930  	}
f92363d1235949 Sreekanth Reddy          2012-11-30  4931  =

f92363d1235949 Sreekanth Reddy          2012-11-30  4932  	if (ioc->reply_p=
ost_queue_depth >
f92363d1235949 Sreekanth Reddy          2012-11-30  4933  	    facts->MaxRe=
plyDescriptorPostQueueDepth) {
f92363d1235949 Sreekanth Reddy          2012-11-30  4934  		ioc->reply_post=
_queue_depth =3D
f92363d1235949 Sreekanth Reddy          2012-11-30  4935  				facts->MaxRep=
lyDescriptorPostQueueDepth -
f92363d1235949 Sreekanth Reddy          2012-11-30  4936  		    (facts->Max=
ReplyDescriptorPostQueueDepth % 16);
f92363d1235949 Sreekanth Reddy          2012-11-30  4937  		ioc->hba_queue_=
depth =3D
f92363d1235949 Sreekanth Reddy          2012-11-30  4938  				((ioc->reply_=
post_queue_depth - 64) / 2) - 1;
f92363d1235949 Sreekanth Reddy          2012-11-30  4939  		ioc->reply_free=
_queue_depth =3D ioc->hba_queue_depth + 64;
f92363d1235949 Sreekanth Reddy          2012-11-30  4940  	}
f92363d1235949 Sreekanth Reddy          2012-11-30  4941  =

919d8a3f3fef99 Joe Perches              2018-09-17  4942  	dinitprintk(ioc,
919d8a3f3fef99 Joe Perches              2018-09-17  4943  		    ioc_info(io=
c, "scatter gather: sge_in_main_msg(%d), sge_per_chain(%d), sge_per_io(%d),=
 chains_per_io(%d)\n",
919d8a3f3fef99 Joe Perches              2018-09-17  4944  			     ioc->max_=
sges_in_main_message,
919d8a3f3fef99 Joe Perches              2018-09-17  4945  			     ioc->max_=
sges_in_chain_message,
919d8a3f3fef99 Joe Perches              2018-09-17  4946  			     ioc->shos=
t->sg_tablesize,
f92363d1235949 Sreekanth Reddy          2012-11-30  4947  			     ioc->chai=
ns_needed_per_io));
f92363d1235949 Sreekanth Reddy          2012-11-30  4948  =

9b05c91ae7fbff Sreekanth Reddy          2014-09-12  4949  	/* reply post qu=
eue, 16 byte align */
9b05c91ae7fbff Sreekanth Reddy          2014-09-12  4950  	reply_post_free_=
sz =3D ioc->reply_post_queue_depth *
9b05c91ae7fbff Sreekanth Reddy          2014-09-12  4951  	    sizeof(Mpi2D=
efaultReplyDescriptor_t);
9b05c91ae7fbff Sreekanth Reddy          2014-09-12  4952  =

9b05c91ae7fbff Sreekanth Reddy          2014-09-12  4953  	sz =3D reply_pos=
t_free_sz;
9b05c91ae7fbff Sreekanth Reddy          2014-09-12  4954  	if (_base_is_con=
troller_msix_enabled(ioc) && !ioc->rdpq_array_enable)
9b05c91ae7fbff Sreekanth Reddy          2014-09-12  4955  		sz *=3D ioc->re=
ply_queue_count;
9b05c91ae7fbff Sreekanth Reddy          2014-09-12  4956  =

9b05c91ae7fbff Sreekanth Reddy          2014-09-12  4957  	ioc->reply_post =
=3D kcalloc((ioc->rdpq_array_enable) ?
9b05c91ae7fbff Sreekanth Reddy          2014-09-12  4958  	    (ioc->reply_=
queue_count):1,
9b05c91ae7fbff Sreekanth Reddy          2014-09-12  4959  	    sizeof(struc=
t reply_post_struct), GFP_KERNEL);
9b05c91ae7fbff Sreekanth Reddy          2014-09-12  4960  =

9b05c91ae7fbff Sreekanth Reddy          2014-09-12  4961  	if (!ioc->reply_=
post) {
919d8a3f3fef99 Joe Perches              2018-09-17  4962  		ioc_err(ioc, "r=
eply_post_free pool: kcalloc failed\n");
9b05c91ae7fbff Sreekanth Reddy          2014-09-12  4963  		goto out;
9b05c91ae7fbff Sreekanth Reddy          2014-09-12  4964  	}
e9d984182ab8e4 Romain Perier            2017-07-06  4965  	ioc->reply_post_=
free_dma_pool =3D dma_pool_create("reply_post_free pool",
e9d984182ab8e4 Romain Perier            2017-07-06  4966  	    &ioc->pdev->=
dev, sz, 16, 0);
9b05c91ae7fbff Sreekanth Reddy          2014-09-12  4967  	if (!ioc->reply_=
post_free_dma_pool) {
919d8a3f3fef99 Joe Perches              2018-09-17  4968  		ioc_err(ioc, "r=
eply_post_free pool: dma_pool_create failed\n");
9b05c91ae7fbff Sreekanth Reddy          2014-09-12  4969  		goto out;
9b05c91ae7fbff Sreekanth Reddy          2014-09-12  4970  	}
9b05c91ae7fbff Sreekanth Reddy          2014-09-12  4971  	i =3D 0;
9b05c91ae7fbff Sreekanth Reddy          2014-09-12  4972  	do {
9b05c91ae7fbff Sreekanth Reddy          2014-09-12  4973  		ioc->reply_post=
[i].reply_post_free =3D
c39a4d75539393 Souptick Joarder         2018-10-02  4974  		    dma_pool_za=
lloc(ioc->reply_post_free_dma_pool,
9b05c91ae7fbff Sreekanth Reddy          2014-09-12  4975  		    GFP_KERNEL,
9b05c91ae7fbff Sreekanth Reddy          2014-09-12  4976  		    &ioc->reply=
_post[i].reply_post_free_dma);
9b05c91ae7fbff Sreekanth Reddy          2014-09-12  4977  		if (!ioc->reply=
_post[i].reply_post_free) {
919d8a3f3fef99 Joe Perches              2018-09-17  4978  			ioc_err(ioc, "=
reply_post_free pool: dma_pool_alloc failed\n");
9b05c91ae7fbff Sreekanth Reddy          2014-09-12  4979  			goto out;
9b05c91ae7fbff Sreekanth Reddy          2014-09-12  4980  		}
919d8a3f3fef99 Joe Perches              2018-09-17  4981  		dinitprintk(ioc,
919d8a3f3fef99 Joe Perches              2018-09-17  4982  			    ioc_info(i=
oc, "reply post free pool (0x%p): depth(%d), element_size(%d), pool_size(%d=
 kB)\n",
9b05c91ae7fbff Sreekanth Reddy          2014-09-12  4983  				     ioc->rep=
ly_post[i].reply_post_free,
919d8a3f3fef99 Joe Perches              2018-09-17  4984  				     ioc->rep=
ly_post_queue_depth,
919d8a3f3fef99 Joe Perches              2018-09-17  4985  				     8, sz / =
1024));
919d8a3f3fef99 Joe Perches              2018-09-17  4986  		dinitprintk(ioc,
919d8a3f3fef99 Joe Perches              2018-09-17  4987  			    ioc_info(i=
oc, "reply_post_free_dma =3D (0x%llx)\n",
919d8a3f3fef99 Joe Perches              2018-09-17  4988  				     (u64)ioc=
->reply_post[i].reply_post_free_dma));
9b05c91ae7fbff Sreekanth Reddy          2014-09-12  4989  		total_sz +=3D s=
z;
9b05c91ae7fbff Sreekanth Reddy          2014-09-12  4990  	} while (ioc->rd=
pq_array_enable && (++i < ioc->reply_queue_count));
9b05c91ae7fbff Sreekanth Reddy          2014-09-12  4991  =

9b05c91ae7fbff Sreekanth Reddy          2014-09-12  4992  	if (ioc->dma_mas=
k =3D=3D 64) {
9b05c91ae7fbff Sreekanth Reddy          2014-09-12  4993  		if (_base_chang=
e_consistent_dma_mask(ioc, ioc->pdev) !=3D 0) {
919d8a3f3fef99 Joe Perches              2018-09-17  4994  			ioc_warn(ioc, =
"no suitable consistent DMA mask for %s\n",
919d8a3f3fef99 Joe Perches              2018-09-17  4995  				 pci_name(ioc=
->pdev));
9b05c91ae7fbff Sreekanth Reddy          2014-09-12  4996  			goto out;
9b05c91ae7fbff Sreekanth Reddy          2014-09-12  4997  		}
9b05c91ae7fbff Sreekanth Reddy          2014-09-12  4998  	}
9b05c91ae7fbff Sreekanth Reddy          2014-09-12  4999  =

f92363d1235949 Sreekanth Reddy          2012-11-30  5000  	ioc->scsiio_dept=
h =3D ioc->hba_queue_depth -
f92363d1235949 Sreekanth Reddy          2012-11-30  5001  	    ioc->hi_prio=
rity_depth - ioc->internal_depth;
f92363d1235949 Sreekanth Reddy          2012-11-30  5002  =

f92363d1235949 Sreekanth Reddy          2012-11-30  5003  	/* set the scsi =
host can_queue depth
f92363d1235949 Sreekanth Reddy          2012-11-30  5004  	 * with some int=
ernal commands that could be outstanding
f92363d1235949 Sreekanth Reddy          2012-11-30  5005  	 */
fd0331b32826dd Suganath prabu Subramani 2016-01-28  5006  	ioc->shost->can_=
queue =3D ioc->scsiio_depth - INTERNAL_SCSIIO_CMDS_COUNT;
919d8a3f3fef99 Joe Perches              2018-09-17  5007  	dinitprintk(ioc,
919d8a3f3fef99 Joe Perches              2018-09-17  5008  		    ioc_info(io=
c, "scsi host: can_queue depth (%d)\n",
919d8a3f3fef99 Joe Perches              2018-09-17  5009  			     ioc->shos=
t->can_queue));
f92363d1235949 Sreekanth Reddy          2012-11-30  5010  =

f92363d1235949 Sreekanth Reddy          2012-11-30  5011  =

f92363d1235949 Sreekanth Reddy          2012-11-30  5012  	/* contiguous po=
ol for request and chains, 16 byte align, one extra "
f92363d1235949 Sreekanth Reddy          2012-11-30  5013  	 * "frame for sm=
id=3D0
f92363d1235949 Sreekanth Reddy          2012-11-30  5014  	 */
f92363d1235949 Sreekanth Reddy          2012-11-30  5015  	ioc->chain_depth=
 =3D ioc->chains_needed_per_io * ioc->scsiio_depth;
f92363d1235949 Sreekanth Reddy          2012-11-30  5016  	sz =3D ((ioc->sc=
siio_depth + 1) * ioc->request_sz);
f92363d1235949 Sreekanth Reddy          2012-11-30  5017  =

f92363d1235949 Sreekanth Reddy          2012-11-30  5018  	/* hi-priority q=
ueue */
f92363d1235949 Sreekanth Reddy          2012-11-30  5019  	sz +=3D (ioc->hi=
_priority_depth * ioc->request_sz);
f92363d1235949 Sreekanth Reddy          2012-11-30  5020  =

f92363d1235949 Sreekanth Reddy          2012-11-30  5021  	/* internal queu=
e */
f92363d1235949 Sreekanth Reddy          2012-11-30  5022  	sz +=3D (ioc->in=
ternal_depth * ioc->request_sz);
f92363d1235949 Sreekanth Reddy          2012-11-30  5023  =

f92363d1235949 Sreekanth Reddy          2012-11-30  5024  	ioc->request_dma=
_sz =3D sz;
1c2048bdc3f4ff Christoph Hellwig        2018-10-11 @5025  	ioc->request =3D=
 dma_alloc_coherent(&ioc->pdev->dev, sz,
1c2048bdc3f4ff Christoph Hellwig        2018-10-11  5026  			&ioc->request_=
dma, GFP_KERNEL);
f92363d1235949 Sreekanth Reddy          2012-11-30  5027  	if (!ioc->reques=
t) {
1c2048bdc3f4ff Christoph Hellwig        2018-10-11  5028  		ioc_err(ioc, "r=
equest pool: dma_alloc_coherent failed: hba_depth(%d), chains_per_io(%d), f=
rame_sz(%d), total(%d kB)\n",
919d8a3f3fef99 Joe Perches              2018-09-17  5029  			ioc->hba_queue=
_depth, ioc->chains_needed_per_io,
919d8a3f3fef99 Joe Perches              2018-09-17  5030  			ioc->request_s=
z, sz / 1024);
f92363d1235949 Sreekanth Reddy          2012-11-30  5031  		if (ioc->scsiio=
_depth < MPT3SAS_SAS_QUEUE_DEPTH)
f92363d1235949 Sreekanth Reddy          2012-11-30  5032  			goto out;
fd0331b32826dd Suganath prabu Subramani 2016-01-28  5033  		retry_sz =3D 64;
fd0331b32826dd Suganath prabu Subramani 2016-01-28  5034  		ioc->hba_queue_=
depth -=3D retry_sz;
8ff045c92708a5 Suganath prabu Subramani 2016-02-18  5035  		_base_release_m=
emory_pools(ioc);
f92363d1235949 Sreekanth Reddy          2012-11-30  5036  		goto retry_allo=
cation;
f92363d1235949 Sreekanth Reddy          2012-11-30  5037  	}
e224e03b0c6a23 Suganath Prabu           2019-08-03  5038  	memset(ioc->requ=
est, 0, sz);
f92363d1235949 Sreekanth Reddy          2012-11-30  5039  =

f92363d1235949 Sreekanth Reddy          2012-11-30  5040  	if (retry_sz)
1c2048bdc3f4ff Christoph Hellwig        2018-10-11  5041  		ioc_err(ioc, "r=
equest pool: dma_alloc_coherent succeed: hba_depth(%d), chains_per_io(%d), =
frame_sz(%d), total(%d kb)\n",
919d8a3f3fef99 Joe Perches              2018-09-17  5042  			ioc->hba_queue=
_depth, ioc->chains_needed_per_io,
919d8a3f3fef99 Joe Perches              2018-09-17  5043  			ioc->request_s=
z, sz / 1024);
f92363d1235949 Sreekanth Reddy          2012-11-30  5044  =

f92363d1235949 Sreekanth Reddy          2012-11-30  5045  	/* hi-priority q=
ueue */
f92363d1235949 Sreekanth Reddy          2012-11-30  5046  	ioc->hi_priority=
 =3D ioc->request + ((ioc->scsiio_depth + 1) *
f92363d1235949 Sreekanth Reddy          2012-11-30  5047  	    ioc->request=
_sz);
f92363d1235949 Sreekanth Reddy          2012-11-30  5048  	ioc->hi_priority=
_dma =3D ioc->request_dma + ((ioc->scsiio_depth + 1) *
f92363d1235949 Sreekanth Reddy          2012-11-30  5049  	    ioc->request=
_sz);
f92363d1235949 Sreekanth Reddy          2012-11-30  5050  =

f92363d1235949 Sreekanth Reddy          2012-11-30  5051  	/* internal queu=
e */
f92363d1235949 Sreekanth Reddy          2012-11-30  5052  	ioc->internal =
=3D ioc->hi_priority + (ioc->hi_priority_depth *
f92363d1235949 Sreekanth Reddy          2012-11-30  5053  	    ioc->request=
_sz);
f92363d1235949 Sreekanth Reddy          2012-11-30  5054  	ioc->internal_dm=
a =3D ioc->hi_priority_dma + (ioc->hi_priority_depth *
f92363d1235949 Sreekanth Reddy          2012-11-30  5055  	    ioc->request=
_sz);
f92363d1235949 Sreekanth Reddy          2012-11-30  5056  =

919d8a3f3fef99 Joe Perches              2018-09-17  5057  	dinitprintk(ioc,
919d8a3f3fef99 Joe Perches              2018-09-17  5058  		    ioc_info(io=
c, "request pool(0x%p): depth(%d), frame_size(%d), pool_size(%d kB)\n",
919d8a3f3fef99 Joe Perches              2018-09-17  5059  			     ioc->requ=
est, ioc->hba_queue_depth,
919d8a3f3fef99 Joe Perches              2018-09-17  5060  			     ioc->requ=
est_sz,
f92363d1235949 Sreekanth Reddy          2012-11-30  5061  			     (ioc->hba=
_queue_depth * ioc->request_sz) / 1024));
f92363d1235949 Sreekanth Reddy          2012-11-30  5062  =

919d8a3f3fef99 Joe Perches              2018-09-17  5063  	dinitprintk(ioc,
919d8a3f3fef99 Joe Perches              2018-09-17  5064  		    ioc_info(io=
c, "request pool: dma(0x%llx)\n",
919d8a3f3fef99 Joe Perches              2018-09-17  5065  			     (unsigned=
 long long)ioc->request_dma));
f92363d1235949 Sreekanth Reddy          2012-11-30  5066  	total_sz +=3D sz;
f92363d1235949 Sreekanth Reddy          2012-11-30  5067  =

919d8a3f3fef99 Joe Perches              2018-09-17  5068  	dinitprintk(ioc,
919d8a3f3fef99 Joe Perches              2018-09-17  5069  		    ioc_info(io=
c, "scsiio(0x%p): depth(%d)\n",
919d8a3f3fef99 Joe Perches              2018-09-17  5070  			     ioc->requ=
est, ioc->scsiio_depth));
f92363d1235949 Sreekanth Reddy          2012-11-30  5071  =

f92363d1235949 Sreekanth Reddy          2012-11-30  5072  	ioc->chain_depth=
 =3D min_t(u32, ioc->chain_depth, MAX_CHAIN_DEPTH);
93204b782a88f2 Chaitra P B              2018-04-24  5073  	sz =3D ioc->scsi=
io_depth * sizeof(struct chain_lookup);
93204b782a88f2 Chaitra P B              2018-04-24  5074  	ioc->chain_looku=
p =3D kzalloc(sz, GFP_KERNEL);
f92363d1235949 Sreekanth Reddy          2012-11-30  5075  	if (!ioc->chain_=
lookup) {
919d8a3f3fef99 Joe Perches              2018-09-17  5076  		ioc_err(ioc, "c=
hain_lookup: __get_free_pages failed\n");
93204b782a88f2 Chaitra P B              2018-04-24  5077  		goto out;
93204b782a88f2 Chaitra P B              2018-04-24  5078  	}
93204b782a88f2 Chaitra P B              2018-04-24  5079  =

93204b782a88f2 Chaitra P B              2018-04-24  5080  	sz =3D ioc->chai=
ns_needed_per_io * sizeof(struct chain_tracker);
93204b782a88f2 Chaitra P B              2018-04-24  5081  	for (i =3D 0; i =
< ioc->scsiio_depth; i++) {
93204b782a88f2 Chaitra P B              2018-04-24  5082  		ioc->chain_look=
up[i].chains_per_smid =3D kzalloc(sz, GFP_KERNEL);
93204b782a88f2 Chaitra P B              2018-04-24  5083  		if (!ioc->chain=
_lookup[i].chains_per_smid) {
919d8a3f3fef99 Joe Perches              2018-09-17  5084  			ioc_err(ioc, "=
chain_lookup: kzalloc failed\n");
f92363d1235949 Sreekanth Reddy          2012-11-30  5085  			goto out;
f92363d1235949 Sreekanth Reddy          2012-11-30  5086  		}
93204b782a88f2 Chaitra P B              2018-04-24  5087  	}
93204b782a88f2 Chaitra P B              2018-04-24  5088  =

f92363d1235949 Sreekanth Reddy          2012-11-30  5089  	/* initialize hi=
-priority queue smid's */
f92363d1235949 Sreekanth Reddy          2012-11-30  5090  	ioc->hpr_lookup =
=3D kcalloc(ioc->hi_priority_depth,
f92363d1235949 Sreekanth Reddy          2012-11-30  5091  	    sizeof(struc=
t request_tracker), GFP_KERNEL);
f92363d1235949 Sreekanth Reddy          2012-11-30  5092  	if (!ioc->hpr_lo=
okup) {
919d8a3f3fef99 Joe Perches              2018-09-17  5093  		ioc_err(ioc, "h=
pr_lookup: kcalloc failed\n");
f92363d1235949 Sreekanth Reddy          2012-11-30  5094  		goto out;
f92363d1235949 Sreekanth Reddy          2012-11-30  5095  	}
f92363d1235949 Sreekanth Reddy          2012-11-30  5096  	ioc->hi_priority=
_smid =3D ioc->scsiio_depth + 1;
919d8a3f3fef99 Joe Perches              2018-09-17  5097  	dinitprintk(ioc,
919d8a3f3fef99 Joe Perches              2018-09-17  5098  		    ioc_info(io=
c, "hi_priority(0x%p): depth(%d), start smid(%d)\n",
919d8a3f3fef99 Joe Perches              2018-09-17  5099  			     ioc->hi_p=
riority,
f92363d1235949 Sreekanth Reddy          2012-11-30  5100  			     ioc->hi_p=
riority_depth, ioc->hi_priority_smid));
f92363d1235949 Sreekanth Reddy          2012-11-30  5101  =

f92363d1235949 Sreekanth Reddy          2012-11-30  5102  	/* initialize in=
ternal queue smid's */
f92363d1235949 Sreekanth Reddy          2012-11-30  5103  	ioc->internal_lo=
okup =3D kcalloc(ioc->internal_depth,
f92363d1235949 Sreekanth Reddy          2012-11-30  5104  	    sizeof(struc=
t request_tracker), GFP_KERNEL);
f92363d1235949 Sreekanth Reddy          2012-11-30  5105  	if (!ioc->intern=
al_lookup) {
919d8a3f3fef99 Joe Perches              2018-09-17  5106  		ioc_err(ioc, "i=
nternal_lookup: kcalloc failed\n");
f92363d1235949 Sreekanth Reddy          2012-11-30  5107  		goto out;
f92363d1235949 Sreekanth Reddy          2012-11-30  5108  	}
f92363d1235949 Sreekanth Reddy          2012-11-30  5109  	ioc->internal_sm=
id =3D ioc->hi_priority_smid + ioc->hi_priority_depth;
919d8a3f3fef99 Joe Perches              2018-09-17  5110  	dinitprintk(ioc,
919d8a3f3fef99 Joe Perches              2018-09-17  5111  		    ioc_info(io=
c, "internal(0x%p): depth(%d), start smid(%d)\n",
919d8a3f3fef99 Joe Perches              2018-09-17  5112  			     ioc->inte=
rnal,
f92363d1235949 Sreekanth Reddy          2012-11-30  5113  			     ioc->inte=
rnal_depth, ioc->internal_smid));
016d5c35e27824 Suganath Prabu Subramani 2017-10-31  5114  	/*
016d5c35e27824 Suganath Prabu Subramani 2017-10-31  5115  	 * The number of=
 NVMe page sized blocks needed is:
016d5c35e27824 Suganath Prabu Subramani 2017-10-31  5116  	 *     (((sg_tab=
lesize * 8) - 1) / (page_size - 8)) + 1
016d5c35e27824 Suganath Prabu Subramani 2017-10-31  5117  	 * ((sg_tablesiz=
e * 8) - 1) is the max PRP's minus the first PRP entry
016d5c35e27824 Suganath Prabu Subramani 2017-10-31  5118  	 * that is place=
d in the main message frame.  8 is the size of each PRP
016d5c35e27824 Suganath Prabu Subramani 2017-10-31  5119  	 * entry or PRP =
list pointer entry.  8 is subtracted from page_size
016d5c35e27824 Suganath Prabu Subramani 2017-10-31  5120  	 * because of th=
e PRP list pointer entry at the end of a page, so this
016d5c35e27824 Suganath Prabu Subramani 2017-10-31  5121  	 * is not counte=
d as a PRP entry.  The 1 added page is a round up.
016d5c35e27824 Suganath Prabu Subramani 2017-10-31  5122  	 *
016d5c35e27824 Suganath Prabu Subramani 2017-10-31  5123  	 * To avoid allo=
cation failures due to the amount of memory that could
016d5c35e27824 Suganath Prabu Subramani 2017-10-31  5124  	 * be required f=
or NVMe PRP's, only each set of NVMe blocks will be
016d5c35e27824 Suganath Prabu Subramani 2017-10-31  5125  	 * contiguous, s=
o a new set is allocated for each possible I/O.
016d5c35e27824 Suganath Prabu Subramani 2017-10-31  5126  	 */
74522a92bbf003 Chaitra P B              2018-04-24  5127  	ioc->chains_per_=
prp_buffer =3D 0;
016d5c35e27824 Suganath Prabu Subramani 2017-10-31  5128  	if (ioc->facts.P=
rotocolFlags & MPI2_IOCFACTS_PROTOCOL_NVME_DEVICES) {
016d5c35e27824 Suganath Prabu Subramani 2017-10-31  5129  		nvme_blocks_nee=
ded =3D
016d5c35e27824 Suganath Prabu Subramani 2017-10-31  5130  			(ioc->shost->s=
g_tablesize * NVME_PRP_SIZE) - 1;
016d5c35e27824 Suganath Prabu Subramani 2017-10-31  5131  		nvme_blocks_nee=
ded /=3D (ioc->page_size - NVME_PRP_SIZE);
016d5c35e27824 Suganath Prabu Subramani 2017-10-31  5132  		nvme_blocks_nee=
ded++;
016d5c35e27824 Suganath Prabu Subramani 2017-10-31  5133  =

dbec4c9040edc1 Suganath Prabu Subramani 2018-01-04  5134  		sz =3D sizeof(s=
truct pcie_sg_list) * ioc->scsiio_depth;
dbec4c9040edc1 Suganath Prabu Subramani 2018-01-04  5135  		ioc->pcie_sg_lo=
okup =3D kzalloc(sz, GFP_KERNEL);
dbec4c9040edc1 Suganath Prabu Subramani 2018-01-04  5136  		if (!ioc->pcie_=
sg_lookup) {
919d8a3f3fef99 Joe Perches              2018-09-17  5137  			ioc_info(ioc, =
"PCIe SGL lookup: kzalloc failed\n");
dbec4c9040edc1 Suganath Prabu Subramani 2018-01-04  5138  			goto out;
dbec4c9040edc1 Suganath Prabu Subramani 2018-01-04  5139  		}
016d5c35e27824 Suganath Prabu Subramani 2017-10-31  5140  		sz =3D nvme_blo=
cks_needed * ioc->page_size;
016d5c35e27824 Suganath Prabu Subramani 2017-10-31  5141  		ioc->pcie_sgl_d=
ma_pool =3D
13a0640525367c Romain Perier            2017-11-20  5142  			dma_pool_creat=
e("PCIe SGL pool", &ioc->pdev->dev, sz, 16, 0);
016d5c35e27824 Suganath Prabu Subramani 2017-10-31  5143  		if (!ioc->pcie_=
sgl_dma_pool) {
919d8a3f3fef99 Joe Perches              2018-09-17  5144  			ioc_info(ioc, =
"PCIe SGL pool: dma_pool_create failed\n");
016d5c35e27824 Suganath Prabu Subramani 2017-10-31  5145  			goto out;
016d5c35e27824 Suganath Prabu Subramani 2017-10-31  5146  		}
74522a92bbf003 Chaitra P B              2018-04-24  5147  =

74522a92bbf003 Chaitra P B              2018-04-24  5148  		ioc->chains_per=
_prp_buffer =3D sz/ioc->chain_segment_sz;
74522a92bbf003 Chaitra P B              2018-04-24  5149  		ioc->chains_per=
_prp_buffer =3D min(ioc->chains_per_prp_buffer,
74522a92bbf003 Chaitra P B              2018-04-24  5150  						ioc->chains=
_needed_per_io);
74522a92bbf003 Chaitra P B              2018-04-24  5151  =

016d5c35e27824 Suganath Prabu Subramani 2017-10-31  5152  		for (i =3D 0; i=
 < ioc->scsiio_depth; i++) {
dbec4c9040edc1 Suganath Prabu Subramani 2018-01-04  5153  			ioc->pcie_sg_l=
ookup[i].pcie_sgl =3D dma_pool_alloc(
dbec4c9040edc1 Suganath Prabu Subramani 2018-01-04  5154  				ioc->pcie_sgl=
_dma_pool, GFP_KERNEL,
dbec4c9040edc1 Suganath Prabu Subramani 2018-01-04  5155  				&ioc->pcie_sg=
_lookup[i].pcie_sgl_dma);
dbec4c9040edc1 Suganath Prabu Subramani 2018-01-04  5156  			if (!ioc->pcie=
_sg_lookup[i].pcie_sgl) {
919d8a3f3fef99 Joe Perches              2018-09-17  5157  				ioc_info(ioc,=
 "PCIe SGL pool: dma_pool_alloc failed\n");
016d5c35e27824 Suganath Prabu Subramani 2017-10-31  5158  				goto out;
016d5c35e27824 Suganath Prabu Subramani 2017-10-31  5159  			}
74522a92bbf003 Chaitra P B              2018-04-24  5160  			for (j =3D 0; =
j < ioc->chains_per_prp_buffer; j++) {
74522a92bbf003 Chaitra P B              2018-04-24  5161  				ct =3D &ioc->=
chain_lookup[i].chains_per_smid[j];
74522a92bbf003 Chaitra P B              2018-04-24  5162  				ct->chain_buf=
fer =3D
74522a92bbf003 Chaitra P B              2018-04-24  5163  				    ioc->pcie=
_sg_lookup[i].pcie_sgl +
74522a92bbf003 Chaitra P B              2018-04-24  5164  				    (j * ioc-=
>chain_segment_sz);
74522a92bbf003 Chaitra P B              2018-04-24  5165  				ct->chain_buf=
fer_dma =3D
74522a92bbf003 Chaitra P B              2018-04-24  5166  				    ioc->pcie=
_sg_lookup[i].pcie_sgl_dma +
74522a92bbf003 Chaitra P B              2018-04-24  5167  				    (j * ioc-=
>chain_segment_sz);
74522a92bbf003 Chaitra P B              2018-04-24  5168  			}
016d5c35e27824 Suganath Prabu Subramani 2017-10-31  5169  		}
f92363d1235949 Sreekanth Reddy          2012-11-30  5170  =

919d8a3f3fef99 Joe Perches              2018-09-17  5171  		dinitprintk(ioc,
919d8a3f3fef99 Joe Perches              2018-09-17  5172  			    ioc_info(i=
oc, "PCIe sgl pool depth(%d), element_size(%d), pool_size(%d kB)\n",
919d8a3f3fef99 Joe Perches              2018-09-17  5173  				     ioc->scs=
iio_depth, sz,
919d8a3f3fef99 Joe Perches              2018-09-17  5174  				     (sz * io=
c->scsiio_depth) / 1024));
919d8a3f3fef99 Joe Perches              2018-09-17  5175  		dinitprintk(ioc,
919d8a3f3fef99 Joe Perches              2018-09-17  5176  			    ioc_info(i=
oc, "Number of chains can fit in a PRP page(%d)\n",
74522a92bbf003 Chaitra P B              2018-04-24  5177  				     ioc->cha=
ins_per_prp_buffer));
016d5c35e27824 Suganath Prabu Subramani 2017-10-31  5178  		total_sz +=3D s=
z * ioc->scsiio_depth;
016d5c35e27824 Suganath Prabu Subramani 2017-10-31  5179  	}
74522a92bbf003 Chaitra P B              2018-04-24  5180  =

74522a92bbf003 Chaitra P B              2018-04-24  5181  	ioc->chain_dma_p=
ool =3D dma_pool_create("chain pool", &ioc->pdev->dev,
74522a92bbf003 Chaitra P B              2018-04-24  5182  	    ioc->chain_s=
egment_sz, 16, 0);
74522a92bbf003 Chaitra P B              2018-04-24  5183  	if (!ioc->chain_=
dma_pool) {
919d8a3f3fef99 Joe Perches              2018-09-17  5184  		ioc_err(ioc, "c=
hain_dma_pool: dma_pool_create failed\n");
74522a92bbf003 Chaitra P B              2018-04-24  5185  		goto out;
74522a92bbf003 Chaitra P B              2018-04-24  5186  	}
74522a92bbf003 Chaitra P B              2018-04-24  5187  	for (i =3D 0; i =
< ioc->scsiio_depth; i++) {
74522a92bbf003 Chaitra P B              2018-04-24  5188  		for (j =3D ioc-=
>chains_per_prp_buffer;
74522a92bbf003 Chaitra P B              2018-04-24  5189  				j < ioc->chai=
ns_needed_per_io; j++) {
74522a92bbf003 Chaitra P B              2018-04-24  5190  			ct =3D &ioc->c=
hain_lookup[i].chains_per_smid[j];
74522a92bbf003 Chaitra P B              2018-04-24  5191  			ct->chain_buff=
er =3D dma_pool_alloc(
74522a92bbf003 Chaitra P B              2018-04-24  5192  					ioc->chain_d=
ma_pool, GFP_KERNEL,
74522a92bbf003 Chaitra P B              2018-04-24  5193  					&ct->chain_b=
uffer_dma);
74522a92bbf003 Chaitra P B              2018-04-24  5194  			if (!ct->chain=
_buffer) {
919d8a3f3fef99 Joe Perches              2018-09-17  5195  				ioc_err(ioc, =
"chain_lookup: pci_pool_alloc failed\n");
74522a92bbf003 Chaitra P B              2018-04-24  5196  				_base_release=
_memory_pools(ioc);
74522a92bbf003 Chaitra P B              2018-04-24  5197  				goto out;
74522a92bbf003 Chaitra P B              2018-04-24  5198  			}
74522a92bbf003 Chaitra P B              2018-04-24  5199  		}
74522a92bbf003 Chaitra P B              2018-04-24  5200  		total_sz +=3D i=
oc->chain_segment_sz;
74522a92bbf003 Chaitra P B              2018-04-24  5201  	}
74522a92bbf003 Chaitra P B              2018-04-24  5202  =

919d8a3f3fef99 Joe Perches              2018-09-17  5203  	dinitprintk(ioc,
919d8a3f3fef99 Joe Perches              2018-09-17  5204  		    ioc_info(io=
c, "chain pool depth(%d), frame_size(%d), pool_size(%d kB)\n",
919d8a3f3fef99 Joe Perches              2018-09-17  5205  			     ioc->chai=
n_depth, ioc->chain_segment_sz,
919d8a3f3fef99 Joe Perches              2018-09-17  5206  			     (ioc->cha=
in_depth * ioc->chain_segment_sz) / 1024));
74522a92bbf003 Chaitra P B              2018-04-24  5207  =

f92363d1235949 Sreekanth Reddy          2012-11-30  5208  	/* sense buffers=
, 4 byte align */
f92363d1235949 Sreekanth Reddy          2012-11-30  5209  	sz =3D ioc->scsi=
io_depth * SCSI_SENSE_BUFFERSIZE;
e9d984182ab8e4 Romain Perier            2017-07-06  5210  	ioc->sense_dma_p=
ool =3D dma_pool_create("sense pool", &ioc->pdev->dev, sz,
e9d984182ab8e4 Romain Perier            2017-07-06  5211  					      4, 0);
f92363d1235949 Sreekanth Reddy          2012-11-30  5212  	if (!ioc->sense_=
dma_pool) {
919d8a3f3fef99 Joe Perches              2018-09-17  5213  		ioc_err(ioc, "s=
ense pool: dma_pool_create failed\n");
f92363d1235949 Sreekanth Reddy          2012-11-30  5214  		goto out;
f92363d1235949 Sreekanth Reddy          2012-11-30  5215  	}
e9d984182ab8e4 Romain Perier            2017-07-06  5216  	ioc->sense =3D d=
ma_pool_alloc(ioc->sense_dma_pool, GFP_KERNEL,
f92363d1235949 Sreekanth Reddy          2012-11-30  5217  	    &ioc->sense_=
dma);
f92363d1235949 Sreekanth Reddy          2012-11-30  5218  	if (!ioc->sense)=
 {
919d8a3f3fef99 Joe Perches              2018-09-17  5219  		ioc_err(ioc, "s=
ense pool: dma_pool_alloc failed\n");
f92363d1235949 Sreekanth Reddy          2012-11-30  5220  		goto out;
f92363d1235949 Sreekanth Reddy          2012-11-30  5221  	}
e21fef6f331b39 Chaitra P B              2018-04-24  5222  	/* sense buffer =
requires to be in same 4 gb region.
e21fef6f331b39 Chaitra P B              2018-04-24  5223  	 * Below functio=
n will check the same.
e21fef6f331b39 Chaitra P B              2018-04-24  5224  	 * In case of fa=
ilure, new pci pool will be created with updated
e21fef6f331b39 Chaitra P B              2018-04-24  5225  	 * alignment. Ol=
der allocation and pool will be destroyed.
e21fef6f331b39 Chaitra P B              2018-04-24  5226  	 * Alignment wil=
l be used such a way that next allocation if
e21fef6f331b39 Chaitra P B              2018-04-24  5227  	 * success, will=
 always meet same 4gb region requirement.
e21fef6f331b39 Chaitra P B              2018-04-24  5228  	 * Actual requir=
ement is not alignment, but we need start and end of
e21fef6f331b39 Chaitra P B              2018-04-24  5229  	 * DMA address m=
ust have same upper 32 bit address.
e21fef6f331b39 Chaitra P B              2018-04-24  5230  	 */
e21fef6f331b39 Chaitra P B              2018-04-24  5231  	if (!is_MSB_are_=
same((long)ioc->sense, sz)) {
e21fef6f331b39 Chaitra P B              2018-04-24  5232  		//Release Sense=
 pool & Reallocate
e21fef6f331b39 Chaitra P B              2018-04-24  5233  		dma_pool_free(i=
oc->sense_dma_pool, ioc->sense, ioc->sense_dma);
e21fef6f331b39 Chaitra P B              2018-04-24  5234  		dma_pool_destro=
y(ioc->sense_dma_pool);
e21fef6f331b39 Chaitra P B              2018-04-24  5235  		ioc->sense =3D =
NULL;
e21fef6f331b39 Chaitra P B              2018-04-24  5236  =

e21fef6f331b39 Chaitra P B              2018-04-24  5237  		ioc->sense_dma_=
pool =3D
e21fef6f331b39 Chaitra P B              2018-04-24  5238  			dma_pool_creat=
e("sense pool", &ioc->pdev->dev, sz,
e21fef6f331b39 Chaitra P B              2018-04-24  5239  						roundup_pow=
_of_two(sz), 0);
e21fef6f331b39 Chaitra P B              2018-04-24  5240  		if (!ioc->sense=
_dma_pool) {
919d8a3f3fef99 Joe Perches              2018-09-17  5241  			ioc_err(ioc, "=
sense pool: pci_pool_create failed\n");
e21fef6f331b39 Chaitra P B              2018-04-24  5242  			goto out;
e21fef6f331b39 Chaitra P B              2018-04-24  5243  		}
e21fef6f331b39 Chaitra P B              2018-04-24  5244  		ioc->sense =3D =
dma_pool_alloc(ioc->sense_dma_pool, GFP_KERNEL,
e21fef6f331b39 Chaitra P B              2018-04-24  5245  				&ioc->sense_d=
ma);
e21fef6f331b39 Chaitra P B              2018-04-24  5246  		if (!ioc->sense=
) {
919d8a3f3fef99 Joe Perches              2018-09-17  5247  			ioc_err(ioc, "=
sense pool: pci_pool_alloc failed\n");
e21fef6f331b39 Chaitra P B              2018-04-24  5248  			goto out;
e21fef6f331b39 Chaitra P B              2018-04-24  5249  		}
e21fef6f331b39 Chaitra P B              2018-04-24  5250  	}
919d8a3f3fef99 Joe Perches              2018-09-17  5251  	dinitprintk(ioc,
919d8a3f3fef99 Joe Perches              2018-09-17  5252  		    ioc_info(io=
c, "sense pool(0x%p): depth(%d), element_size(%d), pool_size(%d kB)\n",
919d8a3f3fef99 Joe Perches              2018-09-17  5253  			     ioc->sens=
e, ioc->scsiio_depth,
f92363d1235949 Sreekanth Reddy          2012-11-30  5254  			     SCSI_SENS=
E_BUFFERSIZE, sz / 1024));
919d8a3f3fef99 Joe Perches              2018-09-17  5255  	dinitprintk(ioc,
919d8a3f3fef99 Joe Perches              2018-09-17  5256  		    ioc_info(io=
c, "sense_dma(0x%llx)\n",
919d8a3f3fef99 Joe Perches              2018-09-17  5257  			     (unsigned=
 long long)ioc->sense_dma));
f92363d1235949 Sreekanth Reddy          2012-11-30  5258  	total_sz +=3D sz;
f92363d1235949 Sreekanth Reddy          2012-11-30  5259  =

f92363d1235949 Sreekanth Reddy          2012-11-30  5260  	/* reply pool, 4=
 byte align */
f92363d1235949 Sreekanth Reddy          2012-11-30  5261  	sz =3D ioc->repl=
y_free_queue_depth * ioc->reply_sz;
e9d984182ab8e4 Romain Perier            2017-07-06  5262  	ioc->reply_dma_p=
ool =3D dma_pool_create("reply pool", &ioc->pdev->dev, sz,
e9d984182ab8e4 Romain Perier            2017-07-06  5263  					      4, 0);
f92363d1235949 Sreekanth Reddy          2012-11-30  5264  	if (!ioc->reply_=
dma_pool) {
919d8a3f3fef99 Joe Perches              2018-09-17  5265  		ioc_err(ioc, "r=
eply pool: dma_pool_create failed\n");
f92363d1235949 Sreekanth Reddy          2012-11-30  5266  		goto out;
f92363d1235949 Sreekanth Reddy          2012-11-30  5267  	}
e9d984182ab8e4 Romain Perier            2017-07-06  5268  	ioc->reply =3D d=
ma_pool_alloc(ioc->reply_dma_pool, GFP_KERNEL,
f92363d1235949 Sreekanth Reddy          2012-11-30  5269  	    &ioc->reply_=
dma);
f92363d1235949 Sreekanth Reddy          2012-11-30  5270  	if (!ioc->reply)=
 {
919d8a3f3fef99 Joe Perches              2018-09-17  5271  		ioc_err(ioc, "r=
eply pool: dma_pool_alloc failed\n");
f92363d1235949 Sreekanth Reddy          2012-11-30  5272  		goto out;
f92363d1235949 Sreekanth Reddy          2012-11-30  5273  	}
f92363d1235949 Sreekanth Reddy          2012-11-30  5274  	ioc->reply_dma_m=
in_address =3D (u32)(ioc->reply_dma);
f92363d1235949 Sreekanth Reddy          2012-11-30  5275  	ioc->reply_dma_m=
ax_address =3D (u32)(ioc->reply_dma) + sz;
919d8a3f3fef99 Joe Perches              2018-09-17  5276  	dinitprintk(ioc,
919d8a3f3fef99 Joe Perches              2018-09-17  5277  		    ioc_info(io=
c, "reply pool(0x%p): depth(%d), frame_size(%d), pool_size(%d kB)\n",
919d8a3f3fef99 Joe Perches              2018-09-17  5278  			     ioc->repl=
y, ioc->reply_free_queue_depth,
919d8a3f3fef99 Joe Perches              2018-09-17  5279  			     ioc->repl=
y_sz, sz / 1024));
919d8a3f3fef99 Joe Perches              2018-09-17  5280  	dinitprintk(ioc,
919d8a3f3fef99 Joe Perches              2018-09-17  5281  		    ioc_info(io=
c, "reply_dma(0x%llx)\n",
919d8a3f3fef99 Joe Perches              2018-09-17  5282  			     (unsigned=
 long long)ioc->reply_dma));
f92363d1235949 Sreekanth Reddy          2012-11-30  5283  	total_sz +=3D sz;
f92363d1235949 Sreekanth Reddy          2012-11-30  5284  =

f92363d1235949 Sreekanth Reddy          2012-11-30  5285  	/* reply free qu=
eue, 16 byte align */
f92363d1235949 Sreekanth Reddy          2012-11-30  5286  	sz =3D ioc->repl=
y_free_queue_depth * 4;
e9d984182ab8e4 Romain Perier            2017-07-06  5287  	ioc->reply_free_=
dma_pool =3D dma_pool_create("reply_free pool",
e9d984182ab8e4 Romain Perier            2017-07-06  5288  	    &ioc->pdev->=
dev, sz, 16, 0);
f92363d1235949 Sreekanth Reddy          2012-11-30  5289  	if (!ioc->reply_=
free_dma_pool) {
919d8a3f3fef99 Joe Perches              2018-09-17  5290  		ioc_err(ioc, "r=
eply_free pool: dma_pool_create failed\n");
f92363d1235949 Sreekanth Reddy          2012-11-30  5291  		goto out;
f92363d1235949 Sreekanth Reddy          2012-11-30  5292  	}
c39a4d75539393 Souptick Joarder         2018-10-02  5293  	ioc->reply_free =
=3D dma_pool_zalloc(ioc->reply_free_dma_pool, GFP_KERNEL,
f92363d1235949 Sreekanth Reddy          2012-11-30  5294  	    &ioc->reply_=
free_dma);
f92363d1235949 Sreekanth Reddy          2012-11-30  5295  	if (!ioc->reply_=
free) {
919d8a3f3fef99 Joe Perches              2018-09-17  5296  		ioc_err(ioc, "r=
eply_free pool: dma_pool_alloc failed\n");
f92363d1235949 Sreekanth Reddy          2012-11-30  5297  		goto out;
f92363d1235949 Sreekanth Reddy          2012-11-30  5298  	}
919d8a3f3fef99 Joe Perches              2018-09-17  5299  	dinitprintk(ioc,
919d8a3f3fef99 Joe Perches              2018-09-17  5300  		    ioc_info(io=
c, "reply_free pool(0x%p): depth(%d), element_size(%d), pool_size(%d kB)\n",
919d8a3f3fef99 Joe Perches              2018-09-17  5301  			     ioc->repl=
y_free, ioc->reply_free_queue_depth,
919d8a3f3fef99 Joe Perches              2018-09-17  5302  			     4, sz / 1=
024));
919d8a3f3fef99 Joe Perches              2018-09-17  5303  	dinitprintk(ioc,
919d8a3f3fef99 Joe Perches              2018-09-17  5304  		    ioc_info(io=
c, "reply_free_dma (0x%llx)\n",
919d8a3f3fef99 Joe Perches              2018-09-17  5305  			     (unsigned=
 long long)ioc->reply_free_dma));
f92363d1235949 Sreekanth Reddy          2012-11-30  5306  	total_sz +=3D sz;
f92363d1235949 Sreekanth Reddy          2012-11-30  5307  =

cd33223b59a493 Chaitra P B              2018-04-24  5308  	if (ioc->rdpq_ar=
ray_enable) {
cd33223b59a493 Chaitra P B              2018-04-24  5309  		reply_post_free=
_array_sz =3D ioc->reply_queue_count *
cd33223b59a493 Chaitra P B              2018-04-24  5310  		    sizeof(Mpi2=
IOCInitRDPQArrayEntry);
cd33223b59a493 Chaitra P B              2018-04-24  5311  		ioc->reply_post=
_free_array_dma_pool =3D
cd33223b59a493 Chaitra P B              2018-04-24  5312  		    dma_pool_cr=
eate("reply_post_free_array pool",
cd33223b59a493 Chaitra P B              2018-04-24  5313  		    &ioc->pdev-=
>dev, reply_post_free_array_sz, 16, 0);
cd33223b59a493 Chaitra P B              2018-04-24  5314  		if (!ioc->reply=
_post_free_array_dma_pool) {
cd33223b59a493 Chaitra P B              2018-04-24  5315  			dinitprintk(io=
c,
919d8a3f3fef99 Joe Perches              2018-09-17  5316  				    ioc_info(=
ioc, "reply_post_free_array pool: dma_pool_create failed\n"));
cd33223b59a493 Chaitra P B              2018-04-24  5317  			goto out;
cd33223b59a493 Chaitra P B              2018-04-24  5318  		}
cd33223b59a493 Chaitra P B              2018-04-24  5319  		ioc->reply_post=
_free_array =3D
cd33223b59a493 Chaitra P B              2018-04-24  5320  		    dma_pool_al=
loc(ioc->reply_post_free_array_dma_pool,
cd33223b59a493 Chaitra P B              2018-04-24  5321  		    GFP_KERNEL,=
 &ioc->reply_post_free_array_dma);
cd33223b59a493 Chaitra P B              2018-04-24  5322  		if (!ioc->reply=
_post_free_array) {
cd33223b59a493 Chaitra P B              2018-04-24  5323  			dinitprintk(io=
c,
919d8a3f3fef99 Joe Perches              2018-09-17  5324  				    ioc_info(=
ioc, "reply_post_free_array pool: dma_pool_alloc failed\n"));
cd33223b59a493 Chaitra P B              2018-04-24  5325  			goto out;
cd33223b59a493 Chaitra P B              2018-04-24  5326  		}
cd33223b59a493 Chaitra P B              2018-04-24  5327  	}
f92363d1235949 Sreekanth Reddy          2012-11-30  5328  	ioc->config_page=
_sz =3D 512;
1c2048bdc3f4ff Christoph Hellwig        2018-10-11  5329  	ioc->config_page=
 =3D dma_alloc_coherent(&ioc->pdev->dev,
1c2048bdc3f4ff Christoph Hellwig        2018-10-11  5330  			ioc->config_pa=
ge_sz, &ioc->config_page_dma, GFP_KERNEL);
f92363d1235949 Sreekanth Reddy          2012-11-30  5331  	if (!ioc->config=
_page) {
919d8a3f3fef99 Joe Perches              2018-09-17  5332  		ioc_err(ioc, "c=
onfig page: dma_pool_alloc failed\n");
f92363d1235949 Sreekanth Reddy          2012-11-30  5333  		goto out;
f92363d1235949 Sreekanth Reddy          2012-11-30  5334  	}
919d8a3f3fef99 Joe Perches              2018-09-17  5335  	dinitprintk(ioc,
919d8a3f3fef99 Joe Perches              2018-09-17  5336  		    ioc_info(io=
c, "config page(0x%p): size(%d)\n",
919d8a3f3fef99 Joe Perches              2018-09-17  5337  			     ioc->conf=
ig_page, ioc->config_page_sz));
919d8a3f3fef99 Joe Perches              2018-09-17  5338  	dinitprintk(ioc,
919d8a3f3fef99 Joe Perches              2018-09-17  5339  		    ioc_info(io=
c, "config_page_dma(0x%llx)\n",
919d8a3f3fef99 Joe Perches              2018-09-17  5340  			     (unsigned=
 long long)ioc->config_page_dma));
f92363d1235949 Sreekanth Reddy          2012-11-30  5341  	total_sz +=3D io=
c->config_page_sz;
f92363d1235949 Sreekanth Reddy          2012-11-30  5342  =

919d8a3f3fef99 Joe Perches              2018-09-17  5343  	ioc_info(ioc, "A=
llocated physical memory: size(%d kB)\n",
919d8a3f3fef99 Joe Perches              2018-09-17  5344  		 total_sz / 102=
4);
919d8a3f3fef99 Joe Perches              2018-09-17  5345  	ioc_info(ioc, "C=
urrent Controller Queue Depth(%d),Max Controller Queue Depth(%d)\n",
919d8a3f3fef99 Joe Perches              2018-09-17  5346  		 ioc->shost->ca=
n_queue, facts->RequestCredit);
919d8a3f3fef99 Joe Perches              2018-09-17  5347  	ioc_info(ioc, "S=
catter Gather Elements per IO(%d)\n",
919d8a3f3fef99 Joe Perches              2018-09-17  5348  		 ioc->shost->sg=
_tablesize);
f92363d1235949 Sreekanth Reddy          2012-11-30  5349  	return 0;
f92363d1235949 Sreekanth Reddy          2012-11-30  5350  =

f92363d1235949 Sreekanth Reddy          2012-11-30  5351   out:
f92363d1235949 Sreekanth Reddy          2012-11-30  5352  	return -ENOMEM;
f92363d1235949 Sreekanth Reddy          2012-11-30  5353  }
f92363d1235949 Sreekanth Reddy          2012-11-30  5354  =


:::::: The code at line 5025 was first introduced by commit
:::::: 1c2048bdc3f4ff3337613c27519cf608916e95a9 scsi: mpt3sas: switch to ge=
neric DMA API

:::::: TO: Christoph Hellwig <hch@lst.de>
:::::: CC: Martin K. Petersen <martin.petersen@oracle.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============4206839634111278749==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
cCT9AQA=
--===============4206839634111278749==--

