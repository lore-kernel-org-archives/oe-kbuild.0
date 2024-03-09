Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4453A4EB34
	for <oe-kbuild@lists.linux.dev>; Sat,  9 Mar 2024 23:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710027829; cv=none; b=NNv6DyKFGseLcU7W3zj548JwnqjD1Q8yKjQD145XAc6xXo6pL4nCEHeGHTUdMeM00c0W0gTlbw9TNysEHt16zZBjZGg5TOOOGe+dc9f/LZFY6fVzqe3fWhPnvRt5oK+oHMYwZyESiEl+S+Nqe2HyLWfyud0VN7a2RgDvsEYe6x8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710027829; c=relaxed/simple;
	bh=k+kwWiWoetmBES8Pk2ZimFfbBTKFpSp5zZCjK8LRZ7U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CR6wDO0C1gIegVCgNkWhlau9FWZmll+XHpRjo+D22RqkJK4HbSol1N3JhZGO0+1KM3IDNehtxXHQOxPtFFRiYjvNpTJDi86fqC3ortJ+0EQa5WuSxlLiSs/1Nl5QINHjSzIO5JvCd3q5yeI6HSGghqf7q215SeyJ5L52bSbxqxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ju7y6Vhp; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ju7y6Vhp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710027827; x=1741563827;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k+kwWiWoetmBES8Pk2ZimFfbBTKFpSp5zZCjK8LRZ7U=;
  b=ju7y6VhpgDA+fOpSY0bXgHfd8uq+HDuDC7kPKkfFm7ENzCxZyI687f2N
   FKcqEKkmgPdf5jZeLwaROk4ZpOJ/b4aZGOUmyeedJbK1CbD2yZNE4ebWX
   DDzMsNr5LJ5CLFlReR9otZiAhpZW3KgUlJ6U8qo5Gl6r6WKAbSbsuGdzM
   9fVENDRKZjAedaRhAauwz2AXTokCBQmYyY+oypoVoIzBIFmxKAcXrHWNw
   cPTq+oVeM9OlPm67Cd0qgIG4afg2d+E/GwrdxlNGhYqJj4K8Rh0vygz+e
   6/7RKnGXNGYuw8qxdXVnztITWd/bbjdF+FseRYefZFvH5Dpa4fuSjqpDm
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11008"; a="4894641"
X-IronPort-AV: E=Sophos;i="6.07,113,1708416000"; 
   d="scan'208";a="4894641"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2024 15:43:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,113,1708416000"; 
   d="scan'208";a="10857846"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 09 Mar 2024 15:43:45 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rj6Lu-0007kV-2n;
	Sat, 09 Mar 2024 23:43:42 +0000
Date: Sun, 10 Mar 2024 07:43:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 12015/12944]
 drivers/firmware/arm_scmi/powercap.c:723 scmi_powercap_domain_init_fc()
 error: buffer overflow 'fc' 2 <= 6
