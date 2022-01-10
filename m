Content-Type: multipart/mixed; boundary="===============3480975416504391242=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/edac/i10nm_base.c:256 i10nm_get_hbm_munits() warn: 'mbase' not released on lines: 249.
Date: Tue, 11 Jan 2022 04:21:01 +0800
Message-ID: <202201110445.U0kY9hEl-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3480975416504391242==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
CC: Tony Luck <tony.luck@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   df0cc57e057f18e44dac8e6c18aba47ab53202f9
commit: c945088384d00e6eb61535cc4ba25bc062090909 EDAC/i10nm: Add support fo=
r high bandwidth memory
date:   7 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 7 months ago
config: x86_64-randconfig-m001-20220108 (https://download.01.org/0day-ci/ar=
chive/20220111/202201110445.U0kY9hEl-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/edac/i10nm_base.c:256 i10nm_get_hbm_munits() warn: 'mbase' not rele=
ased on lines: 249.

vim +/mbase +256 drivers/edac/i10nm_base.c

c945088384d00e Qiuxu Zhuo 2021-06-11  186  =

c945088384d00e Qiuxu Zhuo 2021-06-11  187  static int i10nm_get_hbm_munits(=
void)
c945088384d00e Qiuxu Zhuo 2021-06-11  188  {
c945088384d00e Qiuxu Zhuo 2021-06-11  189  	struct pci_dev *mdev;
c945088384d00e Qiuxu Zhuo 2021-06-11  190  	void __iomem *mbase;
c945088384d00e Qiuxu Zhuo 2021-06-11  191  	u32 reg, off, mcmtr;
c945088384d00e Qiuxu Zhuo 2021-06-11  192  	struct skx_dev *d;
c945088384d00e Qiuxu Zhuo 2021-06-11  193  	int i, lmc;
c945088384d00e Qiuxu Zhuo 2021-06-11  194  	u64 base;
c945088384d00e Qiuxu Zhuo 2021-06-11  195  =

c945088384d00e Qiuxu Zhuo 2021-06-11  196  	list_for_each_entry(d, i10nm_ed=
ac_list, list) {
c945088384d00e Qiuxu Zhuo 2021-06-11  197  		d->pcu_cr3 =3D pci_get_dev_wra=
pper(d->seg, d->bus[1], 30, 3);
c945088384d00e Qiuxu Zhuo 2021-06-11  198  		if (!d->pcu_cr3)
c945088384d00e Qiuxu Zhuo 2021-06-11  199  			return -ENODEV;
c945088384d00e Qiuxu Zhuo 2021-06-11  200  =

c945088384d00e Qiuxu Zhuo 2021-06-11  201  		if (!i10nm_check_hbm_imc(d)) {
c945088384d00e Qiuxu Zhuo 2021-06-11  202  			i10nm_printk(KERN_DEBUG, "No =
hbm memory\n");
c945088384d00e Qiuxu Zhuo 2021-06-11  203  			return -ENODEV;
c945088384d00e Qiuxu Zhuo 2021-06-11  204  		}
c945088384d00e Qiuxu Zhuo 2021-06-11  205  =

c945088384d00e Qiuxu Zhuo 2021-06-11  206  		if (I10NM_GET_SCK_BAR(d, reg))=
 {
c945088384d00e Qiuxu Zhuo 2021-06-11  207  			i10nm_printk(KERN_ERR, "Faile=
d to get socket bar\n");
c945088384d00e Qiuxu Zhuo 2021-06-11  208  			return -ENODEV;
c945088384d00e Qiuxu Zhuo 2021-06-11  209  		}
c945088384d00e Qiuxu Zhuo 2021-06-11  210  		base =3D I10NM_GET_SCK_MMIO_BA=
SE(reg);
c945088384d00e Qiuxu Zhuo 2021-06-11  211  =

c945088384d00e Qiuxu Zhuo 2021-06-11  212  		if (I10NM_GET_HBM_IMC_BAR(d, r=
eg)) {
c945088384d00e Qiuxu Zhuo 2021-06-11  213  			i10nm_printk(KERN_ERR, "Faile=
d to get hbm mc bar\n");
c945088384d00e Qiuxu Zhuo 2021-06-11  214  			return -ENODEV;
c945088384d00e Qiuxu Zhuo 2021-06-11  215  		}
c945088384d00e Qiuxu Zhuo 2021-06-11  216  		base +=3D I10NM_GET_HBM_IMC_MM=
IO_OFFSET(reg);
c945088384d00e Qiuxu Zhuo 2021-06-11  217  =

c945088384d00e Qiuxu Zhuo 2021-06-11  218  		lmc =3D I10NM_NUM_DDR_IMC;
c945088384d00e Qiuxu Zhuo 2021-06-11  219  =

c945088384d00e Qiuxu Zhuo 2021-06-11  220  		for (i =3D 0; i < I10NM_NUM_HB=
M_IMC; i++) {
c945088384d00e Qiuxu Zhuo 2021-06-11  221  			mdev =3D pci_get_dev_wrapper(=
d->seg, d->bus[0],
c945088384d00e Qiuxu Zhuo 2021-06-11  222  						   12 + i / 4, 1 + i % 4);
c945088384d00e Qiuxu Zhuo 2021-06-11  223  			if (i =3D=3D 0 && !mdev) {
c945088384d00e Qiuxu Zhuo 2021-06-11  224  				i10nm_printk(KERN_ERR, "No h=
bm mc found\n");
c945088384d00e Qiuxu Zhuo 2021-06-11  225  				return -ENODEV;
c945088384d00e Qiuxu Zhuo 2021-06-11  226  			}
c945088384d00e Qiuxu Zhuo 2021-06-11  227  			if (!mdev)
c945088384d00e Qiuxu Zhuo 2021-06-11  228  				continue;
c945088384d00e Qiuxu Zhuo 2021-06-11  229  =

c945088384d00e Qiuxu Zhuo 2021-06-11  230  			d->imc[lmc].mdev =3D mdev;
c945088384d00e Qiuxu Zhuo 2021-06-11  231  			off =3D i * I10NM_HBM_IMC_MMI=
O_SIZE;
c945088384d00e Qiuxu Zhuo 2021-06-11  232  =

c945088384d00e Qiuxu Zhuo 2021-06-11  233  			edac_dbg(2, "hbm mc%d mmio ba=
se 0x%llx size 0x%x\n",
c945088384d00e Qiuxu Zhuo 2021-06-11  234  				 lmc, base + off, I10NM_HBM_=
IMC_MMIO_SIZE);
c945088384d00e Qiuxu Zhuo 2021-06-11  235  =

c945088384d00e Qiuxu Zhuo 2021-06-11  236  			mbase =3D ioremap(base + off,=
 I10NM_HBM_IMC_MMIO_SIZE);
c945088384d00e Qiuxu Zhuo 2021-06-11  237  			if (!mbase) {
c945088384d00e Qiuxu Zhuo 2021-06-11  238  				i10nm_printk(KERN_ERR, "Fail=
ed to ioremap for hbm mc 0x%llx\n",
c945088384d00e Qiuxu Zhuo 2021-06-11  239  					     base + off);
c945088384d00e Qiuxu Zhuo 2021-06-11  240  				return -ENOMEM;
c945088384d00e Qiuxu Zhuo 2021-06-11  241  			}
c945088384d00e Qiuxu Zhuo 2021-06-11  242  =

c945088384d00e Qiuxu Zhuo 2021-06-11  243  			d->imc[lmc].mbase =3D mbase;
c945088384d00e Qiuxu Zhuo 2021-06-11  244  			d->imc[lmc].hbm_mc =3D true;
c945088384d00e Qiuxu Zhuo 2021-06-11  245  =

c945088384d00e Qiuxu Zhuo 2021-06-11  246  			mcmtr =3D I10NM_GET_MCMTR(&d-=
>imc[lmc], 0);
c945088384d00e Qiuxu Zhuo 2021-06-11  247  			if (!I10NM_IS_HBM_IMC(mcmtr))=
 {
c945088384d00e Qiuxu Zhuo 2021-06-11  248  				i10nm_printk(KERN_ERR, "This=
 isn't an hbm mc!\n");
c945088384d00e Qiuxu Zhuo 2021-06-11  249  				return -ENODEV;
c945088384d00e Qiuxu Zhuo 2021-06-11  250  			}
c945088384d00e Qiuxu Zhuo 2021-06-11  251  =

c945088384d00e Qiuxu Zhuo 2021-06-11  252  			lmc++;
c945088384d00e Qiuxu Zhuo 2021-06-11  253  		}
c945088384d00e Qiuxu Zhuo 2021-06-11  254  	}
c945088384d00e Qiuxu Zhuo 2021-06-11  255  =

c945088384d00e Qiuxu Zhuo 2021-06-11 @256  	return 0;
c945088384d00e Qiuxu Zhuo 2021-06-11  257  }
c945088384d00e Qiuxu Zhuo 2021-06-11  258  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3480975416504391242==--

