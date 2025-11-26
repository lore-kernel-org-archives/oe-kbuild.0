Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B88C621B9F5
	for <oe-kbuild@lists.linux.dev>; Wed, 26 Nov 2025 21:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764192274; cv=none; b=LtCM6ZUQGKwA2bSaEJGGc0RiANQUP54F2eDDdt6OfCKbpEr9w/IDIPQ12oIm80pmJtYSnen9kzlsksTX78+N2M7O9wcV71UuoMyn2NMo452DZfiEYQCCyCdMIJfyBWmQXhNJTDobMSuo3JkBiXqy/EbFSTnTU5DFpcGHyBiLtT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764192274; c=relaxed/simple;
	bh=GnjutIIsGGPUTzxSU1zREEASfeKPljsx/ApwiGhSu64=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=diPD68QqNdUbN+h5mHZ1fdmVlFqRXtbD4F4WqBbXqxtXKyb1kdzhFVoJnGyrUlVNu5GiXt79zmaFYSNpzcgliSxwITOYqT8OmZZf9P52PPX1psR/nnO5/rAhJEDu/zxWLreY66eyzEfD9pWV0/RSkRiYc9ULWi2T7+zt7Pwpo9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XaZb9Qwi; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XaZb9Qwi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764192273; x=1795728273;
  h=date:from:to:subject:message-id:mime-version;
  bh=GnjutIIsGGPUTzxSU1zREEASfeKPljsx/ApwiGhSu64=;
  b=XaZb9QwiVGFAfsRU4MGXohj4DWA/UWSFvtCExYXXVFdIgTR9easev2nF
   dpMFVa89TL+xkZEoOFBTRDW+ofkFOCChwLvWmbs1khQPc/igOGXA+xxJj
   euxvOdEpu/EoVNLkAhmxbbFCjrXhkyNCSqfTMRmBk9/xvju5YSUCuBkvy
   8qyDT3V8pstmxaLCBZdzI/9eSSt3lEs92h4ZeNXMmtBQGkdWNn9T7aAPN
   SmURaeF1tRzRvGMLOywQoylO2xteFwz99BX95Ld/d2NSvCJ7IMUir+O5T
   fOa1A2T86K7naLGZwvL/ScnooKOXJooqakuOcUjj753Fg5Bfmvgg+HvsY
   A==;
X-CSE-ConnectionGUID: Gy8Vt4OWQRKZby/feEMyfw==
X-CSE-MsgGUID: 1eJXcxN3SG6fFJm2rhvixA==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="76867875"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="76867875"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 13:24:31 -0800
X-CSE-ConnectionGUID: An2VV33uTm+Ayc+ue8J8NQ==
X-CSE-MsgGUID: Rik7B0bBQGiOxDlN6NQ5Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="192302379"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 26 Nov 2025 13:24:29 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOMzz-000000001W5-2l39
	for oe-kbuild@lists.linux.dev;
	Wed, 26 Nov 2025 21:24:27 +0000
Date: Wed, 26 Nov 2025 22:23:44 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [conor:pinctrl 20/23] checkpatch: ERROR:SPACING: space required
 after that ',' (ctx:VxV)
Message-ID: <202511262219.R5PBASrb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Conor Dooley <conor+lkp@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git pinctrl
head:   a88950bbbc80fe53e2c773353674604d3130c443
commit: df80616e3dbbe32d3468ca6c7c5cda486ac2fd63 [20/23] pinctrl: add generic functions + pins mapper
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251126/202511262219.R5PBASrb-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:SPACING: space prohibited between function name and open parenthesis '('
#53: FILE: drivers/pinctrl/pinconf.h:164:
+#if defined(CONFIG_GENERIC_PINCTRL_BELLS_AND_WHISTLES) && defined (CONFIG_OF)

ERROR:SPACING: space required after that ',' (ctx:VxV)
#203: FILE: drivers/pinctrl/pinctrl-generic.c:139:
+							      &map,num_maps,
 							          ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#233: FILE: drivers/pinctrl/pinctrl-generic.c:169:
+								      &map,num_maps,
 								          ^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
