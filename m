Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793178497;
	b=Hpjj2X56fAB7ysPk5V0LwETwp82kS8iWks8JGIC+lBKsuWnSMc9VQLL9RM8OzZw9XlOP
	 baBtWsxxiTk0ZBEA5wzXlnyUo2zAOIeiWGHUxV2e6A3xtVbLl6CqY4lJRthhC4ZYR/iRC
	 W+adC8qXi9cNeDpNRkWejTXNpGlmvVFUY8fXJWI2ogfTnj6nmb4KQRncR/CP/o22CnU+h
	 hcuGyX84papC7SuunZumCNxGtz0o4JQWtvIqOTU5vPcRg8G8cu76wyFHDIKSzu+N2AC0z
	 BrdBIRfIjDnt2UwLbEjSLzVPjtpxyeyr2lMII29mWI23Y2Wv5eSDNx/Wt+90fEThzCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793178497;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=SEAFJMGsqaf4weWkg7q12JHw0CzeKTGpy3WUZ4G/Qw0=;
	b=2zynbGXqGBVPxZ3cXei81aAXRB1JGP9wsjC5QvwmXZmAIzg67oWD+YhCK9mI/j2CW8CR
	 uyTBene35ayXA6AgAQu5G1MRyJ9NVhLaqjXYEacBIMA/y6s8jkpT/qbO+J1SF5mJ7p8t/
	 E54by6XniJit+Ib5oGN5dbOIjMm7dWWk5U+mMOxaqwiIWGhlj0rinSvzNITtuanpHfuAs
	 VjXzQFV1aQLi/aakZan857Spxldsr5yy+gQT7DrxRO2w9KdotTpZdo8jwHWwgNTl/GmsE
	 bqYAuvvNrss07oCqEnSYD3nvX/e8OONWWnItDW0HN3hGFCrpn+ugWtYRuXL9Iasnc2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=byhU7IUF;
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2190606A321
	for <oe-kbuild@lists.linux.dev>; Wed, 28 Oct 2026 09:08:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2190606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=byhU7IUF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793178497; x=1824714497;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8sSLOfSY+0BIF5mQYHSqhL1ZTay4DOAzxCzvpytYQUA=;
  b=byhU7IUFbM+X5prbJ0ksKGfaLdKzlWHvborq+DtUxSu+w14gpOehN93m
   FTOkkP4vEUrR9cnLIRv6qesxl8s7CYPwqDcMzK9Zmad+UA6IdnErEplXT
   lXfwIgm9jOsZgplOigUmaMk/XkzL56tf5x+GozVdXDTgSYXd6kobZobf6
   S3arWUrZV2dRv3UkMeoRdtBah8BTpGr4FatCAwIvJJaLqELcJVKEeA+7V
   do7ZRQeZljXIPpIEJd/Ed5Wy7zm+05bE3l3Rzy6UN4OwkamW71QZrzyWi
   I5Utwou7+RH6auQmJH61Rv8bBpzDm+X4j8tCTvr0gLYN8l53rR3A3BJZU
   w==;
X-CSE-ConnectionGUID: pLx3/4c2QDytSUo8pKBiwQ==
X-CSE-MsgGUID: ZwUjnasSQumTqMJ+ptfBFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1795258"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1795258"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 02:08:17 -0700
X-CSE-ConnectionGUID: 3c1yxRrdSEik/Hiw1P+SHA==
X-CSE-MsgGUID: 8GSAgj/VRQu9rgHwXmRq5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="5139241"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 28 Oct 2026 02:08:14 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLzdj-00000000YVU-46Wp;
	Wed, 28 Oct 2026 09:08:11 +0000
Date: Wed, 28 Oct 2026 17:08:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] btrfs: reject refs=0 subvolume without DEAD in
 SUBVOL_SYNC_WAIT
