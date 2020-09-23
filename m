Content-Type: multipart/mixed; boundary="===============8351065535158913594=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/staging/greybus/audio_codec.c:466 gbcodec_hw_params() error: uninitialized symbol 'data'.
Date: Wed, 23 Sep 2020 14:49:12 +0800
Message-ID: <202009231404.19ltTZGa%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8351065535158913594==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Vaibhav Agarwal <vaibhav.sr@gmail.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Dan Carpenter <error27@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   805c6d3c19210c90c109107d189744e960eae025
commit: c9a57eddb235d53b0a8b9d740e454ef466086fc8 staging: greybus: audio: E=
nable GB codec, audio module compilation.
date:   8 weeks ago
:::::: branch date: 9 hours ago
:::::: commit date: 8 weeks ago
config: openrisc-randconfig-m031-20200923 (attached as .config)
compiler: or1k-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/staging/greybus/audio_codec.c:466 gbcodec_hw_params() error: uninit=
ialized symbol 'data'.
drivers/staging/greybus/audio_codec.c:538 gbcodec_prepare() error: uninitia=
lized symbol 'data'.
drivers/staging/greybus/audio_codec.c:621 gbcodec_mute_stream() error: unin=
itialized symbol 'data'.
drivers/staging/greybus/audio_topology.c:1078 gbaudio_tplg_create_widget() =
error: uninitialized symbol 'widget_kctls'.

Old smatch warnings:
drivers/staging/greybus/audio_topology.c:1100 gbaudio_tplg_create_widget() =
error: uninitialized symbol 'widget_kctls'.

# https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3Dc9a57eddb235d53b0a8b9d740e454ef466086fc8
git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torval=
ds/linux.git
git fetch --no-tags linus master
git checkout c9a57eddb235d53b0a8b9d740e454ef466086fc8
vim +/data +466 drivers/staging/greybus/audio_codec.c

d3d2af51f9c2f2 drivers/staging/greybus/audio-codec.c Vaibhav Agarwal 2015-1=
1-23  409  =

