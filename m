Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8EE94A24
	for <oe-kbuild@lists.linux.dev>; Sun, 17 Sep 2023 14:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694962207; x=1726498207;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1GoESzI4jXiqnd203jwNQ0NRBREF13qZ4xzKrBbzuOY=;
  b=YFGdpzhj631QVrCa8I/Y5UzYdqHr9rxEkp1UiswfoWwEKEzU+dhimPS1
   QaFOLcaTs+sXlgxsUHOhkbtRYB+xTxODcCjKdgPBn0fx0Tg+DKXkSb7nc
   ocgTG1vn7vE+ZZFNXNNf0oLCk7Pyl0V8vGHDFguerGFoEsUjdxI6yAkJJ
   ISTkmUCA7HBIJ0kq3RwFaoBuZUtwaoT8FM3/b46Bk17UP2Ugbxc1r69/s
   cUfTtPZB5+1lHsYzG9HQ9auGByTFKAw2HRnyId48H4sw3aJvOPPotIh5D
   sz/6ZkBFLuLT+JneE2ghHKTKM/EfDlyVslH7KqVkrrms+dWezeg6Q1rEL
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="465849020"
X-IronPort-AV: E=Sophos;i="6.02,154,1688454000"; 
   d="scan'208";a="465849020"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2023 07:50:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="992427907"
X-IronPort-AV: E=Sophos;i="6.02,154,1688454000"; 
   d="scan'208";a="992427907"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 17 Sep 2023 07:50:05 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qht62-0005FN-3D;
	Sun, 17 Sep 2023 14:50:03 +0000
Date: Sun, 17 Sep 2023 22:49:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: net/wireless/scan.c:367 cfg80211_gen_new_ie() warn: potential
 spectre issue 'sub->data' [r]
Message-ID: <202309172255.IJ46mosc-lkp@intel.com>
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
TO: Benjamin Berg <benjamin.berg@intel.com>
CC: Johannes Berg <johannes.berg@intel.com>
CC: Gregory Greenman <gregory.greenman@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f0b0d403eabbe135d8dbb40ad5e41018947d336c
commit: dfd9aa3e7a456d57b18021d66472ab7ff8373ab7 wifi: cfg80211: rewrite merging of inherited elements
date:   3 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 3 months ago
config: x86_64-randconfig-161-20230917 (https://download.01.org/0day-ci/archive/20230917/202309172255.IJ46mosc-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230917/202309172255.IJ46mosc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309172255.IJ46mosc-lkp@intel.com/

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
