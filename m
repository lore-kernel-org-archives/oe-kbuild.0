Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8859141C2FB
	for <oe-kbuild@lists.linux.dev>; Thu,  9 Jul 2026 12:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783599309; cv=none; b=CKqcPJPG4pt17kAb7JYYu5IHnqw/FOiJPSF3QBAqb+yCRhy9MY6c0MbX841FaOQ5CIZLvDb5S1W6DWjCBNCJ1ecEBEjs2PciG8oo7Buu3Ip/0WikfMr1HMt53TgDJvOqjb46R/3BEMW7QSEBumHYkRHNfpOmEIlF6YPSKn069P4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783599309; c=relaxed/simple;
	bh=vBB33rTVs3AjUOHgqiJ1WRm0LcgmrxE+bqsGUh4AE34=;
	h=Date:From:To:Cc:Subject:Message-ID; b=U8GBWC+CBdWF7VH60MF/aB8Fosklq8LMGaW9xtj3hIqNSx8EAkkQpxfcsjjjwTIWz+VX29BE3Zf2na/sDoJxaV458PFKafgvdZ8sorSaKy+t8ducWJjtRZoOmCHEx20yPjxt8R5KdI6xyeOHhPvFqOuG2d5sSfLIA6AbwN3NhP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IlgO2BCJ; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IlgO2BCJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783599307; x=1815135307;
  h=date:from:to:cc:subject:message-id;
  bh=vBB33rTVs3AjUOHgqiJ1WRm0LcgmrxE+bqsGUh4AE34=;
  b=IlgO2BCJCfg9cVDwWyYk8Z+cvvuyT9ul2oKBwJ0Pk96OXrkxQu1jhjCn
   KUs1TNCrdKCiwkVG9WVw8HTZUa7EKxv6XpfAvQajN0B1IHN5vNHFzG1jP
   m0K+9AK4wOHMJbOWVvBPkyfs4V7PSKTdkq26rY5zgUaiXB7JuKW7PCqqN
   Yt7GsFY0X8t/X3zgmGvtPcCLsKWR4N50FM/tPDj6lUC2qapiDsSTUc21X
   ykgdXmfG1fNx87zSON7eLNdf6ZrRwWa/ix5MbgCImlRr1AYGFvDdZZ+Dq
   Xq6EHw17ZP6OJst6Jj1TsJuhItgBGIjXRXsegEkPOPjboZ46VokIZjgR7
   A==;
X-CSE-ConnectionGUID: XLjWaqDWQDqhS+l85JbTwQ==
X-CSE-MsgGUID: JIdkFVBLSP2/5dK9vd83yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="95432085"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="95432085"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 05:15:06 -0700
X-CSE-ConnectionGUID: G0XkgEXsQ+qu/gMDeUK0nw==
X-CSE-MsgGUID: w9M0jn86SGm31JhqlN2csQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="252826276"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 09 Jul 2026 05:15:05 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whneh-00000000Hfn-1oEd;
	Thu, 09 Jul 2026 12:15:03 +0000
Date: Thu, 09 Jul 2026 20:14:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: sound/pci/rme96.c:1011 snd_rme96_playback_hw_params() warn:
 inconsistent returns '&rme96->lock'.
