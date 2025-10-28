Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 444FC1A9F9F
	for <oe-kbuild@lists.linux.dev>; Tue, 28 Oct 2025 16:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761668906; cv=none; b=nWE6kbOur1epehowAFuuK4eLLD13A23rpGYp3wFZ8t0tJ340bZ4QeaYBd5EfoOXJDFIVxr5CyIBuiGqSBbIzCkMkNnB3H2j7HFnZAxisOx/nj9/EuBUiF98x4oj2fx0B65fNsm1tiPIn2hG2ropsmeFEQo0r8IvWZLPiMlBoC2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761668906; c=relaxed/simple;
	bh=Egmyi/cC3GC3j9DRB2L84x8lwY2ZCu6Z9Eov76I56wo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T3sFCjeDhOYLrYUf/LuGX5jAPCWQT3dBKmk/H3ycAHFDYe6psnfk6y4ZeO3DQf94q0yRKp/JmDBXVOu7kw1e0UTE2gT4GNJJImDAwXmBjhK0Rvu8URkdRrz1hmsSZV8JK3sybUTG8QzVLiuHueEnOuDeWXiUbirDRDOzD5j22uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nEDCfOuh; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nEDCfOuh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761668904; x=1793204904;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Egmyi/cC3GC3j9DRB2L84x8lwY2ZCu6Z9Eov76I56wo=;
  b=nEDCfOuhykCxecLbrBF+wUssW0/cRK7lh9Sc9BqkBMwORI2iFlZSlihs
   4OFzzn7U3c3FTw6WaORtCNzrmn6XtqkXbnfdgWO7JJl7FWF91xNe7VrjI
   +7oQCjWj51l7UkNaYiSF66KzJVif5WrKXhnSJFkWfkEfXtqXzEugiXv6X
   pAucq/IcENse4jjlcOaLJ2ZATKFgqZXA4xdcvyKMS7ricIU1jtY1uRYiR
   ab9LyjVlheQddsHv8WDsoeIxeK/PzuE90wT2ZxBWYfZmqF6x2hhvORoXi
   ToRfkH+bschLLx9BqCBW69+00tN2cntuxX+dHncBm/X09aKfIjMfFcORo
   w==;
X-CSE-ConnectionGUID: 8+Lw8R1mQvex3ugrZH6jLQ==
X-CSE-MsgGUID: /rYEKE7NTsOmwZOUEPvXWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="81405937"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="81405937"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 09:28:23 -0700
X-CSE-ConnectionGUID: IqIdCkjeTFetp17CBnEoKw==
X-CSE-MsgGUID: qKYfRxSOSlCzOHtiPP8+7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="216054169"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 28 Oct 2025 09:28:22 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDmYP-000JPr-29;
	Tue, 28 Oct 2025 16:28:15 +0000
Date: Wed, 29 Oct 2025 00:27:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/nvme/common/keyring.c:117:14-21: WARNING: Consider using %pe
 to print PTR_ERR()
Message-ID: <202510290001.7fbZ12C3-lkp@intel.com>
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
TO: Hannes Reinecke <hare@kernel.org>
CC: Keith Busch <kbusch@kernel.org>
CC: Sagi Grimberg <sagi@grimberg.me>

