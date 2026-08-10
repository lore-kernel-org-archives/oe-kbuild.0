Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B5E1A38F9
	for <oe-kbuild@lists.linux.dev>; Mon, 10 Aug 2026 19:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786391269; cv=none; b=qwuaC1FgQpJpqzzkfoO8DIF5mZyy6KVPA4nuWuaxlcLvIb9ElI16gLKzzfoQ9hBAMv+Ncj786XD2iRiNbMYV5eqARlQw/oJ6QzFfXoRX1YauxycxEl+LElQZJ37k+S2OwAaW4X4/k6fDzFhgYpA9JlecgGzBavwyGf9R2Vv9Qjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786391269; c=relaxed/simple;
	bh=OSGOYOC6mbBeZgyL0ggtIcp0JblZinmZc7Ok6WsCHx0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nFLj9F3KPqN4fHnRlTIlZSdqHXVG5TggYhw6S8BtaM+1nR8Kv87YQbpI3ud/zcHzMjPXFj+KZvn6gwkEr5XI8aOzWOAL9hsP86UwMsb95svUwRn45EyNuHB1riWePm09KGFhIeKGtl9xR0AwQ34wdhaBnoUMdV42cYvyS9qZHrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CS3CYE4N; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CS3CYE4N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786391266; x=1817927266;
  h=date:from:to:cc:subject:message-id;
  bh=OSGOYOC6mbBeZgyL0ggtIcp0JblZinmZc7Ok6WsCHx0=;
  b=CS3CYE4NIhszEom7nRevf+xvplC25qnecuQZSKNiB7fEPGZglpkXuZLO
   MhG7Gba4v650VRtlKQF4FfjnPMzyd/yfLoVdYDg8Wma4vobefgq6DFmCJ
   YUHi0Q9mnvZ2dRUXFXfKHAcMlPUDHW1HbeIoCdwmn5oGmG6SSjyGn7ZA7
   WeBANs7aKYkHZtoKvnzGTV1DmofIg+r//L3RRWE3FewfcWzD79MYhvdz0
   ZD1mTFL13QXHG33IaQeJTZYEvlXUvtpzzTtkkmZ5D33C4x3RK1y3y/Wyx
   itPTcVlq+E7NlUYObfHxkNEug62QTWn/0tQjZYBMrOwf26HQU5YfRnTGo
   Q==;
X-CSE-ConnectionGUID: hq6hyz3zTSSaXo7RLDcb1A==
X-CSE-MsgGUID: UbRCjAjSTB+JUxQy4uVhxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="97267250"
X-IronPort-AV: E=Sophos;i="6.25,216,1779174000"; 
   d="scan'208";a="97267250"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 12:47:46 -0700
X-CSE-ConnectionGUID: 3l5+hKHER16RKVDAOeBOtA==
X-CSE-MsgGUID: yZqQpBVpR1mlK/JNP4RRtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,216,1779174000"; 
   d="scan'208";a="256900943"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 10 Aug 2026 12:47:44 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wtVyI-00000000Ngg-1kHB;
	Mon, 10 Aug 2026 19:47:42 +0000
Date: Tue, 11 Aug 2026 03:46:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Warning: drivers/pci/pcie/aer_cxl_vh.c:172 function
 parameter 'wd' not described in 'for_each_cxl_proto_err'
Message-ID: <202608110231.WOlEXVgp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Terry-Bowman/cxl-Device-protocol-AER-injection/20260810-215827, commit: 1af36d74a23c78f1be7749cf8cc46b6fd6413c82"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Terry Bowman <terry.bowman@amd.com>
CC: 0day robot <lkp@intel.com>

Hi Terry,

First bad commit (maybe != root cause):

tree:   https://github.com/intel-lab-lkp/linux/commits/Terry-Bowman/cxl-Device-protocol-AER-injection/20260810-215827
head:   303f2811cc56760bbbbad7eecedeea70c186b473
commit: 1af36d74a23c78f1be7749cf8cc46b6fd6413c82 PCI/AER: Introduce AER-CXL protocol error kfifo
date:   3 weeks ago
:::::: branch date: 5 hours ago
:::::: commit date: 3 weeks ago
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260811/202608110231.WOlEXVgp-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260811/202608110231.WOlEXVgp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608110231.WOlEXVgp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/pci/pcie/aer_cxl_vh.c:172 function parameter 'wd' not described in 'for_each_cxl_proto_err'
>> Warning: drivers/pci/pcie/aer_cxl_vh.c:172 function parameter 'fn' not described in 'for_each_cxl_proto_err'
>> Warning: drivers/pci/pcie/aer_cxl_vh.c:172 function parameter 'wd' not described in 'for_each_cxl_proto_err'
>> Warning: drivers/pci/pcie/aer_cxl_vh.c:172 function parameter 'fn' not described in 'for_each_cxl_proto_err'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
