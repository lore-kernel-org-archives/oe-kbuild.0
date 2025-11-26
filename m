Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A182FF14F
	for <oe-kbuild@lists.linux.dev>; Wed, 26 Nov 2025 15:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764169282; cv=none; b=HUjoUDZb5f3KSGQoKIbnJfvOZdYdzd65c1EFRyk0cqcP8P2bw+iMKkSVdC7Y//hMagc9eKu4257NEcB3mHvwAyFH2RfT7dCaQZPduCynAtfd6c6BNOAenTWO6cpWJHQ2inTsuQUzitJo8/0RTq2uoh9bUOXDLvsHWps4y423eLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764169282; c=relaxed/simple;
	bh=YuN2BUsoovXDFhgrpFRtO9Iwt5eKRM/+/RbsruyLoIw=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JkoFR0MmfWZZ/H1MiSzVhGY2vPA2N3g0KBY3tDLypAxZQb3FU/l3UzyFqPhjgqzAzfk+XCmFjwFmL8kDXRo6HKVIrY9XG3zdT0Kvb4TDig7RCah09ioSmbi0gkSUZZh1EgvnQtbkSR3sFiqfrXat1gPo392N+Q8iSGHoa0PaKOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MaW6F8Ui; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MaW6F8Ui"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764169281; x=1795705281;
  h=date:from:to:subject:message-id:mime-version;
  bh=YuN2BUsoovXDFhgrpFRtO9Iwt5eKRM/+/RbsruyLoIw=;
  b=MaW6F8UiXV3pdNCbJAcwyyz7AWIV0k6xzl6lezilJRaSuwqKc5jguZWR
   WmFIqX7BS9fXFHSyyGwJd7/eKcpj1CdTHrwAT/nb1lKFwtkT3yj/Xxp3Z
   fkfNNfytG3UhLpXZ5Nt9jUQ9hB1jWyxAdBQ0l6Bnp6iF/MCL/8joM+hiK
   oOs3LChc8oZDC9jCLscd1POKiwoMD2vSm6dEbp1tvXJTssBHsfBQL+Nd/
   auWFvByUTh7/wpJkB++ZBYUG+SU2XSNBAgCnllz/E4QL7Ky2XLrdkEEmy
   bMV4rHcDe5cB+ZPxm8QhFrsHc/trUyS0W8XFoQbeauhq4h/NGFRTDXayX
   w==;
X-CSE-ConnectionGUID: PM9gQIH3QEOL9pnplDmYJQ==
X-CSE-MsgGUID: 8eeYWKPbRTGpXT1564NPjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="68799627"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="68799627"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 07:01:19 -0800
X-CSE-ConnectionGUID: QQFWr4anSsC5vH9NxiA53A==
X-CSE-MsgGUID: 5PHJ2J4hRnaemp7IufORcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="193057797"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 26 Nov 2025 07:01:18 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOH1A-000000001FS-2Pw1
	for oe-kbuild@lists.linux.dev;
	Wed, 26 Nov 2025 15:01:16 +0000
Date: Wed, 26 Nov 2025 16:00:31 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [djwong-xfs:iomap-fuse-prep 7/25] checkpatch: WARNING:SPACING: space
 prohibited between function name and open parenthesis '('
Message-ID: <202511261606.Oi9ZByys-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git iomap-fuse-prep
head:   dc427bc7b2db9a19cb1a7c2380e44fcda6314504
commit: 96ede068dd6653bbbfde791b4a3631d0236f0fb8 [7/25] xfs: start creating infrastructure for health monitoring
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251126/202511261606.Oi9ZByys-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:SPACING: space prohibited between function name and open parenthesis '('
#61: FILE: fs/xfs/libxfs/xfs_fs.h:1052:
+#define XFS_IOC_HEALTH_MONITOR	_IOW ('X', 68, struct xfs_health_monitor)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
