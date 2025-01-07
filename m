Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 105941E284C
	for <oe-kbuild@lists.linux.dev>; Tue,  7 Jan 2025 09:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736243066; cv=none; b=GY/IgZBpEzWG+OWbI21ETv9Dvax1VH5OuQWhPhvBD2OCAdUGosPjkyMOXem+e0mHM84ifaC2K+6u4iwwFrNA3nVmRDs1NIFZu+XFz4QSfHaAubkeIKXMA9CWT1C51h/ghSY8lMeYg0DC3ErrA3SiF8wDzOJAV6xX85tSFdOl9eM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736243066; c=relaxed/simple;
	bh=HFbq1hhH+OO4GE/xACyxwd++4VqDPp6Y/X98YJSwDe4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y4+1MmEXkNux5ZIwxAtr3ZYMeqQqN1cQDead4rXsIbnKXDZyLhstO+4XVwS33sce3MLlbDUafz10i0nzD/97UV/kuczaoHp8dG/N/BKkvwHbZvE67kn6de1SQQx2EZ9A/Uq27aYk6XA4HIAcYG3TRaLnh5p/OhKL0DGjXS9xU5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NWNO6+VW; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NWNO6+VW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736243063; x=1767779063;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HFbq1hhH+OO4GE/xACyxwd++4VqDPp6Y/X98YJSwDe4=;
  b=NWNO6+VWy9FUWYr+EHyty5glTA8I3rsSi9KRO1/lYfO4KmS/94joULLy
   yeuRXMVb64hSjUUhkGntOT9cOR0Gw0MLlqQ0uOayw4DmxDFhUkePPSil1
   AGTO9jzPhWR8+/p2ezi65YiAPwWrsEGejtZOeAnTzDf3dJ5apg/QrWOWF
   PkvtGBEBmzmVSUuLH3yWX+uAm4XLnunp7P5ytVmtif4ztgaD9BycArgjW
   4PTHGbVQpo0icww8/NJ2cfUMisB82HkKhQ3mjPQSoG4OIw8g3ej+HWFC4
   PiY5OiylHSoMg06yJdPhY6jV0Tk0rW2DuEOLJhiufBl2B/UYnYZn0W8v3
   Q==;
X-CSE-ConnectionGUID: wMjgNJxzR9yNZZ1L/PrISw==
X-CSE-MsgGUID: ao867OPYSZya1Vp+CnuhLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="58881758"
X-IronPort-AV: E=Sophos;i="6.12,295,1728975600"; 
   d="scan'208";a="58881758"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 01:44:19 -0800
X-CSE-ConnectionGUID: kwcmx85eTrScaW+B7kETBQ==
X-CSE-MsgGUID: PGZ55D3oSuO0eSeJDRUTsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="133606375"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 07 Jan 2025 01:44:18 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tV68F-000EVR-24;
	Tue, 07 Jan 2025 09:44:15 +0000
Date: Tue, 7 Jan 2025 17:43:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [bytedance:5.15-velinux 1347/1347] kernel/auditsc.c:1643:6-42:
 opportunity for str_yes_no(ctx -> return_valid == AUDITSC_SUCCESS)
Message-ID: <202501071726.IMyyQjnc-lkp@intel.com>
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
TO: jason.zeng@intel.com
TO: lin.x.wang@intel.com
TO: pei.p.jia@intel.com

