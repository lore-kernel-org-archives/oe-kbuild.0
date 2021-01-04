Content-Type: multipart/mixed; boundary="===============8203582566453778778=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [RFC PATCH] mtd: spi-nor: write support for minor aligned partitions
Date: Tue, 05 Jan 2021 03:56:38 +0800
Message-ID: <202101050305.Mp3n7Tua-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8203582566453778778==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20210104122853.18428-1-git@johnthomson.fastmail.com.au>
References: <20210104122853.18428-1-git@johnthomson.fastmail.com.au>
TO: John Thomson <git@johnthomson.fastmail.com.au>

Hi John,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on linus/master]
[also build test WARNING on v5.11-rc2 next-20210104]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/John-Thomson/mtd-spi-nor-w=
rite-support-for-minor-aligned-partitions/20210104-203259
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
e71ba9452f0b5b2e8dc8aa5445198cd9214a6a62
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: x86_64-randconfig-m001-20210105 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/mtd/mtdpart.c:192 allocate_partition() error: uninitialized symbol =
'wr_alignment_minor'.

Old smatch warnings:
drivers/mtd/mtdpart.c:209 allocate_partition() error: uninitialized symbol =
'wr_alignment_minor'.

vim +/wr_alignment_minor +192 drivers/mtd/mtdpart.c

^1da177e4c3f4152 Linus Torvalds    2005-04-16   33  =

