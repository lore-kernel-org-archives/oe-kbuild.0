Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D7730F7EE
	for <oe-kbuild@lists.linux.dev>; Thu,  6 Nov 2025 13:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762434616; cv=none; b=ZcMNJO/uLxXeSIU5P1Fr8ajTHEzYdueygdv+Ghj6ZduDLKPNAw/glluLIh/DD1Q1JthMRBWQD60U0PtHsNH4KwHbLuJ1Xgl/O7DUpb1Vll0u5nB0zyUpndnoxS7UOgZ3niuuBOM3hHmJRJz9geJrjN1Oo8PRpf8n1OwdQZwv+Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762434616; c=relaxed/simple;
	bh=QVY/AYM5oY5fMTDiOLcTDfmGhegxKbaFzRVX886wGAU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kyWijFuuzTVU1NziQe+m7QM+mE2WzyV6J0qD5WBet6mWQRFhcegg8vXQwMhPpbcjmX82xQEEozb/kdyaruyeT3ws5PlRbf+nMQ6l7M4qLyNrifH8SEwccG2fweVcrZvs0uUiW5GxiuyvTL9f4HT0gMyGPotxw4OCW+klI3fIPYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MQMMDQcc; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MQMMDQcc"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b3e7cc84b82so184313466b.0
        for <oe-kbuild@lists.linux.dev>; Thu, 06 Nov 2025 05:10:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762434612; x=1763039412; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t28efrrGHhAa89xd4/lbe98NRmddX9nmQ/RG7kZgsm4=;
        b=MQMMDQccDYzbGOMx9ONqQEbw5vk2nW9L+3642mHn33lJVMoADfsw95SgyVc3NNjg01
         SxSbP/ajvc0lU2oXFE7mr5DkKHtdAxVGE1GoVvnJlC6nJK2vSBfvpfczTMMdAfGkt/S0
         tx/REU70WzrlYuCN4A/qEdY3zEizDuPnOgwDnNc0LTvjxuRA+kQM/y5/ajhPPnHiXInN
         TeWf4avsgrh3pXRDR5w9J7DPHD9cvbYdzFAKkwMcZto+9t3vWdDN3TKZITi9eWa/VSIS
         dbK+r2xuI1fgBhuhqw2Pd6U0Ry9C4QDqrO3I8npOWER0ETaTKknjV5CDGpWCq+lDBiED
         n33w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762434612; x=1763039412;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t28efrrGHhAa89xd4/lbe98NRmddX9nmQ/RG7kZgsm4=;
        b=sa5yT0IbTtRUBfAZijqFyYIl1Nxgcw6N8ZzJ7IrUufw8bkfAQiJVOSGs0M/n68fKrS
         O/EuK6bjmmbKUMP/IvuXELOxHhHqeLtD0Q1K4UJcogVwAiotX7cUKg6krQ4yFXlFgWmY
         3uvwSKOqDg0C3kaoXAxGPt100UwEbWMpdKtD+fykHuRCVmM//M7RFHHqz7pwmYbIabX9
         m7Bm++i2nlA77f9oF38A1lIWufu7NbbQrSyTf23Ug9zEf4BicNoMROWSK27iGcsq//re
         MaoCdUB2F1TYo2XFapc3Q5Ps6InCnXk610u770Y0aCU7/IuXMaZ/Xb6qaS3iGPi5grMv
         CVhQ==
X-Gm-Message-State: AOJu0YxSNl9UEngaHVMwUffYmXUe1DbmiUNF/bxlemgWwgtrj5IUXOgW
	uZnka6dxRI3dtfhp2HXbEGJkOSpRdJVElAzKC1opl84z1C95ywbw3DCdRGLKN0asOWZF+ywF+m3
	XQoZz
X-Gm-Gg: ASbGncsItNKZItsZmzp9pCxhnzMJenfuaYdcrh5pPNP3fBCFMU6C1rY26GPo7xvS3u9
	Jw5aMWD8+slc4nuK2hY/j65fDUEUK0r09TjVeKEnsgZUsp7P5MTSaDdjVDlffOJDqAKBgCjqFDt
	WblT4yCmUq5l9VmFNsLDA5IYobxh+eP4VaNEkTrlQovUzMs5AD/Y38aCjpwf1nPgreTyNiqf9jA
	yUF+Z5QXDcF+1iJPwJTKkkEWF0kvHPzMrgS97zcNGYKCPkBKa2tj74apAC2qXup08w5awYk3M8s
	wl/FFiwfpzQs+4LL27xDDBofEpCGBNZePVj918Fq7FIFOlKHg97+nFlPtpyWy11UBlZfkeFR2Uj
	YfHfzeTN4lFsgJTnB7EIEzB7+RTyafHXh+08aMag4dKb81cCoQp0VfX0mM0Uah+pSQlooEheAeZ
	UCwZfPOWw0O37t
