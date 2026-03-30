Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3990C3939CC
	for <oe-kbuild@lists.linux.dev>; Mon, 30 Mar 2026 10:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774866057; cv=none; b=PEGfMGKanOTIIoMdrEN8JGKyrXITAqMjoPY9a4sbQf8QfSeiDRJb3ZnFde38XfjqJZFLsDVGoX5GsBDgYudOPDxJRxHkAcJasNQj8VoXh+BiK8f5OjL9qRsSbQZeVPGGRirJCusHUEHdl/eWJryZAg1y6mQ2utTShoyagzcmUvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774866057; c=relaxed/simple;
	bh=8wKAwzwx6iGhSiilQARoY6MNkJIs9OcwIW8dZYY7W58=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TSna+sHPVIUtM/rFVE3aZLx5mAXXVeQ1Iq754nex48pLjWpY3D4DqVLBk6iIQejSzhHHNrmoyyHfF0sAEy4+SH1rkFhJ+hxcM99Y8fFb/ImTvUU59XBmL8z/wxIn/a5hAXwBB6XQn+wWi/CbDCCwNnsySCaMqzxR+XZ1W6RLZn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZqMP4hty; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZqMP4hty"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774866056; x=1806402056;
  h=date:from:to:cc:subject:message-id;
  bh=8wKAwzwx6iGhSiilQARoY6MNkJIs9OcwIW8dZYY7W58=;
  b=ZqMP4hty/zSEB7YwFMgv9WucnvkbTNVyRguttCCgIYnabBm4iJ32Fji+
   Zt1VzgzWrKCTFryJ3CRnElvzaOyv37hw3AoH7qvDHCnEmTCfhR1KyZhae
   Hn9+G/tI0jRkItiWQZvz8rmj5wj+sSTs7/O4k4ym+VFnAJ9hoilk1im+S
   piQff9uRKl7NH679f4QgyR3znOoGNw/SIU1FN7NgKd36NfT3RmvCJJ3zV
   +wDV9VPUVwf4/ZlNs0TE8ldDgZPVeMcyVNzInOHCxqHxnrvKk2wM72pc4
   kRE4qAp8DHt10eKZEgL+e+Fp2elD3uwtalc0dQxbaH0BuppCXzMlw/Eje
   w==;
X-CSE-ConnectionGUID: DwWBa4WeTlOM43XxcnHBmg==
X-CSE-MsgGUID: h71n22QMTcS3nu77a6CVgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="63408939"
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="63408939"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 03:20:54 -0700
X-CSE-ConnectionGUID: 3eCNRVQRTK+7DNvHm0YBEw==
X-CSE-MsgGUID: ibheaIjtSuGV6Ys2YcnXqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="249062512"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 30 Mar 2026 03:20:52 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w79jm-000000000xZ-1YCd;
	Mon, 30 Mar 2026 10:20:50 +0000
Date: Mon, 30 Mar 2026 18:20:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: 
 arch/s390/boot/../../../drivers/s390/char/sclp_early_core.c:107
 sclp_early_print_lm() error: buffer overflow 'ptr' 10 <= 10
