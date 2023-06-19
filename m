Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142BE110B
	for <oe-kbuild@lists.linux.dev>; Mon, 19 Jun 2023 00:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687135797; x=1718671797;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5shT8OgZh6c+uVnUdHYbJFaV2G0YQEMDsBlP1LauBFQ=;
  b=WyFpuZMZFmGRfiVkSb3maEnlWAVcnOU5DJ3GHCJfHuiq7vdo/lOjoZkJ
   v1Yx9cONMkSH2DO60fVyJmmyvpnUdVQLd0Mgub9aGysuT6ZDOGI/7AteP
   nb6JZ4IT1EKHG+ZFSQzffRZ0bnr6hUyx7HqMriJ/TOgmXbl/+3wydTPCO
   jfJJuQRWAayTUZmxhSVdpY5INrjbWUMuQa3GI4AAC7AD00AFCM0JmPl+r
   NBAMx7luY97D8p/+q6R6vA+P7Qt/AHblSi7NysAqzZtXhgckBaGfpUnxK
   bZCijtz+U+waFFnQdHKOY/gFi/3Az0Sjrzf4lpTq+LUav3gNO38rubyEb
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="357008161"
X-IronPort-AV: E=Sophos;i="6.00,253,1681196400"; 
   d="scan'208";a="357008161"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2023 17:49:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="1043711141"
X-IronPort-AV: E=Sophos;i="6.00,253,1681196400"; 
   d="scan'208";a="1043711141"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 18 Jun 2023 17:49:55 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qB35e-0004AI-25;
	Mon, 19 Jun 2023 00:49:54 +0000
Date: Mon, 19 Jun 2023 08:48:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [avpatel:riscv_timer_imp_v1 43/50] drivers/iommu/dma-iommu.c:1698
 iommu_dma_compose_msi_msg() error: uninitialized symbol 'msi_addr'.
Message-ID: <202306190814.sEFyHNhA-lkp@intel.com>
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
TO: Anup Patel <apatel@ventanamicro.com>

tree:   https://github.com/avpatel/linux.git riscv_timer_imp_v1
head:   74a10c4f3857dece3424b109452f63add2baa7f6
commit: 59f0204d5995cda5dad48d7821d2d885a852f519 [43/50] irqchip/riscv-imsic: Improve IOMMU DMA support
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: i386-randconfig-m021-20230618 (https://download.01.org/0day-ci/archive/20230619/202306190814.sEFyHNhA-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230619/202306190814.sEFyHNhA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202306190814.sEFyHNhA-lkp@intel.com/

New smatch warnings:
drivers/iommu/dma-iommu.c:1698 iommu_dma_compose_msi_msg() error: uninitialized symbol 'msi_addr'.

Old smatch warnings:
drivers/iommu/dma-iommu.c:1358 iommu_dma_unmap_sg() error: uninitialized symbol 'start'.

vim +/msi_addr +1698 drivers/iommu/dma-iommu.c

ece6e6f0218b77 Julien Grall      2019-05-01  1679  
fa49364cd5e657 Robin Murphy      2022-08-16  1680  /**
fa49364cd5e657 Robin Murphy      2022-08-16  1681   * iommu_dma_compose_msi_msg() - Apply translation to an MSI message
fa49364cd5e657 Robin Murphy      2022-08-16  1682   * @desc: MSI descriptor prepared by iommu_dma_prepare_msi()
fa49364cd5e657 Robin Murphy      2022-08-16  1683   * @msg: MSI message containing target physical address
fa49364cd5e657 Robin Murphy      2022-08-16  1684   */
fa49364cd5e657 Robin Murphy      2022-08-16  1685  void iommu_dma_compose_msi_msg(struct msi_desc *desc, struct msi_msg *msg)
ece6e6f0218b77 Julien Grall      2019-05-01  1686  {
ece6e6f0218b77 Julien Grall      2019-05-01  1687  	struct device *dev = msi_desc_to_dev(desc);
ece6e6f0218b77 Julien Grall      2019-05-01  1688  	const struct iommu_domain *domain = iommu_get_domain_for_dev(dev);
ece6e6f0218b77 Julien Grall      2019-05-01  1689  	const struct iommu_dma_msi_page *msi_page;
59f0204d5995cd Anup Patel        2023-05-02  1690  	struct iommu_dma_cookie *cookie;
59f0204d5995cd Anup Patel        2023-05-02  1691  	phys_addr_t msi_addr;
59f0204d5995cd Anup Patel        2023-05-02  1692  
59f0204d5995cd Anup Patel        2023-05-02  1693  	if (!domain || !domain->iova_cookie)
59f0204d5995cd Anup Patel        2023-05-02  1694  		return;
ece6e6f0218b77 Julien Grall      2019-05-01  1695  
59f0204d5995cd Anup Patel        2023-05-02  1696  	cookie = domain->iova_cookie;
ece6e6f0218b77 Julien Grall      2019-05-01  1697  	msi_page = msi_desc_get_iommu_cookie(desc);
59f0204d5995cd Anup Patel        2023-05-02 @1698  	if (!msi_page || msi_page->phys != msi_addr) {
59f0204d5995cd Anup Patel        2023-05-02  1699  		msi_addr = ((u64)msg->address_hi << 32) | msg->address_lo;
59f0204d5995cd Anup Patel        2023-05-02  1700  		msi_addr &= ~(phys_addr_t)(cookie_msi_granule(cookie) - 1);
ece6e6f0218b77 Julien Grall      2019-05-01  1701  
59f0204d5995cd Anup Patel        2023-05-02  1702  		msi_desc_set_iommu_cookie(desc, NULL);
59f0204d5995cd Anup Patel        2023-05-02  1703  		list_for_each_entry(msi_page, &cookie->msi_page_list, list) {
59f0204d5995cd Anup Patel        2023-05-02  1704  			if (msi_page->phys == msi_addr) {
59f0204d5995cd Anup Patel        2023-05-02  1705  				msi_desc_set_iommu_cookie(desc, msi_page);
59f0204d5995cd Anup Patel        2023-05-02  1706  				break;
59f0204d5995cd Anup Patel        2023-05-02  1707  			}
59f0204d5995cd Anup Patel        2023-05-02  1708  		}
59f0204d5995cd Anup Patel        2023-05-02  1709  		msi_page = msi_desc_get_iommu_cookie(desc);
59f0204d5995cd Anup Patel        2023-05-02  1710  	}
59f0204d5995cd Anup Patel        2023-05-02  1711  	if (WARN_ON(!msi_page))
ece6e6f0218b77 Julien Grall      2019-05-01  1712  		return;
ece6e6f0218b77 Julien Grall      2019-05-01  1713  
44bb7e243bd4b4 Robin Murphy      2016-09-12  1714  	msg->address_hi = upper_32_bits(msi_page->iova);
59f0204d5995cd Anup Patel        2023-05-02  1715  	msg->address_lo &= cookie_msi_granule(cookie) - 1;
44bb7e243bd4b4 Robin Murphy      2016-09-12  1716  	msg->address_lo += lower_32_bits(msi_page->iova);
44bb7e243bd4b4 Robin Murphy      2016-09-12  1717  }
06d60728ff5c01 Christoph Hellwig 2019-05-20  1718  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
