Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1542FCC01
	for <oe-kbuild@lists.linux.dev>; Thu, 20 Nov 2025 19:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763666892; cv=none; b=F1nauedPd1wlRNJi9+hAn2j27IIIazJnlAdpOAt4XE5gcPw6vWJzMK1V1hXYzG5l9BLYm3OUeukPhQlKhHhZ1shW2EOGsNMq6FEGX7LQwvTRnYzcx1KmBlG/ZaV3pUsjfM3px6NgfxWYe9fyUaj9Cyq1FsCA9NSbggpc+w0HCCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763666892; c=relaxed/simple;
	bh=Q5uuG7t2OMo/WJe7dBoh/z7H06cQVIzEJIipBjUWG5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Igj1Yf7afVqYDPSr7OS7BNluEwIvbzKIa4eJv9nDLupCWxSxxS4Uxbz0QZxpLAPo39y1eY+ctqEbfmSRPPAVNCC6F0TRkeMfH8574GK2doaxsZVAsJJ4yoLi3KHzomIfmmnUrNof49PHxcSNitvb4/Ukk+PCUPmbgcOrBSXuEeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O/gwQ/fF; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O/gwQ/fF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763666891; x=1795202891;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q5uuG7t2OMo/WJe7dBoh/z7H06cQVIzEJIipBjUWG5Y=;
  b=O/gwQ/fFVmq+S6TOd7gpLKukVjbx5a549iA8rK6fr5LB7Y1DjgGZvIHv
   myI+Aa03VUKCWJIMWkezePZV1zV49yeTCi7wAtcWgBpIyLVL8E9DA0FWh
   tA9T8RussZpVoGtepx9uxULOkb95ciD1e5P5G6w/2UGUtRxoovhgqMcYV
   UnlJjHLm8KL7Br7pzzxJpfHYn17oTeN6O7pAX9LXKVpneaax/8Gf7j5wF
   /LDhYWJ7gXYN4WwaArpsCy/7Laq4biuli7jA4zF6j/ZY7+gYDH4J7r8+A
   nko4ONz5bkc9EmGEYoAdvPgRnZf1yAGgwRRvUPKgw1WOK+/LreJ+4U79o
   A==;
X-CSE-ConnectionGUID: Zav3V5vgTWqDF0T9ATyI4g==
X-CSE-MsgGUID: gyqe+v9KRX6AZQkXVIFyPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="64942543"
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; 
   d="scan'208";a="64942543"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 11:28:10 -0800
X-CSE-ConnectionGUID: NSiVsn15TyeC7VoNgytK2Q==
X-CSE-MsgGUID: rT70kl1BRS+xgC+7aeEcQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; 
   d="scan'208";a="191705868"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 20 Nov 2025 11:28:09 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMAK6-0004VD-2d;
	Thu, 20 Nov 2025 19:28:06 +0000
Date: Fri, 21 Nov 2025 03:27:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 1/2] btrfs: fix data race on transaction->state
Message-ID: <202511210245.nasHPfsY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: fs/btrfs/volumes.c:7974:9: sparse: sparse: Trying to use reserved word 'void' as identifier"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <9db5125d171003458bcf98470f4044c5890fb789.1763481355.git.josef@toxicpanda.com>
References: <9db5125d171003458bcf98470f4044c5890fb789.1763481355.git.josef@toxicpanda.com>
TO: Josef Bacik <josef@toxicpanda.com>
TO: linux-btrfs@vger.kernel.org

Hi Josef,

kernel test robot noticed the following build warnings:

