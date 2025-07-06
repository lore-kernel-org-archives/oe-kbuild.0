Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D49B1F9F73
	for <oe-kbuild@lists.linux.dev>; Sun,  6 Jul 2025 22:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751840094; cv=none; b=i4ymj9kSsEC6HFcFBGkQJNkkP1N6c9wDPhePdC7o9S17m99g9lHJg9TalhYHz962xm9J2ZbxBirSDm92BoCmJdjsa8snRjmaLpX/SPs1kzmfOBFT002021PAwc7R/OxJNdLIF4d6TnU240f//ToiDu1npUd3nnuR/mCjFUgd/GM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751840094; c=relaxed/simple;
	bh=gkd60VaXNKaJ152d72hPqLSIs+MCTgypKl39Vk6s47M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Atr9oFZelJ9F6P+Jtwnumb2hjP7PGnfYG7C3HQ0zO6LEoiXo+5OYHv+OSnpWAGhPw/Wwac9dsFMfQXLFgJMmxfHg9ltcN1kEH1B4OUUOCdII9IeiGNT6HcgNFPAUC5RXcoqwVFjbGz0SkConHuapVwkEpX5QLLBvyTBBAk2btyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KFFGpJcr; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KFFGpJcr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751840093; x=1783376093;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gkd60VaXNKaJ152d72hPqLSIs+MCTgypKl39Vk6s47M=;
  b=KFFGpJcrlCz33ErwKpwUo/deUrAAQ/YB6F/Z8Du6+O9Tmx9O7nrEsDGR
   53iU60QFFxhaRIN8++HjN47swkeYP22u6sAPclXB7YH10SGdOzSz31HVY
   WjfwIE9F6aiQWZxWhQtZBPZ0y9cG+r+7gcm+It0Ya+R7Z3M8/Yrt+V/p2
   ZLcF798NTinoeyCJsTe0aEB9YEq8cLI4VodpKXJ3zpM+nTUuAkz6f2WR4
   q/zlhUwsnH/71pUgIpjBNUCB6+OxhR/KNCa0np1YJd+lla0u99bdGa2v1
   yHtWA/ENZSMQfHGBcGmw7dEqdKsrLfTbq/nOTZ0SKqDZarAI3qitdwJan
   Q==;
X-CSE-ConnectionGUID: iWcrgcr+TYqweFKzwpoRcA==
X-CSE-MsgGUID: BUDcXQcARiGX0huQRea22Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="64750146"
X-IronPort-AV: E=Sophos;i="6.16,292,1744095600"; 
   d="scan'208";a="64750146"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2025 15:14:51 -0700
X-CSE-ConnectionGUID: ubn3xVlnQX2tt7+tMIdBnQ==
X-CSE-MsgGUID: nKetdCqyT6KyIlPyrF44Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,292,1744095600"; 
   d="scan'208";a="186075695"
Received: from lkp-server01.sh.intel.com (HELO def1aeed4587) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 06 Jul 2025 15:14:50 -0700
Received: from kbuild by def1aeed4587 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uYXdH-00001J-30;
	Sun, 06 Jul 2025 22:14:47 +0000
Date: Mon, 7 Jul 2025 06:13:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [arm-integrator:b4/genexis-xg6846b-v6.16-rc1 8/10]
 arch/arm/boot/dts/broadcom/bcm6846-genexis-xg6846b.dtb: switch@0
 (marvell,mv88e6085): Unevaluated properties are not allowed
 ('#address-cells', '#size-cells' were unexpected)
Message-ID: <202507070340.r7VBxMGz-lkp@intel.com>
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
head:   bfc107ef94615d4cc9281775b588c8fb72b43f82
commit: a58c76fa47514e22d425dac1995032f23556606a [8/10] ARM: dts: bcm6846: Add Marvell switch and SFP
:::::: branch date: 13 days ago
:::::: commit date: 3 weeks ago
config: arm-randconfig-051-20250627 (https://download.01.org/0day-ci/archive/20250707/202507070340.r7VBxMGz-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project e04c938cc08a90ae60440ce22d072ebc69d67ee8)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250707/202507070340.r7VBxMGz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507070340.r7VBxMGz-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/broadcom/bcm6846-genexis-xg6846b.dts:236.20-300.4: Warning (avoid_unnecessary_addr_size): /bus@ff800000/mdio@2060/switch@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm/boot/dts/broadcom/bcm6846-genexis-xg6846b.dtb: switch@0 (marvell,mv88e6085): Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/marvell,mv88e6xxx.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
