Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794806839;
	b=VuA7bUvmVTb5CHrXt9RMCyMwr7Y7FXfQ32PHLUU4AX1SBN3KBwz79qJdE/Ah1l3LL8ep
	 Hc0p4BUijYSMewV7ndOAiKbwt7wDX7mOFBJ4Bkot4pJs9AJXHWd4hS9qFyWPKKJWMXQpx
	 8n/d38lMnwX66alEal0t//8cHbZRaMfEah2XNHSNGM94RSn01OpybatQMAouBux8R93SH
	 I0XIk39/u4Wbhd8MeNgSRbRQCDkY9aYGw+8L+0uqmvgdNvC87GrABfauFSOvdLLkXRxNi
	 Pe7pUEvGj5dupxc9cBayMyNd+TtcuyrWOz4XfKdn+sxsg4mMdxt1rUAingfHv6QR13A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794806839;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=ZOE8GXAOSW5LmYfusUtd1UWIlrbsVn9dk+RMd/mj69g=;
	b=JbYfJbFGYNcjbIy4xHirb+5CmBNL28T6ujxU2wUcpKdZ2S0JGiqdghuNCgLz91BQ6Tq2
	 cmdTGW+CissHptTI/RbuApdsdI0Ekt5jC+RLCNmVsGRUFESXD9rIzvf7wvoEZP/lCVWxP
	 /ok7B1xtso7/eDmZc4L5c7Alz9WscTH16vcGutIhK63mqDW/RM7Q+Fl9l6k76gbtlqWrx
	 dauEWXbhEx7wra+8fKksyL/MlIMpBPk0Qny+FkhPIf+JbmsGl7UYKS8W8eixDdSCQ4CEs
	 gSn/P55GCSCmqt6MG76RCt1KZ+Q6/4Y/QJ26mOHUQoW9G24vldlJhQJi+gtYGaxa0Aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="e0pcrO/U";
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A12606A31C
	for <oe-kbuild@lists.linux.dev>; Mon, 16 Nov 2026 05:27:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79A12606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e0pcrO/U
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48e3b22e971so1412533f8f.0
        for <oe-kbuild@lists.linux.dev>; Sun, 15 Nov 2026 21:27:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794806838; x=1795411638; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZOE8GXAOSW5LmYfusUtd1UWIlrbsVn9dk+RMd/mj69g=;
        b=e0pcrO/UrWI8RPULlQ4Pz9hG+hKy1zGCD0WMW/TEQigdv8SkTW6ltDRolx2+ceWxF/
         DYt2s0Fdb89iJTjlgy/OcyL35bIscc180ExPidPsNPbyGEGHTz5LpW1XA99/vf0LDmwd
         h0imDAjJtxOxAwM91Th6C828H11qdY4vlJtd+aCwCqd4f52YXSp9EZ0YqIhjkkXKeBkB
         Yuepo44la2iBCrsTk7qnagXJb4klP3M/BM5ufBL4zq5tpZSJ/7l5nCGvZmgxxLsB4THb
         D1JDxLP/+VJ7MOfvdqbX9c+enIOaVzg6+ZWnn8d0R4xZTfPYoWrSvmAawFnDKvY+AQB4
         mmYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794806838; x=1795411638;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZOE8GXAOSW5LmYfusUtd1UWIlrbsVn9dk+RMd/mj69g=;
        b=tNR93rifu5m7ma7NeHuf82DNYceaAtvctpGr/h7GWDqYSQdzvQhYzJsnZCCGz8EL8B
         LnSWZ+Pweu+gOxTmUvhpgzxsXjzSsEC+obgb4G7AAtusHY1dOcdtBS5qgwn1PNIksAAh
         dBjPuFslwl17aCH6P4FZI6gBSqfOioWOSS1ttOSW/FDCW0igsRqnQoJ7RJeIUfn+kJQv
         PG7M7Tz5lpyXf8ZCfgYa9Ry2utkCr9hEh/AD5Ct+6aayJfnsXXFGBe6/4JIQIg5CaAne
         sTslS/ACR2tVbXBuFZxqZP5WPNdB/6NZydZnSRvVw9Kjs9ITl1/YhVaLciVNyHVQ6+Yf
         mBCA==
X-Gm-Message-State: APuU4Z8WAYBDqhCiYs05PtJ70fVqoPzQxARpDXIHDLLuQHucDJ6yiWQ8
	USUPM+3TahuDVaGgXQXDjfzIAqN8NfoMFYfzcDyRdDCi6umZsURNPwiNj2vjKsa/c2/jG543
