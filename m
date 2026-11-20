Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795205511;
	b=mtggSnTNiy6Kv9Oue+BrPxrvJ71z6aWHJmrelY50WgqZrZLtJ3EQ5spWqzYq1rH/t78U
	 DpwROt3qei1AJmNUhrbSMGXzdU0EG+44YQKBni/qs7LdNdVDNVF/yOs6aYcMDLf/HqTFB
	 4SYgDL4iHtaKQkSx6IcGcMqfhuYhePSE0WxVGtDdvFT7SsCULmqSE8wgyRvAwGxaNaehg
	 ke8Nb5FlJtUE2ByfLO1+tIC7F4sZAvCld5HLixNZh3iul0uLjlPWG1AeOt50rDZqSsJx2
	 NlBPyYILNxF7chRv0jrtgdeWUr6TJWak5Pl30V5rrpBEzwwjTdUvdueRdilfIceeORg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795205511;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=sXrKDPFId300ONm3496Cp7KjCrfEiVZAVoLTCTTk3i0=;
	b=ZNjKVs8rCU+etEtRAQHJN4+QUEbG11lNJ1g7jldd4S9qvvEUR7EtWZXk9Q0yYCgUHc6J
	 kYRRC6nwi7HKHiyeanZlzOub7gF8Q7SyZEE0vyGFE5Cc8uLSS/pOrsE0iq9uyFx4n01Je
	 YlXCkLG140KUspl4V9+/Hj4fSlwQ94BlD3aqMvvx3PM+gVTNZrqEQ0zFJFzJLEE5D7Xud
	 t3ZLxtlr4z3rgqB8dzxnwji2UA+bMzVt/Q3pXsLINI77o+Uv/56Cqf53fgaKC11/uahsh
	 OUBnQCcqwSOrSjbzTroOs758ZKVJfIJixzkbSRmHEYZ85828P5DIWVaw3kxD5pFoDyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="P6j/sG0o";
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E62606A6DD
	for <oe-kbuild@lists.linux.dev>; Fri, 20 Nov 2026 20:11:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84E62606A6DD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=P6j/sG0o
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795205508; x=1826741508;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6KrFBTx3pIunQsGSuYNCTwWLt+YBeaE/RkMaFotxx6E=;
  b=P6j/sG0omSV91KZk+a+bOas8SS41ddm+kiyi3zF9NludnKotyeSyROBm
   +RJJGNvFn0+oBK1Xmw+fpKckuestM6iPLZfr+2tV6bBQqznfwG3TQ9nj0
   aCxC9U1rjuECh9qwWzDb5tXdXUhbIPSCKUh5ixsTlhCDVsGZkG01m+0OC
   WbEE3L8VpRAoL3vmuR+gokSX49jpGTV/nVHiGM8skRvu9rzrfGqqk/SZw
   IT6uf7p1dOoghyCdh3WfwFMfY6FFu6fWqmETFE47jI6OxDSbA7RuOrGHw
   7KglTvmstrgJF36mTUilzEe6OxEiCMaAV7gs83WtEEOlMBI8+MniqSrQ7
   g==;
X-CSE-ConnectionGUID: mnYWicH5RkyrA364cuJXgQ==
X-CSE-MsgGUID: 84iZFG83QwuUClEQwR4G8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="3974426"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="3974426"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 12:11:48 -0800
X-CSE-ConnectionGUID: 088fn7GeRSyj6cqo/o+aTA==
X-CSE-MsgGUID: ZruT0G0SQhCflQP5OHeOcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="12484835"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa012.fm.intel.com with ESMTP; 20 Nov 2026 12:11:47 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUUxU-00000001ISi-3FM8;
	Fri, 20 Nov 2026 20:11:44 +0000
Date: Sat, 21 Nov 2026 04:11:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v4 3/9] nvme-auth: switch to use 'struct key'
Message-ID: <202611210433.kaUKHSYE-lkp@intel.com>
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "same reports for this branch"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20261120-dhchap-keyring-v4-v4-3-5f8c7d9926ee@kernel.org>
References: <20261120-dhchap-keyring-v4-v4-3-5f8c7d9926ee@kernel.org>
TO: Hannes Reinecke <hare@kernel.org>
TO: Keith Busch <kbusch@kernel.org>
TO: Jens Axboe <axboe@kernel.dk>
TO: Christoph Hellwig <hch@lst.de>
TO: Sagi Grimberg <sagi@grimberg.me>
TO: Hannes Reinecke <hare@suse.de>
TO: Chaitanya Kulkarni <kch@nvidia.com>
CC: linux-nvme@lists.infradead.org
CC: linux-kernel@vger.kernel.org

Hi Hannes,

kernel test robot noticed the following build errors:

[auto build test ERROR on 68099cf27253a8c89d703a282d3d811446d9453b]

