Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F6A3AC0EA
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Mar 2026 09:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773911956; cv=none; b=SyHwpIRF7K+fgISVzGBrRZuRI3s+Qq+osYmCiNsxKPk1uPh457yWzsr0FeNNeK+2dHE+ZgjUFdT59HOuawSW2kaWLpVqFBov4bcn8Fu/IAc6T/qVr223IphShDRzEp5y/a2yw4RZWpAqgp17MUy0mipmvCk+ISlMNxPi7lbomQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773911956; c=relaxed/simple;
	bh=GB5iI2OcE4yKHFeakC6Myr25T9rgpaXfcCTFEzTcsT0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nkilkiuZR8ghRMh9OR3/nJO5Abr3c6dR43Kavde8QohdI0v9gwqI/e1LBarf+nRMpRg2b4rAh9rithJ4uxb4mHObeBQp/Qr3EfDRZhOSlArd6DC7Hn0FtTr264HBJLwV4ZNr9FMXAQUCEKG49gOAT7djceNQyg9/6ztXXlp10yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FcEGpRYK; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FcEGpRYK"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43b41b545d9so760862f8f.2
        for <oe-kbuild@lists.linux.dev>; Thu, 19 Mar 2026 02:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773911953; x=1774516753; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zpZQSPrVeEDWYWlHuZ5D//omLGWMD/Zc19CxNG+9ojY=;
        b=FcEGpRYK8zW7srrBkdqosgZ2GcMcZ5Z0B6XUHZv2hGqJCHJoxPLgyK2AbzgY8mU0u1
         YwGGmVcLNhj/ShZGap5k9H/hDtkXNHXzelhoCAjTl6rBCmeoc3YigJzBXkw0nOOSJFN9
         yO99E478YD+rOBVIx13IYN99hrEGaqs9wfHi7Gt9D9hWFULO+5eYowt7IUrgnUEKFLtY
         ZXE2bSSMkLMuZaWDf7nkZWUuB6npP0zxEYJ/+eYP93/xqe3ZYLluYo2LVcfw0XU2jQcD
         Pl1EbmIgAqydt1kbuBRo3GZ2Z4/AIc0sZGYYJrQu1awTKV+lXSZDR28vooCTI/TW9J7+
         FYJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773911953; x=1774516753;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zpZQSPrVeEDWYWlHuZ5D//omLGWMD/Zc19CxNG+9ojY=;
        b=KB/qIqdRTpTTOHEZCzBca+OJxs4XEATZU/DK9gXAD14i/U8nTv9mrKs3vRb21KjoRr
         3pjhQh7gIHQoYG+BN5u6t/W8HJsGpjm79qKe/1xVo0YNWUy8c+QtgUMUq9eRPKhdnkXy
         0aq4+K26aJsXAIktQdIp04d4dgPNBZQxkuKmApjPEvkP33ukVy53wsmCULzfa+z2mBrB
         NDeoO39fBCMOGRbUmpRZas2LeP/Apm0+9/Ua1yYGle/2/RuEPDsZEi+W4UkChuOm8gvD
         rTD5ZeAwdAKNI4Nyc1qJQmaYjVK0PItXmR/z32ZpcAmaXNyOZNhRiJxEojdX7FGiVpF8
         RWbw==
X-Gm-Message-State: AOJu0YzJi/3KABt4KzdN1jjqwYNHyNlo3mzONyhtLQEHvfi40pa4XIOx
	B6X4PBuR0e+nBIqGBKbZY5kxNzbi+l3XBCOOK6C55ZFqcfSZ3akDIQ2WjjVB00s//1//UMq/yzT
	LIY2L
X-Gm-Gg: ATEYQzwd/DAr3TgUX0VTw9BcuCNTGeDvNNVMCEwGXnSo/aVmxtaxFNKbvHHhpcqmGX9
	3mj95+C3tjh+GUM/NnNT7vnxAsb2pBHr3bBieRQXdju+e9Iel/cOsVBvCbI8lJexCGECw2khhj9
	ok+GLTQd9VBtQeiloQD/vBwTdHcFfy6QNSfsXlPT1IeGBiGZu0jEbOB0GrDjhRdh8PBiCsLhjv4
	AYNhgK07F2acDg/KhfVu5P/PE0eWNwtF9HMgupQfZrqBavJMe4BfEvtgH0+FwcCEkzpuSLseJfh
	tEYTRhNUuqHRR9iG6puNVzgBjtINI07papvLQd+U2vcyb+QECmLEQ17z5wLGRhCHXU5WloFpun8
	ReZrjcMtCm5cEYlDPqimuy0sLKNqVYZtYGuf4YnKAX1p0jFuYX1JmC7rVp6c7zJ8cmeZdT1WmeJ
	OHe4qBRfspQXgMXeOQDkbbK4399sIf
