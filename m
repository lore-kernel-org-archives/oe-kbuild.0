Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A82D44A71E
	for <oe-kbuild@lists.linux.dev>; Wed, 12 Aug 2026 21:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786568498; cv=none; b=uwYesc5kIHL6ErDYUPw6ZwOgNU4PQCGtAkzbWO/G2Q1gFprHwh5+GOYyaw+vF5ICPTn4uDldckcnQeGEtwz9yBrHDdVVhaeJbH9Z+psgvVnfvBO09saF8lsojhALOOxsY9DC2TywN0EBlsjO6MlkaZR+bj8V1LDrRvt2TOQP400=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786568498; c=relaxed/simple;
	bh=E+jtXUNGY/xNjMqkh+Otp/Qz2aXbgP3t2p1qk3dtNbc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aKXeEoOeDVodOem7HsljULUNNVyoHmkCR0n/oHss2rhr/876IBcSM1UBMrs77pZUge7bq8pizFHSDUE9seIBCGXZoPl/o04sVUpIa+td0F7xPNsDb/dBYsKIl/TRZqtJKNvyBR0TWzBDNl0smlRR5WawuPhrhT9BwsmGxzQLROY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NJPoTDtZ; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NJPoTDtZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786568496; x=1818104496;
  h=date:from:to:cc:subject:message-id;
  bh=E+jtXUNGY/xNjMqkh+Otp/Qz2aXbgP3t2p1qk3dtNbc=;
  b=NJPoTDtZxOYdJgNJAm9Kcmkd06s0ABkVlcgSDTBsZA6JrX8P+tauz/Rg
   kxuACM3ZXPIYP5rXw3QH+UlNvOMvMLXEx2thiERJulCZstanTSUtxv/PF
   zW1mO6Aiu3UMuFHtd9fRLBAl4Dma2Db4wc+5Hy3mBXqHJAYmNzyslpSD/
   ooRruBQxMBpzwqwwaLiHpZqaPw3zvnsv9wrBZTSWrnPFchknI9V4xPP2w
   i3ddhbmb0Sy05FmaHp/YbE0xavBXvzN8/N5Zlg4amV3WteuUXQyfjKcAo
   aAaNaIWotYzH/yvPBwCAf8jGjbL1na//AWSt8dNMShSojJuJ0opgjn+/Q
   g==;
X-CSE-ConnectionGUID: rwUGhW9kTbCjnR6VciWkeQ==
X-CSE-MsgGUID: XtbEHcOzSM+6Cfr0Z+6ogg==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="87062356"
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="87062356"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 14:01:36 -0700
X-CSE-ConnectionGUID: eF6oEoNYSYeUBz87ugkUag==
X-CSE-MsgGUID: Y7f6SJ/iTMSQQmk7+Z1Bnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="263283792"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 12 Aug 2026 14:01:35 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuG4q-00000000RhU-18gA;
	Wed, 12 Aug 2026 21:01:32 +0000
