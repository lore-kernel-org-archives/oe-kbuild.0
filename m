Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC60325728
	for <oe-kbuild@lists.linux.dev>; Thu,  8 Jan 2026 05:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767851236; cv=none; b=oe+t6DnSlPeBkzUl6nZPiqWbdDJtboIFDDj6HiFk6rF+MCDUvP5PjMSi972W8wIaiGBaGzyRorsw9njA+5jDx2AlnQHaRUOql3OHDfo7P+njmV4H5NOzMY8OU7olF6cCxg+eNdkcsspwM3DFS0BxhiaODNGaUMoLOIVjcH7Q4oY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767851236; c=relaxed/simple;
	bh=5tyAolAS9iPLfPNG07uT+8o6rAj1fMPhQkoGw7cW4Jk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SGTq/rArYi2AarwCNROM/I74nbGGkjo59qIgw3pULJR1nlFuDRGYBf0D4fCjcLqf8U2NDqstzCuSyH+1DactfP26KwsuFTVf95/uLv6GVcNLuJS366xFOHnoqdUE2sSfPdkMWI3/OdUzInvwBUVO50PucCh9n3M5HRZ+Qbn5qP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xYYMTVuR; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xYYMTVuR"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47d3ba3a4deso15870905e9.2
        for <oe-kbuild@lists.linux.dev>; Wed, 07 Jan 2026 21:47:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767851232; x=1768456032; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ALmovQLnJmYNUaSjlGPYrf6+F8qDX4GgFWn1LRaYNS4=;
        b=xYYMTVuRLog+A1v72UCZkGAhQznLDcK9/OihbsBb8JZjsIhFYt1iCm+ZZLZucPxB9n
         whFOfeas8wyFiww9KtpjFnKUdEPHdJdLRAsxJyWZuY7vaarU4BMtIofcsOAXoy2tj1WG
         nmTTYpkY2WTAAYMmOz9thvCkUp+6q+TvOGrUOqXMsL0h6YVaU/ERpnXA5zOYPz/h8Oes
         TLPiuOjQp4KE6VK+mVxb6ZfzPI7XwTdWjaQ+Gj2f1NkbS0x+ice4HkL98kbI9V+EpRMW
         bu2oZ9mEdEjJ9S8Ji2QFcdHvoa6yl/kRrhSV2qqK/CdW87WTpmqKUrDd1g2dZB1e0n8C
         ALqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767851232; x=1768456032;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ALmovQLnJmYNUaSjlGPYrf6+F8qDX4GgFWn1LRaYNS4=;
        b=hZqOyz6L35/lo+EblWTolwSivg0eA6n4PFUAvEhA9u/TvYYv7IxsraDdrytKGq4MeH
         wv3E6IMU+KScIgTwg0qqCf8D7KP2kGWGye6jp2hGfMkrFKIZv2U+EaTSv1C1CjfqPZiC
         ZRF4eI8YK0e2NeVYKV4Dq9CNgXFeUZMqlsIPaSJ86OugLHXRoyarjQf2604EdqjbHUWZ
         9fXvdd/qwqR2kolsUKFYOsg7McbH45N/zlv/L4GhZdNLL7K0lSKYPbmTWL3oNdq/R491
         a6s6JCfjieEHIWPcXiY8G46aHDFIrW7NTkmGPIPHR4eTl6Aakb9F1+yYceS7VEHAoY+r
         8RKQ==
X-Gm-Message-State: AOJu0YyDfqfiiJip3v7368rBISO0dTH78cskLvhRXfpaTafD9/MtnmhS
	5idJao2OldoTd7TgCP6Gyr3PRVSE3WcxPjor8o1WlbqodKrMvNNrgr/8DrnJerm4OaJBJY7cL3j
	ZUuDg
X-Gm-Gg: AY/fxX6QIe9n2/tNVoG9lIkdRLS5i0298rAqs4JH1tATO7cXBYdIf9qmvw5KgoQHuA7
	6Kba6oiJmk/GqDJFQaPIytg41s4WgUB2trK2wWorKEftk/YUBrmAAhVTm16EayRkPOQKvwdu5Lr
	en8WA0Xrr8JqJWAvx/KZAZJGf777VWjjALPOqspw434sGrxXf4qt27YOi6LB8yUH6W8b15QQvfL
	s6sS4EXa2rlc1fPUWLLE87MIRZTJg1HVNB8MZRSXw/F8Ij3fTTLh5ZzI7aaLhKEh2IvY+e1+1+z
	W/P9OxCKB+EuAmOrfNYPj2FGrjszfSY8siSXbOz14eM6f4L3yI9PQwxMZFv/Ah1B8ekdvMkBg0/
	Yja9gHNuX6fN+O6tnyPnSSzwuCGLzPcRvwonKYJslIlacgI684EMVPqlpYElhx4ppdRy+hwtqoP
	AITjezeZVmYK0Z71+b
X-Google-Smtp-Source: AGHT+IHw8DBSfe8Szxf3RZyP2+mguimjL01vZZBZGbTuZhrz7aGyjSeOiB7B+OIsLniRF3fswTN5qQ==
X-Received: by 2002:a05:6000:24c8:b0:432:84f9:8bed with SMTP id ffacd0b85a97d-432c364380cmr6666972f8f.28.1767851231593;
        Wed, 07 Jan 2026 21:47:11 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0dacc5sm13783950f8f.5.2026.01.07.21.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 21:47:11 -0800 (PST)
