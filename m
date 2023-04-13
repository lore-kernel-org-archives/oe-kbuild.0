Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 351E264E;
	Thu, 13 Apr 2023 05:06:20 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id eo6-20020a05600c82c600b003ee5157346cso9274476wmb.1;
        Wed, 12 Apr 2023 22:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681362378; x=1683954378;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YTuX7BWQccR072xh88lyub0yD8ThTjPxkRbEwjzVO2U=;
        b=Tsm5sDvSPz4J0dpPBeveoe7ImIhAy7msJzCfoxr8qMcmyEe/defVCfiuUtkve0L0NS
         w5jJgSCaLjzzcfFQJr9slYNKtOA5v8rKHu9lY0VkrbSsdgA67GtzZitwfzQRw/dcDYN3
         VGACYaNNnM6FWOJgrSWvcM0Xj9pv4PaVCvNvNCloFaFWIiHeiR7da5PpgzY2vLaw7qXy
         KsSEnRGx2KVvdIbuuGk+zFZk5Wy/lLNDt+CpB7cjCL8BcnFmWiHctQvE5gI2Avbuq3iY
         uAQp0eWbAmm25svTRmV5jLcED/tbHNyLHqVBVcpL/hF48pd55ksGWD5B4MnHxDFFHILC
         ZcoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681362378; x=1683954378;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YTuX7BWQccR072xh88lyub0yD8ThTjPxkRbEwjzVO2U=;
        b=Z/THt8YDqoUP1BPf3W4GfGeThX/kNeXfeNof+Q6a9iYffV3dph887QqxxZvMpiOWfP
         eY6MzVPMPTLC6gbu5o+E6KDT8BfvBa3SRubijBXRXr3CHAMd0g6/iZ+7ln6oZkpoQstJ
         DyaoGddPkskiP15z0I2SmJiPfCR2FfB0qN4WhrF98/HH8vt9Nv4GofLRY9d61zIRWu++
         ABTmGaoz/JoqS1l0GhcsF3wZMQLYF7wocRWsuFUOU5zk3vq4LbjvfpAOQ2gO1fkgMuXj
         Edt/+zRO18ZDDOkv5I/I31d4PPj3djdZIcqBk45DH5emrJNYWIU0ODAxR/UmM+en/roq
         IufA==
X-Gm-Message-State: AAQBX9fqYVrP3NTNl8cW3VFhM2i0+OLbkb/1EL7pPJ7j8sXWzHj0Mypt
	wCipRtLp52tO9nZerphsdi9rfkFfKbU=
X-Google-Smtp-Source: AKy350YX14Lih8aW1AsCNtKAFTbEzC43tJ5WfeOSTjWOxDlT+e2/27FjtTwNhzhVoUyT5RtR3poiBQ==
X-Received: by 2002:a1c:7509:0:b0:3f0:7f4f:2aa8 with SMTP id o9-20020a1c7509000000b003f07f4f2aa8mr732728wmc.9.1681362378055;
        Wed, 12 Apr 2023 22:06:18 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id m10-20020a05600c3b0a00b003ef5e5f93f5sm4365724wms.19.2023.04.12.22.06.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Apr 2023 22:06:17 -0700 (PDT)
Date: Thu, 13 Apr 2023 08:04:55 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Jens Axboe <axboe@kernel.dk>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:epoll-min_ts.2 9/10] fs/eventpoll.c:2484
 __do_sys_epoll_pwait3() error: uninitialized symbol 'sigmask_sz'.
Message-ID: <7a1b3993-ded9-4c2e-8537-965d118b1264@kili.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git epoll-min_ts.2
head:   b9cf9474f08ccfc0d8b4afad26ba2ca82e64a67b
commit: 343353f60bfa9ffcf17dee8189972f43575bbe5e [9/10] eventpoll: add epoll_pwait3()
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/20230413/202304131131.jk3EMTyS-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304131131.jk3EMTyS-lkp@intel.com/

