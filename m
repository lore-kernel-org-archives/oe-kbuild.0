Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10008F9D7
	for <oe-kbuild@lists.linux.dev>; Mon, 12 Feb 2024 08:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707725621; cv=none; b=o1DfXntN2DYq3ATxCgkVszCWzU3HDVbInw4TYLKYBi6mXVH9RpE/8STXiQOclfZFpokOdg65fgDuXmO2l1HtlplZZa1Tnl6QMLHR/gbK1ILzj5dxrPOB9cUl9hbbf7tqJlr6Va4cTkbJgWQjEyguGB/d1NS9JekTUQnd/V+o3HA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707725621; c=relaxed/simple;
	bh=0B9y6oRmHd8v9ufWel//LMyv5zY/StCJzZoUIS0h6a8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jKwofYWiy8N+ruZa2YE2VsIbMJ9ik2+T/q0PRF03aDOgNAJHY1Ceruuj86Nei687LT5FefH9jyCmRhuUDaMLMAyh31gMkhYLxO1Jb5EI+h02ymqaKlTc89HWCXZBkcmci2vIAdKCB0bb+Q5+WN0ANDZ6APOyM3cGEJKvKCFj3as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hAXws1qb; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hAXws1qb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707725619; x=1739261619;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=0B9y6oRmHd8v9ufWel//LMyv5zY/StCJzZoUIS0h6a8=;
  b=hAXws1qbARP6igF/RveAkG82/UHY/cq+tgsiw9XrWBv3ZAYwbVboK6ke
   e8exDRP9zZRYb4xMsqz4G89OJLj+zbNM5gtpa37KokjH2fA10+QmpwGyi
   3ZxRCQ/bZbWnYU7RdLSWCV/xTFg9MzY0Ftb3FOHuuzWY0/gclGJlmOJYO
   5u0jYXJptMF5ERT360th0U+HBfcE0e4V/RwrgenwT+IhyaEVYRZm3iXH5
   QErPSYmY3CkTuGxNLMZyuolHJz5CYMEZGYn+HijuT3bW0A5Vj/bvNXLBK
   YHyl7+2md+213GCo4z1DBXziLmMIf1RXBC8FdRYu4a9G/UByyewAImE+2
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10981"; a="1824673"
X-IronPort-AV: E=Sophos;i="6.05,262,1701158400"; 
   d="scan'208";a="1824673"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2024 00:13:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10981"; a="911416485"
X-IronPort-AV: E=Sophos;i="6.05,262,1701158400"; 
   d="scan'208";a="911416485"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 12 Feb 2024 00:13:36 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rZRRW-000714-2d;
	Mon, 12 Feb 2024 08:13:34 +0000
Date: Mon, 12 Feb 2024 16:13:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/4] dt-bindings: iio: magnetometer: Add DT binding for
 Voltafield AF8133J
Message-ID: <202402121531.EoXy0HWe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "empty line found in static check configure file"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20240211205211.2890931-3-megi@xff.cz>
References: <20240211205211.2890931-3-megi@xff.cz>
TO: "Ondřej Jirman" <megi@xff.cz>
TO: Jonathan Cameron <jic23@kernel.org>
TO: "Lars-Peter Clausen" <lars@metafoo.de>
TO: Rob Herring <robh+dt@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Andrey Skvortsov <andrej.skvortzov@gmail.com>
CC: Icenowy Zheng <icenowy@aosc.io>
CC: linux-iio@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: "Ondřej Jirman" <megi@xff.cz>

Hi Ondřej,

kernel test robot noticed the following build warnings:

[auto build test WARNING on jic23-iio/togreg]
[also build test WARNING on robh/for-next linus/master v6.8-rc4 next-20240212]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ond-ej-Jirman/dt-bindings-vendor-prefix-Add-prefix-for-Voltafield/20240212-045510
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
patch link:    https://lore.kernel.org/r/20240211205211.2890931-3-megi%40xff.cz
patch subject: [PATCH 2/4] dt-bindings: iio: magnetometer: Add DT binding for Voltafield AF8133J
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240212/202402121531.EoXy0HWe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202402121531.EoXy0HWe-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/iio/magnetometer/voltafield,af8133j.yaml: properties:compatible: ['voltafield,af8133j'] is not of type 'object', 'boolean'
   	from schema $id: http://json-schema.org/draft-07/schema#
>> Documentation/devicetree/bindings/iio/magnetometer/voltafield,af8133j.yaml: properties:compatible: ['voltafield,af8133j'] is not of type 'object', 'boolean'
   	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
--
>> Documentation/devicetree/bindings/iio/magnetometer/voltafield,af8133j.yaml: ignoring, error in schema: properties: compatible

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
