Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34651224CC
	for <oe-kbuild@lists.linux.dev>; Tue,  8 Oct 2024 17:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728407165; cv=none; b=oo5AnZHmiGwSxowJwmTkjItDhY5yeHG9n11+JmIEGsr2BM5jCxRu/knn9LLcgMOFPlCzAbk6TS5PkDVNfPnmLk133JzMQeQWrAWV/x7iHr+P6y+q2NAyR8fm/UdMm2uPherdLVoDHsfqOG9S0tldlBqtL8+SV9cVoYox2XAZZ7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728407165; c=relaxed/simple;
	bh=Ikb6aSMp/X8LaQATZSEZh8WTGa2h/GFLQT8BujSzDTM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NyYFm9nfKTCVhWyMZ2lSIOWMuV5IW9RSVOvCIDyeyYziEf7xeALbZIeWvBxFlMBk4EsTLqLM3B4Ffi36iE2nXsPGUf0dSqyPg4kpxTHJ/CioLBlTPmGkQLz9tLaobcsFT3DsSI0OVMWfZlasC3EVYllmj7tJy295nh8FIxDRatc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lTkrCUz5; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lTkrCUz5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728407161; x=1759943161;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ikb6aSMp/X8LaQATZSEZh8WTGa2h/GFLQT8BujSzDTM=;
  b=lTkrCUz5UEI8lt5Zobuz4AWgb9z/ESElzshlv+kMHGRg3s2OpTIhcJet
   35eTHSXsI9lF+ru8byrW3TILKaSO2DunNnO49q7i3A0mgv3GTVIrlAcpu
   YWz4Fy8gsxjMfRLdhULCCWlqf3BF67b0hrAGeu/8BOzIUTDXitp2f1NtK
   UIt1qr66yyG/JiCq9rROQTFlJCTNX0E6tu8ZqRHc6cILzs+RmOd8q0XGE
   bWMtuUdn3yO8VO/NTOzZnad18DTFWp+vCmjHPgJLoihQ0Of4OoLOOCgkq
   toFmzDPZpHXN+LB9Vj0idhWg2nvwJr38Z4cYBpwjaxMw4iT8LNxq2kRmp
   Q==;
X-CSE-ConnectionGUID: Hawp0nmiSP2ckFQGZfP8Aw==
X-CSE-MsgGUID: bZo73jEYQ/S1Kk87C/t96Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="31520237"
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; 
   d="scan'208";a="31520237"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 10:06:01 -0700
X-CSE-ConnectionGUID: R6cxotCWTuWCvsNPRvkQsA==
X-CSE-MsgGUID: vuJP3/VXRT6a1Agi+wjXMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; 
   d="scan'208";a="79885069"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 08 Oct 2024 10:06:00 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1syDen-0008AQ-1E;
	Tue, 08 Oct 2024 17:05:57 +0000
Date: Wed, 9 Oct 2024 01:05:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [ath:ath12k-mlo-qcn9274 29/81]
 drivers/net/wireless/ath/ath12k/core.c:922 ath12k_mac_mlo_ready() error:
 uninitialized symbol 'ret'.
Message-ID: <202410090113.oi5AalKu-lkp@intel.com>
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
CC: Jeff Johnson <jjohnson@kernel.org>
CC: Kalle Valo <kvalo@kernel.org>
CC: ath12k@lists.infradead.org
TO: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
CC: Kalle Valo <quic_kvalo@quicinc.com>
CC: Harshitha Prem <quic_hprem@quicinc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath12k-mlo-qcn9274
head:   4ad14f50820745f9c2f425ba07ca8431bf2409ed
commit: 632d1d009c147817583dc1e6abdb6b0cc286ec3f [29/81] wifi: ath12k: Add MLO setup and teardown from core start
:::::: branch date: 4 days ago
:::::: commit date: 5 days ago
config: csky-randconfig-r072-20241008 (https://download.01.org/0day-ci/archive/20241009/202410090113.oi5AalKu-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410090113.oi5AalKu-lkp@intel.com/

smatch warnings:
drivers/net/wireless/ath/ath12k/core.c:922 ath12k_mac_mlo_ready() error: uninitialized symbol 'ret'.

vim +/ret +922 drivers/net/wireless/ath/ath12k/core.c

632d1d009c1478 Karthikeyan Periyasamy 2024-09-27  901  
632d1d009c1478 Karthikeyan Periyasamy 2024-09-27  902  int ath12k_mac_mlo_ready(struct ath12k_hw_group *ag)
632d1d009c1478 Karthikeyan Periyasamy 2024-09-27  903  {
632d1d009c1478 Karthikeyan Periyasamy 2024-09-27  904  	struct ath12k_hw *ah;
632d1d009c1478 Karthikeyan Periyasamy 2024-09-27  905  	struct ath12k *ar;
632d1d009c1478 Karthikeyan Periyasamy 2024-09-27  906  	int ret;
632d1d009c1478 Karthikeyan Periyasamy 2024-09-27  907  	int i, j;
632d1d009c1478 Karthikeyan Periyasamy 2024-09-27  908  
632d1d009c1478 Karthikeyan Periyasamy 2024-09-27  909  	for (i = 0; i < ag->num_hw; i++) {
632d1d009c1478 Karthikeyan Periyasamy 2024-09-27  910  		ah = ag->ah[i];
632d1d009c1478 Karthikeyan Periyasamy 2024-09-27  911  		if (!ah)
632d1d009c1478 Karthikeyan Periyasamy 2024-09-27  912  			continue;
632d1d009c1478 Karthikeyan Periyasamy 2024-09-27  913  
632d1d009c1478 Karthikeyan Periyasamy 2024-09-27  914  		for_each_ar(ah, ar, j) {
632d1d009c1478 Karthikeyan Periyasamy 2024-09-27  915  			ar = &ah->radio[j];
632d1d009c1478 Karthikeyan Periyasamy 2024-09-27  916  			ret = __ath12k_mac_mlo_ready(ar);
632d1d009c1478 Karthikeyan Periyasamy 2024-09-27  917  			if (ret)
632d1d009c1478 Karthikeyan Periyasamy 2024-09-27  918  				goto out;
632d1d009c1478 Karthikeyan Periyasamy 2024-09-27  919  		}
632d1d009c1478 Karthikeyan Periyasamy 2024-09-27  920  	}
632d1d009c1478 Karthikeyan Periyasamy 2024-09-27  921  out:
632d1d009c1478 Karthikeyan Periyasamy 2024-09-27 @922  	return ret;
632d1d009c1478 Karthikeyan Periyasamy 2024-09-27  923  }
632d1d009c1478 Karthikeyan Periyasamy 2024-09-27  924  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
