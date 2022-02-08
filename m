Content-Type: multipart/mixed; boundary="===============6754329127861355035=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15 561/872] sound/soc/xilinx/xlnx_pl_snd_card.c:391:3-9: ERROR: missing put_device; call of_find_device_by_node on line 399, but without a corresponding object release within this function.
Date: Wed, 09 Feb 2022 00:10:21 +0800
Message-ID: <202202082343.teK89qWC-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6754329127861355035==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-arm-kernel(a)lists.infradead.org
TO: Maruthi Srinivas Bayyavarapu <maruthi.srinivas.bayyavarapu@xilinx.com>
CC: Michal Simek <monstr@monstr.eu>
CC: Hyun Kwon <hyun.kwon@xilinx.com>

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15
head:   1183ce490adb103e5e569b8ebd74c50c885ddc05
commit: c078611ad13fd9b920a3aa5a206a014322742227 [561/872] ASoC: xlnx: add =
PL sound card support
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: ia64-randconfig-c023-20220208 (https://download.01.org/0day-ci/arch=
ive/20220208/202202082343.teK89qWC-lkp(a)intel.com/config)
compiler: ia64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> sound/soc/xilinx/xlnx_pl_snd_card.c:391:3-9: ERROR: missing put_device; =
call of_find_device_by_node on line 399, but without a corresponding object=
 release within this function.
   sound/soc/xilinx/xlnx_pl_snd_card.c:407:4-10: ERROR: missing put_device;=
 call of_find_device_by_node on line 399, but without a corresponding objec=
t release within this function.
   sound/soc/xilinx/xlnx_pl_snd_card.c:475:3-9: ERROR: missing put_device; =
call of_find_device_by_node on line 399, but without a corresponding object=
 release within this function.
   sound/soc/xilinx/xlnx_pl_snd_card.c:489:3-9: ERROR: missing put_device; =
call of_find_device_by_node on line 399, but without a corresponding object=
 release within this function.
   sound/soc/xilinx/xlnx_pl_snd_card.c:495:3-9: ERROR: missing put_device; =
call of_find_device_by_node on line 399, but without a corresponding object=
 release within this function.
   sound/soc/xilinx/xlnx_pl_snd_card.c:507:3-9: ERROR: missing put_device; =
call of_find_device_by_node on line 399, but without a corresponding object=
 release within this function.
   sound/soc/xilinx/xlnx_pl_snd_card.c:514:1-7: ERROR: missing put_device; =
call of_find_device_by_node on line 399, but without a corresponding object=
 release within this function.

vim +391 sound/soc/xilinx/xlnx_pl_snd_card.c

c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  337  =

