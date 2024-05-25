Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 006F410F2
	for <oe-kbuild@lists.linux.dev>; Sat, 25 May 2024 02:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716604163; cv=none; b=cveki1stsWnJNhxHPHKhTtpEvzxqNbezWXA3wx8+EpXtRst3be48V6quv9sGUjOYgnjjM/1r0XMoi14TBCczaxCcoJG4aBXekMbK4brgE7E28T4CYuATy0Y6O49NPjzizkQwlfkSDznIqC129H4479yxy+CSAYPx+ZWV2cmAhEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716604163; c=relaxed/simple;
	bh=STb+ooFt5wRk0VQHEl0UM4LNr4WtwClEyw7xv9sj9bA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HRKegyVfcphnjTA/Z/JhaHARTo43xBLIiDtyJ7bcO1+KMKpGb+91GUkoMeT4uroluixmLo50bC2spdQ8rpSM8hk4en1LXNwHILuaV6d7uQvUXSJcLzCVqb3q0CkALWtZ4nofzeROROIkC/gmvTH+YVw8ZbeIQ5xwF56xY/mi8lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gh+gf6F2; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gh+gf6F2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716604162; x=1748140162;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=STb+ooFt5wRk0VQHEl0UM4LNr4WtwClEyw7xv9sj9bA=;
  b=Gh+gf6F2x9ZQ/Xo2WAI6LMQKXvjklQlSJynyufPgrhFqtj0cioduwPcv
   TY0mLzcgSMZ56aczqNQjQS0kQAQgllAyZR/MP1wEY1YTuELxAl1GVQfTm
   aymoeGMI3atNy6oxyC9tWolkvAxwaDpDPDZZ/JT6Ywsueg61WK+cDXIe4
   PfAbfFb2al0kTuGvmDO4hZRYWOxxYA44Jbr/+VPzjHeCv+lsM35vEWVdq
   9dV7Uq30G2rmn8FFcKiEY5iECVtc3Oc1lizOgHLsxkddLh5oVI65gN9Ov
   5f2VGAlzJ8tW8mcDyGeZZwmk6x76ZsdnxD+poVwqWrmcxKeOn63dFn0L6
   w==;
X-CSE-ConnectionGUID: rYPl9B3TRqaWEudW4t0ffg==
X-CSE-MsgGUID: FvS36uJISaqeQd+qXjbr5g==
X-IronPort-AV: E=McAfee;i="6600,9927,11082"; a="30511375"
X-IronPort-AV: E=Sophos;i="6.08,187,1712646000"; 
   d="scan'208";a="30511375"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2024 19:29:21 -0700
X-CSE-ConnectionGUID: xVOc+1vHQtiIv+EMDDFALg==
X-CSE-MsgGUID: 5OPrMnKWRTmaAQlRvvcw4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,187,1712646000"; 
   d="scan'208";a="34119784"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 24 May 2024 19:29:19 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sAh9p-0006NT-0n;
	Sat, 25 May 2024 02:29:17 +0000
Date: Sat, 25 May 2024 10:28:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [ti:ti-rt-linux-6.6.y-cicd 31/55] dtbs_check:
 Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml: oldi-txes:
 Missing additionalProperties/unevaluatedProperties constraint
Message-ID: <202405251034.LVi793WD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml: oldi-txes: Missing additionalProperties/unevaluatedProperties constraint"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: vigneshr@ti.com
CC: nm@ti.com
TO: Aradhya Bhatia <a-bhatia1@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.6.y-cicd
head:   01e1dc239f2d2e61c92f01e905c6bffffc482084
commit: 3b549896c49187c3e33f2c569350d41d7d3f8918 [31/55] dt-bindings: display: ti,am65x-dss: Add OLDI properties for AM625 DSS
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 7aa382fd7257d9bd4f7fc50bb7078a3c26a1628c)
dtschema version: 2024.5.dev4+ga5bbb3e
reproduce: (https://download.01.org/0day-ci/archive/20240525/202405251034.LVi793WD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202405251034.LVi793WD-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml: oldi-txes: Missing additionalProperties/unevaluatedProperties constraint

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
