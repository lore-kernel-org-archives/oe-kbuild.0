Content-Type: multipart/mixed; boundary="===============3866092692912892556=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/marvell/octeontx2/af/rvu_nix.c:4377:17: warning: Uninitialized variable: qidx [uninitvar]
Date: Mon, 26 Jul 2021 06:29:46 +0800
Message-ID: <202107260631.mDAGiOAO-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3866092692912892556==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Sunil Goutham <sgoutham@marvell.com>
CC: Subbaraya Sundeep <sbhatta@marvell.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   d8079fac168168b25677dc16c00ffaf9fb7df723
commit: e8e095b3b37004a4048af69de60c9af2d2268a1d octeontx2-af: cn10k: Bandw=
idth profiles config support
date:   6 weeks ago
:::::: branch date: 22 hours ago
:::::: commit date: 6 weeks ago
compiler: s390-linux-gcc (GCC) 10.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   drivers/net/ethernet/marvell/octeontx2/af/rvu_nix.c:2391:3: warning: Add=
ress of local auto-variable assigned to a function parameter. [autoVariable=
s]
     *mce_list =3D &pfvf->bcast_mce_list;
     ^
   drivers/net/ethernet/marvell/octeontx2/af/rvu_nix.c:2394:3: warning: Add=
ress of local auto-variable assigned to a function parameter. [autoVariable=
s]
     *mce_list =3D &pfvf->mcast_mce_list;
     ^
   drivers/net/ethernet/marvell/octeontx2/af/rvu_nix.c:2397:3: warning: Add=
ress of local auto-variable assigned to a function parameter. [autoVariable=
s]
     *mce_list =3D &pfvf->promisc_mce_list;
     ^
>> drivers/net/ethernet/marvell/octeontx2/af/rvu_nix.c:4377:17: warning: Un=
initialized variable: qidx [uninitvar]
    aq_req->qidx =3D qidx;
                   ^
>> drivers/net/ethernet/marvell/octeontx2/af/rvu_nix.c:4460:29: warning: Un=
initialized variable: leaf_match [uninitvar]
        NIX_AQ_CTYPE_BANDPROF, leaf_match);
                               ^

vim +4377 drivers/net/ethernet/marvell/octeontx2/af/rvu_nix.c

e8e095b3b37004 Sunil Goutham 2021-06-15  4367  =

e8e095b3b37004 Sunil Goutham 2021-06-15  4368  static int nix_aq_context_re=
ad(struct rvu *rvu, struct nix_hw *nix_hw,
e8e095b3b37004 Sunil Goutham 2021-06-15  4369  			       struct nix_cn10k_a=
q_enq_req *aq_req,
e8e095b3b37004 Sunil Goutham 2021-06-15  4370  			       struct nix_cn10k_a=
q_enq_rsp *aq_rsp,
e8e095b3b37004 Sunil Goutham 2021-06-15  4371  			       u16 pcifunc, u8 ct=
ype, u32 qidx)
e8e095b3b37004 Sunil Goutham 2021-06-15  4372  {
e8e095b3b37004 Sunil Goutham 2021-06-15  4373  	memset(aq_req, 0, sizeof(st=
ruct nix_cn10k_aq_enq_req));
e8e095b3b37004 Sunil Goutham 2021-06-15  4374  	aq_req->hdr.pcifunc =3D pci=
func;
e8e095b3b37004 Sunil Goutham 2021-06-15  4375  	aq_req->ctype =3D ctype;
e8e095b3b37004 Sunil Goutham 2021-06-15  4376  	aq_req->op =3D NIX_AQ_INSTO=
P_READ;
e8e095b3b37004 Sunil Goutham 2021-06-15 @4377  	aq_req->qidx =3D qidx;
e8e095b3b37004 Sunil Goutham 2021-06-15  4378  =

e8e095b3b37004 Sunil Goutham 2021-06-15  4379  	return rvu_nix_blk_aq_enq_i=
nst(rvu, nix_hw,
e8e095b3b37004 Sunil Goutham 2021-06-15  4380  				       (struct nix_aq_en=
q_req *)aq_req,
e8e095b3b37004 Sunil Goutham 2021-06-15  4381  				       (struct nix_aq_en=
q_rsp *)aq_rsp);
e8e095b3b37004 Sunil Goutham 2021-06-15  4382  }
e8e095b3b37004 Sunil Goutham 2021-06-15  4383  =

