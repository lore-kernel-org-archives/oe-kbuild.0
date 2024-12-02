Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 053FE1DDC24
	for <oe-kbuild@lists.linux.dev>; Mon,  2 Dec 2024 18:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733162998; cv=none; b=YHtfANDbww1UgPI2RXfAxkEYfQvqdLu5240urIfn6Y5akKZJPMnbYQjZYWxeTfTefncpoUSBJN9rCOpBuzsqpRiSKJ44LITRHC5DU5WfAyCbwvaJ30MPOOUWC33u7ilASuKxP5nRRDCx+AwJdxELv5WPlZP+njs9jrFhlPF2cRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733162998; c=relaxed/simple;
	bh=Fb0T2izQliNOrfhoZgFjxJ6iP++SRc5qrALamA+eDhw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lsoGvxLuArCvERqNd7A8Y0+WBM0H8YzFIVAaR+neTLh5SB8WAFc/W7FEzfcT1WNLjyOvL6N77QaAhcM/SQkJ+VIl0hopThG8YOUyS4rEQvrk3yAS0z5Vd8bcflSKzcIXkSZ6eM4yA6BB5/oZPKcOF7Z4cAvkidrCmoTntFIFUs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hv288J1k; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hv288J1k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733162997; x=1764698997;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Fb0T2izQliNOrfhoZgFjxJ6iP++SRc5qrALamA+eDhw=;
  b=hv288J1kcZ1Fb/iA5mxjSnOv2Jo/GQKRPLwJdpT2WuyZue1zVuJeOHYQ
   nsci0GJftxk5nbpccPtBHt7kSDfsaU4qVwN8/lVNxiITlYCt5C+frN+Kv
   WrsPtli+DTrH0+fXC+64Lcm0OflxJQJViBwRekn3lJ49CHOn3VcVGCNij
   zkSmUqFXwiBJivXY0CrqYIFllcT19qjefFS6NY8qHPrdcA9p2/sCANQId
   kiMIPQw8AL3U6g8dd2CXbwjL89T4IcLbTjy4BLBbhdeNzx3hNMdv0c5k9
   XG2BwbdxrqSpwISF2RR7XxJIfaWPkmkXfEpxPR5Xawasp4TyQ/NCUJ0zv
   A==;
X-CSE-ConnectionGUID: NJUHIei6Qk6FdvKh/YVirQ==
X-CSE-MsgGUID: 5ov2OCKjSvC+vpzKe0CuHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="44731079"
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; 
   d="scan'208";a="44731079"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 10:09:54 -0800
X-CSE-ConnectionGUID: HHV81aFZRZOKXgktJBkqqg==
X-CSE-MsgGUID: xk+GlOYUS/SnCooYEl7XYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; 
   d="scan'208";a="93358384"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 02 Dec 2024 10:09:54 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIArn-0002hu-0P;
	Mon, 02 Dec 2024 18:09:51 +0000
Date: Tue, 3 Dec 2024 02:08:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/net/ethernet/intel/ice/ice_sriov.c:6472:3-50: opportunity
 for str_on_off(test_bit ( ICE_FLAG_MDD_AUTO_RESET_VF , pf -> flags ))
Message-ID: <202412030202.AplMVqua-lkp@intel.com>
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
TO: Jacob Keller <jacob.e.keller@intel.com>
CC: Tony Nguyen <anthony.l.nguyen@intel.com>