Message-ID: <202403100744.7Op3PI8L-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Pierre Gondois <pierre.gondois@arm.com>
CC: Viresh Kumar <viresh.kumar@linaro.org>
CC: Cristian Marussi <cristian.marussi@arm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8ffc8b1bbd505e27e2c8439d326b6059c906c9dd
commit: 2441caa84aac8abf1be9e20db3e6bb921e74c8a2 [12015/12944] firmware: arm_scmi: Populate fast channel rate_limit
:::::: branch date: 2 days ago
:::::: commit date: 4 days ago
config: nios2-randconfig-r071-20240309 (https://download.01.org/0day-ci/archive/20240310/202403100744.7Op3PI8L-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202403100744.7Op3PI8L-lkp@intel.com/

smatch warnings:
drivers/firmware/arm_scmi/powercap.c:723 scmi_powercap_domain_init_fc() error: buffer overflow 'fc' 2 <= 6

vim +/fc +723 drivers/firmware/arm_scmi/powercap.c

0316f99c4780b0 Cristian Marussi 2022-07-04  693  
855aa26e5f56d4 Cristian Marussi 2022-07-04  694  static void scmi_powercap_domain_init_fc(const struct scmi_protocol_handle *ph,
855aa26e5f56d4 Cristian Marussi 2022-07-04  695  					 u32 domain, struct scmi_fc_info **p_fc)
855aa26e5f56d4 Cristian Marussi 2022-07-04  696  {
855aa26e5f56d4 Cristian Marussi 2022-07-04  697  	struct scmi_fc_info *fc;
855aa26e5f56d4 Cristian Marussi 2022-07-04  698  
855aa26e5f56d4 Cristian Marussi 2022-07-04  699  	fc = devm_kcalloc(ph->dev, POWERCAP_FC_MAX, sizeof(*fc), GFP_KERNEL);
855aa26e5f56d4 Cristian Marussi 2022-07-04  700  	if (!fc)
855aa26e5f56d4 Cristian Marussi 2022-07-04  701  		return;
855aa26e5f56d4 Cristian Marussi 2022-07-04  702  
855aa26e5f56d4 Cristian Marussi 2022-07-04  703  	ph->hops->fastchannel_init(ph, POWERCAP_DESCRIBE_FASTCHANNEL,
855aa26e5f56d4 Cristian Marussi 2022-07-04  704  				   POWERCAP_CAP_SET, 4, domain,
855aa26e5f56d4 Cristian Marussi 2022-07-04  705  				   &fc[POWERCAP_FC_CAP].set_addr,
2441caa84aac8a Pierre Gondois   2024-02-22  706  				   &fc[POWERCAP_FC_CAP].set_db,
2441caa84aac8a Pierre Gondois   2024-02-22  707  				   &fc[POWERCAP_FC_CAP].rate_limit);
855aa26e5f56d4 Cristian Marussi 2022-07-04  708  
855aa26e5f56d4 Cristian Marussi 2022-07-04  709  	ph->hops->fastchannel_init(ph, POWERCAP_DESCRIBE_FASTCHANNEL,
855aa26e5f56d4 Cristian Marussi 2022-07-04  710  				   POWERCAP_CAP_GET, 4, domain,
2441caa84aac8a Pierre Gondois   2024-02-22  711  				   &fc[POWERCAP_FC_CAP].get_addr, NULL,
2441caa84aac8a Pierre Gondois   2024-02-22  712  				   &fc[POWERCAP_FC_CAP].rate_limit);
855aa26e5f56d4 Cristian Marussi 2022-07-04  713  
855aa26e5f56d4 Cristian Marussi 2022-07-04  714  	ph->hops->fastchannel_init(ph, POWERCAP_DESCRIBE_FASTCHANNEL,
855aa26e5f56d4 Cristian Marussi 2022-07-04  715  				   POWERCAP_PAI_SET, 4, domain,
855aa26e5f56d4 Cristian Marussi 2022-07-04  716  				   &fc[POWERCAP_FC_PAI].set_addr,
2441caa84aac8a Pierre Gondois   2024-02-22  717  				   &fc[POWERCAP_FC_PAI].set_db,
2441caa84aac8a Pierre Gondois   2024-02-22  718  				   &fc[POWERCAP_FC_PAI].rate_limit);
855aa26e5f56d4 Cristian Marussi 2022-07-04  719  
855aa26e5f56d4 Cristian Marussi 2022-07-04  720  	ph->hops->fastchannel_init(ph, POWERCAP_DESCRIBE_FASTCHANNEL,
855aa26e5f56d4 Cristian Marussi 2022-07-04  721  				   POWERCAP_PAI_GET, 4, domain,
2441caa84aac8a Pierre Gondois   2024-02-22  722  				   &fc[POWERCAP_FC_PAI].get_addr, NULL,
2441caa84aac8a Pierre Gondois   2024-02-22 @723  				   &fc[POWERCAP_PAI_GET].rate_limit);
855aa26e5f56d4 Cristian Marussi 2022-07-04  724  
855aa26e5f56d4 Cristian Marussi 2022-07-04  725  	*p_fc = fc;
855aa26e5f56d4 Cristian Marussi 2022-07-04  726  }
855aa26e5f56d4 Cristian Marussi 2022-07-04  727  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
