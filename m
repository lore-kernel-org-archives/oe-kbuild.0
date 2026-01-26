Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DDFC271468
	for <oe-kbuild@lists.linux.dev>; Mon, 26 Jan 2026 19:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769454629; cv=none; b=erMdiLYYhSf4G8+N/2SvUHxPnWt8h4JeMA8AXTFO6jT+3xmVB8Uh0EaeHVvqFFaIqLAZ5dLCh7GMjJPa05DYXQ0kYvuMSxY3LkOrUVV8HSQ657SfW/WNdudEqUhZ/+e0nRuiCc4EykVhHUxvrg3isQvfiK0XLYKwnbbCNMyi53Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769454629; c=relaxed/simple;
	bh=piqOOIXeU/bDtqScYZblJmriQFQqrybvCPFTFTho01E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KmTfFL0Bir55ZXou+qBFhhRUdGMdBWDwvlhtpyUZ5Nl94OxLZsmoKDjqLuXDGUXk82oaL6Qn0S0D5oENGg57EBDtlAV1y3XzfCx50EMH6iQtWgh6O2ynzOLJ54xKgDhbfTs5okd3F6U5KbvDA4y6PSGrZG021HteS7hmfutp0J0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PSVzGm/T; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PSVzGm/T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769454628; x=1800990628;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=piqOOIXeU/bDtqScYZblJmriQFQqrybvCPFTFTho01E=;
  b=PSVzGm/T378VLMiCuVtNBd37E3VRJ1CZpaOxIUur2ptBHlY4msJA4PIV
   knqlOOBABzocM/P329Nkam4aFaTBUNuTqruOjSzrZpCNJT0WrMNznZAb7
   YK9Bu8NJQAqm9Rfll347Af/hEPKTaP1kAAbOSvC9ZGn0UTWcvFC5/DteK
   CilRGo+yHkwSGzzkx2s6EBFXbDoMQ52w+vnm0bqK9gXt4BqgdZYDtz/K0
   EsRgmpOSPApB7bXYL1G5vgrUESUKHiWjXEqpj8urCPsEmLcpRjoDh8Lq0
   b/uot5MeqWK/qB9MNROQRB5dkcHO2PHHaW8aBagKn+yuipLKiI4FPXjIZ
   w==;
X-CSE-ConnectionGUID: JT4o5ZM8QpeP1OdwqvGqwg==
X-CSE-MsgGUID: wYo+HFrGR8qoXsqCYm1UrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="58212091"
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="58212091"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 11:10:27 -0800
X-CSE-ConnectionGUID: AfMsQik1RFWryfYtq1CYzA==
X-CSE-MsgGUID: 38KfzA0kSfSIhQt2mhww3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="212217773"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 26 Jan 2026 11:10:26 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkRyh-00000000Xbw-3vLU;
	Mon, 26 Jan 2026 19:10:23 +0000
Date: Tue, 27 Jan 2026 03:09:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v7 2/2] hwmon: pmbus: add support for STEF48H28
Message-ID: <202601270313.GB5QuYKc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/hwmon/pmbus/stef48h28.c:72:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260126063712.1049025-2-hsu.yungteng@gmail.com>
References: <20260126063712.1049025-2-hsu.yungteng@gmail.com>
TO: Charles Hsu <hsu.yungteng@gmail.com>
TO: robh@kernel.org
CC: krzk+dt@kernel.org
CC: conor+dt@kernel.org
CC: linux@roeck-us.net
CC: devicetree@vger.kernel.org
CC: linux-hwmon@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Charles Hsu <hsu.yungteng@gmail.com>

Hi Charles,

kernel test robot noticed the following build warnings:

[auto build test WARNING on groeck-staging/hwmon-next]
[also build test WARNING on robh/for-next linus/master v6.19-rc7 next-20260123]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Charles-Hsu/hwmon-pmbus-add-support-for-STEF48H28/20260126-144109
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/20260126063712.1049025-2-hsu.yungteng%40gmail.com
patch subject: [PATCH v7 2/2] hwmon: pmbus: add support for STEF48H28
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: mips-randconfig-r133-20260126 (https://download.01.org/0day-ci/archive/20260127/202601270313.GB5QuYKc-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260127/202601270313.GB5QuYKc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601270313.GB5QuYKc-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/hwmon/pmbus/stef48h28.c:72:1: sparse: sparse: bad integer constant expression
   drivers/hwmon/pmbus/stef48h28.c:72:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/hwmon/pmbus/stef48h28.c:73:1: sparse: sparse: bad integer constant expression
   drivers/hwmon/pmbus/stef48h28.c:73:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/hwmon/pmbus/stef48h28.c:74:1: sparse: sparse: bad integer constant expression
   drivers/hwmon/pmbus/stef48h28.c:74:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/hwmon/pmbus/stef48h28.c:74:1: sparse: sparse: bad integer constant expression
   drivers/hwmon/pmbus/stef48h28.c:74:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   drivers/hwmon/pmbus/stef48h28.c:75:1: sparse: sparse: bad integer constant expression
   drivers/hwmon/pmbus/stef48h28.c:75:1: sparse: sparse: static assertion failed: "MODULE_INFO(import_ns, ...) contains embedded NUL byte"

vim +72 drivers/hwmon/pmbus/stef48h28.c

262da1a92d47ef Charles Hsu 2026-01-26  71  
262da1a92d47ef Charles Hsu 2026-01-26 @72  MODULE_AUTHOR("Charles Hsu <hsu.yungteng@gmail.com>");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
