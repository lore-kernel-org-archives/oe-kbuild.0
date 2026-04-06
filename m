Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7003093B8
	for <oe-kbuild@lists.linux.dev>; Mon,  6 Apr 2026 21:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775510129; cv=none; b=QWBMgZPJaFPdWwW7PGWjp8wvMe8cLuVO7j0+HfFwiO9+kk7rbT+xu65jbnIcW9Elpo1IZwHXeXJQxlTMeTgLhN4ICk/OHod8Oh3tDQi9o0VLuMK7MSeut46A/klrVl021iUlvupxTOa5LtKK19hXrw3pou4VnGe/s9QWv+v7Z+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775510129; c=relaxed/simple;
	bh=JA1dVqcz+a5l/UZR+tJUtZd6hKDW1tZICD89ntLnN7s=;
	h=Date:From:To:Subject:Message-ID; b=R0oL3/N7sTNQu6Ei7ec1+GhJtYME+QNcRJF1VrsZUe+zlmqIAYRD2oNzF9isu8sEA+uoWNqOSV7CsQOdHnWRxj9Rn/MEyLzXihyU5UemSdXMxhPuwTUOqk5WIBEtjDYoMY2SMP4aKyfFqtIl1ABnm4vtOOnDV+ZgQBU/GVx5g9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d2FdUTUO; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d2FdUTUO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775510129; x=1807046129;
  h=date:from:to:subject:message-id;
  bh=JA1dVqcz+a5l/UZR+tJUtZd6hKDW1tZICD89ntLnN7s=;
  b=d2FdUTUO39HTKrXqb++uu0K5iiwcomMVLFNuE7jFQbi19fhAmOCz+KiF
   b/CPJBINFo0qTyB4MTFpm/a+djlVcKWjLSDIPITyPj5NNjgTutzNaWDXm
   Gi+mljaOZtiXOD9llMlCdx936jqPGV5n4Qu+fuEuZ+8DOkt/xCMxT0gjI
   CZ9yr7lIcu4GCEnFQZl1GfI1dAOkUk4/TE2ARUFwBP4AOJbof55L4D56j
   AsALtCAFlpqnoVN7drl81Ot5rhE2zQgO8eBz4j84cKNM3RyYdnbP+3oVC
   l3VLqFhz5ov4iTWh1tqQ5fvOzFMnkjX7xBBV2GhnRMXglhIiMoovv8fMe
   Q==;
X-CSE-ConnectionGUID: JCdKr9e/RxqUXBb7mErt4w==
X-CSE-MsgGUID: oZmCLFlCTOOy4HHAGPkUGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="76344645"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="76344645"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 14:15:28 -0700
X-CSE-ConnectionGUID: /4V+UhnVRJOPs7S9D2BAKQ==
X-CSE-MsgGUID: P+H4NGVsSySdS+k8ZKsIgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="229643583"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 06 Apr 2026 14:15:27 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9rI5-00000000A8H-17JL
	for oe-kbuild@lists.linux.dev;
	Mon, 06 Apr 2026 21:15:25 +0000
Date: Mon, 06 Apr 2026 23:14:42 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [cornelisnetworks:for-upstream_20260406-1608 16/31]
 checkpatch: WARNING:REPEATED_WORD: Possible repeated word: 'device'
Message-ID: <202604062303.C04cbiAu-lkp@intel.com>
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

tree:   https://github.com/cornelisnetworks/linux.git for-upstream_20260406-1608
head:   dfb8e15cec205050ae10423f54df9edc8a4e192f
commit: bedc154be9f44e98cd45e91d621b09487a3057dc [16/31] RDMA/hfi2: Add initialization and firmware support
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260406/202604062303.C04cbiAu-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'device'
#558: FILE: drivers/infiniband/hw/hfi2/affinity.c:521:
+		 * evenly among devices, then the first device device to be

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
