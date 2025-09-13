Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD17A927
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Sep 2025 02:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757731699; cv=none; b=Uvm8rlWN7NftL9ywBnDqdIBRzoZFXlTVQQm6WkXD5bg2+feZztjPicA0Kc0XRp3bd1MxQA26zJtkdXx4Orf12/Sgsju5xaEwF8R2ac65juwkhxo+V65cP4z3Edm6UknKeFxCcr0H8US3b/p/8ZLXDu27CE+hoV1xxyCgMiBbEHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757731699; c=relaxed/simple;
	bh=eiFNAkSajCS1sBA7633Q/zEVU3Ez9G4j0H1KJR2trx8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jyaAPZX+6VFjXfFiAq7+fOjHzHKj7Du+1KRIkY+/+joYp2gHyGBaM4frEfpumdQje+fTOqnqgw4bagwA91r/e6DMoDZB3kRxjHFpPS+NR/ZY3/cMUSTdoy8MQZuAJo23wgpLA60xA7ti2sKrR2Ogerypf6DRPDlTo4CO/BNKaC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BRHA0IyU; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BRHA0IyU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757731697; x=1789267697;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eiFNAkSajCS1sBA7633Q/zEVU3Ez9G4j0H1KJR2trx8=;
  b=BRHA0IyUEo0Tfmcg3upu73RkI79YQmvkbR/rDBEONbK3gg/uHlamL1tY
   ZgFBDC0Jd71qtWftrevFZRTKr5lSM40zcVg6gVSm10vMR74MORfNAgaKA
   F2mEZX0dxxJUiSZp3pfwVq6zNsKdAaLHdU5nrrlxeWeHtwJW5DtajIR92
   c80xsTYtfAhcT1PJsWbUthLB6M9Y+TVwmXd/cbxx+m0NCqO3o5B4i7NeE
   LBRJbwYlg8vVUKrXBwSLbI1Q/zOhH+L2zpbEbBHCdRk8vhDSs8+PbOg9j
   9fEiY8NM1mFjPPIJRkpKyW8vtyvbz+AzEBYGfQl9Ex8XWPLJegUumMIFh
   A==;
X-CSE-ConnectionGUID: 1/m2wLksQ/e1GTx/k4xuig==
X-CSE-MsgGUID: S8GSEPliRue1e/UqZO6waw==
X-IronPort-AV: E=McAfee;i="6800,10657,11551"; a="77688130"
X-IronPort-AV: E=Sophos;i="6.18,260,1751266800"; 
   d="scan'208";a="77688130"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2025 19:48:15 -0700
X-CSE-ConnectionGUID: DcIbKQPtQbu3r8iLfvziYQ==
X-CSE-MsgGUID: WLb7p/CdS8G3oBRoNMim2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,260,1751266800"; 
   d="scan'208";a="197857277"
Received: from lkp-server02.sh.intel.com (HELO eb5fdfb2a9b7) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 12 Sep 2025 19:48:13 -0700
Received: from kbuild by eb5fdfb2a9b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uxGJ9-0001K4-20;
	Sat, 13 Sep 2025 02:48:11 +0000
Date: Sat, 13 Sep 2025 10:48:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [broonie-ci:20250912_sbinding_support_reading_subsystem_id_from_device_tree
 1/2] Documentation/devicetree/bindings/sound/cirrus,cs35l41.yaml:
 cirrus,subsystem-id: missing type definition
Message-ID: <202509131006.HCA8MLoe-lkp@intel.com>
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
TO: Stefan Binding <sbinding@opensource.cirrus.com>
CC: Mark Brown <broonie@kernel.org>
CC: linux-doc@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git 20250912_sbinding_support_reading_subsystem_id_from_device_tree
head:   6a7fa83fafcf594a3d2454b15afbae4e09c804fc
commit: 2c71a94a882e2536a43256144c6102b865407c1f [1/2] ASoC: dt-bindings: cirrus,cs35l41: Document the cirrus,subsystem-id property
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: csky-randconfig-052-20250913 (https://download.01.org/0day-ci/archive/20250913/202509131006.HCA8MLoe-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.4.0
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250913/202509131006.HCA8MLoe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509131006.HCA8MLoe-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/sound/cirrus,cs35l41.yaml: cirrus,subsystem-id: missing type definition

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