Hi Hannes,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fd57572253bc356330dbe5b233c2e1d8426c66fd
commit: e88a7595b57f2a04f1be796419444b4a14a55d18 nvme-tcp: request secure channel concatenation
date:   7 months ago
:::::: branch date: 23 hours ago
:::::: commit date: 7 months ago
config: i386-randconfig-052-20251028 (https://download.01.org/0day-ci/archive/20251029/202510290001.7fbZ12C3-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202510290001.7fbZ12C3-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/nvme/common/keyring.c:117:14-21: WARNING: Consider using %pe to print PTR_ERR()
   drivers/nvme/common/keyring.c:175:14-21: WARNING: Consider using %pe to print PTR_ERR()

vim +117 drivers/nvme/common/keyring.c

3bac969b16b7bc3 Hannes Reinecke 2023-08-24   90  
3bac969b16b7bc3 Hannes Reinecke 2023-08-24   91  static struct key *nvme_tls_psk_lookup(struct key *keyring,
3bac969b16b7bc3 Hannes Reinecke 2023-08-24   92  		const char *hostnqn, const char *subnqn,
79559c753324589 Hannes Reinecke 2024-07-22   93  		u8 hmac, u8 psk_ver, bool generated)
3bac969b16b7bc3 Hannes Reinecke 2023-08-24   94  {
3bac969b16b7bc3 Hannes Reinecke 2023-08-24   95  	char *identity;
3bac969b16b7bc3 Hannes Reinecke 2023-08-24   96  	size_t identity_len = (NVMF_NQN_SIZE) * 2 + 11;
3bac969b16b7bc3 Hannes Reinecke 2023-08-24   97  	key_ref_t keyref;
3bac969b16b7bc3 Hannes Reinecke 2023-08-24   98  	key_serial_t keyring_id;
3bac969b16b7bc3 Hannes Reinecke 2023-08-24   99  
3bac969b16b7bc3 Hannes Reinecke 2023-08-24  100  	identity = kzalloc(identity_len, GFP_KERNEL);
3bac969b16b7bc3 Hannes Reinecke 2023-08-24  101  	if (!identity)
3bac969b16b7bc3 Hannes Reinecke 2023-08-24  102  		return ERR_PTR(-ENOMEM);
3bac969b16b7bc3 Hannes Reinecke 2023-08-24  103  
79559c753324589 Hannes Reinecke 2024-07-22  104  	snprintf(identity, identity_len, "NVMe%u%c%02u %s %s",
79559c753324589 Hannes Reinecke 2024-07-22  105  		 psk_ver, generated ? 'G' : 'R', hmac, hostnqn, subnqn);
3bac969b16b7bc3 Hannes Reinecke 2023-08-24  106  
3bac969b16b7bc3 Hannes Reinecke 2023-08-24  107  	if (!keyring)
3bac969b16b7bc3 Hannes Reinecke 2023-08-24  108  		keyring = nvme_keyring;
3bac969b16b7bc3 Hannes Reinecke 2023-08-24  109  	keyring_id = key_serial(keyring);
3bac969b16b7bc3 Hannes Reinecke 2023-08-24  110  	pr_debug("keyring %x lookup tls psk '%s'\n",
3bac969b16b7bc3 Hannes Reinecke 2023-08-24  111  		 keyring_id, identity);
3bac969b16b7bc3 Hannes Reinecke 2023-08-24  112  	keyref = keyring_search(make_key_ref(keyring, true),
3bac969b16b7bc3 Hannes Reinecke 2023-08-24  113  				&nvme_tls_psk_key_type,
3bac969b16b7bc3 Hannes Reinecke 2023-08-24  114  				identity, false);
3bac969b16b7bc3 Hannes Reinecke 2023-08-24  115  	if (IS_ERR(keyref)) {
3bac969b16b7bc3 Hannes Reinecke 2023-08-24  116  		pr_debug("lookup tls psk '%s' failed, error %ld\n",
3bac969b16b7bc3 Hannes Reinecke 2023-08-24 @117  			 identity, PTR_ERR(keyref));
3bac969b16b7bc3 Hannes Reinecke 2023-08-24  118  		kfree(identity);
3bac969b16b7bc3 Hannes Reinecke 2023-08-24  119  		return ERR_PTR(-ENOKEY);
3bac969b16b7bc3 Hannes Reinecke 2023-08-24  120  	}
3bac969b16b7bc3 Hannes Reinecke 2023-08-24  121  	kfree(identity);
3bac969b16b7bc3 Hannes Reinecke 2023-08-24  122  
3bac969b16b7bc3 Hannes Reinecke 2023-08-24  123  	return key_ref_to_ptr(keyref);
3bac969b16b7bc3 Hannes Reinecke 2023-08-24  124  }
3bac969b16b7bc3 Hannes Reinecke 2023-08-24  125  

:::::: The code at line 117 was first introduced by commit
:::::: 3bac969b16b7bc304ba56d030847920fc7073a91 nvme-keyring: define a 'psk' keytype

:::::: TO: Hannes Reinecke <hare@suse.de>
:::::: CC: Keith Busch <kbusch@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
