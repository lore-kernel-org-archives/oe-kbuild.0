Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794495431;
	b=RNLD6vucPp8z3wXZHIlH/sr++vqn1XtPEBF8/ACYfaYwq7qQdmPIuvk5w8CAK1VzSYTS
	 WZPoaU86FEimfyXTRCTV+Zebp5xS0S3FUajx16AD14yHBV4Vv0Qu8G0iUwKQrbNEkWh5K
	 J3346e/hDDg1vT2NlLonVc8YxdVfZe6mbgx4h91w681wsTpgHzpwbgAOVUYsPPb8MOtfr
	 gVuhLEDqWzqT6fOC7CsiL+fgiC0WW5G9sVxoL5eW3ma9+jCi9pngGbwIhDbjQtwmWWdoe
	 k5KJS2UB36ExNjqkfwpduYIae87bUTbLfH5ZExlrZC2SNvyORns+Lw0bQlaJ5cJZ2/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794495431;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=rZI3cMKQj8Ts3L0s+Zbjr/VLLYITEfjB1L2bY+RmfDs=;
	b=lUiLn/qj9E2rCFcCylYSNTdbB1+Y6YWtSR125zYDDNUuq8DltKeykEiVFyKMZvsY+B4v
	 o1oRhpvO3e1XR37SaDWG2XI7VMBH0/OxlIvKFkq0KxYEffLUYZoMLJpA5HqfElt5EKoEW
	 5OTlC6wyNJfVh8MiGOWZSCP7ZuugcWzxXs3z6MQHn+iMI0Z6S0yEpgsfuvD5lMgT7hmP6
	 zChZPDfrFd52QDvz1R0qzXcF+BIYBT1FulWBwncp2JePF9+s7KbKKLBBceIjJLknCs3Rj
	 /4eK9z9szFh0Cci7XWktAa3MLO2armXGDmuq3DodIlTyqKzbQtEuDNT59SmDUvWQEhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Tl+8hfxk;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4A2606A31C
	for <oe-kbuild@lists.linux.dev>; Thu, 12 Nov 2026 14:57:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F4A2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Tl+8hfxk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794495431; x=1826031431;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6XYA88barDzW4hNgyGLVzSq1FMRa2CzRr5hOnS0Vshw=;
  b=Tl+8hfxkTaWkCc7LwsqCZJbrijQqPxoklmQ5dDFJEAQRp2+9Nis9ufdG
   N9ouauwcL9rwL2zHaDhb6XYoSsKQZamlj9NaJC7nM3PJA2auZux+OFv/z
   qN0JPMHxqjt84dZI+5IYQMdpz9aRBmtCbHcPS5S/sjg/nNFsMbf3vXPHR
   PnhABBd5AFepKo3oNDl8n7MEsFX3itbDewGy+3izr8tc8pNKxvGG7q7eO
   3dfS8vivCD3seaYYYGW3aBrOktSxYzKNJvliYX4BfstFQY7NelXl8swgn
   YWk41CjZMokaEMGFB7m7S9lfif26J9RqpeQBmXsq1OOfilem82Uwmz6rR
   A==;
X-CSE-ConnectionGUID: N3NnpdpARliK/OgrXRzK4w==
X-CSE-MsgGUID: buErQSzXQ2CtKHxGgpBvBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3192925"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3192925"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 06:57:10 -0800
X-CSE-ConnectionGUID: DatgTXteT66HfXciv7eZBw==
X-CSE-MsgGUID: w+lE1sKMTquE6IzxqjSQeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="10570308"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa013.fm.intel.com with ESMTP; 12 Nov 2026 06:57:10 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRWEc-000000011aN-49pJ;
	Thu, 12 Nov 2026 14:57:06 +0000
Date: Thu, 12 Nov 2026 22:57:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [RFC PATCH 2/2] iio: accel: msa311: use regmap_reg_field_*
 functions
Message-ID: <202611122238.bvkxU01r-lkp@intel.com>
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "linux-review patch is more than 7 days old, verify it wasn't already superseded"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <SN1PR12MB25282EC93A27F3577BB9B454A5772@SN1PR12MB2528.namprd12.prod.outlook.com>
References: <SN1PR12MB25282EC93A27F3577BB9B454A5772@SN1PR12MB2528.namprd12.prod.outlook.com>
TO: Victor Chernyakin <chernyakin.victor.j@outlook.com>

Hi Victor,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-regmap/for-next]
[also build test WARNING on jic23-iio/togreg linus/master v7.4-rc2]
[cannot apply to next-20261111]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Victor-Chernyakin/regmap-add-regmap_reg_field_-APIs/20261104-180949
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git for-next
patch link:    https://lore.kernel.org/r/SN1PR12MB25282EC93A27F3577BB9B454A5772%40SN1PR12MB2528.namprd12.prod.outlook.com
patch subject: [RFC PATCH 2/2] iio: accel: msa311: use regmap_reg_field_* functions
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20261112/202611122238.bvkxU01r-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261112/202611122238.bvkxU01r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611122238.bvkxU01r-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/iio/accel/msa311.c:306 Excess struct member 'fields' description in 'msa311_priv'
>> Warning: drivers/iio/accel/msa311.c:306 Excess struct member 'fields' description in 'msa311_priv'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
