Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C889E30FC1D
	for <oe-kbuild@lists.linux.dev>; Fri, 12 Dec 2025 15:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765553287; cv=none; b=U+7z0NQ9NXcC+Mc46fIpkFmnCOxc4KKoc4kvpa8cDUUYIAMybP/pwDUtbEErxkZcMb43jXTxhnW4gd+Abzf18ZElBZHx+Ty//dHfo3AgDadthRaalUR6LLuZwoKAlXJGiWsKfUuHwPUEjVqSU9SpC+xmKWlQqBUmPeQgUio1Cwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765553287; c=relaxed/simple;
	bh=w0uKyFFb9ZOgcWQdM/f/4BZTdm0c5rWqjoIlu0GtUts=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TIsyvyN14DepY15AVKFRMcN9cL8MmZCzmN9IGqWJm/bsj9nv4bhM4gr2jKQf7DeZVgcUwBFfr9ozK1kpMWr6arHpQvRQp3eXB1xH5trlt+jdkpryEquIaNP0GGLz/jMJ+rip3BTb6zRn2QglR+zmeYWUb/nT/KGOfmhta1Efclw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ntjmcvB1; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ntjmcvB1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765553285; x=1797089285;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w0uKyFFb9ZOgcWQdM/f/4BZTdm0c5rWqjoIlu0GtUts=;
  b=ntjmcvB19XDlbUVMTrLTxmKgGmuzhfZtyEJaUsANLtSl6up7kN4IYjVC
   TIR55MKWq63uYrb0PhJaAPsH1qiB+FPkkiaKOTsSvg9xeT4MUU1aDd2Jv
   rrOH0clnhxL2qlEgE01G4WpJggJxo82cuXnNibTeihThCcrmNAIUNhaMq
   8IJi0qOCoyHxVgYYSdVa5e3HUV1m3qPkT/d7JTEgXxLyJV/YKSo994Tov
   4Z2XujuV449O2tLU9E4v5L8XXNFbjANJv5x+koSUVqRCAkv3hdrV7W2fE
   gn/irWydRjgOC2F5xrrHgrQF6WVScTA5BkjUD4gCWHl7t3KZ2VXtZC7ZE
   A==;
X-CSE-ConnectionGUID: 5N2IHz6uSYWPsb5vHaY09A==
X-CSE-MsgGUID: s6Wsa9MRQP2LV53BJ/n+Cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="67307111"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="67307111"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 07:28:04 -0800
X-CSE-ConnectionGUID: niu/39gfTxSdG4mSEzM8rA==
X-CSE-MsgGUID: hgkoMtx0TvufiszmSWulNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="201533198"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 12 Dec 2025 07:28:02 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vU53p-000000006EH-07IK;
	Fri, 12 Dec 2025 15:28:01 +0000
Date: Fri, 12 Dec 2025 23:27:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: sound/pci/rme96.c:1011 snd_rme96_playback_hw_params() warn:
 inconsistent returns '&rme96->lock'.
