Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 673991E871
	for <oe-kbuild@lists.linux.dev>; Fri, 13 Jun 2025 16:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749831837; cv=none; b=AIsS5qjoWZ1fELUIllCZg8UfZtKqauXmwv+Llzt8sB5Q7foOFQV9NtArLXcbqr3zQJDtCE0hBJicNI1y1XFRcVF3hWml1Tf6+nFQ6BKiN+axddo2Uw12zn/zPRXKL5s/UefIwBqIYGN7P9SNR3BUm9ckeF5Y/HqSRYAit0dre1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749831837; c=relaxed/simple;
	bh=nSlHbyPktK6MpT5LLwUbluyzyquCGYjDfqK7vUey5MY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OtXm4majC/MB0Tn2ebj12HqFAVbtxuK0PAgrj5WbppGu1HBnpkZAOrMkkjHXzfc7EF183sSjDPdd/SkyEfxt+GSRq7WwX177ju5FsX8pCpG28bMs0La09KUn2fUhrQptbBYUPfWscwInV1N4+zdCISY4NRPhI8U1owvn8zaDsSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I1+g9mNt; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I1+g9mNt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749831835; x=1781367835;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nSlHbyPktK6MpT5LLwUbluyzyquCGYjDfqK7vUey5MY=;
  b=I1+g9mNtHXT44C3bOkFRvaVDimHxo2Esb6ITTl0qxWT0hWMuzoW48rKN
   5DZTLSRsDTHosbcq8sLXNrC9KQpXTs5pgCEm1mkNRSoY7ZK+KPsjwbNzm
   gypi6s36fdZdge+pCvpO+eSvOqhHLo64y3npiCz4WX+UP5lwjsM7ZHPzo
   zB5coxDPCT0CQmvNECpGf8Dz53RU7KFuADnD/etCL1gKxx5Dn/+g0guRY
   FwyzF22COkcNvJLK6xN+YdyIEOXa1m8HJDBgxI0G3VCq1Gk15LQlmLaD+
   71LkPqtQlAgGk8EouUhrABX9r0l3fFt1gZ+fkSW7pLh+rBmHLNsWLSanO
   g==;
X-CSE-ConnectionGUID: elEkNP7TR7ag2sZb6Y+FMQ==
X-CSE-MsgGUID: xis7SWqKRiG6vsWHypeOgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="52200425"
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; 
   d="scan'208";a="52200425"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 09:23:55 -0700
X-CSE-ConnectionGUID: 1PsE2tlhTUmmCFEHDxXDig==
X-CSE-MsgGUID: Qa+AvuKTTFS17Y7JZ6kYMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; 
   d="scan'208";a="171047163"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 13 Jun 2025 09:23:53 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQ7C3-000CoE-2G;
	Fri, 13 Jun 2025 16:23:51 +0000
Date: Sat, 14 Jun 2025 00:23:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v5 02/11] iio: adc: Add basic support for AD4170
Message-ID: <202506140009.GdV0BtKr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <48598c0753cccf515addbe85acba3f883ff8f036.1749582679.git.marcelo.schmitt@analog.com>
References: <48598c0753cccf515addbe85acba3f883ff8f036.1749582679.git.marcelo.schmitt@analog.com>
TO: Marcelo Schmitt <marcelo.schmitt@analog.com>
TO: linux-iio@vger.kernel.org
TO: devicetree@vger.kernel.org
TO: linux-gpio@vger.kernel.org
TO: linux-kernel@vger.kernel.org
CC: "Ana-Maria Cusco" <ana-maria.cusco@analog.com>
CC: jic23@kernel.org
CC: lars@metafoo.de
CC: Michael.Hennerich@analog.com
CC: dlechner@baylibre.com
CC: nuno.sa@analog.com
CC: andy@kernel.org
CC: robh@kernel.org
CC: krzk+dt@kernel.org
CC: conor+dt@kernel.org
CC: linus.walleij@linaro.org
CC: brgl@bgdev.pl
CC: marcelo.schmitt1@gmail.com

Hi Marcelo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 4c6073fec2fee4827fa0dd8a4ab4e6f7bbc05ee6]

url:    https://github.com/intel-lab-lkp/linux/commits/Marcelo-Schmitt/dt-bindings-iio-adc-Add-AD4170/20250611-101842
base:   4c6073fec2fee4827fa0dd8a4ab4e6f7bbc05ee6
patch link:    https://lore.kernel.org/r/48598c0753cccf515addbe85acba3f883ff8f036.1749582679.git.marcelo.schmitt%40analog.com
patch subject: [PATCH v5 02/11] iio: adc: Add basic support for AD4170
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: powerpc-randconfig-r072-20250613 (https://download.01.org/0day-ci/archive/20250614/202506140009.GdV0BtKr-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202506140009.GdV0BtKr-lkp@intel.com/

smatch warnings:
drivers/iio/adc/ad4170.c:1181 ad4170_parse_adc_channel_type() warn: passing zero to 'dev_err_probe'

vim +/dev_err_probe +1181 drivers/iio/adc/ad4170.c

dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1169  
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1170  static int ad4170_parse_adc_channel_type(struct device *dev,
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1171  					 struct fwnode_handle *child,
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1172  					 struct iio_chan_spec *chan)
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1173  {
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1174  	int ret, ret2;
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1175  	u32 pins[2];
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1176  
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1177  	/* Parse pseudo-differential channel configuration */
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1178  	ret = fwnode_property_read_u32(child, "single-channel", &pins[0]);
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1179  	ret2 = fwnode_property_read_u32(child, "common-mode-channel", &pins[1]);
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1180  	if (!ret && ret2)
dfefd2b2405829 Ana-Maria Cusco 2025-06-10 @1181  		return dev_err_probe(dev, ret,
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1182  			"single-ended channels must define common-mode-channel\n");
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1183  
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1184  	if (!ret && !ret2) {
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1185  		chan->differential = false;
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1186  		chan->channel = pins[0];
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1187  		chan->channel2 = pins[1];
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1188  		return 0;
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1189  	}
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1190  	/* Failed to parse pseudo-diff chan props so try diff chan */
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1191  
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1192  	/* Parse differential channel configuration */
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1193  	ret = fwnode_property_read_u32_array(child, "diff-channels", pins,
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1194  					     ARRAY_SIZE(pins));
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1195  	if (!ret) {
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1196  		chan->differential = true;
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1197  		chan->channel = pins[0];
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1198  		chan->channel2 = pins[1];
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1199  		return 0;
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1200  	}
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1201  	return dev_err_probe(dev, ret,
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1202  		"Channel must define one of diff-channels or single-channel.\n");
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1203  }
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1204  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
