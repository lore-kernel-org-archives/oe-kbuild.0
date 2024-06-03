Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 286168172E
	for <oe-kbuild@lists.linux.dev>; Mon,  3 Jun 2024 09:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717408493; cv=none; b=KP62Sb/h6K7CwqxV4OLJkNRKOC7yEVBba1RL5/HzngU3UFX3CJjc7I3vCp70Rgt+ARrazok34UiPen0MZ0g4t7dUO7DNcyFFCRLxB+JDDHLTz2xFAM51j8TMZCizvFVUaoQvLlFh9ZsBDSLTFQ6Ts7QBdzZMv2rLSjZz3efETjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717408493; c=relaxed/simple;
	bh=XkzY6Jkjj8ckAi9VKZl4CYj8BQMvfK2btEQ5zDy+TWU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RttClH/eAKdiWSUzFu6zOWlZCiiYp9GkbWt/O5CNN7yMqLKZKNAVk0HMGlVAF4mguvGj41yj3qrGHGtbTOQa72QwJHamAXXLk8n37eG43qaYPc0YfV6r6ENLyd0E6gKT/pttgOR0DM4XxRkW2e6PMrrNYxfii+b7UXWfQ6WYEw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n9XZmtpw; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n9XZmtpw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717408490; x=1748944490;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XkzY6Jkjj8ckAi9VKZl4CYj8BQMvfK2btEQ5zDy+TWU=;
  b=n9XZmtpwBgvpsDU9yAdKj1r7a6utt8inVq8MZiXCpZ55W9XEhS89XC1G
   4w1GXVLcdrZG+agKzP9y6xcTsGCsYeK9IX7PAGCt+B6mubLA0ipVPTCH6
   vZ3N9qRMl5sEHfsf27zNZY0FMb8uWa83ws9vcojWvw9RwuZdXpef+SFAy
   IRxXmbtajd1LlGrSF+yFtqNM44kw7yInSMptC5Zzp8h6ZSGBQpB2mzQI/
   cNkUSjznpqb5MZrlOar7Vx7rghcRs0cjKJv/WEglcW3L4535lEsVeUT0g
   q8sKVylwDzCy3VPtTSOn0rfzwi3oNsa+63etRofMNrWLJJLmmGqIbEM5Q
   Q==;
X-CSE-ConnectionGUID: R8maIvDbQOmXwamcndJnIg==
X-CSE-MsgGUID: PbBgq0JvS9KNToTiuQvL8g==
X-IronPort-AV: E=McAfee;i="6600,9927,11091"; a="31389506"
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; 
   d="scan'208";a="31389506"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2024 02:54:02 -0700
X-CSE-ConnectionGUID: GgGvv1fOT7q/Vx4Ai27stA==
X-CSE-MsgGUID: 7j/t7yP1RfKwERXH5B71WA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; 
   d="scan'208";a="67672816"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 03 Jun 2024 02:54:01 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sE4O6-000LJF-0P;
	Mon, 03 Jun 2024 09:53:58 +0000
Date: Mon, 3 Jun 2024 17:53:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [bcachefs:bcachefs-testing 61/61] fs/bcachefs/error.c:134:25:
 sparse: sparse: break/continue not in iterator scope
Message-ID: <202406031702.HXQRUFR1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: fs/bcachefs/error.c:134:25: sparse: sparse: break/continue not in iterator scope"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Kent Overstreet <kent.overstreet@linux.dev>
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   c39351763cb597c4b0882f00fc043ebcf00e3c62
commit: c39351763cb597c4b0882f00fc043ebcf00e3c62 [61/61] bcachefs: Unlock trans when waiting for user input in fsck
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
config: x86_64-randconfig-122-20240603 (https://download.01.org/0day-ci/archive/20240603/202406031702.HXQRUFR1-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240603/202406031702.HXQRUFR1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202406031702.HXQRUFR1-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/bcachefs/error.c: note: in included file:
   fs/bcachefs/bcachefs.h:984:9: sparse: sparse: array of flexible structures
   fs/bcachefs/error.c:121:17: sparse: sparse: typename in expression
   fs/bcachefs/error.c:121:26: sparse: sparse: Expected ; at end of statement
   fs/bcachefs/error.c:121:26: sparse: sparse: got long
   fs/bcachefs/error.c:122:27: sparse: sparse: expected 'while' after 'do'
   fs/bcachefs/error.c:122:27: sparse: sparse: Expected ( after 'do-while'
   fs/bcachefs/error.c:122:27: sparse: sparse: got )
>> fs/bcachefs/error.c:134:25: sparse: sparse: break/continue not in iterator scope
   fs/bcachefs/error.c:138:18: sparse: sparse: Expected ) in function declarator
   fs/bcachefs/error.c:138:18: sparse: sparse: got (
>> fs/bcachefs/error.c:138:11: sparse: sparse: Trying to use reserved word 'while' as identifier
>> fs/bcachefs/error.c:140:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   fs/bcachefs/error.c:140:9: sparse: sparse: Expected ; at end of declaration
   fs/bcachefs/error.c:140:9: sparse: sparse: got {
>> fs/bcachefs/error.c:140:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   fs/bcachefs/error.c:140:9: sparse: sparse: Expected ; at end of declaration
   fs/bcachefs/error.c:140:9: sparse: sparse: got {
   fs/bcachefs/error.c:140:9: sparse: sparse: Expected ) in nested declarator
   fs/bcachefs/error.c:140:9: sparse: sparse: got &
   fs/bcachefs/error.c:140:9: sparse: sparse: Expected ) in nested declarator
   fs/bcachefs/error.c:140:9: sparse: sparse: got &
   fs/bcachefs/error.c:140:9: sparse: sparse: Expected ; at the end of type declaration
   fs/bcachefs/error.c:140:9: sparse: sparse: got }
   fs/bcachefs/error.c:140:9: sparse: sparse: Expected ; at the end of type declaration
   fs/bcachefs/error.c:140:9: sparse: sparse: got }
>> fs/bcachefs/error.c:141:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   fs/bcachefs/error.c:141:16: sparse: sparse: Expected ; at end of declaration
   fs/bcachefs/error.c:141:16: sparse: sparse: got ret
   fs/bcachefs/error.c:142:1: sparse: sparse: Expected ; at the end of type declaration
   fs/bcachefs/error.c:142:1: sparse: sparse: got }
   fs/bcachefs/error.c:171:13: sparse: sparse: Expected ) in function declarator
   fs/bcachefs/error.c:171:13: sparse: sparse: got !
>> fs/bcachefs/error.c:171:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   fs/bcachefs/error.c:174:9: sparse: sparse: Expected ) in function declarator
   fs/bcachefs/error.c:174:9: sparse: sparse: got =
>> fs/bcachefs/error.c:174:9: sparse: sparse: Trying to use reserved word 'for' as identifier
   fs/bcachefs/error.c:174:9: sparse: sparse: undefined identifier 'c'
   fs/bcachefs/error.c:174:9: sparse: sparse: undefined identifier 's'
   fs/bcachefs/error.c:174:9: sparse: sparse: expected structure or union
   fs/bcachefs/error.c:174:9: sparse: sparse: undefined identifier 'c'
   fs/bcachefs/error.c:174:9: sparse: sparse: Expected ) in function declarator
   fs/bcachefs/error.c:174:9: sparse: sparse: got *
>> fs/bcachefs/error.c:174:9: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   fs/bcachefs/error.c:174:9: sparse: sparse: Expected ; at the end of type declaration
   fs/bcachefs/error.c:174:9: sparse: sparse: got }
   fs/bcachefs/error.c:174:9: sparse: sparse: Expected ; at the end of type declaration
   fs/bcachefs/error.c:174:9: sparse: sparse: got !
>> fs/bcachefs/error.c:174:9: sparse: sparse: cannot dereference this type
>> fs/bcachefs/error.c:174:9: sparse: sparse: cannot dereference this type
   fs/bcachefs/error.c:174:9: sparse: sparse: expected structure or union
