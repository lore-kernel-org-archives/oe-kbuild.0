Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4787621CC59
	for <oe-kbuild@lists.linux.dev>; Fri, 26 Sep 2025 15:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758900854; cv=none; b=LRaho6zEErePcEnA3DViIJFs+LeeIRMpXrtU44OcTR+J56PNMKUh21/34h6nZQZBPD9eDmC8V2hI2y+b3fWIRNfm+CVOt+1e56IlE7ceFw9xuBLkhz95zlG9yhNTrcvCJG9jBCFHowG9G2YqjNfhIZP4ASMfhDi0sT9SL6jRCJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758900854; c=relaxed/simple;
	bh=amq4RZUuIaO1rbxYvaeVC1c+2M8VAlnoCSUSXeNoFNA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=ifhgD+Q9MXJCcCkGawqaRSww9Qu19AABQyhaSuAZS3Ni97w7ov8n223QXl7z4i95cQ533YmcsgsmdmBkQ6RYRI3DwjzqTUTaSOl+BQlR33j+IcUhfyciH08XaTqfBCq7Gd7twhQ1/iYsQhER1Mn4OZxlxv/V6m/EH21bBTLeMFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v/T73TIq; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v/T73TIq"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-46e1cc6299cso22655655e9.1
        for <oe-kbuild@lists.linux.dev>; Fri, 26 Sep 2025 08:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758900850; x=1759505650; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HMO5hgJCbwtV9PK2cFfsUx2fXWFzdBYn4BBsNRBK1CI=;
        b=v/T73TIqNh64XyRtGnea4gR4i9Lc7iHIJyBOWdVIN3AWp54HI52cRIFQTwsbZjcFzc
         f92S0CicKlml4IwME65OQpmJYPA6wUr+YC7AeDNr3wVISGVTI/DmYXU9EJo6hH1fpKXx
         Yu1umfUI3JQbkgyfjDLNIS/bGg0wWaFsA7UOqfbW38zrS5Jk58iKnLcp26S3/MJ+pYmU
         CkLjOqQyl8LNitTtoVCkYmacJV1hM05gnBmewxEERw2s3OW97G8aeZNTuiJhfnyYt4Zs
         T3YpUIdcmBJI0d069CEZWcdB11EgASs6qBL7ydC2r08C7ccMn3wv2yFDZ/uJlYTfjpkw
         V9Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758900850; x=1759505650;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HMO5hgJCbwtV9PK2cFfsUx2fXWFzdBYn4BBsNRBK1CI=;
        b=Nl7aOkrZ5kpSYTAscxrjLO2AMZdC+xsiEUWvt7yoLeM4+xv33r2UhEaWgBeN6f0qB8
         1kVsYCN7ma8u0laF6kIv/gX/k+wTPIUDVH2ki8MzM9um3tOwKap8Aqz/S9HY4gk+f+0U
         Fp1F4uqk2QglLYdh59jW3DffEU/l0lb9MYgTosaoihpQKwwXAYGXo3seMsJyf48+Xq2o
         WQjEJY7MLWVEjBbXEnmgwMwEuA+2i4vI4TeGiHl24G5gEgz9puyLVqpVTXpwufPm1wGv
         0WftkI7WlQV6guZ6DNPC0VvA0284p5Bw7X0ytw9QYgEiC6YopI2MY/F/jUG4/IZrguP2
         TY3Q==
X-Gm-Message-State: AOJu0Yx1I8hlgHi1uK2PLeNdQiy2kAL0t+oG5uUL34KwiEj9wA7Hl3yo
	1hBjSGKloiNwv+fbtJrw6idVwm3huPC/IT286UB8PskdV+xrdapXNra5sIL54Yhv90J0jBK5cYp
	7M78l
X-Gm-Gg: ASbGnctEkHPisGXhYARrUSqk6pLmp8XyO9K5cd/AMqwMMVfU9V/k9ryO+KKOR2X965r
	SJCcq5czrYf6wRmWGZeJXuBkfiLcjV7dxg2Ld3E0eyZDboZX7I/Yl/a0N60bysCUr1NH+Gb7J+5
	9UaTmgS+FlSVKgCpBVC79Ayl4j1PQGXzomaY/EhU9wyFpQ4gepeIuAk9pmSZe0Kw5QT5wOFqV/o
	hTVgLG0lgsqEKkXgFFwIp3mwPEN2FeZJfuR3SWJdSRWMOVxv8wD9HDKyHo/bQHnbyh20g3CMgyM
	tP/MryrCaHUL/ZWn82BL01j0hhNyOnSYmq7mMHGotZm+AcRYT6T7iE2dMCqXAwtx6zWVF02m0fA
	jfr6k4TBfP86YPxhFMzQnIhjnM0a3
