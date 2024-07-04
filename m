Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4646C1AED31
	for <oe-kbuild@lists.linux.dev>; Thu,  4 Jul 2024 15:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720106888; cv=none; b=YQ83/bd/wqNXuoTN/tMT5JQSK4GuY6/E5jKf1chP9hbK4QD1gJE+REGGhXHDwyIviMgLkUUyQB98vO5GIqBpqdhhg+dxY2A89aI6s4sszbHDv2sRmS2HUw7A2msn1wT8VwLfTdxaN405DCdaEN94bdamy4pGwDDKrRWkDVHR0Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720106888; c=relaxed/simple;
	bh=42tSfP4+zVU4qlY/UrhhzW600bt9nNsTQRFlndgZtfQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H+z7ioLSIi7dF4mG/ZvDzxXiaGOogpcpphwEU/WNE6rqq0gt8RGEgnLrz3jvLBzE3KKS+TWsMRjHL+yF7ilynSukLTmicFDeXDVvUxBzJ7eHvUWkLqFwc9Vi/ktcn3mBcq33AcDhk/pyN6wsxfatW3Zf+5wLMZ8j3wmqgJ0hm0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QYZT7YR7; arc=none smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QYZT7YR7"
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-25d634c5907so491495fac.2
        for <oe-kbuild@lists.linux.dev>; Thu, 04 Jul 2024 08:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720106886; x=1720711686; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nkqTOCcAmrHQUtVkl80LXFoBLOkmpmQyAeey+YgueLs=;
        b=QYZT7YR7zyFw97cNptFDBxQNACCgiPDybSkQrBRPA/SjpKSL+3J9RkD5KqN3M7Cosd
         99pdmEpbwn+eY1a0WpVEFJZpp3Q/STNbcHuKw6ncZSnAwsrye+GDuEOZ1UHGBksRXgHv
         puXSVYV4WL3/qtqdu35fvSJN0r3OL/YPKrzWzJuKQNQIrKRw8CMb6sZhmGSwOuyacYGB
         MXAzo7J8JDGOefCnaDRNM7yHCcpCDpWXQtSaY0gke2bZOzoCvxXANhVl6hGM5VSGUGza
         WnRAkTuosdeC5gl+PwnWQbTEoeytoLmsaZOQmoh+UTnMXvi0W8Ya/7MjUwakCjSE1tXf
         0hPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720106886; x=1720711686;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nkqTOCcAmrHQUtVkl80LXFoBLOkmpmQyAeey+YgueLs=;
        b=Iw4fKgdcPmsEejX+w/QumpSQ1HHG1AXUelhdYut08aFHVJrlpEUJthmI45FSgRtMsU
         VQqI6RGX9fqKkd/9Dt4mPoCO08pJFWopESy+rorcbMcQJ2ruBlGtdLZsKfIPbznk4KBf
         XiX39m2igBPMynwvamCSBfUFj6iEntDan7iATM8AMn/2aFFemqxmTXbe9VU1yLhwnYEI
         JUv2JdcZYEX/kCY5Y3xjo+CD/8QKX9uP+T4RY1YHVG4PXOPkfNjWcdKET6dly81xpbg0
         1DG/+0hMydaH7OkN2QFdpuTeTKyQRDHsTVFbAxmlOOIsq08ngr524sI+jfzdvlr2xk5C
         B2iA==
X-Gm-Message-State: AOJu0YyOz7K5DE8D+fvVZaBzK1ZMD+RWjQfkMGxMolPgcuLFjGwFLTT3
	sgptU4pSrcfjp2nh1/yqmirbk7e+1cENU53lkqup3u35SoBwis8ijeBOt77m4buozXNTGYv2bdi
	G
X-Google-Smtp-Source: AGHT+IGSilFKs5zRFsiikQs3JD5OeXpcRxNPFXRcds27W4hV8d6JkvckEGEBPKjU7pKTmvJ6fVvhLQ==
X-Received: by 2002:a05:6870:8a0a:b0:254:c777:6334 with SMTP id 586e51a60fabf-25e2beacbdemr1707025fac.42.1720106885967;
        Thu, 04 Jul 2024 08:28:05 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:45d:774f:47f7:bb6a])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-25dfef434d8sm1206377fac.7.2024.07.04.08.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 08:28:05 -0700 (PDT)
Date: Thu, 4 Jul 2024 17:28:03 +0200
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, "Paul E. McKenney" <paulmck@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [paulmckrcu:dev 42/49] kernel/smp.c:251 csd_lock_wait_toolong()
 warn: variable dereferenced before check 'nmessages' (see line 251)
