Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721F41FFC46
	for <oe-kbuild@lists.linux.dev>; Tue, 25 Nov 2025 19:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764097305; cv=none; b=N3TxDdlOLdwIXfGREf4n1rqc4R6ZGcLkCRq2cz0r3vqOXwIWJYAsYXle7uFW77mPBJH03ZAbtYFwK83HN+6b1dCxxsj++hkF3f1ahNNYqkx7DLg7zJZguD6c8DpSC6zbE+/E4l+uVGhGQY48OzMAABdy6V42Z28QunlVluO9iKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764097305; c=relaxed/simple;
	bh=YRa3Oe0SOJcysDAiAdnjrMjYwfhBpMiZ8q9QvoO5GP4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NTgKW3TukCqkZkw9PHr3C31w9IHZ7+RVJ4HuytIYWoG9xzf8gOu7P0lTAdMGS3OvKd9/ZaKRzYZIurcM6DiSpW+T9LFMA0tIpLfiYbh1wPHYXqkXt6sm9aBLd5xHC52nmD0vnYwK4xrVuZOXJ34j7RRusxEQaodnlwRr7VfFjkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YTh/urfx; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YTh/urfx"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4779cc419b2so56581305e9.3
        for <oe-kbuild@lists.linux.dev>; Tue, 25 Nov 2025 11:01:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764097302; x=1764702102; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cTgUKzvtPmH71SG11kWbnj/1vHSAxLcPsYKvhGea9/8=;
        b=YTh/urfxjilapjpcJK2TE8c31goa2lQzmqYylsl24nVgMK8ahkQwi1Ew9Uv13spCze
         j8sZqCLGRopXKGmZK01vWLe0y12maeRvWiGWdktTmcHBYjwk+s5fk7HszAg8VuR8vWas
         CFdPzdSMbDbonHQ8oPt80OTfYcJupCfUSx3UbKb5KMvu05+/kQlZhwCTL4HP2HF2X4AR
         j2b87ILXaMinL6ECJgyFF6q7LKEmOIXa+VKI0pt/MbgC20A9G6/MZ6xX0igqVw8aGzsr
         I3dlvEClWQ0ogX4VZqqH84rwDVPrZLETotXxOsR/58lJrUUdxYPGv7ur7UwtH4Seos7m
         J9vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764097302; x=1764702102;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cTgUKzvtPmH71SG11kWbnj/1vHSAxLcPsYKvhGea9/8=;
        b=snvTsTtkiCzDO68uq7iHlURZdYBFKo5NAxkYpTSmE0Ym4+X0Et078c4mVi3iCx1Vmw
         nMhhwySGjM5FL13W5tEZvcysnii8OxnKnszGHnoL2NFh2eGnjLb1civ+DZn7Y4ASb8V+
         nJFmKCt5EhB+ctfZn9+n/Af+nl4Ulddp7CmhiaDVMjiY7DN53WXHjqsirqWuaRL4CJ1B
         bwLiRCDn8myIFbbKXSpPOaSsv/m3D6GR13j8FxbowgmiZFOLZUjjkMra/ub4ept5A6H9
         GTWKVNHDWOgONcUBlz0KbEaTKFD3hyn62BLdccSPBAaygg8EZp/BToOSngUFcszaMWFY
         WBIw==
X-Gm-Message-State: AOJu0Yzy0EMShDudvNcWOUpAQYk+6oB8U9EFFUmWJQUFGWv0K7voVwfT
	a+7j57JTN8p2yYTOmc7xRNIamohm5thJ2ruMmdsS6XdoLdPv0yZaO1yAGLTsOgetbvmEmKN6GyI
	slt6j
