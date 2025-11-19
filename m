Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93AE62F6933
	for <oe-kbuild@lists.linux.dev>; Wed, 19 Nov 2025 12:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763555949; cv=none; b=LDodSxtVVG55Z1sP7r9FQjh+sqrYwyhI98GtgBUMZXCGwd7WZakdkEPUHTgpd+IqDIgtnfhCNvMv1PyMrfYAspvQJIPs7B2Vzm2YMzuVVP9wQLfPKLXWrDErQssMekVc1ZBbuklP1DvbrtsFwlKXHHi29y7rwsYsVWzuHkki85A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763555949; c=relaxed/simple;
	bh=5gFeZNgqrsMX6jwOkCEQwUdo7/X9FYun+sRtuOCorE8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N5RBlAvdWHcHFY/V9+UsDYLhht6jfqPztzqWQYx3N4BeDUyU19tU9lMOVZK3CNoRvN6JpoBBDE27UUccKayFdz9Nu116oIg5sY3+7m6CuJo1pHBo0ZLXLRTm8agLAnjj0/DRphP9bdJ0f95Dhvwem6xMTJKEf7cDWs52WjgJ49M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=APm3CLBC; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="APm3CLBC"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-640bd9039fbso11255769a12.2
        for <oe-kbuild@lists.linux.dev>; Wed, 19 Nov 2025 04:39:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763555946; x=1764160746; darn=lists.linux.dev;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CHvebzZNHtF5Uirfhl1zM1fOdHCkj14yEnqWrebk/Qs=;
        b=APm3CLBCJOgcyd4P3ylL7OewcRYjgSWK8XL0zqPuEuEMxerVs54U6H+rPzYmIX9fK4
         9i8zzTIzsN8yXSAWMehWej34BRoVWrIOApEH6FZtD3mKCrQYK9wDpIpuog862SzTAdoE
         SZqI+t3Ksg+K+4v/v1yzmvNJQEUT7pfMkwmWi8hvC2EAsrupDpJEhzA8sD/v0DtZuNmv
         LFyuC4SQ1NFqHMYumlM2LiEzIJWhxi4bSLa1MOC3EcnBQk/pT1/P68S5EftSwg9s2hdC
         yqKVcTImsCJi/fdM4+8rK1XbSsoVYeA8Lp86X/PklWeuL1VT/czj6aH7rT4r0ehCHWbc
         84/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763555946; x=1764160746;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CHvebzZNHtF5Uirfhl1zM1fOdHCkj14yEnqWrebk/Qs=;
        b=jkabG/CPmy5ZcjxMggIC/7YpUNEUz6ZVTdLPrKxfwvwIQCssb23YHVzk4FVdOZxDDV
         qySoP2n0GobJrpip406E8bEWUAEJ2Vw3BrDiZl0xlT4Oda34CrF6yXeRopk+s4pbxOwF
         Z6sr562S3F54zZ/YPTAtEqo6ck3JZlxWVc0S89GUh7VazGcawIS1saO8WIzMPQtGpB6L
         UtZ/8H+WVrQ2PPUqXIwfrA6sQShJ/XDRAdf1jjUTFB/uTjkBWSHnKaQun8pjCOKBJiLF
         FLJVAuqR6EJiWXcDS1dJa/Fp4kalgsENcGmtXUPsp1MRfAkqlf6md76MI0wNCmfAwNFQ
         0Uxw==
X-Gm-Message-State: AOJu0Ywiu2LMkNzKq/9VhhmPHDKURBWV4NNtYfSfyxKC7CQwez/mTtRJ
	1hCXBCphWynLaeA4TGUI8oSnC97Bf6xuzXkuzy+J46621QV/ThRsMT4P
X-Gm-Gg: ASbGncunD/bgjnpXC5824puIkL9rKskU3r1Eut52BwrLKH9eZVz2nbAo2HZvctMScEM
	yZejQ1eYglSNCI4+umxTH6PGJ19PabFmVRPtvDZ5Q6tN4ebL1kzcWesZZ0dvkb5PaXLdCto+k6a
	nUv7BPIJnpE6trg4p0oY+IMHEUQkZHJZ+Qk8mf0rCo+opGmuobSVrUGoZf5PyLab8V9x91+C3Zw
	I3Q/6kXCh7b3vDr9donKuvlXdAIzDzFqLgYl4mB3xuWMhf9JfzCGqKGkHRozYJI3g6njuHLeL4t
	xPoMkHTZI1kvw2X44n1mw8uSUCrK93lZMKMtiQx9Pjb57xjHdN3m9Gdo1IVyL6yhK0SBQccgt1n
	9E/ISLkKNUS+SCUJagMbd0UPjQJEQgGCzX0MXRp1svVlotDc65QJYuO54kILU6N4S76DPSoocO2
	QvDIdRDyDqrxnCcpfPo8AeAV8J
