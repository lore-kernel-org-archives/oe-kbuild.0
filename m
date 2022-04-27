Content-Type: multipart/mixed; boundary="===============2787458096766984434=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ammarfaizi2-block:clk/linux/clk-airoha 2/3] drivers/clk/clk-en7523.c:273:9: warning: Returning pointer to local variable 'init' that will be invalid when returning. [returnDanglingLifetime]
Date: Wed, 27 Apr 2022 08:52:09 +0800
Message-ID: <202204270843.tJOxSFpf-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2787458096766984434==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: "GNU/Weeb Mailing List" <gwml@vger.gnuweeb.org>
CC: linux-kernel(a)vger.kernel.org
TO: Felix Fietkau <nbd@nbd.name>
CC: Stephen Boyd <sboyd@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>

tree:   https://github.com/ammarfaizi2/linux-block clk/linux/clk-airoha
head:   c6b61d48b369f92edc71a0c5dd0a9b98ea0b5397
commit: 1e627317919066386d089aaca1aab77bc5200c02 [2/3] clk: en7523: Add clo=
ck driver for Airoha EN7523 SoC
:::::: branch date: 6 hours ago
:::::: commit date: 4 days ago
compiler: or1k-linux-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 1e627317919066386d089aaca1aab77bc5200c02
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/clk/clk-en7523.c:273:9: warning: Returning pointer to local vari=
able 'init' that will be invalid when returning. [returnDanglingLifetime]
    return &cg->hw;
           ^
   drivers/clk/clk-en7523.c:267:16: note: Address of variable taken here.
    cg->hw.init =3D &init;
                  ^
   drivers/clk/clk-en7523.c:270:21: note: Assuming condition is false
    if (clk_hw_register(dev, &cg->hw))
                       ^
   drivers/clk/clk-en7523.c:273:9: note: Address of variable taken here.
    return &cg->hw;
           ^
   drivers/clk/clk-en7523.c:256:23: note: Variable created here.
    struct clk_init_data init =3D {
                         ^
   drivers/clk/clk-en7523.c:273:9: note: Returning pointer to local variabl=
e 'init' that will be invalid when returning.
    return &cg->hw;
           ^

vim +/init +273 drivers/clk/clk-en7523.c

1e627317919066 Felix Fietkau 2022-03-14  247  =

1e627317919066 Felix Fietkau 2022-03-14  248  static struct clk_hw *en7523_=
register_pcie_clk(struct device *dev,
1e627317919066 Felix Fietkau 2022-03-14  249  					       void __iomem *np_=
base)
1e627317919066 Felix Fietkau 2022-03-14  250  {
1e627317919066 Felix Fietkau 2022-03-14  251  	static const struct clk_ops =
pcie_gate_ops =3D {
1e627317919066 Felix Fietkau 2022-03-14  252  		.is_enabled =3D en7523_pci_=
is_enabled,
1e627317919066 Felix Fietkau 2022-03-14  253  		.prepare =3D en7523_pci_pre=
pare,
1e627317919066 Felix Fietkau 2022-03-14  254  		.unprepare =3D en7523_pci_u=
nprepare,
1e627317919066 Felix Fietkau 2022-03-14  255  	};
1e627317919066 Felix Fietkau 2022-03-14  256  	struct clk_init_data init =
=3D {
1e627317919066 Felix Fietkau 2022-03-14  257  		.name =3D "pcie",
1e627317919066 Felix Fietkau 2022-03-14  258  		.ops =3D &pcie_gate_ops,
1e627317919066 Felix Fietkau 2022-03-14  259  	};
1e627317919066 Felix Fietkau 2022-03-14  260  	struct en_clk_gate *cg;
1e627317919066 Felix Fietkau 2022-03-14  261  =

1e627317919066 Felix Fietkau 2022-03-14  262  	cg =3D devm_kzalloc(dev, siz=
eof(*cg), GFP_KERNEL);
1e627317919066 Felix Fietkau 2022-03-14  263  	if (!cg)
1e627317919066 Felix Fietkau 2022-03-14  264  		return NULL;
1e627317919066 Felix Fietkau 2022-03-14  265  =

1e627317919066 Felix Fietkau 2022-03-14  266  	cg->base =3D np_base;
1e627317919066 Felix Fietkau 2022-03-14  267  	cg->hw.init =3D &init;
1e627317919066 Felix Fietkau 2022-03-14  268  	en7523_pci_unprepare(&cg->hw=
);
1e627317919066 Felix Fietkau 2022-03-14  269  =

1e627317919066 Felix Fietkau 2022-03-14  270  	if (clk_hw_register(dev, &cg=
->hw))
1e627317919066 Felix Fietkau 2022-03-14  271  		return NULL;
1e627317919066 Felix Fietkau 2022-03-14  272  =

1e627317919066 Felix Fietkau 2022-03-14 @273  	return &cg->hw;
1e627317919066 Felix Fietkau 2022-03-14  274  }
1e627317919066 Felix Fietkau 2022-03-14  275  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2787458096766984434==--

