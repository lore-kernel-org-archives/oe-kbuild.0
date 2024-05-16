Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F0C14535E
	for <oe-kbuild@lists.linux.dev>; Thu, 16 May 2024 11:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715858354; cv=none; b=EuIXrDyBpCYRWmLtW12l8IRdTS+VQmXQnB0VsPtlCwSqi9k2aXJWoGUmMm5EOeyy0rAScmLoXCbAwg/0PTnSXiu8xO8Tyux1ycqkhQJ0zvvoEV5KtEg3ZmqH6gBDSvf8oc31XBPeHnuvEyds2QbQbCR/jZaX08cShh7XmDhmops=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715858354; c=relaxed/simple;
	bh=0ASKLkaFoKi1aOyJwy9SPechH8uiz4Lfp4yOv+szVCI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ooM9XWjuRMIBZefPIcAKrDGD8m6f0+EykxkQlTn30lrBQ35OAb04hR/F4q8cP+X97BAWMpajGztVB/OEYw6tKY+zeIv5BBQ1Lue0jkeX35M9YI2D5p8a3zfh2dPjsnP44Tc3DAEqJkTdzB+Nl3IhpR4HU0eGumlMFP/CUys5eDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CF4UHXVf; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CF4UHXVf"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2db17e8767cso8637061fa.3
        for <oe-kbuild@lists.linux.dev>; Thu, 16 May 2024 04:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715858347; x=1716463147; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uufBESXlx6DtA4akO+dZMW0gvI2KQ0NTMmkmgNUH7xc=;
        b=CF4UHXVfkWfhvX+UD+XSq7QZSHo6vfwMHSuwdUhvGErlWnbFjieFhqF6jJC5iZF9zv
         3diBsVhCTE1/fOhFlkFJLIzzrdXn6yf6AAZcfLUBy17VfgKAysIegLJbqgkt57ls6UNn
         hsEJYdAyF+xFyczpUY+HmVO/MZDAFLqeoYdc96d60QfWGSKrFUsoft6V6NA1PFQm9Hzx
         ct58odlk3BAzblEmRCW/21vZAC7da5Bt7U4HWLXUDiSU4ydiJWHrkzc108hsfZk+tGwb
         c5wg+FAES+SHovf+vkiIsBiKxWR/37SgxTwchwzULrwG7kif77BESUTJp1crj1puF3nd
         pjGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715858347; x=1716463147;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uufBESXlx6DtA4akO+dZMW0gvI2KQ0NTMmkmgNUH7xc=;
        b=hgMPyRrllLfaBygnxebKd5zgNnH8sIND21wgIav1VUywOyLyEfv0gouT5aU6f9S2+D
         uzd518zgKPFuHE18PyVj1BggZQ6lQRRW7nyPGEYuY/09+3M6toBpXk6bIjhCtsDTkipT
         12t2pjam4eWan3FBDawiMKSBE+a7v6SYJnQ+JJdEZJ8h1wvu3QPKRgEhDndLT4l75zx+
         bcFtuv7fBaaKmk1i3ELw37Up1kTEGHNxXlOrfRxaUgtocDNua7WIplhdf/Jde1Cgd2I/
         emZqYaz1WwJUfCKhILHX3zWA0PHK6fOhx1aTcz0TwV1Yn+eqzwR/r2RQsvr/K9jUcbh5
         3PZA==
X-Gm-Message-State: AOJu0Yy5FLwIlOtHCs5Sy7kXlJNH58HnGaSta3FKVxJ+uL7ZR5uZ8R3Z
	MVtsxxthO3/zpvk2Crxuy9xnR/yvj1eKhgxb/CBtyhVyLvw5St5+x8YMQ86Fgd9vgs2h1sDwk7j
	h
