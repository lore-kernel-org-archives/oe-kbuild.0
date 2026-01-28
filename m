Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6EC266B67
	for <oe-kbuild@lists.linux.dev>; Wed, 28 Jan 2026 09:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769594240; cv=none; b=J3g4FkuWySqMHeMHfYx7HFz3ey0TfmDzTQowCaG+bExs6n4anVTmJfecHGh+HgB9OF8Smp6cod/ShGs6B9owNgfUeinLkbqMbWkj498OolmCEztz9q/xw0OI9cBVkqBbEIx4uf0bxe5XucAPK3EozhtgLXT7OfdcI/FeSSarEew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769594240; c=relaxed/simple;
	bh=GggrU3bHRA2xu7TDJMBNtXtRmwXwSU/q1CIR6m78pCU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fKTclFdt/KuV4t7CXArJ3dnxonTfnnp7lOcTZPp3pS2U7+9FlWgsWpLuG5jvXwLsxjl8XutTzHw5VE5xxVsiwSkAquMMg0NQzDXFZ+M+QwqYLD02vpG7d7z0Ulxii8OgWkxEKkk7KLbXWmSN0RW5eFtq4ix7k8wuMzqZ4bmgxbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rD/cYRq7; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rD/cYRq7"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43591b55727so6316565f8f.3
        for <oe-kbuild@lists.linux.dev>; Wed, 28 Jan 2026 01:57:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769594236; x=1770199036; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HmurQjdqSltJTABjXwnR2dRO5LAhljSLSjk5kJrk+Lk=;
        b=rD/cYRq7fgjugWFdTRge8wcXUuAsiXVjkJaq3wipEi5mKRm3hcLqKbdM5PzREobT3N
         tpBhtKGpcGBB5anH8oCIBrI6hmus/1/hBnmPo7rVvETAlStyuiKhmNZElH5tlTFcm0nJ
         ySVTicHfQEOrhLOb8ogLzCL71XHYXT5wN4ds4MvbnIK5KewSfxyisOBXBl432xQmMIbz
         Pn2JTbh2aPa5qk7EbJHzAoKC2kiQv9Y92M8kTpjE1XZek9o8OG76rFusV2tqZynWkPKE
         wwTE/IthBr8g3i2zRDkW6S6fuBtTbepSd+XKhffDNIY9Sp87MQ0fGy0CyTiddwy6KLDl
         mFhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769594236; x=1770199036;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HmurQjdqSltJTABjXwnR2dRO5LAhljSLSjk5kJrk+Lk=;
        b=LGg8rLjq+rs7fOz0+r3BNYGVhZPHl6N6eoQfaVxjpwalgZ1vIp/B1WYHEUjZTDR5g7
         9P/6fC2j6zcIiwUOeTNmN8rP7xPx3Tv0qQS4ggO0gwHI9VHat/qIL5gSM/zzlc0uzvx/
         IUOOlcFSnwuwagj+ZjYwQcUc1ehEBavQPJRUMOgMEYmLibJoIAtki+KdJGGByW/tjXWW
         352AELiTUEPfklnIr2AjoI6PUn8UNCK/cyVhNx5d6CxUakhRqCgyAnuwVP0BkqyiNOXt
         FZklXMtAFQiY7i5+pfaFWP35ynOBVeHhiodTNR20WSpVjs0XjBUv6mplZJ4rR0XMXmYw
         8UDA==
X-Gm-Message-State: AOJu0YziHOMbo8q7ines90FLQcYFrsi2M27pl/Hjh1OPTSq9SLXaCftX
	dc3Wb3K11kS2EtUrt73xfTrWea8OAzDwau5QmCwrhwoqFacXJRRYxcdbQ4jEXLPDLFsi/R5BBQ8
	dvkGC6Ik=
X-Gm-Gg: AZuq6aL2vXbHKB9uRI5f0RVvlO1csFtouzZ76MZ3yWoXGGqjEtqhFK2DzKlKxK+uwF3
	pXG+tTinDX3sq4A0sAqMJzMsdbiYmGcf932MA1w+wkolPBAEjqpGsbond06Wx40CqqDwTu/O1tt
	DPNEeKUUM+nDzBXRnAmF5OQhaXml/pHOs3jO2ANXE72FcllmSz9H3neiSdImWuWHpK2azeIbQXr
	/PbWS+RB+BUe3t6XjX871gmXGrjqXzsEtkOXdDGMeCc2PQXcDpWWSc04uPyYh6FljKZDeU6cnM6
	//mAU088PKAsodHpRwJ5r6WO4ScvdprmIxewcWdYbIy3dQPI3y2bMJae6G/9rjxVAWkCQ1uiWBd
	wIUF88L8mdlHOs02ylx0PlR8L5Uz5Cu6+9BezRo5/Ed2NFYwkIzr9PPi9tIvwyo2UfacQ4h1GO4
	dROtAiTe35qJNnLDT7
X-Received: by 2002:a05:6000:290f:b0:432:7068:18a with SMTP id ffacd0b85a97d-435dd032b79mr7484322f8f.20.1769594236265;
        Wed, 28 Jan 2026 01:57:16 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e131cfc9sm5507393f8f.21.2026.01.28.01.57.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 01:57:15 -0800 (PST)
