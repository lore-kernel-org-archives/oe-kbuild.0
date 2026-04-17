Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A3019995E
	for <oe-kbuild@lists.linux.dev>; Fri, 17 Apr 2026 00:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776387229; cv=none; b=Zgw5AW7PCixkwi9BOCIuk8BcWax1Yv/eABxU/JLLxD3OhEGfB4LiaF9Xo/Cq3pSVo0SS1aAgceu8OqGnNwOq8rTTiYkfoMLRgEpYBSTs153Cjh0vSmnE2jrqLq7OuaOQNREip84F0gbL0NYHAJOWjkD0QYNCRcfT3Q98f6Sf5qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776387229; c=relaxed/simple;
	bh=HY0UsiRdb+RBLcO9PlViYybYw8QZEmbZ2WcSG+F3bG8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TTZkBdw2Kdhzjvi198MmC1/Nvs7l79p6UzwzGWWl3ZIOnLbuFf//vFsO4SXvF3Ej85BXFwDlahJs04vIYBbnua0nW5SXepdUM+pfOEE6O8ZEHb6k3lYTYjbrJHob56rGKog85a/pS3oW1m7YTp1kHuucKJlGYV9LIrOMwBcRAgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aTt8IJMq; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aTt8IJMq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776387225; x=1807923225;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HY0UsiRdb+RBLcO9PlViYybYw8QZEmbZ2WcSG+F3bG8=;
  b=aTt8IJMqHdip52fl+de9y1iUPdBLYG6olAU88zhCOY5Tdhz/a6ruZ26f
   yiDrh0sxeIuCURazuV7lI5XphhX25Thlf5cXavC/2IswbxB2WjEMz8nbp
   YAZSFPwIIRd+jfGnwu7U7i3F2I+wp6mDnUpkC57QWqPwo3Iv0Y8eW4uuF
   yjbD5lsxb7M1QLO3sgFscmYp74K26OD+VVZtNfb1KbwXW8s8pt9Pvsq4e
   P+quZrDHomX5cYemD2+WRgEq0Sw3z6Osoxh512P2seTP5n+v+L9KxKf9q
   03AJ6eK49DLeJIKOuTDpjFBzEbJpwiDh2temcwNranM4ukNC6EHJ7GJmd
   Q==;
X-CSE-ConnectionGUID: xA9CYQuOQ16QReNvf76FgQ==
X-CSE-MsgGUID: 2hs750WeSP6x98W4wQl0kQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="94969403"
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; 
   d="scan'208";a="94969403"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 17:53:44 -0700
X-CSE-ConnectionGUID: HRkKYQ7NToykTbfG1CcXqg==
X-CSE-MsgGUID: g5vkpVj/S8eK4A6Q+Juzzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; 
   d="scan'208";a="235254667"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 16 Apr 2026 17:53:44 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wDXSo-000000001AD-1ytX;
	Fri, 17 Apr 2026 00:53:42 +0000
Date: Fri, 17 Apr 2026 02:52:56 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v6 3/3] pinctrl: aspeed: Add AST2700 SoC0 support
Message-ID: <202604170229.G4h5ENS6-lkp@intel.com>
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
In-Reply-To: <20260414-upstream_pinctrl-v6-3-709f2127da33@aspeedtech.com>
References: <20260414-upstream_pinctrl-v6-3-709f2127da33@aspeedtech.com>
TO: Billy Tsai <billy_tsai@aspeedtech.com>
TO: Lee Jones <lee@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Joel Stanley <joel@jms.id.au>
TO: Andrew Jeffery <andrew@codeconstruct.com.au>
TO: Linus Walleij <linusw@kernel.org>
TO: Billy Tsai <billy_tsai@aspeedtech.com>
TO: Bartosz Golaszewski <brgl@kernel.org>
TO: Ryan Chen <ryan_chen@aspeedtech.com>
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-aspeed@lists.ozlabs.org
CC: linux-kernel@vger.kernel.org
CC: openbmc@lists.ozlabs.org
CC: linux-gpio@vger.kernel.org
CC: linux-clk@vger.kernel.org

Hi Billy,

kernel test robot noticed the following build warnings:

[auto build test WARNING on af4e9ef3d78420feb8fe58cd9a1ab80c501b3c08]

url:    https://github.com/intel-lab-lkp/linux/commits/Billy-Tsai/dt-bindings-pinctrl-Add-aspeed-ast2700-soc0-pinctrl/20260416-181713
base:   af4e9ef3d78420feb8fe58cd9a1ab80c501b3c08
patch link:    https://lore.kernel.org/r/20260414-upstream_pinctrl-v6-3-709f2127da33%40aspeedtech.com
patch subject: [PATCH v6 3/3] pinctrl: aspeed: Add AST2700 SoC0 support
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: openrisc-randconfig-2052-20260416 (https://download.01.org/0day-ci/archive/20260417/202604170229.G4h5ENS6-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.3.0
dtschema: 2026.5.dev2+g3579443c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260417/202604170229.G4h5ENS6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604170229.G4h5ENS6-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc0-pinctrl.yaml: patternProperties:-state$:allOf:2: 'then' is a dependency of 'if'
   	hint: Keywords must be a subset of known json-schema keywords
   	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml
>> Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc0-pinctrl.yaml: patternProperties:-state$:allOf:2: 'then' is a dependency of 'else'
   	hint: Keywords must be a subset of known json-schema keywords
   	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
