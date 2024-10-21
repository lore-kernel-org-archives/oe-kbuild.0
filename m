Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8490B1DE8B1
	for <oe-kbuild@lists.linux.dev>; Mon, 21 Oct 2024 07:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729495789; cv=none; b=Zyd7FyBGQtmE09S9CgCsYsKjieKUqCt+PfZzaqJYmtnS3SVH1n/kow9KBc2mbt8j0+bqHupu4P9UJow+nZYvhDT2CkQQf7smywke+RkOZZDjF+lODEOYybcei20SjAdBwJFOOO8PGGxqi6xThA9umBtkMWKkehoYWnUQTle4UwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729495789; c=relaxed/simple;
	bh=XrusYag+LII0liDvjBVw2JqWK3sU0P0bEy+YtyI5W7M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uxc5qzEBZIZ0K0TPiuocRYdzyaeVsOGSFBvpNio4EFWSuQDJUp60YNdY8nDQHVl5S6shYGHU6E17CU+baKWFNIW2SHshX9YuvqxyL4Wy+K1IGTiko04BcBqSmcTq6T9ovUgPXaAC20jJkcg9/1EKAGkEMWQ+ir1qKrl4GaQBzzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e1KVuxvT; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e1KVuxvT"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4315baec681so41708005e9.2
        for <oe-kbuild@lists.linux.dev>; Mon, 21 Oct 2024 00:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729495785; x=1730100585; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T/oqIfHdzcYvPr+1084fMJueTQGBe/OWdE59Qz6opvs=;
        b=e1KVuxvTTgGChzfNRlgw7AMmLl1/FfPirBM1B+xhR9Q294hKSIw5/DBGaSL9EOoIoA
         7MGoFMCjzxhg4mWPOffCZzIRTN0TV32rb9ia1DhA+6DzUZZLvLdjSUc6Svf9l2k1UbpD
         qk7PtB83Svm7D0oJEXF9n7+D0HHYXN/UUvb+yOGA7ELyEhj7Fu9/xaHNyAoWnnnMfjfZ
         bw3V7HcKvTEOhdOw7SrXsKL1sIo01c0AcVICAOH/mJOw2FK/QTGPq0KwYksknqIQn6lW
         +1QjRCmWDdYnavP0naSSWqMCqs9KNi67kEVdeISy1IO2lTj9HQCWtW901SlISx3a4/05
         Q2+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729495785; x=1730100585;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T/oqIfHdzcYvPr+1084fMJueTQGBe/OWdE59Qz6opvs=;
        b=FYJiLH4GAe1GzEXkLI+NlcCWh+IHnrNi+EieoGP+khX5x8XEoxiF05YDkckQbh4fsS
         PBkWz3EeUtzIy3O8nLKvTtJAStP/NZD5HyPcwXzUBOlHhgBN8OZj7w+K4H623z4WO4Kt
         WX3xYiUEVE6qm58fQ+eiqWPT/ij8817/dYxlctam3oqS+j6Nc0dq8M1NwtfeHpFog60X
         igQZTMYzji4IadjPvTqSft1LImkJqXDK3OBovU5zqM6wmoP0Sxgz2LfZePIA2GfeaGHc
         6jR59aXBuWKAnriQhsbbPwFHwH95zdt4P2VtvPbuezzGooDYJsZgSJgt3+FNpVtZ7lBp
         MS3A==
X-Gm-Message-State: AOJu0Yx6dCtPf08UZ9Of9iSKsyRu7qInxpuA6IlvFfTrVMvIvk2XBMXZ
	+Vw3sMYUdDegh33yhlDT2LxpXl9ZdYRU/V3bMgFgGPVJo0AsArDeAKe+1Tt9cNesQXMKjb61A4i
	y
X-Google-Smtp-Source: AGHT+IEiT5sMS+JgZu4ao5jBHWTOP1eckzgWiyUMsyejreFShjkny/C9UcGB2hR74+jC68Jx+/qP2w==
X-Received: by 2002:adf:a34e:0:b0:37d:4b73:24c0 with SMTP id ffacd0b85a97d-37eb4896bcemr6237577f8f.35.1729495785515;
        Mon, 21 Oct 2024 00:29:45 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0b944f0sm3581825f8f.77.2024.10.21.00.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 00:29:45 -0700 (PDT)
Date: Mon, 21 Oct 2024 10:29:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Marc Zyngier <maz@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: arch/arm64/kvm/at.c:71 at_s1e1p_fast() error: uninitialized symbol
 'fail'.
Message-ID: <7612de9a-d262-4d40-addb-64449768b35a@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3d5ad2d4eca337e80f38df77de89614aa5aaceb9
commit: be0135bde1df5e80cffacd2ed6f952e6d38d6f71 KVM: arm64: nv: Add basic emulation of AT S1E1{R,W}P
date:   7 weeks ago
config: arm64-randconfig-r071-20241015 (https://download.01.org/0day-ci/archive/20241020/202410200209.bAXXL58Q-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202410200209.bAXXL58Q-lkp@intel.com/

smatch warnings:
arch/arm64/kvm/at.c:71 at_s1e1p_fast() error: uninitialized symbol 'fail'.

vim +/fail +71 arch/arm64/kvm/at.c

be0135bde1df5e Marc Zyngier 2024-07-14  52  static bool at_s1e1p_fast(struct kvm_vcpu *vcpu, u32 op, u64 vaddr)
be0135bde1df5e Marc Zyngier 2024-07-14  53  {
be0135bde1df5e Marc Zyngier 2024-07-14  54  	u64 host_pan;
be0135bde1df5e Marc Zyngier 2024-07-14  55  	bool fail;
be0135bde1df5e Marc Zyngier 2024-07-14  56  
be0135bde1df5e Marc Zyngier 2024-07-14  57  	host_pan = read_sysreg_s(SYS_PSTATE_PAN);
be0135bde1df5e Marc Zyngier 2024-07-14  58  	write_sysreg_s(*vcpu_cpsr(vcpu) & PSTATE_PAN, SYS_PSTATE_PAN);
be0135bde1df5e Marc Zyngier 2024-07-14  59  
be0135bde1df5e Marc Zyngier 2024-07-14  60  	switch (op) {
be0135bde1df5e Marc Zyngier 2024-07-14  61  	case OP_AT_S1E1RP:
be0135bde1df5e Marc Zyngier 2024-07-14  62  		fail = __kvm_at(OP_AT_S1E1RP, vaddr);
be0135bde1df5e Marc Zyngier 2024-07-14  63  		break;
be0135bde1df5e Marc Zyngier 2024-07-14  64  	case OP_AT_S1E1WP:
be0135bde1df5e Marc Zyngier 2024-07-14  65  		fail = __kvm_at(OP_AT_S1E1WP, vaddr);
be0135bde1df5e Marc Zyngier 2024-07-14  66  		break;

default case?

be0135bde1df5e Marc Zyngier 2024-07-14  67  	}
be0135bde1df5e Marc Zyngier 2024-07-14  68  
be0135bde1df5e Marc Zyngier 2024-07-14  69  	write_sysreg_s(host_pan, SYS_PSTATE_PAN);
be0135bde1df5e Marc Zyngier 2024-07-14  70  
be0135bde1df5e Marc Zyngier 2024-07-14 @71  	return fail;
be0135bde1df5e Marc Zyngier 2024-07-14  72  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

