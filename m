Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F8FE20E2
	for <oe-kbuild@lists.linux.dev>; Mon,  1 May 2023 11:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682942167; x=1714478167;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AowB0dtE/GiqRqSQId+uz2/i4mBawTqsLT6XH0iW38s=;
  b=YQNcu0zOEqqybtFgasSOmj+OEzupjJhD6y0WGs1vtVuHp3ghusyKNda9
   JxGZXcrBQCoBk2Hwgvmsg0SMnmpbDh1MyGOwdFPjtBzYsViW+AN6Kbe0B
   vyjyobZqZlxteBuFx0CM6QaKnjLpHpAaRYXQpyEwFeq5N8iEDfm8Smgmm
   Rg8mFR4xcMWCCObXCkhXN76IRtTTIJZ5F9JJAYXx7RdulQButYCPWQwtA
   7UfZL51ZWUMybDEIlnai+eyBDt7b/fxS8/i3UubuuUZL4wtVseBseu2rJ
   HUKqgQleGBPB5elV1gm05oVhnSuA4fL5/Eu3mmKbtPGNrrnBh7L4+KZLk
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="346936064"
X-IronPort-AV: E=Sophos;i="5.99,241,1677571200"; 
   d="scan'208";a="346936064"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2023 04:56:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="695766442"
X-IronPort-AV: E=Sophos;i="5.99,241,1677571200"; 
   d="scan'208";a="695766442"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 01 May 2023 04:56:05 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ptS8S-0000S4-1b;
	Mon, 01 May 2023 11:56:04 +0000
Date: Mon, 1 May 2023 19:55:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [Intel-gfx] [PATCH v2 1/8] DO NOT REVIEW: drm/i915: Add support
 for MTL GSC SW Proxy
Message-ID: <202305011931.nKlNklEl-lkp@intel.com>
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
In-Reply-To: <20230428185810.4127234-2-daniele.ceraolospurio@intel.com>
References: <20230428185810.4127234-2-daniele.ceraolospurio@intel.com>
TO: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
TO: intel-gfx@lists.freedesktop.org
CC: dri-devel@lists.freedesktop.org

