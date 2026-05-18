Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4BF33F99FB
	for <oe-kbuild@lists.linux.dev>; Mon, 18 May 2026 14:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779115502; cv=none; b=Ki04Z27zw6b7IDAwMmh8cCfdGGB112UWj3SmZ/6lgo5LlzAZkrVXT98MC53xW/2XMPFa9ByvHihtQq58h1ci5rJDjrZJX6uY2jdUrMiJZgMo9/kF5RshEb4d8KDlWQ5P4E2GwFGSQsIuy+holjjIkzU3W9S35NIyqPHm1E0OytY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779115502; c=relaxed/simple;
	bh=S5nvHgXJ53HsXqDXjwZ+XwEhgHs3y8tJLJQpLFK4s48=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZQ7D/9mWdc5YaJ2+bLNUlnj7Lt21QHZD1HXWi9mrQfUuPv9tr8CKFpAldvAl0tm8gUcpibbNgy6KghYSf+k96MnEhOo66BIlBjHVsIP3yd3LBceIwbN1KDwhsrorgiHrRzekzdNS4T2IVDnjUZDz7kFuojdnXhKraiQEnnBuXfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YJRs2hTR; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YJRs2hTR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779115500; x=1810651500;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S5nvHgXJ53HsXqDXjwZ+XwEhgHs3y8tJLJQpLFK4s48=;
  b=YJRs2hTRMHWoMDBl6QdJtaSE0ftfHtcJaxXYxDiNBEa7yZEwP8xMf6kI
   +4U5MjrncZVeg9D4VuNHPdl/ze/6PnR2huLQcKgVft+6AcwlUHYjHqHhA
   AXGjRmZUd67BV19HbvR5iYlEZ++i1aR5jGB+diip4RNO39u/fafQTtx5Y
   CdMW/yg1g/jtg+FZZfZy8JPMBGyRzOgwbe7fS4L2LyaULcDsl3QdL2a4V
   wMu8OiZ7EeYMqTBihAAnq8b24PSey3/yWWTFkBrKg00OjqjINrqSeaJxU
   40RreIgKDgzl6CgzKdT352OBYgETtpBN+6JCmh179h+9VZ4+XdguOJrQ7
   A==;
X-CSE-ConnectionGUID: cmQE13fzTDqb2I3daq4HHA==
X-CSE-MsgGUID: v61NwinxRLyTwNnWuQPveQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="79949873"
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="79949873"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 07:45:00 -0700
X-CSE-ConnectionGUID: H46IrHOEShSEtuA9J0V3JA==
X-CSE-MsgGUID: p5AbJHEhQ5m90SLkh4qSLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="241258018"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 18 May 2026 07:44:58 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wOzDE-000000009qL-15Hm;
	Mon, 18 May 2026 14:44:56 +0000
Date: Mon, 18 May 2026 16:44:10 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 2/2] ASoC: codecs: nau8360: Add support for NAU83G60
 amplifier
Message-ID: <202605181614.vVgzEdaG-lkp@intel.com>
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
In-Reply-To: <20260518024704.118613-3-YLCHANG2@nuvoton.com>
References: <20260518024704.118613-3-YLCHANG2@nuvoton.com>
TO: Neo Chang <YLCHANG2@nuvoton.com>
TO: broonie@kernel.org
CC: lgirdwood@gmail.com
CC: perex@perex.cz
CC: tiwai@suse.com
CC: robh@kernel.org
CC: krzk+dt@kernel.org
CC: linux-sound@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: alsa-devel@alsa-project.org
CC: neo.chang70@gmail.com
CC: kchsu0@nuvoton.com
CC: sjlin0@nuvoton.com
CC: Neo Chang <YLCHANG2@nuvoton.com>

Hi Neo,

kernel test robot noticed the following build errors:

[auto build test ERROR on broonie-sound/for-next]
[also build test ERROR on linus/master v6.16-rc1 next-20260508]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Neo-Chang/ASoC-dt-bindings-nuvoton-nau8360-Add-NAU83G60/20260518-104921
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20260518024704.118613-3-YLCHANG2%40nuvoton.com
patch subject: [PATCH v2 2/2] ASoC: codecs: nau8360: Add support for NAU83G60 amplifier
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: arc-randconfig-2051-20260518 (https://download.01.org/0day-ci/archive/20260518/202605181614.vVgzEdaG-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 12.5.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260518/202605181614.vVgzEdaG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605181614.vVgzEdaG-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[3]: *** [Documentation/devicetree/bindings/Makefile:26: Documentation/devicetree/bindings/sound/nuvoton,nau8360.example.dts] Error 1
   make[3]: *** Deleting file 'Documentation/devicetree/bindings/sound/nuvoton,nau8360.example.dts'
   make[3]: Target 'dt_binding_check' not remade because of errors.

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/sound/nuvoton,nau8360.yaml: ignoring, error parsing file
--
   Documentation/devicetree/bindings/pci/toshiba,tc9563.yaml: properties:i2c-parent:items:1: 'anyOf' conditional failed, one must be fixed:
   	'items' is a required property
   	'minItems' is a required property
   	'maxItems' is a required property
   	from schema $id: http://devicetree.org/meta-schemas/items.yaml
   Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.yaml: properties:qcom,smem-states:items:0: 'anyOf' conditional failed, one must be fixed:
   	'items' is a required property
   	'minItems' is a required property
   	'maxItems' is a required property
   	from schema $id: http://devicetree.org/meta-schemas/items.yaml
>> Documentation/devicetree/bindings/sound/nuvoton,nau8360.yaml:25:53: mapping values are not allowed here
   Documentation/devicetree/bindings/remoteproc/qcom,msm8996-mss-pil.yaml: properties:qcom,smem-states:items:0: 'anyOf' conditional failed, one must be fixed:
   	'items' is a required property
   	'minItems' is a required property
   	'maxItems' is a required property
   	from schema $id: http://devicetree.org/meta-schemas/items.yaml
   Documentation/devicetree/bindings/remoteproc/qcom,sc7180-mss-pil.yaml: properties:qcom,smem-states:items:0: 'anyOf' conditional failed, one must be fixed:
   	'items' is a required property
   	'minItems' is a required property
   	'maxItems' is a required property
   	from schema $id: http://devicetree.org/meta-schemas/items.yaml
--
>> Documentation/devicetree/bindings/sound/nuvoton,nau8360.yaml:25:53: [error] syntax error: mapping values are not allowed here (syntax)
--
>> Documentation/devicetree/bindings/sound/nuvoton,nau8360.yaml:25:53: mapping values are not allowed here

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
