Content-Type: multipart/mixed; boundary="===============3711164465923512490=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: sound/soc/qcom/sc7180.c:163 sc7180_snd_startup() error: uninitialized symbol 'pll_id'.
Date: Tue, 18 Jan 2022 19:13:44 +0800
Message-ID: <202201181744.zq89wXU1-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3711164465923512490==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: lvzhaoxiong <lvzhaoxiong@huaqin.corp-partner.google.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   e3a8b6a1e70c37702054ae3c7c07ed828435d8ee
commit: 425c5fce8a03c9da70a4c763cd7db22fbb422dcf ASoC: qcom: Add support fo=
r ALC5682I-VS codec
date:   7 weeks ago
:::::: branch date: 5 hours ago
:::::: commit date: 7 weeks ago
config: openrisc-randconfig-m031-20220117 (https://download.01.org/0day-ci/=
archive/20220118/202201181744.zq89wXU1-lkp(a)intel.com/config)
compiler: or1k-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
sound/soc/qcom/sc7180.c:163 sc7180_snd_startup() error: uninitialized symbo=
l 'pll_id'.
sound/soc/qcom/sc7180.c:163 sc7180_snd_startup() error: uninitialized symbo=
l 'pll_source'.
sound/soc/qcom/sc7180.c:164 sc7180_snd_startup() error: uninitialized symbo=
l 'pll_in'.
sound/soc/qcom/sc7180.c:164 sc7180_snd_startup() error: uninitialized symbo=
l 'pll_out'.
sound/soc/qcom/sc7180.c:171 sc7180_snd_startup() error: uninitialized symbo=
l 'clk_id'.

vim +/pll_id +163 sound/soc/qcom/sc7180.c

9e3ecb5b16818a Ajit Pandey 2020-10-27  124  =