url:    https://github.com/intel-lab-lkp/linux/commits/Hannes-Reinecke/nvme-auth-modify-nvme_auth_transform_key-to-return-status/20261120-121400
base:   68099cf27253a8c89d703a282d3d811446d9453b
patch link:    https://lore.kernel.org/r/20261120-dhchap-keyring-v4-v4-3-5f8c7d9926ee%40kernel.org
patch subject: [PATCH v4 3/9] nvme-auth: switch to use 'struct key'
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: nios2-randconfig-1000-20261120 (https://download.01.org/0day-ci/archive/20261121/202611210433.kaUKHSYE-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261121/202611210433.kaUKHSYE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611210433.kaUKHSYE-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/nvme/host/fabrics.c:15:
>> include/linux/nvme-keyring.h:54:1: error: expected identifier or '(' before '{' token
      54 | {
         | ^
>> include/linux/nvme-keyring.h:57:4: warning: no previous prototype for 'nvme_dhchap_psk_hash' [-Wmissing-prototypes]
      57 | u8 nvme_dhchap_psk_hash(struct key *key)
         |    ^~~~~~~~~~~~~~~~~~~~
>> include/linux/nvme-keyring.h:52:27: warning: 'nvme_dhchap_psk_lookup' declared 'static' but never defined [-Wunused-function]
      52 | static inline struct key *nvme_dhchap_psk_lookup(struct key *keyring,
         |                           ^~~~~~~~~~~~~~~~~~~~~~


vim +54 include/linux/nvme-keyring.h

50d8f97114b492 Hannes Reinecke 2026-11-20  26  
9d77eb52778499 Hannes Reinecke 2023-08-24  27  #else
62eb89323cb08f Hannes Reinecke 2025-02-24  28  static inline struct key *nvme_tls_psk_refresh(struct key *keyring,
62eb89323cb08f Hannes Reinecke 2025-02-24  29  		u8 *data, size_t data_len, const char *digest)
62eb89323cb08f Hannes Reinecke 2025-02-24  30  {
50d8f97114b492 Hannes Reinecke 2026-11-20  31  	return ERR_PTR(-EOPNOTSUPP);
62eb89323cb08f Hannes Reinecke 2025-02-24  32  }
501cc6f4aca8dc Hannes Reinecke 2023-08-24  33  static inline key_serial_t nvme_tls_psk_default(struct key *keyring,
501cc6f4aca8dc Hannes Reinecke 2023-08-24  34  		const char *hostnqn, const char *subnqn)
501cc6f4aca8dc Hannes Reinecke 2023-08-24  35  {
501cc6f4aca8dc Hannes Reinecke 2023-08-24  36  	return 0;
501cc6f4aca8dc Hannes Reinecke 2023-08-24  37  }
9d77eb52778499 Hannes Reinecke 2023-08-24  38  static inline key_serial_t nvme_keyring_id(void)
9d77eb52778499 Hannes Reinecke 2023-08-24  39  {
9d77eb52778499 Hannes Reinecke 2023-08-24  40  	return 0;
9d77eb52778499 Hannes Reinecke 2023-08-24  41  }
5bc46b49c828a6 Hannes Reinecke 2024-07-22  42  static inline struct key *nvme_tls_key_lookup(key_serial_t key_id)
5bc46b49c828a6 Hannes Reinecke 2024-07-22  43  {
50d8f97114b492 Hannes Reinecke 2026-11-20  44  	return ERR_PTR(-EOPNOTSUPP);
50d8f97114b492 Hannes Reinecke 2026-11-20  45  }
50d8f97114b492 Hannes Reinecke 2026-11-20  46  static inline struct key *nvme_dhchap_psk_refresh(struct key *keyring,
50d8f97114b492 Hannes Reinecke 2026-11-20  47  		const char *hostnqn, const char *subnqn,
50d8f97114b492 Hannes Reinecke 2026-11-20  48  		u8 *data, size_t data_len)
50d8f97114b492 Hannes Reinecke 2026-11-20  49  {
50d8f97114b492 Hannes Reinecke 2026-11-20  50  	return ERR_PTR(-EOPNOTSUPP);
50d8f97114b492 Hannes Reinecke 2026-11-20  51  }
50d8f97114b492 Hannes Reinecke 2026-11-20 @52  static inline struct key *nvme_dhchap_psk_lookup(struct key *keyring,
50d8f97114b492 Hannes Reinecke 2026-11-20  53  		const char *hostnqn, const char *subnqn, u8 hmac);
50d8f97114b492 Hannes Reinecke 2026-11-20 @54  {
50d8f97114b492 Hannes Reinecke 2026-11-20  55  	return ERR_PTR(-EOPNOTSUPP);
50d8f97114b492 Hannes Reinecke 2026-11-20  56  }
50d8f97114b492 Hannes Reinecke 2026-11-20 @57  u8 nvme_dhchap_psk_hash(struct key *key)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
