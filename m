Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8548F10967
	for <oe-kbuild@lists.linux.dev>; Fri, 13 Oct 2023 09:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ku9t+RU3"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-9a6190af24aso310054566b.0
        for <oe-kbuild@lists.linux.dev>; Fri, 13 Oct 2023 02:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697187985; x=1697792785; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ICdCbc96AfhpeUwF2FpVWUFYN0NDR/8vF+plEaKQfdg=;
        b=ku9t+RU33/WYSEGdp5L2bLIsnH9KTyezYG4i2jXI5V0P/nswCS/rqZmSUvUQ75MinH
         BQp6tq2Ku1fMeoLPXPbj1bKI3HD2obhEt49NPZFM1CkU0x5fOsI4M7BB56My+bN+92Rm
         MVu8yPZXU2FIvCb/bNIg+7EnKttrdVx+/eHJjiXapSHYgkkypkinzm5PJSLbsITTw3Xg
         iyE5s6jPpZjTpXGsENkfHILeud6Cbj+RfN4RdYhBmTX6D3+NtQ3kGFHyYPyAvZZvR6Ri
         b0+E2wU4ORnfNqlfdHHglaBa3kqADyTz7pTNLTXmtBgDveqpcGXM4bfafiZqWWdWuQrc
         rguw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697187985; x=1697792785;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ICdCbc96AfhpeUwF2FpVWUFYN0NDR/8vF+plEaKQfdg=;
        b=DjBwheqUhoXoyyl72fj+vWDgzHCohsuZe6lOycZHEArBTznrgEMOLZTwBMM33lOOwk
         1ekH3lT/osHoFpa8bnwoGEgXCJAsVsF7l9BsJWmiA/r5qubGlgGkmxQxqqV4qKZhjdBe
         FdzVonNRBcpfT1mo/vybxmcqjm+2RRCdhkwvkO3xFyfnTajQlTuNz7hUvKLu91Q0TZUv
         VWcPSfpMRWekYVmgT06LK5Z8P6b+tJeKDQrK+VzKoi+H0eKvw5h9tjYXa5lMN31TyEoa
         Tb+oxbQG7u4IHfGABcqP/L3vya/JP2iNucTfD40oSic7OcJt3bkZbDDcsLmhd2S8RfXC
         LKDA==
X-Gm-Message-State: AOJu0YzUO8cP5QzB5qeG8RzBUPy+lt1qeHfIq+G2z3XFzSRJZH+z3FLD
	gBQgAVyx1hinAMm5CB5ahrOn9MinHo4YkL+2mfQ=
X-Google-Smtp-Source: AGHT+IGheZ3hBkvdUTSIt8pjKSA00ZURPxw9q0BWrE34pvKkMrrsnMhMvLBO30xGYqJtAPo5/PbM2g==
X-Received: by 2002:a17:907:75f7:b0:9ae:658f:a80a with SMTP id jz23-20020a17090775f700b009ae658fa80amr22490267ejc.48.1697187985523;
        Fri, 13 Oct 2023 02:06:25 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id a11-20020adff7cb000000b00326f0ca3566sm20231469wrq.50.2023.10.13.02.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 02:06:25 -0700 (PDT)
Date: Fri, 13 Oct 2023 12:06:22 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Mike Kravetz <mike.kravetz@oracle.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Muchun Song <muchun.song@linux.dev>, linux-mm@kvack.org,
	Sidhartha Kumar <sidhartha.kumar@oracle.com>
Subject: Re: [PATCH 2/3] hugetlb: Remove a few calls to page_folio()
Message-ID: <736ebb93-76d4-4096-8b73-657a9698e043@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230822162808.4131399-2-willy@infradead.org>

Hi Matthew,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Matthew-Wilcox-Oracle/hugetlb-Remove-a-few-calls-to-page_folio/20230823-002932
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20230822162808.4131399-2-willy%40infradead.org
patch subject: [PATCH 2/3] hugetlb: Remove a few calls to page_folio()
config: x86_64-randconfig-161-20230827 (https://download.01.org/0day-ci/archive/20231013/202310131039.ZgssYfIB-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231013/202310131039.ZgssYfIB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202310131039.ZgssYfIB-lkp@intel.com/

smatch warnings:
mm/hugetlb.c:2246 remove_pool_huge_page() error: uninitialized symbol 'folio'.

vim +/folio +2246 mm/hugetlb.c

10c6ec49802b17 Mike Kravetz            2021-05-04  2224  static struct page *remove_pool_huge_page(struct hstate *h,
10c6ec49802b17 Mike Kravetz            2021-05-04  2225  						nodemask_t *nodes_allowed,
6ae11b278bca1c Lee Schermerhorn        2009-12-14  2226  						 bool acct_surplus)
e8c5c8249878fb Lee Schermerhorn        2009-09-21  2227  {
b2261026825ed3 Joonsoo Kim             2013-09-11  2228  	int nr_nodes, node;
cfd5082b514765 Sidhartha Kumar         2022-11-29  2229  	struct folio *folio;
e8c5c8249878fb Lee Schermerhorn        2009-09-21  2230  
9487ca60fd7fa2 Mike Kravetz            2021-05-04  2231  	lockdep_assert_held(&hugetlb_lock);
b2261026825ed3 Joonsoo Kim             2013-09-11  2232  	for_each_node_mask_to_free(h, nr_nodes, node, nodes_allowed) {
685f345708096e Lee Schermerhorn        2009-09-21  2233  		/*
685f345708096e Lee Schermerhorn        2009-09-21  2234  		 * If we're returning unused surplus pages, only examine
685f345708096e Lee Schermerhorn        2009-09-21  2235  		 * nodes with surplus pages.
685f345708096e Lee Schermerhorn        2009-09-21  2236  		 */
b2261026825ed3 Joonsoo Kim             2013-09-11  2237  		if ((!acct_surplus || h->surplus_huge_pages_node[node]) &&
b2261026825ed3 Joonsoo Kim             2013-09-11  2238  		    !list_empty(&h->hugepage_freelists[node])) {
e601ce76a2aabd Matthew Wilcox (Oracle  2023-08-22  2239) 			folio = list_entry(h->hugepage_freelists[node].next,
e601ce76a2aabd Matthew Wilcox (Oracle  2023-08-22  2240) 					  struct folio, lru);
cfd5082b514765 Sidhartha Kumar         2022-11-29  2241  			remove_hugetlb_folio(h, folio, acct_surplus);
9a76db09970938 Lee Schermerhorn        2009-12-14  2242  			break;

So we're always guaranteed to hit this break statement?

e8c5c8249878fb Lee Schermerhorn        2009-09-21  2243  		}
b2261026825ed3 Joonsoo Kim             2013-09-11  2244  	}
e8c5c8249878fb Lee Schermerhorn        2009-09-21  2245  
e601ce76a2aabd Matthew Wilcox (Oracle  2023-08-22 @2246) 	return &folio->page;
e8c5c8249878fb Lee Schermerhorn        2009-09-21  2247  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

