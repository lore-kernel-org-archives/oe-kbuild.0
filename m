Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C831D2DC337
	for <oe-kbuild@lists.linux.dev>; Sat, 20 Dec 2025 01:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766195614; cv=none; b=rv0NF51SI8EcY1I2cpIHN7hZPOJ+78eArzzgDImAHwwHDaLeMyLNqS8iL33o3+UB1YKfYGWweX6LRResMbMSW2awvs53ngTRpW7BGi7DxDzA2UmFIRnLx50YinulBbY80g9NDBQRs5bZms3qBcZiP7v8FtdegLOZyBi5WJ8F40s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766195614; c=relaxed/simple;
	bh=10Q9KPEINCHKITR3ZfAC3aCAQ033tz7gto9si93nlP4=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=vFIgGvGub2uHLXuqo7uSEoq9Nf8tfYRJ5gkETptGYbYu6bA9h3Up9std8bMUIHKkORsCTXxyLkEs/Of0xAe316mxoWNQYS07RmIV88+6vNbC3go6XSebncXMV5pUvHpPu27nB4gfQRMqgtXn2X76S68klg+yCjygGdY4utTeLZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZaQXStwv; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZaQXStwv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766195613; x=1797731613;
  h=date:from:to:subject:message-id:mime-version;
  bh=10Q9KPEINCHKITR3ZfAC3aCAQ033tz7gto9si93nlP4=;
  b=ZaQXStwvTfu8JrTfxP/JsGl8r6IMA45DmpcuNagD2GxUX9m9aWMdPNty
   YVG2qcb7MLLNBotZf7L8zRR2sWGVnEwaNzatHYQ5pdVfs6QOBIExMHNTX
   v8QJhtac5p//X7FKvxBwGQcIaUY2JZh6awIYyGF9xbeDrxSKVL6JmcEy2
   rH2yOI/4PSyssCm7Zp46o+LsoJa7ZkCt5QF+vUbSY9Fly/wR/Et9sTphn
   mhHzX/QngB9D3ZAVLWLxPKdwXn//WgfvshTQYNXCuoY57reYYLz90c3UF
   mzw/kRI95wNnZfMrbD+HZQ67vQOVzhmQ7O11V1eNDUVhag43+zqTcANo0
   w==;
X-CSE-ConnectionGUID: fn9CqvHrTU2d6QuCkM9B+g==
X-CSE-MsgGUID: M4Fg7okiTFmaxcdLdsoYow==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="90817033"
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; 
   d="scan'208";a="90817033"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 17:53:33 -0800
X-CSE-ConnectionGUID: lo4FRi+xT7GZc/gDsYVsog==
X-CSE-MsgGUID: RJXvTGSBTsODpEvMNz5CiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; 
   d="scan'208";a="199242028"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 19 Dec 2025 17:53:31 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWm9x-000000004Re-21CP
	for oe-kbuild@lists.linux.dev;
	Sat, 20 Dec 2025 01:53:29 +0000
Date: Sat, 20 Dec 2025 02:53:26 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [arm-platforms:kvm-arm64/gicv5-full 46/82] checkpatch:
 WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
Message-ID: <202512200212.9zNwnDtu-lkp@intel.com>
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
TO: Sascha Bischoff <sascha.bischoff@arm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git kvm-arm64/gicv5-full
head:   1426b88096b597395df4c82f089b87c62bab45da
commit: ba7d6d89307574eead1961892a0b49528e58b89c [46/82] KVM: arm64: gic-v5: Make VPEs (non-)resident in vgic_load/put and req DBs
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251220/202512200212.9zNwnDtu-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#65: FILE: arch/arm64/kvm/vgic/vgic-v5.c:1157:
+		/*
+		* Find the virual running priority and use this to calculate the

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
