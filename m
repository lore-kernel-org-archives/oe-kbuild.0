Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41553F4FA
	for <oe-kbuild@lists.linux.dev>; Sun, 19 Oct 2025 05:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760853219; cv=none; b=qyZbK6bz/IoGOzY/0uXuyVabA+qGlwHq7OpL9ioKyJMhCcLeQHI0gLI+Km5tr6c7Y1gcOFRVUxEXIpstMC4xhHUgkKX0zdM4TeFHIHo0wrwpWrqJNv+wNYbwAE9jhysb3Wh6RFUqSR4BJcumJ2Kqdu6jwdv7Sg9MwV4KFbEJ8dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760853219; c=relaxed/simple;
	bh=qlZD2Msz+zpVkGnQn5tvQjc2JsLhMfGTJtfNLqyhkTs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s7Yr07E9XrivFgA1/V8Tuk/WUpSTDCfD/zW5dNdMuvl1VNxEqM3pCCMyom3HyZXGgMDcS+BQtEh7QnyUvmXaeUcokHADwf3jLr3A8iG3YE23fQH8RkJdDHbhCEuCnTHhzU027HTKSCGovKnqKHg3Daow1Q4pV07Svg7LAEW6VoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VtwpECWz; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VtwpECWz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760853217; x=1792389217;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qlZD2Msz+zpVkGnQn5tvQjc2JsLhMfGTJtfNLqyhkTs=;
  b=VtwpECWz2z/ecM5OPOzgplh9idT+Sze7gb0Xwf/Z82jz6a1mV0s7B48w
   RHWcjk6BdHI2Ntfa5r36iUGiFZIB2+RpewUVgZYuXgkP/brBI0pG5bvuk
   oylGxT7rijyuvLWhjGMvJp2ojCBNNo4ZxZahKKWOeAlp7prUUa6iUeUel
   1/xIpjgL63IT4kK3Y4aVGtx1OmCqAaFOb8TMEumWh+mizfSrPDslDpHTO
   XUTJW4JLFS5QC3NuK26rV0G4TAbWoOFOa2SnXvsWvObXJcGVIMMaeyEKK
   jgg0q/JfNkVhUHlnor694FkGg9tAf5PZNbgfwNG6zdUEBmyZ9dDKsNCG5
   A==;
X-CSE-ConnectionGUID: QhFMxOdQSbOF6NrVGOjM9A==
X-CSE-MsgGUID: eCEZ833VToCAV0jgQAyHkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63159161"
X-IronPort-AV: E=Sophos;i="6.19,239,1754982000"; 
   d="scan'208";a="63159161"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2025 22:53:37 -0700
X-CSE-ConnectionGUID: pvgEehAUSJ2rJ9FqQ/TwwA==
X-CSE-MsgGUID: Fv+9EZohSC6AFnhUwpgcMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,239,1754982000"; 
   d="scan'208";a="183831287"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 18 Oct 2025 22:53:35 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vAMMH-0008sb-0k;
	Sun, 19 Oct 2025 05:53:33 +0000
Date: Sun, 19 Oct 2025 13:52:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCHv4 net-next 1/4] net: add a common function to compute
 features from lowers devices
Message-ID: <202510191336.5MademAX-lkp@intel.com>
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
In-Reply-To: <20251014080217.47988-2-liuhangbin@gmail.com>
References: <20251014080217.47988-2-liuhangbin@gmail.com>
TO: Hangbin Liu <liuhangbin@gmail.com>
TO: netdev@vger.kernel.org
CC: Jay Vosburgh <jv@jvosburgh.net>
CC: Andrew Lunn <andrew+netdev@lunn.ch>
CC: Eric Dumazet <edumazet@google.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Paolo Abeni <pabeni@redhat.com>
CC: Sabrina Dubroca <sdubroca@redhat.com>
CC: Jiri Pirko <jiri@resnulli.us>
CC: Simon Horman <horms@kernel.org>
CC: Ido Schimmel <idosch@nvidia.com>
CC: Shuah Khan <skhan@linuxfoundation.org>
CC: Stanislav Fomichev <sdf@fomichev.me>
CC: Kuniyuki Iwashima <kuniyu@google.com>
CC: Alexander Lobakin <aleksander.lobakin@intel.com>
CC: bridge@lists.linux.dev
CC: linux-kselftest@vger.kernel.org
CC: Hangbin Liu <liuhangbin@gmail.com>

