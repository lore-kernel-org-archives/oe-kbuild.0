Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E49B7EAE9
	for <oe-kbuild@lists.linux.dev>; Sun, 11 Aug 2024 15:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723389690; cv=none; b=SeVVDH+7Fx7hGO+JQ28Wz9dpsE5sS/khP9InSXMgF4hu3dJcQ2x9YVE3e9OjWcCMi3/S5QgJNb9tqPs3WYIeMzdATrpjAV8ktLTdi69Ee7P2kdernLbtJSdFuIX0XBBKYDOWJJQCD8Q7FuOjB/Po723BhqlKW+MbOip40VCao2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723389690; c=relaxed/simple;
	bh=xyCJX/tkoEzN2RKZZj1SPyZ5/luwkM6ME89AQRMB9C8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IL+7ew4QhOEuSUarwYpkJS1RMOsp2VtBqg/+QLATY8LGCvGkDuNlCg97uDMk225MJD1hkMjN1ZvsKsUMZpSK4D0TfoSDThPic8i+2Gy0JMGHnmhOT9KShZ58dDaDY5ejAEOY6zlg4OZwWrMqQQWW5qP2Le6abo5e7IIp/trrOFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AawKzZf/; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AawKzZf/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723389689; x=1754925689;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xyCJX/tkoEzN2RKZZj1SPyZ5/luwkM6ME89AQRMB9C8=;
  b=AawKzZf/teiH1Yg/uPsKmb+IljPx0VZ4lC3ZbPh8nhyFHYpsNJN+zy/r
   Zf+fr7uxUdMa7HMCjsExwd0cd3dhhH1zJV9v2rBzzWEQ40Mwim2J+GSkW
   AA/Je+o3EMoLRUB5lc2baVCR7wpRXEtKaYnt4wACaO/5a8q8fypI7Gn2r
   wnx3DERfWj6i/IsFTLKwwQgHUn4W2LOkf7coNorFxappnQ4BYh/L8qSzG
   lHTzGq8yesHW55MxPk8LOohxZoGUKeMa8ZTVeKOSJ3pkUjxj+/PHfzHlp
   Seqzz49NHtT1y4eF0Dc0dneEr+6I5+dLx7BpMXzqHc5pUv/8htgFpWO8V
   g==;
X-CSE-ConnectionGUID: r3y3E3jzQWKK9SfqlKQE8A==
X-CSE-MsgGUID: 2xKVp7sIRTCLTs5xI7o+Ng==
X-IronPort-AV: E=McAfee;i="6700,10204,11161"; a="12954108"
X-IronPort-AV: E=Sophos;i="6.09,281,1716274800"; 
   d="scan'208";a="12954108"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2024 08:21:28 -0700
X-CSE-ConnectionGUID: 3/m11te8R2quSPchYJHolA==
X-CSE-MsgGUID: raQ96iuhTZWkFIZ5ArZL6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,281,1716274800"; 
   d="scan'208";a="57931721"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 11 Aug 2024 08:21:27 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sdANp-000Aui-0k;
	Sun, 11 Aug 2024 15:21:25 +0000
Date: Sun, 11 Aug 2024 23:21:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: fs/erofs/zmap.o: warning: objtool:
 z_erofs_load_lcluster_from_disk+0x294: unreachable instruction
Message-ID: <202408112341.Qg6anU5f-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Gao Xiang <hsiangkao@linux.alibaba.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5189dafa4cf950e675f02ee04b577dfbbad0d9b1
commit: d69189428d50c9a8de6475f3c8c241f86f4e764a erofs: clean up z_erofs_load_full_lcluster()
date:   3 months ago
:::::: branch date: 22 hours ago
:::::: commit date: 3 months ago
config: loongarch-randconfig-r064-20240810 (https://download.01.org/0day-ci/archive/20240811/202408112341.Qg6anU5f-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240811/202408112341.Qg6anU5f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408112341.Qg6anU5f-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/erofs/zmap.o: warning: objtool: unpack_compacted_index+0x22c: unreachable instruction
>> fs/erofs/zmap.o: warning: objtool: z_erofs_load_lcluster_from_disk+0x294: unreachable instruction
   fs/erofs/zmap.o: warning: objtool: z_erofs_get_extent_compressedlen+0x90: unreachable instruction
   fs/erofs/zmap.o: warning: objtool: z_erofs_do_map_blocks+0x34c: unreachable instruction


objdump-func vmlinux.o z_erofs_load_lcluster_from_disk:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
