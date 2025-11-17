Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B96C27FB2E
	for <oe-kbuild@lists.linux.dev>; Mon, 17 Nov 2025 23:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763422870; cv=none; b=SxSHwEH9OJ61IE1Usyw91lFeaa8Ba15pV2aDvD+gbNc/95yEAARTfBjRKG0o9nc99ieJ1c5JGII9FVDqyrpcQ2QN09qqBU6SUZao0C7RObIRRmqGAdkxe0mKSzRkliG9QZlELIdc1GtrizI3mxTfXsNYhh9FxaXPx1vdL2LQyek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763422870; c=relaxed/simple;
	bh=d1Sv5/JC9RssQevImzoZ8y9F/5tr6a5xtcMyvkf+SSA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PTo/LXJjnSPkKYVisvXxiub4Qx3xCb3OCqotOefDVHdE8CEKBPmfwxtiAHHD2qHucHGK3D3uOVL1vdSjGb3lz2gk4NEiaczsU5Q/Z0A7PicWFx7CP9ziHXXgMbPuNqZ7Vg1wpczBkggxoUETfp+l03YlmjgVgqjtzqxsS3ZzmJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kmxB9Opd; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kmxB9Opd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763422868; x=1794958868;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=d1Sv5/JC9RssQevImzoZ8y9F/5tr6a5xtcMyvkf+SSA=;
  b=kmxB9Opd+eQYtvuebJijDD3jx2k7JFr2Ji/7yHQp0vuq1VM1GkMX8N6w
   v41xPHqUbBtZg6y5ZM+1P8s9EUTFlSIrgd6HfqdVQwtcg82DkGHVqmsEx
   Km7MdruVuTIszGU7YBMMzP7ljAsyhD8bsU3fD+SlH2yovSNaVNKlb9wAu
   sZ0uELAkch8xYhhiPIGpLqV0EUeM5NHk8h9GqYHTSaR/RLz3RQGtPUGcL
   PVDpr1Dn7YmwTUz9ir/l2tWnVWabQQkeNeqhjFKTP2f87vL/MpE2lghk6
   vpTHPCcIWazP9ta2ktSFviUWmpdS/icqDhfkgaCjk+68yZ71KjRvwd9ij
   w==;
X-CSE-ConnectionGUID: zMDKGt5JQD+Sg1jVtDj8CA==
X-CSE-MsgGUID: sPcmJTkJR662wHtb5nNfFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="90909799"
X-IronPort-AV: E=Sophos;i="6.19,313,1754982000"; 
   d="scan'208";a="90909799"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 15:41:05 -0800
X-CSE-ConnectionGUID: AVA+Vk/JQiKMFemKvmjyIg==
X-CSE-MsgGUID: pef10Wo4RrmOoBCb9BD3Tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,313,1754982000"; 
   d="scan'208";a="195517215"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 17 Nov 2025 15:41:05 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vL8qE-00019j-2G;
	Mon, 17 Nov 2025 23:41:02 +0000
Date: Tue, 18 Nov 2025 07:41:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/nvme/target/pci-epf.o: warning: objtool:
 nvmet_pci_epf_alloc_iod_data_buf+0x388: unreachable instruction
Message-ID: <202511180733.kDGHlhLo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Damien Le Moal <dlemoal@kernel.org>
CC: Keith Busch <kbusch@kernel.org>
CC: Christoph Hellwig <hch@lst.de>
CC: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
CC: "Krzysztof Wilczyński" <kwilczynski@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e7c375b181600caf135cfd03eadbc45eb530f2cb
commit: 0faa0fe6f90ea59b10d1b0f15ce0eb0c18eff186 nvmet: New NVMe PCI endpoint function target driver
date:   10 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 10 months ago
config: loongarch-randconfig-r071-20251118 (https://download.01.org/0day-ci/archive/20251118/202511180733.kDGHlhLo-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251118/202511180733.kDGHlhLo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511180733.kDGHlhLo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/nvme/target/pci-epf.o: warning: objtool: nvmet_pci_epf_alloc_iod_data_buf+0x388: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
