Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76489288AD
	for <oe-kbuild@lists.linux.dev>; Sat,  7 Feb 2026 03:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770436680; cv=none; b=I/ZaLRlE/hriQXr5BOOPCAbGFedEFeNjzll41FAlKVGXhzDD45Heaty9RkG8EkhmIhA3OVayi/UVnEWoAs9sKaWjirVer4scJA55dE7A2neyrnpUD4x/A4Iw7KXz1CNKvFm7Xu3ea6i1vbnsg9a97ueOf8jQ9KwqYqP/z+wSRJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770436680; c=relaxed/simple;
	bh=w4UTUup/AaPUfYWn84SghH4U5tnMZa6vwnaTExWLBs4=;
	h=Date:From:To:Subject:Message-ID; b=YvIGsRviBlVymSw1zBOMfsO9gJM8YIPaQvvcR02TzsJo402+fhZmw+du4rOVC3pMZ6iUxDZeo71WkAhXpTITYUSnKlT8IaFQS4PK8bYP59jg56CQR/jF8n08CU/wqDE1f/4FsIGrZf0f/YIs7i3FrU7JzeP/gCLR112R4jmTHLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RrseVfbM; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RrseVfbM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770436680; x=1801972680;
  h=date:from:to:subject:message-id;
  bh=w4UTUup/AaPUfYWn84SghH4U5tnMZa6vwnaTExWLBs4=;
  b=RrseVfbMsHRSofZMszc4SLjj+vyxsVvHWrXf3bOafsQDrewcemeW+miY
   5WcV4gW1vSost1AkHw/13r/sTlx1AVtNHRKsrC1IRnzAw1P8cspBYtYCl
   Dv5P4O1oSAnOhM/6MbDbq9xjehjnkSjNFY3MH1YLyvBzcS63659NteORE
   Ks6EgMhT04JkfmvK7vqS24qPhjTw7dgYsUXOl2AFgXwVh8l1H1JnoeDY+
   pZsTKfSITa1ZewRL8eo5S0DJgJE6sYDYz3UrfgAGSoeQ7SQABsl7PHgaB
   HWmiZ8h+zDb1F0fCrCQveM3f9byzgDfu2Rb+m3Cp2Bxh13lwngtvr34pQ
   Q==;
X-CSE-ConnectionGUID: u+qH0IPPS36NnA6+cLM4yQ==
X-CSE-MsgGUID: ab+OKjUNSfqVcoIau0NNWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="71680128"
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="71680128"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 19:57:59 -0800
X-CSE-ConnectionGUID: pttPfK+xTb6+LrXQa3EUSQ==
X-CSE-MsgGUID: 4Q1Wqc0YSZC7qHSagB/fsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="210139469"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 06 Feb 2026 19:57:58 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1voZSG-000000004rx-0x8b
	for oe-kbuild@lists.linux.dev;
	Sat, 07 Feb 2026 03:57:56 +0000
Date: Sat, 07 Feb 2026 04:57:32 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [bcachefs:bcachefs-testing 356/357] checkpatch:
 WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
Message-ID: <202602070412.E8lyXykg-lkp@intel.com>
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
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   3b92f378d54e9afeb6a8b37d28ca8ce5f8af39eb
commit: eefb04ce35c38717ccc03874a1186606874b77e9 [356/357] bcachefs: do_reconcile_stripe()
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260207/202602070412.E8lyXykg-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
#94: FILE: fs/bcachefs/data/reconcile/work.c:562:
+	s = bkey_i_to_s_c_stripe(stack_k.k);;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
