Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F4937A3A2
	for <oe-kbuild@lists.linux.dev>; Wed, 29 Oct 2025 13:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761743101; cv=none; b=iDK2Vv4//WlULAwsKH29z8+NlBrbOjh+eDbkSHF+mfHjHTu32j0NzhdHPmylyxXZte0srY1p5z7Qbo1wRjVEGv0ll12o0yb1b1AXsuOLK9vN1wfLThsehhYo/XOHw1n4USlQWqbTBfpWqVNmhkLcoQvIy3RHGEPQjmHsE2UN7Ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761743101; c=relaxed/simple;
	bh=+4qz3t4yf4eEmZo93DiOrVVwOxTfUvszSK5N7LjvsvU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZOYR5sT53Kbn5lvregGogL7gVojvFZt53npmjGvN5vjcTtcQPPfYfYZ2/OZs45SMnsD6Pka4iOFkOxysZTFWV58KrSJZhF2h9B8+1CmR4jEs5KtP4S1ZFiWE+EJu8YxvQx1xA7pTo5wozyk3W9WG5wJYh400nD/5s83AL6krQzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MxprdOPv; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MxprdOPv"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4710683a644so9763585e9.0
        for <oe-kbuild@lists.linux.dev>; Wed, 29 Oct 2025 06:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761743097; x=1762347897; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PiHv0xIwo5URyh1WiOT46CGWSFLf6eNjb7offUnDh3U=;
        b=MxprdOPvDUENdE06IW2aj8azXRTR5s4YLJZoTFTs68x5MvrO3LpA04uFsHmY4RviFC
         Lx8xgzX8TR6DacbN2B3Uaiv2HgiKVd3kn3qhTcWOhlmR/bR74vFDCi18k2+JikvFKFPh
         X0GVg4E47KDUrenYmc9Wj6qwuQcSxAU4P13vVrngHNk1oScXT26VWVWTXfADhSN1UHdT
         v3tYF7HVe0ADRYEvcSBdXuwYB8VRTc2drWR2nJqagphs+wejh8IoI9rdFYdCALrUp1Sp
         wOJfPBhaaF07pXBQcrRpZrM4MXxoy5Z/drVXcdaU2OXymhmWIztGy0VSEQbK+b6PD5kq
         SlBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761743097; x=1762347897;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PiHv0xIwo5URyh1WiOT46CGWSFLf6eNjb7offUnDh3U=;
        b=WQIGog/JRwWYxp/Eqk7s6Kr6zog2t3uxw/bgp6WORoNv3gLQ14t6WfVQt++pF2g81E
         NeRBL+OP4mdXZdzZBucdbiMzWjMUEo8heIj/mmMBoUEVAHt8Nf4HubV8y0Ig1Oh+7lO4
         EApOB9QAMowo6nqixNPNnnFP6WBeLSfv7g63QlTBdLeEDAyuF08TfYe+Ql5lIGioR5+U
         VqbiFX6bLawM3s8CdJTM2BEG5tdCTImPYB6gdkkQWoLUBzeXubBeKqLZGeJZBksEk0Bj
         gxIQU1DcOBPk6eYvsKNY+ib2qQhdxnv3lUkkVjvC+IkpwlB+31voklOKzJajSeSfQyw5
         m7xg==
X-Gm-Message-State: AOJu0Yx26rR/rVpBadU7TpDG7WgJaDOnWxiVzSnq4WT2eiBFVe6EwbXY
	qeNZbiSEh3c9Snc6/ulMHZBY03/WFGh+vAlAg87b8yCOVM8zcfdCSS2KduGGjJBKXDe/8vPlKgg
	RD5Ci
X-Gm-Gg: ASbGnct6DEzdOppX2i8tNq4yfTMVV/WImyPxedLHWuLHZrwniCbBSGG5dABdQfVLHL8
	NGwPMbrxmmkMgQad9jqdzVdRW/jlMXkTN5yp00v6FLupEv0zco91nT2ECx/PdGwP9zKGqUZ0OIl
	pni62PIpAg53Pnz4bFm8AT2+3KxD4qARn1wBEUSugV2E9JWZhavOb6VJO+joT2dwLVlOAUiICfZ
	SPrsKk0hsqf+GBvfib1zGr5vMnOsMGZ5oLYRoMS3QcPQ8kBA6NUFZrQ/a5H4bcMF16jryTFuO4s
	jaGKbvijPJg7ScppPyuxmLOeT5jTLms9SKdk7VOs9PAkjF5itSvtV7D3BXntZLnwj1aWf3+7WhF
	lsABTxkU2RpGEFMk/2yM7oCO3UkPQUPTQrahKzC5gDpQzUNOJtEKGqAtoZJe5/nUfbsF+/l2CID
	6KBWvgrQwzLGYWOQLWPgOoNDMYEzE=
X-Google-Smtp-Source: AGHT+IELUprTvXFy5TutsIHdtpTIaqE+eatCiHRjgq9hWYlqzQauO1k/gh5sk9oXLM4VV73mvackOg==
X-Received: by 2002:a05:600c:608a:b0:477:ede:d2b4 with SMTP id 5b1f17b1804b1-4771813e891mr60955315e9.9.1761743096560;
        Wed, 29 Oct 2025 06:04:56 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-429952ca569sm25713025f8f.12.2025.10.29.06.04.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 06:04:55 -0700 (PDT)
Date: Wed, 29 Oct 2025 16:04:52 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Austin Zheng <Austin.Zheng@amd.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Alex Deucher <alexander.deucher@amd.com>,
	Dillon Varone <dillon.varone@amd.com>, waynelin <Wayne.Lin@amd.com>
