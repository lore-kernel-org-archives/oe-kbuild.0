Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 971543803CC
	for <oe-kbuild@lists.linux.dev>; Mon, 30 Mar 2026 23:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774912617; cv=none; b=W6xbWZ+pnkrepOOPyqmqyJc3OwgC7mGahqfk1QTV7cF4271cN4PxZdJb/vIu76x3TGHm/aREBmJGuET7UOaRFadzxM8czTDzNhzoFg6MYEGEWhihdTEKQef1NIDAzjJVE9cl+2fl9uCHCoD2qfSY0QOWbs09DmYigDTFB3OwhIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774912617; c=relaxed/simple;
	bh=5AXtZAgFjTO72u9OM9m5YJADb6i9kV8bF6e8fyj7Te8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VQlAIXYx7+mz6Fi+/W9GjlXh8WaKwrLxK6R8IoKc5loiT5cfhUCHWdLLcDmcp+RP7RNUE+M1Uae3vOWsvc8fquQf4/2PLsjnv497nEzwH/BHceBveWAevUWC0izOLhnnf5kuIFKWpXNrJZk1uRGppO62QjH/Z7KMx2IQ6gxMVrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RbZLBwhj; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RbZLBwhj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774912614; x=1806448614;
  h=date:from:to:cc:subject:message-id;
  bh=5AXtZAgFjTO72u9OM9m5YJADb6i9kV8bF6e8fyj7Te8=;
  b=RbZLBwhj3caVbyRiFUHwz/FhS3MDHHJIgjabdtZybpzLv85Zb2u79q2L
   lJubR4QurPE1fjiE4fXUkyuLDbOprEwGihqjdGx/LpYfbVnp47WeoG+Ko
   4Elkg6icUcKb5Sfqxf2TJMJD89uHVaTh9e2UH/2hrqBKwHQzb6mewqeD0
   4HWcGDngjbJDevROZJ/sE1L/EyoxOcI2LWiVlj8ZEvl1UzF+zKM3nZR0R
   7nvvkDW+szhcHzIRbF6FP4+mRqXckYy8HKJyxnPVYh7OtYzk1s6Jfn0Iu
   iMKPP4yqBUvQnmvaBBrGduT9Fx3uS9aNXigpjbcXPvvRYK4jQ+8PVBsCQ
   g==;
X-CSE-ConnectionGUID: Wn+7pT4wS12tTJzZtnEYag==
X-CSE-MsgGUID: zpTYMNxkQL+0GSdX+ZUsDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="79777624"
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; 
   d="scan'208";a="79777624"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 16:16:54 -0700
X-CSE-ConnectionGUID: dPYR5iKFRKKRttBatioPjA==
X-CSE-MsgGUID: 5LbJ+1nYQoSzqCcoOqoUjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; 
   d="scan'208";a="225203624"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 30 Mar 2026 16:16:53 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7Lqk-000000001qZ-2AJX;
	Mon, 30 Mar 2026 23:16:50 +0000
Date: Tue, 31 Mar 2026 07:16:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/pci/controller/pci-hyperv.c:2313 prepopulate_bars()
 error: buffer overflow 'hpdev->probed_bar' 6 <= 6
Message-ID: <202603310721.yBIfyrK7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Roman Kisel <romank@linux.microsoft.com>
CC: Wei Liu <wei.liu@kernel.org>
CC: Michael Kelley <mhklinux@outlook.com>

