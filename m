Content-Type: multipart/mixed; boundary="===============6677483226334902456=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 9388/11353] sound/soc/soc-compress.c:628 snd_soc_new_compress() error: we previously assumed 'codec_dai' could be null (see line 571)
Date: Wed, 09 Mar 2022 01:21:57 +0800
Message-ID: <202203090151.tminQHFc-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6677483226334902456==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Jiasheng Jiang <jiasheng@iscas.ac.cn>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   cb153b68ff91cbc434f3de70ac549e110543e1bb
commit: de2c6f98817fa5decb9b7d3b3a8a3ab864c10588 [9388/11353] ASoC: soc-com=
press: prevent the potentially use of null pointer
:::::: branch date: 9 hours ago
:::::: commit date: 6 days ago
config: m68k-randconfig-m031-20220302 (https://download.01.org/0day-ci/arch=
ive/20220309/202203090151.tminQHFc-lkp(a)intel.com/config)
compiler: m68k-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
sound/soc/soc-compress.c:628 snd_soc_new_compress() error: we previously as=
sumed 'codec_dai' could be null (see line 571)

vim +/codec_dai +628 sound/soc/soc-compress.c

2a99ef0fdb35a0f Liam Girdwood      2014-01-17  535  =

6f0c42269f000b1 Jie Yang           2015-10-13  536  /**
6f0c42269f000b1 Jie Yang           2015-10-13  537   * snd_soc_new_compress=
 - create a new compress.
6f0c42269f000b1 Jie Yang           2015-10-13  538   *
6f0c42269f000b1 Jie Yang           2015-10-13  539   * @rtd: The runtime fo=
r which we will create compress
6f0c42269f000b1 Jie Yang           2015-10-13  540   * @num: the device ind=
ex number (zero based - shared with normal PCMs)
6f0c42269f000b1 Jie Yang           2015-10-13  541   *
6f0c42269f000b1 Jie Yang           2015-10-13  542   * Return: 0 for succes=
s, else error.
6f0c42269f000b1 Jie Yang           2015-10-13  543   */
6f0c42269f000b1 Jie Yang           2015-10-13  544  int snd_soc_new_compres=
s(struct snd_soc_pcm_runtime *rtd, int num)
1245b7005de02d5 Namarta Kohli      2012-08-16  545  {
9e7e3738ab0e908 Kuninori Morimoto  2017-10-11  546  	struct snd_soc_compone=
nt *component;
c2233a266178f89 Kuninori Morimoto  2020-03-30  547  	struct snd_soc_dai *co=
dec_dai =3D asoc_rtd_to_codec(rtd, 0);
c2233a266178f89 Kuninori Morimoto  2020-03-30  548  	struct snd_soc_dai *cp=
u_dai =3D asoc_rtd_to_cpu(rtd, 0);
1245b7005de02d5 Namarta Kohli      2012-08-16  549  	struct snd_compr *comp=
r;
2a99ef0fdb35a0f Liam Girdwood      2014-01-17  550  	struct snd_pcm *be_pcm;
1245b7005de02d5 Namarta Kohli      2012-08-16  551  	char new_name[64];
1245b7005de02d5 Namarta Kohli      2012-08-16  552  	int ret =3D 0, directi=
on =3D 0;
a1068045883ed4a Vinod Koul         2016-01-07  553  	int playback =3D 0, ca=
pture =3D 0;
613fb50059cf19a Kuninori Morimoto  2020-01-10  554  	int i;
1245b7005de02d5 Namarta Kohli      2012-08-16  555  =

7428d8c8bd79368 Kuninori Morimoto  2020-10-30  556  	/*
7428d8c8bd79368 Kuninori Morimoto  2020-10-30  557  	 * make sure these are=
 same value,
7428d8c8bd79368 Kuninori Morimoto  2020-10-30  558  	 * and then use these =
as equally
7428d8c8bd79368 Kuninori Morimoto  2020-10-30  559  	 */
7428d8c8bd79368 Kuninori Morimoto  2020-10-30  560  	BUILD_BUG_ON((int)SNDR=
V_PCM_STREAM_PLAYBACK !=3D (int)SND_COMPRESS_PLAYBACK);
7428d8c8bd79368 Kuninori Morimoto  2020-10-30  561  	BUILD_BUG_ON((int)SNDR=
V_PCM_STREAM_CAPTURE  !=3D (int)SND_COMPRESS_CAPTURE);
7428d8c8bd79368 Kuninori Morimoto  2020-10-30  562  =

6e1276a5e613d25 Bard Liao          2020-02-25  563  	if (rtd->num_cpus > 1 =
||
6e1276a5e613d25 Bard Liao          2020-02-25  564  	    rtd->num_codecs > =
1) {
141dfc9e3751f5f Charles Keepax     2018-01-26  565  		dev_err(rtd->card->de=
v,
6e1276a5e613d25 Bard Liao          2020-02-25  566  			"Compress ASoC: Mult=
i CPU/Codec not supported\n");
8151d5e60232d31 Benoit Cousson     2014-07-08  567  		return -EINVAL;
8151d5e60232d31 Benoit Cousson     2014-07-08  568  	}
8151d5e60232d31 Benoit Cousson     2014-07-08  569  =

1245b7005de02d5 Namarta Kohli      2012-08-16  570  	/* check client and in=
terface hw capabilities */
de2c6f98817fa5d Jiasheng Jiang     2021-10-15 @571  	if (codec_dai) {
467fece8fbc6774 Kuninori Morimoto  2019-07-22  572  		if (snd_soc_dai_strea=
m_valid(codec_dai, SNDRV_PCM_STREAM_PLAYBACK) &&
467fece8fbc6774 Kuninori Morimoto  2019-07-22  573  		    snd_soc_dai_strea=
m_valid(cpu_dai,   SNDRV_PCM_STREAM_PLAYBACK))
a1068045883ed4a Vinod Koul         2016-01-07  574  			playback =3D 1;
467fece8fbc6774 Kuninori Morimoto  2019-07-22  575  		if (snd_soc_dai_strea=
m_valid(codec_dai, SNDRV_PCM_STREAM_CAPTURE) &&
467fece8fbc6774 Kuninori Morimoto  2019-07-22  576  		    snd_soc_dai_strea=
m_valid(cpu_dai,   SNDRV_PCM_STREAM_CAPTURE))
a1068045883ed4a Vinod Koul         2016-01-07  577  			capture =3D 1;
de2c6f98817fa5d Jiasheng Jiang     2021-10-15  578  	}
a1068045883ed4a Vinod Koul         2016-01-07  579  =

a1068045883ed4a Vinod Koul         2016-01-07  580  	/*
a1068045883ed4a Vinod Koul         2016-01-07  581  	 * Compress devices ar=
e unidirectional so only one of the directions
a1068045883ed4a Vinod Koul         2016-01-07  582  	 * should be set, chec=
k for that (xor)
a1068045883ed4a Vinod Koul         2016-01-07  583  	 */
a1068045883ed4a Vinod Koul         2016-01-07  584  	if (playback + capture=
 !=3D 1) {
141dfc9e3751f5f Charles Keepax     2018-01-26  585  		dev_err(rtd->card->de=
v,
141dfc9e3751f5f Charles Keepax     2018-01-26  586  			"Compress ASoC: Inva=
lid direction for P %d, C %d\n",
a1068045883ed4a Vinod Koul         2016-01-07  587  			playback, capture);
a1068045883ed4a Vinod Koul         2016-01-07  588  		return -EINVAL;
a1068045883ed4a Vinod Koul         2016-01-07  589  	}
a1068045883ed4a Vinod Koul         2016-01-07  590  =

a1068045883ed4a Vinod Koul         2016-01-07  591  	if (playback)
1245b7005de02d5 Namarta Kohli      2012-08-16  592  		direction =3D SND_COM=
PRESS_PLAYBACK;
daa2db59ce7e360 Charles Keepax     2013-04-18  593  	else
a1068045883ed4a Vinod Koul         2016-01-07  594  		direction =3D SND_COM=
PRESS_CAPTURE;
daa2db59ce7e360 Charles Keepax     2013-04-18  595  =

09f448a415ece49 Amadeusz S=C5=82awi=C5=84ski 2019-06-17  596  	compr =3D de=
vm_kzalloc(rtd->card->dev, sizeof(*compr), GFP_KERNEL);
7a0cf42edd9cc33 Markus Elfring     2017-08-10  597  	if (!compr)
1245b7005de02d5 Namarta Kohli      2012-08-16  598  		return -ENOMEM;
1245b7005de02d5 Namarta Kohli      2012-08-16  599  =

1f88eb0f0660f8b Charles Keepax     2013-02-05  600  	compr->ops =3D devm_kz=
alloc(rtd->card->dev, sizeof(soc_compr_ops),
1f88eb0f0660f8b Charles Keepax     2013-02-05  601  				  GFP_KERNEL);
09f448a415ece49 Amadeusz S=C5=82awi=C5=84ski 2019-06-17  602  	if (!compr->=
ops)
09f448a415ece49 Amadeusz S=C5=82awi=C5=84ski 2019-06-17  603  		return -ENO=
MEM;
2a99ef0fdb35a0f Liam Girdwood      2014-01-17  604  =

2a99ef0fdb35a0f Liam Girdwood      2014-01-17  605  	if (rtd->dai_link->dyn=
amic) {
2a99ef0fdb35a0f Liam Girdwood      2014-01-17  606  		snprintf(new_name, si=
zeof(new_name), "(%s)",
2a99ef0fdb35a0f Liam Girdwood      2014-01-17  607  			rtd->dai_link->strea=
m_name);
2a99ef0fdb35a0f Liam Girdwood      2014-01-17  608  =

2a99ef0fdb35a0f Liam Girdwood      2014-01-17  609  		ret =3D snd_pcm_new_i=
nternal(rtd->card->snd_card, new_name, num,
d3268a40d4b19ff Qais Yousef        2015-01-14  610  				rtd->dai_link->dpcm=
_playback,
d3268a40d4b19ff Qais Yousef        2015-01-14  611  				rtd->dai_link->dpcm=
_capture, &be_pcm);
2a99ef0fdb35a0f Liam Girdwood      2014-01-17  612  		if (ret < 0) {
141dfc9e3751f5f Charles Keepax     2018-01-26  613  			dev_err(rtd->card->d=
ev,
141dfc9e3751f5f Charles Keepax     2018-01-26  614  				"Compress ASoC: can=
't create compressed for %s: %d\n",
141dfc9e3751f5f Charles Keepax     2018-01-26  615  				rtd->dai_link->name=
, ret);
09f448a415ece49 Amadeusz S=C5=82awi=C5=84ski 2019-06-17  616  			return ret;
2a99ef0fdb35a0f Liam Girdwood      2014-01-17  617  		}
2a99ef0fdb35a0f Liam Girdwood      2014-01-17  618  =

2a99ef0fdb35a0f Liam Girdwood      2014-01-17  619  		rtd->pcm =3D be_pcm;
2a99ef0fdb35a0f Liam Girdwood      2014-01-17  620  		rtd->fe_compr =3D 1;
d3268a40d4b19ff Qais Yousef        2015-01-14  621  		if (rtd->dai_link->dp=
cm_playback)
2a99ef0fdb35a0f Liam Girdwood      2014-01-17  622  			be_pcm->streams[SNDR=
V_PCM_STREAM_PLAYBACK].substream->private_data =3D rtd;
d3268a40d4b19ff Qais Yousef        2015-01-14  623  		else if (rtd->dai_lin=
k->dpcm_capture)
2a99ef0fdb35a0f Liam Girdwood      2014-01-17  624  			be_pcm->streams[SNDR=
V_PCM_STREAM_CAPTURE].substream->private_data =3D rtd;
2a99ef0fdb35a0f Liam Girdwood      2014-01-17  625  		memcpy(compr->ops, &s=
oc_compr_dyn_ops, sizeof(soc_compr_dyn_ops));
aeb6fa0f15c71a1 Peng Donglin       2017-08-16  626  	} else {
aeb6fa0f15c71a1 Peng Donglin       2017-08-16  627  		snprintf(new_name, si=
zeof(new_name), "%s %s-%d",
aeb6fa0f15c71a1 Peng Donglin       2017-08-16 @628  			rtd->dai_link->strea=
m_name, codec_dai->name, num);

:::::: The code at line 628 was first introduced by commit
:::::: aeb6fa0f15c71a18f757d1686822b6c34cf81399 ASoC: compress: Set reasona=
ble compress id string

:::::: TO: Peng Donglin <dolinux.peng@gmail.com>
:::::: CC: Mark Brown <broonie@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6677483226334902456==--

