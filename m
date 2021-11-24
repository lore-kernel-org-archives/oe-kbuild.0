Content-Type: multipart/mixed; boundary="===============4341541787693033730=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/mtd/ftl.c:220 build_maps() warn: should '(i + __builtin_bswap16(((part->header.FirstPhysicalEUN)))) << part->header.EraseUnitSize' be a 64 bit type?
Date: Wed, 24 Nov 2021 09:34:56 +0800
Message-ID: <202111240919.sziVw7Sv-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4341541787693033730==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   5d9f4cf36721aba199975a9be7863a3ff5cd4b59
commit: d991bb1c8da842a2a0b9dc83b1005e655783f861 include/linux/compiler-gcc=
.h: sparse can do constant folding of __builtin_bswap*()
date:   7 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 7 months ago
config: s390-randconfig-m031-20211123 (https://download.01.org/0day-ci/arch=
ive/20211124/202111240919.sziVw7Sv-lkp(a)intel.com/config.gz)
compiler: s390-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/mtd/ftl.c:220 build_maps() warn: should '(i + __builtin_bswap16(((p=
art->header.FirstPhysicalEUN)))) << part->header.EraseUnitSize' be a 64 bit=
 type?

Old smatch warnings:
drivers/mtd/ftl.c:347 erase_xfer() warn: should '1 << part->header.EraseUni=
tSize' be a 64 bit type?
drivers/mtd/ftl.c:605 reclaim_block() warn: inconsistent indenting

vim +220 drivers/mtd/ftl.c

^1da177e4c3f41 Linus Torvalds   2005-04-16  191  =

