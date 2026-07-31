Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7911514E2F2
	for <oe-kbuild@lists.linux.dev>; Fri, 31 Jul 2026 20:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785528231; cv=none; b=Qnk9jNSRuyDOJ0HfvszpJYm/MMh2Imgrvep2Plzyzh99PSWFbf4xMxIbZnqaeFKvcTaV9kOg+9PUkUqsxZrBWPVTPpSIY2tsGKPnrjbXsUM/wU+spffm6WhHEGnQpLS/sPA2z96bZeKqdnWcj/+JwadjWJ4Haok6yLGGN/0ysqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785528231; c=relaxed/simple;
	bh=1HDa6xDY4VNdiulvBPtQeh2pWjem/IRk5cQOE45EeU8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FiqjGv1+/5HU7WLI/pUSPt5uWN98s9xozr7z7Qt+TVHc5tkhonKuVJ/nb/kHlLyrvbvkeaAI8j6vSzzEuq/nW4IMDKgAt4KDjo24vjPnNBAlqI31hEBTAQ2SuOF43Og5n5+v4JkEXf3mSjQ+Gzstl/undjo9wHZQbzuLSxlr0Qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S01XYlhB; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S01XYlhB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785528229; x=1817064229;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1HDa6xDY4VNdiulvBPtQeh2pWjem/IRk5cQOE45EeU8=;
  b=S01XYlhBrUoDyX22KtaG7ojaptu9GZp6b67RFVFGet6nOasnaYyJeS3n
   2f7kqAiq5I1hkP1TOCXXXcaOwdzvhYngj/fV2zvnBH5KVhMfG9Gg/qpWA
   4FGf7i9kGGqIWN1SoiwPOiBOzzs+DV7H38nqtQ2NilS7BA1+FrnZp2dzc
   mMJslPl98CEh3xLUscnYdXLcU0di5RIWneHdjZXPAPJu+RQt1K+4xFHaZ
   olyjIIMoeK4IsAgvjIL/CLjtYoo6wW16wXMAmq9XjIIfynbd207s/8Ib5
   lUvV3n1Et83mbpNlvrFAiCOuAdqAADIUXGgDH/tYX1qI4IT5Ndsbk3sxF
   w==;
X-CSE-ConnectionGUID: 3CfnlzDdSxql0M5EMPwHqQ==
X-CSE-MsgGUID: LOmLKkrHQfOOA/71DR7cBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11861"; a="85133571"
X-IronPort-AV: E=Sophos;i="6.25,197,1779174000"; 
   d="scan'208";a="85133571"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2026 13:03:48 -0700
X-CSE-ConnectionGUID: F1tOvxkATb+z6uNfZUp3cQ==
X-CSE-MsgGUID: A2cp/xPVTBCCH3j3mWrsig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,197,1779174000"; 
   d="scan'208";a="257977135"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 31 Jul 2026 13:03:46 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wptSJ-000000003GE-42xV;
	Fri, 31 Jul 2026 20:03:43 +0000
Date: Fri, 31 Jul 2026 22:03:22 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/2] media: i2c: Add onsemi AR0234 image sensor driver
Message-ID: <202607312228.x2r7T3z2-lkp@intel.com>
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
In-Reply-To: <20260731073505.2278769-3-eagle.alexander923@gmail.com>
References: <20260731073505.2278769-3-eagle.alexander923@gmail.com>
TO: Alexander Shiyan <eagle.alexander923@gmail.com>
TO: linux-media@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: Dave Stevenson <dave.stevenson@raspberrypi.com>
CC: Alexander Shiyan <eagle.alexander923@gmail.com>

Hi Alexander,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linuxtv-media-pending/master]
[also build test WARNING on media-tree/master sailus-media-tree/master linus/master v7.2-rc5 next-20260730]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexander-Shiyan/dt-bindings-media-i2c-Add-onsemi-AR0234-image-sensor-binding/20260731-154125
base:   https://git.linuxtv.org/media-ci/media-pending.git master
patch link:    https://lore.kernel.org/r/20260731073505.2278769-3-eagle.alexander923%40gmail.com
patch subject: [PATCH 2/2] media: i2c: Add onsemi AR0234 image sensor driver
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: microblaze-randconfig-2051-20260731 (https://download.01.org/0day-ci/archive/20260731/202607312228.x2r7T3z2-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 16.1.0
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260731/202607312228.x2r7T3z2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607312228.x2r7T3z2-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/media/i2c/onnn,ar0234.yaml: ignoring, error in schema: properties: compatible: oneOf
--
>> Documentation/devicetree/bindings/media/i2c/onnn,ar0234.yaml: properties:compatible:oneOf: {'const': 'onnn,ar0234cs', 'items': {'enum': 'onnn,ar0234cssc onnn,ar0234cssm', 'const': 'onnn,ar0234cs'}} should not be valid under {'items': {'propertyNames': {'const': 'const'}, 'required': ['const']}}
   	hint: Use 'enum' rather than 'oneOf' + 'const' entries
   	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml
>> Documentation/devicetree/bindings/media/i2c/onnn,ar0234.yaml: properties:compatible:oneOf: {'const': 'onnn,ar0234cs', 'items': {'enum': 'onnn,ar0234cssc onnn,ar0234cssm', 'const': 'onnn,ar0234cs'}} is not of type 'array'
   	from schema $id: http://devicetree.org/meta-schemas/string-array.yaml
>> Documentation/devicetree/bindings/media/i2c/onnn,ar0234.yaml: properties:compatible:oneOf: {'const': 'onnn,ar0234cs', 'items': {'enum': 'onnn,ar0234cssc onnn,ar0234cssm', 'const': 'onnn,ar0234cs'}} is not of type 'array'
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
