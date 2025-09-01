Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE25378F5D
	for <oe-kbuild@lists.linux.dev>; Mon,  1 Sep 2025 00:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756687822; cv=none; b=N4PHvgy50Lylof4VW6p/dEOwF7Dprg97HjGqfNNlfb9Nz6OuwMw+Oz2HViToxs6X/+l3gPv5/dtjU7s10dxH+6ohjw+H9Aipk5H/4cH9y1PqrkHwrwxkfhSbXFC1VOnTz3Fg0rvBhDQriSfGPyqPPgVQ31uuD1Ou89em4RNrxSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756687822; c=relaxed/simple;
	bh=ROnjD4WlnH6Se0UaxSXtdctjbwaMmVC9QMMJIlUFG/8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jO2gApm7KQglx4Xu+xHME6X72zSwhNr0Hffba7IBIh475Zs5mZgCIGoMiEu+nUVGDtN7KyG3jGlC+NAv3UYhL1uqlzPehlyHPbn0Mg1x/uFNQTHgzKiCWBi4DZC2S4zY7FYFCEWk7jiZ8dRpKxpR3KEP2FryLE1S4R9+MhKF9XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V4HYVmyM; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V4HYVmyM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756687821; x=1788223821;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ROnjD4WlnH6Se0UaxSXtdctjbwaMmVC9QMMJIlUFG/8=;
  b=V4HYVmyMHBjlK/CxF+/ijUYYCkr6idj8pWx3azsL0vZLo0aw86y6kV3x
   h8QE2L1a0FgkZNufYu1VI4bcNJWaLAhoraWS0/HTIoqBHIVy1EZzE95pW
   f6jyUD48BXz4mnR8o1LNCyhnjNnP5B/2GvThtZ19mKi5Jm6vyzh0Jokpd
   zXAFd1yxjh7vHezFgxCp3hEU4vEAoWiLaeDi9sTj8TsvRO/fxEANd3MmP
   HI0g2R2WWC3zKhzx5m5lf+c+6Hwp/83PNrxcswDT9c2yZ8kd/l5/A0YFP
   MGX+Fo7mYgkRDy/hH/XuxPXBOnuhylYJjxc8tAqZddImZgmNhdqnhgzvb
   g==;
X-CSE-ConnectionGUID: IpCuc35mR/qrI4Jji3eSoQ==
X-CSE-MsgGUID: jxsDY6QtS5O5t5RRhWQRcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11539"; a="62698066"
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="62698066"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2025 17:50:20 -0700
X-CSE-ConnectionGUID: E1v2n+EgSrOXfEZ7KiEwjw==
X-CSE-MsgGUID: JOPOltnDRXigmkByJEr1ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="170729570"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 31 Aug 2025 17:50:18 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1usskM-000WS3-22;
	Mon, 01 Sep 2025 00:50:13 +0000
Date: Mon, 1 Sep 2025 08:48:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [tiwai-sound:test/auto-cleanup 48/182]
 sound/firewire/motu/motu-pcm.c:192 pcm_open() warn: inconsistent returns
 '&motu->mutex'.
