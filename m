Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795176592;
	b=sH+qL7gwoKu3LCGG+hGjuXu6fhRwgZ8wx25uF5Bath1fz2wHkUXSoZRio8g5SsXYH3p8
	 QVWnFl97DgD5FWVqfIej3+N6jCnhvPaLzNbHxgKMc5bTSK5MAhXnxqsaA77mX2J8118s6
	 s7eFRcQuLPWAYUEd2z0e624TimrFtwLevoOwzpOA5p7Hu7U8XGneLoR5HNeAMzIbylLZN
	 Z4REA06w8IDd7aAWLGk7XE9zLaSfim1yU3C/FYuhfLghajVnBJHgv0H45bfhbDKhg7Cg4
	 i08JtARucITeUvyo9x/I18BwJYLvVjXyQBLm4ea9ZM2C3tAco7DL2zI5vr/Dc54686A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795176592;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=nO9MwRUE1mFoZzZH6+kIz2547vzeHoS2r14txJUxEOo=;
	b=16ldy+aYdtj+ymP2gA2MUfBCWGXJNIcpPiZQTvh5V8sWLZjJ+F6VzjL1yHJcnZHgV8U/
	 5qY8o8RcpZZGkf/9Mx7RLE+0uxfkNod7UxOa01Rcm5z5p+e4eZ2Y7AO2AitFfCU1ht3oB
	 zjrHEyFgcx1i0xgyfNzuLy7yTIP7Q1E9Si1tJok+mt3Cyc+Fk6BCYioOWTMvfDtxoQs60
	 GYr4TXEa76aRk82zuuDB9omcT1YpMhewcT7VqKwOq8fMTSTEO6fQxEXN0EqoYHu+ScBY3
	 w9eJiQqdRQIZEmknpClCsOGp26ZBQHdSsiL7MnM1vjmPV6tc7vTqPTE/fXfMVLCBAMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DeoUZTKW;
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED137606A320
	for <oe-kbuild@lists.linux.dev>; Fri, 20 Nov 2026 12:09:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED137606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DeoUZTKW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795176592; x=1826712592;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=cdBx0UcpeCx7RmQdhn6K7ijF653Vo7+T+18iVfYxZKg=;
  b=DeoUZTKW4OWhscvWsh8Bxapjx1aUB+roe6/FJFfqFMKsY0QTvfD0eN35
   Krf1VZZ3VsE9vbALYdwnUN9W8lNn2ahNF0rMaKoOI8ghkNR8nY1wRTmw+
   Pv4ajNbFikVFsgTUpVrolB5XTD1flJ4+9Ae7X8+lsI37v54ntcAFH2hNn
   x4qw3gH3NRD55TzgQ0Z+DsiXRMvJ7sDXhHbWouqSLSunZCxTTGPu/T/+K
   p91g8O3MUJlUg7rWIynUAsc7n/S6NyhQ3bn/i0Ki3VED3wq208TSemeMl
   5VFo38kAHli9I1dazHOyFKFDhXW1ongPjSlu5f1BhBWZRb4l2qN6AHX8Y
   Q==;
X-CSE-ConnectionGUID: +5svhOiXTPCCEbJolvVZCQ==
X-CSE-MsgGUID: nNZhLqzVROiK+8YYNjei1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3936217"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="3936217"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 04:09:51 -0800
X-CSE-ConnectionGUID: ZfbFG9K+RaeSyuvP2w+lig==
X-CSE-MsgGUID: 2qewu4iUQnyz3ncP3a2c5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="10497608"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 20 Nov 2026 04:09:50 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUNQz-00000000429-1crr;
	Fri, 20 Nov 2026 12:09:41 +0000
Date: Fri, 20 Nov 2026 13:09:19 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 5/5] ALSA: usx2y: us144mkii: do not restart the stream
 while stop_work runs
