Content-Type: multipart/mixed; boundary="===============2912093074748110024=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [linux-next:master 9388/11353] sound/soc/soc-compress.c:628 snd_soc_new_compress() error: we previously assumed 'codec_dai' could be null (see line 571)
Date: Wed, 09 Mar 2022 13:18:23 +0300
Message-ID: <20220309101823.GS3315@kadam>
In-Reply-To: <20220309093219.1142599-1-jiasheng@iscas.ac.cn>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2912093074748110024==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 09, 2022 at 05:32:19PM +0800, Jiasheng Jiang wrote:
> On Wed, Mar 09, 2022 at 01:58:04AM +0800, Dan Carpenter wrote:
> > smatch warnings:
> > sound/soc/soc-compress.c:628 snd_soc_new_compress() error: we previousl=
y assumed 'codec_dai' could be null (see line 571)
> =

> > de2c6f98817fa5d Jiasheng Jiang     2021-10-15 @571  	if (codec_dai) {
> > =

> > Can codec_dai be NULL?  This new code assumes so.
> =

> > aeb6fa0f15c71a1 Peng Donglin       2017-08-16 @628  			rtd->dai_link->s=
tream_name, codec_dai->name, num);
> >                                                                        =
                             ^^^^^^^^^^^^^^^^
> > Unchecked dereference
> =

> Actually, if 'codec_dai' is NULL, the check in line 584 will fail and ret=
urn -EINVAL.
> =

> a1068045883ed4a Vinod Koul         2016-01-07  584  	if (playback + captu=
re !=3D 1) {
> 141dfc9e3751f5f Charles Keepax     2018-01-26  585  		dev_err(rtd->card->=
dev,
> 141dfc9e3751f5f Charles Keepax     2018-01-26  586  			"Compress ASoC: In=
valid direction for P %d, C %d\n",
> a1068045883ed4a Vinod Koul         2016-01-07  587  			playback, capture);
> a1068045883ed4a Vinod Koul         2016-01-07  588  		return -EINVAL;
> a1068045883ed4a Vinod Koul         2016-01-07  589  	}
> =


Yeah.  That's true.  Smatch tries to look at conditions and figure out
the implications but this one is too complicated.

But if codec_dai can really be NULL then it would be easier to
understand if we reversed the check on codec_dai and returned early.

	if (!codec_dai) {
		dev_err(rtd->card->dev, "Missing codec\n");
		return -EINVAL;
	}

	/* check client and interface hw capabilities */
	if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_PLAYBACK) &&
	    snd_soc_dai_stream_valid(cpu_dai,   SNDRV_PCM_STREAM_PLAYBACK))
		playback =3D 1;

regards,
dan carpenter
--===============2912093074748110024==--

