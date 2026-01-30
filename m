Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558E1309F13
	for <oe-kbuild@lists.linux.dev>; Fri, 30 Jan 2026 09:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769764391; cv=none; b=ZvNObLPYAgb7HUApDhSvhPJkqkW3SvI95rQyLUK8XUA5S3YpGTZu8D4yzBjN98U/OH57dxGjE7zfp1cSpI7CLSTpHAaoSk8T7WnELWxlQxJ9PvmwQzedseNBkJG+DiglTHJbcBsamHZ1p206fJaPrf1qEJkRChT3LjQDDiJ4cdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769764391; c=relaxed/simple;
	bh=t8UYww+TDiGcHieMgXdolrfxPtPok197UtAdeEyMnlo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tdoJKYimf9iVfYzLIzPm/umfg/BQbdl/D54JimIM0Jd3YgQ49rYb4hnHBsmCD8oaHsOr/wN00sInR9lk+7NfuC8Bx6Z2067GfyBYqi4QOba/UphrGpSa9sTglVdl075oZDGuyNAkHXbMB4DsZo5fIq4oWLcvrUXa6ppN0uJ+HA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aA4ncO4U; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aA4ncO4U"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4359a316d89so1495912f8f.0
        for <oe-kbuild@lists.linux.dev>; Fri, 30 Jan 2026 01:13:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769764388; x=1770369188; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8PaTB+iouQq5ulcy+7adL4mJjTEinFro96cQPMg4Cjk=;
        b=aA4ncO4U4gAqMoFCmH/55fmswx7Ck/nX9Kqlqx+O5EegMz1sg5ZdeIrkNxrDJcsj0+
         NMyFj9Ir/rVNU2bmdrNsKzkRx+KwjvSquxbHBbJHRJXC8jhet6i4lkzIjbwtiK1XqWew
         BCEJWSssDnz3oBivyPCtmMgzxY2i6bemY/nC+i3QSI/tNYtPyho7MjTh/C8zVxnGMZ0a
         JvKRC8fkGjd6NlkWC2ro9JpzFuRrCzKSxCfPUoYKDJn8o9Dd0Xggn8SyZyEsPchgPLCS
         M3RNKxZuVFU215En/eycEYSWd3SqPBwiFSm6KmIpqBBaOxpLGsdGi1Et8cDuOhATeRph
         WFUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769764388; x=1770369188;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8PaTB+iouQq5ulcy+7adL4mJjTEinFro96cQPMg4Cjk=;
        b=SQvO4+7GhoSok5QcYr14+7O2PAsdjTMZZKpsLT/PfEKVMz4UGNNe5+KrZgp9J7jIpz
         KM9lXripCfCBb2U6FCv8moLE6jdHKSDs29m+SntihTqW2ukdXBIu0LWUBMCoJGc/Bws0
         W4rX7Kmc0p/XOg3ZFMhTzx8ZKedgEWIGk+JLxWWaJRs6/GKEDNHEXoD/+outkcW+PklQ
         XXARdZ+xSMykeJTchCRy/iKzJSuLmQIAiZMYbkTd0wjGQyj9MEJOrqLigpcWN28pH0ev
         4sD0qCL+WCDWP9jHMkukKYfMJvIDHGk7AFwYnCVS5Wt9XLRQtKV9xQ597la++4GCIXWf
         qZ5A==
X-Gm-Message-State: AOJu0YyxQhLXGiheC7iFCh8hgqj92p9MxHKU7OSknyYIXzJCscUcdacq
	mclkeOsJPKzKlrjtsVV1xzXsricJfgVcFE3asvYv+jwFz0DwLIGJXRok3WwCTjHoxgYRCPrOmWk
	fU508
X-Gm-Gg: AZuq6aLIwcvxprK1uvU5W1g3V1ZGZty0m4hBy9rWvNOAJHQ2V0Z1GTzrPGOXSG8Hrwc
	JYFSL/+uZ8vIr4adt1J+DBVMK4XyAxDv465KZRG2/frn3iGcNgqkj2FUucMIKcIJ3fQqDk43qfn
	bDZPQg22xhOq5ORBhPNDJ3DBmRDItsTQ5zbVxHWe4UvdO7Hi3UwdZMtVG8nB0zaGU4ctXq3Bh+t
	Yk+D0YJJnPvOT78x+q4ehdTMXCEi3w+OQFxIccvR8jZUwRogQDpygs4qH/qaFbifk1/BUFP4Whe
	RtTjueUWnUfIf5lzxHr5/oUG0toCn8kxqO/A5il3SkRNwgqTek78ZmZ1qpOpPBcl4OiA+fdHCug
	EhTob1freLfIVRT4US0rJHm/492Syidm9akDDOrUJYXK5HmU6GIKBv4+BMX0Z1csBaW6o9pR7Wn
	vItNGx9s2SghmLptQh
