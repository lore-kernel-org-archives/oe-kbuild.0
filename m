Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B19A1F5851
	for <oe-kbuild@lists.linux.dev>; Sat,  4 Oct 2025 08:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759566956; cv=none; b=RMFjc+tn+RlCgyWqS98zEe1Jcf/eUDswEsqcSLc2PDYutwKaL3KGh3m+XyGHPDA7RRJ5dh/iIl204+3+bU6oOMlotL4zW88VYiiLIU+dqRWjjufh719Mp7rm3gAByA6s/74RYZ1MuJ40j26tZf8yhXoBCj+NGp+SWNq3fkrS9Qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759566956; c=relaxed/simple;
	bh=JsQqE9p1BnSsmmi8AuDK+KSrAV78o80Mh5hwa3pmkBE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=RbkIWALakPjKTn6OOtQmzdU4uDvQIqyKoboE5Gwbos8fe4IWAh9NAHeRFZoQWrIdcJZ6LqLTWQD/EpmwD0ZZ+UehKtMT2PtuRByiY3RgtEAn51oZKV3vUz7TuAI7D/jyGwOvruMAEZnhuBmMGOH8QtYxX6IqyR8nc1U3/dor+vI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rKeRjO4j; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rKeRjO4j"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-46e34052bb7so31756085e9.2
        for <oe-kbuild@lists.linux.dev>; Sat, 04 Oct 2025 01:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759566952; x=1760171752; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SAZP7F4LpAyeiWuUVfM9K9SMysgSblKGV29vPTVd7ME=;
        b=rKeRjO4jGNpQOIRCdoy7Y3yWU4puyBN3GViswvgcYyJdEX6mMdq4BgypMmVNCyEJoO
         u9SFVWLG2gDNJj05PJDYaZjOCYbat1yQIm+50AwlcUU5ICwtqIGtLlZhC9roggf8ydFL
         37fdMuVozvkUZ3tf/3vWA7KlUFIONlyCvceZs/Fg2UKRP8FViEvw8WLxda9ODOoVQGVH
         XbEArX14bpsVuDOChOqIrCtXe9kgzPRg/6mth6wIdng6iE8mylFaat2PAq4+bLWlFu5L
         Xy5GZLoeOg34tyvwkIU9Drkdoik6RfAHcDfmSbS/VDmBpiZvsM8Gnjc++V8aYLg1dRtO
         wNdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759566952; x=1760171752;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SAZP7F4LpAyeiWuUVfM9K9SMysgSblKGV29vPTVd7ME=;
        b=nSR27lD9EEAjDRR28st2Nk45BY8r8F63eZBrYzNqj+OjciMusFj7zy8Tv0G/R7680X
         AhalfXVQgM7OGwE8+9+Hu79gup3hAHzffICw/MKiPnePgndVizRzcOtP9Ae5/+LLgiUJ
         u4AwaGhffYHKmIeenvQTn1V8ULBDHyK0VPTXV3qgp9ZVfeAkEhjMPUHLw6fLI3sd5D+D
         KL4eQYb/kFno8AM4jchwUzpQh2V8sxiJid10W6zLyWs0BxBg3UNJ2hmyEjc/gWkIWSsf
         SuUDFVJ74gSUy6krQbP7Rmg6KZapSVR1g/73WISXw+DmeZPwvfu7aYDrRHd/9zGMdwuK
         c6TQ==
X-Gm-Message-State: AOJu0YyQopgoBqwbDDXMr3Rn5ZuOSlNkWWhYcTQ2Y6EIqrACEKJviJF0
	AlUXMQDj/9SZQ/MsQ2mLZuTbWEPl2YhvwftzlsU3DrYdVSr4Cw7mR1WIxZrjOqBQf2AG4SqGwGd
	zx4T3
X-Gm-Gg: ASbGncsKV5k6K6pSt8KiyQjg3u7u2UgNrvFBbnJ5pP06SortgXukVGNTzmctAdlxm6i
	cVyH+Md7ZGFB8/rx93mzD8G+RWrUVyg2gtRrUemeF84guqJlkG4qmrTWvFMhIvp137fx75HhwQU
	EmpCd0UN+wukKyJtuNOkoo83Ic9HyqdeoYUGIOm+9xRyMoXDkxog+0lgAeZccbQHVLdhXlCnIpD
	qonxFaTGM3KidU/zuidOPlDcUKtOZWXPIw3BbmqXHBvw2rgUvwKKz9NT/hwlfQknq+A9+3aSYfH
	ku4hMVVmQDoINo12dp8QAulPiCGPFFgmnDzY57mSGtMSIBIIfU64G01vLUrJOfuCPTdUEEMwkZ6
	80PHsT1vN677dspGcVSZ25D1aEHT5h3vdPllWypVV8PqsYK5mBbx6kvuM9IpBFoVr44U=
X-Google-Smtp-Source: AGHT+IGa6E+3wJm7+c+5/woLvErvO0WuhjoiRpVAjW0z69Cszk2FpgixLHJeZ82h4IS7E9Toa0IMxQ==
X-Received: by 2002:a05:600c:8b6e:b0:46e:4499:ba30 with SMTP id 5b1f17b1804b1-46e71153ad0mr42510465e9.30.1759566952004;
        Sat, 04 Oct 2025 01:35:52 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-46e723614c9sm63490555e9.14.2025.10.04.01.35.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Oct 2025 01:35:51 -0700 (PDT)
