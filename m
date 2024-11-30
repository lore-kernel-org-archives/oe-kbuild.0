Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1906919F117
	for <oe-kbuild@lists.linux.dev>; Sat, 30 Nov 2024 15:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732981365; cv=none; b=ZLjQg8OpTqSdKRlfIEuUgZieDQNefewnWdkvGlTv30clclvl0KPuQ0RpE/QED4JEpQEPQHpWB7gz94LxX3kG5FoqeCoRC4lAIzXDF557sqeacCbhfXCNdNCLNGZROrV+piTMjWMt0SDzBpI2xZRtnJ7kxTERGahCLuOMdRWYo/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732981365; c=relaxed/simple;
	bh=ZjE5f1j0mljqEf/b9z45iktwJG3jVw4Y40YHRV6nJkU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Wx9gcjYEIyo1BDX+QdJI7aS3yyZAS7lG183+tlPTRsvgXx+KKaS6P6YXq0Q7JMhZPG8H3m5KNQc+1Y4aQsJcK7ym/d152yXRMTLJmkmsH4vcm+/D6fL7b2mJ1jbVXcLXpzII4cwvWfj7aqkeyhCJzG2jsl7TXzBdCmW5HviRsVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pQIq3qRW; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pQIq3qRW"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5d01db666ceso3261397a12.0
        for <oe-kbuild@lists.linux.dev>; Sat, 30 Nov 2024 07:42:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732981361; x=1733586161; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PSlLKcvmbvHk0k3PNrewBm+ZelaCFOz/tKwtMYmx6Fc=;
        b=pQIq3qRWA+WNQfMLWKoYr0Q3+IuCC6Q2F8aZprHfzlqD0JOENDK9/cMhoW5tvR4C8l
         JEf+aVNPdbl76QsgVIu3TC3Uo/UARqUycVXOt6J6ZH6Gtmi5TmXqHJcxgnh0PL46++r1
         hPjCsTyR+5RPwa1beJP8pIIljy8HC5GR/g46pCS6Y97Kdynp2zDduBrMkpxPGfmi2SBP
         V5fHvbOofZw/E/X6i6tnYNBVQiUiYLqL/Dj/COQWX3t6fcFcSIW+lLKDxiwuqAJ6aUMw
         hrZ2LAQx/CxcqJD/uonVmrkrTrU3M6Gmstx/7snYTAAIEsnJspmoGZzpoop2UG7ZAeqC
         cLIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732981361; x=1733586161;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PSlLKcvmbvHk0k3PNrewBm+ZelaCFOz/tKwtMYmx6Fc=;
        b=gA/yfkY7AdmYNFFDUPI0j/cczzD0RTl3IYOZe7UVZD2EZVCkbeHf2i+fjfcL/Dgqpz
         gJEmDvgWUPl0/92sJELdROB/VOF/DsWcDedAe5TV5t2yiRap0hlLsF2wT5ht4pz6Fo01
         sVVEgktgUc6lxuLhG4ra0MOnIQ5kyMNGp1eJZSV2U+zRv8mjvMX3ffT0GElNE0gtVgVN
         LxJEHPw+0Vo4DZsqyHXtXwkq6oteycnpxaoFzZLB5nmct8t9w0UrKYWj+fGcW4gJJ7oA
         8DmDP0c6J3VKQN/544hha95xV7bTk5YFmtNNvNCh1A9T3tCjc+IQQMXD52AKaIJ66hlI
         Wn9A==
X-Gm-Message-State: AOJu0Yyi9GaUR+2oVMJBZMr8isgqBHFxVZg9N3CDbLhA7BypC0mXCEwq
	wRr/gypaqY1nPZhVIyFcSO3bMvcBZYSByAIIUdrLaiUSEkpPNX0ghb8jktvEJ7K2PsAM1j2DVK8
	J
X-Gm-Gg: ASbGncvHP63w7giM+VWWGjOw/zrB1gEQ09VjHucir6WbWlGzNEdTGN2LbLxxEfp0MRf
	nYCtvNws9a96A4wI2LZm9z3rY+C0BVEvZ2oWS//hc2nVRojKVZ+TDinKqbith8p52gsxNusWxC5
	HOWvs2Qpp4gZc709ssQJs2o3ah3qPHCgZrIzA5i3W1XL4AYaKu9/kncLtH0HhF4ta3CYBSgJhkc
	qHzqa3Is/27qZJVAV2PrWYulFhaifYqi4rVycYqY1Y6q0Q/tiI=
X-Google-Smtp-Source: AGHT+IERKPOUwCa2ntGDo8N7kUSwQa5zsZ313jvf4rSIvuQkKUouo9rMs4TsB49Eedu2xKjJ3Vi00g==
X-Received: by 2002:a17:906:1bb1:b0:aa5:3e7b:c117 with SMTP id a640c23a62f3a-aa580f3505amr1356781266b.28.1732981361240;
        Sat, 30 Nov 2024 07:42:41 -0800 (PST)
Received: from localhost ([41.210.145.9])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa59994e43dsm287451566b.177.2024.11.30.07.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2024 07:42:40 -0800 (PST)
Date: Sat, 30 Nov 2024 18:42:29 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, cros-kernel-buildreports@googlegroups.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 5/16] mm/vmscan.c:3679 reset_ctrl_pos()
 error: buffer overflow 'lrugen->nr_pages[next_gen][type]' 3 <= 3
