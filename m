Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4D623F371
	for <oe-kbuild@lists.linux.dev>; Sun,  2 Mar 2025 14:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740925784; cv=none; b=QpUufI+VBuEWnOTND7h386hHIGC4tiScEkHjLeEZrG32DkCRqdble0qUChYyEpCrmsXyF4FUsw/cn0sK5iQIQ6zG76IQn1w1Ts13JrS1ysFqLHVqw6nY/JYpMJomDkxLcNfPDzcqR39ODbx6VdK/Xw9Ot9Q/h9kTUHS+VXtaLbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740925784; c=relaxed/simple;
	bh=WBnBF8YZ0Dy9uveY2NotyJNyRV6aULMFfahnVIGHb1A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UEazJ5jQ1VsJkEclSpkB1PXjFYj8tPRtsDBfQT09+5sJY/xOCFv3DN2EyR8YibWV83BEeK/L3jO+dd6+MuyvzaAFzY64Ffd+jJJz7EW4snj89RiyOO6cSZtDGq5lL+Da5Ddzi6dez+pR/AMSfRu8kEaM3sNh6E8tHAGKFNOSc9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b55iVhIN; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b55iVhIN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740925782; x=1772461782;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WBnBF8YZ0Dy9uveY2NotyJNyRV6aULMFfahnVIGHb1A=;
  b=b55iVhINPgBnEsZC3Qye6nveij4dKgD0+dmpk0MMsskMhUuEcZcp+ji4
   xqqiu3lbSeuI+tptfa60CQ6IZ9oZ5ZAwWm0zYvoEj1sypBdmknQZP8oZb
   rP8nkeWRH6kGi/FSaLp0nrNeE/It6stNBU6U150lJrO4SKEelc7vgsW6N
   U9qLLP1VZibaRr8jsmRl937qBXGmi0gcRywEwu2Tp2m38rn0JW6s1AtBI
   zI6e082Fv5YuZglhJJ0ykFHVpkt0ARt7tdJ9xA0djDdlGw8Fbo0gcfqxw
   EwHe+ibsVN0D+LA8nqkOpzILdeCkkkcykke53dvSxGxxLicXSfJb5JpSy
   g==;
X-CSE-ConnectionGUID: XZ1k8tq3RUONMS2wTm5a+g==
X-CSE-MsgGUID: VSIssEtZSgmuUbOJll9aVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="53211672"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="53211672"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2025 06:29:41 -0800
X-CSE-ConnectionGUID: MWitHiBDTzGZ9ZAToRvBiQ==
X-CSE-MsgGUID: xqydeLMQR2WDHmkhwJHUAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,327,1732608000"; 
   d="scan'208";a="117576758"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 02 Mar 2025 06:29:40 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tokK2-000HMs-1M;
	Sun, 02 Mar 2025 14:29:38 +0000
Date: Sun, 2 Mar 2025 22:29:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 4/8] enic: enable rq extended cq support
Message-ID: <202503022204.u6MW8MpW-lkp@intel.com>
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
In-Reply-To: <20250227-enic_cleanup_and_ext_cq-v1-4-c314f95812bb@cisco.com>
References: <20250227-enic_cleanup_and_ext_cq-v1-4-c314f95812bb@cisco.com>
TO: Satish Kharat via B4 Relay <devnull+satishkh.cisco.com@kernel.org>
TO: Christian Benvenuti <benve@cisco.com>
TO: Andrew Lunn <andrew+netdev@lunn.ch>
TO: "David S. Miller" <davem@davemloft.net>
CC: netdev@vger.kernel.org
TO: Eric Dumazet <edumazet@google.com>
TO: Jakub Kicinski <kuba@kernel.org>
TO: Paolo Abeni <pabeni@redhat.com>
CC: linux-kernel@vger.kernel.org
CC: Satish Kharat <satishkh@cisco.com>
CC: Nelson Escobar <neescoba@cisco.com>
CC: John Daley <johndale@cisco.com>

Hi Satish,

kernel test robot noticed the following build warnings:

[auto build test WARNING on de7a88b639d488607352a270ef2e052c4442b1b3]

