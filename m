Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC6279929
	for <oe-kbuild@lists.linux.dev>; Sat, 17 Feb 2024 13:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708176557; cv=none; b=psKZlR2BfAaeM9s/B54iF04NpF7PDo8YBPxPgpW3oMESVCCKtxn7k3IVtepMYR3bW93QCdr+MbiwhcwKZAqPmQ0kb2g/qfYMblVchlALA3PDCXJD0pfjUryHP8DqAJa6cqHOoX9lBJYK5TlkaULRolqpAhdoQmv1u7BIBL9J2YQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708176557; c=relaxed/simple;
	bh=wlhy8mzx6SO5vqrsLw/k0x4tP1F10ukGfWZT1ju+Xuw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Kayb/CvctoSO8YYjk8KoVuRFR349QjH4jJjtgisbOyWbL17rrxfnh0CkqKBsHYA4kEA2OEoAgtEz43AN+N+ww1UH1pBDzH7UqX1huwFOOGeh4wbQzMQy/1VwgzrLGRT8gFQ6k8opmUi8lK6mHTkjGjsEGUCAO9odSb0rxJebkW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YkiQtKnf; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YkiQtKnf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708176556; x=1739712556;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wlhy8mzx6SO5vqrsLw/k0x4tP1F10ukGfWZT1ju+Xuw=;
  b=YkiQtKnfjH2q6shL6gdCh1eEyiAUfS7GgLP7vca8ZoaxZhLHlVNcbiUI
   pvbBlLNNOqBsKgunsbwKAQ+u6rOzd34Vv/d3Ja/6uiLsznoFQ8PQafO4+
   +KPw/c9lIIf3FqoaS93INlBXYIgrnGtdkYIHV5l0jdMZMBa1Wjsl7Za/w
   FKHW0B01ZwgSO+KfPXr6pUbNZy3IGnjhQ5pGTaBT8A5PBwWmClHegA6R3
   PeWEalWGoKtgQttTU9AqLX7JzAYgvH0HIwO7BaFivk3/XfFScjqjA8SQ+
   JwKWBMKtelafhoCyetBRf2NTsxB09i6yUjlw4wxuC2JBT/TffeUtad0Z/
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10986"; a="19824488"
X-IronPort-AV: E=Sophos;i="6.06,166,1705392000"; 
   d="scan'208";a="19824488"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2024 05:29:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,166,1705392000"; 
   d="scan'208";a="8744429"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 17 Feb 2024 05:29:14 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rbKkh-00028O-0N;
	Sat, 17 Feb 2024 13:29:11 +0000
Date: Sat, 17 Feb 2024 21:27:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 28/33] i2c: fsi: Improve formatting
Message-ID: <202402172147.pnwECcyo-lkp@intel.com>
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
In-Reply-To: <20240215220759.976998-29-eajames@linux.ibm.com>
References: <20240215220759.976998-29-eajames@linux.ibm.com>
TO: Eddie James <eajames@linux.ibm.com>
TO: linux-fsi@lists.ozlabs.org
CC: linux-kernel@vger.kernel.org
CC: linux-i2c@vger.kernel.org
CC: linux-clk@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: andi.shyti@kernel.org
CC: eajames@linux.ibm.com
CC: alistair@popple.id.au
CC: joel@jms.id.au
CC: jk@ozlabs.org
CC: sboyd@kernel.org
CC: mturquette@baylibre.com
CC: robh@kernel.org
CC: krzysztof.kozlowski+dt@linaro.org
CC: conor+dt@kernel.org

Hi Eddie,

kernel test robot noticed the following build warnings:

