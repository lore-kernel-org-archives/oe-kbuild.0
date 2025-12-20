Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CBE5BE5E
	for <oe-kbuild@lists.linux.dev>; Sat, 20 Dec 2025 16:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766248288; cv=none; b=VxUylyZ8z0O4uZ8CRV/jYRHz8UN21A8teenvSNi4EOZXRYZ2R1ILmSUwExEJWO9gOtwLJhm+bzQpvIKScGmK+DufxLGvvefN5EGoBPV5P+y19y/TBKju7c+wCYHXcY+zsdbGaQX18Tp16/XLqtjK8s9ZV3gPxDE9NCaaqBrEuU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766248288; c=relaxed/simple;
	bh=p6HnFL/3U2gpVrUIXJ5owUyq3HIlLPaMD4Tes0zfY1U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Jk5d94ug0OsO/bFzYtixMMsC5yiACDwXgsQY+D9bKeRB0dxi/BMS9d+mLyJd9T+29m3YdQcvG5e0S9M762jJCZ0aK9+CKT5LRSvYqg2JQpT91FwmFBReAmbUdPYXvt/+CnLjbZbP2oE0CIQ9YHwIcRvno0SqNWn5NwP5ne72HkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kCZruWKT; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kCZruWKT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766248286; x=1797784286;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p6HnFL/3U2gpVrUIXJ5owUyq3HIlLPaMD4Tes0zfY1U=;
  b=kCZruWKTlKC0t0D/bzRmqrS5d/HT5TpgYulrg5+UKHEfuAgx1cMl7b4G
   5qzzsEDP5kfiXklWeqo/IfOodgrqOpdcpKyyh5npJ/cubu4awknLV2Qz5
   iC5ij6QfPgD7AKI8NrAECZsrabuUGq9oO6o1AdPEZZrEkG5vOf8h5ZonX
   gPzrxBZ/0FPWcmcms3AVKH62WhZDp9AZI+60yqH9+4IZ7OTzA5jShaKQt
   dsiVUe7sUgmNg294u5X+boqg4JNJN3T2ivqw2Vx5eXbvyDHHx3Ee19QQS
   VRlqXYVTNWtVnoUoxT1RstjuEs06O1ulkVJ3143Z3mIyJLX3U3X1M0F7g
   A==;
X-CSE-ConnectionGUID: 2cqmSI3PSQqLbV8zmnV0RA==
X-CSE-MsgGUID: d/9Lt0QqRVuVHsRPtYEM7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="67173954"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="67173954"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 08:31:26 -0800
X-CSE-ConnectionGUID: RsTed8dHTfGo9Tl8ZpMJow==
X-CSE-MsgGUID: FX3EYQM6SW+DP5fN8OJf3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="203576677"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 20 Dec 2025 08:31:25 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWzrX-000000004sh-1N8O;
	Sat, 20 Dec 2025 16:31:23 +0000
Date: Sun, 21 Dec 2025 00:31:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 2324/2671]
 drivers/clk/qcom/gcc-kaanapali.c:3540:1: sparse: sparse: bad integer
 constant expression
Message-ID: <202512210003.K0Rx2PfO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/clk/qcom/gcc-kaanapali.c:3540:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Taniya Das <taniya.das@oss.qualcomm.com>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Dmitry Baryshkov <lumag@kernel.org>
CC: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
commit: d1919c375f211a2aeef898496b6f3efbefebf7f5 [2324/2671] clk: qcom: Add support for Global clock controller on Kaanapali
:::::: branch date: 2 days ago
:::::: commit date: 3 days ago
config: nios2-randconfig-r122-20251219 (https://download.01.org/0day-ci/archive/20251221/202512210003.K0Rx2PfO-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251221/202512210003.K0Rx2PfO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512210003.K0Rx2PfO-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/clk/qcom/gcc-kaanapali.c:3540:1: sparse: sparse: bad integer constant expression
   drivers/clk/qcom/gcc-kaanapali.c:3540:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/clk/qcom/gcc-kaanapali.c:3541:1: sparse: sparse: bad integer constant expression
   drivers/clk/qcom/gcc-kaanapali.c:3541:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/clk/qcom/gcc-kaanapali.c:3541:1: sparse: sparse: bad integer constant expression
   drivers/clk/qcom/gcc-kaanapali.c:3541:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +3540 drivers/clk/qcom/gcc-kaanapali.c

d1919c375f211a Taniya Das 2025-12-09  3539  
d1919c375f211a Taniya Das 2025-12-09 @3540  MODULE_DESCRIPTION("QTI GCC Kaanapali Driver");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