smatch warnings:
fs/eventpoll.c:2484 __do_sys_epoll_pwait3() error: uninitialized symbol 'sigmask_sz'.
fs/eventpoll.c:2484 __do_sys_epoll_pwait3() error: uninitialized symbol 'sigmask_sz'.

vim +/sigmask_sz +2484 fs/eventpoll.c

343353f60bfa9f Jens Axboe       2023-04-12  2455  SYSCALL_DEFINE5(epoll_pwait3, int, epfd, struct epoll_event __user *, events,
343353f60bfa9f Jens Axboe       2023-04-12  2456  		int, maxevents, int, flags,
343353f60bfa9f Jens Axboe       2023-04-12  2457  		struct epoll_pwait_data __user *, data)
343353f60bfa9f Jens Axboe       2023-04-12  2458  {
343353f60bfa9f Jens Axboe       2023-04-12  2459  	struct timespec64 ts, *to = NULL;
343353f60bfa9f Jens Axboe       2023-04-12  2460  	const sigset_t __user *sigmask = NULL;
343353f60bfa9f Jens Axboe       2023-04-12  2461  	unsigned int min_wait_ts = 0;
343353f60bfa9f Jens Axboe       2023-04-12  2462  	size_t sigmask_sz;
343353f60bfa9f Jens Axboe       2023-04-12  2463  
343353f60bfa9f Jens Axboe       2023-04-12  2464  	if (flags & ~EPOLL_PWAIT_FLAGS)
343353f60bfa9f Jens Axboe       2023-04-12  2465  		return -EINVAL;
343353f60bfa9f Jens Axboe       2023-04-12  2466  
343353f60bfa9f Jens Axboe       2023-04-12  2467  	if (flags & EPOLL_PWAIT_TIMEOUT) {
343353f60bfa9f Jens Axboe       2023-04-12  2468  		if (get_timespec64(&ts, &data->timeout))
343353f60bfa9f Jens Axboe       2023-04-12  2469  			return -EFAULT;
343353f60bfa9f Jens Axboe       2023-04-12  2470  		to = &ts;
343353f60bfa9f Jens Axboe       2023-04-12  2471  		if (poll_select_set_timeout(to, ts.tv_sec, ts.tv_nsec))
343353f60bfa9f Jens Axboe       2023-04-12  2472  			return -EINVAL;
343353f60bfa9f Jens Axboe       2023-04-12  2473  	}
343353f60bfa9f Jens Axboe       2023-04-12  2474  	if (flags & EPOLL_PWAIT_SIGMASK) {
343353f60bfa9f Jens Axboe       2023-04-12  2475  		sigmask = &data->sigmask;
343353f60bfa9f Jens Axboe       2023-04-12  2476  		if (get_user(sigmask_sz, &data->sigmask_sz))
343353f60bfa9f Jens Axboe       2023-04-12  2477  			return -EFAULT;

sigmask_sz not initialized on else path.

343353f60bfa9f Jens Axboe       2023-04-12  2478  	}
343353f60bfa9f Jens Axboe       2023-04-12  2479  	if (flags & EPOLL_PWAIT_MINWAIT) {
343353f60bfa9f Jens Axboe       2023-04-12  2480  		if (get_user(min_wait_ts, &data->min_wait_ts))
343353f60bfa9f Jens Axboe       2023-04-12  2481  			return -EFAULT;
343353f60bfa9f Jens Axboe       2023-04-12  2482  	}
343353f60bfa9f Jens Axboe       2023-04-12  2483  
343353f60bfa9f Jens Axboe       2023-04-12 @2484  	return do_epoll_pwait(epfd, events, maxevents, to, sigmask, sigmask_sz,
343353f60bfa9f Jens Axboe       2023-04-12  2485  				min_wait_ts);

This is obviously uninitialized when we pass it, but it's almost certain
that the uninitialized isn't used.  We've had this debate in other
threads, becuase strictly speaking passing uninitialized data is
undefined behavior, but also we don't care too much about the C
standard.  I think the result of the debate is that if the function is
inlined then it's not a bug but if it isn't inlined then it is a bug.

343353f60bfa9f Jens Axboe       2023-04-12  2486  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

