Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD15FEA4
	for <oe-kbuild@lists.linux.dev>; Tue, 21 Feb 2023 01:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676941778; x=1708477778;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=7demd9hfnbERLB+rwDqYN8XNHvXVvuF0OIxpMApZq88=;
  b=GHuSwWzFJhLfuUdDdTWAMtM4beOcBjnsjybfFx4SzSxeKragYu95p9pz
   1EA+fzVEAOtKSmvyAHPeg9CGDrlnKtUFYOYhvkh3E3b+YE5xpmMddYAE4
   Se57Kv5F4TIGAzG0NRybaVl1I3uFo2T1rLpPo4fnrUdQjoXWOMJeppshN
   AGAl8YmLomdislfNbSeAFx1EPaqCev2iG1US5AtzBteLH6g1IZGu6y0MT
   QGKS0dx4A/D2G8r/MWhwdeBWOHwfJtthYy52WVdO3SD6TDrYODTlGn8Ii
   Vj90FG5HJq2X41bK0H+Pj4Teb4ylUVMNczUIs+MQEwXjaar8TdlmlMomT
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="332524656"
X-IronPort-AV: E=Sophos;i="5.97,314,1669104000"; 
   d="scan'208";a="332524656"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2023 17:09:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="671462961"
X-IronPort-AV: E=Sophos;i="5.97,314,1669104000"; 
   d="scan'208";a="671462961"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 20 Feb 2023 17:09:36 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pUH9z-000EIN-2h;
	Tue, 21 Feb 2023 01:09:35 +0000
Date: Tue, 21 Feb 2023 09:08:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 172/13681]
 drivers/gpu/drm/i915/display/intel_color.c:2514 i9xx_read_lut_10() error:
 uninitialized symbol 'ldw'.
Message-ID: <202302210918.x3iR0xr8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: "Ville Syrjälä" <ville.syrjala@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d2af0fa4bfa4ec29d03b449ccd43fee39501112d
commit: 67630bacae2354c3ae20b10cf25bc7e274882200 [172/13681] drm/i915: Add 10bit gamma mode for gen2/3
:::::: branch date: 20 hours ago
:::::: commit date: 3 months ago
config: x86_64-randconfig-m001-20230213 (https://download.01.org/0day-ci/archive/20230221/202302210918.x3iR0xr8-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202302210918.x3iR0xr8-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/i915/display/intel_color.c:2514 i9xx_read_lut_10() error: uninitialized symbol 'ldw'.
drivers/gpu/drm/i915/display/intel_color.c:2514 i9xx_read_lut_10() error: uninitialized symbol 'udw'.

vim +/ldw +2514 drivers/gpu/drm/i915/display/intel_color.c

1af22383829864 Swati Sharma  2019-09-04  2489  
67630bacae2354 Ville Syrjälä 2022-11-14  2490  static struct drm_property_blob *i9xx_read_lut_10(struct intel_crtc *crtc)
67630bacae2354 Ville Syrjälä 2022-11-14  2491  {
67630bacae2354 Ville Syrjälä 2022-11-14  2492  	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
67630bacae2354 Ville Syrjälä 2022-11-14  2493  	u32 lut_size = INTEL_INFO(dev_priv)->display.color.gamma_lut_size;
67630bacae2354 Ville Syrjälä 2022-11-14  2494  	enum pipe pipe = crtc->pipe;
67630bacae2354 Ville Syrjälä 2022-11-14  2495  	struct drm_property_blob *blob;
67630bacae2354 Ville Syrjälä 2022-11-14  2496  	struct drm_color_lut *lut;
67630bacae2354 Ville Syrjälä 2022-11-14  2497  	u32 ldw, udw;
67630bacae2354 Ville Syrjälä 2022-11-14  2498  	int i;
67630bacae2354 Ville Syrjälä 2022-11-14  2499  
67630bacae2354 Ville Syrjälä 2022-11-14  2500  	blob = drm_property_create_blob(&dev_priv->drm,
67630bacae2354 Ville Syrjälä 2022-11-14  2501  					lut_size * sizeof(lut[0]), NULL);
67630bacae2354 Ville Syrjälä 2022-11-14  2502  	if (IS_ERR(blob))
67630bacae2354 Ville Syrjälä 2022-11-14  2503  		return NULL;
67630bacae2354 Ville Syrjälä 2022-11-14  2504  
67630bacae2354 Ville Syrjälä 2022-11-14  2505  	lut = blob->data;
67630bacae2354 Ville Syrjälä 2022-11-14  2506  
67630bacae2354 Ville Syrjälä 2022-11-14  2507  	for (i = 0; i < lut_size - 1; i++) {
67630bacae2354 Ville Syrjälä 2022-11-14  2508  		ldw = intel_de_read_fw(dev_priv, PALETTE(pipe, 2 * i + 0));
67630bacae2354 Ville Syrjälä 2022-11-14  2509  		udw = intel_de_read_fw(dev_priv, PALETTE(pipe, 2 * i + 1));
67630bacae2354 Ville Syrjälä 2022-11-14  2510  
67630bacae2354 Ville Syrjälä 2022-11-14  2511  		i9xx_lut_10_pack(&lut[i], ldw, udw);
67630bacae2354 Ville Syrjälä 2022-11-14  2512  	}
67630bacae2354 Ville Syrjälä 2022-11-14  2513  
67630bacae2354 Ville Syrjälä 2022-11-14 @2514  	i9xx_lut_10_pack_slope(&lut[i], ldw, udw);
67630bacae2354 Ville Syrjälä 2022-11-14  2515  
67630bacae2354 Ville Syrjälä 2022-11-14  2516  	return blob;
67630bacae2354 Ville Syrjälä 2022-11-14  2517  }
67630bacae2354 Ville Syrjälä 2022-11-14  2518  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
