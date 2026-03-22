Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A8F184
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Mar 2026 21:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774216379; cv=none; b=gk1ADFFtU0+sEC7kA3YUblNJJa6qqi0OrQZn9H6EtZYdVPIe/qGjEEwoZgi2l/Kb36nUcnVKuBb9Yl+3OolyrYQiU6Ki8ZHUiQdaoiQ3fb7VjOqQJ8ccTbKujJeLHbwT/nrMQ61jdiTSUc4uXKI1ipXI6xX7Y5YF5KzqIxg7yCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774216379; c=relaxed/simple;
	bh=ZjwXgz7h1GfXXTynD/4bk/Sm1mV9L68yHeGCPz+JDvU=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HmkdLqxK24crUaWWie1Ly14FXjbL+RksQeZ/0CKY7XikxvBmLAaQXK6ewm8v21fbvQDyHnO4x8CD4QOVphMRHMv5jkXShIlP9DZTAh02HMgtMzutRSb20g8oKwYGl/TZG3yMR7U4LKHphQ2wnMeMkgtvUgRiLI28UXwTTv627SE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hol2jtfV; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hol2jtfV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774216377; x=1805752377;
  h=date:from:to:subject:message-id:mime-version;
  bh=ZjwXgz7h1GfXXTynD/4bk/Sm1mV9L68yHeGCPz+JDvU=;
  b=hol2jtfVoEgZuSmYH6CgnWI9voNPyIbZIu7XuF+Jq2tV6IgjgopbN0Km
   dEwgmvYqtdv/kEXeliLLF4XjnF/sRKicceBcNWfmvsu+y9Y1Pz9ysLSxU
   iOORU2OXKSA/CIrf3+OPqmtq7pOcZ7xSMiQHIhP0MVW6XRwqLHRIPNjDx
   VK+oDIEknRGmfKUxAUZq/POVHj9thnugJhChD3pF9IdTnIhHdscvZM8h/
   XiULvF1KfZ9sgL8eQDbYlYm9oCL6EGfqL3dR/n7/2JwpBaFaz5mVzXOBV
   N8vt6u6w6D2MvQ42HqCOU5LmpQDcFXydboW2kc0iHBppwIoRFhW3R7jU9
   w==;
X-CSE-ConnectionGUID: hxVDoqSYSeq0Zz6yq/E9mw==
X-CSE-MsgGUID: kSe7+21IQziQWpSihFvBPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="75189066"
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; 
   d="scan'208";a="75189066"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2026 14:52:56 -0700
X-CSE-ConnectionGUID: 9QfMSpyLRYWYoz8poIIJpg==
X-CSE-MsgGUID: XuEvivq1QeWAKLphJHcF4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; 
   d="scan'208";a="261752712"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 22 Mar 2026 14:52:55 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4Qj7-000000006SX-1hPc
	for oe-kbuild@lists.linux.dev;
	Sun, 22 Mar 2026 21:52:53 +0000
Date: Sun, 22 Mar 2026 22:52:03 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: Re: [PATCH wireless-next v4 01/14] wifi: cfg80211: restrict LMR
 feedback check to TB and non-TB ranging
Message-ID: <202603222200.S8OT5Hn7-lkp@intel.com>
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
In-Reply-To: <20260320175938.2547288-2-peddolla.reddy@oss.qualcomm.com>
References: <20260320175938.2547288-2-peddolla.reddy@oss.qualcomm.com>
TO: Peddolla Harshavardhan Reddy <peddolla.reddy@oss.qualcomm.com>
TO: johannes@sipsolutions.net

Hi Peddolla,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 9ac76f3d0bb2940db3a9684d596b9c8f301ef315]

url:    https://github.com/intel-lab-lkp/linux/commits/Peddolla-Harshavardhan-Reddy/wifi-cfg80211-restrict-LMR-feedback-check-to-TB-and-non-TB-ranging/20260322-182534
base:   9ac76f3d0bb2940db3a9684d596b9c8f301ef315
patch link:    https://lore.kernel.org/r/20260320175938.2547288-2-peddolla.reddy%40oss.qualcomm.com
patch subject: [PATCH wireless-next v4 01/14] wifi: cfg80211: restrict LMR feedback check to TB and non-TB ranging
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260322/202603222200.S8OT5Hn7-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'Kavita'
#15: 
Co-developed-by: Kavita Kavita <kavita.kavita@oss.qualcomm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
