Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9967247D935
	for <oe-kbuild@lists.linux.dev>; Mon,  5 Oct 2026 12:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791203184; cv=none; b=HeqJ5hNfxdqCaSIQVETx1zbej7C5yWNm50JWWYK71MqMSOXWwDE9Qqb24WPvRPcEGai7cN5SZJEmTzFSy7F8ZvWg1YDq8s00aJAUzVBjSXiv6Fg3iRJj0x9Lp23YYn83v4IukNe6tYgpPpDvXC5q2MNFFV9GuUBCV5HXzdc0h5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791203184; c=relaxed/simple;
	bh=4gnxAgxbdaARoMdTBSrvKQY8QLRBYECALF5HjrG3FtU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cVI8j2sMU7eksTY3bbf6n1CLx5m5566ug6wboIScP7OuUMYvnfFpFUGrgZyNyNx3daBXe2Kfd1wE+Mc52l8jeAuelcT9pFyX180XrK2sQIprwnRVKCu4tOfbIPliqPp8V3G8BAvIn7FVtxL7XfkuCdCWkOkGg7L+MMRdjDd/Mjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Oi/4TGEY; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Oi/4TGEY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791203183; x=1822739183;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4gnxAgxbdaARoMdTBSrvKQY8QLRBYECALF5HjrG3FtU=;
  b=Oi/4TGEYQyDz2pflNC/uqd8VVCcAy0POWnt0yvon3pDCf0UU8ZjdQHfB
   85qi7tOLnnKO2ZCu3ihR6MjSJT35fzcSxtAo+ubmFvDdzSlySDbPqKks9
   hNkvMNkDlxnXPG67zIX+3itfeuxsZnNQTrE2I02SE5VkOU6KKnsJj4p/v
   OZxDybtdWP9zaiYFwgb50OlKAPJBfitPsC3c2/3AbXN2OmV7u3ANZ1kfl
   T5IRwgbTXxX7WpuJ7ZMXvHeWQfCerFxYObrQSrovbYwmZ/skkIC2bHnHU
   7Y8mGloyhsI6p/d9JTFLVOsdrjGOPAYSNc738OFaFb0pviFdWRyAexpd5
   Q==;
X-CSE-ConnectionGUID: Fu3cuE0SSkilhLvmSUvzOg==
X-CSE-MsgGUID: GYTg5dBLQp228Ux5nW/5cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="79429414"
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="79429414"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 05:26:22 -0700
X-CSE-ConnectionGUID: kGzJe7rCTo2awmQ3J6Nw8A==
X-CSE-MsgGUID: DMq4Hu4vRKemTOovSwhbYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="274604752"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 05 Oct 2026 05:26:22 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDhlp-0000000007X-18IX;
	Mon, 05 Oct 2026 12:26:17 +0000
Date: Mon, 5 Oct 2026 14:26:06 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: dt-bindings: embedded-controller: qcom,hamoa-crd-ec: Add thermal
 sensors
Message-ID: <202610051426.eyLENcEG-lkp@intel.com>
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
In-Reply-To: <202610051426.eyLENcEG-lkp@intel.com>
References: <202610051426.eyLENcEG-lkp@intel.com>

Hi Anvesh,

kernel test robot noticed the following build warnings:



url:    https://github.com/intel-lab-lkp/linux/commits/Anvesh-Jain-P/dt-bindings-embedded-controller-qcom-hamoa-crd-ec-Add-thermal-sensors/20260928-120637
base:   
patch link:    https://lore.kernel.org/r/202610051426.eyLENcEG-lkp%40intel.com
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: arm64-randconfig-2402-20260930 (https://download.01.org/0day-ci/archive/20261005/202610051426.eyLENcEG-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2026.10.dev4+g568711590
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261005/202610051426.eyLENcEG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610051426.eyLENcEG-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/hamoa-iot-evk.dtb: embedded-controller@76 (qcom,hamoa-iot-evk-ec): '#thermal-sensor-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/embedded-controller/qcom,hamoa-crd-ec.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: embedded-controller@76 (qcom,hamoa-crd-ec): '#thermal-sensor-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/embedded-controller/qcom,hamoa-crd-ec.yaml
--
>> arch/arm64/boot/dts/qcom/x1p42100-crd.dtb: embedded-controller@76 (qcom,hamoa-crd-ec): '#thermal-sensor-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/embedded-controller/qcom,hamoa-crd-ec.yaml
--
>> arch/arm64/boot/dts/qcom/x1e80100-crd-el2.dtb: embedded-controller@76 (qcom,hamoa-crd-ec): '#thermal-sensor-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/embedded-controller/qcom,hamoa-crd-ec.yaml
--
>> arch/arm64/boot/dts/qcom/hamoa-iot-evk-el2.dtb: embedded-controller@76 (qcom,hamoa-iot-evk-ec): '#thermal-sensor-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/embedded-controller/qcom,hamoa-crd-ec.yaml
--
>> arch/arm64/boot/dts/qcom/x1p42100-crd-el2.dtb: embedded-controller@76 (qcom,hamoa-crd-ec): '#thermal-sensor-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/embedded-controller/qcom,hamoa-crd-ec.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
