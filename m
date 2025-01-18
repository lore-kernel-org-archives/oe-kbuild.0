Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6236F13D24D
	for <oe-kbuild@lists.linux.dev>; Sat, 18 Jan 2025 02:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737167953; cv=none; b=ooSAafnGYAEIadwxFMCMYI3clrbE1cS+Y79gsv5MdvSuYZn+RV9WY8wsHFikfzYCvYeTRaCZ1f+NyObHn9KdS4msy5SQtvebVwuY9b9QeeY3W464o9z3sYIAtLUWciMSqzIZl9qpwQHUa0kL2TPYNX2EyrjBd2fL1KlVIXxXar4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737167953; c=relaxed/simple;
	bh=Xwbr5K2WkyE+wd3ucHer4LTzWKtJ32YUcI7abtnheA0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K+QidGusLECnGJp65QqDxOkbsJrjQjZFYo3VodXszu9fj7g00GJKCbWEC/UeY8sx+Vv5JcXJDtvvj4a85G46XFX3ElXCORiQnfAo99d0VPOY0hZeGkzNwz/s0P9DvM3bWpg07En/7BVGJH+kFgRm8Kdgktq1ZtN5/2y6Rg264og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aqYEweSB; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aqYEweSB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737167952; x=1768703952;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Xwbr5K2WkyE+wd3ucHer4LTzWKtJ32YUcI7abtnheA0=;
  b=aqYEweSBmaS1mnucggFdFxfvNAR8rS36JSkXkkXv9r5epC0q0thz0x8W
   xmB6KMRzW5PZXIm194TsGytV7kh4pJpg45Yvyaphd/SkmxayaIT7JFQG3
   grsOTrznjqekvMVx2qwcWI0X+++rhQXAGbF9x18Jfo3DOvGCub36Ik0n4
   hEfXDT73OzRcQitixJ6qrChx1Me3ItSTLmIlLLSrVB7Gm9luOuCXCt0tR
   ieUl8iLUjHtKRiwguZ6khPfLAh3Yd6bR5mntlxkIuQmLQq6KVFJaunScs
   JIshYVx+F0khSnWv+STtQQ245+QG9ZWv68ZyPbvyRNz2LAbg9foYQ2AZT
   A==;
X-CSE-ConnectionGUID: C+9BYFmYTsyFSfwgpurCdQ==
X-CSE-MsgGUID: W2bir8ZjS1i+QesTa2e5Bw==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="48284318"
X-IronPort-AV: E=Sophos;i="6.13,213,1732608000"; 
   d="scan'208";a="48284318"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 18:39:11 -0800
X-CSE-ConnectionGUID: uu+ghyf2TTK2ha1/5ruamA==
X-CSE-MsgGUID: wfLradE6Q1eMlYKJNuHnhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,213,1732608000"; 
   d="scan'208";a="110963069"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 17 Jan 2025 18:39:10 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYyjr-000U15-2J;
	Sat, 18 Jan 2025 02:39:07 +0000
Date: Sat, 18 Jan 2025 10:37:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [wens:mtk-wip 12/48]
 arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtb: sound: 'model' is a
 required property
Message-ID: <202501181025.SCh1xdKZ-lkp@intel.com>
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
TO: "Chen-Yu Tsai" <wenst@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wens/linux.git mtk-wip
head:   a2f8143f6e1e6b3d8dac24f675646fbfdfc03202
commit: a6b000ff89b3dcf151de9d173be1132eef0620e6 [12/48] arm64: dts: mediatek: mt8186: Merge Voltorb device trees
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm64-randconfig-053-20250117 (https://download.01.org/0day-ci/archive/20250118/202501181025.SCh1xdKZ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250118/202501181025.SCh1xdKZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501181025.SCh1xdKZ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtb: spmi@10015000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/mtk,spmi-mtk-pmif.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtb: sound: 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt1019-rt5682s.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
