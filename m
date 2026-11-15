Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794750884;
	b=1g+jmeyEdu8xClzfu0t8luabZmWZYQsihohPchuUlplHMXnsHqgMP+42oaDU0wqU4cd5
	 +rnFB7k7u2jr+hJFIw3ms+CCAVmKHRfILl/HrSVBXvKjio4sbasucefrEauTmj0bukeem
	 qO9Qc4Fl/7mYmQZPNgxc9rzQG8x7m860QWWSEXqOoCNeHRkrKPAGz84mPgHSQ+W4YPZwo
	 yASzkjjHLo60PGVv7TU+h6CyCzVoayIt87T41n9gDfQkN92+su8hfkc9Q5EZE1iBVRZpe
	 1Wt2OzDyXD9O4v1Q4HsOjlbt/ame0eDGYnsuYYEeJDwC7Iw2x8NkcPJcn1Q1nR21SlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794750884;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=NCUuoO4n6D0VO7snN6QDpMsr5o7LWpSVlixNSpK7dyo=;
	b=Vcpf47DeHoEXUV259gam7qgxGiFdnEDYX6reYJj9oafK6kIgDjytFMPx6p8+f0E0NOT4
	 ijvhDi6aiwT9htN3iqNAcl+E/Tl5iCMUGgcpSu/7NyiuL4bLxBtHMKfaJroXYzbUAxe1L
	 +vGh8uUNYa2jpamTQhfbWP9qLjRFb3EYfR4m1+93xlunq/dOp/svX4df3ipx+f0RflmUe
	 0bWaMdIDVX7fnKn+jXQODJnFzWj2ICuVz32l+8gb6GgRRhcJd2LMaqhluMFSTc7nkSgsl
	 6jOn1tE6o3y7MV+v5nPQ7zQmW4WEx9ivWfK5p8vbs2ZFllhslWAbnjKr2QehP9rEv/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ahQXnuvF;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91CDA606A31E
	for <oe-kbuild@lists.linux.dev>; Sun, 15 Nov 2026 13:54:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91CDA606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ahQXnuvF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794750884; x=1826286884;
  h=date:from:to:cc:subject:message-id;
  bh=Kem85KcKpcXuxwqNz33VmIhIBCNWs994ai45+nrraBU=;
  b=ahQXnuvFVaxaIj3P2hpEgi/v1lprLwdqvoY/KwiSdvh/to/sl6R/sHCk
   /IqUKU5nyZP2lC9tGsikIUjp5JtXH3ANiIMSYQnh1oUbPnqXHgzDzE49H
   zQ5QBoul4eVDoePotRR1GSlyaouT7wpH6+saTjevEH+7jJSNRZQVlvimK
   ldTRIL7uEKjuLmfDPFrDve/lUri9MkXe2nKvBFZBhH114GiAV50/SJFjt
   rTyqnhUnfVAFFe6JBLPczeYq5iGMtvEfGOL3ReKSbp994Z9FNOoNqdla8
   HM0RH8ZuPbfX4GJtUYgmjnpba/HXpGiHzvJ0DLYyD2Wz7N4gqw3iId5OM
   g==;
X-CSE-ConnectionGUID: hobNca7kRyihoYahyQscfA==
X-CSE-MsgGUID: AY19NqLtQDmlYJEU1pacJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3531331"
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="3531331"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2026 05:54:43 -0800
X-CSE-ConnectionGUID: tla/Lmg8R8SHJO36E453Vw==
X-CSE-MsgGUID: CagEKr9yRJyJelSXr4cARg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="9755438"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 15 Nov 2026 05:54:43 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSagq-000000002Dc-05OH;
	Sun, 15 Nov 2026 13:54:40 +0000
Date: Sun, 15 Nov 2026 14:54:24 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: {standard input}:4543: Error: Insn bl has an instruction
 mpyuw with limm in its delay slot.
Message-ID: <202611151441.JKvIVIOA-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "too many reports for this commit | /zdci/kbuild/indicators/6c/6c2fd7a71e7ab490a0a9d591486d923712012f59-reported_build_error_fbc-error"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
CC: Sudeep Holla <sudeep.holla@arm.com>
CC: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
CC: Alexey Klimov <alexey.klimov@linaro.org>

Hi Vivek,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   23c62304dde29abe92013d85910d03a77dada35d
commit: 6c2fd7a71e7ab490a0a9d591486d923712012f59 firmware: arm_scmi: Increase performance MAX_OPPS limit to 64
date:   11 months ago
:::::: branch date: 19 hours ago
:::::: commit date: 11 months ago
config: arc-randconfig-2001-20261115 (https://download.01.org/0day-ci/archive/20261115/202611151441.JKvIVIOA-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261115/202611151441.JKvIVIOA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 6c2fd7a71e7a ("firmware: arm_scmi: Increase performance MAX_OPPS limit to 64")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611151441.JKvIVIOA-lkp@intel.com/

All errors (new ones prefixed by >>):

   Assembler messages:
>> {standard input}:4543: Error: Insn bl has an instruction mpyuw with limm in its delay slot.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