Date: Wed, 28 Jan 2026 12:57:12 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Sean Christopherson <seanjc@google.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/tdx_huge_sept 40/47] arch/x86/kvm/mmu/tdp_mmu.c:1485
 tdp_mmu_alloc_sp_for_split() error: dereferencing freed memory 'sp' (line
 1483)
Message-ID: <202601250549.1WtInTxT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260128095712.DsEyPNHQ6GzqfibOET2LwjAjwW7zE1uTHh1XLSRXLcM@z>

tree:   https://github.com/sean-jc/linux x86/tdx_huge_sept
head:   4277c23972d92102c257f4d22acd908a47c0d69e
commit: b1b08e9b2efc1b59d94433702c6c4669cbd86ba4 [40/47] KVM: x86/mmu: Add Dynamic PAMT support to vCPU-induced page split
config: x86_64-randconfig-161-20260124 (https://download.01.org/0day-ci/archive/20260125/202601250549.1WtInTxT-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202601250549.1WtInTxT-lkp@intel.com/

smatch warnings:
arch/x86/kvm/mmu/tdp_mmu.c:1485 tdp_mmu_alloc_sp_for_split() error: dereferencing freed memory 'sp' (line 1483)

vim +/sp +1485 arch/x86/kvm/mmu/tdp_mmu.c

4957bdc853d5f9d Isaku Yamahata      2026-01-21  1457  static struct kvm_mmu_page *tdp_mmu_alloc_sp_for_split(struct tdp_iter *iter)
a3fe5dbda0a4bb7 David Matlack       2022-01-19  1458  {
a3fe5dbda0a4bb7 David Matlack       2022-01-19  1459  	struct kvm_mmu_page *sp;
a3fe5dbda0a4bb7 David Matlack       2022-01-19  1460  
e1c04f7a9f4213c David Matlack       2024-06-11  1461  	sp = kmem_cache_zalloc(mmu_page_header_cache, GFP_KERNEL_ACCOUNT);
a3fe5dbda0a4bb7 David Matlack       2022-01-19  1462  	if (!sp)
a3fe5dbda0a4bb7 David Matlack       2022-01-19  1463  		return NULL;
a3fe5dbda0a4bb7 David Matlack       2022-01-19  1464  
e1c04f7a9f4213c David Matlack       2024-06-11  1465  	sp->spt = (void *)get_zeroed_page(GFP_KERNEL_ACCOUNT);
b1b08e9b2efc1b5 Sean Christopherson 2026-01-22  1466  	if (!sp->spt)
b1b08e9b2efc1b5 Sean Christopherson 2026-01-22  1467  		goto err_spt;
a3fe5dbda0a4bb7 David Matlack       2022-01-19  1468  
4957bdc853d5f9d Isaku Yamahata      2026-01-21  1469  	if (is_mirror_sptep(iter->sptep)) {
4957bdc853d5f9d Isaku Yamahata      2026-01-21  1470  		sp->external_spt = (void *)kvm_x86_call(alloc_external_sp)(GFP_KERNEL_ACCOUNT);
b1b08e9b2efc1b5 Sean Christopherson 2026-01-22  1471  		if (!sp->external_spt)
b1b08e9b2efc1b5 Sean Christopherson 2026-01-22  1472  			goto err_external_spt;
b1b08e9b2efc1b5 Sean Christopherson 2026-01-22  1473  
b1b08e9b2efc1b5 Sean Christopherson 2026-01-22  1474  		if (kvm_x86_call(topup_external_cache)(kvm_get_running_vcpu(), 1))
b1b08e9b2efc1b5 Sean Christopherson 2026-01-22  1475  			goto err_external_split;
4957bdc853d5f9d Isaku Yamahata      2026-01-21  1476  	}
4957bdc853d5f9d Isaku Yamahata      2026-01-21  1477  
a3fe5dbda0a4bb7 David Matlack       2022-01-19  1478  	return sp;
b1b08e9b2efc1b5 Sean Christopherson 2026-01-22  1479  
b1b08e9b2efc1b5 Sean Christopherson 2026-01-22  1480  err_external_split:
b1b08e9b2efc1b5 Sean Christopherson 2026-01-22  1481  	kvm_x86_call(free_external_sp)((unsigned long)sp->external_spt);
b1b08e9b2efc1b5 Sean Christopherson 2026-01-22  1482  err_spt:
b1b08e9b2efc1b5 Sean Christopherson 2026-01-22 @1483  	kmem_cache_free(mmu_page_header_cache, sp);
                                                                                               ^^
b1b08e9b2efc1b5 Sean Christopherson 2026-01-22  1484  err_external_spt:
b1b08e9b2efc1b5 Sean Christopherson 2026-01-22 @1485  	free_page((unsigned long)sp->spt);
                                                                  ^^^^^^^^^^^^^^^^^^^^^^
This is done out of order.

b1b08e9b2efc1b5 Sean Christopherson 2026-01-22  1486  	return NULL;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