c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  338  static int xln=
x_snd_probe(struct platform_device *pdev)
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  339  {
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  340  	u32 i, max_li=
nks =3D 0, start_count =3D 0;
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  341  	size_t sz;
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  342  	char *buf;
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  343  	int ret, audi=
o_interface;
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  344  	struct snd_so=
c_dai_link *dai;
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  345  	struct pl_car=
d_data *prv;
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  346  	struct platfo=
rm_device *iface_pdev;
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  347  =

c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  348  	struct snd_so=
c_card *card;
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  349  	struct device=
_node **node =3D pdev->dev.platform_data;
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  350  =

c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  351  	if (!node)
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  352  		return -ENOD=
EV;
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  353  =

c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  354  	if (node[XLNX=
_PLAYBACK] && node[XLNX_CAPTURE]) {
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  355  		max_links =
=3D 2;
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  356  		start_count =
=3D XLNX_PLAYBACK;
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  357  	} else if (no=
de[XLNX_PLAYBACK]) {
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  358  		max_links =
=3D 1;
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  359  		start_count =
=3D XLNX_PLAYBACK;
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  360  	} else if (no=
de[XLNX_CAPTURE]) {
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  361  		max_links =
=3D 1;
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  362  		start_count =
=3D XLNX_CAPTURE;
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  363  	}
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  364  =

c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  365  	card =3D devm=
_kzalloc(&pdev->dev, sizeof(struct snd_soc_card),
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  366  			    GFP_KER=
NEL);
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  367  	if (!card)
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  368  		return -ENOM=
EM;
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  369  =

c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  370  	card->dev =3D=
 &pdev->dev;
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  371  =

c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  372  	card->dai_lin=
k =3D devm_kzalloc(card->dev,
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  373  				      size=
of(*dai) * max_links,
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  374  				      GFP_=
KERNEL);
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  375  	if (!card->da=
i_link)
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  376  		return -ENOM=
EM;
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  377  =

c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  378  	prv =3D devm_=
kzalloc(card->dev,
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  379  			   sizeof(s=
truct pl_card_data),
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  380  			   GFP_KERN=
EL);
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  381  	if (!prv)
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  382  		return -ENOM=
EM;
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  383  =

c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  384  	card->num_lin=
ks =3D 0;
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  385  	for (i =3D st=
art_count; i < (start_count + max_links); i++) {
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  386  		struct devic=
e_node *pnode =3D of_parse_phandle(node[i],
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  387  							     "x=
lnx,snd-pcm", 0);
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  388  		if (!pnode) {
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  389  			dev_err(car=
d->dev, "platform node not found\n");
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  390  			of_node_put=
(pnode);
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06 @391  			return -ENO=
DEV;
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  392  		}
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  393  =

c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  394  		/*
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  395  		 * Check for=
 either playback or capture is enough, as
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  396  		 * same cloc=
k is used for both.
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  397  		 */
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  398  		if (i =3D=3D=
 XLNX_PLAYBACK) {
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06 @399  			iface_pdev =
=3D of_find_device_by_node(pnode);
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  400  			if (!iface_=
pdev) {
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  401  				of_node_pu=
t(pnode);
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  402  				return -EN=
ODEV;
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  403  			}
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  404  =

c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  405  			prv->mclk =
=3D devm_clk_get(&iface_pdev->dev, "aud_mclk");
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  406  			if (IS_ERR(=
prv->mclk))
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  407  				return PTR=
_ERR(prv->mclk);
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  408  =

c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  409  		}
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  410  		of_node_put(=
pnode);
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  411  =

c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  412  		if (max_link=
s =3D=3D 2)
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  413  			dai =3D &ca=
rd->dai_link[i];
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  414  		else
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  415  			dai =3D &ca=
rd->dai_link[0];
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  416  =

c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  417  		audio_interf=
ace =3D find_link(node[i], i);
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  418  		switch (audi=
o_interface) {
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  419  		case I2S_AUD=
IO:
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  420  			*dai =3D xl=
nx_snd_dai[I2S_AUDIO][i];
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  421  			dai->platfo=
rms->of_node =3D pnode;
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  422  			dai->cpus->=
of_node =3D node[i];
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  423  			card->num_l=
inks++;
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  424  			snd_soc_car=
d_set_drvdata(card, prv);
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  425  			dev_dbg(car=
d->dev, "%s registered\n",
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  426  				card->dai_=
link[i].name);
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  427  			break;
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  428  		case HDMI_AU=
DIO:
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  429  			*dai =3D xl=
nx_snd_dai[HDMI_AUDIO][i];
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  430  			dai->platfo=
rms->of_node =3D pnode;
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  431  			if (i =3D=
=3D XLNX_CAPTURE)
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  432  				dai->codec=
s->of_node =3D node[i];
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  433  			card->num_l=
inks++;
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  434  			/* TODO: su=
pport multiple sampling rates */
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  435  			prv->mclk_r=
atio =3D 384;
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  436  			snd_soc_car=
d_set_drvdata(card, prv);
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  437  			dev_dbg(car=
d->dev, "%s registered\n",
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  438  				card->dai_=
link[i].name);
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  439  			break;
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  440  		case SDI_AUD=
IO:
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  441  			*dai =3D xl=
nx_snd_dai[SDI_AUDIO][i];
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  442  			dai->platfo=
rms->of_node =3D pnode;
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  443  			dai->codecs=
->of_node =3D node[i];
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  444  			card->num_l=
inks++;
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  445  			/* TODO: su=
pport multiple sampling rates */
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  446  			prv->mclk_r=
atio =3D 384;
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  447  			snd_soc_car=
d_set_drvdata(card, prv);
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  448  			dev_dbg(car=
d->dev, "%s registered\n",
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  449  				card->dai_=
link[i].name);
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  450  			break;
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  451  		case SPDIF_A=
UDIO:
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  452  			*dai =3D xl=
nx_snd_dai[SPDIF_AUDIO][i];
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  453  			dai->platfo=
rms->of_node =3D pnode;
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  454  			dai->codecs=
->of_node =3D node[i];
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  455  			card->num_l=
inks++;
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  456  			prv->mclk_r=
atio =3D 384;
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  457  			snd_soc_car=
d_set_drvdata(card, prv);
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  458  			dev_dbg(car=
d->dev, "%s registered\n",
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  459  				card->dai_=
link[i].name);
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  460  			break;
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  461  		case DP_AUDI=
O:
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  462  			*dai =3D xl=
nx_snd_dai[DP_AUDIO][i];
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  463  			dai->platfo=
rms->of_node =3D pnode;
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  464  			if (i =3D=
=3D XLNX_CAPTURE)
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  465  				dai->codec=
s->of_node =3D node[i];
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  466  			card->num_l=
inks++;
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  467  			/* TODO: su=
pport multiple sampling rates */
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  468  			prv->mclk_r=
atio =3D 512;
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  469  			snd_soc_car=
d_set_drvdata(card, prv);
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  470  			dev_dbg(car=
d->dev, "%s registered\n",
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  471  				card->dai_=
link[i].name);
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  472  			break;
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  473  		default:
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  474  			dev_err(car=
d->dev, "Invalid audio interface\n");
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  475  			return -ENO=
DEV;
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  476  		}
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  477  	}
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  478  =

c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  479  	if (card->num=
_links) {
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  480  		/*
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  481  		 *  Example =
: i2s card name =3D xlnx-i2s-snd-card-0
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  482  		 *  length =
=3D number of chars in "xlnx-i2s-snd-card"
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  483  		 *	    + 1 (=
'-'), + 1 (card instance num)
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  484  		 *	    + 1 (=
'\0')
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  485  		 */
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  486  		sz =3D strle=
n(xlnx_snd_card_name[audio_interface]) + 3;
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  487  		buf =3D devm=
_kzalloc(card->dev, sz, GFP_KERNEL);
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  488  		if (!buf)
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  489  			return -ENO=
MEM;
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  490  =

c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  491  		prv->xlnx_sn=
d_dev_id =3D ida_simple_get(&xlnx_snd_card_dev, 0,
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  492  						      XL=
NX_MAX_PL_SND_DEV,
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  493  						      GF=
P_KERNEL);
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  494  		if (prv->xln=
x_snd_dev_id < 0)
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  495  			return prv-=
>xlnx_snd_dev_id;
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  496  =

c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  497  		snprintf(buf=
, sz, "%s-%d", xlnx_snd_card_name[audio_interface],
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  498  			 prv->xlnx_=
snd_dev_id);
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  499  		card->name =
=3D buf;
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  500  =

c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  501  		ret =3D devm=
_snd_soc_register_card(card->dev, card);
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  502  		if (ret) {
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  503  			dev_err(car=
d->dev, "%s registration failed\n",
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  504  				card->name=
);
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  505  			ida_simple_=
remove(&xlnx_snd_card_dev,
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  506  					  prv->xl=
nx_snd_dev_id);
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  507  			return ret;
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  508  		}
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  509  =

c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  510  		dev_set_drvd=
ata(card->dev, prv);
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  511  		dev_info(car=
d->dev, "%s registered\n", card->name);
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  512  	}
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  513  =

c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  514  	return 0;
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  515  }
c078611ad13fd9 Maruthi Srinivas Bayyavarapu 2018-09-06  516  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6754329127861355035==--

