Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B051331770F
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Dec 2025 18:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765476404; cv=none; b=Zn0wjLyfsP/p7AXQDE+2chJreygahElhsKxK2y2STFg0OpCyB9hjmBr3eAy5d3P/6A/cT7vFlhKkHYH7gobozG3SdnzSV9GnWDdZJA3PQENKZsicPAV43X6gzMuETsOyKcYzbTzNMqYH86sAUcnoTbksuDOIA581y+xT/S4ZzHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765476404; c=relaxed/simple;
	bh=ehNO9pZ1oV5LVL6Z8Kqkz98jo/t0tr2aXkoFSAXeHag=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qPgnkdZgfFIOS8qfLRzOgX3kcjN0z9ViUx7c5wTl1HQgsRFwyrnx0PZCuc2eeieD/xJdJcXPmL32XsAAE2sBjbm6Bbggznc+klg2OkabTegjGhg8pMZnSWQlBDOV6VHihQn2NuM1h6blqd+OOREyPSYHrXfINh9j6l7HZVvizLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZMDY0MzS; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZMDY0MzS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765476401; x=1797012401;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ehNO9pZ1oV5LVL6Z8Kqkz98jo/t0tr2aXkoFSAXeHag=;
  b=ZMDY0MzSIlV/E5L5dynGjAPGQ4U/ECyZrQ6HZ1yNWGcc5lvcnSkBjpWy
   xBMo3GB9tgA8271uNZ3OXRweJBpaR3aW8DqcCDlCMiR9UP3r+H0bFZeHB
   yi0H47VEcwuRkPlXCxMiPZQ7o7SlLOSFCEcFvftfu+9vRZM8WZuemXoKo
   vgHnKZ2gdzVTFe1Gs7CFh0PnH4gKBeb83n4Pwzo1Q7JXEq23IMMtZMjTb
   rIIfVyW+7IZ2B0oXd9zCis6UfmdYnDmQLw5wZqSdKW2BYTkMak46BOef7
   LgRtswgTz739q8FIbSFcQw9PZRiutpaGqWU++WA+8pSJ5kqzc9XomSJ2m
   A==;
X-CSE-ConnectionGUID: 4AmSYZE5RKiQAUH404+GoQ==
X-CSE-MsgGUID: i+gq64u8S4+oGrxk+Aqrjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="66649391"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="66649391"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 10:06:41 -0800
X-CSE-ConnectionGUID: XjlTRsWMShyz83dzFPJrVQ==
X-CSE-MsgGUID: ILw+XA2OSVKxevEs/WoQYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="201334412"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 11 Dec 2025 10:06:39 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTl3k-000000004wn-3Dlt;
	Thu, 11 Dec 2025 18:06:36 +0000
Date: Fri, 12 Dec 2025 02:05:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 2/9] RDMA/rtrs: Add error description to the logs
Message-ID: <202512120133.BuJVeI6M-lkp@intel.com>
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
In-Reply-To: <20251208161513.127049-3-haris.iqbal@ionos.com>
References: <20251208161513.127049-3-haris.iqbal@ionos.com>
TO: Md Haris Iqbal <haris.iqbal@ionos.com>
TO: linux-rdma@vger.kernel.org
CC: bvanassche@acm.org
CC: leon@kernel.org
CC: jgg@ziepe.ca
CC: haris.iqbal@ionos.com
CC: jinpu.wang@ionos.com
CC: grzegorz.prajsner@ionos.com
CC: Kim Zhu <zhu.yanjun@ionos.com>

