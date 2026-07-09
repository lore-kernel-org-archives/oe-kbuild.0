Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23FE03D3B3
	for <oe-kbuild@lists.linux.dev>; Thu,  9 Jul 2026 04:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783572657; cv=none; b=FOIiRwzPwJh/zZqiToV83eCrxMIBnjjdvXdLVwTZmzZ5PzICDgSi5gvyJKcrW/YH7clGI4FjCzRJwkpFvCgMETaLzsB4w4PDTkX5JHryWbj9ueGj9FATPS6IiY9he52ZXYkwGSnVINhqAcVyj/1NfBEvLJyS2aiuYXKZ7yLhkM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783572657; c=relaxed/simple;
	bh=HNj5hAO7AGuSw+UCltrHmvuaD2/CH2XPLOOkZUDoKvE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ka3zi4sDCW4V+WyeooQCGIKcG1M6CeJA11l6HyqO8U4DxzeiXzM9vgj0MK4neMM0DAZjlurCWeQi9LdIjWjsiMObb0Bsswl9jhtfLB05UzUqoPvOCQBRxl7GnTR7QCO+kQa2usEP6PWH5KI5ns+Nh/t5NUjItAkZw2l+QjBaMM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ePkIehJy; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ePkIehJy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783572656; x=1815108656;
  h=date:from:to:cc:subject:message-id;
  bh=HNj5hAO7AGuSw+UCltrHmvuaD2/CH2XPLOOkZUDoKvE=;
  b=ePkIehJyYfamaxAbxuQhkZ87kincvZO8k1KZ1CUR0r9nxo2hJyIX4DjL
   2MYqXcLNT6GLCvq2VITljYR3gxnf4n/FnC2Rtmq+BZB6e7QZLcGv70wzp
   Sw+RYIbD2EL9AWYB9pWkR+VYBajQSOIpLcMW7tfc26efCcShY9TS3sioZ
   lx4abEcmf+uD58S7DB0kr/++NptTwkSuJsTSUl/74rmtiKdaNp9+e9o8o
   WnJGA7sFnWCP8eKlmatij+VUuz0TR3eR1hXM4IuOGW/MjtYCxkNFfUo/L
   hrxgFHy1wI99lLU1qtqifu5Twf/cTzfRY0gx/7wyTjWfFztLpBBjlr3hu
   Q==;
X-CSE-ConnectionGUID: Gy20TwQZR5OeDlgQWWx59Q==
X-CSE-MsgGUID: 2WV+G7WmRwy7NebNFcU0wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="94893588"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="94893588"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 21:50:55 -0700
X-CSE-ConnectionGUID: y3SrPkq9Tc+EmGOfedHzAg==
X-CSE-MsgGUID: XubpWIgtSCOYP4k4zs4sYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="258343016"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 08 Jul 2026 21:50:54 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whgip-00000000HHz-1MQG;
	Thu, 09 Jul 2026 04:50:51 +0000
Date: Thu, 09 Jul 2026 12:50:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 3909/4669]
 sound/hda/core/controller.c:726 snd_hdac_bus_alloc_stream_pages() warn:
 missing unwind goto?
