Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5128123E32A
	for <oe-kbuild@lists.linux.dev>; Fri, 28 Feb 2025 11:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740743777; cv=none; b=QOLBqg00PbPB2E5qfHpEL7aZyKJJXw/llSXtUV0Mdzwp8hhhNQyhCUVVRlDEdAI7ejAFX5BQ30bb6eOiacSTb80pg+C+115BG7qDAScsDJwBoRXhINi+mUAcPQg7YncETJ8FVArckzHr7JbjNpA1fV8s7fh85e85/f1y0m4UNRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740743777; c=relaxed/simple;
	bh=510QIf+rjN0pfzdN8/211pdsJV+w86p9MfJ7hzTi96Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TKGlvmIp2bW2atoXaK9dp4AUh2a/VE9DvvytR60LbDmsFKkAI0EQV7Cy3W9cgV1WFjgL3bUmUybjbxfKnAz11St5qEimlpSPAC185qaiaG5sRgcXsHdLrudIzqUb/AcP4l4bfLek6nqqIj5AmjcbLs3RYFuem68sVN/ur84QL4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YxjcdwF6; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YxjcdwF6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740743775; x=1772279775;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=510QIf+rjN0pfzdN8/211pdsJV+w86p9MfJ7hzTi96Y=;
  b=YxjcdwF6Hv2YNPqSDYSm8H2rVlH49UdTa0euSXK5fQE3vUOdFbvhK6QS
   TX4F9CVEoq4ZfJoBXpJHHpqG5h1y0QUZwz/1pxCjHiehNfTeImBgePfUs
   m/r97dRF3dtLyRFhmqMOd75bLWuLEPs/+1nHRJPIIqeT/ZGsLz06D1tar
   khmXkmEu/Tua35s2m8oKkXVHUx2CVNPl0OTLo7NIxHdnwoOrNRjNUoRPU
   EmikA9XsW8yhCWP8uyNUW76IMSi3p9jMsVjTb7SS908y9URUjzjTYibT9
   RhucR+0epYa7m7aYjTLG+/409jM7/NL7VJaiOmttT+WWnH4wI+ireYVIm
   w==;
X-CSE-ConnectionGUID: 3rBXqjtsTJyDxgo2CQzMdQ==
X-CSE-MsgGUID: JlXjpIv3SlqX/mWAywIq0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="59205903"
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; 
   d="scan'208";a="59205903"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2025 03:56:14 -0800
X-CSE-ConnectionGUID: 82e7sPOyR/KkDCT/SU1YrQ==
X-CSE-MsgGUID: IhVW+4zVS6aA78cPFhMMFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; 
   d="scan'208";a="117983389"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 28 Feb 2025 03:56:13 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnyyR-000EpK-1i;
	Fri, 28 Feb 2025 11:56:11 +0000
Date: Fri, 28 Feb 2025 19:55:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] i2c-algo-bit: Added the bus lock during a i2c transaction
Message-ID: <202502281946.tIwDrE9k-lkp@intel.com>
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
In-Reply-To: <20250225113314.12353-1-anindya.sg@samsung.com>
References: <20250225113314.12353-1-anindya.sg@samsung.com>
TO: Anindya Sundar Gayen <anindya.sg@samsung.com>
TO: andi.shyti@kernel.org
TO: linux-i2c@vger.kernel.org
TO: linux-kernel@vger.kernel.org
CC: aswani.reddy@samsung.com
CC: pankaj.dubey@samsung.com

Hi Anindya,

kernel test robot noticed the following build warnings:

