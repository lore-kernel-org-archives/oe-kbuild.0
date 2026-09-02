Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 863D247CC81
	for <oe-kbuild@lists.linux.dev>; Wed,  2 Sep 2026 12:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788352517; cv=none; b=taghdWRDE+6IA5jp7VSC1aV/Kbeqim9hHi9Iu1CokTyMLX042bbt27OShOKLRlx7oZ0hZx2WL/tiTZxUtd7tthDMHWN2Bs/unJTlJzKg+bMTWIvQeob6rI+f0GaBWm0gRDGih0VP7R47LfOKS+epJIr7LB+d7g/LL3Hn4ZhqIO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788352517; c=relaxed/simple;
	bh=3VkA0P8gusUZp6kKtrZX9wgPsylpXzL3KFG3eQwW8oU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oT7lLejoILhEprlG15vMG3KyIqEZq/I4LR8hFYvUDE4HMOlNiHZi8isx95Vzd74vI4bffKHTVypCGKZ8g3ChuPqaXuapS8ykU3gWBCvJ8SX43fzT8K7Fq4LHSa5YjVrXafcvWDuIUodm9qOCydhmz5l/V5oBISiV5Iw3Yv59Rkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l0lZxiZc; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l0lZxiZc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788352514; x=1819888514;
  h=date:from:to:cc:subject:message-id;
  bh=3VkA0P8gusUZp6kKtrZX9wgPsylpXzL3KFG3eQwW8oU=;
  b=l0lZxiZcdd1eUA1FKQg6295vUHqLsP7L5H48RfF61sO5PP846WgVMcHu
   hf9OmS2Uqur7QN+siqbkLQr1ZilkzgVRYH/JXN5UEM667UIQ5eakbG23y
   6KreyHRFnvhq6j/Va6RAeb02H3KdhbDLA5q1HtWXycvd9SoNGhtTiz95S
   maNkQM0xbz/fuRAd7KuXJo1B2sM2f87gis/XOvD4aOpqnDDpJ50oOFWcS
   89Y39VBfMQPPYYa7Q8+3/TPyROOxVqjRX+z7BSsnr5WjNSukHLvBHY+ZZ
   vcPiAq9KNdE4sDNqjaGnzBJ9kJb8adyns/1mQAFl6253OnM9wkGhcUenp
   Q==;
X-CSE-ConnectionGUID: kHY+153wTj+sXRDO8TkMUg==
X-CSE-MsgGUID: hsJy5wChRjS+n/YVcXavvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="91319092"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="91319092"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 05:35:13 -0700
X-CSE-ConnectionGUID: OUnx1SkiQ+2PV5oVeXdzQQ==
X-CSE-MsgGUID: 9spcbneJQpiumjrnBq88XQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="273567343"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 02 Sep 2026 05:35:13 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x1kBK-000000002fm-2Z1C;
	Wed, 02 Sep 2026 12:35:10 +0000
Date: Wed, 02 Sep 2026 20:35:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Warning: kernel/trace/ring_buffer.c:7362 function parameter
 'rpage' not described in 'ring_buffer_read_page_size'
Message-ID: <202609022021.VfwPv41L-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Vincent-Donnefort/tracing-Fix-subbuf-resize-races-with-trace_pipe_raw-readers/20260901-165443, commit: 2b2260e053f66c7b993654c3753ef3e742dccebd"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Vincent Donnefort <vdonnefort@google.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Vincent-Donnefort/tracing-Fix-subbuf-resize-races-with-trace_pipe_raw-readers/20260901-165443
head:   41434083a7818b00622be54daa6468ef0925bcac
commit: 2b2260e053f66c7b993654c3753ef3e742dccebd tracing: Fix subbuf resize races with trace_pipe_raw readers
date:   19 hours ago
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: openrisc-randconfig-r072-20260902 (https://download.01.org/0day-ci/archive/20260902/202609022021.VfwPv41L-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.3.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260902/202609022021.VfwPv41L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609022021.VfwPv41L-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: kernel/trace/ring_buffer.c:7362 function parameter 'rpage' not described in 'ring_buffer_read_page_size'
   Warning: kernel/trace/ring_buffer.c:7362 Excess function parameter 'page' description in 'ring_buffer_read_page_size'
>> Warning: kernel/trace/ring_buffer.c:7362 function parameter 'rpage' not described in 'ring_buffer_read_page_size'
   Warning: kernel/trace/ring_buffer.c:7362 Excess function parameter 'page' description in 'ring_buffer_read_page_size'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
