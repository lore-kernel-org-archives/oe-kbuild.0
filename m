Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BCA7111BF
	for <oe-kbuild@lists.linux.dev>; Fri,  3 Nov 2023 09:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f/ECUgOK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699004060; x=1730540060;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/rfk+/Bp6dpudTQ547SzniVnhry/gkVaYvswRZIPReQ=;
  b=f/ECUgOKJR3DASAD2F0a/zyFs1PdftsvcODQlpWZKaNLtaBPZNSj+hLD
   rnhVfEBL2fpl1rW3IntUWgFSgg2huOpkUUhYO84fHdBYu+DFQ/86F5xeH
   Yj+uZuktqpPDI3h6ujkGxVPn33zYyVhJEpDYg2akNTjWyQLCEM+XTLKke
   N3Ri5h8lv3Eb5I+O4XVWH266U2zydu9oeJiIhxhOuO/wlzItPr0rE1c6q
   4MUYmrMvqIIkZZhHiFsJambNNNdTcK3gfLMX1M6+Jm/P6kpgpIcCpzXGD
   4n/IWtv5q2qVDNpSlLf7ZyOLJSjcDsOC+y9YTm0n1b6MxhVjjjmFke6uS
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="368260157"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="368260157"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 02:34:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="827430389"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="827430389"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 03 Nov 2023 02:34:12 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qyqZ8-0002Pz-0D;
	Fri, 03 Nov 2023 09:34:10 +0000
Date: Fri, 3 Nov 2023 17:33:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/bcachefs/reflink.c:56 bch2_reflink_p_merge() warn: ignoring
 unreachable code.
Message-ID: <202311031747.kgTnFrhP-lkp@intel.com>
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
TO: Kent Overstreet <kmo@daterainc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8f6f76a6a29f36d2f3e4510d0bde5046672f6924
commit: 59ba21d99fc7a19d32fc4c2cb21509b8876d8e01 bcachefs: Clean up key merging
date:   12 days ago
:::::: branch date: 3 hours ago
:::::: commit date: 12 days ago
config: x86_64-randconfig-161-20231102 (https://download.01.org/0day-ci/archive/20231103/202311031747.kgTnFrhP-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20231103/202311031747.kgTnFrhP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311031747.kgTnFrhP-lkp@intel.com/

smatch warnings:
fs/bcachefs/reflink.c:56 bch2_reflink_p_merge() warn: ignoring unreachable code.

vim +56 fs/bcachefs/reflink.c

76426098e419c1 Kent Overstreet 2019-08-16  44  
59ba21d99fc7a1 Kent Overstreet 2021-04-28  45  bool bch2_reflink_p_merge(struct bch_fs *c, struct bkey_s _l, struct bkey_s_c _r)
76426098e419c1 Kent Overstreet 2019-08-16  46  {
76426098e419c1 Kent Overstreet 2019-08-16  47  	struct bkey_s_reflink_p l = bkey_s_to_reflink_p(_l);
59ba21d99fc7a1 Kent Overstreet 2021-04-28  48  	struct bkey_s_c_reflink_p r = bkey_s_c_to_reflink_p(_r);
76426098e419c1 Kent Overstreet 2019-08-16  49  
59ba21d99fc7a1 Kent Overstreet 2021-04-28  50  	/*
59ba21d99fc7a1 Kent Overstreet 2021-04-28  51  	 * Disabled for now, the triggers code needs to be reworked for merging
59ba21d99fc7a1 Kent Overstreet 2021-04-28  52  	 * of reflink pointers to work:
59ba21d99fc7a1 Kent Overstreet 2021-04-28  53  	 */
59ba21d99fc7a1 Kent Overstreet 2021-04-28  54  	return false;
76426098e419c1 Kent Overstreet 2019-08-16  55  
59ba21d99fc7a1 Kent Overstreet 2021-04-28 @56  	if (le64_to_cpu(l.v->idx) + l.k->size != le64_to_cpu(r.v->idx))
59ba21d99fc7a1 Kent Overstreet 2021-04-28  57  		return false;
76426098e419c1 Kent Overstreet 2019-08-16  58  
76426098e419c1 Kent Overstreet 2019-08-16  59  	bch2_key_resize(l.k, l.k->size + r.k->size);
59ba21d99fc7a1 Kent Overstreet 2021-04-28  60  	return true;
76426098e419c1 Kent Overstreet 2019-08-16  61  }
76426098e419c1 Kent Overstreet 2019-08-16  62  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
