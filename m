Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F0B52071EF
	for <oe-kbuild@lists.linux.dev>; Wed, 16 Oct 2024 10:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729074552; cv=none; b=ffc8E8Q0aIzGqcPGZG+ctE9RaFeudojSDXLgEh+n/WQ3bAvMbRJnXqDhiiiMWD4m+hKPfATtR1kTdYkzpquq4Cw/Bt4wmZfcUdr71/nf5EbR20GKUdl71yp4HHLdQkoeDdH+VhNpdSCklERcZdAT0zkb2siFkgrIWwybPfdu4YY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729074552; c=relaxed/simple;
	bh=yC2YBfnDTB/l3PdTYPtKvQJkrxTZjdC8q7txK5QJ26E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jVGv5UnCDETdJueJ9544AyA9cAsIqeSgKE4w7tDLGBoq3a1F8W0A48LfDS2yrMhYjcXwGRcsFsTthK7tA+S5KnCDsYVPIgjbRTOdU29vL/pwblg+zbCwcckhgh2xhrfm8BfAWizW9fJ+3p8NrZkjwtTHZeA7gfHnFR8Y5K6N/iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fiqA80Sp; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fiqA80Sp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729074549; x=1760610549;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yC2YBfnDTB/l3PdTYPtKvQJkrxTZjdC8q7txK5QJ26E=;
  b=fiqA80SpKT1xNJtCFVZFl+9wuZeGOE6KfnhmHWiCvKI+X3UZu/SlWmxP
   I4dhWHV36h+fKw/zklknhSUmttvnaUYFls2Kg+esP/1ZumZ4jUUfMds2k
   8+jGIFHatgu9j2E0t56hZhfQT8b/++Guamu8AHssRgSGrv6VDv6TsAUbP
   DjOVQA/gys2D3ZHwb3wrEU5cbbadMw2yGLK2sYpV9uD8JyQgJ6tWMQd7v
   8mjFe+WB5GYsDICuQVOS/XA0I1nJWM8wvrqGUu0AliGj63+81RiPazNCS
   a8vOM6jdebWuJSRBM/zWTebr+V5rgvlMq4W7ChwD+L2bczi79sh+fm3TR
   g==;
X-CSE-ConnectionGUID: ZVoPGAZWRVeXGV8l4rfybA==
X-CSE-MsgGUID: ho8gBaeOR6iXTo6CqSMu9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11226"; a="27986470"
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; 
   d="scan'208";a="27986470"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2024 03:29:09 -0700
X-CSE-ConnectionGUID: 1uMp28MGRQuzUUASwaIB2g==
X-CSE-MsgGUID: 0vYapUkwTVaZbUvhzlZ4tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; 
   d="scan'208";a="82962370"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 16 Oct 2024 03:29:07 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t11H6-000Km4-36;
	Wed, 16 Oct 2024 10:29:04 +0000
Date: Wed, 16 Oct 2024 18:28:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/gpu/drm/amd/amdgpu/amdgpu_eeprom.c:145:8-12: opportunity for
 str_read_write(read)
Message-ID: <202410161814.I6p2Nnux-lkp@intel.com>
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
TO: Luben Tuikov <luben.tuikov@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2f87d0916ce0d2925cedbc9e8f5d6291ba2ac7b2
commit: 93ade343bbadd73999324dcc66c933e398e39818 drm/amdgpu: EEPROM respects I2C quirks
date:   3 years, 4 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 3 years, 4 months ago
config: i386-randconfig-054-20241016 (https://download.01.org/0day-ci/archive/20241016/202410161814.I6p2Nnux-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202410161814.I6p2Nnux-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/amdgpu/amdgpu_eeprom.c:145:8-12: opportunity for str_read_write(read)

vim +145 drivers/gpu/drm/amd/amdgpu/amdgpu_eeprom.c

93ade343bbadd7 Luben Tuikov 2021-01-28  112  
93ade343bbadd7 Luben Tuikov 2021-01-28  113  /**
93ade343bbadd7 Luben Tuikov 2021-01-28  114   * amdgpu_eeprom_xfer -- Read/write from/to an I2C EEPROM device
93ade343bbadd7 Luben Tuikov 2021-01-28  115   * @i2c_adap: pointer to the I2C adapter to use
93ade343bbadd7 Luben Tuikov 2021-01-28  116   * @slave_addr: I2C address of the slave device
93ade343bbadd7 Luben Tuikov 2021-01-28  117   * @eeprom_addr: EEPROM address from which to read/write
93ade343bbadd7 Luben Tuikov 2021-01-28  118   * @eeprom_buf: pointer to data buffer to read into/write from
93ade343bbadd7 Luben Tuikov 2021-01-28  119   * @buf_size: the size of @eeprom_buf
93ade343bbadd7 Luben Tuikov 2021-01-28  120   * @read: True if reading from the EEPROM, false if writing
93ade343bbadd7 Luben Tuikov 2021-01-28  121   *
93ade343bbadd7 Luben Tuikov 2021-01-28  122   * Returns the number of bytes read/written; -errno on error.
93ade343bbadd7 Luben Tuikov 2021-01-28  123   */
93ade343bbadd7 Luben Tuikov 2021-01-28  124  int amdgpu_eeprom_xfer(struct i2c_adapter *i2c_adap,
93ade343bbadd7 Luben Tuikov 2021-01-28  125  		       u16 slave_addr, u16 eeprom_addr,
93ade343bbadd7 Luben Tuikov 2021-01-28  126  		       u8 *eeprom_buf, u16 buf_size, bool read)
93ade343bbadd7 Luben Tuikov 2021-01-28  127  {
93ade343bbadd7 Luben Tuikov 2021-01-28  128  	const struct i2c_adapter_quirks *quirks = i2c_adap->quirks;
93ade343bbadd7 Luben Tuikov 2021-01-28  129  	u16 limit;
93ade343bbadd7 Luben Tuikov 2021-01-28  130  
93ade343bbadd7 Luben Tuikov 2021-01-28  131  	if (!quirks)
93ade343bbadd7 Luben Tuikov 2021-01-28  132  		limit = 0;
93ade343bbadd7 Luben Tuikov 2021-01-28  133  	else if (read)
93ade343bbadd7 Luben Tuikov 2021-01-28  134  		limit = quirks->max_read_len;
93ade343bbadd7 Luben Tuikov 2021-01-28  135  	else
93ade343bbadd7 Luben Tuikov 2021-01-28  136  		limit = quirks->max_write_len;
93ade343bbadd7 Luben Tuikov 2021-01-28  137  
93ade343bbadd7 Luben Tuikov 2021-01-28  138  	if (limit == 0) {
93ade343bbadd7 Luben Tuikov 2021-01-28  139  		return __amdgpu_eeprom_xfer(i2c_adap, slave_addr, eeprom_addr,
93ade343bbadd7 Luben Tuikov 2021-01-28  140  					    eeprom_buf, buf_size, read);
93ade343bbadd7 Luben Tuikov 2021-01-28  141  	} else if (limit <= EEPROM_OFFSET_SIZE) {
93ade343bbadd7 Luben Tuikov 2021-01-28  142  		dev_err_ratelimited(&i2c_adap->dev,
93ade343bbadd7 Luben Tuikov 2021-01-28  143  				    "maddr:0x%04X size:0x%02X:quirk max_%s_len must be > %d",
93ade343bbadd7 Luben Tuikov 2021-01-28  144  				    eeprom_addr, buf_size,
93ade343bbadd7 Luben Tuikov 2021-01-28 @145  				    read ? "read" : "write", EEPROM_OFFSET_SIZE);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
