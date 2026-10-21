Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792562093;
	b=1vRu9gjmZJQtz1souGWqb4wU/Q62a7uw03oVgWjl/zLy3WzA4Vo+3UMvZcb1q+jGzIoR
	 MSzjKBxM/8VeYbjwEo7pC1kpvD3IX1PuQm2uTwYtsUeyLEYz1bpOHcZOeM+0pXNTXQLUE
	 MDmlCOKxWyZUpcFcdCqwDon3oSQ6fMaJdl6p+FEqiXUDI3LRmCR7KtDrrY8jIuP+MsbtP
	 sDPgoqAmBOSyec0UHI7vaktr1GvPDiLrZJeWfi6MXLVTSs8Eg/fB9KOAKZ+I0E4yb2c9c
	 LkBqb7x9oSaIRBcoPD42EzcfJra+ybGgL2JY6eZDVMTCfBQLpN2/Q24hjl5OmobiDAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792562093;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=8Hu2GpYwKr6r5nRoavxB97ryG1ZJTfUyaAPfaDpbWQ0=;
	b=sGbBLYyhkDTh9dWy/RYVStN/2GAId32oL5VqCsQuCVvD62am+M49GY24KUNrm4avBOKa
	 45iISiiO1ayapBrak6mrKSfFP2DV5kcJy/BhH/inOUBI1+tk7x0/j5t/ha3s9CTEN89Nm
	 5AQM6Vx6YkeoH9ARyUykukb1BlKpupRA/djxR/FkySvYBFvc+0HqCxK1JicGPvOt5702i
	 pOpRVt9eY1ogGR+qKArSMtiygaJNdeEt4JXIKxToYkmf7vumaP4iUvF4tABJyCuz5YLem
	 1maoWQLkzMY8ntjQf9w+npjrRZAxJ6jjEOH4omCIHotRBcdBbBPGcYEsMNrqZj/YHcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HFkAhDUp;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13D0606A31F
	for <oe-kbuild@lists.linux.dev>; Wed, 21 Oct 2026 05:54:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A13D0606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HFkAhDUp
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a1dec056ddso1717245e9.1
        for <oe-kbuild@lists.linux.dev>; Tue, 20 Oct 2026 22:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792562091; x=1793166891; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8Hu2GpYwKr6r5nRoavxB97ryG1ZJTfUyaAPfaDpbWQ0=;
        b=HFkAhDUpTwCEXrTXeGFzhhBUrmQca6WJBtYNVSoFRbtO4JrLXVCe6/geNx+pZXouqw
         OBckm4feEAVqceD6oJWRBR2QdwnhhVKAlSZF+fgGKClIj4ecmfu73FV9h9M+Ke0RLdKU
         irLaeJ37nzhu7vpV7Q1rshnI+z7rAgDO4/i4kD+VDJTsUJxIKEBp8rquNHlgVBepvY3A
         aGZxp6ID89g1QTALBuNcyI6tbZvDJ8HpAaXM6Onm2Ah7gJndmCTaULWKbJYNgOHL/2Bq
         jwO634r6Axz0h0T5MdEaanx0MqOS7jXYqKKqWMcRCebw+/Ye4gQxisSXrfSggUi5vGip
         34Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792562091; x=1793166891;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Hu2GpYwKr6r5nRoavxB97ryG1ZJTfUyaAPfaDpbWQ0=;
        b=UAD9hEO5W0OXN1ixLDZSs0kIi60Jey9Ou+TVuQBVeJwFEIuQfgRCoKCwbPsyCdY1Ef
         cDtog6ZS++5etDJ2BkaDreMZyouV8uRPIOeKdHzYrq7qNCUHlhyTYFx6T8khDRnyTDVE
         SizplIgXedfIDThYbptlYw8/cs2pqpWlG6XYNN6h8EomH3jT+2mBJLgbfsqt41RTLgs8
         9vZE5FTtnz0bWrPcE2d/evFAdfCEvinS+QvUNWm4YwSkIPVaO6jzV6rFv0ygrkGWvKLn
         96F/Vn6Z/fYatHHMk8pmygk+Z8JEgLhywSB5F+HRvvtxQby+3rFzxyJKuWcbMx4RUkBn
         4Hsg==
