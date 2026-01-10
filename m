Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2021A2AEE1
	for <oe-kbuild@lists.linux.dev>; Sat, 10 Jan 2026 06:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768026875; cv=none; b=Jfo+T7iGNcVIULZKkdSS8CigZTnyzlxC2iclXXZlhitErDmsVs07Jex8KN5myvRY+l/+cQb7y9QXfJepaIVnSLW1X50vS5JeTSx0xTnApMBYrIEvCBqbXhTdzQVvsUUda5b/l7Q7cuqgbrUHxdyZEEKnO7irx2alS/FAJR27TGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768026875; c=relaxed/simple;
	bh=I0ZxTPdEdNZB/gnK6Dvlfw0MEdhH2k7MNXJkZFEXots=;
	h=Date:From:To:Subject:Message-ID; b=V9rNOPsVcbry8qU8L+UA97Pw4QnnwBKDkpwyG9d0/Lj4X1YSRDeD/3GHVJITfTQim0fHQYsdD1l6em++FQfB1bqEREmAVq2MMkPu37zyEKXahiGyd3tmWm1W/twfIuXOHN4wyXl1IbFR065z2KXduIqbOXU2T/vBhH4f3tma164=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yv4yNvaU; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yv4yNvaU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768026874; x=1799562874;
  h=date:from:to:subject:message-id;
  bh=I0ZxTPdEdNZB/gnK6Dvlfw0MEdhH2k7MNXJkZFEXots=;
  b=Yv4yNvaUn7baY7BenIlo/LdJsFxzeoTsIATjDTNZ9Z4faLHveiQxxmpE
   mshqsPjkP9QqjMdqnfjgm+k3wHVP4qjp2u1FcHhI1gsPmi+7D7FfoOtZc
   Fz/WxahcfdKtBAJoH6C2v3hX41kFUySRy0STfGlIr98y3lfV9Mr8HikHD
   e+mZYhl9he8R5ShUToVGuZA+wrFBYGBAAJwBjuJoRHenluNg8ipVjfyz0
   syxCTx370Zvv1Tj5/u9JR+jB7PmeWX2aZ0kNyUYve0h4CyJYWfFb8j7S1
   O8omrkrImXnL0GwGtdxVzyxJ05Fh8eiqEstsoPJLO+jVJRZK0hdVSLrUc
   A==;
X-CSE-ConnectionGUID: Pf8vMNZARjmN0kigyOKkCg==
X-CSE-MsgGUID: lRtPYO35R0KZdkaAc8K44w==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="86980145"
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="86980145"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 22:34:33 -0800
X-CSE-ConnectionGUID: bUQf3AYjT9K9gSkZOX6UGw==
X-CSE-MsgGUID: Ts1TRPAESLybYy6XCj0XvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="204410079"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 09 Jan 2026 22:34:32 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1veSYQ-000000002Ho-2TJo
	for oe-kbuild@lists.linux.dev;
	Sat, 10 Jan 2026 06:34:30 +0000
Date: Sat, 10 Jan 2026 07:33:31 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [asahilinux:bits/090-spi-hid 18/20] checkpatch:
 ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
Message-ID: <202601100717.muxgErel-lkp@intel.com>
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
TO: Hector Martin <marcan@marcan.st>

tree:   https://github.com/AsahiLinux/linux bits/090-spi-hid
head:   4398719b8c5fadb107fd2d4e44637d36a5d5ecc9
commit: 4cd171516f87ef265a1c930fb9630c96d74d3832 [18/20] HID: Add Apple DockChannel HID transport driver
:::::: branch date: 11 hours ago
:::::: commit date: 5 weeks ago
reproduce: (https://download.01.org/0day-ci/archive/20260110/202601100717.muxgErel-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#406: FILE: drivers/hid/dockchannel-hid/dockchannel-hid.c:319:
+	int report_id = *(u8*)data;

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#1152: FILE: drivers/hid/dockchannel-hid/dockchannel-hid.c:1065:
+	switch (hdr.channel) {
+		case DCHID_CHANNEL_CMD:
[...]
+		case DCHID_CHANNEL_REPORT:
[...]
+		default:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
