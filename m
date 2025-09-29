Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B5E625
	for <oe-kbuild@lists.linux.dev>; Mon, 29 Sep 2025 08:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759135592; cv=none; b=cCb99qM+G1D+Z9cp995OtwICv6htfW0vlRT+LsKkX398eScpNvJCllHPGLJeJnODWv38OSZUzBwQAN5yHSPxAYfm77dqD2fYCfCRqN1WJ5G+ESAjEoLv9mVCdP2oTjdvH9Wvu7SAcOY3KTe34e3k6tZHZCfhuqI3O2AS1EeeXOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759135592; c=relaxed/simple;
	bh=BewtpsS8BJKVbE+kJssv6ZvhLH4bU0TwDjvg9fKBj0o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=kiseuBHGnJ+xw4mlvtUPRVnP6hqMb1SFuNoGBielMicNJngVDKparZMpCOSqPMAh0xxIl/IFoT+QDJI7pGn4p549W9QZGs4352B+NaYSCqZUMSCW13KGJtzyGfVYV4MTdQ2nVSV06e/rc5vVehVFccEpSpi3XbXunlTbNR1UEqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Gwt32KCR; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Gwt32KCR"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3ece1102998so2814777f8f.2
        for <oe-kbuild@lists.linux.dev>; Mon, 29 Sep 2025 01:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759135588; x=1759740388; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sKLBhCJl5/nghFRodO0ItHfAYxbW+6msMIAhSSFvsw0=;
        b=Gwt32KCRgy7PQl8aa95FUHGKIvUxxP7ApAGD+mA1MTJDTt4yHWuZeuv8fXN/Zl2cBu
         xNMQsOE3qtR+eihzx1l4/4857MLjFgZsX5q35MC0n4eWlp2KlSkWQc7NoXKPILZyWCkv
         qfFSN9+x1AHlsmAQjG0z5Urzrgd9ljB8CxnaA9zwtvbM6ha6SMdBDdURob+9mn6U4X8b
         M1/rKbNfDxAH0y8lbIGNrB4l6qLs04PqmQ3FgE2rO3QCFQzANTcTcjbgtDORH82NN8th
         zA/hd0RT5gCgZ2SehoRxTZ67tU4FykG3bJo/B+EXLvuf0a1XDmFtekUZZlxhGdxc6bGp
         BlBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759135588; x=1759740388;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sKLBhCJl5/nghFRodO0ItHfAYxbW+6msMIAhSSFvsw0=;
        b=nZVeKHJHfzrklkejz2qj8oDTeKIQx4esnOq2/uwTaaspe/FzmUAzZ7XJ5fZ14dMeSx
         6jJ62OrOQM89lblfwUnOozsdkSJ0ygkoNJ/P8rqlrabXQ3dgCVL/ebfufyrN8Dz+HYKm
         ZJG4GCFHk9Ve6fCKd+uIjZtYpIksKnccwuCj+6kpD+V18obWzboXZQA3dAejrBeNwyrj
         20MkyRuKhY6svcIZcm8kkwOeusMdaFU4v6Vu2eKYALOeJx6Ty1a2cJsUAEMD069t0dNo
         6RGjaZW8N7MYysESSa28RlnzF8XtKKRl6UCRqkiyz++NvITVkHduB+/RWe3D+kEiaBQk
         dBrg==
X-Gm-Message-State: AOJu0Yz1kJwJJZWaV1hDH8RJyY6cJ1aC+ucmjGvvX/xJ8D1sW41BeW6d
	w8FNc58ZML5pGzwCgZHqL29FEY/+SqKJZTrJZUQ06maRnBY6/xlEF6rvgsx44iziRHVP0zsQsiQ
	DjyFb
