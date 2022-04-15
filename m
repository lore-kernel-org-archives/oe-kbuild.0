Content-Type: multipart/mixed; boundary="===============2606814335132593699=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v18 03/10] soc: mediatek: add mtk-mmsys support for mt8195 vdosys0
Date: Fri, 15 Apr 2022 09:03:39 +0800
Message-ID: <202204150813.3IMboJyc-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2606814335132593699==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220412103114.19922-4-jason-jh.lin@mediatek.com>
References: <20220412103114.19922-4-jason-jh.lin@mediatek.com>
TO: "jason-jh.lin" <jason-jh.lin@mediatek.com>
TO: Rob Herring <robh+dt@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Matthias Brugger <matthias.bgg@gmail.com>
TO: "Chun-Kuang Hu" <chunkuang.hu@kernel.org>
TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: fshao(a)chromium.org
CC: David Airlie <airlied@linux.ie>
CC: singo.chang(a)mediatek.com
CC: dri-devel(a)lists.freedesktop.org
CC: Fabien Parent <fparent@baylibre.com>
CC: linux-stm32(a)st-md-mailman.stormreply.com
CC: roy-cw.yeh(a)mediatek.com
CC: Project_Global_Chrome_Upstream_Group(a)mediatek.com
CC: Yongqiang Niu <yongqiang.niu@mediatek.com>
CC: "Rex-BC Chen" <rex-bc.chen@mediatek.com>
CC: devicetree(a)vger.kernel.org
CC: nancy.lin(a)mediatek.com
CC: linux-mediatek(a)lists.infradead.org
CC: hsinyi(a)chromium.org
CC: linux-arm-kernel(a)lists.infradead.org
CC: "jason-jh . lin" <jason-jh.lin@mediatek.com>
CC: linux-kernel(a)vger.kernel.org
CC: moudy.ho(a)mediatek.com
CC: Maxime Coquelin <mcoquelin.stm32@gmail.com>

Hi "jason-jh.lin",

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm/drm-next]
[also build test WARNING on robh/for-next krzk/for-next linus/master v5.18-=
rc2 next-20220414]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/jason-jh-lin/Add-Med=
iatek-Soc-DRM-vdosys0-support-for-mt8195/20220412-183359
base:   git://anongit.freedesktop.org/drm/drm drm-next
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arc-randconfig-m031-20220411 (https://download.01.org/0day-ci/archi=
ve/20220415/202204150813.3IMboJyc-lkp(a)intel.com/config)
compiler: arc-elf-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/soc/mediatek/mtk-mmsys.c:315 mtk_mmsys_probe() warn: passing zero t=
o 'PTR_ERR'

vim +/PTR_ERR +315 drivers/soc/mediatek/mtk-mmsys.c

f27ef2856343e2 Enric Balletbo i Serra 2021-09-30  280  =