Hi Jacob,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e70140ba0d2b1a30467d4af6bcfe761327b9ec95
commit: 0deb0bf70c3f15e61d3b14febcde8b8b19ca71d1 ice: rename ice_virtchnl_pf.c to ice_sriov.c
date:   2 years, 9 months ago
:::::: branch date: 19 hours ago
:::::: commit date: 2 years, 9 months ago
config: alpha-randconfig-r051-20241117 (https://download.01.org/0day-ci/archive/20241203/202412030202.AplMVqua-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202412030202.AplMVqua-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/intel/ice/ice_sriov.c:6472:3-50: opportunity for str_on_off(test_bit ( ICE_FLAG_MDD_AUTO_RESET_VF , pf -> flags ))

vim +6472 drivers/net/ethernet/intel/ice/ice_sriov.c

9d5c5a5290d4d7 drivers/net/ethernet/intel/ice/ice_virtchnl_pf.c Paul Greenwalt 2020-02-13  6457  
7438a3b0947a2e drivers/net/ethernet/intel/ice/ice_virtchnl_pf.c Paul Greenwalt 2020-05-15  6458  /**
7438a3b0947a2e drivers/net/ethernet/intel/ice/ice_virtchnl_pf.c Paul Greenwalt 2020-05-15  6459   * ice_print_vf_rx_mdd_event - print VF Rx malicious driver detect event
7438a3b0947a2e drivers/net/ethernet/intel/ice/ice_virtchnl_pf.c Paul Greenwalt 2020-05-15  6460   * @vf: pointer to the VF structure
7438a3b0947a2e drivers/net/ethernet/intel/ice/ice_virtchnl_pf.c Paul Greenwalt 2020-05-15  6461   */
7438a3b0947a2e drivers/net/ethernet/intel/ice/ice_virtchnl_pf.c Paul Greenwalt 2020-05-15  6462  void ice_print_vf_rx_mdd_event(struct ice_vf *vf)
7438a3b0947a2e drivers/net/ethernet/intel/ice/ice_virtchnl_pf.c Paul Greenwalt 2020-05-15  6463  {
7438a3b0947a2e drivers/net/ethernet/intel/ice/ice_virtchnl_pf.c Paul Greenwalt 2020-05-15  6464  	struct ice_pf *pf = vf->pf;
7438a3b0947a2e drivers/net/ethernet/intel/ice/ice_virtchnl_pf.c Paul Greenwalt 2020-05-15  6465  	struct device *dev;
7438a3b0947a2e drivers/net/ethernet/intel/ice/ice_virtchnl_pf.c Paul Greenwalt 2020-05-15  6466  
7438a3b0947a2e drivers/net/ethernet/intel/ice/ice_virtchnl_pf.c Paul Greenwalt 2020-05-15  6467  	dev = ice_pf_to_dev(pf);
7438a3b0947a2e drivers/net/ethernet/intel/ice/ice_virtchnl_pf.c Paul Greenwalt 2020-05-15  6468  
7438a3b0947a2e drivers/net/ethernet/intel/ice/ice_virtchnl_pf.c Paul Greenwalt 2020-05-15  6469  	dev_info(dev, "%d Rx Malicious Driver Detection events detected on PF %d VF %d MAC %pM. mdd-auto-reset-vfs=%s\n",
7438a3b0947a2e drivers/net/ethernet/intel/ice/ice_virtchnl_pf.c Paul Greenwalt 2020-05-15  6470  		 vf->mdd_rx_events.count, pf->hw.pf_id, vf->vf_id,
f28cd5ce1a6094 drivers/net/ethernet/intel/ice/ice_virtchnl_pf.c Brett Creeley  2020-09-17  6471  		 vf->dev_lan_addr.addr,
7438a3b0947a2e drivers/net/ethernet/intel/ice/ice_virtchnl_pf.c Paul Greenwalt 2020-05-15 @6472  		 test_bit(ICE_FLAG_MDD_AUTO_RESET_VF, pf->flags)
7438a3b0947a2e drivers/net/ethernet/intel/ice/ice_virtchnl_pf.c Paul Greenwalt 2020-05-15  6473  			  ? "on" : "off");
7438a3b0947a2e drivers/net/ethernet/intel/ice/ice_virtchnl_pf.c Paul Greenwalt 2020-05-15  6474  }
7438a3b0947a2e drivers/net/ethernet/intel/ice/ice_virtchnl_pf.c Paul Greenwalt 2020-05-15  6475  

:::::: The code at line 6472 was first introduced by commit
:::::: 7438a3b0947a2ef43c16bfb7b5b19048d6d92b14 ice: print Rx MDD auto reset message before VF reset

:::::: TO: Paul Greenwalt <paul.greenwalt@intel.com>
:::::: CC: Jeff Kirsher <jeffrey.t.kirsher@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
