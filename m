Content-Type: multipart/mixed; boundary="===============0364704880429839283=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] ALSA: jack: Access input_dev under mutex
Date: Sat, 02 Apr 2022 00:16:19 +0800
Message-ID: <202204020033.S4YFojPq-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0364704880429839283==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220401122931.4181700-1-amadeuszx.slawinski@linux.intel.co=
m>
References: <20220401122931.4181700-1-amadeuszx.slawinski@linux.intel.com>
TO: "Amadeusz S=C5=82awi=C5=84ski" <amadeuszx.slawinski@linux.intel.com>
TO: Takashi Iwai <tiwai@suse.com>
CC: alsa-devel(a)alsa-project.org
CC: "Amadeusz S=C5=82awi=C5=84ski" <amadeuszx.slawinski@linux.intel.com>

Hi "Amadeusz,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on tiwai-sound/for-next]
[also build test WARNING on v5.17 next-20220401]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Amadeusz-S-awi-ski/A=
LSA-jack-Access-input_dev-under-mutex/20220401-203645
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for=
-next
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
config: powerpc-randconfig-c024-20220331 (https://download.01.org/0day-ci/a=
rchive/20220402/202204020033.S4YFojPq-lkp(a)intel.com/config)
compiler: powerpc-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> sound/core/jack.c:535:2-12: second lock on line 572

vim +535 sound/core/jack.c

9058cbe1eed293 Jie Yang           2015-04-27  482  =