Date: Thu, 8 Jan 2026 08:47:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Gabriele Monaco <gmonaco@redhat.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [glemco:staging_rv_mon_kunit 21/29]
 kernel/trace/rv/monitors/deadline/deadline.h:130 extract_params() warn:
 variable dereferenced before check 'p' (see line 129)
Message-ID: <202601081024.CGC2yhFU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260108054708.8FDBB5oI57XsZkujjNMHjf27LQ4yQAtKlTEGHOtWBs8@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gmonaco/linux.git staging_rv_mon_kunit
head:   45a96d573274287926f2fd31092f229238476843
commit: 5c22af5956b42cc02d383e188c13d383d334043a [21/29] rv: Add deadline monitors
config: csky-randconfig-r072-20260108 (https://download.01.org/0day-ci/archive/20260108/202601081024.CGC2yhFU-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202601081024.CGC2yhFU-lkp@intel.com/

smatch warnings:
kernel/trace/rv/monitors/deadline/deadline.h:130 extract_params() warn: variable dereferenced before check 'p' (see line 129)

vim +/p +130 kernel/trace/rv/monitors/deadline/deadline.h

5c22af5956b42c Gabriele Monaco 2025-07-31   90  static inline int extract_params(struct pt_regs *regs, long id, struct task_struct **p)
5c22af5956b42c Gabriele Monaco 2025-07-31   91  {
5c22af5956b42c Gabriele Monaco 2025-07-31   92  	size_t size = offsetof(struct sched_attr, sched_nice);
5c22af5956b42c Gabriele Monaco 2025-07-31   93  	struct sched_attr __user *uattr, attr;
5c22af5956b42c Gabriele Monaco 2025-07-31   94  	int new_policy = -1, ret;
5c22af5956b42c Gabriele Monaco 2025-07-31   95  	unsigned long args[6];
5c22af5956b42c Gabriele Monaco 2025-07-31   96  	pid_t pid;
5c22af5956b42c Gabriele Monaco 2025-07-31   97  
5c22af5956b42c Gabriele Monaco 2025-07-31   98  	switch (id) {
5c22af5956b42c Gabriele Monaco 2025-07-31   99  	case __NR_sched_setscheduler:
5c22af5956b42c Gabriele Monaco 2025-07-31  100  		syscall_get_arguments(current, regs, args);
5c22af5956b42c Gabriele Monaco 2025-07-31  101  		pid = args[0];
5c22af5956b42c Gabriele Monaco 2025-07-31  102  		new_policy = args[1];
5c22af5956b42c Gabriele Monaco 2025-07-31  103  		break;
5c22af5956b42c Gabriele Monaco 2025-07-31  104  	case __NR_sched_setattr:
5c22af5956b42c Gabriele Monaco 2025-07-31  105  		syscall_get_arguments(current, regs, args);
5c22af5956b42c Gabriele Monaco 2025-07-31  106  		pid = args[0];
5c22af5956b42c Gabriele Monaco 2025-07-31  107  		uattr = (void *)args[1];
5c22af5956b42c Gabriele Monaco 2025-07-31  108  		/*
5c22af5956b42c Gabriele Monaco 2025-07-31  109  		 * Just copy up to sched_flags, we are not interested after that
5c22af5956b42c Gabriele Monaco 2025-07-31  110  		 */
5c22af5956b42c Gabriele Monaco 2025-07-31  111  		ret = copy_struct_from_user(&attr, size, uattr, size);
5c22af5956b42c Gabriele Monaco 2025-07-31  112  		if (ret)
5c22af5956b42c Gabriele Monaco 2025-07-31  113  			return ret;
5c22af5956b42c Gabriele Monaco 2025-07-31  114  		if (attr.sched_flags & SCHED_FLAG_KEEP_POLICY)
5c22af5956b42c Gabriele Monaco 2025-07-31  115  			return -EINVAL;
5c22af5956b42c Gabriele Monaco 2025-07-31  116  		new_policy = attr.sched_policy;
5c22af5956b42c Gabriele Monaco 2025-07-31  117  		break;
5c22af5956b42c Gabriele Monaco 2025-07-31  118  	default:
5c22af5956b42c Gabriele Monaco 2025-07-31  119  		return -EINVAL;
5c22af5956b42c Gabriele Monaco 2025-07-31  120  	}
5c22af5956b42c Gabriele Monaco 2025-07-31  121  	if (!pid)
5c22af5956b42c Gabriele Monaco 2025-07-31  122  		*p = current;
5c22af5956b42c Gabriele Monaco 2025-07-31  123  	else {
5c22af5956b42c Gabriele Monaco 2025-07-31  124  		/*
5c22af5956b42c Gabriele Monaco 2025-07-31  125  		 * Required for find_task_by_vpid, make sure the caller doesn't
5c22af5956b42c Gabriele Monaco 2025-07-31  126  		 * need to get_task_struct().
5c22af5956b42c Gabriele Monaco 2025-07-31  127  		 */
5c22af5956b42c Gabriele Monaco 2025-07-31  128  		guard(rcu)();
5c22af5956b42c Gabriele Monaco 2025-07-31 @129  		*p = find_task_by_vpid(pid);
5c22af5956b42c Gabriele Monaco 2025-07-31 @130  		if (unlikely(!p))

s/p/*p/

5c22af5956b42c Gabriele Monaco 2025-07-31  131  			return -EINVAL;
5c22af5956b42c Gabriele Monaco 2025-07-31  132  	}
5c22af5956b42c Gabriele Monaco 2025-07-31  133  
5c22af5956b42c Gabriele Monaco 2025-07-31  134  	return new_policy & ~SCHED_RESET_ON_FORK;
5c22af5956b42c Gabriele Monaco 2025-07-31  135  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

