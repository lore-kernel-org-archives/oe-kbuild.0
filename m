Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF9A3FE35
	for <oe-kbuild@lists.linux.dev>; Mon,  1 Apr 2024 14:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711982532; cv=none; b=snluAj499xkAZ3a3JVQy53/fT9HKEn/Ace3zMsQIwo1yRwqHbMAiCsB5KSdBA3JYZoRLIXMH8/XWNRZ4uaIFmRih6e1Yb1/p1Dg2Vuyuov/JZC6OwSpEaPcWvDZ+Rf5lBEFRIBl7UNDb+L3qJe0X0c1USAMeX+Lp5Z8/CLLn7BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711982532; c=relaxed/simple;
	bh=0Q64iyGaAD2L6AoSNhZR9S0E20PYKNCmhm4pXIhxxoE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nHp9yhLtQC0MPDPvWgWl4tf5acwfUjoGJ3f7l8YRPLzpvSu67+oiihutEJciSfEz6MQoAsHCaIaE3Zhz2PD5oH0tSH1clFpmZ1iXyUz02jxemBts6Nx0czuzGR80n7ak0sjJ6qn8D+pxRAfgqzQ1Sc4EINhgLQaY6h8gYKUtu1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=achzMcrk; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="achzMcrk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711982530; x=1743518530;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0Q64iyGaAD2L6AoSNhZR9S0E20PYKNCmhm4pXIhxxoE=;
  b=achzMcrkf1LLsdTIgJh3ucRWHEBmRXmRWwUYJNbwfXmm/ka1b0F/XjHF
   uYNJ/yMI7CPd/fVnThDndhaqS1CkloytjgZYIRaOcn9AnqF96oxNUM5KW
   n6sGSubVK3bJbsT6vWYBc5QDtwhCZYrMRd3ClZfpq4uAMwoSBjpFqv1S1
   aG2PvTCA8liCY2by9UpwbKGsI78LA8//v374WJE1xEqcicwIVx7Wo8Bmv
   +YpWCC85x0HphGDObOl1vcsIKHuCjKl6dIr7Fe4x+I8MRky1kLlynrEe+
   rsCBcPSdKz2N9AHWJeEuHP1q0zQhnkzH2u13vYSStXEfYQKHFm9Tyo7VM
   w==;
X-CSE-ConnectionGUID: ZlSYeiOcS2SFSrr935iQuA==
X-CSE-MsgGUID: 2WXoD65OTCeNu8PhaFJRvQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="24603250"
X-IronPort-AV: E=Sophos;i="6.07,172,1708416000"; 
   d="scan'208";a="24603250"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2024 07:42:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,172,1708416000"; 
   d="scan'208";a="18374230"
Received: from lkp-server02.sh.intel.com (HELO 90ee3aa53dbd) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 01 Apr 2024 07:42:07 -0700
Received: from kbuild by 90ee3aa53dbd with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rrIrM-0000O5-36;
	Mon, 01 Apr 2024 14:42:04 +0000
Date: Mon, 1 Apr 2024 22:41:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [vivek-drm-tip:virtgpu_import_rfc 9/9] drivers/dma-buf/udmabuf.c:361
 handle_pcidev_pages() error: uninitialized symbol 'ret'.
Message-ID: <202404012251.1l3ZjNuu-lkp@intel.com>
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
TO: Vivek Kasireddy <vivek.kasireddy@intel.com>

