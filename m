Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF6B323E
	for <oe-kbuild@lists.linux.dev>; Mon,  5 Jun 2023 21:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685999066; x=1717535066;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4/a3yutRjfLqw1L+P965CsVSMtI+sdtFIxeo7MxpPbI=;
  b=Tj7MJPOiA5NLEf0GMa94WbWZjB8eC2FddDeM0BmmWey2uHEL/Z+2nLLW
   W6xyI5sq14obj7L9wus3JKqmAXLRX/HNbJaP4HkhhM9dIHZBSzx9gi7Ha
   TZAFlGvR2Q4yeXbLEDa6oB68j0dhRmlwI5Yt6RvZaQQyUKtkmIGzV/PJx
   /HGtQL8LLmHyFDz559GX4S/j0wnXtnCA9EgwCWwcRmnT/jw85z1Y+seJy
   NxGaK1i3jH/170wuhqSGwAZYUZtGLUfMY3Ne1abmBhisW67Oa+tq6R0Kx
   Jn1jBFFxOyZF951PcJioqv3Pa146Vtj/yOn8xMm2xTOl8YtxMXf6/B0nB
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="420027819"
X-IronPort-AV: E=Sophos;i="6.00,218,1681196400"; 
   d="scan'208";a="420027819"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2023 14:04:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="741868230"
X-IronPort-AV: E=Sophos;i="6.00,218,1681196400"; 
   d="scan'208";a="741868230"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 05 Jun 2023 14:04:24 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q6HNH-0004RH-2Q;
	Mon, 05 Jun 2023 21:04:23 +0000
Date: Tue, 6 Jun 2023 05:03:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 709/6966]
 drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.c:251:12-13: WARNING opportunity
 for min()
