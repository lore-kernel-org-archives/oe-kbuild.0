Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE77B64A
	for <oe-kbuild@lists.linux.dev>; Sun, 20 Oct 2024 19:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729450933; cv=none; b=B2b7DnnnJQiBXFXg8zONGGKM+uve5e93Nsoh28MJ2EEoMXs5rYbp29Bzv03yVtF1z6DK6wvFDFh+FLCmWqWlnOQH4e1lFsTSb6KfsV1Cu/AVQgqv+XjPFemrMMnY0xJmeejBD/MaH/EpSxTQLMMDLVoPYq4jGmMnevMr4GHB7jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729450933; c=relaxed/simple;
	bh=l45PhybdpLIj3VyTXw8MupXcTPH5fK9XPn/D/ZuQNGg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mmg4uUJ0l7nkg5viBmmsLvEqk9T51bDRLJbIrU2XAF/g6tsegzW84+B1hVhW6YTkESLdXrYN/b0nLnGFrTNCIAw91y6goEhFXBQJqB/5NJpGXPcsiYNbgygkhL/ef/bovNlzoV5p4pr9SyXsE+jYW5hGZHeMzulZMKJwaZt3T6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QScFlX65; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QScFlX65"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729450930; x=1760986930;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l45PhybdpLIj3VyTXw8MupXcTPH5fK9XPn/D/ZuQNGg=;
  b=QScFlX65yeRykB6rk0o7e2vV6O+qsGSUO+kgar3+fF0OC4iQEUFYmBsB
   yE7Y14awj75SBOcueJC/IT66JnJUyYFLGAtbXyph6V3+P+lGE0mIoQygY
   EPZcOmfygU2rXLk1Z6lfkZpTYWcbSldmOYKiNdt8kvPgra2uu3qF3IYJY
   lnmWnui1Dh1qqxtMDkK/6gDou+mPwts0tXSPKRS0hNDuQEj+teAwIpRoS
   4DAmL7xhaoyijS90Hk8UiZB8tw/YfOQorzV1y0IlsY2Pkx3Ic2L8R35IJ
   YW+FaoZuwuyy9tTCbHQ+UF3Px2GnEt//c9Ec0Wk8DO6HlKRDvgsPs4o9F
   Q==;
X-CSE-ConnectionGUID: EV6MgFBxTjG5c+Cn1QxcpQ==
X-CSE-MsgGUID: Lh14QlkgQNSm3L8Y6nURsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11231"; a="39552314"
X-IronPort-AV: E=Sophos;i="6.11,219,1725346800"; 
   d="scan'208";a="39552314"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2024 12:02:10 -0700
X-CSE-ConnectionGUID: NRIyaGsOT1+TD1bJ9zthIg==
X-CSE-MsgGUID: p54xs0ABRKyyv546elEMQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,219,1725346800"; 
   d="scan'208";a="102640633"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 20 Oct 2024 12:02:08 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2bBm-000Qhp-06;
	Sun, 20 Oct 2024 19:02:06 +0000
Date: Mon, 21 Oct 2024 03:01:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: net/ipv4/tcp_ao.c:2238 tcp_ao_copy_mkts_to_user() error:
 __builtin_memcpy() '&key->addr' too small (4 vs 16)
