Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743292AE96
	for <oe-kbuild@lists.linux.dev>; Fri, 20 Dec 2024 11:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734693676; cv=none; b=IYtSA1SFAOD3NvtYrv61vIS/MEBTrOSdlori67shw6ndjGnCXTDO4A3J8e4PjIpfiE0sGH0bpOUt6RAZNds1v55mFMn2epDflsP4q6BqdA37Plcp57md5OBdpKPr8wyr0gJrXb2/ZYSGoQTVKWmoKOV6cby0h7AdJMf08rS1EfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734693676; c=relaxed/simple;
	bh=h4N+UdX8cbLJ+tHF/+dDisGMTeJfR0tptnmGznBfAp8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nOpU0POLqwuUgioeivXZARrl6IMErDxL/WxySN7pCgu/2huMxKLHNeEiAyjrLUwEO1mtu4nuVNxilC4PdOfOUjeLu8xFr6dln+C8t+9pVG2qsUFeNVRhTdbUuMHgCmHKVhY+XE6NB3AaQvwtIuhu+UCkPQnd1tTatwGx78mbIDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g3rZj1NK; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g3rZj1NK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734693674; x=1766229674;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h4N+UdX8cbLJ+tHF/+dDisGMTeJfR0tptnmGznBfAp8=;
  b=g3rZj1NKtprWQpg1k81FIpIksWbWC7BInHhSmXUr51JXwsTs8vde0cy/
   GE//7Ou62eeDLn58DhDxnZAKtpk0EqkkxgnPp57eGlSgqXa0l2ApxeJWH
   HTiOxn8f4Xz1KmIpJP11h/tyUF8ZY3ut/UdUd2gzAuX3J51FAXPQls8a2
   xcU0gsJDk6wdE4xfMbVjzxeud+lmossRBakfOw3UYUnj58ywjQYQjmLrh
   IDeH6j7TFgM8cwcAOkKaZ0eXpskVyoPKr9BC0kIzUqs6Zdah8WP9ssPAq
   9xpdVE1orAFAYBExuGmQRl7wVVHxk7LcNJdA7JSR9eV5L0w2mYjgfUVC3
   Q==;
X-CSE-ConnectionGUID: LvHhCPaeTVy8cEeFZ4q/WA==
X-CSE-MsgGUID: FB6H83THTHeOh7w1hPYzKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="45845551"
X-IronPort-AV: E=Sophos;i="6.12,250,1728975600"; 
   d="scan'208";a="45845551"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 03:21:13 -0800
X-CSE-ConnectionGUID: 3gzlpJVgT66W+MYn/B29ag==
X-CSE-MsgGUID: PPD9m0RBSE+gUh2bM77zvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="99313772"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 20 Dec 2024 03:21:13 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOb4A-00015X-0R;
	Fri, 20 Dec 2024 11:21:10 +0000
Date: Fri, 20 Dec 2024 19:21:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 2/2] dt-bindings: usb: ptn5110: add TCPC properties
Message-ID: <202412201917.0KAo0r67-lkp@intel.com>
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
In-Reply-To: <20241218010718.224530-3-miao@synopsys.com>
References: <20241218010718.224530-3-miao@synopsys.com>
TO: "Miao.Zhu" <Miao.Zhu@synopsys.com>
TO: gregkh@linuxfoundation.org
TO: robh@kernel.org
TO: xu.yang_2@nxp.com
TO: andre.draszik@linaro.org
TO: dan.carpenter@linaro.org
TO: emanuele.ghidoli@toradex.com
TO: heikki.krogerus@linux.intel.com
TO: m.felsch@pengutronix.de
TO: rdbabiera@google.com
TO: u.kleine-koenig@baylibre.com
TO: conor+dt@kernel.org
TO: jun.li@nxp.com
CC: "Miao.Zhu" <Miao.Zhu@synopsys.com>
CC: linux-kernel@vger.kernel.org
CC: linux-usb@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: Jianheng.Zhang@synopsys.com
CC: James.Li1@synopsys.com
CC: Martin.McKenny@synopsys.com

Hi Miao.Zhu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on b86545e02e8c22fb89218f29d381fa8e8b91d815]

url:    https://github.com/intel-lab-lkp/linux/commits/Miao-Zhu/usb-typec-tcpm-tcpci-Make-the-driver-be-compatible-with-the-TCPCI-spec-Rev-2-0-Ver-1-0-October-2017/20241218-173026
base:   b86545e02e8c22fb89218f29d381fa8e8b91d815
patch link:    https://lore.kernel.org/r/20241218010718.224530-3-miao%40synopsys.com
patch subject: [PATCH v2 2/2] dt-bindings: usb: ptn5110: add TCPC properties
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: csky-randconfig-052-20241220 (https://download.01.org/0day-ci/archive/20241220/202412201917.0KAo0r67-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev5+gea243eb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241220/202412201917.0KAo0r67-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412201917.0KAo0r67-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/usb/nxp,ptn5110.yaml: TX_BUF_BYTE_x_hidden: missing type definition
>> Documentation/devicetree/bindings/usb/nxp,ptn5110.yaml: RX_BUF_BYTE_x_hidden: missing type definition
>> Documentation/devicetree/bindings/usb/nxp,ptn5110.yaml: auto_discharge_disconnect: missing type definition
>> Documentation/devicetree/bindings/usb/nxp,ptn5110.yaml: vbus_vsafe0v: missing type definition
   Documentation/devicetree/bindings/net/snps,dwmac.yaml: mac-mode: missing type definition

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
