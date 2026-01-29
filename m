Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA323793C7
	for <oe-kbuild@lists.linux.dev>; Thu, 29 Jan 2026 06:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769669973; cv=none; b=JmyK0klco0XkSweysW/Mp6v8r5rs9j/2E+WLbF/aWl06l/zkUTXlrBy92nOiuG5ii67+RuzjJFuJZJvk2G054B6CHVaOkE31K8VLsozpZdIKSj8QvIO2KP+xV8dSs711cPfJXkABswqjJ29o3O0dkIpE5VgqYHj/lPP4yYRy29s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769669973; c=relaxed/simple;
	bh=gLEPIN3ZxJ1dsRf66dbZLgFDHqnBT87yg74ODOFhpMA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=gogFFmIopXyKk3Vj1BIuIbIC3yaPVC2Glki48hriQJVY+TYZ4FVBbNHlC1z/8DNK9Pfk0+9ipgZ5Ce6BLXoE8oCRY4M1R/8Pgn6rMeQhLL2fiMbXRuaRTOQW81lCCvNkBgcom0EJ0HUl03CrkhS1g1q2oSwmOGEcJpIaw3IrLPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pnGaEjXl; arc=none smtp.client-ip=209.85.221.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pnGaEjXl"
Received: by mail-wr1-f68.google.com with SMTP id ffacd0b85a97d-42fbc305552so590214f8f.0
        for <oe-kbuild@lists.linux.dev>; Wed, 28 Jan 2026 22:59:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769669970; x=1770274770; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NHNJ1TQ1JR50Y6PheB8gKOVpv/Y5hdmXfj+3AJIB5y4=;
        b=pnGaEjXl8W+/8ERHeOfBt8P+X4DqQxCHyMXw2NdUfjs8MpXlpzQOMEInpFV6kHGAc0
         aIPwXYvcVtpyaW2lOjBLKkT0twe7HhDVANgRUwDAmvXN1wKGL11UgG/Q+Nlh7Wznya88
         dtInT1Mx+JaV1MCi1E2JEA7XRHtO3UE8Wra8Lm8dEcTGIic6w9hFVvx2sr8M1wuP8HzX
         KUFB9sQkmZIc+dL/8HIZ7h/2VUQ7BB8kPwmfw6G6ISHIFhQnytLxoYVpwfg/nfoejj14
         jMKs2W7SrO8e1DoLfYO81cTMgke3EsMzUZuMcYPCbPJ2OyRsmAlOWRWowhJn1LZt1rJl
         P5cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769669970; x=1770274770;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NHNJ1TQ1JR50Y6PheB8gKOVpv/Y5hdmXfj+3AJIB5y4=;
        b=gQh/SUzj6dd9nfp5kpT4Lc7jS56aXomzXzbOStzRYlrexSZICD3u+qtMbOSA2nAcMY
         jhW8F5uvMOB+t315WavUH+95VIs31Zwnt++UyCJvKPgeEvkdYrCqlqPu7FDczchtNEJo
         xENa2/ccaiMEapJ/jVYEsAcP296/cRbwfMEw6QvKaA5rxFp/8/OxXYoMXi4IqhkhDobA
         YnnAYw8LfFuiHxMYUIVg25IsEpY41ecimZTJEx5L69T5pNTjxWZjZpTIfhGC4QeL2PLF
         oIIPLUEdABi+3Cm5Y6efcMdamMWOM+7nuVm/1WC7JHbvSeR81CHZN6+fMQdz6sWoaqy3
         Tc8g==
X-Gm-Message-State: AOJu0YxyOnEoDbaypHt5h1aXKT0SGCArAwPLrLVRJPptB/Yky0+epz22
	5IJ5IVfgCV1ageEj4UvO3URlNbtSTmZaDVamePyVnA+3ED9YKNROjg255gJomJaweAjEKVEwD/t
	nLWG4
X-Gm-Gg: AZuq6aIXrm2VWGJI0nlIy3ClPUFA+/EfSr9OUvlsSipnw5TuhY7RnHcNjkW+YnOP2q1
	iTv5j99UkHWma0rVYD6sp/ZgIvThP9OhYq6SCC1hk83J+doENjKEvHEQrpf9f4pdRptG1pcjSHW
	7Ti2JHwMUcclrZXGVGbkNKTJlJ6RUc3nrjRX9YoPTIIgzGmwq9ZEUmWIStH4hu952H4WqvTYdeB
	RsLrmowU+KpnLddQZSe/fhEULBddwXreTHruVK0O75ItzXwJJabqyuES10ty3GgjwX2uJYzksja
	j1qrK9ZnI4fNJ487dSbE8Eb+tje9OEvp5R5n3z7QDV22D93W1ZUooc0efAOYH2yGYEnRI3/De6Y
	lluIHemEDl2Ax9v3v0YvnJDYfA6+ji3ZtzgvOV+i252v3Jwz2/cu3Ni/fCk4gQM85ztX++l0F1v
	niPUwY2T1TjiiScC4L
X-Received: by 2002:a05:6000:2312:b0:430:ff81:2961 with SMTP id ffacd0b85a97d-435dd1c8f14mr10282615f8f.51.1769669969615;
        Wed, 28 Jan 2026 22:59:29 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10e476dsm12482179f8f.4.2026.01.28.22.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 22:59:29 -0800 (PST)
