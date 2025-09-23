Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E81B4327783
	for <oe-kbuild@lists.linux.dev>; Tue, 23 Sep 2025 13:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758633678; cv=none; b=If5Iwx1JUvMHkO5T9WqvBqAOO4b7HAuoVyYCVCGiKQz/ouHzwIiioBqkCoG764UTSqZp1Ds1J9rqNX/uqeSwVoR4Q3RBt8wP30+ILcmFcAyKJJUMXTCTUynAvYDjaP+48RBKKZ4Wj0Roi6HNbWgOGoBNQ+osy3BBgmtzN6A2zsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758633678; c=relaxed/simple;
	bh=dXWg8NZbxeqgTfi3QKLWa0aDwCBZM16LYIfqAnUGx7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jDkXZwOFezqkVu+oUUbjG9Pz+AGAia0TyxrXUVlFJYpaiZhnMIIqp97Z6k+2ufTVuaTp+L2yvdt9sh11U0F4MKBNnNeYdpRHmJFV1odtun3rJuN9dI7LGOyX5OAMgz0o6kSDh6KoNCieZ9p/83QDJCo4NRwOW/zwW5d13iRs6z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yavuxt9l; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yavuxt9l"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3ee1381b835so3705089f8f.1
        for <oe-kbuild@lists.linux.dev>; Tue, 23 Sep 2025 06:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758633675; x=1759238475; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3uejnRLMOfrdT1FWL+NhxB6zyQ3loDBWsODSNMkw3nM=;
        b=yavuxt9liP6PSYjPmdfNfGdzFDWobvi9RUJOSAujPYE07JUsCNkliAteSppygsBL9+
         +FXHE8ZLS/GELifos2oGyp2FcI1eSnxzPw3Oeb9jZi4/hgqvHzCtGlsd6en/qXQk1ur7
         Qm13wnq451rnxxDykw30jVGFFdMiXQN/51r3xX5Euh5VZx28Z5Cw/Xbj0ZOzmDK7Bb0V
         sn6IR1PFmS6i1jYQB/90kgNvd79ERW0uI5V+JDkq62SAMFaoCJzmn4wFVlC16JHY0z56
         rmx7fKrIKv/HsD/yMn5otedcr+BYuXelgqk0OvVju3NMfq4leAzzW/3OchWFXLhWf5uU
         257Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758633675; x=1759238475;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3uejnRLMOfrdT1FWL+NhxB6zyQ3loDBWsODSNMkw3nM=;
        b=O8N5QNhFuHkXaqBgbOOhMbnFfJtoVZKb8XvmQVeNfr8gmr6SbNYhjiPzNM8havchx9
         oShmIsGx610j3fWERJkhtdUzzzH0tEZSHAtCg9TuUis6xwiu5cpBuIuASHdszfGCHO28
         kK5w29WlSaPDLhLyp+zD27KufRtW5SxfflMROVxDKKvXpX3svzJzZ0yJCVsK7DJBXWFp
         qMcgC2KDY+C2yOC1LKmd8zPlL3y4iczxYNChhzhZ68f3CIyatZuJiffnoj3kr70Z2OoN
         q6gnRquU2RBc69+ssSygr+USXalOYYAgtGl2vri4ZtrvpQpfj65gtTqyvbEAEg4GCBOJ
         48MA==
X-Gm-Message-State: AOJu0YzgekE0zuNpDdEfPzWsvUPgR/D5g7yajFoHo8Tv3T8PwXmzwaHs
	eSv3s7W4OIwjz4k4D/Nunszh437qIcuQLDO57zvhs7MCXniMEwZz2wLsG3SEmkMJHpz70OT4oTM
	B+7fK
X-Gm-Gg: ASbGncuUYj7ntwsxJCbQJ3xQeeai48i16I5btBTvQgyW2myxzi8J6Q+TlI9vyF23oAx
	6GKUkZzlOJJ3WHltKR5TVBN/+2iVLmyzoiPJERHaUKzUc6ih4IchC8fbEgr0nTLfxAHOUG867AV
	0/czrc1fJEmGpR+a1X5ujGQk3dS1lZwzrN595S9lj0WoaN4r3IgK3HO5P6k294Tultbajr7VW2t
	JEej7SexdDhuzm1T2LxsEemrJiGQ2T4YYNrQB3WvVv+yFLgvMb7Pqt6ZXCWrdxwykNAWp7uJJvw
	1cArfChyV6+U9IkXE7NNkTpU5vLqmLEOIzA4tvezOULMuPvJa/mQTsdtqBUxC5jbS8ZxYeoXbbh
	ciaPs/s+6nXzOGEiz24/toU4IDlVx
X-Google-Smtp-Source: AGHT+IHiX2BgUBm2rJ2aqbF0aIhsrb2f+1p7dWEqMl6vcHt0V0eu9Osdk1d0gQsd6SmGBekapua7XQ==
X-Received: by 2002:a05:6000:4106:b0:407:7a7:1ca0 with SMTP id ffacd0b85a97d-40707b667bbmr1486847f8f.14.1758633674916;
        Tue, 23 Sep 2025 06:21:14 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3ee0fbc7107sm25115247f8f.30.2025.09.23.06.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 06:21:14 -0700 (PDT)