Hi Roman,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7aaa8047eafd0bd628065b15757d9b48c5f9c07d
commit: d684f9b28809b783e8473727fdf14595b36d8fd3 PCI: hv: Get vPCI MSI IRQ domain from DeviceTree
date:   10 months ago
:::::: branch date: 25 hours ago
:::::: commit date: 10 months ago
config: arm64-randconfig-r072-20260330 (https://download.01.org/0day-ci/archive/20260331/202603310721.yBIfyrK7-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603310721.yBIfyrK7-lkp@intel.com/

smatch warnings:
drivers/pci/controller/pci-hyperv.c:2313 prepopulate_bars() error: buffer overflow 'hpdev->probed_bar' 6 <= 6

vim +2313 drivers/pci/controller/pci-hyperv.c

4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2246  
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2247  /**
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2248   * prepopulate_bars() - Fill in BARs with defaults
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2249   * @hbus:	Root PCI bus, as understood by this driver
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2250   *
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2251   * The core PCI driver code seems much, much happier if the BARs
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2252   * for a device have values upon first scan. So fill them in.
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2253   * The algorithm below works down from large sizes to small,
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2254   * attempting to pack the assignments optimally. The assumption,
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2255   * enforced in other parts of the code, is that the beginning of
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2256   * the memory-mapped I/O space will be aligned on the largest
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2257   * BAR size.
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2258   */
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2259  static void prepopulate_bars(struct hv_pcibus_device *hbus)
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2260  {
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2261  	resource_size_t high_size = 0;
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2262  	resource_size_t low_size = 0;
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2263  	resource_size_t high_base = 0;
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2264  	resource_size_t low_base = 0;
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2265  	resource_size_t bar_size;
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2266  	struct hv_pci_dev *hpdev;
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2267  	unsigned long flags;
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2268  	u64 bar_val;
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2269  	u32 command;
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2270  	bool high;
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2271  	int i;
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2272  
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2273  	if (hbus->low_mmio_space) {
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2274  		low_size = 1ULL << (63 - __builtin_clzll(hbus->low_mmio_space));
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2275  		low_base = hbus->low_mmio_res->start;
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2276  	}
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2277  
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2278  	if (hbus->high_mmio_space) {
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2279  		high_size = 1ULL <<
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2280  			(63 - __builtin_clzll(hbus->high_mmio_space));
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2281  		high_base = hbus->high_mmio_res->start;
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2282  	}
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2283  
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2284  	spin_lock_irqsave(&hbus->device_list_lock, flags);
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2285  
ac82fc83270884 drivers/pci/controller/pci-hyperv.c Dexuan Cui        2019-11-24  2286  	/*
ac82fc83270884 drivers/pci/controller/pci-hyperv.c Dexuan Cui        2019-11-24  2287  	 * Clear the memory enable bit, in case it's already set. This occurs
ac82fc83270884 drivers/pci/controller/pci-hyperv.c Dexuan Cui        2019-11-24  2288  	 * in the suspend path of hibernation, where the device is suspended,
ac82fc83270884 drivers/pci/controller/pci-hyperv.c Dexuan Cui        2019-11-24  2289  	 * resumed and suspended again: see hibernation_snapshot() and
ac82fc83270884 drivers/pci/controller/pci-hyperv.c Dexuan Cui        2019-11-24  2290  	 * hibernation_platform_enter().
ac82fc83270884 drivers/pci/controller/pci-hyperv.c Dexuan Cui        2019-11-24  2291  	 *
c77bfb54174308 drivers/pci/controller/pci-hyperv.c Bjorn Helgaas     2021-01-26  2292  	 * If the memory enable bit is already set, Hyper-V silently ignores
ac82fc83270884 drivers/pci/controller/pci-hyperv.c Dexuan Cui        2019-11-24  2293  	 * the below BAR updates, and the related PCI device driver can not
ac82fc83270884 drivers/pci/controller/pci-hyperv.c Dexuan Cui        2019-11-24  2294  	 * work, because reading from the device register(s) always returns
14e04d0d5ed065 drivers/pci/controller/pci-hyperv.c Naveen Naidu      2021-11-18  2295  	 * 0xFFFFFFFF (PCI_ERROR_RESPONSE).
ac82fc83270884 drivers/pci/controller/pci-hyperv.c Dexuan Cui        2019-11-24  2296  	 */
ac82fc83270884 drivers/pci/controller/pci-hyperv.c Dexuan Cui        2019-11-24  2297  	list_for_each_entry(hpdev, &hbus->children, list_entry) {
ac82fc83270884 drivers/pci/controller/pci-hyperv.c Dexuan Cui        2019-11-24  2298  		_hv_pcifront_read_config(hpdev, PCI_COMMAND, 2, &command);
ac82fc83270884 drivers/pci/controller/pci-hyperv.c Dexuan Cui        2019-11-24  2299  		command &= ~PCI_COMMAND_MEMORY;
ac82fc83270884 drivers/pci/controller/pci-hyperv.c Dexuan Cui        2019-11-24  2300  		_hv_pcifront_write_config(hpdev, PCI_COMMAND, 2, command);
ac82fc83270884 drivers/pci/controller/pci-hyperv.c Dexuan Cui        2019-11-24  2301  	}
ac82fc83270884 drivers/pci/controller/pci-hyperv.c Dexuan Cui        2019-11-24  2302  
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2303  	/* Pick addresses for the BARs. */
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2304  	do {
5b8db8f66e08fa drivers/pci/host/pci-hyperv.c       Stephen Hemminger 2018-05-23  2305  		list_for_each_entry(hpdev, &hbus->children, list_entry) {
c9c13ba428ef90 drivers/pci/controller/pci-hyperv.c Denis Efremov     2019-09-28  2306  			for (i = 0; i < PCI_STD_NUM_BARS; i++) {
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2307  				bar_val = hpdev->probed_bar[i];
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2308  				if (bar_val == 0)
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2309  					continue;
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2310  				high = bar_val & PCI_BASE_ADDRESS_MEM_TYPE_64;
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2311  				if (high) {
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2312  					bar_val |=
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16 @2313  						((u64)hpdev->probed_bar[i + 1]
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2314  						 << 32);
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2315  				} else {
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2316  					bar_val |= 0xffffffffULL << 32;
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2317  				}
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2318  				bar_size = get_bar_size(bar_val);
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2319  				if (high) {
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2320  					if (high_size != bar_size) {
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2321  						i++;
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2322  						continue;
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2323  					}
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2324  					_hv_pcifront_write_config(hpdev,
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2325  						PCI_BASE_ADDRESS_0 + (4 * i),
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2326  						4,
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2327  						(u32)(high_base & 0xffffff00));
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2328  					i++;
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2329  					_hv_pcifront_write_config(hpdev,
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2330  						PCI_BASE_ADDRESS_0 + (4 * i),
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2331  						4, (u32)(high_base >> 32));
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2332  					high_base += bar_size;
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2333  				} else {
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2334  					if (low_size != bar_size)
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2335  						continue;
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2336  					_hv_pcifront_write_config(hpdev,
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2337  						PCI_BASE_ADDRESS_0 + (4 * i),
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2338  						4,
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2339  						(u32)(low_base & 0xffffff00));
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2340  					low_base += bar_size;
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2341  				}
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2342  			}
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2343  			if (high_size <= 1 && low_size <= 1) {
23e118a48acf7b drivers/pci/controller/pci-hyperv.c Dexuan Cui        2022-05-02  2344  				/*
23e118a48acf7b drivers/pci/controller/pci-hyperv.c Dexuan Cui        2022-05-02  2345  				 * No need to set the PCI_COMMAND_MEMORY bit as
23e118a48acf7b drivers/pci/controller/pci-hyperv.c Dexuan Cui        2022-05-02  2346  				 * the core PCI driver doesn't require the bit
23e118a48acf7b drivers/pci/controller/pci-hyperv.c Dexuan Cui        2022-05-02  2347  				 * to be pre-set. Actually here we intentionally
23e118a48acf7b drivers/pci/controller/pci-hyperv.c Dexuan Cui        2022-05-02  2348  				 * keep the bit off so that the PCI BAR probing
23e118a48acf7b drivers/pci/controller/pci-hyperv.c Dexuan Cui        2022-05-02  2349  				 * in the core PCI driver doesn't cause Hyper-V
23e118a48acf7b drivers/pci/controller/pci-hyperv.c Dexuan Cui        2022-05-02  2350  				 * to unnecessarily unmap/map the virtual BARs
23e118a48acf7b drivers/pci/controller/pci-hyperv.c Dexuan Cui        2022-05-02  2351  				 * from/to the physical BARs multiple times.
23e118a48acf7b drivers/pci/controller/pci-hyperv.c Dexuan Cui        2022-05-02  2352  				 * This reduces the VM boot time significantly
23e118a48acf7b drivers/pci/controller/pci-hyperv.c Dexuan Cui        2022-05-02  2353  				 * if the BAR sizes are huge.
23e118a48acf7b drivers/pci/controller/pci-hyperv.c Dexuan Cui        2022-05-02  2354  				 */
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2355  				break;
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2356  			}
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2357  		}
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2358  
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2359  		high_size >>= 1;
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2360  		low_size >>= 1;
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2361  	}  while (high_size || low_size);
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2362  
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2363  	spin_unlock_irqrestore(&hbus->device_list_lock, flags);
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2364  }
4daace0d8ce851 drivers/pci/host/pci-hyperv.c       Jake Oshins       2016-02-16  2365  

:::::: The code at line 2313 was first introduced by commit
:::::: 4daace0d8ce851f8f8f91563c835e3000c954d5e PCI: hv: Add paravirtual PCI front-end for Microsoft Hyper-V VMs

:::::: TO: Jake Oshins <jakeo@microsoft.com>
:::::: CC: Bjorn Helgaas <bhelgaas@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
