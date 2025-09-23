Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAEEA8834
	for <oe-kbuild@lists.linux.dev>; Tue, 23 Sep 2025 13:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758635601; cv=none; b=akD5bXZWIX8UfnUCT3GrzqTCaNswkhyW6hwKxsIFglvEOJ648/cqeuAjmXRrqx7BYjneyGV5IJmUjg+uF+Ym7T937po0yswiIyhBEY4IPT9QCL83HlEKnr8RkRh9mePgYran6VuPlKvTszKFJBe3IqAL6Wg/QZ6hss0CW2ngYo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758635601; c=relaxed/simple;
	bh=TG1K3GF29zpQTtjqKGcCryn3Zmb8wqG/rjix/E0K6zk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OkKOWLMdR9Ii1XZg3q2qXciFr5LfaDLuK4vrMaHsIQtsMytn/rvEseDSPufIGOe9sHc5sLH81d+H1UpY+Vmri4Z5aEuwHnU0qcudP6a3K+v95oiauxXOyPn9UWI1txJygtLu8jtjQnorlScfof+3lppe+AshGFxPoHxjHOiB7Kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S5u1UdD8; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S5u1UdD8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758635599; x=1790171599;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TG1K3GF29zpQTtjqKGcCryn3Zmb8wqG/rjix/E0K6zk=;
  b=S5u1UdD8BUWjURfE9krlbCHf7Uc3PDTTdUKdKk07wTnR3IA88ZyXy/No
   B3bTZ0bxzc7vOw6csWu9k3kgzuZNI6ElyM/cjxx0KxvW/HF0E7FWX1rEQ
   clUrP2+RHPqj4dJ4/bYimufJE1Dg4fpgfLXQU6GGB3cfqZFPL2q12AcMG
   JxX8j+9jbiesarDFrY5j0XkitffFFtVTjRj4h+PlZ0U+kvfd4O8jq9aRl
   k4UQHs4f/CL5uOxeJP+xd9IP9pxt5ZhgC4ghFx1tyPKijVWTll2sU9zsq
   3PiqpDI4PAy0/vExHuf2HXNi8ZNOAq7hXQfQfpq3gl46TXKXnJzZYa+DE
   w==;
X-CSE-ConnectionGUID: 0UxzCTGzThmcQqCLYXt54A==
X-CSE-MsgGUID: Yl5mpPROQK24WUkmji9ujA==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="71160969"
X-IronPort-AV: E=Sophos;i="6.18,288,1751266800"; 
   d="scan'208";a="71160969"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 06:53:18 -0700
X-CSE-ConnectionGUID: 8YTCSTN6RIWEwlDnOCSlEg==
X-CSE-MsgGUID: bixtVVQySJuGsDz9w9jbqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,288,1751266800"; 
   d="scan'208";a="176349089"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 23 Sep 2025 06:53:17 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v13SE-0003A7-2J;
	Tue, 23 Sep 2025 13:53:14 +0000
Date: Tue, 23 Sep 2025 21:53:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [melver:cap-analysis/dev 8/35] lib/test_capability-analysis.c:90
 test_raw_spinlock_trylock_extra() warn: mixing irq and irqsave
