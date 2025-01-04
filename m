Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8CC61D5171
	for <oe-kbuild@lists.linux.dev>; Sat,  4 Jan 2025 22:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736029475; cv=none; b=HgW3wahYjTiyrv83OsjvgRKzvkQzTdWKxsoj+uqo61ok4gg0tY3tXYxp93ZP5ZVekEV2DjxmX/UTMOp/6lfOsryy68ECHxTFaONrqBaUG+bRg/ugk0YfAnSZ/35T9/N11cTAxW40qD9XFdEH6jX9HG9P0hSWjNKtI6Bnl2TS7VU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736029475; c=relaxed/simple;
	bh=RKiaKtZiKLs/alTH80tMiKCcg/2jLtSlctgd7ztSvPo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qYTiPn3aUqNWSF0W20D1e3+sZVaPyyAe05R70KGUyeOzwTeFVNrRAG5F5CGFnGrczUIAtye982tzjfzFlZsYgGZa3H1tXRRBlSzYrTEipYVeL3jfQQ9R7rOa1yzWuZd0p6pfaNejn3ky4g/4P0+OAe0ni8FMWP5SORul5Q+y/js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y9KpTRg9; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y9KpTRg9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736029473; x=1767565473;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RKiaKtZiKLs/alTH80tMiKCcg/2jLtSlctgd7ztSvPo=;
  b=Y9KpTRg9Mw4Whdh5N+slMmvZ4l+OAJWMftzaihz54xLPd1kTawVMnAGO
   MnslZ3ZV6kFTOPdn0iLEzhJxDmHzlIpI6tAaBJkqucBh7sH7j4eS7k6sN
   7lxnY3rUVRH4Hvf3S6gEyJTsmsPINtqrAzHqT1UcXE4lmV1XqRbB+pKdn
   KrUwjuLQBuYFwWrVINeIxH04tVOBb0GIuyuJYMgtiNvqUO2jwtd7XHm+/
   X6K4bJn2Gp2WiItq5yVu8P0da4gXngPVu6IWvposckYq8u3Rh6crwh+gV
   qQRWWOeraceXJVXtjeD1QcUQlB0guUX0vM0iJ44RraudW0Au3d1raM0KK
   Q==;
X-CSE-ConnectionGUID: rs8vy434RiKHQ4FGDLkZAA==
X-CSE-MsgGUID: 7q0dHo6FQdWQCI0Eolr9QQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11305"; a="39911678"
X-IronPort-AV: E=Sophos;i="6.12,289,1728975600"; 
   d="scan'208";a="39911678"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2025 14:24:32 -0800
X-CSE-ConnectionGUID: bTLqtyzMReqrT1omjOrYnQ==
X-CSE-MsgGUID: WivNuW0KRk21Wma00buvkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,289,1728975600"; 
   d="scan'208";a="102600549"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 04 Jan 2025 14:24:31 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tUCZI-000BGd-36;
	Sat, 04 Jan 2025 22:24:28 +0000
Date: Sun, 5 Jan 2025 06:23:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [Intel-wired-lan] [PATCH net-next v3 3/6] net: napi: add CPU
 affinity to napi_config
Message-ID: <202501050625.nY1c97EX-lkp@intel.com>
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
In-Reply-To: <20250104004314.208259-4-ahmed.zaki@intel.com>
References: <20250104004314.208259-4-ahmed.zaki@intel.com>
TO: Ahmed Zaki <ahmed.zaki@intel.com>
TO: netdev@vger.kernel.org
CC: intel-wired-lan@lists.osuosl.org
CC: andrew+netdev@lunn.ch
CC: edumazet@google.com
CC: kuba@kernel.org
CC: pabeni@redhat.com
CC: davem@davemloft.net
CC: michael.chan@broadcom.com
CC: tariqt@nvidia.com
CC: anthony.l.nguyen@intel.com
CC: przemyslaw.kitszel@intel.com
CC: jdamato@fastly.com
CC: shayd@nvidia.com
CC: akpm@linux-foundation.org
CC: Ahmed Zaki <ahmed.zaki@intel.com>

