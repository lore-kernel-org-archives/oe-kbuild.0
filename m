Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE7B156C69
	for <oe-kbuild@lists.linux.dev>; Wed, 19 Mar 2025 16:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742400622; cv=none; b=G3P2bfl8sYbNn8uN5DmZ6XC+eiTf3ATiVhS8bzg4FkKr8KCaZRMt66AzbZP/KLdq+W9NAUMkbCSY+XHVuCKv2vu4YVpmNdJAOgWI2VOYYoNz2Vtny1ixDBqt/ru6N5xrnoTkIWAV2wOVK7oT82mTF6qpjzf7ZqJ3s3u4ltRU4mU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742400622; c=relaxed/simple;
	bh=u4wQsr60RjivSgGNwK/e/IefMMf0AIpq6/HfAMYh6R8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ouJ2CQAdb3khXEkFyDvOOCU0jDJ5WAsdo+cJ0Slj5ipfA5nCQn6rKUg0Ce7pnvUZpTFXTjp6pyQImWZlYLLQGIkRmNyhDGVBzCKI9/SFncJ0q+LWHDbb8V2WxXYD1ZdMwwkkmv1susSK34d5t9FdhMxyMG+0Nx6L/aGemOFXgdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dd3mF3oR; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dd3mF3oR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742400620; x=1773936620;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u4wQsr60RjivSgGNwK/e/IefMMf0AIpq6/HfAMYh6R8=;
  b=dd3mF3oR5s03oRABWk2tse/QSx9To+ZzMY/jH2g2zhe1S6JiBwga63Wr
   Ivg7eK6/lNhLqAbM1157j47Xzyk26d3ZMnsZ3An+eHC4kjJNlVjPq1+Np
   ARFJBuij32oYPEv1oXLWz50ncVfnzu4MpNQGL+QzEPZ0SG3Qv7Khtwek7
   oCSJAbz0VoO7eXwFJr694G+uhNMVl0sgat78rzU8SWoj0tBR0/GH6iYEp
   J5yTIA48PqgibRXwW/IRrk4JzkPkBWZyyaOsP7R3117AEjucH5bYv7agD
   LkdMVmNnf0cqXsXgPbgYEDCc3uE2DZB1b+YL6FwuC4ah6khhiNfhpjLW8
   g==;
X-CSE-ConnectionGUID: MatEsnVUQhuthftXKNaFdQ==
X-CSE-MsgGUID: vXiZz1FVQ1qp7fwbGWfTfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11378"; a="53814869"
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; 
   d="scan'208";a="53814869"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2025 09:10:20 -0700
X-CSE-ConnectionGUID: il3xRqUOSXSrnq2Tdn23wQ==
X-CSE-MsgGUID: zBPvXvSrTuWLb/Apa0WALw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; 
   d="scan'208";a="159873237"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 19 Mar 2025 09:10:19 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tuvzk-000FUg-2I;
	Wed, 19 Mar 2025 16:10:16 +0000
Date: Thu, 20 Mar 2025 00:09:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [morimoto:sound-msiof-2025-03-18-2 10/11]
 arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-ard-audio-da7212.dtb:
 sound@ec5a0000: clock-names: ['ssiu.0', 'ssi.0', 'clkin', 'adg'] is too long
Message-ID: <202503200052.hwnzBuJN-lkp@intel.com>
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
TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

tree:   https://github.com/morimoto/linux sound-msiof-2025-03-18-2
head:   920e565f45c3b4a2065fdab49586b975b90f1712
commit: d81af996adf1d323fc687d303333bd7ee446148a [10/11] arm64: dts: renesas: r8a779g0: Add missing adg clock
:::::: branch date: 35 hours ago
:::::: commit date: 35 hours ago
config: arm64-randconfig-051-20250319 (https://download.01.org/0day-ci/archive/20250320/202503200052.hwnzBuJN-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema version: 2025.3.dev5+g0f9dc23
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250320/202503200052.hwnzBuJN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503200052.hwnzBuJN-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-ard-audio-da7212.dtb: sound@ec5a0000: clock-names: ['ssiu.0', 'ssi.0', 'clkin', 'adg'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/renesas,rsnd.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-ard-audio-da7212.dtb: sound@ec5a0000: clock-names:3: 'adg' is not one of ['ssi.0', 'ssiu.0', 'clkin']
   	from schema $id: http://devicetree.org/schemas/sound/renesas,rsnd.yaml#
--
>> arch/arm64/boot/dts/renesas/r8a779g2-white-hawk-single-ard-audio-da7212.dtb: sound@ec5a0000: clock-names: ['ssiu.0', 'ssi.0', 'clkin', 'adg'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/renesas,rsnd.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g2-white-hawk-single-ard-audio-da7212.dtb: sound@ec5a0000: clock-names:3: 'adg' is not one of ['ssi.0', 'ssiu.0', 'clkin']
   	from schema $id: http://devicetree.org/schemas/sound/renesas,rsnd.yaml#
--
>> arch/arm64/boot/dts/renesas/r8a779g3-white-hawk-single-ard-audio-da7212.dtb: sound@ec5a0000: clock-names: ['ssiu.0', 'ssi.0', 'clkin', 'adg'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/renesas,rsnd.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g3-white-hawk-single-ard-audio-da7212.dtb: sound@ec5a0000: clock-names:3: 'adg' is not one of ['ssi.0', 'ssiu.0', 'clkin']
   	from schema $id: http://devicetree.org/schemas/sound/renesas,rsnd.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