[auto build test WARNING on kdave/for-next]
[also build test WARNING on linus/master v6.18-rc6 next-20251120]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Josef-Bacik/btrfs-fix-data-race-on-transaction-state/20251119-000716
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux.git for-next
patch link:    https://lore.kernel.org/r/9db5125d171003458bcf98470f4044c5890fb789.1763481355.git.josef%40toxicpanda.com
patch subject: [PATCH 1/2] btrfs: fix data race on transaction->state
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: xtensa-randconfig-r134-20251120 (https://download.01.org/0day-ci/archive/20251121/202511210245.nasHPfsY-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251121/202511210245.nasHPfsY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511210245.nasHPfsY-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/btrfs/volumes.c:7884:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   fs/btrfs/volumes.c:7885:17: sparse: sparse: Expected ) in function declarator
   fs/btrfs/volumes.c:7885:17: sparse: sparse: got ,
   fs/btrfs/volumes.c:7885:17: sparse: sparse: Expected ; at the end of type declaration
   fs/btrfs/volumes.c:7885:17: sparse: sparse: got }
   fs/btrfs/volumes.c:7889:17: sparse: sparse: Trying to use reserved word 'goto' as identifier
   fs/btrfs/volumes.c:7889:22: sparse: sparse: Expected ; at end of declaration
   fs/btrfs/volumes.c:7889:22: sparse: sparse: got out
   fs/btrfs/volumes.c:7890:9: sparse: sparse: Expected ; at the end of type declaration
   fs/btrfs/volumes.c:7890:9: sparse: sparse: got }
   fs/btrfs/volumes.c:7893:13: sparse: sparse: Expected ) in function declarator
   fs/btrfs/volumes.c:7893:13: sparse: sparse: got (
   fs/btrfs/volumes.c:7893:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   fs/btrfs/volumes.c:7894:17: sparse: sparse: Expected ) in function declarator
   fs/btrfs/volumes.c:7894:17: sparse: sparse: got ,
   fs/btrfs/volumes.c:7894:17: sparse: sparse: Expected ; at the end of type declaration
   fs/btrfs/volumes.c:7894:17: sparse: sparse: got }
   fs/btrfs/volumes.c:7899:17: sparse: sparse: Trying to use reserved word 'goto' as identifier
   fs/btrfs/volumes.c:7899:22: sparse: sparse: Expected ; at end of declaration
   fs/btrfs/volumes.c:7899:22: sparse: sparse: got out
   fs/btrfs/volumes.c:7900:9: sparse: sparse: Expected ; at the end of type declaration
   fs/btrfs/volumes.c:7900:9: sparse: sparse: got }
   fs/btrfs/volumes.c:7908:17: sparse: sparse: Expected ) in function declarator
   fs/btrfs/volumes.c:7908:17: sparse: sparse: got ,
   fs/btrfs/volumes.c:7908:17: sparse: sparse: Expected ; at the end of type declaration
   fs/btrfs/volumes.c:7908:17: sparse: sparse: got }
   fs/btrfs/volumes.c:7912:16: sparse: sparse: Expected ) in function declarator
   fs/btrfs/volumes.c:7912:16: sparse: sparse: got =
   fs/btrfs/volumes.c:7912:9: sparse: sparse: Trying to use reserved word 'for' as identifier
   fs/btrfs/volumes.c:7912:23: sparse: sparse: Expected ; at end of declaration
   fs/btrfs/volumes.c:7912:23: sparse: sparse: got <
   fs/btrfs/volumes.c:7912:44: sparse: sparse: Expected ; at end of declaration
   fs/btrfs/volumes.c:7912:44: sparse: sparse: got ++
   fs/btrfs/volumes.c:7916:32: sparse: sparse: Expected ) in function declarator
   fs/btrfs/volumes.c:7916:32: sparse: sparse: got ->
   fs/btrfs/volumes.c:7916:25: sparse: sparse: Trying to use reserved word 'if' as identifier
   fs/btrfs/volumes.c:7917:33: sparse: sparse: Expected ) in function declarator
   fs/btrfs/volumes.c:7917:33: sparse: sparse: got ,
   fs/btrfs/volumes.c:7917:33: sparse: sparse: Expected ; at the end of type declaration
   fs/btrfs/volumes.c:7917:33: sparse: sparse: got }
   fs/btrfs/volumes.c:7921:33: sparse: sparse: Trying to use reserved word 'goto' as identifier
   fs/btrfs/volumes.c:7921:38: sparse: sparse: Expected ; at end of declaration
   fs/btrfs/volumes.c:7921:38: sparse: sparse: got out
   fs/btrfs/volumes.c:7922:25: sparse: sparse: Expected ; at the end of type declaration
   fs/btrfs/volumes.c:7922:25: sparse: sparse: got }
   fs/btrfs/volumes.c:7924:25: sparse: sparse: Trying to use reserved word 'break' as identifier
   fs/btrfs/volumes.c:7925:17: sparse: sparse: Expected ; at the end of type declaration
   fs/btrfs/volumes.c:7925:17: sparse: sparse: got }
   fs/btrfs/volumes.c:7928:17: sparse: sparse: Expected ) in function declarator
   fs/btrfs/volumes.c:7928:17: sparse: sparse: got ,
   fs/btrfs/volumes.c:7928:17: sparse: sparse: Expected ; at the end of type declaration
   fs/btrfs/volumes.c:7928:17: sparse: sparse: got }
   fs/btrfs/volumes.c:7932:9: sparse: sparse: Expected ; at the end of type declaration
   fs/btrfs/volumes.c:7932:9: sparse: sparse: got }
   fs/btrfs/volumes.c:7936:13: sparse: sparse: Expected ) in function declarator
   fs/btrfs/volumes.c:7936:13: sparse: sparse: got (
   fs/btrfs/volumes.c:7936:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   fs/btrfs/volumes.c:7937:17: sparse: sparse: Expected ) in function declarator
   fs/btrfs/volumes.c:7937:17: sparse: sparse: got ,
   fs/btrfs/volumes.c:7937:17: sparse: sparse: Expected ; at the end of type declaration
   fs/btrfs/volumes.c:7937:17: sparse: sparse: got }
   fs/btrfs/volumes.c:7939:17: sparse: sparse: Trying to use reserved word 'goto' as identifier
   fs/btrfs/volumes.c:7939:22: sparse: sparse: Expected ; at end of declaration
   fs/btrfs/volumes.c:7939:22: sparse: sparse: got out
   fs/btrfs/volumes.c:7940:9: sparse: sparse: Expected ; at the end of type declaration
   fs/btrfs/volumes.c:7940:9: sparse: sparse: got }
   fs/btrfs/volumes.c:7943:17: sparse: sparse: Expected ) in function declarator
   fs/btrfs/volumes.c:7943:17: sparse: sparse: got ,
   fs/btrfs/volumes.c:7943:17: sparse: sparse: Expected ; at the end of type declaration
   fs/btrfs/volumes.c:7943:17: sparse: sparse: got }
   fs/btrfs/volumes.c:7948:17: sparse: sparse: Trying to use reserved word 'goto' as identifier
   fs/btrfs/volumes.c:7948:22: sparse: sparse: Expected ; at end of declaration
   fs/btrfs/volumes.c:7948:22: sparse: sparse: got out
   fs/btrfs/volumes.c:7949:9: sparse: sparse: Expected ; at the end of type declaration
   fs/btrfs/volumes.c:7949:9: sparse: sparse: got }
   fs/btrfs/volumes.c:7954:21: sparse: sparse: Expected ) in function declarator
   fs/btrfs/volumes.c:7954:21: sparse: sparse: got (
   fs/btrfs/volumes.c:7954:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   fs/btrfs/volumes.c:7956:25: sparse: sparse: Expected ) in function declarator
   fs/btrfs/volumes.c:7956:25: sparse: sparse: got ,
   fs/btrfs/volumes.c:7956:25: sparse: sparse: Expected ; at the end of type declaration
   fs/btrfs/volumes.c:7956:25: sparse: sparse: got }
   fs/btrfs/volumes.c:7960:25: sparse: sparse: Trying to use reserved word 'goto' as identifier
   fs/btrfs/volumes.c:7960:30: sparse: sparse: Expected ; at end of declaration
   fs/btrfs/volumes.c:7960:30: sparse: sparse: got out
   fs/btrfs/volumes.c:7961:17: sparse: sparse: Expected ; at the end of type declaration
   fs/btrfs/volumes.c:7961:17: sparse: sparse: got }
   fs/btrfs/volumes.c:7966:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   fs/btrfs/volumes.c:7966:16: sparse: sparse: Expected ; at end of declaration
   fs/btrfs/volumes.c:7966:16: sparse: sparse: got ret
   fs/btrfs/volumes.c:7967:1: sparse: sparse: Expected ; at the end of type declaration
   fs/btrfs/volumes.c:7967:1: sparse: sparse: got }
   fs/btrfs/volumes.c:7974:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   fs/btrfs/volumes.c:7974:9: sparse: sparse: Expected ; at end of declaration
   fs/btrfs/volumes.c:7974:9: sparse: sparse: got {
   fs/btrfs/volumes.c:7974:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   fs/btrfs/volumes.c:7974:9: sparse: sparse: Expected ; at end of declaration
   fs/btrfs/volumes.c:7974:9: sparse: sparse: got {
   fs/btrfs/volumes.c:7974:9: sparse: sparse: Expected ) in function declarator
   fs/btrfs/volumes.c:7974:9: sparse: sparse: got &
>> fs/btrfs/volumes.c:7974:9: sparse: sparse: Trying to use reserved word 'void' as identifier
   fs/btrfs/volumes.c:7974:9: sparse: sparse: Expected ; at the end of type declaration
   fs/btrfs/volumes.c:7974:9: sparse: sparse: got }
   fs/btrfs/volumes.c:7974:9: sparse: sparse: Expected ; at the end of type declaration
   fs/btrfs/volumes.c:7974:9: sparse: sparse: got }
   fs/btrfs/volumes.c:7975:19: sparse: sparse: Expected ) in function declarator
   fs/btrfs/volumes.c:7975:19: sparse: sparse: got =
   fs/btrfs/volumes.c:7975:9: sparse: sparse: Trying to use reserved word 'for' as identifier
   fs/btrfs/volumes.c:7975:88: sparse: sparse: Expected ; at end of declaration
   fs/btrfs/volumes.c:7975:88: sparse: sparse: got )
   fs/btrfs/volumes.c:7978:23: sparse: sparse: cannot dereference this type
   fs/btrfs/volumes.c:7978:23: sparse: sparse: cannot dereference this type
   fs/btrfs/volumes.c:7979:21: sparse: sparse: Expected ) in function declarator
   fs/btrfs/volumes.c:7979:21: sparse: sparse: got (
   fs/btrfs/volumes.c:7979:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   fs/btrfs/volumes.c:7980:25: sparse: sparse: Expected ) in function declarator
   fs/btrfs/volumes.c:7980:25: sparse: sparse: got ,
   fs/btrfs/volumes.c:7980:25: sparse: sparse: Expected ; at the end of type declaration
   fs/btrfs/volumes.c:7980:25: sparse: sparse: got }
   fs/btrfs/volumes.c:7984:25: sparse: sparse: Trying to use reserved word 'goto' as identifier
   fs/btrfs/volumes.c:7984:30: sparse: sparse: Expected ; at end of declaration
   fs/btrfs/volumes.c:7984:30: sparse: sparse: got out
   fs/btrfs/volumes.c:7985:17: sparse: sparse: Expected ; at the end of type declaration
   fs/btrfs/volumes.c:7985:17: sparse: sparse: got }
   fs/btrfs/volumes.c:7988:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   fs/btrfs/volumes.c:7988:9: sparse: sparse: Expected ; at end of declaration
   fs/btrfs/volumes.c:7988:9: sparse: sparse: got {
   fs/btrfs/volumes.c:7988:9: sparse: sparse: Expected ) in function declarator
   fs/btrfs/volumes.c:7988:9: sparse: sparse: got &
   fs/btrfs/volumes.c:7988:9: sparse: sparse: Trying to use reserved word 'void' as identifier
   fs/btrfs/volumes.c:7988:9: sparse: sparse: Expected ; at the end of type declaration
   fs/btrfs/volumes.c:7988:9: sparse: sparse: got }
   fs/btrfs/volumes.c:7988:9: sparse: sparse: Expected ; at the end of type declaration
   fs/btrfs/volumes.c:7988:9: sparse: sparse: got }
   fs/btrfs/volumes.c:7989:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   fs/btrfs/volumes.c:7989:16: sparse: sparse: Expected ; at end of declaration
   fs/btrfs/volumes.c:7989:16: sparse: sparse: got ret
   fs/btrfs/volumes.c:7990:1: sparse: sparse: Expected ; at the end of type declaration
   fs/btrfs/volumes.c:7990:1: sparse: sparse: got }
   fs/btrfs/volumes.c:8018:13: sparse: sparse: Expected ) in function declarator
   fs/btrfs/volumes.c:8018:13: sparse: sparse: got (
   fs/btrfs/volumes.c:8018:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   fs/btrfs/volumes.c:8021:12: sparse: sparse: Expected ; at end of declaration
   fs/btrfs/volumes.c:8021:12: sparse: sparse: got .
   fs/btrfs/volumes.c:8022:12: sparse: sparse: Expected ; at end of declaration
   fs/btrfs/volumes.c:8022:12: sparse: sparse: got .
   fs/btrfs/volumes.c:8023:12: sparse: sparse: Expected ; at end of declaration
   fs/btrfs/volumes.c:8023:12: sparse: sparse: got .
   fs/btrfs/volumes.c:8026:13: sparse: sparse: Expected ) in function declarator
   fs/btrfs/volumes.c:8026:13: sparse: sparse: got !
   fs/btrfs/volumes.c:8026:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   fs/btrfs/volumes.c:8029:13: sparse: sparse: Expected ; at end of declaration
   fs/btrfs/volumes.c:8029:13: sparse: sparse: got ->
   fs/btrfs/volumes.c:8031:17: sparse: sparse: Expected ) in function declarator
   fs/btrfs/volumes.c:8031:17: sparse: sparse: got <
   fs/btrfs/volumes.c:8031:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   fs/btrfs/volumes.c:8034:17: sparse: sparse: Expected ) in function declarator
   fs/btrfs/volumes.c:8034:17: sparse: sparse: got ->
   fs/btrfs/volumes.c:8034:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   fs/btrfs/volumes.c:8036:25: sparse: sparse: Expected ) in function declarator
   fs/btrfs/volumes.c:8036:25: sparse: sparse: got <
   fs/btrfs/volumes.c:8036:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   fs/btrfs/volumes.c:8039:21: sparse: sparse: Expected ) in function declarator
   fs/btrfs/volumes.c:8039:21: sparse: sparse: got (
   fs/btrfs/volumes.c:8039:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   fs/btrfs/volumes.c:8041:9: sparse: sparse: Expected ; at the end of type declaration
   fs/btrfs/volumes.c:8041:9: sparse: sparse: got }
   fs/btrfs/volumes.c:8051:43: sparse: sparse: Expected ) in function declarator
   fs/btrfs/volumes.c:8051:43: sparse: sparse: got ,
   fs/btrfs/volumes.c:8052:24: sparse: sparse: Expected ) in function declarator
   fs/btrfs/volumes.c:8052:24: sparse: sparse: got .
   fs/btrfs/volumes.c:8052:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   fs/btrfs/volumes.c:8062:21: sparse: sparse: Expected ) in function declarator
   fs/btrfs/volumes.c:8062:21: sparse: sparse: got (
   fs/btrfs/volumes.c:8062:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   fs/btrfs/volumes.c:8063:25: sparse: sparse: Expected ) in function declarator
   fs/btrfs/volumes.c:8063:25: sparse: sparse: got ,
   fs/btrfs/volumes.c:8063:25: sparse: sparse: Expected ; at the end of type declaration
   fs/btrfs/volumes.c:8063:25: sparse: sparse: got }
   fs/btrfs/volumes.c:8066:25: sparse: sparse: Trying to use reserved word 'return' as identifier
   fs/btrfs/volumes.c:8066:32: sparse: sparse: Expected ; at end of declaration
   fs/btrfs/volumes.c:8066:32: sparse: sparse: got -
   fs/btrfs/volumes.c:8067:17: sparse: sparse: Expected ; at the end of type declaration
   fs/btrfs/volumes.c:8067:17: sparse: sparse: got }
   fs/btrfs/volumes.c:8071:25: sparse: sparse: Expected ) in function declarator
   fs/btrfs/volumes.c:8071:25: sparse: sparse: got <
   fs/btrfs/volumes.c:8071:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   fs/btrfs/volumes.c:8077:25: sparse: sparse: Expected ) in function declarator
   fs/btrfs/volumes.c:8077:25: sparse: sparse: got <
   fs/btrfs/volumes.c:8077:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   fs/btrfs/volumes.c:8079:25: sparse: sparse: Expected ) in function declarator
   fs/btrfs/volumes.c:8079:25: sparse: sparse: got >
   fs/btrfs/volumes.c:8079:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   fs/btrfs/volumes.c:8081:25: sparse: sparse: Trying to use reserved word 'break' as identifier
   fs/btrfs/volumes.c:8082:17: sparse: sparse: Expected ; at the end of type declaration
   fs/btrfs/volumes.c:8082:17: sparse: sparse: got }
   fs/btrfs/volumes.c:8087:1: sparse: sparse: Expected ; at the end of type declaration
   fs/btrfs/volumes.c:8087:1: sparse: sparse: got }
   fs/btrfs/volumes.c:8098:19: sparse: sparse: Expected ) in function declarator
   fs/btrfs/volumes.c:8098:19: sparse: sparse: got &
   fs/btrfs/volumes.c:8100:9: sparse: sparse: Trying to use reserved word 'while' as identifier

