Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9274831690A
	for <oe-kbuild@lists.linux.dev>; Mon, 23 Feb 2026 20:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771879860; cv=none; b=X5YBhJC2hp2PE2HY72Ry4pOEmV/pKptNqW68EdO5lu76aHugiXRzKk/xd/15e6U2yTWlB0hkR47K0DCtzkykgD4ns2LA/gMVQYlifIHzLz1eIVVtPSzpZu72xRYvfzuKmfKOaTsN7huM5yyEF4dyXdGBQBKrSlOGRqytIA8h/GI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771879860; c=relaxed/simple;
	bh=pfF0EwUpCnX7oPUWqttv3eX23UCmVHxpq3CPDDUGZ9U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=pEZNywv5XXZ94NemzYJfOCTOCZM0/jDFi27SZQnEYm8TrM+nwe5f8Wl3dIbBP9xe9K+gRhgHfGS+pM2iNwqRj5NPJ+BMf1b6agFCfZQUS9+NjdLdUsyntsQKYkNLr4tkjgN+jskKx5tQE9E9O8OCRFnqxXs10iI8qBnSOzD537A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K//zNW1C; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K//zNW1C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771879859; x=1803415859;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=pfF0EwUpCnX7oPUWqttv3eX23UCmVHxpq3CPDDUGZ9U=;
  b=K//zNW1C9V/+Q/eGHvg05Qdv3f3rAd+kT2j6Kis7+0XXO3pYvo6IVsz/
   cMhUdZm0xbEThaB1FAIwhkc/Lsk2vAwm/5ftj2GRfupBdrCuwJ02NLrtd
   VuTUKEejrOEsXh2FESVS6ck6o+Gt/QNYJANNE8CzEd0Enh4s+pNO3dx21
   mkzbeMWofhhbl1aCpFzULkuR55xpSAVWaHUWntuMZWsSI5HBa7wuPblP1
   ZlFgqoPJ3FIv1Y4Xn+YdLmrz+i7+wmrYqYiIXlu37tRzOseTp2HGtEz0t
   LZYi68QDusYjOL8JxltDrQctABAcKpXeeCQV4sRxlZ0s5JbOw5V6TsIwc
   w==;
X-CSE-ConnectionGUID: 7aKOyEYERtmnw3tQ1veuTw==
X-CSE-MsgGUID: HLhxhYaXRousPatiXE/A9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="76716498"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; 
   d="scan'208";a="76716498"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 12:50:49 -0800
X-CSE-ConnectionGUID: TdAmxO7hRUuN/5F1Yds1Zg==
X-CSE-MsgGUID: THDrSepiS1ONQ715sjtBEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; 
   d="scan'208";a="220677639"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 23 Feb 2026 12:50:48 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vucsq-000000000m7-45ot;
	Mon, 23 Feb 2026 20:50:29 +0000
Date: Tue, 24 Feb 2026 04:50:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [thomas-weissschuh:b4/kbuild-uapi-c 14/14] nios2-linux-gcc:
 error: language c++ not recognized
Message-ID: <202602240432.wbrdK33V-lkp@intel.com>
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
head:   f7e0b4956801dd819d37ffa46b55f82232b6c7ec
commit: 21c74eaf91ce4b0d2f569e9a502752d830c31cf6 [14/14] x
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/2026022=
4/202602240432.wbrdK33V-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260224/202602240432.wbrdK33V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602240432.wbrdK33V-lkp@intel.com/

All errors (new ones prefixed by >>):

>> nios2-linux-gcc: error: language c++ not recognized
>> nios2-linux-gcc: error: language c++ not recognized

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