Message-ID: <202306060436.OjDHaloq-lkp@intel.com>
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
TO: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
CC: Alan Previn <alan.previn.teres.alexis@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9ca10bfb8aa8fbf19ee22e702c8cf9b66ea73a54
commit: 8a9bf29546a13efd3ed7784b890c2534e995348f [709/6966] drm/i915/gsc: add initial support for GSC proxy
:::::: branch date: 17 hours ago
:::::: commit date: 5 weeks ago
config: x86_64-randconfig-c022-20230605 (https://download.01.org/0day-ci/archive/20230606/202306060436.OjDHaloq-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202306060436.OjDHaloq-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.c:251:12-13: WARNING opportunity for min()

vim +251 drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.c

8a9bf29546a13e Daniele Ceraolo Spurio 2023-05-02  184  
8a9bf29546a13e Daniele Ceraolo Spurio 2023-05-02  185  static int proxy_query(struct intel_gsc_uc *gsc)
8a9bf29546a13e Daniele Ceraolo Spurio 2023-05-02  186  {
8a9bf29546a13e Daniele Ceraolo Spurio 2023-05-02  187  	struct intel_gt *gt = gsc_uc_to_gt(gsc);
8a9bf29546a13e Daniele Ceraolo Spurio 2023-05-02  188  	struct gsc_proxy_msg *to_gsc = gsc->proxy.to_gsc;
8a9bf29546a13e Daniele Ceraolo Spurio 2023-05-02  189  	struct gsc_proxy_msg *to_csme = gsc->proxy.to_csme;
8a9bf29546a13e Daniele Ceraolo Spurio 2023-05-02  190  	int ret;
8a9bf29546a13e Daniele Ceraolo Spurio 2023-05-02  191  
8a9bf29546a13e Daniele Ceraolo Spurio 2023-05-02  192  	intel_gsc_uc_heci_cmd_emit_mtl_header(&to_gsc->header,
8a9bf29546a13e Daniele Ceraolo Spurio 2023-05-02  193  					      HECI_MEADDRESS_PROXY,
8a9bf29546a13e Daniele Ceraolo Spurio 2023-05-02  194  					      sizeof(struct gsc_proxy_msg),
8a9bf29546a13e Daniele Ceraolo Spurio 2023-05-02  195  					      0);
8a9bf29546a13e Daniele Ceraolo Spurio 2023-05-02  196  
8a9bf29546a13e Daniele Ceraolo Spurio 2023-05-02  197  	to_gsc->proxy_header.hdr =
8a9bf29546a13e Daniele Ceraolo Spurio 2023-05-02  198  		FIELD_PREP(GSC_PROXY_TYPE, GSC_PROXY_MSG_TYPE_PROXY_QUERY) |
8a9bf29546a13e Daniele Ceraolo Spurio 2023-05-02  199  		FIELD_PREP(GSC_PROXY_PAYLOAD_LENGTH, 0);
8a9bf29546a13e Daniele Ceraolo Spurio 2023-05-02  200  
8a9bf29546a13e Daniele Ceraolo Spurio 2023-05-02  201  	to_gsc->proxy_header.source = GSC_PROXY_ADDRESSING_KMD;
8a9bf29546a13e Daniele Ceraolo Spurio 2023-05-02  202  	to_gsc->proxy_header.destination = GSC_PROXY_ADDRESSING_GSC;
8a9bf29546a13e Daniele Ceraolo Spurio 2023-05-02  203  	to_gsc->proxy_header.status = 0;
8a9bf29546a13e Daniele Ceraolo Spurio 2023-05-02  204  
8a9bf29546a13e Daniele Ceraolo Spurio 2023-05-02  205  	while (1) {
8a9bf29546a13e Daniele Ceraolo Spurio 2023-05-02  206  		/* clear the GSC response header space */
8a9bf29546a13e Daniele Ceraolo Spurio 2023-05-02  207  		memset(gsc->proxy.to_csme, 0, sizeof(struct gsc_proxy_msg));
8a9bf29546a13e Daniele Ceraolo Spurio 2023-05-02  208  
8a9bf29546a13e Daniele Ceraolo Spurio 2023-05-02  209  		/* send proxy message to GSC */
8a9bf29546a13e Daniele Ceraolo Spurio 2023-05-02  210  		ret = proxy_send_to_gsc(gsc);
8a9bf29546a13e Daniele Ceraolo Spurio 2023-05-02  211  		if (ret) {
8a9bf29546a13e Daniele Ceraolo Spurio 2023-05-02  212  			gt_err(gt, "failed to send proxy message to GSC! %d\n", ret);
8a9bf29546a13e Daniele Ceraolo Spurio 2023-05-02  213  			goto proxy_error;
8a9bf29546a13e Daniele Ceraolo Spurio 2023-05-02  214  		}
8a9bf29546a13e Daniele Ceraolo Spurio 2023-05-02  215  
8a9bf29546a13e Daniele Ceraolo Spurio 2023-05-02  216  		/* stop if this was the last message */
8a9bf29546a13e Daniele Ceraolo Spurio 2023-05-02  217  		if (FIELD_GET(GSC_PROXY_TYPE, to_csme->proxy_header.hdr) ==
8a9bf29546a13e Daniele Ceraolo Spurio 2023-05-02  218  				GSC_PROXY_MSG_TYPE_PROXY_END)
8a9bf29546a13e Daniele Ceraolo Spurio 2023-05-02  219  			break;
8a9bf29546a13e Daniele Ceraolo Spurio 2023-05-02  220  
8a9bf29546a13e Daniele Ceraolo Spurio 2023-05-02  221  		/* make sure the GSC-to-CSME proxy header is sane */
8a9bf29546a13e Daniele Ceraolo Spurio 2023-05-02  222  		ret = validate_proxy_header(&to_csme->proxy_header,
8a9bf29546a13e Daniele Ceraolo Spurio 2023-05-02  223  					    GSC_PROXY_ADDRESSING_GSC,
8a9bf29546a13e Daniele Ceraolo Spurio 2023-05-02  224  					    GSC_PROXY_ADDRESSING_CSME);
8a9bf29546a13e Daniele Ceraolo Spurio 2023-05-02  225  		if (ret) {
8a9bf29546a13e Daniele Ceraolo Spurio 2023-05-02  226  			gt_err(gt, "invalid GSC to CSME proxy header! %d\n", ret);
8a9bf29546a13e Daniele Ceraolo Spurio 2023-05-02  227  			goto proxy_error;
8a9bf29546a13e Daniele Ceraolo Spurio 2023-05-02  228  		}
8a9bf29546a13e Daniele Ceraolo Spurio 2023-05-02  229  
8a9bf29546a13e Daniele Ceraolo Spurio 2023-05-02  230  		/* send the GSC message to the CSME */
8a9bf29546a13e Daniele Ceraolo Spurio 2023-05-02  231  		ret = proxy_send_to_csme(gsc);
8a9bf29546a13e Daniele Ceraolo Spurio 2023-05-02  232  		if (ret < 0) {
8a9bf29546a13e Daniele Ceraolo Spurio 2023-05-02  233  			gt_err(gt, "failed to send proxy message to CSME! %d\n", ret);
8a9bf29546a13e Daniele Ceraolo Spurio 2023-05-02  234  			goto proxy_error;
8a9bf29546a13e Daniele Ceraolo Spurio 2023-05-02  235  		}
8a9bf29546a13e Daniele Ceraolo Spurio 2023-05-02  236  
8a9bf29546a13e Daniele Ceraolo Spurio 2023-05-02  237  		/* update the GSC message size with the returned value from CSME */
8a9bf29546a13e Daniele Ceraolo Spurio 2023-05-02  238  		to_gsc->header.message_size = ret + sizeof(struct intel_gsc_mtl_header);
8a9bf29546a13e Daniele Ceraolo Spurio 2023-05-02  239  
8a9bf29546a13e Daniele Ceraolo Spurio 2023-05-02  240  		/* make sure the CSME-to-GSC proxy header is sane */
8a9bf29546a13e Daniele Ceraolo Spurio 2023-05-02  241  		ret = validate_proxy_header(&to_gsc->proxy_header,
8a9bf29546a13e Daniele Ceraolo Spurio 2023-05-02  242  					    GSC_PROXY_ADDRESSING_CSME,
8a9bf29546a13e Daniele Ceraolo Spurio 2023-05-02  243  					    GSC_PROXY_ADDRESSING_GSC);
8a9bf29546a13e Daniele Ceraolo Spurio 2023-05-02  244  		if (ret) {
8a9bf29546a13e Daniele Ceraolo Spurio 2023-05-02  245  			gt_err(gt, "invalid CSME to GSC proxy header! %d\n", ret);
8a9bf29546a13e Daniele Ceraolo Spurio 2023-05-02  246  			goto proxy_error;
8a9bf29546a13e Daniele Ceraolo Spurio 2023-05-02  247  		}
8a9bf29546a13e Daniele Ceraolo Spurio 2023-05-02  248  	}
8a9bf29546a13e Daniele Ceraolo Spurio 2023-05-02  249  
8a9bf29546a13e Daniele Ceraolo Spurio 2023-05-02  250  proxy_error:
8a9bf29546a13e Daniele Ceraolo Spurio 2023-05-02 @251  	return ret < 0 ? ret : 0;
8a9bf29546a13e Daniele Ceraolo Spurio 2023-05-02  252  }
8a9bf29546a13e Daniele Ceraolo Spurio 2023-05-02  253  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
