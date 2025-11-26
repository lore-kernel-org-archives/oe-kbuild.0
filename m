Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C881335555
	for <oe-kbuild@lists.linux.dev>; Wed, 26 Nov 2025 20:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764187652; cv=none; b=G999N/ahfLyQ+accC+RT3mwz77yaP06ZfQYq1IXZbKW+ABILIln2+DkM9oniXGR7Z8eMRTa7+x1dAwh+x+KV7wqfTvfbmSGonHSHpyDVZ4KII1rTIL6z7mGRxCsruhB0tFpNPJjDtQ9gPsb9gPYp4kWGHALPKdjh3l3GR+641wM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764187652; c=relaxed/simple;
	bh=O1+CSmcUk0dT2+ufGGFvL2FEts5aBMY0IUyW3ooH4l0=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=inIbP3FsuzMwaWtL/9PVdcLmc0gg7dHgJddFZf53rEtX+asfq3sofGe/qaIYPTQpihOOQ/pDqkVXDQhgVKcIs7FwC8+/oGCrcvbXLVRD99GAe5QRYdCCokltXCxaVlNTgDeOMxoEPc8xDUnztYaEbqsx60AwvDrOjwIG6VBCGjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iKrcUQqX; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iKrcUQqX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764187652; x=1795723652;
  h=date:from:to:subject:message-id:mime-version;
  bh=O1+CSmcUk0dT2+ufGGFvL2FEts5aBMY0IUyW3ooH4l0=;
  b=iKrcUQqXOoiyOc3vEtdvDSRCw6MK+Zabug9XF+2TroDbQQY4BfBkKVK6
   8fx04IrJtZ9Mmt5+w+rOBZikoXasvYIytcPON59GLRHhybtKyKw0E9jo9
   VeG7FGhQS9Nuui08YAml1CC7S40JeE7O8xxTsMjDCvtcJ88VTLAkuCOOX
   7HrCPLdnYmoh9e0SZTvbJAZMi0FCBNh1Ov91aJvwtZGq+V0K1/2or1eEm
   E6MraSa1TPaaYAHdg8/CTJmCPDHgADT4cB9BfoWR7tfjEMFkxRjp7IbcB
   Bvmxptn+QfogFwP5BePCekidql8hZEtl+fdOTwmlhkOtpXek7eS1dpXuN
   Q==;
X-CSE-ConnectionGUID: 1k9TMJXZSeC9mNJvawD86g==
X-CSE-MsgGUID: EErbjYc6Si6dwn/1PqKIkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="65941598"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="65941598"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 12:07:30 -0800
X-CSE-ConnectionGUID: gKYrwWfUQPCozAVGdUNEPw==
X-CSE-MsgGUID: +DCxwECgT6CikoiOTas1SA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="197528165"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 26 Nov 2025 12:07:28 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOLnS-000000001Tr-0M0S
	for oe-kbuild@lists.linux.dev;
	Wed, 26 Nov 2025 20:07:26 +0000
Date: Wed, 26 Nov 2025 21:06:38 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [bcachefs:master 982/999] checkpatch:
 ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
Message-ID: <202511262110.Z1iPZltd-lkp@intel.com>
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
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://evilpiepirate.org/git/bcachefs.git master
head:   e336760f1aaba6ace6f898616fd9234c99fd82fd
commit: 8167c0826a59b28cd449fd683f3222a5f28c55f7 [982/999] bcachefs: blk_status_to_bch_err()
:::::: branch date: 5 hours ago
:::::: commit date: 2 days ago
reproduce: (https://download.01.org/0day-ci/archive/20251126/202511262110.Z1iPZltd-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#26: FILE: fs/bcachefs/errcode.c:80:
+	switch (err) {
[...]
+		default:		return BCH_ERR_BLK_STS_UNKNOWN;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