Message-ID: <202509010817.5QEm0VuS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: alsa-devel@alsa-project.org
TO: Takashi Iwai <tiwai@suse.de>
CC: Takashi Sakamoto <o-takashi@sakamocchi.jp>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git test/auto-cleanup
head:   05ed3b325aa04e0303cda18bc663b518eb26546e
commit: b9ac651964c9a719cd5fba2ec99f3afb6f159232 [48/182] ALSA: firewire: motu: Use guard() for mutex locks
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20250901 (https://download.01.org/0day-ci/archive/20250901/202509010817.5QEm0VuS-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202509010817.5QEm0VuS-lkp@intel.com/

smatch warnings:
sound/firewire/motu/motu-pcm.c:192 pcm_open() warn: inconsistent returns '&motu->mutex'.

vim +192 sound/firewire/motu/motu-pcm.c

dd49b2d1f04af9 Takashi Sakamoto 2017-03-22  129  
dd49b2d1f04af9 Takashi Sakamoto 2017-03-22  130  static int pcm_open(struct snd_pcm_substream *substream)
dd49b2d1f04af9 Takashi Sakamoto 2017-03-22  131  {
dd49b2d1f04af9 Takashi Sakamoto 2017-03-22  132  	struct snd_motu *motu = substream->private_data;
3fd80b2003882b Takashi Sakamoto 2019-10-07  133  	struct amdtp_domain *d = &motu->domain;
dd49b2d1f04af9 Takashi Sakamoto 2017-03-22  134  	enum snd_motu_clock_source src;
dd49b2d1f04af9 Takashi Sakamoto 2017-03-22  135  	int err;
dd49b2d1f04af9 Takashi Sakamoto 2017-03-22  136  
71c3797779d3cd Takashi Sakamoto 2017-03-22  137  	err = snd_motu_stream_lock_try(motu);
71c3797779d3cd Takashi Sakamoto 2017-03-22  138  	if (err < 0)
71c3797779d3cd Takashi Sakamoto 2017-03-22  139  		return err;
71c3797779d3cd Takashi Sakamoto 2017-03-22  140  
b9ac651964c9a7 Takashi Iwai     2025-08-28  141  	scoped_guard(mutex, &motu->mutex) {
8b460c76bd1712 Takashi Sakamoto 2017-08-20  142  		err = snd_motu_stream_cache_packet_formats(motu);
dd49b2d1f04af9 Takashi Sakamoto 2017-03-22  143  		if (err < 0)
71c3797779d3cd Takashi Sakamoto 2017-03-22  144  			goto err_locked;
dd49b2d1f04af9 Takashi Sakamoto 2017-03-22  145  
dd49b2d1f04af9 Takashi Sakamoto 2017-03-22  146  		err = init_hw_info(motu, substream);
dd49b2d1f04af9 Takashi Sakamoto 2017-03-22  147  		if (err < 0)
71c3797779d3cd Takashi Sakamoto 2017-03-22  148  			goto err_locked;
dd49b2d1f04af9 Takashi Sakamoto 2017-03-22  149  
ff222b7e45eb1f Takashi Sakamoto 2020-05-19  150  		err = snd_motu_protocol_get_clock_source(motu, &src);
dd49b2d1f04af9 Takashi Sakamoto 2017-03-22  151  		if (err < 0)
71c3797779d3cd Takashi Sakamoto 2017-03-22  152  			goto err_locked;
3fd80b2003882b Takashi Sakamoto 2019-10-07  153  
3fd80b2003882b Takashi Sakamoto 2019-10-07  154  		// When source of clock is not internal or any stream is reserved for
3fd80b2003882b Takashi Sakamoto 2019-10-07  155  		// transmission of PCM frames, the available sampling rate is limited
3fd80b2003882b Takashi Sakamoto 2019-10-07  156  		// at current one.
3f58f004bff327 Takashi Sakamoto 2019-10-30  157  		if ((src != SND_MOTU_CLOCK_SOURCE_INTERNAL &&
3f58f004bff327 Takashi Sakamoto 2019-10-30  158  		     src != SND_MOTU_CLOCK_SOURCE_SPH) ||
3fd80b2003882b Takashi Sakamoto 2019-10-07  159  		    (motu->substreams_counter > 0 && d->events_per_period > 0)) {
3fd80b2003882b Takashi Sakamoto 2019-10-07  160  			unsigned int frames_per_period = d->events_per_period;
0f5482e7875bc2 Takashi Sakamoto 2019-10-18  161  			unsigned int frames_per_buffer = d->events_per_buffer;
3fd80b2003882b Takashi Sakamoto 2019-10-07  162  			unsigned int rate;
3fd80b2003882b Takashi Sakamoto 2019-10-07  163  
ff222b7e45eb1f Takashi Sakamoto 2020-05-19  164  			err = snd_motu_protocol_get_clock_rate(motu, &rate);
dd49b2d1f04af9 Takashi Sakamoto 2017-03-22  165  			if (err < 0)
71c3797779d3cd Takashi Sakamoto 2017-03-22  166  				goto err_locked;
3fd80b2003882b Takashi Sakamoto 2019-10-07  167  
dd49b2d1f04af9 Takashi Sakamoto 2017-03-22  168  			substream->runtime->hw.rate_min = rate;
dd49b2d1f04af9 Takashi Sakamoto 2017-03-22  169  			substream->runtime->hw.rate_max = rate;
3fd80b2003882b Takashi Sakamoto 2019-10-07  170  
3fd80b2003882b Takashi Sakamoto 2019-10-07  171  			if (frames_per_period > 0) {
3fd80b2003882b Takashi Sakamoto 2019-10-07  172  				err = snd_pcm_hw_constraint_minmax(substream->runtime,
3fd80b2003882b Takashi Sakamoto 2019-10-07  173  								   SNDRV_PCM_HW_PARAM_PERIOD_SIZE,
3fd80b2003882b Takashi Sakamoto 2019-10-07  174  								   frames_per_period, frames_per_period);
9ff3483e5c5523 Takashi Sakamoto 2019-12-09  175  				if (err < 0)
3fd80b2003882b Takashi Sakamoto 2019-10-07  176  					goto err_locked;
0f5482e7875bc2 Takashi Sakamoto 2019-10-18  177  
0f5482e7875bc2 Takashi Sakamoto 2019-10-18  178  				err = snd_pcm_hw_constraint_minmax(substream->runtime,
0f5482e7875bc2 Takashi Sakamoto 2019-10-18  179  								   SNDRV_PCM_HW_PARAM_BUFFER_SIZE,
0f5482e7875bc2 Takashi Sakamoto 2019-10-18  180  								   frames_per_buffer, frames_per_buffer);
9ff3483e5c5523 Takashi Sakamoto 2019-12-09  181  				if (err < 0)
0f5482e7875bc2 Takashi Sakamoto 2019-10-18  182  					goto err_locked;
0f5482e7875bc2 Takashi Sakamoto 2019-10-18  183  			}
3fd80b2003882b Takashi Sakamoto 2019-10-07  184  		}
b9ac651964c9a7 Takashi Iwai     2025-08-28  185  	}
dd49b2d1f04af9 Takashi Sakamoto 2017-03-22  186  
dd49b2d1f04af9 Takashi Sakamoto 2017-03-22  187  	snd_pcm_set_sync(substream);
dd49b2d1f04af9 Takashi Sakamoto 2017-03-22  188  
3fd80b2003882b Takashi Sakamoto 2019-10-07  189  	return 0;
71c3797779d3cd Takashi Sakamoto 2017-03-22  190  err_locked:
71c3797779d3cd Takashi Sakamoto 2017-03-22  191  	snd_motu_stream_lock_release(motu);
dd49b2d1f04af9 Takashi Sakamoto 2017-03-22 @192  	return err;
dd49b2d1f04af9 Takashi Sakamoto 2017-03-22  193  }
dd49b2d1f04af9 Takashi Sakamoto 2017-03-22  194  

:::::: The code at line 192 was first introduced by commit
:::::: dd49b2d1f04af9b1f44e9fe82c85f374f662c61b ALSA: firewire-motu: add PCM functionality

:::::: TO: Takashi Sakamoto <o-takashi@sakamocchi.jp>
:::::: CC: Takashi Iwai <tiwai@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
