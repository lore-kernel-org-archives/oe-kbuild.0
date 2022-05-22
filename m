Content-Type: multipart/mixed; boundary="===============4265567330787705842=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/marvell/octeontx2/af/rvu_nix.c:4360 rvu_mbox_handler_nix_bandprof_free() error: testing array offset 'idx' after use.
Date: Sun, 22 May 2022 10:50:42 +0800
Message-ID: <202205221009.XjbSXonE-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4265567330787705842==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Sunil Goutham <sgoutham@marvell.com>
CC: Subbaraya Sundeep <sbhatta@marvell.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   eaea45fc0e7b6ae439526b4a41d91230c8517336
commit: e8e095b3b37004a4048af69de60c9af2d2268a1d octeontx2-af: cn10k: Bandw=
idth profiles config support
date:   11 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 11 months ago
config: s390-randconfig-m031-20220522 (https://download.01.org/0day-ci/arch=
ive/20220522/202205221009.XjbSXonE-lkp(a)intel.com/config)
compiler: s390-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/net/ethernet/marvell/octeontx2/af/rvu_nix.c:4360 rvu_mbox_handler_n=
ix_bandprof_free() error: testing array offset 'idx' after use.

vim +/idx +4360 drivers/net/ethernet/marvell/octeontx2/af/rvu_nix.c

e8e095b3b37004 Sunil Goutham 2021-06-15  4317  =

e8e095b3b37004 Sunil Goutham 2021-06-15  4318  int rvu_mbox_handler_nix_ban=
dprof_free(struct rvu *rvu,
e8e095b3b37004 Sunil Goutham 2021-06-15  4319  				       struct nix_bandpr=
of_free_req *req,
e8e095b3b37004 Sunil Goutham 2021-06-15  4320  				       struct msg_rsp *r=
sp)
e8e095b3b37004 Sunil Goutham 2021-06-15  4321  {
e8e095b3b37004 Sunil Goutham 2021-06-15  4322  	int blkaddr, layer, prof_id=
x, idx, err;
e8e095b3b37004 Sunil Goutham 2021-06-15  4323  	u16 pcifunc =3D req->hdr.pc=
ifunc;
e8e095b3b37004 Sunil Goutham 2021-06-15  4324  	struct nix_ipolicer *ipolic=
er;
e8e095b3b37004 Sunil Goutham 2021-06-15  4325  	struct nix_hw *nix_hw;
e8e095b3b37004 Sunil Goutham 2021-06-15  4326  =

e8e095b3b37004 Sunil Goutham 2021-06-15  4327  	if (req->free_all)
e8e095b3b37004 Sunil Goutham 2021-06-15  4328  		return nix_free_all_bandpr=
of(rvu, pcifunc);
e8e095b3b37004 Sunil Goutham 2021-06-15  4329  =

e8e095b3b37004 Sunil Goutham 2021-06-15  4330  	if (!rvu->hw->cap.ipolicer)
e8e095b3b37004 Sunil Goutham 2021-06-15  4331  		return NIX_AF_ERR_IPOLICER=
_NOTSUPP;
e8e095b3b37004 Sunil Goutham 2021-06-15  4332  =

e8e095b3b37004 Sunil Goutham 2021-06-15  4333  	err =3D nix_get_struct_ptrs=
(rvu, pcifunc, &nix_hw, &blkaddr);
e8e095b3b37004 Sunil Goutham 2021-06-15  4334  	if (err)
e8e095b3b37004 Sunil Goutham 2021-06-15  4335  		return err;
e8e095b3b37004 Sunil Goutham 2021-06-15  4336  =

e8e095b3b37004 Sunil Goutham 2021-06-15  4337  	mutex_lock(&rvu->rsrc_lock);
e8e095b3b37004 Sunil Goutham 2021-06-15  4338  	/* Free the requested profi=
le indices */
e8e095b3b37004 Sunil Goutham 2021-06-15  4339  	for (layer =3D 0; layer < B=
AND_PROF_NUM_LAYERS; layer++) {
e8e095b3b37004 Sunil Goutham 2021-06-15  4340  		if (layer =3D=3D BAND_PROF=
_INVAL_LAYER)
e8e095b3b37004 Sunil Goutham 2021-06-15  4341  			continue;
e8e095b3b37004 Sunil Goutham 2021-06-15  4342  		if (!req->prof_count[layer=
])
e8e095b3b37004 Sunil Goutham 2021-06-15  4343  			continue;
e8e095b3b37004 Sunil Goutham 2021-06-15  4344  =

e8e095b3b37004 Sunil Goutham 2021-06-15  4345  		ipolicer =3D &nix_hw->ipol=
icer[layer];
e8e095b3b37004 Sunil Goutham 2021-06-15  4346  		for (idx =3D 0; idx < req-=
>prof_count[layer]; idx++) {
e8e095b3b37004 Sunil Goutham 2021-06-15  4347  			prof_idx =3D req->prof_id=
x[layer][idx];
e8e095b3b37004 Sunil Goutham 2021-06-15  4348  			if (prof_idx >=3D ipolice=
r->band_prof.max ||
e8e095b3b37004 Sunil Goutham 2021-06-15  4349  			    ipolicer->pfvf_map[pr=
of_idx] !=3D pcifunc)
e8e095b3b37004 Sunil Goutham 2021-06-15  4350  				continue;
e8e095b3b37004 Sunil Goutham 2021-06-15  4351  =

e8e095b3b37004 Sunil Goutham 2021-06-15  4352  			/* Clear ratelimit aggreg=
ation, if any */
e8e095b3b37004 Sunil Goutham 2021-06-15  4353  			if (layer =3D=3D BAND_PRO=
F_LEAF_LAYER &&
e8e095b3b37004 Sunil Goutham 2021-06-15  4354  			    ipolicer->match_id[pr=
of_idx])
e8e095b3b37004 Sunil Goutham 2021-06-15  4355  				nix_clear_ratelimit_aggr=
(rvu, nix_hw, prof_idx);
e8e095b3b37004 Sunil Goutham 2021-06-15  4356  =

e8e095b3b37004 Sunil Goutham 2021-06-15  4357  			ipolicer->pfvf_map[prof_i=
dx] =3D 0x00;
e8e095b3b37004 Sunil Goutham 2021-06-15  4358  			ipolicer->match_id[prof_i=
dx] =3D 0;
e8e095b3b37004 Sunil Goutham 2021-06-15  4359  			rvu_free_rsrc(&ipolicer->=
band_prof, prof_idx);
e8e095b3b37004 Sunil Goutham 2021-06-15 @4360  			if (idx =3D=3D MAX_BANDPR=
OF_PER_PFFUNC)
e8e095b3b37004 Sunil Goutham 2021-06-15  4361  				break;
e8e095b3b37004 Sunil Goutham 2021-06-15  4362  		}
e8e095b3b37004 Sunil Goutham 2021-06-15  4363  	}
e8e095b3b37004 Sunil Goutham 2021-06-15  4364  	mutex_unlock(&rvu->rsrc_loc=
k);
e8e095b3b37004 Sunil Goutham 2021-06-15  4365  	return 0;
e8e095b3b37004 Sunil Goutham 2021-06-15  4366  }
e8e095b3b37004 Sunil Goutham 2021-06-15  4367  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4265567330787705842==--

