Content-Type: multipart/mixed; boundary="===============2879935876119814822=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [morimoto-linux:fw-cleanup-2020-01-10-v3 94/416] sound/soc/soc-pcm.c:951 soc_pcm_hw_free() warn: inconsistent returns 'rtd->card->pcm_mutex'.
Date: Tue, 21 Jan 2020 12:41:54 +0300
Message-ID: <20200121094154.GN19765@kadam>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2879935876119814822==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/morimoto/linux fw-cleanup-2020-01-10-v3
head:   109289147a86ef6391233055b9c74e475deaee0e
commit: 4d2384aa3e976e7fd983461a0ef97c9bb6c855b9 [94/416] ASoC: soc-pcm: re=
move soc_pcm_components_hw_free()

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
sound/soc/soc-pcm.c:951 soc_pcm_hw_free() warn: inconsistent returns 'rtd->=
card->pcm_mutex'.

# https://github.com/morimoto/linux/commit/4d2384aa3e976e7fd983461a0ef97c9b=
b6c855b9
git remote add morimoto-linux https://github.com/morimoto/linux
git remote update morimoto-linux
git checkout 4d2384aa3e976e7fd983461a0ef97c9bb6c855b9
vim +951 sound/soc/soc-pcm.c

53d7e3a8e5b89d Kuninori Morimoto 2019-10-02  913  static int soc_pcm_hw_fre=
e(struct snd_pcm_substream *substream)
53d7e3a8e5b89d Kuninori Morimoto 2019-10-02  914  {
53d7e3a8e5b89d Kuninori Morimoto 2019-10-02  915  	struct snd_soc_pcm_runti=
me *rtd =3D substream->private_data;
4d2384aa3e976e Kuninori Morimoto 2019-07-24  916  	struct snd_soc_component=
 *component;
53d7e3a8e5b89d Kuninori Morimoto 2019-10-02  917  	struct snd_soc_dai *dai;
4d2384aa3e976e Kuninori Morimoto 2019-07-24  918  	int i, ret;
53d7e3a8e5b89d Kuninori Morimoto 2019-10-02  919  =

53d7e3a8e5b89d Kuninori Morimoto 2019-10-02  920  	mutex_lock_nested(&rtd->=
card->pcm_mutex, rtd->card->pcm_subclass);
                                                        ^^^^^^^^^^^^^^^^^
Lock

53d7e3a8e5b89d Kuninori Morimoto 2019-10-02  921  =

53d7e3a8e5b89d Kuninori Morimoto 2019-10-02  922  	/* clear the correspondi=
ng DAIs parameters when going to be inactive */
53d7e3a8e5b89d Kuninori Morimoto 2019-10-02  923  	for_each_rtd_dais(rtd, i=
, dai) {
53d7e3a8e5b89d Kuninori Morimoto 2019-10-02  924  		if (dai->active =3D=3D =
1) {
53d7e3a8e5b89d Kuninori Morimoto 2019-10-02  925  			dai->rate =3D 0;
53d7e3a8e5b89d Kuninori Morimoto 2019-10-02  926  			dai->channels =3D 0;
53d7e3a8e5b89d Kuninori Morimoto 2019-10-02  927  			dai->sample_bits =3D 0;
53d7e3a8e5b89d Kuninori Morimoto 2019-10-02  928  			snd_soc_dai_digital_mu=
te(dai, 1, substream->stream);
53d7e3a8e5b89d Kuninori Morimoto 2019-10-02  929  		}
53d7e3a8e5b89d Kuninori Morimoto 2019-10-02  930  	}
53d7e3a8e5b89d Kuninori Morimoto 2019-10-02  931  =

53d7e3a8e5b89d Kuninori Morimoto 2019-10-02  932  	/* free any machine hw p=
arams */
53d7e3a8e5b89d Kuninori Morimoto 2019-10-02  933  	soc_rtd_hw_free(rtd, sub=
stream);
53d7e3a8e5b89d Kuninori Morimoto 2019-10-02  934  =

53d7e3a8e5b89d Kuninori Morimoto 2019-10-02  935  	/* free any component re=
sources */
4d2384aa3e976e Kuninori Morimoto 2019-07-24  936  	ret =3D 0;
4d2384aa3e976e Kuninori Morimoto 2019-07-24  937  	for_each_rtd_components(=
rtd, i, component)
4d2384aa3e976e Kuninori Morimoto 2019-07-24  938  		ret |=3D snd_soc_compon=
ent_hw_free(component, substream);
4d2384aa3e976e Kuninori Morimoto 2019-07-24  939  	if (ret < 0)
4d2384aa3e976e Kuninori Morimoto 2019-07-24  940  		return ret;
                                                                ^^^^^^^^^^
Missing unlock

53d7e3a8e5b89d Kuninori Morimoto 2019-10-02  941  =

53d7e3a8e5b89d Kuninori Morimoto 2019-10-02  942  	/* now free hw params fo=
r the DAIs  */
53d7e3a8e5b89d Kuninori Morimoto 2019-10-02  943  	for_each_rtd_dais(rtd, i=
, dai) {
53d7e3a8e5b89d Kuninori Morimoto 2019-10-02  944  		if (!snd_soc_dai_stream=
_valid(dai, substream->stream))
53d7e3a8e5b89d Kuninori Morimoto 2019-10-02  945  			continue;
53d7e3a8e5b89d Kuninori Morimoto 2019-10-02  946  =

53d7e3a8e5b89d Kuninori Morimoto 2019-10-02  947  		snd_soc_dai_hw_free(dai=
, substream);
53d7e3a8e5b89d Kuninori Morimoto 2019-10-02  948  	}
53d7e3a8e5b89d Kuninori Morimoto 2019-10-02  949  =

53d7e3a8e5b89d Kuninori Morimoto 2019-10-02  950  	mutex_unlock(&rtd->card-=
>pcm_mutex);
                                                        ^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^
53d7e3a8e5b89d Kuninori Morimoto 2019-10-02 @951  	return 0;
53d7e3a8e5b89d Kuninori Morimoto 2019-10-02  952  }

---
0-DAY kernel test infrastructure                 Open Source Technology Cen=
ter
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org Intel Corpor=
ation
--===============2879935876119814822==--

