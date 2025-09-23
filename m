Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE5926CE06
	for <oe-kbuild@lists.linux.dev>; Tue, 23 Sep 2025 12:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758631248; cv=none; b=dO+Oxsk62cVJ/Vm38OfmU1ijH3IyIOYyqehABvBeG+6SAM7foaRMBTnHUjVY78JmqWMenaZXJAxuuLMJkbs1L+zVhfJPbbwt1Wca37vRn2RC1iq9GuaqeC6cB9jlLYE0mia32FzH5zI5J1WNk/ZFZylrTzhpsfq5Jn2NKhk3eKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758631248; c=relaxed/simple;
	bh=2vhD8IdU4AIyojsypIfXUSj4wzB+gj0rNTWa7AFZ3O4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GB7G48oGydJAiRm3AREahAbRWhCBSBUvvLlvkT11++wQwPqqpXogwTcfghyNnOE1ySGQejfZObjWrgLvgH7miwB6vP4BAY1oub3xoJnCJ9ytyPHTk2tm6McO0643PAhxcB4QXd21FMqWFZxlUQZNHTZlDg/4hh8L5bHXmczqDAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mR9AIAeG; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mR9AIAeG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758631247; x=1790167247;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2vhD8IdU4AIyojsypIfXUSj4wzB+gj0rNTWa7AFZ3O4=;
  b=mR9AIAeGssb1J/b6Y7HzEkSRCQfdWCAnpQDS8j36eXv0G4MlUc/3pdHX
   oXRHx3FWFdHq2ZmngmQLT8RLfihr6p8i/5BQdV7UFI2cKZG3zI/ofgJeH
   T0tAxxnDl2RgX+2QdmkX+YyD4cDwXGXcaBrtGRzVk6UUWPii9E1uRJvrP
   TeZlae2tOykTkBDdSMifS18jrB85vNhbZBAyVDrXcdkGPrd4XnIog7dxd
   FV+VloDGX1fuCVrqEjS/BxKGA46yyt96Ukp5IsgMofebiiWLrJtXcGTOH
   xupAfhpAjgiuypBAoIT6SZ4Vx8+vJsmyglRtpEWPGps8RwWINyGo5q3WH
   w==;
X-CSE-ConnectionGUID: sMoz3Pf0RTejU/e8dswtTQ==
X-CSE-MsgGUID: Jik97LeuRqK3wRgT/9KdFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="86343268"
X-IronPort-AV: E=Sophos;i="6.18,288,1751266800"; 
   d="scan'208";a="86343268"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 05:40:46 -0700
X-CSE-ConnectionGUID: 32McC65yQg++JfZNPHRgcw==
X-CSE-MsgGUID: Dak8T7w3QuqCdIIwgUjC/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,288,1751266800"; 
   d="scan'208";a="175881816"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 23 Sep 2025 05:40:45 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v12K2-00036t-16;
	Tue, 23 Sep 2025 12:40:42 +0000
Date: Tue, 23 Sep 2025 20:40:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android11-5.4 1/1]
 drivers/staging/comedi/comedi_fops.c:1675 do_insn_ioctl() warn: potential
 spectre issue 'data' [w] (local cap)
