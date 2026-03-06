Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FAE647F2ED
	for <oe-kbuild@lists.linux.dev>; Fri,  6 Mar 2026 20:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772829604; cv=none; b=euehGrxtX/qJ7/SyWRVZP250yRph4Ff3t2hQwp5I6YxCBbg0ifZyHa4VZsKj/ETl16oweDJEJKeJQyRrtV588USfhHlcITv/AXSFQ4o0ux73sAjVwOLdpZwi5NuYJzpH13bPUIYS/+uFC9BaIwJ10oooSCT/0NufgZE5Mh2HfCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772829604; c=relaxed/simple;
	bh=Ciku6Lw5OEP8X+tWdMSEgkFQa1OdZd4xzY3xanFdlRE=;
	h=Date:From:To:Subject:Message-ID; b=RxgCMW0NEhPqiO2GrXtpwRarUEYbgRDAYI1fHrum88CtFZyYn4+GfbBe+jnNF++eQdvUMZWRb7iJGf9xP0aa96q+k8sBlqWTGgGUY6xpzfUxm8QEtKOqHXCHh/qbji0YM1ddfT08equdXoZ6eC7BQTR0w1GBJjGVk7MiVU0SlHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a5yM7yNi; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a5yM7yNi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772829603; x=1804365603;
  h=date:from:to:subject:message-id;
  bh=Ciku6Lw5OEP8X+tWdMSEgkFQa1OdZd4xzY3xanFdlRE=;
  b=a5yM7yNiZ/MvPiNweePT+sPeI4kq8VZTUf6XRl/uIE4G8MqIQitHcEtG
   3lYc2iES9eZ+m6eCXstXi9xzknkZYdGe4PJKV2nX0JmSjPpUyxzoVsD9h
   z3x3CLjC/KTOSJndQWmJNKp6QaObjGcMH7Oh/AWMLQo/95KKEh8osYGpz
   2SYMt+25j6FCQH6Si4yQt1eW0AH7HZ2eZW381i/vUHr2aE8gm7i+9f2UT
   7uIIbrGlnv7/Ab4AoWFzkG7NSAaWIS2rxyM858sOkZBZasOomaXB7C3AY
   H8ugtaGe3Q6936S+Y4qsS5lQpK1SUGa6cKWhAbWJw0uQNlrfid20GrHnp
   w==;
X-CSE-ConnectionGUID: 55oYhyksRAWoyugqd9IBFA==
X-CSE-MsgGUID: zJOdzMHFSeKYzfN+Nyya7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="73139601"
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="73139601"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 12:40:03 -0800
X-CSE-ConnectionGUID: kGQGF7d/SuGhKkO2WSJD7g==
X-CSE-MsgGUID: LAFDuxesTUKQE+7kilxKWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="219101588"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 06 Mar 2026 12:40:02 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vybxn-000000002Lx-2yRN
	for oe-kbuild@lists.linux.dev;
	Fri, 06 Mar 2026 20:39:59 +0000
Date: Fri, 06 Mar 2026 21:39:17 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [cornelisnetworks:for-upstream_20260306-1425 27/31]
 checkpatch: WARNING:REPEATED_WORD: Possible repeated word: 'it'
Message-ID: <202603062108.uHs2tQ4Q-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>

tree:   https://github.com/cornelisnetworks/linux.git for-upstream_20260306-1425
head:   8e85a7c6fd859479abc528a78dec59382ef82d3d
commit: 8637bbdd1188ef5f21f87968944667a9b4b6faa7 [27/31] RDMA/hfi2: Support ipoib
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
reproduce: (https://download.01.org/0day-ci/archive/20260306/202603062108.uHs2tQ4Q-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'it'
#1669: FILE: drivers/infiniband/hw/hfi2/netdev_rx.c:398:
+ * When at least one device has called it it increments atomic counter.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