e8e095b3b37004 Sunil Goutham 2021-06-15  4384  static int nix_ipolicer_map_=
leaf_midprofs(struct rvu *rvu,
e8e095b3b37004 Sunil Goutham 2021-06-15  4385  					  struct nix_hw *nix_hw,
e8e095b3b37004 Sunil Goutham 2021-06-15  4386  					  struct nix_cn10k_aq_e=
nq_req *aq_req,
e8e095b3b37004 Sunil Goutham 2021-06-15  4387  					  struct nix_cn10k_aq_e=
nq_rsp *aq_rsp,
e8e095b3b37004 Sunil Goutham 2021-06-15  4388  					  u32 leaf_prof, u16 mi=
d_prof)
e8e095b3b37004 Sunil Goutham 2021-06-15  4389  {
e8e095b3b37004 Sunil Goutham 2021-06-15  4390  	memset(aq_req, 0, sizeof(st=
ruct nix_cn10k_aq_enq_req));
e8e095b3b37004 Sunil Goutham 2021-06-15  4391  	aq_req->hdr.pcifunc =3D 0x0=
0;
e8e095b3b37004 Sunil Goutham 2021-06-15  4392  	aq_req->ctype =3D NIX_AQ_CT=
YPE_BANDPROF;
e8e095b3b37004 Sunil Goutham 2021-06-15  4393  	aq_req->op =3D NIX_AQ_INSTO=
P_WRITE;
e8e095b3b37004 Sunil Goutham 2021-06-15  4394  	aq_req->qidx =3D leaf_prof;
e8e095b3b37004 Sunil Goutham 2021-06-15  4395  =

e8e095b3b37004 Sunil Goutham 2021-06-15  4396  	aq_req->prof.band_prof_id =
=3D mid_prof;
e8e095b3b37004 Sunil Goutham 2021-06-15  4397  	aq_req->prof_mask.band_prof=
_id =3D GENMASK(6, 0);
e8e095b3b37004 Sunil Goutham 2021-06-15  4398  	aq_req->prof.hl_en =3D 1;
e8e095b3b37004 Sunil Goutham 2021-06-15  4399  	aq_req->prof_mask.hl_en =3D=
 1;
e8e095b3b37004 Sunil Goutham 2021-06-15  4400  =

e8e095b3b37004 Sunil Goutham 2021-06-15  4401  	return rvu_nix_blk_aq_enq_i=
nst(rvu, nix_hw,
e8e095b3b37004 Sunil Goutham 2021-06-15  4402  				       (struct nix_aq_en=
q_req *)aq_req,
e8e095b3b37004 Sunil Goutham 2021-06-15  4403  				       (struct nix_aq_en=
q_rsp *)aq_rsp);
e8e095b3b37004 Sunil Goutham 2021-06-15  4404  }
e8e095b3b37004 Sunil Goutham 2021-06-15  4405  =

