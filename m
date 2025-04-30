Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B77C01D61AA
	for <oe-kbuild@lists.linux.dev>; Wed, 30 Apr 2025 05:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745990670; cv=none; b=DP0DwsYQTnevvgZn53fZt+EgxUaD3LoICRRuH8D+c9UxtDv68DGJd1q3LWYu5FsAu05k332ywpwjao0hf/HKKPYwo0YfPDEzu09utdkdw2+gzaF8ECA2UTFo1L+1kG239SXDa+8znb1d8WSXOiM22U8PEr+9z4B/H19EBJMpmWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745990670; c=relaxed/simple;
	bh=55JT5261bVS2EXv8rUw/QhyQ3sqHcb3Ltx//Zk+hVAk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nhE5akM6G7rHlL6Rl9PCejSZ6UFy8aYbx8a1KcfhJeYmgWxfzQcZnSmIHu15q5zSBcLPc2ok7xhxh35TW+1u1OujcCH3rKt3A6/gWPIpSo89irufmbbCRoRq55p368pLshtYu3wq+V2jR071tHJ6iGJEBzNDEGpbnxqIvuWcRsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iOFV5Ugy; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iOFV5Ugy"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-39c13fa05ebso4475138f8f.0
        for <oe-kbuild@lists.linux.dev>; Tue, 29 Apr 2025 22:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745990666; x=1746595466; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5f99SrtbLBJmNuFFManpzDVc11hL8EbEC+F5+6CLviM=;
        b=iOFV5Ugyloabi6R4egrx7XS6C3k/BiA/OimRfZ0L6apHt3yjgGw1WladUPad5Djc1f
         MnxnTx1m2knAq0yqVTDFguLsP60JPTVD3G66KxNTwA8elZcDMgN2iz2lFqgwLjZrLMsE
         /Q6z7SKTezQ65dXAgiTDKyBAUkeYD5syaQSCKvS+SpXK9U3GrL1sWcZdeqgTmyWf4wSy
         mZdFa3Jca/BuJEaDBF2lxGhjnpGfvXaokeDyxaMP2Ltail6LsMybbgT7g/DAh6CpNyFU
         DXzDOCpNT2Vg2ZUpMpDbLQHrMFh+3f5ojkIKZhovErw6Y/3H4auGh55kHZtRD9mkBAgJ
         dukQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745990666; x=1746595466;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5f99SrtbLBJmNuFFManpzDVc11hL8EbEC+F5+6CLviM=;
        b=CLL7z9/aC88Cs3wgo0SNgO+XUna1o+c6UoPpAg30WgyHSacrWmhGGn9Gds+gnJ/o+h
         wI/AW31br1n2/U/EX5QkmcviqmjaiaedijXX/jClwY+3mcKZSTysDdppzjJJ2qrUI1vN
         ECYVxPJUwDakv1TRab1AzFvlZxOhHxspQ5X0zbinXMpBCckrKluZspNVVFXJ/fsyId6D
         NVE3CY24h0f8W1p16jTZTTqFLpDPSqOMvrScOpyaPZiwgT/FTF+GBus8Arbq0y5qEt4U
         A9Z0xEVuQfvz5u/X5NPvhI519hBunOHqgDL9lFrds2nLY8V/q/Nc+vRQp169POTSQ5zO
         t3MA==
X-Gm-Message-State: AOJu0YwbGa5TousKfLftxZqCFNmgJLs1tFN43ZkUexbmXVySXMI+5pPm
	erieD9xe88FfPD4Tt+c5vI+Igpv4ec0It5FwKdlbXfCbIQ8pRuagbw8UvZ452vnox0N4ExLvaIl
	I
X-Gm-Gg: ASbGnctlOnGpvNCeRFkJiX3zvY/BjldyzOdmAhWBpRiZWrRM2mGYo+oOsi9nh0eTVs7
	xYWvtdX170VnFZin+wouWbcrx42B5pe1BIJaHI1kiWXt9VhuPguLHPpcUHXG/lS1AGq97l4jfGc
	uTkbMB8KF8cVCVA+RWwCL5NXO31BlJBuQuAS+foDcc/i8Yz+6ljHT6dpdwUyMuY4AwqsctdzBVm
	SMAf0mL57L/2utJiGgdW1RQybi8UtCbSU4PwR3sVWaxAOeK31jRPIsnvBhzXP4Y/2H2q9Uo+cB/
	iEeXuM2pjPsq/gPaHZ5P0vqelAUKJHXSPtXw+GaLFcmiaA==