Message-ID: <202512122348.yWI6wbWU-lkp@intel.com>
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
TO: Takashi Iwai <tiwai@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   187d0801404f415f22c0b31531982c7ea97fa341
commit: d3424b8bf78593e1751cfa19628aa0008d2e08ce ALSA: rme96: Use guard() for spin locks
date:   3 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 3 months ago
config: i386-randconfig-141-20251212 (https://download.01.org/0day-ci/archive/20251212/202512122348.yWI6wbWU-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512122348.yWI6wbWU-lkp@intel.com/

smatch warnings:
sound/pci/rme96.c:1011 snd_rme96_playback_hw_params() warn: inconsistent returns '&rme96->lock'.
sound/pci/rme96.c:1011 snd_rme96_playback_hw_params() warn: inconsistent returns 'irq'.

vim +1011 sound/pci/rme96.c

^1da177e4c3f41 Linus Torvalds  2005-04-16   952  
^1da177e4c3f41 Linus Torvalds  2005-04-16   953  static int
a3aefd883dc8c1 Takashi Iwai    2005-11-17   954  snd_rme96_playback_hw_params(struct snd_pcm_substream *substream,
a3aefd883dc8c1 Takashi Iwai    2005-11-17   955  			     struct snd_pcm_hw_params *params)
^1da177e4c3f41 Linus Torvalds  2005-04-16   956  {
a3aefd883dc8c1 Takashi Iwai    2005-11-17   957  	struct rme96 *rme96 = snd_pcm_substream_chip(substream);
a3aefd883dc8c1 Takashi Iwai    2005-11-17   958  	struct snd_pcm_runtime *runtime = substream->runtime;
^1da177e4c3f41 Linus Torvalds  2005-04-16   959  	int err, rate, dummy;
a74a821624c0c7 Takashi Iwai    2015-12-04   960  	bool apply_dac_volume = false;
^1da177e4c3f41 Linus Torvalds  2005-04-16   961  
4d23359b7ec8b0 Clemens Ladisch 2005-09-05   962  	runtime->dma_area = (void __force *)(rme96->iobase +
4d23359b7ec8b0 Clemens Ladisch 2005-09-05   963  					     RME96_IO_PLAY_BUFFER);
^1da177e4c3f41 Linus Torvalds  2005-04-16   964  	runtime->dma_addr = rme96->port + RME96_IO_PLAY_BUFFER;
^1da177e4c3f41 Linus Torvalds  2005-04-16   965  	runtime->dma_bytes = RME96_BUFFER_SIZE;
^1da177e4c3f41 Linus Torvalds  2005-04-16   966  
d3424b8bf78593 Takashi Iwai    2025-08-29   967  	scoped_guard(spinlock_irq, &rme96->lock) {
da8eedb169712c Takashi Iwai    2021-06-08   968  		rate = 0;
^1da177e4c3f41 Linus Torvalds  2005-04-16   969  		if (!(rme96->wcreg & RME96_WCR_MASTER) &&
da8eedb169712c Takashi Iwai    2021-06-08   970  		    snd_rme96_getinputtype(rme96) != RME96_INPUT_ANALOG)
da8eedb169712c Takashi Iwai    2021-06-08   971  			rate = snd_rme96_capture_getrate(rme96, &dummy);
da8eedb169712c Takashi Iwai    2021-06-08   972  		if (rate > 0) {
^1da177e4c3f41 Linus Torvalds  2005-04-16   973  			/* slave clock */
d3424b8bf78593 Takashi Iwai    2025-08-29   974  			if ((int)params_rate(params) != rate)
d3424b8bf78593 Takashi Iwai    2025-08-29   975  				return -EIO;
a74a821624c0c7 Takashi Iwai    2015-12-04   976  		} else {
a74a821624c0c7 Takashi Iwai    2015-12-04   977  			err = snd_rme96_playback_setrate(rme96, params_rate(params));
a74a821624c0c7 Takashi Iwai    2015-12-04   978  			if (err < 0)
d3424b8bf78593 Takashi Iwai    2025-08-29   979  				return err;
a74a821624c0c7 Takashi Iwai    2015-12-04   980  			apply_dac_volume = err > 0; /* need to restore volume later? */
^1da177e4c3f41 Linus Torvalds  2005-04-16   981  		}
a74a821624c0c7 Takashi Iwai    2015-12-04   982  
a74a821624c0c7 Takashi Iwai    2015-12-04   983  		err = snd_rme96_playback_setformat(rme96, params_format(params));
a74a821624c0c7 Takashi Iwai    2015-12-04   984  		if (err < 0)
a74a821624c0c7 Takashi Iwai    2015-12-04   985  			goto error;
^1da177e4c3f41 Linus Torvalds  2005-04-16   986  		snd_rme96_setframelog(rme96, params_channels(params), 1);
^1da177e4c3f41 Linus Torvalds  2005-04-16   987  		if (rme96->capture_periodsize != 0) {
^1da177e4c3f41 Linus Torvalds  2005-04-16   988  			if (params_period_size(params) << rme96->playback_frlog !=
d3424b8bf78593 Takashi Iwai    2025-08-29   989  			    rme96->capture_periodsize) {
a74a821624c0c7 Takashi Iwai    2015-12-04   990  				err = -EBUSY;
a74a821624c0c7 Takashi Iwai    2015-12-04   991  				goto error;
^1da177e4c3f41 Linus Torvalds  2005-04-16   992  			}
^1da177e4c3f41 Linus Torvalds  2005-04-16   993  		}
^1da177e4c3f41 Linus Torvalds  2005-04-16   994  		rme96->playback_periodsize =
^1da177e4c3f41 Linus Torvalds  2005-04-16   995  			params_period_size(params) << rme96->playback_frlog;
^1da177e4c3f41 Linus Torvalds  2005-04-16   996  		snd_rme96_set_period_properties(rme96, rme96->playback_periodsize);
^1da177e4c3f41 Linus Torvalds  2005-04-16   997  		/* S/PDIF setup */
^1da177e4c3f41 Linus Torvalds  2005-04-16   998  		if ((rme96->wcreg & RME96_WCR_ADAT) == 0) {
^1da177e4c3f41 Linus Torvalds  2005-04-16   999  			rme96->wcreg &= ~(RME96_WCR_PRO | RME96_WCR_DOLBY | RME96_WCR_EMP);
^1da177e4c3f41 Linus Torvalds  2005-04-16  1000  			writel(rme96->wcreg |= rme96->wcreg_spdif_stream, rme96->iobase + RME96_IO_CONTROL_REGISTER);
^1da177e4c3f41 Linus Torvalds  2005-04-16  1001  		}
a74a821624c0c7 Takashi Iwai    2015-12-04  1002  
a74a821624c0c7 Takashi Iwai    2015-12-04  1003  		err = 0;
d3424b8bf78593 Takashi Iwai    2025-08-29  1004  	}
a74a821624c0c7 Takashi Iwai    2015-12-04  1005   error:
a74a821624c0c7 Takashi Iwai    2015-12-04  1006  	if (apply_dac_volume) {
a74a821624c0c7 Takashi Iwai    2015-12-04  1007  		usleep_range(3000, 10000);
a74a821624c0c7 Takashi Iwai    2015-12-04  1008  		snd_rme96_apply_dac_volume(rme96);
a74a821624c0c7 Takashi Iwai    2015-12-04  1009  	}
^1da177e4c3f41 Linus Torvalds  2005-04-16  1010  
a74a821624c0c7 Takashi Iwai    2015-12-04 @1011  	return err;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1012  }
^1da177e4c3f41 Linus Torvalds  2005-04-16  1013  

:::::: The code at line 1011 was first introduced by commit
:::::: a74a821624c0c75388a193337babd17a8c02c740 ALSA: rme96: Fix unexpected volume reset after rate changes

:::::: TO: Takashi Iwai <tiwai@suse.de>
:::::: CC: Takashi Iwai <tiwai@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
