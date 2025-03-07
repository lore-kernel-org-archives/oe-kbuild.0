Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C286618C03D
	for <oe-kbuild@lists.linux.dev>; Fri,  7 Mar 2025 11:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741346161; cv=none; b=YWOQwtswPOkGgIe2ij6fMhevqjstlhVkLWK4B8qAu1ku+A5GuDWiMt8extenL34ATCn3mzfkke/ZJ3lv5MPjZgEv8hQYx0SRpe6CAvVVxhYZI5RVG3G4goSLq/RNkcElQ3/kknBvpJBkIDqBdHCVZ5VLy0qtEwyGTxRR5ZXwDTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741346161; c=relaxed/simple;
	bh=qz+HZUsjakXLSaK9YtyDv/UoIlUkY9pUGRbc6ORcRNM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CfDwmyQdoImuDGhvLBOjoJYI9xS4FeO/5b9X90pgehJIS822/fQDVvCuoRSzUVOpQfdLF5Qk95ijrQVQP16cptfyT9gciMMxSNr4eVFa0CRZcA2UeqlR1qdnenj3ZfuKE9k7+OpVYKB/AQMcAeMb98JX3pTjehzkJI6ihTRfmvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d9GIAG5X; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d9GIAG5X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741346160; x=1772882160;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qz+HZUsjakXLSaK9YtyDv/UoIlUkY9pUGRbc6ORcRNM=;
  b=d9GIAG5X7d3Gi55w1eSLWF9ogbqkL+CuzECQZeUEZWiIQe++OxDsdjbO
   5H9ytjU3qlT8UpaBL7mELt0On6NPNG/JL8RCC/ytiRnEPRBSDi+5oxsnK
   zzGcIDh0QZ8YqF0KLW07JpyMrKU9n5wavWKOYheF4Aee6VG2akKI2iwg8
   5e+Ukl97QtgXC+0EluB7WJfV8Kn5U8t7RzxRAY3lVHbYYOkaz4bRu0408
   vpZUGxq4/hyfjNwq3AwFKOSd8jJzbQs9NcnjeplWCTac+7hKXU9JMl92A
   iFHIPWCTGlOOGEsqpzpgxxQDYySF0XcFQbUxP3wqFrIvzEFtwU0lLpHvN
   g==;
X-CSE-ConnectionGUID: a1J4xyUyQoKIoyu7zS4Lfw==
X-CSE-MsgGUID: fAWtl7VVTpiZJzHo+dLb7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="59794532"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; 
   d="scan'208";a="59794532"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 03:15:59 -0800
X-CSE-ConnectionGUID: DeXJ59gaToSjumIYaL+SlQ==
X-CSE-MsgGUID: 5tFaR5DfRhiKVzInjE5TZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="120220068"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 07 Mar 2025 03:15:58 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqVgJ-0000MZ-2W;
	Fri, 07 Mar 2025 11:15:55 +0000
Date: Fri, 7 Mar 2025 19:15:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v1] serial: qcom-geni: Remove alias dependency from qcom
 serial driver
Message-ID: <202503071840.r1EddvYl-lkp@intel.com>
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
In-Reply-To: <20250304071423.4033565-1-quic_vdadhani@quicinc.com>
References: <20250304071423.4033565-1-quic_vdadhani@quicinc.com>
TO: Viken Dadhaniya <quic_vdadhani@quicinc.com>
TO: gregkh@linuxfoundation.org
TO: jirislaby@kernel.org
TO: johan+linaro@kernel.org
TO: dianders@chromium.org
TO: konradybcio@kernel.org
TO: linux-arm-msm@vger.kernel.org
TO: linux-kernel@vger.kernel.org
TO: linux-serial@vger.kernel.org
CC: quic_msavaliy@quicinc.com
CC: quic_anupkulk@quicinc.com
CC: Viken Dadhaniya <quic_vdadhani@quicinc.com>