X-Gm-Gg: ASbGnct/zBPxpuC0RbRbQAyP7rmtee0Sp8rEonypcmwIgyz4/L9ZZ3LsjQ3aTjUbsv3
	qqkVwPIt8N+ZDcM26SzmPFHO16kHhoB1LQWU5WdLggHdFwZK8j1bO6DNEedf7tap2CXsAATHuet
	dTP1zkC85Ns+c/DUUZDNkrtbkm7Y8R3zfdxgHtXoPopVNquKlvoRaW1w1TTXxCrW6ruFW9cnaa1
	X/fdDDZcrX3bVL/cS4WdkNcc96S/pXmInJnsh0lMwOWjw7jQq+SsyaDCV4Yjqwls4J8z8nFHAy2
	3cZV61EkwUSxifd0zjpw85aJU9aSO6h+zdcRrLZ3+WNifnIeHyxf9M1z+fTSOFxjtM+abVmSdhy
	MpHvJyPmk5ltNp6GzYxSxbwdbBRqoKE8KJ2YxFco=
X-Google-Smtp-Source: AGHT+IFiyH/6Im62Ydr3EApKzn0Bk8jV3H19/X49G59QAzu2t8JmF/PPcqoUX8ITQu/9MCv12t8qSw==
X-Received: by 2002:a05:6000:268a:b0:3e4:f194:2886 with SMTP id ffacd0b85a97d-40e436428d0mr13085167f8f.19.1759135588199;
        Mon, 29 Sep 2025 01:46:28 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-40fb72fb017sm17297267f8f.3.2025.09.29.01.46.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 01:46:27 -0700 (PDT)
Date: Mon, 29 Sep 2025 11:46:24 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Mary Strodl <mstrodl@csh.rit.edu>,
	linux-kernel@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, linus.walleij@linaro.org,
	brgl@bgdev.pl, linux-gpio@vger.kernel.org,
	Mary Strodl <mstrodl@csh.rit.edu>
Subject: Re: [PATCH v2 1/3] gpio: mpsse: use rcu to ensure worker is torn down
Message-ID: <202509290823.hreUi6Tp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250923133304.273529-2-mstrodl@csh.rit.edu>
Message-ID: <20250929084624.63F7XGWb2CgOpXhajw7xmZRY-ZVMzGVBNsWsm0yXwPM@z>

