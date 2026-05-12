Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A60383327
	for <oe-kbuild@lists.linux.dev>; Tue, 12 May 2026 16:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778602711; cv=none; b=OBmQpq3nGe2DzVIC2j+/ful1301kjVTIbVYSEcn8BjW2zy9NBeAvOdELeb4USHOnn/JxV6KYBDQycIW6tZMB7IkeMmLMvao1AuJFV1JjHq5lSlYeV/iniOS7vX8IJI+bvOve+mkD1HIUbJKb+835ThmsFL2/CKPgZzezF3vAM9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778602711; c=relaxed/simple;
	bh=qZYnzefJSEkGq4SEZnvFIHV6cXe2vzvFX4zpVDvc4Vo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KIxBzz1el3NtczEsFy/8vdXa9eoS02bq+gIsCMcZWvV9D+ysAt22QDcVxxl2AXqblx+Far7JgjW2aLzycAGkQA3+d6fVeEmiIwOcZDC++XBzDtjSfsIu55M5kbhGtCW6LxtfnfQ8A4XWUzzuCdKc8twKzC+86e2CIPKSbOPR4Is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bABdgyzd; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bABdgyzd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778602709; x=1810138709;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=qZYnzefJSEkGq4SEZnvFIHV6cXe2vzvFX4zpVDvc4Vo=;
  b=bABdgyzd/S9Q9tymN+P0zc0P5R7+JV4aCMJtlWcAmOXGMkg1abrMV9/B
   O6lxpFyEvfcGpvCWCK31FBEJR/SizQuOHaMb/KLfDeYC+YFwjyNHrxSNu
   4K7U3elkjIFZ2tQcSPRH5xphThV+Bd7qI7SRa8jJNC2saqBXIufem5rGE
   s5ShNJ7wZ6XiYVoZKxyYKPbZEHYUAKbiqTIjVXbY9jVn7AUCMGGvbdyJh
   DGDLKHMu8DU9kg3yRmFrw+2ko0rDSCX3ORn+hqHMkffuPa5NgJBXEMhGV
   qlp0RCecQRDo1OjClz+dDyG6Z/wYa8LasOrkMNwJfAmUwq7yZMXg00bgW
   w==;
X-CSE-ConnectionGUID: te+cv9heQr+7162g29D8lQ==
X-CSE-MsgGUID: DVIKgMskQxSnqE/71AWz8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="79500691"
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; 
   d="scan'208";a="79500691"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 09:18:29 -0700
X-CSE-ConnectionGUID: z5/ef+CrSCeoltjpZNIhcA==
X-CSE-MsgGUID: iOaOfTD4SdSWOK5pGUfDrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; 
   d="scan'208";a="242784930"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 12 May 2026 09:18:28 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMpoP-000000008Ir-44Gx;
	Tue, 12 May 2026 16:18:25 +0000
Date: Tue, 12 May 2026 18:17:43 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3] dt-bindings: iio: adc: Convert xilinx-xadc bindings
 to YAML schema
Message-ID: <202605121802.IfwQN2uI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260510083219.70224-1-pramod.nexgen@gmail.com>
References: <20260510083219.70224-1-pramod.nexgen@gmail.com>
TO: Pramod Maurya <pramod.nexgen@gmail.com>
TO: jic23@kernel.org
CC: pramod.nexgen@gmail.com
CC: David Lechner <dlechner@baylibre.com>
CC: "Nuno Sá" <nuno.sa@analog.com>
CC: Andy Shevchenko <andy@kernel.org>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: Michal Simek <monstr@monstr.eu>
CC: "Lars-Peter Clausen" <lars@metafoo.de>
CC: linux-iio@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-kernel@vger.kernel.org

Hi Pramod,

kernel test robot noticed the following build warnings:

[auto build test WARNING on jic23-iio/togreg]
[also build test WARNING on robh/for-next linus/master v6.16-rc1 next-20260508]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pramod-Maurya/dt-bindings-iio-adc-Convert-xilinx-xadc-bindings-to-YAML-schema/20260512-144359
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
patch link:    https://lore.kernel.org/r/20260510083219.70224-1-pramod.nexgen%40gmail.com
patch subject: [PATCH v3] dt-bindings: iio: adc: Convert xilinx-xadc bindings to YAML schema
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: arc-randconfig-2051-20260512 (https://download.01.org/0day-ci/archive/20260512/202605121802.IfwQN2uI-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 10.5.0
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260512/202605121802.IfwQN2uI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605121802.IfwQN2uI-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/iio/adc/xlnx,xadc.yaml: patternProperties: '^xlnx,channels$' should not be valid under {'pattern': '^\\^[a-zA-Z0-9,\\-._#@]+\\$$'}
   	hint: Fixed strings belong in 'properties', not 'patternProperties'
   	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
