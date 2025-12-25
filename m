Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 475972F872
	for <oe-kbuild@lists.linux.dev>; Thu, 25 Dec 2025 06:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766645991; cv=none; b=Pcf3UEx7sf/L3EYOK4aT/CnXM/acs3Ur15s0aJCMH0nHldVOZLYtci8IbQCkIoHJOQvvM3HpWbot0lg+aMX0hWj17JjlHfCnKQ2MkXWfpkcK7SNEE/aafjABhzXdnSsXp3QO4RgoJ/gtr5rXu5FFU9KjjcXtTRW/KkpGAZ273jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766645991; c=relaxed/simple;
	bh=8aiFq/vaWNpnVe/Dsa6qkG1ZnPKjBewYeX//oRjBg60=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XgT9sTPNLwsg8Cv9jNItLxYv/3xxaIMRJWCOhXDMY+nJ6jF6eOP7s2QSBKJxnOSSJ4GGn+6+LsHeItdI7kchx8XXY7H9575QkfFeDwmJ1RQ6xbguVTiqh0XgaI3GKQTUxVxhbiif1RaRs2bB0gujlRiOqhhlLRPd54vIHCBDaGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ae0OK4uh; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ae0OK4uh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766645990; x=1798181990;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8aiFq/vaWNpnVe/Dsa6qkG1ZnPKjBewYeX//oRjBg60=;
  b=ae0OK4uhPS69rUKJv8O62nGuvK91iGvW4ij8vK6MB0X7z0VtFyKvp7lP
   pTf6LdN3ZydXz2/vslXMZ7UBWRYaZcVMC5F9CaiYVQQ8dpYR+sMUSqcRu
   qN04Xgz3xiPR8cBW4OnL04GKEs/1t+9bRDoBcXstTGUpzaO0L8kCf3NH/
   a87T0oWbC3f0RAQ0bRaNrPOyd3Bu4X1+4CE2idY+rJFKafdr3RuS4NxZB
   MWRXHFqYVeEjQD+wXAF4Evy31viCFoV4TVvynOqrvx/38FYcVq6miTuW8
   YNhHydCgbTuAxgSSlheiPJQbaybyYEAXEPHC9+lr+EelTG11mFJDk4Xcl
   A==;
X-CSE-ConnectionGUID: wPnasWXhTlO703XcrS/I3w==
X-CSE-MsgGUID: hWgBV1qPRj6RbWrYRKhM2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="68505986"
X-IronPort-AV: E=Sophos;i="6.21,175,1763452800"; 
   d="scan'208";a="68505986"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2025 22:59:49 -0800
X-CSE-ConnectionGUID: 2J2bt3gESQyhWIWjx5v/UA==
X-CSE-MsgGUID: kNQdmhfaRN2d59s6en2Vhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,175,1763452800"; 
   d="scan'208";a="201075746"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 24 Dec 2025 22:59:48 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYfK5-000000003qv-1OjM;
	Thu, 25 Dec 2025 06:59:45 +0000
Date: Thu, 25 Dec 2025 14:58:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH RFC v2 1/2] fuse: add compound command to combine
 multiple requests
Message-ID: <202512251445.2TjxtZmH-lkp@intel.com>
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
In-Reply-To: <20251223-fuse-compounds-upstream-v2-1-0f7b4451c85e@ddn.com>
References: <20251223-fuse-compounds-upstream-v2-1-0f7b4451c85e@ddn.com>
TO: Horst Birthelmer <hbirthelmer@googlemail.com>

Hi Horst,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 9448598b22c50c8a5bb77a9103e2d49f134c9578]

