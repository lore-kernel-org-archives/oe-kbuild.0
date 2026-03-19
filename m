Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F6037E2E6
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Mar 2026 13:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773926485; cv=none; b=bVTZ4eOMrlROqkfySAdbSLJQ3DOk+YW0WefM9pHiAH42oWTW17ko4i5o2Wzevvgt3FvS4sgCP+iWT2yDvUAzduXi5CI+bLY7GR8LN/BTTD+NFi/PiC+HqQv5RAbJTzCBO10D9zwzbEVomzc+HR3zEXNLlLx2GDBzVMTPlU54XGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773926485; c=relaxed/simple;
	bh=hYDOgXS5CllcuMXZBynMSYOvpilrzuKfFf1FTXvEeXs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S1cVYR6ihhTKr+UzbzoKrq1aYF1bx/HcDRCMXwv4GQrojzbZW94zL1ugCjPuKgKsDrySGznAzp5I7eAOSYr5a41EidJximmRxRYO5x3kQbybQcJRQoWfTccOTUwK5qmm40pnkTxbtlKM0op0Hu0hZ5rmC/fgM9zKNW8oVPCA8aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LpxjWO7s; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LpxjWO7s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773926483; x=1805462483;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hYDOgXS5CllcuMXZBynMSYOvpilrzuKfFf1FTXvEeXs=;
  b=LpxjWO7s8bDMyrCnavcc5YDkd77J7OpVDeJP2etH5wsjSStBGgmgy2TU
   9pY83y3Ga7iXNOzvLSJ6E9mUHYltpqxJQlZTOdAsW+9RFBmSyhyf3s9Fa
   rE3jT67U5uUt1syfp0rNBBsn78fwi8VAYrPY+gZO6RgXCXEEH4Ow1HNK7
   9nMfm0VIcyyvMZNELq7UkdM6b8OfRo1huQ2bmv1HV3Lr0F5MEh0asbH6f
   DB6NVyNMf8RcFpBCvvJJ3GX5s/o/UiWT4zgxzlxL3a3AWOWLrYTNunkkW
   WudlQdPL9tsChTZOoC8NYQj5robOuoRbWdZCGqUKVsu6J7FdCfrLsMCu5
   g==;
X-CSE-ConnectionGUID: IVRTXf7+QWCqJ1mhAdtUFg==
X-CSE-MsgGUID: JsMpb4NsQxyPAnTr6DGetA==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="74909119"
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="74909119"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 06:21:21 -0700
X-CSE-ConnectionGUID: exXpA+2oSpOTlvEb418Zgg==
X-CSE-MsgGUID: GZwxQNTeQzKBUWo8L47GVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="222062326"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 19 Mar 2026 06:21:20 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3DJN-000000004pd-2i4z;
	Thu, 19 Mar 2026 13:21:17 +0000
Date: Thu, 19 Mar 2026 14:20:31 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/2] dt-bindings: Add clock guard DT description
Message-ID: <202603191441.roNW39GN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260318-feature-clock-guard-v1-2-6137cb4084b7@bruker.com>
References: <20260318-feature-clock-guard-v1-2-6137cb4084b7@bruker.com>
TO: Vyacheslav Yurkov via B4 Relay <devnull+V.Yurkov.EXT.bruker.com@kernel.org>
TO: Michael Turquette <mturquette@baylibre.com>
TO: Stephen Boyd <sboyd@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: linux-kernel@vger.kernel.org
CC: linux-clk@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: Vyacheslav Yurkov <uvv.mail@gmail.com>

Hi Vyacheslav,

kernel test robot noticed the following build errors:

[auto build test ERROR on 4f3df2e5ea69f5717d2721922aff263c31957548]

url:    https://github.com/intel-lab-lkp/linux/commits/Vyacheslav-Yurkov-via-B4-Relay/clk-Add-clock-controller-guard/20260319-151001
base:   4f3df2e5ea69f5717d2721922aff263c31957548
patch link:    https://lore.kernel.org/r/20260318-feature-clock-guard-v1-2-6137cb4084b7%40bruker.com
patch subject: [PATCH 2/2] dt-bindings: Add clock guard DT description
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
config: openrisc-randconfig-2051-20260319 (https://download.01.org/0day-ci/archive/20260319/202603191441.roNW39GN-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.5.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260319/202603191441.roNW39GN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603191441.roNW39GN-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[3]: *** [Documentation/devicetree/bindings/Makefile:26: Documentation/devicetree/bindings/clock/clock-controller-guard.example.dts] Error 1
   make[3]: *** Deleting file 'Documentation/devicetree/bindings/clock/clock-controller-guard.example.dts'
   make[3]: Target 'dt_binding_check' not remade because of errors.

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/clock/clock-controller-guard.yaml: ignoring, error parsing file
--
>> Documentation/devicetree/bindings/clock/clock-controller-guard.yaml:28:13: mapping values are not allowed here
--
>> Documentation/devicetree/bindings/clock/clock-controller-guard.yaml:4:6: [error] string value is redundantly quoted with any quotes (quoted-strings)
   Documentation/devicetree/bindings/clock/clock-controller-guard.yaml:5:10: [error] string value is redundantly quoted with any quotes (quoted-strings)
>> Documentation/devicetree/bindings/clock/clock-controller-guard.yaml:28:13: [error] syntax error: mapping values are not allowed here (syntax)
   Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml:52:2: [warning] wrong indentation: expected 2 but found 1 (indentation)
   Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml:84:1: [warning] too many blank lines (2 > 1) (empty-lines)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
