Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD1417C8
	for <oe-kbuild@lists.linux.dev>; Sun, 24 Mar 2024 03:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711252350; cv=none; b=SkSwTIZDJlbc2RzNbetdX/BiwWI6agsq0GrnOr8818Bsrh8jUSSSdKLjo7Vwn27RdoC2fuNDWdLmVtTdR+FfbOMm3kW/9779RROVKd5Npo7qxhGS2XOwoAqs60jJMJph2M82+b8EJCWzidjHqaZuKQm9gVZyozOoNGsa08VvGfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711252350; c=relaxed/simple;
	bh=I8zF1mU9kJ9Z21filefpM8FZhwM7EImbTVPSZGp2wQo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GbFM7Ujv763CjF8pZoQMJtCLq8vXUQYvOC+T2mcnWmj4N0/NvQy72FZwV7G96yrwTBiTrEU0T304qsi7Ci1ngmX+cJHIdPUoByOSiBmKtBaXprZhsVevbxAoxZPQ5ZbSLUImUNGl8o5sbKBNNnzD5mykxDhksFbmKcvzp7yqxbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WCPZMpLu; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WCPZMpLu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711252348; x=1742788348;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I8zF1mU9kJ9Z21filefpM8FZhwM7EImbTVPSZGp2wQo=;
  b=WCPZMpLuJwDcfGyzzvsGiyL4Y64Y21y4+aKPHAz/r8ObkHpAD7Ku5mo8
   WcvHUKgH1oPS4SjdPd+p3MnKPjIUtqLcWsq8Kt/fOarp5WZjzyYRKWNj8
   bPig2NQb1CvGeRvFpJ7zamQOYLe+FrQWUX6y72swppusZu86qLgflaCqC
   Y13i5RUfykHS3Wdt1sNY0LcbO6xMB4sUMjRNB5pJI4BAzYy0ZH6ACB758
   EzkzmXMjn/10FlPOjZ4gNOh+lgZaEdxVqwawHGD4dHh1B2czEoQOQ0M1h
   5KgmsZuvYfhHGOA6oe2feQ1MAAhN++fAfhTCXQ3/t09yrp2GJqNviIuA/
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11022"; a="23758103"
X-IronPort-AV: E=Sophos;i="6.07,150,1708416000"; 
   d="scan'208";a="23758103"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2024 20:52:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,150,1708416000"; 
   d="scan'208";a="15949469"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 23 Mar 2024 20:52:26 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1roEuF-000Le1-0X;
	Sun, 24 Mar 2024 03:52:23 +0000
Date: Sun, 24 Mar 2024 11:51:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: net/ipv4/tcp_ao.c:2089 tcp_ao_copy_mkts_to_user() error:
 __builtin_memcpy() '&key->addr' too small (4 vs 16)
