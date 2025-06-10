Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5550128E560
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Jun 2025 11:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749555817; cv=none; b=lzTOp8VC+pTrKM5s9TG3/qULuv8Mi/B/N1UmW5yVxwe0XYTQqozwmASzVwiCILoyvL4pxiIMezxFQanIU0asXVVgv0HwHIWPxBzT6p8HMNvgWip0xuvkm+ew/b8L9HuHGmrO3RQr3/5lex8nla3PTzwXDqoBNQEAJhg5b28G5cE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749555817; c=relaxed/simple;
	bh=/X+Gedt1ytdZtZ6egGoIiL1CBUmaof3mZfgRNq77Uic=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NHnNDwdSbKA3LVbyYSFMAXFzhVFg1+sMcQWCPbfZOaeWCReTtwpb2+GzxCc9Lt9yceVCAKUNiXxMcHkhHI+1esH9cjEoIn7qwavf+fCCt2Me0C0s3ysc1z9cKcV3TPHVeWOVuBEdDEEjskg+BIEumtEtGa5T6npM0NPaa5kW3y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hx/iNbx+; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hx/iNbx+"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-450ccda1a6eso49905965e9.2
        for <oe-kbuild@lists.linux.dev>; Tue, 10 Jun 2025 04:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749555813; x=1750160613; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dqDUYsTKUWJXT9vXAyjQ11buUm9aI7ineD7DLVwclvQ=;
        b=hx/iNbx+zE6ZrYBOm8HButiGKChtvSmtImKE2+PdD94Y9Ca7Z++L0dmFLn6PGfeEqo
         4VMmimxLtEzW+n+M8TrOhw2cBXsPzGWPKWyp9DBHNnXe3KCSrjgEFv++8ebfALqzVD5Q
         RqLsNKTlrNjcry1QqiJSY7Qmx6fdQzVM5Mo8jHq1+Dl7sa3XxOtH8hJDvNqn0D16+ccg
         FiVw6KM7g4LHTI9F/tmW0CVJ920vFIhu0qwBl5XmMVvOnt4n5OhcJsIO9htktr/XKUxG
         0GwJnjIa4KUKcoaHiBr+sawv5r51Rfac+nXeOknWBOEipBPuWHS4qkb4OvVBkdRTS8g1
         vVFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749555813; x=1750160613;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dqDUYsTKUWJXT9vXAyjQ11buUm9aI7ineD7DLVwclvQ=;
        b=xCXEsCJvrzU/6xDgUZHjfvfPLlmyRn+BofzuMzCAjpmbo6J9z6c7koiYuymWivCI3Q
         COH8oF+md31p98hMUSy8OEu4OYHtsyLvBc1CpXOk8lR6ME8g30WotKSq+ceej8Bz7ytg
         ACcKfCKYvfNDGefsH3kuFRBZa2ff7HoTjt+hDL1q5JHLW/PvW6NUAsD0kalSgxUWG6JG
         eN7YtCm8Hfrr01vy/3LaxHpZ26M/NrY0jFBj6lJen4ZmaQb7tzJxCV//cXMc9JIm7si0
         8zAZrMXuLeCFufH2FGNSzd07GsHT2KGEA7rjWY7Ldwvw6meRNDKcHBUpjumqM5ZN84kp
         294A==
X-Gm-Message-State: AOJu0YxoIDOg8uQhTkuFZxuKOuyixOM5oYwogMxsKCjEHxcw7N3Aje/w
	w4AHOAoz80l+lI+ODR3MdVZPN6sNXcmMqS8XoLmXN6MynWkw4OP7M6x9bFa1A6rYRqE6Ocb5Pj+
	Vhz2m
X-Gm-Gg: ASbGncvMSrS8N90GamUmGI5ksnKju3z1CMPp+hulCZPEggNCOqy7njie8NtTk2SdtjL
	aRWl+ooR09MXdqnPlBlHEqhHbL5c54in12Aw/Upm0k8xqo2h9zVilgX3lAXd2pwgVntJOHvLiPi
	YWLDsfk4hAwLlmuhUDM7k0ZMP2z4flPIOoD+R3vS2c7ylVEmShyP95aj+z6b8O/148UA98c/kPU
	FfqOge20nvfAlDG6yJa8LIoQFzt+4Ok3tYb17h+JUKKOD3HMxZ379/ocvk1nl2Fn3lx8JxSezL3
	GOTtqH7l9aAFZVZs2OxJCobJN4vl8ZG+SNzBcbinCzqEe+fj4IV283k1S8XQQ7+55F2lSGIN0V8
	C4A==
