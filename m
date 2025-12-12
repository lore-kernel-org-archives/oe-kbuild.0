Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D1014B953
	for <oe-kbuild@lists.linux.dev>; Fri, 12 Dec 2025 06:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765520872; cv=none; b=ABpJSzgS+4kz0S0JNSTh2QdjYrToGAOWtJv6UO0u4mtSWHp86Kwa0NDUvE9RxXOq8yjk646hKyGBv3b+kcT0mzBBjF66AZPNl3HnHUEz258drXN+fR8XgxTVaNvDpiVlXadc9W2w/DeXygzKsVV71aScVyDYZW/f4lyobVdOBnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765520872; c=relaxed/simple;
	bh=XNDeO58WUOeuGqJyaiGqKD2eoKsH74oWaQXhP5SywCs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b0dDL68+32281BjGo//Lmj3e3FSM2BQG6t2gaGAsMiUdzbLQ5ZhsaXkBDboXMIukuCoD+q+BdbnBi1u3bxEWUYqbtFO5RE1Yxn7nura05KqQ5doxvOEwWHQHmHtNX6JvBu3YQ5txb2N7L/Evi5SISP9Hy0Kh+M807eM+FEzvjaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HJLStLO5; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HJLStLO5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765520870; x=1797056870;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XNDeO58WUOeuGqJyaiGqKD2eoKsH74oWaQXhP5SywCs=;
  b=HJLStLO571K4F4GRsTL/1GNOY92TCMvKAo85oUObKi93mNCWSEkpoVlU
   LvVSowwp43RVyHVxTmeK+iLs1gXmi6awri/WqBMvdppHKKymyVj71LRAw
   YPXCOViEOPUU5FFXALDaeXevhwB59D6tUO8dWxB1O8jqJF5o0BNZ3ksSd
   8LFGxW52CptEeCYCzvqJ2c2EbCoyJ9cJxKaVjB4fJQtrgnDZcOFdRlHdG
   1rSdv+wint5ZnC/+4ZE3XGi9K3aZ/fcyHOl8YILoMJ4koQkWFKf/RjVGX
   8qAoQFiL0cj3AnxRBq+ZurSrDc6t0ulwCvE2/LvGpE9F/RP73eqP24nCY
   g==;
X-CSE-ConnectionGUID: 855fPYZBR6W/5yBhJKgfkw==
X-CSE-MsgGUID: Y6NLnBTfQg+t2GHPYFvEHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="78214767"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="78214767"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 22:27:33 -0800
X-CSE-ConnectionGUID: RWWWpGiLQoimI4ufr6ODnw==
X-CSE-MsgGUID: OX2zowbFQxWemiOGMDKxxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="201477538"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 11 Dec 2025 22:27:31 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTwcj-000000005fH-0T4K;
	Fri, 12 Dec 2025 06:27:29 +0000
Date: Fri, 12 Dec 2025 14:26:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: sound/core/pcm_native.c:3210 snd_pcm_ioctl_sync_ptr_compat() error:
 uninitialized symbol 'sflags'.
