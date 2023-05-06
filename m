Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8734816
	for <oe-kbuild@lists.linux.dev>; Sat,  6 May 2023 06:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683354726; x=1714890726;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=psxXLJOsYEi9ijgW+Oa0ih7HccthqErAI8yDvzVsXDg=;
  b=P9r6aD7lC83cCUy0XS+PcluxzVSaf7ttsmjz7Nhs3Ze0Eoa1XQeCQL2r
   J1/DXmCl2LAjYFQ9tdbtO6GZKzMdEVrv/4i0hG9HOF8FpkdEFeJW+8FcN
   2hSsmD9UmP3B1/MgZU+iCuEwtqWGU8ZlDOJiEf/KQkHgl4uDlhFVenLDq
   lLiId8zpBKVz5P/TFqbR+KCmvkTmo34WTdLQ5anEeY8sGkkVK06ZExFjW
   +rvBcvDVS60FCnWIHUiPPdM/5njAMhs/NsuYlfwr64ofVpEeh0O9ouFi3
   4XeZ+G+1jx6tqrx84VMCoq0Ke+Ar+DDDHdo2TV1YvBrqz58QR4Eo8E3SE
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="329708254"
X-IronPort-AV: E=Sophos;i="5.99,254,1677571200"; 
   d="scan'208";a="329708254"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2023 23:32:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="822005982"
X-IronPort-AV: E=Sophos;i="5.99,254,1677571200"; 
   d="scan'208";a="822005982"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 05 May 2023 23:32:04 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pvBSe-00000z-06;
	Sat, 06 May 2023 06:32:04 +0000
Date: Sat, 6 May 2023 14:31:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/xfs/libxfs/xfs_refcount.c:131 xfs_refcount_check_irec() warn:
 impossible condition '(irec->rc_blockcount > (~0)) => (0-u32max > u32max)'
Message-ID: <202305061437.wSZO3yXX-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: "Darrick J. Wong" <djwong@kernel.org>
CC: Dave Chinner <dchinner@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2e1e1337881b0e9844d687982aa54b31b1269b11
commit: 2b30cc0bf0589d1ea0506c019b9b81de77535c87 xfs: standardize ondisk to incore conversion for refcount btrees
date:   3 weeks ago
:::::: branch date: 4 hours ago
:::::: commit date: 3 weeks ago
config: x86_64-randconfig-m001-20230501 (https://download.01.org/0day-ci/archive/20230506/202305061437.wSZO3yXX-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202305061437.wSZO3yXX-lkp@intel.com/

smatch warnings:
fs/xfs/libxfs/xfs_refcount.c:131 xfs_refcount_check_irec() warn: impossible condition '(irec->rc_blockcount > (~0)) => (0-u32max > u32max)'
fs/xfs/libxfs/xfs_refcount.c:141 xfs_refcount_check_irec() warn: impossible condition '(irec->rc_refcount > (~0)) => (0-u32max > u32max)'

vim +131 fs/xfs/libxfs/xfs_refcount.c

174edb0e46e520 Darrick J. Wong 2016-10-03  122  
2b30cc0bf0589d Darrick J. Wong 2023-04-11  123  /* Simple checks for refcount records. */
2b30cc0bf0589d Darrick J. Wong 2023-04-11  124  xfs_failaddr_t
2b30cc0bf0589d Darrick J. Wong 2023-04-11  125  xfs_refcount_check_irec(
2b30cc0bf0589d Darrick J. Wong 2023-04-11  126  	struct xfs_btree_cur		*cur,
2b30cc0bf0589d Darrick J. Wong 2023-04-11  127  	const struct xfs_refcount_irec	*irec)
2b30cc0bf0589d Darrick J. Wong 2023-04-11  128  {
2b30cc0bf0589d Darrick J. Wong 2023-04-11  129  	struct xfs_perag		*pag = cur->bc_ag.pag;
2b30cc0bf0589d Darrick J. Wong 2023-04-11  130  
2b30cc0bf0589d Darrick J. Wong 2023-04-11 @131  	if (irec->rc_blockcount == 0 || irec->rc_blockcount > MAXREFCEXTLEN)
2b30cc0bf0589d Darrick J. Wong 2023-04-11  132  		return __this_address;
2b30cc0bf0589d Darrick J. Wong 2023-04-11  133  
2b30cc0bf0589d Darrick J. Wong 2023-04-11  134  	if (!xfs_refcount_check_domain(irec))
2b30cc0bf0589d Darrick J. Wong 2023-04-11  135  		return __this_address;
2b30cc0bf0589d Darrick J. Wong 2023-04-11  136  
2b30cc0bf0589d Darrick J. Wong 2023-04-11  137  	/* check for valid extent range, including overflow */
2b30cc0bf0589d Darrick J. Wong 2023-04-11  138  	if (!xfs_verify_agbext(pag, irec->rc_startblock, irec->rc_blockcount))
2b30cc0bf0589d Darrick J. Wong 2023-04-11  139  		return __this_address;
2b30cc0bf0589d Darrick J. Wong 2023-04-11  140  
2b30cc0bf0589d Darrick J. Wong 2023-04-11 @141  	if (irec->rc_refcount == 0 || irec->rc_refcount > MAXREFCOUNT)
2b30cc0bf0589d Darrick J. Wong 2023-04-11  142  		return __this_address;
2b30cc0bf0589d Darrick J. Wong 2023-04-11  143  
2b30cc0bf0589d Darrick J. Wong 2023-04-11  144  	return NULL;
2b30cc0bf0589d Darrick J. Wong 2023-04-11  145  }
2b30cc0bf0589d Darrick J. Wong 2023-04-11  146  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