Hi Daniele,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-tip/drm-tip]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniele-Ceraolo-Spurio/DO-NOT-REVIEW-drm-i915-Add-support-for-MTL-GSC-SW-Proxy/20230429-030037
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
patch link:    https://lore.kernel.org/r/20230428185810.4127234-2-daniele.ceraolospurio%40intel.com
patch subject: [Intel-gfx] [PATCH v2 1/8] DO NOT REVIEW: drm/i915: Add support for MTL GSC SW Proxy
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-c002 (https://download.01.org/0day-ci/archive/20230501/202305011931.nKlNklEl-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Link: https://lore.kernel.org/r/202305011931.nKlNklEl-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.c:252:12-13: WARNING opportunity for min()

vim +252 drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.c

481d87f2c96fc3 Daniele Ceraolo Spurio 2023-04-28  185  
481d87f2c96fc3 Daniele Ceraolo Spurio 2023-04-28  186  static int proxy_query(struct intel_gsc_uc *gsc)
481d87f2c96fc3 Daniele Ceraolo Spurio 2023-04-28  187  {
481d87f2c96fc3 Daniele Ceraolo Spurio 2023-04-28  188  	struct intel_gt *gt = gsc_uc_to_gt(gsc);
481d87f2c96fc3 Daniele Ceraolo Spurio 2023-04-28  189  	struct gsc_proxy_msg *to_gsc = gsc->proxy.to_gsc;
481d87f2c96fc3 Daniele Ceraolo Spurio 2023-04-28  190  	struct gsc_proxy_msg *to_csme = gsc->proxy.to_csme;
481d87f2c96fc3 Daniele Ceraolo Spurio 2023-04-28  191  	int ret;
481d87f2c96fc3 Daniele Ceraolo Spurio 2023-04-28  192  
481d87f2c96fc3 Daniele Ceraolo Spurio 2023-04-28  193  	intel_gsc_uc_heci_cmd_emit_mtl_header(&to_gsc->header,
481d87f2c96fc3 Daniele Ceraolo Spurio 2023-04-28  194  					      HECI_MEADDRESS_PROXY,
481d87f2c96fc3 Daniele Ceraolo Spurio 2023-04-28  195  					      sizeof(struct gsc_proxy_msg),
481d87f2c96fc3 Daniele Ceraolo Spurio 2023-04-28  196  					      0);
481d87f2c96fc3 Daniele Ceraolo Spurio 2023-04-28  197  
481d87f2c96fc3 Daniele Ceraolo Spurio 2023-04-28  198  	to_gsc->proxy_header.hdr =
481d87f2c96fc3 Daniele Ceraolo Spurio 2023-04-28  199  		FIELD_PREP(GSC_PROXY_TYPE, GSC_PROXY_MSG_TYPE_PROXY_QUERY) |
481d87f2c96fc3 Daniele Ceraolo Spurio 2023-04-28  200  		FIELD_PREP(GSC_PROXY_PAYLOAD_LENGTH, 0);
481d87f2c96fc3 Daniele Ceraolo Spurio 2023-04-28  201  
481d87f2c96fc3 Daniele Ceraolo Spurio 2023-04-28  202  	to_gsc->proxy_header.source = GSC_PROXY_ADDRESSING_KMD;
481d87f2c96fc3 Daniele Ceraolo Spurio 2023-04-28  203  	to_gsc->proxy_header.destination = GSC_PROXY_ADDRESSING_GSC;
481d87f2c96fc3 Daniele Ceraolo Spurio 2023-04-28  204  	to_gsc->proxy_header.status = 0;
481d87f2c96fc3 Daniele Ceraolo Spurio 2023-04-28  205  
481d87f2c96fc3 Daniele Ceraolo Spurio 2023-04-28  206  	while (1) {
481d87f2c96fc3 Daniele Ceraolo Spurio 2023-04-28  207  		/* clear the GSC response header space */
481d87f2c96fc3 Daniele Ceraolo Spurio 2023-04-28  208  		memset(gsc->proxy.to_csme, 0, sizeof(struct gsc_proxy_msg));
481d87f2c96fc3 Daniele Ceraolo Spurio 2023-04-28  209  
481d87f2c96fc3 Daniele Ceraolo Spurio 2023-04-28  210  		/* send proxy message to GSC */
481d87f2c96fc3 Daniele Ceraolo Spurio 2023-04-28  211  		ret = proxy_send_to_gsc(gsc);
481d87f2c96fc3 Daniele Ceraolo Spurio 2023-04-28  212  		if (ret) {
481d87f2c96fc3 Daniele Ceraolo Spurio 2023-04-28  213  			gt_err(gt, "failed to send proxy message to GSC! %d\n", ret);
481d87f2c96fc3 Daniele Ceraolo Spurio 2023-04-28  214  			goto proxy_error;
481d87f2c96fc3 Daniele Ceraolo Spurio 2023-04-28  215  		}
481d87f2c96fc3 Daniele Ceraolo Spurio 2023-04-28  216  
481d87f2c96fc3 Daniele Ceraolo Spurio 2023-04-28  217  		/* stop if this was the last message */
481d87f2c96fc3 Daniele Ceraolo Spurio 2023-04-28  218  		if (FIELD_GET(GSC_PROXY_TYPE, to_csme->proxy_header.hdr) ==
481d87f2c96fc3 Daniele Ceraolo Spurio 2023-04-28  219  				GSC_PROXY_MSG_TYPE_PROXY_END)
481d87f2c96fc3 Daniele Ceraolo Spurio 2023-04-28  220  			break;
481d87f2c96fc3 Daniele Ceraolo Spurio 2023-04-28  221  
481d87f2c96fc3 Daniele Ceraolo Spurio 2023-04-28  222  		/* make sure the GSC-to-CSME proxy header is sane */
481d87f2c96fc3 Daniele Ceraolo Spurio 2023-04-28  223  		ret = validate_proxy_header(&to_csme->proxy_header,
481d87f2c96fc3 Daniele Ceraolo Spurio 2023-04-28  224  					    GSC_PROXY_ADDRESSING_GSC,
481d87f2c96fc3 Daniele Ceraolo Spurio 2023-04-28  225  					    GSC_PROXY_ADDRESSING_CSME);
481d87f2c96fc3 Daniele Ceraolo Spurio 2023-04-28  226  		if (ret) {
481d87f2c96fc3 Daniele Ceraolo Spurio 2023-04-28  227  			gt_err(gt, "invalid GSC to CSME proxy header! %d\n", ret);
481d87f2c96fc3 Daniele Ceraolo Spurio 2023-04-28  228  			goto proxy_error;
481d87f2c96fc3 Daniele Ceraolo Spurio 2023-04-28  229  		}
481d87f2c96fc3 Daniele Ceraolo Spurio 2023-04-28  230  
481d87f2c96fc3 Daniele Ceraolo Spurio 2023-04-28  231  		/* send the GSC message to the CSME */
481d87f2c96fc3 Daniele Ceraolo Spurio 2023-04-28  232  		ret = proxy_send_to_csme(gsc);
481d87f2c96fc3 Daniele Ceraolo Spurio 2023-04-28  233  		if (ret < 0) {
481d87f2c96fc3 Daniele Ceraolo Spurio 2023-04-28  234  			gt_err(gt, "failed to send proxy message to CSME! %d\n", ret);
481d87f2c96fc3 Daniele Ceraolo Spurio 2023-04-28  235  			goto proxy_error;
481d87f2c96fc3 Daniele Ceraolo Spurio 2023-04-28  236  		}
481d87f2c96fc3 Daniele Ceraolo Spurio 2023-04-28  237  
481d87f2c96fc3 Daniele Ceraolo Spurio 2023-04-28  238  		/* update the GSC message size with the returned value from CSME */
481d87f2c96fc3 Daniele Ceraolo Spurio 2023-04-28  239  		to_gsc->header.message_size = ret + sizeof(struct intel_gsc_mtl_header);
481d87f2c96fc3 Daniele Ceraolo Spurio 2023-04-28  240  
481d87f2c96fc3 Daniele Ceraolo Spurio 2023-04-28  241  		/* make sure the CSME-to-GSC proxy header is sane */
481d87f2c96fc3 Daniele Ceraolo Spurio 2023-04-28  242  		ret = validate_proxy_header(&to_gsc->proxy_header,
481d87f2c96fc3 Daniele Ceraolo Spurio 2023-04-28  243  					    GSC_PROXY_ADDRESSING_CSME,
481d87f2c96fc3 Daniele Ceraolo Spurio 2023-04-28  244  					    GSC_PROXY_ADDRESSING_GSC);
481d87f2c96fc3 Daniele Ceraolo Spurio 2023-04-28  245  		if (ret) {
481d87f2c96fc3 Daniele Ceraolo Spurio 2023-04-28  246  			gt_err(gt, "invalid CSME to GSC proxy header! %d\n", ret);
481d87f2c96fc3 Daniele Ceraolo Spurio 2023-04-28  247  			goto proxy_error;
481d87f2c96fc3 Daniele Ceraolo Spurio 2023-04-28  248  		}
481d87f2c96fc3 Daniele Ceraolo Spurio 2023-04-28  249  	}
481d87f2c96fc3 Daniele Ceraolo Spurio 2023-04-28  250  
481d87f2c96fc3 Daniele Ceraolo Spurio 2023-04-28  251  proxy_error:
481d87f2c96fc3 Daniele Ceraolo Spurio 2023-04-28 @252  	return ret < 0 ? ret : 0;
481d87f2c96fc3 Daniele Ceraolo Spurio 2023-04-28  253  }
481d87f2c96fc3 Daniele Ceraolo Spurio 2023-04-28  254  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