X-Google-Smtp-Source: AGHT+IGDC3NDQYPTkkfUUoVyM/sJxUdHO2Lpp1MzeugUZlOM8vLQhbQSiv+7msu1x/Jy2tsYDRamhg==
X-Received: by 2002:a17:906:c103:b0:b6d:50f7:a805 with SMTP id a640c23a62f3a-b7265607354mr700966366b.59.1762434612174;
        Thu, 06 Nov 2025 05:10:12 -0800 (PST)
Received: from localhost ([87.213.113.147])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72896848a5sm207325966b.57.2025.11.06.05.10.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 05:10:11 -0800 (PST)
Date: Thu, 6 Nov 2025 16:10:10 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Dmitry Baryshkov <lumag@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rob Clark <robin.clark@oss.qualcomm.com>
Subject: drivers/gpu/drm/msm/msm_kms.c:251 msm_drm_kms_uninit() warn:
 variable dereferenced before check 'kms' (see line 235)
Message-ID: <9412d8fc-7bb8-456f-9911-8443303497a5@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   dc77806cf3b4788d328fddf245e86c5b529f31a2
commit: a409b78fcdf724422fa030bd5ef177ebf3b7608a drm/msm: move wq handling to KMS code
config: powerpc64-randconfig-r073-20251106 (https://download.01.org/0day-ci/archive/20251106/202511061924.Y0EaYmPu-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202511061924.Y0EaYmPu-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/msm/msm_kms.c:251 msm_drm_kms_uninit() warn: variable dereferenced before check 'kms' (see line 235)

vim +/kms +251 drivers/gpu/drm/msm/msm_kms.c

506efcba31296e Dmitry Baryshkov 2023-10-09  220  void msm_drm_kms_uninit(struct device *dev)
506efcba31296e Dmitry Baryshkov 2023-10-09  221  {
506efcba31296e Dmitry Baryshkov 2023-10-09  222  	struct platform_device *pdev = to_platform_device(dev);
506efcba31296e Dmitry Baryshkov 2023-10-09  223  	struct msm_drm_private *priv = platform_get_drvdata(pdev);
506efcba31296e Dmitry Baryshkov 2023-10-09  224  	struct drm_device *ddev = priv->dev;
506efcba31296e Dmitry Baryshkov 2023-10-09  225  	struct msm_kms *kms = priv->kms;
506efcba31296e Dmitry Baryshkov 2023-10-09  226  	int i;
506efcba31296e Dmitry Baryshkov 2023-10-09  227  
506efcba31296e Dmitry Baryshkov 2023-10-09  228  	BUG_ON(!kms);
506efcba31296e Dmitry Baryshkov 2023-10-09  229  
a409b78fcdf724 Dmitry Baryshkov 2025-07-05  230  	/* We must cancel and cleanup any pending vblank enable/disable
a409b78fcdf724 Dmitry Baryshkov 2025-07-05  231  	 * work before msm_irq_uninstall() to avoid work re-enabling an
a409b78fcdf724 Dmitry Baryshkov 2025-07-05  232  	 * irq after uninstall has disabled it.
a409b78fcdf724 Dmitry Baryshkov 2025-07-05  233  	 */
a409b78fcdf724 Dmitry Baryshkov 2025-07-05  234  
a409b78fcdf724 Dmitry Baryshkov 2025-07-05 @235  	flush_workqueue(kms->wq);
                                                                        ^^^^^^^
Dereferenced

a409b78fcdf724 Dmitry Baryshkov 2025-07-05  236  
506efcba31296e Dmitry Baryshkov 2023-10-09  237  	/* clean up event worker threads */
506efcba31296e Dmitry Baryshkov 2023-10-09  238  	for (i = 0; i < priv->num_crtcs; i++) {
506efcba31296e Dmitry Baryshkov 2023-10-09  239  		if (priv->event_thread[i].worker)
506efcba31296e Dmitry Baryshkov 2023-10-09  240  			kthread_destroy_worker(priv->event_thread[i].worker);
506efcba31296e Dmitry Baryshkov 2023-10-09  241  	}
506efcba31296e Dmitry Baryshkov 2023-10-09  242  
506efcba31296e Dmitry Baryshkov 2023-10-09  243  	drm_kms_helper_poll_fini(ddev);
506efcba31296e Dmitry Baryshkov 2023-10-09  244  
506efcba31296e Dmitry Baryshkov 2023-10-09  245  	msm_disp_snapshot_destroy(ddev);
506efcba31296e Dmitry Baryshkov 2023-10-09  246  
506efcba31296e Dmitry Baryshkov 2023-10-09  247  	pm_runtime_get_sync(dev);
506efcba31296e Dmitry Baryshkov 2023-10-09  248  	msm_irq_uninstall(ddev);
506efcba31296e Dmitry Baryshkov 2023-10-09  249  	pm_runtime_put_sync(dev);
506efcba31296e Dmitry Baryshkov 2023-10-09  250  
506efcba31296e Dmitry Baryshkov 2023-10-09 @251  	if (kms && kms->funcs)
                                                            ^^^
Checked too late.

506efcba31296e Dmitry Baryshkov 2023-10-09  252  		kms->funcs->destroy(kms);
506efcba31296e Dmitry Baryshkov 2023-10-09  253  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