X-Received: by 2002:a05:6000:4023:b0:435:dd87:fc2d with SMTP id ffacd0b85a97d-435f3aac80dmr3152582f8f.45.1769764388409;
        Fri, 30 Jan 2026 01:13:08 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10ed952sm21007737f8f.10.2026.01.30.01.13.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 01:13:07 -0800 (PST)
Date: Fri, 30 Jan 2026 12:13:04 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Helge Deller <deller@gmx.de>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 9772/10718] arch/parisc/kernel/drivers.c:928
 qemu_header() error: strcpy() 'boot_cpu_data.pdc.sys_model_name' too large
 for 'name_mpe' (81 vs 64)
Message-ID: <202601300419.4aPdW3N6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260130091304.Z_MZP2tZO5Qxe8-IZnvu2ICs1XGnGMAiHG-UQ6o7x8Y@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   33a647c659ffa5bdb94abc345c8c86768ff96215
commit: fd4444b2c07a64576d4bf10f7c58d79882ef3ab8 [9772/10718] parisc: Export model name for MPE/ix
config: parisc-randconfig-r071-20260130 (https://download.01.org/0day-ci/archive/20260130/202601300419.4aPdW3N6-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.4.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202601300419.4aPdW3N6-lkp@intel.com/

smatch warnings:
arch/parisc/kernel/drivers.c:928 qemu_header() error: strcpy() 'boot_cpu_data.pdc.sys_model_name' too large for 'name_mpe' (81 vs 64)

vim +928 arch/parisc/kernel/drivers.c

a77ab0e7ce232a Helge Deller   2018-03-25  915  static __init void qemu_header(void)
a77ab0e7ce232a Helge Deller   2018-03-25  916  {
a77ab0e7ce232a Helge Deller   2018-03-25  917  	int num;
a77ab0e7ce232a Helge Deller   2018-03-25  918  	unsigned long *p;
fd4444b2c07a64 Helge Deller   2026-01-28  919  	char name_mpe[64];
a77ab0e7ce232a Helge Deller   2018-03-25  920  
a77ab0e7ce232a Helge Deller   2018-03-25  921  	pr_info("--- cut here ---\n");
a77ab0e7ce232a Helge Deller   2018-03-25  922  	pr_info("/* AUTO-GENERATED HEADER FILE FOR SEABIOS FIRMWARE */\n");
a77ab0e7ce232a Helge Deller   2018-03-25  923  	pr_cont("/* generated with Linux kernel */\n");
a77ab0e7ce232a Helge Deller   2018-03-25  924  	pr_cont("/* search for PARISC_QEMU_MACHINE_HEADER in Linux */\n\n");
a77ab0e7ce232a Helge Deller   2018-03-25  925  
fd4444b2c07a64 Helge Deller   2026-01-28  926  	pr_info("#define PARISC_MODEL     \"%s\"\n",
a77ab0e7ce232a Helge Deller   2018-03-25  927  			boot_cpu_data.pdc.sys_model_name);
fd4444b2c07a64 Helge Deller   2026-01-28 @928  	strcpy(name_mpe, boot_cpu_data.pdc.sys_model_name);

source array bigger than the dest.

fd4444b2c07a64 Helge Deller   2026-01-28  929          pdc_model_sysmodel(OS_ID_MPEXL, name_mpe);
fd4444b2c07a64 Helge Deller   2026-01-28  930  	pr_info("#define PARISC_MODEL_MPE \"%s\"\n\n",name_mpe);
a77ab0e7ce232a Helge Deller   2018-03-25  931  
b137b9d60b8add Helge Deller   2023-08-31  932  	#define p ((unsigned long *)&boot_cpu_data.pdc.model)
a77ab0e7ce232a Helge Deller   2018-03-25  933  	pr_info("#define PARISC_PDC_MODEL 0x%lx, 0x%lx, 0x%lx, "
b63b4f1a79e6ad Helge Deller   2023-10-23  934  		"0x%lx, 0x%lx, 0x%lx, 0x%lx, 0x%lx, 0x%lx, 0x%lx\n\n",
b63b4f1a79e6ad Helge Deller   2023-10-23  935  		p[0], p[1], p[2], p[3], p[4], p[5], p[6], p[7], p[8], p[9]);
a77ab0e7ce232a Helge Deller   2018-03-25  936  	#undef p
a77ab0e7ce232a Helge Deller   2018-03-25  937  
a77ab0e7ce232a Helge Deller   2018-03-25  938  	pr_info("#define PARISC_PDC_VERSION 0x%04lx\n\n",

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

