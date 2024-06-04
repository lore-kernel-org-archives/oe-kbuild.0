Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888A2A5F
	for <oe-kbuild@lists.linux.dev>; Tue,  4 Jun 2024 18:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717526164; cv=none; b=e81x/otdFcP/z95tsKbnLFUIvKxb4J56MFPDjjwka0oxJGsJQEjz5TejQVmxN6c90akP0leJ82VMNFNWOrXqygqmiPCwKxc79/FNt+VWhto1F1XrYLu7Z3jCqPpTTaJAuvKK57H2ro7RnxWdRoh/cCKPWKuaUTJRw2W5cgRHTa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717526164; c=relaxed/simple;
	bh=NujVhyTJ1BTLwIiZoNHl/dAQ0+e1U8Rd44MAzo3Tp6M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ovuuJ03/lYdlKXJalOwSfr72dK3vJ+wbaAvSR/pZIJC7lLBfee2vjGVAz7qLrkr4HVRCY0dTpCEb7+7QyH6YGsyK5QBoUFlNUDNJMkUGMoEeh6c5/oYDKuYQ3zbmjoyV/krH5Ak0WLXKABIGPH0JJcs0Y0ZKTIG0dxZ9oMXJrwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qd0V/vB2; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qd0V/vB2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717526162; x=1749062162;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NujVhyTJ1BTLwIiZoNHl/dAQ0+e1U8Rd44MAzo3Tp6M=;
  b=Qd0V/vB2RvOmuFm+ZQUMb4hPIhrV3V+8NWwxnHqlQ4l7YpxJpDvauIo3
   l9fG1oCzFd7ZTfzy0Y3Yta3Xv+vOhmcGBQGsPBGetv5V/fyORjZDxBHdW
   UVE26RAmnImZwVVWVtL7SC26K3N0Ym7egCU/vtyoFRiEZ2jqCoRfWBHCc
   qYixhQ+0/NuHi67qaWlSkF4ZtlkE+L4eHoac6TfIubj57ZN5rmC74LYSI
   oJTDNczQamRDph7hBdgvVAS2caI9YB52kmnzsesSGZvyVBXuvwcUQ7YHa
   v3LvBh9DlEf8pNSnBnsciesu19e1DPyQ+wnzTJ+pTc6h9ka/8SGvLHLae
   w==;
X-CSE-ConnectionGUID: DDxSX3FvQvqqb1oVlQGeKw==
X-CSE-MsgGUID: MtPdwq71TraEFdHAP9m9PA==
X-IronPort-AV: E=McAfee;i="6600,9927,11093"; a="13937009"
X-IronPort-AV: E=Sophos;i="6.08,214,1712646000"; 
   d="scan'208";a="13937009"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2024 11:36:01 -0700
X-CSE-ConnectionGUID: HDXOJC7vRgW7gaH/aIt06A==
X-CSE-MsgGUID: WBjZ7OpXTP+Pl3kOeXDpNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,214,1712646000"; 
   d="scan'208";a="37408673"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 04 Jun 2024 11:36:00 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sEZ0o-0000P9-0o;
	Tue, 04 Jun 2024 18:35:58 +0000
Date: Wed, 5 Jun 2024 02:35:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2] Fix issue in mark_buffer_dirty_inode
Message-ID: <202406050218.U7c0DL3C-lkp@intel.com>
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
In-Reply-To: <20240604060636.87652-1-chw1119@hanyang.ac.kr>
References: <20240604060636.87652-1-chw1119@hanyang.ac.kr>
TO: Hyeonwoo Cha <chw1119@hanyang.ac.kr>
TO: david.sterba@suse.com
CC: aivazian.tigran@gmail.com
CC: viro@zeniv.linux.org.uk
CC: brauner@kernel.org
CC: jack@suse.cz
CC: tytso@mit.edu
CC: adilger.kernel@dilger.ca
CC: hirofumi@mail.parknet.co.jp
CC: sfr@canb.auug.org.au
CC: chw1119@hanyang.ac.kr
CC: linux-fsdevel@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-ext4@vger.kernel.org
CC: reiserfs-devel@vger.kernel.org

Hi Hyeonwoo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on brauner-vfs/vfs.all]
[also build test WARNING on linus/master v6.10-rc2 next-20240604]
[cannot apply to jack-fs/for_next tytso-ext4/dev vfs-idmapping/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hyeonwoo-Cha/Fix-issue-in-mark_buffer_dirty_inode/20240604-140958
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
patch link:    https://lore.kernel.org/r/20240604060636.87652-1-chw1119%40hanyang.ac.kr
patch subject: [PATCH v2] Fix issue in mark_buffer_dirty_inode
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: i386-randconfig-141-20240604 (https://download.01.org/0day-ci/archive/20240605/202406050218.U7c0DL3C-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202406050218.U7c0DL3C-lkp@intel.com/

smatch warnings:
fs/buffer.c:673 mark_buffer_dirty_fsync() warn: if statement not indented
fs/buffer.c:682 mark_buffer_dirty_fsync() warn: inconsistent indenting

vim +673 fs/buffer.c

^1da177e4c3f41 Linus Torvalds          2005-04-16  666  
73295b4ed00de6 Hyeonwoo Cha            2024-06-04  667  void mark_buffer_dirty_fsync(struct buffer_head *bh, struct address_space *mapping)
^1da177e4c3f41 Linus Torvalds          2005-04-16  668  {
abc8a8a2c7dc7b Matthew Wilcox (Oracle  2022-12-15  669) 	struct address_space *buffer_mapping = bh->b_folio->mapping;
^1da177e4c3f41 Linus Torvalds          2005-04-16  670  
^1da177e4c3f41 Linus Torvalds          2005-04-16  671  	mark_buffer_dirty(bh);
73295b4ed00de6 Hyeonwoo Cha            2024-06-04  672  
73295b4ed00de6 Hyeonwoo Cha            2024-06-04 @673  	if (bh->b_assoc_map)
73295b4ed00de6 Hyeonwoo Cha            2024-06-04  674          return;
73295b4ed00de6 Hyeonwoo Cha            2024-06-04  675  
600f111ef51dc2 Matthew Wilcox (Oracle  2023-11-17  676) 	if (!mapping->i_private_data) {
600f111ef51dc2 Matthew Wilcox (Oracle  2023-11-17  677)     	mapping->i_private_data = buffer_mapping;
^1da177e4c3f41 Linus Torvalds          2005-04-16  678      } else {
600f111ef51dc2 Matthew Wilcox (Oracle  2023-11-17  679)         BUG_ON(mapping->i_private_data != buffer_mapping);
^1da177e4c3f41 Linus Torvalds          2005-04-16  680      }
73295b4ed00de6 Hyeonwoo Cha            2024-06-04  681  
600f111ef51dc2 Matthew Wilcox (Oracle  2023-11-17 @682)     spin_lock(&buffer_mapping->i_private_lock);
73295b4ed00de6 Hyeonwoo Cha            2024-06-04  683      list_move_tail(&bh->b_assoc_buffers, &mapping->i_private_list);
58ff407bee5a55 Jan Kara                2006-10-17  684      bh->b_assoc_map = mapping;
600f111ef51dc2 Matthew Wilcox (Oracle  2023-11-17  685)     spin_unlock(&buffer_mapping->i_private_lock);
^1da177e4c3f41 Linus Torvalds          2005-04-16  686  }
73295b4ed00de6 Hyeonwoo Cha            2024-06-04  687  EXPORT_SYMBOL(mark_buffer_dirty_fsync);
^1da177e4c3f41 Linus Torvalds          2005-04-16  688  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
