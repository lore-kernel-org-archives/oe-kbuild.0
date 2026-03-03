Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FAAB3AE18E
	for <oe-kbuild@lists.linux.dev>; Tue,  3 Mar 2026 14:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772547264; cv=none; b=dYwQ3/GW8BRL4w4kvrUWzdeLmsqExHLxAeK9w1DNzsDev80DvNyVodYGHmDE32eMV8P3PXU9H3tBwk7eUS4rzuqMao9GrDfkVpLKxOIhIvYKtZABBaenIdc/ATzrbnpuLmZV3pAp+2b1uEIKqVWVEN0VTQHXBIQZ5yt8rGKS2mE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772547264; c=relaxed/simple;
	bh=dhCuYma31npoicLxq98oqXvHwYythU5ELuUZQvFIMcA=;
	h=Date:From:To:Subject:Message-ID; b=nACJsLI8gCyYIzS+LCxbNwD8XSvpRVHFoI2Ox9WnxXHGDGNK/jBUCb5Toy/UWqD6eXKImFNebuO99naIMMokdgN267+hlO0bYgXLU8jYbrpI3SUaRL2Wt1QqJ4PhAlcWrq77OksNe8P3/o9HpvDEK+fMhLyBM80XQ1u2069Migw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iQ0FU5ul; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iQ0FU5ul"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772547259; x=1804083259;
  h=date:from:to:subject:message-id;
  bh=dhCuYma31npoicLxq98oqXvHwYythU5ELuUZQvFIMcA=;
  b=iQ0FU5ulwcQleXudZtWe/LkR44vYJvpmCEVgAxlFtpQXlOHL7FKgy213
   Bn7eqlneeCWk38ifeC4k5oTP6VA7HweqHrx6dRLrd/CujWJPMh6u7e8Lh
   rWAw7qQYulRGwQbUqwYKLNPQU3eiA/WwjSqBd/etZOvasc4kxUV2OjXmd
   z8qBOPz3UIYzWaR8is2w7ObFIzrqPNLN779w7j3cRfDcINEoYSSdfmzqD
   p45BLGu1EWsmCWHzbOTrJ6AO+gulj7DDtbPWDNsJ9zq8f/cmaK/ddY9Ox
   jUI04Gt6wajqlG9ALj6TWcjdio2GjhREgfQVS6GxKz0YI37sLlXrjbWoH
   w==;
X-CSE-ConnectionGUID: 1vCDfMFXTjiIxHe7bhISVg==
X-CSE-MsgGUID: BelZTly1RhK7zIXH1WL6Bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="77192685"
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; 
   d="scan'208";a="77192685"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2026 06:14:18 -0800
X-CSE-ConnectionGUID: wG2e538gTLGNv915j+V0+w==
X-CSE-MsgGUID: 86wC7HpnR6yNVSp/QifGMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; 
   d="scan'208";a="222667591"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 03 Mar 2026 06:14:18 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxQVr-000000001Td-3asE
	for oe-kbuild@lists.linux.dev;
	Tue, 03 Mar 2026 14:14:15 +0000
Date: Tue, 03 Mar 2026 15:14:10 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [dhowells-fs:netfs-next 10/17] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'the'
Message-ID: <202603031554.vYWGkiWZ-lkp@intel.com>
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
TO: David Howells <dhowells@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-next
head:   a957b0c5b2f63855a21c08331cf47b352fc6b789
commit: 73ed3045f12cc5c78991a0cae0040e2506e0b486 [10/17] netfs: Switch to using bvecq rather than folio_queue and rolling_buffer
:::::: branch date: 25 minutes ago
:::::: commit date: 3 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260303/202603031554.vYWGkiWZ-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'the'
#594: FILE: fs/netfs/direct_read.c:186:
+	 * Extract a buffer queue to represent as much of the the output buffer

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
