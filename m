Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3AD4212550
	for <oe-kbuild@lists.linux.dev>; Sun, 30 Nov 2025 06:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764485359; cv=none; b=FRFYlgZesB85kA7Lb/WvH41b91pnt06Y8lGYbOXuixE7/aiOjM1zB2HV3bJEMPFAExLKREl9UWFVIx/c1OLAICj3h/jzEdQ33TYq1X6Cq4sqMWlUKXmHC7NBv5OpeP1PPvtWm8+9QlI0X/bnfsrGIZesuGAlkl0Bibq8bxebcGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764485359; c=relaxed/simple;
	bh=F7LRuZV2ecN3ZWcCT7hA0mxeEChgP5qrUKFSGdqheVc=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R30nDkAZxtN5QtsHrMHJJbmuChtKYO31bVirM5e9g0C4EGEr1JNDimbDLecCrDhrj8U2KlhAFZlaXD77sN3pPkML0OcvDm6Bif9yYPYo3cpEci5j7NM+ESJz2amkWksPh4eYfjNScGhI2qjQblHvT+AUYsSTa/zghjXu81ttb1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HfEu10VW; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HfEu10VW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764485358; x=1796021358;
  h=date:from:to:subject:message-id:mime-version;
  bh=F7LRuZV2ecN3ZWcCT7hA0mxeEChgP5qrUKFSGdqheVc=;
  b=HfEu10VWGGSV3mKulsqYrQiGTprFmaJ7V6KdNFnKxznEmDlMBxjn1/+P
   hs2kcv2P48XV7EWA+8V6BpaeWsKarmkfZwxoM376IUsO8Y6lM6mNvWpMw
   brZ7Hx6qFZchVq9yW0wFMc+i89np+RpnHYTb6zR/Aob5lcKxpsKsmRVFb
   cH9iaQOn+hST8VW5vpfePSZdYpTVntbqzudp/a/MZnV3scNQr4PU7ZQGJ
   8hIGISoki6gdAfzQKpPqcPQo129gvBdUMB0bmtXXCROp9vuqpzhWgUQvf
   WfmeXn12UuZ9RABCzu/St+W5iQfJ263F7BYG7ydEkSqxDoi9hxf/N5mv9
   g==;
X-CSE-ConnectionGUID: Z5z34lxLQvKcVR5BOGUMnA==
X-CSE-MsgGUID: KAQrWGPOTaah4McBOS0CKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11628"; a="69037303"
X-IronPort-AV: E=Sophos;i="6.20,238,1758610800"; 
   d="scan'208";a="69037303"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2025 22:49:17 -0800
X-CSE-ConnectionGUID: VXrMFY2XS8m7plJ7djaFFQ==
X-CSE-MsgGUID: xx5bl9w5QkK71BWuHywQKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,238,1758610800"; 
   d="scan'208";a="194208455"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 29 Nov 2025 22:49:16 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vPbFC-000000002V7-2LaH
	for oe-kbuild@lists.linux.dev;
	Sun, 30 Nov 2025 06:49:14 +0000
Date: Sun, 30 Nov 2025 07:48:36 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [linux-review:Guanghui-Feng/PCI-Fix-PCIe-SBR-dev-link-wait-error/20251130-131958
 1/1] checkpatch: ERROR:SPACING: space required before the open parenthesis
 '('
Message-ID: <202511300716.zVRlt5K3-lkp@intel.com>
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
TO: Guanghui Feng <guanghuifeng@linux.alibaba.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Guanghui-Feng/PCI-Fix-PCIe-SBR-dev-link-wait-error/20251130-131958
head:   48dad6cc42d30e10259a377357382bcca865d897
commit: 48dad6cc42d30e10259a377357382bcca865d897 [1/1] PCI: Fix PCIe SBR dev/link wait error
:::::: branch date: 87 minutes ago
:::::: commit date: 87 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20251130/202511300716.zVRlt5K3-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SPACING: space required before the open parenthesis '('
#167: FILE: drivers/pci/pci.c:4796:
+		if(ret)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