url:    https://github.com/intel-lab-lkp/linux/commits/Satish-Kharat-via-B4-Relay/enic-Move-function-from-header-file-to-c-file/20250228-083517
base:   de7a88b639d488607352a270ef2e052c4442b1b3
patch link:    https://lore.kernel.org/r/20250227-enic_cleanup_and_ext_cq-v1-4-c314f95812bb%40cisco.com
patch subject: [PATCH 4/8] enic: enable rq extended cq support
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: sparc-randconfig-r071-20250302 (https://download.01.org/0day-ci/archive/20250302/202503022204.u6MW8MpW-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503022204.u6MW8MpW-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/cisco/enic/enic_rq.c:94 enic_rq_cq_desc_dec() error: uninitialized symbol 'type_color'.

vim +/type_color +94 drivers/net/ethernet/cisco/enic/enic_rq.c

fe57762c649058 John Daley    2025-02-05  23  
180b3e15104ce9 Satish Kharat 2025-02-27  24  static void enic_rq_cq_desc_dec(void *cq_desc, u8 cq_desc_size, u8 *type,
34d3abffbe44db Satish Kharat 2025-02-27  25  				u8 *color, u16 *q_number, u16 *completed_index)
fe57762c649058 John Daley    2025-02-05  26  {
34d3abffbe44db Satish Kharat 2025-02-27  27  	/* type_color is the last field for all cq structs */
180b3e15104ce9 Satish Kharat 2025-02-27  28  	u8 type_color;
180b3e15104ce9 Satish Kharat 2025-02-27  29  
180b3e15104ce9 Satish Kharat 2025-02-27  30  	switch (cq_desc_size) {
180b3e15104ce9 Satish Kharat 2025-02-27  31  	case VNIC_RQ_CQ_ENTRY_SIZE_16: {
180b3e15104ce9 Satish Kharat 2025-02-27  32  		struct cq_enet_rq_desc *desc =
180b3e15104ce9 Satish Kharat 2025-02-27  33  			(struct cq_enet_rq_desc *)cq_desc;
180b3e15104ce9 Satish Kharat 2025-02-27  34  		type_color = desc->type_color;
180b3e15104ce9 Satish Kharat 2025-02-27  35  
180b3e15104ce9 Satish Kharat 2025-02-27  36  		/* Make sure color bit is read from desc *before* other fields
180b3e15104ce9 Satish Kharat 2025-02-27  37  		 * are read from desc.  Hardware guarantees color bit is last
180b3e15104ce9 Satish Kharat 2025-02-27  38  		 * bit (byte) written.  Adding the rmb() prevents the compiler
180b3e15104ce9 Satish Kharat 2025-02-27  39  		 * and/or CPU from reordering the reads which would potentially
180b3e15104ce9 Satish Kharat 2025-02-27  40  		 * result in reading stale values.
180b3e15104ce9 Satish Kharat 2025-02-27  41  		 */
180b3e15104ce9 Satish Kharat 2025-02-27  42  		rmb();
180b3e15104ce9 Satish Kharat 2025-02-27  43  
180b3e15104ce9 Satish Kharat 2025-02-27  44  		*q_number = le16_to_cpu(desc->q_number_rss_type_flags) &
180b3e15104ce9 Satish Kharat 2025-02-27  45  			    CQ_DESC_Q_NUM_MASK;
180b3e15104ce9 Satish Kharat 2025-02-27  46  		*completed_index = le16_to_cpu(desc->completed_index_flags) &
180b3e15104ce9 Satish Kharat 2025-02-27  47  				   CQ_DESC_COMP_NDX_MASK;
180b3e15104ce9 Satish Kharat 2025-02-27  48  		break;
180b3e15104ce9 Satish Kharat 2025-02-27  49  	}
180b3e15104ce9 Satish Kharat 2025-02-27  50  	case VNIC_RQ_CQ_ENTRY_SIZE_32: {
180b3e15104ce9 Satish Kharat 2025-02-27  51  		struct cq_enet_rq_desc_32 *desc =
180b3e15104ce9 Satish Kharat 2025-02-27  52  			(struct cq_enet_rq_desc_32 *)cq_desc;
180b3e15104ce9 Satish Kharat 2025-02-27  53  		type_color = desc->type_color;
180b3e15104ce9 Satish Kharat 2025-02-27  54  
180b3e15104ce9 Satish Kharat 2025-02-27  55  		/* Make sure color bit is read from desc *before* other fields
180b3e15104ce9 Satish Kharat 2025-02-27  56  		 * are read from desc.  Hardware guarantees color bit is last
180b3e15104ce9 Satish Kharat 2025-02-27  57  		 * bit (byte) written.  Adding the rmb() prevents the compiler
180b3e15104ce9 Satish Kharat 2025-02-27  58  		 * and/or CPU from reordering the reads which would potentially
180b3e15104ce9 Satish Kharat 2025-02-27  59  		 * result in reading stale values.
180b3e15104ce9 Satish Kharat 2025-02-27  60  		 */
180b3e15104ce9 Satish Kharat 2025-02-27  61  		rmb();
180b3e15104ce9 Satish Kharat 2025-02-27  62  
180b3e15104ce9 Satish Kharat 2025-02-27  63  		*q_number = le16_to_cpu(desc->q_number_rss_type_flags) &
180b3e15104ce9 Satish Kharat 2025-02-27  64  			    CQ_DESC_Q_NUM_MASK;
180b3e15104ce9 Satish Kharat 2025-02-27  65  		*completed_index = le16_to_cpu(desc->completed_index_flags) &
180b3e15104ce9 Satish Kharat 2025-02-27  66  				   CQ_DESC_COMP_NDX_MASK;
180b3e15104ce9 Satish Kharat 2025-02-27  67  		*completed_index |= (desc->fetch_index_flags & CQ_DESC_32_FI_MASK) <<
180b3e15104ce9 Satish Kharat 2025-02-27  68  				CQ_DESC_COMP_NDX_BITS;
180b3e15104ce9 Satish Kharat 2025-02-27  69  		break;
180b3e15104ce9 Satish Kharat 2025-02-27  70  	}
180b3e15104ce9 Satish Kharat 2025-02-27  71  	case VNIC_RQ_CQ_ENTRY_SIZE_64: {
180b3e15104ce9 Satish Kharat 2025-02-27  72  		struct cq_enet_rq_desc_64 *desc =
180b3e15104ce9 Satish Kharat 2025-02-27  73  			(struct cq_enet_rq_desc_64 *)cq_desc;
180b3e15104ce9 Satish Kharat 2025-02-27  74  		type_color = desc->type_color;
34d3abffbe44db Satish Kharat 2025-02-27  75  
34d3abffbe44db Satish Kharat 2025-02-27  76  		/* Make sure color bit is read from desc *before* other fields
34d3abffbe44db Satish Kharat 2025-02-27  77  		 * are read from desc.  Hardware guarantees color bit is last
34d3abffbe44db Satish Kharat 2025-02-27  78  		 * bit (byte) written.  Adding the rmb() prevents the compiler
34d3abffbe44db Satish Kharat 2025-02-27  79  		 * and/or CPU from reordering the reads which would potentially
34d3abffbe44db Satish Kharat 2025-02-27  80  		 * result in reading stale values.
34d3abffbe44db Satish Kharat 2025-02-27  81  		 */
34d3abffbe44db Satish Kharat 2025-02-27  82  		rmb();
34d3abffbe44db Satish Kharat 2025-02-27  83  
34d3abffbe44db Satish Kharat 2025-02-27  84  		*q_number = le16_to_cpu(desc->q_number_rss_type_flags) &
34d3abffbe44db Satish Kharat 2025-02-27  85  			    CQ_DESC_Q_NUM_MASK;
34d3abffbe44db Satish Kharat 2025-02-27  86  		*completed_index = le16_to_cpu(desc->completed_index_flags) &
34d3abffbe44db Satish Kharat 2025-02-27  87  				   CQ_DESC_COMP_NDX_MASK;
180b3e15104ce9 Satish Kharat 2025-02-27  88  		*completed_index |= (desc->fetch_index_flags & CQ_DESC_64_FI_MASK) <<
180b3e15104ce9 Satish Kharat 2025-02-27  89  				CQ_DESC_COMP_NDX_BITS;
180b3e15104ce9 Satish Kharat 2025-02-27  90  		break;
180b3e15104ce9 Satish Kharat 2025-02-27  91  	}
180b3e15104ce9 Satish Kharat 2025-02-27  92  	}
180b3e15104ce9 Satish Kharat 2025-02-27  93  
34d3abffbe44db Satish Kharat 2025-02-27 @94  	*color = (type_color >> CQ_DESC_COLOR_SHIFT) & CQ_DESC_COLOR_MASK;
34d3abffbe44db Satish Kharat 2025-02-27  95  	*type = type_color & CQ_DESC_TYPE_MASK;
fe57762c649058 John Daley    2025-02-05  96  }
fe57762c649058 John Daley    2025-02-05  97  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