Date: Tue, 23 Sep 2025 16:21:10 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, cros-kernel-buildreports@googlegroups.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 2/2]
 drivers/gpu/drm/ttm/ttm_resource.c:440 ttm_resource_manager_evict_all()
 error: uninitialized symbol 'ret'.
Message-ID: <202509232037.ZFgTcAPJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Message-ID: <20250923132110.lByprud19ERz3gB4zM72QNdl-CwvMuEefmFkXTt8VvA@z>

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   f8638596656f07c98ff01f23703519c247d3f54d
commit: ba382e06a5d7987496cab78859d0f81a4428687d [2/2] drm/ttm: Should to return the evict error
config: i386-randconfig-141-20250923 (https://download.01.org/0day-ci/archive/20250923/202509232037.ZFgTcAPJ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202509232037.ZFgTcAPJ-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/ttm/ttm_resource.c:440 ttm_resource_manager_evict_all() error: uninitialized symbol 'ret'.

vim +/ret +440 drivers/gpu/drm/ttm/ttm_resource.c

8af8a109b34fa8 Christian König 2020-10-01  411  int ttm_resource_manager_evict_all(struct ttm_device *bdev,
b2458726b38cb6 Christian König 2020-08-03  412  				   struct ttm_resource_manager *man)
b2458726b38cb6 Christian König 2020-08-03  413  {
b2458726b38cb6 Christian König 2020-08-03  414  	struct ttm_operation_ctx ctx = {
b2458726b38cb6 Christian König 2020-08-03  415  		.interruptible = false,
b2458726b38cb6 Christian König 2020-08-03  416  		.no_wait_gpu = false,
c44dfe4de05391 Christian König 2020-11-02  417  		.force_alloc = true
b2458726b38cb6 Christian König 2020-08-03  418  	};
b2458726b38cb6 Christian König 2020-08-03  419  	struct dma_fence *fence;
b2458726b38cb6 Christian König 2020-08-03  420  	int ret;
b2458726b38cb6 Christian König 2020-08-03  421  	unsigned i;
b2458726b38cb6 Christian König 2020-08-03  422  
b2458726b38cb6 Christian König 2020-08-03  423  	/*
b2458726b38cb6 Christian König 2020-08-03  424  	 * Can't use standard list traversal since we're unlocking.
b2458726b38cb6 Christian König 2020-08-03  425  	 */
b2458726b38cb6 Christian König 2020-08-03  426  
a1f091f8ef2b68 Christian König 2020-10-06  427  	spin_lock(&bdev->lru_lock);
b2458726b38cb6 Christian König 2020-08-03  428  	for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i) {
b2458726b38cb6 Christian König 2020-08-03  429  		while (!list_empty(&man->lru[i])) {
a1f091f8ef2b68 Christian König 2020-10-06  430  			spin_unlock(&bdev->lru_lock);

What about if the list is empty?

b2458726b38cb6 Christian König 2020-08-03  431  			ret = ttm_mem_evict_first(bdev, man, NULL, &ctx,
b2458726b38cb6 Christian König 2020-08-03  432  						  NULL);
b2458726b38cb6 Christian König 2020-08-03  433  			if (ret)
b2458726b38cb6 Christian König 2020-08-03  434  				return ret;
a1f091f8ef2b68 Christian König 2020-10-06  435  			spin_lock(&bdev->lru_lock);
b2458726b38cb6 Christian König 2020-08-03  436  		}
b2458726b38cb6 Christian König 2020-08-03  437  	}
a1f091f8ef2b68 Christian König 2020-10-06  438  	spin_unlock(&bdev->lru_lock);
b2458726b38cb6 Christian König 2020-08-03  439  
ba382e06a5d798 Emily Deng      2025-06-03 @440  	if (ret && ret != -ENOENT)

This is dead code.  ret is either zero or uninitialized at this point.

ba382e06a5d798 Emily Deng      2025-06-03  441  		return ret;
ba382e06a5d798 Emily Deng      2025-06-03  442  
b2458726b38cb6 Christian König 2020-08-03  443  	spin_lock(&man->move_lock);
b2458726b38cb6 Christian König 2020-08-03  444  	fence = dma_fence_get(man->move);
b2458726b38cb6 Christian König 2020-08-03  445  	spin_unlock(&man->move_lock);
b2458726b38cb6 Christian König 2020-08-03  446  
b2458726b38cb6 Christian König 2020-08-03  447  	if (fence) {
b2458726b38cb6 Christian König 2020-08-03  448  		ret = dma_fence_wait(fence, false);
b2458726b38cb6 Christian König 2020-08-03  449  		dma_fence_put(fence);
b2458726b38cb6 Christian König 2020-08-03  450  		if (ret)
b2458726b38cb6 Christian König 2020-08-03  451  			return ret;
b2458726b38cb6 Christian König 2020-08-03  452  	}
b2458726b38cb6 Christian König 2020-08-03  453  
b2458726b38cb6 Christian König 2020-08-03  454  	return 0;
b2458726b38cb6 Christian König 2020-08-03  455  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

