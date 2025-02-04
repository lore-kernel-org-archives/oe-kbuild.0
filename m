Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 903A18632C
	for <oe-kbuild@lists.linux.dev>; Tue,  4 Feb 2025 05:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738647339; cv=none; b=CWAKUSkjfjZz/UUR2xgboOTk6DAl+wzFvvKccMVINhWz0uGZkPczxg3Wdj24YCe3ubMJztAZNKNhtF7B4WM5nrahjYGCicRlOvdxeLk69lmA6UBwde6eL16gj79TIGY4OSUb+qwixmhlh6Q2ro4wAw8aPiv+fnAErcylAvrgdwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738647339; c=relaxed/simple;
	bh=BjHG0vmth8yC+oW0++Ffn/GnF16KJXZGKhD3z8AXeE0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=iFAvXmocWg+TGXp3DvyiJx+PfUEmZzIBB0o3L0e4d0HIDsY99mdXjBTQ+XXzbm5Y6SKI/8vzaRnyo7aRSE5pC9l43pnHRQOAt/s22utX0ZKzi+lBznD7smPlk8COPNTriRdtXFxQI6FqR+9LYgoJ4gKdqJqDOIqdbb35RWdaS4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p68IwkX8; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p68IwkX8"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-38daa53a296so69808f8f.3
        for <oe-kbuild@lists.linux.dev>; Mon, 03 Feb 2025 21:35:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738647335; x=1739252135; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tUvQP8JEHlkgcD2xmyvKIckaZiqi4/8ixqUZMk5qb70=;
        b=p68IwkX8WJZn44xNfHZk/e+KBODa77Jasc7bB/KZ23cw6gLexMC6jCBDYEBGZ3ifl3
         +rC8Ddma9DZacJv5EjujHuNp5qMhnFmamjC2rKIXAyDk74w6PRw2ZOTc+tr966iG8sfG
         /Cbyqk7Fj7X2rks0ZYbYjWQ8PtiAPDKCX3TzxmamveJQsIgCR8rKVFJJCoaLdxINTadU
         lTE6YvDA/cOCBiC2sdlcj59u4NC1B7oHPirsFfEkmphOpz0r92OJxL0S3XXQOhtPaola
         kO/Wy133rBag51wmHpoFyXH5tHK17R2C0aelRV+XcxKtjYOoO0OSm2oLjRmTLvVj920x
         uvqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738647335; x=1739252135;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tUvQP8JEHlkgcD2xmyvKIckaZiqi4/8ixqUZMk5qb70=;
        b=KReY7oWpvqgxJLboRqkocmQOAa0qyhJU/7X19ncuCAyA7iBBmQzlnIErk5kv1NTPWk
         XDx8aHVOHQka394HDwN1Q/zwYrkW9vdhrgOFhE9nMlxmqVF8P/hkTtJuFIz5MsKOOfFn
         HkAVV9B4TkcKoSKnJXD+GdKidM1gqLkC1SzgTGjNoCLNgjLznmpYnkZX1wdk71CyzcZk
         lWUqtfmlC2Nyu3pp2/QcYhnB6yiIZaN7Zy91FBK8QkQ3JuetCZ+OFGZpTyRDAdqXV2PU
         2Hu7QLRqDCMeaeoDjZgfng7kVBushXKqHKFcDX/VXCq+TMxNXJEVawyqOqCfO+k53LSK
         beIw==
X-Gm-Message-State: AOJu0YyUqqiG9njUs9BaG0zWPp2m/PzAqW4yqgbZPoPT5CUDnCH8R64u
	Uy9r+ksJryUYgAJRjXR0V6JEqJkxZFf/u0kL0IsmboUf+aRxoIdsoqWlMONEM5QGcKJHV+zupuM
	g
X-Gm-Gg: ASbGncvQe5ZZemwSUvwuQNpGxqklhUKfNOPGiYCGNdlqSYhDkyxXK8ZximCmGqAf1eI
	hXn8SN3KV3tgjoamQ/6uxFEPiSYCkVq/43HgXTYOGhk/mWkUh/og5tPy44WMxfxVKkArYcYym86
	8GM/fw3av/V1GJ7eac3Ew2z+iUlGYSH9jUMMGtXlIyevo7y/4K+5ziV+NYAXvD2r5THuibb/5Es
	xx0EmjCHNLMvtmKm93BInfgXVD42hvyOQ8SRDPv8dx5f3lP+IdpmRaJee7waIt5uqcYYpeQ3GQN
	qJ5Jh5s1gfEYkUkuhS/8
