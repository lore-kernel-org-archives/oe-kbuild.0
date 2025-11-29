Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FDD01D86FF
	for <oe-kbuild@lists.linux.dev>; Sat, 29 Nov 2025 16:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764435249; cv=none; b=tnSGi43ULPo0w4WI8H/tcyMbf1AWhpqQSKN1jrsmhH9dbMZGx5+Lj0fP2SMiV8in9vVc3NV8eeY0w3tnx0szM0gnpPHN87lqviAifg3i3aiTnSbrT/Lk9oQWi3XxyFXWwci6S8kbY+R/swJBcgTnAYZrzHpg+hj2rgurj1kylYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764435249; c=relaxed/simple;
	bh=yCnraAl4+YRYxXbfttFFzTDa9wIKsD7rXWu6EE+W+aw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=P8mgJUmCKxT8neueN/9Umet7B42Y9oP0Ce6Z746h0WibSWY7MvFuY+8eQRGQw+v9MfhXiNQJbg3dLQzh1ZZohsyLav7S1MwZ6vY+1AspxK2ONwWtCIjrrSy8roLwhImjUV7nJnPEq3tVQh9U3LPSVpFyX5dgKNUpu4/skzeFgG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QHksiTow; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QHksiTow"
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5599688d574so773616e0c.2
        for <oe-kbuild@lists.linux.dev>; Sat, 29 Nov 2025 08:54:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764435246; x=1765040046; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SUdMDrZomFUZbbZgdh9LwkvsujEbVnk82m9l5aFdt8o=;
        b=QHksiTowne2zke1uR6NkoaqHchFBbMsDNpCmuvjAc0HtCfSbFSgIi+ZexRj/dyCCpw
         9ckDKLPf3kOflICWpCU4PBF3N9wrlk7fWc9f+aSNKUDYlMg1zR60Svtti3kZp5GwvuT4
         mPCAn1oPuu2825j0+4PVhioTDhUdMBNrldWDtb6aiqunLNMTKGUvcTxUD4pLucgk5Za5
         J63XThLM5imAdo0c3I+8MnwRS73XZbw6maYBXnjg4JoAQVE8Hx+5qdQqBgj6lHoPmNOX
         awcdHX2i3+d2YrR9o2xDjYTqOxweEabUKZLnabePxTZAOqe91bF0YUmGZSxnXs+UbEUA
         p+ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764435246; x=1765040046;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SUdMDrZomFUZbbZgdh9LwkvsujEbVnk82m9l5aFdt8o=;
        b=Bj9voFzzVPI7lNR8ED+YPgSEflaUOvdodFcqvBxvVjOF6TgtCia6/AjAexZhQqWvAt
         dqZpp2/rjMjsCzbpws6xlIXmUeDNYGTRBW6t56Bz/YEcCqIByTFXtX9BMdJEl61XkNcT
         5Zg+8Dq+h9lnrFL+QTOYddXbqX4VpedPH69QOXVLnNVh88n4TPxBa3dsSL+eKxepLL3g
         YerB2MlxzHQqiU9srL18m2lOEyLGYWNGaJXJnTk+3hzvF9MktvoMVPppZwsjUXqyvM4R
         nXPABFXJe4vZXgBLrEraO2TWHG07Q1ZH3opfdDjvbv4MoHHKsMH8OhVFs6lMhnCbuV8s
         NDPQ==
X-Gm-Message-State: AOJu0YxV0+LVJtS9vNpUczYJQkpiQl0yi2mZ1APXW9oGFCo7ir+vXHyV
	4YyjLlGV/v8W9S2DjtQ2hupFOgb3K++wdWAh1te2VfJritI0Z5cbMFRif6U/mMyko4LJiww6kbh
	/MIB9
X-Gm-Gg: ASbGncu50RuyvJP2ka+hDko1XlkDfUBIcxGgCpsGDdsfO4FSc49ni+jh9g/XBJE2QiR
	iGMz+1BSPfH3jNTne6kSBNLvO/HBPb/jB48MhU+12pkOIhhqsgW4XHFWvYnoWBtuAIkviJlzRfw
	i9urGyyaEp5lvUOsgDSd+/ihnLtTxwekviQ1SFBT+hyH3tbE/QdbXw2Ik1uPPdl03nJOVCPSoEd
	qPb7tKHrQ1UpBHdV1e/MdhYX8byrwIf6WZZ3CRaRULLGfJB5fk5zJcTo/9nG0+evrSrtzZ/DrDM
	AbiXkCiJ9KdwPQlEsj6H0EC+vADxrB/+7KZXhDhqmrH6EwUxySmSqu2oLl9Gf1k6Of600XI+XRt
	pwuWlx3dUxD6KTP/SZeOBc1zgIZiQBmjf4fy0QoSAt/UwzivXGod8pZJS25l/MMuNLvT3YELRyT
	IcPQC1nBVDxq42U63t