url:    https://github.com/intel-lab-lkp/linux/commits/Horst-Birthelmer/fuse-add-compound-command-to-combine-multiple-requests/20251224-061921
base:   9448598b22c50c8a5bb77a9103e2d49f134c9578
patch link:    https://lore.kernel.org/r/20251223-fuse-compounds-upstream-v2-1-0f7b4451c85e%40ddn.com
patch subject: [PATCH RFC v2 1/2] fuse: add compound command to combine multiple requests
:::::: branch date: 33 hours ago
:::::: commit date: 33 hours ago
config: hexagon-randconfig-r073-20251225 (https://download.01.org/0day-ci/archive/20251225/202512251445.2TjxtZmH-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512251445.2TjxtZmH-lkp@intel.com/

smatch warnings:
fs/fuse/compound.c:79 fuse_compound_validate_header() warn: variable dereferenced before check 'compound' (see line 76)

vim +/compound +79 fs/fuse/compound.c

17b8291f4d636a9 Horst Birthelmer 2025-12-23   69  
17b8291f4d636a9 Horst Birthelmer 2025-12-23   70  static int fuse_compound_validate_header(struct fuse_compound_req *compound)
17b8291f4d636a9 Horst Birthelmer 2025-12-23   71  {
17b8291f4d636a9 Horst Birthelmer 2025-12-23   72  	struct fuse_compound_in *in_header = &compound->compound_header;
17b8291f4d636a9 Horst Birthelmer 2025-12-23   73  	size_t offset = 0;
17b8291f4d636a9 Horst Birthelmer 2025-12-23   74  	int i;
17b8291f4d636a9 Horst Birthelmer 2025-12-23   75  
17b8291f4d636a9 Horst Birthelmer 2025-12-23  @76  	if (compound->buffer_pos > compound->buffer_size)
17b8291f4d636a9 Horst Birthelmer 2025-12-23   77  		return -EINVAL;
17b8291f4d636a9 Horst Birthelmer 2025-12-23   78  
17b8291f4d636a9 Horst Birthelmer 2025-12-23  @79  	if (!compound || !compound->buffer)
17b8291f4d636a9 Horst Birthelmer 2025-12-23   80  		return -EINVAL;
17b8291f4d636a9 Horst Birthelmer 2025-12-23   81  
17b8291f4d636a9 Horst Birthelmer 2025-12-23   82  	if (compound->buffer_pos < sizeof(struct fuse_in_header))
17b8291f4d636a9 Horst Birthelmer 2025-12-23   83  		return -EINVAL;
17b8291f4d636a9 Horst Birthelmer 2025-12-23   84  
17b8291f4d636a9 Horst Birthelmer 2025-12-23   85  	if (in_header->count == 0 || in_header->count > FUSE_MAX_COMPOUND_OPS)
17b8291f4d636a9 Horst Birthelmer 2025-12-23   86  		return -EINVAL;
17b8291f4d636a9 Horst Birthelmer 2025-12-23   87  
17b8291f4d636a9 Horst Birthelmer 2025-12-23   88  	for (i = 0; i < in_header->count; i++) {
17b8291f4d636a9 Horst Birthelmer 2025-12-23   89  		const struct fuse_in_header *op_hdr;
17b8291f4d636a9 Horst Birthelmer 2025-12-23   90  
17b8291f4d636a9 Horst Birthelmer 2025-12-23   91  		if (offset + sizeof(struct fuse_in_header) >
17b8291f4d636a9 Horst Birthelmer 2025-12-23   92  		    compound->buffer_pos) {
17b8291f4d636a9 Horst Birthelmer 2025-12-23   93  			pr_info_ratelimited("FUSE: compound operation %d header extends beyond buffer (offset %zu + header size %zu > buffer pos %zu)\n",
17b8291f4d636a9 Horst Birthelmer 2025-12-23   94  					    i, offset,
17b8291f4d636a9 Horst Birthelmer 2025-12-23   95  					    sizeof(struct fuse_in_header),
17b8291f4d636a9 Horst Birthelmer 2025-12-23   96  					    compound->buffer_pos);
17b8291f4d636a9 Horst Birthelmer 2025-12-23   97  			return -EINVAL;
17b8291f4d636a9 Horst Birthelmer 2025-12-23   98  		}
17b8291f4d636a9 Horst Birthelmer 2025-12-23   99  
17b8291f4d636a9 Horst Birthelmer 2025-12-23  100  		op_hdr = (const struct fuse_in_header *)(compound->buffer +
17b8291f4d636a9 Horst Birthelmer 2025-12-23  101  							 offset);
17b8291f4d636a9 Horst Birthelmer 2025-12-23  102  
17b8291f4d636a9 Horst Birthelmer 2025-12-23  103  		if (op_hdr->len < sizeof(struct fuse_in_header)) {
17b8291f4d636a9 Horst Birthelmer 2025-12-23  104  			pr_info_ratelimited("FUSE: compound operation %d has invalid length %u (minimum %zu bytes)\n",
17b8291f4d636a9 Horst Birthelmer 2025-12-23  105  					    i, op_hdr->len,
17b8291f4d636a9 Horst Birthelmer 2025-12-23  106  					    sizeof(struct fuse_in_header));
17b8291f4d636a9 Horst Birthelmer 2025-12-23  107  			return -EINVAL;
17b8291f4d636a9 Horst Birthelmer 2025-12-23  108  		}
17b8291f4d636a9 Horst Birthelmer 2025-12-23  109  
17b8291f4d636a9 Horst Birthelmer 2025-12-23  110  		if (offset + op_hdr->len > compound->buffer_pos) {
17b8291f4d636a9 Horst Birthelmer 2025-12-23  111  			pr_info_ratelimited("FUSE: compound operation %d extends beyond buffer (offset %zu + length %u > buffer pos %zu)\n",
17b8291f4d636a9 Horst Birthelmer 2025-12-23  112  					    i, offset, op_hdr->len,
17b8291f4d636a9 Horst Birthelmer 2025-12-23  113  					    compound->buffer_pos);
17b8291f4d636a9 Horst Birthelmer 2025-12-23  114  			return -EINVAL;
17b8291f4d636a9 Horst Birthelmer 2025-12-23  115  		}
17b8291f4d636a9 Horst Birthelmer 2025-12-23  116  
17b8291f4d636a9 Horst Birthelmer 2025-12-23  117  		if (op_hdr->opcode == 0 || op_hdr->opcode == FUSE_COMPOUND) {
17b8291f4d636a9 Horst Birthelmer 2025-12-23  118  			pr_info_ratelimited("FUSE: compound operation %d has invalid opcode %u (cannot be 0 or FUSE_COMPOUND)\n",
17b8291f4d636a9 Horst Birthelmer 2025-12-23  119  					    i, op_hdr->opcode);
17b8291f4d636a9 Horst Birthelmer 2025-12-23  120  			return -EINVAL;
17b8291f4d636a9 Horst Birthelmer 2025-12-23  121  		}
17b8291f4d636a9 Horst Birthelmer 2025-12-23  122  
17b8291f4d636a9 Horst Birthelmer 2025-12-23  123  		if (op_hdr->nodeid == 0) {
17b8291f4d636a9 Horst Birthelmer 2025-12-23  124  			pr_info_ratelimited("FUSE: compound operation %d has invalid node ID 0\n",
17b8291f4d636a9 Horst Birthelmer 2025-12-23  125  					    i);
17b8291f4d636a9 Horst Birthelmer 2025-12-23  126  			return -EINVAL;
17b8291f4d636a9 Horst Birthelmer 2025-12-23  127  		}
17b8291f4d636a9 Horst Birthelmer 2025-12-23  128  
17b8291f4d636a9 Horst Birthelmer 2025-12-23  129  		offset += op_hdr->len;
17b8291f4d636a9 Horst Birthelmer 2025-12-23  130  	}
17b8291f4d636a9 Horst Birthelmer 2025-12-23  131  
17b8291f4d636a9 Horst Birthelmer 2025-12-23  132  	if (offset != compound->buffer_pos) {
17b8291f4d636a9 Horst Birthelmer 2025-12-23  133  		pr_info_ratelimited("FUSE: compound buffer size mismatch (calculated %zu bytes, actual %zu bytes)\n",
17b8291f4d636a9 Horst Birthelmer 2025-12-23  134  				    offset, compound->buffer_pos);
17b8291f4d636a9 Horst Birthelmer 2025-12-23  135  		return -EINVAL;
17b8291f4d636a9 Horst Birthelmer 2025-12-23  136  	}
17b8291f4d636a9 Horst Birthelmer 2025-12-23  137  
17b8291f4d636a9 Horst Birthelmer 2025-12-23  138  	return 0;
17b8291f4d636a9 Horst Birthelmer 2025-12-23  139  }
17b8291f4d636a9 Horst Birthelmer 2025-12-23  140  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
