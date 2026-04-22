Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE1F280331
	for <oe-kbuild@lists.linux.dev>; Wed, 22 Apr 2026 22:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776895423; cv=none; b=C+/M5XMQ4XxF9S+6GyXVTo8asYLM+o7bUMKDpvPTGfV3TBEMwcpX3TGqpuEkwk86sZylnfRSF5IGyW55XTG12DB1yyFeuWnXMCYEH/7+8YDniUC7d4zsEuyR00tkybh/JU6J+p5RiTUg+r5Ski+Gw2bea+YGaOlapHjNtjvfgsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776895423; c=relaxed/simple;
	bh=ajE+lzLGrFi/H5ugs4zKUF1EXpsNXkVEQzuQUXNZFXg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HOhJiB2LvI7+FR+jO2GIxR8wOJATghAFPpNWLRWrE/eFkvQRmwrmoGgL5QvCkwPvazis+oYM71gslzxrBEF8SEivMxJ925m6aGAfYMthRgfcY98BNpeHEsC2xNQKNOn/sa8pjX5s9jglH2nyk8f0i2pgOHff9Cpi6gHC+/H9kOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k7EG9u4n; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k7EG9u4n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776895422; x=1808431422;
  h=date:from:to:cc:subject:message-id;
  bh=ajE+lzLGrFi/H5ugs4zKUF1EXpsNXkVEQzuQUXNZFXg=;
  b=k7EG9u4n9gYH5zOHwCiuuGPGNRY6D5Nj/IaTOudiSYMgcmrrrCq5ckyk
   WencoXrTkSX90bBUNezb7whH44WTxfOF2+rU+3DHGCCET2gGWGlNRDTBG
   qTvCZnypud7+u1ald9mhcAI8SXbFNPjzMqHJGn+mhXU2ZNp8WcEFvhoIq
   BpZUt2eI4/mGoXRkJbO+8IlV1CvgglBnpEsYeWVGiYAJu70jahITHbIHe
   Yqoy12m0h5gk8XBFUFjkpfd+NxSiNk+6u0UosdxttTGAxpVgAhd1O6xXs
   5sX7WWPQ2XzPlelJ29IUXzdx62ZmBqTagxLAEdBlIxaKlksq/Ypcrm6SE
   A==;
X-CSE-ConnectionGUID: jZbq/dE/SlCsoQ0RwLAJNw==
X-CSE-MsgGUID: 48hwMCkVRgqOkIgbF/IGcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="77875824"
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; 
   d="scan'208";a="77875824"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 15:03:42 -0700
X-CSE-ConnectionGUID: Ha9LW6eNTfKNeuB8P2SwRQ==
X-CSE-MsgGUID: gHfFvDzxQY+1M8MWZ90csQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; 
   d="scan'208";a="231430249"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 22 Apr 2026 15:03:41 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wFffW-000000002sX-0pOF;
	Wed, 22 Apr 2026 22:03:38 +0000
Date: Thu, 23 Apr 2026 00:02:38 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [anolis-intel-cloud:devel-6.6 218/218]
 tools/testing/selftests/vfio/lib/drivers/ioat/hw.h:67:35: warning: 'struct
 pci_dev' declared inside parameter list will not be visible outside of this
 definition or declaration
Message-ID: <202604230035.jb0qRkl2-lkp@intel.com>
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
TO: aubrey.li@linux.intel.com

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   db8b81c14b7031c5b1420d57fbeb18056546ddcf
commit: c87d9db7252351cec95ecaa559f4cf1823eff6d3 [218/218] anolis: tools: selftests: Sync vfio tests with upstream
:::::: branch date: 10 hours ago
:::::: commit date: 14 hours ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260423/202604230035.jb0qRkl2-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260423/202604230035.jb0qRkl2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604230035.jb0qRkl2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from tools/testing/selftests/vfio/lib/drivers/ioat/ioat.c:14:
>> tools/testing/selftests/vfio/lib/drivers/ioat/hw.h:67:35: warning: 'struct pci_dev' declared inside parameter list will not be visible outside of this definition or declaration
      67 | int system_has_dca_enabled(struct pci_dev *pdev);
         |                                   ^~~~~~~


vim +67 tools/testing/selftests/vfio/lib/drivers/ioat/hw.h

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
