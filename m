Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1F2482C6
	for <oe-kbuild@lists.linux.dev>; Sat, 24 Feb 2024 18:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708798113; cv=none; b=MEmiN6KJsGo3os8AJw2qVebZ0SNqbKkW4HjQ0UjvSb8vjItyKZ7uUeDiDZb3HHlZ+CzxJjXPpL1ZAL9iOgqp9nMb+/eGMG5Xhpvs55KpUq1UHQtQbN9FVEzvv5yaoHzi4zrziql2KH1pmlcUXUw3elrXWrWxHk+7sVfT1u4TsCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708798113; c=relaxed/simple;
	bh=6agTNHYp6/No4kX7Ky1D4M+6PhWR2h/tYOPMK2haVfY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sUZmc6n/pm5RPrOVk585W90ub9E2eDcw/IsfdFKNmk9PHDFlQTgKHG2d3lGLWf2H4RY+S8Lt474vS/nivX2CmwHXUIo5ECBbjBICO1pe+9WOPEkFe+yrPh/IsAM3d6Sde4ns/Ll0VPZkQIziLqkxQrspviGtVLLeQ3P6RJ85OA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LHJvME30; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LHJvME30"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708798112; x=1740334112;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6agTNHYp6/No4kX7Ky1D4M+6PhWR2h/tYOPMK2haVfY=;
  b=LHJvME30iB48Hn2/Qb+GDsQ5Feo8Vo/N2zjVA/EgRZWivcxeCWCWYD6B
   ZtTVY1k70ZSpThCM8Owk9s9nX5/VJFoOegnkWDGUPwsLBvBZcLVHM1Vga
   nkJbQeJ7xk219pHd3quJKc9bYD2inK6Kw0KqaGufYC5QP6iNFraM5/hOz
   fDcckdExWWVR7gN284o147mifu9rqTpSiBRLoj5/A62vQr9s2mYYtfE1W
   wlIXLknbpiLIynqOfY5o2SADsiLvmVPNNRD08mO1rhej/vuCxrjJtu8+H
   Hn+LsB5kTMAARW2mw8R5TCpCLru1aL7fhC9R4mDJwDuFzVxv3O7AH0VkF
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10994"; a="6906368"
X-IronPort-AV: E=Sophos;i="6.06,182,1705392000"; 
   d="scan'208";a="6906368"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2024 10:08:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,182,1705392000"; 
   d="scan'208";a="10791086"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 24 Feb 2024 10:08:30 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdwRd-0008nK-2c;
	Sat, 24 Feb 2024 18:08:20 +0000
Date: Sun, 25 Feb 2024 02:07:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [tiwai-sound:test/guard 56/70] sound/core/seq/seq_queue.c:737
 snd_seq_info_queues_read() error: uninitialized symbol 'owner'.
Message-ID: <202402250101.HP9LzGRQ-lkp@intel.com>
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

Hi Takashi,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git test/guard
head:   08e50f26c5431175dc7207664c292f3ecc134121
commit: 518ed5d2950e0af99910b2a55fa83f6693767cca [56/70] ALSA: seq: queue: Use guard() for locking
:::::: branch date: 24 hours ago
:::::: commit date: 32 hours ago
config: i386-randconfig-141-20240224 (https://download.01.org/0day-ci/archive/20240225/202402250101.HP9LzGRQ-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202402250101.HP9LzGRQ-lkp@intel.com/

smatch warnings:
sound/core/seq/seq_queue.c:737 snd_seq_info_queues_read() error: uninitialized symbol 'owner'.
sound/core/seq/seq_queue.c:738 snd_seq_info_queues_read() error: uninitialized symbol 'locked'.

vim +/owner +737 sound/core/seq/seq_queue.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  708  
cd6a65036f0eac Jie Yang       2015-05-27  709  #ifdef CONFIG_SND_PROC_FS
^1da177e4c3f41 Linus Torvalds 2005-04-16  710  /* exported to seq_info.c */
c7e0b5bf9fff1b Takashi Iwai   2005-11-17  711  void snd_seq_info_queues_read(struct snd_info_entry *entry, 
c7e0b5bf9fff1b Takashi Iwai   2005-11-17  712  			      struct snd_info_buffer *buffer)
^1da177e4c3f41 Linus Torvalds 2005-04-16  713  {
^1da177e4c3f41 Linus Torvalds 2005-04-16  714  	int i, bpm;
c7e0b5bf9fff1b Takashi Iwai   2005-11-17  715  	struct snd_seq_queue *q;
c7e0b5bf9fff1b Takashi Iwai   2005-11-17  716  	struct snd_seq_timer *tmr;
bb51e669fa49fe Takashi Iwai   2020-02-14  717  	bool locked;
bb51e669fa49fe Takashi Iwai   2020-02-14  718  	int owner;
^1da177e4c3f41 Linus Torvalds 2005-04-16  719  
^1da177e4c3f41 Linus Torvalds 2005-04-16  720  	for (i = 0; i < SNDRV_SEQ_MAX_QUEUES; i++) {
f9a6bb841f7370 Takashi Iwai   2021-06-08  721  		q = queueptr(i);
f9a6bb841f7370 Takashi Iwai   2021-06-08  722  		if (!q)
^1da177e4c3f41 Linus Torvalds 2005-04-16  723  			continue;
^1da177e4c3f41 Linus Torvalds 2005-04-16  724  
^1da177e4c3f41 Linus Torvalds 2005-04-16  725  		tmr = q->timer;
^1da177e4c3f41 Linus Torvalds 2005-04-16  726  		if (tmr->tempo)
^1da177e4c3f41 Linus Torvalds 2005-04-16  727  			bpm = 60000000 / tmr->tempo;
^1da177e4c3f41 Linus Torvalds 2005-04-16  728  		else
^1da177e4c3f41 Linus Torvalds 2005-04-16  729  			bpm = 0;
^1da177e4c3f41 Linus Torvalds 2005-04-16  730  
518ed5d2950e0a Takashi Iwai   2024-02-21  731  		scoped_guard(spinlock_irq, &q->owner_lock) {
bb51e669fa49fe Takashi Iwai   2020-02-14  732  			locked = q->locked;
bb51e669fa49fe Takashi Iwai   2020-02-14  733  			owner = q->owner;
518ed5d2950e0a Takashi Iwai   2024-02-21  734  		}
bb51e669fa49fe Takashi Iwai   2020-02-14  735  
^1da177e4c3f41 Linus Torvalds 2005-04-16  736  		snd_iprintf(buffer, "queue %d: [%s]\n", q->queue, q->name);
bb51e669fa49fe Takashi Iwai   2020-02-14 @737  		snd_iprintf(buffer, "owned by client    : %d\n", owner);
bb51e669fa49fe Takashi Iwai   2020-02-14 @738  		snd_iprintf(buffer, "lock status        : %s\n", locked ? "Locked" : "Free");

:::::: The code at line 737 was first introduced by commit
:::::: bb51e669fa49feb5904f452b2991b240ef31bc97 ALSA: seq: Avoid concurrent access to queue flags

:::::: TO: Takashi Iwai <tiwai@suse.de>
:::::: CC: Takashi Iwai <tiwai@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