d3d2af51f9c2f2 drivers/staging/greybus/audio-codec.c Vaibhav Agarwal 2015-1=
1-23  410  static int gbcodec_hw_params(struct snd_pcm_substream *substream,
d3d2af51f9c2f2 drivers/staging/greybus/audio-codec.c Vaibhav Agarwal 2015-1=
1-23  411  			     struct snd_pcm_hw_params *hwparams,
d3d2af51f9c2f2 drivers/staging/greybus/audio-codec.c Vaibhav Agarwal 2015-1=
1-23  412  			     struct snd_soc_dai *dai)
d3d2af51f9c2f2 drivers/staging/greybus/audio-codec.c Vaibhav Agarwal 2015-1=
1-23  413  {
796fad441cb248 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
1-28  414  	int ret;
31959392c7db09 drivers/staging/greybus/audio_codec.c Chaehyun Lim    2016-0=
9-20  415  	u8 sig_bits, channels;
6236015fd2f1b2 drivers/staging/greybus/audio_codec.c Kamal Heib      2018-0=
1-17  416  	u32 format, rate;
6dd67645f22cfe drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
3-29  417  	struct gbaudio_module_info *module;
6dd67645f22cfe drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
3-29  418  	struct gbaudio_data_connection *data;
c388ae76969926 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
8-04  419  	struct gb_bundle *bundle;
6dd67645f22cfe drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
3-29  420  	struct gbaudio_codec_info *codec =3D dev_get_drvdata(dai->dev);
19866603be2ad5 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
8-04  421  	struct gbaudio_stream_params *params;
b7f0088df7369b drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
1-13  422  =

6dd67645f22cfe drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
3-29  423  	mutex_lock(&codec->lock);
3994e0b139c709 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
1-28  424  =

6dd67645f22cfe drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
3-29  425  	if (list_empty(&codec->module_list)) {
6dd67645f22cfe drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
3-29  426  		dev_err(codec->dev, "No codec module available\n");
6dd67645f22cfe drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
3-29  427  		mutex_unlock(&codec->lock);
6dd67645f22cfe drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
3-29  428  		return -ENODEV;
b7f0088df7369b drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
1-13  429  	}
b7f0088df7369b drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
1-13  430  =

b7f0088df7369b drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
1-13  431  	/*
b7f0088df7369b drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
1-13  432  	 * assuming, currently only 48000 Hz, 16BIT_LE, stereo
b7f0088df7369b drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
1-13  433  	 * is supported, validate params before configuring codec
b7f0088df7369b drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
1-13  434  	 */
b7f0088df7369b drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
1-13  435  	if (params_channels(hwparams) !=3D 2) {
b7f0088df7369b drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
1-13  436  		dev_err(dai->dev, "Invalid channel count:%d\n",
b7f0088df7369b drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
1-13  437  			params_channels(hwparams));
6dd67645f22cfe drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
3-29  438  		mutex_unlock(&codec->lock);
6dd67645f22cfe drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
3-29  439  		return -EINVAL;
b7f0088df7369b drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
1-13  440  	}
b7f0088df7369b drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
1-13  441  	channels =3D params_channels(hwparams);
b7f0088df7369b drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
1-13  442  =

b7f0088df7369b drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
1-13  443  	if (params_rate(hwparams) !=3D 48000) {
b7f0088df7369b drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
1-13  444  		dev_err(dai->dev, "Invalid sampling rate:%d\n",
b7f0088df7369b drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
1-13  445  			params_rate(hwparams));
6dd67645f22cfe drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
3-29  446  		mutex_unlock(&codec->lock);
6dd67645f22cfe drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
3-29  447  		return -EINVAL;
b7f0088df7369b drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
1-13  448  	}
b7f0088df7369b drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
1-13  449  	rate =3D GB_AUDIO_PCM_RATE_48000;
b7f0088df7369b drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
1-13  450  =

b7f0088df7369b drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
1-13  451  	if (params_format(hwparams) !=3D SNDRV_PCM_FORMAT_S16_LE) {
b7f0088df7369b drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
1-13  452  		dev_err(dai->dev, "Invalid format:%d\n",
b7f0088df7369b drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
1-13  453  			params_format(hwparams));
6dd67645f22cfe drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
3-29  454  		mutex_unlock(&codec->lock);
6dd67645f22cfe drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
3-29  455  		return -EINVAL;
b7f0088df7369b drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
1-13  456  	}
b7f0088df7369b drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
1-13  457  	format =3D GB_AUDIO_PCM_FMT_S16_LE;
b7f0088df7369b drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
1-13  458  =

6dd67645f22cfe drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
3-29  459  	/* find the data connection */
ce9413062f8e23 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
8-04  460  	list_for_each_entry(module, &codec->module_list, list) {
60e7327d54b270 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
8-04  461  		data =3D find_data(module, dai->id);
ce9413062f8e23 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
8-04  462  		if (data)
ce9413062f8e23 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
8-04  463  			break;
6dd67645f22cfe drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
3-29  464  	}
6dd67645f22cfe drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
3-29  465  =

ce9413062f8e23 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
8-04 @466  	if (!data) {
ce9413062f8e23 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
8-04  467  		dev_err(dai->dev, "DATA connection missing\n");
ce9413062f8e23 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
8-04  468  		mutex_unlock(&codec->lock);
ce9413062f8e23 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
8-04  469  		return -EINVAL;
b7f0088df7369b drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
1-13  470  	}
ce9413062f8e23 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
8-04  471  =

19866603be2ad5 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
8-04  472  	params =3D find_dai_stream_params(codec, dai->id, substream->st=
ream);
19866603be2ad5 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
8-04  473  	if (!params) {
19866603be2ad5 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
8-04  474  		dev_err(codec->dev, "Failed to fetch dai_stream pointer\n");
19866603be2ad5 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
8-04  475  		mutex_unlock(&codec->lock);
19866603be2ad5 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
8-04  476  		return -EINVAL;
19866603be2ad5 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
8-04  477  	}
19866603be2ad5 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
8-04  478  =

c388ae76969926 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
8-04  479  	bundle =3D to_gb_bundle(module->dev);
c388ae76969926 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
8-04  480  	ret =3D gb_pm_runtime_get_sync(bundle);
c388ae76969926 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
8-04  481  	if (ret) {
c388ae76969926 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
8-04  482  		mutex_unlock(&codec->lock);
c388ae76969926 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
8-04  483  		return ret;
c388ae76969926 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
8-04  484  	}
c388ae76969926 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
8-04  485  =

6dd67645f22cfe drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
3-29  486  	ret =3D gb_audio_apbridgea_set_config(data->connection, 0,
b7f0088df7369b drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
1-13  487  					    AUDIO_APBRIDGEA_PCM_FMT_16,
b7f0088df7369b drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
1-13  488  					    AUDIO_APBRIDGEA_PCM_RATE_48000,
b7f0088df7369b drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
1-13  489  					    6144000);
6dd67645f22cfe drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
3-29  490  	if (ret) {
ce9413062f8e23 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
8-04  491  		dev_err_ratelimited(dai->dev, "%d: Error during set_config\n",
ce9413062f8e23 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
8-04  492  				    ret);
ce9413062f8e23 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
8-04  493  		mutex_unlock(&codec->lock);
ce9413062f8e23 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
8-04  494  		return ret;
6dd67645f22cfe drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
3-29  495  	}
c388ae76969926 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
8-04  496  =

c388ae76969926 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
8-04  497  	gb_pm_runtime_put_noidle(bundle);
c388ae76969926 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
8-04  498  =

1023ab9c3800e5 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2017-0=
1-18  499  	if (substream->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK)
1023ab9c3800e5 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2017-0=
1-18  500  		sig_bits =3D dai->driver->playback.sig_bits;
1023ab9c3800e5 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2017-0=
1-18  501  	else
1023ab9c3800e5 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2017-0=
1-18  502  		sig_bits =3D dai->driver->capture.sig_bits;
1023ab9c3800e5 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2017-0=
1-18  503  =

19866603be2ad5 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
8-04  504  	params->state =3D GBAUDIO_CODEC_HWPARAMS;
19866603be2ad5 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
8-04  505  	params->format =3D format;
19866603be2ad5 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
8-04  506  	params->rate =3D rate;
19866603be2ad5 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
8-04  507  	params->channels =3D channels;
19866603be2ad5 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
8-04  508  	params->sig_bits =3D sig_bits;
6dd67645f22cfe drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
3-29  509  =

6dd67645f22cfe drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
3-29  510  	mutex_unlock(&codec->lock);
ce9413062f8e23 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
8-04  511  	return 0;
54e9070b24def1 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
4-23  512  }
54e9070b24def1 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
4-23  513  =

