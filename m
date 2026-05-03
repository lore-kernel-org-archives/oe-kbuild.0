Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26FF31986C
	for <oe-kbuild@lists.linux.dev>; Sun,  3 May 2026 15:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777822980; cv=none; b=FBj37fGRxquREBO8+YrNMv/x0GsqxX7kjq6bwgVxLTxkf/URdrdBN+qvQeJF/eILJu1Y7rXxvHRf5boASiAHBruoC3tB8y+Tv4Z3XvknalWDN8I7IPtVMkeP+1oLKMk8eQUw0E/Lj1K/vkqf0IVyuvPvI0R7jVYekjwHSZTpEGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777822980; c=relaxed/simple;
	bh=zmXQsGYx0Fl0QjdKDOAe3hy1a7BDekvW/oBpZPqZ7Ig=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZDUHAM/ELM/hg932X0haVEPvgBwO8dortOQ7+27OVo9wOJgEkc/XMZgUP4HrJJzpqbsnPbMjCY+zmAu+oKaAZ/xHuwj3/5S7EhhBlaFimlG+j1Yqu0w5rDLjMyKDU+HzBfq4MRY4hNBGs5VZMHkM9k6IqMdCd57ufP1nx6liltg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OvFYtBoq; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OvFYtBoq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777822978; x=1809358978;
  h=date:from:to:cc:subject:message-id;
  bh=zmXQsGYx0Fl0QjdKDOAe3hy1a7BDekvW/oBpZPqZ7Ig=;
  b=OvFYtBoq7beRLH5R+ZrjJp42mYZ3wvVXYSX9qQgdHkwUF/A1OyYuLI4i
   /Yaw8EdF5Dfr67IYMiTaPiOgrMZB8TyrCrsvjA44qeQlyuPKsq8lu53wg
   HFQfEUqbJCp/C3JucOMmNilq6qUaEGnb2H2UqtFrO3WPcqY0nsRNII7GM
   7k1WU1soEPgq4jMfKcf36Y+wTALLXii8HGrZxWY1cCKjjpRDKcarZu5ir
   6ytaZ2EE2DSCRWvborTF3G3JIFBvN1dNFd2TipQwrS5bmG1po2ZPwnGNj
   jDpwWIXIZO8DgSVH3UFDIvjRZ+l+dkgVbFDDD131S4ZsLZPGLa0SSHWM6
   g==;
X-CSE-ConnectionGUID: QMEt4SAqQXGIDvGeiKmhFA==
X-CSE-MsgGUID: XEhvKeUiSz2ql7WMeibs7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="66234375"
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="66234375"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2026 08:42:57 -0700
X-CSE-ConnectionGUID: XAh1+JW/TvK49IaT/wR41A==
X-CSE-MsgGUID: vybz3cqGQNOKRNYXl/yLWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="235183799"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 03 May 2026 08:42:55 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJYy5-000000002h9-2zt4;
	Sun, 03 May 2026 15:42:53 +0000
Date: Sun, 03 May 2026 23:42:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: lib/maple_tree.c:3072:30-31: WARNING opportunity for min()
Message-ID: <202605032354.RGrpdshG-lkp@intel.com>
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
head:   66edb901bf874d9e0787326ba12d3548b2da8700
commit: a9c6716e088a1d4badd4fa6797469506bb99ec8b maple_tree: start using maple copy node for destination
date:   4 weeks ago
:::::: branch date: 20 hours ago
:::::: commit date: 4 weeks ago
config: x86_64-randconfig-r051-20260503 (https://download.01.org/0day-ci/archive/20260503/202605032354.RGrpdshG-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: a9c6716e088a ("maple_tree: start using maple copy node for destination")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202605032354.RGrpdshG-lkp@intel.com/

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
