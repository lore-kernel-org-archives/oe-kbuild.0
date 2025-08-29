Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7436825EFBC
	for <oe-kbuild@lists.linux.dev>; Fri, 29 Aug 2025 23:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756508676; cv=none; b=F8iE8y4YawcgFM3RXcVmN+SMQcP2C1cqN1wYkKny6mQ5FXJsd54TI++TGITuNiJZdKa5bohZSbF2FxUlrGXmsaMHUFf4ECgqwgxytPIcf+8S41oBP3ufeUeSmaBF6habZUDIou1/Y6QcZbv46RA1Pu3/jPknCUXKZym2F5eBgR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756508676; c=relaxed/simple;
	bh=ZI6WfDRdR0euKiZKAQgTtZqXYxKgh3fyHDma06eZtGw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Xy7X0Mg9+ojG4z0DVikB7Tpoj1XOpDER2IY+iN9DJupW6L5SGrzbn7HZOOVUkettA92AnV6McxZSBSWfuQgoQuI8GCQeVL1G/J1wFcZqO4fY/eqZp59gNR8pTJitVHUOR2YAN4ZeCtxlb7sacdTG8OeM0h7QGtzopSYKTZs9YhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m9q8MvX0; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m9q8MvX0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756508673; x=1788044673;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZI6WfDRdR0euKiZKAQgTtZqXYxKgh3fyHDma06eZtGw=;
  b=m9q8MvX0w4v1gOhv0+GZBk6jA8eSBJuiJebYAcGUH9G/s4Gz3s1MCQ0Q
   gEh9FlFDjuEfLExbOEHbwAtxIrj4LprGW2CJvKOajfkOouoMaq+hKOS/E
   B+rhzuxdDvOZ2LuRteFVXGYeX3RhkHjZMvacpwlr74Z5qnzVyjkN5CMYS
   3jRgGWn0mPPfGBBYCGZsr1AGTFQwxbfhkBioF3XsstP//9YNXunnsLUwe
   Mw8FXxEh7bJZyxIeyeuT6lvD+++6EEdMucvBhRHjucY55WmFMPE7IXgoG
   y4nklH5bExXxrNtWlBQ5ebPA3tZLWaatAUqzlEDvAiKIunquMrLKaEBH0
   Q==;
X-CSE-ConnectionGUID: a7NXn3rwSyqev+X0n6tZWg==
X-CSE-MsgGUID: zRG5vAf7SPqxAHe5V9rILA==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="58869643"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="scan'208";a="58869643"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2025 16:04:33 -0700
X-CSE-ConnectionGUID: 1cYyBm3eTg2UE8gW7dDIUg==
X-CSE-MsgGUID: 0acx72SBQ8WKiXwxMo5y5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="scan'208";a="174661611"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 29 Aug 2025 16:04:31 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1us88l-000V27-13;
	Fri, 29 Aug 2025 23:04:28 +0000
Date: Sat, 30 Aug 2025 07:04:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: sound/usb/pcm.c:855:6-7: WARNING: Unsigned expression compared with
 zero: r > 0
