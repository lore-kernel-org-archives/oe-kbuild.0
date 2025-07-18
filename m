Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769C3145A1F
	for <oe-kbuild@lists.linux.dev>; Fri, 18 Jul 2025 01:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752803788; cv=none; b=okaLgg1/wIYwYqydqHf6hZdlSotV+m/BN4l0JV+LN26eS+WHJqvvVUQ3o1n/byTtl4oY2cx5p5bLxCU/hdQ++ZfdqQ/BybmBzDtSaAEtTheNrJNzEvc7fLrHSuyweIQ1YR5vE3AnlUPoSMohlToDYcbAaM8suXCVS4ZgT5Cl5Lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752803788; c=relaxed/simple;
	bh=quAYO0IslRfjqgKElHOFH14nBNPcPgnK44K4dVwjZOI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YXBB6Pw6+zOhT5G2kvIML2QQejMra/S3Z7vFLVuvr+hCVbLC+n1LY9dtkID8lg9pJiQiXhO94Hl1SkNzaM1hx0MS4db0hgqmr76HSbBcK+IwjqIveRSoybpewBxB38sG/fkOe5vk/6U0hbS773CoxdCQAnoGI7SkzL3ywWk7dq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=az+ZUDVb; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="az+ZUDVb"
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-61593d5f92bso888425eaf.1
        for <oe-kbuild@lists.linux.dev>; Thu, 17 Jul 2025 18:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752803785; x=1753408585; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fO3BAJqBnEaDNYRieqyNWfhvX+qq7zVCYvlmIioIH+0=;
        b=az+ZUDVbiraTPL8qQ8JfLPSbQ3yWkt3uHa4pIqd16uNrR+mx0dvzWSIbpx5+9RyKzW
         CWboAWBi9B3q2VK7WiNdPef8XAJLfe5SyuAvLUQBrunjaDBFZR6bK+ix9GQU4auoFb19
         SUtB6x+NT4asJudlirSFfga9fCUbdEAOw34OXmBYpKN4z0wf1cUdokp1pm+W032iPGxX
         kT6WT/t/JQLv+v5mMcvGbazDLgIFA/7QaBYmMTvmn0P+4/3YvrriDDonaAUvpJsM1r36
         ZU1znEiFMuo1vmuwdDVtoA/y82JUlLB8EYqyoQ819QIF3NH8/W9aH+s/G/1JZ6Pt+K2T
         SHIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752803785; x=1753408585;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fO3BAJqBnEaDNYRieqyNWfhvX+qq7zVCYvlmIioIH+0=;
        b=YvJA6lKExra+0kGlJu+Uk7P0cUE/KQWHpJYBVvIpX0sN51LNPpPyTQH0njLXbNCgQk
         j9F+gjPYOkk60OUOZmc+zSW3aCgk8WQB55rsm+gCrXT0OIBw4XUcaElyhsRRqcaJ9r9w
         kkNvk24/RiYcj8CPO3CmFcrVd5UZL++S5f/qEy7s1xzM+OSTolfK7v/oK+ffcbL93D2w
         7xtxsBcGpqYdzxqtQEfrGdPfS5N3pAry+7zmj8tJRPxKtfEJbSQlQMdeaScaICLgOqYx
         FxjopKiDOcLTefyRZPfkkTomtz7BL+6GfXDmXPAs7DI+iX6IlMvfSTz8C1n3/Vr8AFrK
         i5yA==
X-Gm-Message-State: AOJu0YwzwmBylBU11F6dek2qf8nvdUsuXdu1ixszWUVW8AbY0I3Wd86u
	1DZWEuFdEOm79NR7VqIzGK58XsHK3a6Qg480JAiGfce1UcgbF/onYACgxNI5zJl/glmGIKgOdwj
	gVQmz
