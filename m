Content-Type: multipart/mixed; boundary="===============4170619753092578346=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [android-common:android12-5.4 8477/11488] sound/usb/pcm.c:1033 snd_usb_pcm_prepare() warn: variable dereferenced before check 'subs->cur_audiofmt' (see line 1029)
Date: Fri, 23 Oct 2020 05:49:58 +0800
Message-ID: <202010230553.ZQ0bKgzs-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4170619753092578346==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: cros-kernel-buildreports(a)googlegroups.com

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   d145279a1d71797906a4c805919408288fdd5259
commit: fd98495a63a8e99ae4b6802b73295ef997684d73 [8477/11488] ANDROID: soun=
d: usb: Add vendor's hooking interface
:::::: branch date: 2 hours ago
:::::: commit date: 3 months ago
config: i386-randconfig-m031-20201022 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
sound/usb/pcm.c:1033 snd_usb_pcm_prepare() warn: variable dereferenced befo=
re check 'subs->cur_audiofmt' (see line 1029)

Old smatch warnings:
sound/usb/pcm.c:787 configure_sync_endpoint() warn: variable dereferenced b=
efore check 'subs->stream' (see line 784)

vim +1033 sound/usb/pcm.c

e5779998bf8b70e Daniel Mack          2010-03-04  1015  =

