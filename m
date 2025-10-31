Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62CDC2D6E7E
	for <oe-kbuild@lists.linux.dev>; Fri, 31 Oct 2025 05:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761888367; cv=none; b=MhGXmLfRg1KMP2rA9ufsPCSoMBaVuSNFIEtRKoZR7BzEPpGlCQGRx3aSF10AjEX+nV/x/VoT3TEDqrw1QY7AvB0392cEFQk7YBWcdIqyKVpQc/11oxkcch1RjzeKltsnxYU25hf7l8yuV471IXtT+MRy+doSS0MxYdlJk4kldxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761888367; c=relaxed/simple;
	bh=sMxXPrW+6JuiJPVF7BDv9T9xRLe9e0WrVuR1A1ODGSU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lwtq0UZ8SbIsUPsZwBBV1iMtpgEvnXirujyIDH+MNmrIobh+IgAb61Tnp2ZQeGv/LxpVeJxmZ9xGWxtFF+RzXJzcH4ah4GlJRDsq8Bl7Idv8qe9zxLjFxU+yS2xUYLB8I+l2LSQFDNX1bGYU3PEaea/hVfuGFcWafahthjys0ZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xLwAGQk9; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xLwAGQk9"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3ecde0be34eso1817995f8f.1
        for <oe-kbuild@lists.linux.dev>; Thu, 30 Oct 2025 22:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761888363; x=1762493163; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dBbdaqSwc4AIhUshtjXjzk4g57EzDgumS+pQDOnoPmc=;
        b=xLwAGQk9Q4HTPsM1YYWIMi8RTHTiagGYZqJ5jYj8mDTbW11A25wH5OiPvF8iVfJgpd
         PXALi9wYXOsfGJegFuZEuuAr5QQHi70YLVagB5whbDyNyLEdjrFXNkL58OD8N1DEdV3Y
         s16Rl3BLMtBV6f3zrN4Ui2VIBTNJjBDk6DX7ZwR+BGsSPfcOQj9KuXcURe7KVP9b3PpL
         uK2WvQFpLHfbdWmxSMB3yuWD0VWlKC1XwGOzn2Xn5b8+eZVgnFuxmftLK3J9/5LHb5fm
         4HZvo71Xka2IssswseB8WTIoCzuR9+t2Eq5L7ldxJy2INOQ/jwTu47/jSoAD3ph7sJbc
         Th7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761888363; x=1762493163;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dBbdaqSwc4AIhUshtjXjzk4g57EzDgumS+pQDOnoPmc=;
        b=dlhpIKV6/V3VD1byKtk0tpH9biyb3rREukxwWZ6aNn+j8T+zDZxkFpyhtMgO241Qwm
         wD/tWAnlOQ6aeJI6dq8MJviYzltBogliULVHqrCm1TWdhevCv3ojBr4cabtsSg1BqoND
         fr7ENAVaeKx/OQu1ZgDFFE2+xxJC6I6DZ0Kvom7b+9PVu7XTBu0tvIbWNwxOPyzCRnzV
         57n3wXpefGLzFIp6fXI7wxkggeU3578ksq79N5cgVpLmI3YRy13w9w8L7l4CK0rDPpFY
         AqEX8cZJkSOHpjAgnzk4e2FeGjjqSwL0AL7epNvYpjxvnseVkSlpje9wQNgIMWrHXNTH
         LJ4A==
X-Gm-Message-State: AOJu0YzJhxW/tcCw0AP77urv7Ihz9sCB8v/ouKrHoOS+xb+vDncZOGXt
	kAshNH5RQHP8oZTeQIv5CEHcFntyPrD6r9DsqaQJRHMDYNlF7U3rqSvhFJ20trmE5GbqZJVAMkU
	LIdWF
X-Gm-Gg: ASbGncsaG+xtP0drZw7I732Cjy+7Zo4BuMqZVtq8ITZanhJPUWd8nc3ymlmOO1uVi3H
	DIQXNBXBzAnphQY5Fk+MM5k1vdlpmkK1dV5KDK1OknKrLcd5j945ikqgmcpcyWtqV8V/emJlikx
	DpbvL5+GKOdjUwp5HoYRfcL0qVnLtN0NN56Y5j1QgydIcz1JFTGmwHCHLLE94mVYWecKaDDqBFd
	e3frd8iH/CFLem4Y/UkhLkq5yLBnGjfaQfgh9oNgtbYQoTPkILW76ZgdcU+yCj3pyNzt7u5r4NS
	6vNQyQ1tdMuz6S+HZ/Ae/nyJhg2DBBZ0z43iDFCqdZXZ1uSLZXCivHFAoKe2jYShl9gIzAKUmcT
	UzQGG8NucOtgN2n7u3ybfvOLpPtlfb4o4d+mCDuzA5AZ8BoUsHqDc/1jn87gzyQH0FwZ38Cldw1
	5p7QT75+wH8jJh9IHYNCaQkmenbp4=