>> fs/bcachefs/error.c:174:9: sparse: sparse: cannot dereference this type
   fs/bcachefs/error.c:174:9: sparse: sparse: Expected ; at end of declaration
   fs/bcachefs/error.c:174:9: sparse: sparse: got )
   fs/bcachefs/error.c:181:25: sparse: sparse: Trying to use reserved word 'return' as identifier
   fs/bcachefs/error.c:181:32: sparse: sparse: Expected ; at end of declaration
   fs/bcachefs/error.c:181:32: sparse: sparse: got s
   fs/bcachefs/error.c:182:17: sparse: sparse: Expected ; at the end of type declaration
   fs/bcachefs/error.c:182:17: sparse: sparse: got }
   fs/bcachefs/error.c:184:13: sparse: sparse: Expected ) in nested declarator
   fs/bcachefs/error.c:184:13: sparse: sparse: got {
   fs/bcachefs/error.c:184:13: sparse: sparse: Expected ) in function declarator
   fs/bcachefs/error.c:184:13: sparse: sparse: got &
   fs/bcachefs/error.c:184:13: sparse: sparse: Expected ; at the end of type declaration
   fs/bcachefs/error.c:184:13: sparse: sparse: got }
   fs/bcachefs/error.c:184:13: sparse: sparse: Expected ; at the end of type declaration
   fs/bcachefs/error.c:184:13: sparse: sparse: got }
   fs/bcachefs/error.c:185:13: sparse: sparse: Expected ) in function declarator
   fs/bcachefs/error.c:185:13: sparse: sparse: got !
   fs/bcachefs/error.c:185:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   fs/bcachefs/error.c:188:18: sparse: sparse: Expected ; at end of declaration
   fs/bcachefs/error.c:188:18: sparse: sparse: got ->
   fs/bcachefs/error.c:189:24: sparse: sparse: Expected ) in function declarator
   fs/bcachefs/error.c:189:24: sparse: sparse: got (
   fs/bcachefs/error.c:189:17: sparse: sparse: Trying to use reserved word 'return' as identifier
   fs/bcachefs/error.c:190:9: sparse: sparse: Expected ; at the end of type declaration
   fs/bcachefs/error.c:190:9: sparse: sparse: got }
   fs/bcachefs/error.c:193:10: sparse: sparse: Expected ; at end of declaration
   fs/bcachefs/error.c:193:10: sparse: sparse: got ->
   fs/bcachefs/error.c:194:18: sparse: sparse: Expected ) in function declarator
   fs/bcachefs/error.c:194:18: sparse: sparse: got &
   fs/bcachefs/error.c:195:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   fs/bcachefs/error.c:195:16: sparse: sparse: Expected ; at end of declaration
   fs/bcachefs/error.c:195:16: sparse: sparse: got s
   fs/bcachefs/error.c:196:1: sparse: sparse: Expected ; at the end of type declaration
   fs/bcachefs/error.c:196:1: sparse: sparse: got }
   fs/bcachefs/error.c:203:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   fs/bcachefs/error.c:203:9: sparse: sparse: Expected ; at end of declaration
   fs/bcachefs/error.c:203:9: sparse: sparse: got {
   fs/bcachefs/error.c:203:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   fs/bcachefs/error.c:203:9: sparse: sparse: Expected ; at end of declaration
   fs/bcachefs/error.c:203:9: sparse: sparse: got {
   fs/bcachefs/error.c:203:9: sparse: sparse: Expected ; at the end of type declaration
   fs/bcachefs/error.c:203:9: sparse: sparse: got }
   fs/bcachefs/error.c:203:9: sparse: sparse: Expected ; at the end of type declaration
   fs/bcachefs/error.c:203:9: sparse: sparse: got }
   fs/bcachefs/error.c:203:9: sparse: sparse: Expected ; at the end of type declaration
   fs/bcachefs/error.c:203:9: sparse: sparse: got }
   fs/bcachefs/error.c:204:9: sparse: sparse: Expected ; at the end of type declaration
   fs/bcachefs/error.c:204:9: sparse: sparse: got --
   fs/bcachefs/error.c:206:19: sparse: sparse: Expected ) in function declarator
   fs/bcachefs/error.c:206:19: sparse: sparse: got [
   fs/bcachefs/error.c:206:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   fs/bcachefs/error.c:210:20: sparse: sparse: Expected ) in function declarator
   fs/bcachefs/error.c:210:20: sparse: sparse: got ,
   fs/bcachefs/error.c:211:1: sparse: sparse: Expected ; at the end of type declaration
   fs/bcachefs/error.c:211:1: sparse: sparse: got }
   fs/bcachefs/error.c:226:13: sparse: sparse: Expected ) in function declarator
   fs/bcachefs/error.c:226:13: sparse: sparse: got !
   fs/bcachefs/error.c:226:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   fs/bcachefs/error.c:229:9: sparse: sparse: Expected ) in nested declarator
   fs/bcachefs/error.c:229:9: sparse: sparse: got {
   fs/bcachefs/error.c:229:9: sparse: sparse: Expected ) in function declarator
   fs/bcachefs/error.c:229:9: sparse: sparse: got (
   fs/bcachefs/error.c:229:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   fs/bcachefs/error.c:229:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   fs/bcachefs/error.c:229:9: sparse: sparse: Expected ; at end of declaration
   fs/bcachefs/error.c:229:9: sparse: sparse: got {
   fs/bcachefs/error.c:229:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   fs/bcachefs/error.c:229:9: sparse: sparse: Expected ; at end of declaration
   fs/bcachefs/error.c:229:9: sparse: sparse: got {
   fs/bcachefs/error.c:229:9: sparse: sparse: Expected ; at the end of type declaration
   fs/bcachefs/error.c:229:9: sparse: sparse: got }
   fs/bcachefs/error.c:229:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   fs/bcachefs/error.c:229:9: sparse: sparse: Expected ; at end of declaration
   fs/bcachefs/error.c:229:9: sparse: sparse: got {
   fs/bcachefs/error.c:229:9: sparse: sparse: Expected ; at the end of type declaration
   fs/bcachefs/error.c:229:9: sparse: sparse: got }
   fs/bcachefs/error.c:229:9: sparse: sparse: Expected ) in function declarator
   fs/bcachefs/error.c:229:9: sparse: sparse: got !
   fs/bcachefs/error.c:229:9: sparse: sparse: Expected ; at the end of type declaration
   fs/bcachefs/error.c:229:9: sparse: sparse: got }
   fs/bcachefs/error.c:231:13: sparse: sparse: Expected ) in function declarator
   fs/bcachefs/error.c:231:13: sparse: sparse: got (
   fs/bcachefs/error.c:231:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   fs/bcachefs/error.c:237:9: sparse: sparse: Expected ) in nested declarator
   fs/bcachefs/error.c:237:9: sparse: sparse: got =
   fs/bcachefs/error.c:242:16: sparse: sparse: Expected ) in function declarator
   fs/bcachefs/error.c:242:16: sparse: sparse: got ->
   fs/bcachefs/error.c:242:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   fs/bcachefs/error.c:244:17: sparse: sparse: Trying to use reserved word 'if' as identifier
>> fs/bcachefs/error.c:244:21: sparse: sparse: missing type declaration for parameter 'p'
   fs/bcachefs/error.c:252:9: sparse: sparse: Expected ; at the end of type declaration
   fs/bcachefs/error.c:252:9: sparse: sparse: got }
   fs/bcachefs/error.c:256:9: sparse: sparse: Trying to use reserved word 'if' as identifier
