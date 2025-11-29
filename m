Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0926224AF7
	for <oe-kbuild@lists.linux.dev>; Sat, 29 Nov 2025 04:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764391386; cv=none; b=oFRG163AgztzOKLO5tYZ9LMgctjxtTG5dfQndR1kXpoTrx7fEvXTSN9+EqouR886jLSLnxCu8rSVjoS0ZJgqBnAgL7Z78HDOV9QmLNCIhYzwp0sV5zVwlpCBybmGyMEmhh8WJL10s0owCrJKkP2oQ9cc3H5eDT1iHD8odDL1hRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764391386; c=relaxed/simple;
	bh=sEbUyMreK/3hvPLPepLPrh75+vmJhLMfoWJJTRDafx4=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QzBZSupVCOmlVEOX7eQKj5Z0uUxfnMr2bx6aFaqWhNdw2XMW258N5WCf9CpMShdPy7f5S6EE6fzrRglQJUpCyXzJ/fu0Cv8pZX3ZNmB1s9vWQvGIYHV5N8Ag706rCONhrdZ4UjOiz7YP+4nx0nRzLqRvPKrYBUKSGSVwbbJ1Y4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bA9osxo+; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bA9osxo+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764391385; x=1795927385;
  h=date:from:to:subject:message-id:mime-version;
  bh=sEbUyMreK/3hvPLPepLPrh75+vmJhLMfoWJJTRDafx4=;
  b=bA9osxo+r2TjmP+xEc5LMuzSYPHKW1oFLQnq5hMKpppSbIKngVefcUI3
   pmr/mUGOKwVAASSVlYuTVOfO1XA6JOqpNlqkABFQ9x8zUTbZRy9ja/TLH
   A5oYVL33kHnbnUiRfHna7G1xipAS1TsUpVxDJRM2RN4Ebh1ljckyniMZB
   5+E/qmKPVcFV4I+DGywcLwvCiR/uzCW7LGtYzIfCKShU51NDk9nB9zc5z
   FQc+my2Cw4ny7LA0UzM7u1FNPuhR6OqTHsnLNFMWPohBGaHuMQ7eZg//h
   prQNtHRbPSMgy98in7IF78R3hEXIujQJWkW30isOKb6DWk2CmLIOq10s9
   g==;
X-CSE-ConnectionGUID: g/uWy4PIT/Ci1DoxEacVJw==
X-CSE-MsgGUID: 9Sjiz2WzTJi9ipDTf7d4JQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11627"; a="66572353"
X-IronPort-AV: E=Sophos;i="6.20,235,1758610800"; 
   d="scan'208";a="66572353"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2025 20:43:05 -0800
X-CSE-ConnectionGUID: 3LgBTBDySneqrpY/6AJFeg==
X-CSE-MsgGUID: 50ztd7yCSDGo6FSsH3iYMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,235,1758610800"; 
   d="scan'208";a="230870679"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 28 Nov 2025 20:43:03 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vPCnV-000000002Dp-1wKP
	for oe-kbuild@lists.linux.dev;
	Sat, 29 Nov 2025 04:43:01 +0000
Date: Sat, 29 Nov 2025 05:42:56 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [tytso-ext4:dev 2/61] checkpatch: ERROR:POINTER_LOCATION: "foo *
 bar" should be "foo *bar"
Message-ID: <202511290531.GFXmt0Yb-lkp@intel.com>
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
TO: Ranganath V N <vnranganath.20@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git dev
head:   1e366d0888665fb29ade62a44bbbceaa67ba4de4
commit: 6640d552185f7c11235c64a832004db9af119b2d [2/61] fs: ext4: fix uninitialized symbols
:::::: branch date: 67 minutes ago
:::::: commit date: 3 weeks ago
reproduce: (https://download.01.org/0day-ci/archive/20251129/202511290531.GFXmt0Yb-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#56: FILE: fs/ext4/namei.c:1821:
+	struct ext4_dir_entry_2 * de = NULL;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
