Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A18FB4C3D0
	for <oe-kbuild@lists.linux.dev>; Sat,  6 Jul 2024 13:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720274153; cv=none; b=M0h5bk/nozttcKeUcn7HlmINZS168W1GZEXuosKvk1kGP0lMSYV0IUVW+eKDn9ytbyksIQEa59GeoYF3E3HxOJ4kxUOO0v9MERsqmvsh3BZTzUBs6HpnvXdx4upKQgsEDZmeuLSfF6fVA2v8KJs5V4x8qyBfMqi94nmEDxFlUlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720274153; c=relaxed/simple;
	bh=gC3p0uI8stbqqCNHFGTnQ7xtwRepbiInkspXBr3gyLU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LJcJsch/ZQLZo1NAwaFwEGQ5xBRgJ1k8SE/4Mzd4/rPt+82Tc4zL69cGooLWds8G6VPlPQZOIH8UU+O7l3Q6FlxKMToCrCyZCL70fAaLMcXpxUKPKTapPOiDjLD9qazyQROqpilegqsKo1G9s1GYf/Iwn4hOrC0hvFQpWxb8jtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jls1K8vn; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jls1K8vn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720274152; x=1751810152;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gC3p0uI8stbqqCNHFGTnQ7xtwRepbiInkspXBr3gyLU=;
  b=Jls1K8vnNmDT/FJiExKdINtSF+9/liflMXHINeMko/EsHu5jTeH+OcwZ
   UzkRYroLVzLgMXIBDwAKOY6nZR1IpLKh9/zBSoae9picvGaoODSovQiwB
   xEWVm9NQax6iGrCt0GB+Zj6qCxeY2WPeq8D4JRwqgnoMah2BSlwLRl0no
   e+6ZMniyXRe9ZmB8N9CjBmkKkVSEoG+dXSZ+rW2GpDkoo+02HiA49Ec3B
   ILUUnmBNXkaio5oL6Z5jMws68dj1LQELU3DoQoLXkW7ZoSHMmpBI76i5G
   /mKVbTS5RvWUs0D4twtPacpCEgx1634A8NjhWrc3MN7q0xepcQMKLcAsS
   w==;
X-CSE-ConnectionGUID: +BbI6PJyTeCezZwBZ1dOnA==
X-CSE-MsgGUID: ITXyG0xYQw6zyd4zqFtKtg==
X-IronPort-AV: E=McAfee;i="6700,10204,11125"; a="12416598"
X-IronPort-AV: E=Sophos;i="6.09,187,1716274800"; 
   d="scan'208";a="12416598"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2024 06:55:51 -0700
X-CSE-ConnectionGUID: ZD36H4jIS6u7zlniqFRWCg==
X-CSE-MsgGUID: cxLUzhIwT3KXTG23oypbHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,187,1716274800"; 
   d="scan'208";a="51512676"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 06 Jul 2024 06:55:50 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sQ5tE-000TrS-00;
	Sat, 06 Jul 2024 13:55:48 +0000
Date: Sat, 6 Jul 2024 21:55:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [wireless-next:main 8/21]
 drivers/net/wireless/intel/iwlwifi/pcie/tx.c:1764 iwl_pcie_get_page_hdr()
 error: uninitialized symbol 'ret'.
