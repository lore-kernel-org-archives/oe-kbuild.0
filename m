Content-Type: multipart/mixed; boundary="===============8511414748139118269=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: sound/soc/amd/vangogh/acp5x-mach.c:190 acp5x_cs35l41_hw_params() error: uninitialized symbol 'ret'.
Date: Mon, 31 Jan 2022 11:54:43 +0800
Message-ID: <202201311159.FJsrC79q-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8511414748139118269==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
CC: Mark Brown <broonie@kernel.org>

Hi Vijendar,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   26291c54e111ff6ba87a164d85d4a4e134b7315c
commit: 96792fdd77cd19fcf2368e7c19bb8b78557ae425 ASoC: amd: enable vangogh =
platform machine driver build
date:   4 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 4 months ago
config: x86_64-randconfig-m001-20220131 (https://download.01.org/0day-ci/ar=
chive/20220131/202201311159.FJsrC79q-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
sound/soc/amd/vangogh/acp5x-mach.c:190 acp5x_cs35l41_hw_params() error: uni=
nitialized symbol 'ret'.

vim +/ret +190 sound/soc/amd/vangogh/acp5x-mach.c

34a0094b9ff7b7 Vijendar Mukunda 2021-10-14  157  =

34a0094b9ff7b7 Vijendar Mukunda 2021-10-14  158  static int acp5x_cs35l41_h=
w_params(struct snd_pcm_substream *substream,
34a0094b9ff7b7 Vijendar Mukunda 2021-10-14  159  				   struct snd_pcm_hw_p=
arams *params)
34a0094b9ff7b7 Vijendar Mukunda 2021-10-14  160  {
34a0094b9ff7b7 Vijendar Mukunda 2021-10-14  161  	struct snd_soc_pcm_runtim=
e *rtd =3D substream->private_data;
34a0094b9ff7b7 Vijendar Mukunda 2021-10-14  162  	struct snd_soc_card *card=
 =3D rtd->card;
34a0094b9ff7b7 Vijendar Mukunda 2021-10-14  163  	struct snd_soc_dai *codec=
_dai;
34a0094b9ff7b7 Vijendar Mukunda 2021-10-14  164  	int ret, i;
34a0094b9ff7b7 Vijendar Mukunda 2021-10-14  165  	unsigned int num_codecs =
=3D rtd->num_codecs;
34a0094b9ff7b7 Vijendar Mukunda 2021-10-14  166  	unsigned int bclk_val;
34a0094b9ff7b7 Vijendar Mukunda 2021-10-14  167  =

34a0094b9ff7b7 Vijendar Mukunda 2021-10-14  168  	for (i =3D 0; i < num_cod=
ecs; i++) {
34a0094b9ff7b7 Vijendar Mukunda 2021-10-14  169  		codec_dai =3D asoc_rtd_t=
o_codec(rtd, i);
34a0094b9ff7b7 Vijendar Mukunda 2021-10-14  170  		if ((strcmp(codec_dai->n=
ame, "spi-VLV1776:00") =3D=3D 0) ||
34a0094b9ff7b7 Vijendar Mukunda 2021-10-14  171  		    (strcmp(codec_dai->n=
ame, "spi-VLV1776:01") =3D=3D 0)) {
34a0094b9ff7b7 Vijendar Mukunda 2021-10-14  172  			switch (params_rate(par=
ams)) {
34a0094b9ff7b7 Vijendar Mukunda 2021-10-14  173  			case 48000:
34a0094b9ff7b7 Vijendar Mukunda 2021-10-14  174  				bclk_val =3D 1536000;
34a0094b9ff7b7 Vijendar Mukunda 2021-10-14  175  				break;
34a0094b9ff7b7 Vijendar Mukunda 2021-10-14  176  			default:
34a0094b9ff7b7 Vijendar Mukunda 2021-10-14  177  				dev_err(card->dev, "In=
valid Samplerate:0x%x\n",
34a0094b9ff7b7 Vijendar Mukunda 2021-10-14  178  					params_rate(params));
34a0094b9ff7b7 Vijendar Mukunda 2021-10-14  179  				return -EINVAL;
34a0094b9ff7b7 Vijendar Mukunda 2021-10-14  180  			}
34a0094b9ff7b7 Vijendar Mukunda 2021-10-14  181  			ret =3D snd_soc_compone=
nt_set_sysclk(codec_dai->component,
34a0094b9ff7b7 Vijendar Mukunda 2021-10-14  182  							   0, 0, bclk_val, =
SND_SOC_CLOCK_IN);
34a0094b9ff7b7 Vijendar Mukunda 2021-10-14  183  			if (ret < 0) {
34a0094b9ff7b7 Vijendar Mukunda 2021-10-14  184  				dev_err(card->dev, "fa=
iled to set sysclk for CS35l41 dai\n");
34a0094b9ff7b7 Vijendar Mukunda 2021-10-14  185  				return ret;
34a0094b9ff7b7 Vijendar Mukunda 2021-10-14  186  			}
34a0094b9ff7b7 Vijendar Mukunda 2021-10-14  187  		}
34a0094b9ff7b7 Vijendar Mukunda 2021-10-14  188  	}
34a0094b9ff7b7 Vijendar Mukunda 2021-10-14  189  =

34a0094b9ff7b7 Vijendar Mukunda 2021-10-14 @190  	return ret;
34a0094b9ff7b7 Vijendar Mukunda 2021-10-14  191  }
34a0094b9ff7b7 Vijendar Mukunda 2021-10-14  192  =


:::::: The code at line 190 was first introduced by commit
:::::: 34a0094b9ff7b7544591a6841f9b61747033f292 ASoC: amd: add vangogh mach=
ine driver

:::::: TO: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
:::::: CC: Mark Brown <broonie@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8511414748139118269==--

