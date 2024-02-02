Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1458B14690C
	for <oe-kbuild@lists.linux.dev>; Fri,  2 Feb 2024 15:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706889228; cv=none; b=YRmgk5js58/RSg54NN0IkuWb9xqMULrqtaMuEKU5tPCX2ZT+hIJwzHtnnfRH/l7IGshCWGZp7BHTgwtphXAEWFiugKGXv9nirMIwq1aRtRER14hQ5sRrSYlqgFXdbi6n+EVmfUiDJiUDy2vOWxd1Ew9uVDpAaOMAap4ayGQ+dx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706889228; c=relaxed/simple;
	bh=CkN3L00xNgsnNKFAOtHe6+oOLvPn1ki0HWeZ2lR0ylw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eZlPLFxcjssE3YJPbyjG3J8OfSuxlykW6ePlBNNGx2FyEik6BczElVfTNikkzJEthUzjpVTEUCwLRshDL3aHbw4uVa2q/qJunr2/Dk3B3GpANMB3PBXGRsFgVgJLqA+DYIklpFXzGSuZgKbR8QHY+rYWagTuwJzYg+Oq6hFeGeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hwcMDEiv; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hwcMDEiv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706889226; x=1738425226;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CkN3L00xNgsnNKFAOtHe6+oOLvPn1ki0HWeZ2lR0ylw=;
  b=hwcMDEivgTVAYJ9Na6eC8v+E3dWhgRvuh40/J+gGKMGlJthdijp9DkE1
   XNPcg+A/5ULkaXKdl3nOc7er28V++99mq9QLvn3fMDyAP8Vs2xpSLgNNN
   rSvla5p9775o+Kg6t/ZHqB6AK02KisYLnYZT7heKlLI7o/ZMDKEeNjsD8
   IJTSJ8mgFeMSTNF3MgwrYh2eq4oTqt3JkMVJtlwVFVARYMTVBIx+gDAfk
   62JSWxd/7ZBakFTdBtZ+ZJzKb386t7pdXeHqUaKjA7Il5hknpQwBZ+fuD
   HsUzea+80wiXUl70Q+tuOdxcj1q90ZQtyOUKvbEgrPek42qD3yTU92q63
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="4079079"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="4079079"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2024 07:53:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="30916237"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 02 Feb 2024 07:53:41 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rVvrH-00040C-1u;
	Fri, 02 Feb 2024 15:53:39 +0000
Date: Fri, 2 Feb 2024 23:52:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [drm-xe:drm-xe-next 1/2]
 drivers/gpu/drm/xe/xe_gsc_proxy.c:264:12-13: WARNING opportunity for min()
Message-ID: <202402022338.JdNwQ2tv-lkp@intel.com>
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
CC: intel-xe@lists.freedesktop.org
TO: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
CC: Alan Previn <alan.previn.teres.alexis@intel.com>

