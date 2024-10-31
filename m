Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A5C1C9EC6
	for <oe-kbuild@lists.linux.dev>; Thu, 31 Oct 2024 20:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730405705; cv=none; b=cZ2URgnnRahf+GLZJmwwrdw9CNgmMwJ/oKBmRaRcn7Z9LS6Zp3VKc48MVDUNExIEFKMlss2vuvTZRzJzZnUv5QacdBjpV99zwE8nAYtf1aEK3qCYYTuMFtZOIhfOYOHycNpGJxvTob4N9yaEx1GJrH0d882v6AdyO126UZUnzVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730405705; c=relaxed/simple;
	bh=F1PXddJIyO5h0PSkrxMPB6bJl9U50pncdKZ9TRVqScQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nDie2si1zN+IgxgzAEtRK4g6vaURSzBBwkOCCvuFV2E4YetkJHPOLeCJEhlL/gilV5L1NzFP4DeMQAdAbiB4b4lkwwX53WECQQwT4s9HOv6hSGYWn1qeCsSoRErDAACSu0OPSsxFV4sW43/hPj55XNB7Hc9A5i0X/zEDio/JIJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xhg6Cyfj; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xhg6Cyfj"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-37d473c4bb6so1038585f8f.3
        for <oe-kbuild@lists.linux.dev>; Thu, 31 Oct 2024 13:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730405702; x=1731010502; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IrludKBBDIBzNRS8PzIYG2KuwgL5KcmDs8aNBJDfVxM=;
        b=xhg6CyfjqFUGm0C6VPHKyHQAe+j/sD4v2FcLKJDn0aZ3d0T+OA8y7z+fOGhO3ycaaW
         Q7VU5IggNiOg7UBMx8Jcy0tjgk932GsmCGUK4oE3Gk3swGvknPW/B9Iv+Z14ZAKEtNuS
         8TlcWDEh60111B3jTFKrQlAuW/1HMu6BQkPSgKWt0CNzADaIhkReQ443CkszajxN95ZP
         N/MJk4rSh3LL+qhnYMcafm8fWyT8jiwBvRzbY3E/qwUAuA334VOJga4DIVEaatAN+uVN
         /n17k3CLrQTb3pgZ8zndLuv1oEuJN9ww2E7hKI8FDv4nas5jtvH9SH2hCUayh+ERmWLU
         RktA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730405702; x=1731010502;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IrludKBBDIBzNRS8PzIYG2KuwgL5KcmDs8aNBJDfVxM=;
        b=fF2K2x1Zl3Lloc6KgaFoPrBWGibCF/XL5eHQcfygfpb19CjKn2ZTKVmipX5qoDE44t
         0Dy+NrOhNKkQ3JfaWrAYIT3gmoH7EmlDEEFPKVlTNktgIeLztO9CLjGqMw+/HF1WI2q3
         P30TqMuUDtAOiP1Syy6siAxOcOW6OzafZn8D/IN03Bx/S8ulECgqoDxQ1z581hARhLur
         VXXiKIYi2or1Z2fJkDl9+011TFwDOGLg0gt/3B/jT7LFuKNdjc5iF3krlzhnIkoObCq8
         X1jByjbB+EHiuX7Qhif4e6XIlkkroBI+7+1ya/0V2yqMgmoaxJFgrmBea2FsHkQOZRIB
         XXsA==
X-Gm-Message-State: AOJu0YxvhRWLoFUtYzl/CH/13w7osvUnhbqxXz7GGWK4HsgRo9/z9/nN
	SJkaiAaXabXEnAElu0jLdmTDKyN9N2FzFd5gjvUoaRDW+8EpVtjTrZgSCy3g8A4GV3EWEhSSVAP
	0
