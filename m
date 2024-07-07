Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B2294C7B
	for <oe-kbuild@lists.linux.dev>; Sun,  7 Jul 2024 09:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720344646; cv=none; b=J2N/ubta1cFZok+b1RhSIeK/H2sTKmQCHn2A/WyZEFhqv4C6HblONvNPk7WEJ9aq9/l9zNdZAeAaJjhAkEnMO7VOKDwmt4ipGxPnvHlkzibsvpEKBZJd8NG42QzYeYTV/STYkLl1QPxSlUPw41q0AzHbSFlY56Yk6f85afoCkEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720344646; c=relaxed/simple;
	bh=JcJyKwoxUxAfYixTBY9e/bmPb66NyvL37eU2Z9oSuh4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kbR7InfUzfAbuRJ6sr2HImqASKnkxZUnPw5m88uFsbWYD01AYJ0O/ced4ljFwuLKr5dxDDABz4skdVxq8mtbTsaKHIQfRRq2K0MXc7qV2R8+eZ4N8BOhWL9HVZ1fkZFG5Eiu501J+G69j/7n61Xk0a2lCymjcgIIv4xj8ZRUeE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yha5Yxwp; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yha5Yxwp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720344645; x=1751880645;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JcJyKwoxUxAfYixTBY9e/bmPb66NyvL37eU2Z9oSuh4=;
  b=Yha5YxwphxvHB97XGR45rycoJJjWByJxLSmWBmguyWggGZwpSHyOWaL7
   CKutZ2Q+M0lCtKTKwv1Gyvt40CZHkxarbfxTiPJJeFU80/6IKROu0kq9j
   VJr5ZmHIfuaYBRc6PMbl/sQLBPAiqtlLlwZx8NZ3rDWlq6ddJSEFKknAX
   UEioNdkHucNVuY+iC0lf9T87wHl+xrVXOfueahJyF1dcXuK7VLTbcnc1k
   k579NzdJzxIDManb2u9LoRNZdq+yKA3R2ZunfH55G0kvnxyeBAxCXuWq8
   87gC0cz9pn9yIIGHhRSXgnufE8YeW96L/BiGW7oPMtt9aGvhIuqY+nRlN
   Q==;
X-CSE-ConnectionGUID: qIZUHxFFRpeVtwbDPlDrzw==
X-CSE-MsgGUID: Ef3VUW8LQPyJTBuBJESj8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11125"; a="28172860"
X-IronPort-AV: E=Sophos;i="6.09,189,1716274800"; 
   d="scan'208";a="28172860"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2024 02:30:44 -0700
X-CSE-ConnectionGUID: izMBrADFS0qsYnuShhMMZQ==
X-CSE-MsgGUID: Zdw7qVroQtCacqUB0GV9vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,189,1716274800"; 
   d="scan'208";a="47901493"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 07 Jul 2024 02:30:42 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sQOEC-000Uny-03;
	Sun, 07 Jul 2024 09:30:40 +0000
