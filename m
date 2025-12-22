Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98EFC3081B8
	for <oe-kbuild@lists.linux.dev>; Mon, 22 Dec 2025 07:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766387999; cv=none; b=BkNXf5qfI919MlzFd4/QPg7S+iIxuq1Zt8bCeuxDRAhZyWybmEd/WYq2Sa0F76mfsp+Y+44y1CVroxr/eBdvxbkLSe8uWuvlufM95OzlUuWNNh/4PJD1dvh2tsjyL/BAHd4XtF7YvwtouHC5gqc3CPGh1n/KB0eRUCdyayidgvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766387999; c=relaxed/simple;
	bh=PeJ/YQ2gbM5tcrABVM+0cDW7cEpr2N4FrYY39nN+DOM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Loyf1IYVDAoD+AkhMJMM80Wqi1gD54PE5PaJyH1IcwDC6/kz+cVM0SIcdxBAx16tyc1imDFjdgnJN8ievIUZn5520/dwhejlThvjuvqoB07fV1so7y79intUb8zLOsl0VGK1A7MwLQeJxfvtz2B13zPQnea4iebs7P20HHgiopY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U7R49YaC; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U7R49YaC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766387997; x=1797923997;
  h=date:from:to:cc:subject:message-id;
  bh=PeJ/YQ2gbM5tcrABVM+0cDW7cEpr2N4FrYY39nN+DOM=;
  b=U7R49YaCChBuYhxtR2zl0dQrJw9vfopvOKHLQ6rHE/Tofc+KnWPkLi2y
   Ka4QHchZ9xOvHMWX9KU/tEvxv52TeeSXxNFUi9v0sZzYsTCVIU6Ky9pgM
   FNKzcEp07g8JApj9HvURam0Q6kTDSCiPNhGYfWTI6qvp1nsV81S+61fn7
   wr5ZK+XNfRxzw44CZj5n5d1qaTwWSdpEOC1iKOdPb75gtJML6kI2jTm0L
   39f3m1NzGgzuimRoi+imAjIafeyTIuSf+lhCKD4jYETDCw8Ncv1+jWF/W
   h5JZ7e6pCqYTibkwtEVhTn4g7ELBIDmEmvcUnVfBtHl9bH3TYAH811cJu
   g==;
X-CSE-ConnectionGUID: z4D+lJSTSFG4s831RMEomQ==
X-CSE-MsgGUID: /I2tRYlWS8ydQvYzjDmO1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="79694345"
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="79694345"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 23:19:57 -0800
X-CSE-ConnectionGUID: vzKmdURqRMacjGP/CxKX+g==
X-CSE-MsgGUID: LQeogU6YTNaWYXF9cXdn8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="222948635"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 21 Dec 2025 23:19:56 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXaCO-000000000CZ-3KAd;
	Mon, 22 Dec 2025 07:19:36 +0000
Date: Mon, 22 Dec 2025 15:18:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/md/md.c:4223 bitmap_type_show() warn: iterator 'i'
 not incremented
