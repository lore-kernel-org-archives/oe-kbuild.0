Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51BAF499F38
	for <oe-kbuild@lists.linux.dev>; Mon,  7 Sep 2026 11:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788780862; cv=none; b=Z4/Z6kC0rHEktA3xa8ZhnxglEbDU+tn8qyW/Tndzt506xrhQfwY6h1lP3Wj6vMoclt7Da1ntpzXLP1L5lGYGIxOk8CmRj5EC5YM7wnn4SgZmt8XYsAt+s842Nm15NL4Z2ozHsQc0wv1A3TSI0UOy2i/SDiP+VhDHvUkyOmUSzZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788780862; c=relaxed/simple;
	bh=bDAeaIiFjEa7Vvwtvh4Oah43KXHlopA7PHJaAWQMML4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=KDZgTeN4PyQoqZcEGJuvO1JId4WXb9YyIf9XcKs7dhcu0H2nzSdnYgJ1OlJOZq5TF+rSEjcjtA1kfg4sN94SCkXMY48FpRDrjhDqLoGvVUHtrYib3gCcC3seS5LKsTMUjclXr2WMHcBux9w9D5Y/k8Xe23P7MHHwkQxvrcTfULU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QHfid9K3; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QHfid9K3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788780860; x=1820316860;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=bDAeaIiFjEa7Vvwtvh4Oah43KXHlopA7PHJaAWQMML4=;
  b=QHfid9K3NztDvDSRTyXHrYnvFGnGscYfZXV3WiD+ZvikmpyQa7ZsSex0
   EPL/lhA0tLYF7ETTzlzRBOb+aoMF90jTkt7ZhIW0hwozvqt12r6Lna8XZ
   B1iyPLIuTk6NyIbX1Otov3Zmn/VWav6PKAAH4TlREMIuBANZcIsLxZMNm
   Qr8yXkhGb6kX1kOUBpdz6WViMAu/rG0B9nr7kj+ZCr3LsabTMrV65dlLm
   8nmfOfmBLXw5IMjxEHRCGO5yiOC585oqeGreDwQHC9yryoqxSwX9peHNL
   z2nDDOqYErZHOe8RuVs3/SAicmgIrTtwfIiESOWLPddG3KxcWzOhrpgmj
   Q==;
X-CSE-ConnectionGUID: /7UEXMoHQkGO7qcXJ1kZMg==
X-CSE-MsgGUID: e8TZSA9rTXKz4YHd7Ft/Cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="89056008"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; 
   d="scan'208";a="89056008"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 04:34:19 -0700
X-CSE-ConnectionGUID: nV7gC4KrQXqYq/47PhCdIQ==
X-CSE-MsgGUID: +zLTeK1RSoCl6HA9D/nlWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; 
   d="scan'208";a="268954658"
Received: from igk-lkp-server01.igk.intel.com (HELO cc074f2a4298) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 07 Sep 2026 04:34:19 -0700
Received: from kbuild by cc074f2a4298 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x3Xc8-000000000Dq-30Ox;
	Mon, 07 Sep 2026 11:34:16 +0000
Date: Mon, 07 Sep 2026 13:34:02 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jimc:wk-merge 161/169] ERROR: modpost:
 lib/test_bonsai_tree.ko: symbol '__udivdi3' undefined!
Message-ID: <202609071309.ZM6MB5LP-lkp@intel.com>
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
:::::: Manual check reason: "low confidence bisect report"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jim Cromie <jim.cromie@gmail.com>
TO: "=C5=81ukasz Bartosik" <ukaszb@chromium.org>

tree:   https://github.com/jimc/linux.git wk-merge
head:   0a0ae42743814d601c19e361402c731f47824ec3
commit: 5cf266e83cf71b2974c60844183582d4d0b0a5c9 [161/169] lib/test_bonsai_=
tree: Add benchmark and stress validation test module
:::::: branch date: 12 hours ago
:::::: commit date: 14 hours ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260=
907/202609071309.ZM6MB5LP-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260907/202609071309.ZM6MB5LP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609071309.ZM6MB5LP-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: lib/test_bonsai_tree.ko: symbol '__udivdi3' undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