46b5889cc2c54bac Miquel Raynal     2020-01-14   34  static struct mtd_info =
*allocate_partition(struct mtd_info *parent,
46b5889cc2c54bac Miquel Raynal     2020-01-14   35  					   const struct mt=
d_partition *part,
46b5889cc2c54bac Miquel Raynal     2020-01-14   36  					   int partno, uin=
t64_t cur_offset)
^1da177e4c3f4152 Linus Torvalds    2005-04-16   37  {
9e3307a169537a6a Boris Brezillon   2020-05-03   38  	struct mtd_info *maste=
r =3D mtd_get_master(parent);
9e3307a169537a6a Boris Brezillon   2020-05-03   39  	int wr_alignment =3D (=
parent->flags & MTD_NO_ERASE) ?
9e3307a169537a6a Boris Brezillon   2020-05-03   40  			   master->writesize=
 : master->erasesize;
f861aba424a94bfa John Thomson      2021-01-04   41  	int wr_alignment_minor;
9e3307a169537a6a Boris Brezillon   2020-05-03   42  	u64 parent_size =3D mt=
d_is_partition(parent) ?
9e3307a169537a6a Boris Brezillon   2020-05-03   43  			  parent->part.size =
: parent->size;
9e3307a169537a6a Boris Brezillon   2020-05-03   44  	struct mtd_info *child;
f861aba424a94bfa John Thomson      2021-01-04   45  	u32 remainder, remaind=
er_minor;
5daa7b21496aebf0 Roman Tereshonkov 2010-09-17   46  	char *name;
1eeef2d7483a7e3f Chris Packham     2017-06-09   47  	u64 tmp;
^1da177e4c3f4152 Linus Torvalds    2005-04-16   48  =

^1da177e4c3f4152 Linus Torvalds    2005-04-16   49  	/* allocate the partit=
ion structure */
46b5889cc2c54bac Miquel Raynal     2020-01-14   50  	child =3D kzalloc(size=
of(*child), GFP_KERNEL);
5daa7b21496aebf0 Roman Tereshonkov 2010-09-17   51  	name =3D kstrdup(part-=
>name, GFP_KERNEL);
46b5889cc2c54bac Miquel Raynal     2020-01-14   52  	if (!name || !child) {
b33a2887396a1a52 Atsushi Nemoto    2008-07-19   53  		printk(KERN_ERR"memor=
y allocation error while creating partitions for \"%s\"\n",
0a9d72b69da6d8da Rafa=C5=82 Mi=C5=82ecki     2017-06-21   54  		       pare=
nt->name);
5daa7b21496aebf0 Roman Tereshonkov 2010-09-17   55  		kfree(name);
46b5889cc2c54bac Miquel Raynal     2020-01-14   56  		kfree(child);
5daa7b21496aebf0 Roman Tereshonkov 2010-09-17   57  		return ERR_PTR(-ENOME=
M);
^1da177e4c3f4152 Linus Torvalds    2005-04-16   58  	}
^1da177e4c3f4152 Linus Torvalds    2005-04-16   59  =

^1da177e4c3f4152 Linus Torvalds    2005-04-16   60  	/* set up the MTD obje=
ct for this partition */
46b5889cc2c54bac Miquel Raynal     2020-01-14   61  	child->type =3D parent=
->type;
46b5889cc2c54bac Miquel Raynal     2020-01-14   62  	child->part.flags =3D =
parent->flags & ~part->mask_flags;
9e3307a169537a6a Boris Brezillon   2020-05-03   63  	child->part.flags |=3D=
 part->add_flags;
46b5889cc2c54bac Miquel Raynal     2020-01-14   64  	child->flags =3D child=
->part.flags;
9e3307a169537a6a Boris Brezillon   2020-05-03   65  	child->part.size =3D p=
art->size;
46b5889cc2c54bac Miquel Raynal     2020-01-14   66  	child->writesize =3D p=
arent->writesize;
46b5889cc2c54bac Miquel Raynal     2020-01-14   67  	child->writebufsize =
=3D parent->writebufsize;
46b5889cc2c54bac Miquel Raynal     2020-01-14   68  	child->oobsize =3D par=
ent->oobsize;
46b5889cc2c54bac Miquel Raynal     2020-01-14   69  	child->oobavail =3D pa=
rent->oobavail;
46b5889cc2c54bac Miquel Raynal     2020-01-14   70  	child->subpage_sft =3D=
 parent->subpage_sft;
46b5889cc2c54bac Miquel Raynal     2020-01-14   71  =

46b5889cc2c54bac Miquel Raynal     2020-01-14   72  	child->name =3D name;
46b5889cc2c54bac Miquel Raynal     2020-01-14   73  	child->owner =3D paren=
t->owner;
^1da177e4c3f4152 Linus Torvalds    2005-04-16   74  =

727dc612c46b8f38 Dan Ehrenberg     2015-04-02   75  	/* NOTE: Historically,=
 we didn't arrange MTDs as a tree out of
727dc612c46b8f38 Dan Ehrenberg     2015-04-02   76  	 * concern for showing=
 the same data in multiple partitions.
727dc612c46b8f38 Dan Ehrenberg     2015-04-02   77  	 * However, it is very=
 useful to have the master node present,
727dc612c46b8f38 Dan Ehrenberg     2015-04-02   78  	 * so the MTD_PARTITIO=
NED_MASTER option allows that. The master
727dc612c46b8f38 Dan Ehrenberg     2015-04-02   79  	 * will have device no=
des etc only if this is set, so make the
727dc612c46b8f38 Dan Ehrenberg     2015-04-02   80  	 * parent conditional =
on that option. Note, this is a way to
46b5889cc2c54bac Miquel Raynal     2020-01-14   81  	 * distinguish between=
 the parent and its partitions in sysfs.
1f24b5a8ecbb2a3c David Brownell    2009-03-26   82  	 */
46b5889cc2c54bac Miquel Raynal     2020-01-14   83  	child->dev.parent =3D =
IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER) || mtd_is_partition(parent) ?
46b5889cc2c54bac Miquel Raynal     2020-01-14   84  			    &parent->dev : p=
arent->dev.parent;
46b5889cc2c54bac Miquel Raynal     2020-01-14   85  	child->dev.of_node =3D=
 part->of_node;
46b5889cc2c54bac Miquel Raynal     2020-01-14   86  	child->parent =3D pare=
nt;
46b5889cc2c54bac Miquel Raynal     2020-01-14   87  	child->part.offset =3D=
 part->offset;
46b5889cc2c54bac Miquel Raynal     2020-01-14   88  	INIT_LIST_HEAD(&child-=
>partitions);
46b5889cc2c54bac Miquel Raynal     2020-01-14   89  =

46b5889cc2c54bac Miquel Raynal     2020-01-14   90  	if (child->part.offset=
 =3D=3D MTDPART_OFS_APPEND)