Message-ID: <f713c613-0319-4aab-9301-af426282ec3f@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/paulmckrcu/linux dev
head:   98800981bc4f02066887d7f0bd41cb7070fbcc94
commit: feca218cf89f7ff46d90ac4e0bd126ecfc423fd2 [42/49] locking/csd-lock: Use backoff for repeated reports of same incident
config: x86_64-randconfig-161-20240704 (https://download.01.org/0day-ci/archive/20240704/202407042011.FX2T2Rea-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202407042011.FX2T2Rea-lkp@intel.com/

smatch warnings:
kernel/smp.c:251 csd_lock_wait_toolong() warn: variable dereferenced before check 'nmessages' (see line 251)

vim +/nmessages +251 kernel/smp.c

feca218cf89f7f Paul E. McKenney 2024-07-02  228  static bool csd_lock_wait_toolong(call_single_data_t *csd, u64 ts0, u64 *ts1, int *bug_id, unsigned long *nmessages)
35feb60474bf4f Paul E. McKenney 2020-06-30  229  {
35feb60474bf4f Paul E. McKenney 2020-06-30  230  	int cpu = -1;
35feb60474bf4f Paul E. McKenney 2020-06-30  231  	int cpux;
35feb60474bf4f Paul E. McKenney 2020-06-30  232  	bool firsttime;
35feb60474bf4f Paul E. McKenney 2020-06-30  233  	u64 ts2, ts_delta;
35feb60474bf4f Paul E. McKenney 2020-06-30  234  	call_single_data_t *cpu_cur_csd;
545b8c8df41f9e Peter Zijlstra   2020-06-15  235  	unsigned int flags = READ_ONCE(csd->node.u_flags);
3791a22374715b Paul E. McKenney 2022-02-28  236  	unsigned long long csd_lock_timeout_ns = csd_lock_timeout * NSEC_PER_MSEC;
35feb60474bf4f Paul E. McKenney 2020-06-30  237  
35feb60474bf4f Paul E. McKenney 2020-06-30  238  	if (!(flags & CSD_FLAG_LOCK)) {
35feb60474bf4f Paul E. McKenney 2020-06-30  239  		if (!unlikely(*bug_id))
35feb60474bf4f Paul E. McKenney 2020-06-30  240  			return true;
35feb60474bf4f Paul E. McKenney 2020-06-30  241  		cpu = csd_lock_wait_getcpu(csd);
35feb60474bf4f Paul E. McKenney 2020-06-30  242  		pr_alert("csd: CSD lock (#%d) got unstuck on CPU#%02d, CPU#%02d released the lock.\n",
35feb60474bf4f Paul E. McKenney 2020-06-30  243  			 *bug_id, raw_smp_processor_id(), cpu);
24f4724edcdc91 Paul E. McKenney 2024-07-01  244  		atomic_dec(&n_csd_lock_stuck);
35feb60474bf4f Paul E. McKenney 2020-06-30  245  		return true;
35feb60474bf4f Paul E. McKenney 2020-06-30  246  	}
35feb60474bf4f Paul E. McKenney 2020-06-30  247  
35feb60474bf4f Paul E. McKenney 2020-06-30  248  	ts2 = sched_clock();
94b3f0b5af2c7a Rik van Riel     2023-08-21  249  	/* How long since we last checked for a stuck CSD lock.*/
35feb60474bf4f Paul E. McKenney 2020-06-30  250  	ts_delta = ts2 - *ts1;
feca218cf89f7f Paul E. McKenney 2024-07-02 @251  	if (likely(ts_delta <= csd_lock_timeout_ns * (*nmessages + 1) *
                                                                                                      ^^^^^^^^^^
Dereference

feca218cf89f7f Paul E. McKenney 2024-07-02  252  			       (!nmessages ? 1 : (ilog2(num_online_cpus()) / 2 + 1)) ||
                                                                                ^^^^^^^^^^
Checked too late

feca218cf89f7f Paul E. McKenney 2024-07-02  253  		   csd_lock_timeout_ns == 0))
35feb60474bf4f Paul E. McKenney 2020-06-30  254  		return false;
35feb60474bf4f Paul E. McKenney 2020-06-30  255  
35feb60474bf4f Paul E. McKenney 2020-06-30  256  	firsttime = !*bug_id;
35feb60474bf4f Paul E. McKenney 2020-06-30  257  	if (firsttime)
35feb60474bf4f Paul E. McKenney 2020-06-30  258  		*bug_id = atomic_inc_return(&csd_bug_count);
35feb60474bf4f Paul E. McKenney 2020-06-30  259  	cpu = csd_lock_wait_getcpu(csd);
35feb60474bf4f Paul E. McKenney 2020-06-30  260  	if (WARN_ONCE(cpu < 0 || cpu >= nr_cpu_ids, "%s: cpu = %d\n", __func__, cpu))
35feb60474bf4f Paul E. McKenney 2020-06-30  261  		cpux = 0;
35feb60474bf4f Paul E. McKenney 2020-06-30  262  	else
35feb60474bf4f Paul E. McKenney 2020-06-30  263  		cpux = cpu;
35feb60474bf4f Paul E. McKenney 2020-06-30  264  	cpu_cur_csd = smp_load_acquire(&per_cpu(cur_csd, cpux)); /* Before func and info. */
94b3f0b5af2c7a Rik van Riel     2023-08-21  265  	/* How long since this CSD lock was stuck. */
94b3f0b5af2c7a Rik van Riel     2023-08-21  266  	ts_delta = ts2 - ts0;
a0897399e4ce39 Paul E. McKenney 2024-07-01  267  	pr_alert("csd: %s non-responsive CSD lock (#%d) on CPU#%d, waiting %lld ns for CPU#%02d %pS(%ps).\n",
a0897399e4ce39 Paul E. McKenney 2024-07-01  268  		 firsttime ? "Detected" : "Continued", *bug_id, raw_smp_processor_id(), (s64)ts_delta,
35feb60474bf4f Paul E. McKenney 2020-06-30  269  		 cpu, csd->func, csd->info);
feca218cf89f7f Paul E. McKenney 2024-07-02  270  	(*nmessages)++;
                                                         ^^^^^^^^^^

24f4724edcdc91 Paul E. McKenney 2024-07-01  271  	if (firsttime)
24f4724edcdc91 Paul E. McKenney 2024-07-01  272  		atomic_dec(&n_csd_lock_stuck);
94b3f0b5af2c7a Rik van Riel     2023-08-21  273  	/*
94b3f0b5af2c7a Rik van Riel     2023-08-21  274  	 * If the CSD lock is still stuck after 5 minutes, it is unlikely
94b3f0b5af2c7a Rik van Riel     2023-08-21  275  	 * to become unstuck. Use a signed comparison to avoid triggering
94b3f0b5af2c7a Rik van Riel     2023-08-21  276  	 * on underflows when the TSC is out of sync between sockets.
94b3f0b5af2c7a Rik van Riel     2023-08-21  277  	 */
94b3f0b5af2c7a Rik van Riel     2023-08-21  278  	BUG_ON(panic_on_ipistall > 0 && (s64)ts_delta > ((s64)panic_on_ipistall * NSEC_PER_MSEC));
35feb60474bf4f Paul E. McKenney 2020-06-30  279  	if (cpu_cur_csd && csd != cpu_cur_csd) {
35feb60474bf4f Paul E. McKenney 2020-06-30  280  		pr_alert("\tcsd: CSD lock (#%d) handling prior %pS(%ps) request.\n",
35feb60474bf4f Paul E. McKenney 2020-06-30  281  			 *bug_id, READ_ONCE(per_cpu(cur_csd_func, cpux)),
35feb60474bf4f Paul E. McKenney 2020-06-30  282  			 READ_ONCE(per_cpu(cur_csd_info, cpux)));
35feb60474bf4f Paul E. McKenney 2020-06-30  283  	} else {
35feb60474bf4f Paul E. McKenney 2020-06-30  284  		pr_alert("\tcsd: CSD lock (#%d) %s.\n",
35feb60474bf4f Paul E. McKenney 2020-06-30  285  			 *bug_id, !cpu_cur_csd ? "unresponsive" : "handling this request");
35feb60474bf4f Paul E. McKenney 2020-06-30  286  	}
35feb60474bf4f Paul E. McKenney 2020-06-30  287  	if (cpu >= 0) {
0d3a00b370424f Imran Khan       2023-05-09  288  		if (atomic_cmpxchg_acquire(&per_cpu(trigger_backtrace, cpu), 1, 0))
35feb60474bf4f Paul E. McKenney 2020-06-30  289  			dump_cpu_task(cpu);
35feb60474bf4f Paul E. McKenney 2020-06-30  290  		if (!cpu_cur_csd) {
35feb60474bf4f Paul E. McKenney 2020-06-30  291  			pr_alert("csd: Re-sending CSD lock (#%d) IPI from CPU#%02d to CPU#%02d\n", *bug_id, raw_smp_processor_id(), cpu);
35feb60474bf4f Paul E. McKenney 2020-06-30  292  			arch_send_call_function_single_ipi(cpu);
35feb60474bf4f Paul E. McKenney 2020-06-30  293  		}
35feb60474bf4f Paul E. McKenney 2020-06-30  294  	}
5bd00f6db012f7 Imran Khan       2023-05-09  295  	if (firsttime)
35feb60474bf4f Paul E. McKenney 2020-06-30  296  		dump_stack();
35feb60474bf4f Paul E. McKenney 2020-06-30  297  	*ts1 = ts2;
35feb60474bf4f Paul E. McKenney 2020-06-30  298  
35feb60474bf4f Paul E. McKenney 2020-06-30  299  	return false;
35feb60474bf4f Paul E. McKenney 2020-06-30  300  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

