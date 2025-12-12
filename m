Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21ABC3128C3
	for <oe-kbuild@lists.linux.dev>; Fri, 12 Dec 2025 09:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765531966; cv=none; b=BgwoI2t2eKKGDqfIkkxfGEfK4eg/3tsRv0/C0svIziwYSu3Koh4stAjCQLKu8h3At8+9DOCRQT+zdSkhgzG9hXgCjuDuLyvaRwmP8KaeEjjiu42OQswBcmX2W7K99DBluLEfR3tnoh/o/QYczv3GLmhMTa/wnrOgJCYW1OZ4vT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765531966; c=relaxed/simple;
	bh=zV/Z7PcLgqCJ5nzD6Y3Jq2R7Qanxc6jTz/pt6Fzkj+M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q1Vz0ntRgeqi5xQ/agsJlxRe6dEX7FdSxupQKgRKutpXShTEnYj/wMY5ttgZcnvlfugOroqDVvDzuS8WZSaX1VvEElzJvVDx6Eh1tAH8CNaPmWZwynLkI6pvNDqzsUtWQY02QIdrkGH8b44XYiWYjv6RMatpMRLpf4KI/gtg25c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oBQIgiB/; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oBQIgiB/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765531965; x=1797067965;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zV/Z7PcLgqCJ5nzD6Y3Jq2R7Qanxc6jTz/pt6Fzkj+M=;
  b=oBQIgiB/w/bq+c+x0qUcZDAc0rrQVtJnHh/PzHuXiByvZsa8vC3LtjyZ
   IMxKigr0nfECTvZFrOUFcEo/rgxq/ZGYRtozdk0JacRoQb8gPLy05elXC
   k+6uev0ab8dKGfYf69Mn5FwGFUsu13iFjshTn11GSasPrJrBTCmoO5Upx
   21VRwwcPcf2LcEorUoAALYbwc1gTjielFM7EEzSwfAJE0RPem68Og2PsR
   Tm9rbqm6uJ8l09u+sAALC6RC5jqzfudzKhOBCV1LeYMvvpwNShKstNbnr
   XQ0vzDu526rMgknmbvYC4GPgWbrY/XBIei8dw1LBYaSoC8mEUREjIecEY
   Q==;
X-CSE-ConnectionGUID: hF+yXhJcQjm6gD8TKHsjvw==
X-CSE-MsgGUID: A+s+q8/KRbWO7GiEhgxKCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67689218"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="67689218"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 01:32:45 -0800
X-CSE-ConnectionGUID: oGu3wUkLSHOU3CfyltttLg==
X-CSE-MsgGUID: 6WHLgxdAQVO58vXlVTdpVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="227685579"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 12 Dec 2025 01:32:44 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTzVx-000000005s9-1JoU;
	Fri, 12 Dec 2025 09:32:41 +0000
Date: Fri, 12 Dec 2025 17:32:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: sound/core/pcm_native.c:3110 snd_pcm_sync_ptr() error: uninitialized
 symbol 'sflags'.
