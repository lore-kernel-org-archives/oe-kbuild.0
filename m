Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00F92D5C7A
	for <oe-kbuild@lists.linux.dev>; Mon, 15 Dec 2025 20:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765831320; cv=none; b=qYignR/IfmpUqyGIuNLXCcWIOn0MpKIMuoznFZ92rp5XaNPqh9ypoMPjyzPnGFAxz+NEQmJKM5SL1TXWBv7L8m+RIf+rVcDhHzUZj1swaVRP2s8PfG85ylf/D4ANv93kHOJeQIvUBURz2TWSqpxYQNGOFqhsHkQxae6zsPuA8P0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765831320; c=relaxed/simple;
	bh=YcYS3+k4BkCVHjOiDDa8O9LVh+15oVf8N23zUBelX/8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fq51PnOBLI/EZxDu8CT/M0ZR/sxpiDRQCf+4mpFdVPuRY8/dR11rbkbdolywDjcafvgLtzIW4iH8RKqjEsLRzvwUV/5PQznFKH7AeeSEwrYLqfO7TBeTwaH2k9ZJYZWjQA7XK37l8FzblgD3eEtZaXYbSHVISoO7EUGsRSAcGkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PTR26nok; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PTR26nok"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765831319; x=1797367319;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YcYS3+k4BkCVHjOiDDa8O9LVh+15oVf8N23zUBelX/8=;
  b=PTR26nokMPGFYclTyiao5FnoM2d/GnegvO6oIRr3LNSLvFYSEsU9NC00
   FpSNKfvsiPZuDWmIDd0DMn6Vn1aIloL8+lfno2K3uJsyUxd8hnLPuLije
   UydJ8rzksXbcLOMy6sll0nBwlwpUKbIJbMCsUb0z2bQx8w1pAJ0UDwEDM
   jMkq2hqoGSeLo+CU5uHI7a67nmtvlhnlUfTqb3Nab9JMyFn00D57XMeUM
   cBd1jdFKsRudXfVZpHhv/rHucf1Ex5ilLqJHrKBmY6JmNgszRg6WuomNK
   34iYtyDKbmTpWFyJbP4d0jpeyC2yv9a9t5hNrWBJmUBxIn1VNKO3bCsH3
   Q==;
X-CSE-ConnectionGUID: W0012d/BTWag70ZlYcb/7A==
X-CSE-MsgGUID: x+0F0patS6mvzlb1pVAakw==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="85156059"
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; 
   d="scan'208";a="85156059"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 12:41:59 -0800
X-CSE-ConnectionGUID: xO6c74YtQWC9KeTiFGAYPw==
X-CSE-MsgGUID: cwjW6FatQniRQWiQb+uMTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; 
   d="scan'208";a="202002596"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 15 Dec 2025 12:41:57 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVFNf-000000000kl-0vFY;
	Mon, 15 Dec 2025 20:41:22 +0000
Date: Tue, 16 Dec 2025 04:40:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/thunderbolt/tunnel.c:2319 tb_tunnel_activate() warn: missing
 unwind goto?
