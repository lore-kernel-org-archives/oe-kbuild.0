Content-Type: multipart/mixed; boundary="===============7061783930270488091=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [omap-audio:peter/ti-linux-4.19.y/wip 40/47] sound/soc/ti/j721e-evm.c:399 j721e_audio_hw_params() warn: inconsistent returns 'mutex:&priv->mutex'.
Date: Wed, 09 Oct 2019 21:54:50 +0300
Message-ID: <20191009185450.GH13286@kadam>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7061783930270488091==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/omap-audio/linux-audio peter/ti-linux-4.19.y/wip
head:   0288109696d1bb4b24553465fdb779256148618e
commit: 098c67f22952c25146488c9adafeb18ae6d32ef4 [40/47] ASoC: ti: j721e-ev=
m: Add support for Infotainment Expansion Board

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
sound/soc/ti/j721e-evm.c:399 j721e_audio_hw_params() warn: inconsistent ret=
urns 'mutex:&priv->mutex'.
  Locked on:   line 367
  Unlocked on: line 399

# https://github.com/omap-audio/linux-audio/commit/098c67f22952c25146488c9a=
dafeb18ae6d32ef4
git remote add omap-audio https://github.com/omap-audio/linux-audio
git remote update omap-audio
git checkout 098c67f22952c25146488c9adafeb18ae6d32ef4
vim +399 sound/soc/ti/j721e-evm.c

