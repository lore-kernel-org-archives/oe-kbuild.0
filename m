Content-Type: multipart/mixed; boundary="===============2839092838772619046=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 3072/3449] drivers/edac/edac_mc.c:424 edac_mc_alloc() warn: Please consider using kcalloc instead
Date: Tue, 12 Apr 2022 23:25:11 +0800
Message-ID: <202204122306.smUyZ1hT-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2839092838772619046==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Borislav Petkov <bp@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   d0c745e7b2d6ce8bcc768b32361ab8ef520821ee
commit: 0bbb265f7089584aaa6d440805ca75ea4f3930d4 [3072/3449] EDAC/mc: Get r=
id of silly one-shot struct allocation in edac_mc_alloc()
:::::: branch date: 10 hours ago
:::::: commit date: 30 hours ago
config: i386-randconfig-m021-20220411 (https://download.01.org/0day-ci/arch=
ive/20220412/202204122306.smUyZ1hT-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-19) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/edac/edac_mc.c:424 edac_mc_alloc() warn: Please consider using kcal=
loc instead

vim +424 drivers/edac/edac_mc.c

da9bb1d27b21cb2 Alan Cox        2006-01-18  389  =

1f27c79062385af Robert Richter  2020-01-23  390  struct mem_ctl_info *edac_=
mc_alloc(unsigned int mc_num,
1f27c79062385af Robert Richter  2020-01-23  391  				   unsigned int n_laye=
rs,
1f27c79062385af Robert Richter  2020-01-23  392  				   struct edac_mc_laye=
r *layers,
1f27c79062385af Robert Richter  2020-01-23  393  				   unsigned int sz_pvt)
1f27c79062385af Robert Richter  2020-01-23  394  {
1f27c79062385af Robert Richter  2020-01-23  395  	struct mem_ctl_info *mci;
1f27c79062385af Robert Richter  2020-01-23  396  	struct edac_mc_layer *lay=
er;
0bbb265f7089584 Borislav Petkov 2022-02-20  397  	unsigned int idx, tot_dim=
ms =3D 1;
4aa92c86463273b Robert Richter  2020-02-17  398  	unsigned int tot_csrows =
=3D 1, tot_channels =3D 1;
1f27c79062385af Robert Richter  2020-01-23  399  	bool per_rank =3D false;
1f27c79062385af Robert Richter  2020-01-23  400  =

1f27c79062385af Robert Richter  2020-01-23  401  	if (WARN_ON(n_layers > ED=
AC_MAX_LAYERS || n_layers =3D=3D 0))
1f27c79062385af Robert Richter  2020-01-23  402  		return NULL;
1f27c79062385af Robert Richter  2020-01-23  403  =

1f27c79062385af Robert Richter  2020-01-23  404  	/*
1f27c79062385af Robert Richter  2020-01-23  405  	 * Calculate the total am=
ount of dimms and csrows/cschannels while
1f27c79062385af Robert Richter  2020-01-23  406  	 * in the old API emulati=
on mode
1f27c79062385af Robert Richter  2020-01-23  407  	 */
1f27c79062385af Robert Richter  2020-01-23  408  	for (idx =3D 0; idx < n_l=
ayers; idx++) {
1f27c79062385af Robert Richter  2020-01-23  409  		tot_dimms *=3D layers[id=
x].size;
1f27c79062385af Robert Richter  2020-01-23  410  =

1f27c79062385af Robert Richter  2020-01-23  411  		if (layers[idx].is_virt_=
csrow)
1f27c79062385af Robert Richter  2020-01-23  412  			tot_csrows *=3D layers[=
idx].size;
1f27c79062385af Robert Richter  2020-01-23  413  		else
1f27c79062385af Robert Richter  2020-01-23  414  			tot_channels *=3D layer=
s[idx].size;
1f27c79062385af Robert Richter  2020-01-23  415  =

1f27c79062385af Robert Richter  2020-01-23  416  		if (layers[idx].type =3D=
=3D EDAC_MC_LAYER_CHIP_SELECT)
1f27c79062385af Robert Richter  2020-01-23  417  			per_rank =3D true;
1f27c79062385af Robert Richter  2020-01-23  418  	}
1f27c79062385af Robert Richter  2020-01-23  419  =

0bbb265f7089584 Borislav Petkov 2022-02-20  420  	mci =3D kzalloc(sizeof(st=
ruct mem_ctl_info), GFP_KERNEL);
0bbb265f7089584 Borislav Petkov 2022-02-20  421  	if (!mci)
1f27c79062385af Robert Richter  2020-01-23  422  		return NULL;
1f27c79062385af Robert Richter  2020-01-23  423  =

0bbb265f7089584 Borislav Petkov 2022-02-20 @424  	mci->layers =3D kmalloc_a=
rray(n_layers, sizeof(struct edac_mc_layer), GFP_KERNEL | __GFP_ZERO);
0bbb265f7089584 Borislav Petkov 2022-02-20  425  	if (!mci->layers)
0bbb265f7089584 Borislav Petkov 2022-02-20  426  		goto error;
0bbb265f7089584 Borislav Petkov 2022-02-20  427  =

0bbb265f7089584 Borislav Petkov 2022-02-20  428  	mci->pvt_info =3D kzalloc=
(sz_pvt, GFP_KERNEL);
0bbb265f7089584 Borislav Petkov 2022-02-20  429  	if (!mci->pvt_info)
0bbb265f7089584 Borislav Petkov 2022-02-20  430  		goto error;
0bbb265f7089584 Borislav Petkov 2022-02-20  431  =

1f27c79062385af Robert Richter  2020-01-23  432  	mci->dev.release =3D mci_=
release;
1f27c79062385af Robert Richter  2020-01-23  433  	device_initialize(&mci->d=
ev);
1f27c79062385af Robert Richter  2020-01-23  434  =

1f27c79062385af Robert Richter  2020-01-23  435  	/* setup index and variou=
s internal pointers */
1f27c79062385af Robert Richter  2020-01-23  436  	mci->mc_idx =3D mc_num;
1f27c79062385af Robert Richter  2020-01-23  437  	mci->tot_dimms =3D tot_di=
mms;
1f27c79062385af Robert Richter  2020-01-23  438  	mci->n_layers =3D n_layer=
s;
1f27c79062385af Robert Richter  2020-01-23  439  	memcpy(mci->layers, layer=
s, sizeof(*layer) * n_layers);
1f27c79062385af Robert Richter  2020-01-23  440  	mci->nr_csrows =3D tot_cs=
rows;
1f27c79062385af Robert Richter  2020-01-23  441  	mci->num_cschannel =3D to=
t_channels;
1f27c79062385af Robert Richter  2020-01-23  442  	mci->csbased =3D per_rank;
1f27c79062385af Robert Richter  2020-01-23  443  =

1f27c79062385af Robert Richter  2020-01-23  444  	if (edac_mc_alloc_csrows(=
mci))
1f27c79062385af Robert Richter  2020-01-23  445  		goto error;
1f27c79062385af Robert Richter  2020-01-23  446  =

1f27c79062385af Robert Richter  2020-01-23  447  	if (edac_mc_alloc_dimms(m=
ci))
1f27c79062385af Robert Richter  2020-01-23  448  		goto error;
1f27c79062385af Robert Richter  2020-01-23  449  =

1f27c79062385af Robert Richter  2020-01-23  450  	mci->op_state =3D OP_ALLO=
C;
1f27c79062385af Robert Richter  2020-01-23  451  =

1f27c79062385af Robert Richter  2020-01-23  452  	return mci;
1f27c79062385af Robert Richter  2020-01-23  453  =

1f27c79062385af Robert Richter  2020-01-23  454  error:
1f27c79062385af Robert Richter  2020-01-23  455  	_edac_mc_free(mci);
1f27c79062385af Robert Richter  2020-01-23  456  =

1f27c79062385af Robert Richter  2020-01-23  457  	return NULL;
1f27c79062385af Robert Richter  2020-01-23  458  }
1f27c79062385af Robert Richter  2020-01-23  459  EXPORT_SYMBOL_GPL(edac_mc_=
alloc);
1f27c79062385af Robert Richter  2020-01-23  460  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2839092838772619046==--

