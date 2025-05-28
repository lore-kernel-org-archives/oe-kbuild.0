Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66EA0283FEF
	for <oe-kbuild@lists.linux.dev>; Wed, 28 May 2025 12:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748435932; cv=none; b=pVX2QdtMGSoC7OlytYV1HAiXb7yOvV/A9eJGY303eT0ruAndDD4yCjOAzbZ9cmgqrQ+qyp3jzQs3fL9CceTqdzfbtdJmSbvGCIu8KgNr6d46kADfRp5uXCJB6zRyqeR6IkahiAgj9CBOpbLgaHuhYSY+FTTpB9NUT/DqFWf8znQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748435932; c=relaxed/simple;
	bh=ju3RtnokbA7A2UpoirX5Uxklb3q8HutkwlYj/qhvN10=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s7ULpjJFRy1CPHnojIgoLGuaIoJ/i5Sdk0f6tOpvuqRXXdrUXr03BjLWOsMGvZc6K8n66NL/h7TAzqtdOoyRYBY0cLd1cm1xPOyUseNgDyMm4A+tzZD6bQP9Rtvm05drJgjpnlE0RRVRI3f9gVNdgsjLuzl3zh5fWz3KPUfa62k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uF8j5KT7; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uF8j5KT7"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a361b8a664so4504883f8f.3
        for <oe-kbuild@lists.linux.dev>; Wed, 28 May 2025 05:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748435928; x=1749040728; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bmn+1O/aRx+WwdyfshbTtYQBtqZnfPAw0fwztmDmaHc=;
        b=uF8j5KT7MJOCI+V4gR7VwtSsYJMb4OkQ8yt3lQ3RG/iomt8pIIaEKvDaI0mYxKXnKV
         6foqSU85VQpMHUVZW4nbEHjXEyGVRA0+CoJQaidvMTmvuYu/4bW5iVATeimo9e/DEYmK
         zt17PhLhWxdZESB8esHSSQT8fGk3ZqaiVNXuZfzWdbzUGwWhUbBMsFXSrVqPNGBTeDva
         sHElJSoJItNqEUPTiDmm9k45eezHqILbug71PtKS56pgPrkOes87sav5gJVViYF8LmUy
         dxUvzLqY62NTG587F1lH5YLR1L8/yJQgp2dlrMiv9YM+CQVsCY0zwUVAsR/jQl4yVSn2
         6sAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748435928; x=1749040728;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bmn+1O/aRx+WwdyfshbTtYQBtqZnfPAw0fwztmDmaHc=;
        b=NkGarimP8QNP4rf+nyb2uzWBpaBko4bkXWUr1fBaBXGt3BDVNWKp4ZWnuvETezHqoQ
         wytDQwBoMujmHsKiYKE4W08OdO0WB8N3ip0rwREh4Bos3PFh9aSjE7yCbNHpXfOMNWo4
         MC8mgYQPahNc7aG6rCd4awV3tIQ4+GblLSMb7LZR4jwJrxRbF+1lrjU8WtHSEcG7bf0T
         VgN1xk+rxDq2XhRTf1EkLvjzeHvAVf/6LDriNiEXPASkCHrItfi8mc3ZHihuetEWciGF
         uQwqwVqpZPgYbvHUik78ODqv6uJETTjhUJ/RWniSsCSRVNXrJDDmYxyKtBfYiu/B5Xt5
         FJ4Q==
X-Gm-Message-State: AOJu0YwqNfk7eDHOa6Y4TKODjSS5+BFC6Jg/csooysc6zsl6EKA52eLX
	8IeK2DxVTz7P8sriv7sD2T5LUBqNn2v0moAzD1pb/tOsPkb46E6JfRWFFgANvnACs82IA969jHX
	7/Oq4
X-Gm-Gg: ASbGncu9HmUWOj8hNyHj0bbXKxAkMqNELMP0SpzUPIUoJFR6BsmPBqbJi7mFhs6VQZZ
	CxozOb1iXXminMM8OiD5YVCYIHea7yQ9S/VA6TyAiX/fH7ci6Il/gEnBowauohNwIZc1XPMIzBo
	1PJHQPXxTwCmlttgt5XwTmQo4BRu+BH4ci2tfZlpYVG7P93PboOldUIHWhpck6qkdjudY2psHNP
	36sE5/JQfqiDcuqDa2WUYjTpHv2XEC8DxaQe0xkLheaGtpwZ6aGw/DbM67v7xqK6l6FuV3fiHXn
	vez4cg1U6RJazNWqyZMvblVCBQEVSV4hbJXXVklFW0J7BCO/KCLAPvgK
