Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBBF51372
	for <oe-kbuild@lists.linux.dev>; Mon,  3 Mar 2025 00:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740960473; cv=none; b=vBoSIs1ttSSsDjE01DDgYqPtvH0S/Mh/0ZppB76KzpDhkekDDZ0Ns8S/wmWf3B1hzcoqRb/EuQ8+GI2adg5PxETOa24cyGsy+FXJginXS1FRjy7rAaASlmFTzN52QZbEY5CWKyJEG/Jcj5uNkHkca71urcxEotnM+sVcFpiJU8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740960473; c=relaxed/simple;
	bh=Ik01Jfzwxa4X/KPF4eHbXWLHmcIWsIf/OQQH1p5Epus=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=i+//o9q60zPzYafhlJW2twjI62DRxvZHgio87UlFj6MN/K6gmWbopZSl/KUp74KKnqD0sPjmjFbXW1NklJ3NNq5zhnzLDYBj4cdJp7TQGFrBanLd8R+ZBtt+ywzAUvlPdsh2pzIZ7ioEttGdUGWqt7tdrylNuc4JnlbTspkEl6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R/CI2Gks; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R/CI2Gks"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740960471; x=1772496471;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ik01Jfzwxa4X/KPF4eHbXWLHmcIWsIf/OQQH1p5Epus=;
  b=R/CI2GkswmCc5hwRnu7OUFoMnCP3ucOaOczLjZzRCrtZJrHh88qvuuWZ
   oe7Tsr5hDkA8my5YajTVLMil1U6NHEM5NNKi18CqanlVr53v9DI9TGV2o
   ko2TNd0OPZ9hvZSCsazvyQgmnaLLSCuy9M3D2xCyfRObaST2HRdhszBos
   cakoJeq+o1c6KR4Qzf5GLAaW2o4tjwgLmg99nv0yF05tUqMIq5Vn95Ku6
   l7X+1WCywQB1JWSYsgXPjGsa56J9/C/cN6/TJYJrWWn/PWEMg5gL4tqll
   WGJ9nDmNYWmOb/W4VjjpjvixP43Fa7c7oq1Orwc5sxeXhr9vpMoa+whJA
   Q==;
X-CSE-ConnectionGUID: UnlOSWuxSxWHDIe1cMUxWw==
X-CSE-MsgGUID: RzfGFf50SwClG56lbMlt2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11361"; a="59368569"
X-IronPort-AV: E=Sophos;i="6.13,328,1732608000"; 
   d="scan'208";a="59368569"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2025 16:07:49 -0800
X-CSE-ConnectionGUID: RAZgR1L2SBa6sunRoI3VAQ==
X-CSE-MsgGUID: InhtoH5VRXCS6NOYBu7pRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="155034248"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 02 Mar 2025 16:07:47 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1totLV-000Hjv-1s;
	Mon, 03 Mar 2025 00:07:45 +0000
Date: Mon, 3 Mar 2025 08:07:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/md/dm-vdo/dedupe.c:2147:3-9: preceding lock on line 2137
Message-ID: <202503030750.HVz5oJyn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Mike Snitzer <snitzer@kernel.org>
CC: Matthew Sakai <msakai@redhat.com>

