Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A46FA25B0BA
	for <oe-kbuild@lists.linux.dev>; Wed, 13 May 2026 11:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778673079; cv=none; b=vDLRTp43mmqs4DdMPKIoVfYiy2FVUNeLyKBKvKIVLYmIh4e/BqK1sFNrOZWlPkYDjZEp5PGEpdemoHicZBLhyBBncaPbyntTtmTlarP9nwREF3Tbi3QjpJIu0+cD2MIfEa/0ekFDM2Wkiwtn4GJZ6UKxGDvmwAgIHvDK0ulXVA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778673079; c=relaxed/simple;
	bh=gLj256UuQEFx0YuMQ40nv8jxQjP+ERIhFntrksasQQs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kQsa2nhlAHXWdcO7Dkzmqm58TJetIlVPNQLBKBMjn2sOxi2pIUpi+3NqUwKoA10pWKEJFHF+7T/mXzqmqNHdJqvbQ7BQC+TMqmrEPFJJR/neOMa6lDBUhC9hfwLAYdMg2fzD8M35GAtByfVxcD2g908nnkpnjvreqoJ1DHThJ0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ox3yfk93; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ox3yfk93"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488b150559bso52208025e9.1
        for <oe-kbuild@lists.linux.dev>; Wed, 13 May 2026 04:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778673076; x=1779277876; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RWFQNDbf2rrK8r4ZmbR2jCjzyDHtlDs+g6TmKHPy/fw=;
        b=ox3yfk93Ck9qzTm/qTbwUFwAROTnqiVY2ylwxVfe6EhpW/HieS0NLooxKdpLhVOSfD
         22p7A+6ahBw/czYuxsgH6VVjo176pK8N8a/HHE82uNulFcSGQfVT5p7v7zlXdA451+3k
         qE79lNYG3vuORwCbHx7IXZDPIq5Os1Hx5FiLsgJvHZgfu1WUZX35uJ7MsBN9QWrBETL4
         osNLBu3RDJJovjTo7ws8keCd9ho8O+byq+FH0wdbvLgG9zQAvJt7Dp8iuC1rH++01Hx2
         0WakvIiEMUI2udmlhYDzlYP5G8IlRuZCQbzkrEO+QkLSEPvAViGV8cgM2gk1P+KEOi7T
         f5Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778673076; x=1779277876;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RWFQNDbf2rrK8r4ZmbR2jCjzyDHtlDs+g6TmKHPy/fw=;
        b=d/BGqR95AfFZZ5xAsoeKu1Eq0L8kwzxT3iQLhDqq+eIQyi7xpVGzpH7rc1LsqSUTEf
         U7sdD7tiRdiBXJbTcZR02z3g2KzyeVl32VRyd/B0TVLNE1ZdQK9WOo2TbcjYX3lXS+rs
         e23S6fqaNQ9O0forfwgMBAbWukG9q+JX2Tcfes2Uq619bt9EFQw5J7LjQU5tlOrDNWoj
         a91Pru6SKkpVoy3AdE79lExZInkiLJ85OjIiVYZK52max/bavKYa44e/CB5RReQS3isZ
         lKVVKGIVFSJNU7xgICWU9k3QKwZ7/YB6pQraTAmCYLCcgi//n9Vlhl+BEiLR2Ltl3dWa
         lUeA==
X-Gm-Message-State: AOJu0Yy/Y7lZ3OnLO7EA9cFaujX++NmqI/GsXxeX3Fblx3M4AtrM5EMo
	6hJjAgX5Pw94TJlkP3tm7B6diszQEHimjc+EyezrUhErgZYnn8rP3Wzx2FvJoA==
X-Gm-Gg: Acq92OGiEG/RqK9rvqiMvwgUgpsizRFVelOusH15ITS8F66ed1j/+un5cl3cnb3tyJ0
	MW7sZeGc0JxSLcrwaCwujBYXL5OCj4fFoF1B/SvHYs+DeT7nhoSKe8B2VgE8jYl1sHx8vUlh7aX
	Ship636mnFPu9FF3wuvMaQWFzN/dzuOPlvcDCnCBuzkReucSAsQqe+N6zcEXSUjxT0XVINhpPfA
	r/Gf3UPi3vf6x0qE5J5Pd6bYO3Vr39/3Me+QyDe4vgZVFp3X/VtBPyAtYO11AWuh2y6fVOw+8cp
	7kdWtcQNTP4hZYmXOQXiStmtK4HJl7mgxZqs23aOGhM12GnLhgZb8PD+vKBCo/q25nLpdmEwdiP
	Fr6XnWnrLcc3c4JrwuUUucaqmC9W61huAooVkT8rIpGmZmDIgYkaMUpaf0+9iuIH6ortGYRhxCn
	TeBfMQBFmvDNfRdGt2rQMEZ3Idz6j2AA==
