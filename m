Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A693320CBE
	for <oe-kbuild@lists.linux.dev>; Tue,  3 Feb 2026 23:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770162716; cv=none; b=lVpkZWnlwODxh1tlXR6WsLsRccQ6mfY06sqVjSSCsS6NyPwUaTM9abSjsMxZNi6291le+YZpxTt1p5WgXQ67S0ihfoqwUrNS1cwKo76vXPhTwy0QgstSh66Z0m22vtFzqDVC6ZAusiGmPyoMaJjiD8qIgSEu2H+SjxLIZknbWgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770162716; c=relaxed/simple;
	bh=aOFZzt74TPoq7zvsT5bdhC2FOKDU6ACTuBI5kP4eAM0=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NVpWBs1SJkEvmaWWwrDA3SqR54QuGAgnAWLVmJAnnXVIjgQ3c0YO4CbFjU52iu6Y8j7SefT7p2/Ceb22FUZq3VYKamZWKlBkXVpUvyubFzA/KTJsKD94GqltkdjjX19GgcHkgctmFGu3lNEX2D7GfwjRHsD8nPZfK4Td7rqNZh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aekjsr0Q; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aekjsr0Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770162715; x=1801698715;
  h=date:from:to:subject:message-id:mime-version;
  bh=aOFZzt74TPoq7zvsT5bdhC2FOKDU6ACTuBI5kP4eAM0=;
  b=aekjsr0QjQKf+yC8uVeYwLFvgoaZqk3DgnvoZvZbyISQ/ZeB1RmBNas2
   9XAFuasq3YeAYCA5xlvgUynYdf8xdAflT42kq48Zkof/ESrsvMcIL0dcw
   qOGxL2y8Q8iJ1LspACA5BAecHSxsN18wfk7jzy9BHKfSvXw32vMteIoHm
   QGQvjey5/DAvOieJb7Q6uLRWmRz6Ccd4jVGaM9X8e1U9R6SD5gM9Ikhc+
   1PjI8ZdO5K7TVDygm/anp8xhODQB1BCZqN2fx/PCsVYPbMBexqVT0ok20
   CLKEZDuPoCnbL81MNJoOBUk/2uUYpNGgXUazP7Btwi0/ZkdVPQR29jjWy
   w==;
X-CSE-ConnectionGUID: jmEqQFKcSayhEf4+2VHW6w==
X-CSE-MsgGUID: iamHX6n2QY+mHcMWKjhXPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71243601"
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; 
   d="scan'208";a="71243601"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 15:51:54 -0800
X-CSE-ConnectionGUID: HW1eM9HbTuiTq+6Wt04rYQ==
X-CSE-MsgGUID: nYvFLRN/T1euT+9902lb7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; 
   d="scan'208";a="210075379"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 03 Feb 2026 15:51:55 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnQBT-000000003Un-32nN
	for oe-kbuild@lists.linux.dev;
	Tue, 03 Feb 2026 23:51:51 +0000
Date: Wed, 4 Feb 2026 00:51:42 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: Re: [PATCH 06/32] KVM: VMX: Implement the hooks for VMX guest
 virtual deadline timer
Message-ID: <202602040015.oFALwwED-lkp@intel.com>
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
In-Reply-To: <67503c138899e2f5ebb84d9c4a19c2fd632fb1e7.1770116050.git.isaku.yamahata@intel.com>
References: <67503c138899e2f5ebb84d9c4a19c2fd632fb1e7.1770116050.git.isaku.yamahata@intel.com>
TO: isaku.yamahata@intel.com
TO: kvm@vger.kernel.org

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 63804fed149a6750ffd28610c5c1c98cce6bd377]

url:    https://github.com/intel-lab-lkp/linux/commits/isaku-yamahata-intel-com/KVM-VMX-Detect-APIC-timer-virtualization-bit/20260204-023229
base:   63804fed149a6750ffd28610c5c1c98cce6bd377
patch link:    https://lore.kernel.org/r/67503c138899e2f5ebb84d9c4a19c2fd632fb1e7.1770116050.git.isaku.yamahata%40intel.com
patch subject: [PATCH 06/32] KVM: VMX: Implement the hooks for VMX guest virtual deadline timer
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260204/202602040015.oFALwwED-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BAD_SIGN_OFF: Co-developed-by: should not be used to attribute nominal patch author 'Yang Zhong <yang.zhong@linux.intel.com>'
#10: 
Co-developed-by: Yang Zhong <yang.zhong@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