Message-ID: <202512121745.r0z1yJcQ-lkp@intel.com>
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
commit: 8629eea901b8a672dd096ca783ece8322701ca5a ALSA: pcm: Convert snd_pcm_sync_ptr() to user_access_begin/user_access_end()
date:   6 months ago
:::::: branch date: 30 hours ago
:::::: commit date: 6 months ago
config: i386-randconfig-141-20251212 (https://download.01.org/0day-ci/archive/20251212/202512121745.r0z1yJcQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512121745.r0z1yJcQ-lkp@intel.com/

New smatch warnings:
sound/core/pcm_native.c:3110 snd_pcm_sync_ptr() error: uninitialized symbol 'sflags'.

Old smatch warnings:
sound/core/pcm_native.c:3206 snd_pcm_ioctl_sync_ptr_compat() error: uninitialized symbol 'sflags'.

vim +/sflags +3110 sound/core/pcm_native.c

2acd83beb4d3fd Christophe Leroy 2025-06-14  3094  
877211f5e1b119 Takashi Iwai     2005-11-17  3095  static int snd_pcm_sync_ptr(struct snd_pcm_substream *substream,
877211f5e1b119 Takashi Iwai     2005-11-17  3096  			    struct snd_pcm_sync_ptr __user *_sync_ptr)
^1da177e4c3f41 Linus Torvalds   2005-04-16  3097  {
877211f5e1b119 Takashi Iwai     2005-11-17  3098  	struct snd_pcm_runtime *runtime = substream->runtime;
877211f5e1b119 Takashi Iwai     2005-11-17  3099  	volatile struct snd_pcm_mmap_status *status;
877211f5e1b119 Takashi Iwai     2005-11-17  3100  	volatile struct snd_pcm_mmap_control *control;
8629eea901b8a6 Christophe Leroy 2025-06-14  3101  	u32 sflags;
8629eea901b8a6 Christophe Leroy 2025-06-14  3102  	struct snd_pcm_mmap_control scontrol;
8629eea901b8a6 Christophe Leroy 2025-06-14  3103  	struct snd_pcm_mmap_status sstatus;
^1da177e4c3f41 Linus Torvalds   2005-04-16  3104  	int err;
^1da177e4c3f41 Linus Torvalds   2005-04-16  3105  
8629eea901b8a6 Christophe Leroy 2025-06-14  3106  	if (snd_pcm_sync_ptr_get_user(sflags, scontrol, _sync_ptr))
^1da177e4c3f41 Linus Torvalds   2005-04-16  3107  		return -EFAULT;
^1da177e4c3f41 Linus Torvalds   2005-04-16  3108  	status = runtime->status;
^1da177e4c3f41 Linus Torvalds   2005-04-16  3109  	control = runtime->control;
8629eea901b8a6 Christophe Leroy 2025-06-14 @3110  	if (sflags & SNDRV_PCM_SYNC_PTR_HWSYNC) {
^1da177e4c3f41 Linus Torvalds   2005-04-16  3111  		err = snd_pcm_hwsync(substream);
^1da177e4c3f41 Linus Torvalds   2005-04-16  3112  		if (err < 0)
^1da177e4c3f41 Linus Torvalds   2005-04-16  3113  			return err;
^1da177e4c3f41 Linus Torvalds   2005-04-16  3114  	}
650224fe8d5f6d Takashi Iwai     2024-02-27  3115  	scoped_guard(pcm_stream_lock_irq, substream) {
8629eea901b8a6 Christophe Leroy 2025-06-14  3116  		if (!(sflags & SNDRV_PCM_SYNC_PTR_APPL)) {
8629eea901b8a6 Christophe Leroy 2025-06-14  3117  			err = pcm_lib_apply_appl_ptr(substream, scontrol.appl_ptr);
650224fe8d5f6d Takashi Iwai     2024-02-27  3118  			if (err < 0)
9027c4639ef1e3 Takashi Iwai     2017-05-19  3119  				return err;
9027c4639ef1e3 Takashi Iwai     2017-05-19  3120  		} else {
8629eea901b8a6 Christophe Leroy 2025-06-14  3121  			scontrol.appl_ptr = control->appl_ptr;
9027c4639ef1e3 Takashi Iwai     2017-05-19  3122  		}
8629eea901b8a6 Christophe Leroy 2025-06-14  3123  		if (!(sflags & SNDRV_PCM_SYNC_PTR_AVAIL_MIN))
8629eea901b8a6 Christophe Leroy 2025-06-14  3124  			control->avail_min = scontrol.avail_min;
^1da177e4c3f41 Linus Torvalds   2005-04-16  3125  		else
8629eea901b8a6 Christophe Leroy 2025-06-14  3126  			scontrol.avail_min = control->avail_min;
8629eea901b8a6 Christophe Leroy 2025-06-14  3127  		sstatus.state = status->state;
8629eea901b8a6 Christophe Leroy 2025-06-14  3128  		sstatus.hw_ptr = status->hw_ptr;
8629eea901b8a6 Christophe Leroy 2025-06-14  3129  		sstatus.tstamp = status->tstamp;
8629eea901b8a6 Christophe Leroy 2025-06-14  3130  		sstatus.suspended_state = status->suspended_state;
8629eea901b8a6 Christophe Leroy 2025-06-14  3131  		sstatus.audio_tstamp = status->audio_tstamp;
8629eea901b8a6 Christophe Leroy 2025-06-14  3132  	}
8629eea901b8a6 Christophe Leroy 2025-06-14  3133  	if (!(sflags & SNDRV_PCM_SYNC_PTR_APPL))
a25684a956468e Takashi Iwai     2021-10-17  3134  		snd_pcm_dma_buffer_sync(substream, SNDRV_DMA_SYNC_DEVICE);
8629eea901b8a6 Christophe Leroy 2025-06-14  3135  	if (snd_pcm_sync_ptr_put_user(sstatus, scontrol, _sync_ptr))
^1da177e4c3f41 Linus Torvalds   2005-04-16  3136  		return -EFAULT;
^1da177e4c3f41 Linus Torvalds   2005-04-16  3137  	return 0;
^1da177e4c3f41 Linus Torvalds   2005-04-16  3138  }
^1da177e4c3f41 Linus Torvalds   2005-04-16  3139  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
