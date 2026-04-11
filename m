Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB31B1D5151
	for <oe-kbuild@lists.linux.dev>; Sat, 11 Apr 2026 01:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775870874; cv=none; b=uCSvGkGJ+zMV1f9JI1z/EtU1LT9+kA3FE3IPxK4I6L8GtvbYe604cIJ9nBkxAOUIGlDljiN7q1ySLhOh+ie04VAeqqTlYw+WmqF2JHvBYS2M+UFW0TMkK124/THZBGXj7UqWlcl4EQR5ztGD84tLR/CZ4a6NyMauVzC9xYUJ5PE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775870874; c=relaxed/simple;
	bh=fBmVi1GGVxx+HPCt0yA/wyZd3tJZ+7PtFzJJ4X1LzGE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MGk0OVlnsaYME/9JdCe1nZ+xSWAyMV05I12ufO2iLkgoT6diuY+O39y1BWe83nU8D1AI0Xb51R0RdNGFVlaG0IA/6QOfjegkq2kCVr0AoQl0p7XxnD+lJ4j6ksbv3ySwqzk8bVLsEQBUIfJGfrJIL6umvk5mTnXMBMXzuFomKSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VnD+b4SK; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VnD+b4SK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775870873; x=1807406873;
  h=date:from:to:cc:subject:message-id;
  bh=fBmVi1GGVxx+HPCt0yA/wyZd3tJZ+7PtFzJJ4X1LzGE=;
  b=VnD+b4SKZtpIdiux+2PsQR6oPwAbBivuS2WnwkTa2xuWKj2/p0Frt2rh
   jZPGyOcjFhT0bbstzlOj6iEGTPUGVgyEtQgyWS9hAB/EtCYg7qoHR2+Jn
   CTV3bPLLUv94FuOnVzcuvnv3c4FH+V9wGC9IJhEILAiZeaURGY1bpMNbq
   vz7HTwa6cZz7FJ1guTn3gNhlPBqPECiZSLzQvgSuPvBeAWQnBUCiWh9/N
   WYBsyDQhynt3qgufTvpkkipt0woi3aLrjCgTMnF7tM34iVThOAd6CTVGE
   ZRsCDJ+ROwU281yS84A8+KZpNnQIz1arMMXsbRlS4fNbcaPvnPlGx3M42
   w==;
X-CSE-ConnectionGUID: sxkM5hZzSDebT4fjEq/RjA==
X-CSE-MsgGUID: XKylV9vVQHOeTLLTNByOsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="76913023"
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="76913023"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 18:27:52 -0700
X-CSE-ConnectionGUID: rJLMx2gTTwWmPsAAk7vR8Q==
X-CSE-MsgGUID: Iv/HDhjBTKesChZM5H5dng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="229514548"
Received: from lkp-server01.sh.intel.com (HELO 3eaaf1a74b89) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 10 Apr 2026 18:27:50 -0700
Received: from kbuild by 3eaaf1a74b89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBN8V-000000000Zr-3RKS;
	Sat, 11 Apr 2026 01:27:47 +0000
Date: Sat, 11 Apr 2026 09:27:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/um/drivers/vector_kern.c:471 destroy_queue() warn:
 variable dereferenced before check 'qi' (see line 468)