X-Google-Smtp-Source: AGHT+IEq//O9F2hHo3wxliaOx9oK24wOUlFC8dcBqDSjZ2m0DTwqYxMnRmDdCWFa9TYFjuZgUaZTZA==
X-Received: by 2002:a05:6000:2ab:b0:3a0:8acc:4c5 with SMTP id ffacd0b85a97d-3a08ff34c45mr780827f8f.9.1745990666520;
        Tue, 29 Apr 2025 22:24:26 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a073e5d4b0sm15794623f8f.89.2025.04.29.22.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 22:24:26 -0700 (PDT)
Date: Wed, 30 Apr 2025 08:24:23 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, kernel@openeuler.org,
	Yu Liao <liaoyu15@huawei.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1597/1597]
 arch/x86/hyperv/hv_init.c:204 set_hv_tscchange_cb() warn: variable
 dereferenced before check 'hv_vp_index' (see line 195)
Message-ID: <202504300619.C8mjsdPt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20250430052423.2bSRxCf9NM8MEpgj3CF_wm3DqkS8yzY9jIc9HigZSf0@z>

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   a48a35466505c8a52da57596944bd0b4485e825f
commit: 1f51ce689904768e1e45fc37c687784abb6eb3ed [1597/1597] x86/hyperv: Fix NULL deref in set_hv_tscchange_cb() if Hyper-V setup fails
config: x86_64-randconfig-161-20250429 (https://download.01.org/0day-ci/archive/20250430/202504300619.C8mjsdPt-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202504300619.C8mjsdPt-lkp@intel.com/

smatch warnings:
arch/x86/hyperv/hv_init.c:204 set_hv_tscchange_cb() warn: variable dereferenced before check 'hv_vp_index' (see line 195)

vim +/hv_vp_index +204 arch/x86/hyperv/hv_init.c

93286261de1b46 Vitaly Kuznetsov    2018-01-24  190  void set_hv_tscchange_cb(void (*cb)(void))
93286261de1b46 Vitaly Kuznetsov    2018-01-24  191  {
93286261de1b46 Vitaly Kuznetsov    2018-01-24  192  	struct hv_reenlightenment_control re_ctrl = {
93286261de1b46 Vitaly Kuznetsov    2018-01-24  193  		.vector = HYPERV_REENLIGHTENMENT_VECTOR,
93286261de1b46 Vitaly Kuznetsov    2018-01-24  194  		.enabled = 1,
93286261de1b46 Vitaly Kuznetsov    2018-01-24 @195  		.target_vp = hv_vp_index[smp_processor_id()]
                                                                             ^^^^^^^^^^^
Dereference

93286261de1b46 Vitaly Kuznetsov    2018-01-24  196  	};
93286261de1b46 Vitaly Kuznetsov    2018-01-24  197  	struct hv_tsc_emulation_control emu_ctrl = {.enabled = 1};
93286261de1b46 Vitaly Kuznetsov    2018-01-24  198  
93286261de1b46 Vitaly Kuznetsov    2018-01-24  199  	if (!hv_reenlightenment_available()) {
93286261de1b46 Vitaly Kuznetsov    2018-01-24  200  		pr_warn("Hyper-V: reenlightenment support is unavailable\n");
93286261de1b46 Vitaly Kuznetsov    2018-01-24  201  		return;
93286261de1b46 Vitaly Kuznetsov    2018-01-24  202  	}
93286261de1b46 Vitaly Kuznetsov    2018-01-24  203  
1f51ce68990476 Sean Christopherson 2024-04-26 @204  	if (!hv_vp_index)
                                                             ^^^^^^^^^^^
NULL check is too late.

1f51ce68990476 Sean Christopherson 2024-04-26  205  		return;
1f51ce68990476 Sean Christopherson 2024-04-26  206  
93286261de1b46 Vitaly Kuznetsov    2018-01-24  207  	hv_reenlightenment_cb = cb;
93286261de1b46 Vitaly Kuznetsov    2018-01-24  208  
93286261de1b46 Vitaly Kuznetsov    2018-01-24  209  	/* Make sure callback is registered before we write to MSRs */
93286261de1b46 Vitaly Kuznetsov    2018-01-24  210  	wmb();
93286261de1b46 Vitaly Kuznetsov    2018-01-24  211  
93286261de1b46 Vitaly Kuznetsov    2018-01-24  212  	wrmsrl(HV_X64_MSR_REENLIGHTENMENT_CONTROL, *((u64 *)&re_ctrl));
93286261de1b46 Vitaly Kuznetsov    2018-01-24  213  	wrmsrl(HV_X64_MSR_TSC_EMULATION_CONTROL, *((u64 *)&emu_ctrl));
93286261de1b46 Vitaly Kuznetsov    2018-01-24  214  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

