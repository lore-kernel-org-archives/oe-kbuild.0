Content-Type: multipart/mixed; boundary="===============5794646593138204675=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] ASoC: soc-compress: prevent the potentially use of null pointer
Date: Thu, 14 Oct 2021 10:51:14 +0800
Message-ID: <202110141045.aqHVHzRI-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5794646593138204675==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <1634116664-1784856-1-git-send-email-jiasheng@iscas.ac.cn>
References: <1634116664-1784856-1-git-send-email-jiasheng@iscas.ac.cn>
TO: Jiasheng Jiang <jiasheng@iscas.ac.cn>
TO: vkoul(a)kernel.org
TO: lgirdwood(a)gmail.com
TO: broonie(a)kernel.org
TO: perex(a)perex.cz
TO: tiwai(a)suse.com
TO: alsa-devel(a)alsa-project.org
CC: linux-kernel(a)vger.kernel.org
CC: Jiasheng Jiang <jiasheng@iscas.ac.cn>

Hi Jiasheng,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on tiwai-sound/for-next]
[also build test WARNING on vkoul-dmaengine/next broonie-sound/for-next v5.=
15-rc5 next-20211013]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Jiasheng-Jiang/ASoC-soc-co=
mpress-prevent-the-potentially-use-of-null-pointer/20211013-172002
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for=
-next
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: i386-randconfig-m021-20211013 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
sound/soc/soc-compress.c:595 snd_soc_new_compress() error: we previously as=
sumed 'codec_dai' could be null (see line 538)

vim +/codec_dai +595 sound/soc/soc-compress.c

2a99ef0fdb35a0 Liam Girdwood      2014-01-17  502  =

