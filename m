Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9495C53370
	for <oe-kbuild@lists.linux.dev>; Fri, 12 Apr 2024 11:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712920786; cv=none; b=UfDPbEh49Gvn3pqtGxDjBwV3sNWAJMKaMkL4ASZt4/833dbIjM3EbM6EvzKyT1p2GjMHTQXqWoOTdrWv7auCQN+e/CdRMqllQGHUvJkLXx/1e9o7X0lCDNUivEjsoEwk1g3z084HMgEOrTAPNlsxbf/PrQHcdyyMhLCZ1SsUdfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712920786; c=relaxed/simple;
	bh=mzt7z2erwz9xXf+2coLMof0iBJoT/hP0kjC1/Xh7IRo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DWEqgXLGLNbnV4/Vn7Jpyk3EbTtqhQ+VhctxqY6bJfrBwiWxSsizTGm412/Ug1cFetIliC4hWJV1qKwvCumrUNKsSxpxb5wdG5SIXYLj5YBXUuVo+oBbfCtDT1xkKiD6v9I+yzsXnawESulUJdJR+KC4BejpS7MPuq0HXTeJSAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fW1mJxdy; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fW1mJxdy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712920785; x=1744456785;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mzt7z2erwz9xXf+2coLMof0iBJoT/hP0kjC1/Xh7IRo=;
  b=fW1mJxdy2sWlLiRpWt7613+zz1W7xkZLbJBXXn51clwWZb57H12ztfNM
   zRtHACPSIQXdUzbPZA7QkgR075p7NhaAq4LWOx0UpfZOfif0vfy/c5ZaY
   0uXo0hll2b2gj8QJywlvazFGQIcnAHAUqTgn7usI28uVYHv4mN7DAcjmE
   pyFbPdPZjWNJjfE4k5WMlMELtaq/GA7oHKvO0Y3reWF6CyR86kCnZcyy8
   SznMQroIP4aR7KHa9V80q0Wr+nW2PRbN7qourbTLZpeP0/QaH0Xt6e6OS
   3L/kF2B+gJLPfUYh66qCiOAWzH0746k2ZAza06NCfBDcCq4PfeOg0BX2n
   Q==;
X-CSE-ConnectionGUID: ij4g+HGjQkCdItfYvZWMjA==
X-CSE-MsgGUID: 1QlAAtDoQ5miPAr4VTWtzA==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="8590840"
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; 
   d="scan'208";a="8590840"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2024 04:19:44 -0700
X-CSE-ConnectionGUID: jrEoKOg6QduO+TjYK44tnQ==
X-CSE-MsgGUID: awAVIw6TRnKHL6we/se6/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; 
   d="scan'208";a="21247822"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 12 Apr 2024 04:19:43 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rvEwW-0009hu-1w;
	Fri, 12 Apr 2024 11:19:40 +0000
Date: Fri, 12 Apr 2024 19:19:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [char-misc:char-misc-next 11/26] vmbus_bufring.c:172:37: warning:
 taking address of packed member of 'struct vmbus_bufring' may result in an
 unaligned pointer value
Message-ID: <202404121913.GhtSoKbW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Saurabh Sengar <ssengar@linux.microsoft.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Long Li <longli@microsoft.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git char-misc-next
head:   dc806bd48abc1b8a4ae72709a37e65db42a32048
commit: 82b0945ce2c2d636d5e893ad50210875c929f257 [11/26] tools: hv: Add new fcopy application based on uio driver
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240412/202404121913.GhtSoKbW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202404121913.GhtSoKbW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmbus_bufring.c: In function 'vmbus_txbr_write':
>> vmbus_bufring.c:172:37: warning: taking address of packed member of 'struct vmbus_bufring' may result in an unaligned pointer value [-Waddress-of-packed-member]
     172 |         while (!rte_atomic32_cmpset(&vbr->windex, old_windex, next_windex))
         |                                     ^~~~~~~~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