46b5889cc2c54bac Miquel Raynal     2020-01-14   91  		child->part.offset =
=3D cur_offset;
46b5889cc2c54bac Miquel Raynal     2020-01-14   92  	if (child->part.offset=
 =3D=3D MTDPART_OFS_NXTBLK) {
1eeef2d7483a7e3f Chris Packham     2017-06-09   93  		tmp =3D cur_offset;
46b5889cc2c54bac Miquel Raynal     2020-01-14   94  		child->part.offset =
=3D cur_offset;
1eeef2d7483a7e3f Chris Packham     2017-06-09   95  		remainder =3D do_div(=
tmp, wr_alignment);
1eeef2d7483a7e3f Chris Packham     2017-06-09   96  		if (remainder) {
46b5889cc2c54bac Miquel Raynal     2020-01-14   97  			child->part.offset +=
=3D wr_alignment - remainder;
^1da177e4c3f4152 Linus Torvalds    2005-04-16   98  			printk(KERN_NOTICE "=
Moving partition %d: "
69423d99fc182a81 Adrian Hunter     2008-12-10   99  			       "0x%012llx ->=
 0x%012llx\n", partno,
46b5889cc2c54bac Miquel Raynal     2020-01-14  100  			       (unsigned lon=
g long)cur_offset,
46b5889cc2c54bac Miquel Raynal     2020-01-14  101  			       child->part.o=
ffset);
^1da177e4c3f4152 Linus Torvalds    2005-04-16  102  		}
^1da177e4c3f4152 Linus Torvalds    2005-04-16  103  	}
46b5889cc2c54bac Miquel Raynal     2020-01-14  104  	if (child->part.offset=
 =3D=3D MTDPART_OFS_RETAIN) {
46b5889cc2c54bac Miquel Raynal     2020-01-14  105  		child->part.offset =
=3D cur_offset;
9e3307a169537a6a Boris Brezillon   2020-05-03  106  		if (parent_size - chi=
ld->part.offset >=3D child->part.size) {
9e3307a169537a6a Boris Brezillon   2020-05-03  107  			child->part.size =3D=
 parent_size - child->part.offset -
9e3307a169537a6a Boris Brezillon   2020-05-03  108  					   child->part.siz=
e;
1a31368bf92ef2a7 Dmitry Baryshkov  2011-06-06  109  		} else {
1a31368bf92ef2a7 Dmitry Baryshkov  2011-06-06  110  			printk(KERN_ERR "mtd=
 partition \"%s\" doesn't have enough space: %#llx < %#llx, disabled\n",
9e3307a169537a6a Boris Brezillon   2020-05-03  111  				part->name, parent_=
size - child->part.offset,
9e3307a169537a6a Boris Brezillon   2020-05-03  112  				child->part.size);
1a31368bf92ef2a7 Dmitry Baryshkov  2011-06-06  113  			/* register to prese=
rve ordering */
1a31368bf92ef2a7 Dmitry Baryshkov  2011-06-06  114  			goto out_register;
1a31368bf92ef2a7 Dmitry Baryshkov  2011-06-06  115  		}
1a31368bf92ef2a7 Dmitry Baryshkov  2011-06-06  116  	}
9e3307a169537a6a Boris Brezillon   2020-05-03  117  	if (child->part.size =
=3D=3D MTDPART_SIZ_FULL)
9e3307a169537a6a Boris Brezillon   2020-05-03  118  		child->part.size =3D =
parent_size - child->part.offset;
^1da177e4c3f4152 Linus Torvalds    2005-04-16  119  =

46b5889cc2c54bac Miquel Raynal     2020-01-14  120  	printk(KERN_NOTICE "0x=
%012llx-0x%012llx : \"%s\"\n",
9e3307a169537a6a Boris Brezillon   2020-05-03  121  	       child->part.off=
set, child->part.offset + child->part.size,
46b5889cc2c54bac Miquel Raynal     2020-01-14  122  	       child->name);
^1da177e4c3f4152 Linus Torvalds    2005-04-16  123  =

