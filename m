Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E92841DFD8B
	for <oe-kbuild@lists.linux.dev>; Thu, 22 Jan 2026 07:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769065914; cv=none; b=LeqGLSYHWn4OJ24kaV3A6RGWKScC8i2Grs+Zj4P2zGGdmYpbl+79ywDAPgQZHZvUkuV+Qj1AxeG7U5dpPyLhlOTZRrhAL5Io1t3WFDVQZarsVwm707vQayqrF1wZQu8JkxrDQPzzu72JTs3/Ai4UldAjJcFk1strWYEqv1ti1Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769065914; c=relaxed/simple;
	bh=FgSR4ZGAVU6U8AF/LQYc9URNPtsKAfwO15s0rS4EKoM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IPZ2I7oeQNHi7sMVsL4NjlDh8v/sScPAM4LGecJpL/aaGDcTXz3FKxlUl3uWlNIuL+jPs6z5gmTVbsr7PAaY1sUQhDJfUtKi2QEyQ16HogOjAXHIHsKnPQP/WMgAvQE7L4rRLAIDaWE2wzwH0JGOxNVDkewrW+Y7sleOBU66LeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dKBbe838; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dKBbe838"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769065906; x=1800601906;
  h=date:from:to:cc:subject:message-id;
  bh=FgSR4ZGAVU6U8AF/LQYc9URNPtsKAfwO15s0rS4EKoM=;
  b=dKBbe838TYk85iqbOG0pnJuDxv1UvizY0A9ARiTn8btRiBnHFOXMOZFr
   6GVLGXHsMYC9T4erQelqB4/gE6SIVMBVid8qaF4L41E1siWiubkwDelJ+
   jbjDB7iHS2WUg+9YPXR8hoo5q6eDDO2LOhWqeT5WjrYn0iH7BTwjKSmoZ
   2N952H1/MpcCOEAHRJEwFjyfKFp5f90fnFGC/anrnbTXjScwYmh8wA8dM
   ILk2RFbRE600BqF4dIoWRGE+y50ntQhmeHI5hnfqjqGmMqAKqB5ruz5zS
   04XmV34NHSYsAU5512zaBjCzwHAE9CdbFnnwe0pQNGtPy0u9DoBN0zZ2n
   w==;
X-CSE-ConnectionGUID: i5a1Am3CQ5iW1EZPHclMYg==
X-CSE-MsgGUID: equhLlf6SA671JcZ9H4baQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="70468280"
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; 
   d="scan'208";a="70468280"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 23:11:43 -0800
X-CSE-ConnectionGUID: LNAe/l//TUm+nIt9K+nqvQ==
X-CSE-MsgGUID: 93zuSAfzSn6LTWjJfhaHow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; 
   d="scan'208";a="211108111"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 21 Jan 2026 23:11:42 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vioqx-00000000SXh-3Vzo;
	Thu, 22 Jan 2026 07:11:39 +0000
Date: Thu, 22 Jan 2026 15:11:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [akpm-mm:mm-new 298/310] lib/maple_tree.c:3065:30-31:
 WARNING opportunity for min()