e5779998bf8b70e Daniel Mack          2010-03-04  1016  /*
e5779998bf8b70e Daniel Mack          2010-03-04  1017   * prepare callback
e5779998bf8b70e Daniel Mack          2010-03-04  1018   *
e5779998bf8b70e Daniel Mack          2010-03-04  1019   * only a few subtle=
 things...
e5779998bf8b70e Daniel Mack          2010-03-04  1020   */
e5779998bf8b70e Daniel Mack          2010-03-04  1021  static int snd_usb_p=
cm_prepare(struct snd_pcm_substream *substream)
e5779998bf8b70e Daniel Mack          2010-03-04  1022  {
e5779998bf8b70e Daniel Mack          2010-03-04  1023  	struct snd_pcm_runt=
ime *runtime =3D substream->runtime;
e5779998bf8b70e Daniel Mack          2010-03-04  1024  	struct snd_usb_subs=
tream *subs =3D runtime->private_data;
61a709504b07911 Dylan Reid           2012-09-18  1025  	struct usb_host_int=
erface *alts;
61a709504b07911 Dylan Reid           2012-09-18  1026  	struct usb_interfac=
e *iface;
61a709504b07911 Dylan Reid           2012-09-18  1027  	int ret;
e5779998bf8b70e Daniel Mack          2010-03-04  1028  =

fd98495a63a8e99 JaeHun Jung          2020-05-26 @1029  	ret =3D snd_vendor_=
set_pcm_buf(subs->dev, subs->cur_audiofmt->iface);
fd98495a63a8e99 JaeHun Jung          2020-05-26  1030  	if (ret)
fd98495a63a8e99 JaeHun Jung          2020-05-26  1031  		return ret;
fd98495a63a8e99 JaeHun Jung          2020-05-26  1032  =

e5779998bf8b70e Daniel Mack          2010-03-04 @1033  	if (! subs->cur_aud=
iofmt) {
0ba41d917eeb87f Takashi Iwai         2014-02-26  1034  		dev_err(&subs->dev=
->dev, "no format is specified!\n");
e5779998bf8b70e Daniel Mack          2010-03-04  1035  		return -ENXIO;
e5779998bf8b70e Daniel Mack          2010-03-04  1036  	}
e5779998bf8b70e Daniel Mack          2010-03-04  1037  =

47ab154593827b1 Takashi Iwai         2015-08-25  1038  	ret =3D snd_usb_loc=
k_shutdown(subs->stream->chip);
47ab154593827b1 Takashi Iwai         2015-08-25  1039  	if (ret < 0)
47ab154593827b1 Takashi Iwai         2015-08-25  1040  		return ret;
978520b75f0a1ce Takashi Iwai         2012-10-12  1041  	if (snd_BUG_ON(!sub=
s->data_endpoint)) {
978520b75f0a1ce Takashi Iwai         2012-10-12  1042  		ret =3D -EIO;
978520b75f0a1ce Takashi Iwai         2012-10-12  1043  		goto unlock;
978520b75f0a1ce Takashi Iwai         2012-10-12  1044  	}
edcd3633e72a159 Daniel Mack          2012-04-12  1045  =

f58161ba1b05a96 Takashi Iwai         2012-11-08  1046  	snd_usb_endpoint_sy=
nc_pending_stop(subs->sync_endpoint);
f58161ba1b05a96 Takashi Iwai         2012-11-08  1047  	snd_usb_endpoint_sy=
nc_pending_stop(subs->data_endpoint);
f58161ba1b05a96 Takashi Iwai         2012-11-08  1048  =

a0a4959eb4e94ce Jorge Sanjuan        2018-07-31  1049  	ret =3D snd_usb_pcm=
_change_state(subs, UAC3_PD_STATE_D0);
a0a4959eb4e94ce Jorge Sanjuan        2018-07-31  1050  	if (ret < 0)
a0a4959eb4e94ce Jorge Sanjuan        2018-07-31  1051  		goto unlock;
a0a4959eb4e94ce Jorge Sanjuan        2018-07-31  1052  =

61a709504b07911 Dylan Reid           2012-09-18  1053  	ret =3D set_format(=
subs, subs->cur_audiofmt);
61a709504b07911 Dylan Reid           2012-09-18  1054  	if (ret < 0)
978520b75f0a1ce Takashi Iwai         2012-10-12  1055  		goto unlock;
61a709504b07911 Dylan Reid           2012-09-18  1056  =

1e2e3fe480064ca Daniel Girnus        2016-12-06  1057  	if (subs->need_setu=
p_ep) {
1e2e3fe480064ca Daniel Girnus        2016-12-06  1058  =

61a709504b07911 Dylan Reid           2012-09-18  1059  		iface =3D usb_ifnu=
m_to_if(subs->dev, subs->cur_audiofmt->iface);
61a709504b07911 Dylan Reid           2012-09-18  1060  		alts =3D &iface->a=
ltsetting[subs->cur_audiofmt->altset_idx];
61a709504b07911 Dylan Reid           2012-09-18  1061  		ret =3D snd_usb_in=
it_sample_rate(subs->stream->chip,
61a709504b07911 Dylan Reid           2012-09-18  1062  					       subs->cu=
r_audiofmt->iface,
61a709504b07911 Dylan Reid           2012-09-18  1063  					       alts,
61a709504b07911 Dylan Reid           2012-09-18  1064  					       subs->cu=
r_audiofmt,
61a709504b07911 Dylan Reid           2012-09-18  1065  					       subs->cu=
r_rate);
61a709504b07911 Dylan Reid           2012-09-18  1066  		if (ret < 0)
978520b75f0a1ce Takashi Iwai         2012-10-12  1067  			goto unlock;
61a709504b07911 Dylan Reid           2012-09-18  1068  =

fd98495a63a8e99 JaeHun Jung          2020-05-26  1069  		if (snd_vendor_get=
_ops()) {
fd98495a63a8e99 JaeHun Jung          2020-05-26  1070  			ret =3D snd_vendo=
r_set_rate(iface,
fd98495a63a8e99 JaeHun Jung          2020-05-26  1071  						  subs->cur_au=
diofmt->iface,
fd98495a63a8e99 JaeHun Jung          2020-05-26  1072  						  subs->cur_ra=
te,
fd98495a63a8e99 JaeHun Jung          2020-05-26  1073  						  subs->cur_au=
diofmt->altsetting);
fd98495a63a8e99 JaeHun Jung          2020-05-26  1074  			if (!ret) {
fd98495a63a8e99 JaeHun Jung          2020-05-26  1075  				subs->need_setup=
_ep =3D false;
fd98495a63a8e99 JaeHun Jung          2020-05-26  1076  				goto unlock;
fd98495a63a8e99 JaeHun Jung          2020-05-26  1077  			}
fd98495a63a8e99 JaeHun Jung          2020-05-26  1078  		}
fd98495a63a8e99 JaeHun Jung          2020-05-26  1079  =

61a709504b07911 Dylan Reid           2012-09-18  1080  		ret =3D configure_=
endpoint(subs);
61a709504b07911 Dylan Reid           2012-09-18  1081  		if (ret < 0)
978520b75f0a1ce Takashi Iwai         2012-10-12  1082  			goto unlock;
384dc085c32285e Takashi Iwai         2012-09-18  1083  		subs->need_setup_e=
p =3D false;
384dc085c32285e Takashi Iwai         2012-09-18  1084  	}
61a709504b07911 Dylan Reid           2012-09-18  1085  =

e5779998bf8b70e Daniel Mack          2010-03-04  1086  	/* some unit conver=
sions in runtime */
edcd3633e72a159 Daniel Mack          2012-04-12  1087  	subs->data_endpoint=
->maxframesize =3D
edcd3633e72a159 Daniel Mack          2012-04-12  1088  		bytes_to_frames(ru=
ntime, subs->data_endpoint->maxpacksize);
edcd3633e72a159 Daniel Mack          2012-04-12  1089  	subs->data_endpoint=
->curframesize =3D
edcd3633e72a159 Daniel Mack          2012-04-12  1090  		bytes_to_frames(ru=
ntime, subs->data_endpoint->curpacksize);
e5779998bf8b70e Daniel Mack          2010-03-04  1091  =

e5779998bf8b70e Daniel Mack          2010-03-04  1092  	/* reset the pointe=
r */
e5779998bf8b70e Daniel Mack          2010-03-04  1093  	subs->hwptr_done =
=3D 0;
e5779998bf8b70e Daniel Mack          2010-03-04  1094  	subs->transfer_done=
 =3D 0;
294c4fb8ab01728 Pierre-Louis Bossart 2011-09-06  1095  	subs->last_delay =
=3D 0;
294c4fb8ab01728 Pierre-Louis Bossart 2011-09-06  1096  	subs->last_frame_nu=
mber =3D 0;
e5779998bf8b70e Daniel Mack          2010-03-04  1097  	runtime->delay =3D =
0;
e5779998bf8b70e Daniel Mack          2010-03-04  1098  =

edcd3633e72a159 Daniel Mack          2012-04-12  1099  	/* for playback, su=
bmit the URBs now; otherwise, the first hwptr_done
edcd3633e72a159 Daniel Mack          2012-04-12  1100  	 * updates for all =
URBs would happen at the same time when starting */
edcd3633e72a159 Daniel Mack          2012-04-12  1101  	if (subs->direction=
 =3D=3D SNDRV_PCM_STREAM_PLAYBACK)
1d0f953086f090a Ioan-Adrian Ratiu    2017-01-05  1102  		ret =3D start_endp=
oints(subs);
edcd3633e72a159 Daniel Mack          2012-04-12  1103  =

978520b75f0a1ce Takashi Iwai         2012-10-12  1104   unlock:
47ab154593827b1 Takashi Iwai         2015-08-25  1105  	snd_usb_unlock_shut=
down(subs->stream->chip);
978520b75f0a1ce Takashi Iwai         2012-10-12  1106  	return ret;
e5779998bf8b70e Daniel Mack          2010-03-04  1107  }
e5779998bf8b70e Daniel Mack          2010-03-04  1108  =


:::::: The code at line 1033 was first introduced by commit
:::::: e5779998bf8b70e48a6cc208c8b61b33bd6117ea ALSA: usb-audio: refactor c=
ode

:::::: TO: Daniel Mack <daniel@caiaq.de>
:::::: CC: Takashi Iwai <tiwai@suse.de>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============4170619753092578346==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
TbaJMQmHYESwnd+12e3/AfBqiuA5JgIA
--===============4170619753092578346==--

