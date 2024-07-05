Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3EA469D31
	for <oe-kbuild@lists.linux.dev>; Fri,  5 Jul 2024 04:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720152169; cv=none; b=Irpbt6xmf3/hZgEZTFhwqUxujbgLJBgPEbh/zchwFy6BuTNp5bm5EHo2lHIh0Er5zKZsz33ye68HT6XmQMytT9ULjt925JPVa+K1fgHWT4wOpiRZ9fpFAb1QOX3ta1TgpFvKmb8XEk7Hotao4QVsOQtLJMuEhYiPz5bBDs7anMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720152169; c=relaxed/simple;
	bh=es0D7lpczNfyKx2aFO7T/jzGG5vwh8XL/oRgTiFfxyE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U7CV11KtDpqg8GENIk0DgvHMc+JKM/WGTDaEsOvzLRWN6HshlFma/k2UOq7+DTBLxAhNRiKWgn/NjUBCatWBaghE44R3gb6clUZcMKljdPrsG4sL2eW1QQi1Tjcs+SJpQAURGOthkxXMF9VMJJWrNgWIWw1Oq7T5M2XfMzY49BE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tie25XBN; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tie25XBN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720152168; x=1751688168;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=es0D7lpczNfyKx2aFO7T/jzGG5vwh8XL/oRgTiFfxyE=;
  b=Tie25XBNwJe0D+j64Br0RQC2R1j5WjqtfSgUxcF59NR+TQiCJZSaWEtm
   VUL7fdcp0BneQcS50P+yd1lPdZztkxBB63t4oLO923NMXI1RLrA39Ttb9
   ZT9m8UiKGPdlT2/4+P1PC6K6Z70Y9gOt5VuH9cScvO3wGlaBKEVtpnN/Z
   bnARUhsmpvT7qnxa3ihVHbUlKSTaeMNbIm8SikbD/68TG76UHL325BpG9
   JnpRXaBm9cl+2Rnzq5Rvt53/oEivRCT0LT9FchopsAGoM2/Kky4rHapSb
   V0ow0WlvhTVnmMDd2YOMTTSE0PNP9zJxCrzBZ0jZRvO7NH+t71Q8SammY
   w==;
X-CSE-ConnectionGUID: AC2hWh7DQySSX+GPzX2j4A==
X-CSE-MsgGUID: 8Ky60YNjRY6qZncnb4UXLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="17081658"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="17081658"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2024 21:02:48 -0700
X-CSE-ConnectionGUID: LiWmFmwvRymxvOUFXjtLEQ==
X-CSE-MsgGUID: Zq2Jp7N7SzCXrfeB3H/8xQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="51091750"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 04 Jul 2024 21:02:46 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPa9k-000Rt2-17;
	Fri, 05 Jul 2024 04:02:44 +0000
Date: Fri, 5 Jul 2024 12:02:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/ethernet/intel/ice/ice_eswitch_br.c:115
 ice_eswitch_br_ports_flush() warn: iterator 'i' not incremented
Message-ID: <202407051251.iPfJDbwu-lkp@intel.com>
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
TO: Wojciech Drewek <wojciech.drewek@intel.com>
CC: Tony Nguyen <anthony.l.nguyen@intel.com>
CC: Simon Horman <simon.horman@corigine.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   661e504db04c6b7278737ee3a9116738536b4ed4
commit: f6e8fb55e5af9a506d2e50d1079a231ce95ca215 ice: Implement basic eswitch bridge setup
date:   12 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 12 months ago
config: i386-randconfig-141-20240705 (https://download.01.org/0day-ci/archive/20240705/202407051251.iPfJDbwu-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202407051251.iPfJDbwu-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/intel/ice/ice_eswitch_br.c:115 ice_eswitch_br_ports_flush() warn: iterator 'i' not incremented

vim +/i +115 drivers/net/ethernet/intel/ice/ice_eswitch_br.c

f6e8fb55e5af9a Wojciech Drewek 2023-07-12  108  
f6e8fb55e5af9a Wojciech Drewek 2023-07-12  109  static void
f6e8fb55e5af9a Wojciech Drewek 2023-07-12  110  ice_eswitch_br_ports_flush(struct ice_esw_br *bridge)
f6e8fb55e5af9a Wojciech Drewek 2023-07-12  111  {
f6e8fb55e5af9a Wojciech Drewek 2023-07-12  112  	struct ice_esw_br_port *port;
f6e8fb55e5af9a Wojciech Drewek 2023-07-12  113  	unsigned long i;
f6e8fb55e5af9a Wojciech Drewek 2023-07-12  114  
f6e8fb55e5af9a Wojciech Drewek 2023-07-12 @115  	xa_for_each(&bridge->ports, i, port)
f6e8fb55e5af9a Wojciech Drewek 2023-07-12  116  		ice_eswitch_br_port_deinit(bridge, port);
f6e8fb55e5af9a Wojciech Drewek 2023-07-12  117  }
f6e8fb55e5af9a Wojciech Drewek 2023-07-12  118  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
