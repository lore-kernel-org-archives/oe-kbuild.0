Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B906275846
	for <oe-kbuild@lists.linux.dev>; Fri, 15 Aug 2025 20:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755288555; cv=none; b=mHlMyMdC/CAG4bePFwi72YzTV76nXUXsNs9jxJ/i/z+qtnJ3ooC1FS+95KI881/rwWufhjRvYLUqm6etBF0kAVwM5jxaU3tsnognyagCHJnwLGrJqNj0docnBs4CkbOwRruWs84H3z1sXtZ28ZcGrRKJ+RHN/WA9JRbJA/jN+84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755288555; c=relaxed/simple;
	bh=/Wd3VWrcxK8FwJXvQ5m6mCq7KGk0k1mu0fT1fG6PFM4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GjRS33qxGX18ZOHd6AWEvsBT8F3ZwgBD9hIplRXvfz5wp63pMSv3EG5t8s78ZJse4+tEIeRqm7a5ZKMaAzzovzfbtO2ShIG1oBuda58iEZMI7n6PrVPe+UNJsuyJWAVPPm7ROcifXMs+NqZZSPtmPb21+2ceYavtnFfXfG6CrGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bQfsvmTI; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bQfsvmTI"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45a1b004a31so14751825e9.0
        for <oe-kbuild@lists.linux.dev>; Fri, 15 Aug 2025 13:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755288551; x=1755893351; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XC4l4mvdQjWt2PoJZYyU2f3QEIu7DJPU13DPmLDyyPM=;
        b=bQfsvmTIEGe46YLVOChQONF8P4QkzaQS39FczQAYVDSr6XQIb5KGg6/4YN934OMUCF
         iD5KRlDiy19ADKeSyZZ8JnvoquUO5ITu3EdXyief5MB9IlDzdWS/YTOR9brf1T35JcPI
         dimGsqMvEIj34+1BnfpzBo24g5nzYmoIG0ivYNpwqDMYLCQgn7UDHp31KEcbwieRL6/Y
         V2Bj8eGlLuJtqH81f+aYqmqOh6YWwLS+x1/yGa9kngZjWogNNYUoM2Lo4S/4uGOb/DIR
         6F6wOUaPCFlrG+UxVr/EUXXv8XcxDe6j3QCBqPirYNGBIptME6XwWGHyC0R2zeaei6JM
         JHQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755288551; x=1755893351;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XC4l4mvdQjWt2PoJZYyU2f3QEIu7DJPU13DPmLDyyPM=;
        b=xHJ3LEb2vjo6Gnx7RCdY3dTRovBeLdBCpvmReAN0D8qsWt6+yvTm9ueBOWPveRtJnz
         uivVzphlHxIXkF8zeSwRpoCWp0GCp9opLiorywt2gtPR6/SNQwIEoFzvrwvwK3fiDeD+
         SPuqaJgUugyPDpXsJxz6fUEKy4rxxUAczm5kgzMmr9tyqNeKzcYDeC11lNkDzbx+rqjU
         cd+rGT0/EAh0DOO+8uFS5j672FBWFmqJeX7gYH9ew/vXMWZ7u7NejZKaalLEuufB+qg9
         iDsymbhIEY6YjW5FZnMCgJOlLaoLn8iJSs6HoxvXOIW2vVAkQh3O8fHhM0WSNiz270e5
         SckQ==
X-Gm-Message-State: AOJu0YztQlPBfTSeKUBN5SCcFLwxHwym4wrMPnTSMU2TtAFa1TrdyVCR
	hUrM1/8LP3KLHOdUY4jlSSj5nt03QY0obAK9n4jzvT+eO5hztj73PmSU9UcT2MeIZVCKkl6YSHF
	wiSe8
