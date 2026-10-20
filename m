Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792472208;
	b=BgnaLahaE79Uf1TOU6jt53IEETDsI9WtdOaTcWrbvDiaqjvbto7PIJUFzHkA4Cgo/koT
	 B4Xq2OnQbwUMLu+2aqI/55Mh208ypx4wq0OQR9t2QutErjv8BYEEyfkgJi6odlRRivvcu
	 HkMVIfssF121AFeB8k1cugI9B4suipxkIMZy+1PcM7U3L3WwzPyOjTuWGbNSM2PxhS/Ke
	 XOevcd6upO8j5t1kDvSUGqO/ctjPtOn3LFPUo6lY1whwa0GxvPBjBhID2wIJpykCISLCe
	 TyQQtuu+wL0Cpafx/vAbLotcIQwnHEO9B79xURdOxCXXozJ2gTPkFw7PApAscj5/pgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792472208;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=5m79s51rflkAOtHYvSKiZ0LdcXQPL+SxZ5F6zn+mwMw=;
	b=FZJyGNIWNfvnGHoLiz0K7p6a2MYFFg6D4z0a9p9BoxGDNEOguFII6d/NmADaUXfAVhMB
	 gaYomjidDomwP0a9CZWEUVVfvz0IDGmExwm/GjQ4YXzn57RwLj28icDcxg7NN1T4UGeZd
	 SyuuqfVTkBICzkD6tEAGmBuAa6QKNouNd0VoXFX1v5bpIXcOzbCrbcQUjCuSz60HhEdof
	 fxSTNM/H8HPXI0KM68JVEfu6EZuyNYX6pK00aZzxDMwus1sWw2+//h9BRhP0VY4MLW45q
	 ORnLh4rw3JIqqODm9suXggPYnHSbVT4VUmuB7PYHofjjBqHnoGeSXnj2WSBV/nDur/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BX7rQxWl;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCCF6606A319
	for <oe-kbuild@lists.linux.dev>; Tue, 20 Oct 2026 04:56:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCCF6606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BX7rQxWl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792472207; x=1824008207;
  h=date:from:to:cc:subject:message-id;
  bh=nja+uxoSb0xOU0dyAMdAk3f14DRnGjIuJf3sTX8PiKo=;
  b=BX7rQxWlgHa++s+5MxUi3zufV/bkGnZrtLG0t9b9JvxYVQ0b1WtPm67r
   k2C245DVeBXXkQO3cthChwBzY1oE50E+h6WTZrQRgKlDdgIaL7b9cwMdk
   qgV8adJsoQ792AkLmp+494rYxCWNbCtR4G7RRfn6U3sMqg7AptqU6s+yW
   fFLALDUm98UB1TRV1LGw1hEPH+VREYtBnY8XmG8JtXlKbyJQ/Wtu7VX1W
   8IN86bleeKutqpCsEUwIAJVWxH99uyi00Qclb95BTo2JsjTmXywqfinMq
   y7G0Sauu9zjWFTgWwfHABVulEVtL3jWAZLMe9niNHMj3pPCbAJL1byYQn
   Q==;
X-CSE-ConnectionGUID: FE+WHvR4S/qv8qaJI/PoKw==
X-CSE-MsgGUID: vXexGBmZSNOKFFxYNU/aSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1057131"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1057131"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 21:56:46 -0700
X-CSE-ConnectionGUID: r4b+7Z5KSAe6xp5y+adgbA==
X-CSE-MsgGUID: /lnpX3VDR/i1ZbGTC4EgKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="4530027"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 19 Oct 2026 21:56:46 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xJ1tz-0000000065v-01YN;
	Tue, 20 Oct 2026 04:56:43 +0000
Date: Tue, 20 Oct 2026 06:56:19 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android12-kiwi-5.10 291/291]
 sound/usb/pcm.c:1053 snd_usb_pcm_prepare() warn: variable dereferenced before
 check 'subs->cur_audiofmt' (see line 1049)
