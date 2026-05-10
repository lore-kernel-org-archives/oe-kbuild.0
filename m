Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D96C137B03E
	for <oe-kbuild@lists.linux.dev>; Sun, 10 May 2026 09:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778406254; cv=none; b=bcqsD5Ai+6bqnfzA2QIgo2JVERk8i+MBbSGJLuGKkB0MJXgglFTjsntn+9x8RxRZ75B8paXcO8/7I1tMyk+vV6wEhOcOvuawQtxTh/K7pzTXFzLPU5i6b+u9ZfHvzwAi7Xi//qjSaX7u1CHjItQ8s4/2odm9YCrWW1vHh4w4bII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778406254; c=relaxed/simple;
	bh=qyRvU2ewFxk+SOvc53gWA+FNMrni3HtycJO+LFdYRPo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Btmc6Dm1z6u8oL1N8gcXN0Rc/38wM58o3K9I+osZnNc9jMrAGwu2ClAfqZWeZeBjomnoVk/2d6U8MrFJ4fh5So3SJtVNmc86sYFsinw8tpmRiIBArzRXeWsGP62G8cTG0+6IepIponwVPGAu/E0gHACxm0sgDeywsnWfYYawa6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NQ7605zJ; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NQ7605zJ"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-5102582e237so25698221cf.2
        for <oe-kbuild@lists.linux.dev>; Sun, 10 May 2026 02:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778406251; x=1779011051; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bg4KSW5FUBoXpSa52FLrPJXp+ik2dKNDav8nStgOYuQ=;
        b=NQ7605zJBdm8QPviIGk8nB4PElQqntXtuFCSLb7pLwa4jD3Zy6/WRClELt+hqSdrzN
         L1KQTlT6l7y3Vkof8DtrBqUWdUP6a/rpmuQz8BgkTjWGsXwf7PGSLWOSZ8XM7RXf6Ga2
         hS6D1jbq8SY2oOlAqJKzav2KtWay4PiXx3x1eGHceyoNa8XeRFNC6m3n7BreLnopKvec
         rN4fNAlUzcwilJwg1m+87w+Glu4M/yvgiwHrNIn94Ds/FkoendDyGqcmtX7WGfm0SeSe
         xbXnak9MNk7Yp3FLp+FjO985jmxEpXtayl644iVKJOZ+tNJaSwHy9VRwVHLWeEHpUBod
         Omeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778406251; x=1779011051;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bg4KSW5FUBoXpSa52FLrPJXp+ik2dKNDav8nStgOYuQ=;
        b=MLA0P43PReiD+9CeDH2TbB6Dvn4qoCRlMCvuD6KBpMhcJtbSAq4+8Z+MoJO5/An0tT
         6txCgzeSFeQp5Ss/zX94Yd+qzMvLmxMRl0078ac8r92LY1KSvuyKN+eRxHKjJB7DM/rv
         z9/JiPitAm20IX6nKrBNbXTrZAi1Vceqvv+HOqrbrcM5oAliUaLLapnb2GexRCrf0qf8
         hOXvrPtuEm8k4AKjFBHLedST+y8bCuCW//lZ6H6fCu8baOsvhVlPSNS99A9yfcCFwEwU
         Q0Z9gWkTH+0THVHzciHT4z2fh48TxOhCQOEeazwvO5CURK/VjFIATzeQevG4zJPSWyH8
         N4PQ==
X-Gm-Message-State: AOJu0YyoUA4WWk/2oAAEfsLxhCRQ/dTFjQ9eVSUvUqlpXmxhAFlkKgoL
	e85EgRnbH4kpjNtBDxiZGnvKt7eiHknVszip1//j/DE2fhaZi3jJ/6MLaGoJGMVx
