Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB171A76AC
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Dec 2024 16:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733849474; cv=none; b=ksp+jzBsXipJ68AwLtyt//Oe9P47rgwVAjrxRWn3EzwzL+kg6ar6L6g5hRnHv7A+k+PmC84qLthNMUv02ImrbB6574C6KCudeUjbohAwb0f2ww97f17QlK6Foj5lqUY3fi2joPdwkLdaZCX6PrV/GOTewtDPMmsDbdOgKlZZ/dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733849474; c=relaxed/simple;
	bh=x3Euucnr5BQbzInmvaoYxYuLeKwgeLC0bC0ikugMC3o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OG66lHdLLoociyTcOFO8QLn+A7m+wKIlKYCxQakGc+kwSJYKkdav0n5q0GmWAtMHagI/N25xlYJWkoL8IxAzUGrcPHL0mIC9WcOGgvWq4etTOM1gWAaS54vWvQp1dYBgup2gkL4smd5hrfoUemKXdHTpf0qtzGJVw9S9JdZjYCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n+OF8NRp; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n+OF8NRp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733849469; x=1765385469;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x3Euucnr5BQbzInmvaoYxYuLeKwgeLC0bC0ikugMC3o=;
  b=n+OF8NRpSBM9ZAwr9aIeTej4I/fKig/EBgQNuM9KwmNNQTNDyPyjrRpL
   mlwyEYMuYBWaKpCdFfzYZc+bvrTCIZz2fbXWvV1sAgQuczLaRE6lg+Y6H
   mlJyEkNdLiKbfeocwhr3cpfnhYJjhkKW50WGDUJdj9w2Hf4NA+RkCH607
   LSSNACYPeUl+k0nWYfNPp7LN5xl3G1sSA0bsWoZBrWY/lJeDDpjO9C3Q6
   JzsCa37YoMzodqZ6smTNaVcLPY/V7XmdiqDggJDAKvjBIk5xbqdO3JB5t
   bHnL3GZLBWMvwo3pV0gA7B60q1fj8WzmjkIEIYAtcs+V8hAgayFuxnhoc
   Q==;
X-CSE-ConnectionGUID: Esovh1DtSvSLsABNwK5skQ==
X-CSE-MsgGUID: IJd2E1/wSAqgHiDo7Vui4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="44675498"
X-IronPort-AV: E=Sophos;i="6.12,223,1728975600"; 
   d="scan'208";a="44675498"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 08:51:09 -0800
X-CSE-ConnectionGUID: hAry2SvZQ/G5BVf8z314wA==
X-CSE-MsgGUID: W0w/YNsnRCu5kcm+sFjsWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,223,1728975600"; 
   d="scan'208";a="100431180"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 10 Dec 2024 08:51:07 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tL3Rx-0005mi-0Y;
	Tue, 10 Dec 2024 16:51:05 +0000
Date: Wed, 11 Dec 2024 00:50:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [PATCH net-next v9 1/1] binder: report txn errors via generic
 netlink
Message-ID: <202412110006.vSu6pw9e-lkp@intel.com>
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
In-Reply-To: <20241209192247.3371436-2-dualli@chromium.org>
References: <20241209192247.3371436-2-dualli@chromium.org>
TO: Li Li <dualli@chromium.org>
TO: dualli@google.com
TO: corbet@lwn.net
TO: davem@davemloft.net
TO: edumazet@google.com
TO: kuba@kernel.org
TO: pabeni@redhat.com
TO: donald.hunter@gmail.com
TO: gregkh@linuxfoundation.org
TO: arve@android.com
TO: tkjos@android.com
TO: maco@android.com
TO: joel@joelfernandes.org
TO: brauner@kernel.org
TO: cmllamas@google.com
TO: surenb@google.com
TO: arnd@arndb.de
TO: masahiroy@kernel.org
TO: bagasdotme@gmail.com
TO: horms@kernel.org
TO: linux-kernel@vger.kernel.org
TO: linux-doc@vger.kernel.org
TO: netdev@vger.kernel.org
TO: hridya@google.com
TO: smoreland@google.com
CC: kernel-team@android.com

Hi Li,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 6145fefc1e42c1895c0c1c2c8593de2c085d8c56]

