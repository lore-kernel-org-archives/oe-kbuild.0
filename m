Content-Type: multipart/mixed; boundary="===============5787090475577705981=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/mtd/maps/ck804xrom.c:319 ck804xrom_init_one() warn: 'window->virt' not released on lines: 317.
Date: Thu, 17 Sep 2020 05:25:43 +0800
Message-ID: <202009170536.7c4OGJM5%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5787090475577705981==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Christoph Hellwig <hch@lst.de>
CC: Thomas Gleixner <tglx@linutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   fc4f28bb3daf3265d6bc5f73b497306985bb23ab
commit: c0d94aa54bd893bd41ca35e2a2de332742bb167d x86: Clean up ioremap()
date:   10 months ago
:::::: branch date: 2 days ago
:::::: commit date: 10 months ago
config: i386-randconfig-m021-20200916 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/mtd/maps/ck804xrom.c:319 ck804xrom_init_one() warn: 'window->virt' =
not released on lines: 317.
drivers/staging/sm750fb/sm750_hw.c:91 hw_sm750_map() warn: 'sm750_dev->pvRe=
g' not released on lines: 91.

# https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3Dc0d94aa54bd893bd41ca35e2a2de332742bb167d
git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torval=
ds/linux.git
git fetch --no-tags linus master
git checkout c0d94aa54bd893bd41ca35e2a2de332742bb167d
vim +319 drivers/mtd/maps/ck804xrom.c

90afffc8bd79d1 Dave Olsen             2006-11-06  114  =

90afffc8bd79d1 Dave Olsen             2006-11-06  115  =

