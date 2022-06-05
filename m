Content-Type: multipart/mixed; boundary="===============4199694568360498278=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] ASoC: fsl: Check before clk_put() not needed
Date: Mon, 06 Jun 2022 04:42:42 +0800
Message-ID: <202206060418.gpNmd3hv-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4199694568360498278==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220601131429.9794-1-hanyihao@vivo.com>
References: <20220601131429.9794-1-hanyihao@vivo.com>
TO: Yihao Han <hanyihao@vivo.com>
TO: Shengjiu Wang <shengjiu.wang@gmail.com>
TO: Xiubo Li <Xiubo.Lee@gmail.com>
TO: Fabio Estevam <festevam@gmail.com>
TO: Nicolin Chen <nicoleotsuka@gmail.com>
TO: Liam Girdwood <lgirdwood@gmail.com>
TO: Mark Brown <broonie@kernel.org>
TO: Jaroslav Kysela <perex@perex.cz>
TO: Takashi Iwai <tiwai@suse.com>
TO: Shawn Guo <shawnguo@kernel.org>
TO: Sascha Hauer <s.hauer@pengutronix.de>
TO: Pengutronix Kernel Team <kernel@pengutronix.de>
TO: NXP Linux Team <linux-imx@nxp.com>
TO: alsa-devel(a)alsa-project.org
TO: linuxppc-dev(a)lists.ozlabs.org
TO: linux-arm-kernel(a)lists.infradead.org
TO: linux-kernel(a)vger.kernel.org
CC: Yihao Han <hanyihao@vivo.com>

