Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B954532D0C6
	for <oe-kbuild@lists.linux.dev>; Wed,  5 Nov 2025 17:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762363289; cv=none; b=TQqFxo2VQapQStjh+2Zg9QraMjxmWs25wsb+gba8otVSsaJufMhlycZGUWBxltSt+f2Tl3etzyomuQZPg4QMrKU9uMEhW4JD9nUKLY+5GJ2l68qDMC0W7hsXtQTucmtHoC8ZDBMHY0NrLuCcUstJ3Mh9OdNzLzUVq/66Tf0Ua4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762363289; c=relaxed/simple;
	bh=R1Ual9MzgJsdMBh4X+jYcjGNG6EbAtdZ9KPN2AmfaPM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QqZ0GSHJaOYmtOx9TmY+yShrOKNWHFCiHnHYLYdHZEWXSSOV3RkRhMwBS40ayi4MqM/cMoviHTh+BjNsFEE9xYxw//HmrN0N9JioMvo/41waqq3YrddL08fZr926Mkdxh5aZwVSGC6PiWQVWzCZ40ni705etZKp1w2yQ26vyzp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Iuv3IzlF; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Iuv3IzlF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762363286; x=1793899286;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R1Ual9MzgJsdMBh4X+jYcjGNG6EbAtdZ9KPN2AmfaPM=;
  b=Iuv3IzlF0JLAMf60uQLXu65lFKCIgq0bGM7u2ViL7hC4cHVbcliu2J6k
   7rtr2L181Zm2IW922Vebangg4XshUUB9Ehwcb6wU0lXSelNiEgO7TLrQ3
   3qh04ikd/6DMhfWscD5hekCNL1wOEniJ/55hm1+GY99AlHQgAj1BWeWqw
   4a0Mr0KmTnfmkZEsqkHDeyKjR9hywjepnIXohBTWCyPyfBtlxRvT/3YWM
   82D/4LuROA3XL3qzf2CItmWmVr1lWjoUbJ0dLrzzUCG3pCY1tOeGjvObQ
   3icHD/+kJNTiFPCuOlPKw6i8bYehcMbYy3FZk4tJ0rGGtQUODk/YtrUpO
   g==;
X-CSE-ConnectionGUID: 3nUAkXGRRxqcwndCpoFieg==
X-CSE-MsgGUID: BneH/idWSO2yWJS9oVvJig==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="63691017"
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; 
   d="scan'208";a="63691017"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2025 09:21:25 -0800
X-CSE-ConnectionGUID: hnvw+T/OT/CI7/4VEWfNtw==
X-CSE-MsgGUID: m0CfkAMBT12BLOeL1LMuBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; 
   d="scan'208";a="192686509"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 05 Nov 2025 09:21:24 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGhAx-000SvM-0u;
	Wed, 05 Nov 2025 17:20:25 +0000
Date: Thu, 6 Nov 2025 01:16:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH net-next v6 3/6] net: devmem: prepare for autorelease rx
 token management
Message-ID: <202511060119.MAzcsLoN-lkp@intel.com>
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
In-Reply-To: <20251104-scratch-bobbyeshleman-devmem-tcp-token-upstream-v6-3-ea98cf4d40b3@meta.com>
References: <20251104-scratch-bobbyeshleman-devmem-tcp-token-upstream-v6-3-ea98cf4d40b3@meta.com>
TO: Bobby Eshleman <bobbyeshleman@gmail.com>
TO: "David S. Miller" <davem@davemloft.net>
CC: netdev@vger.kernel.org
TO: Eric Dumazet <edumazet@google.com>
TO: Jakub Kicinski <kuba@kernel.org>
TO: Paolo Abeni <pabeni@redhat.com>
TO: Simon Horman <horms@kernel.org>
TO: Kuniyuki Iwashima <kuniyu@google.com>
TO: Willem de Bruijn <willemb@google.com>
TO: Neal Cardwell <ncardwell@google.com>
TO: David Ahern <dsahern@kernel.org>
TO: Arnd Bergmann <arnd@arndb.de>
TO: Jonathan Corbet <corbet@lwn.net>
TO: Andrew Lunn <andrew+netdev@lunn.ch>
TO: Shuah Khan <skhan@linuxfoundation.org>
TO: Mina Almasry <almasrymina@google.com>
CC: linux-kernel@vger.kernel.org
CC: linux-arch@vger.kernel.org
CC: linux-doc@vger.kernel.org
CC: linux-kselftest@vger.kernel.org
CC: Stanislav Fomichev <sdf@fomichev.me>
CC: Bobby Eshleman <bobbyeshleman@meta.com>

Hi Bobby,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 255d75ef029f33f75fcf5015052b7302486f7ad2]

