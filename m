Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A0815687D
	for <oe-kbuild@lists.linux.dev>; Sun, 18 Jan 2026 12:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768738786; cv=none; b=bYTQEpBc5Ppy36iD19WsjFpN3DJiCyEoE++upz2oHvXsxAkjIuXjfTLfXjr/XqVqp4/thUQZ9VfQKtQYEZXha/dpY7HG+6thLMO2d/U/51m/j64hl8hHWCmgwbSQmmf66bIDZ+rbDLHlXvqG6DVFz52mUZ+VS8FHdNM92mDnYmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768738786; c=relaxed/simple;
	bh=yKm86xc59L8rWXSGE7GuuKfrBrGlY5HVhIRTxxd/NSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hyyipXV1FGvtSpY7vUVkl+KIuty75JvOhcR0DVOLxsMJ5OfTalOscd4xXOgQsvEr4kq/8n8/EpXSfD2Bh6IoGbRwPhg7JiJw5HYQAlywfJMBVezv4YVGiO/fl+YxN812rmkRh1MIP5sTpcebi2oS6qE16PlLGK9oj9awR56S0LU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wye8Iosa; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wye8Iosa"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43246af170aso1909445f8f.0
        for <oe-kbuild@lists.linux.dev>; Sun, 18 Jan 2026 04:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768738782; x=1769343582; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lkoju9Swt6eeI9dWtzme/fPtYzDmyPT2GeuFpxC4il4=;
        b=wye8Iosa15n6pon/kYz66vKNWI0rEU7EsdwYG+a4zLiSGZleLkyjemRgUMW75uYwZd
         5K28UzF0/AU0DcXOhboBLdH1msczfMqtHi+MhRaQmwJ3sTR9KK9NcjxaZ/gBS4O1S/FT
         4PqQkOnbhWQ5KTJsdvFlYSdBiypE860io5vXYMI7yNpl4JJqrCEX2auqyCr73h7H+r/O
         m7r4I+lqg+EA+0FuT1kRtOMc4Z6vAYMCehXGoHHmqnrkwWPwAfJ8eV7l49WeCv6Xv3/j
         0j8KdtEKbS0DWwdEl+JZfCI0sHSbta7DhtGV0fU0I/PRVgNvUaLQpgpk5xW06Wb86JGv
         EhOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768738782; x=1769343582;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lkoju9Swt6eeI9dWtzme/fPtYzDmyPT2GeuFpxC4il4=;
        b=ghhwcH/Y7ft9+zePaDK9k2Dlu6pmq4GLkKzDjNza4HOIdEqYptSCHwO/T44phLSHJO
         TA83s32+SKSd226fL4LFiy0DAL1c7Yk6BIdqhLr4iJvy3FXNf6rXkmh5YkJQsa5lEvik
         YQI5LrgLucefFeXqnlZljhEZ/Uqsyy7VHsZQqCY5hNZ5ovfcj7lEl2tOy33A6OyOONg1
         wTWVPaq5MlJWmJhBUyf8XTQjTVzY0X96TGPaoyBtKtnBOSagh6VbGke3hNxw4heHEDk6
         njzrCtl0Vn4/iq9JSVvs3ltnJiNXJlaZjHkHInphkLAeHKoRZEzwVbp0+2bHJP12aQjg
         RoVQ==
X-Gm-Message-State: AOJu0YxjCwsC0xpNrsXu2yJaWFfgJbLOlIshFURIYLpI8kdZzXDX67u1
	XbAJOP4Yc4YlYfH+E6nM7sz6b/rR5aXDT3zg7oyyWZ9EmaNBJIEmWy5Cz9PORueaC1oUywy9zy/
	L4dYm
X-Gm-Gg: AY/fxX66huj8nZWf9E7aA9qe4cFQHVcvG2GRTbAcWUie2fVdXh19uR4gg8hNnU8p2vZ
	KWqoNXivrDdePqHzgGwV1P+Dv4+1j64rJUMYXo/qPR8DBa8tH/L0M6LkXm5EvRoeMYiIRxLf9Rh
	OEzr/kR1mi5lD7nXHxavbuq/H+ZA31GNvKXWENKUoICYfYXyZRpkjFyWrKNzuQdVH6XTER4um3N
	ojyRanlyMQ0/eol3i8vdQ9SvfwUElRASX8T7At/8myY11OnrXaStQviwlRiDuzX+gnr1Vugr4Ix
	EsiCoIS+zZmH11l9RhLlT/Xc6BYAh3EijzP2EKLwxEkkwzDduQiVvkLFp6CVb9fXHcpMzMVaqWq
	ZSkxYCV0pfQJOP8J115zH8pcPfrRwhHsWW360SRKIdIyrqpSrYC3Eg5W4Vu8TeFnBoaAkUwkuDZ
	n+did8bTyUl6joQ/AM
X-Received: by 2002:a05:6000:2c01:b0:432:86de:f396 with SMTP id ffacd0b85a97d-435695780admr9574503f8f.26.1768738781758;
        Sun, 18 Jan 2026 04:19:41 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569926648sm17199398f8f.10.2026.01.18.04.19.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 04:19:41 -0800 (PST)