^1da177e4c3f4152 Linus Torvalds    2005-04-16  124  	/* let's do some sanit=
y checks */
9e3307a169537a6a Boris Brezillon   2020-05-03  125  	if (child->part.offset=
 >=3D parent_size) {
^1da177e4c3f4152 Linus Torvalds    2005-04-16  126  		/* let's register it =
anyway to preserve ordering */
46b5889cc2c54bac Miquel Raynal     2020-01-14  127  		child->part.offset =
=3D 0;
9e3307a169537a6a Boris Brezillon   2020-05-03  128  		child->part.size =3D =
0;
ad4635153034c20c Boris Brezillon   2019-01-30  129  =

ad4635153034c20c Boris Brezillon   2019-01-30  130  		/* Initialize ->erase=
size to make add_mtd_device() happy. */
46b5889cc2c54bac Miquel Raynal     2020-01-14  131  		child->erasesize =3D =
parent->erasesize;
b33a2887396a1a52 Atsushi Nemoto    2008-07-19  132  		printk(KERN_ERR"mtd: =
partition \"%s\" is out of reach -- disabled\n",
7788ba71a6046de1 Atsushi Nemoto    2008-07-19  133  			part->name);
f636ffb420f0f905 Atsushi Nemoto    2008-07-19  134  		goto out_register;
^1da177e4c3f4152 Linus Torvalds    2005-04-16  135  	}
9e3307a169537a6a Boris Brezillon   2020-05-03  136  	if (child->part.offset=
 + child->part.size > parent->size) {
9e3307a169537a6a Boris Brezillon   2020-05-03  137  		child->part.size =3D =
parent_size - child->part.offset;
69423d99fc182a81 Adrian Hunter     2008-12-10  138  		printk(KERN_WARNING"m=
td: partition \"%s\" extends beyond the end of device \"%s\" -- size trunca=
ted to %#llx\n",
9e3307a169537a6a Boris Brezillon   2020-05-03  139  			part->name, parent->=
name, child->part.size);
^1da177e4c3f4152 Linus Torvalds    2005-04-16  140  	}
9e3307a169537a6a Boris Brezillon   2020-05-03  141  =

0a9d72b69da6d8da Rafa=C5=82 Mi=C5=82ecki     2017-06-21  142  	if (parent->=
numeraseregions > 1) {
^1da177e4c3f4152 Linus Torvalds    2005-04-16  143  		/* Deal with variable=
 erase size stuff */
0a9d72b69da6d8da Rafa=C5=82 Mi=C5=82ecki     2017-06-21  144  		int i, max =
=3D parent->numeraseregions;
9e3307a169537a6a Boris Brezillon   2020-05-03  145  		u64 end =3D child->pa=
rt.offset + child->part.size;
0a9d72b69da6d8da Rafa=C5=82 Mi=C5=82ecki     2017-06-21  146  		struct mtd_=
erase_region_info *regions =3D parent->eraseregions;
f861aba424a94bfa John Thomson      2021-01-04  147  		uint32_t erasesize_mi=
nor =3D child->erasesize;
^1da177e4c3f4152 Linus Torvalds    2005-04-16  148  =

6910c1368104d50e Atsushi Nemoto    2008-07-19  149  		/* Find the first era=
se regions which is part of this
6910c1368104d50e Atsushi Nemoto    2008-07-19  150  		 * partition. */
46b5889cc2c54bac Miquel Raynal     2020-01-14  151  		for (i =3D 0; i < max=
 && regions[i].offset <=3D child->part.offset;
46b5889cc2c54bac Miquel Raynal     2020-01-14  152  		     i++)
^1da177e4c3f4152 Linus Torvalds    2005-04-16  153  			;
6910c1368104d50e Atsushi Nemoto    2008-07-19  154  		/* The loop searched =
for the region _behind_ the first one */
a57ca0466af5da83 Roel Kluin        2009-09-18  155  		if (i > 0)
6910c1368104d50e Atsushi Nemoto    2008-07-19  156  			i--;
^1da177e4c3f4152 Linus Torvalds    2005-04-16  157  =

6910c1368104d50e Atsushi Nemoto    2008-07-19  158  		for (; i < max && reg=
ions[i].offset < end; i++) {
f861aba424a94bfa John Thomson      2021-01-04  159  			/* Pick biggest eras=
esize */
46b5889cc2c54bac Miquel Raynal     2020-01-14  160  			if (child->erasesize=
 < regions[i].erasesize)
46b5889cc2c54bac Miquel Raynal     2020-01-14  161  				child->erasesize =
=3D regions[i].erasesize;
f861aba424a94bfa John Thomson      2021-01-04  162  			/* Pick smallest non=
-zero erasesize */
f861aba424a94bfa John Thomson      2021-01-04  163  			if ((erasesize_minor=
 > regions[i].erasesize) && (regions[i].erasesize > 0))
f861aba424a94bfa John Thomson      2021-01-04  164  				erasesize_minor =3D=
 regions[i].erasesize;
^1da177e4c3f4152 Linus Torvalds    2005-04-16  165  		}
f861aba424a94bfa John Thomson      2021-01-04  166  =

f861aba424a94bfa John Thomson      2021-01-04  167  		if (erasesize_minor <=
 child->erasesize)
f861aba424a94bfa John Thomson      2021-01-04  168  			child->erasesize_min=
or =3D erasesize_minor;
f861aba424a94bfa John Thomson      2021-01-04  169  =

46b5889cc2c54bac Miquel Raynal     2020-01-14  170  		BUG_ON(child->erasesi=
ze =3D=3D 0);
^1da177e4c3f4152 Linus Torvalds    2005-04-16  171  	} else {
^1da177e4c3f4152 Linus Torvalds    2005-04-16  172  		/* Single erase size =
*/
9e3307a169537a6a Boris Brezillon   2020-05-03  173  		child->erasesize =3D =
master->erasesize;
f861aba424a94bfa John Thomson      2021-01-04  174  		if (master->erasesize=
_minor)
f861aba424a94bfa John Thomson      2021-01-04  175  			child->erasesize_min=
or =3D master->erasesize_minor;
^1da177e4c3f4152 Linus Torvalds    2005-04-16  176  	}
^1da177e4c3f4152 Linus Torvalds    2005-04-16  177  =

