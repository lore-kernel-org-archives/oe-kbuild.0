Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793857184;
	b=e8tZ1LMD7E7ioNtCUd23G48rw7kiL4Dcc99soLp8Z48sLyyF+asJ2OEAt/sCkG1PITTq
	 +50u6p14aKKIAytxr6BCP4FpDXUMX0EqMJHboi6GmWuF+WUFrP8nNH+XWcPinta1oweH1
	 9Y1YL50RDU++ML79c87wztAIuKWj0qY7Nu/tOtoS1e+XXzKchHqk4j/a0Omnr5wXAJzNO
	 0HVe8nnw1bdv4w0mTRMESFa06pbMfDlxULDCnGRCwRauqu9wYfcgD9vnv0CCcUxLxCcOw
	 jZcZfEEGDlTulMCI1EbOqqBmkdz6TZ21O2mAELpwFoRmF6SdbIuTN+hRyfhF7eWAqjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793857184;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=RiKLCCHXrKouJKGgmvGdShWyJEpyaPvWqrasOaZl+Qk=;
	b=1GcwzKg6tvz+A3WS1jza9G8URdvAA2pZrwnRso+QnX1vLkP6RhnXSBExTusSrWsuVE7N
	 KDxaNntmGu5MLelDVsK0jyiP9RkoksvYJOA1RUoOQDPLwkqEagzvqvq0N0aFVwn2eA7nJ
	 jKxpwFnGbYKFDu/W16pcDyiYyWQGwjwnu7m+W1LrUDXwEYMAzzKdb348lyAZRk/SuBvUy
	 6h9jm1jR8EDnKZ27qnNjf60hPCWWxQE+vZ9rnFSjoNzFNTqj04biyiBJksTTHyQBEOd/C
	 kV3bSzDfyggfdAFZUDeEouJiSfEnC7C579S1P/d6toygTYJTRZzapxEcjyn0ZHw/2xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NRsGcGo0;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E4D606A31B
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Nov 2026 05:39:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34E4D606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NRsGcGo0
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4afe2d546f9so16681115e9.3
        for <oe-kbuild@lists.linux.dev>; Wed, 04 Nov 2026 21:39:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793857182; x=1794461982; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RiKLCCHXrKouJKGgmvGdShWyJEpyaPvWqrasOaZl+Qk=;
        b=NRsGcGo03ILEQRj4yMBkXX4lWGToaf6QCyxv7kqaKrzoWB+6V2dN4T9xCaJSHP34Pl
         j4IpqAArCy6YNtmccc2gFmDORrYxMHAC/9x5AdPIOjjVJ1oGEzDldKM9OU9MozEi/OkM
         xGD79NUh/Nyee7lc4ya6ottpDsTUVGYWxTntfOETq1E1UsfA6OyWlJZB/i6ROpjWljtE
         y2DdZD/QnP0K4Ko5z+OtDgA7n/JEtSTbASNBbt/6Eq3txY55XC1hkuaPno7hnwHqbzpX
         QlbZ/kpYTisLxEMm8XXxVqvnDay/r+OABtHQqlNnZ0RJ1MFtRlk/vyhsNZWCrxselx4W
         vuyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793857182; x=1794461982;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RiKLCCHXrKouJKGgmvGdShWyJEpyaPvWqrasOaZl+Qk=;
        b=DTSujp8DJV/ZJEsX/ZUEsWBXYqPIG5thdwvrH9w/qoUF4O9uNbmyCKVjy9hPA/mpXo
         jK6xhF/JgiVJAqqU2qcc+0VvNoeC4sbwSN/bGbAAt3LDMS4LgK0RiLZ5Gn0ouzRI95FC
         r3I/8tVxBrr1ux/x0FqI2JFhT1eSzivOhdIh4bom999nEv462cR9qo06HsHRPPhdkc9o
         R1lmJ54F7D5b4tUZj/Br3lP3ONaSeblIe5VS0aXDJUrGdhD204EOZd8CEiqTch9Knc81
         rWEv/SflXpP9bG9L6b6WacK/3C3lwf2yLh5p3Z5jDgSXEPOpTs2NV5NeEIBM5DqVbNDu
         WgKQ==
X-Gm-Message-State: APuU4Z+1ebKidxGPGVoGeWnFTlDBInJJk7sipn/g7wADnAPKP517a2qm
	ZCHOq0q59N9wXDOShz3tbKRyqyw+UMuKhcbjlAv7CLPNLFXLd8WIwF6FwQywJvsRoBOEnaT6
