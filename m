Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F1333F8BF
	for <oe-kbuild@lists.linux.dev>; Mon, 15 Dec 2025 19:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765827938; cv=none; b=iMDOIa0GyJf2oL6N3jUOm5UL4V1I/wAhm7sKiMAUFpCSfiFRoovw3YRbSNY/AKOzbK7el32HqVyruvkpfZq0tdNQj/rGoLFmk/OY34hmHYorTPpMNdIgZKS0KRcdl58RZoye3C2R3RI2Ab9Y+cUf3WLv/x03HCPlfkCcujZT+Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765827938; c=relaxed/simple;
	bh=tC/HS3gj8USlM51LPUlWg59K/VusOTjD9lr008BGZpo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c+SXS7cISxX+z9eCnifn4speR1bJlO0YKfEaXtgYVBMLT0K7djrTliM1j7/kNILnGxu5fhNc3bedWQCXtxgmvCvt9Y8c3kwkOcCSeONkG94NlWC8kcWdQBgrNIckZDnqtezqswrVV+x81Kta9GcGPmD0KC3qw/z0e0f4DKhU+is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OK7bM6tL; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OK7bM6tL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765827936; x=1797363936;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tC/HS3gj8USlM51LPUlWg59K/VusOTjD9lr008BGZpo=;
  b=OK7bM6tLC5cOzZO3UUh5w4WKoT1BCNBJl5ce0CaRx/Wx3ajveisy0ajB
   5UK5Iy863W6dnDdDa9DYL/X9NptbnqvRpEOq55+8Qs1YvHdLD6gBfjQk3
   iAIMV1HGkr1kpZsVT4igSqQIzhLuJbWWZba0Mw1/FaN0QC95sgLUts0up
   mfOiOMdnfFKdtCN6LocnOeVfsEPVBeDEaOXyKwdfZEpUOHQaFsAR4FOnq
   jYFrx1OZTVDFj3A6Sob0asm+Xv82b16UrSXP+p45QuT9QQvG5Fl0z+OG/
   dIgMgvNU5BQ+y2ItRhHBUsxbWPvW05DE619lT3BqWZtiWxQD0BaxeeG2G
   Q==;
X-CSE-ConnectionGUID: CwZfTbFDQRuTPZZsjeqPAg==
X-CSE-MsgGUID: oTuBWOnPTumgeNabheLpEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="67494332"
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; 
   d="scan'208";a="67494332"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 11:45:36 -0800
X-CSE-ConnectionGUID: FTe2iiYNTkC+e9NFdwwqzQ==
X-CSE-MsgGUID: Uvi8snLwTWC16tsrZMqtig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; 
   d="scan'208";a="197084830"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 15 Dec 2025 11:45:34 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVEVg-000000000g5-0W7y;
	Mon, 15 Dec 2025 19:45:32 +0000
Date: Tue, 16 Dec 2025 03:45:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: sound/core/pcm_compat.c:423 snd_pcm_ioctl_sync_ptr_x32() error:
 uninitialized symbol 'sflags'.
Message-ID: <202512160354.Oul5Jn7V-lkp@intel.com>
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

