Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16D7230272
	for <oe-kbuild@lists.linux.dev>; Wed,  2 Apr 2025 08:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743582822; cv=none; b=pCq2QdkhVRnV+p1pAzkxG7stvmSLtt+7jUzV9/xweCkb6m+YTJggfhYgf2tqqsbVQ5xVZTUByQtXFsN7+MulKDUegronvG5CsBvEAB0eypI2Xj6LQr1YPq5YMjxNdVBpXXh9dmz9BMZ2qUIgtCUEPJMaIY4hBZwjoHsNvKmWxeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743582822; c=relaxed/simple;
	bh=9I9XHZRgnlgkSyK6bk18GShdXhlb3cRo4eQ4FSWfEgA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=urKnwR4PcBW6APs9EE/SQ0kPGFfgn2HzQtIlXUfMyNC9ok0fZjB3U9MXNaEdMP8r9G+J2wtLp6NQ4wCfS8IGPIaxfxAc7WIl18G5LORBxvEx33f/UYmYkshLWtuEPCMVkKVFbimz+nLdJA2mJXgS1TmWjCmMf+60t5/nfwq9jHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OQFYUGOf; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OQFYUGOf"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-39c1efbefc6so1478647f8f.1
        for <oe-kbuild@lists.linux.dev>; Wed, 02 Apr 2025 01:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743582819; x=1744187619; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RflM3eIUeAykRn7gfmZiAZuq4DaaLmevr7UucAIeFSc=;
        b=OQFYUGOfAO2+iAxmTbQVQUWxx6DTR0a24TADCiv/mKcnSfV7SKu7jvI4Y2h34Gu+RC
         iEWYiLR/OWxJYcgcvIHIexinxDyDUA7R6vSK/G0yjl9PEV37zNNvT51Fu42gX3P1qDiM
         HMKlXBO8zliRuKof4PE+QL3IwTHYII6tjL6O2xYhaGg6QC+NTI3JPCNHraIy6R/RgN+i
         w6ZvM77QZOV+pOefRd6vkeRRjZ2jPCA/Q29D92BiJH8kDjyzHgeW2K/5UVzek3fCqK7r
         sVy4Vkb6YLXiGBwKI1CMNCAC+l929tVp+CuexPVJKWFKBVP4mMH5mzuDO4J8NhMDBL0M
         YYNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743582819; x=1744187619;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RflM3eIUeAykRn7gfmZiAZuq4DaaLmevr7UucAIeFSc=;
        b=pLIpkHUk1lhWsypVG9ZjyOnRebI7mI4qs2Xpr9jFH/VCUnSe8VJSS/9rqg1AMna2hq
         41UfJ0tbrmXgyJGUUWSELgSOmOmkN2/a6Emyngb22ZnVJe0BJHenalZE1wA/EFHEAW3X
         1GcrtgsH44cikYogNFmTfJdjJNnT4hi8vLUcA86jn48tQKRB+I98DaXQ/pUe1KSWakdP
         q5MQBKJN13e0pB5lw549pnpYx8dFGHLy9YFBzYrg6HW1gXmvvE8Y3jccFGv3bvY217MT
         Y6jZD8D9mHWa1R0eSocOyFfWY/3zpeON7DC18LQ17laQRY6wcr4zNR30DyiMoTI6KjtE
         rR4Q==
X-Gm-Message-State: AOJu0YwcuxjU8MeGup84lSlPvulkLI5RpPYdAE8q1flrbdU2+cB6JpDP
	IhxSBLhOCUfFj8Go05TjxqP9Od8ZeW8rfR8aXBOpW69wluj/97GDAd7YLzDQM+dYDSWEuo3n5s/
	w
X-Gm-Gg: ASbGncv6Ndard/H2Iw42NPMnWbEAk1faT1vBc6K5FKDtQHbu0Xk7mNhz7UiklQB2pHL
	sfPWCFNGpju8UPfnGn+PwmXYg+aQRhh04noscASacBALP7fbbhpoW8O4/Iqaaffjf9hsp++MNNz
	XRQHjII/hmn7TmCILzNMYLf54mx4HeEu4la6aGg6XxWF+pDSrzOzALgRKDDbtYhvQ6LnqiS0ry8
	2TccIn65irSkweDQPSPbhfwDYYDVo4b6R58FlbTvrSFXGlQSMc3JAgyNbEpbD5T7YKjpDXTA2jx
	4e9Zkap/Cf9F0f/MXfIdxO4ahpRTzb66WTWI9gz2HhBcq9Xq/A==
