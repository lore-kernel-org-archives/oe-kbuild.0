Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792530531;
	b=fspKllS912uJQPE3V0BawdDqCRR8v+nYjytIPP8kwWtwxPXPF99i4JkqzQETg5GMfp9j
	 cqQ1wSAl0kwWUHkjdqMB6spZlqHqADPFUUPpI+kkoPGB+7H+3CVVKMUF7z7++o0H5XI0+
	 fAIikaCiVG+owOPKmKXabakEX9xW6uowaOlKJcHMBdCr8FNPrA5HB+Z3ca6q+XEPqKyK2
	 Tj2+VkNrldrMh4qt/8HpdIItMvY78W8GwcA+xxEkQhfuu2OypCAARBVZXIJQpNQi2GZ3V
	 Sw+4v/EwftCmNXzCZBP0zdx9PKemP7U9hjMSuFxtBpVXdtrEGnTHe0FD+qu4WWAljjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792530531;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=DWPmd7o695eoBTzFz5HxVxAcHUq4Wj7YqqVnCGGiQLg=;
	b=dJYjwMXB54vry7AHUdgdyLOT5Z2UKmo2NLA2Cuz1zc+6r3/jFAGtvjSJmxRNMyirU06s
	 jQ6yjfoE8PndENoRwIajWrjBfJNoxf3ITpIUqr9M0Oob7xQo59vAK7sZF7mBwv5tydY/z
	 HJZrjR7MabgSFiVLcXW4HDmICo/RfjYa4Xl7KDBceC+Q9EyrUBJO9XuBRIuU7WnAkgFDJ
	 XXqzqqY1Nm4kz4nfKdTsdg+nbU13hJP2BuWL5eMsOSNilbXBUJ18/axb+RrAnDXsgXqEz
	 kuCsIQXKUU6ubD55DyHr3XI8MzZkjUWK/CqwMxLxwce0vdj08iXGxBr6cVXqokCPYJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IQJuBYWA;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0607606A327
	for <oe-kbuild@lists.linux.dev>; Tue, 20 Oct 2026 21:08:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0607606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IQJuBYWA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792530531; x=1824066531;
  h=date:from:to:cc:subject:message-id;
  bh=4apEAA8whoFIHyy30HSEP6wrg7rBQ/zrsLxj+/nMAJA=;
  b=IQJuBYWAAp034m/73aaH375J6Yx1O/kf+78ZJfmojyBWka5KdAyLRv8s
   b8oSJgedR+vXLUg54zjAyELcDVWLlTwO8MpBOwB7/sFDFrJUvalid5QsX
   k7t/8SPyBkr35fAEGZk/xbQJSQGcVrcgfhycNlG2chZnodh/dpelchRD0
   MyOR0OzpOxnaJmsUI9Zp7J79I6heQKtv9mwl5PMuEwRrlSM/oRwsMhmB+
   AZwGM/toVqBH/c/rPiADvzguDu3pM1jIukoYLFaekk9qgi5cjAhaVa8XK
   EvhucPcdl4WRSUFgZSZg/x6H8mmnawNOmBGwtYmPkBlI5o5ZAZ6zqi0Fn
   A==;
X-CSE-ConnectionGUID: TdbJST0gRE288Q4Knq8NAw==
X-CSE-MsgGUID: dbZmt+38SHCeCEAsH1VATQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1150104"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1150104"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 14:08:50 -0700
X-CSE-ConnectionGUID: 6MCNQlHtSxGkVclgrt/VHw==
X-CSE-MsgGUID: J3qMHJLOQ9Wty3csRpY52w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2971460"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 20 Oct 2026 14:08:48 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xJH4f-000000006RF-1nhm;
	Tue, 20 Oct 2026 21:08:45 +0000
Date: Tue, 20 Oct 2026 23:08:33 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 18830/19064]
 sound/core/compress_offload.c:716 snd_compr_set_params() warn: missing error
 code? 'retval'
