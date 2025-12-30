Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8772C1A2545
	for <oe-kbuild@lists.linux.dev>; Tue, 30 Dec 2025 14:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767104298; cv=none; b=SaSQAZIYVN0p4ofvg9jilzPWurMM5gGr61bIZ5pABDZr49VJshiGrtitf/odMsiRfvTcHAhloENNNQLOOEKu9b2K9TIs1bQiI+6pvHkuNYksm7erWLwcWBmklHLjhIYVJkiQJT526u4l4IsWWoIsPr2EZkdOKnHvdLR7YUFy/Dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767104298; c=relaxed/simple;
	bh=nZFO50AzOliw1/LERE1vWOP+zDYtVthS7gjtR7er8RA=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PkadyMeUlJ/hObrLNUoKb2koIFi5UDfk8jW+FBWCBdbZK7s7kDOGM0RvdqKLTElxUlLy6GhlYKhebaaGT1+PC/VmJ4JOrAgJg/ec/maHWoKFIysfnK53dH3vLZhfaBfzPTfnR/arBEoRRMBOCNiO0/HXrLB33dlW0RhjETDzWOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H9iK23kT; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H9iK23kT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767104296; x=1798640296;
  h=date:from:to:subject:message-id:mime-version;
  bh=nZFO50AzOliw1/LERE1vWOP+zDYtVthS7gjtR7er8RA=;
  b=H9iK23kTKRcgcj/O2RLcTiByUAUJjJFPSx7kg1SejsLlzJPXKIM8nCVK
   AnSyheD+s+coHOcryE85wUX3G694k6NTbxG0oAJYf2+r9wLQA7JMn9Pcv
   OK9R9glgMXDCHev7XKBWFJgpN2n+oRcTb3xsUtMdX+LKuidxpA/GFRwmj
   4DBsjxsBhwdFezwH0Z5452NGp5L8ce4mjGEoQa0BqSRgUbfJ6MsZLPESR
   BBS/x1ZERbw/hib3nkQ2ased0ScMi46XR3tszdDPmYuVx1whnRL1fRGFf
   9vawW+Bpmk8qEwutkWQNTouqUBrtawSoiQQvzJebDQiGSTb2qnI+FdZ83
   A==;
X-CSE-ConnectionGUID: JhgwtRnfT4msbNbRUxJ5NQ==
X-CSE-MsgGUID: 4yIpa6ywRn+IsA+MCoMJ5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="78996397"
X-IronPort-AV: E=Sophos;i="6.21,189,1763452800"; 
   d="scan'208";a="78996397"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 06:18:14 -0800
X-CSE-ConnectionGUID: lc97deBsRZq/tiC3xgntcw==
X-CSE-MsgGUID: x8jdf70DT0KpdmPqw54Ylw==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 30 Dec 2025 06:18:13 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vaaY7-000000007xU-23My
	for oe-kbuild@lists.linux.dev;
	Tue, 30 Dec 2025 14:18:11 +0000
Date: Tue, 30 Dec 2025 15:17:45 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [linux-review:Sakari-Ailus/media-ipu6-Ensure-stream_mutex-is-acquired-when-dealing-with-node-list/20251230-211308
 5/13] checkpatch: WARNING:REPEATED_WORD: Possible repeated word: 'starting'
Message-ID: <202512301519.IFg8xltf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Sakari Ailus <sakari.ailus@linux.intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Sakari-Ailus/media-ipu6-Ensure-stream_mutex-is-acquired-when-dealing-with-node-list/20251230-211308
head:   5f71ccb5cf22db23d34348b70339e456fde502f3
commit: 5a80e6e0e815ad8a4a2ec22e65da69be81ff92dc [5/13] media: ipu6: Remove redundant streaming start via buffer queueing
:::::: branch date: 63 minutes ago
:::::: commit date: 63 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20251230/202512301519.IFg8xltf-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'starting'
#8: 
started. Remove support for starting starting streaming via the

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
