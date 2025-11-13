Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5908E1F2BAD
	for <oe-kbuild@lists.linux.dev>; Thu, 13 Nov 2025 17:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763053845; cv=none; b=aQ5We3JVRqeofGxRQ+pciI7mr1KZS8NMeAVxT57BRN123ZHO/xnJtzHFyYEh0qZeP4i84OiJzDqmrKM9l3Q7ACItUPsQe8AZYxXT3PLC3/lA4rADAbSu5difpQXZvgVVO0T48/XEYm/cK00v9eH2pEYMm+8ny23RVD/cPHBnSlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763053845; c=relaxed/simple;
	bh=IVT1e9aAG8+hpAJ/PlLA3b3fAEBtgrO22h8fdgW3/Ls=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mB686fERLAZX27BYVgtpjaviCGHqZ2G1WyLtwmXSrueraMQKZMRw0mzE97dApPWfdiWd+6e+L3WHgpWbukxvEhpb7rvks6jCfu81l8udLodWk590YRoePfL41ri/+v+G3LIu0KPKzxUq9D2+vuY+J2ZMHurpCPbcUAq13lozR8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NidPCd8v; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NidPCd8v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763053844; x=1794589844;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IVT1e9aAG8+hpAJ/PlLA3b3fAEBtgrO22h8fdgW3/Ls=;
  b=NidPCd8vhQ/J7w3+LnkrFLmkhjsz5/5NLzMBaZsXik4ReyDUWFKL3Mru
   kpeD23rv1Ojf50EjhJlc9GBQ5KiEGWrE1zkRq8PVpSqMt4xUSHmoo/zqX
   cvVm/VRbyVnWRyDP51j4dT/aq3OzTluvcuY64UiUO1QxAlWxssaKzaIwA
   WosWpcqnZ8m1VCBWullu2O5Z8/EL0I4CEbxuf5X6dzsFEPiIBMPX/HhmX
   uhJhBp9r6tsfg9v1NqZykZDmJdtCeHZgmti3ulizIfE+occ/bTO8O2Zjr
   VuQAI/vbqwdJ9z3jm76JswIB3cWeOM0+VKzVAYNrFnMpXbuORE/4JQWMA
   w==;
X-CSE-ConnectionGUID: ZUiYKl2zS+mwgdkBGxzH5A==
X-CSE-MsgGUID: 8vzSiCI+QQyP1ZGFbXtQPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="65079231"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="65079231"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 09:10:43 -0800
X-CSE-ConnectionGUID: BLa17TVLQr6xcka9PHECpw==
X-CSE-MsgGUID: pMHDZ7RfQhCKQfemyr7fiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; 
   d="scan'208";a="194542229"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 13 Nov 2025 09:10:40 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJaqF-0005dn-1Q;
	Thu, 13 Nov 2025 17:10:39 +0000
Date: Fri, 14 Nov 2025 01:09:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH net-next v4 02/14] net: skb: use dstref for storing dst
 entry
Message-ID: <202511140040.OyZYHGcM-lkp@intel.com>
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
In-Reply-To: <20251112072720.5076-3-mmietus97@yahoo.com>
References: <20251112072720.5076-3-mmietus97@yahoo.com>
TO: Marek Mietus <mmietus97@yahoo.com>
TO: netdev@vger.kernel.org
TO: sd@queasysnail.net
TO: kuba@kernel.org
CC: Marek Mietus <mmietus97@yahoo.com>