Hi Mary,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mary-Strodl/gpio-mpsse-use-rcu-to-ensure-worker-is-torn-down/20250923-214710
base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
patch link:    https://lore.kernel.org/r/20250923133304.273529-2-mstrodl%40csh.rit.edu
patch subject: [PATCH v2 1/3] gpio: mpsse: use rcu to ensure worker is torn down
config: i386-randconfig-141-20250929 (https://download.01.org/0day-ci/archive/20250929/202509290823.hreUi6Tp-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202509290823.hreUi6Tp-lkp@intel.com/

New smatch warnings:
drivers/gpio/gpio-mpsse.c:341 gpio_mpsse_poll() error: dereferencing freed memory 'worker' (line 342)
drivers/gpio/gpio-mpsse.c:604 gpio_mpsse_disconnect() error: dereferencing freed memory 'worker' (line 605)

vim +/worker +341 drivers/gpio/gpio-mpsse.c

a14b0c5e3b0741 Mary Strodl 2025-09-23  304  static void gpio_mpsse_poll(struct work_struct *my_work)
c46a74ff05c0ac Mary Strodl 2024-10-09  305  {
c46a74ff05c0ac Mary Strodl 2024-10-09  306  	unsigned long pin_mask, pin_states, flags;
c46a74ff05c0ac Mary Strodl 2024-10-09  307  	int irq_enabled, offset, err, value, fire_irq,
c46a74ff05c0ac Mary Strodl 2024-10-09  308  		irq, old_value[16], irq_type[16];
a14b0c5e3b0741 Mary Strodl 2025-09-23  309  	struct mpsse_worker *worker;
a14b0c5e3b0741 Mary Strodl 2025-09-23  310  	struct mpsse_worker *my_worker = container_of(my_work, struct mpsse_worker, work);
a14b0c5e3b0741 Mary Strodl 2025-09-23  311  	struct mpsse_priv *priv = my_worker->priv;
a14b0c5e3b0741 Mary Strodl 2025-09-23  312  	struct list_head destructors = LIST_HEAD_INIT(destructors);
c46a74ff05c0ac Mary Strodl 2024-10-09  313  
c46a74ff05c0ac Mary Strodl 2024-10-09  314  	for (offset = 0; offset < priv->gpio.ngpio; ++offset)
c46a74ff05c0ac Mary Strodl 2024-10-09  315  		old_value[offset] = -1;
c46a74ff05c0ac Mary Strodl 2024-10-09  316  
a14b0c5e3b0741 Mary Strodl 2025-09-23  317  	/*
a14b0c5e3b0741 Mary Strodl 2025-09-23  318  	 * We only want one worker. Workers race to acquire irq_race and tear
a14b0c5e3b0741 Mary Strodl 2025-09-23  319  	 * down all other workers. This is a cond guard so that we don't deadlock
a14b0c5e3b0741 Mary Strodl 2025-09-23  320  	 * trying to cancel a worker.
a14b0c5e3b0741 Mary Strodl 2025-09-23  321  	 */
a14b0c5e3b0741 Mary Strodl 2025-09-23  322  	scoped_cond_guard(mutex_try, ;, &priv->irq_race) {
a14b0c5e3b0741 Mary Strodl 2025-09-23  323  		scoped_guard(rcu) {
a14b0c5e3b0741 Mary Strodl 2025-09-23  324  			list_for_each_entry_rcu(worker, &priv->workers, list) {
a14b0c5e3b0741 Mary Strodl 2025-09-23  325  				/* Don't stop ourselves */
a14b0c5e3b0741 Mary Strodl 2025-09-23  326  				if (worker == my_worker)
a14b0c5e3b0741 Mary Strodl 2025-09-23  327  					continue;
a14b0c5e3b0741 Mary Strodl 2025-09-23  328  
a14b0c5e3b0741 Mary Strodl 2025-09-23  329  				scoped_guard(raw_spinlock_irqsave, &priv->irq_spin)
a14b0c5e3b0741 Mary Strodl 2025-09-23  330  					list_del_rcu(&worker->list);
a14b0c5e3b0741 Mary Strodl 2025-09-23  331  
a14b0c5e3b0741 Mary Strodl 2025-09-23  332  				/* Give worker a chance to terminate itself */
a14b0c5e3b0741 Mary Strodl 2025-09-23  333  				atomic_set(&worker->cancelled, 1);
a14b0c5e3b0741 Mary Strodl 2025-09-23  334  				/* Keep track of stuff to cancel */
a14b0c5e3b0741 Mary Strodl 2025-09-23  335  				INIT_LIST_HEAD(&worker->destroy);
a14b0c5e3b0741 Mary Strodl 2025-09-23  336  				list_add(&worker->destroy, &destructors);
a14b0c5e3b0741 Mary Strodl 2025-09-23  337  			}
a14b0c5e3b0741 Mary Strodl 2025-09-23  338  		}
a14b0c5e3b0741 Mary Strodl 2025-09-23  339  		/* Make sure list consumers are finished before we tear down */
a14b0c5e3b0741 Mary Strodl 2025-09-23  340  		synchronize_rcu();
a14b0c5e3b0741 Mary Strodl 2025-09-23 @341  		list_for_each_entry(worker, &destructors, destroy)
a14b0c5e3b0741 Mary Strodl 2025-09-23 @342  			gpio_mpsse_stop(worker);

This needs to be list_for_each_entry_save() because gpio_mpsse_stop()
frees the worker.  Or kfree_rcu() inside an rcu lock or something.

a14b0c5e3b0741 Mary Strodl 2025-09-23  343  	}
a14b0c5e3b0741 Mary Strodl 2025-09-23  344  
a14b0c5e3b0741 Mary Strodl 2025-09-23  345  	while ((irq_enabled = atomic_read(&priv->irq_enabled)) &&

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

