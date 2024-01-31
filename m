Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED6569956
	for <oe-kbuild@lists.linux.dev>; Wed, 31 Jan 2024 09:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706693851; cv=none; b=vCi98VDDSM/WWLKplqJ2rKp1NgL20gYPd73r8f+fVtcrk0M+RIpQ9utiV/mhDgXWpJltQ4ymhF9cvxW62Ca89eLlQdnx672HuqtIN8V9R+bifC2YI8ApYYKzXAjsC6DJC2+UvtAtbI9odVGi4CkM5eyQgOzATDCJTcBwjRfFKUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706693851; c=relaxed/simple;
	bh=DhiOSveNeEbqi3493CD/fy7r72bekeb2WDl6x/nXAgg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Bwb2t6wXe9dNOwLHPfjVQTrUtABXDYgs/SHiZ+cWSjuTe3x2rEiBZiUVEcVFnjnEriraKKTmhlgtwLGlzACaLTlv6qbjguuLIE2BfdX2idxwdg30gsHokicBzoGCvs1crLPR5LjT69AaJE6BCZElCFQjXisFeKgSJi+91yYgaIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CWyHY8Ut; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CWyHY8Ut"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706693849; x=1738229849;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DhiOSveNeEbqi3493CD/fy7r72bekeb2WDl6x/nXAgg=;
  b=CWyHY8UtvRxBV6U7YjzgQq+CaPCLXe0uDT+e5h8wNNo9laN51pUKyquI
   k8mLtOIMtLP8yhrTns0pHKHVaT4F+SfKEGT4C0aoR+3NIDONvitkRdJSl
   fm2vUAkn9wvCqtMxej7r3E3Upsoin9R/cOV2OMS+vQu/R8o8rV84dAfg2
   WAyWBMA1nU5QsQPzS8ulUjQUqVaQaO5xjOuyS3Qh7SXi4aVB3tYN5T+te
   DbHPpGW0FznH3ht9rUx2l9udyIqguJ1J5KOeC4EKzplwQEx6ceFToopYN
   /v6A9rXMYEBGEGUU0G6gSpGz740L3hU7YBWydBWQ7GITdNGjyfhchk/Rf
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="10215260"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="10215260"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2024 01:37:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="1119563519"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="1119563519"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 31 Jan 2024 01:37:27 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rV722-0001P4-2Y;
	Wed, 31 Jan 2024 09:37:23 +0000
Date: Wed, 31 Jan 2024 17:35:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [openeuler:OLK-6.6 2493/2888]
 arch/x86/events/zhaoxin/uncore.c:1593:1-6: alloc with no test, possible
 model on line 1609