Message-ID: <202607092001.07Uryu7u-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Takashi Iwai <tiwai@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0e35b9b6ec0ffcc5e23cbdec09f5c622ad532b53
commit: d3424b8bf78593e1751cfa19628aa0008d2e08ce ALSA: rme96: Use guard() for spin locks
date:   10 months ago
:::::: branch date: 2 days ago
:::::: commit date: 10 months ago
config: alpha-randconfig-r073-20260709 (https://download.01.org/0day-ci/archive/20260709/202607092001.07Uryu7u-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: d3424b8bf785 ("ALSA: rme96: Use guard() for spin locks")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607092001.07Uryu7u-lkp@intel.com/

smatch warnings:
sound/pci/rme96.c:1011 snd_rme96_playback_hw_params() warn: inconsistent returns '&rme96->lock'.
sound/pci/rme96.c:1011 snd_rme96_playback_hw_params() warn: inconsistent returns 'irq'.

vim +1011 sound/pci/rme96.c

^1da177e4c3f415 Linus Torvalds  2005-04-16   952  
^1da177e4c3f415 Linus Torvalds  2005-04-16   953  static int
a3aefd883dc8c17 Takashi Iwai    2005-11-17   954  snd_rme96_playback_hw_params(struct snd_pcm_substream *substream,
a3aefd883dc8c17 Takashi Iwai    2005-11-17   955  			     struct snd_pcm_hw_params *params)
^1da177e4c3f415 Linus Torvalds  2005-04-16   956  {
a3aefd883dc8c17 Takashi Iwai    2005-11-17   957  	struct rme96 *rme96 = snd_pcm_substream_chip(substream);
a3aefd883dc8c17 Takashi Iwai    2005-11-17   958  	struct snd_pcm_runtime *runtime = substream->runtime;
^1da177e4c3f415 Linus Torvalds  2005-04-16   959  	int err, rate, dummy;
a74a821624c0c75 Takashi Iwai    2015-12-04   960  	bool apply_dac_volume = false;
^1da177e4c3f415 Linus Torvalds  2005-04-16   961  
4d23359b7ec8b03 Clemens Ladisch 2005-09-05   962  	runtime->dma_area = (void __force *)(rme96->iobase +
4d23359b7ec8b03 Clemens Ladisch 2005-09-05   963  					     RME96_IO_PLAY_BUFFER);
^1da177e4c3f415 Linus Torvalds  2005-04-16   964  	runtime->dma_addr = rme96->port + RME96_IO_PLAY_BUFFER;
^1da177e4c3f415 Linus Torvalds  2005-04-16   965  	runtime->dma_bytes = RME96_BUFFER_SIZE;
^1da177e4c3f415 Linus Torvalds  2005-04-16   966  
d3424b8bf78593e Takashi Iwai    2025-08-29   967  	scoped_guard(spinlock_irq, &rme96->lock) {
da8eedb169712c8 Takashi Iwai    2021-06-08   968  		rate = 0;
^1da177e4c3f415 Linus Torvalds  2005-04-16   969  		if (!(rme96->wcreg & RME96_WCR_MASTER) &&
da8eedb169712c8 Takashi Iwai    2021-06-08   970  		    snd_rme96_getinputtype(rme96) != RME96_INPUT_ANALOG)
da8eedb169712c8 Takashi Iwai    2021-06-08   971  			rate = snd_rme96_capture_getrate(rme96, &dummy);
da8eedb169712c8 Takashi Iwai    2021-06-08   972  		if (rate > 0) {
^1da177e4c3f415 Linus Torvalds  2005-04-16   973  			/* slave clock */
d3424b8bf78593e Takashi Iwai    2025-08-29   974  			if ((int)params_rate(params) != rate)
d3424b8bf78593e Takashi Iwai    2025-08-29   975  				return -EIO;
a74a821624c0c75 Takashi Iwai    2015-12-04   976  		} else {
a74a821624c0c75 Takashi Iwai    2015-12-04   977  			err = snd_rme96_playback_setrate(rme96, params_rate(params));
a74a821624c0c75 Takashi Iwai    2015-12-04   978  			if (err < 0)
d3424b8bf78593e Takashi Iwai    2025-08-29   979  				return err;
a74a821624c0c75 Takashi Iwai    2015-12-04   980  			apply_dac_volume = err > 0; /* need to restore volume later? */
^1da177e4c3f415 Linus Torvalds  2005-04-16   981  		}
a74a821624c0c75 Takashi Iwai    2015-12-04   982  
a74a821624c0c75 Takashi Iwai    2015-12-04   983  		err = snd_rme96_playback_setformat(rme96, params_format(params));
a74a821624c0c75 Takashi Iwai    2015-12-04   984  		if (err < 0)
a74a821624c0c75 Takashi Iwai    2015-12-04   985  			goto error;
^1da177e4c3f415 Linus Torvalds  2005-04-16   986  		snd_rme96_setframelog(rme96, params_channels(params), 1);
^1da177e4c3f415 Linus Torvalds  2005-04-16   987  		if (rme96->capture_periodsize != 0) {
^1da177e4c3f415 Linus Torvalds  2005-04-16   988  			if (params_period_size(params) << rme96->playback_frlog !=
d3424b8bf78593e Takashi Iwai    2025-08-29   989  			    rme96->capture_periodsize) {
a74a821624c0c75 Takashi Iwai    2015-12-04   990  				err = -EBUSY;
a74a821624c0c75 Takashi Iwai    2015-12-04   991  				goto error;
^1da177e4c3f415 Linus Torvalds  2005-04-16   992  			}
^1da177e4c3f415 Linus Torvalds  2005-04-16   993  		}
^1da177e4c3f415 Linus Torvalds  2005-04-16   994  		rme96->playback_periodsize =
^1da177e4c3f415 Linus Torvalds  2005-04-16   995  			params_period_size(params) << rme96->playback_frlog;
^1da177e4c3f415 Linus Torvalds  2005-04-16   996  		snd_rme96_set_period_properties(rme96, rme96->playback_periodsize);
^1da177e4c3f415 Linus Torvalds  2005-04-16   997  		/* S/PDIF setup */
^1da177e4c3f415 Linus Torvalds  2005-04-16   998  		if ((rme96->wcreg & RME96_WCR_ADAT) == 0) {
^1da177e4c3f415 Linus Torvalds  2005-04-16   999  			rme96->wcreg &= ~(RME96_WCR_PRO | RME96_WCR_DOLBY | RME96_WCR_EMP);
^1da177e4c3f415 Linus Torvalds  2005-04-16  1000  			writel(rme96->wcreg |= rme96->wcreg_spdif_stream, rme96->iobase + RME96_IO_CONTROL_REGISTER);
^1da177e4c3f415 Linus Torvalds  2005-04-16  1001  		}
a74a821624c0c75 Takashi Iwai    2015-12-04  1002  
a74a821624c0c75 Takashi Iwai    2015-12-04  1003  		err = 0;
d3424b8bf78593e Takashi Iwai    2025-08-29  1004  	}
a74a821624c0c75 Takashi Iwai    2015-12-04  1005   error:
a74a821624c0c75 Takashi Iwai    2015-12-04  1006  	if (apply_dac_volume) {
a74a821624c0c75 Takashi Iwai    2015-12-04  1007  		usleep_range(3000, 10000);
a74a821624c0c75 Takashi Iwai    2015-12-04  1008  		snd_rme96_apply_dac_volume(rme96);
a74a821624c0c75 Takashi Iwai    2015-12-04  1009  	}
^1da177e4c3f415 Linus Torvalds  2005-04-16  1010  
a74a821624c0c75 Takashi Iwai    2015-12-04 @1011  	return err;
^1da177e4c3f415 Linus Torvalds  2005-04-16  1012  }
^1da177e4c3f415 Linus Torvalds  2005-04-16  1013  

:::::: The code at line 1011 was first introduced by commit
:::::: a74a821624c0c75388a193337babd17a8c02c740 ALSA: rme96: Fix unexpected volume reset after rate changes

:::::: TO: Takashi Iwai <tiwai@suse.de>
:::::: CC: Takashi Iwai <tiwai@suse.de>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
