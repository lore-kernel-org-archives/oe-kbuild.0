Content-Type: multipart/mixed; boundary="===============4744925554673951300=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: sound/firewire/motu/motu-pcm.c:191 pcm_open() error: double unlocked 'motu->mutex' (orig line 179)
Date: Sun, 08 Dec 2019 11:40:34 +0300
Message-ID: <20191208084034.GU1787@kadam>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4744925554673951300==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   94e89b40235476a83a53a47b9ffb0cb91a4c335e
commit: 3fd80b2003882b6a328caff9e6b3a14bed61f27c ALSA: firewire-motu: use t=
he same size of period for PCM substream in AMDTP streams

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
sound/firewire/motu/motu-pcm.c:191 pcm_open() error: double unlocked 'motu-=
>mutex' (orig line 179)

# https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D3fd80b2003882b6a328caff9e6b3a14bed61f27c
git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torval=
ds/linux.git
git remote update linus
git checkout 3fd80b2003882b6a328caff9e6b3a14bed61f27c
vim +191 sound/firewire/motu/motu-pcm.c

dd49b2d1f04af9 Takashi Sakamoto 2017-03-22  133  static int pcm_open(struct=
 snd_pcm_substream *substream)
dd49b2d1f04af9 Takashi Sakamoto 2017-03-22  134  {
dd49b2d1f04af9 Takashi Sakamoto 2017-03-22  135  	struct snd_motu *motu =3D=
 substream->private_data;
dd49b2d1f04af9 Takashi Sakamoto 2017-03-22  136  	const struct snd_motu_pro=
tocol *const protocol =3D motu->spec->protocol;
3fd80b2003882b Takashi Sakamoto 2019-10-07  137  	struct amdtp_domain *d =
=3D &motu->domain;
dd49b2d1f04af9 Takashi Sakamoto 2017-03-22  138  	enum snd_motu_clock_sourc=
e src;
dd49b2d1f04af9 Takashi Sakamoto 2017-03-22  139  	int err;
dd49b2d1f04af9 Takashi Sakamoto 2017-03-22  140  =

71c3797779d3cd Takashi Sakamoto 2017-03-22  141  	err =3D snd_motu_stream_l=
ock_try(motu);
71c3797779d3cd Takashi Sakamoto 2017-03-22  142  	if (err < 0)
71c3797779d3cd Takashi Sakamoto 2017-03-22  143  		return err;
71c3797779d3cd Takashi Sakamoto 2017-03-22  144  =

dd49b2d1f04af9 Takashi Sakamoto 2017-03-22  145  	mutex_lock(&motu->mutex);
dd49b2d1f04af9 Takashi Sakamoto 2017-03-22  146  =

8b460c76bd1712 Takashi Sakamoto 2017-08-20  147  	err =3D snd_motu_stream_c=
ache_packet_formats(motu);
dd49b2d1f04af9 Takashi Sakamoto 2017-03-22  148  	if (err < 0)
71c3797779d3cd Takashi Sakamoto 2017-03-22  149  		goto err_locked;
dd49b2d1f04af9 Takashi Sakamoto 2017-03-22  150  =

dd49b2d1f04af9 Takashi Sakamoto 2017-03-22  151  	err =3D init_hw_info(motu=
, substream);
dd49b2d1f04af9 Takashi Sakamoto 2017-03-22  152  	if (err < 0)
71c3797779d3cd Takashi Sakamoto 2017-03-22  153  		goto err_locked;
dd49b2d1f04af9 Takashi Sakamoto 2017-03-22  154  =

dd49b2d1f04af9 Takashi Sakamoto 2017-03-22  155  	err =3D protocol->get_clo=
ck_source(motu, &src);
dd49b2d1f04af9 Takashi Sakamoto 2017-03-22  156  	if (err < 0)
71c3797779d3cd Takashi Sakamoto 2017-03-22  157  		goto err_locked;
3fd80b2003882b Takashi Sakamoto 2019-10-07  158  =

3fd80b2003882b Takashi Sakamoto 2019-10-07  159  	// When source of clock i=
s not internal or any stream is reserved for
3fd80b2003882b Takashi Sakamoto 2019-10-07  160  	// transmission of PCM fr=
ames, the available sampling rate is limited
3fd80b2003882b Takashi Sakamoto 2019-10-07  161  	//@current one.
dd49b2d1f04af9 Takashi Sakamoto 2017-03-22  162  	if (src !=3D SND_MOTU_CLO=
CK_SOURCE_INTERNAL ||
3fd80b2003882b Takashi Sakamoto 2019-10-07  163  	    (motu->substreams_cou=
nter > 0 && d->events_per_period > 0)) {
3fd80b2003882b Takashi Sakamoto 2019-10-07  164  		unsigned int frames_per_=
period =3D d->events_per_period;
3fd80b2003882b Takashi Sakamoto 2019-10-07  165  		unsigned int rate;
3fd80b2003882b Takashi Sakamoto 2019-10-07  166  =

dd49b2d1f04af9 Takashi Sakamoto 2017-03-22  167  		err =3D protocol->get_cl=
ock_rate(motu, &rate);
dd49b2d1f04af9 Takashi Sakamoto 2017-03-22  168  		if (err < 0)
71c3797779d3cd Takashi Sakamoto 2017-03-22  169  			goto err_locked;
3fd80b2003882b Takashi Sakamoto 2019-10-07  170  =

dd49b2d1f04af9 Takashi Sakamoto 2017-03-22  171  		substream->runtime->hw.r=
ate_min =3D rate;
dd49b2d1f04af9 Takashi Sakamoto 2017-03-22  172  		substream->runtime->hw.r=
ate_max =3D rate;
3fd80b2003882b Takashi Sakamoto 2019-10-07  173  =

3fd80b2003882b Takashi Sakamoto 2019-10-07  174  		if (frames_per_period > =
0) {
3fd80b2003882b Takashi Sakamoto 2019-10-07  175  			err =3D snd_pcm_hw_cons=
traint_minmax(substream->runtime,
3fd80b2003882b Takashi Sakamoto 2019-10-07  176  					SNDRV_PCM_HW_PARAM_PE=
RIOD_SIZE,
3fd80b2003882b Takashi Sakamoto 2019-10-07  177  					frames_per_period, fr=
ames_per_period);
3fd80b2003882b Takashi Sakamoto 2019-10-07  178  			if (err < 0) {
3fd80b2003882b Takashi Sakamoto 2019-10-07 @179  				mutex_unlock(&motu->mu=
tex);
                                                                           =
     ^^^^^^^^^^^^^^^^^^^^^^^^^^
Delete this.

3fd80b2003882b Takashi Sakamoto 2019-10-07  180  				goto err_locked;
3fd80b2003882b Takashi Sakamoto 2019-10-07  181  			}
3fd80b2003882b Takashi Sakamoto 2019-10-07  182  		}
dd49b2d1f04af9 Takashi Sakamoto 2017-03-22  183  	}
dd49b2d1f04af9 Takashi Sakamoto 2017-03-22  184  =

dd49b2d1f04af9 Takashi Sakamoto 2017-03-22  185  	snd_pcm_set_sync(substrea=
m);
dd49b2d1f04af9 Takashi Sakamoto 2017-03-22  186  =

dd49b2d1f04af9 Takashi Sakamoto 2017-03-22  187  	mutex_unlock(&motu->mutex=
);
dd49b2d1f04af9 Takashi Sakamoto 2017-03-22  188  =

3fd80b2003882b Takashi Sakamoto 2019-10-07  189  	return 0;
71c3797779d3cd Takashi Sakamoto 2017-03-22  190  err_locked:
71c3797779d3cd Takashi Sakamoto 2017-03-22 @191  	mutex_unlock(&motu->mutex=
);
71c3797779d3cd Takashi Sakamoto 2017-03-22  192  	snd_motu_stream_lock_rele=
ase(motu);
dd49b2d1f04af9 Takashi Sakamoto 2017-03-22  193  	return err;
dd49b2d1f04af9 Takashi Sakamoto 2017-03-22  194  }
dd49b2d1f04af9 Takashi Sakamoto 2017-03-22  195  =


---
0-DAY kernel test infrastructure                 Open Source Technology Cen=
ter
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org Intel Corpor=
ation
--===============4744925554673951300==--

