Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3779238166
	for <oe-kbuild@lists.linux.dev>; Mon,  2 Feb 2026 09:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770023720; cv=none; b=ii2FNp3376fbhwTSMrgQmFBh2KEx5c7caBD83I9oHKacPhA+M+IunxUInfkYS1vbOFkPHiKiN92vwJV+MJgS8p3O2HClmUGwAJZ1TNMAHFsyohgDz6dKFuebvXTQwpPocCHhfFnKrZFRNkCAqRPIB9mNctEX3ntSXJytJZB1Tz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770023720; c=relaxed/simple;
	bh=oCgXpI2MucJ6uycnjqvDIXXh50gaZ0qQedrWeVNOucs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Sr6lcYpRK1UdTkUideGBYbFdcwKXi71lzeN7GAJRJ2j28UGSKZTBCU+p9MHDZj30rUBSFZNiG0t1/8USZHCME7Dkas6TgPv3lkAfbDBGnOsmFlgFxJC0Eh6Fkt0BNVHPePb0cM2tPAGBKj8q3SzYA5n5WTq1r9DIrgOLTOEC6ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W26VJwpQ; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W26VJwpQ"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-482f2599980so12811895e9.0
        for <oe-kbuild@lists.linux.dev>; Mon, 02 Feb 2026 01:15:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770023716; x=1770628516; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0VxT5WdxL72GGauKTl1EPnUwAVKDysEqE8T8RoyWVZg=;
        b=W26VJwpQq0OhxN8g/Sr8UaTnnTyOWLTlvtiAvwLpAjCE9c9SwvAWQNYaO/xpAHKXsY
         gdezu0pbshIUVL6sthatipIzZl8Jqza5NyT6GBRW3URFYFUHty0iENAqVWUs9vopMd1R
         rvnBmMEdVTMZUCdVmTJW07XL4QkZ+TDgzeEg1oCr/EbcXn7k2moQu3E6ErrGfxxaoye7
         WoZT2d8KleE7YMxFu/KxH957uG1xC9S47qAwskms2kjZbwa0uu9OAsuOXVyZTm361IjU
         EvJBb+g8yfHk4IGwliDskrkVbBZX47Zk5TwpbCkz6U9AseV8lnDlZ4alwWdxfLg7n2mf
         HudQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770023716; x=1770628516;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0VxT5WdxL72GGauKTl1EPnUwAVKDysEqE8T8RoyWVZg=;
        b=PsyeyidFV9CPf6BlZNraON0c3NxZzEU2Y87E7U84J9LSR7jLEu0LJv37BttWOnNpHl
         kMFeZBeZ+AQG46SkaDu7UlpsLY6/vuRbbxlo9bBkO5AZF8xo90BORSvengLZRSe8/Buw
         ECAluFnLznIF8YyZg48KzQi8vmxngSJHsEpOwcO8tJ3babxF5bD+gwTlNjCwoAbLAXw6
         PB5iwI26o2fADEuxCZQf1ZQifbhD9EBVvlfkQfl0LSFx4kziRDJQp59MTv7ry9fhQ17f
         hrD6KdYkL5JMXggdw8o0rFCPxwK1YTeMN3lewjHpZH1QR89l8i2CyKa8NvI5vStAxiGQ
         SuPQ==
X-Gm-Message-State: AOJu0YwMBasMUa2lmQgl2/+ZBH0EdzcB8fi63nIb8p2J6k0DtmgTr3hs
	duZGJ1lv1bNcs68PzJYfb5qur+8dBmUikhuS9qW5FAnSoWcAnEvwjawFMrcSIB9Bsi8+1ES5lMd
	UjC8y
