Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794563746;
	b=I3NhcOOaNAmrp7mXk32wVRHjYCBOSlRE+EAyaf7zHy6QUry8uc7dgzpKp46zCB/+IgKS
	 mY4yxe/YgD0Tt6kYG/iruGQpEn+MlT+tO4+x+6+4gfpLWeDc0OfBrTG/4cv9skkfsriZp
	 7Zr2+UN7wnCTdJqTLWYUud0CzzgbEjW3UvGh9NZBu+zJwvawlFbZwZoIFTQahaFQi/Le1
	 g86woAgYztJxlxm6mDBF+EicGFA0OxM5kcoXTZ/Bud4VRwj1Zd5qf9xIAt6UcOA8pqNSw
	 Mwlix45/aE+8xQ0bvmrL6rWYu1FlOlLvWr4FzuepKiKJsVCjD9dFdmnveOdQxr0xFjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794563746;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=VPSvNS30JHXxWHw3U5rha+mmfVDwH5HehEyzuEgQxig=;
	b=mwYORwdgCWe/t/TM+iil+JYlM6bY4/MKt2oXFfwcVwvEmBg9mv4+hxM8RgJtfWeU1jLD
	 Lbfy0FnjFqxPH5rkJJiLzz7ngqT2X6ymhhico6UJ9qpChdQyv9o2gGEhjbedM2ECs+hiG
	 2NrFNlhmhz+2JknKELncidg6HhhVDBaJ1cN5TAHx9vYxc8sOv82Ilw30G/CCsIXuLqYid
	 uBytT6kw+K0z9vzem6CSG9KPcR+JfNztEroPl6ngWoyWuhMhq5Fj/ePomQVpBh7M1USgi
	 JGYeZ++8DIWZtRODeYbbL2LIb3oTMdyu0vo5oiHt6zHZzUpMcY3fS/QGk+gckVkSuWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IzaTM4fO;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9961D606A327
	for <oe-kbuild@lists.linux.dev>; Fri, 13 Nov 2026 09:55:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9961D606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IzaTM4fO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794563745; x=1826099745;
  h=date:from:to:cc:subject:message-id;
  bh=FoPQsMMvOtso0j8oY7HYyoOjFCwzjTd9qVU7xHES+P4=;
  b=IzaTM4fOsAXLh1liPK/NfppFcAWW4QStWCW9fte3JVvko6bHs2fyniK8
   uNsWjrAb7K9kBJZkPHFK6rbwa7G+x67AHLwD2a6xVSEqC+vZa345EtTV9
   Ej50CN4tpOgxtWDLu3ncUuR+/TYzFA67pcBVs2Qfbgdjf6XGGOtsbKDSM
   VvcqGYTkGNuvSIbVkJ/24ihc20glRLvqbkbEW5PMt1KJrcxtSD6KeRON+
   DfyG6AFD9nNbBdLnUwUZ47+SgNZHjw5QuYoyMStgQkfaRw1T62rc3cvTV
   S3onQsMGLQYhUf/bvsDiPmXUaeJBXf6f3HlgVy9unySrA0rcevAMtF0ab
   g==;
X-CSE-ConnectionGUID: JAFXuO/FQtqp1rmJaub7hg==
X-CSE-MsgGUID: c2Sq/Qh0QwSQF8Jj5abBzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3283399"
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="3283399"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 01:55:44 -0800
X-CSE-ConnectionGUID: C+Y1uzaAQkuTwwQn+xQ6dg==
X-CSE-MsgGUID: ZcC/OfR0TRe2S3lVbB5F9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="8963982"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 13 Nov 2026 01:55:43 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRo0S-000000001Cb-3OhC;
	Fri, 13 Nov 2026 09:55:40 +0000
Date: Fri, 13 Nov 2026 10:55:16 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [tytso-ext4:pu 26/50] fs/ext4/mmp.c:122 read_mmp_block()
 error: we previously assumed '*bh' could be null (see line 115)
