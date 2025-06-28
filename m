Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C9B13B5AE
	for <oe-kbuild@lists.linux.dev>; Sat, 28 Jun 2025 14:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751121630; cv=none; b=iLHW02sP+qUnNZY+dnpQMbOIsyhU9HVSEa2RuXY2/7vbfdm1ZrL0uTZj0Ogo5SQMTl1/uYClLPqVWPiQ8i0Yhm4E6hiU3krjWLFDLpG7XyCWC2N/ZCo68wuGHom2l7wqEmbuEhG2iwis9QF5xkVjylV4CYjFCKXS2JaKuW6wNuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751121630; c=relaxed/simple;
	bh=R8gPiJqJQC6wi+xTqWIlTWmJwG8/QQgqXInr0ADXr/8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bM2SqJgDpFEDC97rMkbteyK1FwHtZrkmYcz980aqw9ToMAZ0dis2Qaecw1Jx2mVPAK0ZpfA1Rn2yo3VnJ8jcnMUKZDoKkmwlHRrQMw80Cghs91SQ2xJr4e0lQ94nOgi0mED8Li/MbkRxmQrJs6QT9KBNLxa2/Pp1yCzH8xAr5yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NSYGEsfQ; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NSYGEsfQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751121628; x=1782657628;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R8gPiJqJQC6wi+xTqWIlTWmJwG8/QQgqXInr0ADXr/8=;
  b=NSYGEsfQS8gNIg8lwD4ZLXWc3duj/PtRS3O8RPlZHwE+4A4XsQ4wCU3L
   /RWC309dDXg1mwxUOwBFQlAY21ApPx7aqjhJuEG2xiQtPiHbUEAaMKtKG
   AjtbaeY9oK9yKQdNik8LYWBoROWBfDRUbZsvSUIANXIHXwaCFdfbB8f2h
   eqhUvwXtYl4uyEcQFQjNdmtQ5iyX/Idh2l16Ey15KhhcbFAZhairS/0jP
   m7i/pNe8OFOsN4E0LhnbjqEQxL8q68Do5BjnGGgnupiQukICxMo4ucWM4
   0Ih0wFL1/k8XbrARV/q3EwteG8g2OA69h69soukDKjneigprkL3AdeoT3
   g==;
X-CSE-ConnectionGUID: NWC27SNbT1+IAXi8632NtA==
X-CSE-MsgGUID: r0jznOrESz6Faq6Yth+WMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11478"; a="57189722"
X-IronPort-AV: E=Sophos;i="6.16,273,1744095600"; 
   d="scan'208";a="57189722"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2025 07:40:28 -0700
X-CSE-ConnectionGUID: QlkALKXFSZCDPQLaoj6n/g==
X-CSE-MsgGUID: +bUDANG8ScurJFbYoH+99Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,273,1744095600"; 
   d="scan'208";a="176727418"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 28 Jun 2025 07:40:27 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVWjB-000X7X-0G;
	Sat, 28 Jun 2025 14:40:25 +0000
Date: Sat, 28 Jun 2025 22:39:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk-github:b4/dt-bindings-db 2/3]
 Documentation/devicetree/bindings/leds/issi,is31fl319x.yaml: audio-gain-db:
 missing type definition
Message-ID: <202506282228.KW16JXYJ-lkp@intel.com>
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
commit: 2c1b5bcb66622b02fd156ec2fcf68c543445e890 [2/3] dt-bindings: leds: issi,is31fl319x: Drop 'db' suffix duplicating dtschema
:::::: branch date: 31 hours ago
:::::: commit date: 31 hours ago
config: arm-randconfig-051-20250628 (https://download.01.org/0day-ci/archive/20250628/202506282228.KW16JXYJ-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project e04c938cc08a90ae60440ce22d072ebc69d67ee8)
dtschema version: 2025.6.1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250628/202506282228.KW16JXYJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506282228.KW16JXYJ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/leds/issi,is31fl319x.yaml: audio-gain-db: missing type definition
   Traceback (most recent call last):
     File "/usr/local/bin/dt-mk-schema", line 8, in <module>
       sys.exit(main())
                ^^^^^^
     File "/usr/local/lib/python3.11/dist-packages/dtschema/mk_schema.py", line 28, in main
       schemas = dtschema.DTValidator(args.schemas).schemas
                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
     File "/usr/local/lib/python3.11/dist-packages/dtschema/validator.py", line 392, in __init__
       self.make_property_type_cache()
     File "/usr/local/lib/python3.11/dist-packages/dtschema/validator.py", line 530, in make_property_type_cache

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
