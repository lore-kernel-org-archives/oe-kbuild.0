Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795837815;
	b=UZa51E972I9QgkPqNacEBuBmWDx5Atv/0SBkrqGI5fykigBUqunttzvPMLcDaY4S5Zwd
	 LBm+eWVYBLsZf8cTJ8O6wClf6q7+LNBmaSfxzNBIU1YzTiM6zjHiC+WwiDwZ6+36lx/XI
	 ohn+2QwXZYOZEuZ2n1GwgDsUE+GbdreLzvNpVBCNi+7jtiFXUNu71mLb5gtDGXY94R58h
	 krwwqIv404YRRVGsqHrzn3R1Xxk/Ld2n2kiFDBKmY+qYR4ijGcpF0AdcIvRkaUuMHsrw4
	 pStjP5fhSk6dgQA9F2bN89WTM0SqZkDVWEQEBhPRusFSnFTKT2K2WZz5/nkGgVDBnxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795837815;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=j3ddU3q0vYGT0e7NJcv+G6cVeinC/UFM8TnDMF4+Ajc=;
	b=Li8A5qXu9oqmm3Sbaoi5mWymiWCiEl51hvq5/tUahopWZJ4T5e56uDf/2oW39qzTI6X1
	 9l3YgCTqmv8isa71mYIDzqf72a8YqVYJGWbdiYgGdeoXiVo2q+AeiKrgbN6ogqYVB4wB5
	 3wLlve2gFzaJm8P3nBD1vYymUiE7MI3y7dntNeCk5aRmUIqBAJULfcWMTI/Im9TetNBwM
	 t9p+xhj6REzSVcb6EhfGnkehIP4AZv2Y7yoxcaYyp3qyxesnLTCdZEQfWfv+HZOHXx+Kp
	 Qb92AzxJsf0kLpA3oWkzMd/FkOsoZRi96rMdldkWa7GJ3e+giaLV3ZNKBMheh9GIKoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dN50r8fb;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06EF606A31F
	for <oe-kbuild@lists.linux.dev>; Sat, 28 Nov 2026 03:50:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C06EF606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dN50r8fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795837815; x=1827373815;
  h=date:from:to:cc:subject:message-id;
  bh=9vpogRg9JV/NSX2J3LxV/YZ2F572fbNi8bCqbP+i4BM=;
  b=dN50r8fbC7IGkF5nEltUEb1EUnO+u1GEcFVXA5Ik05lEludLpcSTUxoe
   buPLuTAaMjxkf2qn2x9chWw4Kpl+YCU1GrY6lUP/gDsnVBSw4NJedw916
   bCpZj6o4FSx0eJsH5Vt+6HStFrrfvNk8xl8qFkC73C5MI0sM6CwS8UvyH
   QHsvno8Gt6ln460laJptuT5DmM4FCEeQVzNT3Mnn4lSJ9RjNVc4rI2fEb
   iLrtUwSjyISlijDEiTIcQXoJB6nVbkgUdTnM2zuXS8dETuCWZYns6GK3E
   hxY1FiBeDS52n71jd7gW7M1on6ZM61Iy4nFhcQU9dtoQ0h/SytD52iHaN
   Q==;
X-CSE-ConnectionGUID: TYjh+u8GRmmWhbjY6PX2wg==
X-CSE-MsgGUID: xPyqkdvBQim5QTfKsOXCsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4706901"
X-IronPort-AV: E=Sophos;i="6.27,238,1787036400"; 
   d="scan'208";a="4706901"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 19:50:14 -0800
X-CSE-ConnectionGUID: Xtx28prmSryHztqAxSuuzw==
X-CSE-MsgGUID: /fTG/InkTOyxil9UboXm2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,238,1787036400"; 
   d="scan'208";a="12865365"
Received: from igk-lkp-server01.igk.intel.com (HELO 146cf1e082f1) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 27 Nov 2026 19:50:13 -0800
Received: from kbuild by 146cf1e082f1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xX9Ry-000000000VS-3yOo;
	Sat, 28 Nov 2026 03:50:10 +0000
Date: Sat, 28 Nov 2026 04:49:16 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: lib/maple_tree.c:3072:30-31: WARNING opportunity for min()
Message-ID: <20261128044011.OCoUupLT-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Liam R. Howlett" <Liam.Howlett@oracle.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c639ac6b9cf100b860408a3cf8d7eab268866cd7
commit: a9c6716e088a1d4badd4fa6797469506bb99ec8b maple_tree: start using maple copy node for destination
date:   8 months ago
:::::: branch date: 67 minutes ago
:::::: commit date: 8 months ago
config: arm64-randconfig-r2100-20261126 (https://download.01.org/0day-ci/archive/20261128/20261128044011.OCoUupLT-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project a2bea097c8bf336f31f45e88e96f20d88e37ff5a)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: a9c6716e088a ("maple_tree: start using maple copy node for destination")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/20261128044011.OCoUupLT-lkp@intel.com/

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