Message-ID: <202611131055.VwNypygU-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-ext4@vger.kernel.org
TO: "Theodore Ts'o" <tytso@mit.edu>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git pu
head:   246d715a48c25a74ac372dda5e10d8f69f89b50a
commit: 4f770ac82ae35cbcdbfb9faa516fee913c18be7e [26/50] ext4: add KUnit tests for fs/ext4/mmp.c
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: powerpc-randconfig-2200-20261112 (https://download.01.org/0day-ci/archive/20261113/202611131055.VwNypygU-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 8621950157210c1fa68f20f0614cb51310ec9dff)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202611131055.VwNypygU-lkp@intel.com/

smatch warnings:
fs/ext4/mmp.c:122 read_mmp_block() error: we previously assumed '*bh' could be null (see line 115)

vim +122 fs/ext4/mmp.c

4f770ac82ae35c Theodore Ts'o   2026-11-11  104  
c5e06d101aaf72 Johann Lombardi 2011-05-24  105  /*
c5e06d101aaf72 Johann Lombardi 2011-05-24  106   * Read the MMP block. It _must_ be read from disk and hence we clear the
c5e06d101aaf72 Johann Lombardi 2011-05-24  107   * uptodate flag on the buffer.
c5e06d101aaf72 Johann Lombardi 2011-05-24  108   */
c5e06d101aaf72 Johann Lombardi 2011-05-24  109  static int read_mmp_block(struct super_block *sb, struct buffer_head **bh,
c5e06d101aaf72 Johann Lombardi 2011-05-24  110  			  ext4_fsblk_t mmp_block)
c5e06d101aaf72 Johann Lombardi 2011-05-24  111  {
c5e06d101aaf72 Johann Lombardi 2011-05-24  112  	struct mmp_struct *mmp;
9810446836ab5a Dan Carpenter   2015-08-15  113  	int ret;
c5e06d101aaf72 Johann Lombardi 2011-05-24  114  
c5e06d101aaf72 Johann Lombardi 2011-05-24 @115  	if (*bh)
c5e06d101aaf72 Johann Lombardi 2011-05-24  116  		clear_buffer_uptodate(*bh);
c5e06d101aaf72 Johann Lombardi 2011-05-24  117  
4f770ac82ae35c Theodore Ts'o   2026-11-11  118  	ret = ext4_mmp_load_bh(sb, bh, mmp_block);
2d069c0889ef0d zhangyi (F      2020-09-24  119) 	if (ret)
9810446836ab5a Dan Carpenter   2015-08-15  120  		goto warn_exit;
2d069c0889ef0d zhangyi (F      2020-09-24  121) 
c5e06d101aaf72 Johann Lombardi 2011-05-24 @122  	mmp = (struct mmp_struct *)((*bh)->b_data);
0304688676bdfc vikram.jadhav07 2016-03-13  123  	if (le32_to_cpu(mmp->mmp_magic) != EXT4_MMP_MAGIC) {
6a797d27378389 Darrick J. Wong 2015-10-17  124  		ret = -EFSCORRUPTED;
0304688676bdfc vikram.jadhav07 2016-03-13  125  		goto warn_exit;
0304688676bdfc vikram.jadhav07 2016-03-13  126  	}
0304688676bdfc vikram.jadhav07 2016-03-13  127  	if (!ext4_mmp_csum_verify(sb, mmp)) {
6a797d27378389 Darrick J. Wong 2015-10-17  128  		ret = -EFSBADCRC;
0304688676bdfc vikram.jadhav07 2016-03-13  129  		goto warn_exit;
0304688676bdfc vikram.jadhav07 2016-03-13  130  	}
c5e06d101aaf72 Johann Lombardi 2011-05-24  131  	return 0;
9810446836ab5a Dan Carpenter   2015-08-15  132  warn_exit:
0304688676bdfc vikram.jadhav07 2016-03-13  133  	brelse(*bh);
0304688676bdfc vikram.jadhav07 2016-03-13  134  	*bh = NULL;
9810446836ab5a Dan Carpenter   2015-08-15  135  	ext4_warning(sb, "Error %d while reading MMP block %llu",
9810446836ab5a Dan Carpenter   2015-08-15  136  		     ret, mmp_block);
9810446836ab5a Dan Carpenter   2015-08-15  137  	return ret;
c5e06d101aaf72 Johann Lombardi 2011-05-24  138  }
c5e06d101aaf72 Johann Lombardi 2011-05-24  139  

:::::: The code at line 122 was first introduced by commit
:::::: c5e06d101aaf72f1f2192a661414459775e9bd74 ext4: add support for multiple mount protection

:::::: TO: Johann Lombardi <johann@whamcloud.com>
:::::: CC: Theodore Ts'o <tytso@mit.edu>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
