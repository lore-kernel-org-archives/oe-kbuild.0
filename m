Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62EDB266595
	for <oe-kbuild@lists.linux.dev>; Mon, 11 Aug 2025 10:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754909073; cv=none; b=NC7Dc3K6APbUhfKOStBjYGCXPBm9DPD94WFA11liDpEa0m3CeMIG9HlNwcdVYEpE0+FUpGeJ76Z2lT4DieYIDugc5ZLqvmaxJSa0tfXhjNLaMpDzOciFb4VLeMqmxB9SINpkSOAFV99jY0+RikPRYAh9tCSwfU0K7mzDePKTpZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754909073; c=relaxed/simple;
	bh=Yihe0yl4pKQp9W+M1asEh25WQ3xS0GSTESnzxFb37Zc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TLZZyy7FEuWDenPsmpU2o0B5q0cwfq2ETSHffeZttQLHnN/QbigUVRmprhvhHI1U8++Tb0t9qkym4BRSK3ciaoDC5HAR+37bz61zicDpj1ddprfe7+GUsqOLIERB081naAsZS9d+eJx9hx4rzWxYfT1FWQBr39kDauV1xPtu1pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b+2t1g0D; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b+2t1g0D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754909070; x=1786445070;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Yihe0yl4pKQp9W+M1asEh25WQ3xS0GSTESnzxFb37Zc=;
  b=b+2t1g0DKa5obs6QsJ8nsSONNBjzr8stxsSzgkzWt3GUZLZ9AvjttjUq
   SUpyKGUtQFQ5JdR577RcUX1nIPiZ786IDWgXk0HLla0L3izIQB3WAhjRB
   1Qm6tqgxXHIct8upwN4url2AQEPw76UYEGTmZkm0XgbmpeWsjEOHkFLck
   ARRa0odHaniJTBAFUJYXNGDXkuq/YS6eXa7ClGRZvYfVAP9o2XUq7j77h
   eRGFzmjIAhCWzk4C0pZ+xti7KswXEGnYMWrFWy+Rt3jyxJDrFwbfHUrG4
   Sjmp+x07Y+pmA7bfrEHSDiDc7OC4PmAgbXkyRpTDjOFHp5PCpF7BgLU5f
   A==;
X-CSE-ConnectionGUID: ro9s1VQyTmSgGpNieO1oQQ==
X-CSE-MsgGUID: 4Sz2UtZbSsSyF368g2WyTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="82598133"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="82598133"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 03:44:29 -0700
X-CSE-ConnectionGUID: JOh8MbRfQe+R3W6HkLnbeQ==
X-CSE-MsgGUID: MeU3Sda7QCmmSHsWtatvfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="165119927"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 11 Aug 2025 03:44:29 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ulQ0v-0005nI-2X;
	Mon, 11 Aug 2025 10:44:25 +0000
Date: Mon, 11 Aug 2025 18:43:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:for-next 2/9]
 arch/arm/boot/dts/vt8500/vt8500.dtsi:63.11-104.6: Warning
 (avoid_unnecessary_addr_size): /soc/pmc@d8130000/clocks: unnecessary
 #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or
 "ranges" property
Message-ID: <202508111853.aYGpqDAp-lkp@intel.com>
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
TO: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
head:   18adc1b2661a506b233aa53c4fbe2243c7f4db20
commit: 2a52e4d89847745f8ab76265199a371ef5e7f93f [2/9] scripts/dtc: Update to upstream version v1.7.2-35-g52f07dcca47c
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: arm-randconfig-002-20250811 (https://download.01.org/0day-ci/archive/20250811/202508111853.aYGpqDAp-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250811/202508111853.aYGpqDAp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508111853.aYGpqDAp-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/vt8500/vt8500.dtsi:63.11-104.6: Warning (avoid_unnecessary_addr_size): /soc/pmc@d8130000/clocks: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property

vim +63 arch/arm/boot/dts/vt8500/vt8500.dtsi

cb935e71577ad0 arch/arm/boot/dts/vt8500.dtsi Tony Prisk 2012-08-03 @63  			clocks {

:::::: The code at line 63 was first introduced by commit
:::::: cb935e71577ad0fb5babe34c5494de6a0093693d arm: vt8500: Add device tree files for VIA/Wondermedia SoC's

:::::: TO: Tony Prisk <linux@prisktech.co.nz>
:::::: CC: Tony Prisk <linux@prisktech.co.nz>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