X-Gm-Gg: AYBFou1R5hgfqRim89FrqilCGEMNiC6BTm0O2mIvZ68tDrggGHZykm3bQUet8dtbnkW
	mcopa4TWyI2t2gGkec1lmq4ECPrjofcwSWkJ67+MmLFJ9QHup0PkL5NgF+Ji31/Esg/CSr8l3dY
	9LaXPeCcbcpl6Bqkkmbb8MxcKGqxGaWFQNVUR5hY/vQXBEjzL4sp/8h2+BhHAYszE4DmMdfnmKa
	IoeVCaq7gsoHkNIzgLO9NWxqLk/K/BEH04cn7g+HUtWZxOtFyS9yO4m0PhrDRac/jZSYBKFxh9K
	XJwOjRZJ1qGCScXESZ4cRwkByXbXkk60ag/XU4XgBd8TPPxKPeoL6cUGNpkm6ewGGw6Cx8hxmDv
	0L5EBvEnaW3vmt3ssnprYRrztYiEdyrROP9RqTX+LD6DMKmeGrffeu6Z37dyCLgwgas0qmwkRAX
	VaSDUUCBzn2cmFOIH7N0P5QiD5tz42UejOk+D5uWciLSCL4E/P++sARR+wKgjQgER2kdmudVKx6
	uXYjnBC1C8Akao0XlE6lweauiQxTy59aXQOFl7bW1YNDqpcz5ADTcqA3vnjMVNP9S2ihWG/KSQj
	HoHA8taCcGOGPml56qtAThDkINyJCNbEL8xM8S2a54YnSRqmtgSeqHnP8KSt+RBOh9X9hc/Ag99
	yaPTdQk656Kr2h2AjWyqujRyyWxEy0hc1uMnuJErPmbDrvkPi10bTaazOkuK0LSkAaLv1QZt1KV
	roHWafZoHHwy0=
X-Received: by 2002:a05:6000:4559:b0:48e:752b:9f90 with SMTP id ffacd0b85a97d-48e752ba019mr24236069f8f.38.1793857182424;
        Wed, 04 Nov 2026 21:39:42 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48feda20935sm7419968f8f.54.2026.11.04.21.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 21:39:41 -0800 (PST)
Date: Thu, 5 Nov 2026 08:39:38 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_iommu_misc_v1 27/35] arch/riscv/kvm/aia_imsic.c:711
 __kvm_riscv_vcpu_irq_update() warn: mixing irq and irqsave
Message-ID: <202611042200.NX4mTopN-lkp@intel.com>
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20261105053938.pJRsYwJB_Mtb3MOW7qYhYj1hRjVEnjq5Y7lWwNxC298@z>

