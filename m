Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1353D4508E3
	for <oe-kbuild@lists.linux.dev>; Thu, 26 Feb 2026 20:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772136117; cv=none; b=Dx/W874jq24ZSrcpJYCU9B7PXYg7LaK/NDGmU2yKG0sTHLm7wdGv6qZ3yznT2fPpqSn8FvMSqMXPL4sDmu/YtHG+AV1zJnUJBxqoZcdVs1D5jaectABOCMIxTgW8i+fM8xo4jUmG1md/vqRqgFUB7QVnsGZxbOwHHp/VbM+dU5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772136117; c=relaxed/simple;
	bh=bK6j9giKJAJyjuvJ7XX4o2AcsLwR4M/l4fiAp5cO1fs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=mTrJ4ZxKs95w81+ySYwkmVm3vv0ngvW0srfttfnrodBcwJIOJ+jXFHeClAYYEIVXvhognG32+OlzluP+EhuxiZYzAEgc55JkgUiiwbwDBeCjUoPfNSF/mp5lT9CGGq7k3x+RfkKO5LLDnQpJ69XGwD7Mm78sVf9QiFVXSlMWEKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YyPa2MJs; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YyPa2MJs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772136114; x=1803672114;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=bK6j9giKJAJyjuvJ7XX4o2AcsLwR4M/l4fiAp5cO1fs=;
  b=YyPa2MJsP8MC+Eg18EEVYqIHACKyLfsh1ZVFN6jsAqseg4fAepKW+QlK
   1LuHBpOaPmoo2EADCInA0rBnxAm37opEy4Paf1z77eNEpMERFYSqQBUOi
   8ZeC41Yl6KSfhpB1Ql7vQVz6HhdMg2PywJPICOJVNVbKrOLoFkjAK5Ojc
   YAw7N+dGPjYsf5wImslsPoP8lDvIHm5J1hcHy0xFwenQKsvgRLv5+GOhZ
   5MNyUFd7fd1fTP8DjRIW8/XTq5WOrPOAGiqMruhc7WfavYHp+IjSH4y1P
   kt4SUnyOiEFIsnv6a0ZWHP2uT1UTgFrBL1cH/kIDgEbqXYHN2Gv6GBKtW
   A==;
X-CSE-ConnectionGUID: CVRyGEiUR5m0kDdNP6nJnA==
X-CSE-MsgGUID: slWapK1XSP29ZU0tef8YDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="98679524"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="98679524"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 12:01:53 -0800
X-CSE-ConnectionGUID: i+R05AieTLW+VDv4wDzpFw==
X-CSE-MsgGUID: Q5v3xGFnRlSa/n9EaKNxnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="219976730"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 26 Feb 2026 12:01:51 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvhYI-000000009pT-3o4l;
	Thu, 26 Feb 2026 20:01:41 +0000
Date: Fri, 27 Feb 2026 04:01:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [thomas-weissschuh:b4/kbuild-uapi-c 14/14]
 riscv64-linux-gcc: error: language c++ not recognized
Message-ID: <202602270358.t6QrSazK-lkp@intel.com>
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
inux.git b4/kbuild-uapi-c
head:   1e1a3922df39a1658944046f53511884864e1347
commit: 1e1a3922df39a1658944046f53511884864e1347 [14/14] x
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
config: riscv-randconfig-002-20260227 (https://download.01.org/0day-ci/arch=
ive/20260227/202602270358.t6QrSazK-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260227/202602270358.t6QrSazK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602270358.t6QrSazK-lkp@intel.com/

All errors (new ones prefixed by >>):

>> riscv64-linux-gcc: error: language c++ not recognized
>> riscv64-linux-gcc: error: language c++ not recognized

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
