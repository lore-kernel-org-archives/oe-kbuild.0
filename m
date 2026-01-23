Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB442DCBFD
	for <oe-kbuild@lists.linux.dev>; Fri, 23 Jan 2026 20:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769200071; cv=none; b=RnksombEtBUliQjEoTOTJWf5iOxQJtHk85Mm0nVjGzTEtpx5Fp+g9lfd/l9oGmGVFggdCJDy7jZXqpHRrd21g2uR6HsdL1p33KbPssBBupARSzYrVEN/Wj/ThpyvKIeWS3TaJ41Gu+PH+iJorKkRRdR/xNrYbbJ+rGiLZvmJrUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769200071; c=relaxed/simple;
	bh=ZDrYTitguJNdKY+kU7e0jjWoxctqM4bWw4A2maFT5tk=;
	h=Date:From:To:Subject:Message-ID; b=a51APfKYX53TR7hNpNQwG+gRU+PgJ3C3Db230Y3bIM6NBR0JwzgJPXmrufVaaOTK8NZuM+HAnwmHQRGKXxFPt4GVJc3uCcwndhQc/imraN2lnR9UeqLWpwQtl/dCDTW+9pLOBMyEJGVzVQZ3ugqLkuN7dvB0rXzFjb4SwPflNxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nmV2wszW; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nmV2wszW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769200070; x=1800736070;
  h=date:from:to:subject:message-id;
  bh=ZDrYTitguJNdKY+kU7e0jjWoxctqM4bWw4A2maFT5tk=;
  b=nmV2wszWDZ58SOa+YT6WV1ohWYq8KPt4/9RDjE00aaOe82p9eqhd+PTf
   sjktyS6BBsb6b91eBkvkKmubCr5bwO4TOpdB87wHDps5EwC7kLBuPjrQd
   u69eR7nrN0CuQEQGW7rcFtZu1wcu/xkIhYqOyRm4WzKdpJ8YtIA1Gb1jh
   7zWuI3BUsBM6js4q04WAo8f0jwEmYlHE4fHlR/0/bKvosKq5lWTFCw0mF
   h9+z1nWnGDlg5grrWwdj27cVi1ECQRmBa4Mjk/HqHRSVEuMIzIQTLnVYz
   lX4CKRxlQVqE6i3k+pnZOIkx5MIv6Y2lq6dbFp65jGRtFWMSWhis7xv4g
   w==;
X-CSE-ConnectionGUID: ltth8V+CQRusktHvj0HIbQ==
X-CSE-MsgGUID: qd1GFGjKQe2KYnv/HJiYBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="81829124"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="81829124"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 12:27:50 -0800
X-CSE-ConnectionGUID: 6b1lArF4RW2XyF539qhHEQ==
X-CSE-MsgGUID: TPsgcFBLTJWon6ib2G0rog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="207156622"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 23 Jan 2026 12:27:49 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjNkw-000000000od-1KPz
	for oe-kbuild@lists.linux.dev;
	Fri, 23 Jan 2026 20:27:46 +0000
Date: Fri, 23 Jan 2026 21:27:02 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [lpieralisi:dev/gicv5-host-acpi-test-v3 2/33] checkpatch:
 WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
Message-ID: <202601232135.ggR80UAh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Lorenzo Pieralisi <lpieralisi@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lpieralisi/linux.git dev/gicv5-host-acpi-test-v3
head:   84f427465d36ed431494f6f69b46a80f5543bcfc
commit: 3d3cf2c58dac88b3a8bd61aadbde9f805ae523ee [2/33] ACPICA: Add support for the new ACPI Table: DTPR
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260123/202601232135.ggR80UAh-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#76: FILE: include/acpi/actbl1.h:2010:
+ * access fall within the TPRn defined region.
+*******************************************************************************/

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#97: FILE: include/acpi/actbl1.h:2031:
+ * transaction from changing the state of memory.
+*******************************************************************************/

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#117: FILE: include/acpi/actbl1.h:2051:
+ * (base / size).
+*******************************************************************************/

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
