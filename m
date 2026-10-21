Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792562724;
	b=PNYArH7JK3Rm7Lve3Pxe0dM0vpt2AzFcOPnspj/zgAG8PvT5zjlhOKy8yoHl2hgViYg9
	 AhcBiYcCaF2p8Zjsfk57m26VKFcM8GACAy8KQSkbk1UZlEbzsylX3dIy69ooihnb7quMy
	 xknzpXiFCJPIpV/kcCznEIkC3typmg4IFiVj1d/HvTQrNL+npP2D3g1i86I5aM5+Tce/e
	 BO12JIfWaFehjxoZte9Cpk7c9F6Ke0CRHFQD8Yv1+ooVJuRuc5XeX4xo0wGv0qdZolQ2W
	 vC99l7hvhdIPJWVsJ9toMoC/Yvp2ZzSP0M+fMCmOxUKpSauiC+YJLsBrJtos0bhxjsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792562724;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=N/5q21OvGd5ns9OUFLeFuI/pZ7KvX1SIt5JmzK7i3FM=;
	b=YVmD53dEU7tp6CfCK+COEz2F8r38lBfAZn+bXrjBS4qPrHGTrLDV9tDJGkVlh5qylyK4
	 jLJe26HnbbhbPKJtnbDHxk7coMdGmpm4SziFDVB/OXveXy7CrY+DdR1WcIkZxYqcEJOYR
	 c7o1d++9RtQxLWPx84u++DNqWquKs0Ga9gj7uq0c59LDOUSVhG7wJo5MtupvfQhbBjUA6
	 0OjlyJhVZFB65VH7Yqdz2F5Z5XzWIGJUoDW/rv3PaRNdDeBk5sauQk9pG+RsMhv/rTPdA
	 14ctfNkpbZzfXAJsYtB9ANk5vloR1bzXAJFDNBKc8Qb+HjETvKesRsIOmSnsQctbCJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PiRf0hPQ;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9AA60A2610;
	Wed, 21 Oct 2026 06:05:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC9AA60A2610
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PiRf0hPQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792562724; x=1824098724;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=F5mkf84kmoXGw2nwPLN53ap/23KFRzKzFiG0fHHic94=;
  b=PiRf0hPQtaoATY9EgjrP6/l2Me5LP38cvost2c/rLb+PeShLBWp9X7e2
   EUii/WlYYEXy1y5JIwPPXECsvjpGb531nqXPqSPefAZmR07EFnUE/jU3U
   p5pjT0MiP515tTVNIW3X0GKJK7E00AleH2B8Ya9rp3pSdneGDffNiJ8Hq
   HV5VRwzKintM4x78vEy6iK7cwGH9N8JHrQOK9FSEYaZFFvgrLj77ezYCy
   f5Hzt4vk/snzuE6n+gZIK1c39EWUEqnPXpLrajH1nsNPr+W/xhYNEu6tL
   l4qPnRrvH4BnAMKfEBW+jEKQLJFDrDGYyUb2l+wPlP5JU0T4Wuy3mNbLv
   w==;
X-CSE-ConnectionGUID: ALbSLM8nTUyAJkpJBO7g4Q==
X-CSE-MsgGUID: zABWIgIrTXCsLG6nvOHifQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1165913"
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="1165913"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 23:05:23 -0700
X-CSE-ConnectionGUID: CPL33KHtSaeJymbW8onrjw==
X-CSE-MsgGUID: tL+mMpmuRQGdhwhIGXrIRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="3467386"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO [10.245.245.1]) ([10.245.245.1])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 23:05:22 -0700
Message-ID: <38cf4318-faa9-4d6a-9e26-56cf4e312df1@linux.intel.com>
Date: Wed, 21 Oct 2026 09:05:53 +0300
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 18830/19064] sound/core/compress_offload.c:716
 snd_compr_set_params() warn: missing error code? 'retval'