X-Gm-Message-State: AFq9FYJYm8zc6DTZWHPJh/yJWTwbsf3vhi78lhlGKCkQs31uLCYhGm5j
	CDhkMYwSSweF3JqpzD6yrSddrWbbleRunaIFkW5ME+EdaHZwU+zqXLgO1AwBPamRgU7juecF
X-Gm-Gg: AYBFou2DA4PZi/ciTkzDTB5vmPWiqyk3bOA5SefNd7Ml2FVn8ikfVW7f0WBnNRaZieP
	0MwjSvTy2OP5gdO5Xl+IyKwMAOCsEuwg9ilksiUAoyNuRs4aF/IXhskeasCP+KoBfSWDsjZYk57
	kWLvOaMMnUi7QObXXNn+O4L05sROMe2imnBwOwEfDkDsIZTnn/Y1pXagnL8tiAQBx/E6R5yzw7m
	m+QlXQ7f76O/YVHQAAGk5hgaxAZ2s3RR4HDwFgP3tsZaAkUygH/9S1NK52Qp1WpS1LX6bJn2AbZ
	XXMf5wMAkPWX2a/5gM9YEO6qI+mdB+ND34+7lDVAEOu+Cv7Hel1SVGDFHaawCq3hRRA+tps4Klr
	x9Co8rvymUGmDpYmmJrRwwLbTGnGxOQVsJ3KwJQJe19cLA+2Ufo3LQZC4Z/7cNuFoilqbT43sNr
	AfIsZOn7+oT2P2hXQLlq51WL/up2pOq6rpDy8KqhME2B3pBotnkbIgjsNYzU7+rEFxkPelZaZpG
	wZkzN+aWjN83meUep+MXkrpxyrpZ/oYQBmAmleWAfir0CN5wm0v
X-Received: by 2002:a05:600c:3d92:b0:4a1:e5ad:33b0 with SMTP id 5b1f17b1804b1-4a1fdaf75a5mr17000245e9.8.1792562090837;
        Tue, 20 Oct 2026 22:54:50 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fc1066cfsm32594205e9.1.2026.10.20.22.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 22:54:50 -0700 (PDT)
Date: Wed, 21 Oct 2026 08:54:46 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Takashi Iwai <tiwai@suse.de>
Subject: [linux-next:master 18830/19064] sound/core/compress_offload.c:716
 snd_compr_set_params() warn: missing error code? 'retval'
Message-ID: <202610202334.hwrqtbb4-lkp@intel.com>
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20261021055446.czEg0tJscrHvflC0mzus3ZGqS_H4jKTK9rXADqB6eNo@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8f7df005a7564bd7ffa75da9c3085d5b996f1e16
commit: fbc74ca9fbf7e0b8f6872ccac62f9f4a1f3b5e53 [18830/19064] ALSA: compress: fix buffer leak on failed SET_PARAMS
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

This should either be "return -ESOMETHING;" or "return 0;".  The current
code returns zero but in an obfuscated way.

7ea9ee0064281e Srinivas Kandagatla 2023-06-19  717  
9727b490e543de Jeeja KP            2013-02-14  718  		stream->metadata_set = false;
9727b490e543de Jeeja KP            2013-02-14  719  		stream->next_track = false;

This could be deleted because of the above check.

49bb6402f1aa1e Charles Keepax      2013-04-18  720  
49bb6402f1aa1e Charles Keepax      2013-04-18  721  		stream->runtime->state = SNDRV_PCM_STATE_SETUP;
769fab2a41da4b Jesper Juhl         2012-01-23  722  	} else {
b21c60a4edd22e Vinod Koul          2011-12-23  723  		return -EPERM;
769fab2a41da4b Jesper Juhl         2012-01-23  724  	}
b21c60a4edd22e Vinod Koul          2011-12-23  725  	return retval;
b21c60a4edd22e Vinod Koul          2011-12-23  726  }

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

