Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046B6165F16
	for <oe-kbuild@lists.linux.dev>; Tue,  1 Jul 2025 02:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751338637; cv=none; b=ngBXO6L9fwm7RwhEDz8IcIn4DpEwd33Ss+FrPGmq94qeAIlms7lwfZ42caf3lTRs/XN69JHHYmrZhrvdH8cgEH84KHn4Zajhd07qIZyUl+1N40lMSfP7walrhAydr+fU9GTFGnFdDq8ikUX7RHwcraKj0V81G18K42WFIQx+O5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751338637; c=relaxed/simple;
	bh=SlGu4pli7EW+8O71X0dadloJFYe942kzn1PkbysXD08=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HMRc+QBEcdh7lepd9e0sY1my0AoJzd+dFT4D3HVGUuW6gO2sdhYw2jrMyht7kBy7ViAfaNzT59L0otHvNK/tmjoLQ7TgdkV7kaHDOE7nmZyeJFYSZSiVqC15dldsBEpTVyCVn1Iq+JdTKUBuOgNfLhqs8q8cyHncYDChmszFWSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NqzTwEnh; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NqzTwEnh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751338635; x=1782874635;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SlGu4pli7EW+8O71X0dadloJFYe942kzn1PkbysXD08=;
  b=NqzTwEnhGohL5UNcTRmkxzFRsSqE3gHD+vpVta5S3hu3CN3RSh9X3sbu
   EvKDh8VnDLSaBGH0NmM0QGHHIvEHgqTDZVrF8ptY7yvMWDx+qpm5yaE9p
   5OGP2HFik2L40YPtI8NqcUcLYhgiglVAo4MHhW5stiSWYyjiwC4lGQsEK
   WaE1zna0NSokkNCfK+2BedgNOQzdQ8j0LJsNS8E4UyAbx53AFq1i9hjVh
   /0qRkTq8NdLGbV7KJbzuDHVifNteCvcVvsGUb/bc5QrnlJuGJ8M2w71Is
   XR3WXNao4LM9WImYjnxApHUqKVfl9tJgNoqX436W3Eaj8rs059i91I+Ks
   g==;
X-CSE-ConnectionGUID: cX14izwSRgah1REWyMjViA==
X-CSE-MsgGUID: AKHnkEk1SEil6lRX0puBsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="64183041"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="64183041"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 19:57:14 -0700
X-CSE-ConnectionGUID: tMRyEZiyQdOfUmJSUJiXwA==
X-CSE-MsgGUID: JhVFHvkqSgWLerdymWbu4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="153924082"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 30 Jun 2025 19:57:13 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWRBH-000ZZ7-1N;
	Tue, 01 Jul 2025 02:57:11 +0000
Date: Tue, 1 Jul 2025 10:56:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [tiwai-sound:for-next 23/38] sound/core/pcm_compat.c:423
 snd_pcm_ioctl_sync_ptr_x32() error: uninitialized symbol 'sflags'.
Message-ID: <202507011031.wWzbWNZP-lkp@intel.com>
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
TO: Christophe Leroy <christophe.leroy@csgroup.eu>
CC: Takashi Iwai <tiwai@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
head:   66b338d006d75ab52b16bf05a7f4f451043199bf
commit: a9b49bf8ad5905ebd999da345dcff3b9fad43877 [23/38] ALSA: pcm: Convert SNDRV_PCM_IOCTL_SYNC_PTR to user_access_begin/user_access_end()
:::::: branch date: 15 hours ago
:::::: commit date: 2 weeks ago
config: x86_64-randconfig-161-20250630 (https://download.01.org/0day-ci/archive/20250701/202507011031.wWzbWNZP-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202507011031.wWzbWNZP-lkp@intel.com/

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
