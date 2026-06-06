Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB113081BE
	for <oe-kbuild@lists.linux.dev>; Sat,  6 Jun 2026 04:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780721914; cv=none; b=Dq3JHGOsq1ZhWXJU+Odnu+8SeWpz57fOg8WZClVN2+qwOeFDibyoH4VFGmYdp1oh3nbgSAqAZYX8wmEpVRisXdCwtklrC+i/VF2rRaRA7FF7YTy03XqBOMzlIsWad8foRGDKCMTSZH59JNkclG94QSwQexT7EtIAVPsqT3+XqM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780721914; c=relaxed/simple;
	bh=VfQ7IYnrZrlGBlGmW32KCT4ty61Lg4b2YIQaav367QM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Q3GoAq0s7gFwpBE4rMbU1PyV6NZIQcLwBwYUg4z52aUBxDl+h1NTxClFlvyHi7SMEZQiP2zCouCLgv3on4QwDWe5tm195/yxb/NiCHxNJmlXSMA7V+lBYmw+g18Qu/+aGYXkyygrh6Cb7tCsSrYPh+HXB/GkmXKwL31BDID6tKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LA4yqiqf; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LA4yqiqf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780721913; x=1812257913;
  h=date:from:to:cc:subject:message-id;
  bh=VfQ7IYnrZrlGBlGmW32KCT4ty61Lg4b2YIQaav367QM=;
  b=LA4yqiqftQ+6rKQU7nPzXa7S6+z8ZLBqA8n2GZsb0aQRvLk8WLlyO/8b
   Km0dy0fQAmIyXhz8fltqd6qcDc0LITqvVrFo3hzKHghtAzfaswjaEpA1e
   Q9T1gtz+PKOmbFxu0MtnQIZKhuyAOODHVqTZ+hCwIOz1p5EZZwwx5l4GY
   xikfDUQtBGaf7ZP5O1R0bWGkHCCh4p9guZQ+ecRPEN9yl9Et5KiXHsFkQ
   W5e26SMcsxkXYtnkh5OHD7016n69uAZ1ZtVtiUctYWtUGbKVB+f3+it1C
   jpaX0zTCCObGS0fRa2kRFU87wuX2YhxkAqP+xw0ylPPhrO2mA4VlxmUGW
   g==;
X-CSE-ConnectionGUID: qp5M17L5Q7q43rVqy5btXA==
X-CSE-MsgGUID: SEynRBUHTRKrI7J63PaSnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11808"; a="85437093"
X-IronPort-AV: E=Sophos;i="6.24,190,1774335600"; 
   d="scan'208";a="85437093"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 21:58:32 -0700
X-CSE-ConnectionGUID: 2NqwrTpKSVmxFFPOn7CsEw==
X-CSE-MsgGUID: +2FjNhcrQluokDiUC4wddA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,190,1774335600"; 
   d="scan'208";a="268707210"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 05 Jun 2026 21:58:31 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVj77-000000002lR-0LUR;
	Sat, 06 Jun 2026 04:58:29 +0000
Date: Sat, 06 Jun 2026 06:57:38 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android16-6.12 8/8] ncdevmem.c:364:33:
 warning: unused variable 'queues'
Message-ID: <202606060614.cc44bF2X-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

Hi Cosmin,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   468e09dd6f52610d73a09cbbb28a2e7d4b940431
commit: d308312acd0cbbf40b97a018eff5659b09660fae [8/8] tests/ncdevmem: Fix double-free of queue array
:::::: branch date: 9 hours ago
:::::: commit date: 1 year ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260606/202606060614.cc44bF2X-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260606/202606060614.cc44bF2X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606060614.cc44bF2X-lkp@intel.com/

All warnings (new ones prefixed by >>):

   ncdevmem.c: In function 'do_server':
>> ncdevmem.c:364:33: warning: unused variable 'queues' [-Wunused-variable]
     364 |         struct netdev_queue_id *queues;
         |                                 ^~~~~~

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
