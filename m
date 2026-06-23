Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4745C22E3F0
	for <oe-kbuild@lists.linux.dev>; Tue, 23 Jun 2026 13:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782221994; cv=none; b=XOve2cBF0Q9CS0R8bbLDijfuWpBjWM5h3rUQDI/JsFJyhJXffCGaR8t86NTltzD4OMFMzlSfU3Pg0tLb+2A0PPnZvO+CrdI22r/XnKo4taOGXsN4oscAhdmcBaDdJr4ni5qAoM7YWdcMA6Xfl/px1fI6jb0G/HtQZzS08HDGvoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782221994; c=relaxed/simple;
	bh=NCi4wVpu6IjClv1LXzgQPAg9B8ydyAThNmxzKLpEzRo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=fRLrXRaBppyDMMjvYXhG5pGeWXwrz+zCODYMZO2zk1/dNAg9Cyo8iFon0Gc91CadonY2mipB47Ul7xJejb3poGJuwiwkiHbGMSn5p9DAGV4fy8Cpq1uvfJsi54CVrxEl3QMvT3rO5WEJC5cKUAYcIKYvxoPIjfeb8PujWEzI+E0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JRRpPr0m; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JRRpPr0m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782221993; x=1813757993;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=NCi4wVpu6IjClv1LXzgQPAg9B8ydyAThNmxzKLpEzRo=;
  b=JRRpPr0mOPMc/J7dUA++IK+JU5KudFYQMv1Tp5sOKgJiOGnDfqGE4P36
   99H1yUAWLW93PKMk9MD3Rsh1Ld5CO6vuOKIdExH1SBhAxCx3SNsIVRTDC
   MdWBKJEjvr4rMitJ1FZ2wb5XugsuHYE6QeYq4/SkWsBjZL9mgQc2DS0vc
   J4/hbW7F4lPP4fY9m1tHC0qQ6dn8MqYIb+cHvuMgsc2wac5VunyxKAMbw
   epUXzd+NI/UvmfvXYQA7M9+lEuIT/fCwbUVlFN7FTiNy4qQ4vkvuMKEy3
   u3QtjDTSfNC7kiwOPTT3M2msLlg+K4Unnwtq04UN0kc4Cv812RouQMfiA
   A==;
X-CSE-ConnectionGUID: P596mxwaR8WoEXn//r3jiQ==
X-CSE-MsgGUID: HDeaJd/KShird+p0eYYssg==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="94080913"
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="94080913"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 06:39:53 -0700
X-CSE-ConnectionGUID: 8/2XmGIHQ5OdpuEY6DAUUg==
X-CSE-MsgGUID: AINPVJ7zQsGmP/uFALQizg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="243163450"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 23 Jun 2026 06:39:51 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wc1Lu-000000002ZB-1S6w;
	Tue, 23 Jun 2026 13:39:46 +0000
Date: Tue, 23 Jun 2026 21:38:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [thomas-weissschuh:korg/b4/vdso-arch-clockmodes 3/5] find:
 'arch/parisc/include/generated/uapi/asm': No such file or directory
Message-ID: <202606232146.xyno0OEj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "only suspicious fbc files changed"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Thomas Wei=C3=9Fschuh" <linux@weissschuh.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/l=
inux.git korg/b4/vdso-arch-clockmodes
head:   7145c58a41a91ecd43150c53b21c4d82f7e024cc
commit: 5418f662ee90802bef3cbeb90df15f0b4c3f7c84 [3/5] find 1
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: parisc-allmodconfig (https://download.01.org/0day-ci/archive/202606=
23/202606232146.xyno0OEj-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 16.1.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260623/202606232146.xyno0OEj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606232146.xyno0OEj-lkp@intel.com/

All errors (new ones prefixed by >>):

>> find: 'arch/parisc/include/generated/uapi/asm': No such file or directory

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
