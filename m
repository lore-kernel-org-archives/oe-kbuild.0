Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC61231CA8
	for <oe-kbuild@lists.linux.dev>; Fri,  8 Nov 2024 17:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731087377; cv=none; b=iI2jG4kZoOD0tf1VB6dK6flr3goLCBKYCGWiaAPJWdHtvjNURGQ2t+KTF8IeVcgerr68Ax3ox+yl+jy3m1J3Y5EVal0O14NzBcwzTj/Bh0ZDUWxdYmtEq/oeKHak0xIrFl9K5G8hRyXZo1ZR4v0FoKwha3B6GHAw9zhOdM/Got8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731087377; c=relaxed/simple;
	bh=tVS47KiQ1yuUuwJSInzrG40cHBPxrcpWTW1EnrviRNs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S0qVRKQiMbPi3rWXQkcvMkSZLzN4d1qKKHlm9fFBptZ+R+GtEgYucbx4j/GxzU8D2b/W2KIghpGjL5tDjnaKr78cVbgjYyzhspRzcvLtgKiti9haujrLklcP1Scm95fiktTSBuPiLmweRxumWV6+eDpVja0kMinIaeCNktC576E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VIbHjmi1; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VIbHjmi1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731087375; x=1762623375;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tVS47KiQ1yuUuwJSInzrG40cHBPxrcpWTW1EnrviRNs=;
  b=VIbHjmi1b6p0nP3aukQStp1KPB62yLXP3rBBrFsF6SH+4Naky9onsvo0
   POmSFa+EMB68arKij/u04HGWLGQPuOJY3x1HXR6IBI6iTyIVOi4GaonfY
   yF5YBY1uwNjZm3qbNnhpc21ycjctDaGC9+8X7SMjYG1mD+B1QLJlhcJhz
   YOrNAiXrdWGXTKv5XIwsDlcDlWkWefdcTvbz7i4kZ5vj0lfFsAo3Wjzv0
   38xrhg9VrLYt809G7YhZDOJp3U4AMQIVOWoCnEZmkoWA9BP4TV6/B8n4N
   s5iag4sQ9zUmk9svx7jZ0MkkRoIVydsdWPQSvZyf73WZ0YFuOclI0alfh
   Q==;
X-CSE-ConnectionGUID: ry8CGCuFRqKZALZ1raUSFw==
X-CSE-MsgGUID: Kkb5G7kdTcmHiakfbHUiiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11250"; a="34765140"
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; 
   d="scan'208";a="34765140"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2024 09:36:15 -0800
X-CSE-ConnectionGUID: k8UOOOo/RN++iPlZgfOPfA==
X-CSE-MsgGUID: aWRnLnYFS2awBCQzpZ1UUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; 
   d="scan'208";a="108951165"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 08 Nov 2024 09:36:13 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9Su3-000rei-0h;
	Fri, 08 Nov 2024 17:36:11 +0000
Date: Sat, 9 Nov 2024 01:36:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 1/2] dt-bindings: input: Goodix GT7986U SPI HID
 Touchscreen
Message-ID: <202411090145.eCFPadBI-lkp@intel.com>
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
In-Reply-To: <20241108120311.87795-2-charles.goodix@gmail.com>
References: <20241108120311.87795-2-charles.goodix@gmail.com>
TO: Charles Wang <charles.goodix@gmail.com>
TO: krzk@kernel.org
TO: hbarnor@chromium.org
TO: dianders@chromium.org
TO: conor.dooley@microchip.com
CC: dmitry.torokhov@gmail.com
CC: jikos@kernel.org
CC: bentiss@kernel.org
CC: linux-input@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Charles Wang <charles.goodix@gmail.com>

Hi Charles,

kernel test robot noticed the following build warnings:

[auto build test WARNING on dtor-input/next]
[also build test WARNING on dtor-input/for-linus krzk-dt/for-next linus/master v6.12-rc6 next-20241108]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Charles-Wang/dt-bindings-input-Goodix-GT7986U-SPI-HID-Touchscreen/20241108-200454
base:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
patch link:    https://lore.kernel.org/r/20241108120311.87795-2-charles.goodix%40gmail.com
patch subject: [PATCH v3 1/2] dt-bindings: input: Goodix GT7986U SPI HID Touchscreen
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
config: csky-randconfig-051-20241109 (https://download.01.org/0day-ci/archive/20241109/202411090145.eCFPadBI-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241109/202411090145.eCFPadBI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411090145.eCFPadBI-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/input/goodix,gt7986u-spifw.yaml: ignoring, error parsing file
   Warning: Duplicate compatible "pericom,pt7c4338" found in schemas matching "$id":
   	http://devicetree.org/schemas/rtc/trivial-rtc.yaml#
   	http://devicetree.org/schemas/rtc/rtc-ds1307.yaml#
   Warning: Duplicate compatible "epson,rx8025" found in schemas matching "$id":
   	http://devicetree.org/schemas/rtc/trivial-rtc.yaml#
   	http://devicetree.org/schemas/rtc/rtc-ds1307.yaml#
   Warning: Duplicate compatible "isil,isl1208" found in schemas matching "$id":
   	http://devicetree.org/schemas/rtc/trivial-rtc.yaml#
   	http://devicetree.org/schemas/rtc/isil,isl1208.yaml#
   Warning: Duplicate compatible "isil,isl1218" found in schemas matching "$id":

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