X-Google-Smtp-Source: AGHT+IE+GIn+igsFQUbSMNElSOYFfeB9d8xUbOmOuHGfqDxT84i7abZ88/z4JEKD845TVkF9qj7NIw==
X-Received: by 2002:a2e:b0f3:0:b0:2e2:b716:e674 with SMTP id 38308e7fff4ca-2e51fd2dec3mr133719151fa.3.1715858346473;
        Thu, 16 May 2024 04:19:06 -0700 (PDT)
Received: from localhost ([149.14.240.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41fccce73f5sm268407115e9.21.2024.05.16.04.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 May 2024 04:19:05 -0700 (PDT)
Date: Thu, 16 May 2024 13:19:03 +0200
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Ben Hutchings <bwh@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-4.4.y-st-rt 2126/22961] kernel/sched/swork.c:63
 swork_kthread() warn: test_and_clear_bit() takes a bit number
Message-ID: <7a9c96f7-2a1f-48da-87f2-3910b83085bc@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mike,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.4.y-st-rt
head:   9addf64126a0035adf546b88a6519e544b3c0f16
commit: 6e24e49bf39d3d991503abafd28ac01d50c17994 [2126/22961] work-simple: Rename work-simple.[ch] to swork.[ch] for consistency
config: i386-randconfig-141-20240513 (https://download.01.org/0day-ci/archive/20240516/202405160909.1U7ADcVS-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202405160909.1U7ADcVS-lkp@intel.com/

smatch warnings:
kernel/sched/swork.c:63 swork_kthread() warn: test_and_clear_bit() takes a bit number
kernel/sched/swork.c:113 swork_queue() warn: test_and_set_bit() takes a bit number

vim +63 kernel/sched/swork.c

d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   44  static int swork_kthread(void *arg)
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   45  {
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   46  	struct sworker *worker = arg;
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   47  
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   48  	for (;;) {
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   49  		swait_event_interruptible(worker->wq,
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   50  					swork_readable(worker));
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   51  		if (kthread_should_stop())
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   52  			break;
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   53  
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   54  		raw_spin_lock_irq(&worker->lock);
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   55  		while (!list_empty(&worker->events)) {
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   56  			struct swork_event *sev;
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   57  
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   58  			sev = list_first_entry(&worker->events,
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   59  					struct swork_event, item);
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   60  			list_del(&sev->item);
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   61  			raw_spin_unlock_irq(&worker->lock);
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   62  
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11  @63  			WARN_ON_ONCE(!test_and_clear_bit(SWORK_EVENT_PENDING,

This warning means that SWORK_EVENT_PENDING() is probably a BIT(x)
define, but test_and_clear_bit() just takes x.  It's a double shift
bug, BIT(BIT(x)).  Which is won't cause an issue if it's done
consistently and x is small.

d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   64  							 &sev->flags));
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   65  			sev->func(sev);
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   66  			raw_spin_lock_irq(&worker->lock);
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   67  		}
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   68  		raw_spin_unlock_irq(&worker->lock);
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   69  	}
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   70  	return 0;
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11   71  }

[ snip ]

d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11  109  bool swork_queue(struct swork_event *sev)
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11  110  {
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11  111  	unsigned long flags;
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11  112  
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11 @113  	if (test_and_set_bit(SWORK_EVENT_PENDING, &sev->flags))
                                                                                                             ^^^^^^^^^^^^^^^^^^^
Same.

d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11  114  		return false;
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11  115  
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11  116  	raw_spin_lock_irqsave(&glob_worker->lock, flags);
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11  117  	list_add_tail(&sev->item, &glob_worker->events);
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11  118  	raw_spin_unlock_irqrestore(&glob_worker->lock, flags);
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11  119  
ad64c64a8f7ac0 kernel/sched/work-simple.c Sebastian Andrzej Siewior 2016-03-09  120  	swake_up(&glob_worker->wq);
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11  121  	return true;
d19fa60f5d71b6 kernel/sched/work-simple.c Daniel Wagner             2014-07-11  122  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

