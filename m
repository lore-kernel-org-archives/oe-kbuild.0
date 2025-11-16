Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A011DEFE8
	for <oe-kbuild@lists.linux.dev>; Sun, 16 Nov 2025 21:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763327152; cv=none; b=SWjqTaVO8jRTfzWq4AiZsFJ2sDngNHUfxKjsN7i8GfKLVw+GCpEtM3JcCS0HElYsP+EsQj/Rxoi/d6kR8liZDY/S3NvHB7RifCxhn7xsyGagG93BIv6Ufn/PiN6J5DqhzZmCE5d9pv2ZCWXiDh4mj+4vR6ZXK/sJaMHcndEgjKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763327152; c=relaxed/simple;
	bh=rcqfb4aGug+rqQaGdFthBOLb8CwM4EPJGqbK4+j+tEY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cfnTUpo90bX8YGxPBhkXgK1aqj+GJC/bi8t9G8Edq6bIAuB/tQa6MB89BEGV0p0COjIcXCJGFrQ+TfFCn3SBdNZnitqsr9ePUsyTpnIBan4+DDh/LTxooaFFlqjhcsgPxJNOh4eLteT7tlD6mCVfNUeNyHO5LjDsLeAHNsHQXkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cLrG+ky1; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cLrG+ky1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763327150; x=1794863150;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rcqfb4aGug+rqQaGdFthBOLb8CwM4EPJGqbK4+j+tEY=;
  b=cLrG+ky1WL0BjHVkiXj2jqS9e2vk+8p3oO6tCGdu2fDHao3/BS5g6XQ2
   xQtfQloAsGfsZXNw7SR8FX/ZFHmq4A/I4JOG9EnfVeljLpScx6VY81+Dg
   Q0DSRW1GZz4/QzyXVuhF0j6uxDIFLOPfDqXtu91rNfeZ1KhfwzdLMKX6S
   anf7z+rJXHK81KdD4c37x3++/dgMYysBW2juicXc9xl6QjvAEnT1HmT0J
   Yp+tjnPSzYfiha9WlV8OK1H8n1iEW2Au8QC/I5ruHeLPnWJZZxeXCfjVB
   TiOq/6nDjDN7pgkUfFH7AAcsOvQldHR5C2LuFOec5PP8f3937YkJtu7yc
   Q==;
X-CSE-ConnectionGUID: sLyOVF0TSguIIPicv47T4A==
X-CSE-MsgGUID: 4AzP/m3fTfiTyqi9KV/tuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="90809673"
X-IronPort-AV: E=Sophos;i="6.19,310,1754982000"; 
   d="scan'208";a="90809673"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2025 13:05:49 -0800
X-CSE-ConnectionGUID: 8SwODGakSTKmjlaH6cTnYA==
X-CSE-MsgGUID: YBpDwr69R7yN5jEnGAWeFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,310,1754982000"; 
   d="scan'208";a="194735552"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 16 Nov 2025 13:05:48 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vKjwQ-000943-0I;
	Sun, 16 Nov 2025 21:05:46 +0000
Date: Mon, 17 Nov 2025 05:05:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [robertosassu:ima-snapshots-v1-devel-v1 1/1]
 security/integrity/ima/ima_fs.c:321 ima_measurements_snap_write() warn:
 maybe return -EFAULT instead of the bytes remaining?
Message-ID: <202511170428.8scOuqUb-lkp@intel.com>
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
TO: Roberto Sassu <roberto.sassu@huawei.com>

tree:   https://github.com/robertosassu/linux ima-snapshots-v1-devel-v1
head:   b0bd002b6caa9d5d4f4d0db2a041b1fd91f33f8a
commit: b0bd002b6caa9d5d4f4d0db2a041b1fd91f33f8a [1/1] ima: Add support for measurement list snapshots
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20251116 (https://download.01.org/0day-ci/archive/20251117/202511170428.8scOuqUb-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511170428.8scOuqUb-lkp@intel.com/

smatch warnings:
security/integrity/ima/ima_fs.c:321 ima_measurements_snap_write() warn: maybe return -EFAULT instead of the bytes remaining?

vim +321 security/integrity/ima/ima_fs.c

b0bd002b6caa9d Roberto Sassu 2025-11-13  308  
b0bd002b6caa9d Roberto Sassu 2025-11-13  309  static ssize_t ima_measurements_snap_write(struct file *file,
b0bd002b6caa9d Roberto Sassu 2025-11-13  310  					   const char __user *buf,
b0bd002b6caa9d Roberto Sassu 2025-11-13  311  					   size_t datalen, loff_t *ppos)
b0bd002b6caa9d Roberto Sassu 2025-11-13  312  {
b0bd002b6caa9d Roberto Sassu 2025-11-13  313  	unsigned char req[SNAPSHOT_REQ_LENGTH];
b0bd002b6caa9d Roberto Sassu 2025-11-13  314  	int ret;
b0bd002b6caa9d Roberto Sassu 2025-11-13  315  
b0bd002b6caa9d Roberto Sassu 2025-11-13  316  	if (*ppos > 0 || datalen != SNAPSHOT_REQ_LENGTH)
b0bd002b6caa9d Roberto Sassu 2025-11-13  317  		return -EINVAL;
b0bd002b6caa9d Roberto Sassu 2025-11-13  318  
b0bd002b6caa9d Roberto Sassu 2025-11-13  319  	ret = copy_from_user(req, buf, datalen);
b0bd002b6caa9d Roberto Sassu 2025-11-13  320  	if (ret < 0)
b0bd002b6caa9d Roberto Sassu 2025-11-13 @321  		return ret;
b0bd002b6caa9d Roberto Sassu 2025-11-13  322  
b0bd002b6caa9d Roberto Sassu 2025-11-13  323  	if (req[1] != '\n')
b0bd002b6caa9d Roberto Sassu 2025-11-13  324  		return -EINVAL;
b0bd002b6caa9d Roberto Sassu 2025-11-13  325  
b0bd002b6caa9d Roberto Sassu 2025-11-13  326  	switch (req[0]) {
b0bd002b6caa9d Roberto Sassu 2025-11-13  327  	case SNAPSHOT_REQ_MAKE:
b0bd002b6caa9d Roberto Sassu 2025-11-13  328  		ret = ima_queue_make_snapshot();
b0bd002b6caa9d Roberto Sassu 2025-11-13  329  		break;
b0bd002b6caa9d Roberto Sassu 2025-11-13  330  	case SNAPSHOT_REQ_DEL:
b0bd002b6caa9d Roberto Sassu 2025-11-13  331  		ret = ima_queue_delete_snapshot();
b0bd002b6caa9d Roberto Sassu 2025-11-13  332  		break;
b0bd002b6caa9d Roberto Sassu 2025-11-13  333  	default:
b0bd002b6caa9d Roberto Sassu 2025-11-13  334  		ret = -EINVAL;
b0bd002b6caa9d Roberto Sassu 2025-11-13  335  		break;
b0bd002b6caa9d Roberto Sassu 2025-11-13  336  	}
b0bd002b6caa9d Roberto Sassu 2025-11-13  337  
b0bd002b6caa9d Roberto Sassu 2025-11-13  338  	if (ret < 0)
b0bd002b6caa9d Roberto Sassu 2025-11-13  339  		return ret;
b0bd002b6caa9d Roberto Sassu 2025-11-13  340  
b0bd002b6caa9d Roberto Sassu 2025-11-13  341  	return datalen;
b0bd002b6caa9d Roberto Sassu 2025-11-13  342  }
b0bd002b6caa9d Roberto Sassu 2025-11-13  343  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
