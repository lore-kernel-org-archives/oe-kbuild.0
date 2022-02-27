Content-Type: multipart/mixed; boundary="===============2325210930321182336=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 8231/9128] sound/soc/qcom/lpass-platform.c:226 __lpass_get_id() error: uninitialized symbol 'id'.
Date: Sun, 27 Feb 2022 13:36:53 +0800
Message-ID: <202202271309.mCrlCccf-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2325210930321182336==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
CC: Mark Brown <broonie@kernel.org>
CC: Venkata Prasad Potturu <quic_potturu@quicinc.com>
CC: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   06aeb1495c39c86ccfaf1adadc1d2200179f16eb
commit: 16413d5c5a2ed81d8fece1c5fe0b85752ecdbdf2 [8231/9128] ASoC: qcom: Ad=
d helper function to get dma control and lpaif handle
:::::: branch date: 28 hours ago
:::::: commit date: 2 days ago
config: m68k-randconfig-m031-20220227 (https://download.01.org/0day-ci/arch=
ive/20220227/202202271309.mCrlCccf-lkp(a)intel.com/config)
compiler: m68k-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
sound/soc/qcom/lpass-platform.c:226 __lpass_get_id() error: uninitialized s=
ymbol 'id'.

vim +/id +226 sound/soc/qcom/lpass-platform.c

16413d5c5a2ed81 Srinivasa Rao Mandadapu 2022-02-24  202  =

16413d5c5a2ed81 Srinivasa Rao Mandadapu 2022-02-24  203  static int __lpass=
_get_id(const struct snd_pcm_substream *substream,
16413d5c5a2ed81 Srinivasa Rao Mandadapu 2022-02-24  204  				     struct sn=
d_soc_component *component)
16413d5c5a2ed81 Srinivasa Rao Mandadapu 2022-02-24  205  {
16413d5c5a2ed81 Srinivasa Rao Mandadapu 2022-02-24  206  	struct snd_soc_pc=
m_runtime *soc_runtime =3D asoc_substream_to_rtd(substream);
16413d5c5a2ed81 Srinivasa Rao Mandadapu 2022-02-24  207  	struct snd_soc_da=
i *cpu_dai =3D asoc_rtd_to_cpu(soc_runtime, 0);
16413d5c5a2ed81 Srinivasa Rao Mandadapu 2022-02-24  208  	struct lpass_data=
 *drvdata =3D snd_soc_component_get_drvdata(component);
16413d5c5a2ed81 Srinivasa Rao Mandadapu 2022-02-24  209  	struct snd_pcm_ru=
ntime *rt =3D substream->runtime;
16413d5c5a2ed81 Srinivasa Rao Mandadapu 2022-02-24  210  	struct lpass_pcm_=
data *pcm_data =3D rt->private_data;
16413d5c5a2ed81 Srinivasa Rao Mandadapu 2022-02-24  211  	struct lpass_vari=
ant *v =3D drvdata->variant;
16413d5c5a2ed81 Srinivasa Rao Mandadapu 2022-02-24  212  	int id;
16413d5c5a2ed81 Srinivasa Rao Mandadapu 2022-02-24  213  =

16413d5c5a2ed81 Srinivasa Rao Mandadapu 2022-02-24  214  	switch (cpu_dai->=
driver->id) {
16413d5c5a2ed81 Srinivasa Rao Mandadapu 2022-02-24  215  	case MI2S_PRIMARY=
 ... MI2S_QUINARY:
16413d5c5a2ed81 Srinivasa Rao Mandadapu 2022-02-24  216  		if (substream->s=
tream =3D=3D SNDRV_PCM_STREAM_PLAYBACK)
16413d5c5a2ed81 Srinivasa Rao Mandadapu 2022-02-24  217  			id =3D pcm_data=
->dma_ch;
16413d5c5a2ed81 Srinivasa Rao Mandadapu 2022-02-24  218  		else
16413d5c5a2ed81 Srinivasa Rao Mandadapu 2022-02-24  219  			id =3D pcm_data=
->dma_ch - v->wrdma_channel_start;
16413d5c5a2ed81 Srinivasa Rao Mandadapu 2022-02-24  220  		break;
16413d5c5a2ed81 Srinivasa Rao Mandadapu 2022-02-24  221  	case LPASS_DP_RX:
16413d5c5a2ed81 Srinivasa Rao Mandadapu 2022-02-24  222  		id =3D pcm_data-=
>dma_ch;
16413d5c5a2ed81 Srinivasa Rao Mandadapu 2022-02-24  223  		break;
16413d5c5a2ed81 Srinivasa Rao Mandadapu 2022-02-24  224  	}
16413d5c5a2ed81 Srinivasa Rao Mandadapu 2022-02-24  225  =

16413d5c5a2ed81 Srinivasa Rao Mandadapu 2022-02-24 @226  	return id;
16413d5c5a2ed81 Srinivasa Rao Mandadapu 2022-02-24  227  }
16413d5c5a2ed81 Srinivasa Rao Mandadapu 2022-02-24  228  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2325210930321182336==--