X-Google-Smtp-Source: AGHT+IG5tajmTfYoc3lFMiwar57/U6inDiuyMwTKKDkv9l56SNQgQ4HUSlYelexgYFZ7UMzNqqfw7Q==
X-Received: by 2002:a05:6122:202a:b0:55b:305b:4e3c with SMTP id 71dfb90a1353d-55b8f00fd2cmr10936851e0c.18.1764435245594;
        Sat, 29 Nov 2025 08:54:05 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 71dfb90a1353d-55cf516c50dsm3256156e0c.19.2025.11.29.08.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Nov 2025 08:54:04 -0800 (PST)
Date: Sat, 29 Nov 2025 19:53:59 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Matthew Brost <matthew.brost@intel.com>,
	intel-xe@lists.freedesktop.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v6 8/8] drm/xe: Avoid toggling schedule state to check
 LRC timestamp in TDR
Message-ID: <202511291102.jnnKP6IB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126214748.650107-9-matthew.brost@intel.com>
Message-ID: <20251129165359.pKzEw6kz91DyF_MoA3S3Z0zpbyVsgqCkE4Y750I-ILA@z>

Hi Matthew,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Matthew-Brost/drm-sched-Add-several-job-helpers-to-avoid-drivers-touching-scheduler-state/20251127-054955
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20251126214748.650107-9-matthew.brost%40intel.com
patch subject: [PATCH v6 8/8] drm/xe: Avoid toggling schedule state to check LRC timestamp in TDR
config: x86_64-randconfig-161-20251128 (https://download.01.org/0day-ci/archive/20251129/202511291102.jnnKP6IB-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202511291102.jnnKP6IB-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/xe/xe_lrc.c:2392 xe_lrc_timestamp() error: uninitialized symbol 'new_ts'.

vim +/new_ts +2392 drivers/gpu/drm/xe/xe_lrc.c

94c0c481e1bd20 Matthew Brost         2025-11-26  2363  u64 xe_lrc_timestamp(struct xe_lrc *lrc)
9b090d57746d96 Umesh Nerlige Ramappa 2024-05-17  2364  {
94c0c481e1bd20 Matthew Brost         2025-11-26  2365  	u64 lrc_ts, reg_ts, new_ts;
82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2366  	u32 engine_id;
82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2367  
82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2368  	lrc_ts = xe_lrc_ctx_timestamp(lrc);
82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2369  	/* CTX_TIMESTAMP mmio read is invalid on VF, so return the LRC value */
82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2370  	if (IS_SRIOV_VF(lrc_to_xe(lrc))) {
94c0c481e1bd20 Matthew Brost         2025-11-26  2371  		new_ts = lrc_ts;
82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2372  		goto done;
82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2373  	}
82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2374  
82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2375  	if (lrc_ts == CONTEXT_ACTIVE) {
82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2376  		engine_id = xe_lrc_engine_id(lrc);
82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2377  		if (!get_ctx_timestamp(lrc, engine_id, &reg_ts))
94c0c481e1bd20 Matthew Brost         2025-11-26  2378  			new_ts = reg_ts;

uninitialized on else path.

82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2379  
82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2380  		/* read lrc again to ensure context is still active */
82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2381  		lrc_ts = xe_lrc_ctx_timestamp(lrc);

lrc_ts is re-assigned here.

82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2382  	}
82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2383  
82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2384  	/*
82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2385  	 * If context switched out, just use the lrc_ts. Note that this needs to
82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2386  	 * be a separate if condition.
82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2387  	 */
82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2388  	if (lrc_ts != CONTEXT_ACTIVE)
94c0c481e1bd20 Matthew Brost         2025-11-26  2389  		new_ts = lrc_ts;

uninitialized on else path.

9b090d57746d96 Umesh Nerlige Ramappa 2024-05-17  2390  
82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2391  done:
94c0c481e1bd20 Matthew Brost         2025-11-26 @2392  	return new_ts;
94c0c481e1bd20 Matthew Brost         2025-11-26  2393  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