Message-ID: <202512160443.6NO9vi4r-lkp@intel.com>
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
TO: Mika Westerberg <mika.westerberg@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
commit: d6d458d42e1e1544a18f37f1d5c840e00d5261b9 thunderbolt: Handle DisplayPort tunnel activation asynchronously
date:   12 months ago
:::::: branch date: 2 days ago
:::::: commit date: 12 months ago
config: alpha-randconfig-r071-20251212 (https://download.01.org/0day-ci/archive/20251216/202512160443.6NO9vi4r-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512160443.6NO9vi4r-lkp@intel.com/

smatch warnings:
drivers/thunderbolt/tunnel.c:2319 tb_tunnel_activate() warn: missing unwind goto?

vim +2319 drivers/thunderbolt/tunnel.c

3364f0c1279571 drivers/thunderbolt/tunnel_pci.c Andreas Noever  2014-06-03  2274  
3364f0c1279571 drivers/thunderbolt/tunnel_pci.c Andreas Noever  2014-06-03  2275  /**
cab96faacf53d0 drivers/thunderbolt/tunnel.c     Mika Westerberg 2024-08-20  2276   * tb_tunnel_activate() - activate a tunnel
cab96faacf53d0 drivers/thunderbolt/tunnel.c     Mika Westerberg 2024-08-20  2277   * @tunnel: Tunnel to activate
93f36ade5b7b82 drivers/thunderbolt/tunnel.c     Mika Westerberg 2017-02-19  2278   *
d6d458d42e1e15 drivers/thunderbolt/tunnel.c     Mika Westerberg 2024-08-20  2279   * Return: 0 on success and negative errno in case if failure.
d6d458d42e1e15 drivers/thunderbolt/tunnel.c     Mika Westerberg 2024-08-20  2280   * Specifically returns %-EINPROGRESS if the tunnel activation is still
d6d458d42e1e15 drivers/thunderbolt/tunnel.c     Mika Westerberg 2024-08-20  2281   * in progress (that's for DP tunnels to complete DPRX capabilities
d6d458d42e1e15 drivers/thunderbolt/tunnel.c     Mika Westerberg 2024-08-20  2282   * read).
3364f0c1279571 drivers/thunderbolt/tunnel_pci.c Andreas Noever  2014-06-03  2283   */
cab96faacf53d0 drivers/thunderbolt/tunnel.c     Mika Westerberg 2024-08-20  2284  int tb_tunnel_activate(struct tb_tunnel *tunnel)
3364f0c1279571 drivers/thunderbolt/tunnel_pci.c Andreas Noever  2014-06-03  2285  {
93f36ade5b7b82 drivers/thunderbolt/tunnel.c     Mika Westerberg 2017-02-19  2286  	int res, i;
3364f0c1279571 drivers/thunderbolt/tunnel_pci.c Andreas Noever  2014-06-03  2287  
62efe699a7f666 drivers/thunderbolt/tunnel.c     Mika Westerberg 2018-09-17  2288  	tb_tunnel_dbg(tunnel, "activating\n");
3364f0c1279571 drivers/thunderbolt/tunnel_pci.c Andreas Noever  2014-06-03  2289  
aae9e27f3b72ed drivers/thunderbolt/tunnel.c     Mika Westerberg 2017-02-19  2290  	/*
aae9e27f3b72ed drivers/thunderbolt/tunnel.c     Mika Westerberg 2017-02-19  2291  	 * Make sure all paths are properly disabled before enabling
aae9e27f3b72ed drivers/thunderbolt/tunnel.c     Mika Westerberg 2017-02-19  2292  	 * them again.
aae9e27f3b72ed drivers/thunderbolt/tunnel.c     Mika Westerberg 2017-02-19  2293  	 */
93f36ade5b7b82 drivers/thunderbolt/tunnel.c     Mika Westerberg 2017-02-19  2294  	for (i = 0; i < tunnel->npaths; i++) {
aae9e27f3b72ed drivers/thunderbolt/tunnel.c     Mika Westerberg 2017-02-19  2295  		if (tunnel->paths[i]->activated) {
aae9e27f3b72ed drivers/thunderbolt/tunnel.c     Mika Westerberg 2017-02-19  2296  			tb_path_deactivate(tunnel->paths[i]);
93f36ade5b7b82 drivers/thunderbolt/tunnel.c     Mika Westerberg 2017-02-19  2297  			tunnel->paths[i]->activated = false;
aae9e27f3b72ed drivers/thunderbolt/tunnel.c     Mika Westerberg 2017-02-19  2298  		}
aae9e27f3b72ed drivers/thunderbolt/tunnel.c     Mika Westerberg 2017-02-19  2299  	}
aae9e27f3b72ed drivers/thunderbolt/tunnel.c     Mika Westerberg 2017-02-19  2300  
d6d458d42e1e15 drivers/thunderbolt/tunnel.c     Mika Westerberg 2024-08-20  2301  	tunnel->state = TB_TUNNEL_ACTIVATING;
d6d458d42e1e15 drivers/thunderbolt/tunnel.c     Mika Westerberg 2024-08-20  2302  
ae765788936d98 drivers/thunderbolt/tunnel.c     Mika Westerberg 2024-08-20  2303  	if (tunnel->pre_activate) {
ae765788936d98 drivers/thunderbolt/tunnel.c     Mika Westerberg 2024-08-20  2304  		res = tunnel->pre_activate(tunnel);
4f807e47ee9a75 drivers/thunderbolt/tunnel.c     Mika Westerberg 2018-09-17  2305  		if (res)
4f807e47ee9a75 drivers/thunderbolt/tunnel.c     Mika Westerberg 2018-09-17  2306  			return res;
4f807e47ee9a75 drivers/thunderbolt/tunnel.c     Mika Westerberg 2018-09-17  2307  	}
4f807e47ee9a75 drivers/thunderbolt/tunnel.c     Mika Westerberg 2018-09-17  2308  
aae9e27f3b72ed drivers/thunderbolt/tunnel.c     Mika Westerberg 2017-02-19  2309  	for (i = 0; i < tunnel->npaths; i++) {
93f36ade5b7b82 drivers/thunderbolt/tunnel.c     Mika Westerberg 2017-02-19  2310  		res = tb_path_activate(tunnel->paths[i]);
3364f0c1279571 drivers/thunderbolt/tunnel_pci.c Andreas Noever  2014-06-03  2311  		if (res)
3364f0c1279571 drivers/thunderbolt/tunnel_pci.c Andreas Noever  2014-06-03  2312  			goto err;
93f36ade5b7b82 drivers/thunderbolt/tunnel.c     Mika Westerberg 2017-02-19  2313  	}
3364f0c1279571 drivers/thunderbolt/tunnel_pci.c Andreas Noever  2014-06-03  2314  
93f36ade5b7b82 drivers/thunderbolt/tunnel.c     Mika Westerberg 2017-02-19  2315  	if (tunnel->activate) {
93f36ade5b7b82 drivers/thunderbolt/tunnel.c     Mika Westerberg 2017-02-19  2316  		res = tunnel->activate(tunnel, true);
d6d458d42e1e15 drivers/thunderbolt/tunnel.c     Mika Westerberg 2024-08-20  2317  		if (res) {
d6d458d42e1e15 drivers/thunderbolt/tunnel.c     Mika Westerberg 2024-08-20  2318  			if (res == -EINPROGRESS)
d6d458d42e1e15 drivers/thunderbolt/tunnel.c     Mika Westerberg 2024-08-20 @2319  				return res;
3364f0c1279571 drivers/thunderbolt/tunnel_pci.c Andreas Noever  2014-06-03  2320  			goto err;
93f36ade5b7b82 drivers/thunderbolt/tunnel.c     Mika Westerberg 2017-02-19  2321  		}
d6d458d42e1e15 drivers/thunderbolt/tunnel.c     Mika Westerberg 2024-08-20  2322  	}
3364f0c1279571 drivers/thunderbolt/tunnel_pci.c Andreas Noever  2014-06-03  2323  
d6d458d42e1e15 drivers/thunderbolt/tunnel.c     Mika Westerberg 2024-08-20  2324  	tunnel->state = TB_TUNNEL_ACTIVE;
3364f0c1279571 drivers/thunderbolt/tunnel_pci.c Andreas Noever  2014-06-03  2325  	return 0;
93f36ade5b7b82 drivers/thunderbolt/tunnel.c     Mika Westerberg 2017-02-19  2326  
3364f0c1279571 drivers/thunderbolt/tunnel_pci.c Andreas Noever  2014-06-03  2327  err:
3364f0c1279571 drivers/thunderbolt/tunnel_pci.c Andreas Noever  2014-06-03  2328  	tb_tunnel_warn(tunnel, "activation failed\n");
93f36ade5b7b82 drivers/thunderbolt/tunnel.c     Mika Westerberg 2017-02-19  2329  	tb_tunnel_deactivate(tunnel);
3364f0c1279571 drivers/thunderbolt/tunnel_pci.c Andreas Noever  2014-06-03  2330  	return res;
3364f0c1279571 drivers/thunderbolt/tunnel_pci.c Andreas Noever  2014-06-03  2331  }
3364f0c1279571 drivers/thunderbolt/tunnel_pci.c Andreas Noever  2014-06-03  2332  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
