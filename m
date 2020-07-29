Content-Type: multipart/mixed; boundary="===============5188774523083057318=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: sound/soc/soc-pcm.c:2047:7: warning: Local variable i shadows outer variable
Date: Wed, 29 Jul 2020 17:43:40 +0800
Message-ID: <202007291732.QWSsXIir%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5188774523083057318==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Shreyas NC <shreyas.nc@intel.com>
CC: Mark Brown <broonie@kernel.org>
CC: "Pierre-Louis Bossart" <pierre-louis.bossart@linux.intel.com>
CC: Bard Liao <yung-chuan.liao@linux.intel.com>
CC: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
CC: Vinod Koul <vkoul@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   6ba1b005ffc388c2aeaddae20da29e4810dea298
commit: 19bdcc7aeed4169820be6a683c422fc06d030136 ASoC: Add multiple CPU DAI=
 support for PCM ops
date:   5 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 5 months ago
compiler: nds32le-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> sound/soc/soc-pcm.c:2047:7: warning: Local variable i shadows outer vari=
able [shadowVar]
     int i;
         ^
   sound/soc/soc-pcm.c:2024:6: note: Shadowed declaration
    int i;
        ^
   sound/soc/soc-pcm.c:2047:7: note: Shadow variable
     int i;
         ^

# https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D19bdcc7aeed4169820be6a683c422fc06d030136
git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torval=
ds/linux.git
git remote update linus
git checkout 19bdcc7aeed4169820be6a683c422fc06d030136
vim +2047 sound/soc/soc-pcm.c

ea9d0d771fcd32 Takashi Iwai      2014-11-04  2016  =

