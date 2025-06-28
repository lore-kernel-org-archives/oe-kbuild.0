Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB0662192F4
	for <oe-kbuild@lists.linux.dev>; Sat, 28 Jun 2025 16:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751126504; cv=none; b=UWVsGrGD5HBWBQwcxAUcyAE8DZQVOdRFllB1LTQeEVGpQKIPec9TZRhYEWigI573hoCY1gIqp9g/oNge8AfnP8Xxh4FHizlLqpjDRzopX469asEnWl7OVxH2ks3Q6Z8UIYH1K502NapGZNdzjqEMOXJnVArleZXj0r8icyyV9oM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751126504; c=relaxed/simple;
	bh=xkE1mHPo10fjyYvLSIByVGWhH9SJuT57xTiZW8Qb1+g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CI6zFCnfGINVV6BlQ8DVL5GyQfDui6rTXQKhBMl3Pvv6HLcYbOkMFrf0i+Mntn+aqMah1XGzik9wT1v7mv/bFaYO5pVE/TNJyqJNrAa3msDTAdtBqQjvfqI2HgSa0ImYYkZCClmwc4K35XdmQ0wrppQhiApueLUCMiNWkH4umaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kRlt+Zlp; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kRlt+Zlp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751126502; x=1782662502;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xkE1mHPo10fjyYvLSIByVGWhH9SJuT57xTiZW8Qb1+g=;
  b=kRlt+ZlpMqjYp2NBwuL87f1gnPYsOuZ0J/w/g1BtTr1MSh+itMXPuvyu
   RsOOzXoPEVcCJgaUEXm5/W/dYfTcfsLcLUgAnLa7Nazx3ftjcKmZNvuQa
   DvMbvNGazLGzks2LBGDGyCyFu19w/vHIC2qXAksxJybgIt/k/2tMZ6yZO
   JXJKKytze22DNLvS6WSz7XvgdeytYyktjHxEsDkSo+7kGiis9pTFBP7zX
   4iH39Dr+SzrkB9Dymybdco80el4DmQ5QN6x748hpVOvNKG/cwcGQZ9xjk
   cpD6qkPhN12bGX8J92eZkO8igZU8mouIwSasHZS0I1jUxaERoaAiv5AvO
   Q==;
X-CSE-ConnectionGUID: i8QXzy+aSOOoLcDLPgmPMg==
X-CSE-MsgGUID: D0X9uqI1Q9GtU2HViAz6oQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11478"; a="52530768"
X-IronPort-AV: E=Sophos;i="6.16,273,1744095600"; 
   d="scan'208";a="52530768"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2025 09:01:39 -0700
X-CSE-ConnectionGUID: GoO26DI4REWxcqChzsuEtQ==
X-CSE-MsgGUID: 7GowMjNkTvGRiJiIWvESew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,273,1744095600"; 
   d="scan'208";a="153768991"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 28 Jun 2025 09:01:38 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVXzk-000XAF-1F;
	Sat, 28 Jun 2025 16:01:36 +0000
Date: Sun, 29 Jun 2025 00:00:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk-github:b4/dt-bindings-db 3/3]
 Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml:
 fsl,phy-pcs-tx-deemph-3p5db-attenuation-db: missing type definition
Message-ID: <202506282332.vOk6QhoM-lkp@intel.com>
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
TO: Krzysztof Kozlowski <krzk@kernel.org>
CC: linux-doc@vger.kernel.org

tree:   https://github.com/krzk/linux b4/dt-bindings-db
head:   78209124e250afd8221adac453412ccf3436dcd9
commit: 78209124e250afd8221adac453412ccf3436dcd9 [3/3] dt-bindings: phy: fsl,imx8mq-usb: Drop 'db' suffix duplicating dtschema
:::::: branch date: 32 hours ago
:::::: commit date: 32 hours ago
config: arm-randconfig-051-20250628 (https://download.01.org/0day-ci/archive/20250628/202506282332.vOk6QhoM-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project e04c938cc08a90ae60440ce22d072ebc69d67ee8)
dtschema version: 2025.6.1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250628/202506282332.vOk6QhoM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506282332.vOk6QhoM-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml: fsl,phy-pcs-tx-deemph-3p5db-attenuation-db: missing type definition
   Documentation/devicetree/bindings/leds/issi,is31fl319x.yaml: audio-gain-db: missing type definition
   Traceback (most recent call last):
     File "/usr/local/bin/dt-mk-schema", line 8, in <module>
       sys.exit(main())
                ^^^^^^
     File "/usr/local/lib/python3.11/dist-packages/dtschema/mk_schema.py", line 28, in main
       schemas = dtschema.DTValidator(args.schemas).schemas
                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
     File "/usr/local/lib/python3.11/dist-packages/dtschema/validator.py", line 392, in __init__
       self.make_property_type_cache()

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
