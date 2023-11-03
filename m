Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ABD921342
	for <oe-kbuild@lists.linux.dev>; Fri,  3 Nov 2023 18:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i6EmOxdC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699034615; x=1730570615;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2Z5jTL7qpQS+wFr/IMsNZT1sL+KfP4pZGvCfVVuMV3g=;
  b=i6EmOxdCsn4DZKGcDo2SZv0/wj+VW29KiZ86hHWdrTzJtGZHDRxRxLUN
   Eat8FOTmR7227FiOuXKgt3Hs1cs1WyKtyp3EP7pHDhTZnFqwAaaWVuk0m
   yYjn1CY4eZotHfL2mIyV6EoJMjh5yHd5KIjMyQm9Duzl34j89slu3OCzH
   3ULU81awDzJJXVLq9Dz5Ws8imIRDVp8bEhqPOnoSgzqqdq6aDOXU9Jwgf
   h0QnzCbLULMp4qWtzs1/zpkGH888o0Yz5Peq+CWiWoMUO4pm0WmIGfENz
   1fk0KrXU0ecccrWI3CnXlHGYhx/+eUOAhgdUDLhcfLZ3aX3B69B3mPECo
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="453289438"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="453289438"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 11:03:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="905421388"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="905421388"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 03 Nov 2023 11:03:32 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qyyW2-0002nQ-1d;
	Fri, 03 Nov 2023 18:03:30 +0000
Date: Sat, 4 Nov 2023 02:03:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: net/mptcp/sockopt.c:1195 mptcp_get_full_info() warn: check for
 integer overflow 'len'
Message-ID: <202311040121.xVYaI2yY-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Paolo Abeni <pabeni@redhat.com>
CC: mptcp@lists.linux.dev
CC: matthieu.baerts@tessares.net
CC: Jakub Kicinski <kuba@kernel.org>
CC: Matthieu Baerts <matthieu.baerts@tessares.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8f6f76a6a29f36d2f3e4510d0bde5046672f6924
commit: 492432074e4fce4f8880213bf009b47adbf94a3a mptcp: introduce MPTCP_FULL_INFO getsockopt
date:   5 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 5 months ago
config: i386-randconfig-141-20231101 (https://download.01.org/0day-ci/archive/20231104/202311040121.xVYaI2yY-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231104/202311040121.xVYaI2yY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311040121.xVYaI2yY-lkp@intel.com/

New smatch warnings:
net/mptcp/sockopt.c:1195 mptcp_get_full_info() warn: check for integer overflow 'len'

Old smatch warnings:
net/mptcp/sockopt.c:1019 mptcp_get_subflow_data() warn: check for integer overflow 'len'

vim +/len +1195 net/mptcp/sockopt.c

c11c5906bc0aba Florian Westphal 2021-09-17  1166  
492432074e4fce Paolo Abeni      2023-06-20  1167  static int mptcp_get_full_info(struct mptcp_full_info *mfi,
492432074e4fce Paolo Abeni      2023-06-20  1168  			       char __user *optval,
492432074e4fce Paolo Abeni      2023-06-20  1169  			       int __user *optlen)
492432074e4fce Paolo Abeni      2023-06-20  1170  {
492432074e4fce Paolo Abeni      2023-06-20  1171  	int len;
492432074e4fce Paolo Abeni      2023-06-20  1172  
492432074e4fce Paolo Abeni      2023-06-20  1173  	BUILD_BUG_ON(offsetof(struct mptcp_full_info, mptcp_info) !=
492432074e4fce Paolo Abeni      2023-06-20  1174  		     MIN_FULL_INFO_OPTLEN_SIZE);
492432074e4fce Paolo Abeni      2023-06-20  1175  
492432074e4fce Paolo Abeni      2023-06-20  1176  	if (get_user(len, optlen))
492432074e4fce Paolo Abeni      2023-06-20  1177  		return -EFAULT;
492432074e4fce Paolo Abeni      2023-06-20  1178  
492432074e4fce Paolo Abeni      2023-06-20  1179  	if (len < MIN_FULL_INFO_OPTLEN_SIZE)
492432074e4fce Paolo Abeni      2023-06-20  1180  		return -EINVAL;
492432074e4fce Paolo Abeni      2023-06-20  1181  
492432074e4fce Paolo Abeni      2023-06-20  1182  	memset(mfi, 0, sizeof(*mfi));
492432074e4fce Paolo Abeni      2023-06-20  1183  	if (copy_from_user(mfi, optval, MIN_FULL_INFO_OPTLEN_SIZE))
492432074e4fce Paolo Abeni      2023-06-20  1184  		return -EFAULT;
492432074e4fce Paolo Abeni      2023-06-20  1185  
492432074e4fce Paolo Abeni      2023-06-20  1186  	if (mfi->size_tcpinfo_kernel ||
492432074e4fce Paolo Abeni      2023-06-20  1187  	    mfi->size_sfinfo_kernel ||
492432074e4fce Paolo Abeni      2023-06-20  1188  	    mfi->num_subflows)
492432074e4fce Paolo Abeni      2023-06-20  1189  		return -EINVAL;
492432074e4fce Paolo Abeni      2023-06-20  1190  
492432074e4fce Paolo Abeni      2023-06-20  1191  	if (mfi->size_sfinfo_user > INT_MAX ||
492432074e4fce Paolo Abeni      2023-06-20  1192  	    mfi->size_tcpinfo_user > INT_MAX)
492432074e4fce Paolo Abeni      2023-06-20  1193  		return -EINVAL;
492432074e4fce Paolo Abeni      2023-06-20  1194  
492432074e4fce Paolo Abeni      2023-06-20 @1195  	return len - MIN_FULL_INFO_OPTLEN_SIZE;
492432074e4fce Paolo Abeni      2023-06-20  1196  }
492432074e4fce Paolo Abeni      2023-06-20  1197  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
