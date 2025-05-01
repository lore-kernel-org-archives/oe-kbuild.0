Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4103C3D6A
	for <oe-kbuild@lists.linux.dev>; Thu,  1 May 2025 23:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746143475; cv=none; b=fsWKHP4c47qmSPho0e7sjzO88CbvwIphMBvSGWdww4WluIEvTgfbwabA7xOP5gIKoPYCzs4uqIvSq6Onf+CXA9//pJt50fEJScAn1sVOL1/Fh7SNgHt5NQMtBmQZDY7ToGg1QSAkCtSKjpOVaQ/mjbHasG+03B6/L7TxNrhlJUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746143475; c=relaxed/simple;
	bh=/3tDDNG9cX63WHCIG7T2VYKI0WoVWc6XLX4eW7dRyEQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q0ATiW/1dy1ClxfUpHBi7bOJurX7nSro3vtpnp0LY6/sa2F62lyM8wvLT9WJemvMKYJBq0J7xkX9b2ZdgJzmB4GaYNDmpeqReXQZ4Xhaa/uAv8nlWiOls4EQdmLDBbuyagsZajV7j8hNgEVmvpvZx6Td7Eqt/zzaeySxCs6Su8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=emC2IWr3; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="emC2IWr3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746143473; x=1777679473;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/3tDDNG9cX63WHCIG7T2VYKI0WoVWc6XLX4eW7dRyEQ=;
  b=emC2IWr33UHD8cK7Kz+7FalO3JDcrVeJn4lT7rxs2eiA7j/ovb5rZXjY
   6eMA/17vIC7XXflrpQIxk+FRkAxKflhTJIRQ71r7P1iDa8Kb7sobg9eIY
   ZMOPzWPcgQWcxIK8+wtNkz22Gu8GAaTs1vE9XxVi6ty0YzVUf9FVFqkqX
   46f7dgLqawd730rEfJVgsydNUDBAv0z/XZ1OT/Z3pnaDxVM+bTdntu0gq
   6wFTRm8ZGO6YgQb5ELcZTboo+taYoxK6+EKm+xwRTF1r6qT0Mtz6Mchxz
   QUN1WePbxVCfWxWl8Vbh7/GlH9arBztrok8HFs3x4AueSh9PKcZFoxJJw
   g==;
X-CSE-ConnectionGUID: BDbpRNd2QumTbFFDv3K5Dg==
X-CSE-MsgGUID: 7eiYGjgNQ+K4Ge2hCTUZ+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="58455147"
X-IronPort-AV: E=Sophos;i="6.15,255,1739865600"; 
   d="scan'208";a="58455147"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 16:51:12 -0700
X-CSE-ConnectionGUID: 6cWVs2FHSHuCe8UiY6uLBA==
X-CSE-MsgGUID: 6BYLlr6QSzCcOFVbEpm0ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,255,1739865600"; 
   d="scan'208";a="134457626"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 01 May 2025 16:51:10 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uAdgK-0004Rp-1E;
	Thu, 01 May 2025 23:51:08 +0000
Date: Fri, 2 May 2025 07:50:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH RFC v3 8/8] lib/Kconfig.debug: introduce
 CONFIG_NO_AUTO_INLINE
Message-ID: <202505020759.DZ04IOlq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250429-noautoinline-v3-8-4c49f28ea5b5@uniontech.com>
References: <20250429-noautoinline-v3-8-4c49f28ea5b5@uniontech.com>
TO: Chen Linxuan via B4 Relay <devnull+chenlinxuan.uniontech.com@kernel.org>

Hi Chen,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on ca91b9500108d4cf083a635c2e11c884d5dd20ea]

url:    https://github.com/intel-lab-lkp/linux/commits/Chen-Linxuan-via-B4-Relay/nvme-add-__always_inline-for-nvme_pci_npages_prp/20250429-120709
base:   ca91b9500108d4cf083a635c2e11c884d5dd20ea
patch link:    https://lore.kernel.org/r/20250429-noautoinline-v3-8-4c49f28ea5b5%40uniontech.com
patch subject: [PATCH RFC v3 8/8] lib/Kconfig.debug: introduce CONFIG_NO_AUTO_INLINE
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20250502/202505020759.DZ04IOlq-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250502/202505020759.DZ04IOlq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505020759.DZ04IOlq-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: pv_init+0xd2 (section: .text.unlikely) -> swiotlb_init (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: pv_init+0xd8 (section: .text.unlikely) -> swiotlb_update_mem_attributes (section: .init.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