d3d2af51f9c2f2 drivers/staging/greybus/audio-codec.c Vaibhav Agarwal 2015-1=
1-23  514  static int gbcodec_prepare(struct snd_pcm_substream *substream,
d3d2af51f9c2f2 drivers/staging/greybus/audio-codec.c Vaibhav Agarwal 2015-1=
1-23  515  			   struct snd_soc_dai *dai)
d3d2af51f9c2f2 drivers/staging/greybus/audio-codec.c Vaibhav Agarwal 2015-1=
1-23  516  {
796fad441cb248 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
1-28  517  	int ret;
6dd67645f22cfe drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
3-29  518  	struct gbaudio_module_info *module;
54e9070b24def1 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
4-23  519  	struct gbaudio_data_connection *data;
c388ae76969926 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
8-04  520  	struct gb_bundle *bundle;
6dd67645f22cfe drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
3-29  521  	struct gbaudio_codec_info *codec =3D dev_get_drvdata(dai->dev);
19866603be2ad5 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
8-04  522  	struct gbaudio_stream_params *params;
6dd67645f22cfe drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
3-29  523  =

6dd67645f22cfe drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
3-29  524  	mutex_lock(&codec->lock);
b7f0088df7369b drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
1-13  525  =

6dd67645f22cfe drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
3-29  526  	if (list_empty(&codec->module_list)) {
6dd67645f22cfe drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
3-29  527  		dev_err(codec->dev, "No codec module available\n");
6dd67645f22cfe drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
3-29  528  		mutex_unlock(&codec->lock);
3994e0b139c709 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
1-28  529  		return -ENODEV;
6dd67645f22cfe drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
3-29  530  	}
3994e0b139c709 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
1-28  531  =

6dd67645f22cfe drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
3-29  532  	list_for_each_entry(module, &codec->module_list, list) {
6dd67645f22cfe drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
3-29  533  		/* find the dai */
60e7327d54b270 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
8-04  534  		data =3D find_data(module, dai->id);
ce9413062f8e23 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
8-04  535  		if (data)
ce9413062f8e23 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
8-04  536  			break;
ce9413062f8e23 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
8-04  537  	}
6dd67645f22cfe drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
3-29 @538  	if (!data) {
ce9413062f8e23 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
8-04  539  		dev_err(dai->dev, "DATA connection missing\n");
ce9413062f8e23 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
8-04  540  		mutex_unlock(&codec->lock);
ce9413062f8e23 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
8-04  541  		return -ENODEV;
6dd67645f22cfe drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
3-29  542  	}
b7f0088df7369b drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
1-13  543  =

19866603be2ad5 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
8-04  544  	params =3D find_dai_stream_params(codec, dai->id, substream->st=
ream);
19866603be2ad5 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
8-04  545  	if (!params) {
19866603be2ad5 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
8-04  546  		dev_err(codec->dev, "Failed to fetch dai_stream pointer\n");
19866603be2ad5 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
8-04  547  		mutex_unlock(&codec->lock);
19866603be2ad5 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
8-04  548  		return -EINVAL;
19866603be2ad5 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
8-04  549  	}
19866603be2ad5 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
8-04  550  =

c388ae76969926 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
8-04  551  	bundle =3D to_gb_bundle(module->dev);
c388ae76969926 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
8-04  552  	ret =3D gb_pm_runtime_get_sync(bundle);
c388ae76969926 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
8-04  553  	if (ret) {
c388ae76969926 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
8-04  554  		mutex_unlock(&codec->lock);
c388ae76969926 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
8-04  555  		return ret;
c388ae76969926 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
8-04  556  	}
c388ae76969926 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
8-04  557  =

b7f0088df7369b drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
1-13  558  	switch (substream->stream) {
54e9070b24def1 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
4-23  559  	case SNDRV_PCM_STREAM_PLAYBACK:
ce9413062f8e23 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
8-04  560  		ret =3D gb_audio_apbridgea_set_tx_data_size(data->connection, =
0,
ce9413062f8e23 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
8-04  561  							  192);
54e9070b24def1 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
4-23  562  		break;
b7f0088df7369b drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
1-13  563  	case SNDRV_PCM_STREAM_CAPTURE:
ce9413062f8e23 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
8-04  564  		ret =3D gb_audio_apbridgea_set_rx_data_size(data->connection, =
0,
ce9413062f8e23 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
8-04  565  							  192);
b7f0088df7369b drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
1-13  566  		break;
b7f0088df7369b drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
1-13  567  	}
b7f0088df7369b drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
1-13  568  	if (ret) {
ce9413062f8e23 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
8-04  569  		mutex_unlock(&codec->lock);
ce9413062f8e23 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
8-04  570  		dev_err_ratelimited(dai->dev, "set_data_size failed:%d\n",
ce9413062f8e23 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
8-04  571  				    ret);
ce9413062f8e23 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
8-04  572  		return ret;
6dd67645f22cfe drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
3-29  573  	}
b7f0088df7369b drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
1-13  574  =

c388ae76969926 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
8-04  575  	gb_pm_runtime_put_noidle(bundle);
c388ae76969926 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
8-04  576  =

19866603be2ad5 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
8-04  577  	params->state =3D GBAUDIO_CODEC_PREPARE;
6dd67645f22cfe drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
3-29  578  	mutex_unlock(&codec->lock);
ce9413062f8e23 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
8-04  579  	return 0;
b7f0088df7369b drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
1-13  580  }
b7f0088df7369b drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
1-13  581  =