Message-ID: <202407062135.NNjnmMdR-lkp@intel.com>
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
CC: Johannes Berg <johannes@sipsolutions.net>
CC: Kalle Valo <kvalo@kernel.org>
CC: linux-wireless@vger.kernel.org
TO: Benjamin Berg <benjamin.berg@intel.com>
CC: Johannes Berg <johannes.berg@intel.com>
CC: Miri Korenblit <miriam.rachel.korenblit@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
head:   1b431ba4ef9a760e7643d6fbc53bf522d59650f3
commit: adc902ceada26add77ad75426805e973a7c67f01 [8/21] wifi: iwlwifi: keep the TSO and workaround pages mapped
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20240706 (https://download.01.org/0day-ci/archive/20240706/202407062135.NNjnmMdR-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202407062135.NNjnmMdR-lkp@intel.com/

New smatch warnings:
drivers/net/wireless/intel/iwlwifi/pcie/tx.c:1764 iwl_pcie_get_page_hdr() error: uninitialized symbol 'ret'.

Old smatch warnings:
drivers/net/wireless/intel/iwlwifi/pcie/tx.c:719 iwl_pcie_txq_alloc() warn: check sign expansion for 'slots_num'
drivers/net/wireless/intel/iwlwifi/pcie/tx.c:1777 iwl_pcie_get_page_hdr() error: uninitialized symbol 'ret'.

vim +/ret +1764 drivers/net/wireless/intel/iwlwifi/pcie/tx.c

3a0b2a4225ede9 Emmanuel Grumbach 2015-10-14  1733  
6eb5e529d7e3bf Emmanuel Grumbach 2015-10-18  1734  #ifdef CONFIG_INET
7f5e3038f02902 Benjamin Berg     2024-07-03  1735  static void *iwl_pcie_get_page_hdr(struct iwl_trans *trans,
49101078be769e Johannes Berg     2024-06-05  1736  				   size_t len, struct sk_buff *skb)
49101078be769e Johannes Berg     2024-06-05  1737  {
49101078be769e Johannes Berg     2024-06-05  1738  	struct iwl_trans_pcie *trans_pcie = IWL_TRANS_GET_PCIE_TRANS(trans);
49101078be769e Johannes Berg     2024-06-05  1739  	struct iwl_tso_hdr_page *p = this_cpu_ptr(trans_pcie->txqs.tso_hdr_page);
adc902ceada26a Benjamin Berg     2024-07-03  1740  	struct iwl_tso_page_info *info;
49101078be769e Johannes Berg     2024-06-05  1741  	struct page **page_ptr;
adc902ceada26a Benjamin Berg     2024-07-03  1742  	dma_addr_t phys;
d023a228e927c1 Benjamin Berg     2024-07-03  1743  	void *ret;
49101078be769e Johannes Berg     2024-06-05  1744  
49101078be769e Johannes Berg     2024-06-05  1745  	page_ptr = (void *)((u8 *)skb->cb + trans_pcie->txqs.page_offs);
49101078be769e Johannes Berg     2024-06-05  1746  
49101078be769e Johannes Berg     2024-06-05  1747  	if (WARN_ON(*page_ptr))
49101078be769e Johannes Berg     2024-06-05  1748  		return NULL;
49101078be769e Johannes Berg     2024-06-05  1749  
49101078be769e Johannes Berg     2024-06-05  1750  	if (!p->page)
49101078be769e Johannes Berg     2024-06-05  1751  		goto alloc;
49101078be769e Johannes Berg     2024-06-05  1752  
49101078be769e Johannes Berg     2024-06-05  1753  	/*
49101078be769e Johannes Berg     2024-06-05  1754  	 * Check if there's enough room on this page
49101078be769e Johannes Berg     2024-06-05  1755  	 *
49101078be769e Johannes Berg     2024-06-05  1756  	 * Note that we put a page chaining pointer *last* in the
49101078be769e Johannes Berg     2024-06-05  1757  	 * page - we need it somewhere, and if it's there then we
49101078be769e Johannes Berg     2024-06-05  1758  	 * avoid DMA mapping the last bits of the page which may
49101078be769e Johannes Berg     2024-06-05  1759  	 * trigger the 32-bit boundary hardware bug.
49101078be769e Johannes Berg     2024-06-05  1760  	 *
49101078be769e Johannes Berg     2024-06-05  1761  	 * (see also get_workaround_page() in tx-gen2.c)
49101078be769e Johannes Berg     2024-06-05  1762  	 */
adc902ceada26a Benjamin Berg     2024-07-03  1763  	if (((unsigned long)p->pos & ~PAGE_MASK) + len < IWL_TSO_PAGE_DATA_SIZE) {
adc902ceada26a Benjamin Berg     2024-07-03 @1764  		info = IWL_TSO_PAGE_INFO(page_address(ret));
49101078be769e Johannes Berg     2024-06-05  1765  		goto out;
adc902ceada26a Benjamin Berg     2024-07-03  1766  	}
49101078be769e Johannes Berg     2024-06-05  1767  
49101078be769e Johannes Berg     2024-06-05  1768  	/* We don't have enough room on this page, get a new one. */
adc902ceada26a Benjamin Berg     2024-07-03  1769  	iwl_pcie_free_and_unmap_tso_page(trans, p->page);
49101078be769e Johannes Berg     2024-06-05  1770  
49101078be769e Johannes Berg     2024-06-05  1771  alloc:
49101078be769e Johannes Berg     2024-06-05  1772  	p->page = alloc_page(GFP_ATOMIC);
49101078be769e Johannes Berg     2024-06-05  1773  	if (!p->page)
49101078be769e Johannes Berg     2024-06-05  1774  		return NULL;
49101078be769e Johannes Berg     2024-06-05  1775  	p->pos = page_address(p->page);
adc902ceada26a Benjamin Berg     2024-07-03  1776  
adc902ceada26a Benjamin Berg     2024-07-03  1777  	info = IWL_TSO_PAGE_INFO(page_address(ret));
adc902ceada26a Benjamin Berg     2024-07-03  1778  
49101078be769e Johannes Berg     2024-06-05  1779  	/* set the chaining pointer to NULL */
adc902ceada26a Benjamin Berg     2024-07-03  1780  	info->next = NULL;
adc902ceada26a Benjamin Berg     2024-07-03  1781  
adc902ceada26a Benjamin Berg     2024-07-03  1782  	/* Create a DMA mapping for the page */
adc902ceada26a Benjamin Berg     2024-07-03  1783  	phys = dma_map_page_attrs(trans->dev, p->page, 0, PAGE_SIZE,
adc902ceada26a Benjamin Berg     2024-07-03  1784  				  DMA_TO_DEVICE, DMA_ATTR_SKIP_CPU_SYNC);
adc902ceada26a Benjamin Berg     2024-07-03  1785  	if (unlikely(dma_mapping_error(trans->dev, phys))) {
adc902ceada26a Benjamin Berg     2024-07-03  1786  		__free_page(p->page);
adc902ceada26a Benjamin Berg     2024-07-03  1787  		p->page = NULL;
adc902ceada26a Benjamin Berg     2024-07-03  1788  
adc902ceada26a Benjamin Berg     2024-07-03  1789  		return NULL;
adc902ceada26a Benjamin Berg     2024-07-03  1790  	}
adc902ceada26a Benjamin Berg     2024-07-03  1791  
adc902ceada26a Benjamin Berg     2024-07-03  1792  	/* Store physical address and set use count */
adc902ceada26a Benjamin Berg     2024-07-03  1793  	info->dma_addr = phys;
adc902ceada26a Benjamin Berg     2024-07-03  1794  	refcount_set(&info->use_count, 1);
49101078be769e Johannes Berg     2024-06-05  1795  out:
49101078be769e Johannes Berg     2024-06-05  1796  	*page_ptr = p->page;
adc902ceada26a Benjamin Berg     2024-07-03  1797  	/* Return an internal reference for the caller */
adc902ceada26a Benjamin Berg     2024-07-03  1798  	refcount_inc(&info->use_count);
d023a228e927c1 Benjamin Berg     2024-07-03  1799  	ret = p->pos;
d023a228e927c1 Benjamin Berg     2024-07-03  1800  	p->pos += len;
d023a228e927c1 Benjamin Berg     2024-07-03  1801  
d023a228e927c1 Benjamin Berg     2024-07-03  1802  	return ret;
49101078be769e Johannes Berg     2024-06-05  1803  }
49101078be769e Johannes Berg     2024-06-05  1804  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
