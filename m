Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7581229414
	for <oe-kbuild@lists.linux.dev>; Sat,  3 Aug 2024 05:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722661488; cv=none; b=iXQhu0kRuzKvDgYAA7t79bel/hsbVNj1vcuQKaj8mehwO61yxhcssN/FiegGmsgXsehI6PbOpwMNRcCfKmwGaeW3S/pk+soAWE9zRq13O2tzThY2srhur7vOy0Ts3eHd5oV75gM+ipFvtdKQ6b4c6TQPYoNkm8IcCjrli8Ja/ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722661488; c=relaxed/simple;
	bh=1+/hGeInOJWVOmpeF3DoehgIevWXmo3YGDFnECBiySI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rQJENsYFzUx0p+Cgt4pAvRZ9bOvoNCYgtUwWEjMGlkaQ4eq+sF3esvpIFG+XhVWL5KgRWdKAdldm7PKOYEZy2CxtYGIGOkStfUpMA0MhuvOuUn75A3LhJQWRX+EtPD3aR0pts5Ck9suJS7Xw5f2ZY/mpP+8Z7xPdbg3qNnf31JQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EpSt6HZg; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EpSt6HZg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722661487; x=1754197487;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1+/hGeInOJWVOmpeF3DoehgIevWXmo3YGDFnECBiySI=;
  b=EpSt6HZgoGWLaI/8wI/PyGNGAlcbz01xlNpOSN9czIB4E6BInlK8nX1R
   x5w/2wOCAaBet7QhJOjhT1AXxEfgZZd62KNhtmqKO8VS0/Elpt68j3hwm
   v61Ixn3LeLrUPzafYvWBOv3cy/vZ4RtWnaahDhn209859LiyW+brOpvzd
   eF/l9Jsn5Dp+WlnfaKe9S57xXDRgR3Wko/79pnUvwW8tw0xOZYdFonunw
   tWGhrLPPsAnoiBhgKsF2wJ2qg/bAfCtwRE4WxS1vCeiltX0T9OZCTq+ng
   kioBRB2ITeZueJt7Pcwhfsih1IQZB2jKcRy/LmQpP3mOHjtC2J6ous+EJ
   w==;
X-CSE-ConnectionGUID: 61C9v+9CQTmE6iuUt0H0yw==
X-CSE-MsgGUID: ze0VfZqPRyiWhBlBK6kySg==
X-IronPort-AV: E=McAfee;i="6700,10204,11152"; a="20503619"
X-IronPort-AV: E=Sophos;i="6.09,259,1716274800"; 
   d="scan'208";a="20503619"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2024 22:04:46 -0700
X-CSE-ConnectionGUID: OBHCN47BSfWW62fsZb5XCA==
X-CSE-MsgGUID: JvOAbWvEQRiB1euCAtaAVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,259,1716274800"; 
   d="scan'208";a="60268014"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 02 Aug 2024 22:04:44 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sa6wa-00006E-0c;
	Sat, 03 Aug 2024 05:04:40 +0000
Date: Sat, 3 Aug 2024 13:04:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH RFC 1/3] dt-bindings: iio: adc: add AD762x/AD796x ADCs
Message-ID: <202408031212.hldOyLlk-lkp@intel.com>
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
In-Reply-To: <20240731-ad7625_r1-v1-1-a1efef5a2ab9@baylibre.com>
References: <20240731-ad7625_r1-v1-1-a1efef5a2ab9@baylibre.com>
TO: Trevor Gamblin <tgamblin@baylibre.com>

Hi Trevor,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on ac6a258892793f0a255fe7084ec2b612131c67fc]

url:    https://github.com/intel-lab-lkp/linux/commits/Trevor-Gamblin/dt-bindings-iio-adc-add-AD762x-AD796x-ADCs/20240802-054208
base:   ac6a258892793f0a255fe7084ec2b612131c67fc
patch link:    https://lore.kernel.org/r/20240731-ad7625_r1-v1-1-a1efef5a2ab9%40baylibre.com
patch subject: [PATCH RFC 1/3] dt-bindings: iio: adc: add AD762x/AD796x ADCs
:::::: branch date: 31 hours ago
:::::: commit date: 31 hours ago
config: arc-randconfig-051-20240803 (https://download.01.org/0day-ci/archive/20240803/202408031212.hldOyLlk-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev8+gf13c181
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240803/202408031212.hldOyLlk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408031212.hldOyLlk-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/iio/adc/adi,ad7625.yaml: ignoring, error parsing file

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