tree:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
head:   5fcbf83e39ecde8e54c0b3da3a755a306a0ac348
commit: 997a55caa1c3b770979836bbfd82b311addf95c7 [1/2] drm/xe/gsc: Initialize GSC proxy
:::::: branch date: 13 hours ago
:::::: commit date: 2 weeks ago
config: sparc64-randconfig-r061-20240202 (https://download.01.org/0day-ci/archive/20240202/202402022338.JdNwQ2tv-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202402022338.JdNwQ2tv-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/xe/xe_gsc_proxy.c:264:12-13: WARNING opportunity for min()

vim +264 drivers/gpu/drm/xe/xe_gsc_proxy.c

997a55caa1c3b77 Daniele Ceraolo Spurio 2024-01-17  167  
997a55caa1c3b77 Daniele Ceraolo Spurio 2024-01-17  168  static int proxy_query(struct xe_gsc *gsc)
997a55caa1c3b77 Daniele Ceraolo Spurio 2024-01-17  169  {
997a55caa1c3b77 Daniele Ceraolo Spurio 2024-01-17  170  	struct xe_gt *gt = gsc_to_gt(gsc);
997a55caa1c3b77 Daniele Ceraolo Spurio 2024-01-17  171  	struct xe_device *xe = gt_to_xe(gt);
997a55caa1c3b77 Daniele Ceraolo Spurio 2024-01-17  172  	struct xe_gsc_proxy_header *to_csme_hdr = gsc->proxy.to_csme;
997a55caa1c3b77 Daniele Ceraolo Spurio 2024-01-17  173  	void *to_csme_payload = gsc->proxy.to_csme + PROXY_HDR_SIZE;
997a55caa1c3b77 Daniele Ceraolo Spurio 2024-01-17  174  	u32 wr_offset;
997a55caa1c3b77 Daniele Ceraolo Spurio 2024-01-17  175  	u32 reply_offset;
997a55caa1c3b77 Daniele Ceraolo Spurio 2024-01-17  176  	u32 size;
997a55caa1c3b77 Daniele Ceraolo Spurio 2024-01-17  177  	int ret;
997a55caa1c3b77 Daniele Ceraolo Spurio 2024-01-17  178  
997a55caa1c3b77 Daniele Ceraolo Spurio 2024-01-17  179  	wr_offset = xe_gsc_emit_header(xe, &gsc->proxy.to_gsc, 0,
997a55caa1c3b77 Daniele Ceraolo Spurio 2024-01-17  180  				       HECI_MEADDRESS_PROXY, 0, PROXY_HDR_SIZE);
997a55caa1c3b77 Daniele Ceraolo Spurio 2024-01-17  181  	wr_offset = emit_proxy_header(xe, &gsc->proxy.to_gsc, wr_offset);
997a55caa1c3b77 Daniele Ceraolo Spurio 2024-01-17  182  
997a55caa1c3b77 Daniele Ceraolo Spurio 2024-01-17  183  	size = wr_offset;
997a55caa1c3b77 Daniele Ceraolo Spurio 2024-01-17  184  
997a55caa1c3b77 Daniele Ceraolo Spurio 2024-01-17  185  	while (1) {
997a55caa1c3b77 Daniele Ceraolo Spurio 2024-01-17  186  		/*
997a55caa1c3b77 Daniele Ceraolo Spurio 2024-01-17  187  		 * Poison the GSC response header space to make sure we don't
997a55caa1c3b77 Daniele Ceraolo Spurio 2024-01-17  188  		 * read a stale reply.
997a55caa1c3b77 Daniele Ceraolo Spurio 2024-01-17  189  		 */
997a55caa1c3b77 Daniele Ceraolo Spurio 2024-01-17  190  		xe_gsc_poison_header(xe, &gsc->proxy.from_gsc, 0);
997a55caa1c3b77 Daniele Ceraolo Spurio 2024-01-17  191  
997a55caa1c3b77 Daniele Ceraolo Spurio 2024-01-17  192  		/* send proxy message to GSC */
997a55caa1c3b77 Daniele Ceraolo Spurio 2024-01-17  193  		ret = proxy_send_to_gsc(gsc, size);
997a55caa1c3b77 Daniele Ceraolo Spurio 2024-01-17  194  		if (ret)
997a55caa1c3b77 Daniele Ceraolo Spurio 2024-01-17  195  			goto proxy_error;
997a55caa1c3b77 Daniele Ceraolo Spurio 2024-01-17  196  
997a55caa1c3b77 Daniele Ceraolo Spurio 2024-01-17  197  		/* check the reply from GSC */
997a55caa1c3b77 Daniele Ceraolo Spurio 2024-01-17  198  		ret = xe_gsc_read_out_header(xe, &gsc->proxy.from_gsc, 0,
997a55caa1c3b77 Daniele Ceraolo Spurio 2024-01-17  199  					     PROXY_HDR_SIZE, &reply_offset);
997a55caa1c3b77 Daniele Ceraolo Spurio 2024-01-17  200  		if (ret) {
997a55caa1c3b77 Daniele Ceraolo Spurio 2024-01-17  201  			xe_gt_err(gt, "Invalid gsc header in proxy reply (%pe)\n",
997a55caa1c3b77 Daniele Ceraolo Spurio 2024-01-17  202  				  ERR_PTR(ret));
997a55caa1c3b77 Daniele Ceraolo Spurio 2024-01-17  203  			goto proxy_error;
997a55caa1c3b77 Daniele Ceraolo Spurio 2024-01-17  204  		}
997a55caa1c3b77 Daniele Ceraolo Spurio 2024-01-17  205  
997a55caa1c3b77 Daniele Ceraolo Spurio 2024-01-17  206  		/* copy the proxy header reply from GSC */
997a55caa1c3b77 Daniele Ceraolo Spurio 2024-01-17  207  		xe_map_memcpy_from(xe, to_csme_hdr, &gsc->proxy.from_gsc,
997a55caa1c3b77 Daniele Ceraolo Spurio 2024-01-17  208  				   reply_offset, PROXY_HDR_SIZE);
997a55caa1c3b77 Daniele Ceraolo Spurio 2024-01-17  209  
997a55caa1c3b77 Daniele Ceraolo Spurio 2024-01-17  210  		/* stop if this was the last message */
997a55caa1c3b77 Daniele Ceraolo Spurio 2024-01-17  211  		if (FIELD_GET(GSC_PROXY_TYPE, to_csme_hdr->hdr) == GSC_PROXY_MSG_TYPE_PROXY_END)
997a55caa1c3b77 Daniele Ceraolo Spurio 2024-01-17  212  			break;
997a55caa1c3b77 Daniele Ceraolo Spurio 2024-01-17  213  
997a55caa1c3b77 Daniele Ceraolo Spurio 2024-01-17  214  		/* make sure the GSC-to-CSME proxy header is sane */
997a55caa1c3b77 Daniele Ceraolo Spurio 2024-01-17  215  		ret = validate_proxy_header(to_csme_hdr,
997a55caa1c3b77 Daniele Ceraolo Spurio 2024-01-17  216  					    GSC_PROXY_ADDRESSING_GSC,
997a55caa1c3b77 Daniele Ceraolo Spurio 2024-01-17  217  					    GSC_PROXY_ADDRESSING_CSME,
997a55caa1c3b77 Daniele Ceraolo Spurio 2024-01-17  218  					    GSC_PROXY_BUFFER_SIZE - reply_offset);
997a55caa1c3b77 Daniele Ceraolo Spurio 2024-01-17  219  		if (ret) {
997a55caa1c3b77 Daniele Ceraolo Spurio 2024-01-17  220  			xe_gt_err(gt, "invalid GSC to CSME proxy header! (%pe)\n",
997a55caa1c3b77 Daniele Ceraolo Spurio 2024-01-17  221  				  ERR_PTR(ret));
997a55caa1c3b77 Daniele Ceraolo Spurio 2024-01-17  222  			goto proxy_error;
997a55caa1c3b77 Daniele Ceraolo Spurio 2024-01-17  223  		}
997a55caa1c3b77 Daniele Ceraolo Spurio 2024-01-17  224  
997a55caa1c3b77 Daniele Ceraolo Spurio 2024-01-17  225  		/* copy the rest of the message */
997a55caa1c3b77 Daniele Ceraolo Spurio 2024-01-17  226  		size = FIELD_GET(GSC_PROXY_PAYLOAD_LENGTH, to_csme_hdr->hdr);
997a55caa1c3b77 Daniele Ceraolo Spurio 2024-01-17  227  		xe_map_memcpy_from(xe, to_csme_payload, &gsc->proxy.from_gsc,
997a55caa1c3b77 Daniele Ceraolo Spurio 2024-01-17  228  				   reply_offset + PROXY_HDR_SIZE, size);
997a55caa1c3b77 Daniele Ceraolo Spurio 2024-01-17  229  
997a55caa1c3b77 Daniele Ceraolo Spurio 2024-01-17  230  		/* send the GSC message to the CSME */
997a55caa1c3b77 Daniele Ceraolo Spurio 2024-01-17  231  		ret = proxy_send_to_csme(gsc, size + PROXY_HDR_SIZE);
997a55caa1c3b77 Daniele Ceraolo Spurio 2024-01-17  232  		if (ret < 0)
997a55caa1c3b77 Daniele Ceraolo Spurio 2024-01-17  233  			goto proxy_error;
997a55caa1c3b77 Daniele Ceraolo Spurio 2024-01-17  234  
997a55caa1c3b77 Daniele Ceraolo Spurio 2024-01-17  235  		/* reply size from CSME, including the proxy header */
997a55caa1c3b77 Daniele Ceraolo Spurio 2024-01-17  236  		size = ret;
997a55caa1c3b77 Daniele Ceraolo Spurio 2024-01-17  237  		if (size < PROXY_HDR_SIZE) {
997a55caa1c3b77 Daniele Ceraolo Spurio 2024-01-17  238  			xe_gt_err(gt, "CSME to GSC proxy msg too small: 0x%x\n", size);
997a55caa1c3b77 Daniele Ceraolo Spurio 2024-01-17  239  			ret = -EPROTO;
997a55caa1c3b77 Daniele Ceraolo Spurio 2024-01-17  240  			goto proxy_error;
997a55caa1c3b77 Daniele Ceraolo Spurio 2024-01-17  241  		}
997a55caa1c3b77 Daniele Ceraolo Spurio 2024-01-17  242  
997a55caa1c3b77 Daniele Ceraolo Spurio 2024-01-17  243  		/* make sure the CSME-to-GSC proxy header is sane */
997a55caa1c3b77 Daniele Ceraolo Spurio 2024-01-17  244  		ret = validate_proxy_header(gsc->proxy.from_csme,
997a55caa1c3b77 Daniele Ceraolo Spurio 2024-01-17  245  					    GSC_PROXY_ADDRESSING_CSME,
997a55caa1c3b77 Daniele Ceraolo Spurio 2024-01-17  246  					    GSC_PROXY_ADDRESSING_GSC,
997a55caa1c3b77 Daniele Ceraolo Spurio 2024-01-17  247  					    GSC_PROXY_BUFFER_SIZE - reply_offset);
997a55caa1c3b77 Daniele Ceraolo Spurio 2024-01-17  248  		if (ret) {
997a55caa1c3b77 Daniele Ceraolo Spurio 2024-01-17  249  			xe_gt_err(gt, "invalid CSME to GSC proxy header! %d\n", ret);
997a55caa1c3b77 Daniele Ceraolo Spurio 2024-01-17  250  			goto proxy_error;
997a55caa1c3b77 Daniele Ceraolo Spurio 2024-01-17  251  		}
997a55caa1c3b77 Daniele Ceraolo Spurio 2024-01-17  252  
997a55caa1c3b77 Daniele Ceraolo Spurio 2024-01-17  253  		/* Emit a new header for sending the reply to the GSC */
997a55caa1c3b77 Daniele Ceraolo Spurio 2024-01-17  254  		wr_offset = xe_gsc_emit_header(xe, &gsc->proxy.to_gsc, 0,
997a55caa1c3b77 Daniele Ceraolo Spurio 2024-01-17  255  					       HECI_MEADDRESS_PROXY, 0, size);
997a55caa1c3b77 Daniele Ceraolo Spurio 2024-01-17  256  
997a55caa1c3b77 Daniele Ceraolo Spurio 2024-01-17  257  		/* copy the CSME reply and update the total msg size to include the GSC header */
997a55caa1c3b77 Daniele Ceraolo Spurio 2024-01-17  258  		xe_map_memcpy_to(xe, &gsc->proxy.to_gsc, wr_offset, gsc->proxy.from_csme, size);
997a55caa1c3b77 Daniele Ceraolo Spurio 2024-01-17  259  
997a55caa1c3b77 Daniele Ceraolo Spurio 2024-01-17  260  		size += wr_offset;
997a55caa1c3b77 Daniele Ceraolo Spurio 2024-01-17  261  	}
997a55caa1c3b77 Daniele Ceraolo Spurio 2024-01-17  262  
997a55caa1c3b77 Daniele Ceraolo Spurio 2024-01-17  263  proxy_error:
997a55caa1c3b77 Daniele Ceraolo Spurio 2024-01-17 @264  	return ret < 0 ? ret : 0;
997a55caa1c3b77 Daniele Ceraolo Spurio 2024-01-17  265  }
997a55caa1c3b77 Daniele Ceraolo Spurio 2024-01-17  266  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
