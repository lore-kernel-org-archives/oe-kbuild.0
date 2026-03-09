Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D35C36B053
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Mar 2026 20:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773088236; cv=none; b=JHay9a4xTceJ3i8eXBJQVnm8LAN6BXKH9LYIqrZTGCexPtLZpt3NY6i3VOwAfxl1flBs/hlXvpxq5tKe0W+eO7sgFgt7pJ/hSkewzwwvAlbaM+QC+iKC0AdmiRfs/xqRBUC3fJefhwEEyBCqxecAq1FJxVj7TwuyFeLRMRfreb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773088236; c=relaxed/simple;
	bh=yGaRYB3EHQbmY41JUfL4eSKU+rLEoUamQIrfZiUYWFg=;
	h=Date:From:To:Subject:Message-ID; b=cmEWT8qHv7MOosdDQm7QFsVSKK8ole4xW7/sdz1f8/yZjndR6j6UdNHvMQ3vxrf6Ty0EYO29U4w4EWfrhTL//ZDncbiCYWrkp+3JdscWJvaWNxctyyqHAvIvo4Sc3fqmZkql6Kl7W0mnpW58bAhuKypVxlEPulObzQ3Ui1AW5Ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SmZWFV2y; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SmZWFV2y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773088235; x=1804624235;
  h=date:from:to:subject:message-id;
  bh=yGaRYB3EHQbmY41JUfL4eSKU+rLEoUamQIrfZiUYWFg=;
  b=SmZWFV2yf2po7ekmeqcH3RWKAMQUW4za7wcgH5XruSvWFxo2CRVNlXtR
   2PMbLaUjqnjmVvAVWWZF9ldGXp7db5IhNeNqt9R+zqo80TX7vOyFxskBN
   nvAfS9EG4Qz74KPChEHXNs3KbXRc4bVmNI8gk3BxZQw+VS2krG0Po/Md6
   R2Bv6KhNhwzZFgN+1QmCKZrudnSEKSfP6NLlbBu9WOAB3VKOo/VQiJiWT
   qCofpjJvyBj6x8HrC1155NAibUiixJ/CWcdE70EFLv2TDud0WPoioxbNm
   BQ+qrKaxYgLl3Cl0j/Xp49ERC+F/4lg+tWCgUT3j7BTOI+PpNP5f1uwFV
   Q==;
X-CSE-ConnectionGUID: GbZ+9cKyR4ircfmTJp55tg==
X-CSE-MsgGUID: iSQA/CE9Rz+6mTvPmbtrJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="73822878"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="73822878"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 13:30:34 -0700
X-CSE-ConnectionGUID: rjVS4OYWQByUMvjP7SdnZw==
X-CSE-MsgGUID: 63OLUHESRcCvDRDARgd2wA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="219839336"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 09 Mar 2026 13:30:34 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzhFG-000000002w5-413x
	for oe-kbuild@lists.linux.dev;
	Mon, 09 Mar 2026 20:30:30 +0000
Date: Mon, 09 Mar 2026 21:29:58 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [cornelisnetworks:for-upstream_20260309-1128 16/31]
 checkpatch: WARNING:REPEATED_WORD: Possible repeated word: 'device'
Message-ID: <202603092131.gL1LenYG-lkp@intel.com>
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
TO: Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>

tree:   https://github.com/cornelisnetworks/linux.git for-upstream_20260309-1128
head:   d191c7a412f62e5ccc4db69ec6667382ee2ce9c4
commit: 881a273c267f689d40465e5a1006a24f530c2f92 [16/31] RDMA/hfi2: Add initialization and firmware support
:::::: branch date: 59 minutes ago
:::::: commit date: 59 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260309/202603092131.gL1LenYG-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'device'
#551: FILE: drivers/infiniband/hw/hfi2/affinity.c:520:
+		 * evenly among devices, then the first device device to be

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