e8e095b3b37004 Sunil Goutham 2021-06-15  4406  int rvu_nix_setup_ratelimit_=
aggr(struct rvu *rvu, u16 pcifunc,
e8e095b3b37004 Sunil Goutham 2021-06-15  4407  				 u16 rq_idx, u16 match_i=
d)
e8e095b3b37004 Sunil Goutham 2021-06-15  4408  {
e8e095b3b37004 Sunil Goutham 2021-06-15  4409  	int leaf_prof, mid_prof, le=
af_match;
e8e095b3b37004 Sunil Goutham 2021-06-15  4410  	struct nix_cn10k_aq_enq_req=
 aq_req;
e8e095b3b37004 Sunil Goutham 2021-06-15  4411  	struct nix_cn10k_aq_enq_rsp=
 aq_rsp;
e8e095b3b37004 Sunil Goutham 2021-06-15  4412  	struct nix_ipolicer *ipolic=
er;
e8e095b3b37004 Sunil Goutham 2021-06-15  4413  	struct nix_hw *nix_hw;
e8e095b3b37004 Sunil Goutham 2021-06-15  4414  	int blkaddr, idx, rc;
e8e095b3b37004 Sunil Goutham 2021-06-15  4415  =

e8e095b3b37004 Sunil Goutham 2021-06-15  4416  	if (!rvu->hw->cap.ipolicer)
e8e095b3b37004 Sunil Goutham 2021-06-15  4417  		return 0;
e8e095b3b37004 Sunil Goutham 2021-06-15  4418  =

e8e095b3b37004 Sunil Goutham 2021-06-15  4419  	rc =3D nix_get_struct_ptrs(=
rvu, pcifunc, &nix_hw, &blkaddr);
e8e095b3b37004 Sunil Goutham 2021-06-15  4420  	if (rc)
e8e095b3b37004 Sunil Goutham 2021-06-15  4421  		return rc;
e8e095b3b37004 Sunil Goutham 2021-06-15  4422  =

e8e095b3b37004 Sunil Goutham 2021-06-15  4423  	/* Fetch the RQ's context t=
o see if policing is enabled */
e8e095b3b37004 Sunil Goutham 2021-06-15  4424  	rc =3D nix_aq_context_read(=
rvu, nix_hw, &aq_req, &aq_rsp, pcifunc,
e8e095b3b37004 Sunil Goutham 2021-06-15  4425  				 NIX_AQ_CTYPE_RQ, rq_idx=
);
e8e095b3b37004 Sunil Goutham 2021-06-15  4426  	if (rc) {
e8e095b3b37004 Sunil Goutham 2021-06-15  4427  		dev_err(rvu->dev,
e8e095b3b37004 Sunil Goutham 2021-06-15  4428  			"%s: Failed to fetch RQ%d=
 context of PFFUNC 0x%x\n",
e8e095b3b37004 Sunil Goutham 2021-06-15  4429  			__func__, rq_idx, pcifunc=
);
e8e095b3b37004 Sunil Goutham 2021-06-15  4430  		return rc;
e8e095b3b37004 Sunil Goutham 2021-06-15  4431  	}
e8e095b3b37004 Sunil Goutham 2021-06-15  4432  =

e8e095b3b37004 Sunil Goutham 2021-06-15  4433  	if (!aq_rsp.rq.policer_ena)
e8e095b3b37004 Sunil Goutham 2021-06-15  4434  		return 0;
e8e095b3b37004 Sunil Goutham 2021-06-15  4435  =

e8e095b3b37004 Sunil Goutham 2021-06-15  4436  	/* Get the bandwidth profil=
e ID mapped to this RQ */
e8e095b3b37004 Sunil Goutham 2021-06-15  4437  	leaf_prof =3D aq_rsp.rq.ban=
d_prof_id;
e8e095b3b37004 Sunil Goutham 2021-06-15  4438  =

e8e095b3b37004 Sunil Goutham 2021-06-15  4439  	ipolicer =3D &nix_hw->ipoli=
cer[BAND_PROF_LEAF_LAYER];
e8e095b3b37004 Sunil Goutham 2021-06-15  4440  	ipolicer->match_id[leaf_pro=
f] =3D match_id;
e8e095b3b37004 Sunil Goutham 2021-06-15  4441  =

e8e095b3b37004 Sunil Goutham 2021-06-15  4442  	/* Check if any other leaf =
profile is marked with same match_id */
e8e095b3b37004 Sunil Goutham 2021-06-15  4443  	for (idx =3D 0; idx < ipoli=
cer->band_prof.max; idx++) {
e8e095b3b37004 Sunil Goutham 2021-06-15  4444  		if (idx =3D=3D leaf_prof)
e8e095b3b37004 Sunil Goutham 2021-06-15  4445  			continue;
e8e095b3b37004 Sunil Goutham 2021-06-15  4446  		if (ipolicer->match_id[idx=
] !=3D match_id)
e8e095b3b37004 Sunil Goutham 2021-06-15  4447  			continue;
e8e095b3b37004 Sunil Goutham 2021-06-15  4448  =

e8e095b3b37004 Sunil Goutham 2021-06-15  4449  		leaf_match =3D idx;
e8e095b3b37004 Sunil Goutham 2021-06-15  4450  		break;
e8e095b3b37004 Sunil Goutham 2021-06-15  4451  	}
e8e095b3b37004 Sunil Goutham 2021-06-15  4452  =

e8e095b3b37004 Sunil Goutham 2021-06-15  4453  	if (idx =3D=3D ipolicer->ba=
nd_prof.max)
e8e095b3b37004 Sunil Goutham 2021-06-15  4454  		return 0;
e8e095b3b37004 Sunil Goutham 2021-06-15  4455  =

e8e095b3b37004 Sunil Goutham 2021-06-15  4456  	/* Fetch the matching profi=
le's context to check if it's already
e8e095b3b37004 Sunil Goutham 2021-06-15  4457  	 * mapped to a mid level pr=
ofile.
e8e095b3b37004 Sunil Goutham 2021-06-15  4458  	 */
e8e095b3b37004 Sunil Goutham 2021-06-15  4459  	rc =3D nix_aq_context_read(=
rvu, nix_hw, &aq_req, &aq_rsp, 0x00,
e8e095b3b37004 Sunil Goutham 2021-06-15 @4460  				 NIX_AQ_CTYPE_BANDPROF, =
leaf_match);
e8e095b3b37004 Sunil Goutham 2021-06-15  4461  	if (rc) {
e8e095b3b37004 Sunil Goutham 2021-06-15  4462  		dev_err(rvu->dev,
e8e095b3b37004 Sunil Goutham 2021-06-15  4463  			"%s: Failed to fetch cont=
ext of leaf profile %d\n",
e8e095b3b37004 Sunil Goutham 2021-06-15  4464  			__func__, leaf_match);
e8e095b3b37004 Sunil Goutham 2021-06-15  4465  		return rc;
e8e095b3b37004 Sunil Goutham 2021-06-15  4466  	}
e8e095b3b37004 Sunil Goutham 2021-06-15  4467  =

e8e095b3b37004 Sunil Goutham 2021-06-15  4468  	ipolicer =3D &nix_hw->ipoli=
cer[BAND_PROF_MID_LAYER];
e8e095b3b37004 Sunil Goutham 2021-06-15  4469  	if (aq_rsp.prof.hl_en) {
e8e095b3b37004 Sunil Goutham 2021-06-15  4470  		/* Get Mid layer prof inde=
x and map leaf_prof index
e8e095b3b37004 Sunil Goutham 2021-06-15  4471  		 * also such that flows th=
at are being steered
e8e095b3b37004 Sunil Goutham 2021-06-15  4472  		 * to different RQs and ma=
rked with same match_id
e8e095b3b37004 Sunil Goutham 2021-06-15  4473  		 * are rate limited in a a=
ggregate fashion
e8e095b3b37004 Sunil Goutham 2021-06-15  4474  		 */
e8e095b3b37004 Sunil Goutham 2021-06-15  4475  		mid_prof =3D aq_rsp.prof.b=
and_prof_id;
e8e095b3b37004 Sunil Goutham 2021-06-15  4476  		rc =3D nix_ipolicer_map_le=
af_midprofs(rvu, nix_hw,
e8e095b3b37004 Sunil Goutham 2021-06-15  4477  						    &aq_req, &aq_rsp,
e8e095b3b37004 Sunil Goutham 2021-06-15  4478  						    leaf_prof, mid_pro=
f);
e8e095b3b37004 Sunil Goutham 2021-06-15  4479  		if (rc) {
e8e095b3b37004 Sunil Goutham 2021-06-15  4480  			dev_err(rvu->dev,
e8e095b3b37004 Sunil Goutham 2021-06-15  4481  				"%s: Failed to map leaf(=
%d) and mid(%d) profiles\n",
e8e095b3b37004 Sunil Goutham 2021-06-15  4482  				__func__, leaf_prof, mid=
_prof);
e8e095b3b37004 Sunil Goutham 2021-06-15  4483  			goto exit;
e8e095b3b37004 Sunil Goutham 2021-06-15  4484  		}
e8e095b3b37004 Sunil Goutham 2021-06-15  4485  =

e8e095b3b37004 Sunil Goutham 2021-06-15  4486  		mutex_lock(&rvu->rsrc_lock=
);
e8e095b3b37004 Sunil Goutham 2021-06-15  4487  		ipolicer->ref_count[mid_pr=
of]++;
e8e095b3b37004 Sunil Goutham 2021-06-15  4488  		mutex_unlock(&rvu->rsrc_lo=
ck);
e8e095b3b37004 Sunil Goutham 2021-06-15  4489  		goto exit;
e8e095b3b37004 Sunil Goutham 2021-06-15  4490  	}
e8e095b3b37004 Sunil Goutham 2021-06-15  4491  =