Message-ID: <202603301843.imKwqhnk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Sumanth Korikkar <sumanthk@linux.ibm.com>
CC: Vasily Gorbik <gor@linux.ibm.com>
CC: Jens Remus <jremus@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7aaa8047eafd0bd628065b15757d9b48c5f9c07d
commit: 991a20173a1fbafd9fc0df0c7e17bb62d44a4deb s390: Fix linker error when -no-pie option is unavailable
date:   12 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 12 months ago
config: s390-randconfig-r073-20260330 (https://download.01.org/0day-ci/archive/20260330/202603301843.imKwqhnk-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603301843.imKwqhnk-lkp@intel.com/

smatch warnings:
arch/s390/boot/../../../drivers/s390/char/sclp_early_core.c:107 sclp_early_print_lm() error: buffer overflow 'ptr' 10 <= 10

vim +/ptr +107 arch/s390/boot/../../../drivers/s390/char/sclp_early_core.c

d5ab7a34f9bbad drivers/s390/char/sclp_early_core.c Heiko Carstens     2017-01-24   85  
3f975df69dba78 arch/s390/kernel/sclp.c             Sascha Silbe       2015-11-24   86  /* Output multi-line text using SCLP Message interface. */
d5ab7a34f9bbad drivers/s390/char/sclp_early_core.c Heiko Carstens     2017-01-24   87  static void sclp_early_print_lm(const char *str, unsigned int len)
22362a0e23182d arch/s390/kernel/sclp.c             Martin Schwidefsky 2015-07-08   88  {
d5ab7a34f9bbad drivers/s390/char/sclp_early_core.c Heiko Carstens     2017-01-24   89  	unsigned char *ptr, *end, ch;
d5ab7a34f9bbad drivers/s390/char/sclp_early_core.c Heiko Carstens     2017-01-24   90  	unsigned int count, offset;
d5ab7a34f9bbad drivers/s390/char/sclp_early_core.c Heiko Carstens     2017-01-24   91  	struct write_sccb *sccb;
d5ab7a34f9bbad drivers/s390/char/sclp_early_core.c Heiko Carstens     2017-01-24   92  	struct msg_buf *msg;
d5ab7a34f9bbad drivers/s390/char/sclp_early_core.c Heiko Carstens     2017-01-24   93  	struct mdb *mdb;
d5ab7a34f9bbad drivers/s390/char/sclp_early_core.c Heiko Carstens     2017-01-24   94  	struct mto *mto;
d5ab7a34f9bbad drivers/s390/char/sclp_early_core.c Heiko Carstens     2017-01-24   95  	struct go *go;
d5ab7a34f9bbad drivers/s390/char/sclp_early_core.c Heiko Carstens     2017-01-24   96  
087c4d7423989b drivers/s390/char/sclp_early_core.c Gerald Schaefer    2019-04-08   97  	sccb = (struct write_sccb *) sclp_early_sccb;
087c4d7423989b drivers/s390/char/sclp_early_core.c Gerald Schaefer    2019-04-08   98  	end = (unsigned char *) sccb + EARLY_SCCB_SIZE - 1;
d5ab7a34f9bbad drivers/s390/char/sclp_early_core.c Heiko Carstens     2017-01-24   99  	memset(sccb, 0, sizeof(*sccb));
d5ab7a34f9bbad drivers/s390/char/sclp_early_core.c Heiko Carstens     2017-01-24  100  	ptr = (unsigned char *) &sccb->msg.mdb.mto;
d5ab7a34f9bbad drivers/s390/char/sclp_early_core.c Heiko Carstens     2017-01-24  101  	offset = 0;
22362a0e23182d arch/s390/kernel/sclp.c             Martin Schwidefsky 2015-07-08  102  	do {
d5ab7a34f9bbad drivers/s390/char/sclp_early_core.c Heiko Carstens     2017-01-24  103  		for (count = sizeof(*mto); offset < len; count++) {
d5ab7a34f9bbad drivers/s390/char/sclp_early_core.c Heiko Carstens     2017-01-24  104  			ch = str[offset++];
d5ab7a34f9bbad drivers/s390/char/sclp_early_core.c Heiko Carstens     2017-01-24  105  			if ((ch == 0x0a) || (ptr + count > end))
f0319748599183 arch/s390/kernel/sclp.c             Heiko Carstens     2017-01-11  106  				break;
22362a0e23182d arch/s390/kernel/sclp.c             Martin Schwidefsky 2015-07-08 @107  			ptr[count] = _ascebc[ch];
22362a0e23182d arch/s390/kernel/sclp.c             Martin Schwidefsky 2015-07-08  108  		}
d5ab7a34f9bbad drivers/s390/char/sclp_early_core.c Heiko Carstens     2017-01-24  109  		mto = (struct mto *) ptr;
d5ab7a34f9bbad drivers/s390/char/sclp_early_core.c Heiko Carstens     2017-01-24  110  		memset(mto, 0, sizeof(*mto));
d5ab7a34f9bbad drivers/s390/char/sclp_early_core.c Heiko Carstens     2017-01-24  111  		mto->length = count;
d5ab7a34f9bbad drivers/s390/char/sclp_early_core.c Heiko Carstens     2017-01-24  112  		mto->type = 4;
d5ab7a34f9bbad drivers/s390/char/sclp_early_core.c Heiko Carstens     2017-01-24  113  		mto->line_type_flags = LNTPFLGS_ENDTEXT;
22362a0e23182d arch/s390/kernel/sclp.c             Martin Schwidefsky 2015-07-08  114  		ptr += count;
d5ab7a34f9bbad drivers/s390/char/sclp_early_core.c Heiko Carstens     2017-01-24  115  	} while ((offset < len) && (ptr + sizeof(*mto) <= end));
d5ab7a34f9bbad drivers/s390/char/sclp_early_core.c Heiko Carstens     2017-01-24  116  	len = ptr - (unsigned char *) sccb;
d5ab7a34f9bbad drivers/s390/char/sclp_early_core.c Heiko Carstens     2017-01-24  117  	sccb->header.length = len - offsetof(struct write_sccb, header);
d5ab7a34f9bbad drivers/s390/char/sclp_early_core.c Heiko Carstens     2017-01-24  118  	msg = &sccb->msg;
d5ab7a34f9bbad drivers/s390/char/sclp_early_core.c Heiko Carstens     2017-01-24  119  	msg->header.type = EVTYP_MSG;
d5ab7a34f9bbad drivers/s390/char/sclp_early_core.c Heiko Carstens     2017-01-24  120  	msg->header.length = len - offsetof(struct write_sccb, msg.header);
d5ab7a34f9bbad drivers/s390/char/sclp_early_core.c Heiko Carstens     2017-01-24  121  	mdb = &msg->mdb;
d5ab7a34f9bbad drivers/s390/char/sclp_early_core.c Heiko Carstens     2017-01-24  122  	mdb->header.type = 1;
d5ab7a34f9bbad drivers/s390/char/sclp_early_core.c Heiko Carstens     2017-01-24  123  	mdb->header.tag = 0xD4C4C240;
d5ab7a34f9bbad drivers/s390/char/sclp_early_core.c Heiko Carstens     2017-01-24  124  	mdb->header.revision_code = 1;
d5ab7a34f9bbad drivers/s390/char/sclp_early_core.c Heiko Carstens     2017-01-24  125  	mdb->header.length = len - offsetof(struct write_sccb, msg.mdb.header);
d5ab7a34f9bbad drivers/s390/char/sclp_early_core.c Heiko Carstens     2017-01-24  126  	go = &mdb->go;
d5ab7a34f9bbad drivers/s390/char/sclp_early_core.c Heiko Carstens     2017-01-24  127  	go->length = sizeof(*go);
d5ab7a34f9bbad drivers/s390/char/sclp_early_core.c Heiko Carstens     2017-01-24  128  	go->type = 1;
d5ab7a34f9bbad drivers/s390/char/sclp_early_core.c Heiko Carstens     2017-01-24  129  	sclp_early_cmd(SCLP_CMDW_WRITE_EVENT_DATA, sccb);
22362a0e23182d arch/s390/kernel/sclp.c             Martin Schwidefsky 2015-07-08  130  }
22362a0e23182d arch/s390/kernel/sclp.c             Martin Schwidefsky 2015-07-08  131  

:::::: The code at line 107 was first introduced by commit
:::::: 22362a0e23182d230527a5add690b4027860d7d3 s390/sclp: convert early sclp console code to C

:::::: TO: Martin Schwidefsky <schwidefsky@de.ibm.com>
:::::: CC: Martin Schwidefsky <schwidefsky@de.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
