Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D13349CF4D
	for <oe-kbuild@lists.linux.dev>; Fri, 18 Sep 2026 11:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789729982; cv=none; b=aUumY3yhbrVi2iWNU0iC9711MfL7t9ZZQbfuubq2EgWltz3+mGtv4Yvmdeemwey9TKUldp7VNu9s6BN7Nrf1+KlaVDJZJPm3KZlTbVt5hCxHDPqJRsYVTneTQ4/bv4m4rJBW6t5n6VUw7uoiiNIhAz/rqSI9JNpJDx6qeGgWVYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789729982; c=relaxed/simple;
	bh=S+eVJa+mWlSoHcQ+BsmppH0MPO/wAm8WAcV5wxW13/s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZW1oKZFtl+z+2CAojsv7kwbhMdTddijFIwVR6v7Su5d9h+Yq2xYWvi5sbi/nnPJz2I7+c3qes8O0lj9fp1XquP5xsTwv9VTKeCUikZf5YUJr1ugnLczJLGNHdOEvSLk/qEgyo3MEwFEhSs60AxuK00u9kqq53nAWe6olpZyED+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c4E6Z0SO; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c4E6Z0SO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789729980; x=1821265980;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S+eVJa+mWlSoHcQ+BsmppH0MPO/wAm8WAcV5wxW13/s=;
  b=c4E6Z0SONM46zCo1CpaGCmVLFjPgC3oO9FG8gaytPjNKh2bpsIgtIYnA
   dSvvj3mkho/nDUJKhDrUt1d3sJJ/T2xSw+hPIstKY+QdUBnjgftumc+08
   cxMREKicrDFUe/iCU1QkxOLsPja/yPrOt+l8dG20+R7e71fG9e16NH/B7
   uZrIHuD0wkYb7+qwRJzkWL5dX9PdXdM+k3TzcvQztDK8n6jjKkAfL4N7j
   cQDeohygnxqhd2YOBqsvHFkBVSFoL5G96QJXDwysMh2fUER1pgxXnDuPc
   Sk09G5/5fNjpMr2MjK6D/qdL7hFoSZM6CMITxceEQI2+z2ndDncw6+LlE
   Q==;
X-CSE-ConnectionGUID: XOEebfbaRmGSx2CBWQh8Bw==
X-CSE-MsgGUID: jBCnuQVkQvyCVpKakxv6Mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11908"; a="89160428"
X-IronPort-AV: E=Sophos;i="6.27,108,1787036400"; 
   d="scan'208";a="89160428"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 04:12:59 -0700
X-CSE-ConnectionGUID: qOsMV1aCRQGF7XMs95h3dw==
X-CSE-MsgGUID: FlqZudMaQQqQzdTSDTNiiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,108,1787036400"; 
   d="scan'208";a="2771273"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa013.fm.intel.com with ESMTP; 18 Sep 2026 04:12:59 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7WWV-000000009gH-3ogq;
	Fri, 18 Sep 2026 11:12:55 +0000
Date: Fri, 18 Sep 2026 19:12:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH net v2 1/1] net: gso: limit recursive IP-in-IP
 segmentation
Message-ID: <202609181814.iLdC7fhe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: include/net/gso.h:35:13: sparse: sparse: unsigned value that used to be signed checked against zero?"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <33280f6e07bccaaeef2c70f1754017e9517f5aa5.1789618203.git.zihanx@nebusec.ai>
References: <33280f6e07bccaaeef2c70f1754017e9517f5aa5.1789618203.git.zihanx@nebusec.ai>
TO: Zihan Xi <zihanx@nebusec.ai>
TO: netdev@vger.kernel.org
CC: zihanx@nebusec.ai
CC: davem@davemloft.net
CC: edumazet@google.com
CC: kuba@kernel.org
CC: pabeni@redhat.com
CC: horms@kernel.org
CC: steffen.klassert@secunet.com
CC: herbert@gondor.apana.org.au
CC: dsahern@kernel.org
CC: idosch@nvidia.com
CC: linux-kernel@vger.kernel.org
CC: stable@vger.kernel.org

Hi Zihan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net/main]
[also build test WARNING on klassert-ipsec-next/master klassert-ipsec/master net-next/main linus/master v7.3-rc3 next-20260916]
[cannot apply to linux-review/Zihan-Xi/net-gso-limit-recursive-IP-in-IP-segmentation/20260913-141212]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zihan-Xi/net-gso-limit-recursive-IP-in-IP-segmentation/20260917-160041
base:   net/main
patch link:    https://lore.kernel.org/r/33280f6e07bccaaeef2c70f1754017e9517f5aa5.1789618203.git.zihanx%40nebusec.ai
patch subject: [PATCH net v2 1/1] net: gso: limit recursive IP-in-IP segmentation
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: sh-randconfig-r1307-20260918 (https://download.01.org/0day-ci/archive/20260918/202609181814.iLdC7fhe-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.1.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260918/202609181814.iLdC7fhe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609181814.iLdC7fhe-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   net/ipv6/ip6_offload.c: note: in included file (through include/net/udp.h):
>> include/net/gso.h:35:13: sparse: sparse: unsigned value that used to be signed checked against zero?
   include/net/gso.h:35:13: sparse: signed value source
>> include/net/gso.h:35:13: sparse: sparse: unsigned value that used to be signed checked against zero?
   include/net/gso.h:35:13: sparse: signed value source

vim +35 include/net/gso.h

16f1d23d914a29 Zihan Xi 2026-09-17  29  
16f1d23d914a29 Zihan Xi 2026-09-17  30  static inline bool gso_header_len_add(struct sk_buff *skb,
16f1d23d914a29 Zihan Xi 2026-09-17  31  				      unsigned int len)
16f1d23d914a29 Zihan Xi 2026-09-17  32  {
16f1d23d914a29 Zihan Xi 2026-09-17  33  	struct skb_gso_cb *cb = SKB_GSO_CB(skb);
16f1d23d914a29 Zihan Xi 2026-09-17  34  
16f1d23d914a29 Zihan Xi 2026-09-17 @35  	if (unlikely(cb->gso_header_len > GSO_MAX_HEADER ||
16f1d23d914a29 Zihan Xi 2026-09-17  36  		     len > GSO_MAX_HEADER - cb->gso_header_len))
16f1d23d914a29 Zihan Xi 2026-09-17  37  		return true;
16f1d23d914a29 Zihan Xi 2026-09-17  38  
16f1d23d914a29 Zihan Xi 2026-09-17  39  	cb->gso_header_len += len;
16f1d23d914a29 Zihan Xi 2026-09-17  40  	return false;
16f1d23d914a29 Zihan Xi 2026-09-17  41  }
16f1d23d914a29 Zihan Xi 2026-09-17  42  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