>> fs/bcachefs/error.c:256:13: sparse: sparse: missing type declaration for parameter 's'
   fs/bcachefs/error.c:289:13: sparse: sparse: Expected ) in function declarator
   fs/bcachefs/error.c:289:13: sparse: sparse: got !
   fs/bcachefs/error.c:289:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   fs/bcachefs/error.c:293:13: sparse: sparse: Expected ) in function declarator
   fs/bcachefs/error.c:293:13: sparse: sparse: got !
   fs/bcachefs/error.c:293:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   fs/bcachefs/error.c:299:17: sparse: sparse: Expected ; at the end of type declaration
   fs/bcachefs/error.c:299:17: sparse: sparse: got }
   fs/bcachefs/error.c:303:17: sparse: sparse: Expected ; at the end of type declaration
   fs/bcachefs/error.c:303:17: sparse: sparse: got }
   fs/bcachefs/error.c:306:17: sparse: sparse: Expected ; at the end of type declaration
   fs/bcachefs/error.c:306:17: sparse: sparse: got }
   fs/bcachefs/error.c:310:9: sparse: sparse: Expected ; at the end of type declaration
   fs/bcachefs/error.c:310:9: sparse: sparse: got }
   fs/bcachefs/error.c:315:25: sparse: sparse: Expected ) in function declarator
   fs/bcachefs/error.c:315:25: sparse: sparse: got ==
   fs/bcachefs/error.c:315:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   fs/bcachefs/error.c:319:51: sparse: sparse: Expected ) in function declarator
   fs/bcachefs/error.c:319:51: sparse: sparse: got (
   fs/bcachefs/error.c:319:25: sparse: sparse: Trying to use reserved word 'if' as identifier
>> fs/bcachefs/error.c:321:25: sparse: sparse: Trying to use reserved word 'else' as identifier
   fs/bcachefs/error.c:322:33: sparse: sparse: Expected ; at end of declaration
   fs/bcachefs/error.c:322:33: sparse: sparse: got bch2_print_string_as_lines
   fs/bcachefs/error.c:327:25: sparse: sparse: Trying to use reserved word 'if' as identifier
>> fs/bcachefs/error.c:327:29: sparse: sparse: missing type declaration for parameter 'trans'
   fs/bcachefs/error.c:335:33: sparse: sparse: Expected ) in function declarator
   fs/bcachefs/error.c:335:33: sparse: sparse: got >=
   fs/bcachefs/error.c:335:25: sparse: sparse: Trying to use reserved word 'if' as identifier
   fs/bcachefs/error.c:343:17: sparse: sparse: Expected ; at the end of type declaration
   fs/bcachefs/error.c:343:17: sparse: sparse: got }
   fs/bcachefs/error.c:349:17: sparse: sparse: Expected ; at the end of type declaration
   fs/bcachefs/error.c:349:17: sparse: sparse: got }
   fs/bcachefs/error.c:352:17: sparse: sparse: Expected ; at the end of type declaration
   fs/bcachefs/error.c:352:17: sparse: sparse: got }
   fs/bcachefs/error.c:355:9: sparse: sparse: Expected ; at the end of type declaration
   fs/bcachefs/error.c:355:9: sparse: sparse: got }
   fs/bcachefs/error.c:357:9: sparse: sparse: Expected ; at the end of type declaration
   fs/bcachefs/error.c:357:9: sparse: sparse: got }
   fs/bcachefs/error.c:364:9: sparse: sparse: Trying to use reserved word 'if' as identifier
>> fs/bcachefs/error.c:364:13: sparse: sparse: missing type declaration for parameter 'print'
   fs/bcachefs/error.c:371:13: sparse: sparse: Expected ) in function declarator
   fs/bcachefs/error.c:371:13: sparse: sparse: got (
   fs/bcachefs/error.c:371:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   fs/bcachefs/error.c:375:9: sparse: sparse: Trying to use reserved word 'else' as identifier
   fs/bcachefs/error.c:375:14: sparse: sparse: Expected ; at end of declaration
   fs/bcachefs/error.c:375:14: sparse: sparse: got if
   fs/bcachefs/error.c:378:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   fs/bcachefs/error.c:379:17: sparse: sparse: Expected ; at end of declaration
   fs/bcachefs/error.c:379:17: sparse: sparse: got s
   fs/bcachefs/error.c:381:22: sparse: sparse: Expected ) in function declarator
   fs/bcachefs/error.c:381:22: sparse: sparse: got &
   fs/bcachefs/error.c:383:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   fs/bcachefs/error.c:384:17: sparse: sparse: Expected ; at end of declaration
   fs/bcachefs/error.c:384:17: sparse: sparse: got bch2_inconsistent_error
   fs/bcachefs/error.c:386:17: sparse: sparse: Expected ) in function declarator
   fs/bcachefs/error.c:386:17: sparse: sparse: got ==
   fs/bcachefs/error.c:386:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   fs/bcachefs/error.c:388:9: sparse: sparse: Expected ; at the end of type declaration
   fs/bcachefs/error.c:388:9: sparse: sparse: got }
   fs/bcachefs/error.c:390:37: sparse: sparse: Expected ) in function declarator
   fs/bcachefs/error.c:390:37: sparse: sparse: got ,
   fs/bcachefs/error.c:391:9: sparse: sparse: Expected ; at the end of type declaration
   fs/bcachefs/error.c:391:9: sparse: sparse: got }
   fs/bcachefs/error.c:395:9: sparse: sparse: Expected ) in function declarator
   fs/bcachefs/error.c:395:9: sparse: sparse: got &
   fs/bcachefs/error.c:396:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   fs/bcachefs/error.c:396:16: sparse: sparse: Expected ; at end of declaration
   fs/bcachefs/error.c:396:16: sparse: sparse: got ret
   fs/bcachefs/error.c:397:1: sparse: sparse: Expected ; at the end of type declaration
   fs/bcachefs/error.c:397:1: sparse: sparse: got }
   fs/bcachefs/error.c:403:9: sparse: sparse: Expected ) in function declarator
   fs/bcachefs/error.c:403:9: sparse: sparse: got &
   fs/bcachefs/error.c:405:9: sparse: sparse: Expected ) in function declarator
   fs/bcachefs/error.c:405:9: sparse: sparse: got =
   fs/bcachefs/error.c:405:9: sparse: sparse: Trying to use reserved word 'for' as identifier
   fs/bcachefs/error.c:405:9: sparse: sparse: cannot dereference this type
   fs/bcachefs/error.c:405:9: sparse: sparse: cannot dereference this type
   fs/bcachefs/error.c:405:9: sparse: sparse: expected structure or union
   fs/bcachefs/error.c:405:9: sparse: sparse: cannot dereference this type
   fs/bcachefs/error.c:405:9: sparse: sparse: Expected ) in function declarator
   fs/bcachefs/error.c:405:9: sparse: sparse: got *
   fs/bcachefs/error.c:405:9: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   fs/bcachefs/error.c:405:9: sparse: sparse: Expected ; at the end of type declaration
   fs/bcachefs/error.c:405:9: sparse: sparse: got }
   fs/bcachefs/error.c:405:9: sparse: sparse: cannot dereference this type
   fs/bcachefs/error.c:405:9: sparse: sparse: cannot dereference this type
   fs/bcachefs/error.c:405:9: sparse: sparse: expected structure or union
   fs/bcachefs/error.c:405:9: sparse: sparse: cannot dereference this type
   fs/bcachefs/error.c:405:9: sparse: sparse: Expected ) in function declarator
   fs/bcachefs/error.c:405:9: sparse: sparse: got *
   fs/bcachefs/error.c:405:9: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   fs/bcachefs/error.c:405:9: sparse: sparse: Expected ; at the end of type declaration
   fs/bcachefs/error.c:405:9: sparse: sparse: got }
   fs/bcachefs/error.c:405:9: sparse: sparse: Expected ; at the end of type declaration
   fs/bcachefs/error.c:405:9: sparse: sparse: got !
   fs/bcachefs/error.c:405:9: sparse: sparse: cannot dereference this type
   fs/bcachefs/error.c:405:9: sparse: sparse: cannot dereference this type
   fs/bcachefs/error.c:405:9: sparse: sparse: expected structure or union
   fs/bcachefs/error.c:405:9: sparse: sparse: cannot dereference this type
   fs/bcachefs/error.c:405:9: sparse: sparse: Expected ; at end of declaration
   fs/bcachefs/error.c:405:9: sparse: sparse: got )
   fs/bcachefs/error.c:409:26: sparse: sparse: Expected ) in function declarator
   fs/bcachefs/error.c:409:26: sparse: sparse: got &
   fs/bcachefs/error.c:410:24: sparse: sparse: Expected ) in function declarator
   fs/bcachefs/error.c:410:24: sparse: sparse: got ->
   fs/bcachefs/error.c:412:9: sparse: sparse: Expected ; at the end of type declaration
   fs/bcachefs/error.c:412:9: sparse: sparse: got }
   fs/bcachefs/error.c:415:1: sparse: sparse: Expected ; at the end of type declaration
   fs/bcachefs/error.c:415:1: sparse: sparse: got }
   fs/bcachefs/error.c:121:17: sparse: sparse: undefined identifier 'unsigned'
   fs/bcachefs/error.c:122:27: sparse: sparse: undefined identifier '__UNIQUE_ID___x1091'
   fs/bcachefs/error.c:125:76: sparse: sparse: undefined identifier 't'
