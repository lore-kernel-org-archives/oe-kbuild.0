Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87656EBB;
	Tue, 28 Mar 2023 07:25:00 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id n10-20020a05600c4f8a00b003ee93d2c914so8399994wmq.2;
        Tue, 28 Mar 2023 00:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679988298;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vvJlLxHt/dHBZTsUFDFiFq7b9g6WegP6MNxKcW+ZdtI=;
        b=JMacKHj07EMR4HS5C2ZjTmTPT626/hhvu04mm6Mh8qvcx1NedpI7mUQJMl6v5Xp0Ev
         IvHwDhHqMoq5j1nlyHWkx25M3YaZlQeiIsi9/Uchi6LH9NPJcwPEKfmd3p8KRnpff6Vh
         kkI1dVeiPiVhAFcJKACOBJFR9bCumq1MrLEGubfe8NgPMpV4FKVvGpflYk1SVSjtbeAR
         uCOj8/BfS48Iyy0Bj/r94eWKHJGa9Bzq6MFCi+aPGpWP8YnhvC38FxRIOzAa2kFFmPXa
         VLXnv1Imspnl1DV5d34pAgslJLtPSl4mUPwIXW6QJG500QEa0YaWf2DfngOqlQI3s1hr
         zaxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679988298;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vvJlLxHt/dHBZTsUFDFiFq7b9g6WegP6MNxKcW+ZdtI=;
        b=y7+oYDyqhtnrz7mqHpHN7YhymjzuvK3ZRdP/LNBgc0/DwxcC2vmIfEmHR5YbYhAS8+
         9LFyIIKfUztqbOiyRonyg+bNuLgebsTXYn/sbVV0p6fL9gpuvwXOo90/B1/DrWrKOp1q
         1NkENdOkkExAXhydKcoWs1pa1xpa341xgfAuG2xPhLLmorey59hgpQYDBSgMDX7L0idI
         Tt27Bka8j9h+hv07setGLqcECmbG0mfpMGiiw+NXmMFUBMRgHEMZdkf4aDQdFhcGq08p
         j0a/HT56uwH4/1RlOE8120d+u2wtx2WnzaGFWKaeA6tECUeU9gbPzoqJ3bTyvLNTL8db
         Rfig==
X-Gm-Message-State: AO0yUKWAg0eNraMA3MkDxKROfHpZ/wtBBI/tBR3YbQcymgqvtx/aAjEy
	VnS0y1lGCVYv6RNAk6Q29TbSta7hBwk=
X-Google-Smtp-Source: AK7set9TVlEpJ2VWg6lBJ0ScC2MOTVwHVdqCoslU+EB8Xvnhsy89wgbZ99BL0UuqD5UFZ5MSy6U1/A==
X-Received: by 2002:a05:600c:378d:b0:3ea:f6c4:5f3d with SMTP id o13-20020a05600c378d00b003eaf6c45f3dmr11730801wmr.2.1679988298206;
        Tue, 28 Mar 2023 00:24:58 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id e8-20020a05600c218800b003ede06f3178sm16077344wme.31.2023.03.28.00.24.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 00:24:57 -0700 (PDT)
Date: Tue, 28 Mar 2023 07:02:37 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Anup Patel <apatel@ventanamicro.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [avpatel:alexghiti_test 51/78] arch/riscv/kvm/aia_aplic.c:303
 kvm_riscv_aia_aplic_inject() error: uninitialized symbol 'inject'.
