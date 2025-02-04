Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32388216E2C
	for <oe-kbuild@lists.linux.dev>; Tue,  4 Feb 2025 18:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738693784; cv=none; b=WJpMpPop6XdlLqjfb0Uk/tSGsLqFl6ry/ErHuIalAFE/lIuxWIVSHitp7v3T+lVAKw7avW/HBa+/UQHEXIFQcqkdeFipc3jof4IuVuYBxMdErxgJfY455yhrLJMoHnAh2miHbK5yGfE6bZZTRFx0U3u7rRcTqZyexLqoR7uZgeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738693784; c=relaxed/simple;
	bh=zAjtxiFWdUTQs2rA51Icbpb2OZvcwlIaYEe46+bXHbA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mECinItUpJW/T61mGT57u5yMjrCivH9kLfwy5fpnE6s19/QHHuGRcZ1E9UskfHZFg292z4zvKRO0cUH0x+nfPZCSnw5zMdfqo0BWFSpUrDU++7Kl7VXdhUFwHl2CjFqdyYY0XIJmEYz/BfTMlZ3p6Tkpnw99yK59G/ofM8KzyU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q6nIm7Zg; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q6nIm7Zg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738693782; x=1770229782;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=zAjtxiFWdUTQs2rA51Icbpb2OZvcwlIaYEe46+bXHbA=;
  b=Q6nIm7ZgJz7Q8ZPR6Py5Pf4IPMjnK+ralwkQtShQWO2rwcMaGcx95yF5
   3K8JJTsU65n5c52di22hFkk+j90YE1Ke+3XrZMPlVJZhRo2ZV+8lvXXFF
   xIlbAbhvTNmGjQOMR1jC4JmTnrH13SZMsxLULsL+GKXvOINtPSkAh+HPP
   5sYyr3frz6Q96vu2mDHthRhJB6OoFaqA/z0VA8Mi3CFtDzOdX39Yh1p/G
   MNIJXkX3ODR26kRBvIqCgzJN+ZX5DEZmTRoun1+CT8w6jI4X9dQIiZWwl
   ES5iwdJAcgRok/3/RWlSOTyJtUaQt8himoi7HW1iKSSUagJZEvPkQOguZ
   g==;
X-CSE-ConnectionGUID: md/XtJMyRhqeGatwVL9ueg==
X-CSE-MsgGUID: xNJWqT6IRRmHJ2qzJ1ySTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="38465512"
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; 
   d="scan'208";a="38465512"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 10:29:41 -0800
X-CSE-ConnectionGUID: ysWzFIUVTAyTZC4foyAcQQ==
X-CSE-MsgGUID: HcSTetZFSJ+f3jDQcIbG4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="114726888"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 04 Feb 2025 10:29:40 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfNg1-000sql-22;
	Tue, 04 Feb 2025 18:29:37 +0000
Date: Wed, 5 Feb 2025 02:29:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [usb:usb-next 5/12] drivers/usb/typec/ucsi/ucsi.c:88
 ucsi_sync_control_common() error: we previously assumed 'cci' could be null
 (see line 84)