X-Google-Smtp-Source: AGHT+IH6kOS0l+EUbnypOaJgGizNY/obs0hzloB1TKPSHs9xqLDPIWs5NS3ucRiDjUds0rraP+UpiA==
X-Received: by 2002:a05:6402:354d:b0:640:ef03:82c9 with SMTP id 4fb4d7f45d1cf-6451e36df53mr2153224a12.11.1763555945740;
        Wed, 19 Nov 2025 04:39:05 -0800 (PST)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6433a3f96e2sm14975912a12.16.2025.11.19.04.39.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Nov 2025 04:39:05 -0800 (PST)
Date: Wed, 19 Nov 2025 12:39:05 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, Wei Yang <richard.weiyang@gmail.com>,
	willy@infradead.org, akpm@linux-foundation.org, david@kernel.org,
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, ziy@nvidia.com,
	baolin.wang@linux.alibaba.com, npache@redhat.com,
	ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org,
	lance.yang@linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH] mm/huge_memory: consolidate order-related checks into
 folio_split_supported()
Message-ID: <20251119123905.ak67ykufvfr4iulr@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <20251114075703.10434-1-richard.weiyang@gmail.com>
 <202511151652.GKPwEctt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202511151652.GKPwEctt-lkp@intel.com>
User-Agent: NeoMutt/20170113 (1.7.2)

On Wed, Nov 19, 2025 at 03:37:09PM +0300, Dan Carpenter wrote:
>Hi Wei,
>
>kernel test robot noticed the following build warnings:
>
>url:    https://github.com/intel-lab-lkp/linux/commits/Wei-Yang/mm-huge_memory-consolidate-order-related-checks-into-folio_split_supported/20251114-155833
>base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
>patch link:    https://lore.kernel.org/r/20251114075703.10434-1-richard.weiyang%40gmail.com
>patch subject: [PATCH] mm/huge_memory: consolidate order-related checks into folio_split_supported()
>config: i386-randconfig-141-20251115 (https://download.01.org/0day-ci/archive/20251115/202511151652.GKPwEctt-lkp@intel.com/config)
>compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
>
>If you fix the issue in a separate patch/commit (i.e. not just a new version of
>the same patch/commit), kindly add following tags
>| Reported-by: kernel test robot <lkp@intel.com>
>| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
>| Closes: https://lore.kernel.org/r/202511151652.GKPwEctt-lkp@intel.com/
>
>smatch warnings:
>mm/huge_memory.c:3696 folio_split_supported() warn: signedness bug returning '(-22)'
>
>vim +3696 mm/huge_memory.c
>
>aa27253af32c74 Wei Yang 2025-11-06  3690  bool folio_split_supported(struct folio *folio, unsigned int new_order,
>                                          ^^^^
>This is a bool function.
>
>aa27253af32c74 Wei Yang 2025-11-06  3691  		enum split_type split_type, bool warns)
>58729c04cf1092 Zi Yan   2025-03-07  3692  {
>ab62f1bb0caaa5 Wei Yang 2025-11-14  3693  	const int old_order = folio_order(folio);
>ab62f1bb0caaa5 Wei Yang 2025-11-14  3694  
>ab62f1bb0caaa5 Wei Yang 2025-11-14  3695  	if (new_order >= old_order)
>ab62f1bb0caaa5 Wei Yang 2025-11-14 @3696  		return -EINVAL;

Thanks, this is noticed.

>
>s/-EINVAL/false/
>
>ab62f1bb0caaa5 Wei Yang 2025-11-14  3697  
>58729c04cf1092 Zi Yan   2025-03-07  3698  	if (folio_test_anon(folio)) {
>58729c04cf1092 Zi Yan   2025-03-07  3699  		/* order-1 is not supported for anonymous THP. */
>58729c04cf1092 Zi Yan   2025-03-07  3700  		VM_WARN_ONCE(warns && new_order == 1,
>58729c04cf1092 Zi Yan   2025-03-07  3701  				"Cannot split to order-1 folio");
>28753037121116 Zi Yan   2025-11-05  3702  		if (new_order == 1)
>28753037121116 Zi Yan   2025-11-05  3703  			return false;
>
>-- 
>0-DAY CI Kernel Test Service
>https://github.com/intel/lkp-tests/wiki

-- 
Wei Yang
Help you, Help me
