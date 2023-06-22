Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F101F164
	for <oe-kbuild@lists.linux.dev>; Thu, 22 Jun 2023 14:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687443430; x=1718979430;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+rKwS+vlsNdgaUcsk00ROckEEFaP02fpUM7Tz4NB7I8=;
  b=IcmUUiF3rXu+jOoTzUnMM5tCgq04UsTl2Y/PbAEi8qFNeZMWS2Ya9k6K
   er/IMi0rxg/t7GoNcLy067eE0RWbt2wEU8g5HhB25Dvq/s2KMhyoLh82W
   PXV+skeVthF2ZS3b5E2KQk+a0i0g9ju1i7RD8mSdqucVc9ZkeNBWdSo4m
   nbNY5CmertFc8Oib+vxmlRif0xEpJ6vY/8sN4HBe14L294tq2m+AfiaiK
   ZfMXzbujVhh+u2EkY+zmvMnLp9FZTmFvkdSXhOGuM4FWxOp0ZRWdCVD3D
   IUqlzGOhEqBhKHSq+V8ZukJKvWya7Kxsw/sFV8oRwZmD2crkmJFF2Ir4q
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="426463888"
X-IronPort-AV: E=Sophos;i="6.01,149,1684825200"; 
   d="scan'208";a="426463888"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2023 06:38:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="784912780"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; 
   d="scan'208";a="784912780"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 22 Jun 2023 06:37:39 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qCKVG-0007ZP-1p;
	Thu, 22 Jun 2023 13:37:38 +0000
Date: Thu, 22 Jun 2023 21:37:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 10293/11867] net/wireless/scan.c:367
 cfg80211_gen_new_ie() warn: potential spectre issue 'sub->data' [r]
