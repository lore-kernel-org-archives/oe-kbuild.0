Content-Type: multipart/mixed; boundary="===============7561128897239235183=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 2375/5845] drivers/edac/edac_mc.c:396:24: warning: Variable 'layer' is not assigned a value. [unassignedVariable]
Date: Sat, 23 Apr 2022 18:11:07 +0800
Message-ID: <202204231858.qFPTCBTL-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7561128897239235183==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Borislav Petkov <bp@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   e7d6987e09a328d4a949701db40ef63fbb970670
commit: 0bbb265f7089584aaa6d440805ca75ea4f3930d4 [2375/5845] EDAC/mc: Get r=
id of silly one-shot struct allocation in edac_mc_alloc()
:::::: branch date: 28 hours ago
:::::: commit date: 12 days ago
compiler: powerpc64-linux-gcc (GCC) 11.2.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 0bbb265f7089584aaa6d440805ca75ea4f3930d4
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   drivers/edac/edac_mc.c:484:62: warning: Parameter 'dev' can be declared =
with const [constParameter]
   static struct mem_ctl_info *__find_mci_by_dev(struct device *dev)
                                                                ^
>> drivers/edac/edac_mc.c:396:24: warning: Variable 'layer' is not assigned=
 a value. [unassignedVariable]
    struct edac_mc_layer *layer;
                          ^
>> kernel/bpf/core.c:1667:3: warning: Syntax Error: AST broken, binary oper=
ator '=3D' doesn't have two operands. [internalAstError]
     BPF_INSN_MAP(BPF_INSN_2_LBL, BPF_INSN_3_LBL),
     ^

vim +/layer +396 drivers/edac/edac_mc.c

da9bb1d27b21cb Alan Cox        2006-01-18  389  =