X-Gm-Gg: AYBFou2Qp1WKzWPRdmFcaXmbJqth0/IxfRc2bu22B+vS01RzDvDR/okb/7bGkfdQ70i
	5HNALY73XIvk8Vwrvtfm6WggN/A/GszX2jmtTvYFKvybeXYFtoI6Z2tOjXrgW4Do6+SbLhjnQk9
	9Kw2lYbnXoFIESXVmpgCfb0MKkLgNgGLjh3ygv/VDuObadnfwLu9G64MaYs41EcBJq/1k7YcpF2
	d44DDH//xghJyORsvbUAPJwtRTAPHV7BeP8Ivo9aV6UMhf+mp8T7qQxhxRU9J47SYX+YWY6GGrF
	ThlS6uPns55Q1keYoOCgNo7aq3dnCbtno+RVrZEQjONPk4cMHjERTr5lwRRRu3pL6iKBAsj3pwm
	GHRcmtQneWX8+gSmAX5EXfte7Y1TGLZJ5z7XQ4CJA6K4xNO90B1gABsHz4a/PGNkqGkJGlE2QKg
	M4yMzZ839w7x2w0kzoHqHoIdfNfVDh/A/FqcVGpQN25yphLdkNGox9Bszmt/X9yxiCC/81y4MiL
	ryT7v2TJlHqaO8IP7ofRg78wssGjPJqugwgYMOO8em7J6X6HTTcJMoxZ2QfG4JFevDJ+FPfx3LW
	H17QS1A3oSZbVwRH8eA1lQOKzO3RpMm9/CjcbSTS6l8QUMELhugtZpCURQViS5oudlTByBcHG5M
	0yc+/q/k449GF8RbUI2bHngP2qM2j4iaLi9nVSQG+rrCcGz8yGII0go2PGFX077mWx/U=
X-Received: by 2002:a5d:64cf:0:b0:493:690c:8364 with SMTP id ffacd0b85a97d-49c6fc9e96amr19530743f8f.3.1794806837659;
        Sun, 15 Nov 2026 21:27:17 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c605e4a2asm19580683f8f.39.2026.11.15.21.27.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 21:27:17 -0800 (PST)
Date: Mon, 16 Nov 2026 08:27:13 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Pengpeng Hou <hppiscas@163.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Anup Patel <anup@brainfault.org>
Subject: [kvm-riscv:riscv_kvm_fixes 1/7] arch/riscv/kvm/aia_device.c:311
 aia_init() warn: missing unwind goto?
Message-ID: <202611132302.clUdzKjd-lkp@intel.com>
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
Message-ID: <20261116052713.d2XhTVBWrX0S_-kA2qrWdsQz4iFoHZcd_SHb7lMrnh8@z>

