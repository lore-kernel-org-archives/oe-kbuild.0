Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398BD1DFFB
	for <oe-kbuild@lists.linux.dev>; Fri, 28 Jun 2024 15:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719589251; cv=none; b=BjoSaALXc320WR5t6OP5Uc3Kb0FjHxAKnOTp5l+3sxvqPyRgdj4/sXBNCiIJ/PKcKdfu1w55aspFI6rNKc0MPJQZVYRo9jIPXf9uo4KRUicLbbJ30OhQofqSQiIWO8iGTaurou3Ea8n+t7ru0TzBWkhtlb3mFNIbs8MOx8HNqAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719589251; c=relaxed/simple;
	bh=OPG4ObM9OZgFXH/kMZHtRDpHQ7zdGKw7uF9jF5By9QU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AOCZ586oFYhzn8JoJaTdMuuk14M46ow9YsEoP0Y1Ms01OoOrXcxz6Uehzx6y8rtIwqM1h3NcZt8uUlmOlfHtmyVuW8hGma3da5o0KcXJ/YkTI4flCrs1/dvGr+1IRDI5zSwAgf6RXIxTmRh80ymu+B2n7UCW9XMpNnT3bgPlG5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NPaJnBcA; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NPaJnBcA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719589249; x=1751125249;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OPG4ObM9OZgFXH/kMZHtRDpHQ7zdGKw7uF9jF5By9QU=;
  b=NPaJnBcAffPtL3IR7I1kF3/kUSFwWQP+zvqoxm0bp0rsYk51ZapuCIAL
   EUeznOQjoNLW5bcQMZEE9d/M9xUDt9HE2PUC02gWDM62/8p3TyspMGwK5
   8Rn/qSY28W8PrAJR3POk+xX79RDR4tdweLAacnbynd7oGUhqC+cc55Y2r
   5n2uuxDv668BKjcY7ybUKv6xQvV8zaErl53PZT5+bdMOEEKzRCI3g+bTF
   4GWxq8gTqJJsgw/4bT7bnlbOopWN4JY6vVAkj2emeBkLZvXSD77EpEiIw
   ZR950oXRs3XijOklLAMlZ26V5nrYHJvUX2LP/uIf6d5pifRXQhtOwNjk6
   Q==;
X-CSE-ConnectionGUID: cwcRaXUnRpaOjhvrRFU93Q==
X-CSE-MsgGUID: /yyk2XyXQxGWAxcPttVaCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="16918822"
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; 
   d="scan'208";a="16918822"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2024 08:40:48 -0700
X-CSE-ConnectionGUID: iSwYaLJTQ8myDDm6oKXC6g==
X-CSE-MsgGUID: E1/vSR5JS82K4kYw4/o+hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; 
   d="scan'208";a="75975202"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 28 Jun 2024 08:40:47 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sNDiP-000HG6-06;
	Fri, 28 Jun 2024 15:40:45 +0000
Date: Fri, 28 Jun 2024 23:40:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2] net: allow skb_datagram_iter to be called from any
 context
Message-ID: <202406282328.e4z61dm7-lkp@intel.com>
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
In-Reply-To: <20240623081248.170613-1-sagi@grimberg.me>
References: <20240623081248.170613-1-sagi@grimberg.me>
TO: Sagi Grimberg <sagi@grimberg.me>
TO: netdev@vger.kernel.org
TO: Jakub Kicinski <kuba@kernel.org>
CC: Eric Dumazet <edumazet@google.com>
CC: David Howells <dhowells@redhat.com>
CC: Matthew Wilcox <willy@infradead.org>
CC: Sagi Grimberg <sagi@grimberg.me>

