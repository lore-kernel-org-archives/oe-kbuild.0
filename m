Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7D644E641
	for <oe-kbuild@lists.linux.dev>; Tue, 28 Jul 2026 14:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785249651; cv=none; b=RLP6nS9LdiYQW+K/qvpVNmsywpXPHul7mluwNCKsVCrTDy8aKsEIQnqtPJO4fiGCqpyNvbhbVl6B03bGyVKIPuFxiod9QaTJzf9zxvAYRtIVvo37mHYPWO5VdenJiMA+XmQTxTWbefic+VJjLZxpAfm0k5L+JEP4Ymee/s+WNQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785249651; c=relaxed/simple;
	bh=h4XU+pxY8HvurGIpI8MugVRyoSniqhEsS0Dvumdpicc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FSJ2nZjbKwmgT+etpRbIrB53txURX2NtJtEcvNiOtU8ZnqGWecpTFuOPgZwCULdCeIcf2TIs2LvQ4tjPJMCp8yZPVWgQOX+tIGAw9syWymNORGiG/G8I4F5WjDc0bER3grLQvQfjgSE5Da+3kIXRjEswJ8NJ4hofl6htLXlitY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O+XHYJyP; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O+XHYJyP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785249649; x=1816785649;
  h=date:from:to:cc:subject:message-id;
  bh=h4XU+pxY8HvurGIpI8MugVRyoSniqhEsS0Dvumdpicc=;
  b=O+XHYJyP/drCar5kJ7LuSqeF71lJoia0ZWljLuizO8e5IrZTxtK6IJ7F
   DYUIlG+bMEieGNSUwE3EqmYS/EvyaE5p0iCop5OkWYAhV+fJlWvmwpJE8
   W93TWzVKVb/0hBGb/Lk8MM8xyLg+Sl6fFkjdy52D7SOaXHpXcxCt2SOEK
   gClvYJ2NSbsPadv282l2qi8fbQBw4GB2U+0WkW0t87LYK7bEZnecCfDhS
   zrBqKsnlXRD/847Wlorxd7USBs1SxIrr4XsdTqMwpUT5rA1ZXU8lVZCG/
   fS615JcM427AVEvXvQJXNtn/UkDJLz2ymko3LQnIvCXxzf0TtYD6CAMXI
   Q==;
X-CSE-ConnectionGUID: zmXUNG0eQl67i8dWq91JPA==
X-CSE-MsgGUID: Hh5QmemNSYSeeQWDnpjPWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="85953961"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="85953961"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 07:40:48 -0700
X-CSE-ConnectionGUID: 0wWtj2lPQ7C9ujPREuA8pw==
X-CSE-MsgGUID: 65PTzl5PROe0v8dlrRpjRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="289675175"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 28 Jul 2026 07:40:47 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1woiz7-000000001yM-1pqv;
	Tue, 28 Jul 2026 14:40:45 +0000
Date: Tue, 28 Jul 2026 16:40:05 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: rxe_mr_overflow.c:27:10: fatal error: infiniband/verbs.h: No
 such file or directory
Message-ID: <202607281632.rZzw6Yr0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Gang Yan <yangang@kylinos.cn>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Gang-Yan/RDMA-rxe-Fix-integer-overflow-in-mr_check_range-leading-to-OOB-access/20260728-172801
head:   95b7343d25e2bac0178f8de007f50590ef9f6bd9
commit: 95b7343d25e2bac0178f8de007f50590ef9f6bd9 DO-NOT-MERGE: selftest: add rxe mr_check_range() overflow reproducer
date:   5 hours ago
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260728/202607281632.rZzw6Yr0-lkp@intel.com/config)
compiler: s390x-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260728/202607281632.rZzw6Yr0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607281632.rZzw6Yr0-lkp@intel.com/

All errors (new ones prefixed by >>):

>> rxe_mr_overflow.c:27:10: fatal error: infiniband/verbs.h: No such file or directory
      27 | #include <infiniband/verbs.h>
         |          ^~~~~~~~~~~~~~~~~~~~
   compilation terminated.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