e4106a7c8236eb Julia Lawall           2016-04-19  116  static int __init ck=
804xrom_init_one(struct pci_dev *pdev,
90afffc8bd79d1 Dave Olsen             2006-11-06  117  				     const struc=
t pci_device_id *ent)
90afffc8bd79d1 Dave Olsen             2006-11-06  118  {
90afffc8bd79d1 Dave Olsen             2006-11-06  119  	static char *rom_pr=
obe_types[] =3D { "cfi_probe", "jedec_probe", NULL };
90afffc8bd79d1 Dave Olsen             2006-11-06  120  	u8 byte;
c3f08b353519ee Carl-Daniel Hailfinger 2008-01-16  121  	u16 word;
90afffc8bd79d1 Dave Olsen             2006-11-06  122  	struct ck804xrom_wi=
ndow *window =3D &ck804xrom_window;
90afffc8bd79d1 Dave Olsen             2006-11-06  123  	struct ck804xrom_ma=
p_info *map =3D NULL;
90afffc8bd79d1 Dave Olsen             2006-11-06  124  	unsigned long map_t=
op;
90afffc8bd79d1 Dave Olsen             2006-11-06  125  =

90afffc8bd79d1 Dave Olsen             2006-11-06  126  	/* Remember the pci=
 dev I find the window in */
90afffc8bd79d1 Dave Olsen             2006-11-06  127  	window->pdev =3D pc=
i_dev_get(pdev);
90afffc8bd79d1 Dave Olsen             2006-11-06  128  =

c3f08b353519ee Carl-Daniel Hailfinger 2008-01-16  129  	switch (ent->driver=
_data) {
c3f08b353519ee Carl-Daniel Hailfinger 2008-01-16  130  	case DEV_CK804:
90afffc8bd79d1 Dave Olsen             2006-11-06  131  		/* Enable the sele=
cted rom window.  This is often incorrectly
90afffc8bd79d1 Dave Olsen             2006-11-06  132  		 * set up by the B=
IOS, and the 4MiB offset for the lock registers
90afffc8bd79d1 Dave Olsen             2006-11-06  133  		 * requires the fu=
ll 5MiB of window space.
90afffc8bd79d1 Dave Olsen             2006-11-06  134  		 *
90afffc8bd79d1 Dave Olsen             2006-11-06  135  		 * This 'write, th=
en read' approach leaves the bits for
90afffc8bd79d1 Dave Olsen             2006-11-06  136  		 * other uses of t=
he hardware info.
90afffc8bd79d1 Dave Olsen             2006-11-06  137  		 */
90afffc8bd79d1 Dave Olsen             2006-11-06  138  		pci_read_config_by=
te(pdev, 0x88, &byte);
90afffc8bd79d1 Dave Olsen             2006-11-06  139  		pci_write_config_b=
yte(pdev, 0x88, byte | win_size_bits );
90afffc8bd79d1 Dave Olsen             2006-11-06  140  =

90afffc8bd79d1 Dave Olsen             2006-11-06  141  		/* Assume the rom =
window is properly setup, and find it's size */
90afffc8bd79d1 Dave Olsen             2006-11-06  142  		pci_read_config_by=
te(pdev, 0x88, &byte);
90afffc8bd79d1 Dave Olsen             2006-11-06  143  =

90afffc8bd79d1 Dave Olsen             2006-11-06  144  		if ((byte & ((1<<7=
)|(1<<6))) =3D=3D ((1<<7)|(1<<6)))
90afffc8bd79d1 Dave Olsen             2006-11-06  145  			window->phys =3D =
0xffb00000; /* 5MiB */
90afffc8bd79d1 Dave Olsen             2006-11-06  146  		else if ((byte & (=
1<<7)) =3D=3D (1<<7))
90afffc8bd79d1 Dave Olsen             2006-11-06  147  			window->phys =3D =
0xffc00000; /* 4MiB */
90afffc8bd79d1 Dave Olsen             2006-11-06  148  		else
90afffc8bd79d1 Dave Olsen             2006-11-06  149  			window->phys =3D =
0xffff0000; /* 64KiB */
c3f08b353519ee Carl-Daniel Hailfinger 2008-01-16  150  		break;
c3f08b353519ee Carl-Daniel Hailfinger 2008-01-16  151  =

c3f08b353519ee Carl-Daniel Hailfinger 2008-01-16  152  	case DEV_MCP55:
c3f08b353519ee Carl-Daniel Hailfinger 2008-01-16  153  		pci_read_config_by=
te(pdev, 0x88, &byte);
c3f08b353519ee Carl-Daniel Hailfinger 2008-01-16  154  		pci_write_config_b=
yte(pdev, 0x88, byte | (win_size_bits & 0xff));
c3f08b353519ee Carl-Daniel Hailfinger 2008-01-16  155  =

c3f08b353519ee Carl-Daniel Hailfinger 2008-01-16  156  		pci_read_config_by=
te(pdev, 0x8c, &byte);
c3f08b353519ee Carl-Daniel Hailfinger 2008-01-16  157  		pci_write_config_b=
yte(pdev, 0x8c, byte | ((win_size_bits & 0xff00) >> 8));
c3f08b353519ee Carl-Daniel Hailfinger 2008-01-16  158  =

c3f08b353519ee Carl-Daniel Hailfinger 2008-01-16  159  		pci_read_config_wo=
rd(pdev, 0x90, &word);
c3f08b353519ee Carl-Daniel Hailfinger 2008-01-16  160  		pci_write_config_w=
ord(pdev, 0x90, word | ((win_size_bits & 0x7fff0000) >> 16));
c3f08b353519ee Carl-Daniel Hailfinger 2008-01-16  161  =

c3f08b353519ee Carl-Daniel Hailfinger 2008-01-16  162  		window->phys =3D 0=
xff000000; /* 16MiB, hardcoded for now */
c3f08b353519ee Carl-Daniel Hailfinger 2008-01-16  163  		break;
c3f08b353519ee Carl-Daniel Hailfinger 2008-01-16  164  	}
90afffc8bd79d1 Dave Olsen             2006-11-06  165  =

90afffc8bd79d1 Dave Olsen             2006-11-06  166  	window->size =3D 0x=
ffffffffUL - window->phys + 1UL;
90afffc8bd79d1 Dave Olsen             2006-11-06  167  =

90afffc8bd79d1 Dave Olsen             2006-11-06  168  	/*
90afffc8bd79d1 Dave Olsen             2006-11-06  169  	 * Try to reserve t=
he window mem region.  If this fails then
90afffc8bd79d1 Dave Olsen             2006-11-06  170  	 * it is likely due=
 to a fragment of the window being
90afffc8bd79d1 Dave Olsen             2006-11-06  171  	 * "reserved" by th=
e BIOS.  In the case that the
90afffc8bd79d1 Dave Olsen             2006-11-06  172  	 * request_mem_regi=
on() fails then once the rom size is
90afffc8bd79d1 Dave Olsen             2006-11-06  173  	 * discovered we wi=
ll try to reserve the unreserved fragment.
90afffc8bd79d1 Dave Olsen             2006-11-06  174  	 */
90afffc8bd79d1 Dave Olsen             2006-11-06  175  	window->rsrc.name =
=3D MOD_NAME;
90afffc8bd79d1 Dave Olsen             2006-11-06  176  	window->rsrc.start =
=3D window->phys;
90afffc8bd79d1 Dave Olsen             2006-11-06  177  	window->rsrc.end   =
=3D window->phys + window->size - 1;
90afffc8bd79d1 Dave Olsen             2006-11-06  178  	window->rsrc.flags =
=3D IORESOURCE_MEM | IORESOURCE_BUSY;
90afffc8bd79d1 Dave Olsen             2006-11-06  179  	if (request_resourc=
e(&iomem_resource, &window->rsrc)) {
90afffc8bd79d1 Dave Olsen             2006-11-06  180  		window->rsrc.paren=
t =3D NULL;
90afffc8bd79d1 Dave Olsen             2006-11-06  181  		printk(KERN_ERR MO=
D_NAME
f9a5279c70af10 Joe Perches            2010-11-12  182  		       " %s(): Una=
ble to register resource %pR - kernel bug?\n",
f9a5279c70af10 Joe Perches            2010-11-12  183  			__func__, &window=
->rsrc);
90afffc8bd79d1 Dave Olsen             2006-11-06  184  	}
90afffc8bd79d1 Dave Olsen             2006-11-06  185  =

90afffc8bd79d1 Dave Olsen             2006-11-06  186  =

90afffc8bd79d1 Dave Olsen             2006-11-06  187  	/* Enable writes th=
rough the rom window */
90afffc8bd79d1 Dave Olsen             2006-11-06  188  	pci_read_config_byt=
e(pdev, 0x6d, &byte);
90afffc8bd79d1 Dave Olsen             2006-11-06  189  	pci_write_config_by=
te(pdev, 0x6d, byte | 1);
90afffc8bd79d1 Dave Olsen             2006-11-06  190  =

90afffc8bd79d1 Dave Olsen             2006-11-06  191  	/* FIXME handle reg=
isters 0x80 - 0x8C the bios region locks */
90afffc8bd79d1 Dave Olsen             2006-11-06  192  =

90afffc8bd79d1 Dave Olsen             2006-11-06  193  	/* For write access=
es caches are useless */
90afffc8bd79d1 Dave Olsen             2006-11-06  194  	window->virt =3D io=
remap_nocache(window->phys, window->size);
90afffc8bd79d1 Dave Olsen             2006-11-06  195  	if (!window->virt) {
90afffc8bd79d1 Dave Olsen             2006-11-06  196  		printk(KERN_ERR MO=
D_NAME ": ioremap(%08lx, %08lx) failed\n",
90afffc8bd79d1 Dave Olsen             2006-11-06  197  			window->phys, win=
dow->size);
90afffc8bd79d1 Dave Olsen             2006-11-06  198  		goto out;
90afffc8bd79d1 Dave Olsen             2006-11-06  199  	}
90afffc8bd79d1 Dave Olsen             2006-11-06  200  =

90afffc8bd79d1 Dave Olsen             2006-11-06  201  	/* Get the first ad=
dress to look for a rom chip at */
90afffc8bd79d1 Dave Olsen             2006-11-06  202  	map_top =3D window-=
>phys;
90afffc8bd79d1 Dave Olsen             2006-11-06  203  #if 1
90afffc8bd79d1 Dave Olsen             2006-11-06  204  	/* The probe sequen=
ce run over the firmware hub lock
90afffc8bd79d1 Dave Olsen             2006-11-06  205  	 * registers sets t=
hem to 0x7 (no access).
90afffc8bd79d1 Dave Olsen             2006-11-06  206  	 * Probe at most th=
e last 4MiB of the address space.
90afffc8bd79d1 Dave Olsen             2006-11-06  207  	 */
90afffc8bd79d1 Dave Olsen             2006-11-06  208  	if (map_top < 0xffc=
00000)
90afffc8bd79d1 Dave Olsen             2006-11-06  209  		map_top =3D 0xffc0=
0000;
90afffc8bd79d1 Dave Olsen             2006-11-06  210  #endif
90afffc8bd79d1 Dave Olsen             2006-11-06  211  	/* Loop  through an=
d look for rom chips.  Since we don't know the
90afffc8bd79d1 Dave Olsen             2006-11-06  212  	 * starting address=
 for each chip, probe every ROM_PROBE_STEP_SIZE
90afffc8bd79d1 Dave Olsen             2006-11-06  213  	 * bytes from the s=
tarting address of the window.
90afffc8bd79d1 Dave Olsen             2006-11-06  214  	 */
90afffc8bd79d1 Dave Olsen             2006-11-06  215  	while((map_top - 1)=
 < 0xffffffffUL) {
90afffc8bd79d1 Dave Olsen             2006-11-06  216  		struct cfi_private=
 *cfi;
90afffc8bd79d1 Dave Olsen             2006-11-06  217  		unsigned long offs=
et;
90afffc8bd79d1 Dave Olsen             2006-11-06  218  		int i;
90afffc8bd79d1 Dave Olsen             2006-11-06  219  =

90afffc8bd79d1 Dave Olsen             2006-11-06  220  		if (!map)
90afffc8bd79d1 Dave Olsen             2006-11-06  221  			map =3D kmalloc(s=
izeof(*map), GFP_KERNEL);
90afffc8bd79d1 Dave Olsen             2006-11-06  222  =

90afffc8bd79d1 Dave Olsen             2006-11-06  223  		if (!map) {
90afffc8bd79d1 Dave Olsen             2006-11-06  224  			printk(KERN_ERR M=
OD_NAME ": kmalloc failed");
90afffc8bd79d1 Dave Olsen             2006-11-06  225  			goto out;
90afffc8bd79d1 Dave Olsen             2006-11-06  226  		}
90afffc8bd79d1 Dave Olsen             2006-11-06  227  		memset(map, 0, siz=
eof(*map));
90afffc8bd79d1 Dave Olsen             2006-11-06  228  		INIT_LIST_HEAD(&ma=
p->list);
90afffc8bd79d1 Dave Olsen             2006-11-06  229  		map->map.name =3D =
map->map_name;
90afffc8bd79d1 Dave Olsen             2006-11-06  230  		map->map.phys =3D =
map_top;
90afffc8bd79d1 Dave Olsen             2006-11-06  231  		offset =3D map_top=
 - window->phys;
90afffc8bd79d1 Dave Olsen             2006-11-06  232  		map->map.virt =3D =
(void __iomem *)
90afffc8bd79d1 Dave Olsen             2006-11-06  233  			(((unsigned long)=
(window->virt)) + offset);
90afffc8bd79d1 Dave Olsen             2006-11-06  234  		map->map.size =3D =
0xffffffffUL - map_top + 1UL;
90afffc8bd79d1 Dave Olsen             2006-11-06  235  		/* Set the name of=
 the map to the address I am trying */
65af07141b8249 Andrew Morton          2007-02-17  236  		sprintf(map->map_n=
ame, "%s @%08Lx",
65af07141b8249 Andrew Morton          2007-02-17  237  			MOD_NAME, (unsign=
ed long long)map->map.phys);
90afffc8bd79d1 Dave Olsen             2006-11-06  238  =

90afffc8bd79d1 Dave Olsen             2006-11-06  239  		/* There is no gen=
eric VPP support */
90afffc8bd79d1 Dave Olsen             2006-11-06  240  		for(map->map.bankw=
idth =3D 32; map->map.bankwidth;
90afffc8bd79d1 Dave Olsen             2006-11-06  241  			map->map.bankwidt=
h >>=3D 1)
90afffc8bd79d1 Dave Olsen             2006-11-06  242  		{
90afffc8bd79d1 Dave Olsen             2006-11-06  243  			char **probe_type;
90afffc8bd79d1 Dave Olsen             2006-11-06  244  			/* Skip bankwidth=
s that are not supported */
90afffc8bd79d1 Dave Olsen             2006-11-06  245  			if (!map_bankwidt=
h_supported(map->map.bankwidth))
90afffc8bd79d1 Dave Olsen             2006-11-06  246  				continue;
90afffc8bd79d1 Dave Olsen             2006-11-06  247  =

90afffc8bd79d1 Dave Olsen             2006-11-06  248  			/* Setup the map =
methods */
90afffc8bd79d1 Dave Olsen             2006-11-06  249  			simple_map_init(&=
map->map);
90afffc8bd79d1 Dave Olsen             2006-11-06  250  =

90afffc8bd79d1 Dave Olsen             2006-11-06  251  			/* Try all of the=
 probe methods */
90afffc8bd79d1 Dave Olsen             2006-11-06  252  			probe_type =3D ro=
m_probe_types;
90afffc8bd79d1 Dave Olsen             2006-11-06  253  			for(; *probe_type=
; probe_type++) {
90afffc8bd79d1 Dave Olsen             2006-11-06  254  				map->mtd =3D do_=
map_probe(*probe_type, &map->map);
90afffc8bd79d1 Dave Olsen             2006-11-06  255  				if (map->mtd)
90afffc8bd79d1 Dave Olsen             2006-11-06  256  					goto found;
90afffc8bd79d1 Dave Olsen             2006-11-06  257  			}
90afffc8bd79d1 Dave Olsen             2006-11-06  258  		}
90afffc8bd79d1 Dave Olsen             2006-11-06  259  		map_top +=3D ROM_P=
ROBE_STEP_SIZE;
90afffc8bd79d1 Dave Olsen             2006-11-06  260  		continue;
90afffc8bd79d1 Dave Olsen             2006-11-06  261  	found:
90afffc8bd79d1 Dave Olsen             2006-11-06  262  		/* Trim the size i=
f we are larger than the map */
90afffc8bd79d1 Dave Olsen             2006-11-06  263  		if (map->mtd->size=
 > map->map.size) {
90afffc8bd79d1 Dave Olsen             2006-11-06  264  			printk(KERN_WARNI=
NG MOD_NAME
69423d99fc182a Adrian Hunter          2008-12-10  265  				" rom(%llu) larg=
er than window(%lu). fixing...\n",
69423d99fc182a Adrian Hunter          2008-12-10  266  				(unsigned long l=
ong)map->mtd->size, map->map.size);
90afffc8bd79d1 Dave Olsen             2006-11-06  267  			map->mtd->size =
=3D map->map.size;
90afffc8bd79d1 Dave Olsen             2006-11-06  268  		}
90afffc8bd79d1 Dave Olsen             2006-11-06  269  		if (window->rsrc.p=
arent) {
90afffc8bd79d1 Dave Olsen             2006-11-06  270  			/*
90afffc8bd79d1 Dave Olsen             2006-11-06  271  			 * Registering th=
e MTD device in iomem may not be possible
90afffc8bd79d1 Dave Olsen             2006-11-06  272  			 * if there is a =
BIOS "reserved" and BUSY range.  If this
90afffc8bd79d1 Dave Olsen             2006-11-06  273  			 * fails then con=
tinue anyway.
90afffc8bd79d1 Dave Olsen             2006-11-06  274  			 */
90afffc8bd79d1 Dave Olsen             2006-11-06  275  			map->rsrc.name  =
=3D map->map_name;
90afffc8bd79d1 Dave Olsen             2006-11-06  276  			map->rsrc.start =
=3D map->map.phys;
90afffc8bd79d1 Dave Olsen             2006-11-06  277  			map->rsrc.end   =
=3D map->map.phys + map->mtd->size - 1;
90afffc8bd79d1 Dave Olsen             2006-11-06  278  			map->rsrc.flags =
=3D IORESOURCE_MEM | IORESOURCE_BUSY;
90afffc8bd79d1 Dave Olsen             2006-11-06  279  			if (request_resou=
rce(&window->rsrc, &map->rsrc)) {
90afffc8bd79d1 Dave Olsen             2006-11-06  280  				printk(KERN_ERR =
MOD_NAME
90afffc8bd79d1 Dave Olsen             2006-11-06  281  					": cannot reser=
ve MTD resource\n");
90afffc8bd79d1 Dave Olsen             2006-11-06  282  				map->rsrc.parent=
 =3D NULL;
90afffc8bd79d1 Dave Olsen             2006-11-06  283  			}
90afffc8bd79d1 Dave Olsen             2006-11-06  284  		}
90afffc8bd79d1 Dave Olsen             2006-11-06  285  =

90afffc8bd79d1 Dave Olsen             2006-11-06  286  		/* Make the whole =
region visible in the map */
90afffc8bd79d1 Dave Olsen             2006-11-06  287  		map->map.virt =3D =
window->virt;
90afffc8bd79d1 Dave Olsen             2006-11-06  288  		map->map.phys =3D =
window->phys;
90afffc8bd79d1 Dave Olsen             2006-11-06  289  		cfi =3D map->map.f=
ldrv_priv;
90afffc8bd79d1 Dave Olsen             2006-11-06  290  		for(i =3D 0; i < c=
fi->numchips; i++)
90afffc8bd79d1 Dave Olsen             2006-11-06  291  			cfi->chips[i].sta=
rt +=3D offset;
90afffc8bd79d1 Dave Olsen             2006-11-06  292  =

90afffc8bd79d1 Dave Olsen             2006-11-06  293  		/* Now that the mt=
d devices is complete claim and export it */
90afffc8bd79d1 Dave Olsen             2006-11-06  294  		map->mtd->owner =
=3D THIS_MODULE;
ee0e87b174bb41 Jamie Iles             2011-05-23  295  		if (mtd_device_reg=
ister(map->mtd, NULL, 0)) {
90afffc8bd79d1 Dave Olsen             2006-11-06  296  			map_destroy(map->=
mtd);
90afffc8bd79d1 Dave Olsen             2006-11-06  297  			map->mtd =3D NULL;
90afffc8bd79d1 Dave Olsen             2006-11-06  298  			goto out;
90afffc8bd79d1 Dave Olsen             2006-11-06  299  		}
90afffc8bd79d1 Dave Olsen             2006-11-06  300  =

90afffc8bd79d1 Dave Olsen             2006-11-06  301  =

90afffc8bd79d1 Dave Olsen             2006-11-06  302  		/* Calculate the n=
ew value of map_top */
90afffc8bd79d1 Dave Olsen             2006-11-06  303  		map_top +=3D map->=
mtd->size;
90afffc8bd79d1 Dave Olsen             2006-11-06  304  =

90afffc8bd79d1 Dave Olsen             2006-11-06  305  		/* File away the m=
ap structure */
90afffc8bd79d1 Dave Olsen             2006-11-06  306  		list_add(&map->lis=
t, &window->maps);
90afffc8bd79d1 Dave Olsen             2006-11-06  307  		map =3D NULL;
90afffc8bd79d1 Dave Olsen             2006-11-06  308  	}
90afffc8bd79d1 Dave Olsen             2006-11-06  309  =

90afffc8bd79d1 Dave Olsen             2006-11-06  310   out:
90afffc8bd79d1 Dave Olsen             2006-11-06  311  	/* Free any left ov=
er map structures */
90afffc8bd79d1 Dave Olsen             2006-11-06  312  	kfree(map);
90afffc8bd79d1 Dave Olsen             2006-11-06  313  =

90afffc8bd79d1 Dave Olsen             2006-11-06  314  	/* See if I have an=
y map structures */
90afffc8bd79d1 Dave Olsen             2006-11-06  315  	if (list_empty(&win=
dow->maps)) {
90afffc8bd79d1 Dave Olsen             2006-11-06  316  		ck804xrom_cleanup(=
window);
90afffc8bd79d1 Dave Olsen             2006-11-06  317  		return -ENODEV;
90afffc8bd79d1 Dave Olsen             2006-11-06  318  	}
90afffc8bd79d1 Dave Olsen             2006-11-06 @319  	return 0;
90afffc8bd79d1 Dave Olsen             2006-11-06  320  }
90afffc8bd79d1 Dave Olsen             2006-11-06  321  =


:::::: The code at line 319 was first introduced by commit
:::::: 90afffc8bd79d130b58acd18f972ce4e00b8e20f [MTD] [MAPS] Support for BI=
OS flash chips on the nvidia ck804 southbridge

:::::: TO: Dave Olsen <dolsen@lnxi.com>
:::::: CC: David Woodhouse <dwmw2@infradead.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============5787090475577705981==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

H4sICGBmYl8AAy5jb25maWcAjFxdc+M2r77vr/Bsb9qLtvnaND1nckFRlMxaFFWScuzcaNKsd5t5
N8keJ3nb/fcHICWLpChvO502IsBvEHgAgv7+u+8X5O31+fHu9eH+7vPnr4tPu6fd/u5192Hx8eHz
7n8XuVzU0ixYzs3PwFw9PL3988vD+dXl4v3PFz+f/LS//3Wx2u2fdp8X9Pnp48OnN6j98Pz03fff
wb/fQ+HjF2ho/z+LT/f3P/22+CHf/flw97T47edzqH36/kf3F/BSWRe87CjtuO5KSq+/DkXw0a2Z
0lzW17+dnJ+cHHgrUpcH0onXBCV1V/F6NTYChUuiO6JFV0ojkwReQx02Id0QVXeCbDPWtTWvueGk
4rcsDxhzrklWsX/DLGttVEuNVHos5eqP7kYqb8RZy6vccME6tjG2bS2VGelmqRjJYdCFhP90hmis
bFe9tLv4efGye337Mq5tpuSK1Z2sOy0ar2sYZcfqdUdUCasmuLk+P8O9G8YrGg69G6bN4uFl8fT8
ig2PDEsYBlMTek+tJCXVsEfv3qWKO9L6O2In3mlSGY9/SdasWzFVs6orb7k3fJ+SAeUsTapuBUlT
NrdzNeQc4QIIh/l7o0qujz+2Yww4wsQC+qOcVpHHW7xINJizgrSV6ZZSm5oIdv3uh6fnp92Ph7XW
W73mjXcC+wL8PzWVP45Gar7pxB8ta1miK6qk1p1gQqptR4whdDm22mpW8Wz8Ji1omWjFiaJLR8C+
SVVF7GOpFXw4RYuXtz9fvr687h5HwS9ZzRSn9pA1SmbeGfdJeilv0hS69CUOS3IpCK/DMs1Fiqlb
cqZwIttp40Jz5JwlTPrxRyWIUbD6MH84TKBO0lyKaabWxOBBEzJn4RALqSjLe2XC69Lb9IYozfrR
HTbcbzlnWVsWOpTA3dOHxfPHaCdGjS3pSssW+gRNaegyl16PdrN9lpwYcoSMisvTqx5lDUoXKrOu
Itp0dEurxJZb3bqeyNVAtu2xNauNPkpEtUpyCh0dZxMgCST/vU3yCam7tsEhD6JsHh53+5eUNC9v
uwZqyZxTf2dqiRSeVyypEiw5rb95uUQpsQui0ts5GY2nAhRjojHQQZ1SAQN5Lau2NkRtA/XhiEeq
UQm1hjWhTfuLuXv5z+IVhrO4g6G9vN69vizu7u+f355eH54+jatkOF11UKEj1LbhZPvQM8qvFYCR
nFycTOeoMigDPQasaQuItlcbYnSS2mieXNN/MRs7a0XbhZ6KAQx52wFtlCb4AKwAsuFJmA44bJ2+
6DCOsP2Dcli5Pzx1sTrsjaR+sQMA+vpxNO5oxQtQqLww12cn46by2qzAtBcs4jk9D9R+CxDJQR66
BO1kj9EgBPr+r92HN8CUi4+7u9e3/e7FFveTSVAD/XFDatNlqHqg3bYWpOlMlXVF1WrPNNFSybbR
vsCAEaNpEXHMbqjHGBqepwWkp6s8tP8xvYAjccvUMZacrTlNn/+eA4RuVoyHcTJVHO8E1H7iyCKW
AKMBR8VftxZUX60T7Agoak+1AhxQrmA8OTyP6o7qjJl0s7ALdNVIEDTUaWAVmd+ikyfEm3YuyabB
IhQaZgkqCMxquKfDSWMV8ax5Vq1w6a1BUh7Ut99EQGvOLnl4VuURjIWCCL1CSQhaocDHqpYuo+8A
mYJfIhvQcuCAoKG3OyuVIDVNgrWIW8MfAQZ02C84pzw/vYx5QAdR1li8AbOnLKrTUN2sYCwVMTgY
bxWbYvw46LFRkLCvxLAFYFmOwuONo2RGgE7uJsbd7e1Y7G86Dr2nJLoplqTOq0CYHPidWs1A2419
99qvFtz3dQKrxKoCLJ5Kn+Bo4RI9ZgQAW9H6Ey5awzbRJ5wrb6EbGSwQL2tSFZ4Q2/n5BRbP+AV6
CcrRw2ncE0ouu1ZFtpfkaw4D7dc6tXTQXkaU4v6mrpB3K/S0pAu2+FBqVwNPquHrYN9A0FIbPUoa
CJN1kYrU2bdmBOMC4yChtZrajfO7AfT8R7J9qMfyPKlY3AmB7rsYeTb09ORisIF9yKXZ7T8+7x/v
nu53C/bf3ROABwJmkCJ8ALg2YoWwxcNArCZ3RJhztxbWlUiClX/Z49j2WrgOHYKb4MpBdKo2mzUo
GHkgYK1tVMSrQrIEM7YUsslspkuSwd6pkg2e8DwbmtyKgwuh4PBL8S8Yl0TlAOrTQEAv26IAVNMQ
6PzgtiVVhyx4FbhjVpVau6Z98BaGegbmzdVld+6ZEvj2rZKLP6GCzhkFl9A7ZbI1TWs6aybM9bvd
54/nZz9hwO9dIP+wcj08fHe3v//rl3+uLn+5twHAFxse7D7sPrpvP+KzAqPa6bZpgkAWQD26stOb
0oTw0KvtWSBkUzVYS+6cquurY3SyuT69TDMM4vWNdgK2oLmDL6xJl/uGeiA47R60SraDFeyKnE6r
gFLimULXNQ8xxkHtoE+DWm2TohHANxj5ZJH1PnCAWMFh7JoSRCwOtmhmHPxzfpNi3pRqBrhpIFkF
Bk0pdK6XrR9nDfisnCfZ3Hh4xlTtIhNgSzXPqnjIutUNg02YIVs0b5eOVN2yBbNfZZMWrEjpQdnB
kOzJCw4HHJauIrfbrtRz1VsbOPLIBdh+RlS1pRhY8Q1gUzrnpQIFWOnrMw9g4RZogtuDQo97wKiL
3Fi93uyf73cvL8/7xevXL84n9JycvplbcLR7eRs1i2gSagRnVjBiWsUcOg8nLRob4gnCO7LKC66X
SfWlmAGwwOs0PMEWnWwCklIpCIUcbGNgP1FGRvwXNHF0BMgAGhBDm41OAQdkIGJsvfeIfDyii05k
PIgF9GWzhghbVTk9PzvdxMMFweGKzxg362xIwUGfghsAhx7VN0sp/OUWzgygIoDdZcv8EBFsEVlz
lShxww23dLlGDVJlIFzdehCtARiBSY4adyG1psWoEchmZUIw2KyXQdB5LfpTVCTx7jCuKK6SGPng
0I/e9cXVZXINxfsjBKNpCjwCRYhgp8TlXCugXcB7EJx/g3ycnkYGA/UiTV3NDGn160z5VbqcqlbL
9JkUrChA/GWdpt7wGiPbdGYgPfk8DWYE2KCZdksGoKLcnB6hdtVmZjZbxTez673mhJ536WsUS5xZ
O8TmM7UAgqW3z2ojZ5ZndII9zTXOxhleF8t677NUp/O04uSk6CZHGABAWQtEzr5rPWo+9E6obLYh
DY5CWEBFs6HL8vIi0vm85qIVVlMXRPBqO46pj3Oi688qUB5ePAy4wRK6EUyL7Z4FgHOggC4OAhJ9
8XJbzsjkoUlYANLOBLt6HsCMtRbMEOj6KGMr6LdYbpdEbnidUs0NcyrNU6W578PXFuxo9BEA7mSs
BCx5miaC6ZuSei9kQhgLYHwVQsLwwgO3E5e4Ce8B+mIukTAjuPb2dajpS5hMNqeYAr/ARYX6S+RM
SoNB9DkjLCiLW4EiDPpWrCR0O3vihL3YATGbbziWKntqasrxzIhkaGuoiNdcegkIIzoUts/fUeQf
eyDm+bmPz08Pr8/74HbBc6iHY1lb//9xnkORpgL6GM+ZcFC8REheonisFt7IGxDHx9ENnBlvsOd2
3cEv933B8MtI0FJZACz51WoOEDGUAUDBcaCcU9AjoBTn9kGrcZV60Mhzf2FqiVdSAKlTp9FRLoKA
0lropgKUdZ4O0I9kDHAmGh0YzpKtnk2qTVhOU6jRej+yKMCtuj755+rE/RNNJJZj2hD0DQzXhtPU
4bKQrQB1AJVBn5CEz2RR/TzZ6vbhUh5vhD2NzisUk2pAqniR2rLrYNCNmZxsG3MHD1lqDIKp1gZ/
Z8UGr6Px/ufm+vLigNmM8tQrfqGbxA04sbPl/fQO+vNkhg3XAwOBVrGOyjaYAXj4c2vtQj/xlLUg
cx5Xrw+Eje6PQb+CJ/g1oxhf8BmXt93pyUn6pva2O3t/kjoVt935ycm0lTTvtZdDtWIbFuh7qohe
dnmbdCib5VZzNB0gogql+jQUasVsTKuXutFxtEuI9woYk51ZNhs5sA34Uc+hQ4uKoMOzoL8+NrPO
tQzmIHIbAwEFlY7wgtTzYttVuUkHggetesQdD2Skl8T+TC2laSoL65wtef57t1+Abr77tHvcPb3a
dght+OL5C+bKufvLQSBcwCN9AZBSiGGUApv1zvvka7ACdos0HEK5aptIQQg45KZPv8EqjR+nsiWw
ZgbUi7VCVltBU2PobozzI691GMuZa0vXWkOVG9A8D0LTQrse57kUW3dyzZTiOTuEjObZGU2lsPgc
JJ55Rgyoxe1owFxpa4yso8I1DEJG1QtSRyW5c4TjuToY7vDAZEkPDHPD5g3g03A0tNXg53S5BpEv
eOVfRR5ig5bRha7aplTEzxVK0hI7fWQLKcegfFLP2hFKQPxwalXUaX+aekAbS2KmY3Y/19KfOjgK
SxngjF5m8hYzoDBwf4OGQtbVNqU2D+eBNMw7VWF5eLuXYB85yyWLx27LYZ0YsasQDtQSGcDUWWG1
DBhsjQJDeWOKHjKG/bGNAUTuYVbAboB1wFRisubozIE6uKET6qhugZ5jPlXIcmSj4e9ChyiwEQcn
a1SGoc0ccoAWxX73f2+7p/uvi5f7u88BMLd+rWJeRt1Q0pVyjTmI6N2aGTLYExHMfCDiQUwUD6mU
WNe7XI9d3ikvboYGyZn1SSdV0O232RX/voqscwbjmUlKSdUAWp8suE5mCPhrFc43yTHMcoZ+mNIo
CQF9GP8M2R/s4LehdHyMpWPxYf/w3+A+FNjc3MNN7cts9Dhn6xjzOWDXTJy0EEnipGt5082E90Ke
X2fAULmxSABwSuipAjhgORhfFyBRvJbhKZrSOxP6ACEXp8u5BrSvyeyoL1zcVsh84sDZlattMml4
7QgQoy5VWw9g6OWvu/3ug4d8kn0HecEhyV59YU4YaZzf4d+GppXDQTL4h887H2yhOE0TJr22XIUD
HPwmkLONZ28vQ8HiB9Dmi93r/c8/erEDMISlRG/JFzBXKoT7nEkAQZacKzaTwOUYZNXQI2RSp8wb
0lJDonV2dgJG/4+Wq1QkAO8+s9Z/yOAuQzGOFBR6970UUbxviF3JUjkLkOgFp+SPDL+7jTx9D1XT
kWLwF9IB5pqZ9+9P0qHpkskkFBR5V2exNsBUoiwpOTMC4ITj4elu/3XBHt8+30VHoHdmbBh1bGvC
HwIPQDZ4Ay3BHR2OWPGwf/wbTtkij9Uey/00njzH6IQ/rYIrYTEQODJp/zYXnHttwKdLqYqK8P2N
IHSJTlgta3R+Afu6e6mgw5uOFn1WVnpHpCwrdhhYYkQttk0bH9scisK8BywdLmyHtTK7T/u7xcdh
xZyh8PNJZxgG8mStg91ZrYO4AV59tfgciMTxkeDVDiZUPLzu7tHP/OnD7gt0hcpmojKdp95nHVHP
nY/KpMsm8azsUNJn6NgMuqby88Ts8A8VJ00hzI1j4qv4gvz3VmDcOmNhoh0GtygMdKsxFFXMPBuS
jYnbs2OyF1o20tvWNiaA6ZwU3aHIi8WEJnxJZHjdZfqGeF7uCi+yU41zWDdM+0jkRkxm50rnWpob
ft8MvsEqUsmRRVu7xBxwYsEBdEHpAIxbtsDLGB/K2BaX4NNHRNTH6F7xspVt4jWDho2yV8DuGUi0
kjZtBFx7jJj0eaxTBsDUffhjhujMVidI/HTLjdw9ZnOJSd3NkhubThW1hekeusu3NUGlZ2yGp60R
8Z2fZdygcusm74m0wOBP//As3h3wW8ALrnOXndHLVWjJHJ/2HYxw4/AR3WxFWsVbs7zpMpi6y1iO
aIIj0BnJ2g4wYrJp0yCGrapB1cImBUmTcT5hQnLQ8UVYZzO7XTqKrZFqJNH/kD2o+kXDyGFqhwNt
cITqZ2wGa07bPv6AuXYTIXOHwj0t6K8+4356bdHLGEbn491x9dzt2Awtl+1MGhLms7snU8Nrx8Q8
+3hvn4blYaKZcq8mrm4FohARJ4lEg3Xok40Csn2kE2ljjzwb9rCT5Abseb/LNp9loj6nb2piiZYo
MSJPqgC8zcVQPawlpnKFGzSuM9KwjU6D5MZbCGd7uARhFM6CFy8CUosxTzQMmGetfEk8qCpLGcLV
qWEG+YWxcdqA2knq0LDWVShastkOCtBUEZQGbB3qEXDBMLINmwCAKPe4JT6a5WUfQD6fEEhkSC4v
UEnifnmNDxB0ShqVObiVcH76J6bqxkMNR0hxdbcbyeop0qG6wsRT9yTMy0tzZTb1/agMN7Dp52fD
NUVoAQ6oAcxYCgagjvRTmuOqfUp4x2qqts3hzVpJ5fqnP+9ewOn9j8uh/rJ//vgQRq2QqV+2RKuW
OiCv6N1CTEtM37K4hN7uovvV9y6ODe7gGVZtiY9YpTaUxi+y8W2+Y0hmJX8Dyg5NKcSgBqCrt6Y2
e19jRrp3seeOcHym3SNW2CD/2PWktk4WuxoHon8xNGCDuYsjrK4VPbxdn3lEMHDO+PI9GQ+cYvpo
Z5iuegNgQGtQqOMrq44Le+eTfsJQgyTDsd+KTFZpFjhsYuBb4YOJVCpdrzMNmNzxsmh8SIFnIuUw
6/rUc8dq98MKoJNBjnDNaZwJPN5fOX8WvL3EwbSvzHPbjH3rO8+iblIMVv0MLzW6jBX4P4Qu/bNo
e17ZP7v7t9e7Pz/v7E9gLGxaxavndmW8LoRBQ+G5llUR+lw9k6aKN2ZSDHtJfaWLdxD9JXB/gOZG
YYcodo/P+68LMQaiJr5h+pJ/9Lv7/AFBanBIU/fShxwCx+Ip6YESW17XFUoz85Hs2JLz/KbVrBR1
No1u6h0U+IC79O8o+464lhUx0U1EeAGbnBemazTGdmmTrC7GbQDbF9lIwUtFwiLnR3VRDrnLe5Vh
KEyI1ofkYx6tTl3kDnF4CxXcY/FcXV+c/HZ4bzCDkLwTPaXDQG/INnW2k9zCvc0a5xBzWdxsMxpH
niDnfxWEPCgg1tqyp64Twhx2+Dxyh3igJm9rkQqDJPr617HKbRPd/w/lWetZhFvtnj0FqVl9Bj9s
RTP3MnyoZ+U6ZXZ759qGnIbQggfu8uEhEHrtqxArCzh3HCMAY5nLII9zumHVbQYjPj73/Hrw5TLA
IUtBwrdTFmPiBSfgzcam86Xvvgdt2RjmkDSpfO00r4BGkTgAoHr3+vfz/j94DzNRU3DgVizAcq6k
yzlJHV8wJR4oxC9QsYHA2bK49nhCZmzhplDCWoK5kDHGq1LR7zocPW9cMA1/DSLZFDDACcM7MzBS
mFOZ8rmAqal9UbHfXb6kTdQZFmMWXvohc8+giErTcV68mfnVGkcsFeZXiXaTGKbj6Exb11GIb1uD
mpQrzubfbvNmbdKRe6QWsj1GG7tNd4Db0pH0ExJLAwQ1TwRHXiaznyz1MF2/EAUuKjK0GYrD5tu8
mRdQy6HIzTc4kAr7Ag6TTGfSYu/wZ3mQtpQBGHhom/l2eTBEA/363f3bnw/378LWRf4+wrYHqVtf
hmK6vuxlHdFB+qcFLJN7fY6Jj11O0rfWOPvLY1t7eXRvLxObG45B8CZ9b2upkcz6JM3NZNZQ1l2q
1Npbcp0DDrTAx2wbNqntJO3IUPuwfZ/MdYTRrv48XbPysqtuvtWfZQOTkr5chNXF3y/DSBZanaM8
zXJrowtgtsSsfQVmFw1LUrPmCBHUQ07prFLUdEZhqpkf6IBlTmXSA4YO0omMALwzo06RWJGZp3NI
zNTZ5VX6pVB1ZlLqSJtmvNIpQcn7g8kUz8sU6HKhUtQhOkBffVEqOxrG3V2dnJ3+MXY3lnXlWgVm
ySOJ9YzlyRmF/hJ9VZWniODDSyYghlSrcQT4exuAzioWFlemCZAclU36x0fy3Fs9+4mRGxJMZXP2
Pr0hpEk9QW+WMsIDl//P2bNtN47j+Cs587Cn+6G2LfkS+6EeKIm2WdEtomwr9aKTqaSncyaV5CTp
md6/X4DUhaRAe3YfujoGwKtIEAABEDT3klGeUIJzjpO0XJi9HaFtnnZ/qEwYAgOCSE3NKCILJU0N
o4KtOm0Cv7M/VU0S00HzSY6mN1C5jr79CGuYoc5yJNFFyfOjPIk63lMrTPdcmv3sYf6T8Kjvqo9Z
LAZqqnJQzURhtkEjeucvow86KvNc5TCbmGdSn/TjxJepdPcWwtqdpPP1KSRyaYcZGuVzaXjq7GXl
1q8nF3aFV3BK57AiJB7D56jy2E1X1e8knf0HacpK0OMwaOKUSSmos0+JOA2qynetHW8a3VpyJObp
+CYsNmFqFFefjx9dzi9rBOVNDbqXd4BJVYD0UuTCufAYtJtJ9Q7C1GRGrppVLFGJT7TP9/2Pfz5+
XlX3D0+vaFP9fP3x+mwoPgxYi+GhC79A5AEdVqbMzlUCPa4KylxQFXLwemPNfwOneun6/fD4r6cf
j4bT27jMboTH1LhCvYtoJSpveb3nRsROAmsojsff+ofhyhPrzAVkM4itq4bHe3r9ROwOdmGLt4nb
hPbfMUj2CaWWdAQlq6zzUEN5SZ2kdywzg6nOTudgcTBdudHfBaR26+ABUBRTXw4xu5Nd+FuwmW/6
xQOAq0S3OnHhQeLjpO1jgyCndZnGngBdxPp4gMZhkLcOnafzARJdNOaa1n3ZFrZ95fFNA+QNOVsn
UfHUcu+Itzs81oJxDeqzMlApaO0Ulz0tDoanBRqpMEMvsFmiwjbm6OUg9NVQW+QHi4sPZBVHbzhl
289VzMouocQBgx5+8DQ9pAwWrXCS8FhkyrsRczUKyjBgjEaraCU1is5KRo2vShgVqDEQnHhDSWWd
IBFMRItA38mZt6w9oorRiAkaqqksm9jB3vmfUH3928+nl4/P98fn9o/Pv00IQZXYE+VTbl6QDuBx
gkbOaNQke6McfRjb1UCB/EC0kRdDNulpIyBERcC+vfkmxt6kGR+8+af1gP50xmI6fqP6cktFHLlh
AwNORFJ6kaUfBVLNGRyr937s/pSVfix8bX2Rc5Yiluw8wZmu10kqz0y8/vRUZivqE+3RTy+Dfa1y
8szG+k4CoNTZvr0RaTruNv27X86juqrBIi8P1K7t0LtSGE7iKAFtDNui/t3JwhPwZAZiJjy5IXm5
R7dtWuzaUupzKUH7N90SlfFtawB6m4ShEnYQO1lgggmG7DsJEEQVzzUT9jCRYnSYc8PEOzGzP319
J68mFrbWjL99SnYZG24b7o8usbOV4E1wZMzWFVIf/IQlkMAmZ+ZgOkAfyG77cUPP48rrFc6ZLOkc
GKpoQlo/FKqsM7sHbXSyx5lJMQGQma0Rp7zMJz7oPualIsrqQ2QEMAGE2VnzhHLcQAmiCzxyaxcF
LQipKa8oe5/CMGk6Qqt2HOe28dOZTZpfVF053lLrxyASUeYrr2IPzpeOzzWP/3yvl0s6ptil7C60
LAXZoJF7e5loPSgWVz9eXz7fX58xJ++ok2hB9/7hETMWANWjQYZ5pt/eXt8/rZgJTLKScCvayIQq
B5XJqu+RvKTF2EsdML/vtoZ/AzvMGuHYMJUoxu5Jg/n8mskEJY8fT/94OaELOc5V/Ap/SHL0yckZ
eHLqx+xAeTmFYUgTDfVUolBOTXhsdhfu3QSe7f4QN0MvgmGB8JeHt9enF3vAmCvFcYo1oWMUoY0G
Xo5agJUbw2xiaPTj30+fP/6gF6f1eeWps63UnE6Neb62sXcxqyyOkcWCub+VE1MbC1tDgIJwKhCb
68uP+/eHq7+/Pz3849Hq+B2aCynWlayuw41xVbUOZ5vQ+j1fLY3r/9i8Ger66DyhoEeGrqWuh0fF
SpGY0kcHaGsprsNgClcXIngzUBzqr/OZi+7C7KumrZtWOQxZ4lBfScaAcufLUzeQeQXnsblDhn5o
gjr+eiK8ZM+nI1G+WW2MUYSdkaa6f3t6EMWV1EuFWG3G7CyvSbmwbxMk16YxGbFZdLW+UBR4VTjt
cdUozNzcOp4+j+EqTz86QemqmOYyOGhvyT1PS/KeGyanzkpbEethbYbCNW1EqlmesLTwfN+y0s0O
wUzqPZnJ5hkid55f4RB4H3nP9qQ2oSlaDSDlsJFg3voRCSpzxYbWDAfJsZRyj9fTQFVqoM0oqQld
7yxoMmB3GIPZBF2l8Y7E8i7rkNqj0MR6bmmUGagSPqP/YCeqPNePmgAZcldNW3H0Aadv2ZCMab1O
EytGQyycIVkqpik91IXnTRdEHw8pZgeN4PSthek6WvGd5Y+jf7cijCewLDNVo57QfLUFWY5yR1dr
Y2u7eyFyq6QQFZ9DniGezTTEk2ojpPXSgQkeLD0FKEedh5CxIYq4C/+g5jI3bWv4C22rwnT5U8AM
H26gEFJU2x5jcCSFO0RNh6J05NqII4YfagHIIQPX/fvnE87C1dv9+4eliSEtq67RxGve5yC4z/xC
oIotBYVPplKZnUHpyCX0K1Seil+/BN4KVFCa8i3ntlvxhBA9sdxME6NEMRm7mpID/HmVveLzFjrt
dv1+//Kh40Kv0vv/mUxSUZTWnRrCsHmB9k1Yq/o6aMIaK5b9VhXZb9vn+w+Qaf54eptG0KvJ3gp7
xr7xhMd6M1pw2JAtAYbyeGGo/D4K++WHHp0XGLpHm7c6kgg4/B36qZ3IiNWeLDXIDINPh93xIuO1
GbyGGNznEctv2pNI6n0bnMWGbv8dvCcL6JSQOr6p3qzOdsfMxtiPUgTUHIvwzLSJBVHN2oaBEkgQ
YbIEOBuJT54lsk7cdYkYONkpobVHH2qROltUXdyYgMIBsEi5I5syjX91a+/q+7c3I2kEul5rqvsf
mAzK2QIFmrCa3lFU2vOA2avwkPlJALtYG7LAkF5rbafXMklSnn8lEbgG1BL4Gjo7vyMotp457gnQ
Yqi9j63OyShud0rsNIEqdB/TGG1Tpq6orTbhW1+vmsqTYRUpRLx38QaWyyicfNP4Zj1bNBOwjKOw
7XthwHNefz4+uz1LF4vZjhKy1UzEDmfrtDWXl2p9iIHqcwfyqieKAwepMoccMf6OEoRVXaBvV/Y9
5KWVqJ9Denz+/QvqnfdPL48PV1DVuQtgbCiLl8vA0wuZ9n2w1gUAfUypTtxNCL/buqgxSxzau00P
9g4LApnsMtQH4bozhDx9/PNL8fIlxgH6bLDYIiy13XxsMMIM1qh6ttnXYDGF1l8X44xenixr4TCV
/l9l9bQmBA7P3Mmr4xbjcYyWgz0D4THfuRUQJK3MyGTWisudVIlztUS2Y02ncf77NxAg7p+fH5+v
VId/1zxvNHTZU6sqTDgG1pNtaRTujnND76gSh/Xr2WTbyWxqhFwu577tqCiyxrY9DghkV+cKDpnm
O8kye/r4YY9bZoTzz1Ae/5HCtwEUCWgbhct11FQIeVOoJNr0fA5oLR6d89Y9VyhRWuHsHGkU1adK
jM8LpiWUuvov/f/wCjjZ1U/t1e9hG7oAJa1ersrs2CFyWCsA2lNqpOZ1GIYiiHjUPU0bzux+IRaD
hOh8JT3FLj1wt2Hl3YW3LWNeDCsbCigMh1zUvgQVW5z+rLaC0QF4U0TfLED/eUyYpTzCb8dtECB4
UeV40fTKu5OjUYed28+m9ICfDqC1nSN76FRFm5DgeyViS3vtGDTyoJ6mvESmD07KPtnRsGa9vt6s
qM7CiUG9atuj80KNcpwKM5JChVF01/bqnl9+HV/ecH20hGS68NiFvMQcSVTredkl29QeaseMG2b8
0YPMhA/MyNDuu+pAZpVFJWHJy3l6nIWGosySZbhs2qQ0Y5MNoLJgjN5ahyy7U8tt9HWNMkyDYU3t
nuW+LPi12GaTN8n6qmK5mYdyMTNMuTyP00LiiyOYnA0diCy/JGTzyzbb7shEzPuyFWlhOVWXidys
ZyEj3wkTMg03s5khDmhIODMc1Lq5rAGzXNp5pzpUtA+ur6k7sJ5A9WIzM2TffRav5ktDx0pksFqH
lgdrZ35EiwCZDbHEiPS9ur8cu0SLWtbVR2294aEvllqZbLnx4THEtK1qaYRLlceS5cKgicOJI5CC
wKqBXrCqDQP7ZlAHyHLke8YV3XgZrjAtq0Na1+3w0wTwNj5jzWp9bVxCdPDNPG5WEyhoOu16sy+5
OdQOx3kwmy1Mkdrp/DAT0XUwmzzgpqHe18lGLOwnecgGK0aXWeqv+48rgU5Lf/5UD6V1qe8+0WiD
rV89gxB69QAM4OkN/zSnskZlmDxt/x/1Thc88hVkFNTxglEVKgd5aSjbWoHJzEymA6g100SM0Loh
wfskNhRiw4e7nzjxAtraVSZiECneH5/vP2Fs42JzSNAImvRJu7Q+FIstAT4WpQ3tO1CUXdCuU/P+
9ePTqWNExnjtRrTrpX99G1JJy08Ykhk7+UtcyOxXQ9kZOkx0dpzSo7p3Ht5W7N/dPjN7w+6I94Y9
W3EKlsaY9sd0Uhk4iA3es4jloPMKS1M1T7GREnPCjJH1Ej3LO3VrcsGPyFanuxy1NaJAT7892Cl2
9G/tZbXTaqWNSYvdTs+V/jac86tgvllc/bJ9en88wX+/Tnu1FRVHB1SjnQ7SFvvYUpIGhBPYQhAU
kjb7nu3T8FnQLxEfauguSVw3xpZnB7RF8KimzhzoXefXazt7ubwvKvLEF5mlhAqaw9+q/HZn4mhr
zjy2IBYffQ8KidKLOjY+DN4CeW6adp74L+iDdC/5x76jPaHw5BOv0KDueRz8QPcP4O1RTX1VSGDJ
dMVHXtPBjl30iq/VPM08L+yA/kDHXmEUGrGmFNj7xRFbe0Ltupg35snQWWOuHD8O9ws6BnvWC5J8
h3+8SBB10IzqxYPgcH0dLulngZCAZRGc6yxxw0QMkn1Rie++ecY26Ae91fDwRarZzB8QuPejYBkW
U3cQ5Zs5SgGOr1XyBBLD09//xAOhu85nRnYeS+3vnXv+wyLDuYKRIrmZXBuX9xHkVjhb5rH9iAZP
5+T45vEyoKPuOmsrEFzT8uVIsN7QewaEW06HldR35Z6W0o0xsISVtf1cRgdSFntcsRcq2HGbzfI6
mAe+4Pq+UMpiNN3E1mN8MhUgN3hi0saiNbczpLAY9pwnBENLfjX5QodZaca+25VyEAj6j3+prHUv
Cj/XQRC0PiaXuk+VG98aavW86dWtgzyLfWdDLlb0GsNUv82OdDowRwHHXF4LRi50ZoZDmHCcoMJh
ramP/aR0hmJE+PhCGvi+66UFdqiKynJr1pA2j9Zr8g0Zo3BUFSxx9na0oDdoFGd4KtMnVpQ3nifa
fAu2Frsip7kIVkZvdP12Caq5voIXljAMOHaev4hyypZllBk9V01ZgwoasgodxSEj11K856kU9ps3
GtTW9MIZ0PR8DWj6w43oI3V5aPZMVJUTNiXXm78uLKIYdI3C5iiCUk7NIpiRNrdW7Y7j64YkJxp7
04D6w2hccpF9JTbz1/lAnJB/ohSGCFseQWlIJ0iQhzxxWd60PpDwdbLmcQHy8GLf+Xd1D2FOsoK0
eYkPW+dwNqlXJ90NOq1pe/gmanmw/aAVy91mx2/B+gK70Tm9rQ9HvjZhFNnbL2SVwSWutD+wE7cd
38XFJSXW4bJpyA3XP3w5zh3dBQTPXDqPkCd2dLQMwI+eLCmNr4h7ZtkYX3ULX88A4SvjOY+3WTCj
17TY0dz7W3bho2esOnI722V2zBLP7YK82dE9kzd3lIOL2RC0wvLCfjE4bRatJ4occMuJSdzEytNZ
9PZ0oT8iruzVdiPX6yWGA9KXNDfy+3q9aDwXs07NhcsGYOzXC/Lu1S0pufXuqYG9q6zNhr+DmeeD
bDlL8wvN5azuGhuZrQbR8pxcz9fhBZ4Af+LdlCW5ytCznI4NmT3Frq4q8iKzw/W3F86C3B6TAGmT
/9+473q+mRGslzVeUwDqmfSDgoC6cVeNW3HpmgsGgkNaV7SCe0rWs7/mF2biKBJhnd8qKWvi6ALT
gsWNsMe/b33cD5/8usD0u4RzOmDAElz2TD1hQVZ8x9GFeks+GGxWznOJyaTJTXObFjv7rd3blM2b
hpZbb1OvHAx1Njxvfehb0p/A7MgBzb+ZJcLfxuwaVk17YB5B+ValU/Blg6qyi+u4SqyxV6vZ4sIG
rjiqqJYkxTyWvHUw33isUoiqC3rXV+tgtbnUCVgmTJJftMI8MRWJkiwD4c4KPpR4NLuqL1GSm48N
mIgiZdUW/rMzum/pLwJwDC6IL9k4pEiZzSLjTTibUw5jVilr68DPjYflACrYXPjQMpPW2pBZvAk2
Z40+igR6SrOBUsS+N1WxrU0QeJRFRC4uHSyyiNH829CGL1mrs9MaT50pS/3FT3/IbYZUlncZ93hq
4PLitDk0xlQ8HlNrLg4XOnGXFyVozZYCc4rbJt05u39atub7Q21xaw25UMougeGnIFFh0jjpyU9X
p2SSLaPOo33UwM+22vtCxBCL6UJiUVP31Ea1J/Hd8d3RkPa09C24gWB+SYnRN/tm5d1dP2uEn/V2
NGkKc33xAzWicmw33X5CRFjSHq3bJKHXEgiWpT+pp4zcF4lHeVEH5B192gV8e19ugdKXca8sabh0
CiiLN972fvl4eni8Osiov3NTVI+PD48PyvUWMX1uKPZw//b5+D69MTw53LNPXwMiEWWrRfLRupy5
p1uSrcOAYr1WuXpvH4n7c0+xAhYTzfSP6HTPx+x0XhpfkSWt2imMV34E7MZbbnVD7+STSFdhQK8S
KOZTMk9xPl81lFJhz1Rm61UKcKEQbeD0mB0X86l3y4it4kz6ti0it/R+NXszsZQxUdGyDCJa8gl5
s76JYUOUp9DHuhAX+nCndLHxWNUBN98svLiTIN9Gd7tZgWhiHYcFOqnQjIhXmScksVwuOmdfGl0J
mS0pB0OzO4RpAvgTr2pGN9ojW3xCB0NFaS6IE+G5n8pO6ZpK0Gb1ioNC5bCQrL5e/eUx8yhc6MfN
5n5csKTUY7M3FXPNnlUdNuSZZxWbCvlVna6DNVUQMCo63vIxVOSb0HOUdFh5Fpv4sdfhnJ3FelRR
PYg1P9vuGSwcBN52T2sqZsyaVWnJVPCz3ZD3jmYhO59GfArCi1/PFt1OaRAu6fsIRHk0XUCtvSiP
J6rZh+93iamfmSh1b8dz+9rgts6R8arMF+dUjIrdxR6eogmAy/leFh1zcZ2cUAJD6KxAKhTEk9f8
RT0EcnrCbFG/TLNQ/nr1+QrUj1eff/RUhBP/6UIe2sH3g85Hu2U3PPVYn0eqM8PL0EBFH5vdhULr
YdldGla/fQtdmnztouTZZ36iey+T6Vuc4uXtz0+vs5rKuGU6N8JPnZ3rpw3bbvFJEjt9ocZg4lP9
xLQF1q+l3NgvRShMxupKNDfGO68YDvyMTxA/vYAo+vu95UHeFUJHMOclaxuDWbjI7P4OmYwrzvO2
+RrMwsV5mruv16u129634s7JOGmh+VFnynCAmH3sp/lFfIFhusANv4sKnWVlaL6HgTBdLpcko3RI
NmM/Rkx9ExnJWwb4bR3MbJ9yC3VNy0oGTRisKJ46UCRdeuFqtV4S7ac3dL/spG8WWC09Ts9RHbPV
IqAT4JtE60VwdiL1YiWbSLP1PKRMwxbFfE4MChjb9Xy5oTCxJEablVWgssxMe5HzU+2RAAcazFmN
xw0lQg9Eo11vgqmLEzuxOwp1yPVnmzYq66ykT6GxX8ADKAHV+EBzWMUNMSN1FrZ1cYj3ACHnpQYp
fjY/uyIbz1bA+6GWx2S1MSuDwHOmD0R0tlyDx1hyLQKAeZGx6wo3JKtwyuik8TgJ9EmtiKAvy43H
zUxTxHespC8/NJ6j2OG42DskMDTHDcVC4/VAZPh/dEOOg2BWMjN1hoIfZdM0jE3H64ZHOmh5l7Oy
FrG80NmRDu0g5EHaM3p8wYN8K14RqNcqLMlSQ7BedE+LPU9/mFSiBBXhEtWe5SDzeB4CGsluIvhx
iagErV4eKE7QEenVBkIW6JaL6XGr1ps+H/1r3HoVTsPW6zJbr2ZNW+S4ZR0sS66DRTNtTcO9H7Qj
QtsH7szJXrDIoowFy9nkaJ43szY61LUdM9sNRGYgzUYVm2RYdySa5vp6tZzpsfmnRZFt5mj+ru37
soFgvQmXl6qJg/n1et6Wp2rot02QwbE2HSnscsxAOhnkrgzp7d+j4aSNOKczXxk0CY8LK9mUgVOT
6HboJPDZn7yN6nwib7I6ZVJjpouiFir7Us3pS5JBhAIZNO8ozxE29Tfay7YXcE8cnxw9V8cdVzaC
MxRxFsyoCzmNrfjukOIqG9eGvetKuVqGwdr/0bvzziBwq+gIyE8BSLy17JBOyYPWEpwiJUv/l7Iv
aZLbZtL+Kx1zmLAPnpdLkcU6+MCtqqDiJoK1tC6MttSWOyypFS3pG+vff0gAJLEk2J6DlsonsYNA
JpDIrCGwmlKe2XH5PvLikM3UGruZmZmSaLuxcr/WctLZExYwXtH1+di3Q9rfwzNOPi2NAop050WB
XI0QLA7nlcpak25VuHFrGnmdhmA7ZdVbAq+sZqQo2ZcKDizY/zKH2b/UsdpcLl1j2vfoG2vZoP4S
wNorJpelwnE4jhTYKEgwbCcG9zTmcbw7bJb2NdmMemhRTtLdlAGF1plB2XuhTeEbVWvQg0K+DDT5
fd+iBCYl1KxRJA2XnAQYaQfB4vrl4eUD92JH/tPega6tvYXWKow8fzc4+M+RJN4mMInsb/2hvCDn
QxLkW197NAx0poyDrGtSc8LkTjOPimQIVQSF0EjSzB6YzYxpADG9rAR9PiJZp10m8jDPSSaBGplv
IqXQAtXyz6ILlWhSdSkdCMy5T7SxoUxJRjKfGaoNmq6sz753wm6zZpZ9nXi++rAQmxjLU0fkjEac
eP318PLwHu7nrJf1w6CtTRdM/IYYkju2aQz3yjcv7nWcROEM/vcgipfMpUwoHKM2hTEkywlV+651
2bWNB+p4lg+uBEfq2j2bM9z/orfXFXeyCm4TzeDXRXmpSzw07eUkIv5Kl0MvTw+fbJ9wsr084Gmu
bqUSSILIQ4msgK4vudc8xRkcwmf4Y1ChPVwRYVqHypSLJ3yOzNVnripQ3tLeVazjRFhlqcuGSZ+Y
sb/K1fTc1koJSKyiPZtcpC5nFrSg8jaUTeGI7KUyprSDkL0X07gLG5krW9hcjS+urxbVD0GCGoSr
TFVHHQNekwIpHHyvSKc+1lbSPH/5DZIyCp+l/CIfcVYgs4IuqMiA3SlIDn33VYjKbDJzfeP4aiVM
yZ44nqZOHHne3Bz2CxOHHxO6dRyqSCY2Z7KyL1LH41LJJXekN0N6cJr76ayvsYFN5ms80k6lo69y
po7IBRLuO1yhkfCeVmyCvVYG5yLNvipvr7HmYOvF3euSA8nZKooLm5Ibvv53fmhcfs/+yLSV1Jhk
dT70Mn6HOf/guF0LFKHQeSq29pvOPRgJrrebAd8yOIRqq10nDue1qyoQm+wH0ZNc29UEzl+KStNs
gVrAH67zGgB3OF+kQ2rSwWmJ8F+r2ynMGNOH8VA9okBuViQsCPZs01TUFoDV8BSCwL5OTQsB4jWF
4HqtIyQvrwrou+0eex7F8MyuxuJR4crExKbQLUxmIneHzoQzfGde2CxDjgVKa3xLWDgOZVtg47hw
XHTvhyoAcwFJ21w0x4DFUOm2TV0HL1ixRtG2ue/I7AhY+Ip6j8h0y7d23+T8ogTVssBCAIJTbsTb
HIu60TQYmvfBBl9VSTeZc6Ffs7OmylnqNUXfOkk3mvq1TZcn2zD+x4zgw6Q3SVmGo0OtrdkXeMiP
ZX4Sk2hp+5CzP51rwjliwfBEBD0DFQhopdLG6rOVjINg/NKUjosXlbE5X1rXBQ3wsU5w1MOy8QIi
Vq4C531mpriwXgAHbzdMhJ5qSocwfNcFyjGMiejeuNgXmnMX0moUW10hZbtida85pZsoIv6P0rEz
0O7R6WhrQbPiLge6P0PgpE6JX6Yh4K56doUvLmGDHLkNV88iwAsaH8GWSfQHzUULULliykaj1cmm
L1xOOzJW7VKYEevzbapL/ePT96evnx7/YQ2EenHHoVjlmPyQCZ2XZVlVZXMo9ZJYpsY3tlChQHUz
kEA15JvQi7HFXnJ0ebqLNr6dpwD+QQDSwNaNFce6El+QAoiBpiReqVBd3fKuKjS3PWtdqKaXwQlA
adS7jtaaFMJ7uzq0GRlsYpfv9UYLYjrf8LMazPo++GoyvD51+R0rjtH/AtdM64FbRPbEj3TBy0Tj
0KwRI95CcwjAi3HkGmzpwwBJM9Yddj3JF8LpnEOlUfwahkO10aEdIbeNmUN+HMYrtjDyJZU/rwr0
bCRxpJudal/AIf4+i30C2kNfPuiERtHOYc4p8Bi9Q5bgLr7pRRnG+ZLU6YatItItRLxyjDfNa9t2
iq9YP799f/x89wcETJCulH/5zObQp593j5//ePwABt7/kVy/MfURfCz/qi8hOayzuiQuvj2IAcpd
mOlqogHOLmh/mt/uzMIj/6585EteDnNrgy1L74c+Ja4VoTwE3qBP/rIuL4FOki3WyuArqQjdKULN
uS75GO+prLsKO4jkOwQ3rjDnMFsQUOVeZ7o57t4Y1p9Ch/TGZ19thHFSQPneQi5H5T9s6/zCtDMG
/UcsPA/S6t86+eJ1mn2u6lWVfkkrOLJ21mtIwXjiYh9ntN//EouzrIIyifXimVh6gsAf2vhBZ0LE
Qo0oDTVGGVtRieTMZdA0z/R5vKearzfnMm309HDGjrw4ZAa5nonScePK/BZxNx1vqxcW2FpeYclM
f+1K+6w9MFREnLxoKFBk+IwFKK46eVEp0DB9lKmNikNRVRFlPzRRSVySUGK47l7In57AFaQSrJJl
AAKUWouuQ0KIDR1L/Pz+b3OzlTan8uENWBk25XBt+xN/hwXqBB3SGmIeqManDx8+8Lgl7KvhuX77
HyWm29CNfpQkIxeB4YhInVV2ReZ0Uixaos7I8D4SGHnMeTUOHGmEmGjzgxy0P7Nk+hEz5MT+hxeh
AWLqWFWaqgLujT6bxDrvgpB6ic1OWffp54czcvMjDzs2nRmGen+zcxTXyza9zcuqHbCSVvaJiYWp
kH1/fyHl1W7cdOxg5so0J+N2e84tbZq2qdITpgfPTGWR9mwLONklFmVzKXvtlnSeCdwBDGSNFUxY
H6yXWpVXQrNzf0CH5Nz0hJbcBS9+gDbl0ubHJj2k6FHaNCdAq0rtfsvpZlv5kQMIXUDiAnaeC1AE
QdjRxSm/TuB+1XmcZuF6PfKDiaPdG9KQiBkiXGAbuZD+relyQnxGDsf9PCt6T9XYjpw2BSDVqdwq
1Ju37Vq4nv/88PUrE+t4EdZ+ydNtN7ebEdpLNIIfcZvEuuj021CuTwq3Tq42FNe00w4WOBVuk1wp
9gP84/ke3nI1lIEG96agxsnH6oof/HGUOAwgOVjdNzdrpmu9niUx3d6sMuuyeecHW+ewpnUaFQGb
i212NlrBhjxXzwuECdQtiSKDNr+LNUZo3EsXeZN6654KYvNj28xvEoX7ZWOy6A3zvc0Ir1Q3icOn
6MTEgyn6mLaosrB8jAbst36S3Kw5JnoVOyYVozgkW2sQ6NrQMjD00bc/HL6SBny/GmNzpX6c8yov
O/Za7826F6c+/vOVSRD2JyhN8o2y0kJ12S86AeLRmnUSH76HUQNkYgo6rEaupvOTmdBOKunrScEe
y5yTQ0fyIPE9tduQThHr1r6wO0uvR8qdjeKaj1iPuHd953LEbbeMKr5Jm3fjMFTWvHOqbmJ96MLd
JrQSVV2yjWJnDeSuZ6aaDEHdDRNijSvbPo+GKAmNlnFLemsspW28K6vlwtROCcaEXuL8sCdjQ2M+
cnIS27OKAzsfv7sUHE5j/AmOxd2F9qXWyW6n+bxHZtYcBXn985QnW3oB2ZDczIleM+lKDYAjv4mj
wcbDmYvl0UZKAamn6WJ0izwMfHthpG2RXkhlXm0rQZnNRms1ZjrIWXFEf9VC4119uNy0tCX/t/99
kkpv/fDtu/nAzpeqH3/+0qKvK2eWggabJDDKnDH/ii34C4e53S8IPRC0P5Cqq02inx7+n2omxTIU
Cjn4UlTeIMx0CvZAny0yNMuLXEDiBHg8TD3urcbha2uNnhj7IjWOIMRzTbzIUVzoO4sLsbdLOkfi
SoyrdCrHNvHwKm0T39GI0tu4EH+r7jz6UM9aAdxbj+lFVRo5qS+p6spZIVrTz8Tgv4PLikJlroY8
2DlccKt8/zY/IUL+Szb0yl65UuY8fcmDttat40k4RPSpXVxa0fTcddW92aGCKhQiu0slerzWeACZ
IhWMymMg+RhiIi+XmhBdmVORjLJ0YIvH/fzcRK0JHCMdYIowYc2L8efNU3qYqOh7RpUh0a7bNeT1
3BN8skwsbdU53GtIBpqhFgKyjQxVuxK88gniT7Mh2dtge1P3QQPQb0VN8FgoAZlMsBjGMxtZNmAw
u+xMpBz32W4cG3x/i7tRM1jcyQOHK6ypi6YpstKL0wsGJdKQRPjsVM3SJwAEx2CrVmpCnM/Xljz5
MK3yVEMYozEvlYr5m2i7tatclAO/4xAscRSjreLyK1Z93uIdZi49cbBh3/jRzc6WA+oBjgoEEVJX
ALZhhAJM6kWyonUWbpCchLC78xxI4G/t+XtIz4dSLOkb3y6qH3abCKkbv44406wrsP4759T3POwa
lS+KqhUV+zledHtRQZS3BkfE71Pz8J0prJgpswz8lZHhfDj3Z7VuFoh7NZjZiu3Gxx9EaCzJKyy1
7wXYHNY5Iu3iQYMwQUnn2KHNBAh1AKhw7Jggpj5cmIBhe/MdwMYNKNNHA+LAkWLr4c0GCFNHZw4a
brFa0HwbB0gtTgk4j0fovscBK6d9WvvR0dyll7hyXVXSOsdqAN7S0OHgxttrbRpunY+lLGiMujJc
cF802k5ZVhVbK1xGzZJJvA1LC+x+dWIi0QkCqyAdtfWZPL63u5afiwX7A5YkCrcRtZNMbz1ZVZBU
ND/WhU0/VJGf0NrOjQGBR2usXw5M2sHPYxQObPGaYXGZ3tjVOZJj7IeeXR2S1WmJVJPRu/KGjTuJ
IpfzS8kBN6owf9cGThw0GtQ3+SbAOobN994PVmdbRZoyPZR2nvP9CZax2F5w2xONZ7feYjDg8lGR
QOUIfHQ55VCwNq6cYxMhjQMgRoZVAL49EUDuiL0YrQjHfOyBrMYRJ8g3woAdMqIQfdGxCnAofKW0
ONaf3SlAhC7SHNphNwYKR+hvd0in1XkXegG62A15HK1vulUdY7r8Am9DLGNGX9tRGLxF50y9Xd/g
qxp1cabAoT05GBWfoXWyfaU01AmvAqPfNaOvCzuMIQpCzD2JxrFBx0xA6x+3MIpeqztwbAJkajdD
Ls6zCB1adHVp8oF9LGuzAji228geCQYwzRbtNIB23lqfNF1eb283dCWFm4UdtlB1tfECRCaoNfNh
VYoLsIpDPOB8v+8ounU0tDv3I+mowxfszNiHURDg+rvCk3jx+kdJ+o5GG29tYSa0ihO2wePzM2Cq
J+7ASNseXvsYhzxMHHHIjIV5bVwZS+BtI3xVZ2taguwQgGw2G2y1Y7pkrF6XzUN+K9k2gMU87uiG
KfvorGRYFMZb3IfDxHTOi52Hev1TOQIPXdnfVTEeJWWu97XGhR96HPwIm48MWNWBGB7+Y/ccI+fI
IEhDVpu/qEt/G27tFCUTLTceshAzIPAdQHwNPESXAOfim22NroQT5nBorrNl4er2SYeBonOQCfRx
jLSeic1+kBSJj4gNaUG3SYABrJ1JgJRCmjTwdnYCoKsHaAo9DFx7+nbtaxuOdR4h381Qd0y3Rb4O
oCNDxunIZ8boWqhzlY4pi+BGPO/OuMbIwDiJUwQY/MBHm38ZkmBVD78m4XYbHrC0ACX+mtoIHDu/
sCvEgaBw5fqKQMBZ1gQmxlCxhXBA9iwBxY2rRXGwPWIP7nSW8gha5ar5+DyJ4fWK65B8ZhpOnq+u
tlymSBUrOEmAoJADobrvkAkr67I/lA14D5DXEKBlp/djTX/3TObprGs5zZdAizV/Aq894d6pxqEn
HVKFohRm3If2wqpaduBaqMRKURn3KenZepo6THCxJNzHOO1Sh0deLIm8laqYLuj0IjWlc9cKYVTb
icBZ2hz4X1g3/B/a8m/bIGxhZaqVqkPIt3TQnlNNkG7Cxp3wBPOUnJ1nQlRwMCX/jDluENHZeX3z
Kq0136OAgMecYmBLc0v35kMHjWH5EpbPjXGEG++GlD73gmTB+mG+vVzNS8uqFO/P1zLD+0O5tEWe
+06rAHiDayklmeZHgqpHWsCSEx6fXWFdVpsFdxXAX5K+ksHEgi+/jEU49HWZWWZ5naK5A2AdlPOn
Yn/++PIezLsnpyvWRKr3hTE/OIWbJalrOFDTfEh2mwhzR8VhGm597RhiogaO+2IIZ8AtytBjJ546
HYJk61nBzjnG3eHB+3/8UfLCc6zyItdbyN1Fereb2cas2EVbv75e0BrzLG9d4Fmu+tTOk681tKeQ
AJgmxAtNv3sUI2CYFc/EECMmGFE9f1mImmrBhwBWIDSa3IyqRmiQkzw4FrXWeocjmPAwgTGSVRwi
2fiRa1LAYfHtdjM6VxD157sAHEnMZD3eFuXuaYB3PpTk2oERUFl63IoO8hJr1dtz2p/Q11ZVl5tW
ugpC9XjQy0IMdUPS6AzwVvCaY+v4hBa58OZuVZh7a/mM04UJuPEVKDAeoRCYuCFiXreFupsBIAwR
zTz5NTSqXC6oMYsV4wbtk5lvfrUCxKWucylR7nwtahKbE3DyYbmWWbIJrZolO2+LEPVLvpmMaoEL
mliJhtjQHHW4bPaBn9UOr7CMoy8HzEUhQLYNwOzXUNzKLIvGRHfsU7wg2waQk4fIQ+2xODhbhepp
TomHXcdzrImG2Lf6iZa59eZMhclmG9+QfY/WkWftYJy41lZ6uk/YjAzMxoKujyRJs1vkeUbpaRb6
LmI7dEY1paGs8O011E/vX54fPz2+//7y/OXp/bc74ZKaTE7mbefrnGFevifXNv8+I60y0yMAre0D
GdM6DCMmItIcv2AENtsqWVCTbYIf98m8K9TTJp/GxnsqsH7wvUg7qRW2Eo6YRQLcYvshL1waFesj
Mltf2FRheaE3gNGTjcPV/NRC1gfopqzgURzpq9ls0WxXwzBonuk737VgTubOSGaMim3+DGMrPHrg
MXlltb+5CUnP2kYyeWq1E0Agkm0oAK31VR1G6volekoxD1fp0uO62YK39Q01GAfQeNnCi1RuPlUZ
Udj9o0RbQuFyWbAxWllHvhfYNN8zabCNIDRrUWTUjSuam4BD3+2CemKJLL+uZsEbvXV9e6yZWL31
k5vV3RPGhEn3504HEHCwSSXXQvVZ5eSZdVYYVMcZLm1oTjx5J1bymx0WTwafFrAnN3DN11aDdjm+
MIDDpbNwQ0bPtW7kuXDBOQU/ppj5kBYv7Ew2OiSqWwYNArFpi2GgwyVxhFchLaJwhw+EwtSwfzC7
A4VFaG3qaCsg39TW00+apIUoapuNyTmGQKYOoyOxGwnxNjDMFfLOYMKmrTJ10obp2eqismD6a03F
cTbXZ9zIJQo9fHgJrXahhylnGk8cbP0Ub/faQ1mFi23qW7SGHAkceYNBKbbh6SxR5E6OP2RSeMSq
j9aMQfE2xvOeNI7VzIEpUuUCDTJUDw1L4s0OHzEOolfnOg8oHc4MmPLxegb41zGpIXi9J8XJge1C
J5Z4eHFSh5dbO9YeYSe23h7GwxqNVjrvfDYOOMZ0K/0WZ8Gcr9kUlkV9wjLYn9+VriCNCtslSbxX
xpvzJI5PnIOonYjCc62x9vPw4LqHiwWcVDO0UKmErRaK6UgKWh0iM9SszcRy8GLHysTAJECd1S88
cH/ux6GjDpOi8FoWcRDG6JcsdIAgdGNbdHOaNQontnOX54foZLZtvi0M/aoVVQHHQB/Au8/59FER
hKS3NAsw5cZc6u86pWkHCLepSmcmWw/OXDq1hhVx+KLt8ymSB24nw3HwAIrDPHQnf+5jRATiSvnh
5eHrX6BBW+7t0oNic8x+gAcztb6chMbb5khdWMx1gVq0ACZ8fWjFCSdhOg1iwesE8Btj0C5mqnK/
Z72jR+iAY8PDoLipuhxS8Oa3DJkkwD4Ansro736sQvRKBvBe0qo3ZKr7BPZjrElHxkJ1vwPUgvXF
+TZ7IdQx/qCAltUeXlXpuZ1qKt3l2fR9NkFadvsM3PYiV3wLCNEL+U3i72xhW0ZsYajKlLvmofxl
JjKAwArOHEc204oRYtCCmzB1+ZOtzlH/WAAOg9Fz4OEVbeyhrCFuB9pa6AgXBunoEV7UYShlQ1n8
rngLfPzy/vnD48vd88vdX4+fvrL/ges25WQKUgnHeFvPi9W5PiGUVD464SeG5taNAxO+d8lNb6MG
ysc/yht/V93ExWhf26EJeOe0bCVI1bxUVpWzT4tSD760ULn21w2YXA1M7BsHr36fbdqoh4lVgJxg
vvUVBlmkPmISYyL+ID4a7tNluhu++yX98eHp+S5/7l6eWfu+Pb/8yn58+fPp44+XB1Ct1UtimR/c
MLguiP9FhjzH4unb108PP+/KLx+fvjy+XmSRoyWuZqPn0rTnS5lip4x8Ku10a7eJxlbz7ohuCyYj
d+MI/mqz8vf/+i8Lhihf574cy77XDV8XjrbueohTz1nQPWrmRWYX77UPL5//88QY7orHP358ZH3y
0exMnvz6L4qwAtijDKbtwwTS67gHxzySq83ATSFdYxRekov0gDBJZ0XnHMtg2gNsqGqvbFW+sC2M
x+rg3nSwOojsL1mVNqexvKSqY3SDaYoCIT03y2mIdLs+HOxj+PPp0+Pd4ccTuLpsv35/+vz0bZrt
2OgKQxxw90rPtCub4vcg8uzGdwQeSL89QwdESIXWCtb2kUNp7ixslzAo9fWwv2E0tgPm5q55qNNI
dQ0jabFuqCqpTALHVSnAzwVml8NXBnPrrw/pITBLzUnfn+n4lm3vOtDnaQ8uA49FTaxlHLDqUmBK
IuBvb5WZJGvzo4td+uu3Fv2Oh7b7qS+K3cOXx0/fzC+XszJRi2XGRFwmp6B+/xdOqDxSGDjg7KrS
rLzA9iW5B/ur/b239YJNQYI4DT3s9nxJQyB4xwn+2SWJn2NFkqZpK3CR7G137/IUY3lTkLEaWKl1
6UVGFLKF60SaQ0FoB1Z6p8LbbQsPN2ZfkrQV+15vY5UX8N/mfCMNdu+nJAAfc0OZH8d2gAvuHVrf
lhbwx/f8IYiS7RiFA8XrzP5OaQtREi6Xm+/tvXDToJrxkqRPaZeBxz8mFitxK7F69Ol9Qc5svtbx
1t/5r7Akgatn+zY/8Ua/OXrRllVw91od2yZrxz5jQ1aEjkxlaN6RxoUfF+4v3OQuw2OKmxih3HH4
xrt52CESyp6kqYd+GCU5teMmvF72/gFlYJpIN1Zv2aD3Pr15aG9LJuqF28u2uL7CtAkHvyodTASi
TJLbSIftFmcZ+nN1PzZDGEW77Xh9eztokquxoKjps54UB2OfE3nOiLYmLXfG2cvTh4+m1MzmOATL
vbH/3LbaoT1fgcFfa0GtRbY41xnXEosU1+m5ysTWsSkYomOIawgCdiQdWNoX3Q2OHA/lmCWRdwnH
/dUsFnSGbmjCTbw2JUGQHzuaxOgzQ64NERgkwjiM+cSIOy+42cQg3JiVGY6kASc/eRyylkJsd5fu
19IjyVJx07mN7Yx0HDvc5mxsSdl34uW3np6MtIkjNkzohemkcKXFZRv5xmycgTC0ZNslzYpiu+zC
NnFMj5m8TTbnj2Qw8rXmvz159XzKoUkv5OKSMvq8Oxj7dn0zBElG2Gc6zyVrbxfCtEGz2iJm3Wub
UNkM/DBifHsm2uENz4JkS8ga/qHuXx4+P9798ePPP5miW5ia7T5jGj9Eslc+eUbjJ3D3KkkdvumI
gh9YINVlGRSqHSYUwv7sSVX1TNy3gLzt7ll2qQWQOj2UWUX0JPSe4nkBgOYFAJ4X085KcmjYOlKQ
tNGgrB2OC31pPEPYPwJAlwnGwYoZqhJhMlrRqsb/0G3lnm3vZTGqyhMws8UQ/MB+VuuX5ifuulzj
BEdH8ohGzxrkQmj+QLgJvT03/po8h1u2wzAaXFbWyu9q7YRYUNjA7NsR4hi2TcPGB297fs+kmECL
+aNSrdnDvjT9N1thWccOxriQmg64zfWebyeo608GnS8lTY28gOTKqtmg171whngw82k72KL6ElMA
YGD9wrBxhfyNo9uZZNriLICllSM884TBq9KTi1l5IDkNRSbcdSAw4fg8JVvVKwkQEn3rkaTxMOBe
wOArKxMmk+J2DJAcTqldoNMRIFTbOsCbiau9ITjQbkb4VvotHe599SXfTNI6U80z1QOKqhDFX4EB
kl7YmuhE0YBS8GkYcxMe0xUEVmM45sr3+roD6E2GESIZKIX3+lZTtmxlJrnR3af7HlPHGBIW+5vR
eiCNaZ67h5tzrIzdpW2LtnV81ZeBiXKh1uaBCcOltQClPR7Aj6+NzmHIme7ONmC8bB7/TeswThmr
G0I84ETf6Ftu6Or8arKaJRk2LsckfEi5nZPz0ypBP2lrR4vAP7X2vHShcTekh8Jc4yYUt0eDZZeH
VzZbyc8znLOb6eihhwnDvIO2fqAe5KFCFN9Cs4f3f396+vjX97v/vqvywgx6PO+hcM6QVyml8rJx
aT4gShQaSZ0/dEeqBbd8ry/QbCg5t3zBuivuM2jhEMZUrzC5DU8WHu5LSR1TpRZ1stv447VC/SYt
fDRlmrGy7CiZF12SxB7eSA467G8XrhXHeUpNLbN5pRhpB4dAbAji0Evx6nEQ89qisHRJpLqgUyoE
Yn6f4v06mWGs5o05jJubJEzzEMR8C6PU9RIF3rbCg+MubFkR++iXp5Te57e8abDipeGnepzxyjc4
5cEkQHj2q3xEXAvDJWaudS7faHto9V8jPzNk4najPwxaIEvgxJjy6jwEgXFWKZtl2RZM5dP2rLqB
p8YPGVJSI3V5bRHGslLflEsiKfNdlOj047UoOz09Ld9Oa5JG79NrzaRNdb4DuaUUbtHR7phK5tV2
chT3TQrvn9hW2faYZMJrJe7jxrYq2KpDjNYx4WRUpRMgXso+a2m5SC5aoQvqDM7L6+YQ5ThWpyM9
ZOe9Xi6Fy5kmN8eJd+u5ru9tMnSrDLaLYq4UrNttiG3hdpq6O288nwd91oG2q8JR0z8ldYNSOS8U
g/NLRO9B/iDWNaxXSu2CKBwc1LVqlyLIyVhQc7ZmfmxTia71ASktIKgSXou08BM/Ts2qA3nj8FkD
cEVd9oAcfjf4MWqrK9Eg9GOrSCDjLtwYmtckCYPETMTJqOEWR+kmCH29fzgt1mkl9YWjGy1vRk1c
8c6h+/PY4aqGgYcz5SIOyfWSGL28DX1Zl2ZpDGFih7M0HsjZFc1XxUc6GHPqTfrund3dMKWp4+JB
4APZBTdkJiBMWEdzLLyZ5dYE1YHkLDe5YY47udNraX4RjGR/o/xDyWlnLFY0TztrGKAL90zSdzxz
hwbwZZc0TZq74txPXHIKrGwQdgTJY/EbtyrhP+SmOdO0/Qu8cfclN9NiesG78ndPz33P1FcIIO3o
P/Gi39ocbl2bn9DwzjxRwc+m8701UK27mfijJJ7qvoHzSBH1VjSfFLaecTTc7JJicbDNPqbmMGCv
lhkb27iXQT+LbJRMJi1Dlk2/Pr5/evjE64C4jYAU6QbuDfHCmLLenxWpdiaN+71Zfa49oB3GUXrG
dg0OnWHI9UKysjoR7WgHqCKMmiOb/EjYr3u9O/L2DI/BtLzrNGczzGBkckVBTuU91XlzblZq0O65
nY/ZfjYyh5YHOHNUsAT7xb3ZprIqcXcJHHzHqmQOcJ2R3po8h33vyoRlwS+h9XxO96VOuKbV0HY6
DSLW8btvs9aH+55fbjiKJLlmhMNJQ6l345s00yPZAHG4kuaIHsWLljQQ8G/QvFYzepUL78A6sSxM
QtNeWoPWHghMf71qExV+dLr18oQ4Yh4A3p/rrCq7tAgMLoXnsNt44htSiNdjWVZUI4v5eiB53bJt
1pzHFRzgmMT7PVuijcHuSzE7zVnDBPW+pe0eWxs53sIeXN4bZZyrgYgppdGbgegEJuKXJ53EtGFw
K1O1vRrncSEiC0tXDilEU3PUsWOfPdMmrVSCPO4z55o0sawduKt8K6WwyeZa3rqKtQ4MAXJjbWHK
ChOPdBpNidVl0vTBIIILa6abnswa0aFMXSsBw9gEY/tDSfX5wfLvqrNRv163quKfPZixpJRgLmcA
Fwd8o5isegk101betPe8mEVoUajWvB/IpbXWh7ajhu9uHT+y9cHV/OHYn+kgg8vOTVWpVh3OsN+O
HQ3Nbr4SUreDa6m/kaZu9d58V/atbPyc0UTD1wme6r5g+6253gk/auPxnFmjL5CctQheD/Ffrm23
kg5LJ3cDiKiwRJXHZBge154UaiYW7yzvKcRZemGqYXvMiX4Nq0g3DJcnBWo7gcy+Nzjbx6/SgOFc
dcQOUKwwsP82LicSgKc9rP8pHY/6V88wRwom+k4XtsAETVVkrpne/fXz29N71tHVw08tEvZcRNN2
PMNbXhLc7xGgIrijKwbzSklGNmlxKHHVYGBfMy4CQ8K+ZUMmnoegPHWNvkpnUtBAcm3Zmmj2+YwS
j5R+f3r/N+Iva0p7bmi6LyE80bmerZ/UpMfnb9/BwlxGf1accNgVGci+ZvoO3q6J6Q3fPZsxTFC3
EBNbH+10TyQzUEKg1JPDo09TXvmuoogI7JfQv7STzJk68o0fF0uAKethj2vARP14hWc5zUFfSXlX
wAk/Mid5DtgBvM6RNqEXRDtsfxB4dzYalOV1LE5BLGpkUvk9iWdkwImB1SXiTsVVDzjRV72sz8Sd
avbFqU05bBLdMRmnX/sUP0HnqIh4iZ3rc1h/TC5KB9crG4QYBWY3dFHEX+XWhk/LGXW4kV5w/JJz
xtGICxJNDJc8EzlB38nK6VleIEglqYyW8F6KbkajJRXrJIBiPcAop9t3YFoq9YUtpyyeJYx5VwTa
W2hOlJ696EYzTRftHsJIfVfNifJRtDVjhjyFR6euWg5VHu18ZKZh0T3NqR79Y9SsHQxbYdEUGvr7
KvR3K9+w5An0g0Jjcbj78/nl7o9PT1/+/sX/le82/SG7k9eDPyBcJCZQ3P2yCGm/KpeuvOtBmq2N
rjQjGov+qG7gE86mslG1ZgY8xnB1HJPJt0lmzybh0Eh+YGgnDC9PHz9qG5FIyJbYg3Y/pZLNCx8N
a9nCfNQDzGt4PWA3rxrLsWTSdFamgz3zJMeapqMx5tY6PSFpzuRyMA5xleGQqTSeyVEt1155pz59
/f7wx6fHb3ffRc8u06h5/P7n06fv8PyPPw+7+wUG4PvDy8fH779aW9Tc1X3aULDBfLWlaV3qt7Ma
zFRTx2mnxsY2iaLEDFCNzOCEz16y576Fg0gkEzCZAS+jk1XOnJqwvxuSpQ02N0qmOoxsjYPbOJr3
Z+XRL4cW0VqhLrOT8whTVzOWPIcM/zuSBmbebAHUDqFFRRzPoidwG9+MssutZnAnaVFg0kgSJNuo
s0pk9N02whc6wRB6jhsfCQercBn6qwy3ELtjEGmjjbqVzM2ITWKfBLHNKR/Y6DQj2JWgQnhvpBL9
kPOLup8qARzzx4mfSGTOCTAuYKJNLcBjqvUsX7w9qNPsvL97/grP1VRvd/dNDpbBqvffK6dqipZM
7iiUQfPbQVwFMoqfP6bzTT5BUq0INhstcOyJepoDe/F75N+L9w/b3Q2AOx7/PZio+T49+Gw4N8q9
1UIbe7BuCObngKQ+QLw0QuQJ01SpwY9PullQl/b83rwDI3O0ZzgihXumalBqWA5OlTmmPT/6Agfo
2ombiuB20wqHW+OwaqgnVpR8ohyUnCEEO9nrhK7oL3CvQfq3OlDAM3cMSMtcJzAZIG9paOQLRmzz
dcky7xjElnNMp+Op+jOlJn+9j03jEAU9XqZyUBYw01u5WBdPD1VjGP4UsS6bszpukmwokyacwd2a
Y1wlC2m6M7ZrTuXWWGVqGDjxQGHy0jHr4ODE8tvzn9/vjj+/Pr78drn7+OORqeL2lZiwDvyp/5ZC
k0k9D6TShkHS0QZOPudeqcmS2aEv7zP0wooO6UFY5k8TGvwNaG/+BcVpbDLDQgTi6xh5V46njC0J
m2SFjekBKqdnsNaE5tM8Mus3Zq1qfSSJ0veGWXO5yrjrTullLJrOKoTQ1FmBLq8Mb+QKgD6aUvEY
qyYDUDuJBU/8wGo0J8c4OUGLqcPVCqZ1V7GOJy2TBritipm1YOjyIIzX8ThEcfaJJfqzaxXAtN5p
8qS5qszOVOrHNTYUDGF7GXG8qFCTr5UJPketNkCqRH1IstDjjWePUjEwRdy32RnZd5A3aCZ+hJO3
yFADgLq8m/C6DoN0QHpuX0U+bngyjTFsS6T1gxGNZLwwEdK3ox/b3xbMRBJ4p9yC8phJNAf9ed20
JnR5vDp3i7d+kCEJG4YNYxrgXt91ptaqEQdq3f7UgPwY01kWpirNwHk7TZGVhImc6EJSF6m/8jkw
hhrtJQacUcVr6kW48HwbWjWhUYAtJGReBE0sCaKI3xNYS0DB/ppiZiA15HgKWfseeqpo80XIV6jC
yBqowrH9OSlwrGpmFhx4ulM3myFA1RKLDzSslXLCSH1WbcM3tJYQ3ITEgSre69j2FjrTsa0D6xiO
7Xwfq86EYeVdAPO3PtZKiaE9MGHhCobVU2K6Hb6OjvgZBLbZiZls5aNsd/jdBrLvoR+FxEmAtWUG
Q7uDcrBbyKfWYJsRKHNIkcUQGs4rJuC+SXnfebeVDeLAJLBjV9j5MgXhtkGyJXknVpe1DfVt1qZ9
EXjIB/2mDx2jcAK/xWcw31jblnJ+bck3YXcNZiakGIkV2I2PxlKvpa9XM6jLDT4odQm9s7qNxFGw
tXqN0/WDdgVxXXApLFv0EYq5eeED0/AtYvUjEyw1MnP7oYiQBYHGyEZUayZXS9ZMYct1t4XLNpiT
dEUVXXaxjbUXwtaGbMp8x6Mrg3sS/2pm48hasyZU49+3RWWyRFHb4sQ0XE5gJaGmmC/kvj3L59tz
d8ATY4g5U+QO7bsfKtyk/TLEcaQIseLdG4/SOJl4Pvz94yucjn97/vR49+3r4+P7v1RbWwfHUrZU
aoUPTesYL/3y4eX56YOa40QytOKRL1Ras6XBLpzAEDQ+24GO++6QZm2rqaLnhtB7SrvUuXzVbTPm
1Wm8VQ28zzld3/W4XVBtRPgSDkEfvv39+F1xIbg859GRqZ43Uo3pjVD+cl5vYlkV2Zk//UPLP7FJ
6jpoPl9x87S3FXpsd0vi+Q2ics4i0TQvwXWrsvsICuv/ShisKuRjoR37pRUpG+4sgmWAVgkseNkH
0RnO5pcz2bzIUscZcVlVbNJmpF3BrzVXgJBWz3BVKmcYMtM20dRKTu2zoTEY+0y50Nqf35CBnmVr
bDqP+ai8rUlrUrVjvz+RSrnBPnTFKCzL9RC8Q+5DlBhtII6dePesUeaB0Yi61V11WOvzmhIElmA3
O66a26l+P11arWXNUt678yZFmXZpMeWsVBgud08A8XCDyAGajAF6LFI9YHZZll2+ViM+AVdn59Sh
6BVaR/QhgQmV1a1y2Czu+YE+HM9NAW/KKm1RupG0rYmzDjAaBjYNRZm+NUcWTBkHcFLnbvHkEigb
5ORDsp54jmmn2QVNdLxCvDvyusvN1rO/2VoVjBfd+EKA3CRdf9kmgIv2wcmcOmqSulr6h1avMLMa
9j60/bfWdzecgdFYsn1DsyWb/IQ5Z259q/V5IKrWpqeh1wxUppzeqhFe+COH8VCrjyJEBj21eoVb
t+bCwYo68ktnkA6zkaPnfp8KZ6ThmJ0Hzd59AmfE7GO2cw6Q8ZKkrm7Iy3XBPoWpG7srXzUXOMiF
ZgIR7Ie0GYh4krscuJ/Ta+mc8HnZMImg5BZfyhEkNBqupJXKLREaFYnt2LfgpVNWWj1N5khLl5XH
BNhXZUyxGRoy1CbRLl5GjNQiA03EvqvpwSZXHcLLRnBQJUQgnzJuLq64CFElcZlQOs12V3bkSTP1
bcuEXLIcy1J6D17JUtzym0nPNOv4k4iDQ5W8kipvR4elaM0237RplwmIlM8F41IVwKsT98jNvu2z
+iIF3gKCyNf1JRMMS030luLgJBXnz58/P3+5yz89v/9buIX43+eXv1VzEcjoSAvMKbMiXc5hNXR1
SYF3mwR7FqowURKFG9+RA4AR5tBE5/E3xvatYBv86lFn2joO3CaWvMjLrRdjfcoxI2SiilLuDCrH
VlvAZeQwTR+b0qrxurC8nYE+VJ5rjdb6krtqLCMTrWcrwkjV0ym21A4c82qeoldw6QshqeeJyDnp
848XLNwvK4j23PYjCrX5X14GhJpVxUxdqoSVMC+vbE/LWsXCclYf6uNZMy3I0diI1QDhcGvI4rOR
5yjdNi/7Guu8szMEQ//4+fn749eX5/d2N/QlPKaAt/1qw5AUIqevn799RDLhC/NP7SdfSE0aj6xy
AHPDsUkHcilXGPquNlF5Ia+8etArNO/U4P4BRNJZU3/+8eXD9enlUfHvJ4A2v/uF/vz2/fHzXcsm
119PX38FLf39059P7xVDdaGOf/70/JGR6XOuGWpPqjkCi3Sg9n9wJrNR4Tfn5fnhw/vnz650KM4Z
mlv3n/3L4+O39w+fHu/ePr+Qt65MXmMVFoL/U99cGVgYB9/+/8qerbltXOe/4unT+Wa6O3UubfLN
9EGWZFtr3aJLnORF4ybe1LO5jePMac+vPwBISSAJpj0PndQAeBVIAiAIvG0eoGvevov48evp7L1U
4mr3sHv64VQ06AXAK1ew4bTmRqzbkQoPtpnf+vRsmZLeP69iyewZX6G42fc5/nG4ha1K8Zqbc1QR
d/M6gBOMibgaboeP0eBBSzg+OZdugQ0yEC67NXcpVEiWMNhBHB+fGoH8Rwzl9/W3qPOM2lWWTX46
5Zm+NLxqzs6/HAfOsOvs9JTfmWtw/+BGQoSuAJnBflaZnpqmZWOA541o8wPhd9YOLjTwU0c+dT8j
kobB+TS8OmG36Aht6mR6wiLEIGwerNAmPNb6vNnfSZUmSP1FZYAeqH2shLToZ81OGX4mw4/Bg3Rk
ZACybPB2nCtG5cwuAud12s15NhUEDtlrDRi3fPUQ/VjLgTpaEqLo0QHP6E4D0jl/GQgEHQegbVbq
IV11QSlMhJd01QXGP2Z6JoyOxwrr09JXF/yAdCoc6itBuSAO4vGs0DjbNeRF4Al0QkZaKF2EjWis
reI6buh2rSrS1Mj8RBiMQaw89vWQy+X1pH779kob3Dhe7Q6H6XbGKhhQZxQy0LMQk7vkAS65I11y
5CYog2/OKWWFbEwxSZZSGAFOUidxxSOZIQ6ZLsmuzrIL7AT71tTjK+Blod+ILK+C7ugsz0Dh4F/V
QOGw7CFlQVkuizzusij7/Fm8M0eyIozTosHPF8U1ZxBz+oci+Fg+DAyDoDZiBKX02bOQXc5k6srO
BCjtV33y7f7v5/3j5gl2ChCVd4fnPWP4sWvvkA1MFZgmrdEq9+4lRb+G8qgqkkg8ku0LjChgIjLq
ngowbtOXVk4oFdljPTnsN7e7p3t3Sdd8c4IfyhYAWr8ZQGdAYJzhxkT0AabYPU2GUmWlc9IWYgYJ
RsQfhBjfuWHxAXqI3hItjgC4bch1KeRgJQO6bpau+QvgWS2l8xn70yRiMSGGbv/I2P0efa14x2Te
d5BiU1aw23We1PRYpssWVU8cXvK7AkQOsfbtekFAi29ijZeMl0piLCt6MtGWxl5KVVfxwshkVsxl
OAGjeepCunkWy1AcFLtQ5Bh3RAZate6bK6QK5q1QtbFhzM1MAvCTXrvissuLSPwSQKJf6JMUZpXW
qGUryVJIAEdSZheqZzFe5UnbHZo94ZNc0WMt5cSM6apfHrY/jBfbAz3GlFp8OT9i5wUC7b4iDA0K
sney0MRoNu2K0tiv66TwRNZKk8z37p0iaoXeiN/aX4TxDGwlF20QRXHI1V1LDFQhyjFLkTpneGqJ
MAiXcbfGwB7qERMfw2WQJlHQgFRao8+x/FAPcUWNmSlCxuPxFdoYjDdJGtLN0PrSmRHbkzRGU9PK
8NzO4IDAJ6DXHvyc0lZU16VOKci4BwMOJo0kQszrISb/eL2pQOJeRxhLeJ4Hdlz/i7ZojO2LAPhM
gYwU9F3xVkAWfDAooi6xDqocBil0ReGtR10X86zpLg3TpQJJLohUQ9iwr4Tpr+b1iRHMUcEM0ByG
3825t6QR60a/MeAEmMwRcwjJMAx3o+Jcwx8+axJJkK4DCvGfpsVanD9WKgH5Q152jAgzFNEwJVP3
SJbFMFtFeT0YCje3342UDzUtHpPx1HrC8KjyCu8plkndFItKjATT0/Tf2imssr11aVI34k6le6qk
vdft293zBJOUOat/DOTJeBFAK895S0jUHzgPEbAM8DVTkSdNUVko0JvSqIpzuwRGOMEQHjhXPOTM
Kq5yI7io+bQRtDrnp7QBKcRV0DQGhy3bBazJmXjNAhIk3XXFRmxb9adfEaN47M7rUA++88AtC7re
xPxyrKjw2Zeqi9tQaBPr5jLL/DWf10ed2ON2lvSVWRB0Fg1ATYrIk4B9k4EgvSkE6I3x6nAE101k
gwNK1Oc8Uh3K9HNvw+s4bCvrnezY7bZZxnmThE70MnbpFWTibFRFZs2GguBFHt7nXeMbbaYRExJt
Vxw63E4av/GZT4onYaiTSBprRpHAhA5oeZ/v6U5+l24ZipQm3dnJ0Xvdwk/3G7WwGt4fef/iSWiK
96Qn+3WLQ4Uf7rZ/P2wO2w8OIalSQoNo7vc3AHzCVxkcxpilma9MoWyesimAH2Pvdq/PZ2en539M
P3A0vqem3e/k+ItZcMB88WO+ML9BA3PGTaIWxnDdt3CnIkdZRFKEC5Pks7f1z1N/62JUEovk2Fux
cYFq4aQLXIvks2eOzz6fezDnx74y56efvGWOvN08P5FC0Jud+eKMMqkLZKtOjnxslJ4eiY99bJqp
2Xd6uWyC+jan5sfowQ6D9QjJvM/xJ76CfrbsKaS7Co7/4qv6/JdVT3/V7emJZ3qs1bkqkrOuMmkJ
1pp0GQYGKDLuc9iDwxhU11CCg4rQVoU9SsJVBZyGYtDNgeS6StI0CW3mQtwiiAHzTmEMGrhyu5RA
X0EDM4dLiLxNGqmjNOb3O9q01Srh0S8R0TZz42FnlEpicZsnoZHDRQO6vKgy0FRvVDY3lq94TDvC
lV91o7u9fdvvDj/d4AcUY5ZNI/7uUwB3JH+L/oNVDdI4fESkB31uYdQx0/VI7oEY3DCOOjO0rdZr
RzjvThctMR2WCvAqvoHWEhY+wK/J9N9USWic2D3JO6W5mE2ePeTylEOfWnquX153FAg6aMyE2w6Z
rAiB0IiatbKEypYSzM8XUjWYW0KllhDdj9UT7HHYAbPhp3X29QN6YNw9//vp48/N4+bjw/Pm7mX3
9PF18/cW6tndfdw9Hbb3yA8fv738/UGxyGq7f9o+UDq37ROaLEdWYbHrJrun3WG3edj9x8o2naCb
HwwhXAGD5qZLJaKAVVUc7THWjscmpIjRYuml7U1Ucpd6tH9Ew223vSwGLQjZsRhU4f3Pl8Pz5PZ5
v5087yfftw8v2z1zmiFiGN7CyB1hgI9ceBxEItAlnaWrMCmX3CZjY9xCSyPqLgO6pJURQGCAiYRM
Hra67u1J4Ov9qixd6lVZujWg8OySwvYLMoBbr4a7BUy7lkmN2QfRz57ciGqHajGfHp1hTgwbkbep
DHSbpz887IEeHSmBoQPX4RCUXePt28Pu9o9/tj8nt8SN95jl5afDhJXxQFnBIpcP4tDyydTQSLo4
GbBVRNEA1AXX2+H79umwuwUN5m4SP1GvYA1N/r07fJ8Er6/PtztCRZvDxulmGGbuDBPM7lO4hDMo
OPpUFun19PiTLFkNq2eR1PCZ/GOo44vkUmglhjZg5zEcXJW/ETmzPT7fcVNY37VZKHV4Lln9e2Tj
8l8ocFsczoSq00q2CGp04YktrdEl9Nffs6umFlqE49eOK2kx+rL/MC5bY/Tcps0cBMYOu+z5aLl5
/e6b3yxwF8Uy46dd33n1KUzgpSqu007fb18PbgtVeHzkllRgdcPndICQwuIhOIbtsPIVWT29Evdl
KNxMP0U81FC/KkR676Rn0YnQtyx6d91kCbA/eQvITtP93pJF7y4uxH/+JHARII5OxRgdA/7YeEWq
F+symDojp0RAsCGcfnZQfvDp1N2MAXzsNpkJsAZEkVmxcPfnRTU9l1hhXVrRN5QUsXv5bjrbjiMK
YncP8MA68xqaIfLEzV1qUeXtLHFrpR5U4YnbnALajc3SYj1PPJG2eo4O0NVejMw+UKCG0QeNdXGn
0uYK8HcYCQeCLif2l1Iwu7I5/fXXtloGN4F7XNdBWsOB5PZZn1RCS3aMeBtbleoRk1uOMF1dx0fd
qZjjZWBc9+s1cSDU2ayLX307TWK32D9keNlvX18N4X+YZrKduvx1UziwsxN3SaY30uZFhmH/yLWt
Xnlib57unh8n+dvjt+1+stg+bfeWmjIshDrpwrLK3VUdVbNFH81MwOjzx+6kwvmiz3EiEAH8g0EK
p92/EgzTGaOTW3ntYFGmpaR17sz1KKdjHrK6F9TfqaoSb2ttKlJuBH62Lwpd7QRjiBbCBC9l0Seo
rzNMHAuKM5oKMES8y7Lb/QHdl0EcfaU4wa+7+6fN4Q20udvv29t/QDXkwSDRVA5bHD2HqgcDh3FD
Z1JQt/F/Xz98YLeSv9FqX+UsyYPqWt2Mz3tmTnff9htQb/fPb4fdE5eP0JvS6NIsgTMKgySwtde7
L8LxlYflNSjURWYpQJwkjXMPNo8bHd7OQc0TlQQLJgG6wC8Rq8hwLKzw7ixvs5kRhUiZdILUrRgj
pSRFFpQuygIPeRHmeJxoV5nEVPNC0DdgDRkgCmnFmCzslAAmcie02rSdWcHxkfVzNMU9WvA0CePZ
9ZnV4IjxvJdSJEG1DhrZYqQoYOZ9WDmKCh7qvIvM8R0OUC0TcwLmtG3LrxgiWMglXGGS2YzPyYCy
7u8YFF3PbDhe0OKWYJ4rN+qgt6D8RtKESjXze0k2AQAV+8GvFS2wRH91g2D7NwZM4FygoeQAW8qy
tyZJAvFbamzAXcRHWLOEFSe0h2EspBNVo2fhX05tJl+PI+4WN9xPnCFmgDgSMekNj17CEFc3HvrC
Az9xtwduo+2ZEaSvri7Swkj6yaFogD6TC2CD76B4ZLwZT0AFP+gmF4PjVgH3iiDvqMsg7VCvYBMd
VFVwrXYwtr7quggTehXWEQE3Ute4GcaZDaKQvMYmiXAjZExOw6DAxZiHbMEdcBEWErFSnbd/b94e
Dhit5bC7f3t+e508KrvrZr/dwKn2n+3/M/kK09ZiUNBsdg088/WTgyjjCm9/goWRTXFA16iHUll5
U+N0Y1W/ps0S6Z7GJOFO14gJ0mSRZyian7HbGkSU/niq9SJVTMjqWsYhPnpd5EHTcm+L6IKffWlh
LFb8Peyf4h2T6XESpjcYKYQxWnWBhgLWRFYmhsNLQbnYFiC6VDynGt5+9OvpMqoLd5Ut4gbdYYp5
FAgvJrBMx8/HeYFKjO06Q9CzH3wJEQh91WrMQ8hoe9+pcLUO6FV1P9sIiuKyaDgMBTZ+HA9CmSNT
mVcfvSxI0Jf97unwzwRUisnd4/b13r07U+mdKSIw/3AajFkdxQucUDl44Bv2FKS2dDCpf/FSXLRJ
3Hw9Gb6jCqTt1jBQYPyiviMqGDh3ANU5sf2e696xDzrg7mH7x2H3qIXZVyK9VfC9O1PUUi/aOzD0
fmzD2IjUxLA1CHSyiMOIonVQzWVBilHNGjmA+yKaYU6CpBTVkzini4GsRYMFrmXGsLC3x+TG+vVs
en7Eb/OgNti+8amZJ3NTBUoSVQxU4j0fdtv0V1zG+PCqVjEwxDAkmBM4wx0tydMkN7QEVWEN6wov
jrOkzjDAJ1s3FoaG1RU5z02qxlsWiemZrfta4CuPdRyscGvWSTv4U/Xf45qByzHRJKpb9MrMBQ7X
g+r7fP30YypRqVdkdl/R7zJ2oOjL+NVI1gXn37e3+3tDRyTPk/iqwfSfpiu2qgXxdARIV+dYtljn
sXGJTFCYVYyPlMtZ5MaqgXEkNUURVEUUNEFnytwKpfxoa7e/GvHeYWMSzpXk4qmGIqT7ImtxQvRP
+w2yKmyJ8X+DFCWCspUiTYrkemH3u+eULd+0nXnNFXRAajYC+SsFhnfY6xdw9L6FD16kKq/0FBOd
eyjtqOgWergjF5M2WsR4tMJGFwhMq+7uW0+CBkVzmdnjuczonkV7htuoaiYAywXobYvaOttJRFUk
SdW0tGCtHmrEO2yg3jmTD8E7VMtksbSez7kflqYD3ePnabF29lAZGYY0jFVQB7mrEyswFSVOM50Y
xm3Gqg0KhcUlJhDCEEyh8OGW+O7WNnpRfZP0+faftxe1zy43T/c8QVQRrtoS6mhgKXB1CfPvepEo
V5BCw8lKTEr0OzT4xKYFbh/nu4qspnAJ86SnLoXUECPzdsamGTrD5hNb6JYYZqsJanlvWl8MgbFF
0ck38Xyzx9bhoC2KUnRR5njdy08mkoTvthnBNSzAyH1CQWD/8wxVSq38OI+UcPPOysFmV3FcWmeU
MlfiRfnAxZN/vb7snvDy/PXj5PHtsP2xhf9sD7d//vnn/5lMqOqmeJ2OilBWsMrYU6ihP1QQB+Y/
CNEa2MRX/BZNL5gxJI65e8jk67XCwJlQrMvAUJVVS+vaePagoNRDSxFEGCgr7hrWCO9g+rRZaRyX
UkM4eWTB7zMQOXMFCwd1z85zvo+DFPwJ/5dP21eo9ivYmazNnpiNkLyLJGnCZGHa1DiOgCmVBfEd
XlypQ9w7ZfDvEh9n187BRKZ6C1ZKwNoRnukhXKLyiVj9CUGJwaccQepmngIJRpQjibsBaTM8Sjy6
Q6O2ADDcG50vaFD4PrNJVFlv8xguvqjZNtIHFDL6b48cdkQl+Vck80umCj1tXVxVsMUn+V9K1WBe
uJSwTiZkL3XbXKkodj2jfkKyEEeMLphBktZpIL7JBZQSrfsFa5SCdptYCs9ltSaqbLoC1fHfqGNc
IPh0ozH1BDR45+G1HEqSbt9YcWc3xUTOhOL5i1DkGeb1feyiCsqlTNObFOb90vYju3XSLNHsZDvc
anRG0jsQ4C2SRYKv8XCbIErSQu1KQl1Q1TIiVd2hue+TnWjWzud8PBRRlOitxEqgUlw1OsW0Mwus
KmKiNRByE2wJKlMGujkopGLnnfY0QMo4PvctYNw9kiimLObT4/MTMlaiNGxsJDAveB2HW4SKsp1L
axYkZFOJJMUJeBzVS5jhqnUeItcYBD32akwk568WkWHlxN9CgUEnaGckNYPU06BVI0gNxYCw4ktB
LDXabyVdA0NodEmtvlYc2azSH11CXsqgSq9745oReAXjYetDhwRPHi2Sl/LUFc0WngIq/3pkOhxS
9O0majNPAGy1OUv7VlS0oPc679q0kJfO5mkrOgzQZ8SIAfYGY/RJZd2sRHPC6OddKLtk9+nqTI7+
wyhiWfcfKFr6I3R4oLB90rWMQFZSup+RbxDKwGvnVzWgVwYzj2kpIUtMOcqYHDoiylZsUEXLRWnP
226br/HZd+WY4ly/d2XO/i8NFq8EFMoBAA==
--===============5787090475577705981==--

