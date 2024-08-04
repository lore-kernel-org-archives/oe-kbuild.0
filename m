Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A8A2FB6
	for <oe-kbuild@lists.linux.dev>; Sun,  4 Aug 2024 19:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722798471; cv=none; b=HlQmFzv9Aq2r87zMnqMFoWA7m1LWUCSY4LTxVrpGKmRA6OlyiBU7N9VGOgUsligCGJZw4gG3yon4mQakrM/IZq3KQ7riPBz040dp8oWGgzi7/U9F+rBQc+tGDTXrW8Rw2KttqHn9blwhBhkRyW2lALAC2q+bPaAdxAYKCe2tWNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722798471; c=relaxed/simple;
	bh=H1WovkVNL9PBtG379ZvBzUK6xvKXwh28pRNkEEBa8zk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KkoxtxKOUCgU2p3o8f2aVrCTBXNwUD3XE8bp2JIFDJxLhkxEOjwI2CBs9ihs9TSUrZ7lkoscBk1/4PwPOU46MtMiFLLeU1OzcAo7QW0dWtziOsanjlKfblg9SZoeUFaHqyMjX+fKq7Ud7RFmzIj9bGArIaWFYnFe+H/80TMTEL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l3mWwiJF; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l3mWwiJF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722798469; x=1754334469;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=H1WovkVNL9PBtG379ZvBzUK6xvKXwh28pRNkEEBa8zk=;
  b=l3mWwiJFdK3qCqouSdSRDMTEcLRTYPhIYzPLNHPeZ5PftyvLCm395jbS
   Q9lnb4jd6xrdQmAc5av1yqAeCMsB+jlluRHRa4VVdzenRTeZNTvMdgEGP
   hRa1/hVE1bmvgrDRtNmR9vi3zqdBVkKuKCRYNDZ4E47tPHh5F9+yt7Nvi
   I8qRChnbS+o9Aa0ROSQYE8EoKHtxx0/hj25bsDF37zjpHNhpduqAVH9Wr
   jAHd+fA+4De3ZaUvwQUCDn+VhzZ/RxCt7MJ32wuH7/4Ausl55fncVNKq3
   GLWVDSDIkpGF/TA715zOabtS7kOYc3bdite15pS77l2rSaFCcVQ+y3Xgq
   Q==;
X-CSE-ConnectionGUID: kbymJoN4TL+23mE1vprEsw==
X-CSE-MsgGUID: 7mVwDF9MRSqjR4NZ/Yfpyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11154"; a="31381172"
X-IronPort-AV: E=Sophos;i="6.09,263,1716274800"; 
   d="scan'208";a="31381172"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2024 12:07:48 -0700
X-CSE-ConnectionGUID: UmlGtoRIRju8LSW5YZxxNg==
X-CSE-MsgGUID: fdBfKaRMSCqHiJWf7sX/mA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,263,1716274800"; 
   d="scan'208";a="56535017"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 04 Aug 2024 12:07:47 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sagZK-0001Zk-1u;
	Sun, 04 Aug 2024 19:07:31 +0000
Date: Mon, 5 Aug 2024 03:06:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH net-next v12 12/14] net: replace page_frag with
 page_frag_cache
Message-ID: <202408050228.OJxccmC0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20240731124505.2903877-13-linyunsheng@huawei.com>
References: <20240731124505.2903877-13-linyunsheng@huawei.com>
TO: Yunsheng Lin <linyunsheng@huawei.com>

Hi Yunsheng,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Yunsheng-Lin/mm-page_frag-add-a-test-module-for-page_frag/20240802-044917
base:   net-next/main
patch link:    https://lore.kernel.org/r/20240731124505.2903877-13-linyunsheng%40huawei.com
patch subject: [PATCH net-next v12 12/14] net: replace page_frag with page_frag_cache
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: loongarch-randconfig-001-20240804 (https://download.01.org/0day-ci/archive/20240805/202408050228.OJxccmC0-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240805/202408050228.OJxccmC0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408050228.OJxccmC0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/tls/tls_device.o: warning: objtool: tls_append_frag+0xa8: unreachable instruction
   net/tls/tls_device.o: warning: objtool: sg_assign_page+0x48: unreachable instruction
--
>> net/kcm/kcmsock.o: warning: objtool: kcm_sendmsg+0x5ec: unreachable instruction
--
>> net/ipv4/tcp.o: warning: objtool: tcp_sendmsg_locked+0x900: unreachable instruction
--
   net/core/skmsg.o: warning: objtool: sg_assign_page+0x48: unreachable instruction
>> net/core/skmsg.o: warning: objtool: sk_msg_alloc+0x234: unreachable instruction
--
   net/core/skbuff.o: warning: objtool: sg_assign_page+0x48: unreachable instruction
>> net/core/skbuff.o: warning: objtool: spd_fill_linear_page+0x1b8: unreachable instruction
   net/core/skbuff.o: warning: objtool: __skb_to_sgvec+0xc4: unreachable instruction
   net/core/skbuff.o: warning: objtool: skb_put+0x54: unreachable instruction
   net/core/skbuff.o: warning: objtool: pskb_expand_head+0x68: unreachable instruction
   net/core/skbuff.o: warning: objtool: skb_segment+0x5bc: unreachable instruction
   net/core/skbuff.o: warning: objtool: skb_shift+0x5c: unreachable instruction
--
>> net/core/sock.o: warning: objtool: skb_page_frag_refill+0xe8: unreachable instruction


objdump-func vmlinux.o tls_append_frag:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