Message-ID: <202512121443.4jiqxOkD-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Christophe Leroy <christophe.leroy@csgroup.eu>
CC: Takashi Iwai <tiwai@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d358e5254674b70f34c847715ca509e46eb81e6f
commit: a9b49bf8ad5905ebd999da345dcff3b9fad43877 ALSA: pcm: Convert SNDRV_PCM_IOCTL_SYNC_PTR to user_access_begin/user_access_end()
date:   6 months ago
:::::: branch date: 27 hours ago
:::::: commit date: 6 months ago
config: i386-randconfig-141-20251212 (https://download.01.org/0day-ci/archive/20251212/202512121443.4jiqxOkD-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512121443.4jiqxOkD-lkp@intel.com/

smatch warnings:
sound/core/pcm_native.c:3210 snd_pcm_ioctl_sync_ptr_compat() error: uninitialized symbol 'sflags'.

vim +/sflags +3210 sound/core/pcm_native.c

09d94175dbeac1 Arnd Bergmann    2018-04-24  3192  
09d94175dbeac1 Arnd Bergmann    2018-04-24  3193  static int snd_pcm_ioctl_sync_ptr_compat(struct snd_pcm_substream *substream,
09d94175dbeac1 Arnd Bergmann    2018-04-24  3194  					 struct snd_pcm_sync_ptr32 __user *src)
09d94175dbeac1 Arnd Bergmann    2018-04-24  3195  {
09d94175dbeac1 Arnd Bergmann    2018-04-24  3196  	struct snd_pcm_runtime *runtime = substream->runtime;
09d94175dbeac1 Arnd Bergmann    2018-04-24  3197  	volatile struct snd_pcm_mmap_status *status;
09d94175dbeac1 Arnd Bergmann    2018-04-24  3198  	volatile struct snd_pcm_mmap_control *control;
09d94175dbeac1 Arnd Bergmann    2018-04-24  3199  	u32 sflags;
09d94175dbeac1 Arnd Bergmann    2018-04-24  3200  	struct snd_pcm_mmap_control scontrol;
09d94175dbeac1 Arnd Bergmann    2018-04-24  3201  	struct snd_pcm_mmap_status sstatus;
09d94175dbeac1 Arnd Bergmann    2018-04-24  3202  	snd_pcm_uframes_t boundary;
09d94175dbeac1 Arnd Bergmann    2018-04-24  3203  	int err;
09d94175dbeac1 Arnd Bergmann    2018-04-24  3204  
09d94175dbeac1 Arnd Bergmann    2018-04-24  3205  	if (snd_BUG_ON(!runtime))
09d94175dbeac1 Arnd Bergmann    2018-04-24  3206  		return -EINVAL;
09d94175dbeac1 Arnd Bergmann    2018-04-24  3207  
2acd83beb4d3fd Christophe Leroy 2025-06-14  3208  	if (snd_pcm_sync_ptr_get_user(sflags, scontrol, src))
09d94175dbeac1 Arnd Bergmann    2018-04-24  3209  		return -EFAULT;
09d94175dbeac1 Arnd Bergmann    2018-04-24 @3210  	if (sflags & SNDRV_PCM_SYNC_PTR_HWSYNC) {
09d94175dbeac1 Arnd Bergmann    2018-04-24  3211  		err = snd_pcm_hwsync(substream);
09d94175dbeac1 Arnd Bergmann    2018-04-24  3212  		if (err < 0)
09d94175dbeac1 Arnd Bergmann    2018-04-24  3213  			return err;
09d94175dbeac1 Arnd Bergmann    2018-04-24  3214  	}
09d94175dbeac1 Arnd Bergmann    2018-04-24  3215  	status = runtime->status;
09d94175dbeac1 Arnd Bergmann    2018-04-24  3216  	control = runtime->control;
09d94175dbeac1 Arnd Bergmann    2018-04-24  3217  	boundary = recalculate_boundary(runtime);
09d94175dbeac1 Arnd Bergmann    2018-04-24  3218  	if (! boundary)
09d94175dbeac1 Arnd Bergmann    2018-04-24  3219  		boundary = 0x7fffffff;
650224fe8d5f6d Takashi Iwai     2024-02-27  3220  	scoped_guard(pcm_stream_lock_irq, substream) {
09d94175dbeac1 Arnd Bergmann    2018-04-24  3221  		/* FIXME: we should consider the boundary for the sync from app */
2e2832562c877e Alan Young       2021-07-09  3222  		if (!(sflags & SNDRV_PCM_SYNC_PTR_APPL)) {
2e2832562c877e Alan Young       2021-07-09  3223  			err = pcm_lib_apply_appl_ptr(substream,
2e2832562c877e Alan Young       2021-07-09  3224  						     scontrol.appl_ptr);
650224fe8d5f6d Takashi Iwai     2024-02-27  3225  			if (err < 0)
2e2832562c877e Alan Young       2021-07-09  3226  				return err;
2e2832562c877e Alan Young       2021-07-09  3227  		} else
09d94175dbeac1 Arnd Bergmann    2018-04-24  3228  			scontrol.appl_ptr = control->appl_ptr % boundary;
09d94175dbeac1 Arnd Bergmann    2018-04-24  3229  		if (!(sflags & SNDRV_PCM_SYNC_PTR_AVAIL_MIN))
09d94175dbeac1 Arnd Bergmann    2018-04-24  3230  			control->avail_min = scontrol.avail_min;
09d94175dbeac1 Arnd Bergmann    2018-04-24  3231  		else
09d94175dbeac1 Arnd Bergmann    2018-04-24  3232  			scontrol.avail_min = control->avail_min;
09d94175dbeac1 Arnd Bergmann    2018-04-24  3233  		sstatus.state = status->state;
09d94175dbeac1 Arnd Bergmann    2018-04-24  3234  		sstatus.hw_ptr = status->hw_ptr % boundary;
09d94175dbeac1 Arnd Bergmann    2018-04-24  3235  		sstatus.tstamp = status->tstamp;
09d94175dbeac1 Arnd Bergmann    2018-04-24  3236  		sstatus.suspended_state = status->suspended_state;
09d94175dbeac1 Arnd Bergmann    2018-04-24  3237  		sstatus.audio_tstamp = status->audio_tstamp;
650224fe8d5f6d Takashi Iwai     2024-02-27  3238  	}
a25684a956468e Takashi Iwai     2021-10-17  3239  	if (!(sflags & SNDRV_PCM_SYNC_PTR_APPL))
a25684a956468e Takashi Iwai     2021-10-17  3240  		snd_pcm_dma_buffer_sync(substream, SNDRV_DMA_SYNC_DEVICE);
2acd83beb4d3fd Christophe Leroy 2025-06-14  3241  	if (snd_pcm_sync_ptr_put_user(sstatus, scontrol, src))
09d94175dbeac1 Arnd Bergmann    2018-04-24  3242  		return -EFAULT;
09d94175dbeac1 Arnd Bergmann    2018-04-24  3243  
09d94175dbeac1 Arnd Bergmann    2018-04-24  3244  	return 0;
09d94175dbeac1 Arnd Bergmann    2018-04-24  3245  }
80fe7430c70859 Arnd Bergmann    2018-04-24  3246  #define __SNDRV_PCM_IOCTL_SYNC_PTR32 _IOWR('A', 0x23, struct snd_pcm_sync_ptr32)
09d94175dbeac1 Arnd Bergmann    2018-04-24  3247  

:::::: The code at line 3210 was first introduced by commit
:::::: 09d94175dbeac12d38b1599a02c7000a5e51b4cb ALSA: move snd_pcm_ioctl_sync_ptr_compat into pcm_native.c

:::::: TO: Arnd Bergmann <arnd@arndb.de>
:::::: CC: Arnd Bergmann <arnd@arndb.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
