Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B91F7209696
	for <oe-kbuild@lists.linux.dev>; Tue, 18 Mar 2025 11:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742296430; cv=none; b=PFa5aAUub926Lj8u/O3LrpI5cHLiB+Pcl+dsRnFBQq0ogeyAmmpjMfgPyOqpoGhmFVBL9zjMCmCTSlfY6SunkIw64Ui3imLKsj136LNoT5ltQQUYpb6+AOGHHlIHuTlxtfbWhcv+XwWQ1ctTn3+2/VmKE8FCfwG3XUJKhjU2tkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742296430; c=relaxed/simple;
	bh=WV2GRW3DB+z+0FVqhvRvcatEsa0+PnLK2kL/QUro9GE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SsAr6VuHJM+pkvFkqdIf+2BJxD/ViQeuqhetAmUO08r8Zd09mF1KVAMieDX4nzrQhixrRikjG+vViJuYoYHQ0KSZBw+mIxLJJ6Ejz+IY8HAVdozkGXm7ZX4hPv1YzuiPhGExJSJtUf0EVQ8oBTW7HwP9tCWu9Yv71R2PKJQxrqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SVKKgs5b; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SVKKgs5b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742296424; x=1773832424;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WV2GRW3DB+z+0FVqhvRvcatEsa0+PnLK2kL/QUro9GE=;
  b=SVKKgs5bzSmCEKcCgiihV3iU94EBOkVodC46tq2cKLjEFyUAj3tYn2VW
   oX87qyhekileJo2WDZZFuM9yW528Z9/Ab8onOIdidY/Cz0ywH+J4anTmZ
   pvG+JmkvALveCEyZLPOQpvWNjejynVsPm+bhcuoTAlRXjFtX/nS5w55da
   pwaYQm1m303z64NVtm9ZHiiomuBKTLJgFfRB8XKuLu+RWeyntY0ifzzz0
   Pp6LdL4BKyQZ8YGJRWJKrZ4kD1nQpcWpDhg4ZKYj6zYnP41ipMqWw4Y6q
   z6sGVPq5kxBt8ILAUyBjM0qoWJCyAX4vUodfzC1ROxygzjnlhaWjBuCuo
   Q==;
X-CSE-ConnectionGUID: Hmyp80yVTyizwLfhVxi6hw==
X-CSE-MsgGUID: W0/yDfXsRWeuvxP2fm86jg==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="54423648"
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; 
   d="scan'208";a="54423648"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2025 04:13:44 -0700
X-CSE-ConnectionGUID: q4a167/0TVmw2lowAph4Wg==
X-CSE-MsgGUID: EMFilompQDmRhwHT060Jdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; 
   d="scan'208";a="122391897"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 18 Mar 2025 04:13:43 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tuUtA-000DhH-2b;
	Tue, 18 Mar 2025 11:13:40 +0000
Date: Tue, 18 Mar 2025 19:12:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [geert-renesas-devel:renesas-dts-for-v6.16 42/43]
 arch/arm64/boot/dts/renesas/r8a779f4-s4sk.dtb: ufs@e6860000: Unevaluated
 properties are not allowed ('nvmem-cell-names', 'nvmem-cells' were
 unexpected)
Message-ID: <202503181935.nSVCAhPv-lkp@intel.com>
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
CC: linux-renesas-soc@vger.kernel.org
TO: Geert Uytterhoeven <geert+renesas@glider.be>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v6.16
head:   4c78b0707043146e31671548c813f07ddddd24f7
commit: 0a9b5c03bfb55a451ffc9a67bd01754244905198 [42/43] arm64: dts: renesas: r8a779f4: Add UFS tuning parameters in E-FUSE
:::::: branch date: 25 hours ago
:::::: commit date: 25 hours ago
config: arm64-randconfig-051-20250318 (https://download.01.org/0day-ci/archive/20250318/202503181935.nSVCAhPv-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2025.3.dev4+g7b57675
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250318/202503181935.nSVCAhPv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503181935.nSVCAhPv-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r8a779f4-s4sk.dtb: ufs@e6860000: Unevaluated properties are not allowed ('nvmem-cell-names', 'nvmem-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/ufs/renesas,ufs.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
