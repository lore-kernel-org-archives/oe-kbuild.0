Content-Type: multipart/mixed; boundary="===============3100797029680200039=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/marvell/octeontx2/af/rvu_switch.c:185 rvu_switch_enable() warn: 'rswitch->start_entry + rswitch->used_entries - 1' 4294967295 can't fit into 65535 'uninstall_req.end'
Date: Sun, 22 May 2022 16:06:30 +0800
Message-ID: <202205221628.VdZEHKlx-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3100797029680200039==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Subbaraya Sundeep <sbhatta@marvell.com>
CC: Sunil Kovvuri Goutham <sgoutham@marvell.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   eaea45fc0e7b6ae439526b4a41d91230c8517336
commit: 23109f8dd06d0bd04c9360cf7c501c97b0ab1545 octeontx2-af: Introduce in=
ternal packet switching
date:   10 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 10 months ago
config: s390-randconfig-m031-20220522 (https://download.01.org/0day-ci/arch=
ive/20220522/202205221628.VdZEHKlx-lkp(a)intel.com/config)
compiler: s390-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/net/ethernet/marvell/octeontx2/af/rvu_switch.c:185 rvu_switch_enabl=
e() warn: 'rswitch->start_entry + rswitch->used_entries - 1' 4294967295 can=
't fit into 65535 'uninstall_req.end'

Old smatch warnings:
drivers/net/ethernet/marvell/octeontx2/af/rvu_switch.c:220 rvu_switch_disab=
le() error: uninitialized symbol 'numvfs'.
drivers/net/ethernet/marvell/octeontx2/af/rvu_switch.c:220 rvu_switch_disab=
le() error: uninitialized symbol 'hwvf'.

vim +185 drivers/net/ethernet/marvell/octeontx2/af/rvu_switch.c

23109f8dd06d0b Subbaraya Sundeep 2021-07-19  141  =

