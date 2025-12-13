Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B1B192B7D
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Dec 2025 13:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765633669; cv=none; b=tgiTTWRFwwMTgWjxijsDLagQDzxGwQo6iRPu9B73oHh+23cdfHfC1cKTnSFVcpNESiwKXCK6VBc7egeaQ7OgBUwkoZFrRbYaAFrebkK6xeCNhszCVCuWCw266b8hqBfphCC5YIj+5gJFBIT73TG1sQDEsaesYcx5AsMoA4SPLag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765633669; c=relaxed/simple;
	bh=/YQOEalPh/VoSr/x5cKBH7pcq61QOImX8KTNNvA8uDA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Pq+/HlLgm/XUU8VYtQTwIJ09UPUegSa7pqa1cgAOBgp6aboHQ+W0p4ZBb29hNZEWLxFo4pvq2FjL63Om/LVrXC3x5XQKe6/A5TYVhniyk3UieQoazIrCnFvBxDyZ4TswCQgYoivhk1R01aTmo/8mFGPWFYrfyLKEGdIVRA2igL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XULoHJWE; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XULoHJWE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765633666; x=1797169666;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/YQOEalPh/VoSr/x5cKBH7pcq61QOImX8KTNNvA8uDA=;
  b=XULoHJWESGNlR7PWdeglGEY0m8w4g4a6PIuXqYcCrSlteLLj7O+xK4N8
   miYupxjlHfaSOjQirWsE5aPqTVkhF+g597QwLxPBAUT6WohfB2yT8hG6W
   B39MJjCsJxkyxi0Wj1m3bWzoJ1WoRAgzRxh8ZtQwWtnbJ27rl/+Q9smR7
   OG0BTHCWYS71VPqZaNJOk2FII/mMui/i2wBvgi1t4b+9zkJUjAj/dX9ih
   YFZR8pRM/yEfgjIFN5JJyIQ0FOaHSVCiMZBRFQzHzLpCDURpEwVmv7MGG
   4i6mSLUxQtbQW9CYcP0CJNvkHn/4l7E5pChV1fRExnmsK1U64V5jvNHy/
   w==;
X-CSE-ConnectionGUID: QBUmbSNiRrOcJgKKt9G/dg==
X-CSE-MsgGUID: s9YTWXPpQwmXp5X8zqiOYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="70193101"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="70193101"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 05:47:46 -0800
X-CSE-ConnectionGUID: 7IkCAVZ5QR62azyAj7rxWA==
X-CSE-MsgGUID: yXQ3OSBMRK27b16zLHw8vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="198145273"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 13 Dec 2025 05:47:45 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUPyJ-000000007hG-0FHI;
	Sat, 13 Dec 2025 13:47:43 +0000
Date: Sat, 13 Dec 2025 21:47:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/thunderbolt/tunnel.c:2319 tb_tunnel_activate() warn: missing
 unwind goto?
Message-ID: <202512132144.oqGpbTtt-lkp@intel.com>
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
head:   9d9c1cfec01cdbf24bd9322ed555713a20422115
commit: d6d458d42e1e1544a18f37f1d5c840e00d5261b9 thunderbolt: Handle DisplayPort tunnel activation asynchronously
date:   11 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 11 months ago
config: alpha-randconfig-r071-20251212 (https://download.01.org/0day-ci/archive/20251213/202512132144.oqGpbTtt-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512132144.oqGpbTtt-lkp@intel.com/

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