tree:   https://gitlab.freedesktop.org/Vivek/drm-tip.git virtgpu_import_rfc
head:   2347bf8ba6d850818b830aa54bb75d4b892fb6a8
commit: 2347bf8ba6d850818b830aa54bb75d4b892fb6a8 [9/9] udmabuf: Implement UDMABUF_CREATE_LIST_FOR_PCIDEV ioctl
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: i386-randconfig-141-20240401 (https://download.01.org/0day-ci/archive/20240401/202404012251.1l3ZjNuu-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202404012251.1l3ZjNuu-lkp@intel.com/

smatch warnings:
drivers/dma-buf/udmabuf.c:361 handle_pcidev_pages() error: uninitialized symbol 'ret'.

vim +/ret +361 drivers/dma-buf/udmabuf.c

ead26fccadd43c Vivek Kasireddy 2023-06-20  299  
2347bf8ba6d850 Vivek Kasireddy 2024-03-26  300  static int handle_pcidev_pages(struct udmabuf *ubuf,
c1bbed66899726 Gurchetan Singh 2019-12-02  301  			       struct udmabuf_create_list *head,
c1bbed66899726 Gurchetan Singh 2019-12-02  302  			       struct udmabuf_create_item *list)
2347bf8ba6d850 Vivek Kasireddy 2024-03-26  303  {
2347bf8ba6d850 Vivek Kasireddy 2024-03-26  304  	struct pci_dev *pdev = NULL;
2347bf8ba6d850 Vivek Kasireddy 2024-03-26  305  	resource_size_t bar_size;
2347bf8ba6d850 Vivek Kasireddy 2024-03-26  306  	pgoff_t pgbuf = 0;
2347bf8ba6d850 Vivek Kasireddy 2024-03-26  307  	struct page *page;
2347bf8ba6d850 Vivek Kasireddy 2024-03-26  308  	int i, ret;
2347bf8ba6d850 Vivek Kasireddy 2024-03-26  309  	size_t size;
2347bf8ba6d850 Vivek Kasireddy 2024-03-26  310  	void *addr;
2347bf8ba6d850 Vivek Kasireddy 2024-03-26  311  
2347bf8ba6d850 Vivek Kasireddy 2024-03-26  312  	for (i = 0; i < head->count; i++) {
2347bf8ba6d850 Vivek Kasireddy 2024-03-26  313  		if (!ubuf->pdev) {
2347bf8ba6d850 Vivek Kasireddy 2024-03-26  314  			pdev = pci_get_domain_bus_and_slot(0,
2347bf8ba6d850 Vivek Kasireddy 2024-03-26  315  						PCI_BUS_NUM(list[i].devid),
2347bf8ba6d850 Vivek Kasireddy 2024-03-26  316  						list[i].devid & 0xff);
2347bf8ba6d850 Vivek Kasireddy 2024-03-26  317  			if (!pdev) {
2347bf8ba6d850 Vivek Kasireddy 2024-03-26  318  				ret = -ENODEV;
2347bf8ba6d850 Vivek Kasireddy 2024-03-26  319  				goto err;
2347bf8ba6d850 Vivek Kasireddy 2024-03-26  320  			}
2347bf8ba6d850 Vivek Kasireddy 2024-03-26  321  
2347bf8ba6d850 Vivek Kasireddy 2024-03-26  322  			ubuf->pdev = pdev;
2347bf8ba6d850 Vivek Kasireddy 2024-03-26  323  		}
2347bf8ba6d850 Vivek Kasireddy 2024-03-26  324  
2347bf8ba6d850 Vivek Kasireddy 2024-03-26  325  		bar_size = pci_resource_len(pdev, list[i].bar);
2347bf8ba6d850 Vivek Kasireddy 2024-03-26  326  		if (list[i].offset > bar_size ||
2347bf8ba6d850 Vivek Kasireddy 2024-03-26  327  		    list[i].offset + list[i].size > bar_size) {
2347bf8ba6d850 Vivek Kasireddy 2024-03-26  328  			ret = -EINVAL;
2347bf8ba6d850 Vivek Kasireddy 2024-03-26  329  			goto err;
2347bf8ba6d850 Vivek Kasireddy 2024-03-26  330  		}
2347bf8ba6d850 Vivek Kasireddy 2024-03-26  331  
2347bf8ba6d850 Vivek Kasireddy 2024-03-26  332  		ret = pci_p2pdma_add_resource(pdev,
2347bf8ba6d850 Vivek Kasireddy 2024-03-26  333  					      list[i].bar,
2347bf8ba6d850 Vivek Kasireddy 2024-03-26  334  					      list[i].size,
2347bf8ba6d850 Vivek Kasireddy 2024-03-26  335  					      list[i].offset);
2347bf8ba6d850 Vivek Kasireddy 2024-03-26  336  		if (ret)
2347bf8ba6d850 Vivek Kasireddy 2024-03-26  337  			goto err;
2347bf8ba6d850 Vivek Kasireddy 2024-03-26  338  
2347bf8ba6d850 Vivek Kasireddy 2024-03-26  339  		addr = pci_alloc_p2pmem(pdev, list[i].size);
2347bf8ba6d850 Vivek Kasireddy 2024-03-26  340  		if (!addr) {
2347bf8ba6d850 Vivek Kasireddy 2024-03-26  341  			ret = -EINVAL;
2347bf8ba6d850 Vivek Kasireddy 2024-03-26  342  			goto err;
2347bf8ba6d850 Vivek Kasireddy 2024-03-26  343  		}
2347bf8ba6d850 Vivek Kasireddy 2024-03-26  344  
2347bf8ba6d850 Vivek Kasireddy 2024-03-26  345  		size = 0;
2347bf8ba6d850 Vivek Kasireddy 2024-03-26  346  		while (size < list[i].size) {
2347bf8ba6d850 Vivek Kasireddy 2024-03-26  347  			page = virt_to_page((unsigned long)addr + size);
2347bf8ba6d850 Vivek Kasireddy 2024-03-26  348  			ubuf->pages[pgbuf++] = page;
2347bf8ba6d850 Vivek Kasireddy 2024-03-26  349  
2347bf8ba6d850 Vivek Kasireddy 2024-03-26  350  			size += PAGE_SIZE;
2347bf8ba6d850 Vivek Kasireddy 2024-03-26  351  		}
2347bf8ba6d850 Vivek Kasireddy 2024-03-26  352  	}
2347bf8ba6d850 Vivek Kasireddy 2024-03-26  353  
2347bf8ba6d850 Vivek Kasireddy 2024-03-26  354  err:
2347bf8ba6d850 Vivek Kasireddy 2024-03-26  355  	while (pgbuf > 0 && ubuf->pages[--pgbuf])
2347bf8ba6d850 Vivek Kasireddy 2024-03-26  356  		pci_free_p2pmem(pdev,
2347bf8ba6d850 Vivek Kasireddy 2024-03-26  357  				page_to_virt(ubuf->pages[pgbuf]),
2347bf8ba6d850 Vivek Kasireddy 2024-03-26  358  				PAGE_SIZE);
2347bf8ba6d850 Vivek Kasireddy 2024-03-26  359  	if (pdev)
2347bf8ba6d850 Vivek Kasireddy 2024-03-26  360  		pci_dev_put(pdev);
2347bf8ba6d850 Vivek Kasireddy 2024-03-26 @361  	return ret;
2347bf8ba6d850 Vivek Kasireddy 2024-03-26  362  }
2347bf8ba6d850 Vivek Kasireddy 2024-03-26  363  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