Message-ID: <20261120130019.HA8aoSNs-lkp@intel.com>
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20261116071707.217448-6-alex@becholey.ch>
References: <20261116071707.217448-6-alex@becholey.ch>
TO: Alexandre Becholey <alex@becholey.ch>
TO: Jaroslav Kysela <perex@perex.cz>
TO: Takashi Iwai <tiwai@suse.com>
TO: "Šerif Rami" <ramiserifpersia@gmail.com>
CC: linux-sound@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Hanxiang Xu <xuhx@hust.edu.cn>
CC: Alexandre Becholey <alex@becholey.ch>
CC: stable@vger.kernel.org

Hi Alexandre,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tiwai-sound/for-next]
[also build test WARNING on tiwai-sound/for-linus linus/master v7.4-rc3 next-20261119]
[cannot apply to linux-review/Alexandre-Becholey/ALSA-usx2y-us144mkii-fix-stop_pcm_work-race-with-PCM-close/20261114-172839]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexandre-Becholey/ALSA-usx2y-us144mkii-fix-stop_pcm_work-race-with-PCM-close/20261116-071733
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
patch link:    https://lore.kernel.org/r/20261116071707.217448-6-alex%40becholey.ch
patch subject: [PATCH v2 5/5] ALSA: usx2y: us144mkii: do not restart the stream while stop_work runs
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: powerpc64-randconfig-2200-20261120 (https://download.01.org/0day-ci/archive/20261120/20261120130019.HA8aoSNs-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 16.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/20261120130019.HA8aoSNs-lkp@intel.com/

smatch warnings:
sound/usb/usx2y/us144mkii_pcm.c:310 tascam_pcm_trigger() warn: missing error code 'err'

vim +/err +310 sound/usb/usx2y/us144mkii_pcm.c

1763cd92629ac9 Alexandre Becholey 2026-11-16  273  
5c8c10796e274d Šerif Rami         2025-08-14  274  int tascam_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
5c8c10796e274d Šerif Rami         2025-08-14  275  {
5c8c10796e274d Šerif Rami         2025-08-14  276  	struct tascam_card *tascam = snd_pcm_substream_chip(substream);
5c8c10796e274d Šerif Rami         2025-08-14  277  	int err = 0;
a2a2210f2c2e65 Šerif Rami         2025-08-14  278  	int i;
5c8c10796e274d Šerif Rami         2025-08-14  279  
a41f78697930b1 Alexandre Becholey 2026-11-16  280  	/*
a41f78697930b1 Alexandre Becholey 2026-11-16  281  	 * Hold the lock while submitting, so that a STOP of the other
a41f78697930b1 Alexandre Becholey 2026-11-16  282  	 * substream cannot schedule stop_work in the middle of a START.
a41f78697930b1 Alexandre Becholey 2026-11-16  283  	 */
a41f78697930b1 Alexandre Becholey 2026-11-16  284  	guard(spinlock_irqsave)(&tascam->lock);
a41f78697930b1 Alexandre Becholey 2026-11-16  285  
5c8c10796e274d Šerif Rami         2025-08-14  286  	switch (cmd) {
5c8c10796e274d Šerif Rami         2025-08-14  287  	case SNDRV_PCM_TRIGGER_START:
5c8c10796e274d Šerif Rami         2025-08-14  288  	case SNDRV_PCM_TRIGGER_RESUME:
a41f78697930b1 Alexandre Becholey 2026-11-16  289  		if (atomic_read(&tascam->playback_active))
a41f78697930b1 Alexandre Becholey 2026-11-16  290  			return 0;
a41f78697930b1 Alexandre Becholey 2026-11-16  291  		/*
a41f78697930b1 Alexandre Becholey 2026-11-16  292  		 * stop_work kills the URBs of the previous run asynchronously;
a41f78697930b1 Alexandre Becholey 2026-11-16  293  		 * they must not be anchored and submitted again before it is
a41f78697930b1 Alexandre Becholey 2026-11-16  294  		 * done.
a41f78697930b1 Alexandre Becholey 2026-11-16  295  		 */
a41f78697930b1 Alexandre Becholey 2026-11-16  296  		if (tascam->stop_pending ||
a41f78697930b1 Alexandre Becholey 2026-11-16  297  		    atomic_read(&tascam->active_urbs) > 0) {
a41f78697930b1 Alexandre Becholey 2026-11-16  298  			dev_warn(tascam->card->dev,
a41f78697930b1 Alexandre Becholey 2026-11-16  299  				 "Cannot start, URBs still active.\n");
a41f78697930b1 Alexandre Becholey 2026-11-16  300  			return -EAGAIN;
a41f78697930b1 Alexandre Becholey 2026-11-16  301  		}
5c8c10796e274d Šerif Rami         2025-08-14  302  		atomic_set(&tascam->playback_active, 1);
5c8c10796e274d Šerif Rami         2025-08-14  303  		atomic_set(&tascam->capture_active, 1);
5c8c10796e274d Šerif Rami         2025-08-14  304  		break;
5c8c10796e274d Šerif Rami         2025-08-14  305  	case SNDRV_PCM_TRIGGER_STOP:
5c8c10796e274d Šerif Rami         2025-08-14  306  	case SNDRV_PCM_TRIGGER_SUSPEND:
5c8c10796e274d Šerif Rami         2025-08-14  307  	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
a41f78697930b1 Alexandre Becholey 2026-11-16  308  		if (!atomic_read(&tascam->playback_active))
a41f78697930b1 Alexandre Becholey 2026-11-16  309  			return 0;
a41f78697930b1 Alexandre Becholey 2026-11-16 @310  		goto stop;
5c8c10796e274d Šerif Rami         2025-08-14  311  	default:
a41f78697930b1 Alexandre Becholey 2026-11-16  312  		return -EINVAL;
a2a2210f2c2e65 Šerif Rami         2025-08-14  313  	}
a2a2210f2c2e65 Šerif Rami         2025-08-14  314  
a2a2210f2c2e65 Šerif Rami         2025-08-14  315  	for (i = 0; i < NUM_FEEDBACK_URBS; i++) {
a2a2210f2c2e65 Šerif Rami         2025-08-14  316  		usb_get_urb(tascam->feedback_urbs[i]);
a2a2210f2c2e65 Šerif Rami         2025-08-14  317  		usb_anchor_urb(tascam->feedback_urbs[i],
a2a2210f2c2e65 Šerif Rami         2025-08-14  318  			       &tascam->feedback_anchor);
a41f78697930b1 Alexandre Becholey 2026-11-16  319  		err = usb_submit_urb(tascam->feedback_urbs[i], GFP_ATOMIC);
a2a2210f2c2e65 Šerif Rami         2025-08-14  320  		if (err < 0) {
a2a2210f2c2e65 Šerif Rami         2025-08-14  321  			usb_unanchor_urb(tascam->feedback_urbs[i]);
a2a2210f2c2e65 Šerif Rami         2025-08-14  322  			usb_put_urb(tascam->feedback_urbs[i]);
a2a2210f2c2e65 Šerif Rami         2025-08-14  323  			goto start_rollback;
a2a2210f2c2e65 Šerif Rami         2025-08-14  324  		}
a2a2210f2c2e65 Šerif Rami         2025-08-14  325  		atomic_inc(&tascam->active_urbs);
a2a2210f2c2e65 Šerif Rami         2025-08-14  326  	}
a2a2210f2c2e65 Šerif Rami         2025-08-14  327  	for (i = 0; i < NUM_PLAYBACK_URBS; i++) {
a2a2210f2c2e65 Šerif Rami         2025-08-14  328  		usb_get_urb(tascam->playback_urbs[i]);
a2a2210f2c2e65 Šerif Rami         2025-08-14  329  		usb_anchor_urb(tascam->playback_urbs[i],
a2a2210f2c2e65 Šerif Rami         2025-08-14  330  			       &tascam->playback_anchor);
a41f78697930b1 Alexandre Becholey 2026-11-16  331  		err = usb_submit_urb(tascam->playback_urbs[i], GFP_ATOMIC);
a2a2210f2c2e65 Šerif Rami         2025-08-14  332  		if (err < 0) {
a2a2210f2c2e65 Šerif Rami         2025-08-14  333  			usb_unanchor_urb(tascam->playback_urbs[i]);
a2a2210f2c2e65 Šerif Rami         2025-08-14  334  			usb_put_urb(tascam->playback_urbs[i]);
a2a2210f2c2e65 Šerif Rami         2025-08-14  335  			goto start_rollback;
a2a2210f2c2e65 Šerif Rami         2025-08-14  336  		}
a2a2210f2c2e65 Šerif Rami         2025-08-14  337  		atomic_inc(&tascam->active_urbs);
a2a2210f2c2e65 Šerif Rami         2025-08-14  338  	}
c1bb0c13e43062 Šerif Rami         2025-08-14  339  	for (i = 0; i < NUM_CAPTURE_URBS; i++) {
c1bb0c13e43062 Šerif Rami         2025-08-14  340  		usb_get_urb(tascam->capture_urbs[i]);
c1bb0c13e43062 Šerif Rami         2025-08-14  341  		usb_anchor_urb(tascam->capture_urbs[i],
c1bb0c13e43062 Šerif Rami         2025-08-14  342  			       &tascam->capture_anchor);
a41f78697930b1 Alexandre Becholey 2026-11-16  343  		err = usb_submit_urb(tascam->capture_urbs[i], GFP_ATOMIC);
c1bb0c13e43062 Šerif Rami         2025-08-14  344  		if (err < 0) {
c1bb0c13e43062 Šerif Rami         2025-08-14  345  			usb_unanchor_urb(tascam->capture_urbs[i]);
c1bb0c13e43062 Šerif Rami         2025-08-14  346  			usb_put_urb(tascam->capture_urbs[i]);
c1bb0c13e43062 Šerif Rami         2025-08-14  347  			goto start_rollback;
c1bb0c13e43062 Šerif Rami         2025-08-14  348  		}
c1bb0c13e43062 Šerif Rami         2025-08-14  349  		atomic_inc(&tascam->active_urbs);
c1bb0c13e43062 Šerif Rami         2025-08-14  350  	}
a2a2210f2c2e65 Šerif Rami         2025-08-14  351  
a2a2210f2c2e65 Šerif Rami         2025-08-14  352  	return 0;
a41f78697930b1 Alexandre Becholey 2026-11-16  353  
a2a2210f2c2e65 Šerif Rami         2025-08-14  354  start_rollback:
a2a2210f2c2e65 Šerif Rami         2025-08-14  355  	dev_err(tascam->card->dev,
a2a2210f2c2e65 Šerif Rami         2025-08-14  356  		"Failed to submit URBs to start stream: %d\n", err);
a41f78697930b1 Alexandre Becholey 2026-11-16  357  stop:
a41f78697930b1 Alexandre Becholey 2026-11-16  358  	atomic_set(&tascam->playback_active, 0);
a41f78697930b1 Alexandre Becholey 2026-11-16  359  	atomic_set(&tascam->capture_active, 0);
a41f78697930b1 Alexandre Becholey 2026-11-16  360  	tascam->stop_pending = true;
a2a2210f2c2e65 Šerif Rami         2025-08-14  361  	schedule_work(&tascam->stop_work);
a2a2210f2c2e65 Šerif Rami         2025-08-14  362  
5c8c10796e274d Šerif Rami         2025-08-14  363  	return err;
5c8c10796e274d Šerif Rami         2025-08-14  364  }
5c8c10796e274d Šerif Rami         2025-08-14  365  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