X-Gm-Gg: ASbGnct7dNrXjNDKR8oPOPldKSGpFdlSTN9p4aJmWzKjqLT0rYkGCYqp0FSLRII3Ovz
	sCX5HvZOw4qWwHw38E2wao3LpTPivTHAefol+N8mzU3Nit16Kpm2y5jW/NkL6QyS8EvTzoNchMm
	iJkoUP5bUPtrNsoLbTtGD65KEZSeQwnyGx9xVa/PQ83pO7ATiH6J+O5F5ietlm3fya6oZ212qJ6
	wMkRVKC5LSYedyfftPd1L/gLDZAwT2QTDijp75mxi+uDEKLRhq2yaPnWZ7N2adwFsIrQslgHZ7s
	7XNso+YX3q/KaGUMOVSKTqIDT75kLassSaQ+8JDo/i0Q5jKw6T+y68N34iX61WpBLPZ9nJHIyoB
	ZLMuiuFzR5SzaUaW9NCbpC0kkJmVhZDVmSVnt6jP5guuDwtEio3fjaQ==
X-Google-Smtp-Source: AGHT+IGhuVTiJcVFFUbkMVwzNjTaUppuw+1a82sarMkViJSYWfUMqP33QuclrNy9kxu30LwUrpEXkQ==
X-Received: by 2002:a05:600c:3596:b0:458:add2:d4b4 with SMTP id 5b1f17b1804b1-45a21803ebdmr32166485e9.12.1755288549720;
        Fri, 15 Aug 2025 13:09:09 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3bb68079336sm2955638f8f.53.2025.08.15.13.09.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 13:09:09 -0700 (PDT)
Date: Fri, 15 Aug 2025 23:09:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Jani Nikula <jani.nikula@intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [drm-i915:for-linux-next 11/18]
 drivers/gpu/drm/i915/i915_switcheroo.c:21 i915_switcheroo_set_state() warn:
 variable dereferenced before check 'i915' (see line 18)
Message-ID: <202508160035.hmzuKiww-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20250815200905.AZAvh8I-6V1x5igvCV10_z4XmDNevohqUxq6enHE_nI@z>

