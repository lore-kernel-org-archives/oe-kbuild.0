Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B60F01D9A54
	for <oe-kbuild@lists.linux.dev>; Sat, 20 Dec 2025 14:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766242754; cv=none; b=A35wKJoum7mDYka1k7KRCWN7hgfrcrAxtUnxHvMoaT1CoYNORxFUlkIAUGb5JLv5Mh5RKQpg6PtS12ZHDS/X+oOjyJrYf3P7REvGJzQ4K2IjAtMSjNiOAWhnN5j3D9jj+Ji0ipwPooJazkHtuWfpcbARXI7y9RBSHRSib6MPcBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766242754; c=relaxed/simple;
	bh=SO5UcAQeFO+d7L+vmSDW3XB3tUDBrdqiVezB4ZFBn9M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O3UhblUhPBlaIIRsrK+CuyI1qSmUPwxo170gmM488EtcAEYoXd8R4l4eLe4ox+bIL+PcHX5/xt1uddyWf+kDY6EhpmH8jM4hsuSzLlzjXvEepAXBaleEtPbaKNYmXJPMSMVaBNp8e72AUZD02t0X5/YWvWSu3e02FWcHImislEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ndZlMpw6; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ndZlMpw6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766242753; x=1797778753;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SO5UcAQeFO+d7L+vmSDW3XB3tUDBrdqiVezB4ZFBn9M=;
  b=ndZlMpw6AFeq0JAzVO/ydxp8rKVF7EM6FeYvXaEE2+IXn1qnA7bjXOdE
   FPs8bhmnNbpFn3kGvDfbupSYgy++vSsuGo7NVfgiuZGtmGz6u2f2qAmQ+
   O+QwwHTQbXhD9IdOULcMxr9+HcmQ4nTUgcECai2YG10Bcqe8DVCobqI4q
   iJFUojrLcYQKsTYJLzdseB6rJ56xtJjwIXChdNXM9zd5tkHEaOqCXwTPo
   apRMlLXvxM8qisf9FCPAL7o9qYSg8OccN1xn5CD3FmeYJXM5WVfPvO4Yv
   SghU61Gc3a9LQzPvWM3f0ZAO3AFxL2CjT6dJh4naWLIVN2SkTghBdqgm8
   w==;
X-CSE-ConnectionGUID: RtJZE97oRpeNGsD6yybsjg==
X-CSE-MsgGUID: IBC/L7zoTpqR9w521jAkzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="78493908"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="78493908"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 06:59:13 -0800
X-CSE-ConnectionGUID: +QiCVTzUTMe/HeDt5Z4P3g==
X-CSE-MsgGUID: rZ9RMjClQNWUWsFZtBiRvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="203639808"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 20 Dec 2025 06:59:12 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWyQG-000000004hL-3yeu;
	Sat, 20 Dec 2025 14:59:08 +0000
Date: Sat, 20 Dec 2025 22:59:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 2323/2671]
 drivers/clk/qcom/tcsrcc-kaanapali.c:140:1: sparse: sparse: bad integer
 constant expression
Message-ID: <202512202243.Xm9Hq4F3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/clk/qcom/tcsrcc-kaanapali.c:140:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Taniya Das <taniya.das@oss.qualcomm.com>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Dmitry Baryshkov <lumag@kernel.org>
CC: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
CC: Abel Vesa <abel.vesa@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
commit: e5682c953f5a9fbaad060ea000beff80f11c4048 [2323/2671] clk: qcom: Add TCSR clock driver for Kaanapali
:::::: branch date: 2 days ago
:::::: commit date: 3 days ago
config: nios2-randconfig-r122-20251219 (https://download.01.org/0day-ci/archive/20251220/202512202243.Xm9Hq4F3-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251220/202512202243.Xm9Hq4F3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512202243.Xm9Hq4F3-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/clk/qcom/tcsrcc-kaanapali.c:140:1: sparse: sparse: bad integer constant expression
   drivers/clk/qcom/tcsrcc-kaanapali.c:140:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/clk/qcom/tcsrcc-kaanapali.c:141:1: sparse: sparse: bad integer constant expression
   drivers/clk/qcom/tcsrcc-kaanapali.c:141:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/clk/qcom/tcsrcc-kaanapali.c:141:1: sparse: sparse: bad integer constant expression
   drivers/clk/qcom/tcsrcc-kaanapali.c:141:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +140 drivers/clk/qcom/tcsrcc-kaanapali.c

e5682c953f5a9f Taniya Das 2025-12-09  139  
e5682c953f5a9f Taniya Das 2025-12-09 @140  MODULE_DESCRIPTION("QTI TCSR_CC Kaanapali Driver");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