Date: Sun, 7 Jul 2024 17:29:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] s390/zcrypt: optimize memory allocation in online_show()
Message-ID: <202407071714.4AUEoeUD-lkp@intel.com>
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
In-Reply-To: <20240623120147.35554-3-yskelg@gmail.com>
References: <20240623120147.35554-3-yskelg@gmail.com>
TO: yskelg@gmail.com
TO: Harald Freudenberger <freude@linux.ibm.com>
TO: Heiko Carstens <hca@linux.ibm.com>
TO: Vasily Gorbik <gor@linux.ibm.com>
TO: Alexander Gordeev <agordeev@linux.ibm.com>
TO: Christian Borntraeger <borntraeger@linux.ibm.com>
TO: Sven Schnelle <svens@linux.ibm.com>
CC: shjy180909@gmail.com
CC: linux-s390@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Yunseong Kim <yskelg@gmail.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on s390/features]
[also build test WARNING on linus/master v6.10-rc6 next-20240703]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/yskelg-gmail-com/s390-zcrypt-optimize-memory-allocation-in-online_show/20240626-071004
base:   https://git.kernel.org/pub/scm/linux/kernel/git/s390/linux.git features
patch link:    https://lore.kernel.org/r/20240623120147.35554-3-yskelg%40gmail.com
patch subject: [PATCH] s390/zcrypt: optimize memory allocation in online_show()
:::::: branch date: 11 days ago
:::::: commit date: 11 days ago
config: s390-randconfig-r081-20240707 (https://download.01.org/0day-ci/archive/20240707/202407071714.4AUEoeUD-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202407071714.4AUEoeUD-lkp@intel.com/

smatch warnings:
drivers/s390/crypto/zcrypt_card.c:103 online_store() warn: iterator used outside loop: 'zq'

vim +/zq +103 drivers/s390/crypto/zcrypt_card.c

e28d2af43614eb Ingo Tuchscherer     2016-08-25   59  
ac2b96f351d7d2 Harald Freudenberger 2018-08-17   60  static ssize_t online_store(struct device *dev,
e28d2af43614eb Ingo Tuchscherer     2016-08-25   61  			    struct device_attribute *attr,
e28d2af43614eb Ingo Tuchscherer     2016-08-25   62  			    const char *buf, size_t count)
e28d2af43614eb Ingo Tuchscherer     2016-08-25   63  {
b5adbbf896d837 Julian Wiedmann      2021-06-07   64  	struct zcrypt_card *zc = dev_get_drvdata(dev);
4f2fcccdb547b0 Harald Freudenberger 2020-07-02   65  	struct ap_card *ac = to_ap_card(dev);
e28d2af43614eb Ingo Tuchscherer     2016-08-25   66  	struct zcrypt_queue *zq;
df6f508c68dbc6 Harald Freudenberger 2021-04-13   67  	int online, id, i = 0, maxzqs = 0;
df6f508c68dbc6 Harald Freudenberger 2021-04-13   68  	struct zcrypt_queue **zq_uelist = NULL;
e28d2af43614eb Ingo Tuchscherer     2016-08-25   69  
e28d2af43614eb Ingo Tuchscherer     2016-08-25   70  	if (sscanf(buf, "%d\n", &online) != 1 || online < 0 || online > 1)
e28d2af43614eb Ingo Tuchscherer     2016-08-25   71  		return -EINVAL;
e28d2af43614eb Ingo Tuchscherer     2016-08-25   72  
cfaef6516e9ac6 Ingo Franzki         2023-10-26   73  	if (online && (!ac->config || ac->chkstop))
4f2fcccdb547b0 Harald Freudenberger 2020-07-02   74  		return -ENODEV;
4f2fcccdb547b0 Harald Freudenberger 2020-07-02   75  
e28d2af43614eb Ingo Tuchscherer     2016-08-25   76  	zc->online = online;
e28d2af43614eb Ingo Tuchscherer     2016-08-25   77  	id = zc->card->id;
cccd85bfb7bf67 Harald Freudenberger 2016-11-24   78  
3f74eb5f78198a Harald Freudenberger 2021-10-15   79  	ZCRYPT_DBF_INFO("%s card=%02x online=%d\n", __func__, id, online);
cccd85bfb7bf67 Harald Freudenberger 2016-11-24   80  
df6f508c68dbc6 Harald Freudenberger 2021-04-13   81  	ap_send_online_uevent(&ac->ap_dev, online);
df6f508c68dbc6 Harald Freudenberger 2021-04-13   82  
e28d2af43614eb Ingo Tuchscherer     2016-08-25   83  	spin_lock(&zcrypt_list_lock);
df6f508c68dbc6 Harald Freudenberger 2021-04-13   84  	/*
df6f508c68dbc6 Harald Freudenberger 2021-04-13   85  	 * As we are in atomic context here, directly sending uevents
df6f508c68dbc6 Harald Freudenberger 2021-04-13   86  	 * does not work. So collect the zqueues in a dynamic array
df6f508c68dbc6 Harald Freudenberger 2021-04-13   87  	 * and process them after zcrypt_list_lock release. As we get/put
df6f508c68dbc6 Harald Freudenberger 2021-04-13   88  	 * the zqueue objects, we make sure they exist after lock release.
df6f508c68dbc6 Harald Freudenberger 2021-04-13   89  	 */
df6f508c68dbc6 Harald Freudenberger 2021-04-13   90  	list_for_each_entry(zq, &zc->zqueues, list)
2ff6be56a27c2d Yunseong Kim         2024-06-23   91  		if (!!zq->online != !!online)
df6f508c68dbc6 Harald Freudenberger 2021-04-13   92  			maxzqs++;
df6f508c68dbc6 Harald Freudenberger 2021-04-13   93  	if (maxzqs > 0)
2ff6be56a27c2d Yunseong Kim         2024-06-23   94  		zq_uelist = kcalloc(maxzqs, sizeof(*zq_uelist), GFP_ATOMIC);
e28d2af43614eb Ingo Tuchscherer     2016-08-25   95  	list_for_each_entry(zq, &zc->zqueues, list)
df6f508c68dbc6 Harald Freudenberger 2021-04-13   96  		if (zcrypt_queue_force_online(zq, online))
df6f508c68dbc6 Harald Freudenberger 2021-04-13   97  			if (zq_uelist) {
df6f508c68dbc6 Harald Freudenberger 2021-04-13   98  				zcrypt_queue_get(zq);
df6f508c68dbc6 Harald Freudenberger 2021-04-13   99  				zq_uelist[i++] = zq;
df6f508c68dbc6 Harald Freudenberger 2021-04-13  100  			}
e28d2af43614eb Ingo Tuchscherer     2016-08-25  101  	spin_unlock(&zcrypt_list_lock);
2ff6be56a27c2d Yunseong Kim         2024-06-23  102  	while (i--) {
df6f508c68dbc6 Harald Freudenberger 2021-04-13 @103  		ap_send_online_uevent(&zq->queue->ap_dev, online);
2ff6be56a27c2d Yunseong Kim         2024-06-23  104  		zcrypt_queue_put(zq_uelist[i]);
df6f508c68dbc6 Harald Freudenberger 2021-04-13  105  	}
df6f508c68dbc6 Harald Freudenberger 2021-04-13  106  	kfree(zq_uelist);
df6f508c68dbc6 Harald Freudenberger 2021-04-13  107  
e28d2af43614eb Ingo Tuchscherer     2016-08-25  108  	return count;
e28d2af43614eb Ingo Tuchscherer     2016-08-25  109  }
e28d2af43614eb Ingo Tuchscherer     2016-08-25  110  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