Message-ID: <202403241158.NX7mmXFv-lkp@intel.com>
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
TO: Dmitry Safonov <dima@arista.com>
CC: Francesco Ruggeri <fruggeri@arista.com>
CC: Salam Noureddine <noureddine@arista.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   70293240c5ce675a67bfc48f419b093023b862b3
commit: ef84703a911f4ee52ca585e8308b7084093941f4 net/tcp: Add TCP-AO getsockopt()s
date:   5 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 5 months ago
config: sparc64-randconfig-r081-20240323 (https://download.01.org/0day-ci/archive/20240324/202403241158.NX7mmXFv-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202403241158.NX7mmXFv-lkp@intel.com/

New smatch warnings:
net/ipv4/tcp_ao.c:2089 tcp_ao_copy_mkts_to_user() error: __builtin_memcpy() '&key->addr' too small (4 vs 16)

Old smatch warnings:
net/ipv4/tcp_ao.c:1755 tcp_ao_del_cmd() error: memcmp() '&key->addr' too small (4 vs 16)

vim +2089 net/ipv4/tcp_ao.c

4954f17ddefc51 Dmitry Safonov 2023-10-23  1896  
ef84703a911f4e Dmitry Safonov 2023-10-23  1897  /* tcp_ao_copy_mkts_to_user(ao_info, optval, optlen)
ef84703a911f4e Dmitry Safonov 2023-10-23  1898   *
ef84703a911f4e Dmitry Safonov 2023-10-23  1899   * @ao_info:	struct tcp_ao_info on the socket that
ef84703a911f4e Dmitry Safonov 2023-10-23  1900   *		socket getsockopt(TCP_AO_GET_KEYS) is executed on
ef84703a911f4e Dmitry Safonov 2023-10-23  1901   * @optval:	pointer to array of tcp_ao_getsockopt structures in user space.
ef84703a911f4e Dmitry Safonov 2023-10-23  1902   *		Must be != NULL.
ef84703a911f4e Dmitry Safonov 2023-10-23  1903   * @optlen:	pointer to size of tcp_ao_getsockopt structure.
ef84703a911f4e Dmitry Safonov 2023-10-23  1904   *		Must be != NULL.
ef84703a911f4e Dmitry Safonov 2023-10-23  1905   *
ef84703a911f4e Dmitry Safonov 2023-10-23  1906   * Return value: 0 on success, a negative error number otherwise.
ef84703a911f4e Dmitry Safonov 2023-10-23  1907   *
ef84703a911f4e Dmitry Safonov 2023-10-23  1908   * optval points to an array of tcp_ao_getsockopt structures in user space.
ef84703a911f4e Dmitry Safonov 2023-10-23  1909   * optval[0] is used as both input and output to getsockopt. It determines
ef84703a911f4e Dmitry Safonov 2023-10-23  1910   * which keys are returned by the kernel.
ef84703a911f4e Dmitry Safonov 2023-10-23  1911   * optval[0].nkeys is the size of the array in user space. On return it contains
ef84703a911f4e Dmitry Safonov 2023-10-23  1912   * the number of keys matching the search criteria.
ef84703a911f4e Dmitry Safonov 2023-10-23  1913   * If tcp_ao_getsockopt::get_all is set, then all keys in the socket are
ef84703a911f4e Dmitry Safonov 2023-10-23  1914   * returned, otherwise only keys matching <addr, prefix, sndid, rcvid>
ef84703a911f4e Dmitry Safonov 2023-10-23  1915   * in optval[0] are returned.
ef84703a911f4e Dmitry Safonov 2023-10-23  1916   * optlen is also used as both input and output. The user provides the size
ef84703a911f4e Dmitry Safonov 2023-10-23  1917   * of struct tcp_ao_getsockopt in user space, and the kernel returns the size
ef84703a911f4e Dmitry Safonov 2023-10-23  1918   * of the structure in kernel space.
ef84703a911f4e Dmitry Safonov 2023-10-23  1919   * The size of struct tcp_ao_getsockopt may differ between user and kernel.
ef84703a911f4e Dmitry Safonov 2023-10-23  1920   * There are three cases to consider:
ef84703a911f4e Dmitry Safonov 2023-10-23  1921   *  * If usize == ksize, then keys are copied verbatim.
ef84703a911f4e Dmitry Safonov 2023-10-23  1922   *  * If usize < ksize, then the userspace has passed an old struct to a
ef84703a911f4e Dmitry Safonov 2023-10-23  1923   *    newer kernel. The rest of the trailing bytes in optval[0]
ef84703a911f4e Dmitry Safonov 2023-10-23  1924   *    (ksize - usize) are interpreted as 0 by the kernel.
ef84703a911f4e Dmitry Safonov 2023-10-23  1925   *  * If usize > ksize, then the userspace has passed a new struct to an
ef84703a911f4e Dmitry Safonov 2023-10-23  1926   *    older kernel. The trailing bytes unknown to the kernel (usize - ksize)
ef84703a911f4e Dmitry Safonov 2023-10-23  1927   *    are checked to ensure they are zeroed, otherwise -E2BIG is returned.
ef84703a911f4e Dmitry Safonov 2023-10-23  1928   * On return the kernel fills in min(usize, ksize) in each entry of the array.
ef84703a911f4e Dmitry Safonov 2023-10-23  1929   * The layout of the fields in the user and kernel structures is expected to
ef84703a911f4e Dmitry Safonov 2023-10-23  1930   * be the same (including in the 32bit vs 64bit case).
ef84703a911f4e Dmitry Safonov 2023-10-23  1931   */
ef84703a911f4e Dmitry Safonov 2023-10-23  1932  static int tcp_ao_copy_mkts_to_user(struct tcp_ao_info *ao_info,
ef84703a911f4e Dmitry Safonov 2023-10-23  1933  				    sockptr_t optval, sockptr_t optlen)
ef84703a911f4e Dmitry Safonov 2023-10-23  1934  {
ef84703a911f4e Dmitry Safonov 2023-10-23  1935  	struct tcp_ao_getsockopt opt_in, opt_out;
ef84703a911f4e Dmitry Safonov 2023-10-23  1936  	struct tcp_ao_key *key, *current_key;
ef84703a911f4e Dmitry Safonov 2023-10-23  1937  	bool do_address_matching = true;
ef84703a911f4e Dmitry Safonov 2023-10-23  1938  	union tcp_ao_addr *addr = NULL;
ef84703a911f4e Dmitry Safonov 2023-10-23  1939  	unsigned int max_keys;	/* maximum number of keys to copy to user */
ef84703a911f4e Dmitry Safonov 2023-10-23  1940  	size_t out_offset = 0;
ef84703a911f4e Dmitry Safonov 2023-10-23  1941  	size_t bytes_to_write;	/* number of bytes to write to user level */
ef84703a911f4e Dmitry Safonov 2023-10-23  1942  	int err, user_len;
ef84703a911f4e Dmitry Safonov 2023-10-23  1943  	u32 matched_keys;	/* keys from ao_info matched so far */
ef84703a911f4e Dmitry Safonov 2023-10-23  1944  	int optlen_out;
ef84703a911f4e Dmitry Safonov 2023-10-23  1945  	__be16 port = 0;
ef84703a911f4e Dmitry Safonov 2023-10-23  1946  
ef84703a911f4e Dmitry Safonov 2023-10-23  1947  	if (copy_from_sockptr(&user_len, optlen, sizeof(int)))
ef84703a911f4e Dmitry Safonov 2023-10-23  1948  		return -EFAULT;
ef84703a911f4e Dmitry Safonov 2023-10-23  1949  
ef84703a911f4e Dmitry Safonov 2023-10-23  1950  	if (user_len <= 0)
ef84703a911f4e Dmitry Safonov 2023-10-23  1951  		return -EINVAL;
ef84703a911f4e Dmitry Safonov 2023-10-23  1952  
ef84703a911f4e Dmitry Safonov 2023-10-23  1953  	memset(&opt_in, 0, sizeof(struct tcp_ao_getsockopt));
ef84703a911f4e Dmitry Safonov 2023-10-23  1954  	err = copy_struct_from_sockptr(&opt_in, sizeof(opt_in),
ef84703a911f4e Dmitry Safonov 2023-10-23  1955  				       optval, user_len);
ef84703a911f4e Dmitry Safonov 2023-10-23  1956  	if (err < 0)
ef84703a911f4e Dmitry Safonov 2023-10-23  1957  		return err;
ef84703a911f4e Dmitry Safonov 2023-10-23  1958  
ef84703a911f4e Dmitry Safonov 2023-10-23  1959  	if (opt_in.pkt_good || opt_in.pkt_bad)
ef84703a911f4e Dmitry Safonov 2023-10-23  1960  		return -EINVAL;
ef84703a911f4e Dmitry Safonov 2023-10-23  1961  
ef84703a911f4e Dmitry Safonov 2023-10-23  1962  	if (opt_in.reserved != 0)
ef84703a911f4e Dmitry Safonov 2023-10-23  1963  		return -EINVAL;
ef84703a911f4e Dmitry Safonov 2023-10-23  1964  
ef84703a911f4e Dmitry Safonov 2023-10-23  1965  	max_keys = opt_in.nkeys;
ef84703a911f4e Dmitry Safonov 2023-10-23  1966  
ef84703a911f4e Dmitry Safonov 2023-10-23  1967  	if (opt_in.get_all || opt_in.is_current || opt_in.is_rnext) {
ef84703a911f4e Dmitry Safonov 2023-10-23  1968  		if (opt_in.get_all && (opt_in.is_current || opt_in.is_rnext))
ef84703a911f4e Dmitry Safonov 2023-10-23  1969  			return -EINVAL;
ef84703a911f4e Dmitry Safonov 2023-10-23  1970  		do_address_matching = false;
ef84703a911f4e Dmitry Safonov 2023-10-23  1971  	}
ef84703a911f4e Dmitry Safonov 2023-10-23  1972  
ef84703a911f4e Dmitry Safonov 2023-10-23  1973  	switch (opt_in.addr.ss_family) {
ef84703a911f4e Dmitry Safonov 2023-10-23  1974  	case AF_INET: {
ef84703a911f4e Dmitry Safonov 2023-10-23  1975  		struct sockaddr_in *sin;
ef84703a911f4e Dmitry Safonov 2023-10-23  1976  		__be32 mask;
ef84703a911f4e Dmitry Safonov 2023-10-23  1977  
ef84703a911f4e Dmitry Safonov 2023-10-23  1978  		sin = (struct sockaddr_in *)&opt_in.addr;
ef84703a911f4e Dmitry Safonov 2023-10-23  1979  		port = sin->sin_port;
ef84703a911f4e Dmitry Safonov 2023-10-23  1980  		addr = (union tcp_ao_addr *)&sin->sin_addr;
ef84703a911f4e Dmitry Safonov 2023-10-23  1981  
ef84703a911f4e Dmitry Safonov 2023-10-23  1982  		if (opt_in.prefix > 32)
ef84703a911f4e Dmitry Safonov 2023-10-23  1983  			return -EINVAL;
ef84703a911f4e Dmitry Safonov 2023-10-23  1984  
ef84703a911f4e Dmitry Safonov 2023-10-23  1985  		if (ntohl(sin->sin_addr.s_addr) == INADDR_ANY &&
ef84703a911f4e Dmitry Safonov 2023-10-23  1986  		    opt_in.prefix != 0)
ef84703a911f4e Dmitry Safonov 2023-10-23  1987  			return -EINVAL;
ef84703a911f4e Dmitry Safonov 2023-10-23  1988  
ef84703a911f4e Dmitry Safonov 2023-10-23  1989  		mask = inet_make_mask(opt_in.prefix);
ef84703a911f4e Dmitry Safonov 2023-10-23  1990  		if (sin->sin_addr.s_addr & ~mask)
ef84703a911f4e Dmitry Safonov 2023-10-23  1991  			return -EINVAL;
ef84703a911f4e Dmitry Safonov 2023-10-23  1992  
ef84703a911f4e Dmitry Safonov 2023-10-23  1993  		break;
ef84703a911f4e Dmitry Safonov 2023-10-23  1994  	}
ef84703a911f4e Dmitry Safonov 2023-10-23  1995  	case AF_INET6: {
ef84703a911f4e Dmitry Safonov 2023-10-23  1996  		struct sockaddr_in6 *sin6;
ef84703a911f4e Dmitry Safonov 2023-10-23  1997  		struct in6_addr *addr6;
ef84703a911f4e Dmitry Safonov 2023-10-23  1998  
ef84703a911f4e Dmitry Safonov 2023-10-23  1999  		sin6 = (struct sockaddr_in6 *)&opt_in.addr;
ef84703a911f4e Dmitry Safonov 2023-10-23  2000  		addr = (union tcp_ao_addr *)&sin6->sin6_addr;
ef84703a911f4e Dmitry Safonov 2023-10-23  2001  		addr6 = &sin6->sin6_addr;
ef84703a911f4e Dmitry Safonov 2023-10-23  2002  		port = sin6->sin6_port;
ef84703a911f4e Dmitry Safonov 2023-10-23  2003  
ef84703a911f4e Dmitry Safonov 2023-10-23  2004  		/* We don't have to change family and @addr here if
ef84703a911f4e Dmitry Safonov 2023-10-23  2005  		 * ipv6_addr_v4mapped() like in key adding:
ef84703a911f4e Dmitry Safonov 2023-10-23  2006  		 * tcp_ao_key_cmp() does it. Do the sanity checks though.
ef84703a911f4e Dmitry Safonov 2023-10-23  2007  		 */
ef84703a911f4e Dmitry Safonov 2023-10-23  2008  		if (opt_in.prefix != 0) {
ef84703a911f4e Dmitry Safonov 2023-10-23  2009  			if (ipv6_addr_v4mapped(addr6)) {
ef84703a911f4e Dmitry Safonov 2023-10-23  2010  				__be32 mask, addr4 = addr6->s6_addr32[3];
ef84703a911f4e Dmitry Safonov 2023-10-23  2011  
ef84703a911f4e Dmitry Safonov 2023-10-23  2012  				if (opt_in.prefix > 32 ||
ef84703a911f4e Dmitry Safonov 2023-10-23  2013  				    ntohl(addr4) == INADDR_ANY)
ef84703a911f4e Dmitry Safonov 2023-10-23  2014  					return -EINVAL;
ef84703a911f4e Dmitry Safonov 2023-10-23  2015  				mask = inet_make_mask(opt_in.prefix);
ef84703a911f4e Dmitry Safonov 2023-10-23  2016  				if (addr4 & ~mask)
ef84703a911f4e Dmitry Safonov 2023-10-23  2017  					return -EINVAL;
ef84703a911f4e Dmitry Safonov 2023-10-23  2018  			} else {
ef84703a911f4e Dmitry Safonov 2023-10-23  2019  				struct in6_addr pfx;
ef84703a911f4e Dmitry Safonov 2023-10-23  2020  
ef84703a911f4e Dmitry Safonov 2023-10-23  2021  				if (ipv6_addr_any(addr6) ||
ef84703a911f4e Dmitry Safonov 2023-10-23  2022  				    opt_in.prefix > 128)
ef84703a911f4e Dmitry Safonov 2023-10-23  2023  					return -EINVAL;
ef84703a911f4e Dmitry Safonov 2023-10-23  2024  
ef84703a911f4e Dmitry Safonov 2023-10-23  2025  				ipv6_addr_prefix(&pfx, addr6, opt_in.prefix);
ef84703a911f4e Dmitry Safonov 2023-10-23  2026  				if (ipv6_addr_cmp(&pfx, addr6))
ef84703a911f4e Dmitry Safonov 2023-10-23  2027  					return -EINVAL;
ef84703a911f4e Dmitry Safonov 2023-10-23  2028  			}
ef84703a911f4e Dmitry Safonov 2023-10-23  2029  		} else if (!ipv6_addr_any(addr6)) {
ef84703a911f4e Dmitry Safonov 2023-10-23  2030  			return -EINVAL;
ef84703a911f4e Dmitry Safonov 2023-10-23  2031  		}
ef84703a911f4e Dmitry Safonov 2023-10-23  2032  		break;
ef84703a911f4e Dmitry Safonov 2023-10-23  2033  	}
ef84703a911f4e Dmitry Safonov 2023-10-23  2034  	case 0:
ef84703a911f4e Dmitry Safonov 2023-10-23  2035  		if (!do_address_matching)
ef84703a911f4e Dmitry Safonov 2023-10-23  2036  			break;
ef84703a911f4e Dmitry Safonov 2023-10-23  2037  		fallthrough;
ef84703a911f4e Dmitry Safonov 2023-10-23  2038  	default:
ef84703a911f4e Dmitry Safonov 2023-10-23  2039  		return -EAFNOSUPPORT;
ef84703a911f4e Dmitry Safonov 2023-10-23  2040  	}
ef84703a911f4e Dmitry Safonov 2023-10-23  2041  
ef84703a911f4e Dmitry Safonov 2023-10-23  2042  	if (!do_address_matching) {
ef84703a911f4e Dmitry Safonov 2023-10-23  2043  		/* We could just ignore those, but let's do stricter checks */
ef84703a911f4e Dmitry Safonov 2023-10-23  2044  		if (addr || port)
ef84703a911f4e Dmitry Safonov 2023-10-23  2045  			return -EINVAL;
ef84703a911f4e Dmitry Safonov 2023-10-23  2046  		if (opt_in.prefix || opt_in.sndid || opt_in.rcvid)
ef84703a911f4e Dmitry Safonov 2023-10-23  2047  			return -EINVAL;
ef84703a911f4e Dmitry Safonov 2023-10-23  2048  	}
ef84703a911f4e Dmitry Safonov 2023-10-23  2049  
ef84703a911f4e Dmitry Safonov 2023-10-23  2050  	bytes_to_write = min_t(int, user_len, sizeof(struct tcp_ao_getsockopt));
ef84703a911f4e Dmitry Safonov 2023-10-23  2051  	matched_keys = 0;
ef84703a911f4e Dmitry Safonov 2023-10-23  2052  	/* May change in RX, while we're dumping, pre-fetch it */
ef84703a911f4e Dmitry Safonov 2023-10-23  2053  	current_key = READ_ONCE(ao_info->current_key);
ef84703a911f4e Dmitry Safonov 2023-10-23  2054  
ef84703a911f4e Dmitry Safonov 2023-10-23  2055  	hlist_for_each_entry_rcu(key, &ao_info->head, node) {
ef84703a911f4e Dmitry Safonov 2023-10-23  2056  		if (opt_in.get_all)
ef84703a911f4e Dmitry Safonov 2023-10-23  2057  			goto match;
ef84703a911f4e Dmitry Safonov 2023-10-23  2058  
ef84703a911f4e Dmitry Safonov 2023-10-23  2059  		if (opt_in.is_current || opt_in.is_rnext) {
ef84703a911f4e Dmitry Safonov 2023-10-23  2060  			if (opt_in.is_current && key == current_key)
ef84703a911f4e Dmitry Safonov 2023-10-23  2061  				goto match;
ef84703a911f4e Dmitry Safonov 2023-10-23  2062  			if (opt_in.is_rnext && key == ao_info->rnext_key)
ef84703a911f4e Dmitry Safonov 2023-10-23  2063  				goto match;
ef84703a911f4e Dmitry Safonov 2023-10-23  2064  			continue;
ef84703a911f4e Dmitry Safonov 2023-10-23  2065  		}
ef84703a911f4e Dmitry Safonov 2023-10-23  2066  
ef84703a911f4e Dmitry Safonov 2023-10-23  2067  		if (tcp_ao_key_cmp(key, addr, opt_in.prefix,
ef84703a911f4e Dmitry Safonov 2023-10-23  2068  				   opt_in.addr.ss_family,
ef84703a911f4e Dmitry Safonov 2023-10-23  2069  				   opt_in.sndid, opt_in.rcvid) != 0)
ef84703a911f4e Dmitry Safonov 2023-10-23  2070  			continue;
ef84703a911f4e Dmitry Safonov 2023-10-23  2071  match:
ef84703a911f4e Dmitry Safonov 2023-10-23  2072  		matched_keys++;
ef84703a911f4e Dmitry Safonov 2023-10-23  2073  		if (matched_keys > max_keys)
ef84703a911f4e Dmitry Safonov 2023-10-23  2074  			continue;
ef84703a911f4e Dmitry Safonov 2023-10-23  2075  
ef84703a911f4e Dmitry Safonov 2023-10-23  2076  		memset(&opt_out, 0, sizeof(struct tcp_ao_getsockopt));
ef84703a911f4e Dmitry Safonov 2023-10-23  2077  
ef84703a911f4e Dmitry Safonov 2023-10-23  2078  		if (key->family == AF_INET) {
ef84703a911f4e Dmitry Safonov 2023-10-23  2079  			struct sockaddr_in *sin_out = (struct sockaddr_in *)&opt_out.addr;
ef84703a911f4e Dmitry Safonov 2023-10-23  2080  
ef84703a911f4e Dmitry Safonov 2023-10-23  2081  			sin_out->sin_family = key->family;
ef84703a911f4e Dmitry Safonov 2023-10-23  2082  			sin_out->sin_port = 0;
ef84703a911f4e Dmitry Safonov 2023-10-23  2083  			memcpy(&sin_out->sin_addr, &key->addr, sizeof(struct in_addr));
ef84703a911f4e Dmitry Safonov 2023-10-23  2084  		} else {
ef84703a911f4e Dmitry Safonov 2023-10-23  2085  			struct sockaddr_in6 *sin6_out = (struct sockaddr_in6 *)&opt_out.addr;
ef84703a911f4e Dmitry Safonov 2023-10-23  2086  
ef84703a911f4e Dmitry Safonov 2023-10-23  2087  			sin6_out->sin6_family = key->family;
ef84703a911f4e Dmitry Safonov 2023-10-23  2088  			sin6_out->sin6_port = 0;
ef84703a911f4e Dmitry Safonov 2023-10-23 @2089  			memcpy(&sin6_out->sin6_addr, &key->addr, sizeof(struct in6_addr));
ef84703a911f4e Dmitry Safonov 2023-10-23  2090  		}
ef84703a911f4e Dmitry Safonov 2023-10-23  2091  		opt_out.sndid = key->sndid;
ef84703a911f4e Dmitry Safonov 2023-10-23  2092  		opt_out.rcvid = key->rcvid;
ef84703a911f4e Dmitry Safonov 2023-10-23  2093  		opt_out.prefix = key->prefixlen;
ef84703a911f4e Dmitry Safonov 2023-10-23  2094  		opt_out.keyflags = key->keyflags;
ef84703a911f4e Dmitry Safonov 2023-10-23  2095  		opt_out.is_current = (key == current_key);
ef84703a911f4e Dmitry Safonov 2023-10-23  2096  		opt_out.is_rnext = (key == ao_info->rnext_key);
ef84703a911f4e Dmitry Safonov 2023-10-23  2097  		opt_out.nkeys = 0;
ef84703a911f4e Dmitry Safonov 2023-10-23  2098  		opt_out.maclen = key->maclen;
ef84703a911f4e Dmitry Safonov 2023-10-23  2099  		opt_out.keylen = key->keylen;
ef84703a911f4e Dmitry Safonov 2023-10-23  2100  		opt_out.pkt_good = atomic64_read(&key->pkt_good);
ef84703a911f4e Dmitry Safonov 2023-10-23  2101  		opt_out.pkt_bad = atomic64_read(&key->pkt_bad);
ef84703a911f4e Dmitry Safonov 2023-10-23  2102  		memcpy(&opt_out.key, key->key, key->keylen);
ef84703a911f4e Dmitry Safonov 2023-10-23  2103  		tcp_sigpool_algo(key->tcp_sigpool_id, opt_out.alg_name, 64);
ef84703a911f4e Dmitry Safonov 2023-10-23  2104  
ef84703a911f4e Dmitry Safonov 2023-10-23  2105  		/* Copy key to user */
ef84703a911f4e Dmitry Safonov 2023-10-23  2106  		if (copy_to_sockptr_offset(optval, out_offset,
ef84703a911f4e Dmitry Safonov 2023-10-23  2107  					   &opt_out, bytes_to_write))
ef84703a911f4e Dmitry Safonov 2023-10-23  2108  			return -EFAULT;
ef84703a911f4e Dmitry Safonov 2023-10-23  2109  		out_offset += user_len;
ef84703a911f4e Dmitry Safonov 2023-10-23  2110  	}
ef84703a911f4e Dmitry Safonov 2023-10-23  2111  
ef84703a911f4e Dmitry Safonov 2023-10-23  2112  	optlen_out = (int)sizeof(struct tcp_ao_getsockopt);
ef84703a911f4e Dmitry Safonov 2023-10-23  2113  	if (copy_to_sockptr(optlen, &optlen_out, sizeof(int)))
ef84703a911f4e Dmitry Safonov 2023-10-23  2114  		return -EFAULT;
ef84703a911f4e Dmitry Safonov 2023-10-23  2115  
ef84703a911f4e Dmitry Safonov 2023-10-23  2116  	out_offset = offsetof(struct tcp_ao_getsockopt, nkeys);
ef84703a911f4e Dmitry Safonov 2023-10-23  2117  	if (copy_to_sockptr_offset(optval, out_offset,
ef84703a911f4e Dmitry Safonov 2023-10-23  2118  				   &matched_keys, sizeof(u32)))
ef84703a911f4e Dmitry Safonov 2023-10-23  2119  		return -EFAULT;
ef84703a911f4e Dmitry Safonov 2023-10-23  2120  
ef84703a911f4e Dmitry Safonov 2023-10-23  2121  	return 0;
ef84703a911f4e Dmitry Safonov 2023-10-23  2122  }
ef84703a911f4e Dmitry Safonov 2023-10-23  2123  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
