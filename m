Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA733AFAE2
	for <oe-kbuild@lists.linux.dev>; Wed, 30 Sep 2026 20:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790801690; cv=none; b=CTXd1Y+F72ob5w0V0KXUZaU3OP0xL72Jn8uAOmwYGrviENGcbRk0Q3EN2zOSXAd+UmTagH7tVqAELBSwmyV3cs1Nz3kvPhB/dYTOfd45sj/Bdgm9i8DZecKEmf7XrfiyDw3RioNQvYbmOo+Jele7gDxjiK3d/bw90Vh3BW4zqz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790801690; c=relaxed/simple;
	bh=Oilq+WI3C4G9bORmU6GbBBogtahmEVSIE4srTDi6lx4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Yngtz9ayJGw/rDZ6qs9/jK8KJNxQ0HKQwTABLxx4AybijcgzLEQRETcjR+++E1u3aCqdVGCmjdjszEFW2yR+etwhbO4AhOKTGZZXVWtRRSkwDY3hneT6LbRB1W2cqB9UmqBfGOiNSSdxP7jgFXe3ZNdYWTL7u3RnUcqvGmue8/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AIWVB+cW; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AIWVB+cW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790801687; x=1822337687;
  h=date:from:to:cc:subject:message-id;
  bh=Oilq+WI3C4G9bORmU6GbBBogtahmEVSIE4srTDi6lx4=;
  b=AIWVB+cWwvk0YeheUwT1abbjWrQS+syOPYgvvDSSQfL5aEyNswXUode9
   EcBY/UC2OxxEO2Bsly/Viia1vxTonxIzIBjIs0/ui+5zqOG+F5sOgQAov
   LULzFh7m3iRnkPQEL2eaqYjhqVw355mJLYGFhVGFxdBgFMQD4JPyuyXTA
   7e0xUXuufdgqOGT8G9VDsXGab+ApPjQx5A6Bfo1izjUPS/q+Xh8ZtkC3A
   3f96bUq5T8j+maSPljuRCbNOTDZhXTA3TmhPfUbpxBSfLnjWyE6eBOLlU
   rZ2LDOHiGH7Q5bgWHXcfBNMokydzg1JoncRx2E8SzcM5fHHz7iWcF9f7S
   g==;
X-CSE-ConnectionGUID: VwcHyCkKRnaWCfy2BkbgAA==
X-CSE-MsgGUID: rtg/sUPpT8WmM7H55DUPDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="90682377"
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; 
   d="scan'208";a="90682377"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 13:54:47 -0700
X-CSE-ConnectionGUID: JfIQa9duQ1CMd1w1VhiZGA==
X-CSE-MsgGUID: UHdl6+T4Qiue/hkkPJTzAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; 
   d="scan'208";a="279006513"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 30 Sep 2026 13:54:46 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xC1K7-000000001zn-49wx;
	Wed, 30 Sep 2026 20:54:43 +0000
Date: Wed, 30 Sep 2026 22:54:04 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jpirko-mlxsw:wip_attestation_pre_rfc_draft1 17/26]
 ctlv_tlv.h:239:9: warning: 'len' is used uninitialized
Message-ID: <202609302209.gQo2cqOa-lkp@intel.com>
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
TO: Jiri Pirko <jiri@nvidia.com>

tree:   https://github.com/jpirko/linux_mlxsw wip_attestation_pre_rfc_draft1
head:   a18af4e1b514bf11f88ca42d29b7b68f3b375378
commit: 632e6dd46feb3a874a82d83535f9e3fd973231b3 [17/26] selftests/ctlv: Add the wire-format selftests
:::::: branch date: 26 hours ago
:::::: commit date: 5 days ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260930/202609302209.gQo2cqOa-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260930/202609302209.gQo2cqOa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609302209.gQo2cqOa-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from ctlv_compat32.c:19:
   ctlv_tlv.h: In function 'ctlv_rd_u64':
>> ctlv_tlv.h:239:9: warning: 'len' is used uninitialized [-Wuninitialized]
     239 |         memcpy(&value, ctlv_rd_payload(attr, &len),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     240 |                len < sizeof(value) ? len : sizeof(value));
         |                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   ctlv_tlv.h:237:15: note: 'len' declared here
     237 |         __u32 len;
         |               ^~~

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
