Content-Type: multipart/mixed; boundary="===============7870756359435529057=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [RESEND v13 07/10] ASoC: qcom: Add support for codec dma driver
Date: Tue, 15 Feb 2022 10:31:26 +0800
Message-ID: <202202151059.hEuYfkLa-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7870756359435529057==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <1644850708-11099-8-git-send-email-quic_srivasam@quicinc.com>
References: <1644850708-11099-8-git-send-email-quic_srivasam@quicinc.com>
TO: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
TO: agross(a)kernel.org
TO: bjorn.andersson(a)linaro.org
TO: lgirdwood(a)gmail.com
TO: broonie(a)kernel.org
TO: robh+dt(a)kernel.org
TO: quic_plai(a)quicinc.com
TO: bgoswami(a)codeaurora.org
TO: perex(a)perex.cz
TO: tiwai(a)suse.com
TO: srinivas.kandagatla(a)linaro.org
TO: rohitkr(a)codeaurora.org
TO: linux-arm-msm(a)vger.kernel.org
TO: alsa-devel(a)alsa-project.org
TO: devicetree(a)vger.kernel.org
TO: linux-kernel(a)vger.kernel.org
TO: swboyd(a)chromium.org
TO: judyhsiao(a)chromium.org
CC: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
CC: Venkata Prasad Potturu <quic_potturu@quicinc.com>

Hi Srinivasa,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on v5.17-rc4 next-20220214]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Srinivasa-Rao-Mandadapu/Ad=
d-support-for-audio-on-SC7280-based-targets/20220214-230256
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git f=
or-next
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: m68k-randconfig-m031-20220214 (https://download.01.org/0day-ci/arch=
ive/20220215/202202151059.hEuYfkLa-lkp(a)intel.com/config)
compiler: m68k-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
sound/soc/qcom/lpass-platform.c:1233 lpass_platform_copy() warn: maybe retu=
rn -EFAULT instead of the bytes remaining?

vim +1233 sound/soc/qcom/lpass-platform.c

8d1bfc04c97407 Srinivasa Rao Mandadapu 2020-12-17  1209  =

e81c7e5d842d2b Srinivasa Rao Mandadapu 2022-02-14  1210  static int lpass_p=
latform_copy(struct snd_soc_component *component,
e81c7e5d842d2b Srinivasa Rao Mandadapu 2022-02-14  1211  			       struct s=
nd_pcm_substream *substream, int channel,
e81c7e5d842d2b Srinivasa Rao Mandadapu 2022-02-14  1212  			       unsigned=
 long pos, void __user *buf, unsigned long bytes)
e81c7e5d842d2b Srinivasa Rao Mandadapu 2022-02-14  1213  {
e81c7e5d842d2b Srinivasa Rao Mandadapu 2022-02-14  1214  	struct snd_pcm_ru=
ntime *rt =3D substream->runtime;
e81c7e5d842d2b Srinivasa Rao Mandadapu 2022-02-14  1215  	unsigned int dai_=
id =3D component->id;
e81c7e5d842d2b Srinivasa Rao Mandadapu 2022-02-14  1216  	int ret =3D 0;
e81c7e5d842d2b Srinivasa Rao Mandadapu 2022-02-14  1217  =

e81c7e5d842d2b Srinivasa Rao Mandadapu 2022-02-14  1218  	void __iomem *dma=
_buf =3D rt->dma_area + pos +
e81c7e5d842d2b Srinivasa Rao Mandadapu 2022-02-14  1219  				channel * (rt-=
>dma_bytes / rt->channels);
e81c7e5d842d2b Srinivasa Rao Mandadapu 2022-02-14  1220  =

e81c7e5d842d2b Srinivasa Rao Mandadapu 2022-02-14  1221  	if (substream->st=
ream =3D=3D SNDRV_PCM_STREAM_PLAYBACK) {
e81c7e5d842d2b Srinivasa Rao Mandadapu 2022-02-14  1222  		if (is_cdc_dma_p=
ort(dai_id))
e81c7e5d842d2b Srinivasa Rao Mandadapu 2022-02-14  1223  			ret =3D copy_fr=
om_user_toio(dma_buf, buf, bytes);
e81c7e5d842d2b Srinivasa Rao Mandadapu 2022-02-14  1224  		else
e81c7e5d842d2b Srinivasa Rao Mandadapu 2022-02-14  1225  			ret =3D copy_fr=
om_user((void __force *)dma_buf, buf, bytes);
e81c7e5d842d2b Srinivasa Rao Mandadapu 2022-02-14  1226  	} else if (substr=
eam->stream =3D=3D SNDRV_PCM_STREAM_CAPTURE) {
e81c7e5d842d2b Srinivasa Rao Mandadapu 2022-02-14  1227  		if (is_cdc_dma_p=
ort(dai_id))
e81c7e5d842d2b Srinivasa Rao Mandadapu 2022-02-14  1228  			ret =3D copy_to=
_user_fromio(buf, dma_buf, bytes);
e81c7e5d842d2b Srinivasa Rao Mandadapu 2022-02-14  1229  		else
e81c7e5d842d2b Srinivasa Rao Mandadapu 2022-02-14  1230  			ret =3D copy_to=
_user(buf, (void __force *)dma_buf, bytes);
e81c7e5d842d2b Srinivasa Rao Mandadapu 2022-02-14  1231  	}
e81c7e5d842d2b Srinivasa Rao Mandadapu 2022-02-14  1232  =

e81c7e5d842d2b Srinivasa Rao Mandadapu 2022-02-14 @1233  	return ret;
e81c7e5d842d2b Srinivasa Rao Mandadapu 2022-02-14  1234  }
8d1bfc04c97407 Srinivasa Rao Mandadapu 2020-12-17  1235  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7870756359435529057==--