Message-ID: <787e78ae-16dd-4623-a763-7f69295e5f71@kili.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git alexghiti_test
head:   93aaa7cba9ba7ae91a47812465117e2f9b9e3712
commit: c9c4cf36341f2f48f84a8db75d1908a21d130de2 [51/78] RISC-V: KVM: Add in-kernel emulation of AIA APLIC
config: riscv-randconfig-m031-20230326 (https://download.01.org/0day-ci/archive/20230328/202303280121.pelkT1tG-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303280121.pelkT1tG-lkp@intel.com/

smatch warnings:
arch/riscv/kvm/aia_aplic.c:303 kvm_riscv_aia_aplic_inject() error: uninitialized symbol 'inject'.
arch/riscv/kvm/aia_aplic.c:304 kvm_riscv_aia_aplic_inject() error: uninitialized symbol 'target'.

vim +/inject +303 arch/riscv/kvm/aia_aplic.c

c9c4cf36341f2f Anup Patel 2022-01-19  249  int kvm_riscv_aia_aplic_inject(struct kvm *kvm, u32 source, bool level)
c9c4cf36341f2f Anup Patel 2022-01-19  250  {
c9c4cf36341f2f Anup Patel 2022-01-19  251  	u32 target;
c9c4cf36341f2f Anup Patel 2022-01-19  252  	bool inject, ie;
c9c4cf36341f2f Anup Patel 2022-01-19  253  	unsigned long flags;
c9c4cf36341f2f Anup Patel 2022-01-19  254  	struct aplic_irq *irqd;
c9c4cf36341f2f Anup Patel 2022-01-19  255  	struct aplic *aplic = kvm->arch.aia.aplic_state;
c9c4cf36341f2f Anup Patel 2022-01-19  256  
c9c4cf36341f2f Anup Patel 2022-01-19  257  	if (!aplic || !source || (aplic->nr_irqs <= source))
c9c4cf36341f2f Anup Patel 2022-01-19  258  		return -ENODEV;
c9c4cf36341f2f Anup Patel 2022-01-19  259  	irqd = &aplic->irqs[source];
c9c4cf36341f2f Anup Patel 2022-01-19  260  	ie = (aplic->domaincfg & APLIC_DOMAINCFG_IE) ? true : false;
c9c4cf36341f2f Anup Patel 2022-01-19  261  
c9c4cf36341f2f Anup Patel 2022-01-19  262  	raw_spin_lock_irqsave(&irqd->lock, flags);
c9c4cf36341f2f Anup Patel 2022-01-19  263  
c9c4cf36341f2f Anup Patel 2022-01-19  264  	if (irqd->sourcecfg & APLIC_SOURCECFG_D)
c9c4cf36341f2f Anup Patel 2022-01-19  265  		goto skip_unlock;

uninitialized variables on this goto

c9c4cf36341f2f Anup Patel 2022-01-19  266  
c9c4cf36341f2f Anup Patel 2022-01-19  267  	switch (irqd->sourcecfg & APLIC_SOURCECFG_SM_MASK) {
c9c4cf36341f2f Anup Patel 2022-01-19  268  	case APLIC_SOURCECFG_SM_EDGE_RISE:
c9c4cf36341f2f Anup Patel 2022-01-19  269  		if (level && !(irqd->state & APLIC_IRQ_STATE_INPUT) &&
c9c4cf36341f2f Anup Patel 2022-01-19  270  		    !(irqd->state & APLIC_IRQ_STATE_PENDING))
c9c4cf36341f2f Anup Patel 2022-01-19  271  			irqd->state |= APLIC_IRQ_STATE_PENDING;
c9c4cf36341f2f Anup Patel 2022-01-19  272  		break;
c9c4cf36341f2f Anup Patel 2022-01-19  273  	case APLIC_SOURCECFG_SM_EDGE_FALL:
c9c4cf36341f2f Anup Patel 2022-01-19  274  		if (!level && (irqd->state & APLIC_IRQ_STATE_INPUT) &&
c9c4cf36341f2f Anup Patel 2022-01-19  275  		    !(irqd->state & APLIC_IRQ_STATE_PENDING))
c9c4cf36341f2f Anup Patel 2022-01-19  276  			irqd->state |= APLIC_IRQ_STATE_PENDING;
c9c4cf36341f2f Anup Patel 2022-01-19  277  		break;
c9c4cf36341f2f Anup Patel 2022-01-19  278  	case APLIC_SOURCECFG_SM_LEVEL_HIGH:
c9c4cf36341f2f Anup Patel 2022-01-19  279  		if (level && !(irqd->state & APLIC_IRQ_STATE_PENDING))
c9c4cf36341f2f Anup Patel 2022-01-19  280  			irqd->state |= APLIC_IRQ_STATE_PENDING;
c9c4cf36341f2f Anup Patel 2022-01-19  281  		break;
c9c4cf36341f2f Anup Patel 2022-01-19  282  	case APLIC_SOURCECFG_SM_LEVEL_LOW:
c9c4cf36341f2f Anup Patel 2022-01-19  283  		if (!level && !(irqd->state & APLIC_IRQ_STATE_PENDING))
c9c4cf36341f2f Anup Patel 2022-01-19  284  			irqd->state |= APLIC_IRQ_STATE_PENDING;
c9c4cf36341f2f Anup Patel 2022-01-19  285  		break;
c9c4cf36341f2f Anup Patel 2022-01-19  286  	}
c9c4cf36341f2f Anup Patel 2022-01-19  287  
c9c4cf36341f2f Anup Patel 2022-01-19  288  	if (level)
c9c4cf36341f2f Anup Patel 2022-01-19  289  		irqd->state |= APLIC_IRQ_STATE_INPUT;
c9c4cf36341f2f Anup Patel 2022-01-19  290  	else
c9c4cf36341f2f Anup Patel 2022-01-19  291  		irqd->state &= ~APLIC_IRQ_STATE_INPUT;
c9c4cf36341f2f Anup Patel 2022-01-19  292  
c9c4cf36341f2f Anup Patel 2022-01-19  293  	inject = false;
c9c4cf36341f2f Anup Patel 2022-01-19  294  	target = irqd->target;
c9c4cf36341f2f Anup Patel 2022-01-19  295  	if (ie && (irqd->state & APLIC_IRQ_STATE_ENPEND)) {
c9c4cf36341f2f Anup Patel 2022-01-19  296  		irqd->state &= ~APLIC_IRQ_STATE_PENDING;
c9c4cf36341f2f Anup Patel 2022-01-19  297  		inject = true;
c9c4cf36341f2f Anup Patel 2022-01-19  298  	}
c9c4cf36341f2f Anup Patel 2022-01-19  299  
c9c4cf36341f2f Anup Patel 2022-01-19  300  skip_unlock:
c9c4cf36341f2f Anup Patel 2022-01-19  301  	raw_spin_unlock_irqrestore(&irqd->lock, flags);
c9c4cf36341f2f Anup Patel 2022-01-19  302  
c9c4cf36341f2f Anup Patel 2022-01-19 @303  	if (inject)
c9c4cf36341f2f Anup Patel 2022-01-19 @304  		aplic_inject_msi(kvm, source, target);
c9c4cf36341f2f Anup Patel 2022-01-19  305  
c9c4cf36341f2f Anup Patel 2022-01-19  306  	return 0;
c9c4cf36341f2f Anup Patel 2022-01-19  307  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

