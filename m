Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 012CD3C21
	for <oe-kbuild@lists.linux.dev>; Mon, 10 Jul 2023 06:13:17 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-3fbc5d5742eso45821095e9.3
        for <oe-kbuild@lists.linux.dev>; Sun, 09 Jul 2023 23:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688969595; x=1691561595;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wXNvLRBC5Wb/C/VUDEkbUeSAzHOqdZT5BxTP+psigNI=;
        b=nEXz0m5negXSgM9H8uganWtwGjQ3Lu4sDJVDACUflkEtCsp8/hVAmOFbQGKT1oQ59t
         suuOFy7RN4gKk4sC+jE2PnyiqDMMh6qKJlWQhiU9gUYD7bhufd1UIrQ70D8CkdW2lGig
         lFna4aok+j4vDLQSCOOU4re6IbX/GOaCeKgGLsMO8OHSjTQ66HnCgKqS4+K27IT+63oF
         JKF376gnQULV4NrksKyR1Bp7TxTf4iUzvNLD0l/lIyozgGjMfE57MLNZye19bPm2SviK
         LW9L0UWcGFtTE2RVYUpwuvZ5GUNs3qNiByuMQsB/sPL4GQiMKd5rg5aLjLOebnXYLEZY
         2EGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688969595; x=1691561595;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wXNvLRBC5Wb/C/VUDEkbUeSAzHOqdZT5BxTP+psigNI=;
        b=XOuqLbz/R25DrJpTAdIlNmsB2HbuEykQGwcagKjUui1VMRbt8GxNMsDfrzKMz55r8H
         AsBYxXLWh1VwJS/PbGkoOspUbEWKOxTrhgDPUAaVnUXMS851prO6BonxAp96tw9l0ab2
         CI4o9D/fFIKMfEY0LqNn7vplHgiC8ynMGA9yWHC3NXSKfbYadkfKOCfibRgjGGQCXMNd
         ohGwxTEcWUK1UKJQnIQ29/vSl5l2mKkM9orEHX9VxeQZ9PG3GtEpisV8+ORIaBUiD0Oi
         myj1ak1M1ffkejO4XgQ+dcfgyl6hUfZCaPR+G3ODoXCkN0/ZK/AKRJ8FutkPgjKvVPEU
         IheA==
X-Gm-Message-State: ABy/qLasdGahnFiKwJSfjf3lz0XGEVH/xafBdM8U7GLrmxpInoPdTg1C
	+MW7Iy1qgGdyWFLgCZCg9xuzyg296hdhNU57884=
X-Google-Smtp-Source: APBJJlE9ZMcnG/V1TZbjgMDMGxGsqWuMQtTCmcL46EiXRtUaXNGY3f6D/z8gVsTOTRrH/4cINZuHDA==
X-Received: by 2002:a1c:ed02:0:b0:3f7:3685:1e10 with SMTP id l2-20020a1ced02000000b003f736851e10mr10447356wmh.40.1688969595030;
        Sun, 09 Jul 2023 23:13:15 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id p11-20020a1c740b000000b003fbe36a4ce6sm9311458wmc.10.2023.07.09.23.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jul 2023 23:13:12 -0700 (PDT)
Date: Mon, 10 Jul 2023 09:13:10 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Matthew Wilcox <willy@infradead.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [willy-pagecache:set_ptes 20/38] arch/parisc/kernel/cache.c:383
 flush_icache_pages() warn: potential pointer math issue ('page' is a 288 bit
 pointer)
Message-ID: <bfc5670f-bc6b-4a7b-9fe3-eb525bc61f59@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/willy/pagecache set_ptes
head:   7fc835f5dab4eda45bb3ccfe31ff21d6bfa39486
commit: fec0c60dfaa0faca021fb8224068a1fd48a573cb [20/38] parisc: Implement the new page table range API
config: parisc-randconfig-m031-20230709 (https://download.01.org/0day-ci/archive/20230709/202307090536.80ITHgBk-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230709/202307090536.80ITHgBk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202307090536.80ITHgBk-lkp@intel.com/

smatch warnings:
arch/parisc/kernel/cache.c:383 flush_icache_pages() warn: potential pointer math issue ('page' is a 288 bit pointer)

vim +383 arch/parisc/kernel/cache.c

fec0c60dfaa0fa Matthew Wilcox (Oracle  2023-02-13  373) void flush_icache_pages(struct vm_area_struct *vma, struct page *page,
fec0c60dfaa0fa Matthew Wilcox (Oracle  2023-02-13  374) 		unsigned int nr)
fec0c60dfaa0fa Matthew Wilcox (Oracle  2023-02-13  375) {
fec0c60dfaa0fa Matthew Wilcox (Oracle  2023-02-13  376) 	void *kaddr = page_address(page);
fec0c60dfaa0fa Matthew Wilcox (Oracle  2023-02-13  377) 
fec0c60dfaa0fa Matthew Wilcox (Oracle  2023-02-13  378) 	for (;;) {
fec0c60dfaa0fa Matthew Wilcox (Oracle  2023-02-13  379) 		flush_kernel_dcache_page_addr(kaddr);
fec0c60dfaa0fa Matthew Wilcox (Oracle  2023-02-13  380) 		flush_kernel_icache_page(kaddr);
fec0c60dfaa0fa Matthew Wilcox (Oracle  2023-02-13  381) 		if (--nr == 0)
fec0c60dfaa0fa Matthew Wilcox (Oracle  2023-02-13  382) 			break;
fec0c60dfaa0fa Matthew Wilcox (Oracle  2023-02-13 @383) 		page += PAGE_SIZE;
                                                                        ^^^^^^^^^^^^^^^^^^
This doesn't make sense, and also we need to re-calculate kaddr on each
iteration through the loop.  Probably kaddr += PAGE_SIZE?

fec0c60dfaa0fa Matthew Wilcox (Oracle  2023-02-13  384) 	}
fec0c60dfaa0fa Matthew Wilcox (Oracle  2023-02-13  385) }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

