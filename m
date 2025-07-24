Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D28533595D
	for <oe-kbuild@lists.linux.dev>; Thu, 24 Jul 2025 22:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753396279; cv=none; b=sfc1dhDR9Ll8HRSEgL8FQlQ3wsCytHK0QE9Hjy3m2HLKcil6gawreb+SFXiY4eZX9zouHBtlCnEvcSu6eDBiA6J9drw+RNXbKRJj7jqXTfMC130eUh8dEJ3TChNSvtIhfTaaImrUwiNW31MuaAQHkDL804vb7NWXjK8umKAUBVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753396279; c=relaxed/simple;
	bh=DWbt/EYmIOsT99C+Ro8IWv6KtobxCqjIzZdCJP1h7NI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HOsaD0gstPf97gASWrI+VJOZ0Q/AbCDg9mJpt+6hpUIhGLQrmgiJH+YtdwUToKWzuLULYRcDpIEXyMfMb1dmclK/g+BzvjyKvQSdgcOqVlpew3NOOD+tol83kVnhFwJdZOJiJ+UMTyaknr+HlJulZjCE2/QnsFqdN9vqQYBFCok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SMJdV8Fq; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SMJdV8Fq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753396277; x=1784932277;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DWbt/EYmIOsT99C+Ro8IWv6KtobxCqjIzZdCJP1h7NI=;
  b=SMJdV8Fqan2ZMzMNNHqWYxo6t3anYp4JNjDL/X0IxWmHFCc/LZ4osbgf
   sVGqCPr24VP1pQhi/gbC4be63JwBJJiYm59Ahb4zm6hVId2nU3pK58FBy
   KBHa/foQUNolMWysTgo7iplxjHCtB+Sg2hOUvOSgxCOBKHYjWWqtt0puC
   BxJ6z23ZG4ouUpB5d3VHNbvtNnMxbfHTE9qRLuSyWmDagPacEMY5GDB/B
   3wssHVrDqkJIP/+1fk4IVcsstS91buGKgr9nO/NIdspCAGoUcFWaFfAMK
   wYetiRtaSLbfL4sDIwiagVfW/ue+9ARejq/ZKcuA79OxIUntJB4d5V2nx
   w==;
X-CSE-ConnectionGUID: ZmpUrwFMR/uQXHiPdOIy+w==
X-CSE-MsgGUID: cB7H6gNfQEq4XB77nNmYow==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="66293714"
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; 
   d="scan'208";a="66293714"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2025 15:31:16 -0700
X-CSE-ConnectionGUID: Dl0SGuxzT6q53APPK4T7Ew==
X-CSE-MsgGUID: jaJyobneTXeFHwCxINknww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; 
   d="scan'208";a="160249966"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 24 Jul 2025 15:31:15 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uf4T3-000KsR-0A;
	Thu, 24 Jul 2025 22:31:13 +0000
Date: Fri, 25 Jul 2025 06:30:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v1 4/4] riscv: dts: starfive: add Milk-V Mars CM Lite
 system-on-module
Message-ID: <202507250600.6GgTzkco-lkp@intel.com>
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
In-Reply-To: <20250724094912.253723-5-e@freeshell.de>
References: <20250724094912.253723-5-e@freeshell.de>
TO: E Shattow <e@freeshell.de>
TO: Emil Renner Berthing <kernel@esmil.dk>
TO: Conor Dooley <conor@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Paul Walmsley <paul.walmsley@sifive.com>
TO: Palmer Dabbelt <palmer@dabbelt.com>
TO: Albert Ou <aou@eecs.berkeley.edu>
TO: Alexandre Ghiti <alex@ghiti.fr>
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: E Shattow <e@freeshell.de>
CC: linux-riscv@lists.infradead.org

Hi Shattow,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 28fa0dcb571ab8f3be4d919f0e20e01d4e44bcb1]

url:    https://github.com/intel-lab-lkp/linux/commits/E-Shattow/dt-bindings-riscv-starfive-add-milkv-marscm-emmc/20250724-175339
base:   28fa0dcb571ab8f3be4d919f0e20e01d4e44bcb1
patch link:    https://lore.kernel.org/r/20250724094912.253723-5-e%40freeshell.de
patch subject: [PATCH v1 4/4] riscv: dts: starfive: add Milk-V Mars CM Lite system-on-module
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: riscv-randconfig-052-20250725 (https://download.01.org/0day-ci/archive/20250725/202507250600.6GgTzkco-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 853c343b45b3e83cc5eeef5a52fc8cc9d8a09252)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250725/202507250600.6GgTzkco-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507250600.6GgTzkco-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/riscv/boot/dts/starfive/jh7110-milkv-marscm-lite.dtb: pinctrl@13040000 (starfive,jh7110-sys-pinctrl): 'wifi-host-wake-irq' does not match any of the regexes: '-[0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/starfive,jh7110-sys-pinctrl.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
