Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C71C340274
	for <oe-kbuild@lists.linux.dev>; Sat, 10 Jan 2026 06:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768026815; cv=none; b=uhldPOly6sFD1kZly5RbMIk2sA+fBrXw+xyuJSA+mTxG2161pHqvYpNxX0VcvfJtEiDDPMf1gBH47bLTQqYNXZIgBcHBJDOLK/nEOkh4Gmagc+6Ip55ts4N4p1yPOZyCkY9kBp6s5U/kpM13YwslFubyBvn25tZdwxsRcYZzVcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768026815; c=relaxed/simple;
	bh=ks3wqKnxFkmybvvntT9bmFjJzxgGLzSV0Fmrc3mpvIs=;
	h=Date:From:To:Subject:Message-ID; b=WPh4AtIh4A/1Y7GXCv0zaOIVuT3zPL3ARCzWul5qh3rOCAzR0lno2DbLwumybEOrB5fVzu9lGvDxU482RZWxHtLTkhGxVJXGQOIgMBmzrzq6CvLtoKvOzxVUjecShPyPtbsJBIfgulMCbgU60fVodPVPU/unzPaMBDuZsm9fH8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nVs2UNAd; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nVs2UNAd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768026814; x=1799562814;
  h=date:from:to:subject:message-id;
  bh=ks3wqKnxFkmybvvntT9bmFjJzxgGLzSV0Fmrc3mpvIs=;
  b=nVs2UNAd8q3Ucm1+iD0VigAUrwIi2XbVIpnCS5SkDPnIuU2medwmFig6
   42z+YaA1CHqHMXpZ+7vHA1VP+5TtqER45w/RdUHJ6aaNpTU9aqboYbwiy
   b+F13TaChU7URi9f7bgB6OofKHkQ4JoN9ACzZJlSB7JT4+hcklLgKDCBs
   DIu/CioXibAlbD25pmOSx7Jpze04AFuuirfxgM7gsWlVJLOYuStP0nsJ2
   zjOXCmnzIdC7d4lVmvL+8flyIf2F6WFcoQhp5QAzfSnW8iuGDVwup2W0g
   wNPiM3G2LHSuCA1NdwZcqKVrymRVE5QQLzu3Dq5qmOOaha3LSZV78cUC1
   A==;
X-CSE-ConnectionGUID: l8sK0aVhSOKfj+AsnAEfZQ==
X-CSE-MsgGUID: jiIz3ZbcRrqWGQZjixdyUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="73029369"
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="73029369"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 22:33:33 -0800
X-CSE-ConnectionGUID: bcOkKaCSTASbyLrJ0Q4GgQ==
X-CSE-MsgGUID: f3pmggTcQTuYnDazDdZC8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="203438922"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 09 Jan 2026 22:33:32 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1veSXS-000000002HW-1q9c
	for oe-kbuild@lists.linux.dev;
	Sat, 10 Jan 2026 06:33:30 +0000
Date: Sat, 10 Jan 2026 07:32:47 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [asahilinux:bits/090-spi-hid 16/20] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'are'
Message-ID: <202601100734.077zUoA7-lkp@intel.com>
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
TO: Janne Grunau <j@jannau.net>

tree:   https://github.com/AsahiLinux/linux bits/090-spi-hid
head:   4398719b8c5fadb107fd2d4e44637d36a5d5ecc9
commit: 0839f2c1f9bd15bcfc02938695b145cf5fba6d0e [16/20] WIP: HID: transport: spi: add Apple SPI transport
:::::: branch date: 11 hours ago
:::::: commit date: 5 weeks ago
reproduce: (https://download.01.org/0day-ci/archive/20260110/202601100734.077zUoA7-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'are'
#7: 
are are HID devices connected via SPI.

WARNING:REPEATED_WORD: Possible repeated word: 'report'
#333: FILE: drivers/hid/spi-hid/spi-hid-apple-core.c:212:
+ * report kbd:		0x20		0x01		0x10	0x01	0x00	input report
+ * report tp:		0x20		0x02		0x10	0x02	0x00	input report

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