^1da177e4c3f41 Linus Torvalds   2005-04-16  192  static int build_maps(part=
ition_t *part)
^1da177e4c3f41 Linus Torvalds   2005-04-16  193  {
^1da177e4c3f41 Linus Torvalds   2005-04-16  194      erase_unit_header_t he=
ader;
3854be7712f7b4 David Woodhouse  2008-12-10  195      uint16_t xvalid, xtran=
s, i;
3854be7712f7b4 David Woodhouse  2008-12-10  196      unsigned blocks, j;
^1da177e4c3f41 Linus Torvalds   2005-04-16  197      int hdr_ok, ret =3D -1;
^1da177e4c3f41 Linus Torvalds   2005-04-16  198      ssize_t retval;
^1da177e4c3f41 Linus Torvalds   2005-04-16  199      loff_t offset;
^1da177e4c3f41 Linus Torvalds   2005-04-16  200  =

^1da177e4c3f41 Linus Torvalds   2005-04-16  201      /* Set up erase unit m=
aps */
^1da177e4c3f41 Linus Torvalds   2005-04-16  202      part->DataUnits =3D le=
16_to_cpu(part->header.NumEraseUnits) -
^1da177e4c3f41 Linus Torvalds   2005-04-16  203  	part->header.NumTransferU=
nits;
6da2ec56059c3c Kees Cook        2018-06-12  204      part->EUNInfo =3D kmal=
loc_array(part->DataUnits, sizeof(struct eun_info_t),
^1da177e4c3f41 Linus Torvalds   2005-04-16  205                            =
        GFP_KERNEL);
^1da177e4c3f41 Linus Torvalds   2005-04-16  206      if (!part->EUNInfo)
^1da177e4c3f41 Linus Torvalds   2005-04-16  207  	    goto out;
^1da177e4c3f41 Linus Torvalds   2005-04-16  208      for (i =3D 0; i < part=
->DataUnits; i++)
^1da177e4c3f41 Linus Torvalds   2005-04-16  209  	part->EUNInfo[i].Offset =
=3D 0xffffffff;
^1da177e4c3f41 Linus Torvalds   2005-04-16  210      part->XferInfo =3D
6da2ec56059c3c Kees Cook        2018-06-12  211  	kmalloc_array(part->heade=
r.NumTransferUnits,
6da2ec56059c3c Kees Cook        2018-06-12  212                        size=
of(struct xfer_info_t),
^1da177e4c3f41 Linus Torvalds   2005-04-16  213                        GFP_=
KERNEL);
^1da177e4c3f41 Linus Torvalds   2005-04-16  214      if (!part->XferInfo)
^1da177e4c3f41 Linus Torvalds   2005-04-16  215  	    goto out_EUNInfo;
^1da177e4c3f41 Linus Torvalds   2005-04-16  216  =

^1da177e4c3f41 Linus Torvalds   2005-04-16  217      xvalid =3D xtrans =3D =
0;
^1da177e4c3f41 Linus Torvalds   2005-04-16  218      for (i =3D 0; i < le16=
_to_cpu(part->header.NumEraseUnits); i++) {
^1da177e4c3f41 Linus Torvalds   2005-04-16  219  	offset =3D ((i + le16_to_=
cpu(part->header.FirstPhysicalEUN))
^1da177e4c3f41 Linus Torvalds   2005-04-16 @220  		      << part->header.Er=
aseUnitSize);
329ad399a9b3ad Artem Bityutskiy 2011-12-23  221  	ret =3D mtd_read(part->mb=
d.mtd, offset, sizeof(header), &retval,
^1da177e4c3f41 Linus Torvalds   2005-04-16  222                         (un=
signed char *)&header);
^1da177e4c3f41 Linus Torvalds   2005-04-16  223  =

^1da177e4c3f41 Linus Torvalds   2005-04-16  224  	if (ret)
^1da177e4c3f41 Linus Torvalds   2005-04-16  225  	    goto out_XferInfo;
^1da177e4c3f41 Linus Torvalds   2005-04-16  226  =

^1da177e4c3f41 Linus Torvalds   2005-04-16  227  	ret =3D -1;
^1da177e4c3f41 Linus Torvalds   2005-04-16  228  	/* Is this a transfer par=
tition? */
^1da177e4c3f41 Linus Torvalds   2005-04-16  229  	hdr_ok =3D (strcmp(header=
.DataOrgTuple+3, "FTL100") =3D=3D 0);
^1da177e4c3f41 Linus Torvalds   2005-04-16  230  	if (hdr_ok && (le16_to_cp=
u(header.LogicalEUN) < part->DataUnits) &&
^1da177e4c3f41 Linus Torvalds   2005-04-16  231  	    (part->EUNInfo[le16_t=
o_cpu(header.LogicalEUN)].Offset =3D=3D 0xffffffff)) {
^1da177e4c3f41 Linus Torvalds   2005-04-16  232  	    part->EUNInfo[le16_to=
_cpu(header.LogicalEUN)].Offset =3D offset;
^1da177e4c3f41 Linus Torvalds   2005-04-16  233  	    part->EUNInfo[le16_to=
_cpu(header.LogicalEUN)].EraseCount =3D
^1da177e4c3f41 Linus Torvalds   2005-04-16  234  		le32_to_cpu(header.Erase=
Count);
^1da177e4c3f41 Linus Torvalds   2005-04-16  235  	    xvalid++;
^1da177e4c3f41 Linus Torvalds   2005-04-16  236  	} else {
^1da177e4c3f41 Linus Torvalds   2005-04-16  237  	    if (xtrans =3D=3D par=
t->header.NumTransferUnits) {
^1da177e4c3f41 Linus Torvalds   2005-04-16  238  		printk(KERN_NOTICE "ftl_=
cs: format error: too many "
^1da177e4c3f41 Linus Torvalds   2005-04-16  239  		       "transfer units!\=
n");
^1da177e4c3f41 Linus Torvalds   2005-04-16  240  		goto out_XferInfo;
^1da177e4c3f41 Linus Torvalds   2005-04-16  241  	    }
^1da177e4c3f41 Linus Torvalds   2005-04-16  242  	    if (hdr_ok && (le16_t=
o_cpu(header.LogicalEUN) =3D=3D 0xffff)) {
^1da177e4c3f41 Linus Torvalds   2005-04-16  243  		part->XferInfo[xtrans].s=
tate =3D XFER_PREPARED;
^1da177e4c3f41 Linus Torvalds   2005-04-16  244  		part->XferInfo[xtrans].E=
raseCount =3D le32_to_cpu(header.EraseCount);
^1da177e4c3f41 Linus Torvalds   2005-04-16  245  	    } else {
^1da177e4c3f41 Linus Torvalds   2005-04-16  246  		part->XferInfo[xtrans].s=
tate =3D XFER_UNKNOWN;
^1da177e4c3f41 Linus Torvalds   2005-04-16  247  		/* Pick anything reasona=
ble for the erase count */
^1da177e4c3f41 Linus Torvalds   2005-04-16  248  		part->XferInfo[xtrans].E=
raseCount =3D
^1da177e4c3f41 Linus Torvalds   2005-04-16  249  		    le32_to_cpu(part->he=
ader.EraseCount);
^1da177e4c3f41 Linus Torvalds   2005-04-16  250  	    }
^1da177e4c3f41 Linus Torvalds   2005-04-16  251  	    part->XferInfo[xtrans=
].Offset =3D offset;
^1da177e4c3f41 Linus Torvalds   2005-04-16  252  	    xtrans++;
^1da177e4c3f41 Linus Torvalds   2005-04-16  253  	}
^1da177e4c3f41 Linus Torvalds   2005-04-16  254      }
^1da177e4c3f41 Linus Torvalds   2005-04-16  255      /* Check for format tr=
ouble */
^1da177e4c3f41 Linus Torvalds   2005-04-16  256      header =3D part->heade=
r;
^1da177e4c3f41 Linus Torvalds   2005-04-16  257      if ((xtrans !=3D heade=
r.NumTransferUnits) ||
^1da177e4c3f41 Linus Torvalds   2005-04-16  258  	(xvalid+xtrans !=3D le16_=
to_cpu(header.NumEraseUnits))) {
^1da177e4c3f41 Linus Torvalds   2005-04-16  259  	printk(KERN_NOTICE "ftl_c=
s: format error: erase units "
^1da177e4c3f41 Linus Torvalds   2005-04-16  260  	       "don't add up!\n");
^1da177e4c3f41 Linus Torvalds   2005-04-16  261  	goto out_XferInfo;
^1da177e4c3f41 Linus Torvalds   2005-04-16  262      }
^1da177e4c3f41 Linus Torvalds   2005-04-16  263  =

^1da177e4c3f41 Linus Torvalds   2005-04-16  264      /* Set up virtual page=
 map */
^1da177e4c3f41 Linus Torvalds   2005-04-16  265      blocks =3D le32_to_cpu=
(header.FormattedSize) >> header.BlockSize;
42bc47b35320e0 Kees Cook        2018-06-12  266      part->VirtualBlockMap =
=3D vmalloc(array_size(blocks, sizeof(uint32_t)));
^1da177e4c3f41 Linus Torvalds   2005-04-16  267      if (!part->VirtualBloc=
kMap)
^1da177e4c3f41 Linus Torvalds   2005-04-16  268  	    goto out_XferInfo;
^1da177e4c3f41 Linus Torvalds   2005-04-16  269  =

3854be7712f7b4 David Woodhouse  2008-12-10  270      memset(part->VirtualBl=
ockMap, 0xff, blocks * sizeof(uint32_t));
^1da177e4c3f41 Linus Torvalds   2005-04-16  271      part->BlocksPerUnit =
=3D (1 << header.EraseUnitSize) >> header.BlockSize;
^1da177e4c3f41 Linus Torvalds   2005-04-16  272  =

6da2ec56059c3c Kees Cook        2018-06-12  273      part->bam_cache =3D km=
alloc_array(part->BlocksPerUnit, sizeof(uint32_t),
^1da177e4c3f41 Linus Torvalds   2005-04-16  274                            =
          GFP_KERNEL);
^1da177e4c3f41 Linus Torvalds   2005-04-16  275      if (!part->bam_cache)
^1da177e4c3f41 Linus Torvalds   2005-04-16  276  	    goto out_VirtualBlock=
Map;
^1da177e4c3f41 Linus Torvalds   2005-04-16  277  =

^1da177e4c3f41 Linus Torvalds   2005-04-16  278      part->bam_index =3D 0x=
ffff;
^1da177e4c3f41 Linus Torvalds   2005-04-16  279      part->FreeTotal =3D 0;
^1da177e4c3f41 Linus Torvalds   2005-04-16  280  =

^1da177e4c3f41 Linus Torvalds   2005-04-16  281      for (i =3D 0; i < part=
->DataUnits; i++) {
^1da177e4c3f41 Linus Torvalds   2005-04-16  282  	part->EUNInfo[i].Free =3D=
 0;
^1da177e4c3f41 Linus Torvalds   2005-04-16  283  	part->EUNInfo[i].Deleted =
=3D 0;
^1da177e4c3f41 Linus Torvalds   2005-04-16  284  	offset =3D part->EUNInfo[=
i].Offset + le32_to_cpu(header.BAMOffset);
^1da177e4c3f41 Linus Torvalds   2005-04-16  285  =

329ad399a9b3ad Artem Bityutskiy 2011-12-23  286  	ret =3D mtd_read(part->mb=
d.mtd, offset,
3854be7712f7b4 David Woodhouse  2008-12-10  287                         par=
t->BlocksPerUnit * sizeof(uint32_t), &retval,
^1da177e4c3f41 Linus Torvalds   2005-04-16  288                         (un=
signed char *)part->bam_cache);
^1da177e4c3f41 Linus Torvalds   2005-04-16  289  =

^1da177e4c3f41 Linus Torvalds   2005-04-16  290  	if (ret)
^1da177e4c3f41 Linus Torvalds   2005-04-16  291  		goto out_bam_cache;
^1da177e4c3f41 Linus Torvalds   2005-04-16  292  =

^1da177e4c3f41 Linus Torvalds   2005-04-16  293  	for (j =3D 0; j < part->B=
locksPerUnit; j++) {
^1da177e4c3f41 Linus Torvalds   2005-04-16  294  	    if (BLOCK_FREE(le32_t=
o_cpu(part->bam_cache[j]))) {
^1da177e4c3f41 Linus Torvalds   2005-04-16  295  		part->EUNInfo[i].Free++;
^1da177e4c3f41 Linus Torvalds   2005-04-16  296  		part->FreeTotal++;
^1da177e4c3f41 Linus Torvalds   2005-04-16  297  	    } else if ((BLOCK_TYP=
E(le32_to_cpu(part->bam_cache[j])) =3D=3D BLOCK_DATA) &&
^1da177e4c3f41 Linus Torvalds   2005-04-16  298  		     (BLOCK_NUMBER(le32_=
to_cpu(part->bam_cache[j])) < blocks))
^1da177e4c3f41 Linus Torvalds   2005-04-16  299  		part->VirtualBlockMap[BL=
OCK_NUMBER(le32_to_cpu(part->bam_cache[j]))] =3D
^1da177e4c3f41 Linus Torvalds   2005-04-16  300  		    (i << header.EraseUn=
itSize) + (j << header.BlockSize);
^1da177e4c3f41 Linus Torvalds   2005-04-16  301  	    else if (BLOCK_DELETE=
D(le32_to_cpu(part->bam_cache[j])))
^1da177e4c3f41 Linus Torvalds   2005-04-16  302  		part->EUNInfo[i].Deleted=
++;
^1da177e4c3f41 Linus Torvalds   2005-04-16  303  	}
^1da177e4c3f41 Linus Torvalds   2005-04-16  304      }
^1da177e4c3f41 Linus Torvalds   2005-04-16  305  =

^1da177e4c3f41 Linus Torvalds   2005-04-16  306      ret =3D 0;
^1da177e4c3f41 Linus Torvalds   2005-04-16  307      goto out;
^1da177e4c3f41 Linus Torvalds   2005-04-16  308  =

^1da177e4c3f41 Linus Torvalds   2005-04-16  309  out_bam_cache:
^1da177e4c3f41 Linus Torvalds   2005-04-16  310      kfree(part->bam_cache);
^1da177e4c3f41 Linus Torvalds   2005-04-16  311  out_VirtualBlockMap:
^1da177e4c3f41 Linus Torvalds   2005-04-16  312      vfree(part->VirtualBlo=
ckMap);
^1da177e4c3f41 Linus Torvalds   2005-04-16  313  out_XferInfo:
^1da177e4c3f41 Linus Torvalds   2005-04-16  314      kfree(part->XferInfo);
^1da177e4c3f41 Linus Torvalds   2005-04-16  315  out_EUNInfo:
^1da177e4c3f41 Linus Torvalds   2005-04-16  316      kfree(part->EUNInfo);
^1da177e4c3f41 Linus Torvalds   2005-04-16  317  out:
^1da177e4c3f41 Linus Torvalds   2005-04-16  318      return ret;
^1da177e4c3f41 Linus Torvalds   2005-04-16  319  } /* build_maps */
^1da177e4c3f41 Linus Torvalds   2005-04-16  320  =


:::::: The code at line 220 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4341541787693033730==--

