Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6A1381A4
	for <oe-kbuild@lists.linux.dev>; Sat, 18 May 2024 13:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716038299; cv=none; b=lqyOyzzxjIQxzMF5F3thdRkuUwv9zcv9oz7sMnA+4I2fECyPKAgBASgHsZhyQgBvRcC2/jg9e/3tuBW0slplh0h43jmL8g3oOr0cWma+attzQlRUxmczF0NkZKmcqTQaRZjO4pB/aYfY5FmlHVe512f2CGxNmo3ogOprRK3djVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716038299; c=relaxed/simple;
	bh=apgJTypyencLAI1OHiVFoFNB6xgs3EyClO/25pfJGIU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ikvp7hUi06oPAqwPBbsTXHZVghLasmw4P8gHeVmIKyrNNy6H/3uYqTcJTXE1TKuZKaTdlQRJcyJqPWZQ3w+6sxQAeDKOpz7SZ6dt3jBVBZ3PZPorEHCY/h+NFnPS+riIyytdyWoPfcKCLD9aVKeVvq44I8KK/1dlb5nhrjJCCRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aGnlVuQc; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aGnlVuQc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716038297; x=1747574297;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=apgJTypyencLAI1OHiVFoFNB6xgs3EyClO/25pfJGIU=;
  b=aGnlVuQcbCjxf/3GfO8BLZ7eoGSPt2nYwL/v74Z7t32e2SViZtGUnhkj
   7+gfO/XfOXxsY2WMjWIEhW2MEV+AkuBJGk5+WXDtQIshAzAEW91XliVq3
   oKmI+X8ftYLcxqrS6PZjKaUyVNLpeQy0Kw5Xe8Eq2bquqEJyHQm1ZHD+N
   XbWA76V2XzvyF6a+ZUDU47uFAFYCuPwFIMMn82xSyiKa0g+ByTY8IfoPc
   lH6jCGeeTmEZGnVHSXVmx+qHqL6O9y0OAy9UvuxHsuDaIHXkKwbYaUhuU
   C+UPftZcBlU6UsZzv9oghtFIPeiNv5jvHqERyZXWGynakvBQiP3PTtf/2
   A==;
X-CSE-ConnectionGUID: WzPIJOGqSIyKkgWQsRl7jg==
X-CSE-MsgGUID: 5N5Ai8/rTWO1fm3piW77Lg==
X-IronPort-AV: E=McAfee;i="6600,9927,11075"; a="16047490"
X-IronPort-AV: E=Sophos;i="6.08,170,1712646000"; 
   d="scan'208";a="16047490"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2024 06:18:17 -0700
X-CSE-ConnectionGUID: CnU72cidS+CMOxok4shniw==
X-CSE-MsgGUID: TSbsyUIASfakPKma7Lnhzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,170,1712646000"; 
   d="scan'208";a="62908117"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 18 May 2024 06:18:15 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s8Jwz-0002Em-0O;
	Sat, 18 May 2024 13:18:13 +0000
Date: Sat, 18 May 2024 21:17:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH net-next] icmp: Add icmp_timestamp_ignore_all to control
 ICMP_TIMESTAMP
