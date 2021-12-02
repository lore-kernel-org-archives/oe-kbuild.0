Content-Type: multipart/mixed; boundary="===============5157997594061015628=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: sound/soc/amd/vangogh/acp5x-mach.c:190 acp5x_cs35l41_hw_params() error: uninitialized symbol 'ret'.
Date: Thu, 02 Dec 2021 10:47:36 +0800
Message-ID: <202112021050.OPtN50Tj-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5157997594061015628==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   58e1100fdc5990b0cc0d4beaf2562a92e621ac7d
commit: 96792fdd77cd19fcf2368e7c19bb8b78557ae425 ASoC: amd: enable vangogh =
platform machine driver build
date:   7 weeks ago
:::::: branch date: 29 hours ago
:::::: commit date: 7 weeks ago
config: x86_64-randconfig-m001-20211201 (https://download.01.org/0day-ci/ar=
chive/20211202/202112021050.OPtN50Tj-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
sound/soc/amd/vangogh/acp5x-mach.c:190 acp5x_cs35l41_hw_params() error: uni=
nitialized symbol 'ret'.

vim +/ret +190 sound/soc/amd/vangogh/acp5x-mach.c

34a0094b9ff7b75 Vijendar Mukunda 2021-10-14  157  =

34a0094b9ff7b75 Vijendar Mukunda 2021-10-14  158  static int acp5x_cs35l41_=
hw_params(struct snd_pcm_substream *substream,
34a0094b9ff7b75 Vijendar Mukunda 2021-10-14  159  				   struct snd_pcm_hw_=
params *params)
34a0094b9ff7b75 Vijendar Mukunda 2021-10-14  160  {
34a0094b9ff7b75 Vijendar Mukunda 2021-10-14  161  	struct snd_soc_pcm_runti=
me *rtd =3D substream->private_data;
34a0094b9ff7b75 Vijendar Mukunda 2021-10-14  162  	struct snd_soc_card *car=
d =3D rtd->card;
34a0094b9ff7b75 Vijendar Mukunda 2021-10-14  163  	struct snd_soc_dai *code=
c_dai;
34a0094b9ff7b75 Vijendar Mukunda 2021-10-14  164  	int ret, i;
34a0094b9ff7b75 Vijendar Mukunda 2021-10-14  165  	unsigned int num_codecs =
=3D rtd->num_codecs;
34a0094b9ff7b75 Vijendar Mukunda 2021-10-14  166  	unsigned int bclk_val;
34a0094b9ff7b75 Vijendar Mukunda 2021-10-14  167  =

34a0094b9ff7b75 Vijendar Mukunda 2021-10-14  168  	for (i =3D 0; i < num_co=
decs; i++) {
34a0094b9ff7b75 Vijendar Mukunda 2021-10-14  169  		codec_dai =3D asoc_rtd_=
to_codec(rtd, i);
34a0094b9ff7b75 Vijendar Mukunda 2021-10-14  170  		if ((strcmp(codec_dai->=
name, "spi-VLV1776:00") =3D=3D 0) ||
34a0094b9ff7b75 Vijendar Mukunda 2021-10-14  171  		    (strcmp(codec_dai->=
name, "spi-VLV1776:01") =3D=3D 0)) {
34a0094b9ff7b75 Vijendar Mukunda 2021-10-14  172  			switch (params_rate(pa=
rams)) {
34a0094b9ff7b75 Vijendar Mukunda 2021-10-14  173  			case 48000:
34a0094b9ff7b75 Vijendar Mukunda 2021-10-14  174  				bclk_val =3D 1536000;
34a0094b9ff7b75 Vijendar Mukunda 2021-10-14  175  				break;
34a0094b9ff7b75 Vijendar Mukunda 2021-10-14  176  			default:
34a0094b9ff7b75 Vijendar Mukunda 2021-10-14  177  				dev_err(card->dev, "I=
nvalid Samplerate:0x%x\n",
34a0094b9ff7b75 Vijendar Mukunda 2021-10-14  178  					params_rate(params));
34a0094b9ff7b75 Vijendar Mukunda 2021-10-14  179  				return -EINVAL;
34a0094b9ff7b75 Vijendar Mukunda 2021-10-14  180  			}
34a0094b9ff7b75 Vijendar Mukunda 2021-10-14  181  			ret =3D snd_soc_compon=
ent_set_sysclk(codec_dai->component,
34a0094b9ff7b75 Vijendar Mukunda 2021-10-14  182  							   0, 0, bclk_val,=
 SND_SOC_CLOCK_IN);
34a0094b9ff7b75 Vijendar Mukunda 2021-10-14  183  			if (ret < 0) {
34a0094b9ff7b75 Vijendar Mukunda 2021-10-14  184  				dev_err(card->dev, "f=
ailed to set sysclk for CS35l41 dai\n");
34a0094b9ff7b75 Vijendar Mukunda 2021-10-14  185  				return ret;
34a0094b9ff7b75 Vijendar Mukunda 2021-10-14  186  			}
34a0094b9ff7b75 Vijendar Mukunda 2021-10-14  187  		}
34a0094b9ff7b75 Vijendar Mukunda 2021-10-14  188  	}
34a0094b9ff7b75 Vijendar Mukunda 2021-10-14  189  =

34a0094b9ff7b75 Vijendar Mukunda 2021-10-14 @190  	return ret;
34a0094b9ff7b75 Vijendar Mukunda 2021-10-14  191  }
34a0094b9ff7b75 Vijendar Mukunda 2021-10-14  192  =


:::::: The code at line 190 was first introduced by commit
:::::: 34a0094b9ff7b7544591a6841f9b61747033f292 ASoC: amd: add vangogh mach=
ine driver

:::::: TO: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
:::::: CC: Mark Brown <broonie@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5157997594061015628==--