X-Google-Smtp-Source: AGHT+IHse6k2ju8lQTupcNRILQAhLnrltOq9ltVJkZ/F33I3wtgfC9QaI018suj5bRqpBzvfdzOHrw==
X-Received: by 2002:a05:6000:156d:b0:38d:a90c:d489 with SMTP id ffacd0b85a97d-38da90cd618mr491446f8f.45.1738647335154;
        Mon, 03 Feb 2025 21:35:35 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43907f16ffasm6388055e9.1.2025.02.03.21.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 21:35:34 -0800 (PST)
Date: Tue, 4 Feb 2025 08:35:31 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Sean Christopherson <seanjc@google.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 15/16] x86/kvmclock: Stuff local APIC bus period when
 core crystal freq comes from CPUID
Message-ID: <f9d42d5a-a625-4eba-9ee4-c2c42d179df7@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250201021718.699411-16-seanjc@google.com>

Hi Sean,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Sean-Christopherson/x86-tsc-Add-a-standalone-helpers-for-getting-TSC-info-from-CPUID-0x15/20250201-102521
base:   ebbb8be421eefbe2d47b99c2e1a6dd840d7930f9
patch link:    https://lore.kernel.org/r/20250201021718.699411-16-seanjc%40google.com
patch subject: [PATCH 15/16] x86/kvmclock: Stuff local APIC bus period when core crystal freq comes from CPUID
config: i386-randconfig-141-20250204 (https://download.01.org/0day-ci/archive/20250204/202502041246.3weiY0qo-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202502041246.3weiY0qo-lkp@intel.com/

smatch warnings:
arch/x86/kernel/kvmclock.c:117 kvm_get_tsc_khz() error: uninitialized symbol 'crystal_khz'.

vim +/crystal_khz +117 arch/x86/kernel/kvmclock.c

aea5814308ed7c Sean Christopherson 2025-01-31  105  static unsigned long kvm_get_tsc_khz(void)
aea5814308ed7c Sean Christopherson 2025-01-31  106  {
aea5814308ed7c Sean Christopherson 2025-01-31  107  	unsigned int __tsc_khz, crystal_khz;
aea5814308ed7c Sean Christopherson 2025-01-31  108  
32cd84ebbd5dbd Sean Christopherson 2025-01-31  109  	/*
32cd84ebbd5dbd Sean Christopherson 2025-01-31  110  	 * Prefer CPUID over kvmclock when possible, as CPUID also includes the
32cd84ebbd5dbd Sean Christopherson 2025-01-31  111  	 * core crystal frequency, i.e. the APIC timer frequency.  When the core
32cd84ebbd5dbd Sean Christopherson 2025-01-31  112  	 * crystal frequency is enumerated in CPUID.0x15, KVM's ABI is that the
32cd84ebbd5dbd Sean Christopherson 2025-01-31  113  	 * (virtual) APIC BUS runs at the same frequency.
32cd84ebbd5dbd Sean Christopherson 2025-01-31  114  	 */
32cd84ebbd5dbd Sean Christopherson 2025-01-31  115  	if (!cpuid_get_tsc_freq(&__tsc_khz, &crystal_khz)) {

The cpuid_get_tsc_freq() function has a bug so it doesn't actually
initialize crystal_khz.  It actually uses the uninitialized value, inside
the function but Smatch doesn't catch that.

32cd84ebbd5dbd Sean Christopherson 2025-01-31  116  #ifdef CONFIG_X86_LOCAL_APIC
32cd84ebbd5dbd Sean Christopherson 2025-01-31 @117  		lapic_timer_period = crystal_khz * 1000 / HZ;
32cd84ebbd5dbd Sean Christopherson 2025-01-31  118  #endif
aea5814308ed7c Sean Christopherson 2025-01-31  119  		return __tsc_khz;
32cd84ebbd5dbd Sean Christopherson 2025-01-31  120  	}
aea5814308ed7c Sean Christopherson 2025-01-31  121  
aea5814308ed7c Sean Christopherson 2025-01-31  122  	return pvclock_tsc_khz(this_cpu_pvti());
aea5814308ed7c Sean Christopherson 2025-01-31  123  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