1f27c79062385a Robert Richter  2020-01-23  390  struct mem_ctl_info *edac_m=
c_alloc(unsigned int mc_num,
1f27c79062385a Robert Richter  2020-01-23  391  				   unsigned int n_layer=
s,
1f27c79062385a Robert Richter  2020-01-23  392  				   struct edac_mc_layer=
 *layers,
1f27c79062385a Robert Richter  2020-01-23  393  				   unsigned int sz_pvt)
1f27c79062385a Robert Richter  2020-01-23  394  {
1f27c79062385a Robert Richter  2020-01-23  395  	struct mem_ctl_info *mci;
1f27c79062385a Robert Richter  2020-01-23 @396  	struct edac_mc_layer *laye=
r;
0bbb265f708958 Borislav Petkov 2022-02-20  397  	unsigned int idx, tot_dimm=
s =3D 1;
4aa92c86463273 Robert Richter  2020-02-17  398  	unsigned int tot_csrows =
=3D 1, tot_channels =3D 1;
1f27c79062385a Robert Richter  2020-01-23  399  	bool per_rank =3D false;
1f27c79062385a Robert Richter  2020-01-23  400  =

1f27c79062385a Robert Richter  2020-01-23  401  	if (WARN_ON(n_layers > EDA=
C_MAX_LAYERS || n_layers =3D=3D 0))
1f27c79062385a Robert Richter  2020-01-23  402  		return NULL;
1f27c79062385a Robert Richter  2020-01-23  403  =

1f27c79062385a Robert Richter  2020-01-23  404  	/*
1f27c79062385a Robert Richter  2020-01-23  405  	 * Calculate the total amo=
unt of dimms and csrows/cschannels while
1f27c79062385a Robert Richter  2020-01-23  406  	 * in the old API emulatio=
n mode
1f27c79062385a Robert Richter  2020-01-23  407  	 */
1f27c79062385a Robert Richter  2020-01-23  408  	for (idx =3D 0; idx < n_la=
yers; idx++) {
1f27c79062385a Robert Richter  2020-01-23  409  		tot_dimms *=3D layers[idx=
].size;
1f27c79062385a Robert Richter  2020-01-23  410  =

1f27c79062385a Robert Richter  2020-01-23  411  		if (layers[idx].is_virt_c=
srow)
1f27c79062385a Robert Richter  2020-01-23  412  			tot_csrows *=3D layers[i=
dx].size;
1f27c79062385a Robert Richter  2020-01-23  413  		else
1f27c79062385a Robert Richter  2020-01-23  414  			tot_channels *=3D layers=
[idx].size;
1f27c79062385a Robert Richter  2020-01-23  415  =

1f27c79062385a Robert Richter  2020-01-23  416  		if (layers[idx].type =3D=
=3D EDAC_MC_LAYER_CHIP_SELECT)
1f27c79062385a Robert Richter  2020-01-23  417  			per_rank =3D true;
1f27c79062385a Robert Richter  2020-01-23  418  	}
1f27c79062385a Robert Richter  2020-01-23  419  =

0bbb265f708958 Borislav Petkov 2022-02-20  420  	mci =3D kzalloc(sizeof(str=
uct mem_ctl_info), GFP_KERNEL);
0bbb265f708958 Borislav Petkov 2022-02-20  421  	if (!mci)
1f27c79062385a Robert Richter  2020-01-23  422  		return NULL;
1f27c79062385a Robert Richter  2020-01-23  423  =

0bbb265f708958 Borislav Petkov 2022-02-20  424  	mci->layers =3D kmalloc_ar=
ray(n_layers, sizeof(struct edac_mc_layer), GFP_KERNEL | __GFP_ZERO);
0bbb265f708958 Borislav Petkov 2022-02-20  425  	if (!mci->layers)
0bbb265f708958 Borislav Petkov 2022-02-20  426  		goto error;
0bbb265f708958 Borislav Petkov 2022-02-20  427  =

0bbb265f708958 Borislav Petkov 2022-02-20  428  	mci->pvt_info =3D kzalloc(=
sz_pvt, GFP_KERNEL);
0bbb265f708958 Borislav Petkov 2022-02-20  429  	if (!mci->pvt_info)
0bbb265f708958 Borislav Petkov 2022-02-20  430  		goto error;
0bbb265f708958 Borislav Petkov 2022-02-20  431  =

1f27c79062385a Robert Richter  2020-01-23  432  	mci->dev.release =3D mci_r=
elease;
1f27c79062385a Robert Richter  2020-01-23  433  	device_initialize(&mci->de=
v);
1f27c79062385a Robert Richter  2020-01-23  434  =

1f27c79062385a Robert Richter  2020-01-23  435  	/* setup index and various=
 internal pointers */
1f27c79062385a Robert Richter  2020-01-23  436  	mci->mc_idx =3D mc_num;
1f27c79062385a Robert Richter  2020-01-23  437  	mci->tot_dimms =3D tot_dim=
ms;
1f27c79062385a Robert Richter  2020-01-23  438  	mci->n_layers =3D n_layers;
1f27c79062385a Robert Richter  2020-01-23  439  	memcpy(mci->layers, layers=
, sizeof(*layer) * n_layers);
1f27c79062385a Robert Richter  2020-01-23  440  	mci->nr_csrows =3D tot_csr=
ows;
1f27c79062385a Robert Richter  2020-01-23  441  	mci->num_cschannel =3D tot=
_channels;
1f27c79062385a Robert Richter  2020-01-23  442  	mci->csbased =3D per_rank;
1f27c79062385a Robert Richter  2020-01-23  443  =

1f27c79062385a Robert Richter  2020-01-23  444  	if (edac_mc_alloc_csrows(m=
ci))
1f27c79062385a Robert Richter  2020-01-23  445  		goto error;
1f27c79062385a Robert Richter  2020-01-23  446  =

1f27c79062385a Robert Richter  2020-01-23  447  	if (edac_mc_alloc_dimms(mc=
i))
1f27c79062385a Robert Richter  2020-01-23  448  		goto error;
1f27c79062385a Robert Richter  2020-01-23  449  =

1f27c79062385a Robert Richter  2020-01-23  450  	mci->op_state =3D OP_ALLOC;
1f27c79062385a Robert Richter  2020-01-23  451  =

1f27c79062385a Robert Richter  2020-01-23  452  	return mci;
1f27c79062385a Robert Richter  2020-01-23  453  =

1f27c79062385a Robert Richter  2020-01-23  454  error:
1f27c79062385a Robert Richter  2020-01-23  455  	_edac_mc_free(mci);
1f27c79062385a Robert Richter  2020-01-23  456  =

1f27c79062385a Robert Richter  2020-01-23  457  	return NULL;
1f27c79062385a Robert Richter  2020-01-23  458  }
1f27c79062385a Robert Richter  2020-01-23  459  EXPORT_SYMBOL_GPL(edac_mc_a=
lloc);
1f27c79062385a Robert Richter  2020-01-23  460  =


:::::: The code at line 396 was first introduced by commit
:::::: 1f27c79062385af38c7c075f0fc174f98164ab2e EDAC/mc: Reorder functions =
edac_mc_alloc*()

:::::: TO: Robert Richter <rrichter@marvell.com>
:::::: CC: Borislav Petkov <bp@suse.de>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7561128897239235183==--