Message-ID: <202306222123.5qjvhJLp-lkp@intel.com>
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
TO: Benjamin Berg <benjamin.berg@intel.com>
CC: Johannes Berg <johannes.berg@intel.com>
CC: Gregory Greenman <gregory.greenman@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c87d46a9e8ebd2f2c3960927b1d21687096d1109
commit: dfd9aa3e7a456d57b18021d66472ab7ff8373ab7 [10293/11867] wifi: cfg80211: rewrite merging of inherited elements
:::::: branch date: 8 hours ago
:::::: commit date: 3 days ago
config: m68k-randconfig-m031-20230622 (https://download.01.org/0day-ci/archive/20230622/202306222123.5qjvhJLp-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230622/202306222123.5qjvhJLp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202306222123.5qjvhJLp-lkp@intel.com/

New smatch warnings:
net/wireless/scan.c:367 cfg80211_gen_new_ie() warn: potential spectre issue 'sub->data' [r]
net/wireless/scan.c:391 cfg80211_gen_new_ie() warn: possible spectre second half.  'ext_id'

Old smatch warnings:
net/wireless/scan.c:400 cfg80211_gen_new_ie() warn: possible spectre second half.  'ext_id'

vim +367 net/wireless/scan.c

f7dacfb11475ba Sara Sharon   2019-03-15  299  
dfd9aa3e7a456d Benjamin Berg 2023-06-16  300  static size_t cfg80211_gen_new_ie(const u8 *ie, size_t ielen,
dfd9aa3e7a456d Benjamin Berg 2023-06-16  301  				  const u8 *subie, size_t subie_len,
dfd9aa3e7a456d Benjamin Berg 2023-06-16  302  				  u8 *new_ie, size_t new_ie_len)
dfd9aa3e7a456d Benjamin Berg 2023-06-16  303  {
dfd9aa3e7a456d Benjamin Berg 2023-06-16  304  	const struct element *non_inherit_elem, *parent, *sub;
dfd9aa3e7a456d Benjamin Berg 2023-06-16  305  	u8 *pos = new_ie;
dfd9aa3e7a456d Benjamin Berg 2023-06-16  306  	u8 id, ext_id;
dfd9aa3e7a456d Benjamin Berg 2023-06-16  307  	unsigned int match_len;
dfd9aa3e7a456d Benjamin Berg 2023-06-16  308  
dfd9aa3e7a456d Benjamin Berg 2023-06-16  309  	non_inherit_elem = cfg80211_find_ext_elem(WLAN_EID_EXT_NON_INHERITANCE,
dfd9aa3e7a456d Benjamin Berg 2023-06-16  310  						  subie, subie_len);
dfd9aa3e7a456d Benjamin Berg 2023-06-16  311  
dfd9aa3e7a456d Benjamin Berg 2023-06-16  312  	/* We copy the elements one by one from the parent to the generated
dfd9aa3e7a456d Benjamin Berg 2023-06-16  313  	 * elements.
dfd9aa3e7a456d Benjamin Berg 2023-06-16  314  	 * If they are not inherited (included in subie or in the non
dfd9aa3e7a456d Benjamin Berg 2023-06-16  315  	 * inheritance element), then we copy all occurrences the first time
dfd9aa3e7a456d Benjamin Berg 2023-06-16  316  	 * we see this element type.
0b8fb8235be8be Peng Xu       2019-01-21  317  	 */
dfd9aa3e7a456d Benjamin Berg 2023-06-16  318  	for_each_element(parent, ie, ielen) {
dfd9aa3e7a456d Benjamin Berg 2023-06-16  319  		if (parent->id == WLAN_EID_FRAGMENT)
dfd9aa3e7a456d Benjamin Berg 2023-06-16  320  			continue;
0b8fb8235be8be Peng Xu       2019-01-21  321  
dfd9aa3e7a456d Benjamin Berg 2023-06-16  322  		if (parent->id == WLAN_EID_EXTENSION) {
dfd9aa3e7a456d Benjamin Berg 2023-06-16  323  			if (parent->datalen < 1)
0b8fb8235be8be Peng Xu       2019-01-21  324  				continue;
dfd9aa3e7a456d Benjamin Berg 2023-06-16  325  
dfd9aa3e7a456d Benjamin Berg 2023-06-16  326  			id = WLAN_EID_EXTENSION;
dfd9aa3e7a456d Benjamin Berg 2023-06-16  327  			ext_id = parent->data[0];
dfd9aa3e7a456d Benjamin Berg 2023-06-16  328  			match_len = 1;
dfd9aa3e7a456d Benjamin Berg 2023-06-16  329  		} else {
dfd9aa3e7a456d Benjamin Berg 2023-06-16  330  			id = parent->id;
dfd9aa3e7a456d Benjamin Berg 2023-06-16  331  			match_len = 0;
0b8fb8235be8be Peng Xu       2019-01-21  332  		}
0b8fb8235be8be Peng Xu       2019-01-21  333  
dfd9aa3e7a456d Benjamin Berg 2023-06-16  334  		/* Find first occurrence in subie */
dfd9aa3e7a456d Benjamin Berg 2023-06-16  335  		sub = cfg80211_find_elem_match(id, subie, subie_len,
dfd9aa3e7a456d Benjamin Berg 2023-06-16  336  					       &ext_id, match_len, 0);
c17fe043a3b792 Sara Sharon   2019-01-29  337  
dfd9aa3e7a456d Benjamin Berg 2023-06-16  338  		/* Copy from parent if not in subie and inherited */
dfd9aa3e7a456d Benjamin Berg 2023-06-16  339  		if (!sub &&
dfd9aa3e7a456d Benjamin Berg 2023-06-16  340  		    cfg80211_is_element_inherited(parent, non_inherit_elem)) {
dfd9aa3e7a456d Benjamin Berg 2023-06-16  341  			if (!cfg80211_copy_elem_with_frags(parent,
dfd9aa3e7a456d Benjamin Berg 2023-06-16  342  							   ie, ielen,
dfd9aa3e7a456d Benjamin Berg 2023-06-16  343  							   &pos, new_ie,
dfd9aa3e7a456d Benjamin Berg 2023-06-16  344  							   new_ie_len))
dfd9aa3e7a456d Benjamin Berg 2023-06-16  345  				return 0;
f7dacfb11475ba Sara Sharon   2019-03-15  346  
dfd9aa3e7a456d Benjamin Berg 2023-06-16  347  			continue;
0b8fb8235be8be Peng Xu       2019-01-21  348  		}
dfd9aa3e7a456d Benjamin Berg 2023-06-16  349  
dfd9aa3e7a456d Benjamin Berg 2023-06-16  350  		/* Already copied if an earlier element had the same type */
dfd9aa3e7a456d Benjamin Berg 2023-06-16  351  		if (cfg80211_find_elem_match(id, ie, (u8 *)parent - ie,
dfd9aa3e7a456d Benjamin Berg 2023-06-16  352  					     &ext_id, match_len, 0))
dfd9aa3e7a456d Benjamin Berg 2023-06-16  353  			continue;
dfd9aa3e7a456d Benjamin Berg 2023-06-16  354  
dfd9aa3e7a456d Benjamin Berg 2023-06-16  355  		/* Not inheriting, copy all similar elements from subie */
dfd9aa3e7a456d Benjamin Berg 2023-06-16  356  		while (sub) {
dfd9aa3e7a456d Benjamin Berg 2023-06-16  357  			if (!cfg80211_copy_elem_with_frags(sub,
dfd9aa3e7a456d Benjamin Berg 2023-06-16  358  							   subie, subie_len,
dfd9aa3e7a456d Benjamin Berg 2023-06-16  359  							   &pos, new_ie,
dfd9aa3e7a456d Benjamin Berg 2023-06-16  360  							   new_ie_len))
dfd9aa3e7a456d Benjamin Berg 2023-06-16  361  				return 0;
dfd9aa3e7a456d Benjamin Berg 2023-06-16  362  
dfd9aa3e7a456d Benjamin Berg 2023-06-16  363  			sub = cfg80211_find_elem_match(id,
dfd9aa3e7a456d Benjamin Berg 2023-06-16  364  						       sub->data + sub->datalen,
dfd9aa3e7a456d Benjamin Berg 2023-06-16  365  						       subie_len + subie -
dfd9aa3e7a456d Benjamin Berg 2023-06-16  366  						       (sub->data +
dfd9aa3e7a456d Benjamin Berg 2023-06-16 @367  							sub->datalen),
dfd9aa3e7a456d Benjamin Berg 2023-06-16  368  						       &ext_id, match_len, 0);
0b8fb8235be8be Peng Xu       2019-01-21  369  		}
0b8fb8235be8be Peng Xu       2019-01-21  370  	}
0b8fb8235be8be Peng Xu       2019-01-21  371  
dfd9aa3e7a456d Benjamin Berg 2023-06-16  372  	/* The above misses elements that are included in subie but not in the
dfd9aa3e7a456d Benjamin Berg 2023-06-16  373  	 * parent, so do a pass over subie and append those.
dfd9aa3e7a456d Benjamin Berg 2023-06-16  374  	 * Skip the non-tx BSSID caps and non-inheritance element.
dfd9aa3e7a456d Benjamin Berg 2023-06-16  375  	 */
dfd9aa3e7a456d Benjamin Berg 2023-06-16  376  	for_each_element(sub, subie, subie_len) {
dfd9aa3e7a456d Benjamin Berg 2023-06-16  377  		if (sub->id == WLAN_EID_NON_TX_BSSID_CAP)
dfd9aa3e7a456d Benjamin Berg 2023-06-16  378  			continue;
dfd9aa3e7a456d Benjamin Berg 2023-06-16  379  
dfd9aa3e7a456d Benjamin Berg 2023-06-16  380  		if (sub->id == WLAN_EID_FRAGMENT)
dfd9aa3e7a456d Benjamin Berg 2023-06-16  381  			continue;
0b8fb8235be8be Peng Xu       2019-01-21  382  
dfd9aa3e7a456d Benjamin Berg 2023-06-16  383  		if (sub->id == WLAN_EID_EXTENSION) {
dfd9aa3e7a456d Benjamin Berg 2023-06-16  384  			if (sub->datalen < 1)
dfd9aa3e7a456d Benjamin Berg 2023-06-16  385  				continue;
dfd9aa3e7a456d Benjamin Berg 2023-06-16  386  
dfd9aa3e7a456d Benjamin Berg 2023-06-16  387  			id = WLAN_EID_EXTENSION;
dfd9aa3e7a456d Benjamin Berg 2023-06-16  388  			ext_id = sub->data[0];
dfd9aa3e7a456d Benjamin Berg 2023-06-16  389  			match_len = 1;
dfd9aa3e7a456d Benjamin Berg 2023-06-16  390  
dfd9aa3e7a456d Benjamin Berg 2023-06-16 @391  			if (ext_id == WLAN_EID_EXT_NON_INHERITANCE)
dfd9aa3e7a456d Benjamin Berg 2023-06-16  392  				continue;
dfd9aa3e7a456d Benjamin Berg 2023-06-16  393  		} else {
dfd9aa3e7a456d Benjamin Berg 2023-06-16  394  			id = sub->id;
dfd9aa3e7a456d Benjamin Berg 2023-06-16  395  			match_len = 0;
0b8fb8235be8be Peng Xu       2019-01-21  396  		}
0b8fb8235be8be Peng Xu       2019-01-21  397  
dfd9aa3e7a456d Benjamin Berg 2023-06-16  398  		/* Processed if one was included in the parent */
dfd9aa3e7a456d Benjamin Berg 2023-06-16  399  		if (cfg80211_find_elem_match(id, ie, ielen,
dfd9aa3e7a456d Benjamin Berg 2023-06-16  400  					     &ext_id, match_len, 0))
dfd9aa3e7a456d Benjamin Berg 2023-06-16  401  			continue;
dfd9aa3e7a456d Benjamin Berg 2023-06-16  402  
dfd9aa3e7a456d Benjamin Berg 2023-06-16  403  		if (!cfg80211_copy_elem_with_frags(sub, subie, subie_len,
dfd9aa3e7a456d Benjamin Berg 2023-06-16  404  						   &pos, new_ie, new_ie_len))
dfd9aa3e7a456d Benjamin Berg 2023-06-16  405  			return 0;
0b8fb8235be8be Peng Xu       2019-01-21  406  	}
0b8fb8235be8be Peng Xu       2019-01-21  407  
0b8fb8235be8be Peng Xu       2019-01-21  408  	return pos - new_ie;
0b8fb8235be8be Peng Xu       2019-01-21  409  }
0b8fb8235be8be Peng Xu       2019-01-21  410  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