Hi Hangbin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Hangbin-Liu/net-add-a-common-function-to-compute-features-from-lowers-devices/20251014-160824
base:   net-next/main
patch link:    https://lore.kernel.org/r/20251014080217.47988-2-liuhangbin%40gmail.com
patch subject: [PATCHv4 net-next 1/4] net: add a common function to compute features from lowers devices
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: i386-randconfig-141-20251015 (https://download.01.org/0day-ci/archive/20251019/202510191336.5MademAX-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510191336.5MademAX-lkp@intel.com/

New smatch warnings:
net/core/dev.c:12676 netdev_compute_features_from_lowers() error: uninitialized symbol 'max_headroom'.
net/core/dev.c:12678 netdev_compute_features_from_lowers() error: uninitialized symbol 'max_tailroom'.

Old smatch warnings:
net/core/dev.c:12703 netdev_compute_features_from_lowers() error: uninitialized symbol 'max_headroom'.
net/core/dev.c:12704 netdev_compute_features_from_lowers() error: uninitialized symbol 'max_tailroom'.

vim +/max_headroom +12676 net/core/dev.c

93045b1e9511f0f Hangbin Liu 2025-10-14  12666  
93045b1e9511f0f Hangbin Liu 2025-10-14  12667  		mpls_features = netdev_increment_features(mpls_features,
93045b1e9511f0f Hangbin Liu 2025-10-14  12668  							  lower_dev->mpls_features,
93045b1e9511f0f Hangbin Liu 2025-10-14  12669  							  VIRTUAL_DEV_MPLS_FEATURES);
93045b1e9511f0f Hangbin Liu 2025-10-14  12670  
93045b1e9511f0f Hangbin Liu 2025-10-14  12671  		dst_release_flag &= lower_dev->priv_flags;
93045b1e9511f0f Hangbin Liu 2025-10-14  12672  
93045b1e9511f0f Hangbin Liu 2025-10-14  12673  		if (update_header) {
93045b1e9511f0f Hangbin Liu 2025-10-14  12674  			max_header_len = max_t(unsigned short, max_header_len,
93045b1e9511f0f Hangbin Liu 2025-10-14  12675  					lower_dev->hard_header_len);
93045b1e9511f0f Hangbin Liu 2025-10-14 @12676  			max_headroom = max_t(unsigned short, max_headroom,
93045b1e9511f0f Hangbin Liu 2025-10-14  12677  					lower_dev->needed_headroom);
93045b1e9511f0f Hangbin Liu 2025-10-14 @12678  			max_tailroom = max_t(unsigned short, max_tailroom,
93045b1e9511f0f Hangbin Liu 2025-10-14  12679  					lower_dev->needed_tailroom);
93045b1e9511f0f Hangbin Liu 2025-10-14  12680  		}
93045b1e9511f0f Hangbin Liu 2025-10-14  12681  
93045b1e9511f0f Hangbin Liu 2025-10-14  12682  		tso_max_size = min(tso_max_size, lower_dev->tso_max_size);
93045b1e9511f0f Hangbin Liu 2025-10-14  12683  		tso_max_segs = min(tso_max_segs, lower_dev->tso_max_segs);
93045b1e9511f0f Hangbin Liu 2025-10-14  12684  	}
93045b1e9511f0f Hangbin Liu 2025-10-14  12685  
93045b1e9511f0f Hangbin Liu 2025-10-14  12686  	dev->gso_partial_features = gso_partial_features;
93045b1e9511f0f Hangbin Liu 2025-10-14  12687  	dev->vlan_features = vlan_features;
93045b1e9511f0f Hangbin Liu 2025-10-14  12688  	dev->hw_enc_features = enc_features | NETIF_F_GSO_ENCAP_ALL |
93045b1e9511f0f Hangbin Liu 2025-10-14  12689  				    NETIF_F_HW_VLAN_CTAG_TX |
93045b1e9511f0f Hangbin Liu 2025-10-14  12690  				    NETIF_F_HW_VLAN_STAG_TX;
93045b1e9511f0f Hangbin Liu 2025-10-14  12691  #ifdef CONFIG_XFRM_OFFLOAD
93045b1e9511f0f Hangbin Liu 2025-10-14  12692  	dev->hw_enc_features |= xfrm_features;
93045b1e9511f0f Hangbin Liu 2025-10-14  12693  #endif
93045b1e9511f0f Hangbin Liu 2025-10-14  12694  	dev->mpls_features = mpls_features;
93045b1e9511f0f Hangbin Liu 2025-10-14  12695  
93045b1e9511f0f Hangbin Liu 2025-10-14  12696  	dev->priv_flags &= ~IFF_XMIT_DST_RELEASE;
93045b1e9511f0f Hangbin Liu 2025-10-14  12697  	if ((dev->priv_flags & IFF_XMIT_DST_RELEASE_PERM) &&
93045b1e9511f0f Hangbin Liu 2025-10-14  12698  	    dst_release_flag == (IFF_XMIT_DST_RELEASE | IFF_XMIT_DST_RELEASE_PERM))
93045b1e9511f0f Hangbin Liu 2025-10-14  12699  		dev->priv_flags |= IFF_XMIT_DST_RELEASE;
93045b1e9511f0f Hangbin Liu 2025-10-14  12700  
93045b1e9511f0f Hangbin Liu 2025-10-14  12701  	if (update_header) {
93045b1e9511f0f Hangbin Liu 2025-10-14  12702  		dev->hard_header_len = max_header_len;
93045b1e9511f0f Hangbin Liu 2025-10-14  12703  		dev->needed_headroom = max_headroom;
93045b1e9511f0f Hangbin Liu 2025-10-14  12704  		dev->needed_tailroom = max_tailroom;
93045b1e9511f0f Hangbin Liu 2025-10-14  12705  	}
93045b1e9511f0f Hangbin Liu 2025-10-14  12706  
93045b1e9511f0f Hangbin Liu 2025-10-14  12707  	netif_set_tso_max_segs(dev, tso_max_segs);
93045b1e9511f0f Hangbin Liu 2025-10-14  12708  	netif_set_tso_max_size(dev, tso_max_size);
93045b1e9511f0f Hangbin Liu 2025-10-14  12709  
93045b1e9511f0f Hangbin Liu 2025-10-14  12710  	netdev_change_features(dev);
93045b1e9511f0f Hangbin Liu 2025-10-14  12711  }
93045b1e9511f0f Hangbin Liu 2025-10-14  12712  EXPORT_SYMBOL(netdev_compute_features_from_lowers);
93045b1e9511f0f Hangbin Liu 2025-10-14  12713  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
