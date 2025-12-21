Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F2D1FF7B3
	for <oe-kbuild@lists.linux.dev>; Sun, 21 Dec 2025 16:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766333108; cv=none; b=ihAMeX923jE97fCRYoh8K8kW9c8xtkZ0MDBmuXCd0CIv7NiOFjwdlr3hmcEjpKb3Mta2SI/ZCYjU9/AOsDY8oghGZijNGILbtn6aH1xiaI/paXSGFrGQqghyx5g6FHuv9RiGMqqScqVUXYGKoJowNQqlvegjbhZorB2cECrpetU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766333108; c=relaxed/simple;
	bh=TT3tDsJ6RuKEzgBxjanlClNvFHWJdM5xUCyfbXcNi0g=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tSXpd6r1suKhrUz5m3uZv3CKSHb72i5AZY9i4QOyHMhK/oOLvLutrr0gthqIDgOUyivN7+wj+7m5P2AM77cvx1F6EGG/IvHKbCFWtAYqrlv77JqEJ4SKP9uPuNkkiaH5d2wWOGEa49hv2zQtpxXGonV/dFU+3d1MpHL/FmLjTEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YELfMuBE; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YELfMuBE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766333107; x=1797869107;
  h=date:from:to:subject:message-id:mime-version;
  bh=TT3tDsJ6RuKEzgBxjanlClNvFHWJdM5xUCyfbXcNi0g=;
  b=YELfMuBEBqQzyUsOLAgc66dc4VoSFDe7/PjHGCluS6fJyOkJhTp0n+lo
   /h2p1epen7Q8JYOZwtOmTT2UzIGvRSKpgwGDfLrN06v8RhqATY3vDHofw
   4wTM8+mHPvu7OCQ51dQ8nqbfoKao75KWJuqWQ4Z5Cmcazep/OKKkbUxUs
   B9QxkkL0RsgfTPX3YcK0NjgTZTY+euk9wqDAO9hMi5F0UVhPFHUuFrIzs
   k2mKvx5kZG94RUiGWmYAKq3+sdO0D7dwSsZ02g6tNr7iJRrroqBPb42zr
   z+df+nnlGw2Gwx9ryvttOT83qBt4vk1r1bSOcCkqo5Afzm3NYEmhWJl9D
   A==;
X-CSE-ConnectionGUID: ADI7TAYsR3+V/lbW/7cT4A==
X-CSE-MsgGUID: UbM/hkyERgGghkSsgq2Tww==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="78848463"
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="78848463"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 08:05:05 -0800
X-CSE-ConnectionGUID: sx1yw1/PQCyWbiNfw+lJ4w==
X-CSE-MsgGUID: Or2YpPgXSLanIjj0Pv4+PQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="199622209"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 21 Dec 2025 08:05:04 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXLva-000000005A4-0s0u
	for oe-kbuild@lists.linux.dev;
	Sun, 21 Dec 2025 16:05:02 +0000
Date: Sun, 21 Dec 2025 17:04:29 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [asahilinux:bits/000-devicetree 20/125] checkpatch:
 WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
Message-ID: <202512211716.veyRIJLs-lkp@intel.com>
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
TO: Janne Grunau <j@jannau.net>

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   4efff51e5abb86055ae7cd906a51f24d000b87fd
commit: 248b4c9da66059b05d624bcd68b58f98dcb7e88e [20/125] arm64: dts: apple: j31[46]: Add keyboard nodes
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251221/202512211716.veyRIJLs-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#34: FILE: arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:186:
+		 * best guess is they are cumulative.
+		*/

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
