Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F1A33EB06
	for <oe-kbuild@lists.linux.dev>; Tue, 16 Dec 2025 15:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765900225; cv=none; b=eCFGsrFgGoDww8h6TIWuHwBEhTUzl9uToHZwfx4bHZuhCGUiU22OQ2w4fUhATY2oZFFu8SsZ0ImVZMjZh0YcnqTPFXva6lKpg4Fy65R9QnAhbTNAuroDzZpfND/eXneu7mWCHA48/HkxO6umlNFXGMi3eZl4a9d32IjNNWWfJ2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765900225; c=relaxed/simple;
	bh=Bhdw9A/fWe4jASCMWCel6M1x2y0hoD/ZDr1+XZOHyog=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ho8okM8C6LjqmNvOzQPHPc1Em9Q8xKh5OiQVqxkQxP1ZVvN99/HURRzQxFudNWsf7ikxDub4g12a5zTDMZYn6Ov9m1/8Se1gq9xVZVXVkplKm4R3ZsYtCQT6eILHsBL85TfGg0NA0MjZsRDtyt8PZV4lDcBXpOOnxOIDreDAYzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ikLvJXDZ; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ikLvJXDZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765900223; x=1797436223;
  h=date:from:to:subject:message-id:mime-version;
  bh=Bhdw9A/fWe4jASCMWCel6M1x2y0hoD/ZDr1+XZOHyog=;
  b=ikLvJXDZSXwJWv5szCv7oWfBDg3Ee3m+csLI35E0BqaCrqxuhqoAzzUJ
   mgsRs2W+X5P9Hz1aniTL7XOXg65v50kgMgh2TkBbj3cA0tzTTJgxm1oKh
   iHnlyNZaW15sRbClrpTr2x0mA1sBT7x9T7aHa0ZdrzJd7jhERYyApCW82
   +rrrSBthg8k225zZWoZEKxJdJnVmWwD1FLsJBBqGMQZ8a5Sse1VNNuEw8
   0jAM6MSxc8kbhAscXAlEYgAJQJiZRmhmA+vH5KuWTd1FMVBBtCE6ejbEx
   5gatekfn83BLPlUpg67c2Ne13knkzXNcNvkh9hMXDoa/y2cdKIWN2F+n5
   w==;
X-CSE-ConnectionGUID: vO0wr5IuShiYqkJPAEnFvg==
X-CSE-MsgGUID: jhwW+IxYQG6ZtEb4MqIrXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="66808569"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="66808569"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 07:50:20 -0800
X-CSE-ConnectionGUID: 4K7+ZkbrTKizdzoQsuU/XQ==
X-CSE-MsgGUID: 9aaPpYA1QgyxNAjpxOqbgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="235438283"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 16 Dec 2025 07:50:19 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVXJY-0000000039m-2iUP
	for oe-kbuild@lists.linux.dev;
	Tue, 16 Dec 2025 15:50:16 +0000
Date: Tue, 16 Dec 2025 16:49:29 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [arm-integrator:b4/aarch64-dynamic-kernel-stacks-v6.19-rc1 7/13]
 checkpatch: ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
Message-ID: <202512161604.IJ83rl2x-lkp@intel.com>
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
TO: Pasha Tatashin <pasha.tatashin@soleen.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/aarch64-dynamic-kernel-stacks-v6.19-rc1
head:   c5dbbed8f81c183bdc77059ec990829129c3ae7a
commit: 73c4a4effb4aea258fa709b0dab6c89140eab307 [7/13] fork: Dynamic Kernel Stacks
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251216/202512161604.IJ83rl2x-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#261: FILE: kernel/fork.c:336:
+static struct page * noinstr dynamic_stack_get_page(void)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