Message-ID: <202401311737.oD4LmLlz-lkp@intel.com>
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
TO: kernel@openeuler.org
TO: "leoliu-oc" <leoliu-oc@zhaoxin.com>

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   3fa3a33cab8bb921b3e1f6639855f4549009cd90
commit: 5cbf647edcff3d5cda5cb172c6bf0e4c1b6e8ec6 [2493/2888] x86/perf: Add uncore performance events support for Zhaoxin CPU
:::::: branch date: 2 hours ago
:::::: commit date: 2 weeks ago
config: x86_64-randconfig-104-20240131 (https://download.01.org/0day-ci/archive/20240131/202401311737.oD4LmLlz-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202401311737.oD4LmLlz-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/x86/events/zhaoxin/uncore.c:1593:1-6: alloc with no test, possible model on line 1609

vim +1593 arch/x86/events/zhaoxin/uncore.c

5cbf647edcff3d5 leoliu-oc 2023-11-30  1567  
5cbf647edcff3d5 leoliu-oc 2023-11-30  1568  /*
5cbf647edcff3d5 leoliu-oc 2023-11-30  1569   * add a pci uncore device
5cbf647edcff3d5 leoliu-oc 2023-11-30  1570   */
5cbf647edcff3d5 leoliu-oc 2023-11-30  1571  static int uncore_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
5cbf647edcff3d5 leoliu-oc 2023-11-30  1572  {
5cbf647edcff3d5 leoliu-oc 2023-11-30  1573  	struct zhaoxin_uncore_type *type;
5cbf647edcff3d5 leoliu-oc 2023-11-30  1574  	struct zhaoxin_uncore_pmu *pmu;
5cbf647edcff3d5 leoliu-oc 2023-11-30  1575  	struct zhaoxin_uncore_box *box;
5cbf647edcff3d5 leoliu-oc 2023-11-30  1576  	struct zhaoxin_uncore_box **boxes;
5cbf647edcff3d5 leoliu-oc 2023-11-30  1577  
5cbf647edcff3d5 leoliu-oc 2023-11-30  1578  	int loop, i, j = 0;
5cbf647edcff3d5 leoliu-oc 2023-11-30  1579  
5cbf647edcff3d5 leoliu-oc 2023-11-30  1580  	int subnode_id, ret = 0;
5cbf647edcff3d5 leoliu-oc 2023-11-30  1581  
5cbf647edcff3d5 leoliu-oc 2023-11-30  1582  	subnode_id = uncore_pcibus_to_subnodeid(pdev->bus);
5cbf647edcff3d5 leoliu-oc 2023-11-30  1583  	if (subnode_id < 0)
5cbf647edcff3d5 leoliu-oc 2023-11-30  1584  		return -EINVAL;
5cbf647edcff3d5 leoliu-oc 2023-11-30  1585  
5cbf647edcff3d5 leoliu-oc 2023-11-30  1586  	type = uncore_pci_uncores[UNCORE_PCI_DEV_TYPE(id->driver_data)];
5cbf647edcff3d5 leoliu-oc 2023-11-30  1587  
5cbf647edcff3d5 leoliu-oc 2023-11-30  1588  	if (!strcmp(type->name, "mc0"))
5cbf647edcff3d5 leoliu-oc 2023-11-30  1589  		loop = 2;
5cbf647edcff3d5 leoliu-oc 2023-11-30  1590  	else
5cbf647edcff3d5 leoliu-oc 2023-11-30  1591  		loop = 1;
5cbf647edcff3d5 leoliu-oc 2023-11-30  1592  
5cbf647edcff3d5 leoliu-oc 2023-11-30 @1593  	boxes = kzalloc(loop * sizeof(struct zhaoxin_uncore_box *), GFP_KERNEL);
5cbf647edcff3d5 leoliu-oc 2023-11-30  1594  
5cbf647edcff3d5 leoliu-oc 2023-11-30  1595  	for (i = 0; i < loop; i++) {
5cbf647edcff3d5 leoliu-oc 2023-11-30  1596  		type = uncore_pci_uncores[UNCORE_PCI_DEV_TYPE(id->driver_data) + j];
5cbf647edcff3d5 leoliu-oc 2023-11-30  1597  
5cbf647edcff3d5 leoliu-oc 2023-11-30  1598  		if (!type)
5cbf647edcff3d5 leoliu-oc 2023-11-30  1599  			continue;
5cbf647edcff3d5 leoliu-oc 2023-11-30  1600  		/*
5cbf647edcff3d5 leoliu-oc 2023-11-30  1601  		 * for performance monitoring unit with multiple boxes,
5cbf647edcff3d5 leoliu-oc 2023-11-30  1602  		 * each box has a different function id.
5cbf647edcff3d5 leoliu-oc 2023-11-30  1603  		 */
5cbf647edcff3d5 leoliu-oc 2023-11-30  1604  
5cbf647edcff3d5 leoliu-oc 2023-11-30  1605  		pmu = &type->pmus[UNCORE_PCI_DEV_IDX(id->driver_data)];
5cbf647edcff3d5 leoliu-oc 2023-11-30  1606  
5cbf647edcff3d5 leoliu-oc 2023-11-30  1607  		if (WARN_ON_ONCE(pmu->boxes[subnode_id] != NULL))
5cbf647edcff3d5 leoliu-oc 2023-11-30  1608  			return -EINVAL;
5cbf647edcff3d5 leoliu-oc 2023-11-30 @1609  		box = uncore_alloc_box(type, NUMA_NO_NODE);
5cbf647edcff3d5 leoliu-oc 2023-11-30  1610  		if (!box)
5cbf647edcff3d5 leoliu-oc 2023-11-30  1611  			return -ENOMEM;
5cbf647edcff3d5 leoliu-oc 2023-11-30  1612  
5cbf647edcff3d5 leoliu-oc 2023-11-30  1613  		if (pmu->func_id < 0)
5cbf647edcff3d5 leoliu-oc 2023-11-30  1614  			pmu->func_id = pdev->devfn;
5cbf647edcff3d5 leoliu-oc 2023-11-30  1615  		else
5cbf647edcff3d5 leoliu-oc 2023-11-30  1616  			WARN_ON_ONCE(pmu->func_id != pdev->devfn);
5cbf647edcff3d5 leoliu-oc 2023-11-30  1617  
5cbf647edcff3d5 leoliu-oc 2023-11-30  1618  		atomic_inc(&box->refcnt);
5cbf647edcff3d5 leoliu-oc 2023-11-30  1619  		box->subnode_id = subnode_id;
5cbf647edcff3d5 leoliu-oc 2023-11-30  1620  		box->pci_dev = pdev;
5cbf647edcff3d5 leoliu-oc 2023-11-30  1621  		box->pmu = pmu;
5cbf647edcff3d5 leoliu-oc 2023-11-30  1622  		uncore_box_init(box);
5cbf647edcff3d5 leoliu-oc 2023-11-30  1623  		boxes[i] = box;
5cbf647edcff3d5 leoliu-oc 2023-11-30  1624  
5cbf647edcff3d5 leoliu-oc 2023-11-30  1625  		pci_set_drvdata(pdev, boxes);
5cbf647edcff3d5 leoliu-oc 2023-11-30  1626  		pmu->boxes[subnode_id] = box;
5cbf647edcff3d5 leoliu-oc 2023-11-30  1627  		if (atomic_inc_return(&pmu->activeboxes) > 1) {
5cbf647edcff3d5 leoliu-oc 2023-11-30  1628  			if (!strcmp(type->name, "mc0"))
5cbf647edcff3d5 leoliu-oc 2023-11-30  1629  				goto next_loop;
5cbf647edcff3d5 leoliu-oc 2023-11-30  1630  			else
5cbf647edcff3d5 leoliu-oc 2023-11-30  1631  				return 0;
5cbf647edcff3d5 leoliu-oc 2023-11-30  1632  		}
5cbf647edcff3d5 leoliu-oc 2023-11-30  1633  		/* First active box registers the pmu */
5cbf647edcff3d5 leoliu-oc 2023-11-30  1634  		ret = uncore_pmu_register(pmu);
5cbf647edcff3d5 leoliu-oc 2023-11-30  1635  		if (ret) {
5cbf647edcff3d5 leoliu-oc 2023-11-30  1636  			pci_set_drvdata(pdev, NULL);
5cbf647edcff3d5 leoliu-oc 2023-11-30  1637  			pmu->boxes[subnode_id] = NULL;
5cbf647edcff3d5 leoliu-oc 2023-11-30  1638  			uncore_box_exit(box);
5cbf647edcff3d5 leoliu-oc 2023-11-30  1639  			kfree(box);
5cbf647edcff3d5 leoliu-oc 2023-11-30  1640  		}
5cbf647edcff3d5 leoliu-oc 2023-11-30  1641  next_loop:
5cbf647edcff3d5 leoliu-oc 2023-11-30  1642  		j++;
5cbf647edcff3d5 leoliu-oc 2023-11-30  1643  	}
5cbf647edcff3d5 leoliu-oc 2023-11-30  1644  	return ret;
5cbf647edcff3d5 leoliu-oc 2023-11-30  1645  }
5cbf647edcff3d5 leoliu-oc 2023-11-30  1646  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
