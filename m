Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6820914F9F8
	for <oe-kbuild@lists.linux.dev>; Fri,  1 Nov 2024 07:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730444952; cv=none; b=KEqTdFGv8pC1Isr0eDtoss3S/I+czlC/wVIf0ipKATns6LBPjFQ/GOTUQhUGQFsNG+bULfSF8HVWr0uaQ24d/qdG0uXEvyFj3fhwhLr4pl9jQXMxzBnNxavB6jd1KdS/h+0PJ/GU6gZrZqJXbJagAQ0XN0njZQcnpXSaEPE/EhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730444952; c=relaxed/simple;
	bh=LzEGpNux/05B+exzCPwOwfWvauy4dLOt6GP8659hYpU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FaLry5kw8Z21VIiQBvSFqWGyJwj1wP/9+FLnIHGfbJFM/XMVUUlD+DLNVBG3VzGOgatVtoarYL6bnfH2jF0OxV/Jegnq8VgMMbuLd3qmufoxeBOK2AgITSCsgXzVSYJjkUgWsqtHzpmuhUGZ+Dz+f6eE1NA2wqzMDikuUwHzEAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YIU9rBqe; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YIU9rBqe"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-539d9fffea1so1760255e87.2
        for <oe-kbuild@lists.linux.dev>; Fri, 01 Nov 2024 00:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730444948; x=1731049748; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OdMhRimid/Fu9WULkrHC/yLOiFjb3Jtc8ZoNVQ9lnYI=;
        b=YIU9rBqetAbc4TkszOETZoZ8moSS+RfT8f5fyaszyteWUXh5TyH1VXLNFtb7WfS8Y4
         h8vMe+hcJp2RcsS7bgMa2Pmb2yfWajJSjRrFjO4JuRjIjmrxYxgOGocRBT7Ght4zfCAp
         mXSajsp9I0eHu7Gp88zjzlE0Y8H1rk4YtvHE3Ge5NmVwwrrxf68AXZmtsXp4nerumVQX
         Ve75o6KsB/XT1gL2b4UiB784xYufDnHiQ/+0aDcwDI/X1SbR3Ht/R2nm+kHSIWLNYIVS
         n/YA3CBe9GIzpS0zHaFvLhYXTe0MFyBMteqiBO0cAgaFg2gp0XMhQ83tem/MCXevv+/A
         ly3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730444948; x=1731049748;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OdMhRimid/Fu9WULkrHC/yLOiFjb3Jtc8ZoNVQ9lnYI=;
        b=nUCTb4wiEy/lTIsQjama0E3fP6qdgTNwE11DHfZCk7r2cFMawrk7aFj3mwn9fxm9yA
         18zGcwGUNf1OnLPYOOJfD2EuZKz9NADfptl2PfIOjHdgUWBXztNK3ITel6JoHxT9hZw8
         kY/bUagZpGp+GtAsa9MPSDScuKud0fFPhMFsmSrSWYUGbZ7e0r5oQeFYqZ4Bz4SAnlnV
         S0kTuxqOXe24IQgfqBEbtNOQpAwKCtFYsTnUEnctz3H3Wj1b/uQR6nP/lYEQt06pfIzs
         NEnd2NLF2zPzszuqzI5M/0O+a0ORHPmzDGP7wySvcar6+eOF4ikp3TyF5dYHUq72FRbe
         +1GA==
X-Gm-Message-State: AOJu0Ywe83ZIBYh7uNf1pAaZlz1hGiy/Z5w7r9Es9bHgSTbC/jhtIluv
	5VSl+QkCc+wwvlbI3YW1A696KqTiQ+5NZ4vSmy7z9CjIXTJ3jAO5FXylj8UM4/eA2lFz16cFCL3
	c
X-Google-Smtp-Source: AGHT+IHESQNf/OJIWD4awWoO/xbiFtxV6PLI8/pRkzbUD8L0DIQUfnJgpPClh7sHm1KB1dlLDKcPbQ==
X-Received: by 2002:a05:6512:3f0c:b0:53b:1369:fcf8 with SMTP id 2adb3069b0e04-53b348f96e8mr11644316e87.15.1730444948191;
        Fri, 01 Nov 2024 00:09:08 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd9479ebsm79285905e9.23.2024.11.01.00.09.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 00:09:07 -0700 (PDT)
Date: Fri, 1 Nov 2024 10:09:04 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, cros-kernel-buildreports@googlegroups.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-kiwi-5.4 2240/30000] drivers/md/dm.c:2371
 dm_derive_raw_secret() warn: inconsistent returns '&md->io_barrier'.