url:    https://github.com/intel-lab-lkp/linux/commits/Li-Li/binder-report-txn-errors-via-generic-netlink/20241210-032559
base:   6145fefc1e42c1895c0c1c2c8593de2c085d8c56
patch link:    https://lore.kernel.org/r/20241209192247.3371436-2-dualli%40chromium.org
patch subject: [PATCH net-next v9 1/1] binder: report txn errors via generic netlink
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
config: x86_64-randconfig-102-20241210 (https://download.01.org/0day-ci/archive/20241211/202412110006.vSu6pw9e-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202412110006.vSu6pw9e-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/android/binder.c:6535:31-57: WARNING avoid newline at end of message in NL_SET_ERR_MSG

vim +6535 drivers/android/binder.c

355b0502f6efea0 drivers/staging/android/binder.c Greg Kroah-Hartman 2011-11-30  6509  
86bd3e8e38707ae drivers/android/binder.c         Li Li              2024-12-09  6510  /**
86bd3e8e38707ae drivers/android/binder.c         Li Li              2024-12-09  6511   * binder_genl_nl_set_doit() - .doit handler for BINDER_GENL_CMD_SET
86bd3e8e38707ae drivers/android/binder.c         Li Li              2024-12-09  6512   * @skb:	the metadata struct passed from netlink driver
86bd3e8e38707ae drivers/android/binder.c         Li Li              2024-12-09  6513   * @info:	the generic netlink struct passed from netlink driver
86bd3e8e38707ae drivers/android/binder.c         Li Li              2024-12-09  6514   *
86bd3e8e38707ae drivers/android/binder.c         Li Li              2024-12-09  6515   * Implements the .doit function to process binder genl commands.
86bd3e8e38707ae drivers/android/binder.c         Li Li              2024-12-09  6516   */
86bd3e8e38707ae drivers/android/binder.c         Li Li              2024-12-09  6517  int binder_genl_nl_set_doit(struct sk_buff *skb, struct genl_info *info)
86bd3e8e38707ae drivers/android/binder.c         Li Li              2024-12-09  6518  {
86bd3e8e38707ae drivers/android/binder.c         Li Li              2024-12-09  6519  	int portid;
86bd3e8e38707ae drivers/android/binder.c         Li Li              2024-12-09  6520  	u32 pid;
86bd3e8e38707ae drivers/android/binder.c         Li Li              2024-12-09  6521  	u32 flags;
86bd3e8e38707ae drivers/android/binder.c         Li Li              2024-12-09  6522  	void *hdr;
86bd3e8e38707ae drivers/android/binder.c         Li Li              2024-12-09  6523  	struct binder_device *device;
86bd3e8e38707ae drivers/android/binder.c         Li Li              2024-12-09  6524  	struct binder_context *context = NULL;
86bd3e8e38707ae drivers/android/binder.c         Li Li              2024-12-09  6525  
86bd3e8e38707ae drivers/android/binder.c         Li Li              2024-12-09  6526  	hlist_for_each_entry(device, &binder_devices, hlist) {
86bd3e8e38707ae drivers/android/binder.c         Li Li              2024-12-09  6527  		if (!nla_strcmp(info->attrs[BINDER_GENL_A_CMD_CONTEXT],
86bd3e8e38707ae drivers/android/binder.c         Li Li              2024-12-09  6528  				device->context.name)) {
86bd3e8e38707ae drivers/android/binder.c         Li Li              2024-12-09  6529  			context = &device->context;
86bd3e8e38707ae drivers/android/binder.c         Li Li              2024-12-09  6530  			break;
86bd3e8e38707ae drivers/android/binder.c         Li Li              2024-12-09  6531  		}
86bd3e8e38707ae drivers/android/binder.c         Li Li              2024-12-09  6532  	}
86bd3e8e38707ae drivers/android/binder.c         Li Li              2024-12-09  6533  
86bd3e8e38707ae drivers/android/binder.c         Li Li              2024-12-09  6534  	if (!context) {
86bd3e8e38707ae drivers/android/binder.c         Li Li              2024-12-09 @6535  		NL_SET_ERR_MSG(info->extack, "Unknown binder context\n");
86bd3e8e38707ae drivers/android/binder.c         Li Li              2024-12-09  6536  		return -EINVAL;
86bd3e8e38707ae drivers/android/binder.c         Li Li              2024-12-09  6537  	}
86bd3e8e38707ae drivers/android/binder.c         Li Li              2024-12-09  6538  
86bd3e8e38707ae drivers/android/binder.c         Li Li              2024-12-09  6539  	portid = nlmsg_hdr(skb)->nlmsg_pid;
86bd3e8e38707ae drivers/android/binder.c         Li Li              2024-12-09  6540  	pid = nla_get_u32(info->attrs[BINDER_GENL_A_CMD_PID]);
86bd3e8e38707ae drivers/android/binder.c         Li Li              2024-12-09  6541  	flags = nla_get_u32(info->attrs[BINDER_GENL_A_CMD_FLAGS]);
86bd3e8e38707ae drivers/android/binder.c         Li Li              2024-12-09  6542  
86bd3e8e38707ae drivers/android/binder.c         Li Li              2024-12-09  6543  	if (context->report_portid && context->report_portid != portid) {
86bd3e8e38707ae drivers/android/binder.c         Li Li              2024-12-09  6544  		NL_SET_ERR_MSG_FMT(info->extack,
86bd3e8e38707ae drivers/android/binder.c         Li Li              2024-12-09  6545  				   "No permission to set flags from %d\n",
86bd3e8e38707ae drivers/android/binder.c         Li Li              2024-12-09  6546  				   portid);
86bd3e8e38707ae drivers/android/binder.c         Li Li              2024-12-09  6547  		return -EPERM;
86bd3e8e38707ae drivers/android/binder.c         Li Li              2024-12-09  6548  	}
86bd3e8e38707ae drivers/android/binder.c         Li Li              2024-12-09  6549  
86bd3e8e38707ae drivers/android/binder.c         Li Li              2024-12-09  6550  	if (binder_genl_set_report(context, pid, flags) < 0) {
86bd3e8e38707ae drivers/android/binder.c         Li Li              2024-12-09  6551  		pr_err("Failed to set report flags %u for %u\n", flags, pid);
86bd3e8e38707ae drivers/android/binder.c         Li Li              2024-12-09  6552  		return -EINVAL;
86bd3e8e38707ae drivers/android/binder.c         Li Li              2024-12-09  6553  	}
86bd3e8e38707ae drivers/android/binder.c         Li Li              2024-12-09  6554  
86bd3e8e38707ae drivers/android/binder.c         Li Li              2024-12-09  6555  	skb = genlmsg_new(GENLMSG_DEFAULT_SIZE, GFP_KERNEL);
86bd3e8e38707ae drivers/android/binder.c         Li Li              2024-12-09  6556  	if (!skb) {
86bd3e8e38707ae drivers/android/binder.c         Li Li              2024-12-09  6557  		pr_err("Failed to alloc binder genl reply message\n");
86bd3e8e38707ae drivers/android/binder.c         Li Li              2024-12-09  6558  		return -ENOMEM;
86bd3e8e38707ae drivers/android/binder.c         Li Li              2024-12-09  6559  	}
86bd3e8e38707ae drivers/android/binder.c         Li Li              2024-12-09  6560  
86bd3e8e38707ae drivers/android/binder.c         Li Li              2024-12-09  6561  	hdr = genlmsg_iput(skb, info);
86bd3e8e38707ae drivers/android/binder.c         Li Li              2024-12-09  6562  	if (!hdr)
86bd3e8e38707ae drivers/android/binder.c         Li Li              2024-12-09  6563  		goto free_skb;
86bd3e8e38707ae drivers/android/binder.c         Li Li              2024-12-09  6564  
86bd3e8e38707ae drivers/android/binder.c         Li Li              2024-12-09  6565  	if (nla_put_string(skb, BINDER_GENL_A_CMD_CONTEXT, context->name) ||
86bd3e8e38707ae drivers/android/binder.c         Li Li              2024-12-09  6566  	    nla_put_u32(skb, BINDER_GENL_A_CMD_PID, pid) ||
86bd3e8e38707ae drivers/android/binder.c         Li Li              2024-12-09  6567  	    nla_put_u32(skb, BINDER_GENL_A_CMD_FLAGS, flags))
86bd3e8e38707ae drivers/android/binder.c         Li Li              2024-12-09  6568  		goto cancel_skb;
86bd3e8e38707ae drivers/android/binder.c         Li Li              2024-12-09  6569  
86bd3e8e38707ae drivers/android/binder.c         Li Li              2024-12-09  6570  	genlmsg_end(skb, hdr);
86bd3e8e38707ae drivers/android/binder.c         Li Li              2024-12-09  6571  
86bd3e8e38707ae drivers/android/binder.c         Li Li              2024-12-09  6572  	if (genlmsg_reply(skb, info)) {
86bd3e8e38707ae drivers/android/binder.c         Li Li              2024-12-09  6573  		pr_err("Failed to send binder genl reply message\n");
86bd3e8e38707ae drivers/android/binder.c         Li Li              2024-12-09  6574  		return -EFAULT;
86bd3e8e38707ae drivers/android/binder.c         Li Li              2024-12-09  6575  	}
86bd3e8e38707ae drivers/android/binder.c         Li Li              2024-12-09  6576  
86bd3e8e38707ae drivers/android/binder.c         Li Li              2024-12-09  6577  	if (!context->report_portid)
86bd3e8e38707ae drivers/android/binder.c         Li Li              2024-12-09  6578  		context->report_portid = portid;
86bd3e8e38707ae drivers/android/binder.c         Li Li              2024-12-09  6579  
86bd3e8e38707ae drivers/android/binder.c         Li Li              2024-12-09  6580  	return 0;
86bd3e8e38707ae drivers/android/binder.c         Li Li              2024-12-09  6581  
86bd3e8e38707ae drivers/android/binder.c         Li Li              2024-12-09  6582  cancel_skb:
86bd3e8e38707ae drivers/android/binder.c         Li Li              2024-12-09  6583  	pr_err("Failed to add reply attributes to binder genl message\n");
86bd3e8e38707ae drivers/android/binder.c         Li Li              2024-12-09  6584  	genlmsg_cancel(skb, hdr);
86bd3e8e38707ae drivers/android/binder.c         Li Li              2024-12-09  6585  free_skb:
86bd3e8e38707ae drivers/android/binder.c         Li Li              2024-12-09  6586  	pr_err("Free binder genl reply message on error\n");
86bd3e8e38707ae drivers/android/binder.c         Li Li              2024-12-09  6587  	nlmsg_free(skb);
86bd3e8e38707ae drivers/android/binder.c         Li Li              2024-12-09  6588  	return -EMSGSIZE;
86bd3e8e38707ae drivers/android/binder.c         Li Li              2024-12-09  6589  }
86bd3e8e38707ae drivers/android/binder.c         Li Li              2024-12-09  6590  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
