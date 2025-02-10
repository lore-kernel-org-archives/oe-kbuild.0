Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09642580D6
	for <oe-kbuild@lists.linux.dev>; Mon, 10 Feb 2025 16:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739205467; cv=none; b=UlUpt4mBkv1wPDj1lT0jYHKrO7Lkl9cgPzwgpldVMhceOobkfKGXmdivZHkH8godGp13kkACbd7OKNEk0cgOrHaZpX9p/I483zzyAj+ijzQ7K2pRlG1HAP/YIwG0yI32qKwe72baAGgs7sT6U+tCQne1dVhJjFrsaPXmoAjxgss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739205467; c=relaxed/simple;
	bh=ojP09vqv/Fy0b1gziieVnOz5DPUqYtF+e6Ztcx0F4aU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=muSYbKmnoXrk/Kcp1Dl0+xQVwbpyr+SLrvzt05LN/jKxUIPcXdQqdPc4tep5jIfX4ii/mZGhcWA4n9kV2JDzyvr8gDQ4xB45OQcA5KGr9H4UNOeK0bJiJjbB0Ry7UECc5YqCx5LHzlgmuXicpuDMAzQAqeW2nrg3vI7rJKvatTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bBXIsJyX; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bBXIsJyX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739205465; x=1770741465;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ojP09vqv/Fy0b1gziieVnOz5DPUqYtF+e6Ztcx0F4aU=;
  b=bBXIsJyX5xCAaHZ7bhX7IDMwJzzZgpKUj/C4Yv+KTB/t59h44h9/+cJN
   ly9SWRIB9dxEW7+s/sNyjA+Mg+gocEJxdKgteNMFJHPx6pTHGw9RZihP2
   AK6BPpzbqWYcIjCiD/4YygIHhrqP7rCKhxaWvEJgkMDPxS0XO9siiR6im
   DnCUkmKe/321kD6BlHDeQHR6pGQ1euK90DVnf0HadDjL8qmBZbX12Gpui
   COsfCAtUMwKvHeVxA/sID0FnPm2nFIgUpvHQHqMoSl1PwFzJcqxQLla6o
   4nBtqpHmRvPeAnpOfpiRY7gbU9BD1y6BBWGXOWiiRbjdITJXqtyI6eAjc
   Q==;
X-CSE-ConnectionGUID: h2tw+k/fQhyegpKKZbaEgg==
X-CSE-MsgGUID: 7b0IWubWQsSkVUT/Cwq+ZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="57208057"
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; 
   d="scan'208";a="57208057"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 08:37:45 -0800
X-CSE-ConnectionGUID: jW9q3dZnT5uOieoXBQXVDA==
X-CSE-MsgGUID: unn3h+gtTyCCLK42W5HEVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; 
   d="scan'208";a="112075905"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 10 Feb 2025 08:37:44 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thWn0-00133H-12;
	Mon, 10 Feb 2025 16:37:42 +0000
Date: Tue, 11 Feb 2025 00:37:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [chrome-os:chromeos-6.6 217/217]
 drivers/misc/mediatek/slbc/slbc_ipi.c: linux/module.h is included more than
 once.
Message-ID: <202502110040.tpQ9LgO4-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   b603fe68bcf1fd8aa46dd46190c53d641dce5cf0
commit: 506f6613f2e6836fd59eeab2456dcfb0a000954d [217/217] CHROMIUM: misc: mediatek: slc: Porting SLBC driver
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502110040.tpQ9LgO4-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/misc/mediatek/slbc/slbc_ipi.c: linux/module.h is included more than once.

vim +8 drivers/misc/mediatek/slbc/slbc_ipi.c

   > 8	#include <linux/module.h>
     9	#include <linux/of.h>
    10	#include <linux/of_address.h>
    11	
    12	#include <linux/scmi_protocol.h>
  > 13	#include <linux/module.h>
    14	#if IS_ENABLED(CONFIG_MTK_TINYSYS_SCMI)
    15	#include <tinysys-scmi.h>
    16	#endif /* CONFIG_MTK_TINYSYS_SCMI */
    17	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