tree:   https://github.com/kvm-riscv/linux.git riscv_kvm_fixes
head:   46740f9f0fab8ecff4895617c79cec33131b13f0
commit: 235a629ef66ed4e7f88a8946749ed4ff6e3764cf [1/7] RISC-V: KVM: Validate AIA MMIO address ranges
config: riscv-randconfig-2200-20261113 (https://download.01.org/0day-ci/archive/20261113/202611132302.clUdzKjd-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202611132302.clUdzKjd-lkp@intel.com/

smatch warnings:
arch/riscv/kvm/aia_device.c:311 aia_init() warn: missing unwind goto?

vim +311 arch/riscv/kvm/aia_device.c

89d01306e34d6ac Anup Patel          2023-06-15  251  static int aia_init(struct kvm *kvm)
89d01306e34d6ac Anup Patel          2023-06-15  252  {
89d01306e34d6ac Anup Patel          2023-06-15  253  	int ret, i;
89d01306e34d6ac Anup Patel          2023-06-15  254  	unsigned long idx;
89d01306e34d6ac Anup Patel          2023-06-15  255  	struct kvm_vcpu *vcpu;
89d01306e34d6ac Anup Patel          2023-06-15  256  	struct kvm_vcpu_aia *vaia;
89d01306e34d6ac Anup Patel          2023-06-15  257  	struct kvm_aia *aia = &kvm->arch.aia;
89d01306e34d6ac Anup Patel          2023-06-15  258  	gpa_t base_ppn = KVM_RISCV_AIA_UNDEF_ADDR;
89d01306e34d6ac Anup Patel          2023-06-15  259  
89d01306e34d6ac Anup Patel          2023-06-15  260  	/* Irqchip can be initialized only once */
89d01306e34d6ac Anup Patel          2023-06-15  261  	if (kvm_riscv_aia_initialized(kvm))
89d01306e34d6ac Anup Patel          2023-06-15  262  		return -EBUSY;
89d01306e34d6ac Anup Patel          2023-06-15  263  
89d01306e34d6ac Anup Patel          2023-06-15  264  	/* We might be in the middle of creating a VCPU? */
10f4082b754f18e Sean Christopherson 2026-09-21  265  	if (kvm_is_vcpu_creation_in_progress(kvm))
89d01306e34d6ac Anup Patel          2023-06-15  266  		return -EBUSY;
89d01306e34d6ac Anup Patel          2023-06-15  267  
89d01306e34d6ac Anup Patel          2023-06-15  268  	/* Number of sources should be less than or equals number of IDs */
89d01306e34d6ac Anup Patel          2023-06-15  269  	if (aia->nr_ids < aia->nr_sources)
89d01306e34d6ac Anup Patel          2023-06-15  270  		return -EINVAL;
89d01306e34d6ac Anup Patel          2023-06-15  271  
89d01306e34d6ac Anup Patel          2023-06-15  272  	/* APLIC base is required for non-zero number of sources */
89d01306e34d6ac Anup Patel          2023-06-15  273  	if (aia->nr_sources && aia->aplic_addr == KVM_RISCV_AIA_UNDEF_ADDR)
89d01306e34d6ac Anup Patel          2023-06-15  274  		return -EINVAL;
89d01306e34d6ac Anup Patel          2023-06-15  275  
235a629ef66ed4e Pengpeng Hou        2026-09-20  276  	/* The GPA width may change after setting APLIC's address on an empty VM. */
235a629ef66ed4e Pengpeng Hou        2026-09-20  277  	if (aia->nr_sources) {
235a629ef66ed4e Pengpeng Hou        2026-09-20  278  		ret = aia_check_addr_range(kvm, aia->aplic_addr,
235a629ef66ed4e Pengpeng Hou        2026-09-20  279  					   KVM_DEV_RISCV_APLIC_ALIGN,
235a629ef66ed4e Pengpeng Hou        2026-09-20  280  					   KVM_DEV_RISCV_APLIC_SIZE);
235a629ef66ed4e Pengpeng Hou        2026-09-20  281  		if (ret)
235a629ef66ed4e Pengpeng Hou        2026-09-20  282  			return ret;
235a629ef66ed4e Pengpeng Hou        2026-09-20  283  	}
235a629ef66ed4e Pengpeng Hou        2026-09-20  284  
0e3d7d8c6c8cf71 Pengpeng Hou        2026-07-18  285  	/* Group index bits must not overlap guest and HART index bits. */
0e3d7d8c6c8cf71 Pengpeng Hou        2026-07-18  286  	if (aia->nr_group_bits &&
0e3d7d8c6c8cf71 Pengpeng Hou        2026-07-18  287  	    aia->nr_group_shift < (IMSIC_MMIO_PAGE_SHIFT +
0e3d7d8c6c8cf71 Pengpeng Hou        2026-07-18  288  	    			   aia->nr_guest_bits + aia->nr_hart_bits))
0e3d7d8c6c8cf71 Pengpeng Hou        2026-07-18  289  		return -EINVAL;
0e3d7d8c6c8cf71 Pengpeng Hou        2026-07-18  290  
89d01306e34d6ac Anup Patel          2023-06-15  291  	/* Initialize APLIC */
89d01306e34d6ac Anup Patel          2023-06-15  292  	ret = kvm_riscv_aia_aplic_init(kvm);
89d01306e34d6ac Anup Patel          2023-06-15  293  	if (ret)
89d01306e34d6ac Anup Patel          2023-06-15  294  		return ret;
89d01306e34d6ac Anup Patel          2023-06-15  295  
89d01306e34d6ac Anup Patel          2023-06-15  296  	/* Iterate over each VCPU */
89d01306e34d6ac Anup Patel          2023-06-15  297  	kvm_for_each_vcpu(idx, vcpu, kvm) {
89d01306e34d6ac Anup Patel          2023-06-15  298  		vaia = &vcpu->arch.aia_context;
89d01306e34d6ac Anup Patel          2023-06-15  299  
89d01306e34d6ac Anup Patel          2023-06-15  300  		/* IMSIC base is required */
89d01306e34d6ac Anup Patel          2023-06-15  301  		if (vaia->imsic_addr == KVM_RISCV_AIA_UNDEF_ADDR) {
89d01306e34d6ac Anup Patel          2023-06-15  302  			ret = -EINVAL;
89d01306e34d6ac Anup Patel          2023-06-15  303  			goto fail_cleanup_imsics;
89d01306e34d6ac Anup Patel          2023-06-15  304  		}
89d01306e34d6ac Anup Patel          2023-06-15  305  
235a629ef66ed4e Pengpeng Hou        2026-09-20  306  		/* The GPA width may change after setting IMSIC addresses on an empty VM. */
235a629ef66ed4e Pengpeng Hou        2026-09-20  307  		ret = aia_check_addr_range(kvm, vaia->imsic_addr,
235a629ef66ed4e Pengpeng Hou        2026-09-20  308  					   KVM_DEV_RISCV_IMSIC_ALIGN,
235a629ef66ed4e Pengpeng Hou        2026-09-20  309  					   KVM_DEV_RISCV_IMSIC_SIZE);
235a629ef66ed4e Pengpeng Hou        2026-09-20  310  		if (ret)
235a629ef66ed4e Pengpeng Hou        2026-09-20 @311  			return ret;

This needs to cleanup before returning.

235a629ef66ed4e Pengpeng Hou        2026-09-20  312  
89d01306e34d6ac Anup Patel          2023-06-15  313  		/* All IMSICs should have matching base PPN */
89d01306e34d6ac Anup Patel          2023-06-15  314  		if (base_ppn == KVM_RISCV_AIA_UNDEF_ADDR)
89d01306e34d6ac Anup Patel          2023-06-15  315  			base_ppn = aia_imsic_ppn(aia, vaia->imsic_addr);
89d01306e34d6ac Anup Patel          2023-06-15  316  		if (base_ppn != aia_imsic_ppn(aia, vaia->imsic_addr)) {
89d01306e34d6ac Anup Patel          2023-06-15  317  			ret = -EINVAL;
89d01306e34d6ac Anup Patel          2023-06-15  318  			goto fail_cleanup_imsics;
89d01306e34d6ac Anup Patel          2023-06-15  319  		}
89d01306e34d6ac Anup Patel          2023-06-15  320  
89d01306e34d6ac Anup Patel          2023-06-15  321  		/* Update HART index of the IMSIC based on IMSIC base */
89d01306e34d6ac Anup Patel          2023-06-15  322  		vaia->hart_index = aia_imsic_hart_index(aia,
89d01306e34d6ac Anup Patel          2023-06-15  323  							vaia->imsic_addr);
89d01306e34d6ac Anup Patel          2023-06-15  324  
89d01306e34d6ac Anup Patel          2023-06-15  325  		/* Initialize IMSIC for this VCPU */
89d01306e34d6ac Anup Patel          2023-06-15  326  		ret = kvm_riscv_vcpu_aia_imsic_init(vcpu);
89d01306e34d6ac Anup Patel          2023-06-15  327  		if (ret)
89d01306e34d6ac Anup Patel          2023-06-15  328  			goto fail_cleanup_imsics;
89d01306e34d6ac Anup Patel          2023-06-15  329  	}
89d01306e34d6ac Anup Patel          2023-06-15  330  
89d01306e34d6ac Anup Patel          2023-06-15  331  	/* Set the initialized flag */
89d01306e34d6ac Anup Patel          2023-06-15  332  	kvm->arch.aia.initialized = true;
89d01306e34d6ac Anup Patel          2023-06-15  333  
89d01306e34d6ac Anup Patel          2023-06-15  334  	return 0;
89d01306e34d6ac Anup Patel          2023-06-15  335  
89d01306e34d6ac Anup Patel          2023-06-15  336  fail_cleanup_imsics:
89d01306e34d6ac Anup Patel          2023-06-15  337  	for (i = idx - 1; i >= 0; i--) {
89d01306e34d6ac Anup Patel          2023-06-15  338  		vcpu = kvm_get_vcpu(kvm, i);
89d01306e34d6ac Anup Patel          2023-06-15  339  		if (!vcpu)
89d01306e34d6ac Anup Patel          2023-06-15  340  			continue;
89d01306e34d6ac Anup Patel          2023-06-15  341  		kvm_riscv_vcpu_aia_imsic_cleanup(vcpu);
89d01306e34d6ac Anup Patel          2023-06-15  342  	}
89d01306e34d6ac Anup Patel          2023-06-15  343  	kvm_riscv_aia_aplic_cleanup(kvm);
89d01306e34d6ac Anup Patel          2023-06-15  344  	return ret;
89d01306e34d6ac Anup Patel          2023-06-15  345  }

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

