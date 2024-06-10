Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E77942A93
	for <oe-kbuild@lists.linux.dev>; Mon, 10 Jun 2024 09:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718010860; cv=none; b=VqeaQGrJ8vPHHE1nPsBJvRB3TBS3nsWFNOvne/8AvhqO/CWOQe3wZ8FW/2e11wwjy2ukFOT+TRO85WqmFwYnhlivsf25SL3qbBV0mO5lwXZIfuizR/IJo2W0EDGfIdVp4hmy9erLktms1HjDioJ0iMRwMTfqQyg3lVZ0tAYHyek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718010860; c=relaxed/simple;
	bh=1fWnl48ZYkWAie2+kLERO7RwKskBL5rgSOaCqfSYETU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HNwU6bmCl64bAiFY4YxVNwq9u0J/71JoYv0eMN+d++YMSUvLUxgCiQTyn+ima2GhEoxqDcV6rbXHMpLp4Y2C0bPOBZgBpWYZ9nmKJaygWUhs50SFnHyIvY3T6Pt28WjgbNM7kb76gKf59L/2yjLbKJqBLVWcrfF7k+Nyha4noyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EM67l0ST; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EM67l0ST"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718010858; x=1749546858;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1fWnl48ZYkWAie2+kLERO7RwKskBL5rgSOaCqfSYETU=;
  b=EM67l0STakm3SPEpuFF/kEaacOGWRbbtUv7yvpKyu2aKLywwfeSFkxNq
   0L3cC4tgTH2RMN5TV57DBn/mn5d7WqW3m3ovhLEaiXP9Mw/ZPn3WCASIy
   OOXNi9LrkKyK2VahpG4bTX2sKRuzCVF2oNPYpm63N7NYukicXf2TqSOk3
   kF5dA9J4YA5oqr8UjVQmDp09LqIYIjCbr5mPplm+Bxi0dwKOHD2Z+ZRQV
   zA26hMZ4+72zIm/SdT+Qp4mMRiYpHmOFEib8fVpTP1o7Xrv9ULsfb7pA5
   72Z3OACIZE0GgGnYk7t5NCcqzwVtXS32lzxj98oYQk1ycDXrsbf7k4q6+
   Q==;
X-CSE-ConnectionGUID: /ZoXB9dkQIuwqEC9LSb7cQ==
X-CSE-MsgGUID: kvm18ZgnSgC27I+nd2Xmkw==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="18485932"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="18485932"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 02:14:17 -0700
X-CSE-ConnectionGUID: uA4KxOzzR1CvUaAVX1PYnw==
X-CSE-MsgGUID: Qq3UXPQUR/SUW/tJlywSmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="76455554"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 10 Jun 2024 02:14:16 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sGb6T-00020P-2u;
	Mon, 10 Jun 2024 09:14:13 +0000
Date: Mon, 10 Jun 2024 17:14:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v3] HID: hid-goodix: Add Goodix HID-over-SPI driver
Message-ID: <202406101633.1RJnij1Y-lkp@intel.com>
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
In-Reply-To: <20240607133709.3518-1-charles.goodix@gmail.com>
References: <20240607133709.3518-1-charles.goodix@gmail.com>
TO: Charles Wang <charles.goodix@gmail.com>
TO: dmitry.torokhov@gmail.com
TO: jikos@kernel.org
TO: bentiss@kernel.org
CC: hbarnor@chromium.org
CC: dianders@chromium.org
CC: linux-input@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Charles Wang <charles.goodix@gmail.com>

Hi Charles,

kernel test robot noticed the following build warnings:

