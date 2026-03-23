Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47BEA1E2614
	for <oe-kbuild@lists.linux.dev>; Mon, 23 Mar 2026 13:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774271528; cv=none; b=bR8zXzssti5GxFIETG7uC9qe//wqUVrJtjoiGHTGUzMJeE9rlCNZ+ovQNZ02WVsxHgT15SWpWioBHT5NUY/cb7ZXTE43X46Cotpye4S+KCn8572QavN3s+052sfg3TlrFlma24hy2CvCGEW+35Fi5d1FPbgyUSh4Xj30Fybno0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774271528; c=relaxed/simple;
	bh=zpYfpGTrXfkdtpXSgszn5pH8CCkQ5vcQ8DP1U0c2T3g=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AHlc6mmRium7EatT5/BFz4y2HKZ3MyX9ovRZX+6GWCbX66dxSxA/nijtJeIPiDSQKYrYJW4xJCEvaQbcZm2Q3l96mAdklYNvRoigcvObsm8IvtdOBAJMdEqZCT6h14tQinZCkBHGS6zlcJ+H7wEFY0Fg46Ih4D4Mmzm47zYnI3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QTtmqWFS; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QTtmqWFS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774271527; x=1805807527;
  h=date:from:to:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=zpYfpGTrXfkdtpXSgszn5pH8CCkQ5vcQ8DP1U0c2T3g=;
  b=QTtmqWFSYG+otURL5R/9NVz/8CHa783MtJPAkPCOhzZx4S9mRnCXa9us
   V2sTxOxAAEWZgbzpc5sjK20LwNUvptbbcFEJS974YaDeMLkuGzYOW9e6m
   ngTA8UHnOjVfUw7rbmL7A9z6e/cRF38JZAAv3id+DcNsNB2mo2SmLi0wA
   FBpOCrPbyEXO6pOG24R4bbhjehVacU45WOIVH76+z3PsROzXTBCsEV7h2
   sNLDUmbgL5+DkOxnALpb2RsbZ2GkR3klmEVKzb/T/1fO+TtR0pY1DIFtS
   wGzvcM+apsZUGbzos0N0MkpIQaOtZuJvgTK+rJm6mNFbbXNOgqc2nrsBB
   Q==;
X-CSE-ConnectionGUID: c58TO40IT2i0qEp50Kmxpg==
X-CSE-MsgGUID: eBCF6II2TAG1SCa1EHDm/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="75176074"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="75176074"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 06:12:07 -0700
X-CSE-ConnectionGUID: 65XNglbERX67dWyDRYU4gQ==
X-CSE-MsgGUID: qYdV0I5CTQuDlBW7e7CRLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="224039618"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 23 Mar 2026 06:12:06 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4f4d-000000006dF-2dTg
	for oe-kbuild@lists.linux.dev;
	Mon, 23 Mar 2026 13:12:03 +0000
Date: Mon, 23 Mar 2026 14:11:44 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: Re: [PATCH v2 1/5] soc/tegra: Update BPMP ABI header
Message-ID: <202603231404.xK4O4LBm-lkp@intel.com>
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
In-Reply-To: <20260320225443.2571920-2-thierry.reding@kernel.org>
References: <20260320225443.2571920-2-thierry.reding@kernel.org>
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

url:    https://github.com/intel-lab-lkp/linux/commits/Thierry-Reding/soc-tegra-Update-BPMP-ABI-header/20260323-093336
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git for-next
patch link:    https://lore.kernel.org/r/20260320225443.2571920-2-thierry.reding%40kernel.org
patch subject: [PATCH v2 1/5] soc/tegra: Update BPMP ABI header
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260323/202603231404.xK4O4LBm-lkp@intel.com/reproduce)

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