Hi Viken,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tty/tty-testing]
[also build test WARNING on tty/tty-next tty/tty-linus usb/usb-testing usb/usb-next usb/usb-linus linus/master v6.14-rc5 next-20250306]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Viken-Dadhaniya/serial-qcom-geni-Remove-alias-dependency-from-qcom-serial-driver/20250304-152222
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-testing
patch link:    https://lore.kernel.org/r/20250304071423.4033565-1-quic_vdadhani%40quicinc.com
patch subject: [PATCH v1] serial: qcom-geni: Remove alias dependency from qcom serial driver
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: sh-randconfig-r073-20250307 (https://download.01.org/0day-ci/archive/20250307/202503071840.r1EddvYl-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503071840.r1EddvYl-lkp@intel.com/

New smatch warnings:
drivers/tty/serial/qcom_geni_serial.c:267 get_port_from_line() error: uninitialized symbol 'port'.

Old smatch warnings:
drivers/tty/serial/qcom_geni_serial.c:270 get_port_from_line() error: uninitialized symbol 'port'.

vim +/port +267 drivers/tty/serial/qcom_geni_serial.c

c4f528795d1add Karthikeyan Ramasubramanian 2018-03-14  252  
8a8a66a1a18a1d Girish Mahadevan            2018-07-13  253  static struct qcom_geni_serial_port *get_port_from_line(int line, bool console)
c4f528795d1add Karthikeyan Ramasubramanian 2018-03-14  254  {
8a8a66a1a18a1d Girish Mahadevan            2018-07-13  255  	struct qcom_geni_serial_port *port;
8a8a66a1a18a1d Girish Mahadevan            2018-07-13  256  	int nr_ports = console ? GENI_UART_CONS_PORTS : GENI_UART_PORTS;
8a8a66a1a18a1d Girish Mahadevan            2018-07-13  257  
27911ad181d5ce Viken Dadhaniya             2025-03-04  258  	if (console) {
8a8a66a1a18a1d Girish Mahadevan            2018-07-13  259  		if (line < 0 || line >= nr_ports)
c4f528795d1add Karthikeyan Ramasubramanian 2018-03-14  260  			return ERR_PTR(-ENXIO);
8a8a66a1a18a1d Girish Mahadevan            2018-07-13  261  
27911ad181d5ce Viken Dadhaniya             2025-03-04  262  		port = &qcom_geni_console_port;
27911ad181d5ce Viken Dadhaniya             2025-03-04  263  	} else {
27911ad181d5ce Viken Dadhaniya             2025-03-04  264  		int max_alias_num = of_alias_get_highest_id("serial");
27911ad181d5ce Viken Dadhaniya             2025-03-04  265  
27911ad181d5ce Viken Dadhaniya             2025-03-04  266  		if (line < 0 || line >= nr_ports)
27911ad181d5ce Viken Dadhaniya             2025-03-04 @267  			line = idr_alloc(&port_idr, (void *)port, max_alias_num + 1, nr_ports,
27911ad181d5ce Viken Dadhaniya             2025-03-04  268  					 GFP_KERNEL);
27911ad181d5ce Viken Dadhaniya             2025-03-04  269  		else
27911ad181d5ce Viken Dadhaniya             2025-03-04  270  			line = idr_alloc(&port_idr, (void *)port, line, nr_ports, GFP_KERNEL);
27911ad181d5ce Viken Dadhaniya             2025-03-04  271  
27911ad181d5ce Viken Dadhaniya             2025-03-04  272  		if (line < 0)
27911ad181d5ce Viken Dadhaniya             2025-03-04  273  			return ERR_PTR(-ENXIO);
27911ad181d5ce Viken Dadhaniya             2025-03-04  274  
27911ad181d5ce Viken Dadhaniya             2025-03-04  275  		port = &qcom_geni_uart_ports[line];
27911ad181d5ce Viken Dadhaniya             2025-03-04  276  	}
8a8a66a1a18a1d Girish Mahadevan            2018-07-13  277  	return port;
c4f528795d1add Karthikeyan Ramasubramanian 2018-03-14  278  }
c4f528795d1add Karthikeyan Ramasubramanian 2018-03-14  279  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
