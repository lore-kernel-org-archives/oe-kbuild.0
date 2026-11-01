Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793576971;
	b=43FlhAxy/uxuNNkqfLlyn5eynb14ZJxrJ1V18plFZFE1x6H0ZjqZPYtoks6wxARN2kA8
	 s9SX032piKcaVRU+Yu7oLk31tfKfAfmWqpiKl7rFJ4OdPIka/x/294Vj/r1zaly5nMcSF
	 iakwOnZma2F02wnQ0eP74BmM9Xab6nh4x90yvN5U5kWeN6hgRLjdnNPtQUBCFrzD/lFH0
	 8085kVbyWisjZkPT6upd2nYAgsPvE9H7uRgcsrOHxQzAcb7FDg45x9jQJlrEda1Df+NjB
	 1/TXyzs/qZNSvyOhMI9QVX3RvlnBjFdgVTPN6NkWkA5sSxLTOEPoZFJvHClGBbrgX1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793576971;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=OjyyUwJ5jRUWleWemQTm3R8rZdXR9gytH+goAhoicWM=;
	b=5VXK3LyaM1KkjqjWP29vF3T60YGpcMvOaFZrF2IPF87aqoUd57zXkw/edOMFKsjeNGOT
	 Pjj9UbYJjxqX51Z6sCBu91qo5C6Eo2X1pz1mucZDkjsIPX7pBZYgyi202Vt+lHQOk9Ppw
	 8QDe91/n7TC8QWd9ZkF7aA9TRqH4CneC70fq03TeMtYdkIQZ8uBmi/S7AZNGBreamZAoX
	 HrrQ4pyok60rH7VSc/LsmCZkA0CxDYwAwqRCHnzTrftCc9pzEuKApCwneu92iGXhYVGSo
	 Kz4STlCULLz2LWbeNfbf5AByoREV33pZrAX2+P3umxiAWVW5oe0xwVVqzR0UTMR74cQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=khrWLjHf;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C51D606A324
	for <oe-kbuild@lists.linux.dev>; Sun,  1 Nov 2026 23:49:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C51D606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=khrWLjHf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793576968; x=1825112968;
  h=date:from:to:cc:subject:message-id;
  bh=W6tGnAHVDJ0zlMpcbJQ8KkIyjorRGWNVE9iE5lh6v+s=;
  b=khrWLjHf5rnUbuigQzWC0Wy8g0yvuDaEspmepVqVUfS0GC0xQu00lYSF
   fAEHp2Uu2bpGnUvlR+pmi7dXAcg3TNG39F8KU6yex8lds6mOaQvqAIkq9
   lx4iDceVNpOfl/KEjxvP/OwuwIPf641DUrf/cgyLg7RBJWsG4yGzmcKsZ
   94PSkGLcYiQw74qOkAH7X137yCSnXTkyXvnd1f55YDhrqY1Qp9GEthU/d
   YSOi61Gju0jATy1716/sBJswKH0QZcZQEEFGs8C+daiIvuy6Fr0QW91uP
   r2BzwMLYOpRV6K3fOXB7y+K18juJ6RRtbRGv9iUHA5O/MQ7EggNSTOHEL
   g==;
X-CSE-ConnectionGUID: HibSA1B+SkWcKbuboudsGw==
X-CSE-MsgGUID: Co9tfsl/RHmCVDbcwT5aTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11953"; a="2143605"
X-IronPort-AV: E=Sophos;i="6.27,190,1787036400"; 
   d="scan'208";a="2143605"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2026 15:49:28 -0800
X-CSE-ConnectionGUID: uapHeGC5R+mINNWDTR4ZmA==
X-CSE-MsgGUID: 5mQJWKpbTGuXuY/LHr53gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,190,1787036400"; 
   d="scan'208";a="5974628"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 01 Nov 2026 15:49:27 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xNfIi-0000000088V-1yeK;
	Sun, 01 Nov 2026 23:49:24 +0000
Date: Mon, 02 Nov 2026 00:48:49 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/hwtracing/stm/core.c:509:8-24: WARNING: stm_fops:
 .write() has stream semantic; safe to change nonseekable_open -> stream_open.