Message-ID: <202601221523.Igh9Bi6S-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: David Hildenbrand <david@kernel.org>
TO: "Liam R. Howlett" <Liam.Howlett@oracle.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   dc4fe40a11269aead253fa0beb098b00417b8694
commit: a67dbdcf06cf473352c3752565633ec4f175d53e [298/310] maple_tree: start using maple copy node for destination
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: nios2-randconfig-r063-20260122 (https://download.01.org/0day-ci/archive/20260122/202601221523.Igh9Bi6S-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202601221523.Igh9Bi6S-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> lib/maple_tree.c:3065:30-31: WARNING opportunity for min()

vim +3065 lib/maple_tree.c

216ab37d828a10f Liam R. Howlett 2026-01-21  3030  
c93becaa5be466e Liam R. Howlett 2026-01-21  3031  static inline
a67dbdcf06cf473 Liam R. Howlett 2026-01-21  3032  void cp_data_write(struct maple_copy *cp, struct ma_state *mas)
c93becaa5be466e Liam R. Howlett 2026-01-21  3033  {
a67dbdcf06cf473 Liam R. Howlett 2026-01-21  3034  	struct maple_node *dst, *src;
a67dbdcf06cf473 Liam R. Howlett 2026-01-21  3035  	unsigned char s, d;
a67dbdcf06cf473 Liam R. Howlett 2026-01-21  3036  	unsigned char dst_offset;
a67dbdcf06cf473 Liam R. Howlett 2026-01-21  3037  	unsigned char data_offset;
c93becaa5be466e Liam R. Howlett 2026-01-21  3038  	unsigned char src_end, s_offset;
a67dbdcf06cf473 Liam R. Howlett 2026-01-21  3039  	unsigned char split;
a67dbdcf06cf473 Liam R. Howlett 2026-01-21  3040  	unsigned long s_max, d_max;
a67dbdcf06cf473 Liam R. Howlett 2026-01-21  3041  	unsigned char dst_size;
a67dbdcf06cf473 Liam R. Howlett 2026-01-21  3042  	enum maple_type s_mt, d_mt;
a67dbdcf06cf473 Liam R. Howlett 2026-01-21  3043  
a67dbdcf06cf473 Liam R. Howlett 2026-01-21  3044  	data_offset = 0;
a67dbdcf06cf473 Liam R. Howlett 2026-01-21  3045  	s = d = 0;
a67dbdcf06cf473 Liam R. Howlett 2026-01-21  3046  	/* Readability help */
a67dbdcf06cf473 Liam R. Howlett 2026-01-21  3047  	src = cp->src[s].node;
a67dbdcf06cf473 Liam R. Howlett 2026-01-21  3048  	dst = cp->dst[d].node;
a67dbdcf06cf473 Liam R. Howlett 2026-01-21  3049  	s_offset = cp->src[s].start;
a67dbdcf06cf473 Liam R. Howlett 2026-01-21  3050  	src_end = cp->src[s].end;
a67dbdcf06cf473 Liam R. Howlett 2026-01-21  3051  	split = cp->split;
a67dbdcf06cf473 Liam R. Howlett 2026-01-21  3052  	s_max = cp->src[s].max;
a67dbdcf06cf473 Liam R. Howlett 2026-01-21  3053  	s_mt = cp->src[s].mt;
a67dbdcf06cf473 Liam R. Howlett 2026-01-21  3054  	d_mt = cp->dst[d].mt;
c93becaa5be466e Liam R. Howlett 2026-01-21  3055  	do {
a67dbdcf06cf473 Liam R. Howlett 2026-01-21  3056  		dst_offset = 0;
a67dbdcf06cf473 Liam R. Howlett 2026-01-21  3057  		d_max = 0;
a67dbdcf06cf473 Liam R. Howlett 2026-01-21  3058  		dst = cp->dst[d].node;
a67dbdcf06cf473 Liam R. Howlett 2026-01-21  3059  		d_mt = cp->dst[d].mt;
a67dbdcf06cf473 Liam R. Howlett 2026-01-21  3060  		dst_size = split + 1;
a67dbdcf06cf473 Liam R. Howlett 2026-01-21  3061  
a67dbdcf06cf473 Liam R. Howlett 2026-01-21  3062  		while (dst_size) {
c93becaa5be466e Liam R. Howlett 2026-01-21  3063  			unsigned char size;
c93becaa5be466e Liam R. Howlett 2026-01-21  3064  
a67dbdcf06cf473 Liam R. Howlett 2026-01-21 @3065  			if (src_end - s_offset + 1 < dst_size)
a67dbdcf06cf473 Liam R. Howlett 2026-01-21  3066  				size = src_end - s_offset + 1;
a67dbdcf06cf473 Liam R. Howlett 2026-01-21  3067  			else
a67dbdcf06cf473 Liam R. Howlett 2026-01-21  3068  				size = dst_size;
a67dbdcf06cf473 Liam R. Howlett 2026-01-21  3069  
a67dbdcf06cf473 Liam R. Howlett 2026-01-21  3070  			d_max = node_copy(mas, src, s_offset, size, s_max, s_mt,
a67dbdcf06cf473 Liam R. Howlett 2026-01-21  3071  					  dst, dst_offset, d_mt);
a67dbdcf06cf473 Liam R. Howlett 2026-01-21  3072  
a67dbdcf06cf473 Liam R. Howlett 2026-01-21  3073  			dst_offset += size;
a67dbdcf06cf473 Liam R. Howlett 2026-01-21  3074  			s_offset += size;
a67dbdcf06cf473 Liam R. Howlett 2026-01-21  3075  			if (s_offset > src_end) {
a67dbdcf06cf473 Liam R. Howlett 2026-01-21  3076  				/* This source is exhausted */
a67dbdcf06cf473 Liam R. Howlett 2026-01-21  3077  				s++;
a67dbdcf06cf473 Liam R. Howlett 2026-01-21  3078  				if (s >= cp->s_count) {
a67dbdcf06cf473 Liam R. Howlett 2026-01-21  3079  					cp->dst[d].max = d_max;
a67dbdcf06cf473 Liam R. Howlett 2026-01-21  3080  					node_finalise(dst, d_mt, dst_offset);
a67dbdcf06cf473 Liam R. Howlett 2026-01-21  3081  					return;
a67dbdcf06cf473 Liam R. Howlett 2026-01-21  3082  				}
a67dbdcf06cf473 Liam R. Howlett 2026-01-21  3083  				/* Reset local src */
c93becaa5be466e Liam R. Howlett 2026-01-21  3084  				src = cp->src[s].node;
c93becaa5be466e Liam R. Howlett 2026-01-21  3085  				s_offset = cp->src[s].start;
c93becaa5be466e Liam R. Howlett 2026-01-21  3086  				src_end = cp->src[s].end;
a67dbdcf06cf473 Liam R. Howlett 2026-01-21  3087  				s_max = cp->src[s].max;
a67dbdcf06cf473 Liam R. Howlett 2026-01-21  3088  				s_mt = cp->src[s].mt;
a67dbdcf06cf473 Liam R. Howlett 2026-01-21  3089  			}
a67dbdcf06cf473 Liam R. Howlett 2026-01-21  3090  
a67dbdcf06cf473 Liam R. Howlett 2026-01-21  3091  			dst_size -= size;
a67dbdcf06cf473 Liam R. Howlett 2026-01-21  3092  			data_offset += size;
a67dbdcf06cf473 Liam R. Howlett 2026-01-21  3093  		}
a67dbdcf06cf473 Liam R. Howlett 2026-01-21  3094  
a67dbdcf06cf473 Liam R. Howlett 2026-01-21  3095  		split = cp->split;
a67dbdcf06cf473 Liam R. Howlett 2026-01-21  3096  		cp->dst[d].max = d_max;
a67dbdcf06cf473 Liam R. Howlett 2026-01-21  3097  		/* Handle null entries */
a67dbdcf06cf473 Liam R. Howlett 2026-01-21  3098  		if (cp->dst[d].max != ULONG_MAX &&
a67dbdcf06cf473 Liam R. Howlett 2026-01-21  3099  		    !ma_slots(dst, d_mt)[dst_offset - 1]) {
a67dbdcf06cf473 Liam R. Howlett 2026-01-21  3100  			if (s_offset == cp->src[s].start) {
a67dbdcf06cf473 Liam R. Howlett 2026-01-21  3101  				s--;
a67dbdcf06cf473 Liam R. Howlett 2026-01-21  3102  				src = cp->src[s].node;
a67dbdcf06cf473 Liam R. Howlett 2026-01-21  3103  				src_end = cp->src[s].end;
a67dbdcf06cf473 Liam R. Howlett 2026-01-21  3104  				s_max = cp->src[s].max;
a67dbdcf06cf473 Liam R. Howlett 2026-01-21  3105  				s_mt = cp->src[s].mt;
a67dbdcf06cf473 Liam R. Howlett 2026-01-21  3106  				s_offset = src_end;
a67dbdcf06cf473 Liam R. Howlett 2026-01-21  3107  			} else {
a67dbdcf06cf473 Liam R. Howlett 2026-01-21  3108  				s_offset--;
a67dbdcf06cf473 Liam R. Howlett 2026-01-21  3109  			}
a67dbdcf06cf473 Liam R. Howlett 2026-01-21  3110  			/* Set dst max and clear pivot */
a67dbdcf06cf473 Liam R. Howlett 2026-01-21  3111  			split++;
a67dbdcf06cf473 Liam R. Howlett 2026-01-21  3112  			data_offset--;
a67dbdcf06cf473 Liam R. Howlett 2026-01-21  3113  			dst_offset--;
a67dbdcf06cf473 Liam R. Howlett 2026-01-21  3114  			cp->dst[d].max = ma_pivots(dst, d_mt)[dst_offset - 1];
a67dbdcf06cf473 Liam R. Howlett 2026-01-21  3115  		}
a67dbdcf06cf473 Liam R. Howlett 2026-01-21  3116  
a67dbdcf06cf473 Liam R. Howlett 2026-01-21  3117  		node_finalise(dst, d_mt, dst_offset);
a67dbdcf06cf473 Liam R. Howlett 2026-01-21  3118  		++d; /* Next destination */
a67dbdcf06cf473 Liam R. Howlett 2026-01-21  3119  		if (d == cp->d_count - 1)
a67dbdcf06cf473 Liam R. Howlett 2026-01-21  3120  			split = cp->data - data_offset;
a67dbdcf06cf473 Liam R. Howlett 2026-01-21  3121  
a67dbdcf06cf473 Liam R. Howlett 2026-01-21  3122  		if (d >= cp->d_count) {
a67dbdcf06cf473 Liam R. Howlett 2026-01-21  3123  			WARN_ON(data_offset < cp->data);
a67dbdcf06cf473 Liam R. Howlett 2026-01-21  3124  			return;
a67dbdcf06cf473 Liam R. Howlett 2026-01-21  3125  		}
a67dbdcf06cf473 Liam R. Howlett 2026-01-21  3126  
a67dbdcf06cf473 Liam R. Howlett 2026-01-21  3127  	} while (data_offset <= cp->data);
a67dbdcf06cf473 Liam R. Howlett 2026-01-21  3128  }
a67dbdcf06cf473 Liam R. Howlett 2026-01-21  3129  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