X-Google-Smtp-Source: AGHT+IGOYG5R83od9ifwFQcrF3qBEgFnACBjU/IjigZnNl6SG03NC9aar2K7mHgmVAKLHOGvdTR+sA==
X-Received: by 2002:a05:6000:1866:b0:37d:95a7:9e57 with SMTP id ffacd0b85a97d-381c7a469c3mr1223628f8f.2.1730405701457;
        Thu, 31 Oct 2024 13:15:01 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4327d5e7c9asm39408905e9.21.2024.10.31.13.15.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 13:15:01 -0700 (PDT)
Date: Thu, 31 Oct 2024 23:14:57 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, cros-kernel-buildreports@googlegroups.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-kiwi-5.4 779/30000] drivers/md/dm.c:2295
 dm_keyslot_evict() warn: inconsistent returns '&md->io_barrier'.
Message-ID: <20e3f66a-fd3f-47cf-95e1-8e54c9e32a5c@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-kiwi-5.4
head:   6a622c20579dfeb7db056fc9b624d4abb73c8081
commit: 695cfeb08863e147e56b4895443440692cfcebff [779/30000] ANDROID: dm: add support for passing through inline crypto support
config: x86_64-randconfig-161-20241029 (https://download.01.org/0day-ci/archive/20241101/202411010347.BzF0LDj0-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202411010347.BzF0LDj0-lkp@intel.com/

New smatch warnings:
drivers/md/dm.c:2295 dm_keyslot_evict() warn: inconsistent returns '&md->io_barrier'.

Old smatch warnings:
drivers/md/dm.c:1152 dm_dax_supported() warn: inconsistent returns '&md->io_barrier'.

vim +2295 drivers/md/dm.c

695cfeb08863e1 Eric Biggers 2020-01-21  2275  static int dm_keyslot_evict(struct keyslot_manager *ksm,
695cfeb08863e1 Eric Biggers 2020-01-21  2276  			    const struct blk_crypto_key *key, unsigned int slot)
695cfeb08863e1 Eric Biggers 2020-01-21  2277  {
695cfeb08863e1 Eric Biggers 2020-01-21  2278  	struct mapped_device *md = keyslot_manager_private(ksm);
695cfeb08863e1 Eric Biggers 2020-01-21  2279  	struct dm_keyslot_evict_args args = { key };
695cfeb08863e1 Eric Biggers 2020-01-21  2280  	struct dm_table *t;
695cfeb08863e1 Eric Biggers 2020-01-21  2281  	int srcu_idx;
695cfeb08863e1 Eric Biggers 2020-01-21  2282  	int i;
695cfeb08863e1 Eric Biggers 2020-01-21  2283  	struct dm_target *ti;
695cfeb08863e1 Eric Biggers 2020-01-21  2284  
695cfeb08863e1 Eric Biggers 2020-01-21  2285  	t = dm_get_live_table(md, &srcu_idx);
695cfeb08863e1 Eric Biggers 2020-01-21  2286  	if (!t)
695cfeb08863e1 Eric Biggers 2020-01-21  2287  		return 0;

We must call dm_put_live_table() even if dm_get_live_table() returns NULL.

695cfeb08863e1 Eric Biggers 2020-01-21  2288  	for (i = 0; i < dm_table_get_num_targets(t); i++) {
695cfeb08863e1 Eric Biggers 2020-01-21  2289  		ti = dm_table_get_target(t, i);
695cfeb08863e1 Eric Biggers 2020-01-21  2290  		if (!ti->type->iterate_devices)
695cfeb08863e1 Eric Biggers 2020-01-21  2291  			continue;
695cfeb08863e1 Eric Biggers 2020-01-21  2292  		ti->type->iterate_devices(ti, dm_keyslot_evict_callback, &args);
695cfeb08863e1 Eric Biggers 2020-01-21  2293  	}
695cfeb08863e1 Eric Biggers 2020-01-21  2294  	dm_put_live_table(md, srcu_idx);
695cfeb08863e1 Eric Biggers 2020-01-21 @2295  	return args.err;
695cfeb08863e1 Eric Biggers 2020-01-21  2296  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