Hi Christophe,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
commit: a9b49bf8ad5905ebd999da345dcff3b9fad43877 ALSA: pcm: Convert SNDRV_PCM_IOCTL_SYNC_PTR to user_access_begin/user_access_end()
date:   6 months ago
:::::: branch date: 2 days ago
:::::: commit date: 6 months ago
config: x86_64-randconfig-161-20251215 (https://download.01.org/0day-ci/archive/20251216/202512160354.Oul5Jn7V-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512160354.Oul5Jn7V-lkp@intel.com/

New smatch warnings:
sound/core/pcm_compat.c:423 snd_pcm_ioctl_sync_ptr_x32() error: uninitialized symbol 'sflags'.

Old smatch warnings:
sound/core/pcm_native.c:3210 snd_pcm_ioctl_sync_ptr_compat() error: uninitialized symbol 'sflags'.
sound/core/pcm_compat.c:21 snd_pcm_ioctl_delay_compat() error: uninitialized symbol 'delay'.

vim +/sflags +423 sound/core/pcm_compat.c

513ace79b657e2 Takashi Iwai     2016-02-28  405  
513ace79b657e2 Takashi Iwai     2016-02-28  406  static int snd_pcm_ioctl_sync_ptr_x32(struct snd_pcm_substream *substream,
513ace79b657e2 Takashi Iwai     2016-02-28  407  				      struct snd_pcm_sync_ptr_x32 __user *src)
513ace79b657e2 Takashi Iwai     2016-02-28  408  {
513ace79b657e2 Takashi Iwai     2016-02-28  409  	struct snd_pcm_runtime *runtime = substream->runtime;
513ace79b657e2 Takashi Iwai     2016-02-28  410  	volatile struct snd_pcm_mmap_status *status;
513ace79b657e2 Takashi Iwai     2016-02-28  411  	volatile struct snd_pcm_mmap_control *control;
513ace79b657e2 Takashi Iwai     2016-02-28  412  	u32 sflags;
513ace79b657e2 Takashi Iwai     2016-02-28  413  	struct snd_pcm_mmap_control scontrol;
513ace79b657e2 Takashi Iwai     2016-02-28  414  	struct snd_pcm_mmap_status sstatus;
513ace79b657e2 Takashi Iwai     2016-02-28  415  	snd_pcm_uframes_t boundary;
513ace79b657e2 Takashi Iwai     2016-02-28  416  	int err;
513ace79b657e2 Takashi Iwai     2016-02-28  417  
513ace79b657e2 Takashi Iwai     2016-02-28  418  	if (snd_BUG_ON(!runtime))
513ace79b657e2 Takashi Iwai     2016-02-28  419  		return -EINVAL;
513ace79b657e2 Takashi Iwai     2016-02-28  420  
2acd83beb4d3fd Christophe Leroy 2025-06-14  421  	if (snd_pcm_sync_ptr_get_user(sflags, scontrol, src))
513ace79b657e2 Takashi Iwai     2016-02-28  422  		return -EFAULT;
513ace79b657e2 Takashi Iwai     2016-02-28 @423  	if (sflags & SNDRV_PCM_SYNC_PTR_HWSYNC) {
513ace79b657e2 Takashi Iwai     2016-02-28  424  		err = snd_pcm_hwsync(substream);
513ace79b657e2 Takashi Iwai     2016-02-28  425  		if (err < 0)
513ace79b657e2 Takashi Iwai     2016-02-28  426  			return err;
513ace79b657e2 Takashi Iwai     2016-02-28  427  	}
513ace79b657e2 Takashi Iwai     2016-02-28  428  	status = runtime->status;
513ace79b657e2 Takashi Iwai     2016-02-28  429  	control = runtime->control;
513ace79b657e2 Takashi Iwai     2016-02-28  430  	boundary = recalculate_boundary(runtime);
513ace79b657e2 Takashi Iwai     2016-02-28  431  	if (!boundary)
513ace79b657e2 Takashi Iwai     2016-02-28  432  		boundary = 0x7fffffff;
650224fe8d5f6d Takashi Iwai     2024-02-27  433  	scoped_guard(pcm_stream_lock_irq, substream) {
513ace79b657e2 Takashi Iwai     2016-02-28  434  		/* FIXME: we should consider the boundary for the sync from app */
513ace79b657e2 Takashi Iwai     2016-02-28  435  		if (!(sflags & SNDRV_PCM_SYNC_PTR_APPL))
513ace79b657e2 Takashi Iwai     2016-02-28  436  			control->appl_ptr = scontrol.appl_ptr;
513ace79b657e2 Takashi Iwai     2016-02-28  437  		else
513ace79b657e2 Takashi Iwai     2016-02-28  438  			scontrol.appl_ptr = control->appl_ptr % boundary;
513ace79b657e2 Takashi Iwai     2016-02-28  439  		if (!(sflags & SNDRV_PCM_SYNC_PTR_AVAIL_MIN))
513ace79b657e2 Takashi Iwai     2016-02-28  440  			control->avail_min = scontrol.avail_min;
513ace79b657e2 Takashi Iwai     2016-02-28  441  		else
513ace79b657e2 Takashi Iwai     2016-02-28  442  			scontrol.avail_min = control->avail_min;
513ace79b657e2 Takashi Iwai     2016-02-28  443  		sstatus.state = status->state;
513ace79b657e2 Takashi Iwai     2016-02-28  444  		sstatus.hw_ptr = status->hw_ptr % boundary;
513ace79b657e2 Takashi Iwai     2016-02-28  445  		sstatus.tstamp = status->tstamp;
513ace79b657e2 Takashi Iwai     2016-02-28  446  		sstatus.suspended_state = status->suspended_state;
513ace79b657e2 Takashi Iwai     2016-02-28  447  		sstatus.audio_tstamp = status->audio_tstamp;
650224fe8d5f6d Takashi Iwai     2024-02-27  448  	}
a25684a956468e Takashi Iwai     2021-10-17  449  	if (!(sflags & SNDRV_PCM_SYNC_PTR_APPL))
a25684a956468e Takashi Iwai     2021-10-17  450  		snd_pcm_dma_buffer_sync(substream, SNDRV_DMA_SYNC_DEVICE);
2acd83beb4d3fd Christophe Leroy 2025-06-14  451  	if (snd_pcm_sync_ptr_put_user(sstatus, scontrol, src))
513ace79b657e2 Takashi Iwai     2016-02-28  452  		return -EFAULT;
513ace79b657e2 Takashi Iwai     2016-02-28  453  
513ace79b657e2 Takashi Iwai     2016-02-28  454  	return 0;
513ace79b657e2 Takashi Iwai     2016-02-28  455  }
83a44a4f47ad20 Masahiro Yamada  2022-03-14  456  #endif /* CONFIG_X86_X32_ABI */
^1da177e4c3f41 Linus Torvalds   2005-04-16  457  

:::::: The code at line 423 was first introduced by commit
:::::: 513ace79b657e2022a592e77f24074e088681ecc ALSA: pcm: Fix ioctls for X32 ABI

:::::: TO: Takashi Iwai <tiwai@suse.de>
:::::: CC: Takashi Iwai <tiwai@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
