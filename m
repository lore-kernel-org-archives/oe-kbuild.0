Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F7AF1EA65
	for <oe-kbuild@lists.linux.dev>; Mon, 22 Dec 2025 04:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766379030; cv=none; b=YaF/L0zsvqpRcRI47d4++dDRjLx9hk4aJaqqGKMitOj2IAZ/Y4irhs2Q+zbOQEhpDBJkq2i2M/boShPCEXjTlUf63sdKx/o6xWr6LjEVTZgwfO0AfFPCYKYXg7Kj0u6PEobhqaPPrM0xPVvVhNRyrmT1m+d9Wd8cwc70W7V14X4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766379030; c=relaxed/simple;
	bh=Kav5bQI9oQ3kx8frTkO4oIljNFHrRKYeT106mbuuZ2I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HpfKGIwei+45KUiZQWHww+CdJEfxQH65btZzGuJeWFi6L04AVaxaPsjf6UDSg8AYwjeq/rp78DYiAfCMKd/cY0LFpMfpoWY8Krn1ERHvZNZEDnnTz3Xq0onXBCavLPvg+yHTgt93B4yGXB+rOFrA6BAEP7Pz/n1aIM0VKbJsLko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CGqXXeyr; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CGqXXeyr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766379028; x=1797915028;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Kav5bQI9oQ3kx8frTkO4oIljNFHrRKYeT106mbuuZ2I=;
  b=CGqXXeyroEyc4yegU8y4XSny8dvsbV8vlXzpvpHofFdCozaZAb4xxmYd
   kVbRqkrOKpIFYNjON9o4fHZMhg9+MdAh0Brb1zvaJtKfsYO3H7yC0IHIa
   0q+XUbX7AAH9MKkwKO2I9+dAjF+HdlctWxDqC4Rq6VoLDrtCP7E81Otri
   pA87hRPRqQM2VtFdNdSISDz3NlErEKXIfoMEQeJmFvQfWVYbhtnY6Otkg
   /gnreDZeuMW6bIPdvAeZbXGD28IeGy2H3U2RCCydROcECreaTRYxBpjHz
   emMOxPLymwX5oxuumMAQPuUVSeB7HWyZNF+BZrrBTo57sAJfmsBkX94rz
   Q==;
X-CSE-ConnectionGUID: SMDVQWu6SaWKKryh+tQggg==
X-CSE-MsgGUID: kLM3+2xpTk2m39iKeFWsPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="85816938"
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="85816938"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 20:50:27 -0800
X-CSE-ConnectionGUID: cO7j80MSQZqaI0sUkC32MQ==
X-CSE-MsgGUID: 81Q1CwlkR16ggUTifAkC2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="198586117"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 21 Dec 2025 20:50:27 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXXsF-0000000006r-3meb;
	Mon, 22 Dec 2025 04:50:23 +0000
Date: Mon, 22 Dec 2025 12:50:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 1/2] media: i2c: Add ov2732 image sensor driver
Message-ID: <202512221229.A1GrLcRh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/media/i2c/ov2732.c:795:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20251218-ov2732-driver-v1-1-0ceef92c4016@schnwalter.eu>
References: <20251218-ov2732-driver-v1-1-0ceef92c4016@schnwalter.eu>
TO: Walter Werner SCHNEIDER <contact@schnwalter.eu>
TO: linux-media@vger.kernel.org
CC: Walter Werner SCHNEIDER <contact@schnwalter.eu>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>

Hi Walter,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8f0b4cce4481fb22653697cced8d0d04027cb1e8]

url:    https://github.com/intel-lab-lkp/linux/commits/Walter-Werner-SCHNEIDER/media-i2c-Add-ov2732-image-sensor-driver/20251218-062039
base:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
patch link:    https://lore.kernel.org/r/20251218-ov2732-driver-v1-1-0ceef92c4016%40schnwalter.eu
patch subject: [PATCH 1/2] media: i2c: Add ov2732 image sensor driver
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: mips-randconfig-r121-20251219 (https://download.01.org/0day-ci/archive/20251222/202512221229.A1GrLcRh-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251222/202512221229.A1GrLcRh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512221229.A1GrLcRh-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/media/i2c/ov2732.c:795:1: sparse: sparse: bad integer constant expression
   drivers/media/i2c/ov2732.c:795:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/media/i2c/ov2732.c:796:1: sparse: sparse: bad integer constant expression
   drivers/media/i2c/ov2732.c:796:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/media/i2c/ov2732.c:796:1: sparse: sparse: bad integer constant expression
   drivers/media/i2c/ov2732.c:796:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   drivers/media/i2c/ov2732.c:797:1: sparse: sparse: bad integer constant expression
   drivers/media/i2c/ov2732.c:797:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"

vim +795 drivers/media/i2c/ov2732.c

3d028cd57ce198 Walter Werner SCHNEIDER 2025-12-18  794  
3d028cd57ce198 Walter Werner SCHNEIDER 2025-12-18 @795  MODULE_DESCRIPTION("OmniVision ov2732 sensor driver");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
