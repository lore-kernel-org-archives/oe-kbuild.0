Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0932653
	for <oe-kbuild@lists.linux.dev>; Mon, 19 Feb 2024 06:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708325218; cv=none; b=qiQ1vxZS7a7uWVCjWO/qGTylr5+kgyYInv6iwEYsPyP/GE/DPM3AXrK0aTSmCsdY34qJkOTdO3HCjY/YrLbeVBGnREYiszd65e7QSunXELUpSqjG4D4TbN3mhw3jnn45uQLrbQfmzIi0oKFKqmTsbYw6GfxuM33BGuSFBTDHySw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708325218; c=relaxed/simple;
	bh=J+1bk0bfQLaao94qRu5Tavz3n+vDfEGS2iMM7MwNki8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RWSKVx9uUp8eonfjgEIghRRNiujQKzJyCQdizLwVETU7BWx9DRTTcizxbQFm4H+sNIcfZepg88cID2wSmpAVwTh4OZzRiCskosdKqAuY8Z+7V4m56lF2J9Is0ZRT8fVxEX2+nJwCjVxEwH7TQDhIkfnjdQoE3OLWBHiHIABtU7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C7upCFP7; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C7upCFP7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708325217; x=1739861217;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J+1bk0bfQLaao94qRu5Tavz3n+vDfEGS2iMM7MwNki8=;
  b=C7upCFP7D5Z73uW+KaRsrVzSvw/KTTN1aboR8K02k/yBoSZ3ror3QBDF
   Zl57A7wvbXSQP8JMBwL1h+fEPTpnIjwKZLPVmBRgnwNvKgoFutgWUlc4f
   JcsnRrQx29gj0tMkaHUFCWR2IfegvOFnkarwXfxmFU+IQQVO5oUOagm+q
   3CagOP7pg63cWMbvW4rhjryg5MQ1HnFE1I3uMlgVFZeP7uDghzGWhesjf
   OIyblyS0fryH2/oz/geCAdhkzLNaJuUEgYSmY6hiIK2y0byKmHRO53HNE
   42XVGabrWBBYPupZboVkN+C2UaH7ezrxjvtG8Euu3g+a6Puyi9Rdpgcoq
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10988"; a="2253040"
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; 
   d="scan'208";a="2253040"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2024 22:46:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; 
   d="scan'208";a="8995335"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 18 Feb 2024 22:46:55 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rbxPM-0003aU-2H;
	Mon, 19 Feb 2024 06:46:07 +0000
Date: Mon, 19 Feb 2024 14:45:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [djiang:cxl-hmem-report 8/17] drivers/acpi/numa/hmat.c:742
 hmat_update_target_attrs() warn: was || intended here instead of &&?