tree:   https://gitlab.freedesktop.org/drm/i915/kernel for-linux-next
head:   63e0b17ae79a4365e874d7e2ff3816db2e6d55b5
commit: d2e184f8e16ab85876ddcc0779358fbfe5162414 [11/18] drm/i915/switcheroo: pass display to HAS_DISPLAY()
config: i386-randconfig-141-20250815 (https://download.01.org/0day-ci/archive/20250816/202508160035.hmzuKiww-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202508160035.hmzuKiww-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/i915/i915_switcheroo.c:21 i915_switcheroo_set_state() warn: variable dereferenced before check 'i915' (see line 18)
drivers/gpu/drm/i915/i915_switcheroo.c:55 i915_switcheroo_can_switch() warn: variable dereferenced before check 'i915' (see line 48)

vim +/i915 +21 drivers/gpu/drm/i915/i915_switcheroo.c

63bf8301aac492 Jani Nikula       2019-10-04  14  static void i915_switcheroo_set_state(struct pci_dev *pdev,
63bf8301aac492 Jani Nikula       2019-10-04  15  				      enum vga_switcheroo_state state)
63bf8301aac492 Jani Nikula       2019-10-04  16  {
63bf8301aac492 Jani Nikula       2019-10-04  17  	struct drm_i915_private *i915 = pdev_to_i915(pdev);
d2e184f8e16ab8 Jani Nikula       2025-08-06 @18  	struct intel_display *display = i915->display;
                                                                                        ^^^^^^^^^^^^^
Patch adds a dereference

63bf8301aac492 Jani Nikula       2019-10-04  19  	pm_message_t pmm = { .event = PM_EVENT_SUSPEND };
63bf8301aac492 Jani Nikula       2019-10-04  20  
63bf8301aac492 Jani Nikula       2019-10-04 @21  	if (!i915) {
                                                            ^^^^^
Checked too late.

63bf8301aac492 Jani Nikula       2019-10-04  22  		dev_err(&pdev->dev, "DRM not initialized, aborting switch.\n");
63bf8301aac492 Jani Nikula       2019-10-04  23  		return;
63bf8301aac492 Jani Nikula       2019-10-04  24  	}
d2e184f8e16ab8 Jani Nikula       2025-08-06  25  	if (!HAS_DISPLAY(display)) {
a273e95721e968 Thomas Zimmermann 2023-01-16  26  		dev_err(&pdev->dev, "Device state not initialized, aborting switch.\n");
a273e95721e968 Thomas Zimmermann 2023-01-16  27  		return;
a273e95721e968 Thomas Zimmermann 2023-01-16  28  	}
63bf8301aac492 Jani Nikula       2019-10-04  29  
63bf8301aac492 Jani Nikula       2019-10-04  30  	if (state == VGA_SWITCHEROO_ON) {
f54efb6ad03322 Jani Nikula       2020-04-02  31  		drm_info(&i915->drm, "switched on\n");
63bf8301aac492 Jani Nikula       2019-10-04  32  		i915->drm.switch_power_state = DRM_SWITCH_POWER_CHANGING;
63bf8301aac492 Jani Nikula       2019-10-04  33  		/* i915 resume handler doesn't set to D0 */
63bf8301aac492 Jani Nikula       2019-10-04  34  		pci_set_power_state(pdev, PCI_D0);
b8d65b8a5aea33 Jani Nikula       2021-11-11  35  		i915_driver_resume_switcheroo(i915);
63bf8301aac492 Jani Nikula       2019-10-04  36  		i915->drm.switch_power_state = DRM_SWITCH_POWER_ON;
63bf8301aac492 Jani Nikula       2019-10-04  37  	} else {
f54efb6ad03322 Jani Nikula       2020-04-02  38  		drm_info(&i915->drm, "switched off\n");
63bf8301aac492 Jani Nikula       2019-10-04  39  		i915->drm.switch_power_state = DRM_SWITCH_POWER_CHANGING;
b8d65b8a5aea33 Jani Nikula       2021-11-11  40  		i915_driver_suspend_switcheroo(i915, pmm);
63bf8301aac492 Jani Nikula       2019-10-04  41  		i915->drm.switch_power_state = DRM_SWITCH_POWER_OFF;
63bf8301aac492 Jani Nikula       2019-10-04  42  	}
63bf8301aac492 Jani Nikula       2019-10-04  43  }
63bf8301aac492 Jani Nikula       2019-10-04  44  
63bf8301aac492 Jani Nikula       2019-10-04  45  static bool i915_switcheroo_can_switch(struct pci_dev *pdev)
63bf8301aac492 Jani Nikula       2019-10-04  46  {
63bf8301aac492 Jani Nikula       2019-10-04  47  	struct drm_i915_private *i915 = pdev_to_i915(pdev);
d2e184f8e16ab8 Jani Nikula       2025-08-06 @48  	struct intel_display *display = i915->display;
                                                                                        ^^^^^^^^^^^^^
Dereference

63bf8301aac492 Jani Nikula       2019-10-04  49  
63bf8301aac492 Jani Nikula       2019-10-04  50  	/*
63bf8301aac492 Jani Nikula       2019-10-04  51  	 * FIXME: open_count is protected by drm_global_mutex but that would lead to
63bf8301aac492 Jani Nikula       2019-10-04  52  	 * locking inversion with the driver load path. And the access here is
63bf8301aac492 Jani Nikula       2019-10-04  53  	 * completely racy anyway. So don't bother with locking for now.
63bf8301aac492 Jani Nikula       2019-10-04  54  	 */
d2e184f8e16ab8 Jani Nikula       2025-08-06 @55  	return i915 && HAS_DISPLAY(display) && atomic_read(&i915->drm.open_count) == 0;
                                                               ^^^^
The old code assumed that i915 could be NULL.

63bf8301aac492 Jani Nikula       2019-10-04  56  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

