Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E923E195FE8
	for <oe-kbuild@lists.linux.dev>; Thu,  8 May 2025 07:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746690275; cv=none; b=s4e8wvhAKIP8rnwWojFsL+qfXGrGxh6hg+5SonYFKvIGsy8phbHEW9dkbcPIiC2yW3M4aT6rpvtjHBqV/pQ1gYdAC8Tq76YHyfI+TchSwNGFoFOqXmvTNAKKX2JlS6WVY47LPZC6dAZtPmjYHLgqYbvpZObua/kTlqbSfbkDs7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746690275; c=relaxed/simple;
	bh=s1unI5P7fmiK2fyuvVk+Nt1GgH5omx9r5dH9JnUqfTg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JOv/gXGw/X87gA19RTcG6+SsEQuy9ZyuZGOajh34kgNOBAHy3C9xT463l5ch0u16B2Rac1JEzz9u4rd40wsHXM5ETqzmUavxWo+wd5NmKqwCwBsSWM3rJeZXv3A29HDy65gWiYjIQZ85C4l+0gMp2mXM/zUndEtX7sylYAW3tFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dJbbgNK3; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dJbbgNK3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746690274; x=1778226274;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s1unI5P7fmiK2fyuvVk+Nt1GgH5omx9r5dH9JnUqfTg=;
  b=dJbbgNK3DzrCrhR9wg4EraYQwgG2EfFXXcDWDCBhgingbUDHimt6V1ip
   xI5R+iLOWVFVsZZQCfxzQ7Y8VjY3bAZMccuU2M77lESJUXoYzE0qB3+3J
   ZQvaDOen2kv/ncqkBkhX9h1HBgpv/4ObGh2Ghd/0RfsJTct4gmO6W8eiy
   KzDUXKh7G4ihQoKzPT8QLC/oLS91Xgp3QqawlUqDRqt8NEbudGfwnigb6
   0KftGR/qLpNrLxLFOPlGqbT0lsCxCGyNpD2Ha7dwkIVgwZFt3k0/4fHQw
   wW912g9ezh6hZEBvUgtDb+YxmMA5sAABRUjRO/SiTvoebxQKm774ePEqV
   Q==;
X-CSE-ConnectionGUID: /ZV27a5QSZWbSbGjfkLudA==
X-CSE-MsgGUID: equJHhLIQ8Owr9OfFnQ9bA==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="59120940"
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="59120940"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 00:44:33 -0700
X-CSE-ConnectionGUID: AVtFb3wvSG6al2c16tXoxg==
X-CSE-MsgGUID: d5aBP2N9T8yyFuGzIri/9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="173410750"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 08 May 2025 00:44:32 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCvvi-000AlG-0u;
	Thu, 08 May 2025 07:44:30 +0000
Date: Thu, 8 May 2025 15:44:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jpoimboe:klp-build 52/58] check.c:641:16: warning: implicit
 declaration of function 'memmem'; did you mean 'memset'?
Message-ID: <202505081529.0zWOC1HG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Josh Poimboeuf <jpoimboe@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git klp-build
head:   af11da3f44cf002ce7ab9ad0ded7656cdd7a3771
commit: 4cdd728471cf8b7e49f24eac50538623fb546f0a [52/58] objtool check klp
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago
config: powerpc-allnoconfig (https://download.01.org/0day-ci/archive/20250508/202505081529.0zWOC1HG-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250508/202505081529.0zWOC1HG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505081529.0zWOC1HG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   check.c: In function 'is_livepatch_module':
>> check.c:641:16: warning: implicit declaration of function 'memmem'; did you mean 'memset'? [-Wimplicit-function-declaration]
     641 |         return memmem(sec->data->d_buf, sec_size(sec), "\0livepatch=Y", 12);
         |                ^~~~~~
         |                memset
   In function 'is_first_func_insn',
       inlined from 'add_jump_destinations' at check.c:1673:7:
   check.c:1526:17: warning: 'dest_insn' may be used uninitialized [-Wmaybe-uninitialized]
    1526 |         if (insn->offset == func->offset)
         |             ~~~~^~~~~~~~
   check.c: In function 'add_jump_destinations':
   check.c:1552:37: note: 'dest_insn' was declared here
    1552 |                 struct instruction *dest_insn;
         |                                     ^~~~~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
