Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A0F34EEE5
	for <oe-kbuild@lists.linux.dev>; Sat,  3 Oct 2026 05:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791007075; cv=none; b=ORNcW8O6c1Vq6sIjIMLAIyWuGeLzlatwOjZQy8TIeTweo6XTBNqyvoZyMpnIBCejx0tSEpNqjHVdcaSp3B1ZrYJ07XsoT4LkX7lhVaLKdVBU1gOGdmwzjuHi9A7gY4PpXyaayamzMdlzwvCgj2wWvrB5B9sK9Qe6jB/qfkVdNM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791007075; c=relaxed/simple;
	bh=0UdSe8u4fjVL98JAmHBpcp4979D0UDe5EppG1T6zgh4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ub26JMkeY5tiTBx48lj8bRGbyZxoKk290vC/WynPq/fnvLhXLnUhkWiVmWntCtTeFE7/Rai5hz0Pgqs2BZV2R3o23FvyjOJbgcsRfkuiIv8DGzyNhdTiKvfZuWGY0efJbtL+pD5PYsRQC5gHUkrMwFgve5gTNph/RwGb6JDzOfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=niUBsmG9; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="niUBsmG9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791007074; x=1822543074;
  h=date:from:to:cc:subject:message-id;
  bh=0UdSe8u4fjVL98JAmHBpcp4979D0UDe5EppG1T6zgh4=;
  b=niUBsmG99yGLnwaSq+GT5+loFIYA7gbkXbj9pHLVJInwmfLTqofEAJdX
   vbftweI9HKs9LR1y8liun01N4b/sTN17E/9TqmKpmLXg475UKUPGoXBLN
   dEudk9TyrR3q81EDycxbqBlE2mqS++Zcw8op+mP6tja4sTq12HtcE32zA
   iz+TPW97UFUrpIjHLSUzS9NYxToCYorQOJdyzw/KNzvYIR8lR17qRqz4S
   nNcPtxWUSVLuv9pVlG5msYzzhImvDeW6WR3oJmn7R2Xd7MOwUYluvnVub
   q+9U2sEAoJ1orXlGkMeTzQSouy5udhymNf+CRvyUKGvUhagQjZf4iPk8g
   A==;
X-CSE-ConnectionGUID: JhIgkDD0QgSEBT+m2RenYw==
X-CSE-MsgGUID: 4RMVTc5mSNGfn3vQtSrDcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11923"; a="90622654"
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="90622654"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 22:57:53 -0700
X-CSE-ConnectionGUID: 9lAVEnRPQSaqUD7NgSuYHA==
X-CSE-MsgGUID: 7n7Zlee0QY+bx1rIYumnwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="280138936"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 02 Oct 2026 22:57:53 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCsko-00000000Tkt-25ZH;
	Sat, 03 Oct 2026 05:57:50 +0000
Date: Sat, 03 Oct 2026 13:57:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: kernel/bpf/hashtab.c:812:3: warning: 'memcpy' forming offset
 [5, 8] is out of the bounds [0, 4] of object 'k' with type 'long unsigned
 int'