Message-ID: <202402191421.F2vc8O3F-lkp@intel.com>
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
TO: Dave Jiang <dave.jiang@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl-hmem-report
head:   fe7e217f68ed900f742c9c9cea8a9214ce92a484
commit: af0ac0f12386e0de55e335e56a923974d3cb38d9 [8/17] ACPI: HMAT: Introduce 2 levels of generic port access class
:::::: branch date: 12 days ago
:::::: commit date: 12 days ago
config: x86_64-randconfig-161-20240219 (https://download.01.org/0day-ci/archive/20240219/202402191421.F2vc8O3F-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202402191421.F2vc8O3F-lkp@intel.com/

smatch warnings:
drivers/acpi/numa/hmat.c:742 hmat_update_target_attrs() warn: was || intended here instead of &&?

vim +742 drivers/acpi/numa/hmat.c

48d4180939e12c4 drivers/acpi/numa/hmat.c Vishal Verma     2022-11-16  688  
d0376aac59a166c drivers/acpi/numa/hmat.c Huang Ying       2023-09-26  689  static void hmat_update_target_attrs(struct memory_target *target,
d0376aac59a166c drivers/acpi/numa/hmat.c Huang Ying       2023-09-26  690  				     unsigned long *p_nodes, int access)
665ac7e92757fb7 drivers/acpi/hmat/hmat.c Keith Busch      2019-03-11  691  {
665ac7e92757fb7 drivers/acpi/hmat/hmat.c Keith Busch      2019-03-11  692  	struct memory_initiator *initiator;
d0376aac59a166c drivers/acpi/numa/hmat.c Huang Ying       2023-09-26  693  	unsigned int cpu_nid;
665ac7e92757fb7 drivers/acpi/hmat/hmat.c Keith Busch      2019-03-11  694  	struct memory_locality *loc = NULL;
665ac7e92757fb7 drivers/acpi/hmat/hmat.c Keith Busch      2019-03-11  695  	u32 best = 0;
665ac7e92757fb7 drivers/acpi/hmat/hmat.c Keith Busch      2019-03-11  696  	int i;
665ac7e92757fb7 drivers/acpi/hmat/hmat.c Keith Busch      2019-03-11  697  
a3a3e341f169511 drivers/acpi/numa/hmat.c Dave Jiang       2023-12-21  698  	/* Don't update for generic port if there's no device handle */
af0ac0f12386e0d drivers/acpi/numa/hmat.c Dave Jiang       2024-01-09  699  	if ((access == NODE_ACCESS_CLASS_GENPORT_SINK_LOCAL ||
af0ac0f12386e0d drivers/acpi/numa/hmat.c Dave Jiang       2024-01-09  700  	     access == NODE_ACCESS_CLASS_GENPORT_SINK_CPU) &&
a3a3e341f169511 drivers/acpi/numa/hmat.c Dave Jiang       2023-12-21  701  	    !(*(u16 *)target->gen_port_device_handle))
a3a3e341f169511 drivers/acpi/numa/hmat.c Dave Jiang       2023-12-21  702  		return;
a3a3e341f169511 drivers/acpi/numa/hmat.c Dave Jiang       2023-12-21  703  
d0376aac59a166c drivers/acpi/numa/hmat.c Huang Ying       2023-09-26  704  	bitmap_zero(p_nodes, MAX_NUMNODES);
665ac7e92757fb7 drivers/acpi/hmat/hmat.c Keith Busch      2019-03-11  705  	/*
d0376aac59a166c drivers/acpi/numa/hmat.c Huang Ying       2023-09-26  706  	 * If the Address Range Structure provides a local processor pxm, set
665ac7e92757fb7 drivers/acpi/hmat/hmat.c Keith Busch      2019-03-11  707  	 * only that one. Otherwise, find the best performance attributes and
d0376aac59a166c drivers/acpi/numa/hmat.c Huang Ying       2023-09-26  708  	 * collect all initiators that match.
665ac7e92757fb7 drivers/acpi/hmat/hmat.c Keith Busch      2019-03-11  709  	 */
665ac7e92757fb7 drivers/acpi/hmat/hmat.c Keith Busch      2019-03-11  710  	if (target->processor_pxm != PXM_INVAL) {
665ac7e92757fb7 drivers/acpi/hmat/hmat.c Keith Busch      2019-03-11  711  		cpu_nid = pxm_to_node(target->processor_pxm);
af0ac0f12386e0d drivers/acpi/numa/hmat.c Dave Jiang       2024-01-09  712  		if ((access == ACCESS_COORDINATE_LOCAL ||
af0ac0f12386e0d drivers/acpi/numa/hmat.c Dave Jiang       2024-01-09  713  		     access == NODE_ACCESS_CLASS_GENPORT_SINK_LOCAL) &&
1aad530cd525eeb drivers/acpi/numa/hmat.c Dave Jiang       2024-01-10  714  		    node_state(cpu_nid, N_CPU)) {
d0376aac59a166c drivers/acpi/numa/hmat.c Huang Ying       2023-09-26  715  			set_bit(target->processor_pxm, p_nodes);
665ac7e92757fb7 drivers/acpi/hmat/hmat.c Keith Busch      2019-03-11  716  			return;
665ac7e92757fb7 drivers/acpi/hmat/hmat.c Keith Busch      2019-03-11  717  		}
b9fffe47212c701 drivers/acpi/numa/hmat.c Jonathan Cameron 2020-09-30  718  	}
665ac7e92757fb7 drivers/acpi/hmat/hmat.c Keith Busch      2019-03-11  719  
665ac7e92757fb7 drivers/acpi/hmat/hmat.c Keith Busch      2019-03-11  720  	if (list_empty(&localities))
665ac7e92757fb7 drivers/acpi/hmat/hmat.c Keith Busch      2019-03-11  721  		return;
665ac7e92757fb7 drivers/acpi/hmat/hmat.c Keith Busch      2019-03-11  722  
665ac7e92757fb7 drivers/acpi/hmat/hmat.c Keith Busch      2019-03-11  723  	/*
665ac7e92757fb7 drivers/acpi/hmat/hmat.c Keith Busch      2019-03-11  724  	 * We need the initiator list sorted so we can use bitmap_clear for
665ac7e92757fb7 drivers/acpi/hmat/hmat.c Keith Busch      2019-03-11  725  	 * previously set initiators when we find a better memory accessor.
665ac7e92757fb7 drivers/acpi/hmat/hmat.c Keith Busch      2019-03-11  726  	 * We'll also use the sorting to prime the candidate nodes with known
665ac7e92757fb7 drivers/acpi/hmat/hmat.c Keith Busch      2019-03-11  727  	 * initiators.
665ac7e92757fb7 drivers/acpi/hmat/hmat.c Keith Busch      2019-03-11  728  	 */
48d4180939e12c4 drivers/acpi/numa/hmat.c Vishal Verma     2022-11-16  729  	list_sort(NULL, &initiators, initiator_cmp);
48d4180939e12c4 drivers/acpi/numa/hmat.c Vishal Verma     2022-11-16  730  	if (initiators_to_nodemask(p_nodes) < 0)
48d4180939e12c4 drivers/acpi/numa/hmat.c Vishal Verma     2022-11-16  731  		return;
48d4180939e12c4 drivers/acpi/numa/hmat.c Vishal Verma     2022-11-16  732  
b9fffe47212c701 drivers/acpi/numa/hmat.c Jonathan Cameron 2020-09-30  733  	for (i = WRITE_LATENCY; i <= READ_BANDWIDTH; i++) {
b9fffe47212c701 drivers/acpi/numa/hmat.c Jonathan Cameron 2020-09-30  734  		loc = localities_types[i];
b9fffe47212c701 drivers/acpi/numa/hmat.c Jonathan Cameron 2020-09-30  735  		if (!loc)
b9fffe47212c701 drivers/acpi/numa/hmat.c Jonathan Cameron 2020-09-30  736  			continue;
b9fffe47212c701 drivers/acpi/numa/hmat.c Jonathan Cameron 2020-09-30  737  
b9fffe47212c701 drivers/acpi/numa/hmat.c Jonathan Cameron 2020-09-30  738  		best = 0;
b9fffe47212c701 drivers/acpi/numa/hmat.c Jonathan Cameron 2020-09-30  739  		list_for_each_entry(initiator, &initiators, node) {
b9fffe47212c701 drivers/acpi/numa/hmat.c Jonathan Cameron 2020-09-30  740  			u32 value;
b9fffe47212c701 drivers/acpi/numa/hmat.c Jonathan Cameron 2020-09-30  741  
af0ac0f12386e0d drivers/acpi/numa/hmat.c Dave Jiang       2024-01-09 @742  			if ((access == ACCESS_COORDINATE_CPU &&
af0ac0f12386e0d drivers/acpi/numa/hmat.c Dave Jiang       2024-01-09  743  			     access == NODE_ACCESS_CLASS_GENPORT_SINK_CPU) &&
1aad530cd525eeb drivers/acpi/numa/hmat.c Dave Jiang       2024-01-10  744  			    !initiator->has_cpu) {
b9fffe47212c701 drivers/acpi/numa/hmat.c Jonathan Cameron 2020-09-30  745  				clear_bit(initiator->processor_pxm, p_nodes);
b9fffe47212c701 drivers/acpi/numa/hmat.c Jonathan Cameron 2020-09-30  746  				continue;
b9fffe47212c701 drivers/acpi/numa/hmat.c Jonathan Cameron 2020-09-30  747  			}
b9fffe47212c701 drivers/acpi/numa/hmat.c Jonathan Cameron 2020-09-30  748  			if (!test_bit(initiator->processor_pxm, p_nodes))
b9fffe47212c701 drivers/acpi/numa/hmat.c Jonathan Cameron 2020-09-30  749  				continue;
b9fffe47212c701 drivers/acpi/numa/hmat.c Jonathan Cameron 2020-09-30  750  
b9fffe47212c701 drivers/acpi/numa/hmat.c Jonathan Cameron 2020-09-30  751  			value = hmat_initiator_perf(target, initiator, loc->hmat_loc);
b9fffe47212c701 drivers/acpi/numa/hmat.c Jonathan Cameron 2020-09-30  752  			if (hmat_update_best(loc->hmat_loc->data_type, value, &best))
b9fffe47212c701 drivers/acpi/numa/hmat.c Jonathan Cameron 2020-09-30  753  				bitmap_clear(p_nodes, 0, initiator->processor_pxm);
b9fffe47212c701 drivers/acpi/numa/hmat.c Jonathan Cameron 2020-09-30  754  			if (value != best)
b9fffe47212c701 drivers/acpi/numa/hmat.c Jonathan Cameron 2020-09-30  755  				clear_bit(initiator->processor_pxm, p_nodes);
b9fffe47212c701 drivers/acpi/numa/hmat.c Jonathan Cameron 2020-09-30  756  		}
b9fffe47212c701 drivers/acpi/numa/hmat.c Jonathan Cameron 2020-09-30  757  		if (best)
d0376aac59a166c drivers/acpi/numa/hmat.c Huang Ying       2023-09-26  758  			hmat_update_target_access(target, loc->hmat_loc->data_type, best, access);
d0376aac59a166c drivers/acpi/numa/hmat.c Huang Ying       2023-09-26  759  	}
b9fffe47212c701 drivers/acpi/numa/hmat.c Jonathan Cameron 2020-09-30  760  }
d0376aac59a166c drivers/acpi/numa/hmat.c Huang Ying       2023-09-26  761  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