[auto build test WARNING on andi-shyti/i2c/i2c-host]
[also build test WARNING on linus/master v6.14-rc4 next-20250228]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Anindya-Sundar-Gayen/i2c-algo-bit-Added-the-bus-lock-during-a-i2c-transaction/20250225-201732
base:   https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
patch link:    https://lore.kernel.org/r/20250225113314.12353-1-anindya.sg%40samsung.com
patch subject: [PATCH] i2c-algo-bit: Added the bus lock during a i2c transaction
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: powerpc-randconfig-r071-20250228 (https://download.01.org/0day-ci/archive/20250228/202502281946.tIwDrE9k-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 204dcafec0ecf0db81d420d2de57b02ada6b09ec)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202502281946.tIwDrE9k-lkp@intel.com/

smatch warnings:
drivers/i2c/algos/i2c-algo-bit.c:385 sendbytes() warn: inconsistent returns 'global &i2c_bus_lock'.

vim +385 drivers/i2c/algos/i2c-algo-bit.c

^1da177e4c3f41 Linus Torvalds       2005-04-16  343  
^1da177e4c3f41 Linus Torvalds       2005-04-16  344  static int sendbytes(struct i2c_adapter *i2c_adap, struct i2c_msg *msg)
^1da177e4c3f41 Linus Torvalds       2005-04-16  345  {
494dbb64dc5b36 Jean Delvare         2007-05-01  346  	const unsigned char *temp = msg->buf;
^1da177e4c3f41 Linus Torvalds       2005-04-16  347  	int count = msg->len;
^1da177e4c3f41 Linus Torvalds       2005-04-16  348  	unsigned short nak_ok = msg->flags & I2C_M_IGNORE_NAK;
^1da177e4c3f41 Linus Torvalds       2005-04-16  349  	int retval;
^1da177e4c3f41 Linus Torvalds       2005-04-16  350  	int wrcount = 0;
^1da177e4c3f41 Linus Torvalds       2005-04-16  351  
8eb6c9a270e167 Anindya Sundar Gayen 2025-02-25  352  	/* Aquire the lock before accessing the I2C bus */
8eb6c9a270e167 Anindya Sundar Gayen 2025-02-25  353  	mutex_lock(&i2c_bus_lock);
^1da177e4c3f41 Linus Torvalds       2005-04-16  354  	while (count > 0) {
494dbb64dc5b36 Jean Delvare         2007-05-01  355  		retval = i2c_outb(i2c_adap, *temp);
cf978ab2846d86 David Brownell       2008-01-27  356  
cf978ab2846d86 David Brownell       2008-01-27  357  		/* OK/ACK; or ignored NAK */
cf978ab2846d86 David Brownell       2008-01-27  358  		if ((retval > 0) || (nak_ok && (retval == 0))) {
^1da177e4c3f41 Linus Torvalds       2005-04-16  359  			count--;
^1da177e4c3f41 Linus Torvalds       2005-04-16  360  			temp++;
^1da177e4c3f41 Linus Torvalds       2005-04-16  361  			wrcount++;
bf3e2d1d9b8605 David Brownell       2008-01-27  362  
bf3e2d1d9b8605 David Brownell       2008-01-27  363  		/* A slave NAKing the master means the slave didn't like
bf3e2d1d9b8605 David Brownell       2008-01-27  364  		 * something about the data it saw.  For example, maybe
bf3e2d1d9b8605 David Brownell       2008-01-27  365  		 * the SMBus PEC was wrong.
bf3e2d1d9b8605 David Brownell       2008-01-27  366  		 */
bf3e2d1d9b8605 David Brownell       2008-01-27  367  		} else if (retval == 0) {
bf3e2d1d9b8605 David Brownell       2008-01-27  368  			dev_err(&i2c_adap->dev, "sendbytes: NAK bailout.\n");
bf3e2d1d9b8605 David Brownell       2008-01-27  369  			return -EIO;
bf3e2d1d9b8605 David Brownell       2008-01-27  370  
bf3e2d1d9b8605 David Brownell       2008-01-27  371  		/* Timeout; or (someday) lost arbitration
bf3e2d1d9b8605 David Brownell       2008-01-27  372  		 *
bf3e2d1d9b8605 David Brownell       2008-01-27  373  		 * FIXME Lost ARB implies retrying the transaction from
bf3e2d1d9b8605 David Brownell       2008-01-27  374  		 * the first message, after the "winning" master issues
bf3e2d1d9b8605 David Brownell       2008-01-27  375  		 * its STOP.  As a rule, upper layer code has no reason
bf3e2d1d9b8605 David Brownell       2008-01-27  376  		 * to know or care about this ... it is *NOT* an error.
bf3e2d1d9b8605 David Brownell       2008-01-27  377  		 */
bf3e2d1d9b8605 David Brownell       2008-01-27  378  		} else {
bf3e2d1d9b8605 David Brownell       2008-01-27  379  			dev_err(&i2c_adap->dev, "sendbytes: error %d\n",
bf3e2d1d9b8605 David Brownell       2008-01-27  380  					retval);
bf3e2d1d9b8605 David Brownell       2008-01-27  381  			return retval;
^1da177e4c3f41 Linus Torvalds       2005-04-16  382  		}
^1da177e4c3f41 Linus Torvalds       2005-04-16  383  	}
8eb6c9a270e167 Anindya Sundar Gayen 2025-02-25  384  	mutex_unlock(&i2c_bus_lock);
^1da177e4c3f41 Linus Torvalds       2005-04-16 @385  	return wrcount;
^1da177e4c3f41 Linus Torvalds       2005-04-16  386  }
^1da177e4c3f41 Linus Torvalds       2005-04-16  387  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
