Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C2CC2571B0
	for <oe-kbuild@lists.linux.dev>; Mon, 19 Jan 2026 06:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768802767; cv=none; b=KIuJy7xeYGW12VvZEd9LbScB3HW/rz89cqzUCQQsiYyqPj7A384fghBSOW2/0YknMhPKYXvwoopwcUa20ohLUwkxI3vXfPfaURl7DRbaC6K68R+E0r0ueC6N6Ai71xf3DnxmV14eivnypu8PKHrEJ87YjiXmgWa2hrLMT3/QmEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768802767; c=relaxed/simple;
	bh=Va+j/Rk5qSJtHCpN3cszMvliYyV0sBG/ueXgguHxN58=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t3dhele5ldQn5T52lzSjDuUtNpRZB5DQFfJT0EXVEfXwhGGkx1ODTxJuo2UzJsvUOngiJzCDgPHs1ohBEZaP6AzgX/7qMd3jM+1cN8EPXtm+AAPvCzMrrnODjQ6cmIXe577A+WFccSxjMp7hzSZ9QpXx4/bpZPcOfYqJZRxdYSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=R9HTksiQ; arc=none smtp.client-ip=209.85.221.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R9HTksiQ"
Received: by mail-wr1-f66.google.com with SMTP id ffacd0b85a97d-4308d81fdf6so2085973f8f.2
        for <oe-kbuild@lists.linux.dev>; Sun, 18 Jan 2026 22:06:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768802762; x=1769407562; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0pj6czBHbSzW+xAkGFcXRLhl7BE4LY0QgQrNyTPQC+4=;
        b=R9HTksiQjrdZnUlXv6xAHZ2D2qDhckoWvBbcRaGmBgrApjaO3b8RS11aJiVcdQYbB8
         gGN8m6QXXHXxYDeZzohXTWQVDtb6QeZfiLzhALVTSICGhEdTs0ju/HOuEWiHND6rN3Yb
         1ABLuGi/PgoD+kPlR698UK4KRwxL0ecgCGKeiM0lKL6U1vTNz0MPjCEF+1qovUTybWdx
         0XF1LvLm998epjkpFOwZUjftouZIx7NdBLiO0899RSbnCEEasvF6BZ8YGjLM/6/uLOFo
         XjuChXxjsMdy5a8iVCkRqJ6jtjYUCE4g2UEarePDVLTRDWmZQ0UMZZJtKVur2L8QsnUC
         o1hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768802762; x=1769407562;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0pj6czBHbSzW+xAkGFcXRLhl7BE4LY0QgQrNyTPQC+4=;
        b=S8lJDDbQpCM3CQp1Ta0nMP8p3/vWfsSHdRudIzqGsEZJjaZKfern566SQhC31SlZQ+
         cuMyQrYVtitFixFpLxhYcuhjZ0lfkeee3T0RLTs/Ee7dW0aXP1bCwot0FlrN6/xBt+Wx
         fYFVHI8mTMXcSPVIKJvjv51Ce8gWPRxHMoxsbyIq5e5RUNboC2Ellf8udxTVcLD347OM
         rIXycGnrM56loZTgl8foFZk6HPos0t2b3dNtKxkoY21SBq3Z4BPvTpL+QXHYUIA4cQJm
         4+JOzkrT38hAeqy+QoMllDjj8NHu0F430MoQyS+6p+8XGXEyyhy+g4Az+cQuqTST3LQW
         UgdA==
X-Gm-Message-State: AOJu0YwESSSO2UlOiyvwK/cHeHtAX8CSZifoKVkAcMMrHa2rZD3ldeGR
	Z8sPO745zqZ2v0MXi4cqEVtnC6vEZ25pBl3oH2xCbXX4ErCmbKU6xNDy6S/mAVTL5GDQJhln8uC
	2CWbD6aQ=
X-Gm-Gg: AY/fxX6Iq7kxVuR/xBNIS8qoUZNtPxzRfwP5DYN+dALI7CuUq4NUHqVQc1zGuGSuvxz
	ew4zCTFD1tSixi7gxQrVU/laprRA4j/hn1q4IJ2MFbqo4RO89vfc/325ixjZZ5ph62aLqi4OC6s
	lPViGnf3lgbJS5qz7ok+TRIcQHrsxuGTnpqSAccueevKFY4nnkiNaaPfPvJieaHXbgDwYryQV3w
	HiyEzrQeLVzShfJOVUjYwYyCJzpDlCTZF7hCA1SojAdhJWVOHM8BqVQxRe6h/kFB/U2HSxKrFTg
	Tdhi9SmGNrGSlQiyelaunhMab55/T/LsVstJFpl39vEZHivjEb6RS44Ch+NcF2n37RATLAykyKZ
	Ygd87wDSYxXVI30eTJZEqq25GQQYPLBilhDPGBeLjjrZXXTK2DNCkkGHxIb0T8GQcQUaw39J5Xl
	NnaMcuzcM/hqTmq7kg