X-Google-Smtp-Source: AGHT+IGYPrIiVaisNFjIbu09Y2ei9vHAYdZPa5ge2OEhniwhNmm0v/eYM1ZitJu75RTNt35/IRGQ4A==
X-Received: by 2002:a05:6000:2403:b0:429:8d0f:eb6 with SMTP id ffacd0b85a97d-429b4c68b8cmr4432844f8f.15.1761888363164;
        Thu, 30 Oct 2025 22:26:03 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-429c10ff4f6sm1662636f8f.4.2025.10.30.22.26.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 22:26:02 -0700 (PDT)
Date: Fri, 31 Oct 2025 08:25:59 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Omar Sandoval <osandov@fb.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Omar Sandoval <osandov@osandov.com>,
	Sean Christopherson <seanjc@google.com>
Subject: [osandov:svm-int3-fix 1/1] arch/x86/kvm/svm/svm.c:321
 svm_update_soft_interrupt_rip() warn: right shifting more than type allows 8
 vs 16
Message-ID: <202510310909.y5ClH2qW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20251031052559.elWP23uJ8mgHOZy61bElhnJbi9l0u_9DoIZoRkyhQPU@z>

tree:   https://github.com/osandov/linux.git svm-int3-fix
head:   71cc6a9d4228c085a380dec917c65df5fcd9e8a9
commit: 71cc6a9d4228c085a380dec917c65df5fcd9e8a9 [1/1] KVM: SVM: Don't skip unrelated instruction if INT3/INTO is replaced
config: i386-randconfig-141-20251031 (https://download.01.org/0day-ci/archive/20251031/202510310909.y5ClH2qW-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202510310909.y5ClH2qW-lkp@intel.com/

smatch warnings:
arch/x86/kvm/svm/svm.c:321 svm_update_soft_interrupt_rip() warn: right shifting more than type allows 8 vs 16

vim +321 arch/x86/kvm/svm/svm.c

71cc6a9d4228c0 arch/x86/kvm/svm/svm.c Omar Sandoval       2025-10-29  318  static int svm_update_soft_interrupt_rip(struct kvm_vcpu *vcpu, u8 vector)
6ef88d6e36c2b4 arch/x86/kvm/svm/svm.c Sean Christopherson 2022-05-02  319  {
71cc6a9d4228c0 arch/x86/kvm/svm/svm.c Omar Sandoval       2025-10-29  320  	const int emul_type = EMULTYPE_SKIP | EMULTYPE_SKIP_SOFT_INT |
71cc6a9d4228c0 arch/x86/kvm/svm/svm.c Omar Sandoval       2025-10-29 @321  			      EMULTYPE_GET_SOFT_INT_VECTOR(vector);

vector is a u8 but EMULTYPE_GET_SOFT_INT_VECTOR() is:
define EMULTYPE_GET_SOFT_INT_VECTOR(e)	(((e) >> 16) & 0xff)
so something is mixed up.

63129754178c55 arch/x86/kvm/svm/svm.c Paolo Bonzini       2021-03-02  322  	unsigned long rip, old_rip = kvm_rip_read(vcpu);
6ef88d6e36c2b4 arch/x86/kvm/svm/svm.c Sean Christopherson 2022-05-02  323  	struct vcpu_svm *svm = to_svm(vcpu);
66b7138f913635 arch/x86/kvm/svm.c     Jan Kiszka          2010-02-23  324  
66b7138f913635 arch/x86/kvm/svm.c     Jan Kiszka          2010-02-23  325  	/*
6ef88d6e36c2b4 arch/x86/kvm/svm/svm.c Sean Christopherson 2022-05-02  326  	 * Due to architectural shortcomings, the CPU doesn't always provide
6ef88d6e36c2b4 arch/x86/kvm/svm/svm.c Sean Christopherson 2022-05-02  327  	 * NextRIP, e.g. if KVM intercepted an exception that occurred while

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