23109f8dd06d0b Subbaraya Sundeep 2021-07-19  142  void rvu_switch_enable(st=
ruct rvu *rvu)
23109f8dd06d0b Subbaraya Sundeep 2021-07-19  143  {
23109f8dd06d0b Subbaraya Sundeep 2021-07-19  144  	struct npc_mcam_alloc_en=
try_req alloc_req =3D { 0 };
23109f8dd06d0b Subbaraya Sundeep 2021-07-19  145  	struct npc_mcam_alloc_en=
try_rsp alloc_rsp =3D { 0 };
23109f8dd06d0b Subbaraya Sundeep 2021-07-19  146  	struct npc_delete_flow_r=
eq uninstall_req =3D { 0 };
23109f8dd06d0b Subbaraya Sundeep 2021-07-19  147  	struct npc_mcam_free_ent=
ry_req free_req =3D { 0 };
23109f8dd06d0b Subbaraya Sundeep 2021-07-19  148  	struct rvu_switch *rswit=
ch =3D &rvu->rswitch;
23109f8dd06d0b Subbaraya Sundeep 2021-07-19  149  	struct msg_rsp rsp;
23109f8dd06d0b Subbaraya Sundeep 2021-07-19  150  	int ret;
23109f8dd06d0b Subbaraya Sundeep 2021-07-19  151  =

23109f8dd06d0b Subbaraya Sundeep 2021-07-19  152  	alloc_req.contig =3D tru=
e;
23109f8dd06d0b Subbaraya Sundeep 2021-07-19  153  	alloc_req.count =3D rvu-=
>cgx_mapped_pfs + rvu->cgx_mapped_vfs;
23109f8dd06d0b Subbaraya Sundeep 2021-07-19  154  	ret =3D rvu_mbox_handler=
_npc_mcam_alloc_entry(rvu, &alloc_req,
23109f8dd06d0b Subbaraya Sundeep 2021-07-19  155  						    &alloc_rsp);
23109f8dd06d0b Subbaraya Sundeep 2021-07-19  156  	if (ret) {
23109f8dd06d0b Subbaraya Sundeep 2021-07-19  157  		dev_err(rvu->dev,
23109f8dd06d0b Subbaraya Sundeep 2021-07-19  158  			"Unable to allocate MC=
AM entries\n");
23109f8dd06d0b Subbaraya Sundeep 2021-07-19  159  		goto exit;
23109f8dd06d0b Subbaraya Sundeep 2021-07-19  160  	}
23109f8dd06d0b Subbaraya Sundeep 2021-07-19  161  =

23109f8dd06d0b Subbaraya Sundeep 2021-07-19  162  	if (alloc_rsp.count !=3D=
 alloc_req.count) {
23109f8dd06d0b Subbaraya Sundeep 2021-07-19  163  		dev_err(rvu->dev,
23109f8dd06d0b Subbaraya Sundeep 2021-07-19  164  			"Unable to allocate %d=
 MCAM entries, got %d\n",
23109f8dd06d0b Subbaraya Sundeep 2021-07-19  165  			alloc_req.count, alloc=
_rsp.count);
23109f8dd06d0b Subbaraya Sundeep 2021-07-19  166  		goto free_entries;
23109f8dd06d0b Subbaraya Sundeep 2021-07-19  167  	}
23109f8dd06d0b Subbaraya Sundeep 2021-07-19  168  =

23109f8dd06d0b Subbaraya Sundeep 2021-07-19  169  	rswitch->entry2pcifunc =
=3D kcalloc(alloc_req.count, sizeof(u16),
23109f8dd06d0b Subbaraya Sundeep 2021-07-19  170  					 GFP_KERNEL);
23109f8dd06d0b Subbaraya Sundeep 2021-07-19  171  	if (!rswitch->entry2pcif=
unc)
23109f8dd06d0b Subbaraya Sundeep 2021-07-19  172  		goto free_entries;
23109f8dd06d0b Subbaraya Sundeep 2021-07-19  173  =

23109f8dd06d0b Subbaraya Sundeep 2021-07-19  174  	rswitch->used_entries =
=3D alloc_rsp.count;
23109f8dd06d0b Subbaraya Sundeep 2021-07-19  175  	rswitch->start_entry =3D=
 alloc_rsp.entry;
23109f8dd06d0b Subbaraya Sundeep 2021-07-19  176  =

23109f8dd06d0b Subbaraya Sundeep 2021-07-19  177  	ret =3D rvu_switch_insta=
ll_rules(rvu);
23109f8dd06d0b Subbaraya Sundeep 2021-07-19  178  	if (ret)
23109f8dd06d0b Subbaraya Sundeep 2021-07-19  179  		goto uninstall_rules;
23109f8dd06d0b Subbaraya Sundeep 2021-07-19  180  =

23109f8dd06d0b Subbaraya Sundeep 2021-07-19  181  	return;
23109f8dd06d0b Subbaraya Sundeep 2021-07-19  182  =

23109f8dd06d0b Subbaraya Sundeep 2021-07-19  183  uninstall_rules:
23109f8dd06d0b Subbaraya Sundeep 2021-07-19  184  	uninstall_req.start =3D =
rswitch->start_entry;
23109f8dd06d0b Subbaraya Sundeep 2021-07-19 @185  	uninstall_req.end =3D  r=
switch->start_entry + rswitch->used_entries - 1;
23109f8dd06d0b Subbaraya Sundeep 2021-07-19  186  	rvu_mbox_handler_npc_del=
ete_flow(rvu, &uninstall_req, &rsp);
23109f8dd06d0b Subbaraya Sundeep 2021-07-19  187  	kfree(rswitch->entry2pci=
func);
23109f8dd06d0b Subbaraya Sundeep 2021-07-19  188  free_entries:
23109f8dd06d0b Subbaraya Sundeep 2021-07-19  189  	free_req.all =3D 1;
23109f8dd06d0b Subbaraya Sundeep 2021-07-19  190  	rvu_mbox_handler_npc_mca=
m_free_entry(rvu, &free_req, &rsp);
23109f8dd06d0b Subbaraya Sundeep 2021-07-19  191  exit:
23109f8dd06d0b Subbaraya Sundeep 2021-07-19  192  	return;
23109f8dd06d0b Subbaraya Sundeep 2021-07-19  193  }
23109f8dd06d0b Subbaraya Sundeep 2021-07-19  194  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3100797029680200039==--

