Content-Type: multipart/mixed; boundary="===============8223204393291400193=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c:807 mt8195_dai_link_fixup() error: uninitialized symbol 'runtime'.
Date: Tue, 25 Jan 2022 11:48:20 +0800
Message-ID: <202201251130.VWnp9gOh-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8223204393291400193==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Trevor Wu <trevor.wu@mediatek.com>
CC: Mark Brown <broonie@kernel.org>
CC: YC Hung <yc.hung@mediatek.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   dd81e1c7d5fb126e5fbc5c9e334d7b3ec29a16a0
commit: 3d00d2c07f04f47aa4228700b440ac47abf13853 ASoC: mediatek: mt8195: ad=
d sof support on mt8195-mt6359-rt1019-rt5682
date:   7 weeks ago
:::::: branch date: 2 days ago
:::::: commit date: 7 weeks ago
config: csky-randconfig-m031-20220125 (https://download.01.org/0day-ci/arch=
ive/20220125/202201251130.VWnp9gOh-lkp(a)intel.com/config)
compiler: csky-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c:807 mt8195_dai_link=
_fixup() error: uninitialized symbol 'runtime'.

Old smatch warnings:
sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c:831 mt8195_mt6359_r=
t1019_rt5682_card_late_probe() error: uninitialized symbol 'sof_comp'.

vim +/runtime +807 sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c

3d00d2c07f04f4 Trevor Wu 2021-11-29  769  =

3d00d2c07f04f4 Trevor Wu 2021-11-29  770  /* fixup the BE DAI link to match=
 any values from topology */
3d00d2c07f04f4 Trevor Wu 2021-11-29  771  static int mt8195_dai_link_fixup(=
struct snd_soc_pcm_runtime *rtd,
3d00d2c07f04f4 Trevor Wu 2021-11-29  772  				 struct snd_pcm_hw_params *pa=
rams)
3d00d2c07f04f4 Trevor Wu 2021-11-29  773  {
3d00d2c07f04f4 Trevor Wu 2021-11-29  774  	struct snd_soc_card *card =3D rt=
d->card;
3d00d2c07f04f4 Trevor Wu 2021-11-29  775  	struct snd_soc_dai_link *sof_dai=
_link =3D NULL;
3d00d2c07f04f4 Trevor Wu 2021-11-29  776  	struct snd_soc_pcm_runtime *runt=
ime;
3d00d2c07f04f4 Trevor Wu 2021-11-29  777  	struct snd_soc_dai *cpu_dai;
3d00d2c07f04f4 Trevor Wu 2021-11-29  778  	int i, j, ret =3D 0;
3d00d2c07f04f4 Trevor Wu 2021-11-29  779  =

3d00d2c07f04f4 Trevor Wu 2021-11-29  780  	for (i =3D 0; i < ARRAY_SIZE(g_s=
of_conn_streams); i++) {
3d00d2c07f04f4 Trevor Wu 2021-11-29  781  		const struct sof_conn_stream *c=
onn =3D &g_sof_conn_streams[i];
3d00d2c07f04f4 Trevor Wu 2021-11-29  782  =

3d00d2c07f04f4 Trevor Wu 2021-11-29  783  		if (strcmp(rtd->dai_link->name,=
 conn->normal_link))
3d00d2c07f04f4 Trevor Wu 2021-11-29  784  			continue;
3d00d2c07f04f4 Trevor Wu 2021-11-29  785  =

3d00d2c07f04f4 Trevor Wu 2021-11-29  786  		for_each_card_rtds(card, runtim=
e) {
3d00d2c07f04f4 Trevor Wu 2021-11-29  787  			if (strcmp(runtime->dai_link->=
name, conn->sof_link))
3d00d2c07f04f4 Trevor Wu 2021-11-29  788  				continue;
3d00d2c07f04f4 Trevor Wu 2021-11-29  789  =

3d00d2c07f04f4 Trevor Wu 2021-11-29  790  			for_each_rtd_cpu_dais(runtime,=
 j, cpu_dai) {
3d00d2c07f04f4 Trevor Wu 2021-11-29  791  				if (cpu_dai->stream_active[co=
nn->stream_dir] > 0) {
3d00d2c07f04f4 Trevor Wu 2021-11-29  792  					sof_dai_link =3D runtime->da=
i_link;
3d00d2c07f04f4 Trevor Wu 2021-11-29  793  					break;
3d00d2c07f04f4 Trevor Wu 2021-11-29  794  				}
3d00d2c07f04f4 Trevor Wu 2021-11-29  795  			}
3d00d2c07f04f4 Trevor Wu 2021-11-29  796  			break;
3d00d2c07f04f4 Trevor Wu 2021-11-29  797  		}
3d00d2c07f04f4 Trevor Wu 2021-11-29  798  =

3d00d2c07f04f4 Trevor Wu 2021-11-29  799  		if (sof_dai_link && sof_dai_lin=
k->be_hw_params_fixup)
3d00d2c07f04f4 Trevor Wu 2021-11-29  800  			ret =3D sof_dai_link->be_hw_pa=
rams_fixup(runtime, params);
3d00d2c07f04f4 Trevor Wu 2021-11-29  801  =

3d00d2c07f04f4 Trevor Wu 2021-11-29  802  		break;
3d00d2c07f04f4 Trevor Wu 2021-11-29  803  	}
3d00d2c07f04f4 Trevor Wu 2021-11-29  804  =

3d00d2c07f04f4 Trevor Wu 2021-11-29  805  	if (!strcmp(rtd->dai_link->name,=
 "ETDM2_IN_BE") ||
3d00d2c07f04f4 Trevor Wu 2021-11-29  806  	    !strcmp(rtd->dai_link->name,=
 "ETDM1_OUT_BE")) {
3d00d2c07f04f4 Trevor Wu 2021-11-29 @807  		mt8195_etdm_hw_params_fixup(run=
time, params);
3d00d2c07f04f4 Trevor Wu 2021-11-29  808  	}
3d00d2c07f04f4 Trevor Wu 2021-11-29  809  =

3d00d2c07f04f4 Trevor Wu 2021-11-29  810  	return ret;
3d00d2c07f04f4 Trevor Wu 2021-11-29  811  }
3d00d2c07f04f4 Trevor Wu 2021-11-29  812  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8223204393291400193==--

