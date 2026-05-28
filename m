Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7944238150
	for <oe-kbuild@lists.linux.dev>; Thu, 28 May 2026 07:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779951853; cv=none; b=jwDRle1+cXabm3xXg/lSqU3CoCo2a08CMT/NQcYiKa78cl3/CAdwwoIejmNpMWoTBpA/m1j2TMPswFGIT8imFYM8OY6PEoCQaAlrRgrN7kdLjP/v+wF6yC73KjC9ro0X5HqURj7icKTbouZIkR2oD78nUO68ZucIDB9N17TVCE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779951853; c=relaxed/simple;
	bh=mp5eC9QcCaWdzObaBsTcJpd9HQya9qhJSNz4iceL6wo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IgyuJ2Pyn3hWwhToN+Fk9aeLNKWtX8xBxjfgHSWRsnyggPacgPTzQaOJL1b09G8T13wfqlhVxUHPve8QlGOaW3jfaTTfNfJRx4cvjkzuWCPGQEa7ppxfnfKK7+II1qO6nMEoBR7B6LR9md1+nVk298HFwOnL5e3AcKY2xL16Y5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EcNCJyJ7; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EcNCJyJ7"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-45edc09f51bso924409f8f.0
        for <oe-kbuild@lists.linux.dev>; Thu, 28 May 2026 00:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779951850; x=1780556650; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6tu8aAu4Ep/N6iy7DCv6X/IZDlC/z4wBdX6VJFzFJkI=;
        b=EcNCJyJ7W4qD+VOJKRYhgR1Fwp0V0pzGoLVQvtOvHnFFhB3WqKxAwzxth0KH6cUMyH
         xrqTuY3V0Ct6Ym2JDwP9Xal/Qj5x43Xxakjy3Axw88he0sskI8YBa7OWe/cRlDigIazk
         uShk9scJpIky0GVv2y8Dw+oMuRXQXfYigKW0UWmu0yW7l3yB29Y39jAIaa3Ch2dFvgsV
         SId0orfh3X4idaGWutO9AtafStDl4V12ddElAeTyz6RiFrLOZLZ1LMnGLZ3ISq07JtOg
         +bIolSBaz6mVX9Dm55m03i0qt0lj2WwcxMK7uMHDJXbqZnvRkaIC9vgbJLUdBuffOxH7
         iyEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779951850; x=1780556650;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6tu8aAu4Ep/N6iy7DCv6X/IZDlC/z4wBdX6VJFzFJkI=;
        b=T9o2ouCStGhdTMhfSg5XS8rKu6xfXBkV3pZuD0jw0/p/hy8IAQZgxHwpAJtlW2DoLg
         BgxMWZY/GPhy0nSEoEIMaVEh48zhImOvaGwtSiQxSBZIsPg1AK0YAnhxXagBwi78ircW
         V5yMVSQtB8BnO220wDwqFnioe/XEN87wVNpWwNDxtYuAmjI6/9TOesAdCnAY8E8OMlxZ
         dOXj4ppR3jeck97XaBt1UIe6vzHI0zhmEplmGnqCx7xg0KVrJ7HKgnSsBcmSjl3dsHYx
         ca3AawUJriqzd1ectmwL5PzoCfyhrDb0X9bOLBGjCR+nYzHmuIiON85O0AyWwFinOojk
         EmjA==
X-Gm-Message-State: AOJu0YzqoGoaUfgn/SqfPjGYQpyStdMXbiHRZPy+sGfowaaXH5bJN/Ay
	Z9Xsxb5UyA3diTXUZp+el1xMtOwgygRNs05tDeXOmaEYZhEqpV7Pl5rlIrIBMw==