[auto build test WARNING on hid/for-next]
[also build test WARNING on linus/master v6.10-rc3 next-20240607]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Charles-Wang/HID-hid-goodix-Add-Goodix-HID-over-SPI-driver/20240607-214042
base:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-next
patch link:    https://lore.kernel.org/r/20240607133709.3518-1-charles.goodix%40gmail.com
patch subject: [PATCH v3] HID: hid-goodix: Add Goodix HID-over-SPI driver
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: sparc64-randconfig-r071-20240609 (https://download.01.org/0day-ci/archive/20240610/202406101633.1RJnij1Y-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202406101633.1RJnij1Y-lkp@intel.com/

smatch warnings:
drivers/hid/hid-goodix-spi.c:217 goodix_hid_parse() error: uninitialized symbol 'rdesc'.

vim +/rdesc +217 drivers/hid/hid-goodix-spi.c

bb11c3a1740813 Charles Wang 2024-06-07  205  
bb11c3a1740813 Charles Wang 2024-06-07  206  /**
bb11c3a1740813 Charles Wang 2024-06-07  207   * goodix_hid_parse() - hid-core .parse() callback
bb11c3a1740813 Charles Wang 2024-06-07  208   * @hid: hid device instance
bb11c3a1740813 Charles Wang 2024-06-07  209   *
bb11c3a1740813 Charles Wang 2024-06-07  210   * This function gets called during call to hid_add_device
bb11c3a1740813 Charles Wang 2024-06-07  211   *
bb11c3a1740813 Charles Wang 2024-06-07  212   * Return: 0 on success and non zero on error
bb11c3a1740813 Charles Wang 2024-06-07  213   */
bb11c3a1740813 Charles Wang 2024-06-07  214  static int goodix_hid_parse(struct hid_device *hid)
bb11c3a1740813 Charles Wang 2024-06-07  215  {
bb11c3a1740813 Charles Wang 2024-06-07  216  	struct goodix_ts_data *ts = hid->driver_data;
bb11c3a1740813 Charles Wang 2024-06-07 @217  	u8 *rdesc __free(kfree);
bb11c3a1740813 Charles Wang 2024-06-07  218  	u16 rsize;
bb11c3a1740813 Charles Wang 2024-06-07  219  	int error;
bb11c3a1740813 Charles Wang 2024-06-07  220  
bb11c3a1740813 Charles Wang 2024-06-07  221  	rsize = le16_to_cpu(ts->hid_desc.report_desc_lenght);
bb11c3a1740813 Charles Wang 2024-06-07  222  	if (!rsize || rsize > HID_MAX_DESCRIPTOR_SIZE) {
bb11c3a1740813 Charles Wang 2024-06-07  223  		dev_err(ts->dev, "invalid report desc size %d", rsize);
bb11c3a1740813 Charles Wang 2024-06-07  224  		return -EINVAL;
bb11c3a1740813 Charles Wang 2024-06-07  225  	}
bb11c3a1740813 Charles Wang 2024-06-07  226  
bb11c3a1740813 Charles Wang 2024-06-07  227  	rdesc = kzalloc(rsize, GFP_KERNEL);
bb11c3a1740813 Charles Wang 2024-06-07  228  	if (!rdesc)
bb11c3a1740813 Charles Wang 2024-06-07  229  		return -ENOMEM;
bb11c3a1740813 Charles Wang 2024-06-07  230  
bb11c3a1740813 Charles Wang 2024-06-07  231  	error = goodix_spi_read(ts, GOODIX_HID_REPORT_DESC_ADDR, rdesc, rsize);
bb11c3a1740813 Charles Wang 2024-06-07  232  	if (error) {
bb11c3a1740813 Charles Wang 2024-06-07  233  		dev_err(ts->dev, "failed get report desc, %d", error);
bb11c3a1740813 Charles Wang 2024-06-07  234  		return error;
bb11c3a1740813 Charles Wang 2024-06-07  235  	}
bb11c3a1740813 Charles Wang 2024-06-07  236  
bb11c3a1740813 Charles Wang 2024-06-07  237  	error = hid_parse_report(hid, rdesc, rsize);
bb11c3a1740813 Charles Wang 2024-06-07  238  	if (error)
bb11c3a1740813 Charles Wang 2024-06-07  239  		dev_err(ts->dev, "failed parse report, %d", error);
bb11c3a1740813 Charles Wang 2024-06-07  240  
bb11c3a1740813 Charles Wang 2024-06-07  241  	return error;
bb11c3a1740813 Charles Wang 2024-06-07  242  }
bb11c3a1740813 Charles Wang 2024-06-07  243  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