>> fs/bcachefs/error.c:174:9: sparse: sparse: cannot dereference this type
   fs/bcachefs/error.c:174:9: sparse: sparse: cast from unknown type
>> fs/bcachefs/error.c:174:9: sparse: sparse: cannot dereference this type
   fs/bcachefs/error.c:174:9: sparse: sparse: expected structure or union
   fs/bcachefs/error.c:174:9: sparse: sparse: cast from unknown type
   fs/bcachefs/error.c:184:13: sparse: sparse: undefined identifier '__func__'
   fs/bcachefs/error.c:184:13: sparse: sparse: undefined identifier '_alloc_tag_cntr'
   fs/bcachefs/error.c:184:13: sparse: sparse: cannot dereference this type
   fs/bcachefs/error.c:184:13: sparse: sparse: cannot dereference this type
   fs/bcachefs/error.c:184:13: sparse: sparse: symbol 'alloc_tag_restore' redeclared with different type (different argument counts):
   fs/bcachefs/error.c:184:13: sparse:    int static [signed] [toplevel] alloc_tag_restore( ... )
   fs/bcachefs/error.c: note: in included file (through include/linux/percpu.h, include/linux/radix-tree.h, include/linux/backing-dev-defs.h, ...):
   include/linux/sched.h:2201:20: sparse: note: previously declared as:
   include/linux/sched.h:2201:20: sparse:    void static inline [gnu_inline] [toplevel] alloc_tag_restore( ... )
   fs/bcachefs/error.c:184:13: sparse: sparse: symbol '_res' redeclared with different type (different base types):
   fs/bcachefs/error.c:184:13: sparse:    int [addressable] [toplevel] _res
   fs/bcachefs/error.c:184:13: sparse: note: previously declared as:
   fs/bcachefs/error.c:184:13: sparse:    bad type [addressable] [toplevel] _res
   fs/bcachefs/error.c:194:9: sparse: sparse: symbol 'list_add' redeclared with different type (different argument counts):
   fs/bcachefs/error.c:194:9: sparse:    int static [signed] [toplevel] list_add( ... )
   fs/bcachefs/error.c: note: in included file (through include/linux/backing-dev-defs.h, fs/bcachefs/bcachefs.h):
   include/linux/list.h:167:20: sparse: note: previously declared as:
   include/linux/list.h:167:20: sparse:    void static inline [gnu_inline] [toplevel] list_add( ... )
   fs/bcachefs/error.c:209:9: sparse: sparse: symbol 'prt_bytes' redeclared with different type (incompatible argument 1 (different base types)):
   fs/bcachefs/error.c:209:9: sparse:    int static [signed] [toplevel] prt_bytes( ... )
   fs/bcachefs/error.c: note: in included file (through fs/bcachefs/util.h, fs/bcachefs/vstructs.h, fs/bcachefs/bcachefs_format.h, ...):
   fs/bcachefs/printbuf.h:216:20: sparse: note: previously declared as:
   fs/bcachefs/printbuf.h:216:20: sparse:    void static inline [gnu_inline] [toplevel] prt_bytes( ... )
   fs/bcachefs/error.c:210:9: sparse: sparse: symbol 'prt_str' redeclared with different type (incompatible argument 1 (different base types)):
   fs/bcachefs/error.c:210:9: sparse:    int static [signed] [toplevel] prt_str( ... )
   fs/bcachefs/printbuf.h:228:20: sparse: note: previously declared as:
   fs/bcachefs/printbuf.h:228:20: sparse:    void static inline [gnu_inline] [toplevel] prt_str( ... )
   fs/bcachefs/error.c:237:9: sparse: sparse: symbol 'args' redeclared with different type (different base types):
   fs/bcachefs/error.c:237:9: sparse:    int [addressable] [toplevel] args
   fs/bcachefs/error.c:220:17: sparse: note: previously declared as:
   fs/bcachefs/error.c:220:17: sparse:    void *[addressable] [toplevel] [usertype] args
>> fs/bcachefs/error.c:245:38: sparse: sparse: incompatible types for operation (-):
   fs/bcachefs/error.c:245:38: sparse:    int p
   fs/bcachefs/error.c:245:38: sparse:    char *buf
>> fs/bcachefs/error.c:249:33: sparse: sparse: label 'err' was not declared
   fs/bcachefs/error.c:255:13: sparse: sparse: undefined identifier 'fsck_err_get'
   fs/bcachefs/error.c:255:9: sparse: sparse: symbol 's' has multiple initializers (originally initialized at fs/bcachefs/error.c:174)
   fs/bcachefs/error.c:262:22: sparse: sparse: cannot dereference this type
   fs/bcachefs/error.c:263:32: sparse: sparse: cannot dereference this type
   fs/bcachefs/error.c:264:40: sparse: sparse: cannot dereference this type
   fs/bcachefs/error.c:265:25: sparse: sparse: label 'err' was not declared
   fs/bcachefs/error.c:268:24: sparse: sparse: cannot dereference this type
   fs/bcachefs/error.c:269:18: sparse: sparse: cannot dereference this type
   fs/bcachefs/error.c:270:23: sparse: sparse: cannot dereference this type
   fs/bcachefs/error.c:271:40: sparse: sparse: cannot dereference this type
   fs/bcachefs/error.c:273:25: sparse: sparse: label 'err' was not declared
   fs/bcachefs/error.c:276:22: sparse: sparse: cannot dereference this type
   fs/bcachefs/error.c:279:30: sparse: sparse: cannot dereference this type
   fs/bcachefs/error.c:285:18: sparse: sparse: cannot dereference this type
   fs/bcachefs/error.c:297:25: sparse: sparse: symbol 'inconsistent' has multiple initializers (originally initialized at fs/bcachefs/error.c:221)
   fs/bcachefs/error.c:297:25: sparse: sparse: symbol 'inconsistent' redeclared with different type (different type sizes):
   fs/bcachefs/error.c:297:25: sparse:    int [addressable] [toplevel] inconsistent
   fs/bcachefs/error.c:221:49: sparse: note: previously declared as:
   fs/bcachefs/error.c:221:49: sparse:    bool [addressable] [toplevel] [usertype] inconsistent
   fs/bcachefs/error.c:298:25: sparse: sparse: symbol 'ret' has multiple initializers (originally initialized at fs/bcachefs/error.c:223)
   fs/bcachefs/error.c:302:25: sparse: sparse: symbol 'ret' has multiple initializers (originally initialized at fs/bcachefs/error.c:298)
   fs/bcachefs/error.c:305:25: sparse: sparse: symbol 'ret' has multiple initializers (originally initialized at fs/bcachefs/error.c:302)
   fs/bcachefs/error.c:309:17: sparse: sparse: symbol 'ret' has multiple initializers (originally initialized at fs/bcachefs/error.c:305)
   fs/bcachefs/error.c:317:25: sparse: sparse: symbol 'prt_str' redeclared with different type (different argument counts):
   fs/bcachefs/error.c:317:25: sparse:    int static [signed] [toplevel] prt_str( ... )
   fs/bcachefs/error.c:210:9: sparse: note: previously declared as:
   fs/bcachefs/error.c:210:9: sparse:    int static [signed] [toplevel] prt_str( ... )
   fs/bcachefs/error.c:323:25: sparse: sparse: symbol 'print' has multiple initializers (originally initialized at fs/bcachefs/error.c:221)
   fs/bcachefs/error.c:323:25: sparse: sparse: symbol 'print' redeclared with different type (different type sizes):
   fs/bcachefs/error.c:323:25: sparse:    int [addressable] [toplevel] print
   fs/bcachefs/error.c:221:14: sparse: note: previously declared as:
   fs/bcachefs/error.c:221:14: sparse:    bool [addressable] [assigned] [toplevel] [usertype] print
   fs/bcachefs/error.c:325:55: sparse: sparse: undefined identifier 'trans'
   fs/bcachefs/error.c:330:56: sparse: sparse: cannot dereference this type
   fs/bcachefs/error.c:331:41: sparse: sparse: label 'err' was not declared
   fs/bcachefs/error.c:340:25: sparse: sparse: symbol 'ret' has multiple initializers (originally initialized at fs/bcachefs/error.c:309)
   fs/bcachefs/error.c:348:25: sparse: sparse: symbol 'ret' has multiple initializers (originally initialized at fs/bcachefs/error.c:340)
