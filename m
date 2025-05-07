Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC0892E628
	for <oe-kbuild@lists.linux.dev>; Wed,  7 May 2025 08:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746607724; cv=none; b=MlIc3YyLLOWcSpmZ0lVZXXtJoSKDOHmuJqlaQ7QpuvmP3Qh4c0/zVyl8DKQpQINNJRQzXOyh9BFRtCCYPi5Rmsb7yhVZgeA7pa36JnHEyYZ79e5nVhFDdhFcZ13vTEeZ3UyCP15AZFYInHpRUDq4tyHTSlBTxSAGXc1FXQ6o4zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746607724; c=relaxed/simple;
	bh=+m39lKudG+KGHE5Tv48AFdqtKrSwFayTBXAteG/h9Pw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Sk4A7dZxJO4oEZ+K+P90tRwR85j48M7WU0WXu0IbSCjqQe2HQaIL0m+VM48pezwixYqwB0/2kaRTMkv1427EWrQ/CnD+wLlAJp26jd+E4BwucFbb5jVIkd7YGg3Ze6qYkPGnc0Rvn41GLhCSWicBg2x5L9B3V+Rac22wtoVoHfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wlwmJNTR; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wlwmJNTR"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-39149bccb69so5169751f8f.2
        for <oe-kbuild@lists.linux.dev>; Wed, 07 May 2025 01:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746607720; x=1747212520; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nBgnfkY9z9qCJQNftFtdClxcaD8FcIkvWFqLD7kPHvk=;
        b=wlwmJNTR6Ryk/UaOClWTqdtawMfJNk9FNgxy52VJrO9KVTkqSxiN9F7IhUIm3il8++
         2q3TIPbbIg8z51U6yZes+dbJr/jpeCJZUoAv/wulKhaFOwJnBolN94Bt5edWZmoMqoXg
         oXsTwYjFdqEVp2LyBW4Yo22Xs5YfIGEqBNUGV2aSq1CY1/A4T3m168H125Enus6zqkGP
         /4xSubwHudqGpOCqQenE+UTMRiy5OD6ppKJLvmerEXmI24b9U20C6k0tjVlt8YeJ9FXw
         sc77JdPdKNmaJQYCCpBlMWNGbu0aK2nXQm7HXods034hI+gbQ+GUvXBTIiSkLXNmMgBY
         hCHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746607720; x=1747212520;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nBgnfkY9z9qCJQNftFtdClxcaD8FcIkvWFqLD7kPHvk=;
        b=oNi01M16dH/0qnWxE1rC4K8/MSmQB3vjBp2IGkxVwORkRbt8LazH8S9lNKK/6RHSZd
         AbWojKu12chtBP0MhkuYAzP2and1eKHf+FToDFPHmG1ReqtTMliC3JiQeEOhBKTC111l
         6zxVN4vIjkQI7nlHJ+3ve4+Ld/XALX4WzrKh7eDsnrw3jrIxks9JOGY6yC21Zxfm/zDY
         /D/DhN4mFs+++1mgh4+5P8eUqgqRyl2rgIxfwJ4qCSTo07RTtPrrmJPetSpLDz/03Elp
         mabQpazcHyFubLyY+fjKpyrcgf+Tf08mbb4Pn8PskV0sFhYnMQHmRU2O7lAJD5aKVG2x
         kCyA==
X-Gm-Message-State: AOJu0YzqJTMBD2hd1fiK/PIiArg/zRvE3l4oROj/lEPlo8/U8u9k4ehR
	3WXbB4ZB+6E9aGjlpi8VIfEdwhCvNh3R+uCF7QOBTRgIkVz1BuymBlnafpyQ+aHlyCLm/UnP1ZF
	Y
X-Gm-Gg: ASbGncvm4hxHhfJpWEHRGOZIH87XUkHAbgFgSci5tJRhKzc0YaV3HtcA8HXOibsBZPQ
	2szyAzU77q9MJTi1FIzM3ZPTxTCAbLfKfS8r4UjJyV9GhCU9THXtJjjrAeQmS1y9TZr4FP9QQ9c
	5ZT1JNsm7Od871YLW+u75U5VEoU4ti1CUX4prR2DTe9zbaDeEaq42j9Mq+Yw07xZ8V+1cxftfkQ
	3zGhzUO8ohdLMXwkWua8WwhOilrJ/SwkgY4MxeISZK2NMhlGmZQMA1lOpOmVL2H423NuRVChMYl
	6pwMjMliKv8P99ro6u6mqEBQolthBH/D5yROSMo80L1lGg==
X-Google-Smtp-Source: AGHT+IFc9lSBdsufNfXKTp+Kae37aTXL3sbAZSowdRrOxLEzSzHizlOJpowoJI0s4OulKge+kuv2ew==
X-Received: by 2002:a05:6000:4205:b0:39c:268b:8b66 with SMTP id ffacd0b85a97d-3a0b4a148ddmr1727972f8f.43.1746607720264;
        Wed, 07 May 2025 01:48:40 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a0b6d0e1ebsm554932f8f.80.2025.05.07.01.48.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 01:48:39 -0700 (PDT)
Date: Wed, 7 May 2025 11:48:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Alex Deucher <alexander.deucher@amd.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
	Sunil Khatri <sunil.khatri@amd.com>
Subject: [linux-next:master 1785/8679]
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:6992 gfx_v11_ip_dump() warn: if
 statement not indented
