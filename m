Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C32D32C317
	for <oe-kbuild@lists.linux.dev>; Thu,  4 Dec 2025 12:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764851848; cv=none; b=nZQo/b2JllDXibbsdWK8I+NsjfGcV6HLWGBOCPUsXwe1KdaPIjpfIRavr8nSu0c6KVoefqTZz8AVg20Xd7rOOXuYwTx6hh0nbE4aOi5gN8PnDW6j8miN5SAo3u4Sdp1OsKW7iNWzko6nN9Y/OWsh+F+mkIlwsza38sVz+ZPwSh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764851848; c=relaxed/simple;
	bh=I+x50kw7eD/yFvO/RXyr3WRAFE/OaL8Au1f1VOnxJ0A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IsCGa9g9MQqFGf3S44hQ+uIUaDe6/1FJpK4C+/wUTRAc1be5k4JnQQRqfTbdw4D8biKV+l67AiMfBsnpHTmEylpckGkAPIJKubVJoZqzhu3CFwegGaVpTNrTaXaJQLGFUAxfH9wUgdY/wT9cAYJ7/BbX3wVMrFHO4dg5moW3TNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Cnfvh1If; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Cnfvh1If"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4779adb38d3so7861815e9.2
        for <oe-kbuild@lists.linux.dev>; Thu, 04 Dec 2025 04:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764851845; x=1765456645; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ia1NqmdvWfkLXAzH0MNKGnJbJSAy5z/VpGTUT9Z+iC8=;
        b=Cnfvh1If5BWWh1X8g1XPmeY/QzXo7WY5QyePURBk3EELqx4z7Vy4uIUN8qRUMASAb4
         hmO5qOBB4G4ot55GCpXG5ASUFc19DGyhGc8j0uu1Adxcdp43TCpva8P+k5VqmpSgbd5N
         nssGiP+Eyhba4l2VEjR9kS5OXMDAI/8nONzeNj81yY0jhWVVvX0qytgQIjkcvenqxfKV
         uEn3r6rTkKg8eiLxRLHGqkwgBlcyeUOvYDbjtb6xU/65viZuBZYuc4dC8l84elj3JoGx
         zh4rGhmVkHzgv4P9+Z+VJt1N5NuSiqQRjsfvRwih2+5qrdbNefGIvFGwlYwTxEHl4E8S
         PIKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764851845; x=1765456645;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ia1NqmdvWfkLXAzH0MNKGnJbJSAy5z/VpGTUT9Z+iC8=;
        b=reSOc7D585BdwydbxP5VTiAkuyoNU1GM/nLHmxnUw9XNk1t/n8eIjLNsgpDZ4TVJEq
         B7NuLLi2fTzVtc1oBk6SWMq93GrbwROac7O/o4KlR46Oku6Zl7RpaekH/Th7Aft9M2PX
         Tn11UnE1QUcqx/2JCCRgErnbAYJvcBpgvMNqWH5kb8qYY9UEuHEiyWa6R1q8qTIZinsT
         SJJkwfCMPrnjyeY9Gc0TdbC0KnVwe4K/i8N9SLVRsThzn1CY/Os3hWvSq3Vt1fcLrGlF
         NYbTHcv3iXGotKI9U7X04Oetcsg81Ls4QLwKa2cebIRSJjKSoneSlb6xWMHZgWvRgAwq
         c8jw==
X-Gm-Message-State: AOJu0YyhA+2VDFCF3eQgTEn62LwwzD8KE/v/nu4TnOev7wenYVBBZXtR
	pDcKtPupyeD4sVyXFveGK+cDfJXcehIUTOiAmwQAGMnkPQ4mXBGv4mMzglaTFflegcFde5JAi++
	OuKIq
X-Gm-Gg: ASbGncu6LjsBHwpLecEnFTTgIgHFqZP1xyTmffcc5LxUb3DSbBYwhSpnepKpST0tmr+
	Xi3i0yW9lWz/TwYJVNQO5a8U9dz2Rya6PoKZaoWE8iGmCQDQGsVx6uU5wCzy0sCs72avAHkIGrg
	ttYUKi78m0sAKDhQEMbt50OQEittD/SHUHiq+O6APy9DxtAmfTkopfGi6v3dQBoziqagU1kN/RD
	gxgQxkm7aboV9qdhDpXZ+CTjv2+Y6Yh1MuJmjXmtCr+G+ez2aPEKI/vw+D6DjUIYA6rck9ZyRe9
	9w2ozxC/BvX166PU41qUPQzbEcloZY9wMyblA/ltXJZKr2sJ8fk732jwOSRCEC9krQpj6jEKDnP
	Ksrbzqw7NvqohCPu6TyIgeZBt+2XZsGSYTQatN9Iq8v/s2D9kCsKlmDwdei0JSRMGznYBlxCReI
	ZMIWGPaE+t1xROi9PydzrFCXPWCW8I0w73cLGt
X-Google-Smtp-Source: AGHT+IHqn2BhHzF5lqBtfDobXTknqzY//sbRwRYp4UNor2Id91FE3wWAPEWWaSzWUXUDQX+NOcTnmA==
X-Received: by 2002:a05:600c:1d1d:b0:477:abea:9028 with SMTP id 5b1f17b1804b1-4792f24418bmr28417785e9.6.1764851844520;
        Thu, 04 Dec 2025 04:37:24 -0800 (PST)
Received: from localhost (h1f65.n1.ips.mtn.co.ug. [41.210.159.101])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4792b140cf4sm47488925e9.5.2025.12.04.04.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 04:37:24 -0800 (PST)
Date: Thu, 4 Dec 2025 15:37:20 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Ingo Molnar <mingo@kernel.org>
Subject: [mingo-tip:WIP.sched/flat 31/31] kernel/sched/fair.c:13541
 unregister_fair_sched_group() warn: variable dereferenced before check 'se'
 (see line 13538)
