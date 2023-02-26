Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D34F36E
	for <oe-kbuild@lists.linux.dev>; Sun, 26 Feb 2023 02:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677378228; x=1708914228;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BLY3DBW6Ud5jpy2AHcxQPQo+Nm0223u8v6sALpR+Sv0=;
  b=RxTwxdC4SL+x9WKHWYvIaPnm8kMsM//YpF1iWZH2rD6Utrk9e4P/NepV
   DTtpiHvikyUJM61qxUhTF3xgDiurw/RawjGM77TuBZAVH3LbEiAPdFxpi
   FlHm66CvvCoJn+vHzVdl0vnfebeT8qlKCIzF6D7VE77Cs7yCyu/ZR0vnv
   Zr+dlK4ZNIeO/iiAWPjCR2r69LDJJS4srAxAoarPnqixk+2RGRGl9mHWS
   0X8LKu7hUDc4xaW/ar8y0WYuxzmkzf+oK8btvfbn1tolYhZrSuOFppP7S
   Ts5tJ80+rcHHa2eKQ1cBKCYegGfYA71AYKntj/YVQqk7M4J4+dx86XgNn
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10632"; a="335956644"
X-IronPort-AV: E=Sophos;i="5.97,328,1669104000"; 
   d="scan'208";a="335956644"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2023 18:23:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10632"; a="705708390"
X-IronPort-AV: E=Sophos;i="5.97,328,1669104000"; 
   d="scan'208";a="705708390"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 25 Feb 2023 18:23:46 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pW6hV-0003VK-2u;
	Sun, 26 Feb 2023 02:23:45 +0000
Date: Sun, 26 Feb 2023 10:23:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: net/sunrpc/auth_gss/gss_krb5_mech.c:325 gss_krb5_lookup_enctype()
 warn: we never enter this loop
Message-ID: <202302261059.zrQF1MIo-lkp@intel.com>
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
TO: Chuck Lever <chuck.lever@oracle.com>
CC: Simo Sorce <simo@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1ec35eadc3b448c91a6b763371a7073444e95f9d
commit: ddd8c1f975ee7c2fc60ea836540b5b10f97ac919 SUNRPC: Export get_gss_krb5_enctype()
date:   6 days ago
:::::: branch date: 3 hours ago
:::::: commit date: 6 days ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20230226/202302261059.zrQF1MIo-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202302261059.zrQF1MIo-lkp@intel.com/

New smatch warnings:
net/sunrpc/auth_gss/gss_krb5_mech.c:325 gss_krb5_lookup_enctype() warn: we never enter this loop

Old smatch warnings:
net/sunrpc/auth_gss/gss_krb5_mech.c:706 gss_import_v2_context() warn: passing a valid pointer to 'PTR_ERR'

vim +325 net/sunrpc/auth_gss/gss_krb5_mech.c

17781b2ce41a89 Chuck Lever   2023-01-15  312  
ddd8c1f975ee7c Chuck Lever   2023-01-15  313  /**
ddd8c1f975ee7c Chuck Lever   2023-01-15  314   * gss_krb5_lookup_enctype - Retrieve profile information for a given enctype
ddd8c1f975ee7c Chuck Lever   2023-01-15  315   * @etype: ENCTYPE value
ddd8c1f975ee7c Chuck Lever   2023-01-15  316   *
ddd8c1f975ee7c Chuck Lever   2023-01-15  317   * Returns a pointer to a gss_krb5_enctype structure, or NULL if no
ddd8c1f975ee7c Chuck Lever   2023-01-15  318   * matching etype is found.
ddd8c1f975ee7c Chuck Lever   2023-01-15  319   */
ddd8c1f975ee7c Chuck Lever   2023-01-15  320  VISIBLE_IF_KUNIT
ddd8c1f975ee7c Chuck Lever   2023-01-15  321  const struct gss_krb5_enctype *gss_krb5_lookup_enctype(u32 etype)
81d4a4333a1dfd Kevin Coffman 2010-03-17  322  {
ddd8c1f975ee7c Chuck Lever   2023-01-15  323  	size_t i;
81d4a4333a1dfd Kevin Coffman 2010-03-17  324  
ddd8c1f975ee7c Chuck Lever   2023-01-15 @325  	for (i = 0; i < ARRAY_SIZE(supported_gss_krb5_enctypes); i++)
81d4a4333a1dfd Kevin Coffman 2010-03-17  326  		if (supported_gss_krb5_enctypes[i].etype == etype)
81d4a4333a1dfd Kevin Coffman 2010-03-17  327  			return &supported_gss_krb5_enctypes[i];
81d4a4333a1dfd Kevin Coffman 2010-03-17  328  	return NULL;
81d4a4333a1dfd Kevin Coffman 2010-03-17  329  }
ddd8c1f975ee7c Chuck Lever   2023-01-15  330  EXPORT_SYMBOL_IF_KUNIT(gss_krb5_lookup_enctype);
81d4a4333a1dfd Kevin Coffman 2010-03-17  331  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