Message-ID: <202405182044.rqfrmEqo-lkp@intel.com>
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
In-Reply-To: <20240517172639229ec5bN7VBV7SGEHkSK5K6f@zte.com.cn>
References: <20240517172639229ec5bN7VBV7SGEHkSK5K6f@zte.com.cn>
TO: ye.xingchen@zte.com.cn
TO: davem@davemloft.net
CC: edumazet@google.com
CC: kuba@kernel.org
CC: pabeni@redhat.com
CC: corbet@lwn.net
CC: dsahern@kernel.org
CC: ncardwell@google.com
CC: soheil@google.com
CC: mfreemon@cloudflare.com
CC: lixiaoyan@google.com
CC: david.laight@aculab.com
CC: haiyangz@microsoft.com
CC: ye.xingchen@zte.com.cn
CC: netdev@vger.kernel.org
CC: linux-doc@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: xu.xin16@zte.com.cn
CC: zhang.yunkai@zte.com.cn
CC: fan.yu9@zte.com.cn

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/ye-xingchen-zte-com-cn/icmp-Add-icmp_timestamp_ignore_all-to-control-ICMP_TIMESTAMP/20240517-172903
base:   net-next/main
patch link:    https://lore.kernel.org/r/20240517172639229ec5bN7VBV7SGEHkSK5K6f%40zte.com.cn
patch subject: [PATCH net-next] icmp: Add icmp_timestamp_ignore_all to control ICMP_TIMESTAMP
:::::: branch date: 28 hours ago
:::::: commit date: 28 hours ago
config: sparc64-randconfig-r081-20240518 (https://download.01.org/0day-ci/archive/20240518/202405182044.rqfrmEqo-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202405182044.rqfrmEqo-lkp@intel.com/

smatch warnings:
net/ipv4/icmp.c:1157 icmp_timestamp() error: uninitialized symbol 'net'.

vim +/net +1157 net/ipv4/icmp.c

^1da177e4c3f41 Linus Torvalds           2005-04-16  1144  
^1da177e4c3f41 Linus Torvalds           2005-04-16  1145  /*
^1da177e4c3f41 Linus Torvalds           2005-04-16  1146   *	Handle ICMP Timestamp requests.
^1da177e4c3f41 Linus Torvalds           2005-04-16  1147   *	RFC 1122: 3.2.2.8 MAY implement ICMP timestamp requests.
^1da177e4c3f41 Linus Torvalds           2005-04-16  1148   *		  SHOULD be in the kernel for minimum random latency.
^1da177e4c3f41 Linus Torvalds           2005-04-16  1149   *		  MUST be accurate to a few minutes.
^1da177e4c3f41 Linus Torvalds           2005-04-16  1150   *		  MUST be updated at least at 15Hz.
^1da177e4c3f41 Linus Torvalds           2005-04-16  1151   */
b384c95a861eeb Menglong Dong            2022-04-07  1152  static enum skb_drop_reason icmp_timestamp(struct sk_buff *skb)
^1da177e4c3f41 Linus Torvalds           2005-04-16  1153  {
^1da177e4c3f41 Linus Torvalds           2005-04-16  1154  	struct icmp_bxm icmp_param;
0a992a998f6531 YeXingchen               2024-05-17  1155  	struct net *net;
0a992a998f6531 YeXingchen               2024-05-17  1156  
0a992a998f6531 YeXingchen               2024-05-17 @1157  	if (READ_ONCE(net->ipv4.sysctl_icmp_timestamp_ignore_all))
0a992a998f6531 YeXingchen               2024-05-17  1158  		return SKB_NOT_DROPPED_YET;
0a992a998f6531 YeXingchen               2024-05-17  1159  
^1da177e4c3f41 Linus Torvalds           2005-04-16  1160  	/*
^1da177e4c3f41 Linus Torvalds           2005-04-16  1161  	 *	Too short.
^1da177e4c3f41 Linus Torvalds           2005-04-16  1162  	 */
^1da177e4c3f41 Linus Torvalds           2005-04-16  1163  	if (skb->len < 4)
^1da177e4c3f41 Linus Torvalds           2005-04-16  1164  		goto out_err;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1165  
^1da177e4c3f41 Linus Torvalds           2005-04-16  1166  	/*
^1da177e4c3f41 Linus Torvalds           2005-04-16  1167  	 *	Fill in the current time as ms since midnight UT:
^1da177e4c3f41 Linus Torvalds           2005-04-16  1168  	 */
822c868532cae2 Deepa Dinamani           2016-02-27  1169  	icmp_param.data.times[1] = inet_current_timestamp();
^1da177e4c3f41 Linus Torvalds           2005-04-16  1170  	icmp_param.data.times[2] = icmp_param.data.times[1];
152854025528b3 Gustavo A. R. Silva      2017-10-23  1171  
152854025528b3 Gustavo A. R. Silva      2017-10-23  1172  	BUG_ON(skb_copy_bits(skb, 0, &icmp_param.data.times[0], 4));
152854025528b3 Gustavo A. R. Silva      2017-10-23  1173  
88c7664f13bd1a Arnaldo Carvalho de Melo 2007-03-13  1174  	icmp_param.data.icmph	   = *icmp_hdr(skb);
^1da177e4c3f41 Linus Torvalds           2005-04-16  1175  	icmp_param.data.icmph.type = ICMP_TIMESTAMPREPLY;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1176  	icmp_param.data.icmph.code = 0;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1177  	icmp_param.skb		   = skb;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1178  	icmp_param.offset	   = 0;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1179  	icmp_param.data_len	   = 0;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1180  	icmp_param.head_len	   = sizeof(struct icmphdr) + 12;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1181  	icmp_reply(&icmp_param, skb);
b384c95a861eeb Menglong Dong            2022-04-07  1182  	return SKB_NOT_DROPPED_YET;
e3e3217029a35c Rick Jones               2014-11-17  1183  
^1da177e4c3f41 Linus Torvalds           2005-04-16  1184  out_err:
5d3848bc33b7d1 Eric Dumazet             2016-04-27  1185  	__ICMP_INC_STATS(dev_net(skb_dst(skb)->dev), ICMP_MIB_INERRORS);
b384c95a861eeb Menglong Dong            2022-04-07  1186  	return SKB_DROP_REASON_PKT_TOO_SMALL;
^1da177e4c3f41 Linus Torvalds           2005-04-16  1187  }
^1da177e4c3f41 Linus Torvalds           2005-04-16  1188  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