7e439681af829840 Boris Brezillon   2017-09-25  178  	/*
46b5889cc2c54bac Miquel Raynal     2020-01-14  179  	 * Child erasesize mig=
ht differ from the parent one if the parent
7e439681af829840 Boris Brezillon   2017-09-25  180  	 * exposes several reg=
ions with different erasesize. Adjust
7e439681af829840 Boris Brezillon   2017-09-25  181  	 * wr_alignment accord=
ingly.
7e439681af829840 Boris Brezillon   2017-09-25  182  	 */
f861aba424a94bfa John Thomson      2021-01-04  183  	if (!(child->flags & M=
TD_NO_ERASE)) {
46b5889cc2c54bac Miquel Raynal     2020-01-14  184  		wr_alignment =3D chil=
d->erasesize;
f861aba424a94bfa John Thomson      2021-01-04  185  		if (child->erasesize_=
minor)
f861aba424a94bfa John Thomson      2021-01-04  186  			wr_alignment_minor =
=3D child->erasesize_minor;
f861aba424a94bfa John Thomson      2021-01-04  187  	}
7e439681af829840 Boris Brezillon   2017-09-25  188  =

46b5889cc2c54bac Miquel Raynal     2020-01-14  189  	tmp =3D mtd_get_master=
_ofs(child, 0);
1eeef2d7483a7e3f Chris Packham     2017-06-09  190  	remainder =3D do_div(t=
mp, wr_alignment);
46b5889cc2c54bac Miquel Raynal     2020-01-14  191  	if ((child->flags & MT=
D_WRITEABLE) && remainder) {
f861aba424a94bfa John Thomson      2021-01-04 @192  		if (wr_alignment_mino=
r) {
f861aba424a94bfa John Thomson      2021-01-04  193  			tmp =3D mtd_get_mast=
er_ofs(child, 0);
f861aba424a94bfa John Thomson      2021-01-04  194  			remainder_minor =3D =
do_div(tmp, wr_alignment_minor);
f861aba424a94bfa John Thomson      2021-01-04  195  			if (remainder_minor =
=3D=3D 0)
f861aba424a94bfa John Thomson      2021-01-04  196  				child->erasesize =
=3D child->erasesize_minor;
f861aba424a94bfa John Thomson      2021-01-04  197  		}
f861aba424a94bfa John Thomson      2021-01-04  198  =

f861aba424a94bfa John Thomson      2021-01-04  199  		if ((!wr_alignment_mi=
nor) || (wr_alignment_minor && remainder_minor !=3D 0)) {
46b5889cc2c54bac Miquel Raynal     2020-01-14  200  			child->flags &=3D ~M=
TD_WRITEABLE;
1eeef2d7483a7e3f Chris Packham     2017-06-09  201  			printk(KERN_WARNING"=
mtd: partition \"%s\" doesn't start on an erase/write block boundary -- for=
ce read-only\n",
7788ba71a6046de1 Atsushi Nemoto    2008-07-19  202  				part->name);
^1da177e4c3f4152 Linus Torvalds    2005-04-16  203  		}
f861aba424a94bfa John Thomson      2021-01-04  204  	}
1eeef2d7483a7e3f Chris Packham     2017-06-09  205  =