>> fs/bcachefs/error.c:366:25: sparse: sparse: no generic selection for 'int [addressable] [toplevel] c'
   fs/bcachefs/error.c:390:17: sparse: sparse: symbol 'set_bit' redeclared with different type (incompatible argument 1 (different base types)):
   fs/bcachefs/error.c:390:17: sparse:    int static [signed] [toplevel] set_bit( ... )
   fs/bcachefs/error.c: note: in included file (through arch/x86/include/asm/bitops.h, include/linux/bitops.h, include/linux/radix-tree.h, ...):
   include/asm-generic/bitops/instrumented-atomic.h:26:29: sparse: note: previously declared as:
   include/asm-generic/bitops/instrumented-atomic.h:26:29: sparse:    void static inline [gnu_inline] [toplevel] set_bit( ... )
   fs/bcachefs/error.c:405:9: sparse: sparse: undefined identifier 'n'
   fs/bcachefs/error.c:405:9: sparse: sparse: symbol 's' has multiple initializers (originally initialized at fs/bcachefs/error.c:255)
   fs/bcachefs/error.c:405:9: sparse: sparse: cannot dereference this type
   fs/bcachefs/error.c:405:9: sparse: sparse: cast from unknown type
   fs/bcachefs/error.c:405:9: sparse: sparse: cannot dereference this type
   fs/bcachefs/error.c:405:9: sparse: sparse: expected structure or union
   fs/bcachefs/error.c:405:9: sparse: sparse: cast from unknown type
   fs/bcachefs/error.c:409:17: sparse: sparse: symbol 'list_del' redeclared with different type (different argument counts):
   fs/bcachefs/error.c:409:17: sparse:    int static [signed] [toplevel] list_del( ... )
   fs/bcachefs/error.c: note: in included file (through include/linux/backing-dev-defs.h, fs/bcachefs/bcachefs.h):
   include/linux/list.h:227:20: sparse: note: previously declared as:
   include/linux/list.h:227:20: sparse:    void static inline [gnu_inline] [toplevel] list_del( ... )

vim +134 fs/bcachefs/error.c