X-Google-Smtp-Source: AGHT+IGeo7JSWe4sg6wC+JHBWfGr9CcvjUdGf1N82kHCNBejo0CZ5f4vzEILeKedV9H4Kp7q6LdOzQ==
X-Received: by 2002:a05:600c:8b62:b0:45d:5c71:769a with SMTP id 5b1f17b1804b1-46e39bdf9b4mr41759465e9.26.1758900850403;
        Fri, 26 Sep 2025 08:34:10 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-46e33bed6basm76990795e9.16.2025.09.26.08.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 08:34:10 -0700 (PDT)
Date: Fri, 26 Sep 2025 18:34:06 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Joshua Hahn <joshua.hahnjy@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Johannes Weiner <hannes@cmpxchg.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Chris Mason <chris.mason@fusionio.com>,
	Kiryl Shutsemau <kirill@shutemov.name>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Brendan Jackman <jackmanb@google.com>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@suse.cz>, Zi Yan <ziy@nvidia.com>,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH v2 1/4] mm/page_alloc/vmstat: Simplify
 refresh_cpu_vm_stats change detection
Message-ID: <202509260132.awvdNKqF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924204409.1706524-2-joshua.hahnjy@gmail.com>
Message-ID: <20250926153406.4lJCNpr3Tn9g2PE-bFf2F_zt8w5J8mGkzSpcAdCdGnk@z>

Hi Joshua,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Joshua-Hahn/mm-page_alloc-vmstat-Simplify-refresh_cpu_vm_stats-change-detection/20250925-044532
base:   097a6c336d0080725c626fda118ecfec448acd0f
patch link:    https://lore.kernel.org/r/20250924204409.1706524-2-joshua.hahnjy%40gmail.com
patch subject: [PATCH v2 1/4] mm/page_alloc/vmstat: Simplify refresh_cpu_vm_stats change detection
config: mips-randconfig-r073-20250925 (https://download.01.org/0day-ci/archive/20250926/202509260132.awvdNKqF-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project cafc064fc7a96b3979a023ddae1da2b499d6c954)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202509260132.awvdNKqF-lkp@intel.com/

smatch warnings:
mm/page_alloc.c:2591 decay_pcp_high() error: uninitialized symbol 'todo'.

vim +/todo +2591 mm/page_alloc.c

06fb80866d37b0 Joshua Hahn    2025-09-24  2564  bool decay_pcp_high(struct zone *zone, struct per_cpu_pages *pcp)
51a755c56dc05a Ying Huang     2023-10-16  2565  {
51a755c56dc05a Ying Huang     2023-10-16  2566  	int high_min, to_drain, batch;
06fb80866d37b0 Joshua Hahn    2025-09-24  2567  	bool todo;

needs to be initialized to false.

51a755c56dc05a Ying Huang     2023-10-16  2568  
51a755c56dc05a Ying Huang     2023-10-16  2569  	high_min = READ_ONCE(pcp->high_min);
51a755c56dc05a Ying Huang     2023-10-16  2570  	batch = READ_ONCE(pcp->batch);
51a755c56dc05a Ying Huang     2023-10-16  2571  	/*
51a755c56dc05a Ying Huang     2023-10-16  2572  	 * Decrease pcp->high periodically to try to free possible
51a755c56dc05a Ying Huang     2023-10-16  2573  	 * idle PCP pages.  And, avoid to free too many pages to
51a755c56dc05a Ying Huang     2023-10-16  2574  	 * control latency.  This caps pcp->high decrement too.
51a755c56dc05a Ying Huang     2023-10-16  2575  	 */
51a755c56dc05a Ying Huang     2023-10-16  2576  	if (pcp->high > high_min) {
51a755c56dc05a Ying Huang     2023-10-16  2577  		pcp->high = max3(pcp->count - (batch << CONFIG_PCP_BATCH_SCALE_MAX),
51a755c56dc05a Ying Huang     2023-10-16  2578  				 pcp->high - (pcp->high >> 3), high_min);
51a755c56dc05a Ying Huang     2023-10-16  2579  		if (pcp->high > high_min)
06fb80866d37b0 Joshua Hahn    2025-09-24  2580  			todo = true;
51a755c56dc05a Ying Huang     2023-10-16  2581  	}
51a755c56dc05a Ying Huang     2023-10-16  2582  
51a755c56dc05a Ying Huang     2023-10-16  2583  	to_drain = pcp->count - pcp->high;
51a755c56dc05a Ying Huang     2023-10-16  2584  	if (to_drain > 0) {
51a755c56dc05a Ying Huang     2023-10-16  2585  		spin_lock(&pcp->lock);
51a755c56dc05a Ying Huang     2023-10-16  2586  		free_pcppages_bulk(zone, to_drain, pcp, 0);
51a755c56dc05a Ying Huang     2023-10-16  2587  		spin_unlock(&pcp->lock);
06fb80866d37b0 Joshua Hahn    2025-09-24  2588  		todo = true;
51a755c56dc05a Ying Huang     2023-10-16  2589  	}
51a755c56dc05a Ying Huang     2023-10-16  2590  
51a755c56dc05a Ying Huang     2023-10-16 @2591  	return todo;
51a755c56dc05a Ying Huang     2023-10-16  2592  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