X-Google-Smtp-Source: AGHT+IFm59x7f6pu6CLgOgMTUagz8wqklQWLZb6ivdMsWNTwKAex5w1y/Kl+UxsRtj4zRMUvrUEtYw==
X-Received: by 2002:a05:6000:2313:b0:3a4:e67d:371b with SMTP id ffacd0b85a97d-3a4e67d376fmr3270561f8f.29.1748435928428;
        Wed, 28 May 2025 05:38:48 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a4eace3a76sm1377222f8f.98.2025.05.28.05.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 05:38:47 -0700 (PDT)
Date: Wed, 28 May 2025 15:38:44 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Jeff Layton <jlayton@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [jlayton:rpc-numa 1/2] net/sunrpc/svc.c:761
 svc_pool_wake_idle_thread() error: uninitialized symbol 'rqstp'.
Message-ID: <202505282030.8lexZF9u-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20250528123844.ADVxmRik2V0hzTIXBB6MHn_dHhJQfiwUcPkWtHKSMIM@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git rpc-numa
head:   4fb548fc918eae3b330e50c56bae2a0b02b9b157
commit: a0d4dce2778e63a6410a5606d50a17426a4251fd [1/2] sunrpc: new tracepoints around thread wakeups
config: riscv-randconfig-r073-20250528 (https://download.01.org/0day-ci/archive/20250528/202505282030.8lexZF9u-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202505282030.8lexZF9u-lkp@intel.com/

smatch warnings:
net/sunrpc/svc.c:761 svc_pool_wake_idle_thread() error: uninitialized symbol 'rqstp'.

vim +/rqstp +761 net/sunrpc/svc.c

2a4557452aacf9 NeilBrown   2023-07-31  740  void svc_pool_wake_idle_thread(struct svc_pool *pool)
850bac3ae4a636 Chuck Lever 2023-07-10  741  {
850bac3ae4a636 Chuck Lever 2023-07-10  742  	struct svc_rqst	*rqstp;
9bd4161c591710 NeilBrown   2023-09-11  743  	struct llist_node *ln;
850bac3ae4a636 Chuck Lever 2023-07-10  744  
850bac3ae4a636 Chuck Lever 2023-07-10  745  	rcu_read_lock();
5b80147e0c7018 NeilBrown   2023-09-11  746  	ln = READ_ONCE(pool->sp_idle_threads.first);
9bd4161c591710 NeilBrown   2023-09-11  747  	if (ln) {
9bd4161c591710 NeilBrown   2023-09-11  748  		rqstp = llist_entry(ln, struct svc_rqst, rq_idle);
850bac3ae4a636 Chuck Lever 2023-07-10  749  		WRITE_ONCE(rqstp->rq_qtime, ktime_get());
5b80147e0c7018 NeilBrown   2023-09-11  750  		if (!task_is_running(rqstp->rq_task)) {
850bac3ae4a636 Chuck Lever 2023-07-10  751  			wake_up_process(rqstp->rq_task);
a0d4dce2778e63 Jeff Layton 2025-05-27  752  			trace_svc_pool_thread_wake(pool, rqstp->rq_task->pid);
5b80147e0c7018 NeilBrown   2023-09-11  753  			percpu_counter_inc(&pool->sp_threads_woken);
a0d4dce2778e63 Jeff Layton 2025-05-27  754  		} else {
a0d4dce2778e63 Jeff Layton 2025-05-27  755  			trace_svc_pool_thread_running(pool, rqstp->rq_task->pid);
5b80147e0c7018 NeilBrown   2023-09-11  756  		}
5b80147e0c7018 NeilBrown   2023-09-11  757  		rcu_read_unlock();
2a4557452aacf9 NeilBrown   2023-07-31  758  		return;
850bac3ae4a636 Chuck Lever 2023-07-10  759  	}

ln is unintialized on else path.

850bac3ae4a636 Chuck Lever 2023-07-10  760  	rcu_read_unlock();
a0d4dce2778e63 Jeff Layton 2025-05-27 @761  	trace_svc_pool_thread_noidle(pool, rqstp->rq_task->pid);
                                                                                   ^^^^^^^
Dereference.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

