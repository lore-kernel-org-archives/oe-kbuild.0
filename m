Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38F736403A
	for <oe-kbuild@lists.linux.dev>; Fri,  3 Apr 2026 09:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775209541; cv=none; b=VTq8Z7nKJ+nMPFQfOLrEnwlrseaXBpNdx17C0jXmZMpoYxacx8jnh0/Q3inUFk7dtJS451nC5DChw6klXB98lp/Zja9Ag//xuDInS1QYnBqVsuxcNSLC4Vyjmth0qbPYPocVRVS7yrhiXBMqdbw+hFicEDrgbuLZ+GTaJELGZrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775209541; c=relaxed/simple;
	bh=HuQMLUx2JXx2Cx4mt+jkrXB3/n/S0pQ0sUmQur1Z3nU=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=TKMyShREDhVP4XMI8dJ7+bzk4qIgnu9Ehp1LoIZppos/7gVnXuMgdqzegZzIUAx5uR+fBT9BPnIDLChZ7p2ymBZnfWG6hUuSdrSjG/tzynW6rMFwvzxw2fMRLQraLLsF7Lu3FQIfIuQNEOlZjfqwSJSOILnYk7DglQzHVcXlE1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WnzQgqWe; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WnzQgqWe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775209538; x=1806745538;
  h=date:from:to:subject:message-id:mime-version;
  bh=HuQMLUx2JXx2Cx4mt+jkrXB3/n/S0pQ0sUmQur1Z3nU=;
  b=WnzQgqWeDVz/hOZIiq0A5hCWDAt8OQJEh5Hs5S7QhyUz0rdhVzvwMf0J
   eMJa4/28L5r1M4dCDngOgTFI1AuNMA7+66XgRy4Z4ozSFtW5sw4bmAdyd
   WwBIuvbiglrREfk/+AXeRu+brUG3f4fCG0NsqOwN/+yPZLzIKKymGTVmf
   2T6LFIXfCAN3b1pYxOA/d84tJp6HZhDEWQUBhQvK69CUtnN/rhsQI70qu
   D3x3EkgPEKQ/3KvpcnWggBqZnXHRH5hzILcQbY4/EWX7ysOOQSv5jMopx
   RZ3GO4CUgFAmhefi3csBFxutuWh9Lk3w1QdI5I8Od9FP1iQBa2irMhMGY
   w==;
X-CSE-ConnectionGUID: doIfpWKiRgSyxq81XSd6Fg==
X-CSE-MsgGUID: 5OrLpTdfQvm4LKuTh7Okbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="75445195"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="75445195"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 02:45:33 -0700
X-CSE-ConnectionGUID: Cc0nxDDqQHyijh2Or6Z5Ow==
X-CSE-MsgGUID: lLxvP26lQn63UBUtMvWpmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="228843841"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 03 Apr 2026 02:45:32 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8b5m-000000009Gf-1OXC
	for oe-kbuild@lists.linux.dev;
	Fri, 03 Apr 2026 09:45:30 +0000
Date: Fri, 03 Apr 2026 11:44:52 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: 
 =?us-ascii?Q?[linux-review:Josh-Hilke/KVM-selftests-Build-and-link-seflt?=
 =?us-ascii?Q?ests-vfio-lib-into-KVM-selftests/20260403-085610?= 3/15]
 checkpatch: WARNING:BAD_SIGN_OFF: Co-developed-by: should not be used to
 attribute nominal patch author 'Josh Hilke <jrhilke@google.com>'
Message-ID: <202604031108.ZUnQXu37-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Josh Hilke <jrhilke@google.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Josh-Hilke/KVM-selftests-Build-and-link-sefltests-vfio-lib-into-KVM-selftests/20260403-085610
head:   0ce00986ea2ea0e1048b22ff32b67c5cec65d2a3
commit: 8b4ccd48255b3d4f958620b3642030bc1f22cef0 [3/15] KVM: selftests: Add helper functions for IRQ testing
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260403/202604031108.ZUnQXu37-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BAD_SIGN_OFF: Co-developed-by: should not be used to attribute nominal patch author 'Josh Hilke <jrhilke@google.com>'
#12: 
Co-developed-by: Josh Hilke <jrhilke@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
