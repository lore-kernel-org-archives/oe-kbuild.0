Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79E038B9A2
	for <oe-kbuild@lists.linux.dev>; Sat, 31 Jan 2026 23:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769903783; cv=none; b=BJrZvRWlrSbohSSt/Y9yDoSUJFNL5ANz+GYNv91sw5l6DDjelWhEkotL7f7mrt/hF1SxApi4fjQ+Fcx3aGJ5h522DqAFNREpq11mvs3LMkwtPyRQpGSpIh5AjcsnnQ4YO9vbwJmcoQMNl/pYEEyST/MrW0lwOcAn1B+CVXhWPR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769903783; c=relaxed/simple;
	bh=i809244ruzi/RrNl6fdWym+o+wBBiKxnEKyot2UlR4g=;
	h=Date:From:To:Subject:Message-ID; b=Ccck5u/T6yY5j37MKVvwK3YAcNxf/ToDoGtFlFi684tSj3axSu28/c4psf59WLm9oDzgq0/KA7NMbPSnYt71QO4Uf44s0P7vKUFazkDRjHKUJKYgNBDP+rKanXUgDe+DvP68Ckyi7xfcu/+JrRVztLY4TO/t8rTvLQX7xS7fP+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fDecEga8; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fDecEga8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769903781; x=1801439781;
  h=date:from:to:subject:message-id;
  bh=i809244ruzi/RrNl6fdWym+o+wBBiKxnEKyot2UlR4g=;
  b=fDecEga8ULYdoKnvV7afq/hbJCDgIMSSZfhDAxjCf2F3b/BcCGvo4YZ3
   2+6GvWAQaMMSLoN1ls8JufCKRhy46P4fuhyf/TZLquVYOfHWZXs/rLQ9/
   kEwc161UGRAO7tWHKkJffgry1jPh7S1HnHM7NzL9z7WsGF/MZKgRv1yqZ
   NK2jhGM5PW27nY6OwQPkv/+GXVYFnbqOafLpLVyCfwRWRxZVkWKcU4Jzc
   A0zeSrF5c38pKbea+i8nQNPErv/qOSr3H1ahMc6N4qXya1TV9oaDlV/wp
   uU5nehYBAaIm9cdKcP1kN3NxojtN6EIgtm6EA/BHcK/b51LI6Re+Ig/2M
   Q==;
X-CSE-ConnectionGUID: 13Hpu+YFSrWkOVASm0Lj4Q==
X-CSE-MsgGUID: 7gWYJjaCQias525zuREpGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11688"; a="81846960"
X-IronPort-AV: E=Sophos;i="6.21,265,1763452800"; 
   d="scan'208";a="81846960"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2026 15:56:20 -0800
X-CSE-ConnectionGUID: vnxgNH1ARTyLPNcXfTuajA==
X-CSE-MsgGUID: HRbT+8/xSWeDRNJjJsj96w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,265,1763452800"; 
   d="scan'208";a="213651907"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 31 Jan 2026 15:56:19 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vmKp7-000000002mX-1bhA
	for oe-kbuild@lists.linux.dev;
	Sat, 31 Jan 2026 23:56:17 +0000
Date: Sun, 01 Feb 2026 00:55:39 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [bcachefs:bcachefs-testing 1/295] checkpatch:
 WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
Message-ID: <202602010014.ltLttYRT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   cf5d0c72be97c816cab62b53688284b64ac7a10e
commit: 10bc67de516ec0622440a5ea34143be1970ee625 [1/295] bcachefs: check_reconcile_work_btree_key() uses bch2_btree_node_update_key()
:::::: branch date: 43 minutes ago
:::::: commit date: 6 weeks ago
reproduce: (https://download.01.org/0day-ci/archive/20260201/202602010014.ltLttYRT-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
#37: FILE: fs/bcachefs/data/reconcile.c:2446:
+		return btree_node_update_key_get_node(trans, iter, n);;

WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
#47: FILE: fs/bcachefs/data/reconcile.c:2458:
+		return btree_node_update_key_get_node(trans, iter, n);;

WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
#59: FILE: fs/bcachefs/data/reconcile.c:2489:
+				return btree_node_update_key_get_node(trans, iter, n);;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
