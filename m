Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80AE1AF0BB
	for <oe-kbuild@lists.linux.dev>; Sat,  9 May 2026 00:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778286202; cv=none; b=NeC1cYtUlFC+QA2NowOdjONdza6PfLN873FS+31LABIGm+kSPQNkvEpP10YUogA0KNXXoPa/Q7TG8RGBWwjQ/5lK0YP6RXyg8b7v+WIaw/9yg5PAgTtMk/U0BUVHEfCzx9Dw/xB589+9CmFUEKtWoswJeqhz4tPu4mu2ZOoO45c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778286202; c=relaxed/simple;
	bh=ZJ/wB5QTK8vOlnlBS4UwBL1+S1vTpmvbUq6v+8kcVO0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mrOhwXu4p38CyklmAz0w7ryb5Xv/hoIzAHAi7QxI687SVsGGZ6nnNh/gonlfTALCagemKpy/tOHQHxvrgvhotzb6fFxy9dCX0snG8k4jtXnzSdK0kwqGGjxNW+MU4frN46LuynG64ZbxeQjdQxtizOpr/f7uah7bhEP3yGRCz04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l3Z1gLOY; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l3Z1gLOY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778286201; x=1809822201;
  h=date:from:to:cc:subject:message-id;
  bh=ZJ/wB5QTK8vOlnlBS4UwBL1+S1vTpmvbUq6v+8kcVO0=;
  b=l3Z1gLOYe8IthdLn6AtJIlX+6fNBSgnTq7hDsRv2ZKBD9TFxbGyOKNRu
   hmcKZhWqZiDConxE+dbd/4P8sMu4bgaWuVRXk1xEWQSELgiQOf/My7K+x
   WZGpaghTwM/xwvwJNjx0IBWy8RYS6vUrcwKIPkT9HfFksebpzxhKEaM1b
   gU51gzvhUlV7DSF4yKu4sG5XU8ofrsS5fNRV71+kAZoBRwi2ZZjGXXobK
   UBdWMkUbeMDRiktOwjqxBaFleIcnK66LmWb4tG9tunJ42//GsYFwSPBYa
   jlmJz7mgiUZ58h/dDy1dy5xCpxeq3eAvegf461s7x4PChXxihCZqAINC6
   Q==;
X-CSE-ConnectionGUID: TaZ6A8H5R9SFZWnACr90GQ==
X-CSE-MsgGUID: M1J+JL5cRwyLkzxfs/rLNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11780"; a="89575216"
X-IronPort-AV: E=Sophos;i="6.23,224,1770624000"; 
   d="scan'208";a="89575216"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 17:23:20 -0700
X-CSE-ConnectionGUID: 2i9U96F7QaWAOJ3rKKw6QA==
X-CSE-MsgGUID: Dp5LsDlsTACQJIUW1H9KkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,224,1770624000"; 
   d="scan'208";a="232563848"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 08 May 2026 17:23:19 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLVTR-000000007KT-0szc;
	Sat, 09 May 2026 00:23:17 +0000
Date: Sat, 09 May 2026 02:22:45 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: 
 arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2-manta.dtb: touchscreen@48
 (ti,tsc2007): 'ti,rt-thr' does not match any of the regexes:
 '^pinctrl-[0-9]+$'
Message-ID: <202605090220.SbW0XkoH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Frank Li <Frank.Li@nxp.com>
CC: Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   cbf457c584b5cbd0d44e8f05edaf3e189e894a68
commit: 45601c66b5ddbe665937659b957e71bc8efedd46 dt-bindings: input: touchscreen: convert tsc2007.txt to yaml format
date:   10 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 10 months ago
config: arm64-randconfig-2052-20260429 (https://download.01.org/0day-ci/archive/20260509/202605090220.SbW0XkoH-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260509/202605090220.SbW0XkoH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 45601c66b5dd ("dt-bindings: input: touchscreen: convert tsc2007.txt to yaml format")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605090220.SbW0XkoH-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2-manta.dtb: touchscreen@48 (ti,tsc2007): 'ti,rt-thr' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/ti.tsc2007.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-pi2.dtb: touchscreen@48 (ti,tsc2007): 'ti,rt-thr' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/ti.tsc2007.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
