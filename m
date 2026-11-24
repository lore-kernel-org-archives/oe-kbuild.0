Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795498826;
	b=onpXtm6NZOAnR2FlD8VXQaZu47fN6sKs1fvPw4VBhMv8nFWbCBD5h6Rni5tJRAkJIGZF
	 QnrYUu/Yp9yvwaGUDEwBVzW6aZabWIxvDl4hSDtN4W+AjWR1sWzioLRsYpmNoVtcRaDnI
	 QsozXEeqKBk2NEfre8r8LXjs1JOnxtybxfgV6ueNBrtOfqWBQs+U4z3Jpna+gXFfCu9LH
	 Zf62p7Bm/neCUBwKDKstUpONvi+omDgt7LCPMuRl8ico/0W69EN/R+xXMe1SC52xrbzt8
	 DIh5JDtt83NBYyeGwKqIN8azKebFN2pLFlfa0MiQ8kUl8nYmLSkudjHZTD3XZrZHBlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795498826;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=A8Q09a4dES6QQ5TG8UKgsKYYXz+8dnpoMSRQXu99C/s=;
	b=FMm+DUaiYebzMR0zQExo6NXWmXPm0ydbhAgcsgSpaNQRqsCdLehGaqgseQeSKbmvUcc+
	 dzZYLhmL1D3hTZ8VwMGyiYduDZjMJP57SwcvkHHuOVMUtPB4BvlYB5y1EMASF6RBgzKRS
	 QGR82tTdF6LqxUXs3ODcnxWTei6wojYfl1XeLpbl7irJ/dAxNz0Syb5k3RLd729NOZ0ty
	 5/SYDqKb1m8UTUrMnPTDfXlx3xL24sI1uugvlYq08B8nypImab/nKlcDE0ek7eCQYINv6
	 VTD0vHpqllJIlUMgr1Ku0HNKhC4TOVaROxzMvss5WnufK7F6KzUzUxJSqdquxW3s3EQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vhy65RO1;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5FF5606A321
	for <oe-kbuild@lists.linux.dev>; Tue, 24 Nov 2026 05:40:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5FF5606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vhy65RO1
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so31193965e9.2
        for <oe-kbuild@lists.linux.dev>; Mon, 23 Nov 2026 21:40:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795498824; x=1796103624; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A8Q09a4dES6QQ5TG8UKgsKYYXz+8dnpoMSRQXu99C/s=;
        b=vhy65RO1vsF5W2zga3GgIdPAEIaDa9wtpKNNg2m54GDVxl9R+dmVyGy5S7MDhvk43z
         6kC/4GJf3s4WSnYtPuTz0PI/4fbakEVjxtKViLdO2F/0Wzf1D25GZgQr9pAdYGtfMnr6
         TvrRXmZroX0p2ncw5B9w+SKrmUrchd+kNOkZPq8AjQCmVsazVs2I3DLRWRCqNyj3GoYC
         eH/T94ilzhMgNDwSWwT+HlyXRXI5vgcYcPXRjfYc9Xle1db5MnfHkcm/gIaE5mBcjYZE
         yntCnHJvDtyxBa3Mq8oYgZGKKU8oTQGjakT0Fef4rdM1TKjTMWrMLBBox2MxYUZkFqIw
         lSbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795498824; x=1796103624;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A8Q09a4dES6QQ5TG8UKgsKYYXz+8dnpoMSRQXu99C/s=;
        b=rgzN1a685WIkDeagbROP9LI1/8nv5x6HrnvCG0buqW9al6kE27CHIxL1fzXP9QDCKe
         PZz9UbujMkCvV9VOyQvkTa8OjIV7lNZu6KW6vcclTK74qh+e3IaS7D+kxwlX3rz8NcFS
         xHkqpFE7PxnvQk6H8U0n45vPYNLqRPy3J5q37ipFBeA7R6Itm9fJb55c05x0Q+AoxNet
         vqOMDyZRlF9b4mWjMGk9f1xy+zq95uJpW/V9oVDRlUbog1jckcKbgD59AUP2FVH8SOTg
         xlJxH/lglb0cPB4GxHjNgW668CLqQekhquIzMddNR5fGoQhpuEihiot0tGbrWVoTL4CK
         upLA==
X-Gm-Message-State: APuU4Z/dT62pnhAsq2JEynbYrm9jhMKQMXZ+Tb56Dct6RiChesueGImx
	mG00dZWFvLSGaww4SJwmoyYnbYa3TmKHOy0OMNYaKCgL3h/ZY4OrME+WCra4BhKMXuvm2gns