e76d8ceaaff9d7 Mark Brown         2008-07-28  483  /**
e76d8ceaaff9d7 Mark Brown         2008-07-28  484   * snd_jack_new - Create=
 a new jack
e76d8ceaaff9d7 Mark Brown         2008-07-28  485   * @card:  the card inst=
ance
e76d8ceaaff9d7 Mark Brown         2008-07-28  486   * @id:    an identifyin=
g string for this jack
e76d8ceaaff9d7 Mark Brown         2008-07-28  487   * @type:  a bitmask of =
enum snd_jack_type values that can be detected by
e76d8ceaaff9d7 Mark Brown         2008-07-28  488   *         this jack
e76d8ceaaff9d7 Mark Brown         2008-07-28  489   * @jjack: Used to provi=
de the allocated jack object to the caller.
4e3f0dc65883ca Jie Yang           2015-04-27  490   * @initial_kctl: if tru=
e, create a kcontrol and add it to the jack list.
4e3f0dc65883ca Jie Yang           2015-04-27  491   * @phantom_jack: Don't =
create a input device for phantom jacks.
e76d8ceaaff9d7 Mark Brown         2008-07-28  492   *
e76d8ceaaff9d7 Mark Brown         2008-07-28  493   * Creates a new jack ob=
ject.
e76d8ceaaff9d7 Mark Brown         2008-07-28  494   *
eb7c06e8e9c93b Yacine Belkadi     2013-03-11  495   * Return: Zero if succe=
ssful, or a negative error code on failure.
eb7c06e8e9c93b Yacine Belkadi     2013-03-11  496   * On success @jjack wil=
l be initialised.
e76d8ceaaff9d7 Mark Brown         2008-07-28  497   */
e76d8ceaaff9d7 Mark Brown         2008-07-28  498  int snd_jack_new(struct =
snd_card *card, const char *id, int type,
4e3f0dc65883ca Jie Yang           2015-04-27  499  		 struct snd_jack **jja=
ck, bool initial_kctl, bool phantom_jack)
e76d8ceaaff9d7 Mark Brown         2008-07-28  500  {
e76d8ceaaff9d7 Mark Brown         2008-07-28  501  	struct snd_jack *jack;
4e3f0dc65883ca Jie Yang           2015-04-27  502  	struct snd_jack_kctl *j=
ack_kctl =3D NULL;
e76d8ceaaff9d7 Mark Brown         2008-07-28  503  	int err;
f15ee210cdb87f Takashi Iwai       2020-01-03  504  	static const struct snd=
_device_ops ops =3D {
e76d8ceaaff9d7 Mark Brown         2008-07-28  505  		.dev_free =3D snd_jack=
_dev_free,
fe0d128c57bf92 Takashi Iwai       2016-02-17  506  #ifdef CONFIG_SND_JACK_I=
NPUT_DEV
e76d8ceaaff9d7 Mark Brown         2008-07-28  507  		.dev_register =3D snd_=
jack_dev_register,
32b8544296b944 Takashi Iwai       2013-11-14  508  		.dev_disconnect =3D sn=
d_jack_dev_disconnect,
fe0d128c57bf92 Takashi Iwai       2016-02-17  509  #endif /* CONFIG_SND_JAC=
K_INPUT_DEV */
e76d8ceaaff9d7 Mark Brown         2008-07-28  510  	};
e76d8ceaaff9d7 Mark Brown         2008-07-28  511  =

4e3f0dc65883ca Jie Yang           2015-04-27  512  	if (initial_kctl) {
4e3f0dc65883ca Jie Yang           2015-04-27  513  		jack_kctl =3D snd_jack=
_kctl_new(card, id, type);
4e3f0dc65883ca Jie Yang           2015-04-27  514  		if (!jack_kctl)
4e3f0dc65883ca Jie Yang           2015-04-27  515  			return -ENOMEM;
4e3f0dc65883ca Jie Yang           2015-04-27  516  	}
4e3f0dc65883ca Jie Yang           2015-04-27  517  =

e76d8ceaaff9d7 Mark Brown         2008-07-28  518  	jack =3D kzalloc(sizeof=
(struct snd_jack), GFP_KERNEL);
e76d8ceaaff9d7 Mark Brown         2008-07-28  519  	if (jack =3D=3D NULL)
e76d8ceaaff9d7 Mark Brown         2008-07-28  520  		return -ENOMEM;
e76d8ceaaff9d7 Mark Brown         2008-07-28  521  =

282cd76ffca781 Matt Ranostay      2008-10-25  522  	jack->id =3D kstrdup(id=
, GFP_KERNEL);
c01c1db1dc632e Xiaoke Wang        2021-12-13  523  	if (jack->id =3D=3D NUL=
L) {
c01c1db1dc632e Xiaoke Wang        2021-12-13  524  		kfree(jack);
c01c1db1dc632e Xiaoke Wang        2021-12-13  525  		return -ENOMEM;
c01c1db1dc632e Xiaoke Wang        2021-12-13  526  	}
e76d8ceaaff9d7 Mark Brown         2008-07-28  527  =

fe0d128c57bf92 Takashi Iwai       2016-02-17  528  #ifdef CONFIG_SND_JACK_I=
NPUT_DEV
ddb977b25cdc65 Amadeusz S=C5=82awi=C5=84ski 2022-04-01  529  	mutex_init(&j=
ack->input_dev_lock);
ddb977b25cdc65 Amadeusz S=C5=82awi=C5=84ski 2022-04-01  530  =

ddb977b25cdc65 Amadeusz S=C5=82awi=C5=84ski 2022-04-01  531  	/* don't crea=
te input device for phantom jack */
ddb977b25cdc65 Amadeusz S=C5=82awi=C5=84ski 2022-04-01  532  	if (!phantom_=
jack) {
fe0d128c57bf92 Takashi Iwai       2016-02-17  533  		int i;
fe0d128c57bf92 Takashi Iwai       2016-02-17  534  =

ddb977b25cdc65 Amadeusz S=C5=82awi=C5=84ski 2022-04-01 @535  		mutex_lock(&=
jack->input_dev_lock);
ddb977b25cdc65 Amadeusz S=C5=82awi=C5=84ski 2022-04-01  536  =

e76d8ceaaff9d7 Mark Brown         2008-07-28  537  		jack->input_dev =3D in=
put_allocate_device();
e76d8ceaaff9d7 Mark Brown         2008-07-28  538  		if (jack->input_dev =
=3D=3D NULL) {
e76d8ceaaff9d7 Mark Brown         2008-07-28  539  			err =3D -ENOMEM;
e76d8ceaaff9d7 Mark Brown         2008-07-28  540  			goto fail_input;
e76d8ceaaff9d7 Mark Brown         2008-07-28  541  		}
e76d8ceaaff9d7 Mark Brown         2008-07-28  542  =

e76d8ceaaff9d7 Mark Brown         2008-07-28  543  		jack->input_dev->phys =
=3D "ALSA";
e76d8ceaaff9d7 Mark Brown         2008-07-28  544  =

e76d8ceaaff9d7 Mark Brown         2008-07-28  545  		jack->type =3D type;
e76d8ceaaff9d7 Mark Brown         2008-07-28  546  =

53803aead010a3 Mark Brown         2012-02-07  547  		for (i =3D 0; i < SND_=
JACK_SWITCH_TYPES; i++)
bd8a71a7b0f50d Mark Brown         2009-01-03  548  			if (type & (1 << i))
e76d8ceaaff9d7 Mark Brown         2008-07-28  549  				input_set_capability=
(jack->input_dev, EV_SW,
1c6e555c3a66af Mark Brown         2010-03-17  550  						     jack_switch_t=
ypes[i]);
e76d8ceaaff9d7 Mark Brown         2008-07-28  551  =

ddb977b25cdc65 Amadeusz S=C5=82awi=C5=84ski 2022-04-01  552  		mutex_unlock=
(&jack->input_dev_lock);
4e3f0dc65883ca Jie Yang           2015-04-27  553  	}
ddb977b25cdc65 Amadeusz S=C5=82awi=C5=84ski 2022-04-01  554  #endif /* CONF=
IG_SND_JACK_INPUT_DEV */
4e3f0dc65883ca Jie Yang           2015-04-27  555  =

e76d8ceaaff9d7 Mark Brown         2008-07-28  556  	err =3D snd_device_new(=
card, SNDRV_DEV_JACK, jack, &ops);
e76d8ceaaff9d7 Mark Brown         2008-07-28  557  	if (err < 0)
e76d8ceaaff9d7 Mark Brown         2008-07-28  558  		goto fail_input;
e76d8ceaaff9d7 Mark Brown         2008-07-28  559  =

9058cbe1eed293 Jie Yang           2015-04-27  560  	jack->card =3D card;
9058cbe1eed293 Jie Yang           2015-04-27  561  	INIT_LIST_HEAD(&jack->k=
ctl_list);
9058cbe1eed293 Jie Yang           2015-04-27  562  =

4e3f0dc65883ca Jie Yang           2015-04-27  563  	if (initial_kctl)
4e3f0dc65883ca Jie Yang           2015-04-27  564  		snd_jack_kctl_add(jack=
, jack_kctl);
4e3f0dc65883ca Jie Yang           2015-04-27  565  =

e76d8ceaaff9d7 Mark Brown         2008-07-28  566  	*jjack =3D jack;
e76d8ceaaff9d7 Mark Brown         2008-07-28  567  =

e76d8ceaaff9d7 Mark Brown         2008-07-28  568  	return 0;
e76d8ceaaff9d7 Mark Brown         2008-07-28  569  =

e76d8ceaaff9d7 Mark Brown         2008-07-28  570  fail_input:
fe0d128c57bf92 Takashi Iwai       2016-02-17  571  #ifdef CONFIG_SND_JACK_I=
NPUT_DEV
ddb977b25cdc65 Amadeusz S=C5=82awi=C5=84ski 2022-04-01 @572  	mutex_lock(&j=
ack->input_dev_lock);
e76d8ceaaff9d7 Mark Brown         2008-07-28  573  	input_free_device(jack-=
>input_dev);
ddb977b25cdc65 Amadeusz S=C5=82awi=C5=84ski 2022-04-01  574  	mutex_unlock(=
&jack->input_dev_lock);
fe0d128c57bf92 Takashi Iwai       2016-02-17  575  #endif
eeda276bef3602 Lu Guanqun         2011-02-21  576  	kfree(jack->id);
e76d8ceaaff9d7 Mark Brown         2008-07-28  577  	kfree(jack);
e76d8ceaaff9d7 Mark Brown         2008-07-28  578  	return err;
e76d8ceaaff9d7 Mark Brown         2008-07-28  579  }
e76d8ceaaff9d7 Mark Brown         2008-07-28  580  EXPORT_SYMBOL(snd_jack_n=
ew);
e76d8ceaaff9d7 Mark Brown         2008-07-28  581  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0364704880429839283==--

