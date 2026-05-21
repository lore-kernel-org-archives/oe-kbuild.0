Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D0022F01
	for <oe-kbuild@lists.linux.dev>; Thu, 21 May 2026 08:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779350638; cv=none; b=tXCtf8ZeE64O1P0sWk2XGIqvdgnopA8t1reIsshdY28eU+tJRkF49l1k0GbkFQ3YflYfFGkIhFLdSJKa5zIgqQdSXKUtQ0ralos1XMLOyrMfzapkdxRjfFNJUppj4tMIBDvMLYKjispXrjrCof+D8ozXc8Niz3xVZ4lVJjWKXL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779350638; c=relaxed/simple;
	bh=edIuQxO3FKrEgH7D/xhuqJc7Y7pgbXTeIZcmgCtnXPE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jOklTh5jmU8EvCt77dpqcP6kBFoPdmYp9gIlWNqZl/q/OiMNVXaVIP7FFSJ7mX+UcBVtjYWh0cDy2QTFDi657mdqISpj1THz+Aa8E5dOYHsb2BsWU8fj8v4lBHyjloSQpXY+naOOXCUN9UYXy10Fo+8r6MxmgZsAEE3s39xUKWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CjIwkq+B; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CjIwkq+B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779350636; x=1810886636;
  h=date:from:to:cc:subject:message-id;
  bh=edIuQxO3FKrEgH7D/xhuqJc7Y7pgbXTeIZcmgCtnXPE=;
  b=CjIwkq+B2mJmC4HdyDiCp8owEj2mFTU7LQ/zA0IDn03QinmTCZ9ftZYH
   5BgAEW2pYFuld4Q6V+Kvg8weqAQ0iME8Z1KVU5gz4Rq1bBurg5W6gGH7/
   id8Mq8wNlwEawWQHFvU4I4Z8P86PjUWRPoNDWmCr7c7pvEsYdfHmVKKyd
   6Kx58ysRxqSessBO95gmBnVWsBgaO4+NwMIqhsHNOrqBSidaYlhLxkjJz
   2iY8d+c14F+DmP9ABSnKGSU4d/uwsuhVSZizAkF6yJu7xJ3S5QWM202Ox
   C9MtZGE9oGsljkTEDWsZ47sd3cF8qYMrHFCfOabuYqanYnCkWOOdRNCjd
   g==;
X-CSE-ConnectionGUID: Zx21euEfQTWmkh1X2kbMXQ==
X-CSE-MsgGUID: TkD4vfK4TfqrDoWElILnZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="79292039"
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="79292039"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 01:03:56 -0700
X-CSE-ConnectionGUID: IPHjCJo9QK6WpFRAyWmpjA==
X-CSE-MsgGUID: k1OSi6HxTGunjFSp8EkzcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="244454426"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 21 May 2026 01:03:54 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPyNk-00000000Aoh-0BMI;
	Thu, 21 May 2026 08:03:52 +0000
Date: Thu, 21 May 2026 10:03:19 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [lee-mfd:for-mfd-next 15/37]
 Documentation/devicetree/bindings/mfd/khadas,mcu.yaml: properties:fan-supply:
 '$ref' is not one of ['description', 'deprecated']
Message-ID: <202605210923.g6CzFpCp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Lee Jones <lee@kernel.org>
TO: Ronald Claveau <linux-kernel-dev@aliel.fr>
CC: Lee Jones <lee@kernel.org>
CC: linux-doc@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
head:   29305fb8c8ac7bca36d151c4d58a6d7486a8b13c
commit: df27899a5830da82506f1c06a9c8a469e359f88b [15/37] dt-bindings: mfd: khadas: Add new compatible for Khadas VIM4 MCU
:::::: branch date: 15 hours ago
:::::: commit date: 2 weeks ago
config: microblaze-randconfig-2051-20260521 (https://download.01.org/0day-ci/archive/20260521/202605210923.g6CzFpCp-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 8.5.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260521/202605210923.g6CzFpCp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605210923.g6CzFpCp-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   Documentation/devicetree/bindings/net/wireless/qcom,ipq5332-wifi.yaml: properties:qcom,smem-states:items:1: 'anyOf' conditional failed, one must be fixed:
   	'items' is a required property
   	'minItems' is a required property
   	'maxItems' is a required property
   	from schema $id: http://devicetree.org/meta-schemas/items.yaml
   Documentation/devicetree/bindings/net/wireless/qcom,ipq5332-wifi.yaml: properties:qcom,smem-states:items:2: 'anyOf' conditional failed, one must be fixed:
   	'items' is a required property
   	'minItems' is a required property
   	'maxItems' is a required property
   	from schema $id: http://devicetree.org/meta-schemas/items.yaml
>> Documentation/devicetree/bindings/mfd/khadas,mcu.yaml: properties:fan-supply: '$ref' is not one of ['description', 'deprecated']
   	from schema $id: http://devicetree.org/meta-schemas/core.yaml
   Documentation/devicetree/bindings/sound/samsung,tm2.yaml: properties:i2s-controller:items:0: 'anyOf' conditional failed, one must be fixed:
   	'items' is a required property
   	'minItems' is a required property
   	'maxItems' is a required property
   	from schema $id: http://devicetree.org/meta-schemas/items.yaml
   Documentation/devicetree/bindings/sound/samsung,tm2.yaml: properties:i2s-controller:items:1: 'anyOf' conditional failed, one must be fixed:
   	'items' is a required property
   	'minItems' is a required property
   	'maxItems' is a required property

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