Message-ID: <202509232221.ujVcS6Oa-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android11-5.4
head:   c92395c2d69365e987de03603133963279b28a32
commit: 6f38c6380c3b38a05032b8881e41137385a6ce02 [1/1] comedi: Fix initialization of data for instructions that write to subdevice
:::::: branch date: 16 hours ago
:::::: commit date: 4 weeks ago
config: i386-randconfig-141-20250923 (https://download.01.org/0day-ci/archive/20250923/202509232221.ujVcS6Oa-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202509232221.ujVcS6Oa-lkp@intel.com/

New smatch warnings:
drivers/staging/comedi/comedi_fops.c:1675 do_insn_ioctl() warn: potential spectre issue 'data' [w] (local cap)

Old smatch warnings:
drivers/staging/comedi/comedi_fops.c:897 do_bufconfig_ioctl() warn: potential spectre issue 'dev->subdevices' [r] (local cap)
drivers/staging/comedi/comedi_fops.c:1078 do_chaninfo_ioctl() warn: potential spectre issue 'dev->subdevices' [r] (local cap)
drivers/staging/comedi/comedi_fops.c:1139 do_bufinfo_ioctl() warn: potential spectre issue 'dev->subdevices' [r] (local cap)
drivers/staging/comedi/comedi_fops.c:1561 do_insnlist_ioctl() warn: potential user controlled sizeof overflow '32 * insnlist.n_insns' '32 * 0-u32max'
drivers/staging/comedi/comedi_fops.c:1715 __comedi_get_user_cmd() warn: potential spectre issue 'dev->subdevices' [r] (local cap)
drivers/staging/comedi/comedi_fops.c:2206 comedi_unlocked_ioctl() warn: missing error code? 'rc'

vim +/data +1675 drivers/staging/comedi/comedi_fops.c

5b6cbd87d3b932 H Hartley Sweeten  2013-01-21  1626  
ed9eccbe8970f6 David Schleef      2008-11-04  1627  /*
18e01b24a7b605 Ian Abbott         2015-01-28  1628   * COMEDI_INSN ioctl
18e01b24a7b605 Ian Abbott         2015-01-28  1629   * synchronous instruction
ed9eccbe8970f6 David Schleef      2008-11-04  1630   *
ed9eccbe8970f6 David Schleef      2008-11-04  1631   * arg:
18e01b24a7b605 Ian Abbott         2015-01-28  1632   *	pointer to comedi_insn structure
ed9eccbe8970f6 David Schleef      2008-11-04  1633   *
ed9eccbe8970f6 David Schleef      2008-11-04  1634   * reads:
18e01b24a7b605 Ian Abbott         2015-01-28  1635   *	comedi_insn structure
18e01b24a7b605 Ian Abbott         2015-01-28  1636   *	data (for writes) from insn->data pointer
ed9eccbe8970f6 David Schleef      2008-11-04  1637   *
ed9eccbe8970f6 David Schleef      2008-11-04  1638   * writes:
18e01b24a7b605 Ian Abbott         2015-01-28  1639   *	data (for reads) to insn->data pointer
ed9eccbe8970f6 David Schleef      2008-11-04  1640   */
92d0127c9d249c Greg Kroah-Hartman 2010-05-03  1641  static int do_insn_ioctl(struct comedi_device *dev,
92d0127c9d249c Greg Kroah-Hartman 2010-05-03  1642  			 struct comedi_insn __user *arg, void *file)
ed9eccbe8970f6 David Schleef      2008-11-04  1643  {
90035c0886b256 Bill Pemberton     2009-03-16  1644  	struct comedi_insn insn;
790c55415aa31f Bill Pemberton     2009-03-16  1645  	unsigned int *data = NULL;
f8bc1b2efa0518 Spencer E. Olson   2018-12-04  1646  	unsigned int n_data = MIN_SAMPLES;
ed9eccbe8970f6 David Schleef      2008-11-04  1647  	int ret = 0;
ed9eccbe8970f6 David Schleef      2008-11-04  1648  
77c21b626be5b6 Ian Abbott         2019-04-17  1649  	lockdep_assert_held(&dev->mutex);
56eec1806fac3c Jitendra Khasdev   2019-01-15  1650  	if (copy_from_user(&insn, arg, sizeof(insn)))
f8bc1b2efa0518 Spencer E. Olson   2018-12-04  1651  		return -EFAULT;
56eec1806fac3c Jitendra Khasdev   2019-01-15  1652  
f8bc1b2efa0518 Spencer E. Olson   2018-12-04  1653  	n_data = max(n_data, insn.n);
f8bc1b2efa0518 Spencer E. Olson   2018-12-04  1654  
ed9eccbe8970f6 David Schleef      2008-11-04  1655  	/* This is where the behavior of insn and insnlist deviate. */
f8bc1b2efa0518 Spencer E. Olson   2018-12-04  1656  	if (insn.n > MAX_SAMPLES) {
ed9eccbe8970f6 David Schleef      2008-11-04  1657  		insn.n = MAX_SAMPLES;
f8bc1b2efa0518 Spencer E. Olson   2018-12-04  1658  		n_data = MAX_SAMPLES;
f8bc1b2efa0518 Spencer E. Olson   2018-12-04  1659  	}
f8bc1b2efa0518 Spencer E. Olson   2018-12-04  1660  
f8bc1b2efa0518 Spencer E. Olson   2018-12-04  1661  	data = kmalloc_array(n_data, sizeof(unsigned int), GFP_KERNEL);
f8bc1b2efa0518 Spencer E. Olson   2018-12-04  1662  	if (!data) {
f8bc1b2efa0518 Spencer E. Olson   2018-12-04  1663  		ret = -ENOMEM;
f8bc1b2efa0518 Spencer E. Olson   2018-12-04  1664  		goto error;
f8bc1b2efa0518 Spencer E. Olson   2018-12-04  1665  	}
f8bc1b2efa0518 Spencer E. Olson   2018-12-04  1666  
ed9eccbe8970f6 David Schleef      2008-11-04  1667  	if (insn.insn & INSN_MASK_WRITE) {
21fe2eea638184 Mark               2010-05-13  1668  		if (copy_from_user(data,
21fe2eea638184 Mark               2010-05-13  1669  				   insn.data,
21fe2eea638184 Mark               2010-05-13  1670  				   insn.n * sizeof(unsigned int))) {
ed9eccbe8970f6 David Schleef      2008-11-04  1671  			ret = -EFAULT;
ed9eccbe8970f6 David Schleef      2008-11-04  1672  			goto error;
ed9eccbe8970f6 David Schleef      2008-11-04  1673  		}
6f38c6380c3b38 Ian Abbott         2025-07-28  1674  		if (insn.n < MIN_SAMPLES) {
6f38c6380c3b38 Ian Abbott         2025-07-28 @1675  			memset(&data[insn.n], 0,
6f38c6380c3b38 Ian Abbott         2025-07-28  1676  			       (MIN_SAMPLES - insn.n) * sizeof(unsigned int));
6f38c6380c3b38 Ian Abbott         2025-07-28  1677  		}
ed9eccbe8970f6 David Schleef      2008-11-04  1678  	}
ed9eccbe8970f6 David Schleef      2008-11-04  1679  	ret = parse_insn(dev, &insn, data, file);
ed9eccbe8970f6 David Schleef      2008-11-04  1680  	if (ret < 0)
ed9eccbe8970f6 David Schleef      2008-11-04  1681  		goto error;
ed9eccbe8970f6 David Schleef      2008-11-04  1682  	if (insn.insn & INSN_MASK_READ) {
21fe2eea638184 Mark               2010-05-13  1683  		if (copy_to_user(insn.data,
21fe2eea638184 Mark               2010-05-13  1684  				 data,
21fe2eea638184 Mark               2010-05-13  1685  				 insn.n * sizeof(unsigned int))) {
ed9eccbe8970f6 David Schleef      2008-11-04  1686  			ret = -EFAULT;
ed9eccbe8970f6 David Schleef      2008-11-04  1687  			goto error;
ed9eccbe8970f6 David Schleef      2008-11-04  1688  		}
ed9eccbe8970f6 David Schleef      2008-11-04  1689  	}
ed9eccbe8970f6 David Schleef      2008-11-04  1690  	ret = insn.n;
ed9eccbe8970f6 David Schleef      2008-11-04  1691  
ed9eccbe8970f6 David Schleef      2008-11-04  1692  error:
ed9eccbe8970f6 David Schleef      2008-11-04  1693  	kfree(data);
ed9eccbe8970f6 David Schleef      2008-11-04  1694  
ed9eccbe8970f6 David Schleef      2008-11-04  1695  	return ret;
ed9eccbe8970f6 David Schleef      2008-11-04  1696  }
ed9eccbe8970f6 David Schleef      2008-11-04  1697  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
