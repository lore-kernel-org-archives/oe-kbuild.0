Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E8120FA9A
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Dec 2024 06:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733727280; cv=none; b=YdJnu/ZeW+UFZh9vRi+fk57EWtElVqDYRsQbMpoccxKvqkp1UFLFdQzljIAOLY7SEOU7tYTIAsbr/6ku0OnuO/yhrEhaMEjY4OHbxP4iA5sK3S5/6qF3lrwaSboYiMv7EnfzrM9/rGQ8rJoT0V2pwQ3wwQ+epWQ7Qo/mXgWScdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733727280; c=relaxed/simple;
	bh=RqUneqpUhmcrSoHGXpMo7Z8F82JswvQ1xbaMFu8kxRc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=smWj1GnsmsAqalDLVBHhSVgYOzFb+sgs9DdGn7SO3ax+xUQt1C/5+S26m3Yieuk1ozDmA4JF7GkD0U4L6I8lx5XFJrhOq5ZZhpT7F1J5bGV5CVTNjw5eRU93bIbjruyZdxCxrtdN0FXjw31urlHbj9c4BZFYJ24v+XWdFNrUDPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=O6n0O32m; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O6n0O32m"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-434f094c636so7174855e9.2
        for <oe-kbuild@lists.linux.dev>; Sun, 08 Dec 2024 22:54:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733727276; x=1734332076; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1XkYmMcglmPJPLj7yIBMaRqPFFNs7AsBNyFGLW7rqPA=;
        b=O6n0O32mC90j4H5WWGZDLUDn8U34uJPe+m/UyzRPFV93gJWmi15l4rDZNK8thW2ZR9
         pK4IJGExHTE1A08Rn/qku5L51ViQvrAYbDBOJPK11JN2geCr5Yzr4JrvogqP9S5RlL2h
         Z23qfRdwM4WQvxT6zIDy/xWVuNNlV9kwDeegCyoPiv21IYztGOXhqeAZBSw3ErwBwUlF
         37tbRXTh1jM1H4RpaGaqmlIW0miMI4qL95jCLkI2I8/njO4JjlwgTl5dUyuQBCHwNfpL
         03OdZXZsq4op1pA9C3Pii7OAM6FykCuoOewoG/VQACpKH/llxDuMPUvwRgL5tr4S0l55
         Icjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733727276; x=1734332076;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1XkYmMcglmPJPLj7yIBMaRqPFFNs7AsBNyFGLW7rqPA=;
        b=pxm49rhWAGDVPCbZXVkDnbPQ7mMjcJsl7g10qp6Eykm8vdqzGWQfyltqHh7bXwCdj5
         jZvdo9/XwMvz0ALciMme6Xo79C2kxRJ/vmAyZhP+dPnspkTUkaTV8Z/LL7Vt4lqXkHIW
         KrKPXL6nB7o4m/3nCY0GrazMILMje6EIzlN1AQEHq/TlkWSMSpEmwdqNxNK2jxX+JvmC
         t4hyfVvmJycgqtUjRzYJoMsCrN+ElRpr2Ja1f0B4Jxp2xlIqsjhA9XiOWQuDETQo+RjQ
         W6wJjfr+orGmAPed+z+Y9aeyEy7ubBGsjmV12mRbzNQctJYbMwGO0/Dfs3KRZh0FnTxl
         575Q==
X-Gm-Message-State: AOJu0YwtKIy4Uwkdm0swLHO0hJmj6oqN8W7knlkUZUazi8SJK27Ondo2
	LSLkfFIfyCezOXkzlT0dM3MbwrrwH8dymSXCy5Z+GCHEcjM71nM3w5qyhKzwqqWBLsnBuVCksxT
	G
X-Gm-Gg: ASbGnctYgNlUp+3y+rwalPhzew1K0lhjQihsoD5zFscSs+pdC2WstucNj2R523AyAkD
	hR14AbIonetAezrAZHBnHDKhXjP8U2sJqkikST9fjDn+QmyG+Q8lkOXhkXNknJpBbOjw/0maYNq
	T6vllhjbE0jZOHaJoDXdZ/CZlEDWtvbv45/k55cQppDa7jkGSeNDUVrveqFlAgZ1jDUz2z5/2rJ
	j4GGSNhYP9CZdEtWB1GfgahNQaFEEZ5U56I+7xAosN0TY/Cq3twzis=
