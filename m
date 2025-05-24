Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C665695
	for <oe-kbuild@lists.linux.dev>; Sat, 24 May 2025 04:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748059756; cv=none; b=t5z5PXlPHWbJpQC1q0fmV3qWxllkYqwXCKXXwYXbDclKwSKIYPgU6WLZ779m9Lzowe49XnkOhuinOPeNokoA/L9587onoP2zkk6KXqqlWwfBv2d672xqKVml3CZr4D0uIKBQmYGyVh/hNVYGnf9e26cSTokFDo+xXTOpV25R0eM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748059756; c=relaxed/simple;
	bh=CxanWLxNeQ0tXNro47//7ZBVGjKU4ySKjqkz1UIcTCY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OtWHu4Px2OZKJMrWpdl32Tk+oIRw9ltsqPAMBTLxPHT9z0dEyKpJPUxlqaKiiIn0K2ZOOMFLXb0bsC7uRlF68+I0Ttz21ZfpKIiQElMbvCNORib6KNOQ4QU3JigUG0ytZ+UlcFN5WlTSrpAaYQ1+RyaBOoiVM9p0fGb+bpf+94s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V6YOUCkV; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V6YOUCkV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748059755; x=1779595755;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CxanWLxNeQ0tXNro47//7ZBVGjKU4ySKjqkz1UIcTCY=;
  b=V6YOUCkVlKTAkrhrX7RK8BXEC3aVbPHlIQLQlbFejYOvYg1c0eIvJg67
   W3p6Esxyq2IBJEgjA62YqIleYzlNmsPMnWMCwK3yhAVXsrv3OfaCwfcrw
   ybU7NF1l94XL/8jFpcYgoCdAk6zhWlIM8XEzh9MviW6rMVpdZPl14UY7g
   yCR16Usr3oCd2Xv764HKnJlXX4e9sfbW82kVdZG3MjPliHT/4Sa4a8UtQ
   RkzWD70WhjgEQySs2aVH5iYTzYAVvgC6bSsDJMKo+mWVVQU+D0kpXQAbI
   hPYnyKCQaYmbP7gYoU0LP5YL20SOx+ZVthcY5TfE26oDVgOqJqwdSe4hu
   w==;
X-CSE-ConnectionGUID: XXOdnVrVQvGUddr7u2FE2g==
X-CSE-MsgGUID: j7O0CFteQ3yIw9ycpTWdKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="61521800"
X-IronPort-AV: E=Sophos;i="6.15,310,1739865600"; 
   d="scan'208";a="61521800"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2025 21:09:14 -0700
X-CSE-ConnectionGUID: rbFcWDcrSzWOllgc2iJfDA==
X-CSE-MsgGUID: 7S0CkgwrTHeXwH0EZMa32Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,310,1739865600"; 
   d="scan'208";a="141281977"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 23 May 2025 21:09:13 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uIgC6-000QvT-2h;
	Sat, 24 May 2025 04:09:10 +0000
Date: Sat, 24 May 2025 12:09:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: fs/bcachefs/backpointers.o: warning: objtool:
 __bch2_backpointer_get_node+0x78: unreachable instruction
Message-ID: <202505241254.A6ki50R9-lkp@intel.com>
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
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4856ebd997159f198e3177e515bda01143727463
commit: d1041d8eab31f9b4c696ee060141d1b0d156f84d bcachefs: Fix missing commit in backpointer to missing target
date:   9 days ago
:::::: branch date: 6 hours ago
:::::: commit date: 9 days ago
config: loongarch-randconfig-r063-20250522 (https://download.01.org/0day-ci/archive/20250524/202505241254.A6ki50R9-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250524/202505241254.A6ki50R9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505241254.A6ki50R9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/bcachefs/backpointers.o: warning: objtool: bucket_pos_to_bp_end+0x70: unreachable instruction
   fs/bcachefs/backpointers.o: warning: objtool: bch2_pin_backpointer_nodes_with_missing+0x1f8: unreachable instruction
   fs/bcachefs/backpointers.o: warning: objtool: bch2_extent_crc_unpack+0x9c: unreachable instruction
   fs/bcachefs/backpointers.o: warning: objtool: bch2_extent_ptr_to_bp+0x1f8: unreachable instruction
>> fs/bcachefs/backpointers.o: warning: objtool: __bch2_backpointer_get_node+0x78: unreachable instruction
   fs/bcachefs/backpointers.o: warning: objtool: check_extent_checksum+0x170: unreachable instruction
   fs/bcachefs/backpointers.o: warning: objtool: bch2_check_extents_to_backpointers+0x64: unreachable instruction
   fs/bcachefs/backpointers.o: warning: objtool: bch2_check_backpointers_to_extents+0x3a8: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