Message-ID: <202410210236.Wy4T7UCb-lkp@intel.com>
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
TO: Andrey Konovalov <andreyknvl@gmail.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Marco Elver <elver@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   715ca9dd687f89ddaac8ec8ccb3b5e5a30311a99
commit: 2e577732e8d28b9183df701fb90cb7943aa4ed16 kasan, fortify: properly rename memintrinsics
date:   5 months ago
:::::: branch date: 19 hours ago
:::::: commit date: 5 months ago
config: x86_64-randconfig-161-20241020 (https://download.01.org/0day-ci/archive/20241021/202410210236.Wy4T7UCb-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410210236.Wy4T7UCb-lkp@intel.com/

New smatch warnings:
net/ipv4/tcp_ao.c:2238 tcp_ao_copy_mkts_to_user() error: __builtin_memcpy() '&key->addr' too small (4 vs 16)

Old smatch warnings:
net/ipv4/tcp_ao.c:1886 tcp_ao_del_cmd() error: memcmp() '&key->addr' too small (4 vs 16)

vim +2238 net/ipv4/tcp_ao.c

4954f17ddefc51 Dmitry Safonov 2023-10-23  2040  
ef84703a911f4e Dmitry Safonov 2023-10-23  2041  /* tcp_ao_copy_mkts_to_user(ao_info, optval, optlen)
ef84703a911f4e Dmitry Safonov 2023-10-23  2042   *
ef84703a911f4e Dmitry Safonov 2023-10-23  2043   * @ao_info:	struct tcp_ao_info on the socket that
ef84703a911f4e Dmitry Safonov 2023-10-23  2044   *		socket getsockopt(TCP_AO_GET_KEYS) is executed on
ef84703a911f4e Dmitry Safonov 2023-10-23  2045   * @optval:	pointer to array of tcp_ao_getsockopt structures in user space.
ef84703a911f4e Dmitry Safonov 2023-10-23  2046   *		Must be != NULL.
ef84703a911f4e Dmitry Safonov 2023-10-23  2047   * @optlen:	pointer to size of tcp_ao_getsockopt structure.
ef84703a911f4e Dmitry Safonov 2023-10-23  2048   *		Must be != NULL.
ef84703a911f4e Dmitry Safonov 2023-10-23  2049   *
ef84703a911f4e Dmitry Safonov 2023-10-23  2050   * Return value: 0 on success, a negative error number otherwise.
ef84703a911f4e Dmitry Safonov 2023-10-23  2051   *
ef84703a911f4e Dmitry Safonov 2023-10-23  2052   * optval points to an array of tcp_ao_getsockopt structures in user space.
ef84703a911f4e Dmitry Safonov 2023-10-23  2053   * optval[0] is used as both input and output to getsockopt. It determines
ef84703a911f4e Dmitry Safonov 2023-10-23  2054   * which keys are returned by the kernel.
ef84703a911f4e Dmitry Safonov 2023-10-23  2055   * optval[0].nkeys is the size of the array in user space. On return it contains
ef84703a911f4e Dmitry Safonov 2023-10-23  2056   * the number of keys matching the search criteria.
ef84703a911f4e Dmitry Safonov 2023-10-23  2057   * If tcp_ao_getsockopt::get_all is set, then all keys in the socket are
ef84703a911f4e Dmitry Safonov 2023-10-23  2058   * returned, otherwise only keys matching <addr, prefix, sndid, rcvid>
ef84703a911f4e Dmitry Safonov 2023-10-23  2059   * in optval[0] are returned.
ef84703a911f4e Dmitry Safonov 2023-10-23  2060   * optlen is also used as both input and output. The user provides the size
ef84703a911f4e Dmitry Safonov 2023-10-23  2061   * of struct tcp_ao_getsockopt in user space, and the kernel returns the size
ef84703a911f4e Dmitry Safonov 2023-10-23  2062   * of the structure in kernel space.
ef84703a911f4e Dmitry Safonov 2023-10-23  2063   * The size of struct tcp_ao_getsockopt may differ between user and kernel.
ef84703a911f4e Dmitry Safonov 2023-10-23  2064   * There are three cases to consider:
ef84703a911f4e Dmitry Safonov 2023-10-23  2065   *  * If usize == ksize, then keys are copied verbatim.
ef84703a911f4e Dmitry Safonov 2023-10-23  2066   *  * If usize < ksize, then the userspace has passed an old struct to a
ef84703a911f4e Dmitry Safonov 2023-10-23  2067   *    newer kernel. The rest of the trailing bytes in optval[0]
ef84703a911f4e Dmitry Safonov 2023-10-23  2068   *    (ksize - usize) are interpreted as 0 by the kernel.
ef84703a911f4e Dmitry Safonov 2023-10-23  2069   *  * If usize > ksize, then the userspace has passed a new struct to an
ef84703a911f4e Dmitry Safonov 2023-10-23  2070   *    older kernel. The trailing bytes unknown to the kernel (usize - ksize)
ef84703a911f4e Dmitry Safonov 2023-10-23  2071   *    are checked to ensure they are zeroed, otherwise -E2BIG is returned.
ef84703a911f4e Dmitry Safonov 2023-10-23  2072   * On return the kernel fills in min(usize, ksize) in each entry of the array.
ef84703a911f4e Dmitry Safonov 2023-10-23  2073   * The layout of the fields in the user and kernel structures is expected to
ef84703a911f4e Dmitry Safonov 2023-10-23  2074   * be the same (including in the 32bit vs 64bit case).
ef84703a911f4e Dmitry Safonov 2023-10-23  2075   */
ef84703a911f4e Dmitry Safonov 2023-10-23  2076  static int tcp_ao_copy_mkts_to_user(struct tcp_ao_info *ao_info,
ef84703a911f4e Dmitry Safonov 2023-10-23  2077  				    sockptr_t optval, sockptr_t optlen)
ef84703a911f4e Dmitry Safonov 2023-10-23  2078  {
ef84703a911f4e Dmitry Safonov 2023-10-23  2079  	struct tcp_ao_getsockopt opt_in, opt_out;
ef84703a911f4e Dmitry Safonov 2023-10-23  2080  	struct tcp_ao_key *key, *current_key;
ef84703a911f4e Dmitry Safonov 2023-10-23  2081  	bool do_address_matching = true;
ef84703a911f4e Dmitry Safonov 2023-10-23  2082  	union tcp_ao_addr *addr = NULL;
248411b8cb8974 Dmitry Safonov 2023-10-23  2083  	int err, l3index, user_len;
ef84703a911f4e Dmitry Safonov 2023-10-23  2084  	unsigned int max_keys;	/* maximum number of keys to copy to user */
ef84703a911f4e Dmitry Safonov 2023-10-23  2085  	size_t out_offset = 0;
ef84703a911f4e Dmitry Safonov 2023-10-23  2086  	size_t bytes_to_write;	/* number of bytes to write to user level */
ef84703a911f4e Dmitry Safonov 2023-10-23  2087  	u32 matched_keys;	/* keys from ao_info matched so far */
ef84703a911f4e Dmitry Safonov 2023-10-23  2088  	int optlen_out;
ef84703a911f4e Dmitry Safonov 2023-10-23  2089  	__be16 port = 0;
ef84703a911f4e Dmitry Safonov 2023-10-23  2090  
ef84703a911f4e Dmitry Safonov 2023-10-23  2091  	if (copy_from_sockptr(&user_len, optlen, sizeof(int)))
ef84703a911f4e Dmitry Safonov 2023-10-23  2092  		return -EFAULT;
ef84703a911f4e Dmitry Safonov 2023-10-23  2093  
ef84703a911f4e Dmitry Safonov 2023-10-23  2094  	if (user_len <= 0)
ef84703a911f4e Dmitry Safonov 2023-10-23  2095  		return -EINVAL;
ef84703a911f4e Dmitry Safonov 2023-10-23  2096  
ef84703a911f4e Dmitry Safonov 2023-10-23  2097  	memset(&opt_in, 0, sizeof(struct tcp_ao_getsockopt));
ef84703a911f4e Dmitry Safonov 2023-10-23  2098  	err = copy_struct_from_sockptr(&opt_in, sizeof(opt_in),
ef84703a911f4e Dmitry Safonov 2023-10-23  2099  				       optval, user_len);
ef84703a911f4e Dmitry Safonov 2023-10-23  2100  	if (err < 0)
ef84703a911f4e Dmitry Safonov 2023-10-23  2101  		return err;
ef84703a911f4e Dmitry Safonov 2023-10-23  2102  
ef84703a911f4e Dmitry Safonov 2023-10-23  2103  	if (opt_in.pkt_good || opt_in.pkt_bad)
ef84703a911f4e Dmitry Safonov 2023-10-23  2104  		return -EINVAL;
248411b8cb8974 Dmitry Safonov 2023-10-23  2105  	if (opt_in.keyflags & ~TCP_AO_GET_KEYF_VALID)
248411b8cb8974 Dmitry Safonov 2023-10-23  2106  		return -EINVAL;
248411b8cb8974 Dmitry Safonov 2023-10-23  2107  	if (opt_in.ifindex && !(opt_in.keyflags & TCP_AO_KEYF_IFINDEX))
248411b8cb8974 Dmitry Safonov 2023-10-23  2108  		return -EINVAL;
ef84703a911f4e Dmitry Safonov 2023-10-23  2109  
ef84703a911f4e Dmitry Safonov 2023-10-23  2110  	if (opt_in.reserved != 0)
ef84703a911f4e Dmitry Safonov 2023-10-23  2111  		return -EINVAL;
ef84703a911f4e Dmitry Safonov 2023-10-23  2112  
ef84703a911f4e Dmitry Safonov 2023-10-23  2113  	max_keys = opt_in.nkeys;
248411b8cb8974 Dmitry Safonov 2023-10-23  2114  	l3index = (opt_in.keyflags & TCP_AO_KEYF_IFINDEX) ? opt_in.ifindex : -1;
ef84703a911f4e Dmitry Safonov 2023-10-23  2115  
ef84703a911f4e Dmitry Safonov 2023-10-23  2116  	if (opt_in.get_all || opt_in.is_current || opt_in.is_rnext) {
ef84703a911f4e Dmitry Safonov 2023-10-23  2117  		if (opt_in.get_all && (opt_in.is_current || opt_in.is_rnext))
ef84703a911f4e Dmitry Safonov 2023-10-23  2118  			return -EINVAL;
ef84703a911f4e Dmitry Safonov 2023-10-23  2119  		do_address_matching = false;
ef84703a911f4e Dmitry Safonov 2023-10-23  2120  	}
ef84703a911f4e Dmitry Safonov 2023-10-23  2121  
ef84703a911f4e Dmitry Safonov 2023-10-23  2122  	switch (opt_in.addr.ss_family) {
ef84703a911f4e Dmitry Safonov 2023-10-23  2123  	case AF_INET: {
ef84703a911f4e Dmitry Safonov 2023-10-23  2124  		struct sockaddr_in *sin;
ef84703a911f4e Dmitry Safonov 2023-10-23  2125  		__be32 mask;
ef84703a911f4e Dmitry Safonov 2023-10-23  2126  
ef84703a911f4e Dmitry Safonov 2023-10-23  2127  		sin = (struct sockaddr_in *)&opt_in.addr;
ef84703a911f4e Dmitry Safonov 2023-10-23  2128  		port = sin->sin_port;
ef84703a911f4e Dmitry Safonov 2023-10-23  2129  		addr = (union tcp_ao_addr *)&sin->sin_addr;
ef84703a911f4e Dmitry Safonov 2023-10-23  2130  
ef84703a911f4e Dmitry Safonov 2023-10-23  2131  		if (opt_in.prefix > 32)
ef84703a911f4e Dmitry Safonov 2023-10-23  2132  			return -EINVAL;
ef84703a911f4e Dmitry Safonov 2023-10-23  2133  
ef84703a911f4e Dmitry Safonov 2023-10-23  2134  		if (ntohl(sin->sin_addr.s_addr) == INADDR_ANY &&
ef84703a911f4e Dmitry Safonov 2023-10-23  2135  		    opt_in.prefix != 0)
ef84703a911f4e Dmitry Safonov 2023-10-23  2136  			return -EINVAL;
ef84703a911f4e Dmitry Safonov 2023-10-23  2137  
ef84703a911f4e Dmitry Safonov 2023-10-23  2138  		mask = inet_make_mask(opt_in.prefix);
ef84703a911f4e Dmitry Safonov 2023-10-23  2139  		if (sin->sin_addr.s_addr & ~mask)
ef84703a911f4e Dmitry Safonov 2023-10-23  2140  			return -EINVAL;
ef84703a911f4e Dmitry Safonov 2023-10-23  2141  
ef84703a911f4e Dmitry Safonov 2023-10-23  2142  		break;
ef84703a911f4e Dmitry Safonov 2023-10-23  2143  	}
ef84703a911f4e Dmitry Safonov 2023-10-23  2144  	case AF_INET6: {
ef84703a911f4e Dmitry Safonov 2023-10-23  2145  		struct sockaddr_in6 *sin6;
ef84703a911f4e Dmitry Safonov 2023-10-23  2146  		struct in6_addr *addr6;
ef84703a911f4e Dmitry Safonov 2023-10-23  2147  
ef84703a911f4e Dmitry Safonov 2023-10-23  2148  		sin6 = (struct sockaddr_in6 *)&opt_in.addr;
ef84703a911f4e Dmitry Safonov 2023-10-23  2149  		addr = (union tcp_ao_addr *)&sin6->sin6_addr;
ef84703a911f4e Dmitry Safonov 2023-10-23  2150  		addr6 = &sin6->sin6_addr;
ef84703a911f4e Dmitry Safonov 2023-10-23  2151  		port = sin6->sin6_port;
ef84703a911f4e Dmitry Safonov 2023-10-23  2152  
ef84703a911f4e Dmitry Safonov 2023-10-23  2153  		/* We don't have to change family and @addr here if
ef84703a911f4e Dmitry Safonov 2023-10-23  2154  		 * ipv6_addr_v4mapped() like in key adding:
ef84703a911f4e Dmitry Safonov 2023-10-23  2155  		 * tcp_ao_key_cmp() does it. Do the sanity checks though.
ef84703a911f4e Dmitry Safonov 2023-10-23  2156  		 */
ef84703a911f4e Dmitry Safonov 2023-10-23  2157  		if (opt_in.prefix != 0) {
ef84703a911f4e Dmitry Safonov 2023-10-23  2158  			if (ipv6_addr_v4mapped(addr6)) {
ef84703a911f4e Dmitry Safonov 2023-10-23  2159  				__be32 mask, addr4 = addr6->s6_addr32[3];
ef84703a911f4e Dmitry Safonov 2023-10-23  2160  
ef84703a911f4e Dmitry Safonov 2023-10-23  2161  				if (opt_in.prefix > 32 ||
ef84703a911f4e Dmitry Safonov 2023-10-23  2162  				    ntohl(addr4) == INADDR_ANY)
ef84703a911f4e Dmitry Safonov 2023-10-23  2163  					return -EINVAL;
ef84703a911f4e Dmitry Safonov 2023-10-23  2164  				mask = inet_make_mask(opt_in.prefix);
ef84703a911f4e Dmitry Safonov 2023-10-23  2165  				if (addr4 & ~mask)
ef84703a911f4e Dmitry Safonov 2023-10-23  2166  					return -EINVAL;
ef84703a911f4e Dmitry Safonov 2023-10-23  2167  			} else {
ef84703a911f4e Dmitry Safonov 2023-10-23  2168  				struct in6_addr pfx;
ef84703a911f4e Dmitry Safonov 2023-10-23  2169  
ef84703a911f4e Dmitry Safonov 2023-10-23  2170  				if (ipv6_addr_any(addr6) ||
ef84703a911f4e Dmitry Safonov 2023-10-23  2171  				    opt_in.prefix > 128)
ef84703a911f4e Dmitry Safonov 2023-10-23  2172  					return -EINVAL;
ef84703a911f4e Dmitry Safonov 2023-10-23  2173  
ef84703a911f4e Dmitry Safonov 2023-10-23  2174  				ipv6_addr_prefix(&pfx, addr6, opt_in.prefix);
ef84703a911f4e Dmitry Safonov 2023-10-23  2175  				if (ipv6_addr_cmp(&pfx, addr6))
ef84703a911f4e Dmitry Safonov 2023-10-23  2176  					return -EINVAL;
ef84703a911f4e Dmitry Safonov 2023-10-23  2177  			}
ef84703a911f4e Dmitry Safonov 2023-10-23  2178  		} else if (!ipv6_addr_any(addr6)) {
ef84703a911f4e Dmitry Safonov 2023-10-23  2179  			return -EINVAL;
ef84703a911f4e Dmitry Safonov 2023-10-23  2180  		}
ef84703a911f4e Dmitry Safonov 2023-10-23  2181  		break;
ef84703a911f4e Dmitry Safonov 2023-10-23  2182  	}
ef84703a911f4e Dmitry Safonov 2023-10-23  2183  	case 0:
ef84703a911f4e Dmitry Safonov 2023-10-23  2184  		if (!do_address_matching)
ef84703a911f4e Dmitry Safonov 2023-10-23  2185  			break;
ef84703a911f4e Dmitry Safonov 2023-10-23  2186  		fallthrough;
ef84703a911f4e Dmitry Safonov 2023-10-23  2187  	default:
ef84703a911f4e Dmitry Safonov 2023-10-23  2188  		return -EAFNOSUPPORT;
ef84703a911f4e Dmitry Safonov 2023-10-23  2189  	}
ef84703a911f4e Dmitry Safonov 2023-10-23  2190  
ef84703a911f4e Dmitry Safonov 2023-10-23  2191  	if (!do_address_matching) {
ef84703a911f4e Dmitry Safonov 2023-10-23  2192  		/* We could just ignore those, but let's do stricter checks */
ef84703a911f4e Dmitry Safonov 2023-10-23  2193  		if (addr || port)
ef84703a911f4e Dmitry Safonov 2023-10-23  2194  			return -EINVAL;
ef84703a911f4e Dmitry Safonov 2023-10-23  2195  		if (opt_in.prefix || opt_in.sndid || opt_in.rcvid)
ef84703a911f4e Dmitry Safonov 2023-10-23  2196  			return -EINVAL;
ef84703a911f4e Dmitry Safonov 2023-10-23  2197  	}
ef84703a911f4e Dmitry Safonov 2023-10-23  2198  
ef84703a911f4e Dmitry Safonov 2023-10-23  2199  	bytes_to_write = min_t(int, user_len, sizeof(struct tcp_ao_getsockopt));
ef84703a911f4e Dmitry Safonov 2023-10-23  2200  	matched_keys = 0;
ef84703a911f4e Dmitry Safonov 2023-10-23  2201  	/* May change in RX, while we're dumping, pre-fetch it */
ef84703a911f4e Dmitry Safonov 2023-10-23  2202  	current_key = READ_ONCE(ao_info->current_key);
ef84703a911f4e Dmitry Safonov 2023-10-23  2203  
ef84703a911f4e Dmitry Safonov 2023-10-23  2204  	hlist_for_each_entry_rcu(key, &ao_info->head, node) {
ef84703a911f4e Dmitry Safonov 2023-10-23  2205  		if (opt_in.get_all)
ef84703a911f4e Dmitry Safonov 2023-10-23  2206  			goto match;
ef84703a911f4e Dmitry Safonov 2023-10-23  2207  
ef84703a911f4e Dmitry Safonov 2023-10-23  2208  		if (opt_in.is_current || opt_in.is_rnext) {
ef84703a911f4e Dmitry Safonov 2023-10-23  2209  			if (opt_in.is_current && key == current_key)
ef84703a911f4e Dmitry Safonov 2023-10-23  2210  				goto match;
ef84703a911f4e Dmitry Safonov 2023-10-23  2211  			if (opt_in.is_rnext && key == ao_info->rnext_key)
ef84703a911f4e Dmitry Safonov 2023-10-23  2212  				goto match;
ef84703a911f4e Dmitry Safonov 2023-10-23  2213  			continue;
ef84703a911f4e Dmitry Safonov 2023-10-23  2214  		}
ef84703a911f4e Dmitry Safonov 2023-10-23  2215  
248411b8cb8974 Dmitry Safonov 2023-10-23  2216  		if (tcp_ao_key_cmp(key, l3index, addr, opt_in.prefix,
ef84703a911f4e Dmitry Safonov 2023-10-23  2217  				   opt_in.addr.ss_family,
ef84703a911f4e Dmitry Safonov 2023-10-23  2218  				   opt_in.sndid, opt_in.rcvid) != 0)
ef84703a911f4e Dmitry Safonov 2023-10-23  2219  			continue;
ef84703a911f4e Dmitry Safonov 2023-10-23  2220  match:
ef84703a911f4e Dmitry Safonov 2023-10-23  2221  		matched_keys++;
ef84703a911f4e Dmitry Safonov 2023-10-23  2222  		if (matched_keys > max_keys)
ef84703a911f4e Dmitry Safonov 2023-10-23  2223  			continue;
ef84703a911f4e Dmitry Safonov 2023-10-23  2224  
ef84703a911f4e Dmitry Safonov 2023-10-23  2225  		memset(&opt_out, 0, sizeof(struct tcp_ao_getsockopt));
ef84703a911f4e Dmitry Safonov 2023-10-23  2226  
ef84703a911f4e Dmitry Safonov 2023-10-23  2227  		if (key->family == AF_INET) {
ef84703a911f4e Dmitry Safonov 2023-10-23  2228  			struct sockaddr_in *sin_out = (struct sockaddr_in *)&opt_out.addr;
ef84703a911f4e Dmitry Safonov 2023-10-23  2229  
ef84703a911f4e Dmitry Safonov 2023-10-23  2230  			sin_out->sin_family = key->family;
ef84703a911f4e Dmitry Safonov 2023-10-23  2231  			sin_out->sin_port = 0;
ef84703a911f4e Dmitry Safonov 2023-10-23  2232  			memcpy(&sin_out->sin_addr, &key->addr, sizeof(struct in_addr));
ef84703a911f4e Dmitry Safonov 2023-10-23  2233  		} else {
ef84703a911f4e Dmitry Safonov 2023-10-23  2234  			struct sockaddr_in6 *sin6_out = (struct sockaddr_in6 *)&opt_out.addr;
ef84703a911f4e Dmitry Safonov 2023-10-23  2235  
ef84703a911f4e Dmitry Safonov 2023-10-23  2236  			sin6_out->sin6_family = key->family;
ef84703a911f4e Dmitry Safonov 2023-10-23  2237  			sin6_out->sin6_port = 0;
ef84703a911f4e Dmitry Safonov 2023-10-23 @2238  			memcpy(&sin6_out->sin6_addr, &key->addr, sizeof(struct in6_addr));
ef84703a911f4e Dmitry Safonov 2023-10-23  2239  		}
ef84703a911f4e Dmitry Safonov 2023-10-23  2240  		opt_out.sndid = key->sndid;
ef84703a911f4e Dmitry Safonov 2023-10-23  2241  		opt_out.rcvid = key->rcvid;
ef84703a911f4e Dmitry Safonov 2023-10-23  2242  		opt_out.prefix = key->prefixlen;
ef84703a911f4e Dmitry Safonov 2023-10-23  2243  		opt_out.keyflags = key->keyflags;
ef84703a911f4e Dmitry Safonov 2023-10-23  2244  		opt_out.is_current = (key == current_key);
ef84703a911f4e Dmitry Safonov 2023-10-23  2245  		opt_out.is_rnext = (key == ao_info->rnext_key);
ef84703a911f4e Dmitry Safonov 2023-10-23  2246  		opt_out.nkeys = 0;
ef84703a911f4e Dmitry Safonov 2023-10-23  2247  		opt_out.maclen = key->maclen;
ef84703a911f4e Dmitry Safonov 2023-10-23  2248  		opt_out.keylen = key->keylen;
248411b8cb8974 Dmitry Safonov 2023-10-23  2249  		opt_out.ifindex = key->l3index;
ef84703a911f4e Dmitry Safonov 2023-10-23  2250  		opt_out.pkt_good = atomic64_read(&key->pkt_good);
ef84703a911f4e Dmitry Safonov 2023-10-23  2251  		opt_out.pkt_bad = atomic64_read(&key->pkt_bad);
ef84703a911f4e Dmitry Safonov 2023-10-23  2252  		memcpy(&opt_out.key, key->key, key->keylen);
ef84703a911f4e Dmitry Safonov 2023-10-23  2253  		tcp_sigpool_algo(key->tcp_sigpool_id, opt_out.alg_name, 64);
ef84703a911f4e Dmitry Safonov 2023-10-23  2254  
ef84703a911f4e Dmitry Safonov 2023-10-23  2255  		/* Copy key to user */
ef84703a911f4e Dmitry Safonov 2023-10-23  2256  		if (copy_to_sockptr_offset(optval, out_offset,
ef84703a911f4e Dmitry Safonov 2023-10-23  2257  					   &opt_out, bytes_to_write))
ef84703a911f4e Dmitry Safonov 2023-10-23  2258  			return -EFAULT;
ef84703a911f4e Dmitry Safonov 2023-10-23  2259  		out_offset += user_len;
ef84703a911f4e Dmitry Safonov 2023-10-23  2260  	}
ef84703a911f4e Dmitry Safonov 2023-10-23  2261  
ef84703a911f4e Dmitry Safonov 2023-10-23  2262  	optlen_out = (int)sizeof(struct tcp_ao_getsockopt);
ef84703a911f4e Dmitry Safonov 2023-10-23  2263  	if (copy_to_sockptr(optlen, &optlen_out, sizeof(int)))
ef84703a911f4e Dmitry Safonov 2023-10-23  2264  		return -EFAULT;
ef84703a911f4e Dmitry Safonov 2023-10-23  2265  
ef84703a911f4e Dmitry Safonov 2023-10-23  2266  	out_offset = offsetof(struct tcp_ao_getsockopt, nkeys);
ef84703a911f4e Dmitry Safonov 2023-10-23  2267  	if (copy_to_sockptr_offset(optval, out_offset,
ef84703a911f4e Dmitry Safonov 2023-10-23  2268  				   &matched_keys, sizeof(u32)))
ef84703a911f4e Dmitry Safonov 2023-10-23  2269  		return -EFAULT;
ef84703a911f4e Dmitry Safonov 2023-10-23  2270  
ef84703a911f4e Dmitry Safonov 2023-10-23  2271  	return 0;
ef84703a911f4e Dmitry Safonov 2023-10-23  2272  }
ef84703a911f4e Dmitry Safonov 2023-10-23  2273  

:::::: The code at line 2238 was first introduced by commit
:::::: ef84703a911f4ee52ca585e8308b7084093941f4 net/tcp: Add TCP-AO getsockopt()s

:::::: TO: Dmitry Safonov <dima@arista.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