X-Google-Smtp-Source: AGHT+IEqObb+yJVuKMo10u1GICUj6PlIqe4BQ2nSUX3aEAQCyQiZ5zXPlE4klQPttrFDLRgVLcapJA==
X-Received: by 2002:a05:6000:184d:b0:385:ef39:6cd5 with SMTP id ffacd0b85a97d-3862b33ef3dmr7644466f8f.1.1733727274905;
        Sun, 08 Dec 2024 22:54:34 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3862190966bsm12523537f8f.75.2024.12.08.22.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 22:54:34 -0800 (PST)
Date: Mon, 9 Dec 2024 09:54:30 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, kernel@openeuler.org,
	leoliu-oc <leoliu-oc@zhaoxin.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1590/1590] drivers/cpufreq/acpi-cpufreq.c:661
 get_max_boost_ratio() error: uninitialized symbol 'highest_perf'.
Message-ID: <3f07747f-0a5d-4b4c-8e14-ab6bc0c8d31b@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   330348879858de86a15cef38738cbf022633f403
commit: a5456c60ffb4f5d4147d8b8da36b81f729cac83b [1590/1590] cpufreq: ACPI: add ITMT support when CPPC enabled
config: x86_64-randconfig-161 (https://download.01.org/0day-ci/archive/20241208/202412080814.UU32PXsv-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202412080814.UU32PXsv-lkp@intel.com/

smatch warnings:
drivers/cpufreq/acpi-cpufreq.c:661 get_max_boost_ratio() error: uninitialized symbol 'highest_perf'.
drivers/cpufreq/acpi-cpufreq.c:661 get_max_boost_ratio() error: uninitialized symbol 'nominal_perf'.
drivers/cpufreq/acpi-cpufreq.c:689 cpufreq_set_itmt_prio() error: uninitialized symbol 'highest_perf'.

vim +/highest_perf +661 drivers/cpufreq/acpi-cpufreq.c

a5456c60ffb4f5 leoliu-oc         2024-07-10  652  static u64 get_max_boost_ratio(unsigned int cpu)
a5456c60ffb4f5 leoliu-oc         2024-07-10  653  {
a5456c60ffb4f5 leoliu-oc         2024-07-10  654  	u64 highest_perf, nominal_perf;
a5456c60ffb4f5 leoliu-oc         2024-07-10  655  
a5456c60ffb4f5 leoliu-oc         2024-07-10  656  	if (acpi_pstate_strict)
a5456c60ffb4f5 leoliu-oc         2024-07-10  657  		return 0;
a5456c60ffb4f5 leoliu-oc         2024-07-10  658  
a5456c60ffb4f5 leoliu-oc         2024-07-10  659  	cppc_get_highest_nominal_perf(cpu, &highest_perf, &nominal_perf);
3c55e94c0adea4 Rafael J. Wysocki 2021-02-04  660  
3c55e94c0adea4 Rafael J. Wysocki 2021-02-04 @661  	if (!highest_perf || !nominal_perf) {

I don't have context outside this email, but I guess that
cppc_get_highest_nominal_perf() must not initialize these on error.

3c55e94c0adea4 Rafael J. Wysocki 2021-02-04  662  		pr_debug("CPU%d: highest or nominal performance missing\n", cpu);
3c55e94c0adea4 Rafael J. Wysocki 2021-02-04  663  		return 0;
3c55e94c0adea4 Rafael J. Wysocki 2021-02-04  664  	}
3c55e94c0adea4 Rafael J. Wysocki 2021-02-04  665  
3c55e94c0adea4 Rafael J. Wysocki 2021-02-04  666  	if (highest_perf < nominal_perf) {
3c55e94c0adea4 Rafael J. Wysocki 2021-02-04  667  		pr_debug("CPU%d: nominal performance above highest\n", cpu);
3c55e94c0adea4 Rafael J. Wysocki 2021-02-04  668  		return 0;
3c55e94c0adea4 Rafael J. Wysocki 2021-02-04  669  	}
3c55e94c0adea4 Rafael J. Wysocki 2021-02-04  670  
3c55e94c0adea4 Rafael J. Wysocki 2021-02-04  671  	return div_u64(highest_perf << SCHED_CAPACITY_SHIFT, nominal_perf);
3c55e94c0adea4 Rafael J. Wysocki 2021-02-04  672  }
a5456c60ffb4f5 leoliu-oc         2024-07-10  673  
a5456c60ffb4f5 leoliu-oc         2024-07-10  674  /* The work item is needed to avoid CPU hotplug locking issues */
a5456c60ffb4f5 leoliu-oc         2024-07-10  675  static void cpufreq_sched_itmt_work_fn(struct work_struct *work)
a5456c60ffb4f5 leoliu-oc         2024-07-10  676  {
a5456c60ffb4f5 leoliu-oc         2024-07-10  677  	sched_set_itmt_support();
a5456c60ffb4f5 leoliu-oc         2024-07-10  678  }
a5456c60ffb4f5 leoliu-oc         2024-07-10  679  
a5456c60ffb4f5 leoliu-oc         2024-07-10  680  static DECLARE_WORK(sched_itmt_work, cpufreq_sched_itmt_work_fn);
a5456c60ffb4f5 leoliu-oc         2024-07-10  681  
a5456c60ffb4f5 leoliu-oc         2024-07-10  682  static void cpufreq_set_itmt_prio(int cpu)
a5456c60ffb4f5 leoliu-oc         2024-07-10  683  {
a5456c60ffb4f5 leoliu-oc         2024-07-10  684  	u64 highest_perf, nominal_perf;
a5456c60ffb4f5 leoliu-oc         2024-07-10  685  	static u64 max_highest_perf = 0, min_highest_perf = U64_MAX;
a5456c60ffb4f5 leoliu-oc         2024-07-10  686  
a5456c60ffb4f5 leoliu-oc         2024-07-10  687  	cppc_get_highest_nominal_perf(cpu, &highest_perf, &nominal_perf);
a5456c60ffb4f5 leoliu-oc         2024-07-10  688  
a5456c60ffb4f5 leoliu-oc         2024-07-10 @689  	sched_set_itmt_core_prio(highest_perf, cpu);
a5456c60ffb4f5 leoliu-oc         2024-07-10  690  	cpumask_set_cpu(cpu, &core_prior_mask);
a5456c60ffb4f5 leoliu-oc         2024-07-10  691  
a5456c60ffb4f5 leoliu-oc         2024-07-10  692  	if (max_highest_perf <= min_highest_perf) {
a5456c60ffb4f5 leoliu-oc         2024-07-10  693  		if (highest_perf > max_highest_perf)
a5456c60ffb4f5 leoliu-oc         2024-07-10  694  			max_highest_perf = highest_perf;
a5456c60ffb4f5 leoliu-oc         2024-07-10  695  
a5456c60ffb4f5 leoliu-oc         2024-07-10  696  		if (highest_perf < min_highest_perf)
a5456c60ffb4f5 leoliu-oc         2024-07-10  697  			min_highest_perf = highest_perf;
a5456c60ffb4f5 leoliu-oc         2024-07-10  698  
a5456c60ffb4f5 leoliu-oc         2024-07-10  699  		if (max_highest_perf > min_highest_perf) {
a5456c60ffb4f5 leoliu-oc         2024-07-10  700  			/*
a5456c60ffb4f5 leoliu-oc         2024-07-10  701  			 * This code can be run during CPU online under the
a5456c60ffb4f5 leoliu-oc         2024-07-10  702  			 * CPU hotplug locks, so sched_set_itmt_support()
a5456c60ffb4f5 leoliu-oc         2024-07-10  703  			 * cannot be called from here.  Queue up a work item
a5456c60ffb4f5 leoliu-oc         2024-07-10  704  			 * to invoke it.
a5456c60ffb4f5 leoliu-oc         2024-07-10  705  			 */
a5456c60ffb4f5 leoliu-oc         2024-07-10  706  			cppc_highest_perf_diff = true;
a5456c60ffb4f5 leoliu-oc         2024-07-10  707  		}
a5456c60ffb4f5 leoliu-oc         2024-07-10  708  	}
a5456c60ffb4f5 leoliu-oc         2024-07-10  709  
a5456c60ffb4f5 leoliu-oc         2024-07-10  710  	if (cppc_highest_perf_diff && cpumask_equal(&core_prior_mask, cpu_online_mask)) {
a5456c60ffb4f5 leoliu-oc         2024-07-10  711  		pr_debug("queue a work to set itmt enabled\n");
a5456c60ffb4f5 leoliu-oc         2024-07-10  712  		schedule_work(&sched_itmt_work);
a5456c60ffb4f5 leoliu-oc         2024-07-10  713  	}
a5456c60ffb4f5 leoliu-oc         2024-07-10  714  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

