Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C84267B8D
	for <oe-kbuild@lists.linux.dev>; Fri,  2 May 2025 17:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746205885; cv=none; b=ZjjKWoo0p0Ffedq8U6Ul0Q/Y4b3og8/HehDgaqDF/C5HmC8g4wGticisWLj/zp4g69VKPyC6YD53I4kRPkoLUXGP6WwTHsl3Fu7qzEKBvisSxlWZpZjNwWWADiCK3eluuVdAYLAYKLzc/GzS5Z4sBdkEO0yvh4GcCfT+th45zVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746205885; c=relaxed/simple;
	bh=O3Yq1DSlWT1AfHDwOonKlAz4uqGAaClCAGwzYyO0FA0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C/k9oFJTYQQItd1lLT+sXgWtAqI5H/2MINHWEoybITGxUuUireVeYRMKYm6e1PNLFtVTtuSPDax/DHzjwZzGq0W8VUHnvlwhh3tIge4EALk+mHV6STOJKKhLkDHEbEqoqSDtnJjnrfp137hBXW4ShfuTCGWY/US28hRTrKmL1DM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dTQcOss/; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dTQcOss/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746205884; x=1777741884;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O3Yq1DSlWT1AfHDwOonKlAz4uqGAaClCAGwzYyO0FA0=;
  b=dTQcOss/NlECOXelUXHg/IDFHSwJIsLG6fOyWATPtgu4H0STeRCMKdLj
   wY866sgigCDtDC1bWQRd/WpkIXnGgR8RJ9H2vZdMpON5GQCpEOyPTqxbI
   CHskEmLbF6Pdzn82/HcHdUbaYMYkZsv3uOzpIoKz4wSgNbGNExDJ4BkKv
   McGedy3r1k4JBvsxNMSW1fZfxx8ApSOOW/W2jdMjADxHgHavDaRkEgD+n
   iGADVLoweSfhKVaqqZqwrr8fwpNtywIu+r/9XDNJxgKRZylczXeXMdbsu
   rAqZAMjCrkoz85Lv4sQgSlzk5XpxMWkxG4EkGxVginx8GWtIYsUUo3ljP
   g==;
X-CSE-ConnectionGUID: u1cpI08aRMaaJ9yNOzROPA==
X-CSE-MsgGUID: 7TdQq/DWQb+3NhR+18e59A==
X-IronPort-AV: E=McAfee;i="6700,10204,11421"; a="48036732"
X-IronPort-AV: E=Sophos;i="6.15,257,1739865600"; 
   d="scan'208";a="48036732"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 10:11:21 -0700
X-CSE-ConnectionGUID: EfZRuQL/TxeQ61xN/+QRtA==
X-CSE-MsgGUID: JHvGUaW0RA6lKlefBuEf4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,257,1739865600"; 
   d="scan'208";a="134645731"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 02 May 2025 10:11:20 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uAtuv-0004ub-33;
	Fri, 02 May 2025 17:11:17 +0000
Date: Sat, 3 May 2025 01:10:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 2/2] arm64: dts: imx8mp-tqma8mpql-mba8mp-ras314: Add
 Raspberry Pi Camera V2 overlay
Message-ID: <202505030059.P1lZExEd-lkp@intel.com>
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
In-Reply-To: <20250424075000.1263138-2-alexander.stein@ew.tq-group.com>
References: <20250424075000.1263138-2-alexander.stein@ew.tq-group.com>
TO: Alexander Stein <alexander.stein@ew.tq-group.com>
TO: Shawn Guo <shawnguo@kernel.org>
TO: Sascha Hauer <s.hauer@pengutronix.de>
TO: Pengutronix Kernel Team <kernel@pengutronix.de>
TO: Fabio Estevam <festevam@gmail.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: Alexander Stein <alexander.stein@ew.tq-group.com>
CC: imx@lists.linux.dev
CC: linux-arm-kernel@lists.infradead.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux@ew.tq-group.com

Hi Alexander,

kernel test robot noticed the following build warnings:

[auto build test WARNING on shawnguo/for-next]
[also build test WARNING on linus/master v6.15-rc4 next-20250502]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexander-Stein/arm64-dts-imx8mp-tqma8mpql-mba8mp-ras314-Add-Raspberry-Pi-Camera-V2-overlay/20250424-155126
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git for-next
patch link:    https://lore.kernel.org/r/20250424075000.1263138-2-alexander.stein%40ew.tq-group.com
patch subject: [PATCH v2 2/2] arm64: dts: imx8mp-tqma8mpql-mba8mp-ras314: Add Raspberry Pi Camera V2 overlay
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: arm64-randconfig-053-20250429 (https://download.01.org/0day-ci/archive/20250503/202505030059.P1lZExEd-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250503/202505030059.P1lZExEd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505030059.P1lZExEd-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314-lvds-imx219.dtb: camera@10 (sony,imx219): 'orientation', 'rotation' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/i2c/imx219.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtb: camera@10 (sony,imx219): 'orientation', 'rotation' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/i2c/imx219.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