X-Google-Smtp-Source: AGHT+IFCx4NnH7kBWyeogQdJEepew653EJ/9Jf3wSbZ2wWY1D2nYVd2/FiUz6IPlN6sq7QYTtZrq3w==
X-Received: by 2002:a05:600c:c4a8:b0:450:d01f:de6f with SMTP id 5b1f17b1804b1-4520147bd9bmr174531735e9.15.1749555813435;
        Tue, 10 Jun 2025 04:43:33 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45306b01d77sm90314725e9.31.2025.06.10.04.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 04:43:32 -0700 (PDT)
Date: Tue, 10 Jun 2025 14:43:28 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Yury Norov <yury.norov@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [norov:smp 4/4] kernel/smp.c:851 smp_call_function_many_cond() warn:
 maybe use && instead of &
Message-ID: <202506070933.1A1B6nRd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20250610114328.icV6QFOhAQjwuCvQu-6Q1obbSO1kamrKV-CYTQIcC3Y@z>

tree:   https://github.com/norov/linux smp
head:   c8a0154d1529978dcda3d5745f0f911432c74f3d
commit: c8a0154d1529978dcda3d5745f0f911432c74f3d [4/4] smp: defer check for local execution in smp_call_function_many_cond()
config: i386-randconfig-141-20250607 (https://download.01.org/0day-ci/archive/20250607/202506070933.1A1B6nRd-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202506070933.1A1B6nRd-lkp@intel.com/

smatch warnings:
kernel/smp.c:851 smp_call_function_many_cond() warn: maybe use && instead of &

vim +851 kernel/smp.c

67719ef25eeb20 Sebastian Andrzej Siewior 2020-01-17  772  static void smp_call_function_many_cond(const struct cpumask *mask,
67719ef25eeb20 Sebastian Andrzej Siewior 2020-01-17  773  					smp_call_func_t func, void *info,
a32a4d8a815c4e Nadav Amit                2021-02-20  774  					unsigned int scf_flags,
a32a4d8a815c4e Nadav Amit                2021-02-20  775  					smp_cond_func_t cond_func)
3d4422332711ef Jens Axboe                2008-06-26  776  {
a32a4d8a815c4e Nadav Amit                2021-02-20  777  	int cpu, last_cpu, this_cpu = smp_processor_id();
e1d12f327037a5 Andrew Morton             2013-04-30  778  	struct call_function_data *cfd;
a32a4d8a815c4e Nadav Amit                2021-02-20  779  	bool wait = scf_flags & SCF_WAIT;
bf5a8c26ad7caf Leonardo Bras             2023-06-15  780  	int nr_cpus = 0;
a32a4d8a815c4e Nadav Amit                2021-02-20  781  	bool run_remote = false;
a32a4d8a815c4e Nadav Amit                2021-02-20  782  
a32a4d8a815c4e Nadav Amit                2021-02-20  783  	lockdep_assert_preemption_disabled();
3d4422332711ef Jens Axboe                2008-06-26  784  
269c861baa2fe7 Suresh Siddha             2009-08-19  785  	/*
269c861baa2fe7 Suresh Siddha             2009-08-19  786  	 * Can deadlock when called with interrupts disabled.
269c861baa2fe7 Suresh Siddha             2009-08-19  787  	 * We allow cpu's that are not yet online though, as no one else can
269c861baa2fe7 Suresh Siddha             2009-08-19  788  	 * send smp call function interrupt to this cpu and as such deadlocks
269c861baa2fe7 Suresh Siddha             2009-08-19  789  	 * can't happen.
269c861baa2fe7 Suresh Siddha             2009-08-19  790  	 */
a32a4d8a815c4e Nadav Amit                2021-02-20  791  	if (cpu_online(this_cpu) && !oops_in_progress &&
a32a4d8a815c4e Nadav Amit                2021-02-20  792  	    !early_boot_irqs_disabled)
a32a4d8a815c4e Nadav Amit                2021-02-20  793  		lockdep_assert_irqs_enabled();
3d4422332711ef Jens Axboe                2008-06-26  794  
19dbdcb8039cff Peter Zijlstra            2019-07-18  795  	/*
19dbdcb8039cff Peter Zijlstra            2019-07-18  796  	 * When @wait we can deadlock when we interrupt between llist_add() and
19dbdcb8039cff Peter Zijlstra            2019-07-18  797  	 * arch_send_call_function_ipi*(); when !@wait we can deadlock due to
19dbdcb8039cff Peter Zijlstra            2019-07-18  798  	 * csd_lock() on because the interrupt context uses the same csd
19dbdcb8039cff Peter Zijlstra            2019-07-18  799  	 * storage.
19dbdcb8039cff Peter Zijlstra            2019-07-18  800  	 */
19dbdcb8039cff Peter Zijlstra            2019-07-18  801  	WARN_ON_ONCE(!in_task());
19dbdcb8039cff Peter Zijlstra            2019-07-18  802  
a32a4d8a815c4e Nadav Amit                2021-02-20  803  	/* Check if we need remote execution, i.e., any CPU excluding this one. */
22a0fd713a96eb Yury Norov [NVIDIA]       2025-06-06  804  	if (cpumask_any_and_but(mask, cpu_online_mask, this_cpu) < nr_cpu_ids) {
a32a4d8a815c4e Nadav Amit                2021-02-20  805  		run_remote = true;
bb964a92ce70ac Christoph Lameter         2014-08-17  806  		cfd = this_cpu_ptr(&cfd_data);
e1d12f327037a5 Andrew Morton             2013-04-30  807  		cpumask_and(cfd->cpumask, mask, cpu_online_mask);
6c8557bdb28df3 Peter Zijlstra            2017-05-19  808  		__cpumask_clear_cpu(this_cpu, cfd->cpumask);
723aae25d5cdb0 Milton Miller             2011-03-15  809  
3fc5b3b6a80b2e Aaron Lu                  2017-05-19  810  		cpumask_clear(cfd->cpumask_ipi);
e1d12f327037a5 Andrew Morton             2013-04-30  811  		for_each_cpu(cpu, cfd->cpumask) {
6366d062e7f974 Paul E. McKenney          2023-03-20  812  			call_single_data_t *csd = per_cpu_ptr(cfd->csd, cpu);
9a46ad6d6df3b5 Shaohua Li                2013-02-21  813  
5c3124975e15c1 Peter Zijlstra            2023-03-22  814  			if (cond_func && !cond_func(cpu, info)) {
5c3124975e15c1 Peter Zijlstra            2023-03-22  815  				__cpumask_clear_cpu(cpu, cfd->cpumask);
67719ef25eeb20 Sebastian Andrzej Siewior 2020-01-17  816  				continue;
5c3124975e15c1 Peter Zijlstra            2023-03-22  817  			}
67719ef25eeb20 Sebastian Andrzej Siewior 2020-01-17  818  
9a46ad6d6df3b5 Shaohua Li                2013-02-21  819  			csd_lock(csd);
8053871d0f7f67 Linus Torvalds            2015-02-11  820  			if (wait)
545b8c8df41f9e Peter Zijlstra            2020-06-15  821  				csd->node.u_flags |= CSD_TYPE_SYNC;
9a46ad6d6df3b5 Shaohua Li                2013-02-21  822  			csd->func = func;
9a46ad6d6df3b5 Shaohua Li                2013-02-21  823  			csd->info = info;
35feb60474bf4f Paul E. McKenney          2020-06-30  824  #ifdef CONFIG_CSD_LOCK_WAIT_DEBUG
545b8c8df41f9e Peter Zijlstra            2020-06-15  825  			csd->node.src = smp_processor_id();
545b8c8df41f9e Peter Zijlstra            2020-06-15  826  			csd->node.dst = cpu;
e48c15b796d412 Paul E. McKenney          2020-06-29  827  #endif
bf5a8c26ad7caf Leonardo Bras             2023-06-15  828  			trace_csd_queue_cpu(cpu, _RET_IP_, func, csd);
bf5a8c26ad7caf Leonardo Bras             2023-06-15  829  
a32a4d8a815c4e Nadav Amit                2021-02-20  830  			if (llist_add(&csd->node.llist, &per_cpu(call_single_queue, cpu))) {
6c8557bdb28df3 Peter Zijlstra            2017-05-19  831  				__cpumask_set_cpu(cpu, cfd->cpumask_ipi);
a32a4d8a815c4e Nadav Amit                2021-02-20  832  				nr_cpus++;
a32a4d8a815c4e Nadav Amit                2021-02-20  833  				last_cpu = cpu;
a32a4d8a815c4e Nadav Amit                2021-02-20  834  			}
9a46ad6d6df3b5 Shaohua Li                2013-02-21  835  		}
561920a0d2bb6d Suresh Siddha             2008-10-30  836  
a32a4d8a815c4e Nadav Amit                2021-02-20  837  		/*
a32a4d8a815c4e Nadav Amit                2021-02-20  838  		 * Choose the most efficient way to send an IPI. Note that the
a32a4d8a815c4e Nadav Amit                2021-02-20  839  		 * number of CPUs might be zero due to concurrent changes to the
a32a4d8a815c4e Nadav Amit                2021-02-20  840  		 * provided mask.
a32a4d8a815c4e Nadav Amit                2021-02-20  841  		 */
a32a4d8a815c4e Nadav Amit                2021-02-20  842  		if (nr_cpus == 1)
5c3124975e15c1 Peter Zijlstra            2023-03-22  843  			send_call_function_single_ipi(last_cpu);
a32a4d8a815c4e Nadav Amit                2021-02-20  844  		else if (likely(nr_cpus > 1))
5c3124975e15c1 Peter Zijlstra            2023-03-22  845  			send_call_function_ipi_mask(cfd->cpumask_ipi);
cbc862707ba3d9 Yury Norov [NVIDIA]       2025-06-06  846  		else
cbc862707ba3d9 Yury Norov [NVIDIA]       2025-06-06  847  			run_remote = false;
a32a4d8a815c4e Nadav Amit                2021-02-20  848  	}
a32a4d8a815c4e Nadav Amit                2021-02-20  849  
c8a0154d152997 Yury Norov [NVIDIA]       2025-06-06  850  	/* Check if we need local execution. */
c8a0154d152997 Yury Norov [NVIDIA]       2025-06-06 @851  	if ((scf_flags & SCF_RUN_LOCAL) & cpumask_test_cpu(this_cpu, mask) &&
                                                                                                ^
Typo.  Should be &&.  Bitwise & is false.

c8a0154d152997 Yury Norov [NVIDIA]       2025-06-06  852  	    (!cond_func || cond_func(this_cpu, info))) {
a32a4d8a815c4e Nadav Amit                2021-02-20  853  		unsigned long flags;
a32a4d8a815c4e Nadav Amit                2021-02-20  854  
a32a4d8a815c4e Nadav Amit                2021-02-20  855  		local_irq_save(flags);
949fa3f11ced2a Leonardo Bras             2023-06-15  856  		csd_do_func(func, info, NULL);
a32a4d8a815c4e Nadav Amit                2021-02-20  857  		local_irq_restore(flags);
a32a4d8a815c4e Nadav Amit                2021-02-20  858  	}
3d4422332711ef Jens Axboe                2008-06-26  859  
a32a4d8a815c4e Nadav Amit                2021-02-20  860  	if (run_remote && wait) {
e1d12f327037a5 Andrew Morton             2013-04-30  861  		for_each_cpu(cpu, cfd->cpumask) {
966a967116e699 Ying Huang                2017-08-08  862  			call_single_data_t *csd;
e1d12f327037a5 Andrew Morton             2013-04-30  863  
6366d062e7f974 Paul E. McKenney          2023-03-20  864  			csd = per_cpu_ptr(cfd->csd, cpu);
9a46ad6d6df3b5 Shaohua Li                2013-02-21  865  			csd_lock_wait(csd);
9a46ad6d6df3b5 Shaohua Li                2013-02-21  866  		}
9a46ad6d6df3b5 Shaohua Li                2013-02-21  867  	}
cc7a486cac78f6 Nicholas Piggin           2008-08-11  868  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