X-Received: by 2002:a05:600c:8b75:b0:488:7ff6:1f75 with SMTP id 5b1f17b1804b1-48fc9a3b8e2mr42923045e9.21.1778673075356;
        Wed, 13 May 2026 04:51:15 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e8f3e7829sm63658835e9.4.2026.05.13.04.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 04:51:14 -0700 (PDT)
Date: Wed, 13 May 2026 14:51:11 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Helge Deller <deller@gmx.de>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [deller-parisc:parisc-7.0-1 4/10] arch/parisc/kernel/drivers.c:928
 qemu_header() error: strcpy() 'boot_cpu_data.pdc.sys_model_name' too large
 for 'name_mpe' (81 vs 80)
Message-ID: <202605131913.dfb23qZE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260513115111.L6t7AsxvLwSNzKrVSm7lP_O2OmB60TyBExiS3HPVlQY@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-7.0-1
head:   1651d69443c3a5fc12f1dee1229d526e7af9020a
commit: 97cb9150ff2dd8bc87726a04045f1b3eda6f52b3 [4/10] parisc: Export model name for MPE/ix
config: parisc-randconfig-r072-20260513 (https://download.01.org/0day-ci/archive/20260513/202605131913.dfb23qZE-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.4.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605131913.dfb23qZE-lkp@intel.com/

smatch warnings:
arch/parisc/kernel/drivers.c:928 qemu_header() error: strcpy() 'boot_cpu_data.pdc.sys_model_name' too large for 'name_mpe' (81 vs 80)

vim +928 arch/parisc/kernel/drivers.c

a77ab0e7ce232a6 Helge Deller   2018-03-25  915  static __init void qemu_header(void)
a77ab0e7ce232a6 Helge Deller   2018-03-25  916  {
a77ab0e7ce232a6 Helge Deller   2018-03-25  917  	int num;
a77ab0e7ce232a6 Helge Deller   2018-03-25  918  	unsigned long *p;
97cb9150ff2dd8b Helge Deller   2026-01-28  919  	char name_mpe[80];
a77ab0e7ce232a6 Helge Deller   2018-03-25  920  
a77ab0e7ce232a6 Helge Deller   2018-03-25  921  	pr_info("--- cut here ---\n");
a77ab0e7ce232a6 Helge Deller   2018-03-25  922  	pr_info("/* AUTO-GENERATED HEADER FILE FOR SEABIOS FIRMWARE */\n");
a77ab0e7ce232a6 Helge Deller   2018-03-25  923  	pr_cont("/* generated with Linux kernel */\n");
a77ab0e7ce232a6 Helge Deller   2018-03-25  924  	pr_cont("/* search for PARISC_QEMU_MACHINE_HEADER in Linux */\n\n");
a77ab0e7ce232a6 Helge Deller   2018-03-25  925  
97cb9150ff2dd8b Helge Deller   2026-01-28  926  	pr_info("#define PARISC_MODEL     \"%s\"\n",
a77ab0e7ce232a6 Helge Deller   2018-03-25  927  			boot_cpu_data.pdc.sys_model_name);
97cb9150ff2dd8b Helge Deller   2026-01-28 @928  	strcpy(name_mpe, boot_cpu_data.pdc.sys_model_name);

The boot_cpu_data.pdc.sys_model_name[] buffer is 81 characters and
name_mpe[]  is 80 characters.

97cb9150ff2dd8b Helge Deller   2026-01-28  929  	pdc_model_sysmodel(OS_ID_MPEXL, name_mpe);
97cb9150ff2dd8b Helge Deller   2026-01-28  930  	pr_info("#define PARISC_MODEL_MPE \"%s\"\n\n", name_mpe);

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