tree:   https://github.com/bytedance/kernel.git 5.15-velinux
head:   272d9bd3d7e15bb1ad1efac12d9921350f961339
commit: 954975ebae759f482e80f751e11b1f18a7f28baa [1347/1347] audit,io_uring,io-wq: add some basic audit support to io_uring
:::::: branch date: 25 hours ago
:::::: commit date: 5 months ago
config: x86_64-randconfig-101-20250107 (https://download.01.org/0day-ci/archive/20250107/202501071726.IMyyQjnc-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202501071726.IMyyQjnc-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
   kernel/auditsc.c:1686:7-47: opportunity for str_yes_no(context -> return_valid == AUDITSC_SUCCESS)
>> kernel/auditsc.c:1643:6-42: opportunity for str_yes_no(ctx -> return_valid == AUDITSC_SUCCESS)

vim +1643 kernel/auditsc.c

3f1c82502c299da William Roberts 2014-02-11  1626  
954975ebae759f4 Paul Moore      2021-02-16  1627  /**
954975ebae759f4 Paul Moore      2021-02-16  1628   * audit_log_uring - generate a AUDIT_URINGOP record
954975ebae759f4 Paul Moore      2021-02-16  1629   * @ctx: the audit context
954975ebae759f4 Paul Moore      2021-02-16  1630   */
954975ebae759f4 Paul Moore      2021-02-16  1631  static void audit_log_uring(struct audit_context *ctx)
954975ebae759f4 Paul Moore      2021-02-16  1632  {
954975ebae759f4 Paul Moore      2021-02-16  1633  	struct audit_buffer *ab;
954975ebae759f4 Paul Moore      2021-02-16  1634  	const struct cred *cred;
954975ebae759f4 Paul Moore      2021-02-16  1635  
954975ebae759f4 Paul Moore      2021-02-16  1636  	ab = audit_log_start(ctx, GFP_ATOMIC, AUDIT_URINGOP);
954975ebae759f4 Paul Moore      2021-02-16  1637  	if (!ab)
954975ebae759f4 Paul Moore      2021-02-16  1638  		return;
954975ebae759f4 Paul Moore      2021-02-16  1639  	cred = current_cred();
954975ebae759f4 Paul Moore      2021-02-16  1640  	audit_log_format(ab, "uring_op=%d", ctx->uring_op);
954975ebae759f4 Paul Moore      2021-02-16  1641  	if (ctx->return_valid != AUDITSC_INVALID)
954975ebae759f4 Paul Moore      2021-02-16  1642  		audit_log_format(ab, " success=%s exit=%ld",
954975ebae759f4 Paul Moore      2021-02-16 @1643  				 (ctx->return_valid == AUDITSC_SUCCESS ?
954975ebae759f4 Paul Moore      2021-02-16  1644  				  "yes" : "no"),
954975ebae759f4 Paul Moore      2021-02-16  1645  				 ctx->return_code);
954975ebae759f4 Paul Moore      2021-02-16  1646  	audit_log_format(ab,
954975ebae759f4 Paul Moore      2021-02-16  1647  			 " items=%d"
954975ebae759f4 Paul Moore      2021-02-16  1648  			 " ppid=%d pid=%d uid=%u gid=%u euid=%u suid=%u"
954975ebae759f4 Paul Moore      2021-02-16  1649  			 " fsuid=%u egid=%u sgid=%u fsgid=%u",
954975ebae759f4 Paul Moore      2021-02-16  1650  			 ctx->name_count,
954975ebae759f4 Paul Moore      2021-02-16  1651  			 task_ppid_nr(current), task_tgid_nr(current),
954975ebae759f4 Paul Moore      2021-02-16  1652  			 from_kuid(&init_user_ns, cred->uid),
954975ebae759f4 Paul Moore      2021-02-16  1653  			 from_kgid(&init_user_ns, cred->gid),
954975ebae759f4 Paul Moore      2021-02-16  1654  			 from_kuid(&init_user_ns, cred->euid),
954975ebae759f4 Paul Moore      2021-02-16  1655  			 from_kuid(&init_user_ns, cred->suid),
954975ebae759f4 Paul Moore      2021-02-16  1656  			 from_kuid(&init_user_ns, cred->fsuid),
954975ebae759f4 Paul Moore      2021-02-16  1657  			 from_kgid(&init_user_ns, cred->egid),
954975ebae759f4 Paul Moore      2021-02-16  1658  			 from_kgid(&init_user_ns, cred->sgid),
954975ebae759f4 Paul Moore      2021-02-16  1659  			 from_kgid(&init_user_ns, cred->fsgid));
954975ebae759f4 Paul Moore      2021-02-16  1660  	audit_log_task_context(ab);
954975ebae759f4 Paul Moore      2021-02-16  1661  	audit_log_key(ab, ctx->filterkey);
954975ebae759f4 Paul Moore      2021-02-16  1662  	audit_log_end(ab);
954975ebae759f4 Paul Moore      2021-02-16  1663  }
954975ebae759f4 Paul Moore      2021-02-16  1664  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
