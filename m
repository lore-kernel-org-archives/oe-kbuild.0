Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA7A229A326
	for <oe-kbuild@lists.linux.dev>; Sat, 17 Jan 2026 03:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768621162; cv=none; b=Nj0d4DoN22YzmboCMeLTzR25hCNFpOEbDh6mlq+a1KN70NM/kmVl7EUacx2JQIYYdZf605/XUJSqa1t+Hq1McM8nxRYJemXflahFWCIugLSlcEHBR2LplPTxQobwXM8ZyZIdeM2jr8gystZLNQ7vyhbmNM4Y6mujz/mcO3cBlUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768621162; c=relaxed/simple;
	bh=X4Dvuq1FvyOLrLGDvFwYeJSuqlBPc+RD8pcCdG3jRoc=;
	h=Date:From:To:Subject:Message-ID; b=MrFR0fxs6ZTCSyeJKTs7foeOz6kTr48pCty5Bn2CHX+0CI08f5Hjla4RGoz36Wr8cjAc58UaOL6dj38O1vuNTMBSPVpkJ8i00md+PCYLX2MN79Jr73wGGBUbZHCGFtfJt77ir5ZGQmlMrPfrIBVn473zDJMRm3aiqdfvdSgSqcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y9OqFSmz; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y9OqFSmz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768621161; x=1800157161;
  h=date:from:to:subject:message-id;
  bh=X4Dvuq1FvyOLrLGDvFwYeJSuqlBPc+RD8pcCdG3jRoc=;
  b=Y9OqFSmzNrd0xHrtDW29Ht/4HxPlFpSm64T5RS2PYwQTwu6150smIp1O
   SqasHiKHamg6MphQVzQxnv4d3TxsEukT+ZnLXQffNJcTE/6QlkKS9ncoh
   JDq2FGLRBNpFg8FFVkvhkmzd2FGba4BTNsJCNP1Jdr0f945fGzqp9P3T0
   R/po4QrE8zcEr8LwzmoE3CybdaMlf9YmLfKBXFIhne6Ktjx0xTWqO+bdA
   txsDRA+dhmT9psGn88Kj9QF5uNgsIWE5i4WIF2RJ816wqS9KX4RWKB9oG
   d4b8zb9z7vI7Xv0q+nPluSv2ar06N1xLjgSTCDUkptU9xxxEjX0pQhlZ5
   A==;
X-CSE-ConnectionGUID: 5oS24xPqT7e3ATt1bXoQgA==
X-CSE-MsgGUID: A9mQ+lgwQim9Aq8jv5Eh0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="73787296"
X-IronPort-AV: E=Sophos;i="6.21,233,1763452800"; 
   d="scan'208";a="73787296"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 19:39:20 -0800
X-CSE-ConnectionGUID: iGfWIEGjQvCpx6tz1p8G9g==
X-CSE-MsgGUID: 28kKD9IBQmaGXUX505II1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,233,1763452800"; 
   d="scan'208";a="242951143"
Received: from igk-lkp-server01.igk.intel.com (HELO 8581b2e2a62c) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 16 Jan 2026 19:39:20 -0800
Received: from kbuild by 8581b2e2a62c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgx9h-000000001tx-0Ctq
	for oe-kbuild@lists.linux.dev;
	Sat, 17 Jan 2026 03:39:17 +0000
Date: Sat, 17 Jan 2026 04:39:03 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [pci:pwrctrl 8/15] checkpatch: ERROR:BAD_SIGN_OFF:
 Unrecognized email address: 'Manivannan Sadhasivam
 <manivannan.sadhasivam@oss.qualcomm.com'
Message-ID: <202601170436.xRCZM4Jq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git pwrctrl
head:   8822f062e59a4daf070cb58666cec30b63db2d3b
commit: 2045c352812e5a2eec0aa9d2b1e5d2fe1127b919 [8/15] PCI/pwrctrl: pwrseq: Factor out power on/off code to helpers
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260117/202601170436.xRCZM4Jq-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com'
#10: 
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
