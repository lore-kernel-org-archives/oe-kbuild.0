Content-Type: multipart/mixed; boundary="===============4354895730167865911=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: sound/soc/codecs/nau8821.c:393:20: warning: Shifting a negative value is technically undefined behaviour [shiftNegativeLHS]
Date: Tue, 01 Mar 2022 01:36:00 +0800
Message-ID: <202202282252.7gt9xAuR-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4354895730167865911==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: "Pierre-Louis Bossart" <pierre-louis.bossart@linux.intel.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   7e57714cd0ad2d5bb90e50b5096a0e671dec1ef3
commit: 46ae0b3f554a323322a770c0edee50aa8019a655 ASoC: nau8821: clarify out=
-of-bounds check
date:   4 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 4 months ago
compiler: nios2-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> sound/soc/codecs/nau8821.c:393:20: warning: Shifting a negative value is=
 technically undefined behaviour [shiftNegativeLHS]
     (speed_selection << NAU8821_DMIC_SRC_SFT));
                      ^

vim +393 sound/soc/codecs/nau8821.c

aab1ad11d69fa7f Seven Lee            2021-10-01  354  =

aab1ad11d69fa7f Seven Lee            2021-10-01  355  static const struct s=
nd_kcontrol_new nau8821_dmic_mode_switch =3D
aab1ad11d69fa7f Seven Lee            2021-10-01  356  	SOC_DAPM_SINGLE("Swi=
tch", NAU8821_R13_DMIC_CTRL,
aab1ad11d69fa7f Seven Lee            2021-10-01  357  		NAU8821_DMIC_EN_SFT=
, 1, 0);
aab1ad11d69fa7f Seven Lee            2021-10-01  358  =

aab1ad11d69fa7f Seven Lee            2021-10-01  359  static int dmic_clock=
_control(struct snd_soc_dapm_widget *w,
aab1ad11d69fa7f Seven Lee            2021-10-01  360  		struct snd_kcontrol=
 *k, int  event)
aab1ad11d69fa7f Seven Lee            2021-10-01  361  {
aab1ad11d69fa7f Seven Lee            2021-10-01  362  	struct snd_soc_compo=
nent *component =3D
aab1ad11d69fa7f Seven Lee            2021-10-01  363  		snd_soc_dapm_to_com=
ponent(w->dapm);
aab1ad11d69fa7f Seven Lee            2021-10-01  364  	struct nau8821 *nau8=
821 =3D snd_soc_component_get_drvdata(component);
aab1ad11d69fa7f Seven Lee            2021-10-01  365  	int i, speed_selecti=
on =3D -1, clk_adc_src, clk_adc;
aab1ad11d69fa7f Seven Lee            2021-10-01  366  	unsigned int clk_div=
ider_r03;
aab1ad11d69fa7f Seven Lee            2021-10-01  367  =

aab1ad11d69fa7f Seven Lee            2021-10-01  368  	/* The DMIC clock is=
 gotten from adc clock divided by
aab1ad11d69fa7f Seven Lee            2021-10-01  369  	 * CLK_DMIC_SRC (1, =
2, 4, 8). The clock has to be equal or
aab1ad11d69fa7f Seven Lee            2021-10-01  370  	 * less than nau8821=
->dmic_clk_threshold.
aab1ad11d69fa7f Seven Lee            2021-10-01  371  	 */
aab1ad11d69fa7f Seven Lee            2021-10-01  372  	regmap_read(nau8821-=
>regmap, NAU8821_R03_CLK_DIVIDER,
aab1ad11d69fa7f Seven Lee            2021-10-01  373  		&clk_divider_r03);
aab1ad11d69fa7f Seven Lee            2021-10-01  374  	clk_adc_src =3D (clk=
_divider_r03 & NAU8821_CLK_ADC_SRC_MASK)
aab1ad11d69fa7f Seven Lee            2021-10-01  375  		>> NAU8821_CLK_ADC_=
SRC_SFT;
aab1ad11d69fa7f Seven Lee            2021-10-01  376  	clk_adc =3D (nau8821=
->fs * 256) >> clk_adc_src;
aab1ad11d69fa7f Seven Lee            2021-10-01  377  =

aab1ad11d69fa7f Seven Lee            2021-10-01  378  	for (i =3D 0 ; i < 4=
 ; i++)
aab1ad11d69fa7f Seven Lee            2021-10-01  379  		if ((clk_adc >> dmi=
c_speed_sel[i].param) <=3D
aab1ad11d69fa7f Seven Lee            2021-10-01  380  			nau8821->dmic_clk_=
threshold) {
aab1ad11d69fa7f Seven Lee            2021-10-01  381  			speed_selection =
=3D dmic_speed_sel[i].val;
aab1ad11d69fa7f Seven Lee            2021-10-01  382  			break;
aab1ad11d69fa7f Seven Lee            2021-10-01  383  		}
46ae0b3f554a323 Pierre-Louis Bossart 2021-10-25  384  	if (i =3D=3D 4)
aab1ad11d69fa7f Seven Lee            2021-10-01  385  		return -EINVAL;
aab1ad11d69fa7f Seven Lee            2021-10-01  386  =

aab1ad11d69fa7f Seven Lee            2021-10-01  387  	dev_dbg(nau8821->dev,
aab1ad11d69fa7f Seven Lee            2021-10-01  388  		"clk_adc=3D%d, dmic=
_clk_threshold =3D %d, param=3D%d, val =3D %d\n",
aab1ad11d69fa7f Seven Lee            2021-10-01  389  		clk_adc, nau8821->d=
mic_clk_threshold,
aab1ad11d69fa7f Seven Lee            2021-10-01  390  		dmic_speed_sel[i].p=
aram, dmic_speed_sel[i].val);
aab1ad11d69fa7f Seven Lee            2021-10-01  391  	regmap_update_bits(n=
au8821->regmap, NAU8821_R13_DMIC_CTRL,
aab1ad11d69fa7f Seven Lee            2021-10-01  392  		NAU8821_DMIC_SRC_MA=
SK,
aab1ad11d69fa7f Seven Lee            2021-10-01 @393  		(speed_selection <<=
 NAU8821_DMIC_SRC_SFT));
aab1ad11d69fa7f Seven Lee            2021-10-01  394  =

aab1ad11d69fa7f Seven Lee            2021-10-01  395  	return 0;
aab1ad11d69fa7f Seven Lee            2021-10-01  396  }
aab1ad11d69fa7f Seven Lee            2021-10-01  397  =


:::::: The code@line 393 was first introduced by commit
:::::: aab1ad11d69fa7f35cb88105614ea7911598e1d6 ASoC: nau8821: new driver

:::::: TO: Seven Lee <wtli@nuvoton.com>
:::::: CC: Mark Brown <broonie@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4354895730167865911==--

