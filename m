Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793913954;
	b=VU94szWeXccYIB9RssCkCJ8Xaz2pHHRKor1onD0m+vC0TGAoEXU9THCaLqUu0ucOGGiN
	 ZGMV9ruorsriHlQ8vOwsUuxLtY+JtS+nmlkDBDo5QtfwyMvYcq/G/yAHw+fONZFXtx8s0
	 3H6Q43xLPcWv3+qPH/tVgIP+2i+hDfT3/FEgrvfFptOWUoSDaXBFJS71cJ5VG1g/aiUSa
	 VGhnDQf100vO007HrmuW58IQpBVuJ9ybzKwt4Yp9kjghoqahAN+0Fly5QkvDN1cehMKAr
	 ohFaC5lXE6p9YlZF8gKJYYVl1nGGRF3ZSJ5P8+6Xb5F/C8rK8VRTqB8QGC5QZZzsxSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793913954;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=r/k4ivg+7WqbdMdwCGevd1fF49ysaeAMgwOeIcJMwFs=;
	b=GiZ9PvafLuTQdEaAbRnkmaCiKFgkSkMALv0E9J1TozyE/h3Uoe7skTLlZe3WpHWhKgf9
	 PR9PINHYYPt9yg+E9todCdWMX8c9Qj0TDaOdId6i7DGYyBx5i7iomyMlZxAlEpRdlW43R
	 v3CO4cMUy3psQw4M2bWXP+xaqLrB2P3hKzg/03W7sR4nTLL8xNvc0sh/ZKZ6HVwcBxH9V
	 znhExMUViWLAHTy+lpn9yJVScP3vt37grWxL+jGj6sIZgiEv1HFDqLZT68fQCR9bTtjIr
	 UwlDX7L5VdFgBY0yfwh37bmQtEf+Wqf3AOrFUGDszYq6FQng4ifYKohafaRrJZFYYgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mnfrAEHe;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B0B606A326
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Nov 2026 21:25:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11B0B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mnfrAEHe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793913952; x=1825449952;
  h=date:from:to:cc:subject:message-id;
  bh=9RS+q6mIw6MtOw7TeOzu51rSf07Ms/G39oUWatu7odg=;
  b=mnfrAEHeyp9sSG9DLJqCVpRzNIv11weKXI8UQwQRVhxiyl45DFNI1O4Y
   tSEr4JGoA3liyjPHac+Mex8PLwcpvP8RUWGkQyHAtd3xq0cdem35mQJ4G
   +X5Hq6G/doqFqMX0LGaPwAamfzFYrYlUwusJClys+ts64j/DFbRrzMtw6
   DfF0FughZjUCdUA4BhbKuXIJ1Of44qvdNShr0HayTHYkE5zpJukFQXWj6
   wL9t+dwNK40WOc7u/v344SKd/GZrdDfo6/nmR8DmlgtlcSESr/eMnvP3e
   +xHET7Bp5pL0KaTcQfOa7SMla2lAbB9xFuigtTiROGOXodtAmIGWpbaxq
   A==;
X-CSE-ConnectionGUID: e1bN+6SlQEaumfqOtR54sA==
X-CSE-MsgGUID: gOK1Y4U8R5u7SSYXOrX84A==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2606844"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2606844"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 13:25:51 -0800
X-CSE-ConnectionGUID: 4ovM2hEvQPGEKxohDkWo1Q==
X-CSE-MsgGUID: 7J5f/62MS/OOkDM9ATBoZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7022203"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 05 Nov 2026 13:25:51 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xP4xw-000000009o7-04PW;
	Thu, 05 Nov 2026 21:25:48 +0000
Date: Thu, 05 Nov 2026 22:25:46 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [snitzer:kernel-7.3/jflynn-io500-canary 1339/1462]
 aarch64-linux-gnu-ld: fs/nfs/super.o:(__param+0x138): undefined reference to
 `nfs_idmap_cache_timeout'
Message-ID: <202611052229.z1eSAQlm-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: David Flynn <david.flynn@hammerspace.com>
CC: Mike Snitzer <snitzer@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/snitzer/linux.git kernel-7.3/jflynn-io500-canary
head:   a0f5f04a3920835767e24c944e54a676d5aa32b8
commit: 1bb07fd5eb81675b74c94d750b57d01f34768f8c [1339/1462] hammerspace: private extensions (O_NOMODE, mkdirat2, NFS client/server)
:::::: branch date: 22 hours ago
:::::: commit date: 25 hours ago
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20261105/202611052229.z1eSAQlm-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261105/202611052229.z1eSAQlm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611052229.z1eSAQlm-lkp@intel.com/

All errors (new ones prefixed by >>):

>> aarch64-linux-gnu-ld: fs/nfs/super.o:(__param+0x138): undefined reference to `nfs_idmap_cache_timeout'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