96f37eabe7a5cb Kent Overstreet 2023-12-31   99  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  100  #ifdef __KERNEL__
c39351763cb597 Kent Overstreet 2024-05-29  101  static enum ask_yn bch2_fsck_ask_yn(struct bch_fs *c, struct btree_trans *trans)
96f37eabe7a5cb Kent Overstreet 2023-12-31  102  {
96f37eabe7a5cb Kent Overstreet 2023-12-31  103  	struct stdio_redirect *stdio = c->stdio;
96f37eabe7a5cb Kent Overstreet 2023-12-31  104  
96f37eabe7a5cb Kent Overstreet 2023-12-31  105  	if (c->stdio_filter && c->stdio_filter != current)
96f37eabe7a5cb Kent Overstreet 2023-12-31  106  		stdio = NULL;
96f37eabe7a5cb Kent Overstreet 2023-12-31  107  
96f37eabe7a5cb Kent Overstreet 2023-12-31  108  	if (!stdio)
96f37eabe7a5cb Kent Overstreet 2023-12-31  109  		return YN_NO;
96f37eabe7a5cb Kent Overstreet 2023-12-31  110  
c39351763cb597 Kent Overstreet 2024-05-29  111  	if (trans)
c39351763cb597 Kent Overstreet 2024-05-29  112  		bch2_trans_unlock(trans);
c39351763cb597 Kent Overstreet 2024-05-29  113  
c39351763cb597 Kent Overstreet 2024-05-29  114  	unsigned long unlock_long_at = trans ? jiffies + HZ * 2 : 0;
4ee8e4d36e8889 Kent Overstreet 2024-05-29  115  	darray_char line = {};
96f37eabe7a5cb Kent Overstreet 2023-12-31  116  	int ret;
96f37eabe7a5cb Kent Overstreet 2023-12-31  117  
96f37eabe7a5cb Kent Overstreet 2023-12-31  118  	do {
96f37eabe7a5cb Kent Overstreet 2023-12-31  119  		bch2_print(c, " (y,n, or Y,N for all errors of this type) ");
c39351763cb597 Kent Overstreet 2024-05-29  120  rewait:
c39351763cb597 Kent Overstreet 2024-05-29  121  		unsigned long t = unlock_long_at
c39351763cb597 Kent Overstreet 2024-05-29  122  			? max_t(long, unlock_long_at - jiffies, 0)
c39351763cb597 Kent Overstreet 2024-05-29  123  			: MAX_SCHEDULE_TIMEOUT;
c39351763cb597 Kent Overstreet 2024-05-29  124  
c39351763cb597 Kent Overstreet 2024-05-29  125  		int r = bch2_stdio_redirect_readline_timeout(stdio, &line, t);
c39351763cb597 Kent Overstreet 2024-05-29  126  		if (r == -ETIME) {
c39351763cb597 Kent Overstreet 2024-05-29  127  			bch2_trans_unlock_long(trans);
c39351763cb597 Kent Overstreet 2024-05-29  128  			unlock_long_at = 0;
c39351763cb597 Kent Overstreet 2024-05-29  129  			goto rewait;
c39351763cb597 Kent Overstreet 2024-05-29  130  		}
96f37eabe7a5cb Kent Overstreet 2023-12-31  131  
4ee8e4d36e8889 Kent Overstreet 2024-05-29  132  		if (r < 0) {
4ee8e4d36e8889 Kent Overstreet 2024-05-29  133  			ret = YN_NO;
4ee8e4d36e8889 Kent Overstreet 2024-05-29 @134  			break;
4ee8e4d36e8889 Kent Overstreet 2024-05-29  135  		}
c39351763cb597 Kent Overstreet 2024-05-29  136  
4ee8e4d36e8889 Kent Overstreet 2024-05-29  137  		darray_last(line) = '\0';
4ee8e4d36e8889 Kent Overstreet 2024-05-29 @138  	} while ((ret = parse_yn_response(line.data)) < 0);
96f37eabe7a5cb Kent Overstreet 2023-12-31  139  
4ee8e4d36e8889 Kent Overstreet 2024-05-29 @140  	darray_exit(&line);
96f37eabe7a5cb Kent Overstreet 2023-12-31 @141  	return ret;
96f37eabe7a5cb Kent Overstreet 2023-12-31  142  }
1c6fdbd8f2465d Kent Overstreet 2017-03-16  143  #else
853b7393c20d5e Kent Overstreet 2023-04-15  144  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  145  #include "tools-util.h"
853b7393c20d5e Kent Overstreet 2023-04-15  146  
c39351763cb597 Kent Overstreet 2024-05-29  147  static enum ask_yn bch2_fsck_ask_yn(struct bch_fs *c struct btree_trans *trans)
853b7393c20d5e Kent Overstreet 2023-04-15  148  {
853b7393c20d5e Kent Overstreet 2023-04-15  149  	char *buf = NULL;
853b7393c20d5e Kent Overstreet 2023-04-15  150  	size_t buflen = 0;
96f37eabe7a5cb Kent Overstreet 2023-12-31  151  	int ret;
853b7393c20d5e Kent Overstreet 2023-04-15  152  
96f37eabe7a5cb Kent Overstreet 2023-12-31  153  	do {
4f2c166ebe5bae Kent Overstreet 2023-06-04  154  		fputs(" (y,n, or Y,N for all errors of this type) ", stdout);
853b7393c20d5e Kent Overstreet 2023-04-15  155  		fflush(stdout);
853b7393c20d5e Kent Overstreet 2023-04-15  156  
853b7393c20d5e Kent Overstreet 2023-04-15  157  		if (getline(&buf, &buflen, stdin) < 0)
853b7393c20d5e Kent Overstreet 2023-04-15  158  			die("error reading from standard input");
96f37eabe7a5cb Kent Overstreet 2023-12-31  159  	} while ((ret = parse_yn_response(buf)) < 0);
853b7393c20d5e Kent Overstreet 2023-04-15  160  
853b7393c20d5e Kent Overstreet 2023-04-15  161  	free(buf);
853b7393c20d5e Kent Overstreet 2023-04-15  162  	return ret;
853b7393c20d5e Kent Overstreet 2023-04-15  163  }
853b7393c20d5e Kent Overstreet 2023-04-15  164  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  165  #endif
1c6fdbd8f2465d Kent Overstreet 2017-03-16  166  
dbb9936b0dc905 Kent Overstreet 2022-09-25  167  static struct fsck_err_state *fsck_err_get(struct bch_fs *c, const char *fmt)
1c6fdbd8f2465d Kent Overstreet 2017-03-16  168  {
dbb9936b0dc905 Kent Overstreet 2022-09-25  169  	struct fsck_err_state *s;
6543f5620d81cf Kent Overstreet 2019-03-28  170  
d55ddf6e7a81e1 Kent Overstreet 2023-12-31 @171  	if (!test_bit(BCH_FS_fsck_running, &c->flags))
dbb9936b0dc905 Kent Overstreet 2022-09-25  172  		return NULL;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  173  
f5d26fa31ed2e2 Kent Overstreet 2023-10-25 @174  	list_for_each_entry(s, &c->fsck_error_msgs, list)
dbb9936b0dc905 Kent Overstreet 2022-09-25  175  		if (s->fmt == fmt) {
dbb9936b0dc905 Kent Overstreet 2022-09-25  176  			/*
dbb9936b0dc905 Kent Overstreet 2022-09-25  177  			 * move it to the head of the list: repeated fsck errors
dbb9936b0dc905 Kent Overstreet 2022-09-25  178  			 * are common
dbb9936b0dc905 Kent Overstreet 2022-09-25  179  			 */
f5d26fa31ed2e2 Kent Overstreet 2023-10-25  180  			list_move(&s->list, &c->fsck_error_msgs);
dbb9936b0dc905 Kent Overstreet 2022-09-25  181  			return s;
dbb9936b0dc905 Kent Overstreet 2022-09-25  182  		}
1c6fdbd8f2465d Kent Overstreet 2017-03-16  183  
beb6db68a555d1 Kent Overstreet 2020-05-28  184  	s = kzalloc(sizeof(*s), GFP_NOFS);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  185  	if (!s) {
f5d26fa31ed2e2 Kent Overstreet 2023-10-25  186  		if (!c->fsck_alloc_msgs_err)
1c6fdbd8f2465d Kent Overstreet 2017-03-16  187  			bch_err(c, "kmalloc err, cannot ratelimit fsck errs");
f5d26fa31ed2e2 Kent Overstreet 2023-10-25  188  		c->fsck_alloc_msgs_err = true;
dbb9936b0dc905 Kent Overstreet 2022-09-25  189  		return NULL;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  190  	}
1c6fdbd8f2465d Kent Overstreet 2017-03-16  191  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  192  	INIT_LIST_HEAD(&s->list);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  193  	s->fmt = fmt;
f5d26fa31ed2e2 Kent Overstreet 2023-10-25  194  	list_add(&s->list, &c->fsck_error_msgs);
dbb9936b0dc905 Kent Overstreet 2022-09-25  195  	return s;
dbb9936b0dc905 Kent Overstreet 2022-09-25  196  }
dbb9936b0dc905 Kent Overstreet 2022-09-25  197  
19391b92947c75 Kent Overstreet 2024-03-28  198  /* s/fix?/fixing/ s/recreate?/recreating/ */
19391b92947c75 Kent Overstreet 2024-03-28  199  static void prt_actioning(struct printbuf *out, const char *action)
19391b92947c75 Kent Overstreet 2024-03-28  200  {
19391b92947c75 Kent Overstreet 2024-03-28  201  	unsigned len = strlen(action);
19391b92947c75 Kent Overstreet 2024-03-28  202  
19391b92947c75 Kent Overstreet 2024-03-28  203  	BUG_ON(action[len - 1] != '?');
19391b92947c75 Kent Overstreet 2024-03-28  204  	--len;
19391b92947c75 Kent Overstreet 2024-03-28  205  
19391b92947c75 Kent Overstreet 2024-03-28  206  	if (action[len - 1] == 'e')
19391b92947c75 Kent Overstreet 2024-03-28  207  		--len;
19391b92947c75 Kent Overstreet 2024-03-28  208  
19391b92947c75 Kent Overstreet 2024-03-28  209  	prt_bytes(out, action, len);
19391b92947c75 Kent Overstreet 2024-03-28  210  	prt_str(out, "ing");
19391b92947c75 Kent Overstreet 2024-03-28  211  }
19391b92947c75 Kent Overstreet 2024-03-28  212  
3e8013c1506d23 Kent Overstreet 2024-02-08  213  int __bch2_fsck_err(struct bch_fs *c,
3e8013c1506d23 Kent Overstreet 2024-02-08  214  		  struct btree_trans *trans,
b65db750e2bb92 Kent Overstreet 2023-10-24  215  		  enum bch_fsck_flags flags,
b65db750e2bb92 Kent Overstreet 2023-10-24  216  		  enum bch_sb_error_id err,
b65db750e2bb92 Kent Overstreet 2023-10-24  217  		  const char *fmt, ...)
dbb9936b0dc905 Kent Overstreet 2022-09-25  218  {
dbb9936b0dc905 Kent Overstreet 2022-09-25  219  	struct fsck_err_state *s = NULL;
dbb9936b0dc905 Kent Overstreet 2022-09-25  220  	va_list args;
22f51621335837 Kent Overstreet 2022-10-09  221  	bool print = true, suppressing = false, inconsistent = false;
dbb9936b0dc905 Kent Overstreet 2022-09-25  222  	struct printbuf buf = PRINTBUF, *out = &buf;
dbb9936b0dc905 Kent Overstreet 2022-09-25  223  	int ret = -BCH_ERR_fsck_ignore;
19391b92947c75 Kent Overstreet 2024-03-28  224  	const char *action_orig = "fix?", *action = action_orig;
dbb9936b0dc905 Kent Overstreet 2022-09-25  225  
3e8013c1506d23 Kent Overstreet 2024-02-08  226  	if (!c)
3e8013c1506d23 Kent Overstreet 2024-02-08  227  		c = trans->c;
3e8013c1506d23 Kent Overstreet 2024-02-08  228  
3e8013c1506d23 Kent Overstreet 2024-02-08  229  	WARN_ON(!trans && bch2_current_has_btree_trans(c));
3e8013c1506d23 Kent Overstreet 2024-02-08  230  
a64a37338d49a7 Kent Overstreet 2024-01-03  231  	if ((flags & FSCK_CAN_FIX) &&
a64a37338d49a7 Kent Overstreet 2024-01-03  232  	    test_bit(err, c->sb.errors_silent))
8b16413cda7c46 Kent Overstreet 2023-12-29  233  		return -BCH_ERR_fsck_fix;
8b16413cda7c46 Kent Overstreet 2023-12-29  234  
b65db750e2bb92 Kent Overstreet 2023-10-24  235  	bch2_sb_error_count(c, err);
b65db750e2bb92 Kent Overstreet 2023-10-24  236  
9c5d38bba03425 Kent Overstreet 2023-02-16  237  	va_start(args, fmt);
9c5d38bba03425 Kent Overstreet 2023-02-16  238  	prt_vprintf(out, fmt, args);
9c5d38bba03425 Kent Overstreet 2023-02-16  239  	va_end(args);
9c5d38bba03425 Kent Overstreet 2023-02-16  240  
19391b92947c75 Kent Overstreet 2024-03-28  241  	/* Custom fix/continue/recreate/etc.? */
19391b92947c75 Kent Overstreet 2024-03-28  242  	if (out->buf[out->pos - 1] == '?') {
19391b92947c75 Kent Overstreet 2024-03-28  243  		const char *p = strrchr(out->buf, ',');
19391b92947c75 Kent Overstreet 2024-03-28 @244  		if (p) {
19391b92947c75 Kent Overstreet 2024-03-28 @245  			out->pos = p - out->buf;
19391b92947c75 Kent Overstreet 2024-03-28  246  			action = kstrdup(p + 2, GFP_KERNEL);
19391b92947c75 Kent Overstreet 2024-03-28  247  			if (!action) {
19391b92947c75 Kent Overstreet 2024-03-28  248  				ret = -ENOMEM;
19391b92947c75 Kent Overstreet 2024-03-28 @249  				goto err;
19391b92947c75 Kent Overstreet 2024-03-28  250  			}
19391b92947c75 Kent Overstreet 2024-03-28  251  		}
19391b92947c75 Kent Overstreet 2024-03-28  252  	}
19391b92947c75 Kent Overstreet 2024-03-28  253  
f5d26fa31ed2e2 Kent Overstreet 2023-10-25  254  	mutex_lock(&c->fsck_error_msgs_lock);
dbb9936b0dc905 Kent Overstreet 2022-09-25  255  	s = fsck_err_get(c, fmt);
dbb9936b0dc905 Kent Overstreet 2022-09-25 @256  	if (s) {
c8d5b714114731 Kent Overstreet 2023-04-25  257  		/*
c8d5b714114731 Kent Overstreet 2023-04-25  258  		 * We may be called multiple times for the same error on
c8d5b714114731 Kent Overstreet 2023-04-25  259  		 * transaction restart - this memoizes instead of asking the user
c8d5b714114731 Kent Overstreet 2023-04-25  260  		 * multiple times for the same error:
c8d5b714114731 Kent Overstreet 2023-04-25  261  		 */
9c5d38bba03425 Kent Overstreet 2023-02-16  262  		if (s->last_msg && !strcmp(buf.buf, s->last_msg)) {
9c5d38bba03425 Kent Overstreet 2023-02-16  263  			ret = s->ret;
f5d26fa31ed2e2 Kent Overstreet 2023-10-25  264  			mutex_unlock(&c->fsck_error_msgs_lock);
19391b92947c75 Kent Overstreet 2024-03-28  265  			goto err;
9c5d38bba03425 Kent Overstreet 2023-02-16  266  		}
9c5d38bba03425 Kent Overstreet 2023-02-16  267  
9c5d38bba03425 Kent Overstreet 2023-02-16  268  		kfree(s->last_msg);
9c5d38bba03425 Kent Overstreet 2023-02-16  269  		s->last_msg = kstrdup(buf.buf, GFP_KERNEL);
19391b92947c75 Kent Overstreet 2024-03-28  270  		if (!s->last_msg) {
19391b92947c75 Kent Overstreet 2024-03-28  271  			mutex_unlock(&c->fsck_error_msgs_lock);
19391b92947c75 Kent Overstreet 2024-03-28  272  			ret = -ENOMEM;
19391b92947c75 Kent Overstreet 2024-03-28  273  			goto err;
19391b92947c75 Kent Overstreet 2024-03-28  274  		}
9c5d38bba03425 Kent Overstreet 2023-02-16  275  
e2ee3eaab72a05 Kent Overstreet 2019-11-06  276  		if (c->opts.ratelimit_errors &&
0806151913dff8 Kent Overstreet 2021-06-21  277  		    !(flags & FSCK_NO_RATELIMIT) &&
e2ee3eaab72a05 Kent Overstreet 2019-11-06  278  		    s->nr >= FSCK_ERR_RATELIMIT_NR) {
e2ee3eaab72a05 Kent Overstreet 2019-11-06  279  			if (s->nr == FSCK_ERR_RATELIMIT_NR)
e2ee3eaab72a05 Kent Overstreet 2019-11-06  280  				suppressing = true;
e2ee3eaab72a05 Kent Overstreet 2019-11-06  281  			else
e2ee3eaab72a05 Kent Overstreet 2019-11-06  282  				print = false;
e2ee3eaab72a05 Kent Overstreet 2019-11-06  283  		}
dbb9936b0dc905 Kent Overstreet 2022-09-25  284  
dbb9936b0dc905 Kent Overstreet 2022-09-25  285  		s->nr++;
dbb9936b0dc905 Kent Overstreet 2022-09-25  286  	}
dbb9936b0dc905 Kent Overstreet 2022-09-25  287  
b2d1d56b1d34bc Kent Overstreet 2022-11-13  288  #ifdef BCACHEFS_LOG_PREFIX
dbb9936b0dc905 Kent Overstreet 2022-09-25  289  	if (!strncmp(fmt, "bcachefs:", 9))
dbb9936b0dc905 Kent Overstreet 2022-09-25  290  		prt_printf(out, bch2_log_msg(c, ""));
b2d1d56b1d34bc Kent Overstreet 2022-11-13  291  #endif
dbb9936b0dc905 Kent Overstreet 2022-09-25  292  
d55ddf6e7a81e1 Kent Overstreet 2023-12-31  293  	if (!test_bit(BCH_FS_fsck_running, &c->flags)) {
dbb9936b0dc905 Kent Overstreet 2022-09-25  294  		if (c->opts.errors != BCH_ON_ERROR_continue ||
dbb9936b0dc905 Kent Overstreet 2022-09-25  295  		    !(flags & (FSCK_CAN_FIX|FSCK_CAN_IGNORE))) {
dbb9936b0dc905 Kent Overstreet 2022-09-25  296  			prt_str(out, ", shutting down");
22f51621335837 Kent Overstreet 2022-10-09  297  			inconsistent = true;
dbb9936b0dc905 Kent Overstreet 2022-09-25  298  			ret = -BCH_ERR_fsck_errors_not_fixed;
dbb9936b0dc905 Kent Overstreet 2022-09-25  299  		} else if (flags & FSCK_CAN_FIX) {
19391b92947c75 Kent Overstreet 2024-03-28  300  			prt_str(out, ", ");
19391b92947c75 Kent Overstreet 2024-03-28  301  			prt_actioning(out, action);
dbb9936b0dc905 Kent Overstreet 2022-09-25  302  			ret = -BCH_ERR_fsck_fix;
dbb9936b0dc905 Kent Overstreet 2022-09-25  303  		} else {
dbb9936b0dc905 Kent Overstreet 2022-09-25  304  			prt_str(out, ", continuing");
dbb9936b0dc905 Kent Overstreet 2022-09-25  305  			ret = -BCH_ERR_fsck_ignore;
dbb9936b0dc905 Kent Overstreet 2022-09-25  306  		}
a0f8faea5f47d6 Kent Overstreet 2023-07-11  307  	} else if (c->opts.fix_errors == FSCK_FIX_exit) {
dbb9936b0dc905 Kent Overstreet 2022-09-25  308  		prt_str(out, ", exiting");
dbb9936b0dc905 Kent Overstreet 2022-09-25  309  		ret = -BCH_ERR_fsck_errors_not_fixed;
0bc166ff564f9e Kent Overstreet 2019-03-28  310  	} else if (flags & FSCK_CAN_FIX) {
853b7393c20d5e Kent Overstreet 2023-04-15  311  		int fix = s && s->fix
853b7393c20d5e Kent Overstreet 2023-04-15  312  			? s->fix
853b7393c20d5e Kent Overstreet 2023-04-15  313  			: c->opts.fix_errors;
853b7393c20d5e Kent Overstreet 2023-04-15  314  
a0f8faea5f47d6 Kent Overstreet 2023-07-11  315  		if (fix == FSCK_FIX_ask) {
19391b92947c75 Kent Overstreet 2024-03-28  316  			prt_str(out, ", ");
19391b92947c75 Kent Overstreet 2024-03-28  317  			prt_str(out, action);
853b7393c20d5e Kent Overstreet 2023-04-15  318  
96f37eabe7a5cb Kent Overstreet 2023-12-31  319  			if (bch2_fs_stdio_redirect(c))
96f37eabe7a5cb Kent Overstreet 2023-12-31  320  				bch2_print(c, "%s", out->buf);
96f37eabe7a5cb Kent Overstreet 2023-12-31 @321  			else
dbb9936b0dc905 Kent Overstreet 2022-09-25  322  				bch2_print_string_as_lines(KERN_ERR, out->buf);
dbb9936b0dc905 Kent Overstreet 2022-09-25  323  			print = false;
853b7393c20d5e Kent Overstreet 2023-04-15  324  
c39351763cb597 Kent Overstreet 2024-05-29  325  			int ask = bch2_fsck_ask_yn(c, trans);
c39351763cb597 Kent Overstreet 2024-05-29  326  
c39351763cb597 Kent Overstreet 2024-05-29 @327  			if (trans) {
c39351763cb597 Kent Overstreet 2024-05-29  328  				ret = bch2_trans_relock(trans);
c39351763cb597 Kent Overstreet 2024-05-29  329  				if (ret) {
c39351763cb597 Kent Overstreet 2024-05-29  330  					mutex_unlock(&c->fsck_error_msgs_lock);
c39351763cb597 Kent Overstreet 2024-05-29  331  					goto err;
c39351763cb597 Kent Overstreet 2024-05-29  332  				}
c39351763cb597 Kent Overstreet 2024-05-29  333  			}
853b7393c20d5e Kent Overstreet 2023-04-15  334  
853b7393c20d5e Kent Overstreet 2023-04-15  335  			if (ask >= YN_ALLNO && s)
853b7393c20d5e Kent Overstreet 2023-04-15  336  				s->fix = ask == YN_ALLNO
a0f8faea5f47d6 Kent Overstreet 2023-07-11  337  					? FSCK_FIX_no
a0f8faea5f47d6 Kent Overstreet 2023-07-11  338  					: FSCK_FIX_yes;
853b7393c20d5e Kent Overstreet 2023-04-15  339  
853b7393c20d5e Kent Overstreet 2023-04-15  340  			ret = ask & 1
dbb9936b0dc905 Kent Overstreet 2022-09-25  341  				? -BCH_ERR_fsck_fix
dbb9936b0dc905 Kent Overstreet 2022-09-25  342  				: -BCH_ERR_fsck_ignore;
a0f8faea5f47d6 Kent Overstreet 2023-07-11  343  		} else if (fix == FSCK_FIX_yes ||
1c6fdbd8f2465d Kent Overstreet 2017-03-16  344  			   (c->opts.nochanges &&
1c6fdbd8f2465d Kent Overstreet 2017-03-16  345  			    !(flags & FSCK_CAN_IGNORE))) {
19391b92947c75 Kent Overstreet 2024-03-28  346  			prt_str(out, ", ");
19391b92947c75 Kent Overstreet 2024-03-28  347  			prt_actioning(out, action);
dbb9936b0dc905 Kent Overstreet 2022-09-25  348  			ret = -BCH_ERR_fsck_fix;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  349  		} else {
19391b92947c75 Kent Overstreet 2024-03-28  350  			prt_str(out, ", not ");
19391b92947c75 Kent Overstreet 2024-03-28  351  			prt_actioning(out, action);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  352  		}
1c6fdbd8f2465d Kent Overstreet 2017-03-16  353  	} else if (flags & FSCK_NEED_FSCK) {
dbb9936b0dc905 Kent Overstreet 2022-09-25  354  		prt_str(out, " (run fsck to correct)");
1c6fdbd8f2465d Kent Overstreet 2017-03-16  355  	} else {
dbb9936b0dc905 Kent Overstreet 2022-09-25  356  		prt_str(out, " (repair unimplemented)");
1c6fdbd8f2465d Kent Overstreet 2017-03-16  357  	}
1c6fdbd8f2465d Kent Overstreet 2017-03-16  358  
dbb9936b0dc905 Kent Overstreet 2022-09-25  359  	if (ret == -BCH_ERR_fsck_ignore &&
a0f8faea5f47d6 Kent Overstreet 2023-07-11  360  	    (c->opts.fix_errors == FSCK_FIX_exit ||
dbb9936b0dc905 Kent Overstreet 2022-09-25  361  	     !(flags & FSCK_CAN_IGNORE)))
dbb9936b0dc905 Kent Overstreet 2022-09-25  362  		ret = -BCH_ERR_fsck_errors_not_fixed;
dbb9936b0dc905 Kent Overstreet 2022-09-25  363  
96f37eabe7a5cb Kent Overstreet 2023-12-31  364  	if (print) {
96f37eabe7a5cb Kent Overstreet 2023-12-31  365  		if (bch2_fs_stdio_redirect(c))
96f37eabe7a5cb Kent Overstreet 2023-12-31  366  			bch2_print(c, "%s\n", out->buf);
96f37eabe7a5cb Kent Overstreet 2023-12-31  367  		else
dbb9936b0dc905 Kent Overstreet 2022-09-25  368  			bch2_print_string_as_lines(KERN_ERR, out->buf);
96f37eabe7a5cb Kent Overstreet 2023-12-31  369  	}
dbb9936b0dc905 Kent Overstreet 2022-09-25  370  
d55ddf6e7a81e1 Kent Overstreet 2023-12-31  371  	if (test_bit(BCH_FS_fsck_running, &c->flags) &&
dbb9936b0dc905 Kent Overstreet 2022-09-25  372  	    (ret != -BCH_ERR_fsck_fix &&
dbb9936b0dc905 Kent Overstreet 2022-09-25  373  	     ret != -BCH_ERR_fsck_ignore))
dbb9936b0dc905 Kent Overstreet 2022-09-25  374  		bch_err(c, "Unable to continue, halting");
dbb9936b0dc905 Kent Overstreet 2022-09-25  375  	else if (suppressing)
1c6fdbd8f2465d Kent Overstreet 2017-03-16  376  		bch_err(c, "Ratelimiting new instances of previous error");
1c6fdbd8f2465d Kent Overstreet 2017-03-16  377  
9c5d38bba03425 Kent Overstreet 2023-02-16  378  	if (s)
9c5d38bba03425 Kent Overstreet 2023-02-16  379  		s->ret = ret;
9c5d38bba03425 Kent Overstreet 2023-02-16  380  
f5d26fa31ed2e2 Kent Overstreet 2023-10-25  381  	mutex_unlock(&c->fsck_error_msgs_lock);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  382  
22f51621335837 Kent Overstreet 2022-10-09  383  	if (inconsistent)
22f51621335837 Kent Overstreet 2022-10-09  384  		bch2_inconsistent_error(c);
22f51621335837 Kent Overstreet 2022-10-09  385  
dbb9936b0dc905 Kent Overstreet 2022-09-25  386  	if (ret == -BCH_ERR_fsck_fix) {
3c471b65889aa2 Kent Overstreet 2023-11-26  387  		set_bit(BCH_FS_errors_fixed, &c->flags);
0bc166ff564f9e Kent Overstreet 2019-03-28  388  	} else {
3c471b65889aa2 Kent Overstreet 2023-11-26  389  		set_bit(BCH_FS_errors_not_fixed, &c->flags);
3c471b65889aa2 Kent Overstreet 2023-11-26  390  		set_bit(BCH_FS_error, &c->flags);
0bc166ff564f9e Kent Overstreet 2019-03-28  391  	}
19391b92947c75 Kent Overstreet 2024-03-28  392  err:
19391b92947c75 Kent Overstreet 2024-03-28  393  	if (action != action_orig)
19391b92947c75 Kent Overstreet 2024-03-28  394  		kfree(action);
19391b92947c75 Kent Overstreet 2024-03-28  395  	printbuf_exit(&buf);
dbb9936b0dc905 Kent Overstreet 2022-09-25  396  	return ret;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  397  }
1c6fdbd8f2465d Kent Overstreet 2017-03-16  398  

:::::: The code at line 134 was first introduced by commit
:::::: 4ee8e4d36e8889b7b8e6380dc0800bead1ad3bd2 bcachefs: twf: convert bch2_stdio_redirect_readline() to darray

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
