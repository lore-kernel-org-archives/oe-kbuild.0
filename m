Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646281DF27F
	for <oe-kbuild@lists.linux.dev>; Fri, 27 Feb 2026 01:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772155648; cv=none; b=CEqKTaCOZag7pptWoMe20/8XP88GrceN+4JXY7i/npwdVYgxSjDnFBVXluwxZ5qLISQh2lOoWffG9q9IGWsyqydT+pTR7CvG0A2I9IBx4BlThddf6ykrrsC0fkc3knhLIDgDseW8v6L9cexAZL6IU9DAjzYpr4sd/WhIsNy114Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772155648; c=relaxed/simple;
	bh=/cH77C+Sg//camEezsgpWTmOazmr4wS7GXfRy6Wzu3k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=B3NivYZxx+Sv1QLU6V+s9FUgf0jIPmYcYRhNGJxGXWCgXAey3XJnYhkoO1CZNyl7WYj3yXcJOv4JUUXymvcTIpdbHRyTyDM4lq603tvwWBQx/gsxmzSKwVUHw4AH7zL9hlEXTdboXTdmfLbrHYkF3Srfz38PsOW3dowDWh/Z0NA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J9zD2sNZ; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J9zD2sNZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772155646; x=1803691646;
  h=date:from:to:cc:subject:message-id;
  bh=/cH77C+Sg//camEezsgpWTmOazmr4wS7GXfRy6Wzu3k=;
  b=J9zD2sNZ61RCmnenbDQ9HHRbFe5Cfz9eRyR0rNWF0xA/sE0e5EiNN5Kt
   rIVMdML40M05uYGnzx9zjp7aEjzgSHYExt2acDwhGeelZNHxIbBvcXClE
   vry+a7/Xm8uOaJj/TvRN5y/RfaGWmDs1kPSIustEKRPpF+bGpbN9nqwMS
   Nu+Q/mpgL3RtTT3yF3re3X17l3ImkjX1zyd92wwQ+lNF8IiAnPv+8c3GI
   6MwSotAT0Ta3NcbyxX6vi1YXY/Z2ZzC0+aaD4vIPNpJ23i+ToJ6HJMws/
   1lOwYf7Jn4QM8JgBujN8b2l/n8VB2af1e1s9cni8BT/UUNK/KZ31z14FB
   Q==;
X-CSE-ConnectionGUID: cHWj2rKnQgSuF45WJJ0Wpg==
X-CSE-MsgGUID: Qee3Wy8uSK2qc3e+16SBnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="72266805"
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; 
   d="scan'208";a="72266805"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 17:27:25 -0800
X-CSE-ConnectionGUID: 3KGSFCkESPedlAhXSdqUtA==
X-CSE-MsgGUID: MHnmemvbRBup/m3mQV+Hsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; 
   d="scan'208";a="247269212"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 26 Feb 2026 17:27:24 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvmdV-000000000QF-295D;
	Fri, 27 Feb 2026 01:27:21 +0000
Date: Fri, 27 Feb 2026 02:26:57 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android14-kiwi-6.1 110/110]
 aarch64/vgic_init.c:9:10: fatal error: linux/bitfield.h: No such file or
 directory
Message-ID: <202602270211.NedYSeUS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   8daf5694de38cda74d36b34a8eb8d82ff0392aa5
commit: ce4e200f37db517831723e352e75df6156abf757 [110/110] KVM: selftests: Add test for uaccesses to non-existent vgic-v2 CPUIF
:::::: branch date: 2 days ago
:::::: commit date: 1 year, 9 months ago
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260227/202602270211.NedYSeUS-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260227/202602270211.NedYSeUS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602270211.NedYSeUS-lkp@intel.com/

All errors (new ones prefixed by >>):

>> aarch64/vgic_init.c:9:10: fatal error: linux/bitfield.h: No such file or directory
       9 | #include <linux/bitfield.h>
         |          ^~~~~~~~~~~~~~~~~~
   compilation terminated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