Date: Thu, 13 Aug 2026 05:00:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: lib/maple_tree.c:3072:30-31: WARNING opportunity for min()
Message-ID: <202608130455.LfNXYpC6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Liam R. Howlett" <Liam.Howlett@oracle.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f5bbbfec59b4e2fb7520a91de3df8a6174325d6a
commit: a9c6716e088a1d4badd4fa6797469506bb99ec8b maple_tree: start using maple copy node for destination
date:   4 months ago
:::::: branch date: 31 hours ago
:::::: commit date: 4 months ago
config: nios2-randconfig-r063-20260812 (https://download.01.org/0day-ci/archive/20260813/202608130455.LfNXYpC6-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 9.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: a9c6716e088a ("maple_tree: start using maple copy node for destination")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202608130455.LfNXYpC6-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> lib/maple_tree.c:3072:30-31: WARNING opportunity for min()

vim +3072 lib/maple_tree.c

6953038cab845f Liam R. Howlett 2026-01-30  3037  
9ec1e972c3de31 Liam R. Howlett 2026-01-30  3038  static inline
a9c6716e088a1d Liam R. Howlett 2026-01-30  3039  void cp_data_write(struct maple_copy *cp, struct ma_state *mas)
9ec1e972c3de31 Liam R. Howlett 2026-01-30  3040  {
a9c6716e088a1d Liam R. Howlett 2026-01-30  3041  	struct maple_node *dst, *src;
a9c6716e088a1d Liam R. Howlett 2026-01-30  3042  	unsigned char s, d;
a9c6716e088a1d Liam R. Howlett 2026-01-30  3043  	unsigned char dst_offset;
a9c6716e088a1d Liam R. Howlett 2026-01-30  3044  	unsigned char data_offset;
9ec1e972c3de31 Liam R. Howlett 2026-01-30  3045  	unsigned char src_end, s_offset;
a9c6716e088a1d Liam R. Howlett 2026-01-30  3046  	unsigned char split;
a9c6716e088a1d Liam R. Howlett 2026-01-30  3047  	unsigned long s_max, d_max;
a9c6716e088a1d Liam R. Howlett 2026-01-30  3048  	unsigned char dst_size;
a9c6716e088a1d Liam R. Howlett 2026-01-30  3049  	enum maple_type s_mt, d_mt;
a9c6716e088a1d Liam R. Howlett 2026-01-30  3050  
a9c6716e088a1d Liam R. Howlett 2026-01-30  3051  	data_offset = 0;
a9c6716e088a1d Liam R. Howlett 2026-01-30  3052  	s = d = 0;
a9c6716e088a1d Liam R. Howlett 2026-01-30  3053  	/* Readability help */
a9c6716e088a1d Liam R. Howlett 2026-01-30  3054  	src = cp->src[s].node;
a9c6716e088a1d Liam R. Howlett 2026-01-30  3055  	dst = cp->dst[d].node;
a9c6716e088a1d Liam R. Howlett 2026-01-30  3056  	s_offset = cp->src[s].start;
a9c6716e088a1d Liam R. Howlett 2026-01-30  3057  	src_end = cp->src[s].end;
a9c6716e088a1d Liam R. Howlett 2026-01-30  3058  	split = cp->split;
a9c6716e088a1d Liam R. Howlett 2026-01-30  3059  	s_max = cp->src[s].max;
a9c6716e088a1d Liam R. Howlett 2026-01-30  3060  	s_mt = cp->src[s].mt;
a9c6716e088a1d Liam R. Howlett 2026-01-30  3061  	d_mt = cp->dst[d].mt;
9ec1e972c3de31 Liam R. Howlett 2026-01-30  3062  	do {
a9c6716e088a1d Liam R. Howlett 2026-01-30  3063  		dst_offset = 0;
a9c6716e088a1d Liam R. Howlett 2026-01-30  3064  		d_max = 0;
a9c6716e088a1d Liam R. Howlett 2026-01-30  3065  		dst = cp->dst[d].node;
a9c6716e088a1d Liam R. Howlett 2026-01-30  3066  		d_mt = cp->dst[d].mt;
a9c6716e088a1d Liam R. Howlett 2026-01-30  3067  		dst_size = split + 1;
a9c6716e088a1d Liam R. Howlett 2026-01-30  3068  
a9c6716e088a1d Liam R. Howlett 2026-01-30  3069  		while (dst_size) {
9ec1e972c3de31 Liam R. Howlett 2026-01-30  3070  			unsigned char size;
9ec1e972c3de31 Liam R. Howlett 2026-01-30  3071  
a9c6716e088a1d Liam R. Howlett 2026-01-30 @3072  			if (src_end - s_offset + 1 < dst_size)
a9c6716e088a1d Liam R. Howlett 2026-01-30  3073  				size = src_end - s_offset + 1;
a9c6716e088a1d Liam R. Howlett 2026-01-30  3074  			else
a9c6716e088a1d Liam R. Howlett 2026-01-30  3075  				size = dst_size;
a9c6716e088a1d Liam R. Howlett 2026-01-30  3076  
a9c6716e088a1d Liam R. Howlett 2026-01-30  3077  			d_max = node_copy(mas, src, s_offset, size, s_max, s_mt,
a9c6716e088a1d Liam R. Howlett 2026-01-30  3078  					  dst, dst_offset, d_mt);
a9c6716e088a1d Liam R. Howlett 2026-01-30  3079  
a9c6716e088a1d Liam R. Howlett 2026-01-30  3080  			dst_offset += size;
a9c6716e088a1d Liam R. Howlett 2026-01-30  3081  			s_offset += size;
a9c6716e088a1d Liam R. Howlett 2026-01-30  3082  			if (s_offset > src_end) {
a9c6716e088a1d Liam R. Howlett 2026-01-30  3083  				/* This source is exhausted */
a9c6716e088a1d Liam R. Howlett 2026-01-30  3084  				s++;
a9c6716e088a1d Liam R. Howlett 2026-01-30  3085  				if (s >= cp->s_count) {
a9c6716e088a1d Liam R. Howlett 2026-01-30  3086  					cp->dst[d].max = d_max;
a9c6716e088a1d Liam R. Howlett 2026-01-30  3087  					node_finalise(dst, d_mt, dst_offset);
a9c6716e088a1d Liam R. Howlett 2026-01-30  3088  					return;
a9c6716e088a1d Liam R. Howlett 2026-01-30  3089  				}
a9c6716e088a1d Liam R. Howlett 2026-01-30  3090  				/* Reset local src */
9ec1e972c3de31 Liam R. Howlett 2026-01-30  3091  				src = cp->src[s].node;
9ec1e972c3de31 Liam R. Howlett 2026-01-30  3092  				s_offset = cp->src[s].start;
9ec1e972c3de31 Liam R. Howlett 2026-01-30  3093  				src_end = cp->src[s].end;
a9c6716e088a1d Liam R. Howlett 2026-01-30  3094  				s_max = cp->src[s].max;
a9c6716e088a1d Liam R. Howlett 2026-01-30  3095  				s_mt = cp->src[s].mt;
a9c6716e088a1d Liam R. Howlett 2026-01-30  3096  			}
a9c6716e088a1d Liam R. Howlett 2026-01-30  3097  
a9c6716e088a1d Liam R. Howlett 2026-01-30  3098  			dst_size -= size;
a9c6716e088a1d Liam R. Howlett 2026-01-30  3099  			data_offset += size;
a9c6716e088a1d Liam R. Howlett 2026-01-30  3100  		}
a9c6716e088a1d Liam R. Howlett 2026-01-30  3101  
a9c6716e088a1d Liam R. Howlett 2026-01-30  3102  		split = cp->split;
a9c6716e088a1d Liam R. Howlett 2026-01-30  3103  		cp->dst[d].max = d_max;
a9c6716e088a1d Liam R. Howlett 2026-01-30  3104  		/* Handle null entries */
a9c6716e088a1d Liam R. Howlett 2026-01-30  3105  		if (cp->dst[d].max != ULONG_MAX &&
a9c6716e088a1d Liam R. Howlett 2026-01-30  3106  		    !ma_slots(dst, d_mt)[dst_offset - 1]) {
a9c6716e088a1d Liam R. Howlett 2026-01-30  3107  			if (s_offset == cp->src[s].start) {
a9c6716e088a1d Liam R. Howlett 2026-01-30  3108  				s--;
a9c6716e088a1d Liam R. Howlett 2026-01-30  3109  				src = cp->src[s].node;
a9c6716e088a1d Liam R. Howlett 2026-01-30  3110  				src_end = cp->src[s].end;
a9c6716e088a1d Liam R. Howlett 2026-01-30  3111  				s_max = cp->src[s].max;
a9c6716e088a1d Liam R. Howlett 2026-01-30  3112  				s_mt = cp->src[s].mt;
a9c6716e088a1d Liam R. Howlett 2026-01-30  3113  				s_offset = src_end;
a9c6716e088a1d Liam R. Howlett 2026-01-30  3114  			} else {
a9c6716e088a1d Liam R. Howlett 2026-01-30  3115  				s_offset--;
a9c6716e088a1d Liam R. Howlett 2026-01-30  3116  			}
a9c6716e088a1d Liam R. Howlett 2026-01-30  3117  			/* Set dst max and clear pivot */
a9c6716e088a1d Liam R. Howlett 2026-01-30  3118  			split++;
a9c6716e088a1d Liam R. Howlett 2026-01-30  3119  			data_offset--;
a9c6716e088a1d Liam R. Howlett 2026-01-30  3120  			dst_offset--;
a9c6716e088a1d Liam R. Howlett 2026-01-30  3121  			cp->dst[d].max = ma_pivots(dst, d_mt)[dst_offset - 1];
a9c6716e088a1d Liam R. Howlett 2026-01-30  3122  		}
a9c6716e088a1d Liam R. Howlett 2026-01-30  3123  
a9c6716e088a1d Liam R. Howlett 2026-01-30  3124  		node_finalise(dst, d_mt, dst_offset);
a9c6716e088a1d Liam R. Howlett 2026-01-30  3125  		++d; /* Next destination */
a9c6716e088a1d Liam R. Howlett 2026-01-30  3126  		if (d == cp->d_count - 1)
a9c6716e088a1d Liam R. Howlett 2026-01-30  3127  			split = cp->data - data_offset;
a9c6716e088a1d Liam R. Howlett 2026-01-30  3128  
a9c6716e088a1d Liam R. Howlett 2026-01-30  3129  		if (d >= cp->d_count) {
a9c6716e088a1d Liam R. Howlett 2026-01-30  3130  			WARN_ON(data_offset < cp->data);
a9c6716e088a1d Liam R. Howlett 2026-01-30  3131  			return;
a9c6716e088a1d Liam R. Howlett 2026-01-30  3132  		}
a9c6716e088a1d Liam R. Howlett 2026-01-30  3133  
a9c6716e088a1d Liam R. Howlett 2026-01-30  3134  	} while (data_offset <= cp->data);
a9c6716e088a1d Liam R. Howlett 2026-01-30  3135  }
a9c6716e088a1d Liam R. Howlett 2026-01-30  3136  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