Message-ID: <202508300615.PVkr2D96-lkp@intel.com>
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
TO: Tiwei Bie <tiwei.btw@antgroup.com>
CC: Johannes Berg <johannes.berg@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fb679c832b6497f19fffb8274c419783909c0912
commit: a0e2cb6a90634f3dc80f16e882a683ee5761b0b0 um: Add VFIO-based virtual PCI driver
date:   4 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 4 months ago
config: um-randconfig-r053-20250830 (https://download.01.org/0day-ci/archive/20250830/202508300615.PVkr2D96-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202508300615.PVkr2D96-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> sound/usb/pcm.c:855:6-7: WARNING: Unsigned expression compared with zero: r > 0

vim +855 sound/usb/pcm.c

37b3e56d8911f9e Takashi Iwai 2023-01-02  813  
e5779998bf8b70e Daniel Mack  2010-03-04  814  static int hw_rule_rate(struct snd_pcm_hw_params *params,
e5779998bf8b70e Daniel Mack  2010-03-04  815  			struct snd_pcm_hw_rule *rule)
e5779998bf8b70e Daniel Mack  2010-03-04  816  {
e5779998bf8b70e Daniel Mack  2010-03-04  817  	struct snd_usb_substream *subs = rule->private;
4e7cf1fbb34ecb4 Takashi Iwai 2021-09-29  818  	struct snd_usb_audio *chip = subs->stream->chip;
37b3e56d8911f9e Takashi Iwai 2023-01-02  819  	const struct snd_usb_endpoint *ep;
cab941b7e5cf054 Takashi Iwai 2020-11-23  820  	const struct audioformat *fp;
e5779998bf8b70e Daniel Mack  2010-03-04  821  	struct snd_interval *it = hw_param_interval(params, SNDRV_PCM_HW_PARAM_RATE);
bc4e94aa8e72e79 Takashi Iwai 2020-11-23  822  	unsigned int rmin, rmax, r;
bc4e94aa8e72e79 Takashi Iwai 2020-11-23  823  	int i;
e5779998bf8b70e Daniel Mack  2010-03-04  824  
e5779998bf8b70e Daniel Mack  2010-03-04  825  	hwc_debug("hw_rule_rate: (%d,%d)\n", it->min, it->max);
bc4e94aa8e72e79 Takashi Iwai 2020-11-23  826  	rmin = UINT_MAX;
bc4e94aa8e72e79 Takashi Iwai 2020-11-23  827  	rmax = 0;
88766f04c4142c0 Eldad Zack   2013-04-03  828  	list_for_each_entry(fp, &subs->fmt_list, list) {
e5779998bf8b70e Daniel Mack  2010-03-04  829  		if (!hw_check_valid_format(subs, params, fp))
e5779998bf8b70e Daniel Mack  2010-03-04  830  			continue;
37b3e56d8911f9e Takashi Iwai 2023-01-02  831  
37b3e56d8911f9e Takashi Iwai 2023-01-02  832  		ep = get_endpoint_in_use(chip, fp->endpoint,
37b3e56d8911f9e Takashi Iwai 2023-01-02  833  					 subs->data_endpoint);
37b3e56d8911f9e Takashi Iwai 2023-01-02  834  		if (ep) {
37b3e56d8911f9e Takashi Iwai 2023-01-02  835  			hwc_debug("rate limit %d for ep#%x\n",
37b3e56d8911f9e Takashi Iwai 2023-01-02  836  				  ep->cur_rate, fp->endpoint);
37b3e56d8911f9e Takashi Iwai 2023-01-02  837  			rmin = min(rmin, ep->cur_rate);
37b3e56d8911f9e Takashi Iwai 2023-01-02  838  			rmax = max(rmax, ep->cur_rate);
37b3e56d8911f9e Takashi Iwai 2023-01-02  839  			continue;
37b3e56d8911f9e Takashi Iwai 2023-01-02  840  		}
37b3e56d8911f9e Takashi Iwai 2023-01-02  841  
37b3e56d8911f9e Takashi Iwai 2023-01-02  842  		if (fp->implicit_fb) {
37b3e56d8911f9e Takashi Iwai 2023-01-02  843  			ep = get_endpoint_in_use(chip, fp->sync_ep,
37b3e56d8911f9e Takashi Iwai 2023-01-02  844  						 subs->sync_endpoint);
37b3e56d8911f9e Takashi Iwai 2023-01-02  845  			if (ep) {
37b3e56d8911f9e Takashi Iwai 2023-01-02  846  				hwc_debug("rate limit %d for sync_ep#%x\n",
37b3e56d8911f9e Takashi Iwai 2023-01-02  847  					  ep->cur_rate, fp->sync_ep);
37b3e56d8911f9e Takashi Iwai 2023-01-02  848  				rmin = min(rmin, ep->cur_rate);
37b3e56d8911f9e Takashi Iwai 2023-01-02  849  				rmax = max(rmax, ep->cur_rate);
37b3e56d8911f9e Takashi Iwai 2023-01-02  850  				continue;
37b3e56d8911f9e Takashi Iwai 2023-01-02  851  			}
37b3e56d8911f9e Takashi Iwai 2023-01-02  852  		}
37b3e56d8911f9e Takashi Iwai 2023-01-02  853  
4e7cf1fbb34ecb4 Takashi Iwai 2021-09-29  854  		r = snd_usb_endpoint_get_clock_rate(chip, fp->clock);
4e7cf1fbb34ecb4 Takashi Iwai 2021-09-29 @855  		if (r > 0) {
4e7cf1fbb34ecb4 Takashi Iwai 2021-09-29  856  			if (!snd_interval_test(it, r))
4e7cf1fbb34ecb4 Takashi Iwai 2021-09-29  857  				continue;
4e7cf1fbb34ecb4 Takashi Iwai 2021-09-29  858  			rmin = min(rmin, r);
4e7cf1fbb34ecb4 Takashi Iwai 2021-09-29  859  			rmax = max(rmax, r);
4e7cf1fbb34ecb4 Takashi Iwai 2021-09-29  860  			continue;
4e7cf1fbb34ecb4 Takashi Iwai 2021-09-29  861  		}
bc4e94aa8e72e79 Takashi Iwai 2020-11-23  862  		if (fp->rate_table && fp->nr_rates) {
bc4e94aa8e72e79 Takashi Iwai 2020-11-23  863  			for (i = 0; i < fp->nr_rates; i++) {
bc4e94aa8e72e79 Takashi Iwai 2020-11-23  864  				r = fp->rate_table[i];
bc4e94aa8e72e79 Takashi Iwai 2020-11-23  865  				if (!snd_interval_test(it, r))
bc4e94aa8e72e79 Takashi Iwai 2020-11-23  866  					continue;
bc4e94aa8e72e79 Takashi Iwai 2020-11-23  867  				rmin = min(rmin, r);
bc4e94aa8e72e79 Takashi Iwai 2020-11-23  868  				rmax = max(rmax, r);
bc4e94aa8e72e79 Takashi Iwai 2020-11-23  869  			}
e5779998bf8b70e Daniel Mack  2010-03-04  870  		} else {
bc4e94aa8e72e79 Takashi Iwai 2020-11-23  871  			rmin = min(rmin, fp->rate_min);
bc4e94aa8e72e79 Takashi Iwai 2020-11-23  872  			rmax = max(rmax, fp->rate_max);
e5779998bf8b70e Daniel Mack  2010-03-04  873  		}
e5779998bf8b70e Daniel Mack  2010-03-04  874  	}
e5779998bf8b70e Daniel Mack  2010-03-04  875  
7726dce14c5e7ea Takashi Iwai 2020-11-23  876  	return apply_hw_params_minmax(it, rmin, rmax);
e5779998bf8b70e Daniel Mack  2010-03-04  877  }
e5779998bf8b70e Daniel Mack  2010-03-04  878  

:::::: The code at line 855 was first introduced by commit
:::::: 4e7cf1fbb34ecb472c073980458cbe413afd4d64 ALSA: usb-audio: Restrict rates for the shared clocks

:::::: TO: Takashi Iwai <tiwai@suse.de>
:::::: CC: Takashi Iwai <tiwai@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