vim +/void +7974 fs/btrfs/volumes.c

cf90d884b347c5 Qu Wenruo     2018-08-01  7968  
cf90d884b347c5 Qu Wenruo     2018-08-01  7969  static int verify_chunk_dev_extent_mapping(struct btrfs_fs_info *fs_info)
cf90d884b347c5 Qu Wenruo     2018-08-01  7970  {
cf90d884b347c5 Qu Wenruo     2018-08-01  7971  	struct rb_node *node;
cf90d884b347c5 Qu Wenruo     2018-08-01  7972  	int ret = 0;
cf90d884b347c5 Qu Wenruo     2018-08-01  7973  
7dc66abb5a4777 Filipe Manana 2023-11-21 @7974  	read_lock(&fs_info->mapping_tree_lock);
7dc66abb5a4777 Filipe Manana 2023-11-21  7975  	for (node = rb_first_cached(&fs_info->mapping_tree); node; node = rb_next(node)) {
7dc66abb5a4777 Filipe Manana 2023-11-21  7976  		struct btrfs_chunk_map *map;
7dc66abb5a4777 Filipe Manana 2023-11-21  7977  
7dc66abb5a4777 Filipe Manana 2023-11-21  7978  		map = rb_entry(node, struct btrfs_chunk_map, rb_node);
9264d004a6c978 David Sterba  2025-09-17  7979  		if (unlikely(map->num_stripes != map->verified_stripes)) {
cf90d884b347c5 Qu Wenruo     2018-08-01  7980  			btrfs_err(fs_info,
cf90d884b347c5 Qu Wenruo     2018-08-01  7981  			"chunk %llu has missing dev extent, have %d expect %d",
7dc66abb5a4777 Filipe Manana 2023-11-21  7982  				  map->start, map->verified_stripes, map->num_stripes);
cf90d884b347c5 Qu Wenruo     2018-08-01  7983  			ret = -EUCLEAN;
cf90d884b347c5 Qu Wenruo     2018-08-01  7984  			goto out;
cf90d884b347c5 Qu Wenruo     2018-08-01  7985  		}
cf90d884b347c5 Qu Wenruo     2018-08-01  7986  	}
cf90d884b347c5 Qu Wenruo     2018-08-01  7987  out:
7dc66abb5a4777 Filipe Manana 2023-11-21  7988  	read_unlock(&fs_info->mapping_tree_lock);
cf90d884b347c5 Qu Wenruo     2018-08-01  7989  	return ret;
cf90d884b347c5 Qu Wenruo     2018-08-01  7990  }
cf90d884b347c5 Qu Wenruo     2018-08-01  7991  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
