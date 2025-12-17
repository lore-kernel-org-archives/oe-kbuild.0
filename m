Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819412C1594
	for <oe-kbuild@lists.linux.dev>; Wed, 17 Dec 2025 04:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765944816; cv=none; b=GzUZ5FrglHIQRHqQAvhHu+m2Fk6p2EGNcel8OK0QrYZhLxYBpkO6BPwxBH0a041jfkhYM6Hl+2JFNUhEdkADI2pk8Q/NlzODE7NQklfVmF6Wu6iJYfyOChl0PiQQKwiKm8P55Z8hN63HTKOPoKmAlzZnzf/3BylaNX5vxKOhtkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765944816; c=relaxed/simple;
	bh=P3elSZsPDJNeFunPFhabMBOZ/TqfNE3w25EOpQ9k58o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QHHi5irn5sjhMh6fxbBojwYDLuzHhxQuBMmkxH5eu76Igeqz8F92EfZ7vji1wuUoXEt0g5ZdShfyLaMEjsMjPHWGo27M5PsRws6voSg2o/50jj7eCvXiDYF4s0gXvc9H5tve5LEyDnPw1xAZ89jfE0CQQjK+aFfvqMaskO15a5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FZa8Xsc4; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FZa8Xsc4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765944815; x=1797480815;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P3elSZsPDJNeFunPFhabMBOZ/TqfNE3w25EOpQ9k58o=;
  b=FZa8Xsc4xojeV9X0pLBfG060t9ujKyLZuzsgr1N8KazphQ9qBc+VnYPH
   7b9CtV67TP9yY+G+ocENVn8jnka9uEi7GaXKqKS+QfmSv54SflkAF81at
   hngV9LdGnfmCxpP0vIeI/MGpSw1NfEfiNuVzxNz/lodqeUl7xoeL3gxq0
   zlYVa0YpbuEPNBAtBwMdi0+s/Zprpx8kuXnn1nC0P+J3qM2QGBLw6++0F
   w5euMkKDL9Q2bXPp2j1cryrFuqJbbGIPu7+EWMvtTsy6eZ+jaSB/rwDJG
   1LJktMcHWW5GlFUDhfYkj8x9uGJf7zoT3Z3NaGU8/C3NwxS4WNXsjWF52
   g==;
X-CSE-ConnectionGUID: 9tnJPnVzQn+0VVcom9Oh9w==
X-CSE-MsgGUID: /nIvEvqiTqa3ueoB1pfboA==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="67759636"
X-IronPort-AV: E=Sophos;i="6.21,154,1763452800"; 
   d="scan'208";a="67759636"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 20:13:34 -0800
X-CSE-ConnectionGUID: GiDQMFIOTr20BqwysRDlig==
X-CSE-MsgGUID: sKifoYvaTC6EzMFNUSE6Wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,154,1763452800"; 
   d="scan'208";a="198192229"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 16 Dec 2025 20:13:33 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vViuo-000000003U4-1XTp;
	Wed, 17 Dec 2025 04:13:30 +0000
Date: Wed, 17 Dec 2025 05:12:46 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v4 1/5] dt-bindings: media: i2c: Add Sony IMX355
Message-ID: <202512170550.YmwglAiE-lkp@intel.com>
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
In-Reply-To: <20251211014846.16602-2-mailingradian@gmail.com>
References: <20251211014846.16602-2-mailingradian@gmail.com>
TO: Richard Acayan <mailingradian@gmail.com>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Konrad Dybcio <konradybcio@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Sakari Ailus <sakari.ailus@linux.intel.com>
TO: Tianshu Qiu <tian.shu.qiu@intel.com>
TO: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media@vger.kernel.org
TO: linux-arm-msm@vger.kernel.org
TO: devicetree@vger.kernel.org
CC: Robert Mader <robert.mader@collabora.com>
CC: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
CC: Richard Acayan <mailingradian@gmail.com>

Hi Richard,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.16-rc1 next-20251216]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Richard-Acayan/dt-bindings-media-i2c-Add-Sony-IMX355/20251211-095114
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20251211014846.16602-2-mailingradian%40gmail.com
patch subject: [PATCH v4 1/5] dt-bindings: media: i2c: Add Sony IMX355
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: arm64-randconfig-2052-20251214 (https://download.01.org/0day-ci/archive/20251217/202512170550.YmwglAiE-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project ecaf673850beb241957352bd61e95ed34256635f)
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251217/202512170550.YmwglAiE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512170550.YmwglAiE-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml: properties:port:properties:endpoint: 'anyOf' conditional failed, one must be fixed:
   'data-lanes' is not one of ['$ref', 'additionalItems', 'additionalProperties', 'allOf', 'anyOf', 'const', 'contains', 'default', 'dependencies', 'dependentRequired', 'dependentSchemas', 'deprecated', 'description', 'else', 'enum', 'exclusiveMaximum', 'exclusiveMinimum', 'items', 'if', 'minItems', 'minimum', 'maxItems', 'maximum', 'multipleOf', 'not', 'oneOf', 'pattern', 'patternProperties', 'properties', 'required', 'then', 'typeSize', 'unevaluatedProperties', 'uniqueItems']
   'type' was expected
   from schema $id: http://devicetree.org/meta-schemas/keywords.yaml
   Documentation/devicetree/bindings/pinctrl/xlnx,versal-pinctrl.yaml: allOf: Missing additionalProperties/unevaluatedProperties constraint

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