27c243cf5fcf4b drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
6-09  582  static int gbcodec_mute_stream(struct snd_soc_dai *dai, int mute=
, int stream)
b7f0088df7369b drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
1-13  583  {
796fad441cb248 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
1-28  584  	int ret;
6dd67645f22cfe drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
3-29  585  	struct gbaudio_data_connection *data;
6dd67645f22cfe drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
3-29  586  	struct gbaudio_module_info *module;
c388ae76969926 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
8-04  587  	struct gb_bundle *bundle;
6dd67645f22cfe drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
3-29  588  	struct gbaudio_codec_info *codec =3D dev_get_drvdata(dai->dev);
19866603be2ad5 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
8-04  589  	struct gbaudio_stream_params *params;
6dd67645f22cfe drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
3-29  590  =

27c243cf5fcf4b drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
6-09  591  	dev_dbg(dai->dev, "Mute:%d, Direction:%s\n", mute,
27c243cf5fcf4b drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
6-09  592  		stream ? "CAPTURE" : "PLAYBACK");
27c243cf5fcf4b drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
6-09  593  =

6dd67645f22cfe drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
3-29  594  	mutex_lock(&codec->lock);
19866603be2ad5 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
8-04  595  =

19866603be2ad5 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
8-04  596  	params =3D find_dai_stream_params(codec, dai->id, stream);
19866603be2ad5 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
8-04  597  	if (!params) {
19866603be2ad5 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
8-04  598  		dev_err(codec->dev, "Failed to fetch dai_stream pointer\n");
19866603be2ad5 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
8-04  599  		mutex_unlock(&codec->lock);
19866603be2ad5 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
8-04  600  		return -EINVAL;
19866603be2ad5 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
8-04  601  	}
19866603be2ad5 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
8-04  602  =

6dd67645f22cfe drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
3-29  603  	if (list_empty(&codec->module_list)) {
6dd67645f22cfe drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
3-29  604  		dev_err(codec->dev, "No codec module available\n");
12ce523147e485 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
7-12  605  		if (mute) {
19866603be2ad5 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
8-04  606  			params->state =3D GBAUDIO_CODEC_STOP;
12ce523147e485 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
7-12  607  			ret =3D 0;
12ce523147e485 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
7-12  608  		} else {
12ce523147e485 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
7-12  609  			ret =3D -ENODEV;
12ce523147e485 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
7-12  610  		}
6dd67645f22cfe drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
3-29  611  		mutex_unlock(&codec->lock);
12ce523147e485 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
7-12  612  		return ret;
29386f058a758f drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
2-16  613  	}
3994e0b139c709 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
1-28  614  =

6dd67645f22cfe drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
3-29  615  	list_for_each_entry(module, &codec->module_list, list) {
6dd67645f22cfe drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
3-29  616  		/* find the dai */
60e7327d54b270 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
8-04  617  		data =3D find_data(module, dai->id);
6dd67645f22cfe drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
3-29  618  		if (data)
6dd67645f22cfe drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
3-29  619  			break;
6dd67645f22cfe drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
3-29  620  	}
6dd67645f22cfe drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
3-29 @621  	if (!data) {
6dd67645f22cfe drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
3-29  622  		dev_err(dai->dev, "%s:%s DATA connection missing\n",
6dd67645f22cfe drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
3-29  623  			dai->name, module->name);
90579d4b577154 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
8-04  624  		mutex_unlock(&codec->lock);
90579d4b577154 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
8-04  625  		return -ENODEV;
6dd67645f22cfe drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
3-29  626  	}
27c243cf5fcf4b drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
6-09  627  =

c388ae76969926 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
8-04  628  	bundle =3D to_gb_bundle(module->dev);
c388ae76969926 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
8-04  629  	ret =3D gb_pm_runtime_get_sync(bundle);
c388ae76969926 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
8-04  630  	if (ret) {
c388ae76969926 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
8-04  631  		mutex_unlock(&codec->lock);
c388ae76969926 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
8-04  632  		return ret;
c388ae76969926 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
8-04  633  	}
c388ae76969926 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
8-04  634  =

27c243cf5fcf4b drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
6-09  635  	if (!mute && !stream) {/* start playback */
6dd67645f22cfe drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
3-29  636  		ret =3D gb_audio_apbridgea_prepare_tx(data->connection,
6dd67645f22cfe drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
3-29  637  						    0);
5bbe14b7acc2a0 drivers/staging/greybus/audio_codec.c Mark Greer      2016-0=
2-29  638  		if (!ret)
6dd67645f22cfe drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
3-29  639  			ret =3D gb_audio_apbridgea_start_tx(data->connection,
6dd67645f22cfe drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
3-29  640  							  0, 0);
19866603be2ad5 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
8-04  641  		params->state =3D GBAUDIO_CODEC_START;
27c243cf5fcf4b drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
6-09  642  	} else if (!mute && stream) {/* start capture */
6dd67645f22cfe drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
3-29  643  		ret =3D gb_audio_apbridgea_prepare_rx(data->connection,
5bbe14b7acc2a0 drivers/staging/greybus/audio_codec.c Mark Greer      2016-0=
2-29  644  						    0);
5bbe14b7acc2a0 drivers/staging/greybus/audio_codec.c Mark Greer      2016-0=
2-29  645  		if (!ret)
6dd67645f22cfe drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
3-29  646  			ret =3D gb_audio_apbridgea_start_rx(data->connection,
5bbe14b7acc2a0 drivers/staging/greybus/audio_codec.c Mark Greer      2016-0=
2-29  647  							  0);
19866603be2ad5 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
8-04  648  		params->state =3D GBAUDIO_CODEC_START;
27c243cf5fcf4b drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
6-09  649  	} else if (mute && !stream) {/* stop playback */
6dd67645f22cfe drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
3-29  650  		ret =3D gb_audio_apbridgea_stop_tx(data->connection, 0);
5bbe14b7acc2a0 drivers/staging/greybus/audio_codec.c Mark Greer      2016-0=
2-29  651  		if (!ret)
6dd67645f22cfe drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
3-29  652  			ret =3D gb_audio_apbridgea_shutdown_tx(data->connection,
5bbe14b7acc2a0 drivers/staging/greybus/audio_codec.c Mark Greer      2016-0=
2-29  653  							     0);
19866603be2ad5 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
8-04  654  		params->state =3D GBAUDIO_CODEC_STOP;
27c243cf5fcf4b drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
6-09  655  	} else if (mute && stream) {/* stop capture */
6dd67645f22cfe drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
3-29  656  		ret =3D gb_audio_apbridgea_stop_rx(data->connection, 0);
5bbe14b7acc2a0 drivers/staging/greybus/audio_codec.c Mark Greer      2016-0=
2-29  657  		if (!ret)
6dd67645f22cfe drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
3-29  658  			ret =3D gb_audio_apbridgea_shutdown_rx(data->connection,
5bbe14b7acc2a0 drivers/staging/greybus/audio_codec.c Mark Greer      2016-0=
2-29  659  							     0);
19866603be2ad5 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
8-04  660  		params->state =3D GBAUDIO_CODEC_STOP;
9ae7a47f7f3226 drivers/staging/greybus/audio_codec.c Chase Metzger   2016-1=
0-09  661  	} else {
b7f0088df7369b drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
1-13  662  		ret =3D -EINVAL;
9ae7a47f7f3226 drivers/staging/greybus/audio_codec.c Chase Metzger   2016-1=
0-09  663  	}
9ae7a47f7f3226 drivers/staging/greybus/audio_codec.c Chase Metzger   2016-1=
0-09  664  =

b7f0088df7369b drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
1-13  665  	if (ret)
27c243cf5fcf4b drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
6-09  666  		dev_err_ratelimited(dai->dev,
27c243cf5fcf4b drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
6-09  667  				    "%s:Error during %s %s stream:%d\n",
27c243cf5fcf4b drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
6-09  668  				    module->name, mute ? "Mute" : "Unmute",
27c243cf5fcf4b drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
6-09  669  				    stream ? "Capture" : "Playback", ret);
b07868bda2fb61 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
2-16  670  =

c388ae76969926 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
8-04  671  	gb_pm_runtime_put_noidle(bundle);
6dd67645f22cfe drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
3-29  672  	mutex_unlock(&codec->lock);
90579d4b577154 drivers/staging/greybus/audio_codec.c Vaibhav Agarwal 2016-0=
8-04  673  	return ret;
d3d2af51f9c2f2 drivers/staging/greybus/audio-codec.c Vaibhav Agarwal 2015-1=
1-23  674  }
d3d2af51f9c2f2 drivers/staging/greybus/audio-codec.c Vaibhav Agarwal 2015-1=
1-23  675  =


:::::: The code at line 466 was first introduced by commit
:::::: ce9413062f8e2366916beebbfa8e73c6ff1a2c8c greybus: audio: Enable audi=
o path based on control switch state only

:::::: TO: Vaibhav Agarwal <vaibhav.agarwal@linaro.org>
:::::: CC: Greg Kroah-Hartman <gregkh@google.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============8351065535158913594==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
t6CP6CBzeYGyymX0P3ciPD8BwAEA
--===============8351065535158913594==--

