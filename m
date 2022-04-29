Content-Type: multipart/mixed; boundary="===============1537817090213649358=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 1683/7959] drivers/net/ethernet/mediatek/mtk_wed.c:813:2-8: ERROR: missing put_device; call of_find_device_by_node on line 806, but without a corresponding object release within this function.
Date: Fri, 29 Apr 2022 22:38:12 +0800
Message-ID: <202204292241.RP7yyzWn-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1537817090213649358==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Felix Fietkau <nbd@nbd.name>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   5469f0c06732a077c70a759a81f2a1f00b277694
commit: 804775dfc2885e93a0a4b35db1914c2cc25172b5 [1683/7959] net: ethernet:=
 mtk_eth_soc: add support for Wireless Ethernet Dispatch (WED)
:::::: branch date: 7 hours ago
:::::: commit date: 3 weeks ago
config: arm64-randconfig-c004-20220428 (https://download.01.org/0day-ci/arc=
hive/20220429/202204292241.RP7yyzWn-lkp(a)intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/mediatek/mtk_wed.c:813:2-8: ERROR: missing put_devi=
ce; call of_find_device_by_node on line 806, but without a corresponding ob=
ject release within this function.
   drivers/net/ethernet/mediatek/mtk_wed.c:817:2-8: ERROR: missing put_devi=
ce; call of_find_device_by_node on line 806, but without a corresponding ob=
ject release within this function.
   drivers/net/ethernet/mediatek/mtk_wed.c:853:0-1: ERROR: missing put_devi=
ce; call of_find_device_by_node on line 806, but without a corresponding ob=
ject release within this function.

vim +813 drivers/net/ethernet/mediatek/mtk_wed.c

804775dfc2885e9 Felix Fietkau 2022-04-05  780  =

804775dfc2885e9 Felix Fietkau 2022-04-05  781  void mtk_wed_add_hw(struct d=
evice_node *np, struct mtk_eth *eth,
804775dfc2885e9 Felix Fietkau 2022-04-05  782  		    void __iomem *wdma, in=
t index)
804775dfc2885e9 Felix Fietkau 2022-04-05  783  {
804775dfc2885e9 Felix Fietkau 2022-04-05  784  	static const struct mtk_wed=
_ops wed_ops =3D {
804775dfc2885e9 Felix Fietkau 2022-04-05  785  		.attach =3D mtk_wed_attach,
804775dfc2885e9 Felix Fietkau 2022-04-05  786  		.tx_ring_setup =3D mtk_wed=
_tx_ring_setup,
804775dfc2885e9 Felix Fietkau 2022-04-05  787  		.txfree_ring_setup =3D mtk=
_wed_txfree_ring_setup,
804775dfc2885e9 Felix Fietkau 2022-04-05  788  		.start =3D mtk_wed_start,
804775dfc2885e9 Felix Fietkau 2022-04-05  789  		.stop =3D mtk_wed_stop,
804775dfc2885e9 Felix Fietkau 2022-04-05  790  		.reset_dma =3D mtk_wed_res=
et_dma,
804775dfc2885e9 Felix Fietkau 2022-04-05  791  		.reg_read =3D wed_r32,
804775dfc2885e9 Felix Fietkau 2022-04-05  792  		.reg_write =3D wed_w32,
804775dfc2885e9 Felix Fietkau 2022-04-05  793  		.irq_get =3D mtk_wed_irq_g=
et,
804775dfc2885e9 Felix Fietkau 2022-04-05  794  		.irq_set_mask =3D mtk_wed_=
irq_set_mask,
804775dfc2885e9 Felix Fietkau 2022-04-05  795  		.detach =3D mtk_wed_detach,
804775dfc2885e9 Felix Fietkau 2022-04-05  796  	};
804775dfc2885e9 Felix Fietkau 2022-04-05  797  	struct device_node *eth_np =
=3D eth->dev->of_node;
804775dfc2885e9 Felix Fietkau 2022-04-05  798  	struct platform_device *pde=
v;
804775dfc2885e9 Felix Fietkau 2022-04-05  799  	struct mtk_wed_hw *hw;
804775dfc2885e9 Felix Fietkau 2022-04-05  800  	struct regmap *regs;
804775dfc2885e9 Felix Fietkau 2022-04-05  801  	int irq;
804775dfc2885e9 Felix Fietkau 2022-04-05  802  =

804775dfc2885e9 Felix Fietkau 2022-04-05  803  	if (!np)
804775dfc2885e9 Felix Fietkau 2022-04-05  804  		return;
804775dfc2885e9 Felix Fietkau 2022-04-05  805  =

804775dfc2885e9 Felix Fietkau 2022-04-05 @806  	pdev =3D of_find_device_by_=
node(np);
804775dfc2885e9 Felix Fietkau 2022-04-05  807  	if (!pdev)
804775dfc2885e9 Felix Fietkau 2022-04-05  808  		return;
804775dfc2885e9 Felix Fietkau 2022-04-05  809  =

804775dfc2885e9 Felix Fietkau 2022-04-05  810  	get_device(&pdev->dev);
804775dfc2885e9 Felix Fietkau 2022-04-05  811  	irq =3D platform_get_irq(pd=
ev, 0);
804775dfc2885e9 Felix Fietkau 2022-04-05  812  	if (irq < 0)
804775dfc2885e9 Felix Fietkau 2022-04-05 @813  		return;
804775dfc2885e9 Felix Fietkau 2022-04-05  814  =

804775dfc2885e9 Felix Fietkau 2022-04-05  815  	regs =3D syscon_regmap_look=
up_by_phandle(np, NULL);
804775dfc2885e9 Felix Fietkau 2022-04-05  816  	if (!regs)
804775dfc2885e9 Felix Fietkau 2022-04-05  817  		return;
804775dfc2885e9 Felix Fietkau 2022-04-05  818  =

804775dfc2885e9 Felix Fietkau 2022-04-05  819  	rcu_assign_pointer(mtk_soc_=
wed_ops, &wed_ops);
804775dfc2885e9 Felix Fietkau 2022-04-05  820  =

804775dfc2885e9 Felix Fietkau 2022-04-05  821  	mutex_lock(&hw_lock);
804775dfc2885e9 Felix Fietkau 2022-04-05  822  =

804775dfc2885e9 Felix Fietkau 2022-04-05  823  	if (WARN_ON(hw_list[index]))
804775dfc2885e9 Felix Fietkau 2022-04-05  824  		goto unlock;
804775dfc2885e9 Felix Fietkau 2022-04-05  825  =

804775dfc2885e9 Felix Fietkau 2022-04-05  826  	hw =3D kzalloc(sizeof(*hw),=
 GFP_KERNEL);
804775dfc2885e9 Felix Fietkau 2022-04-05  827  	hw->node =3D np;
804775dfc2885e9 Felix Fietkau 2022-04-05  828  	hw->regs =3D regs;
804775dfc2885e9 Felix Fietkau 2022-04-05  829  	hw->eth =3D eth;
804775dfc2885e9 Felix Fietkau 2022-04-05  830  	hw->dev =3D &pdev->dev;
804775dfc2885e9 Felix Fietkau 2022-04-05  831  	hw->wdma =3D wdma;
804775dfc2885e9 Felix Fietkau 2022-04-05  832  	hw->index =3D index;
804775dfc2885e9 Felix Fietkau 2022-04-05  833  	hw->irq =3D irq;
804775dfc2885e9 Felix Fietkau 2022-04-05  834  	hw->mirror =3D syscon_regma=
p_lookup_by_phandle(eth_np,
804775dfc2885e9 Felix Fietkau 2022-04-05  835  						     "mediatek,pcie-mi=
rror");
804775dfc2885e9 Felix Fietkau 2022-04-05  836  	hw->hifsys =3D syscon_regma=
p_lookup_by_phandle(eth_np,
804775dfc2885e9 Felix Fietkau 2022-04-05  837  						     "mediatek,hifsys"=
);
804775dfc2885e9 Felix Fietkau 2022-04-05  838  	if (IS_ERR(hw->mirror) || I=
S_ERR(hw->hifsys)) {
804775dfc2885e9 Felix Fietkau 2022-04-05  839  		kfree(hw);
804775dfc2885e9 Felix Fietkau 2022-04-05  840  		goto unlock;
804775dfc2885e9 Felix Fietkau 2022-04-05  841  	}
804775dfc2885e9 Felix Fietkau 2022-04-05  842  =

804775dfc2885e9 Felix Fietkau 2022-04-05  843  	if (!index) {
804775dfc2885e9 Felix Fietkau 2022-04-05  844  		regmap_write(hw->mirror, 0=
, 0);
804775dfc2885e9 Felix Fietkau 2022-04-05  845  		regmap_write(hw->mirror, 4=
, 0);
804775dfc2885e9 Felix Fietkau 2022-04-05  846  	}
804775dfc2885e9 Felix Fietkau 2022-04-05  847  	mtk_wed_hw_add_debugfs(hw);
804775dfc2885e9 Felix Fietkau 2022-04-05  848  =

804775dfc2885e9 Felix Fietkau 2022-04-05  849  	hw_list[index] =3D hw;
804775dfc2885e9 Felix Fietkau 2022-04-05  850  =

804775dfc2885e9 Felix Fietkau 2022-04-05  851  unlock:
804775dfc2885e9 Felix Fietkau 2022-04-05  852  	mutex_unlock(&hw_lock);
804775dfc2885e9 Felix Fietkau 2022-04-05  853  }
804775dfc2885e9 Felix Fietkau 2022-04-05  854  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1537817090213649358==--

