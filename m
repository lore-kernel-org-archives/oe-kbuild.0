Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 095B83A961B
	for <oe-kbuild@lists.linux.dev>; Tue, 20 Jan 2026 20:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768942796; cv=none; b=QTp4eZJhFoOdcG/w1xmTU8kMYEKiV20O01SpD6UJU2ek3o/KCarRIuolEnv9uMGRlO5vpKoIHeX69sMHf9pj4FeKh1fGdYsTHBTfSqY5d5M+/5pKonNy3BgtPckGZCftQhqpD4FG/i/F7yydhpe3agaxC78BnCpnWqwF/ILdpvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768942796; c=relaxed/simple;
	bh=7oTb3fJ+joB5fbRcHa2H3hbIutHhe9EgGLTA8jONyVI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mARg3LY4lLFawsF1pWkGlKh1Ei2D4vw1s1mJ7Ce6DEf9Ni2Nf8l2G/7Z7EWYoJkG5pEIRkN4RdQXiPgC0AmXLSMLgBYCR0AROMMxL016kxf0yEQhKdrIAxzUp+7IxAmxtAmYb4JXAeEWR/Qzq+QLPDndfFcdxPeXibIPx6l5X0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nOiL6qTf; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nOiL6qTf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768942795; x=1800478795;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7oTb3fJ+joB5fbRcHa2H3hbIutHhe9EgGLTA8jONyVI=;
  b=nOiL6qTfoh9SZ734gG51gtRPEkWoS7LnvzPdrUkygsYxNvJ8XxwGaCNF
   WtIwJJbti/EcDAn8kcd9lhLVLhQhKHVvPZOeU+cCH90WJAmS/YjKtjl58
   IINURqAAM4MnvpJQMP2pt987Z4j7GTtac1P50OsRaIKaw7NC4Qp/vlA0E
   SFDTBdD/i6xIrOLZ4GArP/wMpg77LTsJCvLlIxN/qFUQ3vS/qynxI9qRO
   5zJ7QcP/GH8FJqe0J5A2SQYRwqwtlMkJ+0tAr6pLI9bSCOGZbIOGjd0CX
   B6OnLx2Botp/6f52KzwoDMEN7sebMUtQCuKopu1uwVqeoOAlV9Nus+YzY
   Q==;
X-CSE-ConnectionGUID: 27vT3JLmQvSGRM63IC4Dzg==
X-CSE-MsgGUID: r7IuHONBT1myXTeZWGvQtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="87742482"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; 
   d="scan'208";a="87742482"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 12:59:54 -0800
X-CSE-ConnectionGUID: UM8CXbLNTrKlmeB+pbie5g==
X-CSE-MsgGUID: LybIpzk6S2253fucA/gyjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; 
   d="scan'208";a="229187451"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 20 Jan 2026 12:59:53 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1viIpK-00000000PWV-3KrF;
	Tue, 20 Jan 2026 20:59:50 +0000
Date: Wed, 21 Jan 2026 04:59:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 2/2] hwmon: Add support for HiTRON HAC300S PSU
Message-ID: <202601210411.O4Vhqj8h-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/hwmon/pmbus/hac300s.c:129:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260119190806.35276-3-vassilisamir@gmail.com>
References: <20260119190806.35276-3-vassilisamir@gmail.com>
TO: Vasileios Amoiridis <vassilisamir@gmail.com>
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: linux@roeck-us.net
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-hwmon@vger.kernel.org
CC: linux-doc@vger.kernel.org
CC: Vasileios Amoiridis <vasileios.amoiridis@cern.ch>

Hi Vasileios,

kernel test robot noticed the following build warnings:

[auto build test WARNING on groeck-staging/hwmon-next]
[also build test WARNING on robh/for-next linus/master v6.19-rc6 next-20260120]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vasileios-Amoiridis/dt-bindings-trivial-devices-Add-hitron-hac300s/20260120-031007
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/20260119190806.35276-3-vassilisamir%40gmail.com
patch subject: [PATCH v2 2/2] hwmon: Add support for HiTRON HAC300S PSU
:::::: branch date: 26 hours ago
:::::: commit date: 26 hours ago
config: riscv-randconfig-r123-20260120 (https://download.01.org/0day-ci/archive/20260121/202601210411.O4Vhqj8h-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260121/202601210411.O4Vhqj8h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601210411.O4Vhqj8h-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   WARNING: invalid argument to '-march': '_zacas_zabha'
>> drivers/hwmon/pmbus/hac300s.c:129:1: sparse: sparse: bad integer constant expression
   drivers/hwmon/pmbus/hac300s.c:129:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/hwmon/pmbus/hac300s.c:130:1: sparse: sparse: bad integer constant expression
   drivers/hwmon/pmbus/hac300s.c:130:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/hwmon/pmbus/hac300s.c:131:1: sparse: sparse: bad integer constant expression
   drivers/hwmon/pmbus/hac300s.c:131:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/hwmon/pmbus/hac300s.c:131:1: sparse: sparse: bad integer constant expression
   drivers/hwmon/pmbus/hac300s.c:131:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   drivers/hwmon/pmbus/hac300s.c:132:1: sparse: sparse: bad integer constant expression
   drivers/hwmon/pmbus/hac300s.c:132:1: sparse: sparse: static assertion failed: "MODULE_INFO(import_ns, ...) contains embedded NUL byte"

vim +129 drivers/hwmon/pmbus/hac300s.c

f1c1bd432f3089 Vasileios Amoiridis 2026-01-19  128  
f1c1bd432f3089 Vasileios Amoiridis 2026-01-19 @129  MODULE_AUTHOR("Vasileios Amoiridis");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