Message-ID: <202611020009.xkUfJUpm-lkp@intel.com>
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
TO: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Suren Baghdasaryan <surenb@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
commit: b0085cb94d2477787f4197a3000e33aabf3d48fc stm: replace deprecated mmap hook with mmap_prepare
date:   7 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 7 months ago
config: mips-randconfig-r2106-20261101 (https://download.01.org/0day-ci/archive/20261102/202611020009.xkUfJUpm-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 8f6b51ca8bab1d49006ddaa042bc7e4e7306975d)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: b0085cb94d24 ("stm: replace deprecated mmap hook with mmap_prepare")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202611020009.xkUfJUpm-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/hwtracing/stm/core.c:509:8-24: WARNING: stm_fops: .write() has stream semantic; safe to change nonseekable_open -> stream_open.

vim +509 drivers/hwtracing/stm/core.c

c7fd62bc69d022 Alexander Shishkin 2018-10-05  484  
7bd1d4093c2fa3 Alexander Shishkin 2015-09-22  485  static int stm_char_open(struct inode *inode, struct file *file)
7bd1d4093c2fa3 Alexander Shishkin 2015-09-22  486  {
7bd1d4093c2fa3 Alexander Shishkin 2015-09-22  487  	struct stm_file *stmf;
7bd1d4093c2fa3 Alexander Shishkin 2015-09-22  488  	struct device *dev;
7bd1d4093c2fa3 Alexander Shishkin 2015-09-22  489  	unsigned int major = imajor(inode);
a0ebf519b8a266 Johan Hovold       2016-11-18  490  	int err = -ENOMEM;
7bd1d4093c2fa3 Alexander Shishkin 2015-09-22  491  
7bd1d4093c2fa3 Alexander Shishkin 2015-09-22  492  	dev = class_find_device(&stm_class, NULL, &major, major_match);
7bd1d4093c2fa3 Alexander Shishkin 2015-09-22  493  	if (!dev)
7bd1d4093c2fa3 Alexander Shishkin 2015-09-22  494  		return -ENODEV;
7bd1d4093c2fa3 Alexander Shishkin 2015-09-22  495  
bf4afc53b77aea Linus Torvalds     2026-02-21  496  	stmf = kzalloc_obj(*stmf);
7bd1d4093c2fa3 Alexander Shishkin 2015-09-22  497  	if (!stmf)
a0ebf519b8a266 Johan Hovold       2016-11-18  498  		goto err_put_device;
7bd1d4093c2fa3 Alexander Shishkin 2015-09-22  499  
a0ebf519b8a266 Johan Hovold       2016-11-18  500  	err = -ENODEV;
cde4ad8368840e Alexander Shishkin 2016-02-15  501  	stm_output_init(&stmf->output);
7bd1d4093c2fa3 Alexander Shishkin 2015-09-22  502  	stmf->stm = to_stm_device(dev);
7bd1d4093c2fa3 Alexander Shishkin 2015-09-22  503  
7bd1d4093c2fa3 Alexander Shishkin 2015-09-22  504  	if (!try_module_get(stmf->stm->owner))
7bd1d4093c2fa3 Alexander Shishkin 2015-09-22  505  		goto err_free;
7bd1d4093c2fa3 Alexander Shishkin 2015-09-22  506  
7bd1d4093c2fa3 Alexander Shishkin 2015-09-22  507  	file->private_data = stmf;
7bd1d4093c2fa3 Alexander Shishkin 2015-09-22  508  
7bd1d4093c2fa3 Alexander Shishkin 2015-09-22 @509  	return nonseekable_open(inode, file);
7bd1d4093c2fa3 Alexander Shishkin 2015-09-22  510  
7bd1d4093c2fa3 Alexander Shishkin 2015-09-22  511  err_free:
a0ebf519b8a266 Johan Hovold       2016-11-18  512  	kfree(stmf);
a0ebf519b8a266 Johan Hovold       2016-11-18  513  err_put_device:
f7c81c7176c72c Alexander Shishkin 2016-02-15  514  	/* matches class_find_device() above */
f7c81c7176c72c Alexander Shishkin 2016-02-15  515  	put_device(dev);
7bd1d4093c2fa3 Alexander Shishkin 2015-09-22  516  
7bd1d4093c2fa3 Alexander Shishkin 2015-09-22  517  	return err;
7bd1d4093c2fa3 Alexander Shishkin 2015-09-22  518  }
7bd1d4093c2fa3 Alexander Shishkin 2015-09-22  519  

:::::: The code at line 509 was first introduced by commit
:::::: 7bd1d4093c2fa37d1ecab05da3c9d48ea2af2264 stm class: Introduce an abstraction for System Trace Module devices

:::::: TO: Alexander Shishkin <alexander.shishkin@linux.intel.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
