Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 229282E3392
	for <oe-kbuild@lists.linux.dev>; Fri, 28 Mar 2025 23:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743205613; cv=none; b=W+HSVoYgSncbEDF9HnsYDrNRmrTuUuEEuY7/KrubcGNmlIG+VvGvsOw4mrKZO7Fr2qRHhVrCI5m2s8iGjzzR2kLZNXwym+ixFU0oN3NiVddqOvixXXODwcFgrXkLh/CoEBY4sqKOO+/l/K1skB8VYiR91fPZOZVGVxvd2Y4UZqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743205613; c=relaxed/simple;
	bh=9Ko8a1owGNweUtIsLg9i5yWBfI7E+P740j0KL+n5sig=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S1S9zjoeZUgPc6zS3E7NnTcyQuNqhysWaWxV8ZHK3+jbTwQH/Fq0OPA//Bdn/QUoOWG/bTYPUhaPpjNK6a67hOm5NImVAkYAyQpryRe79Dq5e9Vqj0R6G6ngwNI1S3XVSM6yp7BcfwEmIu/U2XNtOS+kz2Wvo61R4VbTUCXEqsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P4qiNkPk; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P4qiNkPk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743205611; x=1774741611;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9Ko8a1owGNweUtIsLg9i5yWBfI7E+P740j0KL+n5sig=;
  b=P4qiNkPkPS8ZSN6akB3QJE093up3928a2HXFQ8nHJbcjzMETGKek4BCc
   XNqYrDdv7PZbEaGDm8u2GbPGgMi53bE6FRHqUdD0miRFZfbwF/DuNYotT
   WBqjnG0dtaEVJrGHMkqZFtYz6kF7TO4HuDKZzEQOTSskwXwI7nFX58Qpv
   ugKrnCjjZwWj/bNS6tUU/jw0BeG7kBbSPbNnUwOqw1oEwnoxZDlqHbwQ0
   1/0aLLzoBqTtyWX7lwWvET3qcij8oyDoYmbMEmsbVl5vLH6CAwKv/uU6e
   s0qSuE2SNALxnvOQk2yEHI+uKnKkrqCxTqv1o6wcMuxLxJuAxTdSFUn3u
   w==;
X-CSE-ConnectionGUID: +3FaGPssSr2QxNOQ0iJPYg==
X-CSE-MsgGUID: nq0v9fTATpGFErOOnl4k1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="48358668"
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; 
   d="scan'208";a="48358668"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 16:46:50 -0700
X-CSE-ConnectionGUID: 9EYa5AtgR8y8oxTM+iCXkA==
X-CSE-MsgGUID: TehTmanfTI2j7OPINnV37w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; 
   d="scan'208";a="126102354"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 28 Mar 2025 16:46:49 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tyJPT-0007mM-0R;
	Fri, 28 Mar 2025 23:46:47 +0000
Date: Sat, 29 Mar 2025 07:46:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [morimoto:sound-msiof-2025-03-26-2 14/25]
 arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: display@feb00000:
 ports: 'port@0' is a required property
Message-ID: <202503290712.z1Z7nMKj-lkp@intel.com>
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
TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

tree:   https://github.com/morimoto/linux sound-msiof-2025-03-26-2
head:   2518ccf64c65482b415e5a831057998bfe2bda1d
commit: ce8136982af1713807b52879c3efe315ac9620bf [14/25] arm64: dts: renesas: r8a779h0: tidyup video endpoint node
:::::: branch date: 3 days ago
:::::: commit date: 4 days ago
config: arm64-randconfig-051-20250326 (https://download.01.org/0day-ci/archive/20250329/202503290712.z1Z7nMKj-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project c2692afc0a92cd5da140dfcdfff7818a5b8ce997)
dtschema version: 2025.3.dev5+g0f9dc23
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250329/202503290712.z1Z7nMKj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503290712.z1Z7nMKj-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: pcie@e65d0000: clock-names: ['core', 'ref'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-host.yaml#
>> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: display@feb00000: ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/display/renesas,du.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