Message-ID: <202610031355.lDxHBnxP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/T-J-Mercier/bpf-htab-Split-htab_elem_lru-and-htab_elem_pcpu-off-of-htab_elem/20261002-091734, commit: ff6cf05dbbb8d27bf0e53e860d6320dd75ab8f78"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "T.J. Mercier" <tjmercier@google.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/T-J-Mercier/bpf-htab-Split-htab_elem_lru-and-htab_elem_pcpu-off-of-htab_elem/20261002-091734
head:   ff6cf05dbbb8d27bf0e53e860d6320dd75ab8f78
commit: ff6cf05dbbb8d27bf0e53e860d6320dd75ab8f78 bpf: htab: Reduce elem_size by 8 bytes for small key sizes
date:   13 hours ago
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: arm-randconfig-1003-20261003 (https://download.01.org/0day-ci/archive/20261003/202610031355.lDxHBnxP-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261003/202610031355.lDxHBnxP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610031355.lDxHBnxP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In function '__lookup_elem_raw',
       inlined from 'lookup_nulls_elem_raw' at kernel/bpf/hashtab.c:843:6,
       inlined from '__htab_lookup' at kernel/bpf/hashtab.c:866:6,
       inlined from '__htab_map_lookup_elem_u64' at kernel/bpf/hashtab.c:890:9:
>> kernel/bpf/hashtab.c:812:3: warning: 'memcpy' forming offset [5, 8] is out of the bounds [0, 4] of object 'k' with type 'long unsigned int' [-Warray-bounds]
      memcpy(&k, key, key_size);
      ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/hashtab.c: In function '__htab_map_lookup_elem_u64':
   kernel/bpf/hashtab.c:810:17: note: 'k' declared here
      unsigned long k = 0;
                    ^


vim +812 kernel/bpf/hashtab.c

688ecfe6022051 tom.leiming@gmail.com 2015-12-29  791  
ff6cf05dbbb8d2 T.J. Mercier          2026-10-02  792  static __always_inline struct htab_elem *
ff6cf05dbbb8d2 T.J. Mercier          2026-10-02  793  __lookup_elem_raw(struct bpf_htab *htab, struct hlist_nulls_head *head,
ff6cf05dbbb8d2 T.J. Mercier          2026-10-02  794  		  u32 hash, void *key, u32 key_size,
ff6cf05dbbb8d2 T.J. Mercier          2026-10-02  795  		  struct hlist_nulls_node **out_n)
0f8e4bd8a1fc8c Alexei Starovoitov    2014-11-13  796  {
4fe8435909fddc Alexei Starovoitov    2017-03-07  797  	struct hlist_nulls_node *n;
0f8e4bd8a1fc8c Alexei Starovoitov    2014-11-13  798  	struct htab_elem *l;
0f8e4bd8a1fc8c Alexei Starovoitov    2014-11-13  799  
ff6cf05dbbb8d2 T.J. Mercier          2026-10-02  800  	if (htab_has_hash(htab)) {
ff6cf05dbbb8d2 T.J. Mercier          2026-10-02  801  		hlist_nulls_for_each_entry_rcu(l, n, head, hash_node)
ff6cf05dbbb8d2 T.J. Mercier          2026-10-02  802  			if (htab_elem_hash(l) == hash &&
ff6cf05dbbb8d2 T.J. Mercier          2026-10-02  803  			    !memcmp(&l->key, key, key_size))
ff6cf05dbbb8d2 T.J. Mercier          2026-10-02  804  				return l;
ff6cf05dbbb8d2 T.J. Mercier          2026-10-02  805  	} else {
ff6cf05dbbb8d2 T.J. Mercier          2026-10-02  806  		/*
ff6cf05dbbb8d2 T.J. Mercier          2026-10-02  807  		 * When hash is omitted, key comparisons must be atomic. Zero extend
ff6cf05dbbb8d2 T.J. Mercier          2026-10-02  808  		 * the caller's key to the word size to support an atomic compare.
ff6cf05dbbb8d2 T.J. Mercier          2026-10-02  809  		 */
ff6cf05dbbb8d2 T.J. Mercier          2026-10-02  810  		unsigned long k = 0;
ff6cf05dbbb8d2 T.J. Mercier          2026-10-02  811  
ff6cf05dbbb8d2 T.J. Mercier          2026-10-02 @812  		memcpy(&k, key, key_size);
4fe8435909fddc Alexei Starovoitov    2017-03-07  813  		hlist_nulls_for_each_entry_rcu(l, n, head, hash_node)
ff6cf05dbbb8d2 T.J. Mercier          2026-10-02  814  			if (READ_ONCE(*(unsigned long *)l->key) == k)
0f8e4bd8a1fc8c Alexei Starovoitov    2014-11-13  815  				return l;
ff6cf05dbbb8d2 T.J. Mercier          2026-10-02  816  	}
0f8e4bd8a1fc8c Alexei Starovoitov    2014-11-13  817  
ff6cf05dbbb8d2 T.J. Mercier          2026-10-02  818  	if (out_n)
ff6cf05dbbb8d2 T.J. Mercier          2026-10-02  819  		*out_n = n;
0f8e4bd8a1fc8c Alexei Starovoitov    2014-11-13  820  	return NULL;
0f8e4bd8a1fc8c Alexei Starovoitov    2014-11-13  821  }
0f8e4bd8a1fc8c Alexei Starovoitov    2014-11-13  822  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