Message-ID: <202604110937.MLUL70Lx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Tiwei Bie <tiwei.btw@antgroup.com>
CC: Johannes Berg <johannes.berg@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7c6c4ed80b874f721bc7c2c937e098c56e37d2f0
commit: b555cb66583e99158cfef8e91c025252cefae55b um: vector: Eliminate the dependency on uml_net
date:   11 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 11 months ago
config: um-randconfig-r072-20260411 (https://download.01.org/0day-ci/archive/20260411/202604110937.MLUL70Lx-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project ae825cb8cea7f3ac8e5e4096f22713845cf5e501)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: b555cb66583e ("um: vector: Eliminate the dependency on uml_net")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202604110937.MLUL70Lx-lkp@intel.com/

smatch warnings:
arch/um/drivers/vector_kern.c:471 destroy_queue() warn: variable dereferenced before check 'qi' (see line 468)

vim +/qi +471 arch/um/drivers/vector_kern.c

49da7e64f33e80 Anton Ivanov 2017-11-20  459  
49da7e64f33e80 Anton Ivanov 2017-11-20  460  /* Queue destructor. Deliberately stateless so we can use
49da7e64f33e80 Anton Ivanov 2017-11-20  461   * it in queue cleanup if initialization fails.
49da7e64f33e80 Anton Ivanov 2017-11-20  462   */
49da7e64f33e80 Anton Ivanov 2017-11-20  463  
49da7e64f33e80 Anton Ivanov 2017-11-20  464  static void destroy_queue(struct vector_queue *qi)
49da7e64f33e80 Anton Ivanov 2017-11-20  465  {
49da7e64f33e80 Anton Ivanov 2017-11-20  466  	int i;
49da7e64f33e80 Anton Ivanov 2017-11-20  467  	struct iovec *iov;
49da7e64f33e80 Anton Ivanov 2017-11-20 @468  	struct vector_private *vp = netdev_priv(qi->dev);
49da7e64f33e80 Anton Ivanov 2017-11-20  469  	struct mmsghdr *mmsg_vector;
49da7e64f33e80 Anton Ivanov 2017-11-20  470  
49da7e64f33e80 Anton Ivanov 2017-11-20 @471  	if (qi == NULL)
49da7e64f33e80 Anton Ivanov 2017-11-20  472  		return;
49da7e64f33e80 Anton Ivanov 2017-11-20  473  	/* deallocate any skbuffs - we rely on any unused to be
49da7e64f33e80 Anton Ivanov 2017-11-20  474  	 * set to NULL.
49da7e64f33e80 Anton Ivanov 2017-11-20  475  	 */
49da7e64f33e80 Anton Ivanov 2017-11-20  476  	if (qi->skbuff_vector != NULL) {
49da7e64f33e80 Anton Ivanov 2017-11-20  477  		for (i = 0; i < qi->max_depth; i++) {
49da7e64f33e80 Anton Ivanov 2017-11-20  478  			if (*(qi->skbuff_vector + i) != NULL)
49da7e64f33e80 Anton Ivanov 2017-11-20  479  				dev_kfree_skb_any(*(qi->skbuff_vector + i));
49da7e64f33e80 Anton Ivanov 2017-11-20  480  		}
49da7e64f33e80 Anton Ivanov 2017-11-20  481  		kfree(qi->skbuff_vector);
49da7e64f33e80 Anton Ivanov 2017-11-20  482  	}
49da7e64f33e80 Anton Ivanov 2017-11-20  483  	/* deallocate matching IOV structures including header buffs */
49da7e64f33e80 Anton Ivanov 2017-11-20  484  	if (qi->mmsg_vector != NULL) {
49da7e64f33e80 Anton Ivanov 2017-11-20  485  		mmsg_vector = qi->mmsg_vector;
49da7e64f33e80 Anton Ivanov 2017-11-20  486  		for (i = 0; i < qi->max_depth; i++) {
49da7e64f33e80 Anton Ivanov 2017-11-20  487  			iov = mmsg_vector->msg_hdr.msg_iov;
49da7e64f33e80 Anton Ivanov 2017-11-20  488  			if (iov != NULL) {
49da7e64f33e80 Anton Ivanov 2017-11-20  489  				if ((vp->header_size > 0) &&
49da7e64f33e80 Anton Ivanov 2017-11-20  490  					(iov->iov_base != NULL))
49da7e64f33e80 Anton Ivanov 2017-11-20  491  					kfree(iov->iov_base);
49da7e64f33e80 Anton Ivanov 2017-11-20  492  				kfree(iov);
49da7e64f33e80 Anton Ivanov 2017-11-20  493  			}
49da7e64f33e80 Anton Ivanov 2017-11-20  494  			mmsg_vector++;
49da7e64f33e80 Anton Ivanov 2017-11-20  495  		}
49da7e64f33e80 Anton Ivanov 2017-11-20  496  		kfree(qi->mmsg_vector);
49da7e64f33e80 Anton Ivanov 2017-11-20  497  	}
49da7e64f33e80 Anton Ivanov 2017-11-20  498  	kfree(qi);
49da7e64f33e80 Anton Ivanov 2017-11-20  499  }
49da7e64f33e80 Anton Ivanov 2017-11-20  500  

:::::: The code at line 471 was first introduced by commit
:::::: 49da7e64f33e80edffb1a9eeb230fa4c3f42dffb High Performance UML Vector Network Driver

:::::: TO: Anton Ivanov <anton.ivanov@cambridgegreys.com>
:::::: CC: Richard Weinberger <richard@nod.at>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