Message-ID: <202610281947.o4BnnSni-lkp@intel.com>
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "likely FALSE maybe-used-uninitialized warning on old compiler"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20261025180258.349175-1-teel4res@gmail.com>
References: <20261025180258.349175-1-teel4res@gmail.com>
TO: Cheng Yongkang <teel4res@gmail.com>
TO: David Sterba <dsterba@suse.com>
CC: Chris Mason <chris.mason@fusionio.com>
CC: linux-btrfs@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Cheng Yongkang <teel4res@gmail.com>

Hi Cheng,

kernel test robot noticed the following build warnings:

[auto build test WARNING on kdave/for-next]
[also build test WARNING on btrfs/for-next linus/master v7.3 next-20261027]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Cheng-Yongkang/btrfs-reject-refs-0-subvolume-without-DEAD-in-SUBVOL_SYNC_WAIT/20261025-110258
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux.git for-next
patch link:    https://lore.kernel.org/r/20261025180258.349175-1-teel4res%40gmail.com
patch subject: [PATCH] btrfs: reject refs=0 subvolume without DEAD in SUBVOL_SYNC_WAIT
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm-randconfig-1001-20261028 (https://download.01.org/0day-ci/archive/20261028/202610281947.o4BnnSni-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261028/202610281947.o4BnnSni-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610281947.o4BnnSni-lkp@intel.com/

Note: it may well be a FALSE warning. FWIW you are at least aware of it now.
http://gcc.gnu.org/wiki/Better_Uninitialized_Warnings

All warnings (new ones prefixed by >>):

   fs/btrfs/ioctl.c: In function 'btrfs_ioctl_subvol_sync':
>> fs/btrfs/ioctl.c:5158:20: warning: 'root_flags' may be used uninitialized in this function [-Wmaybe-uninitialized]
    5158 |   if (!(root_flags & BTRFS_ROOT_SUBVOL_DEAD)) {
         |        ~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/root_flags +5158 fs/btrfs/ioctl.c

34310c442e175f2 Mark Harmstone 2024-10-22  5041  
6c83d153ed86eb1 David Sterba   2024-10-21  5042  static int btrfs_ioctl_subvol_sync(struct btrfs_fs_info *fs_info, void __user *argp)
6c83d153ed86eb1 David Sterba   2024-10-21  5043  {
6c83d153ed86eb1 David Sterba   2024-10-21  5044  	struct btrfs_root *root;
6c83d153ed86eb1 David Sterba   2024-10-21  5045  	struct btrfs_ioctl_subvol_wait args = { 0 };
6c83d153ed86eb1 David Sterba   2024-10-21  5046  	signed long sched_ret;
6c83d153ed86eb1 David Sterba   2024-10-21  5047  	int refs;
6c83d153ed86eb1 David Sterba   2024-10-21  5048  	u64 root_flags;
6c83d153ed86eb1 David Sterba   2024-10-21  5049  	bool wait_for_deletion = false;
6c83d153ed86eb1 David Sterba   2024-10-21  5050  	bool found = false;
6c83d153ed86eb1 David Sterba   2024-10-21  5051  
6c83d153ed86eb1 David Sterba   2024-10-21  5052  	if (copy_from_user(&args, argp, sizeof(args)))
6c83d153ed86eb1 David Sterba   2024-10-21  5053  		return -EFAULT;
6c83d153ed86eb1 David Sterba   2024-10-21  5054  
6c83d153ed86eb1 David Sterba   2024-10-21  5055  	switch (args.mode) {
6c83d153ed86eb1 David Sterba   2024-10-21  5056  	case BTRFS_SUBVOL_SYNC_WAIT_FOR_QUEUED:
6c83d153ed86eb1 David Sterba   2024-10-21  5057  		/*
6c83d153ed86eb1 David Sterba   2024-10-21  5058  		 * Wait for the first one deleted that waits until all previous
6c83d153ed86eb1 David Sterba   2024-10-21  5059  		 * are cleaned.
6c83d153ed86eb1 David Sterba   2024-10-21  5060  		 */
6c83d153ed86eb1 David Sterba   2024-10-21  5061  		spin_lock(&fs_info->trans_lock);
6c83d153ed86eb1 David Sterba   2024-10-21  5062  		if (!list_empty(&fs_info->dead_roots)) {
6c83d153ed86eb1 David Sterba   2024-10-21  5063  			root = list_last_entry(&fs_info->dead_roots,
6c83d153ed86eb1 David Sterba   2024-10-21  5064  					       struct btrfs_root, root_list);
6c83d153ed86eb1 David Sterba   2024-10-21  5065  			args.subvolid = btrfs_root_id(root);
6c83d153ed86eb1 David Sterba   2024-10-21  5066  			found = true;
6c83d153ed86eb1 David Sterba   2024-10-21  5067  		}
6c83d153ed86eb1 David Sterba   2024-10-21  5068  		spin_unlock(&fs_info->trans_lock);
6c83d153ed86eb1 David Sterba   2024-10-21  5069  		if (!found)
6c83d153ed86eb1 David Sterba   2024-10-21  5070  			return -ENOENT;
6c83d153ed86eb1 David Sterba   2024-10-21  5071  
6c83d153ed86eb1 David Sterba   2024-10-21  5072  		fallthrough;
6c83d153ed86eb1 David Sterba   2024-10-21  5073  	case BTRFS_SUBVOL_SYNC_WAIT_FOR_ONE:
6c83d153ed86eb1 David Sterba   2024-10-21  5074  		if ((0 < args.subvolid && args.subvolid < BTRFS_FIRST_FREE_OBJECTID) ||
6c83d153ed86eb1 David Sterba   2024-10-21  5075  		    BTRFS_LAST_FREE_OBJECTID < args.subvolid)
6c83d153ed86eb1 David Sterba   2024-10-21  5076  			return -EINVAL;
6c83d153ed86eb1 David Sterba   2024-10-21  5077  		break;
6c83d153ed86eb1 David Sterba   2024-10-21  5078  	case BTRFS_SUBVOL_SYNC_COUNT:
6c83d153ed86eb1 David Sterba   2024-10-21  5079  		spin_lock(&fs_info->trans_lock);
6c83d153ed86eb1 David Sterba   2024-10-21  5080  		args.count = list_count_nodes(&fs_info->dead_roots);
6c83d153ed86eb1 David Sterba   2024-10-21  5081  		spin_unlock(&fs_info->trans_lock);
6c83d153ed86eb1 David Sterba   2024-10-21  5082  		if (copy_to_user(argp, &args, sizeof(args)))
6c83d153ed86eb1 David Sterba   2024-10-21  5083  			return -EFAULT;
6c83d153ed86eb1 David Sterba   2024-10-21  5084  		return 0;
6c83d153ed86eb1 David Sterba   2024-10-21  5085  	case BTRFS_SUBVOL_SYNC_PEEK_FIRST:
6c83d153ed86eb1 David Sterba   2024-10-21  5086  		spin_lock(&fs_info->trans_lock);
6c83d153ed86eb1 David Sterba   2024-10-21  5087  		/* Last in the list was deleted first. */
6c83d153ed86eb1 David Sterba   2024-10-21  5088  		if (!list_empty(&fs_info->dead_roots)) {
6c83d153ed86eb1 David Sterba   2024-10-21  5089  			root = list_last_entry(&fs_info->dead_roots,
6c83d153ed86eb1 David Sterba   2024-10-21  5090  					       struct btrfs_root, root_list);
6c83d153ed86eb1 David Sterba   2024-10-21  5091  			args.subvolid = btrfs_root_id(root);
6c83d153ed86eb1 David Sterba   2024-10-21  5092  		} else {
6c83d153ed86eb1 David Sterba   2024-10-21  5093  			args.subvolid = 0;
6c83d153ed86eb1 David Sterba   2024-10-21  5094  		}
6c83d153ed86eb1 David Sterba   2024-10-21  5095  		spin_unlock(&fs_info->trans_lock);
6c83d153ed86eb1 David Sterba   2024-10-21  5096  		if (copy_to_user(argp, &args, sizeof(args)))
6c83d153ed86eb1 David Sterba   2024-10-21  5097  			return -EFAULT;
6c83d153ed86eb1 David Sterba   2024-10-21  5098  		return 0;
6c83d153ed86eb1 David Sterba   2024-10-21  5099  	case BTRFS_SUBVOL_SYNC_PEEK_LAST:
6c83d153ed86eb1 David Sterba   2024-10-21  5100  		spin_lock(&fs_info->trans_lock);
6c83d153ed86eb1 David Sterba   2024-10-21  5101  		/* First in the list was deleted last. */
6c83d153ed86eb1 David Sterba   2024-10-21  5102  		if (!list_empty(&fs_info->dead_roots)) {
6c83d153ed86eb1 David Sterba   2024-10-21  5103  			root = list_first_entry(&fs_info->dead_roots,
6c83d153ed86eb1 David Sterba   2024-10-21  5104  						struct btrfs_root, root_list);
6c83d153ed86eb1 David Sterba   2024-10-21  5105  			args.subvolid = btrfs_root_id(root);
6c83d153ed86eb1 David Sterba   2024-10-21  5106  		} else {
6c83d153ed86eb1 David Sterba   2024-10-21  5107  			args.subvolid = 0;
6c83d153ed86eb1 David Sterba   2024-10-21  5108  		}
6c83d153ed86eb1 David Sterba   2024-10-21  5109  		spin_unlock(&fs_info->trans_lock);
6c83d153ed86eb1 David Sterba   2024-10-21  5110  		if (copy_to_user(argp, &args, sizeof(args)))
6c83d153ed86eb1 David Sterba   2024-10-21  5111  			return -EFAULT;
6c83d153ed86eb1 David Sterba   2024-10-21  5112  		return 0;
6c83d153ed86eb1 David Sterba   2024-10-21  5113  	default:
6c83d153ed86eb1 David Sterba   2024-10-21  5114  		return -EINVAL;
6c83d153ed86eb1 David Sterba   2024-10-21  5115  	}
6c83d153ed86eb1 David Sterba   2024-10-21  5116  
6c83d153ed86eb1 David Sterba   2024-10-21  5117  	/* 32bit limitation: fs_roots_radix key is not wide enough. */
6c83d153ed86eb1 David Sterba   2024-10-21  5118  	if (sizeof(unsigned long) != sizeof(u64) && args.subvolid > U32_MAX)
6c83d153ed86eb1 David Sterba   2024-10-21  5119  		return -EOVERFLOW;
6c83d153ed86eb1 David Sterba   2024-10-21  5120  
6c83d153ed86eb1 David Sterba   2024-10-21  5121  	while (1) {
6c83d153ed86eb1 David Sterba   2024-10-21  5122  		/* Wait for the specific one. */
6c83d153ed86eb1 David Sterba   2024-10-21  5123  		if (down_read_interruptible(&fs_info->subvol_sem) == -EINTR)
6c83d153ed86eb1 David Sterba   2024-10-21  5124  			return -EINTR;
6c83d153ed86eb1 David Sterba   2024-10-21  5125  		refs = -1;
6c83d153ed86eb1 David Sterba   2024-10-21  5126  		spin_lock(&fs_info->fs_roots_radix_lock);
6c83d153ed86eb1 David Sterba   2024-10-21  5127  		root = radix_tree_lookup(&fs_info->fs_roots_radix,
6c83d153ed86eb1 David Sterba   2024-10-21  5128  					 (unsigned long)args.subvolid);
6c83d153ed86eb1 David Sterba   2024-10-21  5129  		if (root) {
6c83d153ed86eb1 David Sterba   2024-10-21  5130  			spin_lock(&root->root_item_lock);
6c83d153ed86eb1 David Sterba   2024-10-21  5131  			refs = btrfs_root_refs(&root->root_item);
6c83d153ed86eb1 David Sterba   2024-10-21  5132  			root_flags = btrfs_root_flags(&root->root_item);
6c83d153ed86eb1 David Sterba   2024-10-21  5133  			spin_unlock(&root->root_item_lock);
6c83d153ed86eb1 David Sterba   2024-10-21  5134  		}
6c83d153ed86eb1 David Sterba   2024-10-21  5135  		spin_unlock(&fs_info->fs_roots_radix_lock);
6c83d153ed86eb1 David Sterba   2024-10-21  5136  		up_read(&fs_info->subvol_sem);
6c83d153ed86eb1 David Sterba   2024-10-21  5137  
6c83d153ed86eb1 David Sterba   2024-10-21  5138  		/* Subvolume does not exist. */
6c83d153ed86eb1 David Sterba   2024-10-21  5139  		if (!root)
6c83d153ed86eb1 David Sterba   2024-10-21  5140  			return -ENOENT;
6c83d153ed86eb1 David Sterba   2024-10-21  5141  
6c83d153ed86eb1 David Sterba   2024-10-21  5142  		/* Subvolume not deleted at all. */
6c83d153ed86eb1 David Sterba   2024-10-21  5143  		if (refs > 0)
6c83d153ed86eb1 David Sterba   2024-10-21  5144  			return -EEXIST;
6c83d153ed86eb1 David Sterba   2024-10-21  5145  		/* We've waited and now the subvolume is gone. */
6c83d153ed86eb1 David Sterba   2024-10-21  5146  		if (wait_for_deletion && refs == -1) {
6c83d153ed86eb1 David Sterba   2024-10-21  5147  			/* Return the one we waited for as the last one. */
6c83d153ed86eb1 David Sterba   2024-10-21  5148  			if (copy_to_user(argp, &args, sizeof(args)))
6c83d153ed86eb1 David Sterba   2024-10-21  5149  				return -EFAULT;
6c83d153ed86eb1 David Sterba   2024-10-21  5150  			return 0;
6c83d153ed86eb1 David Sterba   2024-10-21  5151  		}
6c83d153ed86eb1 David Sterba   2024-10-21  5152  
6c83d153ed86eb1 David Sterba   2024-10-21  5153  		/* Subvolume not found on the first try (deleted or never existed). */
6c83d153ed86eb1 David Sterba   2024-10-21  5154  		if (refs == -1)
6c83d153ed86eb1 David Sterba   2024-10-21  5155  			return -ENOENT;
6c83d153ed86eb1 David Sterba   2024-10-21  5156  
6c83d153ed86eb1 David Sterba   2024-10-21  5157  		wait_for_deletion = true;
4f501dcacf49cf1 Cheng Yongkang 2026-10-25 @5158  		if (!(root_flags & BTRFS_ROOT_SUBVOL_DEAD)) {
4f501dcacf49cf1 Cheng Yongkang 2026-10-25  5159  			btrfs_err(fs_info,
4f501dcacf49cf1 Cheng Yongkang 2026-10-25  5160  				  "subvol %llu has refs 0 without DEAD flag",
4f501dcacf49cf1 Cheng Yongkang 2026-10-25  5161  				  args.subvolid);
4f501dcacf49cf1 Cheng Yongkang 2026-10-25  5162  			return -EUCLEAN;
4f501dcacf49cf1 Cheng Yongkang 2026-10-25  5163  		}
6c83d153ed86eb1 David Sterba   2024-10-21  5164  		sched_ret = schedule_timeout_interruptible(HZ);
6c83d153ed86eb1 David Sterba   2024-10-21  5165  		/* Early wake up or error. */
6c83d153ed86eb1 David Sterba   2024-10-21  5166  		if (sched_ret != 0)
6c83d153ed86eb1 David Sterba   2024-10-21  5167  			return -EINTR;
6c83d153ed86eb1 David Sterba   2024-10-21  5168  	}
6c83d153ed86eb1 David Sterba   2024-10-21  5169  
6c83d153ed86eb1 David Sterba   2024-10-21  5170  	return 0;
6c83d153ed86eb1 David Sterba   2024-10-21  5171  }
6c83d153ed86eb1 David Sterba   2024-10-21  5172  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