Date: Thu, 29 Jan 2026 09:59:26 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	mathias.nyman@linux.intel.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org,
	raoxu@uniontech.com,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: Re: [PATCH 2/2] usb: xhci: add interrupter type
Message-ID: <202601290847.Cb6aLduh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128131504.124322-3-niklas.neronin@linux.intel.com>
Message-ID: <20260129065926.z6wAeeX_1OIq8ZgHVXkmjzonnB3z7ZYYfOQPXznhVGU@z>

Hi Niklas,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Niklas-Neronin/usb-xhci-move-Primary-Interrupter-IMODI-setup/20260128-211728
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20260128131504.124322-3-niklas.neronin%40linux.intel.com
patch subject: [PATCH 2/2] usb: xhci: add interrupter type
config: x86_64-randconfig-161-20260129 (https://download.01.org/0day-ci/archive/20260129/202601290847.Cb6aLduh-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202601290847.Cb6aLduh-lkp@intel.com/

smatch warnings:
drivers/usb/host/xhci.c:320 xhci_enable_interrupter() warn: variable dereferenced before check 'ir' (see line 317)
drivers/usb/host/xhci.c:340 xhci_disable_interrupter() warn: variable dereferenced before check 'ir' (see line 337)

vim +/ir +320 drivers/usb/host/xhci.c

bea5892d0ed274 Mathias Nyman  2025-04-10  313  int xhci_enable_interrupter(struct xhci_interrupter *ir)
52dd0483e822d0 Mathias Nyman  2023-02-02  314  {
52dd0483e822d0 Mathias Nyman  2023-02-02  315  	u32 iman;
52dd0483e822d0 Mathias Nyman  2023-02-02  316  
486b278520fd70 Niklas Neronin 2026-01-28 @317  	if (ir->type == INTR_NOOP)
                                                    ^^^^^^^^
Dereferenced.

486b278520fd70 Niklas Neronin 2026-01-28  318  		return 0;
486b278520fd70 Niklas Neronin 2026-01-28  319  
52dd0483e822d0 Mathias Nyman  2023-02-02 @320  	if (!ir || !ir->ir_set)
                                                    ^^^
Checked too late.

52dd0483e822d0 Mathias Nyman  2023-02-02  321  		return -EINVAL;
52dd0483e822d0 Mathias Nyman  2023-02-02  322  
bf9cce90da311a Niklas Neronin 2025-05-15  323  	iman = readl(&ir->ir_set->iman);
ff9a09b3e09c7b Niklas Neronin 2025-08-19  324  	iman &= ~IMAN_IP;
9f7f74735ac295 Niklas Neronin 2025-05-15  325  	iman |= IMAN_IE;
bf9cce90da311a Niklas Neronin 2025-05-15  326  	writel(iman, &ir->ir_set->iman);
52dd0483e822d0 Mathias Nyman  2023-02-02  327  
f5bce30ad25e74 Niklas Neronin 2025-05-15  328  	/* Read operation to guarantee the write has been flushed from posted buffers */
bf9cce90da311a Niklas Neronin 2025-05-15  329  	readl(&ir->ir_set->iman);
52dd0483e822d0 Mathias Nyman  2023-02-02  330  	return 0;
52dd0483e822d0 Mathias Nyman  2023-02-02  331  }
52dd0483e822d0 Mathias Nyman  2023-02-02  332  
e1db856bd28891 Niklas Neronin 2025-05-15  333  int xhci_disable_interrupter(struct xhci_hcd *xhci, struct xhci_interrupter *ir)
52dd0483e822d0 Mathias Nyman  2023-02-02  334  {
52dd0483e822d0 Mathias Nyman  2023-02-02  335  	u32 iman;
52dd0483e822d0 Mathias Nyman  2023-02-02  336  
486b278520fd70 Niklas Neronin 2026-01-28 @337  	if (ir->type == INTR_NOOP)
                                                    ^^^^^^^^

486b278520fd70 Niklas Neronin 2026-01-28  338  		return 0;
486b278520fd70 Niklas Neronin 2026-01-28  339  
52dd0483e822d0 Mathias Nyman  2023-02-02 @340  	if (!ir || !ir->ir_set)
                                                    ^^^
Same.

52dd0483e822d0 Mathias Nyman  2023-02-02  341  		return -EINVAL;
52dd0483e822d0 Mathias Nyman  2023-02-02  342  
bf9cce90da311a Niklas Neronin 2025-05-15  343  	iman = readl(&ir->ir_set->iman);
ff9a09b3e09c7b Niklas Neronin 2025-08-19  344  	iman &= ~IMAN_IP;
9f7f74735ac295 Niklas Neronin 2025-05-15  345  	iman &= ~IMAN_IE;
bf9cce90da311a Niklas Neronin 2025-05-15  346  	writel(iman, &ir->ir_set->iman);
52dd0483e822d0 Mathias Nyman  2023-02-02  347  
bf9cce90da311a Niklas Neronin 2025-05-15  348  	iman = readl(&ir->ir_set->iman);
e1db856bd28891 Niklas Neronin 2025-05-15  349  	if (iman & IMAN_IP)
e1db856bd28891 Niklas Neronin 2025-05-15  350  		xhci_dbg(xhci, "%s: Interrupt pending\n", __func__);
e1db856bd28891 Niklas Neronin 2025-05-15  351  
52dd0483e822d0 Mathias Nyman  2023-02-02  352  	return 0;
52dd0483e822d0 Mathias Nyman  2023-02-02  353  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

