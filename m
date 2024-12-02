Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEDB4F9E6
	for <oe-kbuild@lists.linux.dev>; Mon,  2 Dec 2024 01:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733102954; cv=none; b=dA4wlogViatxj9CL8KrYflyhl9VcZOR67w4N7J0rynboUQetETgIXILExehM/f/8hLVb4Q/TehUQduTYErIKwXbJ6wRpyYwEkXeGiP1vI2KelifguIpVDz0U2YZrI2ny/LaBtm23RIWIpyv8MKnjxwSBwL8IppcbTdhoSHaZGzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733102954; c=relaxed/simple;
	bh=5HFPr40AJ8gwALbphp+1zZmibK6Hg7JctmpVSllpnPU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IOesztW2Qh+9ue2v2tCYzPAIjVp/is6KpX1OkQ+W/xT6SzdLgR9r5L67O2NLfcSeNh1FdNKweevEmYN947FS6GB6XoQGWF1ljfk9352Xi4CLGo3FEg3BoIlK35h31GcQieM14TBNU1k0fjmLRTgUJx9t8KxtcraSv0Z8G/MTS/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BtMkiKs6; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BtMkiKs6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733102952; x=1764638952;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5HFPr40AJ8gwALbphp+1zZmibK6Hg7JctmpVSllpnPU=;
  b=BtMkiKs6kdB7LJNBvieTuVF1ld11wGKb0IH2qv3nmAIMDd7FNLFAI3is
   4e8ewPHkBgbUFsMXrcHbgDLdRf5xXCAt/XfvxqQHEGiSjpTq0Y2jSu8rR
   FmrVomftBeX3QKgsdPeuujD+4OsIpsv/VvXcRIQe47bcZ505QmwC8EezX
   XHg3l0L3IPCH/HYXZyY9+sGPs4dtneBJ6VpNlYYP2xFrgVFNW6GvUA+50
   Ldjmn2HjvbORVuTjyU29sEpBLmzPSfwWKuEi1eI4QrR1GFImdHG1vNit0
   aSYPLNVOSQV/R8EBxXmJ3KVHDalGs8GQiKFDwbFreeZSDjx23ch4SyxL5
   g==;
X-CSE-ConnectionGUID: KOYDLi4lRJued43Rx5zBRw==
X-CSE-MsgGUID: 1XbEC+gbS+G8RBP86ptPQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11273"; a="33002479"
X-IronPort-AV: E=Sophos;i="6.12,201,1728975600"; 
   d="scan'208";a="33002479"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2024 17:29:11 -0800
X-CSE-ConnectionGUID: 1qV/qAykQtOahlWk7+sbTg==
X-CSE-MsgGUID: vwvhhkHxTVaPYbB9sMbtNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,201,1728975600"; 
   d="scan'208";a="97737102"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 01 Dec 2024 17:29:11 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHvFL-0001zV-2c;
	Mon, 02 Dec 2024 01:29:07 +0000
Date: Mon, 2 Dec 2024 09:28:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/mips/boot/dts/ralink/rt2880.dtsi:8.9-10.5: Warning
 (unit_address_vs_reg): /cpus/cpu@0: node has a unit name, but no reg or
 ranges property
Message-ID: <202412020922.vE1Y4yqn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Rob Herring <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   40384c840ea1944d7c5a392e8975ed088ecf0b37
commit: 3e95dfb315de27bb6c6d7012659e396eb5b91e5e dt-bindings: Don't error out on yamllint and dt-doc-validate errors
date:   4 years ago
:::::: branch date: 3 hours ago
:::::: commit date: 4 years ago
config: mips-randconfig-051-20241116 (https://download.01.org/0day-ci/archive/20241202/202412020922.vE1Y4yqn-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
dtschema version: 2024.12.dev3+g93ee800
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241202/202412020922.vE1Y4yqn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412020922.vE1Y4yqn-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/mips/boot/dts/ralink/rt2880.dtsi:8.9-10.5: Warning (unit_address_vs_reg): /cpus/cpu@0: node has a unit name, but no reg or ranges property
--
>> arch/mips/boot/dts/ralink/rt3883.dtsi:8.9-10.5: Warning (unit_address_vs_reg): /cpus/cpu@0: node has a unit name, but no reg or ranges property
--
>> arch/mips/boot/dts/ralink/mt7620a.dtsi:8.9-10.5: Warning (unit_address_vs_reg): /cpus/cpu@0: node has a unit name, but no reg or ranges property

vim +8 arch/mips/boot/dts/ralink/rt2880.dtsi

d99e19c799a6b4 arch/mips/ralink/dts/rt2880.dtsi John Crispin 2013-04-12 @8  		cpu@0 {

:::::: The code at line 8 was first introduced by commit
:::::: d99e19c799a6b48a5c6d733f5885862df5c77c70 DT: MIPS: ralink: add RT2880 dts files

:::::: TO: John Crispin <blogic@openwrt.org>
:::::: CC: Ralf Baechle <ralf@linux-mips.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
