Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D64C93B9D9C
	for <oe-kbuild@lists.linux.dev>; Mon, 23 Mar 2026 16:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774281911; cv=none; b=XJPutB/2rVALwq//5LYQ+PZyX/JCEVF/aZfVZrdX806m9GGSSUfjNMEtyBhvm8XuExzCfUUk5afCi43P0Wb2XH3MCmvBYjsW0XpYdrgTND7AkwvnZR1gR7qBPgiuLs82TGGj9jAWKZHn6vT6yr0bkU1FVtPuWlhZ5Yre0lfQabw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774281911; c=relaxed/simple;
	bh=Z9k1R5xUoiMQQAMEw+cSP+tubYSJkOZ/CVuWeyhbLxY=;
	h=Date:From:To:Subject:Message-ID; b=QGJOKIREJP5HeAgmnYxbYWH4iZnOfE8BieWS4Cdh7K1lBQAcDgBLlLXlQBsE8gIpiyf/fUsRzX6Fj9AFrAB3tRxbzIIlSlx3HGG/cZe4H7ctBl/BqHnMSAHLiv7BTz0ZvukKq3HVJsdnlPa8AM6TJt5a3ognjHULzIdnSabPy68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mBfnjbKr; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mBfnjbKr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774281910; x=1805817910;
  h=date:from:to:subject:message-id;
  bh=Z9k1R5xUoiMQQAMEw+cSP+tubYSJkOZ/CVuWeyhbLxY=;
  b=mBfnjbKrWoBjQPIxVAZBq7xMmBbc+vZN4arZjdEJlYJ/0CQLnBfNYU87
   sJf8Wc5sjrJYXN1ZTJ9paVFXank8gg1srrumX7Ty0+ynxFELv4PV6TOFO
   gwHbrR6l1oLPlCWkc0VgpP4SRHDtVb14VM8I05ZuicreIuFoStYPKK0nz
   +JLLSASdBZ0hU9xW0VC5eO+O2+LOoLWjq+OG7o6g8JPr9Y3rBeIb1sGva
   qZbvLeZgZUfplpA/C5M1yQWUnKXtrdbWjRPrDExm/ZdYRirGEspTPBO1k
   u6VSpE79b1cQe3HrKL8nMAB3P5TzuS+/nSmZcWBkxKejVR1LAX1VFA/mt
   Q==;
X-CSE-ConnectionGUID: WPA6xBXIQ/2sT4Mg/UuPHw==
X-CSE-MsgGUID: AvJoCPyHQL6mT+J7vHjkVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="86651786"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="86651786"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 09:05:09 -0700
X-CSE-ConnectionGUID: eqpf66oBSvex3y7kIBmGnA==
X-CSE-MsgGUID: Z0yleiVFTPqeeDGpYYecJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="228548306"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 23 Mar 2026 09:05:09 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4hm6-000000006gZ-1iBb
	for oe-kbuild@lists.linux.dev;
	Mon, 23 Mar 2026 16:05:06 +0000
Date: Mon, 23 Mar 2026 17:04:11 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [dhowells-fs:ceph-iter 71/77] checkpatch: ERROR:OPEN_BRACE:
 open brace '{' following struct go on the same line
Message-ID: <202603231632.RPnWriWA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: David Howells <dhowells@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git ceph-iter
head:   05d546a07e9a570d280344cff29c354b67fda562
commit: 09897381d0511f67c818cf14d52baca9b5a941c1 [71/77] ceph: Use netfslib [INCOMPLETE]
:::::: branch date: 17 hours ago
:::::: commit date: 18 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260323/202603231632.RPnWriWA-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:OPEN_BRACE: open brace '{' following struct go on the same line
#537: FILE: fs/ceph/rdwr.c:62:
+struct ceph_writeback_ctl
+{

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
