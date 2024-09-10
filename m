Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD13538DD3
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Sep 2024 05:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725946414; cv=none; b=WKAb+/DlCsazbwl8UPaObUvpZaiW+fVBbhjBZh5PUg822rb4Y9jHrAly2MC52K7VKFvoYZvj/VfM2spRdlyrg12DsgWJWr/XPp4thd2LAdTLl4Qr3C4q1XuOlDYy++tCOVwu2dC8hPVb0Kiv+s3Pj/nE81QzaSCaqxBYlgz9L88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725946414; c=relaxed/simple;
	bh=UKFnwSn1RsBGfzTDlTfEfKCDVyrL3mdF/3SI7eG6Wb4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ea29tY8LVzK/UrricMH9CPCGRNoOGwx+MxhC8LRNCU4DMxWIyDtkuQcVP8KouonXqDS4bu1PlR1d2ZJaTuTJD/pqyJr1+d539DrD58dJMBNxDMKT+C6S6sfBZaibYO+4IY8K/vnl+YvUGhxVK5Py2568JWYOpulHK8yK3hllTE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bRtkaVwy; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bRtkaVwy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725946413; x=1757482413;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UKFnwSn1RsBGfzTDlTfEfKCDVyrL3mdF/3SI7eG6Wb4=;
  b=bRtkaVwyjrvpL5ThjU6pTuxDmvXJmTAFxPetxEdGDacOBVgOoTpFLupV
   2X0NCV2GuZUZGfoOck//T/xnvKcwEKMIK4dWgtj6rlCWm4XPGBYha9xQH
   fvswv9flBV3hB2nvXF9TnqHhPoNuFL+hIiKNOICwSD4McaAo8eHz184s1
   0wd5EGSXJ/4mHFZE4Aiv0Ypw3INwLSMvniBIWgVVU7HfdTlmkJusXrvm0
   vWo2hST1x/gyWL5XTqYOkm6yOlibWia1nTzg+xnoOha5zU3TrEdCzxg+C
   pSE0+m/UwjcTgKQPkcM/O9D/xDoaoX4vbla37BaobSc/gbA5twO30kjWv
   Q==;
X-CSE-ConnectionGUID: hYFLf80CSnOpDTketf+6MQ==
X-CSE-MsgGUID: p9TA9PHbQqqOYYs+43TNDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="24864573"
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; 
   d="scan'208";a="24864573"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 22:33:31 -0700
X-CSE-ConnectionGUID: epiI0K8uR8uybo68oOOLIw==
X-CSE-MsgGUID: gkIwXJgYSR6SFaRgwO5ZdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; 
   d="scan'208";a="67157043"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 09 Sep 2024 22:33:30 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sntVI-000078-1s;
	Tue, 10 Sep 2024 05:33:28 +0000
Date: Tue, 10 Sep 2024 13:33:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [openeuler:OLK-5.10 16958/30000]
 drivers/net/bonding/bond_sysctl.c:11 (null)() warn: (struct
 ctl_table)->procname cannot be NULL. Expression :
 bond_broadcast_arp_or_nd_table[1]->procname
Message-ID: <202409101351.N0ApbRJC-lkp@intel.com>
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
TO: kernel@openeuler.org
TO: "openeuler-sync-bot" <openeuler.syncbot@gmail.com>

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   49cb18ca62c5763a7eb26376e62a63172470762d
commit: 337eb92cdbafcc9ec159404e382d6254672948c2 [16958/30000] anolis: bond: broadcast ARP or ND messages to all slaves
:::::: branch date: 16 hours ago
:::::: commit date: 1 year, 2 months ago
config: x86_64-randconfig-161-20240906 (https://download.01.org/0day-ci/archive/20240910/202409101351.N0ApbRJC-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409101351.N0ApbRJC-lkp@intel.com/

smatch warnings:
drivers/net/bonding/bond_sysctl.c:11 (null)() warn: (struct ctl_table)->procname cannot be NULL. Expression : bond_broadcast_arp_or_nd_table[1]->procname
drivers/net/bonding/bond_sysctl.c:11 (null)() warn: (struct ctl_table)->proc_handler cannot be NULL. Expression : bond_broadcast_arp_or_nd_table[1]->proc_handler

vim +11 drivers/net/bonding/bond_sysctl.c

337eb92cdbafcc Tony Lu 2023-01-10  10  
337eb92cdbafcc Tony Lu 2023-01-10 @11  static struct ctl_table bond_broadcast_arp_or_nd_table[] = {
337eb92cdbafcc Tony Lu 2023-01-10  12  	{
337eb92cdbafcc Tony Lu 2023-01-10  13  		.procname	= "broadcast_arp_or_nd",
337eb92cdbafcc Tony Lu 2023-01-10  14  		.data		= &sysctl_bond_broadcast_arp_or_nd,
337eb92cdbafcc Tony Lu 2023-01-10  15  		.maxlen		= sizeof(int),
337eb92cdbafcc Tony Lu 2023-01-10  16  		.mode		= 0644,
337eb92cdbafcc Tony Lu 2023-01-10  17  		.proc_handler	= proc_dointvec,
337eb92cdbafcc Tony Lu 2023-01-10  18  	},
337eb92cdbafcc Tony Lu 2023-01-10  19  	{}
337eb92cdbafcc Tony Lu 2023-01-10  20  };
337eb92cdbafcc Tony Lu 2023-01-10  21  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