Hi Ahmed,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Ahmed-Zaki/net-move-ARFS-rmap-management-to-core/20250104-084501
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250104004314.208259-4-ahmed.zaki%40intel.com
patch subject: [Intel-wired-lan] [PATCH net-next v3 3/6] net: napi: add CPU affinity to napi_config
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
config: i386-randconfig-141-20250104 (https://download.01.org/0day-ci/archive/20250105/202501050625.nY1c97EX-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202501050625.nY1c97EX-lkp@intel.com/

smatch warnings:
net/core/dev.c:6835 napi_restore_config() warn: variable dereferenced before check 'n->config' (see line 6831)
net/core/dev.c:6855 napi_save_config() warn: variable dereferenced before check 'n->config' (see line 6850)

vim +6835 net/core/dev.c

4f6e7588aa8a24b Ahmed Zaki     2025-01-03  6828  
86e25f40aa1e9e5 Joe Damato     2024-10-11  6829  static void napi_restore_config(struct napi_struct *n)
86e25f40aa1e9e5 Joe Damato     2024-10-11  6830  {
86e25f40aa1e9e5 Joe Damato     2024-10-11 @6831  	n->defer_hard_irqs = n->config->defer_hard_irqs;
86e25f40aa1e9e5 Joe Damato     2024-10-11  6832  	n->gro_flush_timeout = n->config->gro_flush_timeout;
5dc51ec86df6e22 Martin Karsten 2024-11-09  6833  	n->irq_suspend_timeout = n->config->irq_suspend_timeout;
d6b43b8a2e5297b Ahmed Zaki     2025-01-03  6834  
d6b43b8a2e5297b Ahmed Zaki     2025-01-03 @6835  	if (n->irq > 0 && n->config && n->dev->irq_affinity_auto)
d6b43b8a2e5297b Ahmed Zaki     2025-01-03  6836  		irq_set_affinity(n->irq, &n->config->affinity_mask);
d6b43b8a2e5297b Ahmed Zaki     2025-01-03  6837  
86e25f40aa1e9e5 Joe Damato     2024-10-11  6838  	/* a NAPI ID might be stored in the config, if so use it. if not, use
86e25f40aa1e9e5 Joe Damato     2024-10-11  6839  	 * napi_hash_add to generate one for us. It will be saved to the config
86e25f40aa1e9e5 Joe Damato     2024-10-11  6840  	 * in napi_disable.
86e25f40aa1e9e5 Joe Damato     2024-10-11  6841  	 */
86e25f40aa1e9e5 Joe Damato     2024-10-11  6842  	if (n->config->napi_id)
86e25f40aa1e9e5 Joe Damato     2024-10-11  6843  		napi_hash_add_with_id(n, n->config->napi_id);
86e25f40aa1e9e5 Joe Damato     2024-10-11  6844  	else
86e25f40aa1e9e5 Joe Damato     2024-10-11  6845  		napi_hash_add(n);
86e25f40aa1e9e5 Joe Damato     2024-10-11  6846  }
86e25f40aa1e9e5 Joe Damato     2024-10-11  6847  
86e25f40aa1e9e5 Joe Damato     2024-10-11  6848  static void napi_save_config(struct napi_struct *n)
86e25f40aa1e9e5 Joe Damato     2024-10-11  6849  {
86e25f40aa1e9e5 Joe Damato     2024-10-11 @6850  	n->config->defer_hard_irqs = n->defer_hard_irqs;
86e25f40aa1e9e5 Joe Damato     2024-10-11  6851  	n->config->gro_flush_timeout = n->gro_flush_timeout;
5dc51ec86df6e22 Martin Karsten 2024-11-09  6852  	n->config->irq_suspend_timeout = n->irq_suspend_timeout;
86e25f40aa1e9e5 Joe Damato     2024-10-11  6853  	n->config->napi_id = n->napi_id;
d6b43b8a2e5297b Ahmed Zaki     2025-01-03  6854  
d6b43b8a2e5297b Ahmed Zaki     2025-01-03 @6855  	if (n->irq > 0 && n->config && n->dev->irq_affinity_auto)
d6b43b8a2e5297b Ahmed Zaki     2025-01-03  6856  		irq_set_affinity_notifier(n->irq, NULL);
d6b43b8a2e5297b Ahmed Zaki     2025-01-03  6857  
86e25f40aa1e9e5 Joe Damato     2024-10-11  6858  	napi_hash_del(n);
86e25f40aa1e9e5 Joe Damato     2024-10-11  6859  }
86e25f40aa1e9e5 Joe Damato     2024-10-11  6860  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
