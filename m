Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D9630CD84
	for <oe-kbuild@lists.linux.dev>; Thu, 28 Aug 2025 18:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756406497; cv=none; b=uxwArEpsxKW1O8FDFDcX00d/TabFzPfQPGk1kZ7dehNgFQ42mSX/wOnA9Tbs6LWBLsXxpzETuuKUEVSXqQGy96rS9jMEk/r8abkKrAmC+LvZyIgmDqKrL+E3z/PhEzhYjQ0qiSpIAKpsXahvtW/t4rSagQRKLyILvPBJannVVTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756406497; c=relaxed/simple;
	bh=W/XIqwoYT2i2o+So3VJkJj3+3IoH1enMdNxhiZmN/TA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a9OqcnUrZ9uIFHJaYf5Gsro3O5QWqo+d1YTTuR7Z5U07bj54VcVMoAsx2nQSXayG0PT+NuFIAQXolh4F+GB/ftnBAL2priyJNI3vncd8TsRiYrRFF9xm3xAdQZ/2Oa1yLzT3rwZw8178BfFmNUjtIibNrUwgZE3CNNnXUwOJVrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AAkYbScV; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AAkYbScV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756406495; x=1787942495;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W/XIqwoYT2i2o+So3VJkJj3+3IoH1enMdNxhiZmN/TA=;
  b=AAkYbScVxoVLmUsix6nhn4Llvu8BvIQExhrWPAQakpkqY6SpEmuFXTT4
   hACSYcwlpp3fXG8+1klpC+xEtB6GIrUwNdZRUQAbE6dgz5uksnhZm8nQ4
   daGa6WKl0WwcJXc0cFfj+4t+IGsd5IAZxZGxt4vsXaNXWlDhn8jFX5bev
   Q6NEv1spxweQ9O1RLM3dcI694zuGDULEaHuldAMGVMGhCNLJtCEGxe/ce
   jec97pw2cTfuQ7zIA03llqGLkwYbiWsUAf5jtAPdoYw32BndEe5F59pTW
   KIYYY3gfC4FWGlkiJTV1Gh+Gzd2gbu+Cvv4J9f42/vK7j0KVQ4ZrZEaVS
   w==;
X-CSE-ConnectionGUID: uouEvd0GTKm88gvzp9T9Zg==
X-CSE-MsgGUID: Gu39fp9MQUSqRSsoMOEoCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="76288145"
X-IronPort-AV: E=Sophos;i="6.18,220,1751266800"; 
   d="scan'208";a="76288145"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2025 11:41:34 -0700
X-CSE-ConnectionGUID: Z89ZfhPZRr+SX6nD9CyVyw==
X-CSE-MsgGUID: ybx/+7uRT+OY0Z5qf5D4YA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,220,1751266800"; 
   d="scan'208";a="170580982"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 28 Aug 2025 11:41:33 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1urhYG-000Twt-0x;
	Thu, 28 Aug 2025 18:40:59 +0000
Date: Fri, 29 Aug 2025 02:40:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH net-next 11/11] virtio_net: Add get ethtool flow rules ops
Message-ID: <202508290203.AzlaAntz-lkp@intel.com>
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
In-Reply-To: <20250827183852.2471-12-danielj@nvidia.com>
References: <20250827183852.2471-12-danielj@nvidia.com>
TO: Daniel Jurgens <danielj@nvidia.com>
TO: netdev@vger.kernel.org
TO: mst@redhat.com
TO: jasowang@redhat.com
TO: alex.williamson@redhat.com
TO: virtualization@lists.linux.dev
TO: pabeni@redhat.com
CC: parav@nvidia.com
CC: shshitrit@nvidia.com
CC: yohadt@nvidia.com
CC: Daniel Jurgens <danielj@nvidia.com>

Hi Daniel,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Jurgens/virtio-pci-Expose-generic-device-capability-operations/20250828-024128
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250827183852.2471-12-danielj%40nvidia.com
patch subject: [PATCH net-next 11/11] virtio_net: Add get ethtool flow rules ops
:::::: branch date: 24 hours ago
:::::: commit date: 24 hours ago
config: x86_64-randconfig-r073-20250828 (https://download.01.org/0day-ci/archive/20250829/202508290203.AzlaAntz-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508290203.AzlaAntz-lkp@intel.com/

New smatch warnings:
drivers/net/virtio_net/virtio_net_ff.c:850 virtnet_ethtool_get_all_flows() warn: iterator 'i' not incremented

Old smatch warnings:
drivers/net/virtio_net/virtio_net_ff.c:321 setup_classifier() warn: iterator 'i' not incremented
drivers/net/virtio_net/virtio_net_ff.c:1014 virtnet_ff_cleanup() warn: iterator 'i' not incremented

vim +/i +850 drivers/net/virtio_net/virtio_net_ff.c

5e0d228c07c140 Daniel Jurgens 2025-08-27  838  
5e0d228c07c140 Daniel Jurgens 2025-08-27  839  int
5e0d228c07c140 Daniel Jurgens 2025-08-27  840  virtnet_ethtool_get_all_flows(struct virtnet_ff *ff,
5e0d228c07c140 Daniel Jurgens 2025-08-27  841  			      struct ethtool_rxnfc *info, u32 *rule_locs)
5e0d228c07c140 Daniel Jurgens 2025-08-27  842  {
5e0d228c07c140 Daniel Jurgens 2025-08-27  843  	struct virtnet_ethtool_rule *eth_rule;
5e0d228c07c140 Daniel Jurgens 2025-08-27  844  	unsigned long i = 0;
5e0d228c07c140 Daniel Jurgens 2025-08-27  845  	int idx = 0;
5e0d228c07c140 Daniel Jurgens 2025-08-27  846  
5e0d228c07c140 Daniel Jurgens 2025-08-27  847  	if (!ff->ff_supported)
5e0d228c07c140 Daniel Jurgens 2025-08-27  848  		return -EOPNOTSUPP;
5e0d228c07c140 Daniel Jurgens 2025-08-27  849  
5e0d228c07c140 Daniel Jurgens 2025-08-27 @850  	xa_for_each(&ff->ethtool.rules, i, eth_rule)
5e0d228c07c140 Daniel Jurgens 2025-08-27  851  		rule_locs[idx++] = i;
5e0d228c07c140 Daniel Jurgens 2025-08-27  852  
5e0d228c07c140 Daniel Jurgens 2025-08-27  853  	info->data = le32_to_cpu(ff->ff_caps->rules_limit);
5e0d228c07c140 Daniel Jurgens 2025-08-27  854  
5e0d228c07c140 Daniel Jurgens 2025-08-27  855  	return 0;
5e0d228c07c140 Daniel Jurgens 2025-08-27  856  }
5e0d228c07c140 Daniel Jurgens 2025-08-27  857  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