Message-ID: <202505071619.7sHTLpNg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20250507084836.HqZ54IHsyEL1mup42rdw3vZQIs3agz1s29tJ3AlE1eI@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0a00723f4c2d0b273edd0737f236f103164a08eb
commit: eb15a5d1aef59d1ec3aafe9d9f13953deb9977b6 [1785/8679] drm/amdgpu/gfx11: dump full CP packet header FIFOs
config: x86_64-randconfig-161-20250410 (https://download.01.org/0day-ci/archive/20250507/202505071619.7sHTLpNg-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202505071619.7sHTLpNg-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c:6992 gfx_v11_ip_dump() warn: if statement not indented

vim +6992 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c

fa73462dc04826 Sunil Khatri 2024-09-24  6965  static void gfx_v11_ip_dump(struct amdgpu_ip_block *ip_block)
b5812822d9c982 Sunil Khatri 2024-05-15  6966  {
fa73462dc04826 Sunil Khatri 2024-09-24  6967  	struct amdgpu_device *adev = ip_block->adev;
368c33ac8ab984 Sunil Khatri 2024-05-22  6968  	uint32_t i, j, k, reg, index = 0;
b5812822d9c982 Sunil Khatri 2024-05-15  6969  	uint32_t reg_count = ARRAY_SIZE(gc_reg_list_11_0);
b5812822d9c982 Sunil Khatri 2024-05-15  6970  
b5812822d9c982 Sunil Khatri 2024-05-15  6971  	if (!adev->gfx.ip_dump_core)
b5812822d9c982 Sunil Khatri 2024-05-15  6972  		return;
b5812822d9c982 Sunil Khatri 2024-05-15  6973  
b5812822d9c982 Sunil Khatri 2024-05-15  6974  	amdgpu_gfx_off_ctrl(adev, false);
b5812822d9c982 Sunil Khatri 2024-05-15  6975  	for (i = 0; i < reg_count; i++)
b5812822d9c982 Sunil Khatri 2024-05-15  6976  		adev->gfx.ip_dump_core[i] = RREG32(SOC15_REG_ENTRY_OFFSET(gc_reg_list_11_0[i]));
b5812822d9c982 Sunil Khatri 2024-05-15  6977  	amdgpu_gfx_off_ctrl(adev, true);
368c33ac8ab984 Sunil Khatri 2024-05-22  6978  
368c33ac8ab984 Sunil Khatri 2024-05-22  6979  	/* dump compute queue registers for all instances */
33837d62a4cb5e Sunil Khatri 2024-05-31  6980  	if (!adev->gfx.ip_dump_compute_queues)
368c33ac8ab984 Sunil Khatri 2024-05-22  6981  		return;
368c33ac8ab984 Sunil Khatri 2024-05-22  6982  
368c33ac8ab984 Sunil Khatri 2024-05-22  6983  	reg_count = ARRAY_SIZE(gc_cp_reg_list_11);
368c33ac8ab984 Sunil Khatri 2024-05-22  6984  	amdgpu_gfx_off_ctrl(adev, false);
368c33ac8ab984 Sunil Khatri 2024-05-22  6985  	mutex_lock(&adev->srbm_mutex);
368c33ac8ab984 Sunil Khatri 2024-05-22  6986  	for (i = 0; i < adev->gfx.mec.num_mec; i++) {
368c33ac8ab984 Sunil Khatri 2024-05-22  6987  		for (j = 0; j < adev->gfx.mec.num_pipe_per_mec; j++) {
368c33ac8ab984 Sunil Khatri 2024-05-22  6988  			for (k = 0; k < adev->gfx.mec.num_queue_per_pipe; k++) {
368c33ac8ab984 Sunil Khatri 2024-05-22  6989  				/* ME0 is for GFX so start from 1 for CP */
a85cc86cce4183 Sunil Khatri 2024-07-09  6990  				soc21_grbm_select(adev, adev->gfx.me.num_me + i, j, k, 0);
368c33ac8ab984 Sunil Khatri 2024-05-22  6991  				for (reg = 0; reg < reg_count; reg++) {
eb15a5d1aef59d Alex Deucher 2025-03-20 @6992  					if (i && gc_cp_reg_list_11[reg].reg_offset == regCP_MEC_ME1_HEADER_DUMP)
eb15a5d1aef59d Alex Deucher 2025-03-20  6993  					adev->gfx.ip_dump_compute_queues[index + reg] =
eb15a5d1aef59d Alex Deucher 2025-03-20  6994  						RREG32(SOC15_REG_OFFSET(GC, 0, regCP_MEC_ME2_HEADER_DUMP));

It should be indented another tab.

eb15a5d1aef59d Alex Deucher 2025-03-20  6995  					else
33837d62a4cb5e Sunil Khatri 2024-05-31  6996  						adev->gfx.ip_dump_compute_queues[index + reg] =
368c33ac8ab984 Sunil Khatri 2024-05-22  6997  							RREG32(SOC15_REG_ENTRY_OFFSET(
368c33ac8ab984 Sunil Khatri 2024-05-22  6998  								       gc_cp_reg_list_11[reg]));
368c33ac8ab984 Sunil Khatri 2024-05-22  6999  				}
368c33ac8ab984 Sunil Khatri 2024-05-22  7000  				index += reg_count;
368c33ac8ab984 Sunil Khatri 2024-05-22  7001  			}
368c33ac8ab984 Sunil Khatri 2024-05-22  7002  		}
368c33ac8ab984 Sunil Khatri 2024-05-22  7003  	}
368c33ac8ab984 Sunil Khatri 2024-05-22  7004  	soc21_grbm_select(adev, 0, 0, 0, 0);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