6f0c42269f000b Jie Yang           2015-10-13  503  /**
6f0c42269f000b Jie Yang           2015-10-13  504   * snd_soc_new_compress =
- create a new compress.
6f0c42269f000b Jie Yang           2015-10-13  505   *
6f0c42269f000b Jie Yang           2015-10-13  506   * @rtd: The runtime for=
 which we will create compress
6f0c42269f000b Jie Yang           2015-10-13  507   * @num: the device inde=
x number (zero based - shared with normal PCMs)
6f0c42269f000b Jie Yang           2015-10-13  508   *
6f0c42269f000b Jie Yang           2015-10-13  509   * Return: 0 for success=
, else error.
6f0c42269f000b Jie Yang           2015-10-13  510   */
6f0c42269f000b Jie Yang           2015-10-13  511  int snd_soc_new_compress=
(struct snd_soc_pcm_runtime *rtd, int num)
1245b7005de02d Namarta Kohli      2012-08-16  512  {
9e7e3738ab0e90 Kuninori Morimoto  2017-10-11  513  	struct snd_soc_componen=
t *component;
c2233a266178f8 Kuninori Morimoto  2020-03-30  514  	struct snd_soc_dai *cod=
ec_dai =3D asoc_rtd_to_codec(rtd, 0);
c2233a266178f8 Kuninori Morimoto  2020-03-30  515  	struct snd_soc_dai *cpu=
_dai =3D asoc_rtd_to_cpu(rtd, 0);
1245b7005de02d Namarta Kohli      2012-08-16  516  	struct snd_compr *compr;
2a99ef0fdb35a0 Liam Girdwood      2014-01-17  517  	struct snd_pcm *be_pcm;
1245b7005de02d Namarta Kohli      2012-08-16  518  	char new_name[64];
1245b7005de02d Namarta Kohli      2012-08-16  519  	int ret =3D 0, directio=
n =3D 0;
a1068045883ed4 Vinod Koul         2016-01-07  520  	int playback =3D 0, cap=
ture =3D 0;
613fb50059cf19 Kuninori Morimoto  2020-01-10  521  	int i;
1245b7005de02d Namarta Kohli      2012-08-16  522  =

7428d8c8bd7936 Kuninori Morimoto  2020-10-30  523  	/*
7428d8c8bd7936 Kuninori Morimoto  2020-10-30  524  	 * make sure these are =
same value,
7428d8c8bd7936 Kuninori Morimoto  2020-10-30  525  	 * and then use these a=
s equally
7428d8c8bd7936 Kuninori Morimoto  2020-10-30  526  	 */
7428d8c8bd7936 Kuninori Morimoto  2020-10-30  527  	BUILD_BUG_ON((int)SNDRV=
_PCM_STREAM_PLAYBACK !=3D (int)SND_COMPRESS_PLAYBACK);
7428d8c8bd7936 Kuninori Morimoto  2020-10-30  528  	BUILD_BUG_ON((int)SNDRV=
_PCM_STREAM_CAPTURE  !=3D (int)SND_COMPRESS_CAPTURE);
7428d8c8bd7936 Kuninori Morimoto  2020-10-30  529  =

6e1276a5e613d2 Bard Liao          2020-02-25  530  	if (rtd->num_cpus > 1 ||
6e1276a5e613d2 Bard Liao          2020-02-25  531  	    rtd->num_codecs > 1=
) {
141dfc9e3751f5 Charles Keepax     2018-01-26  532  		dev_err(rtd->card->dev,
6e1276a5e613d2 Bard Liao          2020-02-25  533  			"Compress ASoC: Multi=
 CPU/Codec not supported\n");
8151d5e60232d3 Benoit Cousson     2014-07-08  534  		return -EINVAL;
8151d5e60232d3 Benoit Cousson     2014-07-08  535  	}
8151d5e60232d3 Benoit Cousson     2014-07-08  536  =

1245b7005de02d Namarta Kohli      2012-08-16  537  	/* check client and int=
erface hw capabilities */
87e5451ef9ec85 Jiasheng Jiang     2021-10-13 @538  	if (codec_dai && cpu_da=
i) {
467fece8fbc677 Kuninori Morimoto  2019-07-22  539  		if (snd_soc_dai_stream=
_valid(codec_dai, SNDRV_PCM_STREAM_PLAYBACK) &&
467fece8fbc677 Kuninori Morimoto  2019-07-22  540  		    snd_soc_dai_stream=
_valid(cpu_dai,   SNDRV_PCM_STREAM_PLAYBACK))
a1068045883ed4 Vinod Koul         2016-01-07  541  			playback =3D 1;
467fece8fbc677 Kuninori Morimoto  2019-07-22  542  		if (snd_soc_dai_stream=
_valid(codec_dai, SNDRV_PCM_STREAM_CAPTURE) &&
467fece8fbc677 Kuninori Morimoto  2019-07-22  543  		    snd_soc_dai_stream=
_valid(cpu_dai,   SNDRV_PCM_STREAM_CAPTURE))
a1068045883ed4 Vinod Koul         2016-01-07  544  			capture =3D 1;
87e5451ef9ec85 Jiasheng Jiang     2021-10-13  545  	}
a1068045883ed4 Vinod Koul         2016-01-07  546  =

a1068045883ed4 Vinod Koul         2016-01-07  547  	/*
a1068045883ed4 Vinod Koul         2016-01-07  548  	 * Compress devices are=
 unidirectional so only one of the directions
a1068045883ed4 Vinod Koul         2016-01-07  549  	 * should be set, check=
 for that (xor)
a1068045883ed4 Vinod Koul         2016-01-07  550  	 */
a1068045883ed4 Vinod Koul         2016-01-07  551  	if (playback + capture =
!=3D 1) {
141dfc9e3751f5 Charles Keepax     2018-01-26  552  		dev_err(rtd->card->dev,
141dfc9e3751f5 Charles Keepax     2018-01-26  553  			"Compress ASoC: Inval=
id direction for P %d, C %d\n",
a1068045883ed4 Vinod Koul         2016-01-07  554  			playback, capture);
a1068045883ed4 Vinod Koul         2016-01-07  555  		return -EINVAL;
a1068045883ed4 Vinod Koul         2016-01-07  556  	}
a1068045883ed4 Vinod Koul         2016-01-07  557  =

a1068045883ed4 Vinod Koul         2016-01-07  558  	if (playback)
1245b7005de02d Namarta Kohli      2012-08-16  559  		direction =3D SND_COMP=
RESS_PLAYBACK;
daa2db59ce7e36 Charles Keepax     2013-04-18  560  	else
a1068045883ed4 Vinod Koul         2016-01-07  561  		direction =3D SND_COMP=
RESS_CAPTURE;
daa2db59ce7e36 Charles Keepax     2013-04-18  562  =

09f448a415ece4 Amadeusz S=C5=82awi=C5=84ski 2019-06-17  563  	compr =3D dev=
m_kzalloc(rtd->card->dev, sizeof(*compr), GFP_KERNEL);
7a0cf42edd9cc3 Markus Elfring     2017-08-10  564  	if (!compr)
1245b7005de02d Namarta Kohli      2012-08-16  565  		return -ENOMEM;
1245b7005de02d Namarta Kohli      2012-08-16  566  =

1f88eb0f0660f8 Charles Keepax     2013-02-05  567  	compr->ops =3D devm_kza=
lloc(rtd->card->dev, sizeof(soc_compr_ops),
1f88eb0f0660f8 Charles Keepax     2013-02-05  568  				  GFP_KERNEL);
09f448a415ece4 Amadeusz S=C5=82awi=C5=84ski 2019-06-17  569  	if (!compr->o=
ps)
09f448a415ece4 Amadeusz S=C5=82awi=C5=84ski 2019-06-17  570  		return -ENOM=
EM;
2a99ef0fdb35a0 Liam Girdwood      2014-01-17  571  =

2a99ef0fdb35a0 Liam Girdwood      2014-01-17  572  	if (rtd->dai_link->dyna=
mic) {
2a99ef0fdb35a0 Liam Girdwood      2014-01-17  573  		snprintf(new_name, siz=
eof(new_name), "(%s)",
2a99ef0fdb35a0 Liam Girdwood      2014-01-17  574  			rtd->dai_link->stream=
_name);
2a99ef0fdb35a0 Liam Girdwood      2014-01-17  575  =

2a99ef0fdb35a0 Liam Girdwood      2014-01-17  576  		ret =3D snd_pcm_new_in=
ternal(rtd->card->snd_card, new_name, num,
d3268a40d4b19f Qais Yousef        2015-01-14  577  				rtd->dai_link->dpcm_=
playback,
d3268a40d4b19f Qais Yousef        2015-01-14  578  				rtd->dai_link->dpcm_=
capture, &be_pcm);
2a99ef0fdb35a0 Liam Girdwood      2014-01-17  579  		if (ret < 0) {
141dfc9e3751f5 Charles Keepax     2018-01-26  580  			dev_err(rtd->card->de=
v,
141dfc9e3751f5 Charles Keepax     2018-01-26  581  				"Compress ASoC: can'=
t create compressed for %s: %d\n",
141dfc9e3751f5 Charles Keepax     2018-01-26  582  				rtd->dai_link->name,=
 ret);
09f448a415ece4 Amadeusz S=C5=82awi=C5=84ski 2019-06-17  583  			return ret;
2a99ef0fdb35a0 Liam Girdwood      2014-01-17  584  		}
2a99ef0fdb35a0 Liam Girdwood      2014-01-17  585  =

2a99ef0fdb35a0 Liam Girdwood      2014-01-17  586  		rtd->pcm =3D be_pcm;
2a99ef0fdb35a0 Liam Girdwood      2014-01-17  587  		rtd->fe_compr =3D 1;
d3268a40d4b19f Qais Yousef        2015-01-14  588  		if (rtd->dai_link->dpc=
m_playback)
2a99ef0fdb35a0 Liam Girdwood      2014-01-17  589  			be_pcm->streams[SNDRV=
_PCM_STREAM_PLAYBACK].substream->private_data =3D rtd;
d3268a40d4b19f Qais Yousef        2015-01-14  590  		else if (rtd->dai_link=
->dpcm_capture)
2a99ef0fdb35a0 Liam Girdwood      2014-01-17  591  			be_pcm->streams[SNDRV=
_PCM_STREAM_CAPTURE].substream->private_data =3D rtd;
2a99ef0fdb35a0 Liam Girdwood      2014-01-17  592  		memcpy(compr->ops, &so=
c_compr_dyn_ops, sizeof(soc_compr_dyn_ops));
aeb6fa0f15c71a Peng Donglin       2017-08-16  593  	} else {
aeb6fa0f15c71a Peng Donglin       2017-08-16  594  		snprintf(new_name, siz=
eof(new_name), "%s %s-%d",
aeb6fa0f15c71a Peng Donglin       2017-08-16 @595  			rtd->dai_link->stream=
_name, codec_dai->name, num);

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============5794646593138204675==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
3W6emCQCAA==
--===============5794646593138204675==--