457eebe1cf0729 Peter Ujfalusi 2019-08-09  338  static int j721e_audio_hw_pa=
rams(struct snd_pcm_substream *substream,
457eebe1cf0729 Peter Ujfalusi 2019-08-09  339  				 struct snd_pcm_hw_param=
s *params)
457eebe1cf0729 Peter Ujfalusi 2019-08-09  340  {
457eebe1cf0729 Peter Ujfalusi 2019-08-09  341  	struct 	snd_soc_pcm_runtime=
 *rtd =3D substream->private_data;
457eebe1cf0729 Peter Ujfalusi 2019-08-09  342  	struct snd_soc_card *card =
=3D rtd->card;
457eebe1cf0729 Peter Ujfalusi 2019-08-09  343  	struct j721e_priv *priv =3D=
 snd_soc_card_get_drvdata(card);
098c67f22952c2 Peter Ujfalusi 2019-08-23  344  	unsigned int domain_id =3D =
J721E_DAI_LINK_ID_TO_DOMAIN(rtd->dai_link->id);
098c67f22952c2 Peter Ujfalusi 2019-08-23  345  	struct j721e_audio_domain *=
domain =3D &priv->audio_domains[domain_id];
457eebe1cf0729 Peter Ujfalusi 2019-08-09  346  	int slot_width =3D 32;
098c67f22952c2 Peter Ujfalusi 2019-08-23  347  	int ret, i;
457eebe1cf0729 Peter Ujfalusi 2019-08-09  348  =

457eebe1cf0729 Peter Ujfalusi 2019-08-09  349  	mutex_lock(&priv->mutex);
                                                ^^^^^^^^^^^^^^^^^^^^^^^

457eebe1cf0729 Peter Ujfalusi 2019-08-09  350  =

098c67f22952c2 Peter Ujfalusi 2019-08-23  351  	if (domain->rate && domain-=
>rate !=3D params_rate(params)) {
457eebe1cf0729 Peter Ujfalusi 2019-08-09  352  		ret =3D -EINVAL;
457eebe1cf0729 Peter Ujfalusi 2019-08-09  353  		goto out;
457eebe1cf0729 Peter Ujfalusi 2019-08-09  354  	}
457eebe1cf0729 Peter Ujfalusi 2019-08-09  355  =

457eebe1cf0729 Peter Ujfalusi 2019-08-09  356  	if (params_width(params) =
=3D=3D 16)
457eebe1cf0729 Peter Ujfalusi 2019-08-09  357  		slot_width =3D 16;
457eebe1cf0729 Peter Ujfalusi 2019-08-09  358  =

457eebe1cf0729 Peter Ujfalusi 2019-08-09  359  	ret =3D snd_soc_dai_set_tdm=
_slot(rtd->cpu_dai, 0x3, 0x3, 2, slot_width);
098c67f22952c2 Peter Ujfalusi 2019-08-23  360  	if (ret && ret !=3D -ENOTSU=
PP)
457eebe1cf0729 Peter Ujfalusi 2019-08-09  361  		goto out;
457eebe1cf0729 Peter Ujfalusi 2019-08-09  362  =

098c67f22952c2 Peter Ujfalusi 2019-08-23  363  	for (i =3D 0; i < rtd->num_=
codecs; i++) {
098c67f22952c2 Peter Ujfalusi 2019-08-23  364  		ret =3D snd_soc_dai_set_td=
m_slot(rtd->codec_dais[i], 0x3, 0x3, 2,
098c67f22952c2 Peter Ujfalusi 2019-08-23  365  					       slot_width);
098c67f22952c2 Peter Ujfalusi 2019-08-23  366  		if (ret && ret !=3D -ENOTS=
UPP)
098c67f22952c2 Peter Ujfalusi 2019-08-23  367  			return ret;

goto out;

098c67f22952c2 Peter Ujfalusi 2019-08-23  368  	}
457eebe1cf0729 Peter Ujfalusi 2019-08-09  369  =

098c67f22952c2 Peter Ujfalusi 2019-08-23  370  	ret =3D j721e_configure_ref=
clk(priv, domain_id, params_rate(params));
457eebe1cf0729 Peter Ujfalusi 2019-08-09  371  	if (ret)
457eebe1cf0729 Peter Ujfalusi 2019-08-09  372  		goto out;
457eebe1cf0729 Peter Ujfalusi 2019-08-09  373  =

098c67f22952c2 Peter Ujfalusi 2019-08-23  374  	for (i =3D 0; i < rtd->num_=
codecs; i++) {
098c67f22952c2 Peter Ujfalusi 2019-08-23  375  		ret =3D snd_soc_dai_set_sy=
sclk(rtd->codec_dais[i], 0,
098c67f22952c2 Peter Ujfalusi 2019-08-23  376  				priv->hsdiv_rates[domain=
->parent_clk_id],
457eebe1cf0729 Peter Ujfalusi 2019-08-09  377  				SND_SOC_CLOCK_IN);
098c67f22952c2 Peter Ujfalusi 2019-08-23  378  		if (ret && ret !=3D -ENOTS=
UPP) {
098c67f22952c2 Peter Ujfalusi 2019-08-23  379  			dev_err(priv->dev, "codec=
 set_sysclk failed for %u Hz\n",
098c67f22952c2 Peter Ujfalusi 2019-08-23  380  				priv->hsdiv_rates[domain=
->parent_clk_id]);
457eebe1cf0729 Peter Ujfalusi 2019-08-09  381  			goto out;
098c67f22952c2 Peter Ujfalusi 2019-08-23  382  		}
098c67f22952c2 Peter Ujfalusi 2019-08-23  383  	}
457eebe1cf0729 Peter Ujfalusi 2019-08-09  384  =

457eebe1cf0729 Peter Ujfalusi 2019-08-09  385  	ret =3D snd_soc_dai_set_sys=
clk(rtd->cpu_dai, MCASP_CLK_HCLK_AUXCLK,
098c67f22952c2 Peter Ujfalusi 2019-08-23  386  				     priv->hsdiv_rates[d=
omain->parent_clk_id],
457eebe1cf0729 Peter Ujfalusi 2019-08-09  387  				     SND_SOC_CLOCK_IN);
457eebe1cf0729 Peter Ujfalusi 2019-08-09  388  =

098c67f22952c2 Peter Ujfalusi 2019-08-23  389  	if (ret && ret !=3D -ENOTSU=
PP) {
098c67f22952c2 Peter Ujfalusi 2019-08-23  390  		dev_err(priv->dev, "mcasp =
set_sysclk failed for %u Hz\n",
098c67f22952c2 Peter Ujfalusi 2019-08-23  391  			priv->hsdiv_rates[domain-=
>parent_clk_id]);
098c67f22952c2 Peter Ujfalusi 2019-08-23  392  	} else {
098c67f22952c2 Peter Ujfalusi 2019-08-23  393  		domain->rate =3D params_ra=
te(params);
098c67f22952c2 Peter Ujfalusi 2019-08-23  394  		ret =3D 0;
098c67f22952c2 Peter Ujfalusi 2019-08-23  395  	}
457eebe1cf0729 Peter Ujfalusi 2019-08-09  396  =

457eebe1cf0729 Peter Ujfalusi 2019-08-09  397  out:
457eebe1cf0729 Peter Ujfalusi 2019-08-09  398  	mutex_unlock(&priv->mutex);
457eebe1cf0729 Peter Ujfalusi 2019-08-09 @399  	return ret;
457eebe1cf0729 Peter Ujfalusi 2019-08-09  400  }
457eebe1cf0729 Peter Ujfalusi 2019-08-09  401  =


---
0-DAY kernel test infrastructure                Open Source Technology Cent=
er
https://lists.01.org/pipermail/kbuild-all                   Intel Corporati=
on
--===============7061783930270488091==--

