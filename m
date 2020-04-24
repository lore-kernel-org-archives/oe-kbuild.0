Content-Type: multipart/mixed; boundary="===============6314171067670319490=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: [lkundrak-linux-mmp:lr/mmp3-hsic-phy 3/3] drivers/phy/marvell/phy-mmp3-hsic.c:61:31: sparse: sparse: cast removes address space '<asn:2>' of expression
Date: Sat, 25 Apr 2020 01:20:02 +0800
Message-ID: <202004250152.yNH0qTUs%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6314171067670319490==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Lubomir Rintel <lkundrak@v3.sk>

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/lkundrak/linux-mmp.gi=
t lr/mmp3-hsic-phy
head:   2e517a94639d84fdd929005f5bbc688722670b3e
commit: 2e517a94639d84fdd929005f5bbc688722670b3e [3/3] phy: Add USB HSIC PH=
Y driver for Marvell MMP3 SoC
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-191-gc51a0382-dirty
        git checkout 2e517a94639d84fdd929005f5bbc688722670b3e
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/phy/marvell/phy-mmp3-hsic.c:61:31: sparse: sparse: cast removes =
address space '<asn:2>' of expression

# https://git.kernel.org/pub/scm/linux/kernel/git/lkundrak/linux-mmp.git/co=
mmit/?id=3D2e517a94639d84fdd929005f5bbc688722670b3e
git remote add lkundrak-linux-mmp git://git.kernel.org/pub/scm/linux/kernel=
/git/lkundrak/linux-mmp.git
git remote update lkundrak-linux-mmp
git checkout 2e517a94639d84fdd929005f5bbc688722670b3e
vim +61 drivers/phy/marvell/phy-mmp3-hsic.c

2e517a94639d84 Lubomir Rintel 2020-03-08  39  =

2e517a94639d84 Lubomir Rintel 2020-03-08  40  static int mmp3_hsic_phy_prob=
e(struct platform_device *pdev)
2e517a94639d84 Lubomir Rintel 2020-03-08  41  {
2e517a94639d84 Lubomir Rintel 2020-03-08  42  	struct device *dev =3D &pdev=
->dev;
2e517a94639d84 Lubomir Rintel 2020-03-08  43  	struct phy_provider *provide=
r;
2e517a94639d84 Lubomir Rintel 2020-03-08  44  	struct resource *resource;
2e517a94639d84 Lubomir Rintel 2020-03-08  45  	void __iomem *base;
2e517a94639d84 Lubomir Rintel 2020-03-08  46  	struct phy *phy;
2e517a94639d84 Lubomir Rintel 2020-03-08  47  =

2e517a94639d84 Lubomir Rintel 2020-03-08  48  	resource =3D platform_get_re=
source(pdev, IORESOURCE_MEM, 0);
2e517a94639d84 Lubomir Rintel 2020-03-08  49  	base =3D devm_ioremap_resour=
ce(dev, resource);
2e517a94639d84 Lubomir Rintel 2020-03-08  50  	if (IS_ERR(base)) {
2e517a94639d84 Lubomir Rintel 2020-03-08  51  		dev_err(dev, "failed to rem=
ap PHY regs\n");
2e517a94639d84 Lubomir Rintel 2020-03-08  52  		return PTR_ERR(base);
2e517a94639d84 Lubomir Rintel 2020-03-08  53  	}
2e517a94639d84 Lubomir Rintel 2020-03-08  54  =

2e517a94639d84 Lubomir Rintel 2020-03-08  55  	phy =3D devm_phy_create(dev,=
 NULL, &mmp3_hsic_phy_ops);
2e517a94639d84 Lubomir Rintel 2020-03-08  56  	if (IS_ERR(phy)) {
2e517a94639d84 Lubomir Rintel 2020-03-08  57  		dev_err(dev, "failed to cre=
ate PHY\n");
2e517a94639d84 Lubomir Rintel 2020-03-08  58  		return PTR_ERR(phy);
2e517a94639d84 Lubomir Rintel 2020-03-08  59  	}
2e517a94639d84 Lubomir Rintel 2020-03-08  60  =

2e517a94639d84 Lubomir Rintel 2020-03-08 @61  	phy_set_drvdata(phy, (void *=
)base);
2e517a94639d84 Lubomir Rintel 2020-03-08  62  	provider =3D devm_of_phy_pro=
vider_register(dev, of_phy_simple_xlate);
2e517a94639d84 Lubomir Rintel 2020-03-08  63  	if (IS_ERR(provider)) {
2e517a94639d84 Lubomir Rintel 2020-03-08  64  		dev_err(dev, "failed to reg=
ister PHY provider\n");
2e517a94639d84 Lubomir Rintel 2020-03-08  65  		return PTR_ERR(provider);
2e517a94639d84 Lubomir Rintel 2020-03-08  66  	}
2e517a94639d84 Lubomir Rintel 2020-03-08  67  =

2e517a94639d84 Lubomir Rintel 2020-03-08  68  	return 0;
2e517a94639d84 Lubomir Rintel 2020-03-08  69  }
2e517a94639d84 Lubomir Rintel 2020-03-08  70  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6314171067670319490==--