Message-ID: <49c4229d-3f48-4aad-a90d-ec407a813052@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   b2b621a35c99ae939056ecf51631858aff950acc
commit: 31ee01d6177c6425cac96c3a479ac109013f5755 [5/16] CHROMIUM: mm/mglru: age at different rates
config: x86_64-randconfig-161-20241123 (https://download.01.org/0day-ci/archive/20241125/202411252126.fpKorPPx-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202411252126.fpKorPPx-lkp@intel.com/

smatch warnings:
mm/vmscan.c:3679 reset_ctrl_pos() error: buffer overflow 'lrugen->nr_pages[next_gen][type]' 3 <= 3

vim +3679 mm/vmscan.c

2b29ac9f92f57d7 David Stevens 2024-07-12  3653  static void reset_ctrl_pos(struct lruvec *lruvec, int type)
2b29ac9f92f57d7 David Stevens 2024-07-12  3654  {
2b29ac9f92f57d7 David Stevens 2024-07-12  3655  	int hist, tier;
2b29ac9f92f57d7 David Stevens 2024-07-12  3656  	struct lru_gen_folio *lrugen = &lruvec->lrugen;
31ee01d6177c642 David Stevens 2024-06-06  3657  	unsigned long carry_from_seq = lrugen->min_seq[type];
31ee01d6177c642 David Stevens 2024-06-06  3658  	unsigned long next_seq = carry_from_seq + 1;
31ee01d6177c642 David Stevens 2024-06-06  3659  	unsigned long next_gen = lru_gen_from_seq(next_seq);
31ee01d6177c642 David Stevens 2024-06-06  3660  	long total_nr_pages = 0;
2b29ac9f92f57d7 David Stevens 2024-07-12  3661  
2b29ac9f92f57d7 David Stevens 2024-07-12  3662  	lockdep_assert_held(&lruvec->lru_lock);
ac35a490237446b Yu Zhao       2022-09-18  3663  
31ee01d6177c642 David Stevens 2024-06-06  3664  	hist = lru_hist_from_seq(carry_from_seq);
ac35a490237446b Yu Zhao       2022-09-18  3665  
ac35a490237446b Yu Zhao       2022-09-18  3666  	for (tier = 0; tier < MAX_NR_TIERS; tier++) {
                                                                              ^^^^^^^^^^^^^

ac35a490237446b Yu Zhao       2022-09-18  3667  		unsigned long sum;
ac35a490237446b Yu Zhao       2022-09-18  3668  
ac35a490237446b Yu Zhao       2022-09-18  3669  		sum = lrugen->avg_refaulted[type][tier] +
ac35a490237446b Yu Zhao       2022-09-18  3670  		      atomic_long_read(&lrugen->refaulted[hist][type][tier]);
ac35a490237446b Yu Zhao       2022-09-18  3671  		WRITE_ONCE(lrugen->avg_refaulted[type][tier], sum / 2);
ac35a490237446b Yu Zhao       2022-09-18  3672  
ac35a490237446b Yu Zhao       2022-09-18  3673  		sum = lrugen->avg_total[type][tier] +
ac35a490237446b Yu Zhao       2022-09-18  3674  		      atomic_long_read(&lrugen->evicted[hist][type][tier]);
ac35a490237446b Yu Zhao       2022-09-18  3675  		if (tier)
ac35a490237446b Yu Zhao       2022-09-18  3676  			sum += lrugen->protected[hist][type][tier - 1];
ac35a490237446b Yu Zhao       2022-09-18  3677  		WRITE_ONCE(lrugen->avg_total[type][tier], sum / 2);
ac35a490237446b Yu Zhao       2022-09-18  3678  
31ee01d6177c642 David Stevens 2024-06-06 @3679  		total_nr_pages += lrugen->nr_pages[next_gen][type][tier];

There is a mixup between MAX_NR_TIERS (4) and MAX_NR_ZONES (3) which
results in an out of bounds read.

ac35a490237446b Yu Zhao       2022-09-18  3680  	}
31ee01d6177c642 David Stevens 2024-06-06  3681  	/* nr_pages is eventually consistent, so fix up the estimate if it's negative. */
31ee01d6177c642 David Stevens 2024-06-06  3682  	total_nr_pages = max(total_nr_pages, 0);
2b29ac9f92f57d7 David Stevens 2024-07-12  3683  
2b29ac9f92f57d7 David Stevens 2024-07-12  3684  	if (NR_HIST_GENS == 1)
31ee01d6177c642 David Stevens 2024-06-06  3685  		reset_histograms(lruvec, type, carry_from_seq);
31ee01d6177c642 David Stevens 2024-06-06  3686  
31ee01d6177c642 David Stevens 2024-06-06  3687  	hist = lru_hist_from_seq(next_seq);
31ee01d6177c642 David Stevens 2024-06-06  3688  	WRITE_ONCE(lrugen->victim_seq[hist][type], READ_ONCE(lrugen->min_seq[!type]));
31ee01d6177c642 David Stevens 2024-06-06  3689  	WRITE_ONCE(lrugen->oldest_gen_size[hist][type], total_nr_pages);
31ee01d6177c642 David Stevens 2024-06-06  3690  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