Hi Mike,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7eb172143d5508b4da468ed59ee857c6e5e01da6
commit: f36b1d3ba533d21b5b793623f05761b0297d114e dm vdo: use a proper Makefile for dm-vdo
date:   1 year ago
:::::: branch date: 4 hours ago
:::::: commit date: 1 year ago
config: x86_64-randconfig-103-20250302 (https://download.01.org/0day-ci/archive/20250303/202503030750.HVz5oJyn-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202503030750.HVz5oJyn-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/md/dm-vdo/dedupe.c:2147:3-9: preceding lock on line 2137

vim +2147 drivers/md/dm-vdo/dedupe.c

b0530561331c12 Matthew Sakai 2023-11-16  2115  
b0530561331c12 Matthew Sakai 2023-11-16  2116  static void open_index(struct hash_zones *zones)
b0530561331c12 Matthew Sakai 2023-11-16  2117  {
b0530561331c12 Matthew Sakai 2023-11-16  2118  	/* ASSERTION: We enter in IS_CLOSED state. */
b0530561331c12 Matthew Sakai 2023-11-16  2119  	int result;
b0530561331c12 Matthew Sakai 2023-11-16  2120  	bool create_flag = zones->create_flag;
b0530561331c12 Matthew Sakai 2023-11-16  2121  
b0530561331c12 Matthew Sakai 2023-11-16  2122  	zones->create_flag = false;
b0530561331c12 Matthew Sakai 2023-11-16  2123  	/*
b0530561331c12 Matthew Sakai 2023-11-16  2124  	 * Change the index state so that the it will be reported to the outside world as
b0530561331c12 Matthew Sakai 2023-11-16  2125  	 * "opening".
b0530561331c12 Matthew Sakai 2023-11-16  2126  	 */
b0530561331c12 Matthew Sakai 2023-11-16  2127  	zones->index_state = IS_CHANGING;
b0530561331c12 Matthew Sakai 2023-11-16  2128  	zones->error_flag = false;
b0530561331c12 Matthew Sakai 2023-11-16  2129  
b0530561331c12 Matthew Sakai 2023-11-16  2130  	/* Open the index session, while not holding the lock */
b0530561331c12 Matthew Sakai 2023-11-16  2131  	spin_unlock(&zones->lock);
b0530561331c12 Matthew Sakai 2023-11-16  2132  	result = uds_open_index(create_flag ? UDS_CREATE : UDS_LOAD,
b0530561331c12 Matthew Sakai 2023-11-16  2133  				&zones->parameters, zones->index_session);
b0530561331c12 Matthew Sakai 2023-11-16  2134  	if (result != UDS_SUCCESS)
b0530561331c12 Matthew Sakai 2023-11-16  2135  		uds_log_error_strerror(result, "Error opening index");
b0530561331c12 Matthew Sakai 2023-11-16  2136  
b0530561331c12 Matthew Sakai 2023-11-16 @2137  	spin_lock(&zones->lock);
b0530561331c12 Matthew Sakai 2023-11-16  2138  	if (!create_flag) {
b0530561331c12 Matthew Sakai 2023-11-16  2139  		switch (result) {
b0530561331c12 Matthew Sakai 2023-11-16  2140  		case -ENOENT:
b0530561331c12 Matthew Sakai 2023-11-16  2141  			/*
b0530561331c12 Matthew Sakai 2023-11-16  2142  			 * Either there is no index, or there is no way we can recover the index.
b0530561331c12 Matthew Sakai 2023-11-16  2143  			 * We will be called again and try to create a new index.
b0530561331c12 Matthew Sakai 2023-11-16  2144  			 */
b0530561331c12 Matthew Sakai 2023-11-16  2145  			zones->index_state = IS_CLOSED;
b0530561331c12 Matthew Sakai 2023-11-16  2146  			zones->create_flag = true;
b0530561331c12 Matthew Sakai 2023-11-16 @2147  			return;
b0530561331c12 Matthew Sakai 2023-11-16  2148  		default:
b0530561331c12 Matthew Sakai 2023-11-16  2149  			break;
b0530561331c12 Matthew Sakai 2023-11-16  2150  		}
b0530561331c12 Matthew Sakai 2023-11-16  2151  	}
b0530561331c12 Matthew Sakai 2023-11-16  2152  	if (result == UDS_SUCCESS) {
b0530561331c12 Matthew Sakai 2023-11-16  2153  		zones->index_state = IS_OPENED;
b0530561331c12 Matthew Sakai 2023-11-16  2154  	} else {
b0530561331c12 Matthew Sakai 2023-11-16  2155  		zones->index_state = IS_CLOSED;
b0530561331c12 Matthew Sakai 2023-11-16  2156  		zones->index_target = IS_CLOSED;
b0530561331c12 Matthew Sakai 2023-11-16  2157  		zones->error_flag = true;
b0530561331c12 Matthew Sakai 2023-11-16  2158  		spin_unlock(&zones->lock);
b0530561331c12 Matthew Sakai 2023-11-16  2159  		uds_log_info("Setting UDS index target state to error");
b0530561331c12 Matthew Sakai 2023-11-16  2160  		spin_lock(&zones->lock);
b0530561331c12 Matthew Sakai 2023-11-16  2161  	}
b0530561331c12 Matthew Sakai 2023-11-16  2162  	/*
b0530561331c12 Matthew Sakai 2023-11-16  2163  	 * ASSERTION: On success, we leave in IS_OPENED state.
b0530561331c12 Matthew Sakai 2023-11-16  2164  	 * ASSERTION: On failure, we leave in IS_CLOSED state.
b0530561331c12 Matthew Sakai 2023-11-16  2165  	 */
b0530561331c12 Matthew Sakai 2023-11-16  2166  }
b0530561331c12 Matthew Sakai 2023-11-16  2167  

:::::: The code at line 2147 was first introduced by commit
:::::: b0530561331c12dd6abf480e09e3deff84899bd1 dm vdo: add use of deduplication index in hash zones

:::::: TO: Matthew Sakai <msakai@redhat.com>
:::::: CC: Mike Snitzer <snitzer@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
