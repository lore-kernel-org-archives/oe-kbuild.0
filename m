Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE44EB0F
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Jan 2023 17:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672940928; x=1704476928;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tNhcC1wM4jJqc1fmrm4sfsy314gOjCYrIrBOW6bFNkY=;
  b=bjrvcy9Nnvlbv0dse6x72rsmSZg7JidRHyvytqIE9I9HjRWXtdE/WlrB
   eE1okrjryl9Bjh9eXO6Inwf/1aS/iNoPP5R6+G2Swt0RLvICpXSNjva7a
   L6tWOHzsTxLj756Ampgm+FCX8/n8yqJHeEQHJsl+uluPYxTVxYWQgjFHd
   9xNIzDPWMzZzTarFfatm/LI5FnjoRBoKCM9uVHrlSE81+flnD+cBK0jOA
   9BGz1+xtWa5f19T00ayoVfdc9mP/xUN4ZLtTB4htkTC4ATf85XtxSlROT
   uUezwKW3JQtF6wSJKKRhKfNSTajTRo0cmkN4/fh4BMcG1m9McUwsQudIw
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10581"; a="320981731"
X-IronPort-AV: E=Sophos;i="5.96,303,1665471600"; 
   d="scan'208";a="320981731"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2023 09:48:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10581"; a="744348728"
X-IronPort-AV: E=Sophos;i="5.96,303,1665471600"; 
   d="scan'208";a="744348728"
Received: from lkp-server02.sh.intel.com (HELO f1920e93ebb5) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 05 Jan 2023 09:48:32 -0800
Received: from kbuild by f1920e93ebb5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pDULv-0002DF-2g;
	Thu, 05 Jan 2023 17:48:31 +0000
Date: Fri, 6 Jan 2023 01:47:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 1380/2872]
 drivers/net/ethernet/broadcom/bnxt/bnxt_xdp.c:180:18: warning: Parameter
 'data_ptr' can be declared as pointer to const [constParameter]
Message-ID: <202301060119.NqbpgQQ1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/net/ethernet/broadcom/bnxt/bnxt_xdp.c:180:18: warning: Parameter 'data_ptr' can be declared as pointer to const [constParameter]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Michael Chan <michael.chan@broadcom.com>
CC: Andy Gospodarek <andrew.gospodarek@broadcom.com>
CC: Somnath Kotur <somnath.kotur@broadcom.com>
CC: Pavan Chebbi <pavan.chebbi@broadcom.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   cc3c08b41a9c9402ead726ec6deb1217081d0d8b
commit: bbfc17e50ba2ed18dfef46b1c433d50a58566bf1 [1380/2872] bnxt_en: Simplify bnxt_xdp_buff_init()
:::::: branch date: 14 hours ago
:::::: commit date: 8 days ago
compiler: xtensa-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout bbfc17e50ba2ed18dfef46b1c433d50a58566bf1
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/net/ethernet/broadcom/bnxt/bnxt_xdp.c:180:18: warning: Parameter 'data_ptr' can be declared as pointer to const [constParameter]
      u16 cons, u8 *data_ptr, unsigned int len,
                    ^
   drivers/net/ethernet/broadcom/bnxt/bnxt_xdp.c:91:12: warning: Signed integer overflow for expression '0xffff<<16'. [integerOverflow]
    flags &= ~TX_BD_LEN;
              ^

vim +/data_ptr +180 drivers/net/ethernet/broadcom/bnxt/bnxt_xdp.c

b231c3f3414cfc7 Andy Gospodarek 2022-04-08  178  
b231c3f3414cfc7 Andy Gospodarek 2022-04-08  179  void bnxt_xdp_buff_init(struct bnxt *bp, struct bnxt_rx_ring_info *rxr,
bbfc17e50ba2ed1 Michael Chan    2022-12-26 @180  			u16 cons, u8 *data_ptr, unsigned int len,
b231c3f3414cfc7 Andy Gospodarek 2022-04-08  181  			struct xdp_buff *xdp)
b231c3f3414cfc7 Andy Gospodarek 2022-04-08  182  {
b231c3f3414cfc7 Andy Gospodarek 2022-04-08  183  	struct bnxt_sw_rx_bd *rx_buf;
7dd3de7cb1d657a Pavan Chebbi    2022-08-22  184  	u32 buflen = PAGE_SIZE;
b231c3f3414cfc7 Andy Gospodarek 2022-04-08  185  	struct pci_dev *pdev;
b231c3f3414cfc7 Andy Gospodarek 2022-04-08  186  	dma_addr_t mapping;
b231c3f3414cfc7 Andy Gospodarek 2022-04-08  187  	u32 offset;
b231c3f3414cfc7 Andy Gospodarek 2022-04-08  188  
b231c3f3414cfc7 Andy Gospodarek 2022-04-08  189  	pdev = bp->pdev;
b231c3f3414cfc7 Andy Gospodarek 2022-04-08  190  	rx_buf = &rxr->rx_buf_ring[cons];
b231c3f3414cfc7 Andy Gospodarek 2022-04-08  191  	offset = bp->rx_offset;
b231c3f3414cfc7 Andy Gospodarek 2022-04-08  192  
b231c3f3414cfc7 Andy Gospodarek 2022-04-08  193  	mapping = rx_buf->mapping - bp->rx_dma_offset;
bbfc17e50ba2ed1 Michael Chan    2022-12-26  194  	dma_sync_single_for_cpu(&pdev->dev, mapping + offset, len, bp->rx_dir);
b231c3f3414cfc7 Andy Gospodarek 2022-04-08  195  
7dd3de7cb1d657a Pavan Chebbi    2022-08-22  196  	if (bp->xdp_has_frags)
7dd3de7cb1d657a Pavan Chebbi    2022-08-22  197  		buflen = BNXT_PAGE_MODE_BUF_SIZE + offset;
7dd3de7cb1d657a Pavan Chebbi    2022-08-22  198  
7dd3de7cb1d657a Pavan Chebbi    2022-08-22  199  	xdp_init_buff(xdp, buflen, &rxr->xdp_rxq);
bbfc17e50ba2ed1 Michael Chan    2022-12-26  200  	xdp_prepare_buff(xdp, data_ptr - offset, offset, len, false);
b231c3f3414cfc7 Andy Gospodarek 2022-04-08  201  }
b231c3f3414cfc7 Andy Gospodarek 2022-04-08  202  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
