Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B18302779
	for <oe-kbuild@lists.linux.dev>; Wed, 28 Jan 2026 15:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769615091; cv=none; b=L+7bwlQSrkhdWjlWKo36A1V4djtxsU59ur+g1mf5DowX+cixSn4lnAk4bDSIfem3VaHv4Yam9hIMF0KN+m1bUUso64KEZGhgSK5QSNtwkc1VKFnH1rzdBrMmXYrLRya1ZItD9REqzeINzWMmMmunNr4m71IpRe0rVKmI65ScnrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769615091; c=relaxed/simple;
	bh=SXn9ee6ObyieUP9WUxvZI3++OAX2s5DcXTwsaQRl9ck=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Vhf3eDWYZYolZgEfKoLi6/DfIAzD2/63p+oWM6Snu0wSqLQoSfIMoEp6YW+rml/xMWpXPwkqN8Q0q+xZUa63bQmCG1Q0nHCzXNF9FT9Yd9TLbS6X/DaTn/oXTthjtxGS6DmUKrFhar1gdDlPd+MmOC6Uab6t4K47jHSsYkG1FVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fSj4b/W4; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fSj4b/W4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769615089; x=1801151089;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SXn9ee6ObyieUP9WUxvZI3++OAX2s5DcXTwsaQRl9ck=;
  b=fSj4b/W46j3lvtSc8htHEHrQe1Nq6lEzIh/4VuUatMJDp/3kfB6SxtF7
   78ajVzRDsmuFT93MqHznSdOC/bbCb7GGV/6NBUfbIvSTOvY8PuY4cWmDg
   CQtDkl5/mFhKIvgqPB4GXRIXUAikUQNaE3JTlwxAAyCp8rAsx4hLoZtny
   YsGIVYYpw3kyshvXaQyFXahLWIj0MuI2RgVG1Ks7ByzmHhSZYDXjiyIG3
   i4qOKgx/6hwm8RpUBxyoQJ1xddIHs3xG51BehcTwApBM4uBIomdwxDfFH
   cLyqGbRL8rxyZdQdtlewpcGg5Z8uf9zZKI7twF/3kRIca9Uc1GQg50USx
   g==;
X-CSE-ConnectionGUID: Z+K1wzE+QTCxTmVFoikWoQ==
X-CSE-MsgGUID: 9p3l5RH5TlWseFhvVym1ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="93489109"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="93489109"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 07:44:48 -0800
X-CSE-ConnectionGUID: XgdLlPvjSiGOXDJtAq9VvQ==
X-CSE-MsgGUID: HAwzYwnsTyGUEkXHqdsh7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="212405731"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 28 Jan 2026 07:44:47 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vl7in-00000000253-0Prs;
	Wed, 28 Jan 2026 15:44:45 +0000
Date: Wed, 28 Jan 2026 16:44:29 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v4 1/3] dt-bindings: reset: add sky1 reset controller
Message-ID: <202601281652.7zzfQ6lJ-lkp@intel.com>
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
In-Reply-To: <20260128093611.1932770-2-gary.yang@cixtech.com>
References: <20260128093611.1932770-2-gary.yang@cixtech.com>
TO: Gary Yang <gary.yang@cixtech.com>
TO: lee@kernel.org
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: p.zabel@pengutronix.de
TO: peter.chen@cixtech.com
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: cix-kernel-upstream@cixtech.com
CC: Gary Yang <gary.yang@cixtech.com>

Hi Gary,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on lee-leds/for-leds-next pza/reset/next next-20260127]
[cannot apply to pza/imx-drm/next linus/master v6.16-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Gary-Yang/dt-bindings-reset-add-sky1-reset-controller/20260128-174335
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20260128093611.1932770-2-gary.yang%40cixtech.com
patch subject: [PATCH v4 1/3] dt-bindings: reset: add sky1 reset controller
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
config: microblaze-randconfig-2051-20260128 (https://download.01.org/0day-ci/archive/20260128/202601281652.7zzfQ6lJ-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 8.5.0
dtschema version: 2025.13.dev4+g85cec3155
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260128/202601281652.7zzfQ6lJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601281652.7zzfQ6lJ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/soc/cix/cix,sky1-system-controller.yaml: ignoring, error in schema: properties: compatible: oneOf: 0: contains
--
>> Documentation/devicetree/bindings/soc/cix/cix,sky1-system-controller.yaml: properties:compatible:oneOf:0:contains: [{'enum': ['cix,sky1-system-controller', 'cix,sky1-s5-system-controller']}, {'const': 'syscon'}, {'const': 'simple-mfd'}] is not of type 'object', 'boolean'
>> Documentation/devicetree/bindings/soc/cix/cix,sky1-system-controller.yaml: properties:compatible:oneOf:0:contains: [{'enum': ['cix,sky1-system-controller', 'cix,sky1-s5-system-controller']}, {'const': 'syscon'}, {'const': 'simple-mfd'}] is not of type 'object', 'boolean'
>> Documentation/devicetree/bindings/soc/cix/cix,sky1-system-controller.yaml: properties:compatible:oneOf:0:contains: [{'enum': ['cix,sky1-system-controller', 'cix,sky1-s5-system-controller']}, {'const': 'syscon'}, {'const': 'simple-mfd'}] is not of type 'object', 'boolean'
>> Documentation/devicetree/bindings/soc/cix/cix,sky1-system-controller.yaml: properties:compatible:oneOf:0:contains: [{'enum': ['cix,sky1-system-controller', 'cix,sky1-s5-system-controller']}, {'const': 'syscon'}, {'const': 'simple-mfd'}] is not of type 'object', 'boolean'
>> Documentation/devicetree/bindings/soc/cix/cix,sky1-system-controller.yaml: properties:compatible:oneOf:0:contains: [{'enum': ['cix,sky1-system-controller', 'cix,sky1-s5-system-controller']}, {'const': 'syscon'}, {'const': 'simple-mfd'}] is not of type 'object', 'boolean'
>> Documentation/devicetree/bindings/soc/cix/cix,sky1-system-controller.yaml: properties:compatible:oneOf:0:contains: [{'enum': ['cix,sky1-system-controller', 'cix,sky1-s5-system-controller']}, {'const': 'syscon'}, {'const': 'simple-mfd'}] is not of type 'object', 'boolean'
>> Documentation/devicetree/bindings/soc/cix/cix,sky1-system-controller.yaml: properties:compatible:oneOf:0:contains: [{'enum': ['cix,sky1-system-controller', 'cix,sky1-s5-system-controller']}, {'const': 'syscon'}, {'const': 'simple-mfd'}] is not of type 'object', 'boolean'
   Traceback (most recent call last):
     File "/usr/local/bin/dt-doc-validate", line 8, in <module>
       sys.exit(main())
                ~~~~^^
     File "/usr/local/lib/python3.13/dist-packages/dtschema/doc_validate.py", line 66, in main
       ret |= check_doc(f)
              ~~~~~~~~~^^^
     File "/usr/local/lib/python3.13/dist-packages/dtschema/doc_validate.py", line 37, in check_doc
       dtsch.check_schema_refs()
       ~~~~~~~~~~~~~~~~~~~~~~~^^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