X-Gm-Gg: Acq92OE24xEdS+cnZGgFTxMDhfwnk3iLlKyn+YYlrlsjjudTyqY25Z4vS0u+rir5Io/
	3tao6SXQcvL5QCRH1pqo1QWJWjWLvzV+AcImHBD/LYgClds7lLa90dmHULRkJxyjTxc3kFuvleI
	btwXPT9x8q3JqjNubmQOWaEp14aPvly/KdGtb3nMz8TOEAniXjILtFyWk1aiU3w2kDO9qurFuSX
	cevJ/xvV5UgTYtL9i8nsFGPH7M7Dd4oevuexktZxFXTY+mTaDXAxXafz3tjtl5POTLpYVWZFq7D
	0sOdgcxWXuxuk3zAN5XN0LkK2RAazC3zg1wW6i5g+tDevYUOd2m/OZ3ijsQtGIOPgNSaVIzVAj4
	iYstmasHA1NqQh61N3TkzlgLHB0sMlKH/oM8yA3TpXEso8wz6bqL2UCTK5Tf+EzKEtA+FWWyxpT
	3ZAbAfLI7LpbfUemX8Tw==
X-Received: by 2002:ac8:5acf:0:b0:50f:b9e6:e056 with SMTP id d75a77b69052e-51461fa413dmr281528671cf.29.1778406250667;
        Sun, 10 May 2026 02:44:10 -0700 (PDT)
Received: from localhost ([185.141.119.51])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b53c7accddsm281442956d6.36.2026.05.10.02.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 02:44:09 -0700 (PDT)
Date: Sun, 10 May 2026 12:44:03 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Svyatoslav Ryhel <clamor95@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>
Subject: [linux-next:master 2646/4394]
 drivers/memory/tegra/tegra114-emc.c:520 tegra114_emc_prepare_timing_change()
 warn: variable dereferenced before check 'timing' (see line 515)
Message-ID: <202605100506.wJFmI6IM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260510094403.MZrCJd5zl8eW-3Goqh0wn4oAcsmXU-r7hcmr9Epo618@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e98d21c170b01ddef366f023bbfcf6b31509fa83
commit: dce208b5405f40c36320bb0ee07e9df8f7f2bea4 [2646/4394] memory: tegra: Add Tegra114 EMC driver
config: um-randconfig-r072-20260509 (https://download.01.org/0day-ci/archive/20260510/202605100506.wJFmI6IM-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
smatch: v0.5.0-9065-ge9cc34fd

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605100506.wJFmI6IM-lkp@intel.com/

smatch warnings:
drivers/memory/tegra/tegra114-emc.c:520 tegra114_emc_prepare_timing_change() warn: variable dereferenced before check 'timing' (see line 515)

vim +/timing +520 drivers/memory/tegra/tegra114-emc.c

dce208b5405f40 Svyatoslav Ryhel 2026-04-27  507  static int tegra114_emc_prepare_timing_change(struct tegra_emc *emc,
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  508  					      unsigned long rate)
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  509  {
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  510  	struct emc_timing *timing = tegra114_emc_find_timing(emc, rate);
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  511  	struct emc_timing *last = &emc->last_timing;
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  512  	enum emc_dll_change dll_change;
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  513  	unsigned int pre_wait = 0;
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  514  	u32 val, mask;
dce208b5405f40 Svyatoslav Ryhel 2026-04-27 @515  	bool next_dll_enabled = !(timing->emc_mode_1 & 0x1);
                                                                                  ^^^^^^^^^^^^^^^^^^
Dereference

dce208b5405f40 Svyatoslav Ryhel 2026-04-27  516  	bool last_dll_enabled = !(last->emc_mode_1 & 0x1);
                                                                                  ^^^^^^^^^^^^^^^^
and another

dce208b5405f40 Svyatoslav Ryhel 2026-04-27  517  	bool update = false;
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  518  	unsigned int i;
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  519  
dce208b5405f40 Svyatoslav Ryhel 2026-04-27 @520  	if (!timing)
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  521  		return -ENOENT;

Checked too late.

dce208b5405f40 Svyatoslav Ryhel 2026-04-27  522  
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  523  	if (next_dll_enabled == last_dll_enabled)
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  524  		dll_change = DLL_CHANGE_NONE;
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  525  	else if (next_dll_enabled)
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  526  		dll_change = DLL_CHANGE_ON;
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  527  	else
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  528  		dll_change = DLL_CHANGE_OFF;
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  529  
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  530  	/* Clear CLKCHANGE_COMPLETE interrupts */
dce208b5405f40 Svyatoslav Ryhel 2026-04-27  531  	writel(EMC_INTSTATUS_CLKCHANGE_COMPLETE, emc->regs + EMC_INTSTATUS);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