9e3ecb5b16818a Ajit Pandey 2020-10-27  125  static int sc7180_snd_startup(s=
truct snd_pcm_substream *substream)
9e3ecb5b16818a Ajit Pandey 2020-10-27  126  {
9e3ecb5b16818a Ajit Pandey 2020-10-27  127  	struct snd_soc_pcm_runtime *rt=
d =3D substream->private_data;
9e3ecb5b16818a Ajit Pandey 2020-10-27  128  	struct snd_soc_card *card =3D =
rtd->card;
9e3ecb5b16818a Ajit Pandey 2020-10-27  129  	struct sc7180_snd_data *data =
=3D snd_soc_card_get_drvdata(card);
9e3ecb5b16818a Ajit Pandey 2020-10-27  130  	struct snd_soc_dai *cpu_dai =
=3D asoc_rtd_to_cpu(rtd, 0);
9e3ecb5b16818a Ajit Pandey 2020-10-27  131  	struct snd_soc_dai *codec_dai =
=3D asoc_rtd_to_codec(rtd, 0);
425c5fce8a03c9 lvzhaoxiong 2021-11-23  132  	int pll_id, pll_source, pll_in=
, pll_out, clk_id, ret;
425c5fce8a03c9 lvzhaoxiong 2021-11-23  133  =

425c5fce8a03c9 lvzhaoxiong 2021-11-23  134  	if (!(strcmp(card->name, "sc71=
80-rt5682-max98357a-1mic"))) {
425c5fce8a03c9 lvzhaoxiong 2021-11-23  135  		pll_source =3D RT5682_PLL1_S_=
MCLK;
425c5fce8a03c9 lvzhaoxiong 2021-11-23  136  		pll_id =3D 0;
425c5fce8a03c9 lvzhaoxiong 2021-11-23  137  		clk_id =3D RT5682_SCLK_S_PLL1;
425c5fce8a03c9 lvzhaoxiong 2021-11-23  138  		pll_out =3D RT5682_PLL1_FREQ;
425c5fce8a03c9 lvzhaoxiong 2021-11-23  139  		pll_in =3D DEFAULT_MCLK_RATE;
425c5fce8a03c9 lvzhaoxiong 2021-11-23  140  	} else if (!(strcmp(card->name=
, "sc7180-rt5682s-max98357a-1mic"))) {
425c5fce8a03c9 lvzhaoxiong 2021-11-23  141  		pll_source =3D RT5682S_PLL_S_=
MCLK;
425c5fce8a03c9 lvzhaoxiong 2021-11-23  142  		pll_id =3D RT5682S_PLL2;
425c5fce8a03c9 lvzhaoxiong 2021-11-23  143  		clk_id =3D RT5682S_SCLK_S_PLL=
2;
425c5fce8a03c9 lvzhaoxiong 2021-11-23  144  		pll_out =3D RT5682_PLL1_FREQ;
425c5fce8a03c9 lvzhaoxiong 2021-11-23  145  		pll_in =3D DEFAULT_MCLK_RATE;
425c5fce8a03c9 lvzhaoxiong 2021-11-23  146  	}
9e3ecb5b16818a Ajit Pandey 2020-10-27  147  =

9e3ecb5b16818a Ajit Pandey 2020-10-27  148  	switch (cpu_dai->id) {
9e3ecb5b16818a Ajit Pandey 2020-10-27  149  	case MI2S_PRIMARY:
9e3ecb5b16818a Ajit Pandey 2020-10-27  150  		if (++data->pri_mi2s_clk_coun=
t =3D=3D 1) {
9e3ecb5b16818a Ajit Pandey 2020-10-27  151  			snd_soc_dai_set_sysclk(cpu_d=
ai,
9e3ecb5b16818a Ajit Pandey 2020-10-27  152  					       LPASS_MCLK0,
9e3ecb5b16818a Ajit Pandey 2020-10-27  153  					       DEFAULT_MCLK_RATE,
9e3ecb5b16818a Ajit Pandey 2020-10-27  154  					       SNDRV_PCM_STREAM_PL=
AYBACK);
9e3ecb5b16818a Ajit Pandey 2020-10-27  155  		}
9e3ecb5b16818a Ajit Pandey 2020-10-27  156  =

9e3ecb5b16818a Ajit Pandey 2020-10-27  157  		snd_soc_dai_set_fmt(codec_dai,
9e3ecb5b16818a Ajit Pandey 2020-10-27  158  				    SND_SOC_DAIFMT_CBS_CFS |
9e3ecb5b16818a Ajit Pandey 2020-10-27  159  				    SND_SOC_DAIFMT_NB_NF |
9e3ecb5b16818a Ajit Pandey 2020-10-27  160  				    SND_SOC_DAIFMT_I2S);
9e3ecb5b16818a Ajit Pandey 2020-10-27  161  =

9e3ecb5b16818a Ajit Pandey 2020-10-27  162  		/* Configure PLL1 for codec */
425c5fce8a03c9 lvzhaoxiong 2021-11-23 @163  		ret =3D snd_soc_dai_set_pll(c=
odec_dai, pll_id, pll_source,
425c5fce8a03c9 lvzhaoxiong 2021-11-23 @164  					  pll_in, pll_out);
9e3ecb5b16818a Ajit Pandey 2020-10-27  165  		if (ret) {
9e3ecb5b16818a Ajit Pandey 2020-10-27  166  			dev_err(rtd->dev, "can't set=
 codec pll: %d\n", ret);
9e3ecb5b16818a Ajit Pandey 2020-10-27  167  			return ret;
9e3ecb5b16818a Ajit Pandey 2020-10-27  168  		}
9e3ecb5b16818a Ajit Pandey 2020-10-27  169  =

9e3ecb5b16818a Ajit Pandey 2020-10-27  170  		/* Configure sysclk for codec=
 */
425c5fce8a03c9 lvzhaoxiong 2021-11-23 @171  		ret =3D snd_soc_dai_set_syscl=
k(codec_dai, clk_id, pll_out,
9e3ecb5b16818a Ajit Pandey 2020-10-27  172  					     SND_SOC_CLOCK_IN);
9e3ecb5b16818a Ajit Pandey 2020-10-27  173  		if (ret)
9e3ecb5b16818a Ajit Pandey 2020-10-27  174  			dev_err(rtd->dev, "snd_soc_d=
ai_set_sysclk err =3D %d\n",
9e3ecb5b16818a Ajit Pandey 2020-10-27  175  				ret);
9e3ecb5b16818a Ajit Pandey 2020-10-27  176  =

9e3ecb5b16818a Ajit Pandey 2020-10-27  177  		break;
9e3ecb5b16818a Ajit Pandey 2020-10-27  178  	case MI2S_SECONDARY:
9e3ecb5b16818a Ajit Pandey 2020-10-27  179  		break;
9e3ecb5b16818a Ajit Pandey 2020-10-27  180  	case LPASS_DP_RX:
9e3ecb5b16818a Ajit Pandey 2020-10-27  181  		break;
9e3ecb5b16818a Ajit Pandey 2020-10-27  182  	default:
9e3ecb5b16818a Ajit Pandey 2020-10-27  183  		dev_err(rtd->dev, "%s: invali=
d dai id 0x%x\n", __func__,
9e3ecb5b16818a Ajit Pandey 2020-10-27  184  			cpu_dai->id);
9e3ecb5b16818a Ajit Pandey 2020-10-27  185  		return -EINVAL;
9e3ecb5b16818a Ajit Pandey 2020-10-27  186  	}
9e3ecb5b16818a Ajit Pandey 2020-10-27  187  	return 0;
9e3ecb5b16818a Ajit Pandey 2020-10-27  188  }
9e3ecb5b16818a Ajit Pandey 2020-10-27  189  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3711164465923512490==--

