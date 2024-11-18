Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2DA1C27
	for <oe-kbuild@lists.linux.dev>; Mon, 18 Nov 2024 00:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731890921; cv=none; b=JGh928NtMmGH0LlR5dPw/bjX41XOQDC7QZN7KsKXzGLVjhlEaQQAGWcQml4NwEueS+h1FGJkh8zxjEYgnah1ucr/zhLk853bRLANk+K14tWsEHHAlqoN/Xid19ztXlUw8/rLBSwE1YaNkqxRTxEhyop0ObW3G47DL9JIirpZSss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731890921; c=relaxed/simple;
	bh=BRVGe52mQC9R06LlyDRM1II1UuSUUyfVloA/zPsLFmY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QlZCae9G87mbpzBuem7cBdsLweNi3/m7/tm8wwGAmsjoadJVjMVV6p/ol+j92tPabQ5uRDjSI6DriVCbILlk+wZKlXOYElzXP3U4JLi5jYPVX5CwwUcEOjKS/vUH1TGUN4GJsfoLR1BWR3fN+KR3oA+OAhFfZRaUTq+Q0n9SHL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gCYfNr2A; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gCYfNr2A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731890920; x=1763426920;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=BRVGe52mQC9R06LlyDRM1II1UuSUUyfVloA/zPsLFmY=;
  b=gCYfNr2AVCOZer5dHiqZOzHDxPGlj6x+Ctye+25neT5aH929a4fwEY+n
   D1exs26/e0ZYIQjl1ln9RxzrQibI7My5uO6tGVgiHy2fXZdh0Or6Qp3fn
   MAkDU6XIV91giIwk+d0CtQ4+fTx/3+MBnwQNgO5ak/VA4n884bQWJIz5z
   1Ch86iy6KfwfMJ6ab5fWAFQ3+xA/unSfLxzqNAb+hgK+nQ8RwOBRxjP8k
   jYCkuwuG0i/qO8A6uZw+UtP/4xRm3Fe+D8zcydI2W3DkMHQUWMOfWizKv
   +tOss1ddRVx3ixIdhwIc2hVP1gT+3C8UcZX7xmLwttk6rNPCCDPDftUfk
   g==;
X-CSE-ConnectionGUID: jPmPfit4S0qGrmdubYshbQ==
X-CSE-MsgGUID: dIaXOVcqQ0G5KmnpHZsekw==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="31769263"
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="31769263"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2024 16:48:39 -0800
X-CSE-ConnectionGUID: zaIHN/TCRw69m4vDYRgzTA==
X-CSE-MsgGUID: KRAqY1PPR4CrUgIXTZ4HsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="94003845"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 17 Nov 2024 16:48:38 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCpwR-0002AD-1m;
	Mon, 18 Nov 2024 00:48:35 +0000
Date: Mon, 18 Nov 2024 08:48:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [pci:pwrctl 5/7] drivers/pci/remove.c:30:0-1: ERROR: missing
 put_device; call of_find_device_by_node on line 24, but without a
 corresponding object release within this function.
Message-ID: <202411180806.vDs8Lfdi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=unknown-8bit
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-pci@vger.kernel.org
TO: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
CC: Bjorn Helgaas <helgaas@kernel.org>
CC: "Krzysztof Wilczyński" <kwilczynski@kernel.org>
CC: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git pwrctl
head:   e826ea4c7f26fac8198e6a7cfaa38b39f3296c9a
commit: f1fba106b06a395159219a91bfc3c91855af3788 [5/7] PCI/pwrctl: Remove pwrctl device without iterating over all children of pwrctl parent
:::::: branch date: 2 days ago
:::::: commit date: 10 days ago
config: alpha-randconfig-r053-20241118 (https://download.01.org/0day-ci/archive/20241118/202411180806.vDs8Lfdi-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202411180806.vDs8Lfdi-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/pci/remove.c:30:0-1: ERROR: missing put_device; call of_find_device_by_node on line 24, but without a corresponding object release within this function.

vim +30 drivers/pci/remove.c

04480094de7242 Rafael J. Wysocki     2014-02-01  19  
f1fba106b06a39 Manivannan Sadhasivam 2024-10-25  20  static void pci_pwrctl_unregister(struct device *dev)
f1536585588ba6 Bartosz Golaszewski   2024-08-23  21  {
f1fba106b06a39 Manivannan Sadhasivam 2024-10-25  22  	struct platform_device *pdev;
f1536585588ba6 Bartosz Golaszewski   2024-08-23  23  
f1fba106b06a39 Manivannan Sadhasivam 2024-10-25 @24  	pdev = of_find_device_by_node(dev_of_node(dev));
f1fba106b06a39 Manivannan Sadhasivam 2024-10-25  25  	if (!pdev)
f1fba106b06a39 Manivannan Sadhasivam 2024-10-25  26  		return;
f1536585588ba6 Bartosz Golaszewski   2024-08-23  27  
f1fba106b06a39 Manivannan Sadhasivam 2024-10-25  28  	of_device_unregister(pdev);
f1fba106b06a39 Manivannan Sadhasivam 2024-10-25  29  	of_node_clear_flag(dev_of_node(dev), OF_POPULATED);
f1536585588ba6 Bartosz Golaszewski   2024-08-23 @30  }
f1536585588ba6 Bartosz Golaszewski   2024-08-23  31  

:::::: The code at line 30 was first introduced by commit
:::::: f1536585588ba630c533b6ffbca8ad8424aa5c39 PCI: Don't rely on of_platform_depopulate() for reused OF-nodes

:::::: TO: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
:::::: CC: Bjorn Helgaas <bhelgaas@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
