Content-Type: multipart/mixed; boundary="===============7573122143253773655=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 3084/3449] drivers/edac/edac_device.c:72 edac_device_alloc_ctl_info() warn: Please consider using kcalloc instead
Date: Wed, 13 Apr 2022 01:59:49 +0800
Message-ID: <202204130153.Ax6BiCzO-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7573122143253773655==
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
commit: 9fb9ce392aae0c6654efc42c80e2f6bab88d5fe3 [3084/3449] EDAC/device: G=
et rid of the silly one-shot memory allocation in edac_device_alloc_ctl_inf=
o()
:::::: branch date: 12 hours ago
:::::: commit date: 32 hours ago
config: i386-randconfig-m021-20220411 (https://download.01.org/0day-ci/arch=
ive/20220413/202204130153.Ax6BiCzO-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-19) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/edac/edac_device.c:72 edac_device_alloc_ctl_info() warn: Please con=
sider using kcalloc instead

Old smatch warnings:
drivers/edac/edac_device.c:80 edac_device_alloc_ctl_info() warn: Please con=
sider using kcalloc instead
drivers/edac/edac_device.c:89 edac_device_alloc_ctl_info() warn: Please con=
sider using kcalloc instead

vim +72 drivers/edac/edac_device.c

e27e3dac651771f Douglas Thompson      2007-07-19   49  =

