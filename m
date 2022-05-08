Content-Type: multipart/mixed; boundary="===============4517642420127947848=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: sound/soc/qcom/lpass-platform.c:226 __lpass_get_id() error: uninitialized symbol 'id'.
Date: Mon, 09 May 2022 00:05:32 +0800
Message-ID: <202205082317.9Dw0U3zx-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4517642420127947848==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
CC: Mark Brown <broonie@kernel.org>
CC: Venkata Prasad Potturu <quic_potturu@quicinc.com>
CC: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   30c8e80f79329617012f07b09b70114592092ea4
commit: 16413d5c5a2ed81d8fece1c5fe0b85752ecdbdf2 ASoC: qcom: Add helper fun=
ction to get dma control and lpaif handle
date:   2 months ago
:::::: branch date: 22 hours ago
:::::: commit date: 2 months ago
config: openrisc-randconfig-m031-20220506 (https://download.01.org/0day-ci/=
archive/20220508/202205082317.9Dw0U3zx-lkp(a)intel.com/config)
compiler: or1k-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
sound/soc/qcom/lpass-platform.c:226 __lpass_get_id() error: uninitialized s=
ymbol 'id'.

vim +/id +226 sound/soc/qcom/lpass-platform.c

16413d5c5a2ed8 Srinivasa Rao Mandadapu 2022-02-24  202  =

16413d5c5a2ed8 Srinivasa Rao Mandadapu 2022-02-24  203  static int __lpass_=
get_id(const struct snd_pcm_substream *substream,
16413d5c5a2ed8 Srinivasa Rao Mandadapu 2022-02-24  204  				     struct snd=
_soc_component *component)
16413d5c5a2ed8 Srinivasa Rao Mandadapu 2022-02-24  205  {
16413d5c5a2ed8 Srinivasa Rao Mandadapu 2022-02-24  206  	struct snd_soc_pcm=
_runtime *soc_runtime =3D asoc_substream_to_rtd(substream);
16413d5c5a2ed8 Srinivasa Rao Mandadapu 2022-02-24  207  	struct snd_soc_dai=
 *cpu_dai =3D asoc_rtd_to_cpu(soc_runtime, 0);
16413d5c5a2ed8 Srinivasa Rao Mandadapu 2022-02-24  208  	struct lpass_data =
*drvdata =3D snd_soc_component_get_drvdata(component);
16413d5c5a2ed8 Srinivasa Rao Mandadapu 2022-02-24  209  	struct snd_pcm_run=
time *rt =3D substream->runtime;
16413d5c5a2ed8 Srinivasa Rao Mandadapu 2022-02-24  210  	struct lpass_pcm_d=
ata *pcm_data =3D rt->private_data;
16413d5c5a2ed8 Srinivasa Rao Mandadapu 2022-02-24  211  	struct lpass_varia=
nt *v =3D drvdata->variant;
16413d5c5a2ed8 Srinivasa Rao Mandadapu 2022-02-24  212  	int id;
16413d5c5a2ed8 Srinivasa Rao Mandadapu 2022-02-24  213  =

16413d5c5a2ed8 Srinivasa Rao Mandadapu 2022-02-24  214  	switch (cpu_dai->d=
river->id) {
16413d5c5a2ed8 Srinivasa Rao Mandadapu 2022-02-24  215  	case MI2S_PRIMARY =
... MI2S_QUINARY:
16413d5c5a2ed8 Srinivasa Rao Mandadapu 2022-02-24  216  		if (substream->st=
ream =3D=3D SNDRV_PCM_STREAM_PLAYBACK)
16413d5c5a2ed8 Srinivasa Rao Mandadapu 2022-02-24  217  			id =3D pcm_data-=
>dma_ch;
16413d5c5a2ed8 Srinivasa Rao Mandadapu 2022-02-24  218  		else
16413d5c5a2ed8 Srinivasa Rao Mandadapu 2022-02-24  219  			id =3D pcm_data-=
>dma_ch - v->wrdma_channel_start;
16413d5c5a2ed8 Srinivasa Rao Mandadapu 2022-02-24  220  		break;
16413d5c5a2ed8 Srinivasa Rao Mandadapu 2022-02-24  221  	case LPASS_DP_RX:
16413d5c5a2ed8 Srinivasa Rao Mandadapu 2022-02-24  222  		id =3D pcm_data->=
dma_ch;
16413d5c5a2ed8 Srinivasa Rao Mandadapu 2022-02-24  223  		break;
16413d5c5a2ed8 Srinivasa Rao Mandadapu 2022-02-24  224  	}
16413d5c5a2ed8 Srinivasa Rao Mandadapu 2022-02-24  225  =

16413d5c5a2ed8 Srinivasa Rao Mandadapu 2022-02-24 @226  	return id;
16413d5c5a2ed8 Srinivasa Rao Mandadapu 2022-02-24  227  }
16413d5c5a2ed8 Srinivasa Rao Mandadapu 2022-02-24  228  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4517642420127947848==--

