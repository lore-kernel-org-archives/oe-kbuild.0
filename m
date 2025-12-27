Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F7D1A317D
	for <oe-kbuild@lists.linux.dev>; Sat, 27 Dec 2025 06:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766816739; cv=none; b=G3IDs5UoGLRw0z45hnbOkQs0n+yXL8Lxsdu0WLUb0eoi6ZfV6xTgx57Qn4CuVCOoNcai168g8tHKZOPuqH03N+r2ICrNwTANEqdna+kLfOVdl3g29PuOR6un2TndDv9UxAZqvfESDMGD91oGPghQ0gozyDzWyHbx8wlGhxDT/vA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766816739; c=relaxed/simple;
	bh=HQekEaIDGNJtCBSIw5G5BWZE0h4n0dYk2S4fT1S1WNo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z29rJvR+r3bIEG5SGFqVbvhko2XL9/+9Un2M+0JZ5qU6U+ppk84AYtNIkkZt3t0e2e4s5hncubUcMGmASpkHx8e982fWuNfhw0D1ldgfwGc/fBxn91ZMd+ZZpQ7NgF7h54qspYUyWSVaCzwTAzqsaax/y/zs2pMiZCrQZTYN4+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qb8uoaKl; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qb8uoaKl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766816737; x=1798352737;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HQekEaIDGNJtCBSIw5G5BWZE0h4n0dYk2S4fT1S1WNo=;
  b=Qb8uoaKlwO5TKEtuUEQUNgllW2eeGzcKTRQPaHdiDQF8V7eM/XTfNPG9
   tslbXYcMY2IiLGEkfBC9lxHfQ2ZJixEQtdU6s8bSvSQTyfn0ynzmDeCZa
   IURlTMmoBVxyElNkdfMfJ1MZos69jB71RtRj6HmpjU8o1uyoqUNBaJX0H
   p6Dty5/NPJm5j5Ow71WenrqIGhFRt+WdrROug3Tr05bfrAQ1PxFzLnT/+
   Esod5VXVLksc9gyclBDMDPXr3/aNc3fle4eumOCKCcwkyExPdoQb5owyK
   /m8J+8RRzdJ4j9SXouta4eEy5VLtGAqc1asP7rxh7caRYS2bV30tw/CRn
   w==;
X-CSE-ConnectionGUID: xT+MrQTQSouXcXCRZA1Kuw==
X-CSE-MsgGUID: 0yz13MHcTAOL1PqusQpsAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11653"; a="79653780"
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="79653780"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2025 22:25:36 -0800
X-CSE-ConnectionGUID: ag86io+dQx+9tq/f/oszBA==
X-CSE-MsgGUID: Jzn29yb/QSaeleXaYzr6ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="205550855"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 26 Dec 2025 22:25:36 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZNk5-0000000078C-1Fa5;
	Sat, 27 Dec 2025 06:25:33 +0000
Date: Sat, 27 Dec 2025 07:25:16 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/mips/boot/dts/ni/169445.dtb: / (ni,169445): 'model' is a
 required property
Message-ID: <202512270746.CisuHUSW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Rob Herring (Arm)" <robh@kernel.org>
CC: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c53f467229a78287efa5b9f65bd22de64416660f
commit: 4f0b3cd7b664e662e9c4480e8d58574ece8aea57 MIPS: dts: Always descend vendor subdirectories
date:   4 weeks ago
:::::: branch date: 3 hours ago
:::::: commit date: 4 weeks ago
config: mips-randconfig-2051-20251227 (https://download.01.org/0day-ci/archive/20251227/202512270746.CisuHUSW-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251227/202512270746.CisuHUSW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512270746.CisuHUSW-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/mips/boot/dts/ni/169445.dtb: /: failed to match any schema with compatible: ['ni,169445']
>> arch/mips/boot/dts/ni/169445.dtb: / (ni,169445): 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/mips/boot/dts/ni/169445.dtb: /ahb@1f300000/nand@0: failed to match any schema with compatible: ['gpio-control-nand']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