Hi Md,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rdma/for-next]
[also build test WARNING on linus/master v6.18 next-20251211]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Md-Haris-Iqbal/RDMA-rtrs-srv-fix-SG-mapping/20251209-001817
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma.git for-next
patch link:    https://lore.kernel.org/r/20251208161513.127049-3-haris.iqbal%40ionos.com
patch subject: [PATCH 2/9] RDMA/rtrs: Add error description to the logs
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm-randconfig-r072-20251210 (https://download.01.org/0day-ci/archive/20251212/202512120133.BuJVeI6M-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512120133.BuJVeI6M-lkp@intel.com/

smatch warnings:
drivers/infiniband/ulp/rtrs/rtrs-srv.c:885 process_info_req() warn: passing zero to 'ERR_PTR'

vim +/ERR_PTR +885 drivers/infiniband/ulp/rtrs/rtrs-srv.c

9cb837480424e7 Jack Wang        2020-05-11  807  
9cb837480424e7 Jack Wang        2020-05-11  808  static int process_info_req(struct rtrs_srv_con *con,
9cb837480424e7 Jack Wang        2020-05-11  809  			    struct rtrs_msg_info_req *msg)
9cb837480424e7 Jack Wang        2020-05-11  810  {
d9372794717f44 Vaishali Thakkar 2022-01-05  811  	struct rtrs_path *s = con->c.path;
ae4c81644e9105 Vaishali Thakkar 2022-01-05  812  	struct rtrs_srv_path *srv_path = to_srv_path(s);
9cb837480424e7 Jack Wang        2020-05-11  813  	struct ib_send_wr *reg_wr = NULL;
9cb837480424e7 Jack Wang        2020-05-11  814  	struct rtrs_msg_info_rsp *rsp;
9cb837480424e7 Jack Wang        2020-05-11  815  	struct rtrs_iu *tx_iu;
9cb837480424e7 Jack Wang        2020-05-11  816  	struct ib_reg_wr *rwr;
9cb837480424e7 Jack Wang        2020-05-11  817  	int mri, err;
9cb837480424e7 Jack Wang        2020-05-11  818  	size_t tx_sz;
9cb837480424e7 Jack Wang        2020-05-11  819  
ae4c81644e9105 Vaishali Thakkar 2022-01-05  820  	err = post_recv_path(srv_path);
4693d6b767d6ca Gioh Kim         2021-08-06  821  	if (err) {
94ae3ce9b375c6 Kim Zhu          2025-12-08  822  		rtrs_err(s, "post_recv_path(), err: %d(%pe)\n", err, ERR_PTR(err));
9cb837480424e7 Jack Wang        2020-05-11  823  		return err;
9cb837480424e7 Jack Wang        2020-05-11  824  	}
07c14027295a32 Gioh Kim         2021-05-28  825  
ae4c81644e9105 Vaishali Thakkar 2022-01-05  826  	if (strchr(msg->pathname, '/') || strchr(msg->pathname, '.')) {
ae4c81644e9105 Vaishali Thakkar 2022-01-05  827  		rtrs_err(s, "pathname cannot contain / and .\n");
dea7bb3ad3e08f Md Haris Iqbal   2021-09-22  828  		return -EINVAL;
dea7bb3ad3e08f Md Haris Iqbal   2021-09-22  829  	}
dea7bb3ad3e08f Md Haris Iqbal   2021-09-22  830  
ae4c81644e9105 Vaishali Thakkar 2022-01-05  831  	if (exist_pathname(srv_path->srv->ctx,
ae4c81644e9105 Vaishali Thakkar 2022-01-05  832  			   msg->pathname, &srv_path->srv->paths_uuid)) {
ae4c81644e9105 Vaishali Thakkar 2022-01-05  833  		rtrs_err(s, "pathname is duplicated: %s\n", msg->pathname);
07c14027295a32 Gioh Kim         2021-05-28  834  		return -EPERM;
07c14027295a32 Gioh Kim         2021-05-28  835  	}
ae4c81644e9105 Vaishali Thakkar 2022-01-05  836  	strscpy(srv_path->s.sessname, msg->pathname,
ae4c81644e9105 Vaishali Thakkar 2022-01-05  837  		sizeof(srv_path->s.sessname));
07c14027295a32 Gioh Kim         2021-05-28  838  
ae4c81644e9105 Vaishali Thakkar 2022-01-05  839  	rwr = kcalloc(srv_path->mrs_num, sizeof(*rwr), GFP_KERNEL);
4693d6b767d6ca Gioh Kim         2021-08-06  840  	if (!rwr)
9cb837480424e7 Jack Wang        2020-05-11  841  		return -ENOMEM;
9cb837480424e7 Jack Wang        2020-05-11  842  
9cb837480424e7 Jack Wang        2020-05-11  843  	tx_sz  = sizeof(*rsp);
ae4c81644e9105 Vaishali Thakkar 2022-01-05  844  	tx_sz += sizeof(rsp->desc[0]) * srv_path->mrs_num;
ae4c81644e9105 Vaishali Thakkar 2022-01-05  845  	tx_iu = rtrs_iu_alloc(1, tx_sz, GFP_KERNEL, srv_path->s.dev->ib_dev,
9cb837480424e7 Jack Wang        2020-05-11  846  			       DMA_TO_DEVICE, rtrs_srv_info_rsp_done);
4693d6b767d6ca Gioh Kim         2021-08-06  847  	if (!tx_iu) {
9cb837480424e7 Jack Wang        2020-05-11  848  		err = -ENOMEM;
9cb837480424e7 Jack Wang        2020-05-11  849  		goto rwr_free;
9cb837480424e7 Jack Wang        2020-05-11  850  	}
9cb837480424e7 Jack Wang        2020-05-11  851  
9cb837480424e7 Jack Wang        2020-05-11  852  	rsp = tx_iu->buf;
9cb837480424e7 Jack Wang        2020-05-11  853  	rsp->type = cpu_to_le16(RTRS_MSG_INFO_RSP);
ae4c81644e9105 Vaishali Thakkar 2022-01-05  854  	rsp->sg_cnt = cpu_to_le16(srv_path->mrs_num);
9cb837480424e7 Jack Wang        2020-05-11  855  
ae4c81644e9105 Vaishali Thakkar 2022-01-05  856  	for (mri = 0; mri < srv_path->mrs_num; mri++) {
ae4c81644e9105 Vaishali Thakkar 2022-01-05  857  		struct ib_mr *mr = srv_path->mrs[mri].mr;
9cb837480424e7 Jack Wang        2020-05-11  858  
9cb837480424e7 Jack Wang        2020-05-11  859  		rsp->desc[mri].addr = cpu_to_le64(mr->iova);
9cb837480424e7 Jack Wang        2020-05-11  860  		rsp->desc[mri].key  = cpu_to_le32(mr->rkey);
9cb837480424e7 Jack Wang        2020-05-11  861  		rsp->desc[mri].len  = cpu_to_le32(mr->length);
9cb837480424e7 Jack Wang        2020-05-11  862  
9cb837480424e7 Jack Wang        2020-05-11  863  		/*
9cb837480424e7 Jack Wang        2020-05-11  864  		 * Fill in reg MR request and chain them *backwards*
9cb837480424e7 Jack Wang        2020-05-11  865  		 */
9cb837480424e7 Jack Wang        2020-05-11  866  		rwr[mri].wr.next = mri ? &rwr[mri - 1].wr : NULL;
9cb837480424e7 Jack Wang        2020-05-11  867  		rwr[mri].wr.opcode = IB_WR_REG_MR;
9cb837480424e7 Jack Wang        2020-05-11  868  		rwr[mri].wr.wr_cqe = &local_reg_cqe;
9cb837480424e7 Jack Wang        2020-05-11  869  		rwr[mri].wr.num_sge = 0;
e8ae7ddb48a1b8 Jack Wang        2020-12-17  870  		rwr[mri].wr.send_flags = 0;
9cb837480424e7 Jack Wang        2020-05-11  871  		rwr[mri].mr = mr;
9cb837480424e7 Jack Wang        2020-05-11  872  		rwr[mri].key = mr->rkey;
9cb837480424e7 Jack Wang        2020-05-11  873  		rwr[mri].access = (IB_ACCESS_LOCAL_WRITE |
9cb837480424e7 Jack Wang        2020-05-11  874  				   IB_ACCESS_REMOTE_WRITE);
9cb837480424e7 Jack Wang        2020-05-11  875  		reg_wr = &rwr[mri].wr;
9cb837480424e7 Jack Wang        2020-05-11  876  	}
9cb837480424e7 Jack Wang        2020-05-11  877  
ae4c81644e9105 Vaishali Thakkar 2022-01-05  878  	err = rtrs_srv_create_path_files(srv_path);
4693d6b767d6ca Gioh Kim         2021-08-06  879  	if (err)
9cb837480424e7 Jack Wang        2020-05-11  880  		goto iu_free;
ae4c81644e9105 Vaishali Thakkar 2022-01-05  881  	kobject_get(&srv_path->kobj);
ae4c81644e9105 Vaishali Thakkar 2022-01-05  882  	get_device(&srv_path->srv->dev);
ed1e52aefa16f1 Md Haris Iqbal   2023-11-20  883  	err = rtrs_srv_change_state(srv_path, RTRS_SRV_CONNECTED);
ed1e52aefa16f1 Md Haris Iqbal   2023-11-20  884  	if (!err) {
94ae3ce9b375c6 Kim Zhu          2025-12-08 @885  		rtrs_err(s, "rtrs_srv_change_state(), err: %d(%pe)\n", err, ERR_PTR(err));
ed1e52aefa16f1 Md Haris Iqbal   2023-11-20  886  		goto iu_free;
ed1e52aefa16f1 Md Haris Iqbal   2023-11-20  887  	}
ed1e52aefa16f1 Md Haris Iqbal   2023-11-20  888  
ae4c81644e9105 Vaishali Thakkar 2022-01-05  889  	rtrs_srv_start_hb(srv_path);
9cb837480424e7 Jack Wang        2020-05-11  890  
9cb837480424e7 Jack Wang        2020-05-11  891  	/*
9cb837480424e7 Jack Wang        2020-05-11  892  	 * We do not account number of established connections at the current
9cb837480424e7 Jack Wang        2020-05-11  893  	 * moment, we rely on the client, which should send info request when
9cb837480424e7 Jack Wang        2020-05-11  894  	 * all connections are successfully established.  Thus, simply notify
9cb837480424e7 Jack Wang        2020-05-11  895  	 * listener with a proper event if we are the first path.
9cb837480424e7 Jack Wang        2020-05-11  896  	 */
ed1e52aefa16f1 Md Haris Iqbal   2023-11-20  897  	err = rtrs_srv_path_up(srv_path);
ed1e52aefa16f1 Md Haris Iqbal   2023-11-20  898  	if (err) {
94ae3ce9b375c6 Kim Zhu          2025-12-08  899  		rtrs_err(s, "rtrs_srv_path_up(), err: %d(%pe)\n", err, ERR_PTR(err));
ed1e52aefa16f1 Md Haris Iqbal   2023-11-20  900  		goto iu_free;
ed1e52aefa16f1 Md Haris Iqbal   2023-11-20  901  	}
9cb837480424e7 Jack Wang        2020-05-11  902  
ae4c81644e9105 Vaishali Thakkar 2022-01-05  903  	ib_dma_sync_single_for_device(srv_path->s.dev->ib_dev,
ae4c81644e9105 Vaishali Thakkar 2022-01-05  904  				      tx_iu->dma_addr,
9cb837480424e7 Jack Wang        2020-05-11  905  				      tx_iu->size, DMA_TO_DEVICE);
9cb837480424e7 Jack Wang        2020-05-11  906  
9cb837480424e7 Jack Wang        2020-05-11  907  	/* Send info response */
9cb837480424e7 Jack Wang        2020-05-11  908  	err = rtrs_iu_post_send(&con->c, tx_iu, tx_sz, reg_wr);
4693d6b767d6ca Gioh Kim         2021-08-06  909  	if (err) {
94ae3ce9b375c6 Kim Zhu          2025-12-08  910  		rtrs_err(s, "rtrs_iu_post_send(), err: %d(%pe)\n", err, ERR_PTR(err));
9cb837480424e7 Jack Wang        2020-05-11  911  iu_free:
ae4c81644e9105 Vaishali Thakkar 2022-01-05  912  		rtrs_iu_free(tx_iu, srv_path->s.dev->ib_dev, 1);
9cb837480424e7 Jack Wang        2020-05-11  913  	}
9cb837480424e7 Jack Wang        2020-05-11  914  rwr_free:
9cb837480424e7 Jack Wang        2020-05-11  915  	kfree(rwr);
9cb837480424e7 Jack Wang        2020-05-11  916  
9cb837480424e7 Jack Wang        2020-05-11  917  	return err;
9cb837480424e7 Jack Wang        2020-05-11  918  }
9cb837480424e7 Jack Wang        2020-05-11  919  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