Hi Yihao,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on next-20220601]
[also build test WARNING on v5.18]
[cannot apply to shawnguo/for-next v5.18 v5.18-rc7 v5.18-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Yihao-Han/ASoC-fsl-C=
heck-before-clk_put-not-needed/20220601-211623
base:    5d8e7e3bbaaf115a935accd269873469928848c0
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: sparc-randconfig-c004-20220605 (https://download.01.org/0day-ci/arc=
hive/20220606/202206060418.gpNmd3hv-lkp(a)intel.com/config)
compiler: sparc64-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> sound/soc/fsl/imx-sgtl5000.c:188:15-24: ERROR: data is NULL but derefere=
nced.

vim +188 sound/soc/fsl/imx-sgtl5000.c

172b4c5c8afdb7 Shawn Guo         2012-03-30   50  =

a0a3d518c33853 Bill Pemberton    2012-12-07   51  static int imx_sgtl5000_p=
robe(struct platform_device *pdev)
c448303e86c970 Shawn Guo         2012-03-16   52  {
c448303e86c970 Shawn Guo         2012-03-16   53  	struct device_node *np =
=3D pdev->dev.of_node;
c448303e86c970 Shawn Guo         2012-03-16   54  	struct device_node *ssi_=
np, *codec_np;
c448303e86c970 Shawn Guo         2012-03-16   55  	struct platform_device *=
ssi_pdev;
81e8e4926167ab Richard Zhao      2012-04-27   56  	struct i2c_client *codec=
_dev;
50d4a790e65f5a Philipp Zabel     2013-09-25   57  	struct imx_sgtl5000_data=
 *data =3D NULL;
3026ef68d2c508 Kuninori Morimoto 2019-06-06   58  	struct snd_soc_dai_link_=
component *comp;
c448303e86c970 Shawn Guo         2012-03-16   59  	int int_port, ext_port;
c448303e86c970 Shawn Guo         2012-03-16   60  	int ret;
c448303e86c970 Shawn Guo         2012-03-16   61  =

c448303e86c970 Shawn Guo         2012-03-16   62  	ret =3D of_property_read=
_u32(np, "mux-int-port", &int_port);
c448303e86c970 Shawn Guo         2012-03-16   63  	if (ret) {
c448303e86c970 Shawn Guo         2012-03-16   64  		dev_err(&pdev->dev, "mu=
x-int-port missing or invalid\n");
c448303e86c970 Shawn Guo         2012-03-16   65  		return ret;
c448303e86c970 Shawn Guo         2012-03-16   66  	}
c448303e86c970 Shawn Guo         2012-03-16   67  	ret =3D of_property_read=
_u32(np, "mux-ext-port", &ext_port);
c448303e86c970 Shawn Guo         2012-03-16   68  	if (ret) {
c448303e86c970 Shawn Guo         2012-03-16   69  		dev_err(&pdev->dev, "mu=
x-ext-port missing or invalid\n");
c448303e86c970 Shawn Guo         2012-03-16   70  		return ret;
c448303e86c970 Shawn Guo         2012-03-16   71  	}
c448303e86c970 Shawn Guo         2012-03-16   72  =

c448303e86c970 Shawn Guo         2012-03-16   73  	/*
c448303e86c970 Shawn Guo         2012-03-16   74  	 * The port numbering in=
 the hardware manual starts at 1, while
c448303e86c970 Shawn Guo         2012-03-16   75  	 * the audmux API expect=
s it starts at 0.
c448303e86c970 Shawn Guo         2012-03-16   76  	 */
c448303e86c970 Shawn Guo         2012-03-16   77  	int_port--;
c448303e86c970 Shawn Guo         2012-03-16   78  	ext_port--;
c448303e86c970 Shawn Guo         2012-03-16   79  	ret =3D imx_audmux_v2_co=
nfigure_port(int_port,
c448303e86c970 Shawn Guo         2012-03-16   80  			IMX_AUDMUX_V2_PTCR_SYN=
 |
c448303e86c970 Shawn Guo         2012-03-16   81  			IMX_AUDMUX_V2_PTCR_TFS=
EL(ext_port) |
c448303e86c970 Shawn Guo         2012-03-16   82  			IMX_AUDMUX_V2_PTCR_TCS=
EL(ext_port) |
c448303e86c970 Shawn Guo         2012-03-16   83  			IMX_AUDMUX_V2_PTCR_TFS=
DIR |
c448303e86c970 Shawn Guo         2012-03-16   84  			IMX_AUDMUX_V2_PTCR_TCL=
KDIR,
c448303e86c970 Shawn Guo         2012-03-16   85  			IMX_AUDMUX_V2_PDCR_RXD=
SEL(ext_port));
c448303e86c970 Shawn Guo         2012-03-16   86  	if (ret) {
c448303e86c970 Shawn Guo         2012-03-16   87  		dev_err(&pdev->dev, "au=
dmux internal port setup failed\n");
c448303e86c970 Shawn Guo         2012-03-16   88  		return ret;
c448303e86c970 Shawn Guo         2012-03-16   89  	}
db8b624d55e65a Julia Lawall      2012-08-19   90  	ret =3D imx_audmux_v2_co=
nfigure_port(ext_port,
ef3207c503519b Hui Wang          2012-07-04   91  			IMX_AUDMUX_V2_PTCR_SYN,
c448303e86c970 Shawn Guo         2012-03-16   92  			IMX_AUDMUX_V2_PDCR_RXD=
SEL(int_port));
c448303e86c970 Shawn Guo         2012-03-16   93  	if (ret) {
c448303e86c970 Shawn Guo         2012-03-16   94  		dev_err(&pdev->dev, "au=
dmux external port setup failed\n");
c448303e86c970 Shawn Guo         2012-03-16   95  		return ret;
c448303e86c970 Shawn Guo         2012-03-16   96  	}
c448303e86c970 Shawn Guo         2012-03-16   97  =

c448303e86c970 Shawn Guo         2012-03-16   98  	ssi_np =3D of_parse_phan=
dle(pdev->dev.of_node, "ssi-controller", 0);
c448303e86c970 Shawn Guo         2012-03-16   99  	codec_np =3D of_parse_ph=
andle(pdev->dev.of_node, "audio-codec", 0);
c448303e86c970 Shawn Guo         2012-03-16  100  	if (!ssi_np || !codec_np=
) {
c448303e86c970 Shawn Guo         2012-03-16  101  		dev_err(&pdev->dev, "ph=
andle missing or invalid\n");
717071dc273bb0 Richard Zhao      2012-04-27  102  		ret =3D -EINVAL;
717071dc273bb0 Richard Zhao      2012-04-27  103  		goto fail;
c448303e86c970 Shawn Guo         2012-03-16  104  	}
c448303e86c970 Shawn Guo         2012-03-16  105  =

c448303e86c970 Shawn Guo         2012-03-16  106  	ssi_pdev =3D of_find_dev=
ice_by_node(ssi_np);
c448303e86c970 Shawn Guo         2012-03-16  107  	if (!ssi_pdev) {
691beb02d9ff36 Stefan Agner      2019-01-18  108  		dev_dbg(&pdev->dev, "fa=
iled to find SSI platform device\n");
28e5ca73ef9072 Arnaud Patard     2013-06-20  109  		ret =3D -EPROBE_DEFER;
717071dc273bb0 Richard Zhao      2012-04-27  110  		goto fail;
c448303e86c970 Shawn Guo         2012-03-16  111  	}
8fa857da9744f5 Wen Yang          2019-02-18  112  	put_device(&ssi_pdev->de=
v);
81e8e4926167ab Richard Zhao      2012-04-27  113  	codec_dev =3D of_find_i2=
c_device_by_node(codec_np);
81e8e4926167ab Richard Zhao      2012-04-27  114  	if (!codec_dev) {
691beb02d9ff36 Stefan Agner      2019-01-18  115  		dev_dbg(&pdev->dev, "fa=
iled to find codec platform device\n");
d9866572486802 Stefan Agner      2019-01-18  116  		ret =3D -EPROBE_DEFER;
d9866572486802 Stefan Agner      2019-01-18  117  		goto fail;
81e8e4926167ab Richard Zhao      2012-04-27  118  	}
c448303e86c970 Shawn Guo         2012-03-16  119  =

c448303e86c970 Shawn Guo         2012-03-16  120  	data =3D devm_kzalloc(&p=
dev->dev, sizeof(*data), GFP_KERNEL);
717071dc273bb0 Richard Zhao      2012-04-27  121  	if (!data) {
717071dc273bb0 Richard Zhao      2012-04-27  122  		ret =3D -ENOMEM;
41cd312dfe980a Miaoqian Lin      2022-05-11  123  		goto put_device;
717071dc273bb0 Richard Zhao      2012-04-27  124  	}
c448303e86c970 Shawn Guo         2012-03-16  125  =

2b1407c989ec20 Kuninori Morimoto 2019-06-28  126  	comp =3D devm_kzalloc(&p=
dev->dev, 3 * sizeof(*comp), GFP_KERNEL);
3026ef68d2c508 Kuninori Morimoto 2019-06-06  127  	if (!comp) {
3026ef68d2c508 Kuninori Morimoto 2019-06-06  128  		ret =3D -ENOMEM;
41cd312dfe980a Miaoqian Lin      2022-05-11  129  		goto put_device;
3026ef68d2c508 Kuninori Morimoto 2019-06-06  130  	}
3026ef68d2c508 Kuninori Morimoto 2019-06-06  131  =

a8b22c1ccccd2a Philipp Zabel     2013-09-25  132  	data->codec_clk =3D clk_=
get(&codec_dev->dev, NULL);
f1269ae41f2e28 Wei Yongjun       2013-07-16  133  	if (IS_ERR(data->codec_c=
lk)) {
f1269ae41f2e28 Wei Yongjun       2013-07-16  134  		ret =3D PTR_ERR(data->c=
odec_clk);
41cd312dfe980a Miaoqian Lin      2022-05-11  135  		goto put_device;
f1269ae41f2e28 Wei Yongjun       2013-07-16  136  	}
9e13f345887c17 Fabio Estevam     2013-06-09  137  =

81e8e4926167ab Richard Zhao      2012-04-27  138  	data->clk_frequency =3D =
clk_get_rate(data->codec_clk);
c448303e86c970 Shawn Guo         2012-03-16  139  =

3026ef68d2c508 Kuninori Morimoto 2019-06-06  140  	data->dai.cpus		=3D &com=
p[0];
3026ef68d2c508 Kuninori Morimoto 2019-06-06  141  	data->dai.codecs	=3D &co=
mp[1];
2b1407c989ec20 Kuninori Morimoto 2019-06-28  142  	data->dai.platforms	=3D =
&comp[2];
3026ef68d2c508 Kuninori Morimoto 2019-06-06  143  =

3026ef68d2c508 Kuninori Morimoto 2019-06-06  144  	data->dai.num_cpus	=3D 1;
3026ef68d2c508 Kuninori Morimoto 2019-06-06  145  	data->dai.num_codecs	=3D=
 1;
2b1407c989ec20 Kuninori Morimoto 2019-06-28  146  	data->dai.num_platforms	=
=3D 1;
3026ef68d2c508 Kuninori Morimoto 2019-06-06  147  =

c448303e86c970 Shawn Guo         2012-03-16  148  	data->dai.name =3D "HiFi=
";
c448303e86c970 Shawn Guo         2012-03-16  149  	data->dai.stream_name =
=3D "HiFi";
3026ef68d2c508 Kuninori Morimoto 2019-06-06  150  	data->dai.codecs->dai_na=
me =3D "sgtl5000";
3026ef68d2c508 Kuninori Morimoto 2019-06-06  151  	data->dai.codecs->of_nod=
e =3D codec_np;
3026ef68d2c508 Kuninori Morimoto 2019-06-06  152  	data->dai.cpus->of_node =
=3D ssi_np;
2b1407c989ec20 Kuninori Morimoto 2019-06-28  153  	data->dai.platforms->of_=
node =3D ssi_np;
c448303e86c970 Shawn Guo         2012-03-16  154  	data->dai.init =3D &imx_=
sgtl5000_dai_init;
c448303e86c970 Shawn Guo         2012-03-16  155  	data->dai.dai_fmt =3D SN=
D_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
419099b4c3318a Mark Brown        2021-09-21  156  			    SND_SOC_DAIFMT_CBP=
_CFP;
c448303e86c970 Shawn Guo         2012-03-16  157  =

c448303e86c970 Shawn Guo         2012-03-16  158  	data->card.dev =3D &pdev=
->dev;
c448303e86c970 Shawn Guo         2012-03-16  159  	ret =3D snd_soc_of_parse=
_card_name(&data->card, "model");
172b4c5c8afdb7 Shawn Guo         2012-03-30  160  	if (ret)
41cd312dfe980a Miaoqian Lin      2022-05-11  161  		goto put_device;
172b4c5c8afdb7 Shawn Guo         2012-03-30  162  	ret =3D snd_soc_of_parse=
_audio_routing(&data->card, "audio-routing");
c448303e86c970 Shawn Guo         2012-03-16  163  	if (ret)
41cd312dfe980a Miaoqian Lin      2022-05-11  164  		goto put_device;
c448303e86c970 Shawn Guo         2012-03-16  165  	data->card.num_links =3D=
 1;
29df430692c46b Lothar Wa=C3=9Fmann    2012-11-22  166  	data->card.owner =
=3D THIS_MODULE;
c448303e86c970 Shawn Guo         2012-03-16  167  	data->card.dai_link =3D =
&data->dai;
172b4c5c8afdb7 Shawn Guo         2012-03-30  168  	data->card.dapm_widgets =
=3D imx_sgtl5000_dapm_widgets;
172b4c5c8afdb7 Shawn Guo         2012-03-30  169  	data->card.num_dapm_widg=
ets =3D ARRAY_SIZE(imx_sgtl5000_dapm_widgets);
c448303e86c970 Shawn Guo         2012-03-16  170  =

47cf84e17ebb79 Shawn Guo         2014-02-08  171  	platform_set_drvdata(pde=
v, &data->card);
47cf84e17ebb79 Shawn Guo         2014-02-08  172  	snd_soc_card_set_drvdata=
(&data->card, data);
47cf84e17ebb79 Shawn Guo         2014-02-08  173  =

01984a47e21a7d Sachin Kamat      2013-09-17  174  	ret =3D devm_snd_soc_reg=
ister_card(&pdev->dev, &data->card);
c448303e86c970 Shawn Guo         2012-03-16  175  	if (ret) {
2e6f557ca35aa3 Kuninori Morimoto 2021-12-14  176  		dev_err_probe(&pdev->de=
v, ret, "snd_soc_register_card failed\n");
41cd312dfe980a Miaoqian Lin      2022-05-11  177  		goto put_device;
c448303e86c970 Shawn Guo         2012-03-16  178  	}
c448303e86c970 Shawn Guo         2012-03-16  179  =

2fc059f2cc875a Fabio Estevam     2013-04-24  180  	of_node_put(ssi_np);
2fc059f2cc875a Fabio Estevam     2013-04-24  181  	of_node_put(codec_np);
2fc059f2cc875a Fabio Estevam     2013-04-24  182  =

2fc059f2cc875a Fabio Estevam     2013-04-24  183  	return 0;
2fc059f2cc875a Fabio Estevam     2013-04-24  184  =

41cd312dfe980a Miaoqian Lin      2022-05-11  185  put_device:
41cd312dfe980a Miaoqian Lin      2022-05-11  186  	put_device(&codec_dev->d=
ev);
717071dc273bb0 Richard Zhao      2012-04-27  187  fail:
a8b22c1ccccd2a Philipp Zabel     2013-09-25 @188  	clk_put(data->codec_clk);
c448303e86c970 Shawn Guo         2012-03-16  189  	of_node_put(ssi_np);
c448303e86c970 Shawn Guo         2012-03-16  190  	of_node_put(codec_np);
c448303e86c970 Shawn Guo         2012-03-16  191  =

717071dc273bb0 Richard Zhao      2012-04-27  192  	return ret;
c448303e86c970 Shawn Guo         2012-03-16  193  }
c448303e86c970 Shawn Guo         2012-03-16  194  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4199694568360498278==--