X-Gm-Gg: Acq92OEy+2px8DuyYUZEM8s9W0lJ98nSjhPdSmYV0/72GL9MoR5q1m+G11oehduEm9X
	ovRMACy1Dwo+cOCYMF701Gei0BTbqbvWBonbrocSnXYgklfHK7ZookfxVVbQhArNY+MbKwGyiSS
	230LYOX89SobZk4UWv7GAD1gj6vuEABv/tMsoHXby7wmqt31wv/deP1nkhAvokxB+aSQrBr5J7X
	jtDNLqyhiLrN08GW5iWlJ55dr/9EfQiQd+fTocsd7eQqEvI8AceX0pgWr3L1HAt7XgxzXokq+1l
	dWlP87xfNmmX28bLGgPK6wJD1UhuwrZCGNX9wINPZ+0op56cycng4/AzjrlHuIfIYtW28WO1dSz
	JjoTUTlcYI+Dp3KntQhuxI7tU7ftM70S4ZrLZcG65UxlO2oBO2bUpPlQLTKhVGETte1Pet/7HEG
	bqTZXXxgN2V+v9mXWpSv1JenvplZfI2XlTBw==
X-Received: by 2002:a05:600c:1d05:b0:490:890a:da46 with SMTP id 5b1f17b1804b1-490890af5b5mr52642515e9.2.1779951850000;
        Thu, 28 May 2026 00:04:10 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4908eac6042sm9186795e9.21.2026.05.28.00.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 00:04:08 -0700 (PDT)
Date: Thu, 28 May 2026 10:04:05 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, cros-kernel-buildreports@googlegroups.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-lts 2/2] kernel/cgroup/cgroup.c:5863
 cgroup_create() warn: passing zero to 'ERR_PTR'
Message-ID: <202605281519.xhFrIcQD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260528070405.bcEw4VXVdGPIr8v0urqSQoQTgL68Yhgk1K5dcy2ly6w@z>

