Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5704F340DB1
	for <oe-kbuild@lists.linux.dev>; Wed, 19 Nov 2025 12:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763555837; cv=none; b=NpoddpnrWYS5BJjZnFuFq4dg5JF9aKXU+Pgg/YfyizlyFWGFFoVyZCvv6HCtIKdAoO2a2UL0IECrXzZ7RxKbh3aT2cHXOPL9SFhvWsxh4TcXU0LjDHmUeFBGkrS2ECrK9vtk1ovPPa4QRBmNPaRreuArJyN8hGFCPNrmpnz/2Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763555837; c=relaxed/simple;
	bh=cvBlKjUi3la4FRQ842NLzR324mE7CJQHgUXi3+al4ow=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=NkbP2H0osG/OVo5ee3Lw3dxNHo2t2ljGaA51+hdY5PisCE2/gjvy9raGZ9Qb4RXao+rvtq1mQS+ftq2C1i+BoCmRsOLnhBhFCCDf+IX2sVQae2VSV/LQFRTtn3Xti6SVU/jX6SYT0oyZx8BE0sxemnuGpe3oTGap/NKQ0qkexJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X2DHhvec; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X2DHhvec"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-42bb288c1bfso2920134f8f.2
        for <oe-kbuild@lists.linux.dev>; Wed, 19 Nov 2025 04:37:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763555833; x=1764160633; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UbNuZv/5Za3Oc7Abgb1kuQDSQgL1n6Sh6FodFTL94fI=;
        b=X2DHhvecPwP9h8E6JVs5Zk06s6j6SMkv7xlVDbfud+BEdcdjIkCMAvk5u0E6BeNn5A
         st3YKoAHItJ9iXQQTKV4Kc3T2W/w9SaM1vpY54PWtH+U9A/GDAvNGG+QuOXE3oxCFn15
         V9GXOSgBEhLHHQQ434T9fXhOQEapBMFIQoEJEtYbfom+R6vEpfYE+DpM/LgzeoIhgeKs
         SYGD6LYZrmiFqyYsWWOMSoW70Z5rOr72ZdKVIviSrpQgQxTBdOZmNMBhUY/l/wR+k6oV
         Ow7gnShJB7JJx9pkZJvVsRaIPWUbvf5aHQyhaMfL7MygzOePYb9jEym1Rkv0gYoIa5Cw
         +00g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763555833; x=1764160633;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UbNuZv/5Za3Oc7Abgb1kuQDSQgL1n6Sh6FodFTL94fI=;
        b=nqyHr79DFZ8sfJbW81ONbfwMiHdBpzV0Drcs9ipQlZmfHHIQO5g+FnKf0ABWXrSxuP
         OT7WTs+ZFKtp1T9ubNf5YQbbgBLFVFFKickzUopMmN+8fXKCNvVTRwA8uascj/ByYF/b
         QcJ2uq5cprjl3UdK02tE5mHv+00VXS4FGTIV3avccHD5CDh0JsCtZvDo58rLHqdr4+6H
         1u3rtJle59oGFD7kfJrW5Tzct9okgo/u9dP4M31/zhDhBPH3mCLqO1oyGjCgsN4QLw9q
         XLOPTXiWpzfh07l5boTtO2V2f15hTd98gfPjPB7jLnWNEEYWGIqLawbgAk36olMRqz8V
         FR5A==
X-Gm-Message-State: AOJu0YxcGYBltuduCR/oQkAm9lFAiu5WCjn68++wq34rHNqOILMUF+cF
	sqPICgdlp/ZbOfEki4q/ACTEKn/Yk7uA/FlRtTafTTVOmfvdLgxpv+KnPKWiSzAKolptnGOcN8y
	3A87i
