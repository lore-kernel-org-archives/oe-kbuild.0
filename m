Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2421623ABBF
	for <oe-kbuild@lists.linux.dev>; Tue, 30 Dec 2025 22:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767134422; cv=none; b=F4JeaWN2Dj2P4KyCwCER4susYXA+16gg2pNwCE/piwdI4oyGWPrRltczDaS0hub5GI4iT0K/E0eLdoa55+dq7oFa77igWJee+3uitY9jtFy618QGtEgw4SidSolO5eNF2HRRXekD2jlKes3pqEwhnTYv6+zQusTyk5/4y6BtPO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767134422; c=relaxed/simple;
	bh=mSgN3PG6/qCV+I1YEWpt1wXhkjB2c8hcw7f4CSPLoSw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ttE2Kv+gWqsg28iI2D5bvCC5ceo7aNhjyjvDzgPKqoSdSoSm1gLmTvy6zJrr/IAScsMLhAlJHDXTCNZBiRK8RS07TWxFYQvJ946UtlA6ufc0tMhGhDFWlWuUHyexsQ/n6TgC200P4XN0AqwULPdw4obNg3lX/dsgG3isfUYCPdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GhDFmEeb; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GhDFmEeb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767134419; x=1798670419;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mSgN3PG6/qCV+I1YEWpt1wXhkjB2c8hcw7f4CSPLoSw=;
  b=GhDFmEebhTRziWm74g9m+bz7JB4hnDRHiqjQFUFgbf9RusA95nQ6bWFQ
   zBJPN8wT7wnJOn/sBxAmlYwDCyuOzCrXna9F/d8GSOhcQb5AzAqHP93Sz
   SYBY3nwmhDyIThjpQlqqLaTcHz/M4AZNnIq/OLiqnJNn/vlEBGgb49EmI
   LQPT7cGJ+HvmhNJ4TmQGh5F0Zd39y6eMWo4Qio8gbT0Vwxebd10uyzY3j
   c1SeENrC5j1WE6LkafEeP+9saxuVaxgcFQYmTAub2q8onTIwj7z9VelWe
   ATZbD2+qSwVwWEXfG76zU+H3go1BQbdDWIUOduu12WKQQrzBwSRLbaqPQ
   A==;
X-CSE-ConnectionGUID: 8Ma+k5zsTk2btUMx3rpJWQ==
X-CSE-MsgGUID: tftNlMJNQk2KrXuUs5h8TQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11657"; a="94185190"
X-IronPort-AV: E=Sophos;i="6.21,190,1763452800"; 
   d="scan'208";a="94185190"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 14:40:18 -0800
X-CSE-ConnectionGUID: 1n0h1Hb2SzCk2Uetum7T6Q==
X-CSE-MsgGUID: OWV58omnTYOpcZN0U6F91Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,190,1763452800"; 
   d="scan'208";a="205456886"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 30 Dec 2025 14:40:17 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vaiNz-0000000081w-11bW;
	Tue, 30 Dec 2025 22:40:15 +0000
Date: Tue, 30 Dec 2025 23:39:36 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH V1 2/3] dt-bindings: power: sbs-battery: add polling
 interval property
Message-ID: <202512302347.dqvCUEj8-lkp@intel.com>
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
In-Reply-To: <20251229085636.4082852-2-Qing-wu.Li@leica-geosystems.com.cn>
References: <20251229085636.4082852-2-Qing-wu.Li@leica-geosystems.com.cn>
TO: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
TO: sre@kernel.org
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: linux-pm@vger.kernel.org
TO: devicetree@vger.kernel.org
TO: linux-kernel@vger.kernel.org
CC: bsp-development.geo@leica-geosystems.com
CC: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>

Hi LI,

kernel test robot noticed the following build warnings:

[auto build test WARNING on sre-power-supply/for-next]
[also build test WARNING on robh/for-next amd-pstate/linux-next amd-pstate/bleeding-edge linus/master v6.19-rc3 next-20251219]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/LI-Qingwu/dt-bindings-power-sbs-battery-add-polling-interval-property/20251229-165915
base:   https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-power-supply.git for-next
patch link:    https://lore.kernel.org/r/20251229085636.4082852-2-Qing-wu.Li%40leica-geosystems.com.cn
patch subject: [PATCH V1 2/3] dt-bindings: power: sbs-battery: add polling interval property
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: openrisc-randconfig-2052-20251230 (https://download.01.org/0day-ci/archive/20251230/202512302347.dqvCUEj8-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 10.5.0
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251230/202512302347.dqvCUEj8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512302347.dqvCUEj8-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/power/supply/sbs,sbs-battery.yaml: properties:sbs,monitoring-interval-ms: '$ref' should not be valid under {'const': '$ref'}
   	hint: Standard unit suffix properties don't need a type $ref
   	from schema $id: http://devicetree.org/meta-schemas/core.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