url:    https://github.com/intel-lab-lkp/linux/commits/Bobby-Eshleman/net-devmem-rename-tx_vec-to-vec-in-dmabuf-binding/20251105-092703
base:   255d75ef029f33f75fcf5015052b7302486f7ad2
patch link:    https://lore.kernel.org/r/20251104-scratch-bobbyeshleman-devmem-tcp-token-upstream-v6-3-ea98cf4d40b3%40meta.com
patch subject: [PATCH net-next v6 3/6] net: devmem: prepare for autorelease rx token management
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: openrisc-randconfig-r073-20251105 (https://download.01.org/0day-ci/archive/20251106/202511060119.MAzcsLoN-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 10.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511060119.MAzcsLoN-lkp@intel.com/

New smatch warnings:
net/core/sock.c:1107 sock_devmem_dontneed_manual_release() error: uninitialized symbol 'ret'.

Old smatch warnings:
net/core/sock.c:1114 sock_devmem_dontneed_manual_release() error: uninitialized symbol 'ret'.
net/core/sock.c:1118 sock_devmem_dontneed_manual_release() error: uninitialized symbol 'ret'.

vim +/ret +1107 net/core/sock.c

678f6e28b5f6fc Mina Almasry   2024-09-10  1085  
45aa39492cf4dd Bobby Eshleman 2025-11-04  1086  static noinline_for_stack int
45aa39492cf4dd Bobby Eshleman 2025-11-04  1087  sock_devmem_dontneed_manual_release(struct sock *sk, struct dmabuf_token *tokens,
45aa39492cf4dd Bobby Eshleman 2025-11-04  1088  				    unsigned int num_tokens)
45aa39492cf4dd Bobby Eshleman 2025-11-04  1089  {
45aa39492cf4dd Bobby Eshleman 2025-11-04  1090  	struct net_iov *niov;
45aa39492cf4dd Bobby Eshleman 2025-11-04  1091  	unsigned int i, j;
45aa39492cf4dd Bobby Eshleman 2025-11-04  1092  	netmem_ref netmem;
45aa39492cf4dd Bobby Eshleman 2025-11-04  1093  	unsigned int token;
45aa39492cf4dd Bobby Eshleman 2025-11-04  1094  	int num_frags = 0;
45aa39492cf4dd Bobby Eshleman 2025-11-04  1095  	int ret;
45aa39492cf4dd Bobby Eshleman 2025-11-04  1096  
45aa39492cf4dd Bobby Eshleman 2025-11-04  1097  	if (!sk->sk_devmem_info.binding)
45aa39492cf4dd Bobby Eshleman 2025-11-04  1098  		return -EINVAL;
45aa39492cf4dd Bobby Eshleman 2025-11-04  1099  
45aa39492cf4dd Bobby Eshleman 2025-11-04  1100  	for (i = 0; i < num_tokens; i++) {
45aa39492cf4dd Bobby Eshleman 2025-11-04  1101  		for (j = 0; j < tokens[i].token_count; j++) {
45aa39492cf4dd Bobby Eshleman 2025-11-04  1102  			token = tokens[i].token_start + j;
45aa39492cf4dd Bobby Eshleman 2025-11-04  1103  			if (token >= sk->sk_devmem_info.binding->dmabuf->size / PAGE_SIZE)
45aa39492cf4dd Bobby Eshleman 2025-11-04  1104  				break;
45aa39492cf4dd Bobby Eshleman 2025-11-04  1105  
45aa39492cf4dd Bobby Eshleman 2025-11-04  1106  			if (++num_frags > MAX_DONTNEED_FRAGS)
45aa39492cf4dd Bobby Eshleman 2025-11-04 @1107  				return ret;
45aa39492cf4dd Bobby Eshleman 2025-11-04  1108  
45aa39492cf4dd Bobby Eshleman 2025-11-04  1109  			niov = sk->sk_devmem_info.binding->vec[token];
45aa39492cf4dd Bobby Eshleman 2025-11-04  1110  			if (atomic_dec_and_test(&niov->uref)) {
45aa39492cf4dd Bobby Eshleman 2025-11-04  1111  				netmem = net_iov_to_netmem(niov);
45aa39492cf4dd Bobby Eshleman 2025-11-04  1112  				WARN_ON_ONCE(!napi_pp_put_page(netmem));
45aa39492cf4dd Bobby Eshleman 2025-11-04  1113  			}
45aa39492cf4dd Bobby Eshleman 2025-11-04  1114  			ret++;
45aa39492cf4dd Bobby Eshleman 2025-11-04  1115  		}
45aa39492cf4dd Bobby Eshleman 2025-11-04  1116  	}
45aa39492cf4dd Bobby Eshleman 2025-11-04  1117  
45aa39492cf4dd Bobby Eshleman 2025-11-04  1118  	atomic_sub(ret, &sk->sk_devmem_info.outstanding_urefs);
45aa39492cf4dd Bobby Eshleman 2025-11-04  1119  
45aa39492cf4dd Bobby Eshleman 2025-11-04  1120  	return ret;
45aa39492cf4dd Bobby Eshleman 2025-11-04  1121  }
45aa39492cf4dd Bobby Eshleman 2025-11-04  1122  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
