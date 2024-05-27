Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F1E2208E
	for <oe-kbuild@lists.linux.dev>; Mon, 27 May 2024 22:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716849291; cv=none; b=sjOCknpGBqzoh17vKtX2iZ1Bq+Xkdb6fFtuEhq38VPEB5CFbwmPaq5pmSpLIklf0C/pTWtehZ+zYSh4C4RFfcSZDxFiiggqPJdupZIZ33mtza0Bub7cDvvo+LK0eTvrPCB8GCFH6m6SJ1fqD/PtLJ+VGxR0W+ykDcywe1k85wDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716849291; c=relaxed/simple;
	bh=wTBagEfK5dD6H7Sx30LmNnlEwFAhIK+fVySrv5h8Kto=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SEVE67eeKYZadWcFkZCdYekd2RiXrBfEx2QC5jBLh1/PRvJ52NVNY5WN+WuUyoTE1WyO0gojAyUR6VVQs54l/U/Jjs2Khpc70MDLmaTLBgXX/rXPXsUnvWrE1gOqVn9Q/i2gpFBu0Icv1xiLkSrd5iIhLMOmEf/D9rtYGy5hLW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XdMoI4EZ; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XdMoI4EZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716849290; x=1748385290;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wTBagEfK5dD6H7Sx30LmNnlEwFAhIK+fVySrv5h8Kto=;
  b=XdMoI4EZG6HluWrilUDeBmcOD3Uf4pWdPzJKN+lk85hPXmuo077fDAJX
   jq35BNU43oVOT3X9tw45vuVeeWYomIQzmmAWYt14hyOFaWITqDus5ZHGv
   +ZnURqOpJFRkn96iyGMJTTOpDe8HPVlIzIQiBh0HPaH+FIZeM/2Kt0rp5
   jzKoIabFoodXX1VI5l01dDRy/0je+e5frHEd41gmEm8gRl8BwIAaPFeih
   o3UjEcW5B6l7CKsB3P1e/lg3geJw/BWqsYoPMDys2jHHJHWVvYV7hIrr5
   iiobu7lud47apYYHeRqklm9ysmQ7SXWJWCJrUDKcv9DgF2uuRhDt9oQdI
   g==;
X-CSE-ConnectionGUID: PFM3tJB4QkWhgMfnRHzNGA==
X-CSE-MsgGUID: js3QM9tATw2/jyE4fFB54g==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13361443"
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; 
   d="scan'208";a="13361443"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 15:34:49 -0700
X-CSE-ConnectionGUID: UnK7onbbRN+9aUSEa/O0LQ==
X-CSE-MsgGUID: 4ocQk7qzQz2CwS939WpLNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; 
   d="scan'208";a="34782243"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 27 May 2024 15:34:48 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sBivV-000B9X-1j;
	Mon, 27 May 2024 22:34:45 +0000
Date: Tue, 28 May 2024 06:34:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v3 3/3] leds: leds-lp5569: Add support for Texas
 Instruments LP5569
Message-ID: <202405280611.QUICzlRj-lkp@intel.com>
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
In-Reply-To: <20240527094737.13354-3-ansuelsmth@gmail.com>
References: <20240527094737.13354-3-ansuelsmth@gmail.com>
TO: Christian Marangi <ansuelsmth@gmail.com>
TO: Pavel Machek <pavel@ucw.cz>
TO: Lee Jones <lee@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Jacek Anaszewski <jacek.anaszewski@gmail.com>
TO: linux-leds@vger.kernel.org
TO: devicetree@vger.kernel.org
TO: linux-kernel@vger.kernel.org
CC: Christian Marangi <ansuelsmth@gmail.com>