Subject: [linux-next:master 4371/4731]
 drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/display_mode_util.c:118
 dml_floor() warn: if statement not indented
Message-ID: <202510292021.XfUW1Zro-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20251029130452.V1AixKAVKs4jQl1m630CL06z4rPV_NtrAkq14Dc_HNI@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f9ba12abc5282bf992f9a9ae87ad814fd03a0270
commit: e6a8a000cfe6a1106c17ab4a47eb6dd21596968c [4371/4731] drm/amd/display: Rename dml2 to dml2_0 folder
config: arm64-randconfig-r073-20251029 (https://download.01.org/0day-ci/archive/20251029/202510292021.XfUW1Zro-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202510292021.XfUW1Zro-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/display_mode_util.c:118 dml_floor() warn: if statement not indented
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/display_mode_util.c:152 dml_max() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/display_mode_util.c:733 dml_get_num_active_planes() warn: if statement not indented
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml2_wrapper.c:527 dml2_validate_only() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml2_policy.c:208 dml2_policy_build_synthetic_soc_states() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml2_mall_phantom.c:468 dml2_svp_drr_schedulable() error: we previously assumed 'pipe->stream' could be null (see line 454)
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml2_mall_phantom.c:557 subvp_vblank_schedulable() error: we previously assumed 'subvp_pipe' could be null (see line 549)
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/display_mode_core.c:1213 CalculatePrefetchSchedule() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/display_mode_core.c:2755 TruncToValidBPP() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/display_mode_core.c:3176 CalculateDCFCLKDeepSleep() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/display_mode_core.c:3754 CalculateVMGroupAndRequestTimes() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/display_mode_core.c:4056 CalculateStutterEfficiency() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/display_mode_core.c:4206 CalculateSwathAndDETConfiguration() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/display_mode_core.c:4789 CalculateSurfaceSizeInMall() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/display_mode_core.c:5201 CalculateVMRowAndSwath() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/display_mode_core.c:6019 CalculatePrefetchBandwithSupport() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/display_mode_core.c:6201 CalculateMaxVStartup() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/display_mode_core.c:6923 dml_core_mode_support() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/display_mode_core.c:8380 dml_core_mode_programming() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/display_mode_core.c:9362 dml_core_mode_programming() warn: for statement not indented

Old smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/display_mode_core.c:1295 CalculatePrefetchSchedule() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/display_mode_core.c:1462 CalculatePrefetchSchedule() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/display_mode_core.c:1565 CalculatePrefetchSchedule() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/display_mode_core.c:2757 TruncToValidBPP() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/display_mode_core.c:4252 CalculateSwathAndDETConfiguration() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/display_mode_core.c:4794 CalculateSurfaceSizeInMall() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/display_mode_core.c:7220 dml_core_mode_support() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/display_mode_core.c:7469 dml_core_mode_support() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/display_mode_core.c:7883 dml_core_mode_support() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/display_mode_core.c:7954 dml_core_mode_support() warn: inconsistent indenting

vim +118 drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/display_mode_util.c

7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  116  dml_float_t dml_floor(dml_float_t x, dml_float_t granularity)
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  117  {
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28 @118  	if (granularity == 0)
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  119  	return 0;
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  120  	//return (dml_float_t) (floor(x / granularity) * granularity);
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  121  	return (dml_float_t)dcn_bw_floor2(x, granularity);
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  122  }
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  123  
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  124  dml_float_t dml_min(dml_float_t x, dml_float_t y)
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  125  {
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  126  	if (x != x)
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  127  		return y;
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  128  	if (y != y)
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  129  		return x;
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  130  	if (x < y)
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  131  		return x;
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  132  	else
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  133  		return y;
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  134  }
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  135  
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  136  dml_float_t dml_min3(dml_float_t x, dml_float_t y, dml_float_t z)
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  137  {
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  138  	return dml_min(dml_min(x, y), z);
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  139  }
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  140  
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  141  dml_float_t dml_min4(dml_float_t x, dml_float_t y, dml_float_t z, dml_float_t w)
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  142  {
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  143  	return dml_min(dml_min(dml_min(x, y), z), w);
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  144  }
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  145  
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  146  dml_float_t dml_max(dml_float_t x, dml_float_t y)
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  147  {
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  148  	if (x != x)
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  149  		return y;
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  150  	if (y != y)
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  151  		return x;
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28 @152  if (x > y)
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  153  		return x;
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  154  	else
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  155  		return y;
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  156  }
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  157  dml_float_t dml_max3(dml_float_t x, dml_float_t y, dml_float_t z)
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  158  {
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  159  	return dml_max(dml_max(x, y), z);
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  160  }
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  161  dml_float_t dml_max4(dml_float_t a, dml_float_t b, dml_float_t c, dml_float_t d)
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  162  {
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  163  	return dml_max(dml_max(a, b), dml_max(c, d));
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  164  }
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  165  dml_float_t dml_max5(dml_float_t a, dml_float_t b, dml_float_t c, dml_float_t d, dml_float_t e)
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  166  {
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  167  	return dml_max(dml_max4(a, b, c, d), e);
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  168  }
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  169  dml_float_t dml_log(dml_float_t x, dml_float_t base)
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  170  {
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  171  	return (dml_float_t) (_log(x) / _log(base));
7966f319c66d94 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c Qingqing Zhuo 2023-07-28  172  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