X-Received: by 2002:a05:6000:2313:b0:432:5c43:76 with SMTP id ffacd0b85a97d-43569bc17ebmr12479480f8f.39.1768802762111;
        Sun, 18 Jan 2026 22:06:02 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435696fbea8sm21086791f8f.0.2026.01.18.22.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 22:06:01 -0800 (PST)
Date: Mon, 19 Jan 2026 09:05:58 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Mike Rapoport <rppt@kernel.org>
Subject: [rppt:uffd/refactor/v0.2 1/11] mm/userfaultfd.c:271
 mfill_copy_folio_locked() warn: maybe return -EFAULT instead of the bytes
 remaining?
Message-ID: <202601190828.nHc6Gmw1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260119060558.cRh9eGOYwb-ma-nY4IGXTOjthJxVQSsc06ZORRh6dUs@z>

Hi Mike,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git uffd/refactor/v0.2
head:   2db3a86a6de3247449e068d998305d26481c5522
commit: 46089d290ec3dea8bdbe9a706e3a8247f6c40490 [1/11] userfaultfd: introduce mfill_copy_folio_locked() helper
config: x86_64-randconfig-161-20260119 (https://download.01.org/0day-ci/archive/20260119/202601190828.nHc6Gmw1-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202601190828.nHc6Gmw1-lkp@intel.com/

smatch warnings:
mm/userfaultfd.c:271 mfill_copy_folio_locked() warn: maybe return -EFAULT instead of the bytes remaining?

vim +271 mm/userfaultfd.c

46089d290ec3dea Mike Rapoport (Microsoft  2026-01-08  241) static int mfill_copy_folio_locked(struct folio *folio, unsigned long src_addr)
c1a4de99fada21e Andrea Arcangeli          2015-09-04  242  {
07e6d4095c75bcf ZhangPeng                 2023-04-10  243  	void *kaddr;
c1a4de99fada21e Andrea Arcangeli          2015-09-04  244  	int ret;
c1a4de99fada21e Andrea Arcangeli          2015-09-04  245  
07e6d4095c75bcf ZhangPeng                 2023-04-10  246  	kaddr = kmap_local_folio(folio, 0);
5521de7dddd211e Ira Weiny                 2022-10-23  247  	/*
5521de7dddd211e Ira Weiny                 2022-10-23  248  	 * The read mmap_lock is held here.  Despite the
5521de7dddd211e Ira Weiny                 2022-10-23  249  	 * mmap_lock being read recursive a deadlock is still
5521de7dddd211e Ira Weiny                 2022-10-23  250  	 * possible if a writer has taken a lock.  For example:
5521de7dddd211e Ira Weiny                 2022-10-23  251  	 *
5521de7dddd211e Ira Weiny                 2022-10-23  252  	 * process A thread 1 takes read lock on own mmap_lock
5521de7dddd211e Ira Weiny                 2022-10-23  253  	 * process A thread 2 calls mmap, blocks taking write lock
5521de7dddd211e Ira Weiny                 2022-10-23  254  	 * process B thread 1 takes page fault, read lock on own mmap lock
5521de7dddd211e Ira Weiny                 2022-10-23  255  	 * process B thread 2 calls mmap, blocks taking write lock
5521de7dddd211e Ira Weiny                 2022-10-23  256  	 * process A thread 1 blocks taking read lock on process B
5521de7dddd211e Ira Weiny                 2022-10-23  257  	 * process B thread 1 blocks taking read lock on process A
5521de7dddd211e Ira Weiny                 2022-10-23  258  	 *
5521de7dddd211e Ira Weiny                 2022-10-23  259  	 * Disable page faults to prevent potential deadlock
5521de7dddd211e Ira Weiny                 2022-10-23  260  	 * and retry the copy outside the mmap_lock.
5521de7dddd211e Ira Weiny                 2022-10-23  261  	 */
5521de7dddd211e Ira Weiny                 2022-10-23  262  	pagefault_disable();
07e6d4095c75bcf ZhangPeng                 2023-04-10  263  	ret = copy_from_user(kaddr, (const void __user *) src_addr,
b6ebaedb4cb1a18 Andrea Arcangeli          2015-09-04  264  			     PAGE_SIZE);
5521de7dddd211e Ira Weiny                 2022-10-23  265  	pagefault_enable();
07e6d4095c75bcf ZhangPeng                 2023-04-10  266  	kunmap_local(kaddr);
b6ebaedb4cb1a18 Andrea Arcangeli          2015-09-04  267  
46089d290ec3dea Mike Rapoport (Microsoft  2026-01-08  268) 	if (!ret)
46089d290ec3dea Mike Rapoport (Microsoft  2026-01-08  269) 		flush_dcache_folio(folio);
46089d290ec3dea Mike Rapoport (Microsoft  2026-01-08  270) 
46089d290ec3dea Mike Rapoport (Microsoft  2026-01-08 @271) 	return ret;

It doesn't affect runtime but I think this was intended to be:

	return ret ? -EFAULT : 0;

46089d290ec3dea Mike Rapoport (Microsoft  2026-01-08  272) }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

