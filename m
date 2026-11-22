Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795332109;
	b=VMOEZoO5qazeIbUosTzl1AUUudX0c5h3UnlA/Tv1SIpmh4a9E7H9I5Dz5aAZuVoDfigo
	 M3StyO+IqsvPU2ZWVp9Rhov1BwDFqYcM39LeXa6Dhq3l0uzxSaJWoNOxeciBTw3W0C8fQ
	 z/o+HpzpyxtnizpbaId1mXJdwJUUzY2mvB5iBIQl9fSuXGVRWJqD+Pcwr2Nhd2dMtgqXm
	 6Cz8L4t2EJ+uKprKjiL3CVBVPqx/EQ9qdmGB84Hj+WAlobSRK1wzHkxbSDKr9lG5jqkg+
	 sXXXA2IZxUMTfakSfbewsCI3XgyeVEkfgyV4l0Px2qCVGATGE0h2TVVQS7/UeZ6W4Jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795332109;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=OXR8w95nYGc1imlAI2OxGuTOXSKsxT4Nc2R+3ANHcQE=;
	b=XV8jatyS8fSd5u4aLB30KZbgtKRivqMSq//XVc+SF5Opw45brpGKtSZBpYXvgkj1xuyk
	 z9XyrxTp47uhYBrkGpjHOmNc8IBGEg+NY2/O5fbVHM5rfivXMqSnZgVmZCkZHGd8Hw9bn
	 9aifCPBpxk5cjKQm9HmBHqnepR8HkhOnuNieOQwMinKyDOrxR2TxxJq8z64lCrZ+hyX6W
	 M2GXvdtvtlC8Z8H1VODIG8K4kJzqGk7Hv04UtjgHKsspSOFE5TG9c/RQsIQjC5G9sN3DO
	 ly2kBGPC3/qHYYyxFR90h3OzFqiv8JHNmRr5xg0b+SV12sQDEEanFFkE5BoBj8Z9WLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hS2nkiBW;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9B3606A320
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Nov 2026 07:21:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA9B3606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hS2nkiBW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795332107; x=1826868107;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=jx7QxKQu2nNAV30JwHWgw4PxGFDM9yg++xlqY7Y21xY=;
  b=hS2nkiBWhuy4TDmG4OtjFvKQcMm1FM7QJlsywaDC/tP4PxrUPJ8te7y/
   0wNCCB978k0n0c808ufKEGYWc0eBZXNbttq2W6SZA98IYA4BiCyX7vMSm
   mOMIf2R8PHWw6Zkyl9ZFG5J6crqokKPfvj+B3UNiFvCyb7dx943/dlGp8
   XXlO5e2KwWbr/o4zut/GFoIuSvkqWZ0/JRta+agkrHfv+yDdc6cqe8/4S
   YZ2bE/t3FXtcO1yE5Mkl6zgTCu32ZIQUngxpAGQ+ZfZNmwbCP0L2P3tmm
   YB32hxW6nqsK0X7jFtiG2y6aCHqp8r+7NILyI6slr9+Nfcc8zu+H1nx80
   w==;
X-CSE-ConnectionGUID: o39R5obOTG+e9AIsL783gg==
X-CSE-MsgGUID: KxIMEERnQnGK0LZn1MeWhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4174644"
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; 
   d="scan'208";a="4174644"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2026 23:21:47 -0800
X-CSE-ConnectionGUID: e//uE2AtShWdILfBsx7agg==
X-CSE-MsgGUID: mkA5Z2jYQIa9MvhZv0XnlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; 
   d="scan'208";a="11025886"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 21 Nov 2026 21:56:56 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xV0ZJ-00000001L5y-1dm4;
	Sun, 22 Nov 2026 05:56:53 +0000
Date: Sun, 22 Nov 2026 13:56:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 3/3] platform/x86: dasharo-acpi: Add EC fan curve support
Message-ID: <202611221347.IQkJ3mWs-lkp@intel.com>
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "linux-review patch is more than 7 days old, verify it wasn't already superseded"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20261113074347.2301465-4-filip.golas@3mdeb.com>
References: <20261113074347.2301465-4-filip.golas@3mdeb.com>
TO: "Filip Gołaś" <filip.golas@3mdeb.com>
TO: "Michał Kopeć" <michal.kopec@3mdeb.com>
TO: Hans de Goede <hansg@kernel.org>
TO: "Ilpo Järvinen" <ilpo.jarvinen@linux.intel.com>
CC: platform-driver-x86@vger.kernel.org
CC: linux-hwmon@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Guenter Roeck <linux@roeck-us.net>
CC: "Filip Gołaś" <filip.golas@3mdeb.com>

Hi Filip,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v7.4-rc3 next-20261120]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Filip-Go-a/platform-x86-dasharo-acpi-Extract-dasharo_call-from-dasharo_read_channel/20261113-084345
base:   linus/master
patch link:    https://lore.kernel.org/r/20261113074347.2301465-4-filip.golas%403mdeb.com
patch subject: [PATCH 3/3] platform/x86: dasharo-acpi: Add EC fan curve support
:::::: branch date: 9 days ago
:::::: commit date: 9 days ago
config: i386-randconfig-007-20250811 (https://download.01.org/0day-ci/archive/20261122/202611221347.IQkJ3mWs-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261122/202611221347.IQkJ3mWs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611221347.IQkJ3mWs-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/platform/x86/dasharo-acpi.o: in function `curve_point_pwm_show':
>> drivers/platform/x86/dasharo-acpi.c:453:(.text+0x644): undefined reference to `__udivdi3'


vim +453 drivers/platform/x86/dasharo-acpi.c

79e29ab55861d29 Filip Gołaś 2026-11-13  440  
79e29ab55861d29 Filip Gołaś 2026-11-13  441  static ssize_t curve_point_pwm_show(struct device *dev, struct device_attribute *attr, char *buf)
79e29ab55861d29 Filip Gołaś 2026-11-13  442  {
79e29ab55861d29 Filip Gołaś 2026-11-13  443  	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
79e29ab55861d29 Filip Gołaś 2026-11-13  444  	struct dasharo_data *data = dev_get_drvdata(dev);
79e29ab55861d29 Filip Gołaś 2026-11-13  445  	u64 point = sattr->index;
79e29ab55861d29 Filip Gołaś 2026-11-13  446  	u64 val;
79e29ab55861d29 Filip Gołaś 2026-11-13  447  	int err;
79e29ab55861d29 Filip Gołaś 2026-11-13  448  
79e29ab55861d29 Filip Gołaś 2026-11-13  449  	err = dasharo_call(data, "GFPD", DASHARO_FEATURE_FAN_POINTS, sattr->nr, &point, 1, &val);
79e29ab55861d29 Filip Gołaś 2026-11-13  450  	if (err)
79e29ab55861d29 Filip Gołaś 2026-11-13  451  		return err;
79e29ab55861d29 Filip Gołaś 2026-11-13  452  
79e29ab55861d29 Filip Gołaś 2026-11-13 @453  	return sysfs_emit(buf, "%llu\n", DIV_ROUND_CLOSEST(val * 255, 100));
79e29ab55861d29 Filip Gołaś 2026-11-13  454  }
79e29ab55861d29 Filip Gołaś 2026-11-13  455  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
