Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 194D726E6F0
	for <oe-kbuild@lists.linux.dev>; Thu, 27 Nov 2025 02:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764211178; cv=none; b=glbPG5HRfhgJ/tk/ghZBZ2R+lOedvAwYQ0Ndeht1bpJb0qL3w2QXKoFkQ2hZqMAbELrusIi428/B+KofOVtwy5T3aPxj97hEiWXbu4ohseWuXUsZP96gm8f2mfCJF9SWqZOaC34NcQgvOANz0TFHttTkQ2OPZkfIMdSoV6XtwZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764211178; c=relaxed/simple;
	bh=4isuaoQ9HJ1VHyI/ROcTYbzoYgKNSFGT9+v9WVRnDxs=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KRDLMLSt4GlrEfd1atKeFhTGLrGXOSjES1mztJyvlVri8E6P5k1Fe4N79q3usMw5iUUy9Sf8yz8Ew/WButKtOSDb3xnAEdXxEdYYwq4SnNju4GAYVaI8Uj6e/n+rTs9LtrYQzVv7ksxydhkVEuCHoWyoPYR7AwAoN8hNdcMiIQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eAUOaMfc; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eAUOaMfc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764211177; x=1795747177;
  h=date:from:to:subject:message-id:mime-version;
  bh=4isuaoQ9HJ1VHyI/ROcTYbzoYgKNSFGT9+v9WVRnDxs=;
  b=eAUOaMfcfCwJo5Y1DpSKafgUXAUOwYFASMP2pZ2Tb/BBt6LfKj/PFC/3
   RMODU+uqebUl8MHAbGDprvLy9gi42zi32yCo38qw7QGMAFFglpttNX2Pi
   OvrCYZdCgwPbX8Rrx0S8enBAwp6Ct7KoJgBYZUraU/H+KfknHqhhRsGlE
   84Nv0A7miQd3izanRUWD/DGaARTaQMtkD0aQLWeyXk1U52TFuspSiNAwL
   EVqEIb/NNN9z0LtZ/sChww9EOcmaAERS/u/xFbavGpWivYlUTVSLbEUGY
   I/PEvuPpYKztTD1AqSjoxPzz4cwjjWXI3kiTbwUyZQNZlPs1EhyX2vxWz
   g==;
X-CSE-ConnectionGUID: BeVJCQ3ZR5esVmMUWU0QFg==
X-CSE-MsgGUID: c2ybT8A+RoGUAKZqeF+EIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="66329603"
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; 
   d="scan'208";a="66329603"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 18:39:33 -0800
X-CSE-ConnectionGUID: zqQU7tyGQfmJqpL9Q6EVGQ==
X-CSE-MsgGUID: Z/81AHBYS3agVAuGflZSqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; 
   d="scan'208";a="224063402"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 26 Nov 2025 18:39:33 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vORut-000000001ah-0NaK
	for oe-kbuild@lists.linux.dev;
	Thu, 27 Nov 2025 02:39:31 +0000
Date: Thu, 27 Nov 2025 03:39:03 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [djwong-xfs:fuse-service-container 16/82] checkpatch:
 WARNING:SPACING: space prohibited between function name and open parenthesis
 '('
Message-ID: <202511270349.vlgPLVMu-lkp@intel.com>
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
TO: "Darrick J. Wong" <darrick.wong@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git fuse-service-container
head:   69ff58bd20a3f25ce91f1ff72a2063b65463142b
commit: 1d9cd9984b1a7898a978c8cf5270dd2470e40460 [16/82] xfs: add media error reporting ioctl
:::::: branch date: 34 minutes ago
:::::: commit date: 35 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20251127/202511270349.vlgPLVMu-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:SPACING: space prohibited between function name and open parenthesis '('
#75: FILE: fs/xfs/libxfs/xfs_fs.h:1222:
+				_IOW ('X', 70, struct xfs_media_error_report)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