X-Gm-Gg: ASbGncvA7yfy8DtioCPenEZV9jlasdQs8iAHMsY81x2Q2yw/OOXvnBN5TsEzSGcsy8M
	eAIsvmkwYBQhASyPcaM/zQ4vPYspOCwEP4ExjyN47m2NzqRLCbXFssjEPVRLpUrErTfqQiEJsEs
	XEfGRGQ0XtvBYtLVQSXX47To+m+dkK80YOvzJs3of+BIWKrtdXoGGsCfPNDjLvYp3A/uV3jOvVR
	2wOs2AJUsbgQRQJHIXwGa8KKPHycuTIxLAoJOemlGPg9FdSuU0dQuF3inG2HTOi5qXIwVVzoJtg
	n2In2HvYsd4WiPmqiU3xMh/46XXIQjVSS0VRKY8z0dMOK81/8XaO2YIMpiAN9iIh8AWoAHQ8BnH
	6i9TNk3gBUFW0yN+022YS/W31nIz/ISGW+BPJe0ROxhggxBuuhu83yNmfblKIcZtUwtuX4psr2/
	YI/Is75a+U3GJ2wpktHqzgH2YMIww=
X-Google-Smtp-Source: AGHT+IEkeW7AYIkdag7V6zOou3VntsZM8Hgog/jx8e0yYhvUx47QmrZwYx5wIGi3mp9Al3RK8NbQFQ==
X-Received: by 2002:a05:6000:40c9:b0:429:8b01:c093 with SMTP id ffacd0b85a97d-42b5934f642mr18648197f8f.15.1763555833162;
        Wed, 19 Nov 2025 04:37:13 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-42b53e846afsm36908546f8f.13.2025.11.19.04.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 04:37:12 -0800 (PST)
Date: Wed, 19 Nov 2025 15:37:09 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Wei Yang <richard.weiyang@gmail.com>,
	willy@infradead.org, akpm@linux-foundation.org, david@kernel.org,
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, ziy@nvidia.com,
	baolin.wang@linux.alibaba.com, npache@redhat.com,
	ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org,
	lance.yang@linux.dev
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
	Wei Yang <richard.weiyang@gmail.com>
Subject: Re: [PATCH] mm/huge_memory: consolidate order-related checks into
 folio_split_supported()
Message-ID: <202511151652.GKPwEctt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251114075703.10434-1-richard.weiyang@gmail.com>
Message-ID: <20251119123709.im4XFM2I1ERtw2VdpHEzdT1l-bamRm8pLeERUt47Nks@z>

Hi Wei,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Wei-Yang/mm-huge_memory-consolidate-order-related-checks-into-folio_split_supported/20251114-155833
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20251114075703.10434-1-richard.weiyang%40gmail.com
patch subject: [PATCH] mm/huge_memory: consolidate order-related checks into folio_split_supported()
config: i386-randconfig-141-20251115 (https://download.01.org/0day-ci/archive/20251115/202511151652.GKPwEctt-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202511151652.GKPwEctt-lkp@intel.com/

smatch warnings:
mm/huge_memory.c:3696 folio_split_supported() warn: signedness bug returning '(-22)'

vim +3696 mm/huge_memory.c

aa27253af32c74 Wei Yang 2025-11-06  3690  bool folio_split_supported(struct folio *folio, unsigned int new_order,
                                          ^^^^
This is a bool function.

aa27253af32c74 Wei Yang 2025-11-06  3691  		enum split_type split_type, bool warns)
58729c04cf1092 Zi Yan   2025-03-07  3692  {
ab62f1bb0caaa5 Wei Yang 2025-11-14  3693  	const int old_order = folio_order(folio);
ab62f1bb0caaa5 Wei Yang 2025-11-14  3694  
ab62f1bb0caaa5 Wei Yang 2025-11-14  3695  	if (new_order >= old_order)
ab62f1bb0caaa5 Wei Yang 2025-11-14 @3696  		return -EINVAL;

s/-EINVAL/false/

ab62f1bb0caaa5 Wei Yang 2025-11-14  3697  
58729c04cf1092 Zi Yan   2025-03-07  3698  	if (folio_test_anon(folio)) {
58729c04cf1092 Zi Yan   2025-03-07  3699  		/* order-1 is not supported for anonymous THP. */
58729c04cf1092 Zi Yan   2025-03-07  3700  		VM_WARN_ONCE(warns && new_order == 1,
58729c04cf1092 Zi Yan   2025-03-07  3701  				"Cannot split to order-1 folio");
28753037121116 Zi Yan   2025-11-05  3702  		if (new_order == 1)
28753037121116 Zi Yan   2025-11-05  3703  			return false;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