e27e3dac651771f Douglas Thompson      2007-07-19   50  struct edac_device_c=
tl_info *edac_device_alloc_ctl_info(
e27e3dac651771f Douglas Thompson      2007-07-19   51  	unsigned sz_private,
52490c8d07680a7 Douglas Thompson      2007-07-19   52  	char *edac_device_n=
ame, unsigned nr_instances,
52490c8d07680a7 Douglas Thompson      2007-07-19   53  	char *edac_block_na=
me, unsigned nr_blocks,
52490c8d07680a7 Douglas Thompson      2007-07-19   54  	unsigned offset_val=
ue,		/* zero, 1, or other based offset */
d45e7823baf655c Doug Thompson         2007-07-19   55  	struct edac_dev_sys=
fs_block_attribute *attrib_spec, unsigned nr_attrib,
d45e7823baf655c Doug Thompson         2007-07-19   56  	int device_index)
e27e3dac651771f Douglas Thompson      2007-07-19   57  {
e27e3dac651771f Douglas Thompson      2007-07-19   58  	struct edac_device_=
ctl_info *dev_ctl;
e27e3dac651771f Douglas Thompson      2007-07-19   59  	struct edac_device_=
instance *dev_inst, *inst;
e27e3dac651771f Douglas Thompson      2007-07-19   60  	struct edac_device_=
block *dev_blk, *blk_p, *blk;
fd309a9d8e63e91 Douglas Thompson      2007-07-19   61  	struct edac_dev_sys=
fs_block_attribute *dev_attrib, *attrib_p, *attrib;
e27e3dac651771f Douglas Thompson      2007-07-19   62  	unsigned instance, =
block, attr;
9fb9ce392aae0c6 Borislav Petkov       2022-03-08   63  	void *pvt;
1c3631ff1f805cb Douglas Thompson      2007-07-19   64  	int err;
e27e3dac651771f Douglas Thompson      2007-07-19   65  =

956b9ba156dbfdb Joe Perches           2012-04-29   66  	edac_dbg(4, "instan=
ces=3D%d blocks=3D%d\n", nr_instances, nr_blocks);
e27e3dac651771f Douglas Thompson      2007-07-19   67  =

9fb9ce392aae0c6 Borislav Petkov       2022-03-08   68  	dev_ctl =3D kzalloc=
(sizeof(struct edac_device_ctl_info), GFP_KERNEL);
9fb9ce392aae0c6 Borislav Petkov       2022-03-08   69  	if (!dev_ctl)
9fb9ce392aae0c6 Borislav Petkov       2022-03-08   70  		return NULL;
e27e3dac651771f Douglas Thompson      2007-07-19   71  =

9fb9ce392aae0c6 Borislav Petkov       2022-03-08  @72  	dev_inst =3D kmallo=
c_array(nr_instances,
9fb9ce392aae0c6 Borislav Petkov       2022-03-08   73  				 sizeof(struct e=
dac_device_instance),
9fb9ce392aae0c6 Borislav Petkov       2022-03-08   74  				 GFP_KERNEL | __=
GFP_ZERO);
9fb9ce392aae0c6 Borislav Petkov       2022-03-08   75  	if (!dev_inst)
9fb9ce392aae0c6 Borislav Petkov       2022-03-08   76  		goto free;
e27e3dac651771f Douglas Thompson      2007-07-19   77  =

9fb9ce392aae0c6 Borislav Petkov       2022-03-08   78  	dev_ctl->instances =
=3D dev_inst;
e27e3dac651771f Douglas Thompson      2007-07-19   79  =

9fb9ce392aae0c6 Borislav Petkov       2022-03-08   80  	dev_blk =3D kmalloc=
_array(nr_instances * nr_blocks,
9fb9ce392aae0c6 Borislav Petkov       2022-03-08   81  				sizeof(struct ed=
ac_device_block),
9fb9ce392aae0c6 Borislav Petkov       2022-03-08   82  				GFP_KERNEL | __G=
FP_ZERO);
9fb9ce392aae0c6 Borislav Petkov       2022-03-08   83  	if (!dev_blk)
9fb9ce392aae0c6 Borislav Petkov       2022-03-08   84  		goto free;
e27e3dac651771f Douglas Thompson      2007-07-19   85  =

9fb9ce392aae0c6 Borislav Petkov       2022-03-08   86  	dev_ctl->blocks =3D=
 dev_blk;
fd309a9d8e63e91 Douglas Thompson      2007-07-19   87  =

9fb9ce392aae0c6 Borislav Petkov       2022-03-08   88  	if (nr_attrib) {
9fb9ce392aae0c6 Borislav Petkov       2022-03-08   89  		dev_attrib =3D kma=
lloc_array(nr_attrib,
9fb9ce392aae0c6 Borislav Petkov       2022-03-08   90  					   sizeof(struc=
t edac_dev_sysfs_block_attribute),
9fb9ce392aae0c6 Borislav Petkov       2022-03-08   91  					   GFP_KERNEL |=
 __GFP_ZERO);
9fb9ce392aae0c6 Borislav Petkov       2022-03-08   92  		if (!dev_attrib)
9fb9ce392aae0c6 Borislav Petkov       2022-03-08   93  			goto free;
e27e3dac651771f Douglas Thompson      2007-07-19   94  =

9fb9ce392aae0c6 Borislav Petkov       2022-03-08   95  		dev_ctl->attribs =
=3D dev_attrib;
9fb9ce392aae0c6 Borislav Petkov       2022-03-08   96  	}
9fb9ce392aae0c6 Borislav Petkov       2022-03-08   97  =

9fb9ce392aae0c6 Borislav Petkov       2022-03-08   98  	if (sz_private) {
9fb9ce392aae0c6 Borislav Petkov       2022-03-08   99  		pvt =3D kzalloc(sz=
_private, GFP_KERNEL);
9fb9ce392aae0c6 Borislav Petkov       2022-03-08  100  		if (!pvt)
9fb9ce392aae0c6 Borislav Petkov       2022-03-08  101  			goto free;
9fb9ce392aae0c6 Borislav Petkov       2022-03-08  102  =

9fb9ce392aae0c6 Borislav Petkov       2022-03-08  103  		dev_ctl->pvt_info =
=3D pvt;
9fb9ce392aae0c6 Borislav Petkov       2022-03-08  104  	}
e27e3dac651771f Douglas Thompson      2007-07-19  105  =

d45e7823baf655c Doug Thompson         2007-07-19  106  	dev_ctl->dev_idx	=
=3D device_index;
e27e3dac651771f Douglas Thompson      2007-07-19  107  	dev_ctl->nr_instanc=
es	=3D nr_instances;
e27e3dac651771f Douglas Thompson      2007-07-19  108  =

56e61a9c5fe7b79 Doug Thompson         2008-02-07  109  	/* Default logging =
of CEs and UEs */
56e61a9c5fe7b79 Doug Thompson         2008-02-07  110  	dev_ctl->log_ce =3D=
 1;
56e61a9c5fe7b79 Doug Thompson         2008-02-07  111  	dev_ctl->log_ue =3D=
 1;
56e61a9c5fe7b79 Doug Thompson         2008-02-07  112  =

52490c8d07680a7 Douglas Thompson      2007-07-19  113  	/* Name of this eda=
c device */
e27e3dac651771f Douglas Thompson      2007-07-19  114  	snprintf(dev_ctl->n=
ame, sizeof(dev_ctl->name),"%s", edac_device_name);
e27e3dac651771f Douglas Thompson      2007-07-19  115  =

e27e3dac651771f Douglas Thompson      2007-07-19  116  	/* Initialize every=
 Instance */
e27e3dac651771f Douglas Thompson      2007-07-19  117  	for (instance =3D 0=
; instance < nr_instances; instance++) {
e27e3dac651771f Douglas Thompson      2007-07-19  118  		inst =3D &dev_inst=
[instance];
e27e3dac651771f Douglas Thompson      2007-07-19  119  		inst->ctl =3D dev_=
ctl;
e27e3dac651771f Douglas Thompson      2007-07-19  120  		inst->nr_blocks =
=3D nr_blocks;
e27e3dac651771f Douglas Thompson      2007-07-19  121  		blk_p =3D &dev_blk=
[instance * nr_blocks];
e27e3dac651771f Douglas Thompson      2007-07-19  122  		inst->blocks =3D b=
lk_p;
e27e3dac651771f Douglas Thompson      2007-07-19  123  =

e27e3dac651771f Douglas Thompson      2007-07-19  124  		/* name of this in=
stance */
e27e3dac651771f Douglas Thompson      2007-07-19  125  		snprintf(inst->nam=
e, sizeof(inst->name),
e27e3dac651771f Douglas Thompson      2007-07-19  126  			 "%s%u", edac_dev=
ice_name, instance);
e27e3dac651771f Douglas Thompson      2007-07-19  127  =

e27e3dac651771f Douglas Thompson      2007-07-19  128  		/* Initialize ever=
y block in each instance */
079708b9173595b Douglas Thompson      2007-07-19  129  		for (block =3D 0; =
block < nr_blocks; block++) {
e27e3dac651771f Douglas Thompson      2007-07-19  130  			blk =3D &blk_p[bl=
ock];
e27e3dac651771f Douglas Thompson      2007-07-19  131  			blk->instance =3D=
 inst;
e27e3dac651771f Douglas Thompson      2007-07-19  132  			snprintf(blk->nam=
e, sizeof(blk->name),
d391a7b8147d12b Douglas Thompson      2007-07-19  133  				 "%s%d", edac_bl=
ock_name, block+offset_value);
e27e3dac651771f Douglas Thompson      2007-07-19  134  =

956b9ba156dbfdb Joe Perches           2012-04-29  135  			edac_dbg(4, "inst=
ance=3D%d inst_p=3D%p block=3D#%d block_p=3D%p name=3D'%s'\n",
956b9ba156dbfdb Joe Perches           2012-04-29  136  				 instance, inst,=
 block, blk, blk->name);
e27e3dac651771f Douglas Thompson      2007-07-19  137  =

fd309a9d8e63e91 Douglas Thompson      2007-07-19  138  			/* if there are N=
O attributes OR no attribute pointer
fd309a9d8e63e91 Douglas Thompson      2007-07-19  139  			 * then continue =
on to next block iteration
e27e3dac651771f Douglas Thompson      2007-07-19  140  			 */
fd309a9d8e63e91 Douglas Thompson      2007-07-19  141  			if ((nr_attrib =
=3D=3D 0) || (attrib_spec =3D=3D NULL))
fd309a9d8e63e91 Douglas Thompson      2007-07-19  142  				continue;
fd309a9d8e63e91 Douglas Thompson      2007-07-19  143  =

fd309a9d8e63e91 Douglas Thompson      2007-07-19  144  			/* setup the attr=
ibute array for this block */
fd309a9d8e63e91 Douglas Thompson      2007-07-19  145  			blk->nr_attribs =
=3D nr_attrib;
fd309a9d8e63e91 Douglas Thompson      2007-07-19  146  			attrib_p =3D &dev=
_attrib[block*nr_instances*nr_attrib];
fd309a9d8e63e91 Douglas Thompson      2007-07-19  147  			blk->block_attrib=
utes =3D attrib_p;
fd309a9d8e63e91 Douglas Thompson      2007-07-19  148  =

956b9ba156dbfdb Joe Perches           2012-04-29  149  			edac_dbg(4, "THIS=
 BLOCK_ATTRIB=3D%p\n",
dd23cd6eb1f59ba Mauro Carvalho Chehab 2012-04-29  150  				 blk->block_attr=
ibutes);
b2a4ac0c2860b27 Doug Thompson         2007-07-19  151  =

fd309a9d8e63e91 Douglas Thompson      2007-07-19  152  			/* Initialize eve=
ry user specified attribute in this
fd309a9d8e63e91 Douglas Thompson      2007-07-19  153  			 * block with the=
 data the caller passed in
b2a4ac0c2860b27 Doug Thompson         2007-07-19  154  			 * Each block get=
s its own copy of pointers,
b2a4ac0c2860b27 Doug Thompson         2007-07-19  155  			 * and its unique=
 'value'
fd309a9d8e63e91 Douglas Thompson      2007-07-19  156  			 */
fd309a9d8e63e91 Douglas Thompson      2007-07-19  157  			for (attr =3D 0; =
attr < nr_attrib; attr++) {
e27e3dac651771f Douglas Thompson      2007-07-19  158  				attrib =3D &attr=
ib_p[attr];
e27e3dac651771f Douglas Thompson      2007-07-19  159  =

b2a4ac0c2860b27 Doug Thompson         2007-07-19  160  				/* populate the =
unique per attrib
b2a4ac0c2860b27 Doug Thompson         2007-07-19  161  				 * with the code=
 pointers and info
b2a4ac0c2860b27 Doug Thompson         2007-07-19  162  				 */
b2a4ac0c2860b27 Doug Thompson         2007-07-19  163  				attrib->attr =3D=
 attrib_spec[attr].attr;
b2a4ac0c2860b27 Doug Thompson         2007-07-19  164  				attrib->show =3D=
 attrib_spec[attr].show;
b2a4ac0c2860b27 Doug Thompson         2007-07-19  165  				attrib->store =
=3D attrib_spec[attr].store;
b2a4ac0c2860b27 Doug Thompson         2007-07-19  166  =

b2a4ac0c2860b27 Doug Thompson         2007-07-19  167  				attrib->block =
=3D blk;	/* up link */
b2a4ac0c2860b27 Doug Thompson         2007-07-19  168  =

956b9ba156dbfdb Joe Perches           2012-04-29  169  				edac_dbg(4, "all=
oc-attrib=3D%p attrib_name=3D'%s' attrib-spec=3D%p spec-name=3D%s\n",
dd23cd6eb1f59ba Mauro Carvalho Chehab 2012-04-29  170  					 attrib, attrib=
->attr.name,
b2a4ac0c2860b27 Doug Thompson         2007-07-19  171  					 &attrib_spec[a=
ttr],
b2a4ac0c2860b27 Doug Thompson         2007-07-19  172  					 attrib_spec[at=
tr].attr.name
b2a4ac0c2860b27 Doug Thompson         2007-07-19  173  					);
e27e3dac651771f Douglas Thompson      2007-07-19  174  			}
e27e3dac651771f Douglas Thompson      2007-07-19  175  		}
e27e3dac651771f Douglas Thompson      2007-07-19  176  	}
e27e3dac651771f Douglas Thompson      2007-07-19  177  =

e27e3dac651771f Douglas Thompson      2007-07-19  178  	/* Mark this instan=
ce as merely ALLOCATED */
e27e3dac651771f Douglas Thompson      2007-07-19  179  	dev_ctl->op_state =
=3D OP_ALLOC;
e27e3dac651771f Douglas Thompson      2007-07-19  180  =

1c3631ff1f805cb Douglas Thompson      2007-07-19  181  	/*
1c3631ff1f805cb Douglas Thompson      2007-07-19  182  	 * Initialize the '=
root' kobj for the edac_device controller
1c3631ff1f805cb Douglas Thompson      2007-07-19  183  	 */
1c3631ff1f805cb Douglas Thompson      2007-07-19  184  	err =3D edac_device=
_register_sysfs_main_kobj(dev_ctl);
9fb9ce392aae0c6 Borislav Petkov       2022-03-08  185  	if (err)
9fb9ce392aae0c6 Borislav Petkov       2022-03-08  186  		goto free;
1c3631ff1f805cb Douglas Thompson      2007-07-19  187  =

1c3631ff1f805cb Douglas Thompson      2007-07-19  188  	/* at this point, t=
he root kobj is valid, and in order to
1c3631ff1f805cb Douglas Thompson      2007-07-19  189  	 * 'free' the objec=
t, then the function:
1c3631ff1f805cb Douglas Thompson      2007-07-19  190  	 *	edac_device_unre=
gister_sysfs_main_kobj() must be called
1c3631ff1f805cb Douglas Thompson      2007-07-19  191  	 * which will perfo=
rm kobj unregistration and the actual free
1c3631ff1f805cb Douglas Thompson      2007-07-19  192  	 * will occur durin=
g the kobject callback operation
1c3631ff1f805cb Douglas Thompson      2007-07-19  193  	 */
1c3631ff1f805cb Douglas Thompson      2007-07-19  194  =

e27e3dac651771f Douglas Thompson      2007-07-19  195  	return dev_ctl;
9fb9ce392aae0c6 Borislav Petkov       2022-03-08  196  =

9fb9ce392aae0c6 Borislav Petkov       2022-03-08  197  free:
9fb9ce392aae0c6 Borislav Petkov       2022-03-08  198  	__edac_device_free_=
ctl_info(dev_ctl);
9fb9ce392aae0c6 Borislav Petkov       2022-03-08  199  =

9fb9ce392aae0c6 Borislav Petkov       2022-03-08  200  	return NULL;
e27e3dac651771f Douglas Thompson      2007-07-19  201  }
e27e3dac651771f Douglas Thompson      2007-07-19  202  EXPORT_SYMBOL_GPL(ed=
ac_device_alloc_ctl_info);
e27e3dac651771f Douglas Thompson      2007-07-19  203  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7573122143253773655==--