Message-ID: <202512221553.0aq2qoJd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Yu Kuai <yukuai3@huawei.com>
CC: Hannes Reinecke <hare@suse.de>
CC: Xiao Ni <xni@redhat.com>
CC: Li Nan <linan122@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9448598b22c50c8a5bb77a9103e2d49f134c9578
commit: 180b82c1c7b2c2c5bffc1642239bed36d7e83f76 md/md-bitmap: add a new sysfs api bitmap_type
date:   4 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 4 months ago
config: nios2-randconfig-r073-20251222 (https://download.01.org/0day-ci/archive/20251222/202512221553.0aq2qoJd-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512221553.0aq2qoJd-lkp@intel.com/

New smatch warnings:
drivers/md/md.c:4223 bitmap_type_show() warn: iterator 'i' not incremented
drivers/md/md.c:4258 bitmap_type_store() warn: iterator 'i' not incremented

Old smatch warnings:
arch/nios2/include/asm/thread_info.h:62 current_thread_info() error: uninitialized symbol 'sp'.
drivers/md/md.c:981 get_pers() warn: iterator 'i' not incremented
drivers/md/md.c:3862 analyze_sbs() warn: iterator 'i' not incremented
drivers/md/md.c:8484 status_personalities() warn: iterator 'i' not incremented

vim +/i +4223 drivers/md/md.c

d981ed8419303e Xiao Ni 2024-09-05  4209  
180b82c1c7b2c2 Yu Kuai 2025-08-29  4210  static ssize_t
180b82c1c7b2c2 Yu Kuai 2025-08-29  4211  bitmap_type_show(struct mddev *mddev, char *page)
180b82c1c7b2c2 Yu Kuai 2025-08-29  4212  {
180b82c1c7b2c2 Yu Kuai 2025-08-29  4213  	struct md_submodule_head *head;
180b82c1c7b2c2 Yu Kuai 2025-08-29  4214  	unsigned long i;
180b82c1c7b2c2 Yu Kuai 2025-08-29  4215  	ssize_t len = 0;
180b82c1c7b2c2 Yu Kuai 2025-08-29  4216  
180b82c1c7b2c2 Yu Kuai 2025-08-29  4217  	if (mddev->bitmap_id == ID_BITMAP_NONE)
180b82c1c7b2c2 Yu Kuai 2025-08-29  4218  		len += sprintf(page + len, "[none] ");
180b82c1c7b2c2 Yu Kuai 2025-08-29  4219  	else
180b82c1c7b2c2 Yu Kuai 2025-08-29  4220  		len += sprintf(page + len, "none ");
180b82c1c7b2c2 Yu Kuai 2025-08-29  4221  
180b82c1c7b2c2 Yu Kuai 2025-08-29  4222  	xa_lock(&md_submodule);
180b82c1c7b2c2 Yu Kuai 2025-08-29 @4223  	xa_for_each(&md_submodule, i, head) {
180b82c1c7b2c2 Yu Kuai 2025-08-29  4224  		if (head->type != MD_BITMAP)
180b82c1c7b2c2 Yu Kuai 2025-08-29  4225  			continue;
180b82c1c7b2c2 Yu Kuai 2025-08-29  4226  
180b82c1c7b2c2 Yu Kuai 2025-08-29  4227  		if (mddev->bitmap_id == head->id)
180b82c1c7b2c2 Yu Kuai 2025-08-29  4228  			len += sprintf(page + len, "[%s] ", head->name);
180b82c1c7b2c2 Yu Kuai 2025-08-29  4229  		else
180b82c1c7b2c2 Yu Kuai 2025-08-29  4230  			len += sprintf(page + len, "%s ", head->name);
180b82c1c7b2c2 Yu Kuai 2025-08-29  4231  	}
180b82c1c7b2c2 Yu Kuai 2025-08-29  4232  	xa_unlock(&md_submodule);
180b82c1c7b2c2 Yu Kuai 2025-08-29  4233  
180b82c1c7b2c2 Yu Kuai 2025-08-29  4234  	len += sprintf(page + len, "\n");
180b82c1c7b2c2 Yu Kuai 2025-08-29  4235  	return len;
180b82c1c7b2c2 Yu Kuai 2025-08-29  4236  }
180b82c1c7b2c2 Yu Kuai 2025-08-29  4237  
180b82c1c7b2c2 Yu Kuai 2025-08-29  4238  static ssize_t
180b82c1c7b2c2 Yu Kuai 2025-08-29  4239  bitmap_type_store(struct mddev *mddev, const char *buf, size_t len)
180b82c1c7b2c2 Yu Kuai 2025-08-29  4240  {
180b82c1c7b2c2 Yu Kuai 2025-08-29  4241  	struct md_submodule_head *head;
180b82c1c7b2c2 Yu Kuai 2025-08-29  4242  	enum md_submodule_id id;
180b82c1c7b2c2 Yu Kuai 2025-08-29  4243  	unsigned long i;
180b82c1c7b2c2 Yu Kuai 2025-08-29  4244  	int err = 0;
180b82c1c7b2c2 Yu Kuai 2025-08-29  4245  
180b82c1c7b2c2 Yu Kuai 2025-08-29  4246  	xa_lock(&md_submodule);
180b82c1c7b2c2 Yu Kuai 2025-08-29  4247  
180b82c1c7b2c2 Yu Kuai 2025-08-29  4248  	if (mddev->bitmap_ops) {
180b82c1c7b2c2 Yu Kuai 2025-08-29  4249  		err = -EBUSY;
180b82c1c7b2c2 Yu Kuai 2025-08-29  4250  		goto out;
180b82c1c7b2c2 Yu Kuai 2025-08-29  4251  	}
180b82c1c7b2c2 Yu Kuai 2025-08-29  4252  
180b82c1c7b2c2 Yu Kuai 2025-08-29  4253  	if (cmd_match(buf, "none")) {
180b82c1c7b2c2 Yu Kuai 2025-08-29  4254  		mddev->bitmap_id = ID_BITMAP_NONE;
180b82c1c7b2c2 Yu Kuai 2025-08-29  4255  		goto out;
180b82c1c7b2c2 Yu Kuai 2025-08-29  4256  	}
180b82c1c7b2c2 Yu Kuai 2025-08-29  4257  
180b82c1c7b2c2 Yu Kuai 2025-08-29 @4258  	xa_for_each(&md_submodule, i, head) {
180b82c1c7b2c2 Yu Kuai 2025-08-29  4259  		if (head->type == MD_BITMAP && cmd_match(buf, head->name)) {
180b82c1c7b2c2 Yu Kuai 2025-08-29  4260  			mddev->bitmap_id = head->id;
180b82c1c7b2c2 Yu Kuai 2025-08-29  4261  			goto out;
180b82c1c7b2c2 Yu Kuai 2025-08-29  4262  		}
180b82c1c7b2c2 Yu Kuai 2025-08-29  4263  	}
180b82c1c7b2c2 Yu Kuai 2025-08-29  4264  
180b82c1c7b2c2 Yu Kuai 2025-08-29  4265  	err = kstrtoint(buf, 10, &id);
180b82c1c7b2c2 Yu Kuai 2025-08-29  4266  	if (err)
180b82c1c7b2c2 Yu Kuai 2025-08-29  4267  		goto out;
180b82c1c7b2c2 Yu Kuai 2025-08-29  4268  
180b82c1c7b2c2 Yu Kuai 2025-08-29  4269  	if (id == ID_BITMAP_NONE) {
180b82c1c7b2c2 Yu Kuai 2025-08-29  4270  		mddev->bitmap_id = id;
180b82c1c7b2c2 Yu Kuai 2025-08-29  4271  		goto out;
180b82c1c7b2c2 Yu Kuai 2025-08-29  4272  	}
180b82c1c7b2c2 Yu Kuai 2025-08-29  4273  
180b82c1c7b2c2 Yu Kuai 2025-08-29  4274  	head = xa_load(&md_submodule, id);
180b82c1c7b2c2 Yu Kuai 2025-08-29  4275  	if (head && head->type == MD_BITMAP) {
180b82c1c7b2c2 Yu Kuai 2025-08-29  4276  		mddev->bitmap_id = id;
180b82c1c7b2c2 Yu Kuai 2025-08-29  4277  		goto out;
180b82c1c7b2c2 Yu Kuai 2025-08-29  4278  	}
180b82c1c7b2c2 Yu Kuai 2025-08-29  4279  
180b82c1c7b2c2 Yu Kuai 2025-08-29  4280  	err = -ENOENT;
180b82c1c7b2c2 Yu Kuai 2025-08-29  4281  
180b82c1c7b2c2 Yu Kuai 2025-08-29  4282  out:
180b82c1c7b2c2 Yu Kuai 2025-08-29  4283  	xa_unlock(&md_submodule);
180b82c1c7b2c2 Yu Kuai 2025-08-29  4284  	return err ? err : len;
180b82c1c7b2c2 Yu Kuai 2025-08-29  4285  }
180b82c1c7b2c2 Yu Kuai 2025-08-29  4286  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