9e3307a169537a6a Boris Brezillon   2020-05-03  206  	tmp =3D mtd_get_master=
_ofs(child, 0) + child->part.size;
1eeef2d7483a7e3f Chris Packham     2017-06-09  207  	remainder =3D do_div(t=
mp, wr_alignment);
46b5889cc2c54bac Miquel Raynal     2020-01-14  208  	if ((child->flags & MT=
D_WRITEABLE) && remainder) {
f861aba424a94bfa John Thomson      2021-01-04  209  		if (wr_alignment_mino=
r) {
f861aba424a94bfa John Thomson      2021-01-04  210  			tmp =3D mtd_get_mast=
er_ofs(child, 0) + child->part.size;
f861aba424a94bfa John Thomson      2021-01-04  211  			remainder_minor =3D =
do_div(tmp, wr_alignment_minor);
f861aba424a94bfa John Thomson      2021-01-04  212  			if (remainder_minor =
=3D=3D 0)
f861aba424a94bfa John Thomson      2021-01-04  213  				child->erasesize =
=3D child->erasesize_minor;
f861aba424a94bfa John Thomson      2021-01-04  214  		}
f861aba424a94bfa John Thomson      2021-01-04  215  		if ((!wr_alignment_mi=
nor) || (wr_alignment_minor && remainder_minor !=3D 0)) {
46b5889cc2c54bac Miquel Raynal     2020-01-14  216  			child->flags &=3D ~M=
TD_WRITEABLE;
1eeef2d7483a7e3f Chris Packham     2017-06-09  217  			printk(KERN_WARNING"=
mtd: partition \"%s\" doesn't end on an erase/write block -- force read-onl=
y\n",
7788ba71a6046de1 Atsushi Nemoto    2008-07-19  218  				part->name);
^1da177e4c3f4152 Linus Torvalds    2005-04-16  219  		}
f861aba424a94bfa John Thomson      2021-01-04  220  	}
^1da177e4c3f4152 Linus Torvalds    2005-04-16  221  =

9e3307a169537a6a Boris Brezillon   2020-05-03  222  	child->size =3D child-=
>part.size;
46b5889cc2c54bac Miquel Raynal     2020-01-14  223  	child->ecc_step_size =
=3D parent->ecc_step_size;
46b5889cc2c54bac Miquel Raynal     2020-01-14  224  	child->ecc_strength =
=3D parent->ecc_strength;
46b5889cc2c54bac Miquel Raynal     2020-01-14  225  	child->bitflip_thresho=
ld =3D parent->bitflip_threshold;
d062d4ede877fcd2 Mike Dunn         2012-04-25  226  =

46b5889cc2c54bac Miquel Raynal     2020-01-14  227  	if (master->_block_isb=
ad) {
69423d99fc182a81 Adrian Hunter     2008-12-10  228  		uint64_t offs =3D 0;
f1a28c02843efcfc Thomas Gleixner   2006-05-30  229  =

9e3307a169537a6a Boris Brezillon   2020-05-03  230  		while (offs < child->=
part.size) {
46b5889cc2c54bac Miquel Raynal     2020-01-14  231  			if (mtd_block_isrese=
rved(child, offs))
46b5889cc2c54bac Miquel Raynal     2020-01-14  232  				child->ecc_stats.bb=
tblocks++;
46b5889cc2c54bac Miquel Raynal     2020-01-14  233  			else if (mtd_block_i=
sbad(child, offs))
46b5889cc2c54bac Miquel Raynal     2020-01-14  234  				child->ecc_stats.ba=
dblocks++;
46b5889cc2c54bac Miquel Raynal     2020-01-14  235  			offs +=3D child->era=
sesize;
f1a28c02843efcfc Thomas Gleixner   2006-05-30  236  		}
f1a28c02843efcfc Thomas Gleixner   2006-05-30  237  	}
^1da177e4c3f4152 Linus Torvalds    2005-04-16  238  =

f636ffb420f0f905 Atsushi Nemoto    2008-07-19  239  out_register:
46b5889cc2c54bac Miquel Raynal     2020-01-14  240  	return child;
7788ba71a6046de1 Atsushi Nemoto    2008-07-19  241  }
7788ba71a6046de1 Atsushi Nemoto    2008-07-19  242  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============8203582566453778778==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============8203582566453778778==--

