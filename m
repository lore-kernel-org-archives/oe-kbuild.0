Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30AB11EF080
	for <oe-kbuild@lists.linux.dev>; Thu,  8 May 2025 05:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746683419; cv=none; b=fYsuIN79BfQ8RfQY2UzR6CjUNgcCCfgF2VxqEVxSOBXMfAywtS5G4xGan0pSEtIIwxTViQI+RGREFzr976pNX2huCPoIbOeK98vMz+au3+ijp3KoHjw94VyFizhzhAdsyT35Qo2+wYuKPsXvGd1/ZpSGAFYF+rFbkhjkz5NDzro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746683419; c=relaxed/simple;
	bh=XjJ63kwcos7MHsAjYLwMK+Uzag2QYhybqntQ7hHSoN0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PD/NMsnPkFp5N2cqf+uBbGLD702RZ7EpJYXiwFehajmtKMto+fEhHMKhIqS+ctg8ezjnWqXe/xR2MUhNFLNO5ZiS7A5uAwUDiUdtrzEbAM7y6KGgm6afbe1UPWXIul+NmxkqWaTGLaKlGVR5AJXUx2moLsQ1Sp6LgcJYt9LYc/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BUtOEqdq; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BUtOEqdq"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43d0618746bso4176355e9.2
        for <oe-kbuild@lists.linux.dev>; Wed, 07 May 2025 22:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746683415; x=1747288215; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wcHeJgbKnjxJ5K5DRkNbMCSOEMXDAYtsepXEwY2gwck=;
        b=BUtOEqdqRpB5aRWVjuFW9NPAyUHGMfnu5pcJPZ0D5WukNCxY+93xI4ccunPWW4RMou
         vSNIItbIoV1eRs7A87FfsuzgIWvU+/O+ppcifXRJyNOcC6XtSdxRK6FvUbkvZbNdsdQO
         k4eT+OpkeErvMEoj2Agwc59+XTfdQmCB2jOe931mmeqPRmnflt5TJxOyl71tVfCpJy4W
         XZ/VjvM4C24PwlVQBAYyvoPh6UgmucKXU5oQrcpLmMbVvMTlfElIbY7gGlALTLzkM7L5
         r+f4tw6JJxgdFZYxD7yrHMs1dl1BzioJsv5djaQVGSrp42wqzS1rt75OplNXJu7AJo2O
         XxVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746683415; x=1747288215;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wcHeJgbKnjxJ5K5DRkNbMCSOEMXDAYtsepXEwY2gwck=;
        b=eb8Xoha1UH+UODUCEluIBNXfgOjvz909STSxHEIBjVCud+n8mAYy8iH7c2rSsQfgu9
         j39Dk0cFTky1PVmXPK7bWyje+jnVGpk4x3AKR8jSH9Wtah9cQRtXYtl3Ozs7QM+EnlMW
         NrzZM0qByOJnnmVurafvGEa9WNrWk6RJPBQhZgfYFCZHqPORIfL+dLv/OkcaYUC1sKqw
         ibag0GRIIGr2Ua/yAXm9MB4otBpFzlKoguk/5XMZpbl9Y/mXntSfT57QG4VvFTpo+NGH
         yDbqVPFm9O6k3HWZxnqRkFVkDOfHMt8PKQBRDN6OxG+lxG24+XGVkijfrbM4ahAmWGos
         xKeg==
X-Gm-Message-State: AOJu0Yx53UZHL7ruozjM9P0XgGs2WN5W6Fzz7rVEePLBeJ91zEeRobd3
	9roWgmdOVjSGLb/jNmZSKMSCmQXtO3ulAxliDbAKp1eMEtBHLbZZ8XsiQjUt4MqaC7/JP+cVzzC
	h
