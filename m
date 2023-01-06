Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4999A7E8
	for <oe-kbuild@lists.linux.dev>; Fri,  6 Jan 2023 18:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673030765; x=1704566765;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ril0S065MU9CFDO8sWenDOysSElwjOIePPVllrBIxQU=;
  b=EVsLi5ejveZCETS0Py57fBU0T2x9tuL9vwqJIwl8ODTUSuASIkHWzeID
   Dh3ZNLu/etN6BytrCrQ9BOZz+Z9RcTD0KqJt9Fqu2bHIcir+7hN11U7M5
   I3flT4R1iF5hAORFv0qvwzDkBVVPvvE1IXUbFdWMhURXtDcSvGfQzhWc3
   2Hx1VKVtlMPhde3IRkeH/E7UuXe/s15p0Urd4VfP2vW1XiubmddV8kJXA
   XzWrddBEOsMCMJ2pscUUbefb2oS5E28EeGxI3J7oL85nI6msG3lVr7Iym
   x+8Kz/6noJJhPpqTVfH1b6uq+ySKD0IlFx1yr3SaKkGZ+NLQnf5vltInH
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10582"; a="321239274"
X-IronPort-AV: E=Sophos;i="5.96,306,1665471600"; 
   d="scan'208";a="321239274"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2023 10:46:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10582"; a="656018338"
X-IronPort-AV: E=Sophos;i="5.96,306,1665471600"; 
   d="scan'208";a="656018338"
Received: from lkp-server02.sh.intel.com (HELO f1920e93ebb5) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 06 Jan 2023 10:46:03 -0800
Received: from kbuild by f1920e93ebb5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pDrj8-0003mw-0q;
	Fri, 06 Jan 2023 18:46:02 +0000
Date: Sat, 7 Jan 2023 02:45:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/char/random.c:527:21: warning: Opposite expression on both
 sides of '%'. [oppositeExpression]
Message-ID: <202301070239.IIyO1Uh5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/char/random.c:527:21: warning: Opposite expression on both sides of '%'. [oppositeExpression]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Jason A. Donenfeld" <zx2c4@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1f5abbd77e2c1787e74b7c2caffac97def78ba52
commit: e9a688bcb19348862afe30d7c85bc37c4c293471 random: use rejection sampling for uniform bounded random integers
date:   7 weeks ago
:::::: branch date: 21 hours ago
:::::: commit date: 7 weeks ago
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout e9a688bcb19348862afe30d7c85bc37c4c293471
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/char/random.c:527:21: warning: Opposite expression on both sides of '%'. [oppositeExpression]
     u32 bound = -ceil % ceil;
                       ^
>> drivers/gpu/drm/drm_format_helper.c:173:38: warning: Parameter 'dst' can be declared as pointer to const [constParameter]
   void drm_fb_memcpy(struct iosys_map *dst, const unsigned int *dst_pitch,
                                        ^

vim +527 drivers/char/random.c

3655adc7089da4 Jason A. Donenfeld 2022-02-11  513  
e9a688bcb19348 Jason A. Donenfeld 2022-10-08  514  u32 __get_random_u32_below(u32 ceil)
e9a688bcb19348 Jason A. Donenfeld 2022-10-08  515  {
e9a688bcb19348 Jason A. Donenfeld 2022-10-08  516  	/*
e9a688bcb19348 Jason A. Donenfeld 2022-10-08  517  	 * This is the slow path for variable ceil. It is still fast, most of
e9a688bcb19348 Jason A. Donenfeld 2022-10-08  518  	 * the time, by doing traditional reciprocal multiplication and
e9a688bcb19348 Jason A. Donenfeld 2022-10-08  519  	 * opportunistically comparing the lower half to ceil itself, before
e9a688bcb19348 Jason A. Donenfeld 2022-10-08  520  	 * falling back to computing a larger bound, and then rejecting samples
e9a688bcb19348 Jason A. Donenfeld 2022-10-08  521  	 * whose lower half would indicate a range indivisible by ceil. The use
e9a688bcb19348 Jason A. Donenfeld 2022-10-08  522  	 * of `-ceil % ceil` is analogous to `2^32 % ceil`, but is computable
e9a688bcb19348 Jason A. Donenfeld 2022-10-08  523  	 * in 32-bits.
e9a688bcb19348 Jason A. Donenfeld 2022-10-08  524  	 */
e9a688bcb19348 Jason A. Donenfeld 2022-10-08  525  	u64 mult = (u64)ceil * get_random_u32();
e9a688bcb19348 Jason A. Donenfeld 2022-10-08  526  	if (unlikely((u32)mult < ceil)) {
e9a688bcb19348 Jason A. Donenfeld 2022-10-08 @527  		u32 bound = -ceil % ceil;
e9a688bcb19348 Jason A. Donenfeld 2022-10-08  528  		while (unlikely((u32)mult < bound))
e9a688bcb19348 Jason A. Donenfeld 2022-10-08  529  			mult = (u64)ceil * get_random_u32();
e9a688bcb19348 Jason A. Donenfeld 2022-10-08  530  	}
e9a688bcb19348 Jason A. Donenfeld 2022-10-08  531  	return mult >> 32;
e9a688bcb19348 Jason A. Donenfeld 2022-10-08  532  }
e9a688bcb19348 Jason A. Donenfeld 2022-10-08  533  EXPORT_SYMBOL(__get_random_u32_below);
e9a688bcb19348 Jason A. Donenfeld 2022-10-08  534  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
