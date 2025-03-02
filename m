Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23AE23F36B
	for <oe-kbuild@lists.linux.dev>; Sun,  2 Mar 2025 11:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740913733; cv=none; b=P5Tb57cs1LTDcPQg76sAIadHrNp/DO9PHltuts7/x22LVy5Na9MHcift/m01GgvZHuhMl+/J4aWNIa+wlBlJq46IEheN6yE3wCEr5FtoOR+O8cMYwQrtPULMhBPTnHXU8hBtYFA9eJXgWUqaGQobCJoh+o65+Do4fGsfggelWqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740913733; c=relaxed/simple;
	bh=iKjV5VWcauSb308+5AdJ0RTIDHs4cFIZIHd2I0VMSSw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hc5dKsM7AoCrBv9j3ZNpUoHwjRAi8uZBayRn5BQdJJDyKqujVvb5AwsOrt/8wBVxAlpGEEdg1Bcp4um7JStRwvKnEVWRxHGsiezWhtqGFIqk2okIF8pR9JC0p++Wc5Qv3uBIIDlx2+qXeS/mI+/Ui8g/6CzU3SoDZiJHJuqdGfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a2jk+48+; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a2jk+48+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740913731; x=1772449731;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iKjV5VWcauSb308+5AdJ0RTIDHs4cFIZIHd2I0VMSSw=;
  b=a2jk+48+kzncW+prfDdTsa6Yfw2nBaa/yKx40hIfKxKklcQk8sgrmfTN
   o+o/urBvUssc4TT4peUPJE/Xr+ze7lZrdc6SgIPSG+T1IsypBTvi6Xf+c
   WcCSAcYE1n+HNx4c+stOIq7TD39gVYJFVewrA4j/+LJ2D7ENW+qOVkQzj
   CcbARV2LVhPtT974PyesHQkfYtwMQcIxUXb4+m4i5NUD6QvrswE0sqIuT
   YbyIFhUcOf9uWCSow46VyRMyziZAodwNcWs2aW6oCwdUk5ApfH330z+dA
   J3hN30wZRCqAOaxJFF30pIvLiWVKulq8lcw6tAgZ5x50mNFJMFKy+xPCt
   g==;
X-CSE-ConnectionGUID: E3wDs/bvQZKA5voAwAPZoA==
X-CSE-MsgGUID: hjfQ3C/xTiu2fcyR885/lQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11360"; a="41647913"
X-IronPort-AV: E=Sophos;i="6.13,327,1732608000"; 
   d="scan'208";a="41647913"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2025 03:08:50 -0800
X-CSE-ConnectionGUID: EFw6+f28SLSK2XEsisIThw==
X-CSE-MsgGUID: CGEITwr6SN+PK81Pew5ijQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="154930117"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 02 Mar 2025 03:08:49 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tohBP-000HGo-1B;
	Sun, 02 Mar 2025 11:08:36 +0000
Date: Sun, 2 Mar 2025 19:07:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH mptcp-next v2 12/14] mptcp: pm: move generic PM helpers
 to pm.c
Message-ID: <202503021814.nHwMzDOP-lkp@intel.com>
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
In-Reply-To: <20250228-mptcp-pm-reorg-code-v2-12-fa8b2542b7a5@kernel.org>
References: <20250228-mptcp-pm-reorg-code-v2-12-fa8b2542b7a5@kernel.org>
TO: "Matthieu Baerts (NGI0)" <matttbe@kernel.org>
TO: mptcp@lists.linux.dev
CC: Geliang Tang <geliang@kernel.org>
CC: "Matthieu Baerts (NGI0)" <matttbe@kernel.org>

Hi Matthieu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 6b32949274eb9e32fe867ba9a8f8cb98587ecf36]

url:    https://github.com/intel-lab-lkp/linux/commits/Matthieu-Baerts-NGI0/mptcp-pm-remove-_nl-from-mptcp_pm_nl_addr_send_ack/20250228-213416
base:   6b32949274eb9e32fe867ba9a8f8cb98587ecf36
patch link:    https://lore.kernel.org/r/20250228-mptcp-pm-reorg-code-v2-12-fa8b2542b7a5%40kernel.org
patch subject: [PATCH mptcp-next v2 12/14] mptcp: pm: move generic PM helpers to pm.c
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: sparc-randconfig-r071-20250302 (https://download.01.org/0day-ci/archive/20250302/202503021814.nHwMzDOP-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503021814.nHwMzDOP-lkp@intel.com/

smatch warnings:
net/mptcp/pm.c:156 mptcp_remove_anno_list_by_saddr() warn: returning freed memory 'entry' (line 155)

vim +/entry +156 net/mptcp/pm.c

2be048f2cf3912 Matthieu Baerts (NGI0  2025-02-28  148) 
2be048f2cf3912 Matthieu Baerts (NGI0  2025-02-28  149) bool mptcp_remove_anno_list_by_saddr(struct mptcp_sock *msk,
2be048f2cf3912 Matthieu Baerts (NGI0  2025-02-28  150) 				     const struct mptcp_addr_info *addr)
2be048f2cf3912 Matthieu Baerts (NGI0  2025-02-28  151) {
2be048f2cf3912 Matthieu Baerts (NGI0  2025-02-28  152) 	struct mptcp_pm_add_entry *entry;
2be048f2cf3912 Matthieu Baerts (NGI0  2025-02-28  153) 
2be048f2cf3912 Matthieu Baerts (NGI0  2025-02-28  154) 	entry = mptcp_pm_del_add_timer(msk, addr, false);
2be048f2cf3912 Matthieu Baerts (NGI0  2025-02-28 @155) 	kfree(entry);
2be048f2cf3912 Matthieu Baerts (NGI0  2025-02-28 @156) 	return entry;
2be048f2cf3912 Matthieu Baerts (NGI0  2025-02-28  157) }
2be048f2cf3912 Matthieu Baerts (NGI0  2025-02-28  158) 

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
