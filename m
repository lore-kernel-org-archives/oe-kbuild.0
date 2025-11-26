Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437FE305E27
	for <oe-kbuild@lists.linux.dev>; Wed, 26 Nov 2025 15:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764169282; cv=none; b=ryCkF3w6a+/ev3ZV6X/RjOWP/ZzwQutboIAJbcFrUaRwhLDgBl0mKp0IIkVcpgiF3gtUQk+4VDhXp2TyHaWvGduEZJX4RU08dXZ8yfQjG5irkqRdWzcbic1E+jPqTgGNhJ/jadVAYTduw/7ZCaNj/BMXQcrkPAmVyD/EQG+YJ0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764169282; c=relaxed/simple;
	bh=hVHUMqdloEUfDEj9GafA5jRbUoiKUN4L+nHt9Hjdyl4=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WjpwWY5glS1uKe0ri17g6dzhlFTkVYTe5bwd3wUhvjTflV/oI6VR6up9VjfjH5urGN96xeg7En1sW5hYzln0KoMc5GEEnYyn/CvD43j80iLxjowp6w0ZJA5VLWpZOBJKSWrkd4oczyXvlTIFIgkJATseDu2I7dkKvZl9PF2dfME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nET5Z9ZF; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nET5Z9ZF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764169281; x=1795705281;
  h=date:from:to:subject:message-id:mime-version;
  bh=hVHUMqdloEUfDEj9GafA5jRbUoiKUN4L+nHt9Hjdyl4=;
  b=nET5Z9ZFHUQZIPGHsZdm3LdUHliiAnWfxjG1ASlAUCl5Qo6F7XzqNw8G
   GdJtgdwbDva1rvj8WlETIv6jfvp4IlKzgMnVtBpQcGGH7MWwpJmOVuW23
   mPhaXlsARuhc20dOXfN3VmVAVxqIg0N8oNXIIyGQROHWvgqcBnKjw+kHd
   NmEtk7eLZJzXVr9ONIUwYsavw0HiOaBNzkk99vgaR7lbxUfalQi1+YxdD
   svVv7sM2AQRPvCeHKFVGkcrtB/vge+x2reiSzi9NqZKhWRQ2WZ83b/kD9
   N2+oPXIfLo4lk60SVaZizE1KpwaVW86yFulQ5Gl1TX2aB4H45MhmCACmi
   g==;
X-CSE-ConnectionGUID: JXwZzvXLQLKjqZeuRg7qFg==
X-CSE-MsgGUID: EeCgcab3Ttmf79Ba4suzOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="76833440"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="76833440"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 07:01:19 -0800
X-CSE-ConnectionGUID: 4lr8cxbIQmWc6/yovV6//Q==
X-CSE-MsgGUID: cSswlXm3T1uxYXh5lvjblQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="216320619"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 26 Nov 2025 07:01:18 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOH1A-000000001FP-2EW5
	for oe-kbuild@lists.linux.dev;
	Wed, 26 Nov 2025 15:01:16 +0000
Date: Wed, 26 Nov 2025 16:01:13 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [djwong-xfs:iomap-fuse-prep 15/25] checkpatch: WARNING:SPACING:
 space prohibited between function name and open parenthesis '('
Message-ID: <202511261601.Q8oA24is-lkp@intel.com>
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
commit: f648fe9e849907e0e15becc4fc69204b3e1c4bbd [15/25] xfs: check if an open file is on the health monitored fs
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251126/202511261601.Q8oA24is-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:SPACING: space prohibited between function name and open parenthesis '('
#47: FILE: fs/xfs/libxfs/xfs_fs.h:1205:
+				_IOW ('X', 69, struct xfs_health_file_on_monitored_fs)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