Date: Sat, 4 Oct 2025 11:35:47 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com,
	linux-kernel@vger.kernel.org,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Subject: Re: [PATCH] sched: drop unused variable cpumask in mm_cid_get()
Message-ID: <202510041546.DvhFLp2x-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251002-sched-w1-v1-1-a6fdf549d179@linaro.org>
Message-ID: <20251004083547.vMFV4FImLTu49bQQF7MaIlkMrmNZ_ZF2zlvuGSr1VR4@z>

Hi André,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Andr-Draszik/sched-drop-unused-variable-cpumask-in-mm_cid_get/20251002-192448
base:   3b9b1f8df454caa453c7fb07689064edb2eda90a
patch link:    https://lore.kernel.org/r/20251002-sched-w1-v1-1-a6fdf549d179%40linaro.org
patch subject: [PATCH] sched: drop unused variable cpumask in mm_cid_get()
config: i386-randconfig-141-20251004 (https://download.01.org/0day-ci/archive/20251004/202510041546.DvhFLp2x-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202510041546.DvhFLp2x-lkp@intel.com/

smatch warnings:
kernel/sched/sched.h:3810 switch_mm_cid() error: we previously assumed 'next->mm' could be null (see line 3772)

vim +3810 kernel/sched/sched.h

223baf9d17f25e Mathieu Desnoyers 2023-04-20  3762  static inline void switch_mm_cid(struct rq *rq,
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3763  				 struct task_struct *prev,
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3764  				 struct task_struct *next)
af7f588d8f7355 Mathieu Desnoyers 2022-11-22  3765  {
af7f588d8f7355 Mathieu Desnoyers 2022-11-22  3766  	/*
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3767  	 * Provide a memory barrier between rq->curr store and load of
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3768  	 * {prev,next}->mm->pcpu_cid[cpu] on rq->curr->mm transition.
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3769  	 *
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3770  	 * Should be adapted if context_switch() is modified.
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3771  	 */
223baf9d17f25e Mathieu Desnoyers 2023-04-20 @3772  	if (!next->mm) {                                // to kernel

Can ->mm_cid_active be true when next->mm is false?  I don't know.
If so then it's fine.  I suspect it's fine...

223baf9d17f25e Mathieu Desnoyers 2023-04-20  3773  		/*
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3774  		 * user -> kernel transition does not guarantee a barrier, but
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3775  		 * we can use the fact that it performs an atomic operation in
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3776  		 * mmgrab().
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3777  		 */
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3778  		if (prev->mm)                           // from user
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3779  			smp_mb__after_mmgrab();
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3780  		/*
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3781  		 * kernel -> kernel transition does not change rq->curr->mm
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3782  		 * state. It stays NULL.
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3783  		 */
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3784  	} else {                                        // to user
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3785  		/*
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3786  		 * kernel -> user transition does not provide a barrier
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3787  		 * between rq->curr store and load of {prev,next}->mm->pcpu_cid[cpu].
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3788  		 * Provide it here.
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3789  		 */
fe90f3967bdb3e Mathieu Desnoyers 2024-04-15  3790  		if (!prev->mm) {                        // from kernel
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3791  			smp_mb();
fe90f3967bdb3e Mathieu Desnoyers 2024-04-15  3792  		} else {				// from user
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3793  			/*
fe90f3967bdb3e Mathieu Desnoyers 2024-04-15  3794  			 * user->user transition relies on an implicit
fe90f3967bdb3e Mathieu Desnoyers 2024-04-15  3795  			 * memory barrier in switch_mm() when
fe90f3967bdb3e Mathieu Desnoyers 2024-04-15  3796  			 * current->mm changes. If the architecture
fe90f3967bdb3e Mathieu Desnoyers 2024-04-15  3797  			 * switch_mm() does not have an implicit memory
fe90f3967bdb3e Mathieu Desnoyers 2024-04-15  3798  			 * barrier, it is emitted here.  If current->mm
fe90f3967bdb3e Mathieu Desnoyers 2024-04-15  3799  			 * is unchanged, no barrier is needed.
af7f588d8f7355 Mathieu Desnoyers 2022-11-22  3800  			 */
fe90f3967bdb3e Mathieu Desnoyers 2024-04-15  3801  			smp_mb__after_switch_mm();
fe90f3967bdb3e Mathieu Desnoyers 2024-04-15  3802  		}
af7f588d8f7355 Mathieu Desnoyers 2022-11-22  3803  	}
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3804  	if (prev->mm_cid_active) {
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3805  		mm_cid_snapshot_time(rq, prev->mm);

Same thing for "prev->mm".

223baf9d17f25e Mathieu Desnoyers 2023-04-20  3806  		mm_cid_put_lazy(prev);
af7f588d8f7355 Mathieu Desnoyers 2022-11-22  3807  		prev->mm_cid = -1;
af7f588d8f7355 Mathieu Desnoyers 2022-11-22  3808  	}
af7f588d8f7355 Mathieu Desnoyers 2022-11-22  3809  	if (next->mm_cid_active)
7e019dcc470f27 Mathieu Desnoyers 2024-10-09 @3810  		next->last_mm_cid = next->mm_cid = mm_cid_get(rq, next, next->mm);
                                                                                                                        ^^^^^^^^
Unchecked dereference.

af7f588d8f7355 Mathieu Desnoyers 2022-11-22  3811  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

