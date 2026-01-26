Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D253734029E
	for <oe-kbuild@lists.linux.dev>; Mon, 26 Jan 2026 15:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769442804; cv=none; b=Fvc0rR/31WMy43m+MW9oq/CFw1OFXtDQEw2ZYAX/OjF/TTLTVeftcGTkCY5xQuZCj22inTaXXS6XOvbb9j7Fm1X9k1WIA4gx5MqHz2CezKkcEjMqgiJnzYssPAVgNE8kNy2+XzcZA9Heq1/nSVr8WZPrkELbhu5tuqOqVBW/htk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769442804; c=relaxed/simple;
	bh=DuG8uOxo7weMY/KYYlrQ4Ioqu0oDjfXNS5bc56JGseY=;
	h=Date:From:To:Subject:Message-ID; b=LUXMI1ftoTFmBvCLnrr1vvvnbctrXBrbxFtaLiz5omIG3Zz9ncQbnhO9wM7ph0mkJT9EgIbQ6J8gpBXO7J0oUg6njjKLZHqdllGXNH3zk62aRt1z53lyfSVdYO1x6Lb9wWVMjo56zIzs2aUtBBhMKJVQMPDX7DgZIhVlIMQMJNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W4phcHU5; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W4phcHU5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769442803; x=1800978803;
  h=date:from:to:subject:message-id;
  bh=DuG8uOxo7weMY/KYYlrQ4Ioqu0oDjfXNS5bc56JGseY=;
  b=W4phcHU5Dd4DA/c4eEbAoGm5nrTYtxzHQ4KLn+NWRnDZlAQIOgsUxbTg
   Jd6/bYj85JZzLBIU9A7sesQx3iOs2Hgb5ALThqntrCRuQW2QdnH1jjcFn
   XkEhGflJtBFl7XmdtX5jDDxIyJgghr+ikC2E8wbzHB8vl+saVKP0gRmK9
   Uchw6Jw48K9PyF/aZE6vaHoH6xNNPYBBQLgMxEYYi+PYSd0oA00rgYhQt
   VBgo1nSqMGFxmO5L3pdTY2CtoPUkwJwOd9nanlyM+VnZdlu3tnIXY42KI
   K+DedHqmwFH3X2UfiqNfcNq7ybK+XVG5V1llbait+Sau87EmRGMOKmbI4
   g==;
X-CSE-ConnectionGUID: O1wds18tRuCN4XeCcbgEKg==
X-CSE-MsgGUID: 0sYkeTcfQO+ZXU2FDXQ3Yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="70525432"
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="70525432"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 07:53:23 -0800
X-CSE-ConnectionGUID: zKNPiMkZTbC8SbhtosR+lw==
X-CSE-MsgGUID: 1eamUFcxREW7+o1By996MQ==
X-Ironport-Invalid-End-Of-Message: True
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="230659389"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 26 Jan 2026 07:53:22 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkOtz-000000001Yf-2lvx
	for oe-kbuild@lists.linux.dev;
	Mon, 26 Jan 2026 15:53:19 +0000
Date: Mon, 26 Jan 2026 16:52:39 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [dhowells-fs:keys-pqc 6/7] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'that'
Message-ID: <202601261618.KUsTUKIH-lkp@intel.com>
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
TO: David Howells <dhowells@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git keys-pqc
head:   c88b48e783bef6d2bf4f1effdadfa15c4c971f22
commit: bc69baad4a64fd535c89ca21fac17e17a7e314e2 [6/7] modsign: Enable ML-DSA module signing
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260126/202601261618.KUsTUKIH-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'that'
#13: 
applied that fix this[1], but it appears that that will only be available

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