Date: Sun, 18 Jan 2026 15:19:38 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, cros-kernel-buildreports@googlegroups.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 4/4]
 drivers/gpu/drm/ttm/ttm_resource.c:440 ttm_resource_manager_evict_all()
 error: uninitialized symbol 'ret'.
Message-ID: <202601162042.mrCEt4Ms-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Message-ID: <20260118121938.0h1SPB_kbW0-XZvwZ1agsmYI3RrTPDdzbN14DG8sf68@z>

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   a58a97026588e9128868c7778ca1ffacbb53c931
commit: 3c9ca275100e4fae48ab5206021b3ec82cf37b04 [4/4] drm/ttm: Should to return the evict error
config: i386-randconfig-141-20260116 (https://download.01.org/0day-ci/archive/20260116/202601162042.mrCEt4Ms-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202601162042.mrCEt4Ms-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/ttm/ttm_resource.c:440 ttm_resource_manager_evict_all() error: uninitialized symbol 'ret'.

vim +/ret +440 drivers/gpu/drm/ttm/ttm_resource.c

8af8a109b34fa88 Christian König 2020-10-01  411  int ttm_resource_manager_evict_all(struct ttm_device *bdev,
b2458726b38cb69 Christian König 2020-08-03  412  				   struct ttm_resource_manager *man)
b2458726b38cb69 Christian König 2020-08-03  413  {
b2458726b38cb69 Christian König 2020-08-03  414  	struct ttm_operation_ctx ctx = {
b2458726b38cb69 Christian König 2020-08-03  415  		.interruptible = false,
b2458726b38cb69 Christian König 2020-08-03  416  		.no_wait_gpu = false,
c44dfe4de053914 Christian König 2020-11-02  417  		.force_alloc = true
b2458726b38cb69 Christian König 2020-08-03  418  	};
b2458726b38cb69 Christian König 2020-08-03  419  	struct dma_fence *fence;
b2458726b38cb69 Christian König 2020-08-03  420  	int ret;
b2458726b38cb69 Christian König 2020-08-03  421  	unsigned i;
b2458726b38cb69 Christian König 2020-08-03  422  
b2458726b38cb69 Christian König 2020-08-03  423  	/*
b2458726b38cb69 Christian König 2020-08-03  424  	 * Can't use standard list traversal since we're unlocking.
b2458726b38cb69 Christian König 2020-08-03  425  	 */
b2458726b38cb69 Christian König 2020-08-03  426  
a1f091f8ef2b680 Christian König 2020-10-06  427  	spin_lock(&bdev->lru_lock);
b2458726b38cb69 Christian König 2020-08-03  428  	for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i) {
b2458726b38cb69 Christian König 2020-08-03  429  		while (!list_empty(&man->lru[i])) {

Can the list be empty at the start?

a1f091f8ef2b680 Christian König 2020-10-06  430  			spin_unlock(&bdev->lru_lock);
b2458726b38cb69 Christian König 2020-08-03  431  			ret = ttm_mem_evict_first(bdev, man, NULL, &ctx,
b2458726b38cb69 Christian König 2020-08-03  432  						  NULL);
b2458726b38cb69 Christian König 2020-08-03  433  			if (ret)
b2458726b38cb69 Christian König 2020-08-03  434  				return ret;
a1f091f8ef2b680 Christian König 2020-10-06  435  			spin_lock(&bdev->lru_lock);
b2458726b38cb69 Christian König 2020-08-03  436  		}
b2458726b38cb69 Christian König 2020-08-03  437  	}
a1f091f8ef2b680 Christian König 2020-10-06  438  	spin_unlock(&bdev->lru_lock);
b2458726b38cb69 Christian König 2020-08-03  439  
3c9ca275100e4fa Emily Deng      2025-06-03 @440  	if (ret && ret != -ENOENT)


This check makes no sense.  ret is either zero or uninitialized.

3c9ca275100e4fa Emily Deng      2025-06-03  441  		return ret;
3c9ca275100e4fa Emily Deng      2025-06-03  442  
b2458726b38cb69 Christian König 2020-08-03  443  	spin_lock(&man->move_lock);
b2458726b38cb69 Christian König 2020-08-03  444  	fence = dma_fence_get(man->move);
b2458726b38cb69 Christian König 2020-08-03  445  	spin_unlock(&man->move_lock);
b2458726b38cb69 Christian König 2020-08-03  446  
b2458726b38cb69 Christian König 2020-08-03  447  	if (fence) {
b2458726b38cb69 Christian König 2020-08-03  448  		ret = dma_fence_wait(fence, false);
b2458726b38cb69 Christian König 2020-08-03  449  		dma_fence_put(fence);
b2458726b38cb69 Christian König 2020-08-03  450  		if (ret)
b2458726b38cb69 Christian König 2020-08-03  451  			return ret;
b2458726b38cb69 Christian König 2020-08-03  452  	}
b2458726b38cb69 Christian König 2020-08-03  453  
b2458726b38cb69 Christian König 2020-08-03  454  	return 0;
b2458726b38cb69 Christian König 2020-08-03  455  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