X-Gm-Gg: AZuq6aI9LrLDXfQgbDzbUyg2Jur38ODfQs4uQBDQmV40+yiasNe36CFL0Udt0Ug80sK
	U/X56DZ1c/VIJCvEXI/A0yf7Yyp0vwPqPJzhUL2WPnGFXuB1ID8k13eJuanGibJ83iRRRjScSLt
	826DX5k+gJxjub5F/0ULcFP/hzHvO2dTZnM9LjWbyZYmJQGzfrtZWr4t1mGBxnthZi80xL37eEr
	b4OBpNJkmqsSkNF7MDB3iPcQ1Zr0XEurcaxNw5ZQVQNs6Ln4rKQgd4LXZCGt7npnVMhdTdNsjrz
	0p15Uw4MrHPeV+cYODNTX/mMjmthdJTZan/PulAFT5ejYCoimqqSteCVkqMGkduyQIvMJns9jX6
	RNF9CqRemTR3/wUjq1GueohcsuT+8r2LBrIaW2I+HY/jF0tZS51Y64wwWP/CevqP0b8od5DkiV9
	KZoQkjKhxx7kxBAery
X-Received: by 2002:a05:600c:474f:b0:477:98f7:2aec with SMTP id 5b1f17b1804b1-482db4592e4mr156298125e9.3.1770023715933;
        Mon, 02 Feb 2026 01:15:15 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806cdd79c7sm399149035e9.2.2026.02.02.01.15.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 01:15:15 -0800 (PST)
Date: Mon, 2 Feb 2026 12:15:12 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>, Damien Le Moal <dlemoal@kernel.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>
Subject: kernel/trace/blktrace.c:664 blk_trace_setup() error: strcpy()
 'buts2.name' too large for 'buts.name' (64 vs 32)