e8e095b3b37004 Sunil Goutham 2021-06-15  4492  	/* Allocate a mid layer pro=
file and
e8e095b3b37004 Sunil Goutham 2021-06-15  4493  	 * map both 'leaf_prof' and=
 'leaf_match' profiles to it.
e8e095b3b37004 Sunil Goutham 2021-06-15  4494  	 */
e8e095b3b37004 Sunil Goutham 2021-06-15  4495  	mutex_lock(&rvu->rsrc_lock);
e8e095b3b37004 Sunil Goutham 2021-06-15  4496  	mid_prof =3D rvu_alloc_rsrc=
(&ipolicer->band_prof);
e8e095b3b37004 Sunil Goutham 2021-06-15  4497  	if (mid_prof < 0) {
e8e095b3b37004 Sunil Goutham 2021-06-15  4498  		dev_err(rvu->dev,
e8e095b3b37004 Sunil Goutham 2021-06-15  4499  			"%s: Unable to allocate m=
id layer profile\n", __func__);
e8e095b3b37004 Sunil Goutham 2021-06-15  4500  		mutex_unlock(&rvu->rsrc_lo=
ck);
e8e095b3b37004 Sunil Goutham 2021-06-15  4501  		goto exit;
e8e095b3b37004 Sunil Goutham 2021-06-15  4502  	}
e8e095b3b37004 Sunil Goutham 2021-06-15  4503  	mutex_unlock(&rvu->rsrc_loc=
k);
e8e095b3b37004 Sunil Goutham 2021-06-15  4504  	ipolicer->pfvf_map[mid_prof=
] =3D 0x00;
e8e095b3b37004 Sunil Goutham 2021-06-15  4505  	ipolicer->ref_count[mid_pro=
f] =3D 0;
e8e095b3b37004 Sunil Goutham 2021-06-15  4506  =

e8e095b3b37004 Sunil Goutham 2021-06-15  4507  	/* Initialize mid layer pro=
file same as 'leaf_prof' */
e8e095b3b37004 Sunil Goutham 2021-06-15  4508  	rc =3D nix_aq_context_read(=
rvu, nix_hw, &aq_req, &aq_rsp, 0x00,
e8e095b3b37004 Sunil Goutham 2021-06-15  4509  				 NIX_AQ_CTYPE_BANDPROF, =
leaf_prof);
e8e095b3b37004 Sunil Goutham 2021-06-15  4510  	if (rc) {
e8e095b3b37004 Sunil Goutham 2021-06-15  4511  		dev_err(rvu->dev,
e8e095b3b37004 Sunil Goutham 2021-06-15  4512  			"%s: Failed to fetch cont=
ext of leaf profile %d\n",
e8e095b3b37004 Sunil Goutham 2021-06-15  4513  			__func__, leaf_prof);
e8e095b3b37004 Sunil Goutham 2021-06-15  4514  		goto exit;
e8e095b3b37004 Sunil Goutham 2021-06-15  4515  	}
e8e095b3b37004 Sunil Goutham 2021-06-15  4516  =

e8e095b3b37004 Sunil Goutham 2021-06-15  4517  	memset(&aq_req, 0, sizeof(s=
truct nix_cn10k_aq_enq_req));
e8e095b3b37004 Sunil Goutham 2021-06-15  4518  	aq_req.hdr.pcifunc =3D 0x00;
e8e095b3b37004 Sunil Goutham 2021-06-15  4519  	aq_req.qidx =3D (mid_prof &=
 0x3FFF) | (BAND_PROF_MID_LAYER << 14);
e8e095b3b37004 Sunil Goutham 2021-06-15  4520  	aq_req.ctype =3D NIX_AQ_CTY=
PE_BANDPROF;
e8e095b3b37004 Sunil Goutham 2021-06-15  4521  	aq_req.op =3D NIX_AQ_INSTOP=
_WRITE;
e8e095b3b37004 Sunil Goutham 2021-06-15  4522  	memcpy(&aq_req.prof, &aq_rs=
p.prof, sizeof(struct nix_bandprof_s));
e8e095b3b37004 Sunil Goutham 2021-06-15  4523  	/* Clear higher layer enabl=
e bit in the mid profile, just in case */
e8e095b3b37004 Sunil Goutham 2021-06-15  4524  	aq_req.prof.hl_en =3D 0;
e8e095b3b37004 Sunil Goutham 2021-06-15  4525  	aq_req.prof_mask.hl_en =3D =
1;
e8e095b3b37004 Sunil Goutham 2021-06-15  4526  =

e8e095b3b37004 Sunil Goutham 2021-06-15  4527  	rc =3D rvu_nix_blk_aq_enq_i=
nst(rvu, nix_hw,
e8e095b3b37004 Sunil Goutham 2021-06-15  4528  				     (struct nix_aq_enq_=
req *)&aq_req, NULL);
e8e095b3b37004 Sunil Goutham 2021-06-15  4529  	if (rc) {
e8e095b3b37004 Sunil Goutham 2021-06-15  4530  		dev_err(rvu->dev,
e8e095b3b37004 Sunil Goutham 2021-06-15  4531  			"%s: Failed to INIT conte=
xt of mid layer profile %d\n",
e8e095b3b37004 Sunil Goutham 2021-06-15  4532  			__func__, mid_prof);
e8e095b3b37004 Sunil Goutham 2021-06-15  4533  		goto exit;
e8e095b3b37004 Sunil Goutham 2021-06-15  4534  	}
e8e095b3b37004 Sunil Goutham 2021-06-15  4535  =

e8e095b3b37004 Sunil Goutham 2021-06-15  4536  	/* Map both leaf profiles t=
o this mid layer profile */
e8e095b3b37004 Sunil Goutham 2021-06-15  4537  	rc =3D nix_ipolicer_map_lea=
f_midprofs(rvu, nix_hw,
e8e095b3b37004 Sunil Goutham 2021-06-15  4538  					    &aq_req, &aq_rsp,
e8e095b3b37004 Sunil Goutham 2021-06-15  4539  					    leaf_prof, mid_prof=
);
e8e095b3b37004 Sunil Goutham 2021-06-15  4540  	if (rc) {
e8e095b3b37004 Sunil Goutham 2021-06-15  4541  		dev_err(rvu->dev,
e8e095b3b37004 Sunil Goutham 2021-06-15  4542  			"%s: Failed to map leaf(%=
d) and mid(%d) profiles\n",
e8e095b3b37004 Sunil Goutham 2021-06-15  4543  			__func__, leaf_prof, mid_=
prof);
e8e095b3b37004 Sunil Goutham 2021-06-15  4544  		goto exit;
e8e095b3b37004 Sunil Goutham 2021-06-15  4545  	}
e8e095b3b37004 Sunil Goutham 2021-06-15  4546  =