X-Received: by 2002:a5d:5f92:0:b0:43b:4352:1be6 with SMTP id ffacd0b85a97d-43b527cbc30mr11717924f8f.48.1773911952694;
        Thu, 19 Mar 2026 02:19:12 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b51892234sm14084598f8f.24.2026.03.19.02.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 02:19:12 -0700 (PDT)
Date: Thu, 19 Mar 2026 12:19:09 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rob Clark <robin.clark@oss.qualcomm.com>
Subject: drivers/gpu/drm/msm/adreno/a3xx_gpu.c:530 a3xx_gpu_init() warn:
 variable dereferenced before check 'pdev' (see line 525)
Message-ID: <202603191102.hueYyyPw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260319091909.OCOpWytgWBZoT-pbcaLM7hGHd-BLKF5oTnWlrQowF3c@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8a30aeb0d1b4e4aaf7f7bae72f20f2ae75385ccb
commit: 491fadb2b818e1d900229a1f8243de6458381306 drm/msm/adreno: Move adreno_gpu_func to catalogue
config: arm64-randconfig-r073-20260319 (https://download.01.org/0day-ci/archive/20260319/202603191102.hueYyyPw-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 4abb927bacf37f18f6359a41639a6d1b3bffffb5)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202603191102.hueYyyPw-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/msm/adreno/a3xx_gpu.c:530 a3xx_gpu_init() warn: variable dereferenced before check 'pdev' (see line 525)
drivers/gpu/drm/msm/adreno/a2xx_gpu.c:503 a2xx_gpu_init() warn: variable dereferenced before check 'pdev' (see line 500)
drivers/gpu/drm/msm/adreno/a4xx_gpu.c:642 a4xx_gpu_init() warn: variable dereferenced before check 'pdev' (see line 637)

vim +/pdev +530 drivers/gpu/drm/msm/adreno/a3xx_gpu.c

491fadb2b818e1 Akhil P Oommen 2025-11-18  518  static struct msm_gpu *a3xx_gpu_init(struct drm_device *dev)
7198e6b03155f6 Rob Clark      2013-07-19  519  {
7198e6b03155f6 Rob Clark      2013-07-19  520  	struct a3xx_gpu *a3xx_gpu = NULL;
55459968176f13 Rob Clark      2013-12-05  521  	struct adreno_gpu *adreno_gpu;
7198e6b03155f6 Rob Clark      2013-07-19  522  	struct msm_gpu *gpu;
060530f1ea6740 Rob Clark      2014-03-03  523  	struct msm_drm_private *priv = dev->dev_private;
060530f1ea6740 Rob Clark      2014-03-03  524  	struct platform_device *pdev = priv->gpu_pdev;
491fadb2b818e1 Akhil P Oommen 2025-11-18 @525  	struct adreno_platform_config *config = pdev->dev.platform_data;
                                                                                        ^^^^^^
Patch adds a dereference.

5785dd7a8ef0de Akhil P Oommen 2020-10-28  526  	struct icc_path *ocmem_icc_path;
5785dd7a8ef0de Akhil P Oommen 2020-10-28  527  	struct icc_path *icc_path;
7198e6b03155f6 Rob Clark      2013-07-19  528  	int ret;
7198e6b03155f6 Rob Clark      2013-07-19  529  
7198e6b03155f6 Rob Clark      2013-07-19 @530  	if (!pdev) {
                                                     ^^^^
But the old code assumed pdev could be NULL.  Probably the NULL checks
are unnecessary.

6a41da17e87dee Mamta Shukla   2018-10-20  531  		DRM_DEV_ERROR(dev->dev, "no a3xx device\n");
7198e6b03155f6 Rob Clark      2013-07-19  532  		ret = -ENXIO;
7198e6b03155f6 Rob Clark      2013-07-19  533  		goto fail;
7198e6b03155f6 Rob Clark      2013-07-19  534  	}

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

