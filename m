Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F4ACBD31
	for <oe-kbuild@lists.linux.dev>; Tue,  7 Feb 2023 07:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675756430; x=1707292430;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Nk3v+v1vBtW04PhcF7vgbd7VZekVGVlf3nazqMqiPCw=;
  b=VmN8mrEXuaIskMpr7b5R+o2bhf+VKqsiRlaFulFVzuTcKh9Yu+ADGYs1
   VLgXFIBv1go9mqajtYbFN8wens2zZTGWwNLrWcGs5uYQlI5jsM1vw6qkX
   mDo0LZSgFml96DMct2XUyJ0ZuGvgsAvFcgg+T9UHyB4MBIt2pQ/sG+I18
   m60ki54WvYMC8pUPsOlbHGbC15SKN2wv1/fxk9Oton98SSc/taTua+tJe
   Nk1FEwi3skmBeJdoEv5BYuYvYKEPcLPqlE5S52yRw2DJ1B6n6JgCCWN23
   /eQ7lNARpkdX6WIxP1ITgOk1nYbn1UDzjgUibXl56ZCBgRA6V34vGTlkF
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="331566207"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; 
   d="scan'208";a="331566207"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2023 23:53:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="912234760"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; 
   d="scan'208";a="912234760"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 06 Feb 2023 23:53:48 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pPInT-0003J7-2A;
	Tue, 07 Feb 2023 07:53:47 +0000
Date: Tue, 7 Feb 2023 15:53:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH for-next v7 6/6] RDMA/rxe: Replace rxe_map and
 rxe_phys_buf by xarray
Message-ID: <202302071553.dxgzoPxM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230119235936.19728-7-rpearsonhpe@gmail.com>
References: <20230119235936.19728-7-rpearsonhpe@gmail.com>
TO: Bob Pearson <rpearsonhpe@gmail.com>

Hi Bob,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on 1ec82317a1daac78c04b0c15af89018ccf9fa2b7]

url:    https://github.com/intel-lab-lkp/linux/commits/Bob-Pearson/RDMA-rxe-Cleanup-mr_check_range/20230120-080520
base:   1ec82317a1daac78c04b0c15af89018ccf9fa2b7
patch link:    https://lore.kernel.org/r/20230119235936.19728-7-rpearsonhpe%40gmail.com
patch subject: [PATCH for-next v7 6/6] RDMA/rxe: Replace rxe_map and rxe_phys_buf by xarray
:::::: branch date: 3 weeks ago
:::::: commit date: 3 weeks ago
config: s390-randconfig-m041-20230206 (https://download.01.org/0day-ci/archive/20230207/202302071553.dxgzoPxM-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
drivers/infiniband/sw/rxe/rxe_mr.c:130 rxe_mr_fill_pages_from_sgt() warn: inconsistent returns '&((&xas)->xa)->xa_lock'.

vim +130 drivers/infiniband/sw/rxe/rxe_mr.c

02ea0a511558c9 Li Zhijian  2022-12-06   98  
3222da9099ca42 Bob Pearson 2023-01-19   99  static int rxe_mr_fill_pages_from_sgt(struct rxe_mr *mr, struct sg_table *sgt)
3222da9099ca42 Bob Pearson 2023-01-19  100  {
3222da9099ca42 Bob Pearson 2023-01-19  101  	XA_STATE(xas, &mr->page_list, 0);
3222da9099ca42 Bob Pearson 2023-01-19  102  	struct sg_page_iter sg_iter;
3222da9099ca42 Bob Pearson 2023-01-19  103  	struct page *page;
3222da9099ca42 Bob Pearson 2023-01-19  104  	bool persistent = !!(mr->access & IB_ACCESS_FLUSH_PERSISTENT);
3222da9099ca42 Bob Pearson 2023-01-19  105  
3222da9099ca42 Bob Pearson 2023-01-19  106  	__sg_page_iter_start(&sg_iter, sgt->sgl, sgt->orig_nents, 0);
3222da9099ca42 Bob Pearson 2023-01-19  107  	if (!__sg_page_iter_next(&sg_iter))
3222da9099ca42 Bob Pearson 2023-01-19  108  		return 0;
3222da9099ca42 Bob Pearson 2023-01-19  109  
3222da9099ca42 Bob Pearson 2023-01-19  110  	do {
3222da9099ca42 Bob Pearson 2023-01-19  111  		xas_lock(&xas);
3222da9099ca42 Bob Pearson 2023-01-19  112  		while (true) {
3222da9099ca42 Bob Pearson 2023-01-19  113  			page = sg_page_iter_page(&sg_iter);
3222da9099ca42 Bob Pearson 2023-01-19  114  
3222da9099ca42 Bob Pearson 2023-01-19  115  			if (persistent && !is_pmem_page(page)) {
3222da9099ca42 Bob Pearson 2023-01-19  116  				rxe_dbg_mr(mr, "Page can't be persistent\n");
3222da9099ca42 Bob Pearson 2023-01-19  117  				return -EINVAL;
3222da9099ca42 Bob Pearson 2023-01-19  118  			}
3222da9099ca42 Bob Pearson 2023-01-19  119  
3222da9099ca42 Bob Pearson 2023-01-19  120  			xas_store(&xas, page);
3222da9099ca42 Bob Pearson 2023-01-19  121  			if (xas_error(&xas))
3222da9099ca42 Bob Pearson 2023-01-19  122  				break;
3222da9099ca42 Bob Pearson 2023-01-19  123  			xas_next(&xas);
3222da9099ca42 Bob Pearson 2023-01-19  124  			if (!__sg_page_iter_next(&sg_iter))
3222da9099ca42 Bob Pearson 2023-01-19  125  				break;
3222da9099ca42 Bob Pearson 2023-01-19  126  		}
3222da9099ca42 Bob Pearson 2023-01-19  127  		xas_unlock(&xas);
3222da9099ca42 Bob Pearson 2023-01-19  128  	} while (xas_nomem(&xas, GFP_KERNEL));
3222da9099ca42 Bob Pearson 2023-01-19  129  
3222da9099ca42 Bob Pearson 2023-01-19 @130  	return xas_error(&xas);
3222da9099ca42 Bob Pearson 2023-01-19  131  }
3222da9099ca42 Bob Pearson 2023-01-19  132  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