Hi Marek,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Marek-Mietus/net-dst-implement-dstref-object/20251112-154653
base:   net-next/main
patch link:    https://lore.kernel.org/r/20251112072720.5076-3-mmietus97%40yahoo.com
patch subject: [PATCH net-next v4 02/14] net: skb: use dstref for storing dst entry
:::::: branch date: 33 hours ago
:::::: commit date: 33 hours ago
config: i386-randconfig-141-20251113 (https://download.01.org/0day-ci/archive/20251114/202511140040.OyZYHGcM-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511140040.OyZYHGcM-lkp@intel.com/

smatch warnings:
include/net/dst_metadata.h:111 skb_metadata_dst_cmp() error: we previously assumed 'a' could be null (see line 108)

vim +/a +111 include/net/dst_metadata.h

f38a9eb1f77b29 Thomas Graf    2015-07-21   99  
ce87fc6ce3f9f4 Jesse Gross    2016-01-20  100  static inline int skb_metadata_dst_cmp(const struct sk_buff *skb_a,
ce87fc6ce3f9f4 Jesse Gross    2016-01-20  101  				       const struct sk_buff *skb_b)
ce87fc6ce3f9f4 Jesse Gross    2016-01-20  102  {
ce87fc6ce3f9f4 Jesse Gross    2016-01-20  103  	const struct metadata_dst *a, *b;
ce87fc6ce3f9f4 Jesse Gross    2016-01-20  104  
ce87fc6ce3f9f4 Jesse Gross    2016-01-20  105  	a = (const struct metadata_dst *) skb_dst(skb_a);
ce87fc6ce3f9f4 Jesse Gross    2016-01-20  106  	b = (const struct metadata_dst *) skb_dst(skb_b);
ce87fc6ce3f9f4 Jesse Gross    2016-01-20  107  
24caf75770069f Marek Mietus   2025-11-12 @108  	if (!a && !b)
24caf75770069f Marek Mietus   2025-11-12  109  		return 0;
24caf75770069f Marek Mietus   2025-11-12  110  
3fcece12bc1b6d Jakub Kicinski 2017-06-23 @111  	if (!a != !b || a->type != b->type)
ce87fc6ce3f9f4 Jesse Gross    2016-01-20  112  		return 1;
ce87fc6ce3f9f4 Jesse Gross    2016-01-20  113  
3fcece12bc1b6d Jakub Kicinski 2017-06-23  114  	switch (a->type) {
3fcece12bc1b6d Jakub Kicinski 2017-06-23  115  	case METADATA_HW_PORT_MUX:
3fcece12bc1b6d Jakub Kicinski 2017-06-23  116  		return memcmp(&a->u.port_info, &b->u.port_info,
3fcece12bc1b6d Jakub Kicinski 2017-06-23  117  			      sizeof(a->u.port_info));
3fcece12bc1b6d Jakub Kicinski 2017-06-23  118  	case METADATA_IP_TUNNEL:
ce87fc6ce3f9f4 Jesse Gross    2016-01-20  119  		return memcmp(&a->u.tun_info, &b->u.tun_info,
3fcece12bc1b6d Jakub Kicinski 2017-06-23  120  			      sizeof(a->u.tun_info) +
3fcece12bc1b6d Jakub Kicinski 2017-06-23  121  					 a->u.tun_info.options_len);
0a28bfd4971fd5 Lior Nahmanson 2022-09-05  122  	case METADATA_MACSEC:
0a28bfd4971fd5 Lior Nahmanson 2022-09-05  123  		return memcmp(&a->u.macsec_info, &b->u.macsec_info,
0a28bfd4971fd5 Lior Nahmanson 2022-09-05  124  			      sizeof(a->u.macsec_info));
5182a5d48c3d19 Eyal Birger    2022-08-26  125  	case METADATA_XFRM:
5182a5d48c3d19 Eyal Birger    2022-08-26  126  		return memcmp(&a->u.xfrm_info, &b->u.xfrm_info,
5182a5d48c3d19 Eyal Birger    2022-08-26  127  			      sizeof(a->u.xfrm_info));
3fcece12bc1b6d Jakub Kicinski 2017-06-23  128  	default:
3fcece12bc1b6d Jakub Kicinski 2017-06-23  129  		return 1;
3fcece12bc1b6d Jakub Kicinski 2017-06-23  130  	}
ce87fc6ce3f9f4 Jesse Gross    2016-01-20  131  }
ce87fc6ce3f9f4 Jesse Gross    2016-01-20  132  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