X-Gm-Gg: ASbGncsZb5MrFVaG/phE7vsTnnBkaMRr3+Rb5xLSvRJaqFwAhZaRCWJmJDg5aP7OGR4
	qeiWSJRK3jVwXQlrSpfmGLg68JWnzTbtAsG7s298PYqMxgSHys9OdUntGAW8MbQb9PqBhxONLWA
	/9Zmvz00f++tx1l5X4QW13w2vI7V2dQR5R2WE+FpAPPSmO04FDBydVEyxCiYeDznvY7C7L/EJy6
	4wSyMKJQqiA1KQEO1EQlDiJaYOVAkXl6P32klVya80L4WJRZNoqZNumBcQpes5LgwTu1AW16vHR
	87dBNoG1uLoHcs744KOH+kKaaIPTO2M2uBAUwxHXmNSKUPoup9JACsq3mYwaeAdMkHt8o0Y9uK7
	VQfLRgLHYkJlKyUyETmr9Ho0iUu2qDocYJFWm5r6dVTXRhVXW1DL7BCShAvIUap4AYEaF5HvoZN
	S4aoP1647dDGhlRciJlsC6NohsjgY=
X-Google-Smtp-Source: AGHT+IFE+7S0vwfFxZ+kkhH8VJefM13Q0uuZ0KbXhvaQzZSdMDgPVZsWN2CFveC29hwaBgSYCYiPXw==
X-Received: by 2002:a05:600c:3b96:b0:477:b0b9:312a with SMTP id 5b1f17b1804b1-477c11030a4mr178804865e9.7.1764097301550;
        Tue, 25 Nov 2025 11:01:41 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4790ade13ddsm3759095e9.8.2025.11.25.11.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 11:01:41 -0800 (PST)
Date: Tue, 25 Nov 2025 22:01:38 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Sean Christopherson <seanjc@google.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/vmxon_sucks 10/16] arch/x86/virt/hw.c:118
 x86_vmx_put_cpu() error: uninitialized symbol 'r'.
Message-ID: <202511252332.56suD8dT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20251125190138.hYyxt4jGTKW2DHf_9Lwes7pYos8qKoVWBfVZu_mEofk@z>

tree:   https://github.com/sean-jc/linux x86/vmxon_sucks
head:   8cc09ceb7eb4fc1e727ffebe33e01e28d6f475eb
commit: 1d12733bef630ec915992646f80fcea097c84f0c [10/16] KVM: x86: Extract VMXON and EFER.SVME enablement to kernel
config: i386-randconfig-141-20251125 (https://download.01.org/0day-ci/archive/20251125/202511252332.56suD8dT-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202511252332.56suD8dT-lkp@intel.com/

smatch warnings:
arch/x86/virt/hw.c:118 x86_vmx_put_cpu() error: uninitialized symbol 'r'.

vim +/r +118 arch/x86/virt/hw.c

1d12733bef630e Sean Christopherson 2025-10-09  102  static int x86_vmx_put_cpu(void)
1d12733bef630e Sean Christopherson 2025-10-09  103  {
1d12733bef630e Sean Christopherson 2025-10-09  104  	int r;

int r = 0;

1d12733bef630e Sean Christopherson 2025-10-09  105  
1d12733bef630e Sean Christopherson 2025-10-09  106  	asm goto("1: vmxoff\n\t"
1d12733bef630e Sean Christopherson 2025-10-09  107  		 _ASM_EXTABLE(1b, %l[fault])
1d12733bef630e Sean Christopherson 2025-10-09  108  		 ::: "cc", "memory" : fault);
1d12733bef630e Sean Christopherson 2025-10-09  109  
1d12733bef630e Sean Christopherson 2025-10-09  110  	goto clear_vmxe;
1d12733bef630e Sean Christopherson 2025-10-09  111  
1d12733bef630e Sean Christopherson 2025-10-09  112  fault:
1d12733bef630e Sean Christopherson 2025-10-09  113  	r = -EIO;
1d12733bef630e Sean Christopherson 2025-10-09  114  
1d12733bef630e Sean Christopherson 2025-10-09  115  clear_vmxe:
1d12733bef630e Sean Christopherson 2025-10-09  116  	cr4_clear_bits(X86_CR4_VMXE);
1d12733bef630e Sean Christopherson 2025-10-09  117  	intel_pt_handle_vmx(0);
1d12733bef630e Sean Christopherson 2025-10-09 @118  	return r;
1d12733bef630e Sean Christopherson 2025-10-09  120  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