[auto build test WARNING on andi-shyti/i2c/i2c-host]
[also build test WARNING on robh/for-next clk/clk-next linus/master v6.8-rc4 next-20240216]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Eddie-James/dt-bindings-clock-ast2600-Add-FSI-clock/20240216-061934
base:   git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
patch link:    https://lore.kernel.org/r/20240215220759.976998-29-eajames%40linux.ibm.com
patch subject: [PATCH 28/33] i2c: fsi: Improve formatting
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: nios2-randconfig-r081-20240217 (https://download.01.org/0day-ci/archive/20240217/202402172147.pnwECcyo-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202402172147.pnwECcyo-lkp@intel.com/

smatch warnings:
drivers/i2c/busses/i2c-fsi.c:337 fsi_i2c_get_scl() error: uninitialized symbol 'stat'.
drivers/i2c/busses/i2c-fsi.c:358 fsi_i2c_get_sda() error: uninitialized symbol 'stat'.

vim +/stat +337 drivers/i2c/busses/i2c-fsi.c

504b82773c074e Eddie James 2018-07-17  329  
720d5ce9309d55 Eddie James 2018-07-17  330  static int fsi_i2c_get_scl(struct i2c_adapter *adap)
720d5ce9309d55 Eddie James 2018-07-17  331  {
720d5ce9309d55 Eddie James 2018-07-17  332  	struct fsi_i2c_port *port = adap->algo_data;
d2fec1f8a58643 Eddie James 2024-02-15  333  	u32 stat;
720d5ce9309d55 Eddie James 2018-07-17  334  
d2fec1f8a58643 Eddie James 2024-02-15  335  	fsi_i2c_read_reg(port->master->fsi, I2C_FSI_STAT, &stat);
720d5ce9309d55 Eddie James 2018-07-17  336  
720d5ce9309d55 Eddie James 2018-07-17 @337  	return !!(stat & I2C_STAT_SCL_IN);
720d5ce9309d55 Eddie James 2018-07-17  338  }
720d5ce9309d55 Eddie James 2018-07-17  339  
720d5ce9309d55 Eddie James 2018-07-17  340  static void fsi_i2c_set_scl(struct i2c_adapter *adap, int val)
720d5ce9309d55 Eddie James 2018-07-17  341  {
720d5ce9309d55 Eddie James 2018-07-17  342  	struct fsi_i2c_port *port = adap->algo_data;
d2fec1f8a58643 Eddie James 2024-02-15  343  	u32 dummy = 0;
720d5ce9309d55 Eddie James 2018-07-17  344  
720d5ce9309d55 Eddie James 2018-07-17  345  	if (val)
d2fec1f8a58643 Eddie James 2024-02-15  346  		fsi_i2c_write_reg(port->master->fsi, I2C_FSI_SET_SCL, &dummy);
720d5ce9309d55 Eddie James 2018-07-17  347  	else
d2fec1f8a58643 Eddie James 2024-02-15  348  		fsi_i2c_write_reg(port->master->fsi, I2C_FSI_RESET_SCL, &dummy);
720d5ce9309d55 Eddie James 2018-07-17  349  }
720d5ce9309d55 Eddie James 2018-07-17  350  
720d5ce9309d55 Eddie James 2018-07-17  351  static int fsi_i2c_get_sda(struct i2c_adapter *adap)
720d5ce9309d55 Eddie James 2018-07-17  352  {
720d5ce9309d55 Eddie James 2018-07-17  353  	struct fsi_i2c_port *port = adap->algo_data;
d2fec1f8a58643 Eddie James 2024-02-15  354  	u32 stat;
720d5ce9309d55 Eddie James 2018-07-17  355  
d2fec1f8a58643 Eddie James 2024-02-15  356  	fsi_i2c_read_reg(port->master->fsi, I2C_FSI_STAT, &stat);
720d5ce9309d55 Eddie James 2018-07-17  357  
720d5ce9309d55 Eddie James 2018-07-17 @358  	return !!(stat & I2C_STAT_SDA_IN);
720d5ce9309d55 Eddie James 2018-07-17  359  }
720d5ce9309d55 Eddie James 2018-07-17  360  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