Message-ID: <dd5515a0-6aa8-4f61-bd18-97cb845b9649@stanley.mountain>
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
commit: a1423568e2aecd27a202e7053945905dddcc6045 [2240/30000] ANDROID: dm: add support for passing through derive_raw_secret
config: x86_64-randconfig-161-20241029 (https://download.01.org/0day-ci/archive/20241101/202411010811.geBuwIcp-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202411010811.geBuwIcp-lkp@intel.com/

New smatch warnings:
drivers/md/dm.c:2371 dm_derive_raw_secret() warn: inconsistent returns '&md->io_barrier'.

Old smatch warnings:
drivers/md/dm.c:1152 dm_dax_supported() warn: inconsistent returns '&md->io_barrier'.
drivers/md/dm.c:2301 dm_keyslot_evict() warn: inconsistent returns '&md->io_barrier'.

vim +2371 drivers/md/dm.c

a1423568e2aecd Barani Muthukumaran 2020-02-06  2340  static int dm_derive_raw_secret(struct keyslot_manager *ksm,
a1423568e2aecd Barani Muthukumaran 2020-02-06  2341  				const u8 *wrapped_key,
a1423568e2aecd Barani Muthukumaran 2020-02-06  2342  				unsigned int wrapped_key_size,
a1423568e2aecd Barani Muthukumaran 2020-02-06  2343  				u8 *secret, unsigned int secret_size)
a1423568e2aecd Barani Muthukumaran 2020-02-06  2344  {
a1423568e2aecd Barani Muthukumaran 2020-02-06  2345  	struct mapped_device *md = keyslot_manager_private(ksm);
a1423568e2aecd Barani Muthukumaran 2020-02-06  2346  	struct dm_derive_raw_secret_args args = {
a1423568e2aecd Barani Muthukumaran 2020-02-06  2347  		.wrapped_key = wrapped_key,
a1423568e2aecd Barani Muthukumaran 2020-02-06  2348  		.wrapped_key_size = wrapped_key_size,
a1423568e2aecd Barani Muthukumaran 2020-02-06  2349  		.secret = secret,
a1423568e2aecd Barani Muthukumaran 2020-02-06  2350  		.secret_size = secret_size,
a1423568e2aecd Barani Muthukumaran 2020-02-06  2351  		.err = -EOPNOTSUPP,
a1423568e2aecd Barani Muthukumaran 2020-02-06  2352  	};
a1423568e2aecd Barani Muthukumaran 2020-02-06  2353  	struct dm_table *t;
a1423568e2aecd Barani Muthukumaran 2020-02-06  2354  	int srcu_idx;
a1423568e2aecd Barani Muthukumaran 2020-02-06  2355  	int i;
a1423568e2aecd Barani Muthukumaran 2020-02-06  2356  	struct dm_target *ti;
a1423568e2aecd Barani Muthukumaran 2020-02-06  2357  
a1423568e2aecd Barani Muthukumaran 2020-02-06  2358  	t = dm_get_live_table(md, &srcu_idx);
a1423568e2aecd Barani Muthukumaran 2020-02-06  2359  	if (!t)
a1423568e2aecd Barani Muthukumaran 2020-02-06  2360  		return -EOPNOTSUPP;

Need a dm_put_live_table() even though dm_get_live_table() returns NULL.

a1423568e2aecd Barani Muthukumaran 2020-02-06  2361  	for (i = 0; i < dm_table_get_num_targets(t); i++) {
a1423568e2aecd Barani Muthukumaran 2020-02-06  2362  		ti = dm_table_get_target(t, i);
a1423568e2aecd Barani Muthukumaran 2020-02-06  2363  		if (!ti->type->iterate_devices)
a1423568e2aecd Barani Muthukumaran 2020-02-06  2364  			continue;
a1423568e2aecd Barani Muthukumaran 2020-02-06  2365  		ti->type->iterate_devices(ti, dm_derive_raw_secret_callback,
a1423568e2aecd Barani Muthukumaran 2020-02-06  2366  					  &args);
a1423568e2aecd Barani Muthukumaran 2020-02-06  2367  		if (!args.err)
a1423568e2aecd Barani Muthukumaran 2020-02-06  2368  			break;
a1423568e2aecd Barani Muthukumaran 2020-02-06  2369  	}
a1423568e2aecd Barani Muthukumaran 2020-02-06  2370  	dm_put_live_table(md, srcu_idx);
a1423568e2aecd Barani Muthukumaran 2020-02-06 @2371  	return args.err;
a1423568e2aecd Barani Muthukumaran 2020-02-06  2372  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