13032709e23285 Matthias Brugger       2020-03-25  281  static int mtk_mmsys=
_probe(struct platform_device *pdev)
13032709e23285 Matthias Brugger       2020-03-25  282  {
2c758e301ed95a Enric Balletbo i Serra 2020-03-25  283  	struct device *dev =
=3D &pdev->dev;
13032709e23285 Matthias Brugger       2020-03-25  284  	struct platform_dev=
ice *clks;
667c769246b01c Enric Balletbo i Serra 2020-03-25  285  	struct platform_dev=
ice *drm;
8cfc54a36d3e79 jason-jh.lin           2022-04-12  286  	const struct mtk_mm=
sys_match_data *match_data;
ce15e7faa2fc54 CK Hu                  2021-03-17  287  	struct mtk_mmsys *m=
msys;
8cfc54a36d3e79 jason-jh.lin           2022-04-12  288  	struct resource *re=
s;
2c758e301ed95a Enric Balletbo i Serra 2020-03-25  289  	int ret;
2c758e301ed95a Enric Balletbo i Serra 2020-03-25  290  =

ce15e7faa2fc54 CK Hu                  2021-03-17  291  	mmsys =3D devm_kzal=
loc(dev, sizeof(*mmsys), GFP_KERNEL);
ce15e7faa2fc54 CK Hu                  2021-03-17  292  	if (!mmsys)
ce15e7faa2fc54 CK Hu                  2021-03-17  293  		return -ENOMEM;
ce15e7faa2fc54 CK Hu                  2021-03-17  294  =

ce15e7faa2fc54 CK Hu                  2021-03-17  295  	mmsys->regs =3D dev=
m_platform_ioremap_resource(pdev, 0);
ce15e7faa2fc54 CK Hu                  2021-03-17  296  	if (IS_ERR(mmsys->r=
egs)) {
ce15e7faa2fc54 CK Hu                  2021-03-17  297  		ret =3D PTR_ERR(mm=
sys->regs);
cc6576029aedc7 Enric Balletbo i Serra 2020-10-06  298  		dev_err(dev, "Fail=
ed to ioremap mmsys registers: %d\n", ret);
2c758e301ed95a Enric Balletbo i Serra 2020-03-25  299  		return ret;
2c758e301ed95a Enric Balletbo i Serra 2020-03-25  300  	}
2c758e301ed95a Enric Balletbo i Serra 2020-03-25  301  =

f27ef2856343e2 Enric Balletbo i Serra 2021-09-30  302  	spin_lock_init(&mms=
ys->lock);
f27ef2856343e2 Enric Balletbo i Serra 2021-09-30  303  =

f27ef2856343e2 Enric Balletbo i Serra 2021-09-30  304  	mmsys->rcdev.owner =
=3D THIS_MODULE;
f27ef2856343e2 Enric Balletbo i Serra 2021-09-30  305  	mmsys->rcdev.nr_res=
ets =3D 32;
f27ef2856343e2 Enric Balletbo i Serra 2021-09-30  306  	mmsys->rcdev.ops =
=3D &mtk_mmsys_reset_ops;
f27ef2856343e2 Enric Balletbo i Serra 2021-09-30  307  	mmsys->rcdev.of_nod=
e =3D pdev->dev.of_node;
f27ef2856343e2 Enric Balletbo i Serra 2021-09-30  308  	ret =3D devm_reset_=
controller_register(&pdev->dev, &mmsys->rcdev);
f27ef2856343e2 Enric Balletbo i Serra 2021-09-30  309  	if (ret) {
f27ef2856343e2 Enric Balletbo i Serra 2021-09-30  310  		dev_err(&pdev->dev=
, "Couldn't register mmsys reset controller: %d\n", ret);
f27ef2856343e2 Enric Balletbo i Serra 2021-09-30  311  		return ret;
f27ef2856343e2 Enric Balletbo i Serra 2021-09-30  312  	}
f27ef2856343e2 Enric Balletbo i Serra 2021-09-30  313  =

8cfc54a36d3e79 jason-jh.lin           2022-04-12  314  	res =3D platform_ge=
t_resource(pdev, IORESOURCE_MEM, 0);
8cfc54a36d3e79 jason-jh.lin           2022-04-12 @315  	if (PTR_ERR(res)) {
8cfc54a36d3e79 jason-jh.lin           2022-04-12  316  		dev_err(dev, "Coul=
dn't get mmsys resource\n");
8cfc54a36d3e79 jason-jh.lin           2022-04-12  317  		return -EINVAL;
8cfc54a36d3e79 jason-jh.lin           2022-04-12  318  	}
8cfc54a36d3e79 jason-jh.lin           2022-04-12  319  	mmsys->io_start =3D=
 res->start;
8cfc54a36d3e79 jason-jh.lin           2022-04-12  320  =

8cfc54a36d3e79 jason-jh.lin           2022-04-12  321  	match_data =3D of_d=
evice_get_match_data(dev);
8cfc54a36d3e79 jason-jh.lin           2022-04-12  322  	if (match_data->num=
_drv_data > 1) {
8cfc54a36d3e79 jason-jh.lin           2022-04-12  323  		/* This SoC has mu=
ltiple mmsys channels */
8cfc54a36d3e79 jason-jh.lin           2022-04-12  324  		ret =3D mtk_mmsys_=
find_match_drvdata(mmsys, match_data);
8cfc54a36d3e79 jason-jh.lin           2022-04-12  325  		if (ret < 0) {
8cfc54a36d3e79 jason-jh.lin           2022-04-12  326  			dev_err(dev, "Cou=
ldn't get match driver data\n");
8cfc54a36d3e79 jason-jh.lin           2022-04-12  327  			return ret;
8cfc54a36d3e79 jason-jh.lin           2022-04-12  328  		}
8cfc54a36d3e79 jason-jh.lin           2022-04-12  329  		mmsys->data =3D ma=
tch_data->drv_data[ret];
8cfc54a36d3e79 jason-jh.lin           2022-04-12  330  	} else {
8cfc54a36d3e79 jason-jh.lin           2022-04-12  331  		dev_dbg(dev, "Usin=
g single mmsys channel\n");
8cfc54a36d3e79 jason-jh.lin           2022-04-12  332  		mmsys->data =3D ma=
tch_data->drv_data[0];
8cfc54a36d3e79 jason-jh.lin           2022-04-12  333  	}
8cfc54a36d3e79 jason-jh.lin           2022-04-12  334  =

ce15e7faa2fc54 CK Hu                  2021-03-17  335  	platform_set_drvdat=
a(pdev, mmsys);
13032709e23285 Matthias Brugger       2020-03-25  336  =

ce15e7faa2fc54 CK Hu                  2021-03-17  337  	clks =3D platform_d=
evice_register_data(&pdev->dev, mmsys->data->clk_driver,
13032709e23285 Matthias Brugger       2020-03-25  338  					     PLATFORM_D=
EVID_AUTO, NULL, 0);
13032709e23285 Matthias Brugger       2020-03-25  339  	if (IS_ERR(clks))
13032709e23285 Matthias Brugger       2020-03-25  340  		return PTR_ERR(clk=
s);
13032709e23285 Matthias Brugger       2020-03-25  341  =

667c769246b01c Enric Balletbo i Serra 2020-03-25  342  	drm =3D platform_de=
vice_register_data(&pdev->dev, "mediatek-drm",
667c769246b01c Enric Balletbo i Serra 2020-03-25  343  					    PLATFORM_DE=
VID_AUTO, NULL, 0);
ff34e17cf9bce8 Wei Yongjun            2020-05-06  344  	if (IS_ERR(drm)) {
ff34e17cf9bce8 Wei Yongjun            2020-05-06  345  		platform_device_un=
register(clks);
667c769246b01c Enric Balletbo i Serra 2020-03-25  346  		return PTR_ERR(drm=
);
ff34e17cf9bce8 Wei Yongjun            2020-05-06  347  	}
667c769246b01c Enric Balletbo i Serra 2020-03-25  348  =

13032709e23285 Matthias Brugger       2020-03-25  349  	return 0;
13032709e23285 Matthias Brugger       2020-03-25  350  }
13032709e23285 Matthias Brugger       2020-03-25  351  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2606814335132593699==--