To: Dan Carpenter <error27@gmail.com>, oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, Takashi Iwai <tiwai@suse.de>
References: <202610202334.hwrqtbb4-lkp@intel.com>
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Content-Language: en-US
In-Reply-To: <202610202334.hwrqtbb4-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 21/10/2026 08:54, Dan Carpenter wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   8f7df005a7564bd7ffa75da9c3085d5b996f1e16
> commit: fbc74ca9fbf7e0b8f6872ccac62f9f4a1f3b5e53 [18830/19064] ALSA: compress: fix buffer leak on failed SET_PARAMS
> config: i386-randconfig-2200-20261020 (https://download.01.org/0day-ci/archive/20261020/202610202334.hwrqtbb4-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
> smatch: v0.5.0-9187-g5189e3fb
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <error27@gmail.com>
> | Closes: https://lore.kernel.org/r/202610202334.hwrqtbb4-lkp@intel.com/
> 
> smatch warnings:
> sound/core/compress_offload.c:716 snd_compr_set_params() warn: missing error code? 'retval'
> 
> vim +/retval +716 sound/core/compress_offload.c
> 
> b21c60a4edd22e Vinod Koul          2011-12-23  680  static int
> b21c60a4edd22e Vinod Koul          2011-12-23  681  snd_compr_set_params(struct snd_compr_stream *stream, unsigned long arg)
> b21c60a4edd22e Vinod Koul          2011-12-23  682  {
> b21c60a4edd22e Vinod Koul          2011-12-23  683  	int retval;
> b21c60a4edd22e Vinod Koul          2011-12-23  684  
> 7ea9ee0064281e Srinivas Kandagatla 2023-06-19  685  	if (stream->runtime->state == SNDRV_PCM_STATE_OPEN || stream->next_track) {
> b21c60a4edd22e Vinod Koul          2011-12-23  686  		/*
> b21c60a4edd22e Vinod Koul          2011-12-23  687  		 * we should allow parameter change only when stream has been
> b21c60a4edd22e Vinod Koul          2011-12-23  688  		 * opened not in other cases
> b21c60a4edd22e Vinod Koul          2011-12-23  689  		 */
> 14324b8f0760ca Takashi Iwai        2025-12-16  690  		struct snd_compr_params *params __free(kfree) =
> 14324b8f0760ca Takashi Iwai        2025-12-16  691  			memdup_user((void __user *)arg, sizeof(*params));
> 14324b8f0760ca Takashi Iwai        2025-12-16  692  
> c2f14ba749c1ce Markus Elfring      2016-08-21  693  		if (IS_ERR(params))
> 40a024b81d1cba Takashi Iwai        2024-09-02  694  			return PTR_ERR(params);
> 4dc040a0b34890 Vinod Koul          2012-09-17  695  
> 04177158cf98a7 Jaroslav Kysela     2024-10-02  696  		retval = snd_compress_check_input(stream, params);
> 4dc040a0b34890 Vinod Koul          2012-09-17  697  		if (retval)
> 9b02221422a55e Takashi Iwai        2024-02-22  698  			return retval;
> 4dc040a0b34890 Vinod Koul          2012-09-17  699  
> b21c60a4edd22e Vinod Koul          2011-12-23  700  		retval = snd_compr_allocate_buffer(stream, params);
> 9b02221422a55e Takashi Iwai        2024-02-22  701  		if (retval)
> 9b02221422a55e Takashi Iwai        2024-02-22  702  			return -ENOMEM;
> 4dc040a0b34890 Vinod Koul          2012-09-17  703  
> b21c60a4edd22e Vinod Koul          2011-12-23  704  		retval = stream->ops->set_params(stream, params);
> fbc74ca9fbf7e0 Peter Ujfalusi      2026-10-19  705  		if (retval) {
> fbc74ca9fbf7e0 Peter Ujfalusi      2026-10-19  706  			/* the stream stays OPEN: drop the buffer of the rejected setup */
> fbc74ca9fbf7e0 Peter Ujfalusi      2026-10-19  707  			if (stream->runtime->state == SNDRV_PCM_STATE_OPEN &&
> fbc74ca9fbf7e0 Peter Ujfalusi      2026-10-19  708  			    !stream->runtime->dma_buffer_p) {
> fbc74ca9fbf7e0 Peter Ujfalusi      2026-10-19  709  				kfree(stream->runtime->buffer);
> fbc74ca9fbf7e0 Peter Ujfalusi      2026-10-19  710  				stream->runtime->buffer = NULL;
> fbc74ca9fbf7e0 Peter Ujfalusi      2026-10-19  711  			}
> 9b02221422a55e Takashi Iwai        2024-02-22  712  			return retval;
> fbc74ca9fbf7e0 Peter Ujfalusi      2026-10-19  713  		}
> 49bb6402f1aa1e Charles Keepax      2013-04-18  714  
> 7ea9ee0064281e Srinivas Kandagatla 2023-06-19  715  		if (stream->next_track)
> 9b02221422a55e Takashi Iwai        2024-02-22 @716  			return retval;
> 
> This should either be "return -ESOMETHING;" or "return 0;".  The current
> code returns zero but in an obfuscated way.

the same form was present before fbc74ca9fbf7e0.
The intention was to return 0 here.

Ah, I see, 9b02221422a55e was a mechanical change to switch to
 *params __free(kfree) = NULL;

replacing a goto out with a return.

> 
> 7ea9ee0064281e Srinivas Kandagatla 2023-06-19  717  
> 9727b490e543de Jeeja KP            2013-02-14  718  		stream->metadata_set = false;
> 9727b490e543de Jeeja KP            2013-02-14  719  		stream->next_track = false;
> 
> This could be deleted because of the above check.
> 
> 49bb6402f1aa1e Charles Keepax      2013-04-18  720  
> 49bb6402f1aa1e Charles Keepax      2013-04-18  721  		stream->runtime->state = SNDRV_PCM_STATE_SETUP;
> 769fab2a41da4b Jesper Juhl         2012-01-23  722  	} else {
> b21c60a4edd22e Vinod Koul          2011-12-23  723  		return -EPERM;
> 769fab2a41da4b Jesper Juhl         2012-01-23  724  	}
> b21c60a4edd22e Vinod Koul          2011-12-23  725  	return retval;
> b21c60a4edd22e Vinod Koul          2011-12-23  726  }
> 
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

-- 
Péter

