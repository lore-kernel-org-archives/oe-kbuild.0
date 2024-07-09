Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82BA92B9D4
	for <oe-kbuild@lists.linux.dev>; Tue,  9 Jul 2024 12:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720529132; cv=none; b=TQy2hwEwIQyWGL8RSO2u/+eKy/wg5Qk0HuMzbXo0puO9qR+SheaG6T2iKrj2aNdGsZSndbIN3bLpxZrHZr7Q7xw2fcDwLgDhfbk1A/efVRM6dR4lbtMSz8V+1hPnhsaizLcc6B1gPHUJz7PzxzU+qW4vE4CVxZ+K5b0oMmDs1QY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720529132; c=relaxed/simple;
	bh=qHRzDPYIiJFbMBeajRuBUf7vzuQ1evd+Mr0Jy9HXCgw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XSL7IAE5gDeYC9m1rxl+ZJaGqlJi6XaC2WIxSJRYeu2ER2KqKhgcIO8d+dsCTHPh2aixmxJS7Yk8L4cMoM5/EuOOl12+3dUWxBv44BpW1KAzmH1ovpvzYagzTQYIQhnsoQII7CUHZ2P9TKsRmnLfevFYux7AUGbbpY1rqFYn89o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Iv8ITn60; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Iv8ITn60"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720529130; x=1752065130;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qHRzDPYIiJFbMBeajRuBUf7vzuQ1evd+Mr0Jy9HXCgw=;
  b=Iv8ITn60Mru7/T72+h8/exbSZ+yBUAac+nQTqqyffukkvtOZNpIUcDKc
   S1sSIDoNIjLBbY1/a9dp3zGjGMgkyGqPU3jGuA3e0kPHinPZqSnIWOyfO
   Ko42kDDaOwbVgeGjxToAeLb2LvsdqIhfybgEXaXtffqdLqHGbIkpBBN/b
   0qU/1LiZPCKzWAJFX4q9r/rHJsAK84pl27N8RJYSFSYCi761Wf8bA0EQb
   MFzuwbmFPszJHz7K1d5wwSOWTIr+laTOP+/kXTYKrFje38KmOIjvdUhDX
   60ZvLTVV5JY+sWQsEY8R/mtFLfEhDfnr/xgLccCB8+lvY/IoAa6GM1h9g
   w==;
X-CSE-ConnectionGUID: ZRRuLgplRiCBPWjuHCkZ3Q==
X-CSE-MsgGUID: 6ZZoJcI8Sq+zhADexGw6uQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="28383187"
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; 
   d="scan'208";a="28383187"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2024 05:45:29 -0700
X-CSE-ConnectionGUID: 4XIIvKKVQD2gG0b9h1BkZA==
X-CSE-MsgGUID: KF6D5nlVRKm5cP1jwe7VVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; 
   d="scan'208";a="52662067"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 09 Jul 2024 05:45:28 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sRADm-000WgE-1y;
	Tue, 09 Jul 2024 12:45:26 +0000
Date: Tue, 9 Jul 2024 20:45:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [cip:linux-6.1.y-cip 43/44]
 arch/arm64/boot/dts/renesas/r9a08g045s33-smarc.dtb: regulator-vcc-sdhi1:
 Unevaluated properties are not allowed ('gpios' was unexpected)
Message-ID: <202407092017.KXJYKxF4-lkp@intel.com>
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
TO: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
TO: Pavel Machek <pavel@denx.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-6.1.y-cip
head:   36ec072fc37c836df41fdb600a933321aa4804bd
commit: 10856d08795dbc4727c7e5d8b192e885a88e9694 [43/44] arm64: dts: renesas: rzg3s-smarc: Enable SDHI1
:::::: branch date: 29 hours ago
:::::: commit date: 3 months ago
config: arm64-randconfig-051-20240708 (https://download.01.org/0day-ci/archive/20240709/202407092017.KXJYKxF4-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240709/202407092017.KXJYKxF4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407092017.KXJYKxF4-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/renesas/r9a08g045s33-smarc.dtb: regulator0: Unevaluated properties are not allowed ('gpios' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/fixed-regulator.yaml#
   arch/arm64/boot/dts/renesas/r9a08g045s33-smarc.dtb: regulator2: Unevaluated properties are not allowed ('gpios' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/fixed-regulator.yaml#
>> arch/arm64/boot/dts/renesas/r9a08g045s33-smarc.dtb: regulator-vcc-sdhi1: Unevaluated properties are not allowed ('gpios' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/fixed-regulator.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