Message-ID: <202509232159.k4bVJE5b-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: elver@google.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git cap-analysis/dev
head:   b57fd8af63116c56536eb40f04dbe4f2206ec4ed
commit: 821a2ecb55c76aebb2a5fc53c7a49c2bc21a59af [8/35] locking/rwlock, spinlock: Support Clang's capability analysis
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: sparc64-randconfig-r072-20250922 (https://download.01.org/0day-ci/archive/20250923/202509232159.k4bVJE5b-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202509232159.k4bVJE5b-lkp@intel.com/

smatch warnings:
lib/test_capability-analysis.c:90 test_raw_spinlock_trylock_extra() warn: mixing irq and irqsave
include/linux/spinlock.h:555 class_raw_spinlock_try_constructor() warn: passing zero to 'ERR_PTR'
lib/test_capability-analysis.c:114 test_spinlock_trylock_extra() warn: mixing irq and irqsave
include/linux/spinlock.h:594 class_spinlock_try_constructor() warn: passing zero to 'ERR_PTR'

vim +90 lib/test_capability-analysis.c

821a2ecb55c76a Marco Elver 2025-01-23   74  
821a2ecb55c76a Marco Elver 2025-01-23   75  TEST_SPINLOCK_COMMON(raw_spinlock,
821a2ecb55c76a Marco Elver 2025-01-23   76  		     raw_spinlock_t,
821a2ecb55c76a Marco Elver 2025-01-23   77  		     raw_spin_lock_init,
821a2ecb55c76a Marco Elver 2025-01-23   78  		     raw_spin_lock,
821a2ecb55c76a Marco Elver 2025-01-23   79  		     raw_spin_unlock,
821a2ecb55c76a Marco Elver 2025-01-23   80  		     raw_spin_trylock,
821a2ecb55c76a Marco Elver 2025-01-23   81  		     TEST_OP_RW);
821a2ecb55c76a Marco Elver 2025-01-23   82  static void __used test_raw_spinlock_trylock_extra(struct test_raw_spinlock_data *d)
821a2ecb55c76a Marco Elver 2025-01-23   83  {
821a2ecb55c76a Marco Elver 2025-01-23   84  	unsigned long flags;
821a2ecb55c76a Marco Elver 2025-01-23   85  
821a2ecb55c76a Marco Elver 2025-01-23   86  	if (raw_spin_trylock_irq(&d->lock)) {
821a2ecb55c76a Marco Elver 2025-01-23   87  		d->counter++;
821a2ecb55c76a Marco Elver 2025-01-23   88  		raw_spin_unlock_irq(&d->lock);
821a2ecb55c76a Marco Elver 2025-01-23   89  	}
821a2ecb55c76a Marco Elver 2025-01-23  @90  	if (raw_spin_trylock_irqsave(&d->lock, flags)) {
821a2ecb55c76a Marco Elver 2025-01-23   91  		d->counter++;
821a2ecb55c76a Marco Elver 2025-01-23   92  		raw_spin_unlock_irqrestore(&d->lock, flags);
821a2ecb55c76a Marco Elver 2025-01-23   93  	}
821a2ecb55c76a Marco Elver 2025-01-23   94  	scoped_cond_guard(raw_spinlock_try, return, &d->lock) {
821a2ecb55c76a Marco Elver 2025-01-23   95  		d->counter++;
821a2ecb55c76a Marco Elver 2025-01-23   96  	}
821a2ecb55c76a Marco Elver 2025-01-23   97  }
821a2ecb55c76a Marco Elver 2025-01-23   98  
821a2ecb55c76a Marco Elver 2025-01-23   99  TEST_SPINLOCK_COMMON(spinlock,
821a2ecb55c76a Marco Elver 2025-01-23  100  		     spinlock_t,
821a2ecb55c76a Marco Elver 2025-01-23  101  		     spin_lock_init,
821a2ecb55c76a Marco Elver 2025-01-23  102  		     spin_lock,
821a2ecb55c76a Marco Elver 2025-01-23  103  		     spin_unlock,
821a2ecb55c76a Marco Elver 2025-01-23  104  		     spin_trylock,
821a2ecb55c76a Marco Elver 2025-01-23  105  		     TEST_OP_RW);
821a2ecb55c76a Marco Elver 2025-01-23  106  static void __used test_spinlock_trylock_extra(struct test_spinlock_data *d)
821a2ecb55c76a Marco Elver 2025-01-23  107  {
821a2ecb55c76a Marco Elver 2025-01-23  108  	unsigned long flags;
821a2ecb55c76a Marco Elver 2025-01-23  109  
821a2ecb55c76a Marco Elver 2025-01-23  110  	if (spin_trylock_irq(&d->lock)) {
821a2ecb55c76a Marco Elver 2025-01-23  111  		d->counter++;
821a2ecb55c76a Marco Elver 2025-01-23  112  		spin_unlock_irq(&d->lock);
821a2ecb55c76a Marco Elver 2025-01-23  113  	}
821a2ecb55c76a Marco Elver 2025-01-23 @114  	if (spin_trylock_irqsave(&d->lock, flags)) {
821a2ecb55c76a Marco Elver 2025-01-23  115  		d->counter++;
821a2ecb55c76a Marco Elver 2025-01-23  116  		spin_unlock_irqrestore(&d->lock, flags);
821a2ecb55c76a Marco Elver 2025-01-23  117  	}
821a2ecb55c76a Marco Elver 2025-01-23  118  	scoped_cond_guard(spinlock_try, return, &d->lock) {
821a2ecb55c76a Marco Elver 2025-01-23  119  		d->counter++;
821a2ecb55c76a Marco Elver 2025-01-23  120  	}
821a2ecb55c76a Marco Elver 2025-01-23  121  }
821a2ecb55c76a Marco Elver 2025-01-23  122  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
