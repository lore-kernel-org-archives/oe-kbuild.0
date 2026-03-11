Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2E03B0AEA
	for <oe-kbuild@lists.linux.dev>; Wed, 11 Mar 2026 07:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773214320; cv=none; b=q6XrMqyCpetvmET/jm944c+z7esOmO0L+ILT9rSNEDHoC2nPttSiTQiyY90w9IF88JtU6r2A5l1taBN4/8CDnN7mUMMLYwJvgGnHBlT/OHtAAvp4S9WUJ+XoAXPWEtqu9DwyxVpwFRf7UKjbC4US6AqsxyiySyI0Atgm3SOcWGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773214320; c=relaxed/simple;
	bh=DyDlkv+5SKCsYrDfOEpTVrT1XBgXF5gU4+DihsA1OMo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZNG9QQFqdp4eww0dEVgAOOkURXYUQYD0lUqQoU+bxQwxMVUrouj9yH9v7MOor/4GEuyJiRZJ990E9SVnh64UfUL0fSHd6RkuLvTJU5ulLX/sXi3V2jbDo2K+IWjtcmKWYz7bzrnOBrfhSePyBxTJEY/1wrF9qWR/BupgWSao7p4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YHVS9j1i; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YHVS9j1i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773214314; x=1804750314;
  h=date:from:to:cc:subject:message-id;
  bh=DyDlkv+5SKCsYrDfOEpTVrT1XBgXF5gU4+DihsA1OMo=;
  b=YHVS9j1i6CJ303UDk8os9UB2VoxReicZg4d3dPSoa/CHdAkWjzbUh/Ba
   jrLYvG++KFl39TtyAdosQ15c4c0Igxbk3mmyXuSLTp8lWxY4gaNAknTql
   /qsWF7s2fMxSG4/TXzqfjQRUSTzSwzSDI1pNaNK0DLbUGt5XkJViFzNj4
   sNMmlkgfIpClnK1tU9WbQmAGMd1JV7b0SYJB6rSW/qghX0TpChRryiL4E
   FmIYSsaI0XfqEycGPMNM7Dee89pxoRHbFsIbluSAy1FeKW9oQw8UEpOkt
   vMyvDuRASfkb1KooqMfluuZH3pCZJnk/NZTwHj8nn+YlEBaPjt2WuNe9O
   w==;
X-CSE-ConnectionGUID: a7ST1PX+S72IZRDNgd66Ww==
X-CSE-MsgGUID: qZpzlt5MSPm0aYfIpQ40sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="73471676"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="73471676"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 00:31:53 -0700
X-CSE-ConnectionGUID: uOStKt2mT+eeRAUETdF67A==
X-CSE-MsgGUID: JSdNpiXYQX+32qCj0HXpMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="220325065"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 11 Mar 2026 00:31:51 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0E2n-000000003HR-1uWL;
	Wed, 11 Mar 2026 07:31:49 +0000
Date: Wed, 11 Mar 2026 08:31:06 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:dt-convert 322/621]
 Documentation/devicetree/bindings/net/keystone-netcp.yaml: ti,mux-tbl:
 missing type definition
Message-ID: <202603110829.4daXsaMj-lkp@intel.com>
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
TO: "Rob Herring (Arm)" <robh@kernel.org>
CC: linux-doc@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt-convert
head:   c8198e311a98fefcf9efff078bf3930ff94b60d2
commit: 9bad7495a326ffba6743b37c5ce74f9625c56b0c [322/621] dt-bindings: net: Convert keystone-netcp to DT schema
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: arc-randconfig-2051-20260311 (https://download.01.org/0day-ci/archive/20260311/202603110829.4daXsaMj-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 13.4.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260311/202603110829.4daXsaMj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603110829.4daXsaMj-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   Documentation/devicetree/bindings/net/ibm,emac.yaml: tx-fifo-size: missing type definition
   Documentation/devicetree/bindings/net/ibm,emac.yaml: fifo-entry-size: missing type definition
   Documentation/devicetree/bindings/net/ibm,emac.yaml: mal-burst-size: missing type definition
   Documentation/devicetree/bindings/net/ibm,emac.yaml: zmii-channel: missing type definition
   Documentation/devicetree/bindings/net/ibm,emac.yaml: rgmii-channel: missing type definition
   Documentation/devicetree/bindings/net/ibm,emac.yaml: phy-address: missing type definition
   Documentation/devicetree/bindings/net/ibm,emac.yaml: phy-map: missing type definition
   Documentation/devicetree/bindings/net/ibm,emac.yaml: rx-fifo-size-gige: missing type definition
   Documentation/devicetree/bindings/net/ibm,emac.yaml: tx-fifo-size-gige: missing type definition
   Documentation/devicetree/bindings/net/ibm,emac.yaml: tah-channel: missing type definition
>> Documentation/devicetree/bindings/net/keystone-netcp.yaml: ti,mux-tbl: missing type definition
>> Documentation/devicetree/bindings/net/keystone-netcp.yaml: rx-pool: missing type definition
>> Documentation/devicetree/bindings/net/keystone-netcp.yaml: tx-pool: missing type definition
>> Documentation/devicetree/bindings/net/keystone-netcp.yaml: rx-queue-depth: missing type definition
>> Documentation/devicetree/bindings/net/keystone-netcp.yaml: rx-buffer-size: missing type definition
>> Documentation/devicetree/bindings/net/keystone-netcp.yaml: efuse-mac: missing type definition
>> Documentation/devicetree/bindings/net/keystone-netcp.yaml: netcp-gbe: missing type definition
   Traceback (most recent call last):
     File "/usr/local/bin/dt-mk-schema", line 8, in <module>
       sys.exit(main())
                ~~~~^^
     File "/usr/local/lib/python3.13/dist-packages/dtschema/mk_schema.py", line 28, in main
       schemas = dtschema.DTValidator(args.schemas).schemas
                 ~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^
     File "/usr/local/lib/python3.13/dist-packages/dtschema/validator.py", line 399, in __init__
       self.make_property_type_cache()
       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