Message-ID: <202610200641.Ba5XQ2g4-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   aaa0cf06ed53d6805dfa9099535f6fc052c49086
commit: 1eb185541df90c3f790676b9ac362683de3519f2 [291/291] ANDROID: sound: usb: Add vendor's hooking interface
:::::: branch date: 14 hours ago
:::::: commit date: 6 years ago
config: i386-randconfig-2200-20261020 (https://download.01.org/0day-ci/archive/20261020/202610200641.Ba5XQ2g4-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610200641.Ba5XQ2g4-lkp@intel.com/

smatch warnings:
sound/usb/pcm.c:1053 snd_usb_pcm_prepare() warn: variable dereferenced before check 'subs->cur_audiofmt' (see line 1049)

vim +1053 sound/usb/pcm.c

e5779998bf8b70e Daniel Mack          2010-03-04  1035  
e5779998bf8b70e Daniel Mack          2010-03-04  1036  /*
e5779998bf8b70e Daniel Mack          2010-03-04  1037   * prepare callback
e5779998bf8b70e Daniel Mack          2010-03-04  1038   *
e5779998bf8b70e Daniel Mack          2010-03-04  1039   * only a few subtle things...
e5779998bf8b70e Daniel Mack          2010-03-04  1040   */
e5779998bf8b70e Daniel Mack          2010-03-04  1041  static int snd_usb_pcm_prepare(struct snd_pcm_substream *substream)
e5779998bf8b70e Daniel Mack          2010-03-04  1042  {
e5779998bf8b70e Daniel Mack          2010-03-04  1043  	struct snd_pcm_runtime *runtime = substream->runtime;
e5779998bf8b70e Daniel Mack          2010-03-04  1044  	struct snd_usb_substream *subs = runtime->private_data;
61a709504b07911 Dylan Reid           2012-09-18  1045  	struct usb_host_interface *alts;
61a709504b07911 Dylan Reid           2012-09-18  1046  	struct usb_interface *iface;
61a709504b07911 Dylan Reid           2012-09-18  1047  	int ret;
e5779998bf8b70e Daniel Mack          2010-03-04  1048  
1eb185541df90c3 JaeHun Jung          2020-05-26 @1049  	ret = snd_vendor_set_pcm_buf(subs->dev, subs->cur_audiofmt->iface);
1eb185541df90c3 JaeHun Jung          2020-05-26  1050  	if (ret)
1eb185541df90c3 JaeHun Jung          2020-05-26  1051  		return ret;
1eb185541df90c3 JaeHun Jung          2020-05-26  1052  
e5779998bf8b70e Daniel Mack          2010-03-04 @1053  	if (! subs->cur_audiofmt) {
0ba41d917eeb87f Takashi Iwai         2014-02-26  1054  		dev_err(&subs->dev->dev, "no format is specified!\n");
e5779998bf8b70e Daniel Mack          2010-03-04  1055  		return -ENXIO;
e5779998bf8b70e Daniel Mack          2010-03-04  1056  	}
e5779998bf8b70e Daniel Mack          2010-03-04  1057  
47ab154593827b1 Takashi Iwai         2015-08-25  1058  	ret = snd_usb_lock_shutdown(subs->stream->chip);
47ab154593827b1 Takashi Iwai         2015-08-25  1059  	if (ret < 0)
47ab154593827b1 Takashi Iwai         2015-08-25  1060  		return ret;
978520b75f0a1ce Takashi Iwai         2012-10-12  1061  	if (snd_BUG_ON(!subs->data_endpoint)) {
978520b75f0a1ce Takashi Iwai         2012-10-12  1062  		ret = -EIO;
978520b75f0a1ce Takashi Iwai         2012-10-12  1063  		goto unlock;
978520b75f0a1ce Takashi Iwai         2012-10-12  1064  	}
edcd3633e72a159 Daniel Mack          2012-04-12  1065  
a0a4959eb4e94ce Jorge Sanjuan        2018-07-31  1066  	ret = snd_usb_pcm_change_state(subs, UAC3_PD_STATE_D0);
a0a4959eb4e94ce Jorge Sanjuan        2018-07-31  1067  	if (ret < 0)
a0a4959eb4e94ce Jorge Sanjuan        2018-07-31  1068  		goto unlock;
a0a4959eb4e94ce Jorge Sanjuan        2018-07-31  1069  
61a709504b07911 Dylan Reid           2012-09-18  1070  	ret = set_format(subs, subs->cur_audiofmt);
61a709504b07911 Dylan Reid           2012-09-18  1071  	if (ret < 0)
978520b75f0a1ce Takashi Iwai         2012-10-12  1072  		goto unlock;
61a709504b07911 Dylan Reid           2012-09-18  1073  
1e2e3fe480064ca Daniel Girnus        2016-12-06  1074  	if (subs->need_setup_ep) {
1e2e3fe480064ca Daniel Girnus        2016-12-06  1075  
61a709504b07911 Dylan Reid           2012-09-18  1076  		iface = usb_ifnum_to_if(subs->dev, subs->cur_audiofmt->iface);
61a709504b07911 Dylan Reid           2012-09-18  1077  		alts = &iface->altsetting[subs->cur_audiofmt->altset_idx];
61a709504b07911 Dylan Reid           2012-09-18  1078  		ret = snd_usb_init_sample_rate(subs->stream->chip,
61a709504b07911 Dylan Reid           2012-09-18  1079  					       subs->cur_audiofmt->iface,
61a709504b07911 Dylan Reid           2012-09-18  1080  					       alts,
61a709504b07911 Dylan Reid           2012-09-18  1081  					       subs->cur_audiofmt,
61a709504b07911 Dylan Reid           2012-09-18  1082  					       subs->cur_rate);
61a709504b07911 Dylan Reid           2012-09-18  1083  		if (ret < 0)
978520b75f0a1ce Takashi Iwai         2012-10-12  1084  			goto unlock;
61a709504b07911 Dylan Reid           2012-09-18  1085  
1eb185541df90c3 JaeHun Jung          2020-05-26  1086  		if (snd_vendor_get_ops()) {
1eb185541df90c3 JaeHun Jung          2020-05-26  1087  			ret = snd_vendor_set_rate(iface,
1eb185541df90c3 JaeHun Jung          2020-05-26  1088  						  subs->cur_audiofmt->iface,
1eb185541df90c3 JaeHun Jung          2020-05-26  1089  						  subs->cur_rate,
1eb185541df90c3 JaeHun Jung          2020-05-26  1090  						  subs->cur_audiofmt->altsetting);
1eb185541df90c3 JaeHun Jung          2020-05-26  1091  			if (!ret) {
1eb185541df90c3 JaeHun Jung          2020-05-26  1092  				subs->need_setup_ep = false;
1eb185541df90c3 JaeHun Jung          2020-05-26  1093  				goto unlock;
1eb185541df90c3 JaeHun Jung          2020-05-26  1094  			}
1eb185541df90c3 JaeHun Jung          2020-05-26  1095  		}
1eb185541df90c3 JaeHun Jung          2020-05-26  1096  
61a709504b07911 Dylan Reid           2012-09-18  1097  		ret = configure_endpoint(subs);
61a709504b07911 Dylan Reid           2012-09-18  1098  		if (ret < 0)
978520b75f0a1ce Takashi Iwai         2012-10-12  1099  			goto unlock;
384dc085c32285e Takashi Iwai         2012-09-18  1100  		subs->need_setup_ep = false;
384dc085c32285e Takashi Iwai         2012-09-18  1101  	}
61a709504b07911 Dylan Reid           2012-09-18  1102  
e5779998bf8b70e Daniel Mack          2010-03-04  1103  	/* some unit conversions in runtime */
edcd3633e72a159 Daniel Mack          2012-04-12  1104  	subs->data_endpoint->maxframesize =
edcd3633e72a159 Daniel Mack          2012-04-12  1105  		bytes_to_frames(runtime, subs->data_endpoint->maxpacksize);
edcd3633e72a159 Daniel Mack          2012-04-12  1106  	subs->data_endpoint->curframesize =
edcd3633e72a159 Daniel Mack          2012-04-12  1107  		bytes_to_frames(runtime, subs->data_endpoint->curpacksize);
e5779998bf8b70e Daniel Mack          2010-03-04  1108  
e5779998bf8b70e Daniel Mack          2010-03-04  1109  	/* reset the pointer */
e5779998bf8b70e Daniel Mack          2010-03-04  1110  	subs->hwptr_done = 0;
e5779998bf8b70e Daniel Mack          2010-03-04  1111  	subs->transfer_done = 0;
294c4fb8ab01728 Pierre-Louis Bossart 2011-09-06  1112  	subs->last_delay = 0;
294c4fb8ab01728 Pierre-Louis Bossart 2011-09-06  1113  	subs->last_frame_number = 0;
e5779998bf8b70e Daniel Mack          2010-03-04  1114  	runtime->delay = 0;
e5779998bf8b70e Daniel Mack          2010-03-04  1115  
edcd3633e72a159 Daniel Mack          2012-04-12  1116  	/* for playback, submit the URBs now; otherwise, the first hwptr_done
edcd3633e72a159 Daniel Mack          2012-04-12  1117  	 * updates for all URBs would happen at the same time when starting */
edcd3633e72a159 Daniel Mack          2012-04-12  1118  	if (subs->direction == SNDRV_PCM_STREAM_PLAYBACK)
1d0f953086f090a Ioan-Adrian Ratiu    2017-01-05  1119  		ret = start_endpoints(subs);
edcd3633e72a159 Daniel Mack          2012-04-12  1120  
978520b75f0a1ce Takashi Iwai         2012-10-12  1121   unlock:
47ab154593827b1 Takashi Iwai         2015-08-25  1122  	snd_usb_unlock_shutdown(subs->stream->chip);
978520b75f0a1ce Takashi Iwai         2012-10-12  1123  	return ret;
e5779998bf8b70e Daniel Mack          2010-03-04  1124  }
e5779998bf8b70e Daniel Mack          2010-03-04  1125  

:::::: The code at line 1053 was first introduced by commit
:::::: e5779998bf8b70e48a6cc208c8b61b33bd6117ea ALSA: usb-audio: refactor code

:::::: TO: Daniel Mack <daniel@caiaq.de>
:::::: CC: Takashi Iwai <tiwai@suse.de>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