Message-ID: <202602020718.GUEIRyG9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260202091512.ihSHCoBGkq7dRF5M0-e3GV3edimDaqvCSfWCWdIKzww@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   18f7fcd5e69a04df57b563360b88be72471d6b62
commit: 113cbd62824afdf62d2f3f092809cf37cc7f1dd8 blktrace: pass blk_user_trace2 to setup functions
date:   3 months ago
config: s390-randconfig-r073-20260202 (https://download.01.org/0day-ci/archive/20260202/202602020718.GUEIRyG9-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202602020718.GUEIRyG9-lkp@intel.com/

smatch warnings:
kernel/trace/blktrace.c:664 blk_trace_setup() error: strcpy() 'buts2.name' too large for 'buts.name' (64 vs 32)

vim +664 kernel/trace/blktrace.c

b769a2f409e7a3 kernel/trace/blktrace.c Ming Lei           2024-11-28  631  int blk_trace_setup(struct request_queue *q, char *name, dev_t dev,
b769a2f409e7a3 kernel/trace/blktrace.c Ming Lei           2024-11-28  632  		    struct block_device *bdev,
b769a2f409e7a3 kernel/trace/blktrace.c Ming Lei           2024-11-28  633  		    char __user *arg)
171044d449611c block/blktrace.c        Arnd Bergmann      2007-10-09  634  {
113cbd62824afd kernel/trace/blktrace.c Johannes Thumshirn 2025-10-22  635  	struct blk_user_trace_setup2 buts2;
171044d449611c block/blktrace.c        Arnd Bergmann      2007-10-09  636  	struct blk_user_trace_setup buts;
42da88a724d8a3 kernel/trace/blktrace.c Johannes Thumshirn 2025-10-22  637  	struct blk_trace *bt;
171044d449611c block/blktrace.c        Arnd Bergmann      2007-10-09  638  	int ret;
171044d449611c block/blktrace.c        Arnd Bergmann      2007-10-09  639  
171044d449611c block/blktrace.c        Arnd Bergmann      2007-10-09  640  	ret = copy_from_user(&buts, arg, sizeof(buts));
171044d449611c block/blktrace.c        Arnd Bergmann      2007-10-09  641  	if (ret)
171044d449611c block/blktrace.c        Arnd Bergmann      2007-10-09  642  		return -EFAULT;
171044d449611c block/blktrace.c        Arnd Bergmann      2007-10-09  643  
42da88a724d8a3 kernel/trace/blktrace.c Johannes Thumshirn 2025-10-22  644  	if (!buts.buf_size || !buts.buf_nr)
42da88a724d8a3 kernel/trace/blktrace.c Johannes Thumshirn 2025-10-22  645  		return -EINVAL;
42da88a724d8a3 kernel/trace/blktrace.c Johannes Thumshirn 2025-10-22  646  
113cbd62824afd kernel/trace/blktrace.c Johannes Thumshirn 2025-10-22  647  	buts2 = (struct blk_user_trace_setup2) {
113cbd62824afd kernel/trace/blktrace.c Johannes Thumshirn 2025-10-22  648  		.act_mask = buts.act_mask,
113cbd62824afd kernel/trace/blktrace.c Johannes Thumshirn 2025-10-22  649  		.buf_size = buts.buf_size,
113cbd62824afd kernel/trace/blktrace.c Johannes Thumshirn 2025-10-22  650  		.buf_nr = buts.buf_nr,
113cbd62824afd kernel/trace/blktrace.c Johannes Thumshirn 2025-10-22  651  		.start_lba = buts.start_lba,
113cbd62824afd kernel/trace/blktrace.c Johannes Thumshirn 2025-10-22  652  		.end_lba = buts.end_lba,
113cbd62824afd kernel/trace/blktrace.c Johannes Thumshirn 2025-10-22  653  		.pid = buts.pid,
113cbd62824afd kernel/trace/blktrace.c Johannes Thumshirn 2025-10-22  654  	};
113cbd62824afd kernel/trace/blktrace.c Johannes Thumshirn 2025-10-22  655  
b769a2f409e7a3 kernel/trace/blktrace.c Ming Lei           2024-11-28  656  	mutex_lock(&q->debugfs_mutex);
42da88a724d8a3 kernel/trace/blktrace.c Johannes Thumshirn 2025-10-22  657  	bt = blk_trace_setup_prepare(q, name, dev, buts.buf_size, buts.buf_nr,
42da88a724d8a3 kernel/trace/blktrace.c Johannes Thumshirn 2025-10-22  658  				     bdev);
42da88a724d8a3 kernel/trace/blktrace.c Johannes Thumshirn 2025-10-22  659  	if (IS_ERR(bt)) {
42da88a724d8a3 kernel/trace/blktrace.c Johannes Thumshirn 2025-10-22  660  		mutex_unlock(&q->debugfs_mutex);
42da88a724d8a3 kernel/trace/blktrace.c Johannes Thumshirn 2025-10-22  661  		return PTR_ERR(bt);
42da88a724d8a3 kernel/trace/blktrace.c Johannes Thumshirn 2025-10-22  662  	}
113cbd62824afd kernel/trace/blktrace.c Johannes Thumshirn 2025-10-22  663  	blk_trace_setup_finalize(q, name, 1, bt, &buts2);
113cbd62824afd kernel/trace/blktrace.c Johannes Thumshirn 2025-10-22 @664  	strcpy(buts.name, buts2.name);

BLKTRACE_BDEV_SIZE2 is 64. BLKTRACE_BDEV_SIZE is 32.  The kbuild bot
doesn't have cross function analsys, but in linux-next the callers
only pass BLKTRACE_BDEV_SIZE size strings.

b769a2f409e7a3 kernel/trace/blktrace.c Ming Lei           2024-11-28  665  	mutex_unlock(&q->debugfs_mutex);
171044d449611c block/blktrace.c        Arnd Bergmann      2007-10-09  666  
9a8c28c8311e30 kernel/trace/blktrace.c Dmitry Monakhov    2010-02-27  667  	if (copy_to_user(arg, &buts, sizeof(buts))) {
b769a2f409e7a3 kernel/trace/blktrace.c Ming Lei           2024-11-28  668  		blk_trace_remove(q);
171044d449611c block/blktrace.c        Arnd Bergmann      2007-10-09  669  		return -EFAULT;
9a8c28c8311e30 kernel/trace/blktrace.c Dmitry Monakhov    2010-02-27  670  	}
171044d449611c block/blktrace.c        Arnd Bergmann      2007-10-09  671  	return 0;
1f2cac107c591c kernel/trace/blktrace.c Jens Axboe         2017-11-05  672  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

