Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55161CD2C
	for <oe-kbuild@lists.linux.dev>; Fri,  2 Oct 2026 01:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790905335; cv=none; b=bd8YLAdqxJaPI8V7B1Z6WILNOqhZtwTvBdMyB8L6qQlfJvH+1TRoDjdsxsPymkp54UNSgiY0EzEkmWQ80apyBvwt3JLqNipLX6tcNyaq2oXtx2DjKRXEhqJrkzdfl5KyUZg6o4Vpfn9N4jubLBMUR6sd/YjOtGHeoXQpW1m3g+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790905335; c=relaxed/simple;
	bh=8fGRhLw2oW4EA9JYpakO7n4EvsWwg38hJ8ARdU2p1uU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ltMBp8ckKYg9lWKbfAthvwi05h0B+sh4wURqDs2XpHJPaCsWBCm6YsPJinzp3azO2hdB4KTncr9Lr8PeGb30GJP9fwwBqqx7U1sMu/wZIRGV3xl3z4Hibexyxm7yuJcD+AQLvEMARxzJM0Tkiu08TJ8Pbf9LtHOGMLu+ut7HHjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lGH7aL9H; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lGH7aL9H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790905334; x=1822441334;
  h=date:from:to:cc:subject:message-id;
  bh=8fGRhLw2oW4EA9JYpakO7n4EvsWwg38hJ8ARdU2p1uU=;
  b=lGH7aL9HN/0fhroUdMHfeD6Es/kd1CwqSJazqLgcqDWkViuqQOiclHZS
   1g4ID+7q1dgkJQ5JOStrvzKqbqw2GrVAFrr0NEAkDvsrD6NxbXCUHe95S
   OXABdwXTfi59m3771DnsDp9otsPtYi7vIe0xvBYOWLiGLdJhX0ynN/V/E
   KKups5aSu4LZeukdDBgzqiLoHiJfSQ8Egx5DxmuwuBQqIyEWB6ZxEFvZU
   Fk3Ei8AF1kRjwGvkeq9kn+ZVcVb62BO5/MQswqjRmUHFnDuuqo2eEFNQ6
   jT4abXW2oqnJy8Rz+F/uoXpUejeyuS8er2etA7O9YAN7qgFLwZvoJ8ej1
   A==;
X-CSE-ConnectionGUID: 6avNCf1EQtqZ8ibgiwvDHA==
X-CSE-MsgGUID: woeMzgeLQsGHEiHDFIUsNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="109160465"
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="109160465"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 18:42:13 -0700
X-CSE-ConnectionGUID: Zc62umaTRYKxieJnZ8kM1Q==
X-CSE-MsgGUID: RRFcb4E3Tha4bEEgFufaIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="275678023"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 01 Oct 2026 18:42:12 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCSHp-00000000SZw-3xsZ;
	Fri, 02 Oct 2026 01:42:09 +0000
Date: Fri, 02 Oct 2026 09:41:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/hwtracing/coresight/coresight-cfg-pmu-pulse.c:51:20:
 warning: initialization discards 'const' qualifier from pointer target type
Message-ID: <202610020947.8oXLgX2C-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Amir-Ayupov/coresight-Add-pmu_pulse-extout_pulse/20260930-233744, commit: 2906079546bf3a56f4104268fc0912c780570e93"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Amir Ayupov <aaupov@fb.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Amir-Ayupov/coresight-Add-pmu_pulse-extout_pulse/20260930-233744
head:   2906079546bf3a56f4104268fc0912c780570e93
commit: 2906079546bf3a56f4104268fc0912c780570e93 coresight: Add pmu_pulse/extout_pulse
date:   19 hours ago
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: arm64-randconfig-1002-20261002 (https://download.01.org/0day-ci/archive/20261002/202610020947.8oXLgX2C-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261002/202610020947.8oXLgX2C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610020947.8oXLgX2C-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hwtracing/coresight/coresight-cfg-pmu-pulse.c:51:20: warning: initialization discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     .feat_ref_names = pmu_pulse_ref_names,
                       ^~~~~~~~~~~~~~~~~~~


vim +/const +51 drivers/hwtracing/coresight/coresight-cfg-pmu-pulse.c

2906079546bf3a Amir Ayupov 2026-09-30  45  
2906079546bf3a Amir Ayupov 2026-09-30  46  struct cscfg_config_desc pmu_pulse_etm4x = {
2906079546bf3a Amir Ayupov 2026-09-30  47  	.name = "pmu_pulse",
2906079546bf3a Amir Ayupov 2026-09-30  48  	.description = "Pulse ETM external output 1 on every traced cycle for the PMU\n"
2906079546bf3a Amir Ayupov 2026-09-30  49  	"to count as TRCEXTOUT1\n",
2906079546bf3a Amir Ayupov 2026-09-30  50  	.nr_feat_refs = ARRAY_SIZE(pmu_pulse_ref_names),
2906079546bf3a Amir Ayupov 2026-09-30 @51  	.feat_ref_names = pmu_pulse_ref_names,
2906079546bf3a Amir Ayupov 2026-09-30  52  };
2906079546bf3a Amir Ayupov 2026-09-30  53  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
