Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847C935B62E
	for <oe-kbuild@lists.linux.dev>; Fri, 20 Mar 2026 09:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773997837; cv=none; b=LhT0l2bzx8S84R2JxaB9URvrk0kGgXmgLLaVrVEiECrZKv9Z97Pz7KK1aXbXXsKZyNaSb2FZ3ujPw5XlpbdrzLQtAAzlgZr6s2IhKjegx68rPLhvnQ+H+dwnZOvwREJtx8PVoNTQi2N9e09riiuv2kg0z66JcVKwyHufLw+wx0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773997837; c=relaxed/simple;
	bh=tPdsYfGIynq/RAqCV1vm6a0EgIALkJ2LkCX2Guoi3VM=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e9x45lWFEVT2/Z2nHFdTnpQ+9FkSoC3hOxzWgSYkAr+71m5qK7Ucoz+qesvZxkvLIyKFgUV6acsWGjlYiE2Ja185owr7UAC94FxcoTDvJUQ8VE9qZTsYM54kDxmM1QDIuzAf0Lsbplc1FMu3QAYvUDXt316f7yNzg+xihlKzZ8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZJkNnf9C; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZJkNnf9C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773997831; x=1805533831;
  h=date:from:to:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=tPdsYfGIynq/RAqCV1vm6a0EgIALkJ2LkCX2Guoi3VM=;
  b=ZJkNnf9CY69v6pkVgOchJd0bj1Xoi+h6aBlKUreUr01KkxoSYQdeXQ30
   WyF84CPjV26x/ueAMPskt7uK/VbnedjIComQTZnqGKrDnLcPuvGzOkD81
   OB8Q85P6Oizt5yYR7qpO9AnvanUAwyCK1C3RQiNtnHOGiLLEzQ/1AdzKe
   jt1mYAwj5bVQf+By2U/usBsVz0WKLtqm89mZbvlGuXGS8tAih/8QHbOZk
   2X6VdwNA4KOA9udSK1HxhAmAiPVh5E4GeZdfzBk92x2++R3axeyVLgAhD
   RFrOF9poyVW1hIC9fiQMSKqLIkPGr5c1lVPjvMoKyQoNpnhYhAlE1n/VP
   w==;
X-CSE-ConnectionGUID: y+7jN1gfTc2G4Kk/Hej5+g==
X-CSE-MsgGUID: gujP+bZdQGGQkVIEm4cQ2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="78685691"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="78685691"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 02:10:30 -0700
X-CSE-ConnectionGUID: AuCEI/3cT+qltgLZiLpT5Q==
X-CSE-MsgGUID: SDz/thABSAi5xlXoafvSSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="218607182"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 20 Mar 2026 02:10:30 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3VsB-0000000050P-3s3N
	for oe-kbuild@lists.linux.dev;
	Fri, 20 Mar 2026 09:10:27 +0000
Date: Fri, 20 Mar 2026 10:09:36 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: Re: [PATCH 1/5] soc/tegra: Update BPMP ABI header
Message-ID: <202603201047.RnToj4l7-lkp@intel.com>
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
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260319160110.2131954-2-thierry.reding@kernel.org>
References: <20260319160110.2131954-2-thierry.reding@kernel.org>
TO: Thierry Reding <thierry.reding@kernel.org>
TO: Thierry Reding <thierry.reding@kernel.org>
TO: Bjorn Helgaas <helgaas@kernel.org>
TO: Lorenzo Pieralisi <lpieralisi@kernel.org>
TO: "Krzysztof Wilczyński" <kwilczynski@kernel.org>
TO: Manivannan Sadhasivam <mani@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>

Hi Thierry,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tegra/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thierry-Reding/soc-tegra-Update-BPMP-ABI-header/20260320-025556
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git for-next
patch link:    https://lore.kernel.org/r/20260319160110.2131954-2-thierry.reding%40kernel.org
patch subject: [PATCH 1/5] soc/tegra: Update BPMP ABI header
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260320/202603201047.RnToj4l7-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'Throttle'
#536: FILE: include/soc/tegra/bpmp-abi.h:611:
+ *   @defgroup Throttle Throttle

WARNING:REPEATED_WORD: Possible repeated word: 'Shutdown'
#544: FILE: include/soc/tegra/bpmp-abi.h:627:
+ *   @defgroup Shutdown Shutdown

WARNING:REPEATED_WORD: Possible repeated word: 'Slc'
#552: FILE: include/soc/tegra/bpmp-abi.h:635:
+ * *  @defgroup Slc Slc

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