Message-ID: <202607091250.mv4NjwPr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Zhao Dongdong <zhaodongdong@kylinos.cn>
CC: Takashi Iwai <tiwai@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b9810cd75b9fb56a3425d391cba3f608502bd474
commit: f16eaa38ea640884f66d24865c770c3f6c43bd42 [3909/4669] ALSA: hda/core: add cleanup in snd_hdac_bus_alloc_stream_pages()
:::::: branch date: 15 hours ago
:::::: commit date: 2 days ago
config: parisc-randconfig-r071-20260709 (https://download.01.org/0day-ci/archive/20260709/202607091250.mv4NjwPr-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 16.1.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607091250.mv4NjwPr-lkp@intel.com/

smatch warnings:
sound/hda/core/controller.c:726 snd_hdac_bus_alloc_stream_pages() warn: missing unwind goto?

vim +726 sound/hda/core/controller.c

304dad30388d01 sound/hda/hdac_controller.c Jeeja KP      2015-04-12  701  
304dad30388d01 sound/hda/hdac_controller.c Jeeja KP      2015-04-12  702  /**
304dad30388d01 sound/hda/hdac_controller.c Jeeja KP      2015-04-12  703   * snd_hdac_bus_alloc_stream_pages - allocate BDL and other buffers
304dad30388d01 sound/hda/hdac_controller.c Jeeja KP      2015-04-12  704   * @bus: HD-audio core bus
304dad30388d01 sound/hda/hdac_controller.c Jeeja KP      2015-04-12  705   *
304dad30388d01 sound/hda/hdac_controller.c Jeeja KP      2015-04-12  706   * Call this after assigning the all streams.
304dad30388d01 sound/hda/hdac_controller.c Jeeja KP      2015-04-12  707   * Returns zero for success, or a negative error code.
304dad30388d01 sound/hda/hdac_controller.c Jeeja KP      2015-04-12  708   */
304dad30388d01 sound/hda/hdac_controller.c Jeeja KP      2015-04-12  709  int snd_hdac_bus_alloc_stream_pages(struct hdac_bus *bus)
304dad30388d01 sound/hda/hdac_controller.c Jeeja KP      2015-04-12  710  {
304dad30388d01 sound/hda/hdac_controller.c Jeeja KP      2015-04-12  711  	struct hdac_stream *s;
304dad30388d01 sound/hda/hdac_controller.c Jeeja KP      2015-04-12  712  	int num_streams = 0;
619a1f195f9327 sound/hda/hdac_controller.c Takashi Iwai  2019-08-07  713  	int dma_type = bus->dma_type ? bus->dma_type : SNDRV_DMA_TYPE_DEV;
304dad30388d01 sound/hda/hdac_controller.c Jeeja KP      2015-04-12  714  	int err;
304dad30388d01 sound/hda/hdac_controller.c Jeeja KP      2015-04-12  715  
304dad30388d01 sound/hda/hdac_controller.c Jeeja KP      2015-04-12  716  	list_for_each_entry(s, &bus->stream_list, list) {
304dad30388d01 sound/hda/hdac_controller.c Jeeja KP      2015-04-12  717  		/* allocate memory for the BDL for each stream */
619a1f195f9327 sound/hda/hdac_controller.c Takashi Iwai  2019-08-07  718  		err = snd_dma_alloc_pages(dma_type, bus->dev,
304dad30388d01 sound/hda/hdac_controller.c Jeeja KP      2015-04-12  719  					  BDL_SIZE, &s->bdl);
304dad30388d01 sound/hda/hdac_controller.c Jeeja KP      2015-04-12  720  		num_streams++;
304dad30388d01 sound/hda/hdac_controller.c Jeeja KP      2015-04-12  721  		if (err < 0)
f16eaa38ea6408 sound/hda/core/controller.c Zhao Dongdong 2026-07-07  722  			goto error_bdl;
304dad30388d01 sound/hda/hdac_controller.c Jeeja KP      2015-04-12  723  	}
304dad30388d01 sound/hda/hdac_controller.c Jeeja KP      2015-04-12  724  
304dad30388d01 sound/hda/hdac_controller.c Jeeja KP      2015-04-12  725  	if (WARN_ON(!num_streams))
304dad30388d01 sound/hda/hdac_controller.c Jeeja KP      2015-04-12 @726  		return -EINVAL;
304dad30388d01 sound/hda/hdac_controller.c Jeeja KP      2015-04-12  727  	/* allocate memory for the position buffer */
619a1f195f9327 sound/hda/hdac_controller.c Takashi Iwai  2019-08-07  728  	err = snd_dma_alloc_pages(dma_type, bus->dev,
304dad30388d01 sound/hda/hdac_controller.c Jeeja KP      2015-04-12  729  				  num_streams * 8, &bus->posbuf);
304dad30388d01 sound/hda/hdac_controller.c Jeeja KP      2015-04-12  730  	if (err < 0)
f16eaa38ea6408 sound/hda/core/controller.c Zhao Dongdong 2026-07-07  731  		goto error_bdl;
304dad30388d01 sound/hda/hdac_controller.c Jeeja KP      2015-04-12  732  	list_for_each_entry(s, &bus->stream_list, list)
304dad30388d01 sound/hda/hdac_controller.c Jeeja KP      2015-04-12  733  		s->posbuf = (__le32 *)(bus->posbuf.area + s->index * 8);
304dad30388d01 sound/hda/hdac_controller.c Jeeja KP      2015-04-12  734  
304dad30388d01 sound/hda/hdac_controller.c Jeeja KP      2015-04-12  735  	/* single page (at least 4096 bytes) must suffice for both ringbuffes */
f16eaa38ea6408 sound/hda/core/controller.c Zhao Dongdong 2026-07-07  736  	err = snd_dma_alloc_pages(dma_type, bus->dev, PAGE_SIZE, &bus->rb);
f16eaa38ea6408 sound/hda/core/controller.c Zhao Dongdong 2026-07-07  737  	if (err < 0)
f16eaa38ea6408 sound/hda/core/controller.c Zhao Dongdong 2026-07-07  738  		goto error_posbuf;
f16eaa38ea6408 sound/hda/core/controller.c Zhao Dongdong 2026-07-07  739  	return 0;
f16eaa38ea6408 sound/hda/core/controller.c Zhao Dongdong 2026-07-07  740  
f16eaa38ea6408 sound/hda/core/controller.c Zhao Dongdong 2026-07-07  741  error_posbuf:
f16eaa38ea6408 sound/hda/core/controller.c Zhao Dongdong 2026-07-07  742  	snd_dma_free_pages(&bus->posbuf);
f16eaa38ea6408 sound/hda/core/controller.c Zhao Dongdong 2026-07-07  743  error_bdl:
f16eaa38ea6408 sound/hda/core/controller.c Zhao Dongdong 2026-07-07  744  	list_for_each_entry(s, &bus->stream_list, list) {
f16eaa38ea6408 sound/hda/core/controller.c Zhao Dongdong 2026-07-07  745  		if (s->bdl.area)
f16eaa38ea6408 sound/hda/core/controller.c Zhao Dongdong 2026-07-07  746  			snd_dma_free_pages(&s->bdl);
f16eaa38ea6408 sound/hda/core/controller.c Zhao Dongdong 2026-07-07  747  	}
f16eaa38ea6408 sound/hda/core/controller.c Zhao Dongdong 2026-07-07  748  	return -ENOMEM;
304dad30388d01 sound/hda/hdac_controller.c Jeeja KP      2015-04-12  749  }
304dad30388d01 sound/hda/hdac_controller.c Jeeja KP      2015-04-12  750  EXPORT_SYMBOL_GPL(snd_hdac_bus_alloc_stream_pages);
304dad30388d01 sound/hda/hdac_controller.c Jeeja KP      2015-04-12  751  

:::::: The code at line 726 was first introduced by commit
:::::: 304dad30388d017544bc2e90fe4fefcca94263d3 ALSA: hda - moved alloc/free stream pages function to controller library

:::::: TO: Jeeja KP <jeeja.kp@intel.com>
:::::: CC: Takashi Iwai <tiwai@suse.de>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