tree:   https://android.googlesource.com/kernel/common android16-6.12-lts
head:   7d38f5b0e4b0d06970e261174e220a997a0908e7
commit: caeb52b32bd70bc82167f136ab287e2b7a916375 [2/2] ANDROID: cgroup: Use backport reservation for freeze time
config: x86_64-randconfig-161 (https://download.01.org/0day-ci/archive/20260528/202605281519.xhFrIcQD-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605281519.xhFrIcQD-lkp@intel.com/

smatch warnings:
kernel/cgroup/cgroup.c:5863 cgroup_create() warn: passing zero to 'ERR_PTR'

vim +/ERR_PTR +5863 kernel/cgroup/cgroup.c

743210386c0354 kernel/cgroup/cgroup.c Tejun Heo          2019-11-04  5741  static struct cgroup *cgroup_create(struct cgroup *parent, const char *name,
743210386c0354 kernel/cgroup/cgroup.c Tejun Heo          2019-11-04  5742  				    umode_t mode)
ddbcc7e8e50aef kernel/cgroup.c        Paul Menage        2007-10-18  5743  {
a5bca2152036de kernel/cgroup.c        Tejun Heo          2016-03-03  5744  	struct cgroup_root *root = parent->root;
a5bca2152036de kernel/cgroup.c        Tejun Heo          2016-03-03  5745  	struct cgroup *cgrp, *tcgrp;
743210386c0354 kernel/cgroup/cgroup.c Tejun Heo          2019-11-04  5746  	struct kernfs_node *kn;
a5bca2152036de kernel/cgroup.c        Tejun Heo          2016-03-03  5747  	int level = parent->level + 1;
03970d3c11faf8 kernel/cgroup.c        Tejun Heo          2016-03-03  5748  	int ret;
ddbcc7e8e50aef kernel/cgroup.c        Paul Menage        2007-10-18  5749  
0a950f65e1e64f kernel/cgroup.c        Tejun Heo          2012-11-19  5750  	/* allocate the cgroup and its ID, 0 is reserved for the root */
7f203bc89eb66d kernel/cgroup/cgroup.c Tejun Heo          2022-07-29  5751  	cgrp = kzalloc(struct_size(cgrp, ancestors, (level + 1)), GFP_KERNEL);
a5bca2152036de kernel/cgroup.c        Tejun Heo          2016-03-03  5752  	if (!cgrp)
a5bca2152036de kernel/cgroup.c        Tejun Heo          2016-03-03  5753  		return ERR_PTR(-ENOMEM);
0ab02ca8f88790 kernel/cgroup.c        Li Zefan           2014-02-11  5754  
2aad2a86f6685c kernel/cgroup.c        Tejun Heo          2014-09-24  5755  	ret = percpu_ref_init(&cgrp->self.refcnt, css_release, 0, GFP_KERNEL);
9d755d33f0db8c kernel/cgroup.c        Tejun Heo          2014-05-14  5756  	if (ret)
9d755d33f0db8c kernel/cgroup.c        Tejun Heo          2014-05-14  5757  		goto out_free_cgrp;
9d755d33f0db8c kernel/cgroup.c        Tejun Heo          2014-05-14  5758  
c58632b3631cb2 kernel/cgroup/cgroup.c Tejun Heo          2018-04-26  5759  	ret = cgroup_rstat_init(cgrp);
041cd640b2f3c5 kernel/cgroup/cgroup.c Tejun Heo          2017-09-25  5760  	if (ret)
041cd640b2f3c5 kernel/cgroup/cgroup.c Tejun Heo          2017-09-25  5761  		goto out_cancel_ref;
041cd640b2f3c5 kernel/cgroup/cgroup.c Tejun Heo          2017-09-25  5762  
743210386c0354 kernel/cgroup/cgroup.c Tejun Heo          2019-11-04  5763  	/* create the directory */
fe3de0102bc830 kernel/cgroup/cgroup.c Max Kellermann     2023-12-08  5764  	kn = kernfs_create_dir_ns(parent->kn, name, mode,
fe3de0102bc830 kernel/cgroup/cgroup.c Max Kellermann     2023-12-08  5765  				  current_fsuid(), current_fsgid(),
fe3de0102bc830 kernel/cgroup/cgroup.c Max Kellermann     2023-12-08  5766  				  cgrp, NULL);
743210386c0354 kernel/cgroup/cgroup.c Tejun Heo          2019-11-04  5767  	if (IS_ERR(kn)) {
743210386c0354 kernel/cgroup/cgroup.c Tejun Heo          2019-11-04  5768  		ret = PTR_ERR(kn);
041cd640b2f3c5 kernel/cgroup/cgroup.c Tejun Heo          2017-09-25  5769  		goto out_stat_exit;
976c06bcccc505 kernel/cgroup.c        Tejun Heo          2012-11-05  5770  	}
743210386c0354 kernel/cgroup/cgroup.c Tejun Heo          2019-11-04  5771  	cgrp->kn = kn;
976c06bcccc505 kernel/cgroup.c        Tejun Heo          2012-11-05  5772  
cc31edceee04a7 kernel/cgroup.c        Paul Menage        2008-10-18  5773  	init_cgroup_housekeeping(cgrp);
ddbcc7e8e50aef kernel/cgroup.c        Paul Menage        2007-10-18  5774  
9d800df12d3173 kernel/cgroup.c        Tejun Heo          2014-05-14  5775  	cgrp->self.parent = &parent->self;
ba0f4d761503bd kernel/cgroup.c        Tejun Heo          2014-05-13  5776  	cgrp->root = root;
b11cfb5807e303 kernel/cgroup.c        Tejun Heo          2015-11-20  5777  	cgrp->level = level;
2ce7135adc9ad0 kernel/cgroup/cgroup.c Johannes Weiner    2018-10-26  5778  
2ce7135adc9ad0 kernel/cgroup/cgroup.c Johannes Weiner    2018-10-26  5779  	ret = psi_cgroup_alloc(cgrp);
324bda9e6c5add kernel/cgroup/cgroup.c Alexei Starovoitov 2017-10-02  5780  	if (ret)
743210386c0354 kernel/cgroup/cgroup.c Tejun Heo          2019-11-04  5781  		goto out_kernfs_remove;
b11cfb5807e303 kernel/cgroup.c        Tejun Heo          2015-11-20  5782  
f390525e496920 kernel/cgroup/cgroup.c Chen Ridong        2024-10-18  5783  	if (cgrp->root == &cgrp_dfl_root) {
2ce7135adc9ad0 kernel/cgroup/cgroup.c Johannes Weiner    2018-10-26  5784  		ret = cgroup_bpf_inherit(cgrp);
2ce7135adc9ad0 kernel/cgroup/cgroup.c Johannes Weiner    2018-10-26  5785  		if (ret)
2ce7135adc9ad0 kernel/cgroup/cgroup.c Johannes Weiner    2018-10-26  5786  			goto out_psi_free;
f390525e496920 kernel/cgroup/cgroup.c Chen Ridong        2024-10-18  5787  	}
2ce7135adc9ad0 kernel/cgroup/cgroup.c Johannes Weiner    2018-10-26  5788  
caeb52b32bd70b kernel/cgroup/cgroup.c Tiffany Yang       2025-09-13  5789  	cgrp->kmi_ext_info = kzalloc(sizeof(*cgrp->kmi_ext_info), GFP_KERNEL);
caeb52b32bd70b kernel/cgroup/cgroup.c Tiffany Yang       2025-09-13  5790  	if (!cgrp->kmi_ext_info)
caeb52b32bd70b kernel/cgroup/cgroup.c Tiffany Yang       2025-09-13  5791  		goto out_psi_free;

ret = -ENOMEM;

caeb52b32bd70b kernel/cgroup/cgroup.c Tiffany Yang       2025-09-13  5792  
76f969e8948d82 kernel/cgroup/cgroup.c Roman Gushchin     2019-04-19  5793  	/*
76f969e8948d82 kernel/cgroup/cgroup.c Roman Gushchin     2019-04-19  5794  	 * New cgroup inherits effective freeze counter, and
76f969e8948d82 kernel/cgroup/cgroup.c Roman Gushchin     2019-04-19  5795  	 * if the parent has to be frozen, the child has too.
76f969e8948d82 kernel/cgroup/cgroup.c Roman Gushchin     2019-04-19  5796  	 */
76f969e8948d82 kernel/cgroup/cgroup.c Roman Gushchin     2019-04-19  5797  	cgrp->freezer.e_freeze = parent->freezer.e_freeze;
caeb52b32bd70b kernel/cgroup/cgroup.c Tiffany Yang       2025-09-13  5798  	seqcount_init(&cgrp->kmi_ext_info->freezer.freeze_seq);
97a61369830ab0 kernel/cgroup/cgroup.c Roman Gushchin     2019-09-12  5799  	if (cgrp->freezer.e_freeze) {
97a61369830ab0 kernel/cgroup/cgroup.c Roman Gushchin     2019-09-12  5800  		/*
97a61369830ab0 kernel/cgroup/cgroup.c Roman Gushchin     2019-09-12  5801  		 * Set the CGRP_FREEZE flag, so when a process will be
97a61369830ab0 kernel/cgroup/cgroup.c Roman Gushchin     2019-09-12  5802  		 * attached to the child cgroup, it will become frozen.
97a61369830ab0 kernel/cgroup/cgroup.c Roman Gushchin     2019-09-12  5803  		 * At this point the new cgroup is unpopulated, so we can
97a61369830ab0 kernel/cgroup/cgroup.c Roman Gushchin     2019-09-12  5804  		 * consider it frozen immediately.
97a61369830ab0 kernel/cgroup/cgroup.c Roman Gushchin     2019-09-12  5805  		 */
97a61369830ab0 kernel/cgroup/cgroup.c Roman Gushchin     2019-09-12  5806  		set_bit(CGRP_FREEZE, &cgrp->flags);
caeb52b32bd70b kernel/cgroup/cgroup.c Tiffany Yang       2025-09-13  5807  		cgrp->kmi_ext_info->freezer.freeze_start_nsec = ktime_get_ns();
76f969e8948d82 kernel/cgroup/cgroup.c Roman Gushchin     2019-04-19  5808  		set_bit(CGRP_FROZEN, &cgrp->flags);
97a61369830ab0 kernel/cgroup/cgroup.c Roman Gushchin     2019-09-12  5809  	}
76f969e8948d82 kernel/cgroup/cgroup.c Roman Gushchin     2019-04-19  5810  
4dcabece4c3a9f kernel/cgroup/cgroup.c Roman Gushchin     2019-04-19  5811  	spin_lock_irq(&css_set_lock);
0679dee03c6d70 kernel/cgroup/cgroup.c Roman Gushchin     2017-08-02  5812  	for (tcgrp = cgrp; tcgrp; tcgrp = cgroup_parent(tcgrp)) {
7f203bc89eb66d kernel/cgroup/cgroup.c Tejun Heo          2022-07-29  5813  		cgrp->ancestors[tcgrp->level] = tcgrp;
ddbcc7e8e50aef kernel/cgroup.c        Paul Menage        2007-10-18  5814  
76f969e8948d82 kernel/cgroup/cgroup.c Roman Gushchin     2019-04-19  5815  		if (tcgrp != cgrp) {
0679dee03c6d70 kernel/cgroup/cgroup.c Roman Gushchin     2017-08-02  5816  			tcgrp->nr_descendants++;
76f969e8948d82 kernel/cgroup/cgroup.c Roman Gushchin     2019-04-19  5817  
76f969e8948d82 kernel/cgroup/cgroup.c Roman Gushchin     2019-04-19  5818  			/*
76f969e8948d82 kernel/cgroup/cgroup.c Roman Gushchin     2019-04-19  5819  			 * If the new cgroup is frozen, all ancestor cgroups
76f969e8948d82 kernel/cgroup/cgroup.c Roman Gushchin     2019-04-19  5820  			 * get a new frozen descendant, but their state can't
76f969e8948d82 kernel/cgroup/cgroup.c Roman Gushchin     2019-04-19  5821  			 * change because of this.
76f969e8948d82 kernel/cgroup/cgroup.c Roman Gushchin     2019-04-19  5822  			 */
76f969e8948d82 kernel/cgroup/cgroup.c Roman Gushchin     2019-04-19  5823  			if (cgrp->freezer.e_freeze)
76f969e8948d82 kernel/cgroup/cgroup.c Roman Gushchin     2019-04-19  5824  				tcgrp->freezer.nr_frozen_descendants++;
76f969e8948d82 kernel/cgroup/cgroup.c Roman Gushchin     2019-04-19  5825  		}
0679dee03c6d70 kernel/cgroup/cgroup.c Roman Gushchin     2017-08-02  5826  	}
4dcabece4c3a9f kernel/cgroup/cgroup.c Roman Gushchin     2019-04-19  5827  	spin_unlock_irq(&css_set_lock);
0679dee03c6d70 kernel/cgroup/cgroup.c Roman Gushchin     2017-08-02  5828  
b6abdb0e6ca5c2 kernel/cgroup.c        Li Zefan           2008-03-04  5829  	if (notify_on_release(parent))
b6abdb0e6ca5c2 kernel/cgroup.c        Li Zefan           2008-03-04  5830  		set_bit(CGRP_NOTIFY_ON_RELEASE, &cgrp->flags);
b6abdb0e6ca5c2 kernel/cgroup.c        Li Zefan           2008-03-04  5831  
2260e7fc1f18ad kernel/cgroup.c        Tejun Heo          2012-11-19  5832  	if (test_bit(CGRP_CPUSET_CLONE_CHILDREN, &parent->flags))
2260e7fc1f18ad kernel/cgroup.c        Tejun Heo          2012-11-19  5833  		set_bit(CGRP_CPUSET_CLONE_CHILDREN, &cgrp->flags);
97978e6d1f2da0 kernel/cgroup.c        Daniel Lezcano     2010-10-27  5834  
0cb51d71c1fa92 kernel/cgroup.c        Tejun Heo          2014-05-16  5835  	cgrp->self.serial_nr = css_serial_nr_next++;
53fa5261747a90 kernel/cgroup.c        Tejun Heo          2013-05-24  5836  
4e139afc22cb98 kernel/cgroup.c        Tejun Heo          2012-11-19  5837  	/* allocation complete, commit to creation */
d5c419b68e368f kernel/cgroup.c        Tejun Heo          2014-05-16  5838  	list_add_tail_rcu(&cgrp->self.sibling, &cgroup_parent(cgrp)->self.children);
3c9c825b8b50de kernel/cgroup.c        Tejun Heo          2014-02-12  5839  	atomic_inc(&root->nr_cgrps);
a590b90d472f2c kernel/cgroup/cgroup.c Tejun Heo          2017-04-28  5840  	cgroup_get_live(parent);
415cf07a1c1c65 kernel/cgroup.c        Li Zefan           2013-04-08  5841  
bd53d617b34c78 kernel/cgroup.c        Tejun Heo          2014-04-23  5842  	/*
bd53d617b34c78 kernel/cgroup.c        Tejun Heo          2014-04-23  5843  	 * On the default hierarchy, a child doesn't automatically inherit
667c24917144e3 kernel/cgroup.c        Tejun Heo          2014-07-08  5844  	 * subtree_control from the parent.  Each is configured manually.
bd53d617b34c78 kernel/cgroup.c        Tejun Heo          2014-04-23  5845  	 */
03970d3c11faf8 kernel/cgroup.c        Tejun Heo          2016-03-03  5846  	if (!cgroup_on_dfl(cgrp))
5531dc915ba10b kernel/cgroup.c        Tejun Heo          2016-03-03  5847  		cgrp->subtree_control = cgroup_control(cgrp);
03970d3c11faf8 kernel/cgroup.c        Tejun Heo          2016-03-03  5848  
03970d3c11faf8 kernel/cgroup.c        Tejun Heo          2016-03-03  5849  	cgroup_propagate_control(cgrp);
03970d3c11faf8 kernel/cgroup.c        Tejun Heo          2016-03-03  5850  
a5bca2152036de kernel/cgroup.c        Tejun Heo          2016-03-03  5851  	return cgrp;
a5bca2152036de kernel/cgroup.c        Tejun Heo          2016-03-03  5852  
2ce7135adc9ad0 kernel/cgroup/cgroup.c Johannes Weiner    2018-10-26  5853  out_psi_free:
2ce7135adc9ad0 kernel/cgroup/cgroup.c Johannes Weiner    2018-10-26  5854  	psi_cgroup_free(cgrp);
743210386c0354 kernel/cgroup/cgroup.c Tejun Heo          2019-11-04  5855  out_kernfs_remove:
743210386c0354 kernel/cgroup/cgroup.c Tejun Heo          2019-11-04  5856  	kernfs_remove(cgrp->kn);
041cd640b2f3c5 kernel/cgroup/cgroup.c Tejun Heo          2017-09-25  5857  out_stat_exit:
c58632b3631cb2 kernel/cgroup/cgroup.c Tejun Heo          2018-04-26  5858  	cgroup_rstat_exit(cgrp);
a5bca2152036de kernel/cgroup.c        Tejun Heo          2016-03-03  5859  out_cancel_ref:
a5bca2152036de kernel/cgroup.c        Tejun Heo          2016-03-03  5860  	percpu_ref_exit(&cgrp->self.refcnt);
a5bca2152036de kernel/cgroup.c        Tejun Heo          2016-03-03  5861  out_free_cgrp:
a5bca2152036de kernel/cgroup.c        Tejun Heo          2016-03-03  5862  	kfree(cgrp);
a5bca2152036de kernel/cgroup.c        Tejun Heo          2016-03-03 @5863  	return ERR_PTR(ret);
a5bca2152036de kernel/cgroup.c        Tejun Heo          2016-03-03  5864  }

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