X-Gm-Gg: AZFdTZfdEIG9za1W+LwNg4kg64FsABqHYTAFxXqIVHdd7isqwfb36S+j/XKU49jEefk
	q80LNPb1c9qdyjeO2aeKyCrZAxeppHX8Kq0e4NuYz/5DFUcUzjlLd1FRku8UYhWagLmphV9ieqF
	w6tV0rB2aoxjLPT+08BCyKiU3qGF54PMgz7nUJt8MyNZKiGBLSBK6KNtOc48fMpN/sD8iJHNGGe
	AB199V9wST9Bg2FbfqiYnVGRgsxfyjSnhS6fY9OO+eDF67ura656I7NJeRy6EKNDUbJQlIDzLGT
	h1dR0UzvPJa1sTfojDIg8IdDuGKEuO1Jw1l2lb0ItL9cnYReqGTu9np7n5uIVeHd1Y3Rv3HaN4C
	nwVX2xZEK1HAbMN2zaa4SNmEypLLeGGlW/JYxYpiLqkesMRDRCfXExz1EPyedR8lNTWDto8o37O
	EGtIjnGw/7hS09m99zSWdAZ65jlN/PaE+e2nWnA2NPwGvENrUKZHg76DLNYZOQrpEq04JWjgDR4
	JFyyNdaKHZ5ij//zZS0DJWapQqsp4aXbzHFmPk6zFqzQU0Pxj8Hv9XP0l1matlOf1W1DUgpUYPa
	YLhElwMiC8Gzo0wQtbKt4DBpnUa9mMLxxQzf5Dn+hBApzGRpS/PVtFKPihdePkYG550zgY7QN5A
	KWHUU19DH0/3XJCwMZwP2A0DQo5YBrgnuW4eHUE23V8dEBxIa/COGqRvfdpzRIoZNHSg=
X-Received: by 2002:a05:600c:64c6:b0:4bb:6a75:d04f with SMTP id 5b1f17b1804b1-4bb88807d96mr263479525e9.8.1795498824066;
        Mon, 23 Nov 2026 21:40:24 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85399d52sm395386355e9.6.2026.11.23.21.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 21:40:23 -0800 (PST)
Date: Tue, 24 Nov 2026 08:40:20 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev,
	Vikram Singh <vikram.singh3@oss.qualcomm.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Anup Patel <anup@brainfault.org>,
	Rajnesh Kanwal <rajnesh.kanwal49@gmail.com>
Subject: [avpatel:riscv_sbi_watchdog_v3 118/122] drivers/perf/riscv_ctr.c:435
 riscv_pmu_ctr_sched_task() warn: variable dereferenced before check
 'pmu_ctx' (see line 427)
Message-ID: <20261122185842.ByS8sFyu-lkp@intel.com>
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20261124054020.yFGU7LeANgHkuA6t1xasRkdbbeg62VtrTsSRYwpRv7A@z>

tree:   https://github.com/avpatel/linux.git riscv_sbi_watchdog_v3
head:   e16e3a60fbbf3fa3da230a7151235d2e7aac1066
commit: 9a740a6a4e590a1cc20dc8aa7d80a73171ba6229 [118/122] riscv: pmu: Add driver for Control Transfer Records Ext
config: riscv-randconfig-2200-20261122 (https://download.01.org/0day-ci/archive/20261122/20261122185842.ByS8sFyu-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/20261122185842.ByS8sFyu-lkp@intel.com/

smatch warnings:
drivers/perf/riscv_ctr.c:435 riscv_pmu_ctr_sched_task() warn: variable dereferenced before check 'pmu_ctx' (see line 427)

vim +/pmu_ctx +435 drivers/perf/riscv_ctr.c

9a740a6a4e590a Vikram Singh 2026-11-18  424  void riscv_pmu_ctr_sched_task(struct perf_event_pmu_context *pmu_ctx, struct task_struct *task,
9a740a6a4e590a Vikram Singh 2026-11-18  425  			      bool sched_in)
9a740a6a4e590a Vikram Singh 2026-11-18  426  {
9a740a6a4e590a Vikram Singh 2026-11-18 @427  	struct riscv_pmu *rvpmu = to_riscv_pmu(pmu_ctx->pmu);
                                                                                       ^^^^^^^^^^^^
Dereference

9a740a6a4e590a Vikram Singh 2026-11-18  428  	struct cpu_hw_events *cpuc = this_cpu_ptr(rvpmu->hw_events);
9a740a6a4e590a Vikram Singh 2026-11-18  429  	void *task_ctx;
9a740a6a4e590a Vikram Singh 2026-11-18  430  
9a740a6a4e590a Vikram Singh 2026-11-18  431  	if (!cpuc->ctr_users)
9a740a6a4e590a Vikram Singh 2026-11-18  432  		return;
9a740a6a4e590a Vikram Singh 2026-11-18  433  
9a740a6a4e590a Vikram Singh 2026-11-18  434  	/* Save branch records in task_ctx on sched out */
9a740a6a4e590a Vikram Singh 2026-11-18 @435  	task_ctx = pmu_ctx ? task->perf_ctx_data : NULL;
                                                           ^^^^^^^
Checked too late.

9a740a6a4e590a Vikram Singh 2026-11-18  436  	if (task_ctx) {
9a740a6a4e590a Vikram Singh 2026-11-18  437  		if (sched_in)
9a740a6a4e590a Vikram Singh 2026-11-18  438  			riscv_pmu_ctr_restore(task_ctx);
9a740a6a4e590a Vikram Singh 2026-11-18  439  		else
9a740a6a4e590a Vikram Singh 2026-11-18  440  			riscv_pmu_ctr_save(task_ctx, rvpmu->ctr_depth);
9a740a6a4e590a Vikram Singh 2026-11-18  441  		return;
9a740a6a4e590a Vikram Singh 2026-11-18  442  	}
9a740a6a4e590a Vikram Singh 2026-11-18  443  
9a740a6a4e590a Vikram Singh 2026-11-18  444  	/* Reset branch records on sched in */
9a740a6a4e590a Vikram Singh 2026-11-18  445  	if (sched_in)
9a740a6a4e590a Vikram Singh 2026-11-18  446  		riscv_pmu_ctr_reset();
9a740a6a4e590a Vikram Singh 2026-11-18  447  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

