Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2504629BDBA
	for <oe-kbuild@lists.linux.dev>; Mon, 25 Aug 2025 09:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756115593; cv=none; b=sw1YbQYHKC2Ro6AwRBBGjq7U6NhhDT+OTf0cRNsxXzogwjBJ3yHb/M5Ivuv62iyFdbik3fuM/1bdrVD85oAe0FA1uOJFkxjwM9xU5+fKhWKw117qrN8OIUFu0fMvIV5p2KSiekLTllJnFZMxayQIKKgX/6NT9ZuFpl5tlrjsVtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756115593; c=relaxed/simple;
	bh=3QeAlWZxseABKSraHhPEkqBrM1wLASocv7moMjJisUI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K+Q9drE6O4iCAyFIT09T4A0bTGtSihsW0hz1fUAjRlstvgcblTZkFyhTTmyAdhImNx+Ywp7wmYVW/xaZa6vWL6H81CE/h338hcHkhP+nK50ceOMd0CT8sCmBLjbRthTBTDItAVDcaaAbl9FceI6OVX9JOca8CVb+1LDNDxaJf/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eP2o9Bhu; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eP2o9Bhu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756115593; x=1787651593;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3QeAlWZxseABKSraHhPEkqBrM1wLASocv7moMjJisUI=;
  b=eP2o9Bhuryju/b4dlZqxrGHO9djPAoxE7lJCBPwlRdHGn1Jeg6D/7D2S
   Ukjaeek/JZcFl+1uLSDVhdnv4EiPR2LfUjmes2pSOawnKSFO7gGu7cfsk
   NEsNh7Guc7VieMaqV5Bs5+LcqR8KLLwh9z58M5vK+fqWocwvPn+8Cgg45
   GmzRaoXZA52ypnl9GYFrMb36EOdZGBkcriGYt8McrD0WW2d8JK46Safwb
   nejOJOxfwrQoez7Y9HNkAYKp6lOdjTTQcAbZ/yWcBhzNXv0pxj+MhE6de
   3sLBhYeKS2jHZTZgO9orwwGtqIiHwmviq0WxRxYXzXISyHluTNIwUTjgx
   w==;
X-CSE-ConnectionGUID: f8oYTFkDQ921ogdLQOPZIQ==
X-CSE-MsgGUID: c1DWgNapRrik+oHJQ+oCVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58245865"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58245865"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 02:53:12 -0700
X-CSE-ConnectionGUID: nRTlghyXR+i8h2hpG96CNw==
X-CSE-MsgGUID: 59kqC5uySoGV11zIpAw+5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="200145869"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 25 Aug 2025 02:53:10 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uqTsr-000Na9-2z;
	Mon, 25 Aug 2025 09:53:02 +0000
Date: Mon, 25 Aug 2025 17:52:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [tiwai-sound:test/auto-cleanup 109/178] sound/pci/rme96.c:1011
 snd_rme96_playback_hw_params() warn: inconsistent returns '&rme96->lock'.
Message-ID: <202508251716.OJKzKVFY-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git test/auto-cleanup
head:   1e7737301c8d897813301af12b69031eef11c5ef
commit: 2c080e7ec6a179f7189fdebdbb1dafcde5a7a027 [109/178] ALSA: rme96: Use guard() for spin locks
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: i386-randconfig-141-20250825 (https://download.01.org/0day-ci/archive/20250825/202508251716.OJKzKVFY-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508251716.OJKzKVFY-lkp@intel.com/

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
2c080e7ec6a179f Takashi Iwai    2025-08-07   967  	scoped_guard(spinlock_irq, &rme96->lock) {
da8eedb169712c8 Takashi Iwai    2021-06-08   968  		rate = 0;
^1da177e4c3f415 Linus Torvalds  2005-04-16   969  		if (!(rme96->wcreg & RME96_WCR_MASTER) &&
da8eedb169712c8 Takashi Iwai    2021-06-08   970  		    snd_rme96_getinputtype(rme96) != RME96_INPUT_ANALOG)
da8eedb169712c8 Takashi Iwai    2021-06-08   971  			rate = snd_rme96_capture_getrate(rme96, &dummy);
da8eedb169712c8 Takashi Iwai    2021-06-08   972  		if (rate > 0) {
^1da177e4c3f415 Linus Torvalds  2005-04-16   973  			/* slave clock */
2c080e7ec6a179f Takashi Iwai    2025-08-07   974  			if ((int)params_rate(params) != rate)
2c080e7ec6a179f Takashi Iwai    2025-08-07   975  				return -EIO;
a74a821624c0c75 Takashi Iwai    2015-12-04   976  		} else {
a74a821624c0c75 Takashi Iwai    2015-12-04   977  			err = snd_rme96_playback_setrate(rme96, params_rate(params));
a74a821624c0c75 Takashi Iwai    2015-12-04   978  			if (err < 0)
2c080e7ec6a179f Takashi Iwai    2025-08-07   979  				return err;
a74a821624c0c75 Takashi Iwai    2015-12-04   980  			apply_dac_volume = err > 0; /* need to restore volume later? */
^1da177e4c3f415 Linus Torvalds  2005-04-16   981  		}
a74a821624c0c75 Takashi Iwai    2015-12-04   982  
a74a821624c0c75 Takashi Iwai    2015-12-04   983  		err = snd_rme96_playback_setformat(rme96, params_format(params));
a74a821624c0c75 Takashi Iwai    2015-12-04   984  		if (err < 0)
a74a821624c0c75 Takashi Iwai    2015-12-04   985  			goto error;
^1da177e4c3f415 Linus Torvalds  2005-04-16   986  		snd_rme96_setframelog(rme96, params_channels(params), 1);
^1da177e4c3f415 Linus Torvalds  2005-04-16   987  		if (rme96->capture_periodsize != 0) {
^1da177e4c3f415 Linus Torvalds  2005-04-16   988  			if (params_period_size(params) << rme96->playback_frlog !=
2c080e7ec6a179f Takashi Iwai    2025-08-07   989  			    rme96->capture_periodsize) {
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
2c080e7ec6a179f Takashi Iwai    2025-08-07  1004  	}
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