tree:   https://github.com/avpatel/linux.git riscv_iommu_misc_v1
head:   bfa7a6c4f67f2d4d155c3aa2fbc606e5c5189ca0
commit: ef0d72018fdf0d8d92e9031e7c12f621e1f36d7e [27/35] RISC-V: KVM: Add guest file irqbypass support
config: riscv-randconfig-2200-20261104 (https://download.01.org/0day-ci/archive/20261104/202611042200.NX4mTopN-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202611042200.NX4mTopN-lkp@intel.com/

smatch warnings:
arch/riscv/kvm/aia_imsic.c:711 __kvm_riscv_vcpu_irq_update() warn: mixing irq and irqsave

vim +711 arch/riscv/kvm/aia_imsic.c

ef0d72018fdf0d Andrew Jones 2026-04-19  665  static void __kvm_riscv_vcpu_irq_update(struct kvm_vcpu *vcpu, bool release)
ef0d72018fdf0d Andrew Jones 2026-04-19  666  {
ef0d72018fdf0d Andrew Jones 2026-04-19  667  	struct kvm *kvm = vcpu->kvm;
ef0d72018fdf0d Andrew Jones 2026-04-19  668  	struct imsic *imsic = vcpu->arch.aia_context.imsic_state;
ef0d72018fdf0d Andrew Jones 2026-04-19  669  	gpa_t gpa = vcpu->arch.aia_context.imsic_addr;
ef0d72018fdf0d Andrew Jones 2026-04-19  670  	struct kvm_aia *aia = &kvm->arch.aia;
ef0d72018fdf0d Andrew Jones 2026-04-19  671  	u64 msi_addr_mask = kvm_riscv_aia_msi_addr_mask(aia);
ef0d72018fdf0d Andrew Jones 2026-04-19  672  	struct riscv_iommu_ir_vcpu_info vcpu_info = {
ef0d72018fdf0d Andrew Jones 2026-04-19  673  		.gpa = gpa,
ef0d72018fdf0d Andrew Jones 2026-04-19  674  		.msi_addr_mask = msi_addr_mask,
ef0d72018fdf0d Andrew Jones 2026-04-19  675  		.msi_addr_pattern = (gpa >> IMSIC_MMIO_PAGE_SHIFT) & ~msi_addr_mask,
ef0d72018fdf0d Andrew Jones 2026-04-19  676  		.group_index_bits = aia->nr_group_bits,
ef0d72018fdf0d Andrew Jones 2026-04-19  677  		.group_index_shift = aia->nr_group_shift,
ef0d72018fdf0d Andrew Jones 2026-04-19  678  	};
ef0d72018fdf0d Andrew Jones 2026-04-19  679  	struct kvm_kernel_irq_routing_entry *irq_entry;
ef0d72018fdf0d Andrew Jones 2026-04-19  680  	struct kvm_kernel_irqfd *irqfd;
ef0d72018fdf0d Andrew Jones 2026-04-19  681  	unsigned long flags;
ef0d72018fdf0d Andrew Jones 2026-04-19  682  	gpa_t target;
ef0d72018fdf0d Andrew Jones 2026-04-19  683  	int host_irq, ret;
ef0d72018fdf0d Andrew Jones 2026-04-19  684  
ef0d72018fdf0d Andrew Jones 2026-04-19  685  	spin_lock_irq(&kvm->irqfds.lock);

We disable IRQs here

ef0d72018fdf0d Andrew Jones 2026-04-19  686  
ef0d72018fdf0d Andrew Jones 2026-04-19  687  	list_for_each_entry(irqfd, &kvm->irqfds.items, list) {
ef0d72018fdf0d Andrew Jones 2026-04-19  688  		if (!irqfd->producer)
ef0d72018fdf0d Andrew Jones 2026-04-19  689  			continue;
ef0d72018fdf0d Andrew Jones 2026-04-19  690  
ef0d72018fdf0d Andrew Jones 2026-04-19  691  		irq_entry = &irqfd->irq_entry;
ef0d72018fdf0d Andrew Jones 2026-04-19  692  		if (irq_entry->type != KVM_IRQ_ROUTING_MSI)
ef0d72018fdf0d Andrew Jones 2026-04-19  693  			continue;
ef0d72018fdf0d Andrew Jones 2026-04-19  694  
ef0d72018fdf0d Andrew Jones 2026-04-19  695  		target = ((gpa_t)irq_entry->msi.address_hi << 32) | irq_entry->msi.address_lo;
ef0d72018fdf0d Andrew Jones 2026-04-19  696  		if (WARN_ON_ONCE(target & (IMSIC_MMIO_PAGE_SZ - 1)))
ef0d72018fdf0d Andrew Jones 2026-04-19  697  			continue;
ef0d72018fdf0d Andrew Jones 2026-04-19  698  
ef0d72018fdf0d Andrew Jones 2026-04-19  699  		if (target != gpa)
ef0d72018fdf0d Andrew Jones 2026-04-19  700  			continue;
ef0d72018fdf0d Andrew Jones 2026-04-19  701  
ef0d72018fdf0d Andrew Jones 2026-04-19  702  		host_irq = irqfd->producer->irq;
ef0d72018fdf0d Andrew Jones 2026-04-19  703  
ef0d72018fdf0d Andrew Jones 2026-04-19  704  		if (release) {
ef0d72018fdf0d Andrew Jones 2026-04-19  705  			ret = irq_set_vcpu_affinity(host_irq, NULL);
ef0d72018fdf0d Andrew Jones 2026-04-19  706  		} else {
ef0d72018fdf0d Andrew Jones 2026-04-19  707  			/*
ef0d72018fdf0d Andrew Jones 2026-04-19  708  			 * irqfds.lock -> vsfile_lock(read), same order as
ef0d72018fdf0d Andrew Jones 2026-04-19  709  			 * kvm_arch_update_irqfd_routing()
ef0d72018fdf0d Andrew Jones 2026-04-19  710  			 */
ef0d72018fdf0d Andrew Jones 2026-04-19 @711  			read_lock_irqsave(&imsic->vsfile_lock, flags);

So there should be no need to disable it again.

ef0d72018fdf0d Andrew Jones 2026-04-19  712  			if (imsic->vsfile_cpu < 0) {
ef0d72018fdf0d Andrew Jones 2026-04-19  713  				read_unlock_irqrestore(&imsic->vsfile_lock, flags);
ef0d72018fdf0d Andrew Jones 2026-04-19  714  				break;
ef0d72018fdf0d Andrew Jones 2026-04-19  715  			}
ef0d72018fdf0d Andrew Jones 2026-04-19  716  			vcpu_info.hpa = imsic->vsfile_pa;
ef0d72018fdf0d Andrew Jones 2026-04-19  717  			ret = irq_set_vcpu_affinity(host_irq, &vcpu_info);
ef0d72018fdf0d Andrew Jones 2026-04-19  718  			read_unlock_irqrestore(&imsic->vsfile_lock, flags);
ef0d72018fdf0d Andrew Jones 2026-04-19  719  		}
ef0d72018fdf0d Andrew Jones 2026-04-19  720  		WARN_ON_ONCE(ret && ret != -EOPNOTSUPP);
ef0d72018fdf0d Andrew Jones 2026-04-19  721  		if (ret)
ef0d72018fdf0d Andrew Jones 2026-04-19  722  			break;
ef0d72018fdf0d Andrew Jones 2026-04-19  723  	}
ef0d72018fdf0d Andrew Jones 2026-04-19  724  
ef0d72018fdf0d Andrew Jones 2026-04-19  725  	spin_unlock_irq(&kvm->irqfds.lock);
ef0d72018fdf0d Andrew Jones 2026-04-19  726  }

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

