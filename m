Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E63F1397
	for <oe-kbuild@lists.linux.dev>; Sun, 25 Jan 2026 13:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769348292; cv=none; b=GtGJDyEIxpRzxQ/wlNs5kzL/YFJc9LR+0WeMHnKL09vlS/KuzyPcyIOop/nhGVrYv5zUpnFz5X8dbOpCJhcQ0iv6UQ7SVKqIvPbRDhZtij5ddRIMCGJar8kSlFUI1aJPrcNKIWE4nRugGklL7UOd1ieBsv22iqBP5DNmTncbkJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769348292; c=relaxed/simple;
	bh=UP89tHKxPX8C+Rg5QjzQgstLSlhtdQQcLEYlhWmw4lY=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=I78z/WcfnQnCJK7xjE3P+Pq35MmCtAx5vckpCWr24BZPX7X3idewdSGsscfZ90I2d9SL1LSsBnZp029iVouO3fgBVeoEbXBxZ6IsP1mZsk9nNspEY9YimrMgvJF0N++QJrOg0ti6iO45rQsJxHinXou2AlDhT6coBhKMVfNbuD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VRwuXfij; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VRwuXfij"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769348291; x=1800884291;
  h=date:from:to:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=UP89tHKxPX8C+Rg5QjzQgstLSlhtdQQcLEYlhWmw4lY=;
  b=VRwuXfijPUi5zZ6Y4Sbv1scMnw9wjNGOY4l+SwxAs0A8SKv+eimMqxlF
   vHCzgO1NcL43tIpV0Cvd730gDxYp2HAuy/PmdeB9BHnJmcSbff+dNLxgb
   CbxNNMe4LHpjeZlH67rRiiG3zR5kMELpGhIsS1tSaTukOJci7Q3oJwmwE
   6d5Yt1SfwhfnC2MH+w5iXbfQ1JTobuBIDurhSlXOIuzgeLvabe8TXCd9+
   1gJpe9sQvsB5lgGcB599t7XbyJPABlBFkURosuh+4BldmZHS1dU6D71bM
   X9r+/3dudY+J/E48Rr39txV+GIbDbrHzrC5kBcdCs/O0aHnoZP4yiGu0S
   A==;
X-CSE-ConnectionGUID: VykCJwPaQLCLZ5Bh2V4CpA==
X-CSE-MsgGUID: 19dcv+RYSfGhTt8qmCm3dQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="88121257"
X-IronPort-AV: E=Sophos;i="6.21,252,1763452800"; 
   d="scan'208";a="88121257"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2026 05:38:10 -0800
X-CSE-ConnectionGUID: omjEvN+JT2mnUhqIa17ILA==
X-CSE-MsgGUID: L6zq41GzSYW4psl0r19VSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,252,1763452800"; 
   d="scan'208";a="206702532"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 25 Jan 2026 05:38:10 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vk0Jb-000000001Gr-0Ydy
	for oe-kbuild@lists.linux.dev;
	Sun, 25 Jan 2026 13:38:07 +0000
Date: Sun, 25 Jan 2026 14:37:41 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [thomas-weissschuh:b4/sysfs-const-driver-attribute 16/17]
 checkpatch: ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
Message-ID: <202601251415.xNpW6Rej-lkp@intel.com>
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
:::::: Manual check reason: "high confidence checkpatch report"
:::::: Manual check reason: "checkpatch report for netdev code"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Thomas Wei=C3=9Fschuh" <linux@weissschuh.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/l=
inux.git b4/sysfs-const-driver-attribute
head:   92cff81ee317b9c2c7c4e3bb80f46c9feddbfa9d
commit: 445ba0f479b21cc9310a99aefa9de3d53559eeb0 [16/17] x
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260125/202601251415.x=
NpW6Rej-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#1854: FILE: drivers/tty/hvc/hvcs.c:454:
+static ssize_t rescan_store(const struct device_driver *ddp, const char * =
buf,

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
