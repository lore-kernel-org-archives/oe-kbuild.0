Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741A1A38
	for <oe-kbuild@lists.linux.dev>; Wed,  6 Dec 2023 05:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="muMusESd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701839160; x=1733375160;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S7eqAbZIJAmOqoqbGP+vXgp0Eh/h13jXQoM9MhF9wag=;
  b=muMusESdDMAW1rS4BhlORWbZ3+P7loZSbeWoPuQzP0UY0xfRngZe91tf
   9MDdzphtuA/15g/xUNi8LHROOOLfCGflue4hAOzoEdYBv9PihgltI4aJJ
   g45S7lXGLm88VwVpCLubeKb8u4G6Wx4DeshxgYpeinN5jCqx+hP2SJ+O0
   aW1QVFZwVoxG2fnXl8GOqquQ/VbyYylD3vwB6jNjQM0/jmwvGk6yMv6K6
   IbQyk7j2GUxrVDogTxbuLJT5P7twXXQY5URfE+jvylsBNrHiyBq176Jhp
   lzC6J1/8B9dw12hiu1+3O2xx+VizfiIX1WCIB1ZsU4/H5G/loXQa8pCbr
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="846929"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="846929"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 21:05:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="764582260"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="764582260"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 05 Dec 2023 21:05:56 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAk6c-000AJ4-19;
	Wed, 06 Dec 2023 05:05:54 +0000
Date: Wed, 6 Dec 2023 13:04:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: sound/soc/codecs/aw88399.c:876:16-17: WARNING opportunity for min()
Message-ID: <202312061330.Mo5yLh1z-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Weidong Wang <wangweidong.a@awinic.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bee0e7762ad2c6025b9f5245c040fcc36ef2bde8
commit: 8ade6cc7e26175529474690fdbc1965901ec2024 ASoC: codecs: Add aw88399 amplifier driver
date:   6 weeks ago
:::::: branch date: 31 hours ago
:::::: commit date: 6 weeks ago
config: x86_64-randconfig-101-20231201 (https://download.01.org/0day-ci/archive/20231206/202312061330.Mo5yLh1z-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231206/202312061330.Mo5yLh1z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202312061330.Mo5yLh1z-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> sound/soc/codecs/aw88399.c:876:16-17: WARNING opportunity for min()

vim +876 sound/soc/codecs/aw88399.c

8ade6cc7e26175 Weidong Wang 2023-10-25  863  
8ade6cc7e26175 Weidong Wang 2023-10-25  864  static int aw_dev_dsp_update_container(struct aw_device *aw_dev,
8ade6cc7e26175 Weidong Wang 2023-10-25  865  			unsigned char *data, unsigned int len, unsigned short base)
8ade6cc7e26175 Weidong Wang 2023-10-25  866  {
8ade6cc7e26175 Weidong Wang 2023-10-25  867  	u32 tmp_len;
8ade6cc7e26175 Weidong Wang 2023-10-25  868  	int i, ret;
8ade6cc7e26175 Weidong Wang 2023-10-25  869  
8ade6cc7e26175 Weidong Wang 2023-10-25  870  	mutex_lock(&aw_dev->dsp_lock);
8ade6cc7e26175 Weidong Wang 2023-10-25  871  	ret = regmap_write(aw_dev->regmap, AW88399_DSPMADD_REG, base);
8ade6cc7e26175 Weidong Wang 2023-10-25  872  	if (ret)
8ade6cc7e26175 Weidong Wang 2023-10-25  873  		goto error_operation;
8ade6cc7e26175 Weidong Wang 2023-10-25  874  
8ade6cc7e26175 Weidong Wang 2023-10-25  875  	for (i = 0; i < len; i += AW88399_MAX_RAM_WRITE_BYTE_SIZE) {
8ade6cc7e26175 Weidong Wang 2023-10-25 @876  		if ((len - i) < AW88399_MAX_RAM_WRITE_BYTE_SIZE)
8ade6cc7e26175 Weidong Wang 2023-10-25  877  			tmp_len = len - i;
8ade6cc7e26175 Weidong Wang 2023-10-25  878  		else
8ade6cc7e26175 Weidong Wang 2023-10-25  879  			tmp_len = AW88399_MAX_RAM_WRITE_BYTE_SIZE;
8ade6cc7e26175 Weidong Wang 2023-10-25  880  
8ade6cc7e26175 Weidong Wang 2023-10-25  881  		ret = regmap_raw_write(aw_dev->regmap, AW88399_DSPMDAT_REG,
8ade6cc7e26175 Weidong Wang 2023-10-25  882  					&data[i], tmp_len);
8ade6cc7e26175 Weidong Wang 2023-10-25  883  		if (ret)
8ade6cc7e26175 Weidong Wang 2023-10-25  884  			goto error_operation;
8ade6cc7e26175 Weidong Wang 2023-10-25  885  	}
8ade6cc7e26175 Weidong Wang 2023-10-25  886  	mutex_unlock(&aw_dev->dsp_lock);
8ade6cc7e26175 Weidong Wang 2023-10-25  887  
8ade6cc7e26175 Weidong Wang 2023-10-25  888  	return 0;
8ade6cc7e26175 Weidong Wang 2023-10-25  889  
8ade6cc7e26175 Weidong Wang 2023-10-25  890  error_operation:
8ade6cc7e26175 Weidong Wang 2023-10-25  891  	mutex_unlock(&aw_dev->dsp_lock);
8ade6cc7e26175 Weidong Wang 2023-10-25  892  	return ret;
8ade6cc7e26175 Weidong Wang 2023-10-25  893  }
8ade6cc7e26175 Weidong Wang 2023-10-25  894  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
