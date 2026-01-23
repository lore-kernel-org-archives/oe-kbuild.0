Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3705D19067C
	for <oe-kbuild@lists.linux.dev>; Fri, 23 Jan 2026 18:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769193139; cv=none; b=PRHcXlZMwq74ihtizMinmTRO3Ito8ILpi15Xsbkqk77UkppgGiT9pVpYKV/+L0dI22VBzSep1SC/Cw39x9iRqFP3maX3/8YhvkatYS9u4xhwMp7kEKf2M3c5Rl3vMQ+8u0cNON9rXGs1xa+VfDYa9HyGxfcujByb+98KZM7LllQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769193139; c=relaxed/simple;
	bh=/MEo7Q+Ni2UqrxboQPHmbV9jj6vPKA+Tko9gGJFw63Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OViJjDigGFWTVhrAKRjUSGzBHRgheWMbMfhsxcLEaty1BhfKcxIXnS0OcKSQWDZE9KVhT+eiFXq1y2V7NCfAtB+Yb2zSpum7QZzKOOr83SpKcj6/ubniggi2MCC0TmethLmwG+QnoN+V4oydCbGrK17z+J4e3YwkmUHAqzflp7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eh9RtK7l; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eh9RtK7l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769193138; x=1800729138;
  h=date:from:to:cc:subject:message-id;
  bh=/MEo7Q+Ni2UqrxboQPHmbV9jj6vPKA+Tko9gGJFw63Q=;
  b=eh9RtK7liDlOnu5Higuz0v1A7Z+9AXLv4OHz8r/b1st67u2tbryVs9Fj
   6ASCxb0f1zkR6dCGbzCsnHF/+f4vU+dbhlpz31t/XLqM1fEVn+aCMP47x
   Dz5iMZXBCNMn1t5zNLCoboPVv1OgFIA1LzxtKtwpHBzMOsKglBkkEfSCV
   pcxlvHt25cAAjMSLPL1zB4CaSzkHGBRl7EQfftcpxLcKTqp4VmAefEWn6
   5d9Ndr4LH6yJo+jbg2yiZvZA2SpaxJ6e3ZlK/3pRAL82OvGDGM1cownDi
   LbNpTbXuEcm3qgsowPqGtL9JRuLWT9rJ4+g3Lyp6QNPQICQuzWD2HxlqF
   w==;
X-CSE-ConnectionGUID: tU4WJUGNTESdXB47UjYwZg==
X-CSE-MsgGUID: JBpzW0WmSfShiSajiuaCKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="81078712"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="81078712"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 10:32:17 -0800
X-CSE-ConnectionGUID: KTfQU5QNRD+bOcJQ2aHTSA==
X-CSE-MsgGUID: LNq7LnoBS3GwK/brVcubnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="211598764"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 23 Jan 2026 10:32:16 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjLx8-00000000UKg-0HeP;
	Fri, 23 Jan 2026 18:32:14 +0000
Date: Sat, 24 Jan 2026 02:31:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [baylibre-clk-meson:clk-meson-next 4/11]
 drivers/clk/meson/t7-pll.c:1071:1: sparse: sparse: bad integer constant
 expression
Message-ID: <202601240250.HlQ4419D-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/clk/meson/t7-pll.c:1071:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jian Hu <jian.hu@amlogic.com>
CC: Jerome Brunet <jbrunet@baylibre.com>

tree:   https://github.com/baylibre/clk-meson.git clk-meson-next
head:   2fe1ef40b58c2256f4682594f48bfbd584501ec5
commit: 140f074c312702a1837136e024f5df1309e37251 [4/11] clk: meson: t7: add support for the T7 SoC PLL clock
:::::: branch date: 2 weeks ago
:::::: commit date: 6 weeks ago
config: arm64-randconfig-r112-20260123 (https://download.01.org/0day-ci/archive/20260124/202601240250.HlQ4419D-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260124/202601240250.HlQ4419D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601240250.HlQ4419D-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/clk/meson/t7-pll.c:1071:1: sparse: sparse: bad integer constant expression
   drivers/clk/meson/t7-pll.c:1071:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/clk/meson/t7-pll.c:1072:1: sparse: sparse: bad integer constant expression
   drivers/clk/meson/t7-pll.c:1072:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/clk/meson/t7-pll.c:1073:1: sparse: sparse: bad integer constant expression
   drivers/clk/meson/t7-pll.c:1073:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   drivers/clk/meson/t7-pll.c:1074:1: sparse: sparse: bad integer constant expression
   drivers/clk/meson/t7-pll.c:1074:1: sparse: sparse: static assertion failed: "MODULE_INFO(import_ns, ...) contains embedded NUL byte"

vim +1071 drivers/clk/meson/t7-pll.c

140f074c312702 Jian Hu 2025-12-12  1070  
140f074c312702 Jian Hu 2025-12-12 @1071  MODULE_DESCRIPTION("Amlogic T7 PLL Clock Controller driver");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