e8e095b3b37004 Sunil Goutham 2021-06-15  4547  	mutex_lock(&rvu->rsrc_lock);
e8e095b3b37004 Sunil Goutham 2021-06-15  4548  	ipolicer->ref_count[mid_pro=
f]++;
e8e095b3b37004 Sunil Goutham 2021-06-15  4549  	mutex_unlock(&rvu->rsrc_loc=
k);
e8e095b3b37004 Sunil Goutham 2021-06-15  4550  =

e8e095b3b37004 Sunil Goutham 2021-06-15  4551  	rc =3D nix_ipolicer_map_lea=
f_midprofs(rvu, nix_hw,
e8e095b3b37004 Sunil Goutham 2021-06-15  4552  					    &aq_req, &aq_rsp,
e8e095b3b37004 Sunil Goutham 2021-06-15  4553  					    leaf_match, mid_pro=
f);
e8e095b3b37004 Sunil Goutham 2021-06-15  4554  	if (rc) {
e8e095b3b37004 Sunil Goutham 2021-06-15  4555  		dev_err(rvu->dev,
e8e095b3b37004 Sunil Goutham 2021-06-15  4556  			"%s: Failed to map leaf(%=
d) and mid(%d) profiles\n",
e8e095b3b37004 Sunil Goutham 2021-06-15  4557  			__func__, leaf_match, mid=
_prof);
e8e095b3b37004 Sunil Goutham 2021-06-15  4558  		ipolicer->ref_count[mid_pr=
of]--;
e8e095b3b37004 Sunil Goutham 2021-06-15  4559  		goto exit;
e8e095b3b37004 Sunil Goutham 2021-06-15  4560  	}
e8e095b3b37004 Sunil Goutham 2021-06-15  4561  =

e8e095b3b37004 Sunil Goutham 2021-06-15  4562  	mutex_lock(&rvu->rsrc_lock);
e8e095b3b37004 Sunil Goutham 2021-06-15  4563  	ipolicer->ref_count[mid_pro=
f]++;
e8e095b3b37004 Sunil Goutham 2021-06-15  4564  	mutex_unlock(&rvu->rsrc_loc=
k);
e8e095b3b37004 Sunil Goutham 2021-06-15  4565  =

e8e095b3b37004 Sunil Goutham 2021-06-15  4566  exit:
e8e095b3b37004 Sunil Goutham 2021-06-15  4567  	return rc;
e8e095b3b37004 Sunil Goutham 2021-06-15  4568  }
e8e095b3b37004 Sunil Goutham 2021-06-15  4569  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3866092692912892556==--