Hi Christian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on lee-leds/for-leds-next]
[also build test WARNING on robh/for-next linus/master v6.10-rc1 next-20240523]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Marangi/dt-bindings-leds-lp55xx-Add-new-ti-lp5569-compatible/20240527-174959
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
patch link:    https://lore.kernel.org/r/20240527094737.13354-3-ansuelsmth%40gmail.com
patch subject: [PATCH v3 3/3] leds: leds-lp5569: Add support for Texas Instruments LP5569
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: sparc-randconfig-r071-20240528 (https://download.01.org/0day-ci/archive/20240528/202405280611.QUICzlRj-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202405280611.QUICzlRj-lkp@intel.com/

New smatch warnings:
drivers/leds/leds-lp5569.c:378 lp5569_update_program_memory() error: buffer overflow 'pattern' 128 <= 223

Old smatch warnings:
drivers/leds/leds-lp5569.c:980 lp5569_multicolor_brightness() error: uninitialized symbol 'ret'.

vim +/pattern +378 drivers/leds/leds-lp5569.c

ed7ae4f43e228c Christian Marangi 2024-05-27  339  
ed7ae4f43e228c Christian Marangi 2024-05-27  340  static int lp5569_update_program_memory(struct lp55xx_chip *chip,
ed7ae4f43e228c Christian Marangi 2024-05-27  341  					const u8 *data, size_t size)
ed7ae4f43e228c Christian Marangi 2024-05-27  342  {
ed7ae4f43e228c Christian Marangi 2024-05-27  343  	enum lp55xx_engine_index idx = chip->engine_idx;
ed7ae4f43e228c Christian Marangi 2024-05-27  344  	u8 pattern[LP5569_PROGRAM_LENGTH] = {0};
ed7ae4f43e228c Christian Marangi 2024-05-27  345  	unsigned int cmd;
ed7ae4f43e228c Christian Marangi 2024-05-27  346  	char c[3];
ed7ae4f43e228c Christian Marangi 2024-05-27  347  	int nrchars;
ed7ae4f43e228c Christian Marangi 2024-05-27  348  	int ret;
ed7ae4f43e228c Christian Marangi 2024-05-27  349  	int offset = 0;
ed7ae4f43e228c Christian Marangi 2024-05-27  350  	int page, i = 0;
ed7ae4f43e228c Christian Marangi 2024-05-27  351  
ed7ae4f43e228c Christian Marangi 2024-05-27  352  	while ((offset < size - 1) && (i < LP5569_PROGRAM_LENGTH)) {
ed7ae4f43e228c Christian Marangi 2024-05-27  353  		/* separate sscanfs because length is working only for %s */
ed7ae4f43e228c Christian Marangi 2024-05-27  354  		ret = sscanf(data + offset, "%2s%n ", c, &nrchars);
ed7ae4f43e228c Christian Marangi 2024-05-27  355  		if (ret != 1)
ed7ae4f43e228c Christian Marangi 2024-05-27  356  			goto err;
ed7ae4f43e228c Christian Marangi 2024-05-27  357  
ed7ae4f43e228c Christian Marangi 2024-05-27  358  		ret = sscanf(c, "%2x", &cmd);
ed7ae4f43e228c Christian Marangi 2024-05-27  359  		if (ret != 1)
ed7ae4f43e228c Christian Marangi 2024-05-27  360  			goto err;
ed7ae4f43e228c Christian Marangi 2024-05-27  361  
ed7ae4f43e228c Christian Marangi 2024-05-27  362  		pattern[i] = (u8)cmd;
ed7ae4f43e228c Christian Marangi 2024-05-27  363  		offset += nrchars;
ed7ae4f43e228c Christian Marangi 2024-05-27  364  		i++;
ed7ae4f43e228c Christian Marangi 2024-05-27  365  	}
ed7ae4f43e228c Christian Marangi 2024-05-27  366  
ed7ae4f43e228c Christian Marangi 2024-05-27  367  	/* Each instruction is 16bit long. Check that length is even */
ed7ae4f43e228c Christian Marangi 2024-05-27  368  	if (i % 2)
ed7ae4f43e228c Christian Marangi 2024-05-27  369  		goto err;
ed7ae4f43e228c Christian Marangi 2024-05-27  370  
ed7ae4f43e228c Christian Marangi 2024-05-27  371  	for (page = 0; page < LP5569_PROGRAM_LENGTH / LP5569_BYTES_PER_PAGE; page++) {
ed7ae4f43e228c Christian Marangi 2024-05-27  372  		/* Write to the next page each 32 bytes */
ed7ae4f43e228c Christian Marangi 2024-05-27  373  		lp55xx_write(chip, LP5569_REG_PROG_PAGE_SEL,
ed7ae4f43e228c Christian Marangi 2024-05-27  374  			     LP5569_PAGE_ENG(idx) + page);
ed7ae4f43e228c Christian Marangi 2024-05-27  375  
ed7ae4f43e228c Christian Marangi 2024-05-27  376  		for (i = 0; i < LP5569_PROGRAM_LENGTH; i++) {
ed7ae4f43e228c Christian Marangi 2024-05-27  377  			ret = lp55xx_write(chip, LP5569_REG_PROG_MEM + i,
ed7ae4f43e228c Christian Marangi 2024-05-27 @378  					   pattern[i + (page * LP5569_BYTES_PER_PAGE)]);
ed7ae4f43e228c Christian Marangi 2024-05-27  379  			if (ret)
ed7ae4f43e228c Christian Marangi 2024-05-27  380  				return -EINVAL;
ed7ae4f43e228c Christian Marangi 2024-05-27  381  		}
ed7ae4f43e228c Christian Marangi 2024-05-27  382  	}
ed7ae4f43e228c Christian Marangi 2024-05-27  383  
ed7ae4f43e228c Christian Marangi 2024-05-27  384  
ed7ae4f43e228c Christian Marangi 2024-05-27  385  	return size;
ed7ae4f43e228c Christian Marangi 2024-05-27  386  
ed7ae4f43e228c Christian Marangi 2024-05-27  387  err:
ed7ae4f43e228c Christian Marangi 2024-05-27  388  	dev_err(&chip->cl->dev, "wrong pattern format\n");
ed7ae4f43e228c Christian Marangi 2024-05-27  389  	return -EINVAL;
ed7ae4f43e228c Christian Marangi 2024-05-27  390  }
ed7ae4f43e228c Christian Marangi 2024-05-27  391  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