906c7d690c3b80 PC Liao           2015-12-11  2017  static int dpcm_apply_sy=
mmetry(struct snd_pcm_substream *fe_substream,
906c7d690c3b80 PC Liao           2015-12-11  2018  			       int stream)
906c7d690c3b80 PC Liao           2015-12-11  2019  {
906c7d690c3b80 PC Liao           2015-12-11  2020  	struct snd_soc_dpcm *dp=
cm;
906c7d690c3b80 PC Liao           2015-12-11  2021  	struct snd_soc_pcm_runt=
ime *fe =3D fe_substream->private_data;
19bdcc7aeed416 Shreyas NC        2020-02-25  2022  	struct snd_soc_dai *fe_=
cpu_dai;
906c7d690c3b80 PC Liao           2015-12-11  2023  	int err;
19bdcc7aeed416 Shreyas NC        2020-02-25  2024  	int i;
906c7d690c3b80 PC Liao           2015-12-11  2025  =

906c7d690c3b80 PC Liao           2015-12-11  2026  	/* apply symmetry for F=
E */
906c7d690c3b80 PC Liao           2015-12-11  2027  	if (soc_pcm_has_symmetr=
y(fe_substream))
906c7d690c3b80 PC Liao           2015-12-11  2028  		fe_substream->runtime-=
>hw.info |=3D SNDRV_PCM_INFO_JOINT_DUPLEX;
906c7d690c3b80 PC Liao           2015-12-11  2029  =

19bdcc7aeed416 Shreyas NC        2020-02-25  2030  	for_each_rtd_cpu_dai (f=
e, i, fe_cpu_dai) {
906c7d690c3b80 PC Liao           2015-12-11  2031  		/* Symmetry only appli=
es if we've got an active stream. */
906c7d690c3b80 PC Liao           2015-12-11  2032  		if (fe_cpu_dai->active=
) {
906c7d690c3b80 PC Liao           2015-12-11  2033  			err =3D soc_pcm_apply=
_symmetry(fe_substream, fe_cpu_dai);
906c7d690c3b80 PC Liao           2015-12-11  2034  			if (err < 0)
906c7d690c3b80 PC Liao           2015-12-11  2035  				return err;
906c7d690c3b80 PC Liao           2015-12-11  2036  		}
19bdcc7aeed416 Shreyas NC        2020-02-25  2037  	}
906c7d690c3b80 PC Liao           2015-12-11  2038  =

906c7d690c3b80 PC Liao           2015-12-11  2039  	/* apply symmetry for B=
E */
8d6258a4dd2678 Kuninori Morimoto 2018-09-18  2040  	for_each_dpcm_be(fe, st=
ream, dpcm) {
906c7d690c3b80 PC Liao           2015-12-11  2041  		struct snd_soc_pcm_run=
time *be =3D dpcm->be;
906c7d690c3b80 PC Liao           2015-12-11  2042  		struct snd_pcm_substre=
am *be_substream =3D
906c7d690c3b80 PC Liao           2015-12-11  2043  			snd_soc_dpcm_get_subs=
tream(be, stream);
6246f283d5e02a Jerome Brunet     2019-04-01  2044  		struct snd_soc_pcm_run=
time *rtd;
0b7990e38971da Kuninori Morimoto 2018-09-03  2045  		struct snd_soc_dai *co=
dec_dai;
19bdcc7aeed416 Shreyas NC        2020-02-25  2046  		struct snd_soc_dai *cp=
u_dai;
906c7d690c3b80 PC Liao           2015-12-11 @2047  		int i;
906c7d690c3b80 PC Liao           2015-12-11  2048  =

6246f283d5e02a Jerome Brunet     2019-04-01  2049  		/* A backend may not h=
ave the requested substream */
6246f283d5e02a Jerome Brunet     2019-04-01  2050  		if (!be_substream)
6246f283d5e02a Jerome Brunet     2019-04-01  2051  			continue;
6246f283d5e02a Jerome Brunet     2019-04-01  2052  =

6246f283d5e02a Jerome Brunet     2019-04-01  2053  		rtd =3D be_substream->=
private_data;
f11766143caa06 Jeeja KP          2016-09-06  2054  		if (rtd->dai_link->be_=
hw_params_fixup)
f11766143caa06 Jeeja KP          2016-09-06  2055  			continue;
f11766143caa06 Jeeja KP          2016-09-06  2056  =

906c7d690c3b80 PC Liao           2015-12-11  2057  		if (soc_pcm_has_symmet=
ry(be_substream))
906c7d690c3b80 PC Liao           2015-12-11  2058  			be_substream->runtime=
->hw.info |=3D SNDRV_PCM_INFO_JOINT_DUPLEX;
906c7d690c3b80 PC Liao           2015-12-11  2059  =

906c7d690c3b80 PC Liao           2015-12-11  2060  		/* Symmetry only appli=
es if we've got an active stream. */
19bdcc7aeed416 Shreyas NC        2020-02-25  2061  		for_each_rtd_cpu_dai(r=
td, i, cpu_dai) {
19bdcc7aeed416 Shreyas NC        2020-02-25  2062  			if (cpu_dai->active) {
99bcedbdebc57f Kai Chieh Chuang  2018-05-28  2063  				err =3D soc_pcm_appl=
y_symmetry(fe_substream,
19bdcc7aeed416 Shreyas NC        2020-02-25  2064  							     cpu_dai);
906c7d690c3b80 PC Liao           2015-12-11  2065  				if (err < 0)
906c7d690c3b80 PC Liao           2015-12-11  2066  					return err;
906c7d690c3b80 PC Liao           2015-12-11  2067  			}
19bdcc7aeed416 Shreyas NC        2020-02-25  2068  		}
906c7d690c3b80 PC Liao           2015-12-11  2069  =

0b7990e38971da Kuninori Morimoto 2018-09-03  2070  		for_each_rtd_codec_dai=
(rtd, i, codec_dai) {
0b7990e38971da Kuninori Morimoto 2018-09-03  2071  			if (codec_dai->active=
) {
99bcedbdebc57f Kai Chieh Chuang  2018-05-28  2072  				err =3D soc_pcm_appl=
y_symmetry(fe_substream,
0b7990e38971da Kuninori Morimoto 2018-09-03  2073  							     codec_dai);
906c7d690c3b80 PC Liao           2015-12-11  2074  				if (err < 0)
906c7d690c3b80 PC Liao           2015-12-11  2075  					return err;
906c7d690c3b80 PC Liao           2015-12-11  2076  			}
906c7d690c3b80 PC Liao           2015-12-11  2077  		}
906c7d690c3b80 PC Liao           2015-12-11  2078  	}
906c7d690c3b80 PC Liao           2015-12-11  2079  =

906c7d690c3b80 PC Liao           2015-12-11  2080  	return 0;
906c7d690c3b80 PC Liao           2015-12-11  2081  }
906c7d690c3b80 PC Liao           2015-12-11  2082  =


:::::: The code@line 2047 was first introduced by commit
:::::: 906c7d690c3b80e4321178c083db8c14afb56bf8 ASoC: dpcm: Apply symmetry =
for DPCM

:::::: TO: PC Liao <pc.liao@mediatek.com>
:::::: CC: Mark Brown <broonie@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5188774523083057318==--