Message-ID: <202610202334.hwrqtbb4-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
CC: Takashi Iwai <tiwai@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8f7df005a7564bd7ffa75da9c3085d5b996f1e16
commit: fbc74ca9fbf7e0b8f6872ccac62f9f4a1f3b5e53 [18830/19064] ALSA: compress: fix buffer leak on failed SET_PARAMS
:::::: branch date: 7 hours ago
:::::: commit date: 12 hours ago
config: i386-randconfig-2200-20261020 (https://download.01.org/0day-ci/archive/20261020/202610202334.hwrqtbb4-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610202334.hwrqtbb4-lkp@intel.com/

smatch warnings:
sound/core/compress_offload.c:716 snd_compr_set_params() warn: missing error code? 'retval'

vim +/retval +716 sound/core/compress_offload.c

4dc040a0b34890 Vinod Koul          2012-09-17  679  
b21c60a4edd22e Vinod Koul          2011-12-23  680  static int
b21c60a4edd22e Vinod Koul          2011-12-23  681  snd_compr_set_params(struct snd_compr_stream *stream, unsigned long arg)
b21c60a4edd22e Vinod Koul          2011-12-23  682  {
b21c60a4edd22e Vinod Koul          2011-12-23  683  	int retval;
b21c60a4edd22e Vinod Koul          2011-12-23  684  
7ea9ee0064281e Srinivas Kandagatla 2023-06-19  685  	if (stream->runtime->state == SNDRV_PCM_STATE_OPEN || stream->next_track) {
b21c60a4edd22e Vinod Koul          2011-12-23  686  		/*
b21c60a4edd22e Vinod Koul          2011-12-23  687  		 * we should allow parameter change only when stream has been
b21c60a4edd22e Vinod Koul          2011-12-23  688  		 * opened not in other cases
b21c60a4edd22e Vinod Koul          2011-12-23  689  		 */
14324b8f0760ca Takashi Iwai        2025-12-16  690  		struct snd_compr_params *params __free(kfree) =
14324b8f0760ca Takashi Iwai        2025-12-16  691  			memdup_user((void __user *)arg, sizeof(*params));
14324b8f0760ca Takashi Iwai        2025-12-16  692  
c2f14ba749c1ce Markus Elfring      2016-08-21  693  		if (IS_ERR(params))
40a024b81d1cba Takashi Iwai        2024-09-02  694  			return PTR_ERR(params);
4dc040a0b34890 Vinod Koul          2012-09-17  695  
04177158cf98a7 Jaroslav Kysela     2024-10-02  696  		retval = snd_compress_check_input(stream, params);
4dc040a0b34890 Vinod Koul          2012-09-17  697  		if (retval)
9b02221422a55e Takashi Iwai        2024-02-22  698  			return retval;
4dc040a0b34890 Vinod Koul          2012-09-17  699  
b21c60a4edd22e Vinod Koul          2011-12-23  700  		retval = snd_compr_allocate_buffer(stream, params);
9b02221422a55e Takashi Iwai        2024-02-22  701  		if (retval)
9b02221422a55e Takashi Iwai        2024-02-22  702  			return -ENOMEM;
4dc040a0b34890 Vinod Koul          2012-09-17  703  
b21c60a4edd22e Vinod Koul          2011-12-23  704  		retval = stream->ops->set_params(stream, params);
fbc74ca9fbf7e0 Peter Ujfalusi      2026-10-19  705  		if (retval) {
fbc74ca9fbf7e0 Peter Ujfalusi      2026-10-19  706  			/* the stream stays OPEN: drop the buffer of the rejected setup */
fbc74ca9fbf7e0 Peter Ujfalusi      2026-10-19  707  			if (stream->runtime->state == SNDRV_PCM_STATE_OPEN &&
fbc74ca9fbf7e0 Peter Ujfalusi      2026-10-19  708  			    !stream->runtime->dma_buffer_p) {
fbc74ca9fbf7e0 Peter Ujfalusi      2026-10-19  709  				kfree(stream->runtime->buffer);
fbc74ca9fbf7e0 Peter Ujfalusi      2026-10-19  710  				stream->runtime->buffer = NULL;
fbc74ca9fbf7e0 Peter Ujfalusi      2026-10-19  711  			}
9b02221422a55e Takashi Iwai        2024-02-22  712  			return retval;
fbc74ca9fbf7e0 Peter Ujfalusi      2026-10-19  713  		}
49bb6402f1aa1e Charles Keepax      2013-04-18  714  
7ea9ee0064281e Srinivas Kandagatla 2023-06-19  715  		if (stream->next_track)
9b02221422a55e Takashi Iwai        2024-02-22 @716  			return retval;
7ea9ee0064281e Srinivas Kandagatla 2023-06-19  717  
9727b490e543de Jeeja KP            2013-02-14  718  		stream->metadata_set = false;
9727b490e543de Jeeja KP            2013-02-14  719  		stream->next_track = false;
49bb6402f1aa1e Charles Keepax      2013-04-18  720  
49bb6402f1aa1e Charles Keepax      2013-04-18  721  		stream->runtime->state = SNDRV_PCM_STATE_SETUP;
769fab2a41da4b Jesper Juhl         2012-01-23  722  	} else {
b21c60a4edd22e Vinod Koul          2011-12-23  723  		return -EPERM;
769fab2a41da4b Jesper Juhl         2012-01-23  724  	}
b21c60a4edd22e Vinod Koul          2011-12-23  725  	return retval;
b21c60a4edd22e Vinod Koul          2011-12-23  726  }
b21c60a4edd22e Vinod Koul          2011-12-23  727  

:::::: The code at line 716 was first introduced by commit
:::::: 9b02221422a55e834469fdc91dc4d5147f5a1fb9 ALSA: compress_offload: Use automatic cleanup of kfree()

:::::: TO: Takashi Iwai <tiwai@suse.de>
:::::: CC: Takashi Iwai <tiwai@suse.de>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
