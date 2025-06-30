Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0A0288520
	for <oe-kbuild@lists.linux.dev>; Mon, 30 Jun 2025 12:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751284851; cv=none; b=u6r8pPg56xwuk83e1OQth9ZapuKVQn0gSNZkIX6YB0yOoQhsQ7kTldV51TeYhco6AMc/FCM/xgmAiRKAlGN4TFCrNis/RPjEkDGvYMkY6ZvkLjg8YoDGdWYXEXcq/xmEN+0/sAWtn09WMkyCWjlTiOvh3BlrnZzxoM9x0R5J52c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751284851; c=relaxed/simple;
	bh=Hv3BrnnfyqVH6x/XfvO0Fw339rBS4PZljlqOAv/IIk8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gSZ7WSfSglMG6WuImmonFhNDQKUMfa3odjST47YxS7rtth9izYYVo2pgWeS3OE0Fk8JUc26pXZArnJqh3Ml/CI9Nv/NY6ciK1sHcCbvGetkVss1Qm3A2eR3S7052jqKa7/CXtFLa6TTQue3q17wjTz+4ewgg90euMCiBhiBcyhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m9tvFP1J; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m9tvFP1J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751284849; x=1782820849;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Hv3BrnnfyqVH6x/XfvO0Fw339rBS4PZljlqOAv/IIk8=;
  b=m9tvFP1JTd7qgaayZitXBaE19xkfn7oW0A+rItRjA4cq3MqQwcZA7Y7p
   8Np1P7yL23PHWlAkDAwggnxVY+jd4BmWqrrwb603BfaGUq9d307cF0xHS
   0H1C3R+SrrQN9kvOJ+x87nE9a0wWvSjS5Q0N0FDbzw25o3nzJJHY183KW
   SUOxa+EVxik6L5NQCqc01c9JiH8bGWAksC8pWikPvQ7l/vPNWPxudABHW
   OkeaSgLUgK4LH3e0b9K3ijyP/i9714wsPFhl9LUL1cyDaeVEybid2iK9+
   zPP45/kUYI46YRvqZZwDNOpfU76QYBKJwPlTPDOjdECR0VpenxvDtHORX
   A==;
X-CSE-ConnectionGUID: n1qIS6b6SQ+Ld30bonC6iw==
X-CSE-MsgGUID: 0XlWtrC+QVC/9czSUH31lA==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="53600486"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="53600486"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 05:00:49 -0700
X-CSE-ConnectionGUID: aR/fqE6tSEqT00CDKul+zA==
X-CSE-MsgGUID: 55d/BAVTREmwf2zIkC/CFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="152827641"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 30 Jun 2025 05:00:47 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWDBl-000Ywa-2D;
	Mon, 30 Jun 2025 12:00:45 +0000
Date: Mon, 30 Jun 2025 19:59:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [arm-integrator:b4/genexis-xg6846b-v6.16-rc1 8/10]
 arch/arm/boot/dts/broadcom/bcm6846-genexis-xg6846b.dtb: switch@0
 (marvell,mv88e6085): Unevaluated properties are not allowed
 ('#address-cells', '#size-cells' were unexpected)
Message-ID: <202506301928.CxWpLHir-lkp@intel.com>
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
TO: Linus Walleij <linus.walleij@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/genexis-xg6846b-v6.16-rc1
head:   5420b6e9c9c247c32861570d0332ec5376c283a8
commit: a58c76fa47514e22d425dac1995032f23556606a [8/10] ARM: dts: bcm6846: Add Marvell switch and SFP
:::::: branch date: 12 days ago
:::::: commit date: 12 days ago
config: arm-randconfig-051-20250627 (https://download.01.org/0day-ci/archive/20250630/202506301928.CxWpLHir-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project e04c938cc08a90ae60440ce22d072ebc69d67ee8)
dtschema version: 2025.6.1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250630/202506301928.CxWpLHir-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506301928.CxWpLHir-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/broadcom/bcm6846-genexis-xg6846b.dts:236.20-300.4: Warning (avoid_unnecessary_addr_size): /bus@ff800000/mdio@2060/switch@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm/boot/dts/broadcom/bcm6846-genexis-xg6846b.dtb: switch@0 (marvell,mv88e6085): Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/marvell,mv88e6xxx.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