Message-ID: <202512042010.Kvt9IxPC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20251204123720.KRD6-JvqqQcTpPFmWUowQkfkqguKQgrJK79ibSv9mLw@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git WIP.sched/flat
head:   d8048abc1303ce09d2ed220c03377f633bd106e4
commit: d8048abc1303ce09d2ed220c03377f633bd106e4 [31/31] sched/eevdf: Move to a single runqueue
config: mips-randconfig-r071-20251204 (https://download.01.org/0day-ci/archive/20251204/202512042010.Kvt9IxPC-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 11.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202512042010.Kvt9IxPC-lkp@intel.com/

smatch warnings:
kernel/sched/fair.c:13541 unregister_fair_sched_group() warn: variable dereferenced before check 'se' (see line 13538)

vim +/se +13541 kernel/sched/fair.c

6fe1f348b3dd1f kernel/sched/fair.c Peter Zijlstra         2016-01-21  13528  void unregister_fair_sched_group(struct task_group *tg)
029632fbb7b7c9 kernel/sched_fair.c Peter Zijlstra         2011-10-25  13529  {
6fe1f348b3dd1f kernel/sched/fair.c Peter Zijlstra         2016-01-21  13530  	int cpu;
6fe1f348b3dd1f kernel/sched/fair.c Peter Zijlstra         2016-01-21  13531  
b027789e5e5049 kernel/sched/fair.c Mathias Krause         2021-11-03  13532  	destroy_cfs_bandwidth(tg_cfs_bandwidth(tg));
b027789e5e5049 kernel/sched/fair.c Mathias Krause         2021-11-03  13533  
6fe1f348b3dd1f kernel/sched/fair.c Peter Zijlstra         2016-01-21  13534  	for_each_possible_cpu(cpu) {
2e0199df252a53 kernel/sched/fair.c Peter Zijlstra         2024-05-23  13535  		struct cfs_rq *cfs_rq = tg->cfs_rq[cpu];
2e0199df252a53 kernel/sched/fair.c Peter Zijlstra         2024-05-23  13536  		struct sched_entity *se = tg->se[cpu];
2e0199df252a53 kernel/sched/fair.c Peter Zijlstra         2024-05-23  13537  		struct rq *rq = cpu_rq(cpu);
f85fd15b0da76f kernel/sched/fair.c Peng Wang              2025-10-24 @13538  		struct cfs_rq *parent_cfs_rq = cfs_rq_of(se);
                                                                                                                                 ^^
Dereferenced here

f85fd15b0da76f kernel/sched/fair.c Peng Wang              2025-10-24  13539  
f85fd15b0da76f kernel/sched/fair.c Peng Wang              2025-10-24  13540  
d8048abc1303ce kernel/sched/fair.c Peter Zijlstra (Intel  2025-12-03 @13541) 		if (se)
                                                                                            ^^
But this code assumed it can be NULL.

d8048abc1303ce kernel/sched/fair.c Peter Zijlstra (Intel  2025-12-03  13542) 			remove_entity_load_avg(se);
029632fbb7b7c9 kernel/sched_fair.c Peter Zijlstra         2011-10-25  13543  
029632fbb7b7c9 kernel/sched_fair.c Peter Zijlstra         2011-10-25  13544  		/*
029632fbb7b7c9 kernel/sched_fair.c Peter Zijlstra         2011-10-25  13545  		 * Only empty task groups can be destroyed; so we can speculatively
029632fbb7b7c9 kernel/sched_fair.c Peter Zijlstra         2011-10-25  13546  		 * check on_list without danger of it being re-added.
029632fbb7b7c9 kernel/sched_fair.c Peter Zijlstra         2011-10-25  13547  		 */
2e0199df252a53 kernel/sched/fair.c Peter Zijlstra         2024-05-23  13548  		if (cfs_rq->on_list) {
2e0199df252a53 kernel/sched/fair.c Peter Zijlstra         2024-05-23  13549  			guard(rq_lock_irqsave)(rq);
2e0199df252a53 kernel/sched/fair.c Peter Zijlstra         2024-05-23  13550  			list_del_leaf_cfs_rq(cfs_rq);
2e0199df252a53 kernel/sched/fair.c Peter Zijlstra         2024-05-23  13551  		}
d8048abc1303ce kernel/sched/fair.c Peter Zijlstra (Intel  2025-12-03  13552) 
d8048abc1303ce kernel/sched/fair.c Peter Zijlstra (Intel  2025-12-03  13553) 		/*
d8048abc1303ce kernel/sched/fair.c Peter Zijlstra (Intel  2025-12-03  13554) 		 * Clear parent's h_load_next if it points to the
d8048abc1303ce kernel/sched/fair.c Peter Zijlstra (Intel  2025-12-03  13555) 		 * sched_entity being freed, to avoid stale pointer.
d8048abc1303ce kernel/sched/fair.c Peter Zijlstra (Intel  2025-12-03  13556) 		 */
d8048abc1303ce kernel/sched/fair.c Peter Zijlstra (Intel  2025-12-03  13557) 		if (READ_ONCE(parent_cfs_rq->h_load_next) == se)
d8048abc1303ce kernel/sched/fair.c Peter Zijlstra (Intel  2025-12-03  13558) 			WRITE_ONCE(parent_cfs_rq->h_load_next, NULL);
029632fbb7b7c9 kernel/sched_fair.c Peter Zijlstra         2011-10-25  13559  	}
6fe1f348b3dd1f kernel/sched/fair.c Peter Zijlstra         2016-01-21  13560  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