Message-ID: <202502050227.tDYOqQsX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-usb@vger.kernel.org
TO: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: "Łukasz Bartosik" <ukaszb@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-next
head:   9682c35ff6ecd76d9462d4749b8b413d3e8e605e
commit: 667ecac55861281c1f5e107c8550ae893b3984f6 [5/12] usb: typec: ucsi: return CCI and message from sync_control callback
:::::: branch date: 27 hours ago
:::::: commit date: 27 hours ago
config: csky-randconfig-r072-20250204 (https://download.01.org/0day-ci/archive/20250205/202502050227.tDYOqQsX-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202502050227.tDYOqQsX-lkp@intel.com/

New smatch warnings:
drivers/usb/typec/ucsi/ucsi.c:88 ucsi_sync_control_common() error: we previously assumed 'cci' could be null (see line 84)

Old smatch warnings:
drivers/usb/typec/ucsi/ucsi.c:746 ucsi_get_pd_caps() warn: passing zero to 'ERR_PTR'
drivers/usb/typec/ucsi/ucsi.c:1456 ucsi_dr_swap() warn: missing error code 'ret'

vim +/cci +88 drivers/usb/typec/ucsi/ucsi.c

584e8df58942338 Dmitry Baryshkov 2024-06-27  57  
667ecac55861281 Dmitry Baryshkov 2025-01-20  58  int ucsi_sync_control_common(struct ucsi *ucsi, u64 command, u32 *cci,
667ecac55861281 Dmitry Baryshkov 2025-01-20  59  			     void *data, size_t size)
584e8df58942338 Dmitry Baryshkov 2024-06-27  60  {
584e8df58942338 Dmitry Baryshkov 2024-06-27  61  	bool ack = UCSI_COMMAND(command) == UCSI_ACK_CC_CI;
584e8df58942338 Dmitry Baryshkov 2024-06-27  62  	int ret;
584e8df58942338 Dmitry Baryshkov 2024-06-27  63  
584e8df58942338 Dmitry Baryshkov 2024-06-27  64  	if (ack)
584e8df58942338 Dmitry Baryshkov 2024-06-27  65  		set_bit(ACK_PENDING, &ucsi->flags);
584e8df58942338 Dmitry Baryshkov 2024-06-27  66  	else
584e8df58942338 Dmitry Baryshkov 2024-06-27  67  		set_bit(COMMAND_PENDING, &ucsi->flags);
584e8df58942338 Dmitry Baryshkov 2024-06-27  68  
e37b383df91ba9b Łukasz Bartosik  2024-12-03  69  	reinit_completion(&ucsi->complete);
e37b383df91ba9b Łukasz Bartosik  2024-12-03  70  
584e8df58942338 Dmitry Baryshkov 2024-06-27  71  	ret = ucsi->ops->async_control(ucsi, command);
584e8df58942338 Dmitry Baryshkov 2024-06-27  72  	if (ret)
584e8df58942338 Dmitry Baryshkov 2024-06-27  73  		goto out_clear_bit;
584e8df58942338 Dmitry Baryshkov 2024-06-27  74  
584e8df58942338 Dmitry Baryshkov 2024-06-27  75  	if (!wait_for_completion_timeout(&ucsi->complete, 5 * HZ))
584e8df58942338 Dmitry Baryshkov 2024-06-27  76  		ret = -ETIMEDOUT;
584e8df58942338 Dmitry Baryshkov 2024-06-27  77  
584e8df58942338 Dmitry Baryshkov 2024-06-27  78  out_clear_bit:
584e8df58942338 Dmitry Baryshkov 2024-06-27  79  	if (ack)
584e8df58942338 Dmitry Baryshkov 2024-06-27  80  		clear_bit(ACK_PENDING, &ucsi->flags);
584e8df58942338 Dmitry Baryshkov 2024-06-27  81  	else
584e8df58942338 Dmitry Baryshkov 2024-06-27  82  		clear_bit(COMMAND_PENDING, &ucsi->flags);
584e8df58942338 Dmitry Baryshkov 2024-06-27  83  
667ecac55861281 Dmitry Baryshkov 2025-01-20 @84  	if (!ret && cci)
667ecac55861281 Dmitry Baryshkov 2025-01-20  85  		ret = ucsi->ops->read_cci(ucsi, cci);
667ecac55861281 Dmitry Baryshkov 2025-01-20  86  
667ecac55861281 Dmitry Baryshkov 2025-01-20  87  	if (!ret && data &&
667ecac55861281 Dmitry Baryshkov 2025-01-20 @88  	    (*cci & UCSI_CCI_COMMAND_COMPLETE))
667ecac55861281 Dmitry Baryshkov 2025-01-20  89  		ret = ucsi->ops->read_message_in(ucsi, data, size);
667ecac55861281 Dmitry Baryshkov 2025-01-20  90  
584e8df58942338 Dmitry Baryshkov 2024-06-27  91  	return ret;
584e8df58942338 Dmitry Baryshkov 2024-06-27  92  }
584e8df58942338 Dmitry Baryshkov 2024-06-27  93  EXPORT_SYMBOL_GPL(ucsi_sync_control_common);
584e8df58942338 Dmitry Baryshkov 2024-06-27  94  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