X-Google-Smtp-Source: AGHT+IF60L370xApA1IohVIjYQPwT3lpHbrDLuhxkwVDRvR1TS0O+uW7nY7HDfqyeIQWm5MDbCeb7Q==
X-Received: by 2002:a5d:64c9:0:b0:39c:1f10:ba54 with SMTP id ffacd0b85a97d-39c29769561mr1219466f8f.35.1743582818911;
        Wed, 02 Apr 2025 01:33:38 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43eb613aabesm13363625e9.39.2025.04.02.01.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 01:33:38 -0700 (PDT)
Date: Wed, 2 Apr 2025 11:33:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, "Paul E. McKenney" <paulmck@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [paulmckrcu:dev.2025.03.25a 45/45] lib/ratelimit.c:45 ___ratelimit()
 warn: 'burst' unsigned <= 0
Message-ID: <922c17a3-d075-47f8-9af1-f14e0bbf6da2@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/paulmckrcu/linux dev.2025.03.25a
head:   cedfad9ced72fc8c873e11a4c6a089a415489166
commit: cedfad9ced72fc8c873e11a4c6a089a415489166 [45/45] ratelimit: Reduce ratelimit's false-positive misses
config: x86_64-randconfig-161-20250402 (https://download.01.org/0day-ci/archive/20250402/202504020656.TgN4JCta-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202504020656.TgN4JCta-lkp@intel.com/

New smatch warnings:
lib/ratelimit.c:45 ___ratelimit() warn: 'burst' unsigned <= 0
lib/ratelimit.c:45 ___ratelimit() warn: 'interval' unsigned <= 0

vim +/burst +45 lib/ratelimit.c

5c828713358cb9 Christian Borntraeger 2009-10-23  27  int ___ratelimit(struct ratelimit_state *rs, const char *func)
5f97a5a8799b8d Dave Young            2008-04-29  28  {
cedfad9ced72fc Paul E. McKenney      2025-03-31  29  	unsigned long begin;
cedfad9ced72fc Paul E. McKenney      2025-03-31  30  	unsigned long burst = READ_ONCE(rs->burst);
                                                        ^^^^^^^^^^^^^^^^^^^

cedfad9ced72fc Paul E. McKenney      2025-03-31  31  	int delta = 0;
4d9c377c81d377 Alexey Dobriyan       2008-07-28  32  	unsigned long flags;
cedfad9ced72fc Paul E. McKenney      2025-03-31  33  	bool gotlock = false;
cedfad9ced72fc Paul E. McKenney      2025-03-31  34  	bool initialized;
cedfad9ced72fc Paul E. McKenney      2025-03-31  35  	unsigned long interval = READ_ONCE(rs->interval);
cedfad9ced72fc Paul E. McKenney      2025-03-31  36  	unsigned long j;
cedfad9ced72fc Paul E. McKenney      2025-03-31  37  	int n_left;
5f97a5a8799b8d Dave Young            2008-04-29  38  
edaac8e3167501 Ingo Molnar           2009-09-22  39  	/*
cedfad9ced72fc Paul E. McKenney      2025-03-31  40  	 * If the burst or interval settings mark this ratelimit_state
cedfad9ced72fc Paul E. McKenney      2025-03-31  41  	 * structure as disabled, then clear the RATELIMIT_INITIALIZED bit
cedfad9ced72fc Paul E. McKenney      2025-03-31  42  	 * in ->flags to force resetting of the ratelimiting interval when
cedfad9ced72fc Paul E. McKenney      2025-03-31  43  	 * this ratelimit_state structure is next re-enabled.
edaac8e3167501 Ingo Molnar           2009-09-22  44  	 */
cedfad9ced72fc Paul E. McKenney      2025-03-31 @45  	if (burst <= 0 || interval <= 0) {
                                                            ^^^^^^^^^^^^^^^^^^^^^^^^^^
unsigned can't be less than zero.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