Hi Sagi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net/main]
[also build test WARNING on net-next/main linus/master horms-ipvs/master v6.10-rc5]
[cannot apply to next-20240627]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sagi-Grimberg/net-allow-skb_datagram_iter-to-be-called-from-any-context/20240625-182355
base:   net/main
patch link:    https://lore.kernel.org/r/20240623081248.170613-1-sagi%40grimberg.me
patch subject: [PATCH v2] net: allow skb_datagram_iter to be called from any context
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: i386-randconfig-141-20240628 (https://download.01.org/0day-ci/archive/20240628/202406282328.e4z61dm7-lkp@intel.com/config)
compiler: gcc-8 (Ubuntu 8.4.0-3ubuntu2) 8.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202406282328.e4z61dm7-lkp@intel.com/

smatch warnings:
net/core/datagram.c:435 __skb_datagram_iter() error: uninitialized symbol 'n'.

vim +/n +435 net/core/datagram.c

3305b80c214c64 Herbert Xu    2005-12-13  382  
29f3490ba9d239 Eric Dumazet  2020-03-24  383  INDIRECT_CALLABLE_DECLARE(static size_t simple_copy_to_iter(const void *addr,
29f3490ba9d239 Eric Dumazet  2020-03-24  384  						size_t bytes,
29f3490ba9d239 Eric Dumazet  2020-03-24  385  						void *data __always_unused,
29f3490ba9d239 Eric Dumazet  2020-03-24  386  						struct iov_iter *i));
29f3490ba9d239 Eric Dumazet  2020-03-24  387  
56dc6d6355744b YueHaibing    2019-03-19  388  static int __skb_datagram_iter(const struct sk_buff *skb, int offset,
950fcaecd5cc6c Sagi Grimberg 2018-12-03  389  			       struct iov_iter *to, int len, bool fault_short,
56dc6d6355744b YueHaibing    2019-03-19  390  			       size_t (*cb)(const void *, size_t, void *,
56dc6d6355744b YueHaibing    2019-03-19  391  					    struct iov_iter *), void *data)
a8f820aa4066d2 Herbert Xu    2014-11-07  392  {
a8f820aa4066d2 Herbert Xu    2014-11-07  393  	int start = skb_headlen(skb);
3278682123811d Al Viro       2017-02-17  394  	int i, copy = start - offset, start_off = offset, n;
a8f820aa4066d2 Herbert Xu    2014-11-07  395  	struct sk_buff *frag_iter;
a8f820aa4066d2 Herbert Xu    2014-11-07  396  
a8f820aa4066d2 Herbert Xu    2014-11-07  397  	/* Copy header. */
a8f820aa4066d2 Herbert Xu    2014-11-07  398  	if (copy > 0) {
a8f820aa4066d2 Herbert Xu    2014-11-07  399  		if (copy > len)
a8f820aa4066d2 Herbert Xu    2014-11-07  400  			copy = len;
29f3490ba9d239 Eric Dumazet  2020-03-24  401  		n = INDIRECT_CALL_1(cb, simple_copy_to_iter,
29f3490ba9d239 Eric Dumazet  2020-03-24  402  				    skb->data + offset, copy, data, to);
3278682123811d Al Viro       2017-02-17  403  		offset += n;
3278682123811d Al Viro       2017-02-17  404  		if (n != copy)
a8f820aa4066d2 Herbert Xu    2014-11-07  405  			goto short_copy;
a8f820aa4066d2 Herbert Xu    2014-11-07  406  		if ((len -= copy) == 0)
a8f820aa4066d2 Herbert Xu    2014-11-07  407  			return 0;
a8f820aa4066d2 Herbert Xu    2014-11-07  408  	}
a8f820aa4066d2 Herbert Xu    2014-11-07  409  
a8f820aa4066d2 Herbert Xu    2014-11-07  410  	/* Copy paged appendix. Hmm... why does this look so complicated? */
a8f820aa4066d2 Herbert Xu    2014-11-07  411  	for (i = 0; i < skb_shinfo(skb)->nr_frags; i++) {
a8f820aa4066d2 Herbert Xu    2014-11-07  412  		int end;
a8f820aa4066d2 Herbert Xu    2014-11-07  413  		const skb_frag_t *frag = &skb_shinfo(skb)->frags[i];
a8f820aa4066d2 Herbert Xu    2014-11-07  414  
a8f820aa4066d2 Herbert Xu    2014-11-07  415  		WARN_ON(start > offset + len);
a8f820aa4066d2 Herbert Xu    2014-11-07  416  
a8f820aa4066d2 Herbert Xu    2014-11-07  417  		end = start + skb_frag_size(frag);
a8f820aa4066d2 Herbert Xu    2014-11-07  418  		if ((copy = end - offset) > 0) {
3a8698b261c7de Sagi Grimberg 2024-06-23  419  			u32 p_off, p_len, copied;
3a8698b261c7de Sagi Grimberg 2024-06-23  420  			struct page *p;
3a8698b261c7de Sagi Grimberg 2024-06-23  421  			u8 *vaddr;
0fc07791bc7754 Sagi Grimberg 2018-12-03  422  
a8f820aa4066d2 Herbert Xu    2014-11-07  423  			if (copy > len)
a8f820aa4066d2 Herbert Xu    2014-11-07  424  				copy = len;
3a8698b261c7de Sagi Grimberg 2024-06-23  425  
3a8698b261c7de Sagi Grimberg 2024-06-23  426  			skb_frag_foreach_page(frag,
3a8698b261c7de Sagi Grimberg 2024-06-23  427  					      skb_frag_off(frag) + offset - start,
3a8698b261c7de Sagi Grimberg 2024-06-23  428  					      copy, p, p_off, p_len, copied) {
3a8698b261c7de Sagi Grimberg 2024-06-23  429  				vaddr = kmap_local_page(p);
29f3490ba9d239 Eric Dumazet  2020-03-24  430  				n = INDIRECT_CALL_1(cb, simple_copy_to_iter,
3a8698b261c7de Sagi Grimberg 2024-06-23  431  					vaddr + p_off, p_len, data, to);
3a8698b261c7de Sagi Grimberg 2024-06-23  432  				kunmap_local(vaddr);
3a8698b261c7de Sagi Grimberg 2024-06-23  433  			}
3a8698b261c7de Sagi Grimberg 2024-06-23  434  
3278682123811d Al Viro       2017-02-17 @435  			offset += n;
3278682123811d Al Viro       2017-02-17  436  			if (n != copy)
a8f820aa4066d2 Herbert Xu    2014-11-07  437  				goto short_copy;
a8f820aa4066d2 Herbert Xu    2014-11-07  438  			if (!(len -= copy))
a8f820aa4066d2 Herbert Xu    2014-11-07  439  				return 0;
a8f820aa4066d2 Herbert Xu    2014-11-07  440  		}
a8f820aa4066d2 Herbert Xu    2014-11-07  441  		start = end;
a8f820aa4066d2 Herbert Xu    2014-11-07  442  	}
a8f820aa4066d2 Herbert Xu    2014-11-07  443  
a8f820aa4066d2 Herbert Xu    2014-11-07  444  	skb_walk_frags(skb, frag_iter) {
a8f820aa4066d2 Herbert Xu    2014-11-07  445  		int end;
a8f820aa4066d2 Herbert Xu    2014-11-07  446  
a8f820aa4066d2 Herbert Xu    2014-11-07  447  		WARN_ON(start > offset + len);
a8f820aa4066d2 Herbert Xu    2014-11-07  448  
a8f820aa4066d2 Herbert Xu    2014-11-07  449  		end = start + frag_iter->len;
a8f820aa4066d2 Herbert Xu    2014-11-07  450  		if ((copy = end - offset) > 0) {
a8f820aa4066d2 Herbert Xu    2014-11-07  451  			if (copy > len)
a8f820aa4066d2 Herbert Xu    2014-11-07  452  				copy = len;
950fcaecd5cc6c Sagi Grimberg 2018-12-03  453  			if (__skb_datagram_iter(frag_iter, offset - start,
65d69e2505bb64 Sagi Grimberg 2018-12-03  454  						to, copy, fault_short, cb, data))
a8f820aa4066d2 Herbert Xu    2014-11-07  455  				goto fault;
a8f820aa4066d2 Herbert Xu    2014-11-07  456  			if ((len -= copy) == 0)
a8f820aa4066d2 Herbert Xu    2014-11-07  457  				return 0;
a8f820aa4066d2 Herbert Xu    2014-11-07  458  			offset += copy;
a8f820aa4066d2 Herbert Xu    2014-11-07  459  		}
a8f820aa4066d2 Herbert Xu    2014-11-07  460  		start = end;
a8f820aa4066d2 Herbert Xu    2014-11-07  461  	}
a8f820aa4066d2 Herbert Xu    2014-11-07  462  	if (!len)
a8f820aa4066d2 Herbert Xu    2014-11-07  463  		return 0;
a8f820aa4066d2 Herbert Xu    2014-11-07  464  
a8f820aa4066d2 Herbert Xu    2014-11-07  465  	/* This is not really a user copy fault, but rather someone
a8f820aa4066d2 Herbert Xu    2014-11-07  466  	 * gave us a bogus length on the skb.  We should probably
a8f820aa4066d2 Herbert Xu    2014-11-07  467  	 * print a warning here as it may indicate a kernel bug.
a8f820aa4066d2 Herbert Xu    2014-11-07  468  	 */
a8f820aa4066d2 Herbert Xu    2014-11-07  469  
a8f820aa4066d2 Herbert Xu    2014-11-07  470  fault:
3278682123811d Al Viro       2017-02-17  471  	iov_iter_revert(to, offset - start_off);
a8f820aa4066d2 Herbert Xu    2014-11-07  472  	return -EFAULT;
a8f820aa4066d2 Herbert Xu    2014-11-07  473  
a8f820aa4066d2 Herbert Xu    2014-11-07  474  short_copy:
950fcaecd5cc6c Sagi Grimberg 2018-12-03  475  	if (fault_short || iov_iter_count(to))
a8f820aa4066d2 Herbert Xu    2014-11-07  476  		goto fault;
a8f820aa4066d2 Herbert Xu    2014-11-07  477  
a8f820aa4066d2 Herbert Xu    2014-11-07  478  	return 0;
a8f820aa4066d2 Herbert Xu    2014-11-07  479  }
950fcaecd5cc6c Sagi Grimberg 2018-12-03  480  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
