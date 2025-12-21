Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D564D249EB
	for <oe-kbuild@lists.linux.dev>; Sun, 21 Dec 2025 15:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766330945; cv=none; b=K0gTvEGjaIctEaC+rJhfzh4ESlppuPdMiFctMroV6d4brJDy9c60kIlxle7nmx3v9tLp+HARM7WN3Gs1s5nuAl1ZK9o21m+kgcdLHoZGgN2ERGXO4f60LKaHlk35BOEXZc2eMSOVSn1PYG6EXADnt4pM16Js5GLXwgkfJUBswCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766330945; c=relaxed/simple;
	bh=49PDIhP6Opqav0Fk0p0j2nSXdIqAIEQNFtemY3SxBMg=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M4wvCgcMKiBes45gRnjC0QU7BfINzfx2XlfNLOBVflD7vxcKGj0wsnah9zZfIW7GR8yHSVvLr1x2rRVrB8vQ5HGNgetIhVH/ZHNeKNB9QeK9mVMmvh0cSMUwwBX+OQwb+oWm1ZlBzladvoW84FHDqouou6ueIHB1dz+l4l1zedY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XP+mtD6k; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XP+mtD6k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766330944; x=1797866944;
  h=date:from:to:subject:message-id:mime-version;
  bh=49PDIhP6Opqav0Fk0p0j2nSXdIqAIEQNFtemY3SxBMg=;
  b=XP+mtD6kfbe06EnAqn7L+cgZ8dDW+/oE0IxZz2kQ9JU45HNKgXQCTGCp
   3FmmdsoEC2CthUVqKyvT1WigWKxIKjwFYtXku1CIF9yKiEBkIB0FVvOa3
   EnPczdYgPPbTfB1XkxzLweLJLZ0Jq3stTVqKxMqp91pMoYD0Bpxuj3UFK
   7rZ+szJibqblGNCrtIrdOxPFZicQMuEj0t+AEBv/lA4rYdth3GKrUzVsx
   wumb6e1hFZvJTvlyho+xEGfeVpRdXBDOWJ1p7CQEKaxdbQ2mxHDEsN7tF
   R3avb2PU6iciDU0XRytvf9fYXmVGtvx/FxJIWMDA+tDXiwrIDLW3fqmoB
   Q==;
X-CSE-ConnectionGUID: 8+TfW793RTyKJnrxEEhQfg==
X-CSE-MsgGUID: zNNJ28TQTkqvCQyTi9OADg==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="68287778"
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="68287778"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 07:29:03 -0800
X-CSE-ConnectionGUID: WSgyl8HLREajj9AMVgQeCA==
X-CSE-MsgGUID: OGQHAU8eRIaIlYvBzHqyYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="229979548"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 21 Dec 2025 07:29:03 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXLMi-0000000056c-0FeB
	for oe-kbuild@lists.linux.dev;
	Sun, 21 Dec 2025 15:29:00 +0000
Date: Sun, 21 Dec 2025 16:28:15 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [asahilinux:bits/200-dcp 1/246] checkpatch:
 WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
Message-ID: <202512211649.1yhbjypA-lkp@intel.com>
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
TO: Alyssa Rosenzweig <alyssa@rosenzweig.io>

tree:   https://github.com/AsahiLinux/linux bits/200-dcp
head:   a505a983517df0d2df38e87cb1898c518fdf9740
commit: d45b068d8afb0c094ae29bf512450c98aab12f9f [1/246] WIP: drm/apple: Add DCP display driver
:::::: branch date: 3 hours ago
:::::: commit date: 2 weeks ago
reproduce: (https://download.01.org/0day-ci/archive/20251221/202512211649.1yhbjypA-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#2157: FILE: drivers/gpu/drm/apple/dcpep.h:139:
+ * content.
+  */

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