X-Gm-Gg: ASbGncs+AcKD7FUwn7SGI7ZfljXCI9xZJ68aqSI0v8GbLiN20g01/UDq4lTgezOXT0F
	d9Z0X7Yh6//H6y4pvjYlewV4CBnD6mrG/1VEI1dDexs3fo16vp0sEAn1D5iG8RDDb5h3GZw6eMS
	AM1dZhEScp2+x5h4oWq8ausd9XFQVPd5d3Ye1m1L55LuUm3LWV3KR9HDHFocOaHkNJDcZI2+IKf
	msmm9q4Gl17l1FrLtqNH/OMhZap9nhLE37uCRUBmwYkV4P0A1rxzBtt4Ms5NkXaGjcVE9xGE999
	0w18ENQMPYVkfkBKn7fiTQTBqqF58JT6aFtCblEqT2UmYw==
X-Google-Smtp-Source: AGHT+IG/ffPOSHPvA7Gk9i8hhcQ7yujUQiQdiRR7VNei6dUXA0jV9HvtaIF7yFHclkxLl+64FNu65g==
X-Received: by 2002:a05:600c:154e:b0:43c:ef13:7e5e with SMTP id 5b1f17b1804b1-441d44dd248mr41492605e9.26.1746683414804;
        Wed, 07 May 2025 22:50:14 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-442cd35fb09sm24121125e9.30.2025.05.07.22.50.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 22:50:14 -0700 (PDT)
Date: Thu, 8 May 2025 08:50:11 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Arvind Yadav <Arvind.Yadav@amd.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Alex Deucher <alexander.deucher@amd.com>,
	Sunil Khatri <sunil.khatri@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: [linux-next:master 6980/9308]
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c:856
 amdgpu_userq_wait_ioctl() warn: missing error code 'r'
Message-ID: <202505080458.rnV8YfiY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20250508055011.aFVn_NY7V5areOAXaAjDgXPkngadlz5RjC13pa8PNm8@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   08710e696081d58163c8078e0e096be6d35c5fad
commit: 56801cb83c8c95ae23ea576570c75a01c1f07774 [6980/9308] drm/amdgpu: remove DRM_AMDGPU_NAVI3X_USERQ config for UQ
config: loongarch-randconfig-r071-20250502 (https://download.01.org/0day-ci/archive/20250508/202505080458.rnV8YfiY-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202505080458.rnV8YfiY-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c:856 amdgpu_userq_wait_ioctl() warn: missing error code 'r'

vim +/r +856 drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c

a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  835  		/* Retrieve syncobj's fence */
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  836  		for (i = 0; i < num_syncobj; i++) {
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  837  			struct dma_fence *fence;
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  838  
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  839  			r = drm_syncobj_find_fence(filp, syncobj_handles[i],
15e30a6e479282 Arunpravin Paneer Selvam 2024-10-30  840  						   0,
15e30a6e479282 Arunpravin Paneer Selvam 2024-10-30  841  						   DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT,
15e30a6e479282 Arunpravin Paneer Selvam 2024-10-30  842  						   &fence);
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  843  			if (r)
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  844  				goto free_fences;
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  845  
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  846  			if (WARN_ON_ONCE(num_fences >= wait_info->num_fences)) {
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  847  				r = -EINVAL;
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  848  				goto free_fences;
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  849  			}
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  850  
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  851  			fences[num_fences++] = fence;
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  852  		}
a292fdecd72834 Arunpravin Paneer Selvam 2024-10-30  853  
4b27406380b0b9 Arunpravin Paneer Selvam 2025-04-11  854  		waitq = idr_find(&userq_mgr->userq_idr, wait_info->waitq_id);
4b27406380b0b9 Arunpravin Paneer Selvam 2025-04-11  855  		if (!waitq)
4b27406380b0b9 Arunpravin Paneer Selvam 2025-04-11 @856  			goto free_fences;
                                                                                ^^^^^^^^^^^^^^^^
Set "r = -EINVAL"?

The kbuild-bot normally includes the whole function in the email
but if the function is long then it chops the end off...  I'm
assuming that the warning is correct without seeing the rest of
the function.  :P


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

