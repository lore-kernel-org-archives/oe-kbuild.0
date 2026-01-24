Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E741B191F92
	for <oe-kbuild@lists.linux.dev>; Sat, 24 Jan 2026 02:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769223524; cv=none; b=NJZgfn6CgXqDaEkOyTFvmrA8gvK6RvWiESmBgrUmO+iY6/zadWQw9llzxiEEpx4EXpdERsSelGEaPhyN5BOXHiCaK789iyxrecfXzJykRDvzrr3Dv+EifO6bCByruJIc+X2Bja792XCtKtDug2Rin1vfeSSXaop4es7Sa/oz3OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769223524; c=relaxed/simple;
	bh=fq0rLPvdWEEf6MYbpGULd22LH7bUIx66/uaQazkzkD0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gYAGYt40LZI/GsD7fjZ19MoutYQVTJFzhWNYEw4K/bC5Qm3lan7mWtgpk2vipc/FVyP4G71IkTMwUdTzq/xLGbDsT/aGBmxs834rQoygb9+sn3wk3I7ZO0/0SQvzb3CbGAzXE7xP+9L30z5lk9Gm0LYiNG967bufKOBM3+sKcvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FGqG4V4Z; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FGqG4V4Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769223522; x=1800759522;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fq0rLPvdWEEf6MYbpGULd22LH7bUIx66/uaQazkzkD0=;
  b=FGqG4V4ZIrkNiYMSN7fLR+4RmfpYtv+4ca4TF7mxvpl3d8wdd8BQiL8z
   9W1N+SXZRV/RTFrmHC5Ew7ACZHzOdItSXgTR4V0TW9cKFEWrJD8fE+PXR
   epHwS33LK9XEqyzjtK7NtAPQ0x2uWRqJNgf+NoqLmJphUB1HAywc4foeY
   2MMD9vpMm5Y4u2CS4PiQ1Lfvbr36rTaVPEQgTA3SHaT92DFfN8UJ4NzLb
   UTu9QVDg/YKxjI+TkEZOVGa5/bmfIM+PZwmIILUqJ4MpgvUDyEUNihxkw
   ksghuSp8hIVuksqtY75lZEa40HUXUyhZVFXYLAt9yUj/ZD1QX8O0HmA6l
   g==;
X-CSE-ConnectionGUID: HfFikc8zRdWEoLd0a1CDrw==
X-CSE-MsgGUID: /dZYlz/RQ2qJwbT2eQlaow==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="69671617"
X-IronPort-AV: E=Sophos;i="6.21,249,1763452800"; 
   d="scan'208";a="69671617"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 18:58:41 -0800
X-CSE-ConnectionGUID: daLGeQHDRWqVD9ige/A0nw==
X-CSE-MsgGUID: yoYyVL3eQwuJ84iaOOdWBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,249,1763452800"; 
   d="scan'208";a="207088792"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 23 Jan 2026 18:58:40 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjTrB-00000000Uk2-2YkR;
	Sat, 24 Jan 2026 02:58:37 +0000
Date: Sat, 24 Jan 2026 10:57:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 4/4] clk: qcom: Add base clock controllers for Eliza SoC
Message-ID: <202601241043.9ZMuPfZV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/clk/qcom/gcc-eliza.c:3159:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260123-eliza-clocks-v1-4-664f1931f8c7@oss.qualcomm.com>
References: <20260123-eliza-clocks-v1-4-664f1931f8c7@oss.qualcomm.com>
TO: Abel Vesa <abel.vesa@oss.qualcomm.com>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Michael Turquette <mturquette@baylibre.com>
TO: Stephen Boyd <sboyd@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Luca Weiss <luca.weiss@fairphone.com>
TO: Taniya Das <taniya.das@oss.qualcomm.com>
CC: linux-arm-msm@vger.kernel.org
CC: linux-clk@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Abel Vesa <abel.vesa@oss.qualcomm.com>

Hi Abel,

kernel test robot noticed the following build warnings:

[auto build test WARNING on a0c666c25aeefd16f4b088c6549a6fb6b65a8a1d]

url:    https://github.com/intel-lab-lkp/linux/commits/Abel-Vesa/dt-bindings-clock-qcom-document-the-Eliza-Global-Clock-Controller/20260123-214159
base:   a0c666c25aeefd16f4b088c6549a6fb6b65a8a1d
patch link:    https://lore.kernel.org/r/20260123-eliza-clocks-v1-4-664f1931f8c7%40oss.qualcomm.com
patch subject: [PATCH 4/4] clk: qcom: Add base clock controllers for Eliza SoC
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: riscv-randconfig-r132-20260124 (https://download.01.org/0day-ci/archive/20260124/202601241043.9ZMuPfZV-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260124/202601241043.9ZMuPfZV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601241043.9ZMuPfZV-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/clk/qcom/gcc-eliza.c:3159:1: sparse: sparse: bad integer constant expression
   drivers/clk/qcom/gcc-eliza.c:3159:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/clk/qcom/gcc-eliza.c:3160:1: sparse: sparse: bad integer constant expression
   drivers/clk/qcom/gcc-eliza.c:3160:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/clk/qcom/gcc-eliza.c:3160:1: sparse: sparse: bad integer constant expression
   drivers/clk/qcom/gcc-eliza.c:3160:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
--
>> drivers/clk/qcom/tcsrcc-eliza.c:130:1: sparse: sparse: bad integer constant expression
   drivers/clk/qcom/tcsrcc-eliza.c:130:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/clk/qcom/tcsrcc-eliza.c:131:1: sparse: sparse: bad integer constant expression
   drivers/clk/qcom/tcsrcc-eliza.c:131:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +3159 drivers/clk/qcom/gcc-eliza.c

0bace06cc542c71 Taniya Das 2026-01-23  3158  
0bace06cc542c71 Taniya Das 2026-01-23 @3159  MODULE_DESCRIPTION("QTI GCC ELIZA Driver");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