X-Gm-Gg: ASbGncsVpmF7fX+gWjpJyRNfzkW9fCe1lwcdf/Hd8K4sqj7StSc8tYl+yRfw0/T6bfN
	TGuZc+sKzRJvn/RqlcDz1SV6dmABU8OFC9+plJVmTEymnQWRaM512oEQYrC0OxL5GtBrtmF21ZN
	egaBLXD+JD3Kic9V4fWQzGn1Y8CwyOQYvFuXgyWU1NggsY55U8fYRKvoap0FCa+xIHKOYwm+dyc
	EFngVbAj3FIS6KpCzcbY2pzxF4CxeovkpVZgFAteB0Iw6OLjuI3phr8pX0j7Pw+btGOUbMPDrdj
	VooxU1u38cQjU0+2uKkoCkHhDndYUFk9aBdyra3SWUcYTzb6lIxGaobvqDEo1scVXRGdG8skOP8
	a4Vt+uiigkC/0D4rjKSWoDpUAMmr8
X-Google-Smtp-Source: AGHT+IHdvePjkbGrc4fHsRSW0DkuBczzR5AniNwIbs7HoS/t+xfZWroitDzOx/kPfUw49uOhvzQOOg==
X-Received: by 2002:a05:6820:2702:b0:611:3e54:8d0a with SMTP id 006d021491bc7-615acc319a6mr3839050eaf.1.1752803784936;
        Thu, 17 Jul 2025 18:56:24 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:2c38:70d4:43e:b901])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-615bcc8c21fsm88647eaf.18.2025.07.17.18.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 18:56:24 -0700 (PDT)
Date: Fri, 18 Jul 2025 04:56:22 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Pavel Begunkov <asml.silence@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Jens Axboe <axboe@kernel.dk>
Subject: [linux-next:master 10555/10823] io_uring/zcrx.c:385
 io_zcrx_free_area() error: we previously assumed 'area->ifq' could be null
 (see line 380)
Message-ID: <f07001e5-021c-4695-8116-07b1a71665fb@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   024e09e444bd2b06aee9d1f3fe7b313c7a2df1bb
commit: 262ab205180d2ba3ab6110899a4dbe439c51dfaa [10555/10823] io_uring/zcrx: account area memory
config: x86_64-randconfig-161-20250717 (https://download.01.org/0day-ci/archive/20250718/202507180628.gBxrOgqr-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202507180628.gBxrOgqr-lkp@intel.com/

smatch warnings:
io_uring/zcrx.c:385 io_zcrx_free_area() error: we previously assumed 'area->ifq' could be null (see line 380)

vim +385 io_uring/zcrx.c

cf96310c5f9a0d David Wei      2025-02-14  378  static void io_zcrx_free_area(struct io_zcrx_area *area)
cf96310c5f9a0d David Wei      2025-02-14  379  {
0ec33c81d9c734 Pavel Begunkov 2025-05-27 @380  	if (area->ifq)
                                                    ^^^^^^^^^
This line assumes that area->ifq can be NULL

db070446f5af8c Pavel Begunkov 2025-02-14  381  		io_zcrx_unmap_area(area->ifq, area);
782dfa329ac9d1 Pavel Begunkov 2025-05-01  382  	io_release_area_mem(&area->mem);
db070446f5af8c Pavel Begunkov 2025-02-14  383  
262ab205180d2b Pavel Begunkov 2025-07-16  384  	if (area->mem.account_pages)
262ab205180d2b Pavel Begunkov 2025-07-16 @385  		io_unaccount_mem(area->ifq->ctx, area->mem.account_pages);
                                                                         ^^^^^^^^^^^
But here it's dereferenced without checking

262ab205180d2b Pavel Begunkov 2025-07-16  386  
cf96310c5f9a0d David Wei      2025-02-14  387  	kvfree(area->freelist);
cf96310c5f9a0d David Wei      2025-02-14  388  	kvfree(area->nia.niovs);
34a3e60821ab9f Pavel Begunkov 2025-02-14  389  	kvfree(area->user_refs);
cf96310c5f9a0d David Wei      2025-02-14  390  	kfree(area);
cf96310c5f9a0d David Wei      2025-02-14  391  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

