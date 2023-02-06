Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E0753BB
	for <oe-kbuild@lists.linux.dev>; Mon,  6 Feb 2023 19:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675712233; x=1707248233;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zXwWqVebx+pV4r2sDQeEluRoHl2cQgBJC4QSW/jqZKY=;
  b=kUjiyAbRpW2sSL0q4Fgo9/9lpDg9vPM/uq1I0sZCJ/tcDIthyZS0HNv/
   Xsb+23JGNkz8tuLXqaWCRE8dpqv90rlVpfzlxX18pMGHTzw/LKsG+/dsv
   4E0uuL6VCGzgsIYh7ZYm7DDjLIQ1NzXbO1xzKeAXyfERJGSOJQw/SOMsy
   wpd+xVSEqG2Xewr8jMlwWVh3YlBAJkDuHZhCjTv1qSCYFB+vGRVSUC5Sf
   XQ2ZK+PQN37n2fNYvJiU4BaWyXso9DBZKz3z2zTPQ96Ae4P5uwt668ln7
   CjgXbyw+EmRV5YJSIADZ9VIcJ8fRYVKFV8kK3RHpSqKeVm/ayTR7zIf1i
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="391693017"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="391693017"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2023 11:37:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="809238123"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="809238123"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 06 Feb 2023 11:37:11 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pP7Ic-0002kG-1k;
	Mon, 06 Feb 2023 19:37:10 +0000
Date: Tue, 7 Feb 2023 03:37:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/scsi/qla2xxx/qla_nvme.c:829 qla_nvme_register_hba() error:
 we previously assumed 'vha->nvme_local_port' could be null (see line 811)
Message-ID: <202302070342.0Lgaql7x-lkp@intel.com>
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
TO: Arun Easi <aeasi@marvell.com>
CC: "Martin K. Petersen" <martin.petersen@oracle.com>
CC: Himanshu Madhani <himanshu.madhani@oracle.com>
CC: Nilesh Javali <njavali@marvell.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d2d11f342b179f1894a901f143ec7c008caba43e
commit: db212f2eb3fb7f546366777e93c8f54614d39269 scsi: qla2xxx: Fix loss of NVMe namespaces after driver reload test
date:   11 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 11 months ago
config: s390-randconfig-m041-20230206 (https://download.01.org/0day-ci/archive/20230207/202302070342.0Lgaql7x-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
drivers/scsi/qla2xxx/qla_nvme.c:829 qla_nvme_register_hba() error: we previously assumed 'vha->nvme_local_port' could be null (see line 811)

vim +829 drivers/scsi/qla2xxx/qla_nvme.c

e84067d7430107 Duane Grigsby   2017-06-21  771  
8777e4314d397c Quinn Tran      2018-08-02  772  int qla_nvme_register_hba(struct scsi_qla_host *vha)
e84067d7430107 Duane Grigsby   2017-06-21  773  {
e84067d7430107 Duane Grigsby   2017-06-21  774  	struct nvme_fc_port_template *tmpl;
e84067d7430107 Duane Grigsby   2017-06-21  775  	struct qla_hw_data *ha;
e84067d7430107 Duane Grigsby   2017-06-21  776  	struct nvme_fc_port_info pinfo;
ca4fb89a3d714a Tianjia Zhang   2020-08-02  777  	int ret = -EINVAL;
e84067d7430107 Duane Grigsby   2017-06-21  778  
bcda771b2f7e4f Arnd Bergmann   2017-06-30  779  	if (!IS_ENABLED(CONFIG_NVME_FC))
8777e4314d397c Quinn Tran      2018-08-02  780  		return ret;
bcda771b2f7e4f Arnd Bergmann   2017-06-30  781  
e84067d7430107 Duane Grigsby   2017-06-21  782  	ha = vha->hw;
e84067d7430107 Duane Grigsby   2017-06-21  783  	tmpl = &qla_nvme_fc_transport;
e84067d7430107 Duane Grigsby   2017-06-21  784  
65120de26a5472 Shreyas Deodhar 2022-01-09  785  	if (ql2xnvme_queues < MIN_NVME_HW_QUEUES || ql2xnvme_queues > MAX_NVME_HW_QUEUES) {
65120de26a5472 Shreyas Deodhar 2022-01-09  786  		ql_log(ql_log_warn, vha, 0xfffd,
65120de26a5472 Shreyas Deodhar 2022-01-09  787  		    "ql2xnvme_queues=%d is out of range(MIN:%d - MAX:%d). Resetting ql2xnvme_queues to:%d\n",
65120de26a5472 Shreyas Deodhar 2022-01-09  788  		    ql2xnvme_queues, MIN_NVME_HW_QUEUES, MAX_NVME_HW_QUEUES,
65120de26a5472 Shreyas Deodhar 2022-01-09  789  		    DEF_NVME_HW_QUEUES);
65120de26a5472 Shreyas Deodhar 2022-01-09  790  		ql2xnvme_queues = DEF_NVME_HW_QUEUES;
65120de26a5472 Shreyas Deodhar 2022-01-09  791  	}
65120de26a5472 Shreyas Deodhar 2022-01-09  792  
e84067d7430107 Duane Grigsby   2017-06-21  793  	qla_nvme_fc_transport.max_hw_queues =
65120de26a5472 Shreyas Deodhar 2022-01-09  794  	    min((uint8_t)(ql2xnvme_queues),
4a0a542fe5e427 Saurav Kashyap  2021-08-09  795  		(uint8_t)(ha->max_qpairs ? ha->max_qpairs : 1));
e84067d7430107 Duane Grigsby   2017-06-21  796  
65120de26a5472 Shreyas Deodhar 2022-01-09  797  	ql_log(ql_log_info, vha, 0xfffb,
65120de26a5472 Shreyas Deodhar 2022-01-09  798  	       "Number of NVME queues used for this port: %d\n",
65120de26a5472 Shreyas Deodhar 2022-01-09  799  	    qla_nvme_fc_transport.max_hw_queues);
65120de26a5472 Shreyas Deodhar 2022-01-09  800  
e84067d7430107 Duane Grigsby   2017-06-21  801  	pinfo.node_name = wwn_to_u64(vha->node_name);
e84067d7430107 Duane Grigsby   2017-06-21  802  	pinfo.port_name = wwn_to_u64(vha->port_name);
e84067d7430107 Duane Grigsby   2017-06-21  803  	pinfo.port_role = FC_PORT_ROLE_NVME_INITIATOR;
e84067d7430107 Duane Grigsby   2017-06-21  804  	pinfo.port_id = vha->d_id.b24;
e84067d7430107 Duane Grigsby   2017-06-21  805  
db212f2eb3fb7f Arun Easi       2022-03-10  806  	mutex_lock(&ha->vport_lock);
db212f2eb3fb7f Arun Easi       2022-03-10  807  	/*
db212f2eb3fb7f Arun Easi       2022-03-10  808  	 * Check again for nvme_local_port to see if any other thread raced
db212f2eb3fb7f Arun Easi       2022-03-10  809  	 * with this one and finished registration.
db212f2eb3fb7f Arun Easi       2022-03-10  810  	 */
db212f2eb3fb7f Arun Easi       2022-03-10 @811  	if (!vha->nvme_local_port) {
e84067d7430107 Duane Grigsby   2017-06-21  812  		ql_log(ql_log_info, vha, 0xffff,
d7936a96e45c8a Darren Trap     2017-08-23  813  		    "register_localport: host-traddr=nn-0x%llx:pn-0x%llx on portID:%x\n",
d7936a96e45c8a Darren Trap     2017-08-23  814  		    pinfo.node_name, pinfo.port_name, pinfo.port_id);
e84067d7430107 Duane Grigsby   2017-06-21  815  		qla_nvme_fc_transport.dma_boundary = vha->host->dma_boundary;
e84067d7430107 Duane Grigsby   2017-06-21  816  
e84067d7430107 Duane Grigsby   2017-06-21  817  		ret = nvme_fc_register_localport(&pinfo, tmpl,
db212f2eb3fb7f Arun Easi       2022-03-10  818  						 get_device(&ha->pdev->dev),
db212f2eb3fb7f Arun Easi       2022-03-10  819  						 &vha->nvme_local_port);
db212f2eb3fb7f Arun Easi       2022-03-10  820  		mutex_unlock(&ha->vport_lock);
db212f2eb3fb7f Arun Easi       2022-03-10  821  	} else {
db212f2eb3fb7f Arun Easi       2022-03-10  822  		mutex_unlock(&ha->vport_lock);
db212f2eb3fb7f Arun Easi       2022-03-10  823  		return 0;
db212f2eb3fb7f Arun Easi       2022-03-10  824  	}
e84067d7430107 Duane Grigsby   2017-06-21  825  	if (ret) {
e84067d7430107 Duane Grigsby   2017-06-21  826  		ql_log(ql_log_warn, vha, 0xffff,
e84067d7430107 Duane Grigsby   2017-06-21  827  		    "register_localport failed: ret=%x\n", ret);
8777e4314d397c Quinn Tran      2018-08-02  828  	} else {
e84067d7430107 Duane Grigsby   2017-06-21 @829  		vha->nvme_local_port->private = vha;
e84067d7430107 Duane Grigsby   2017-06-21  830  	}
8777e4314d397c Quinn Tran      2018-08-02  831  
8777e4314d397c Quinn Tran      2018-08-02  832  	return ret;
8777e4314d397c Quinn Tran      2018-08-02  833  }
a04658594399e1 Bikash Hazarika 2021-01-11  834  

:::::: The code at line 829 was first introduced by commit
:::::: e84067d7430107a982858f11c5239542b56a8449 scsi: qla2xxx: Add FC-NVMe F/W initialization and transport registration

:::::: TO: Duane Grigsby <duane.grigsby@cavium.com>
:::::: CC: Martin K. Petersen <martin.petersen@oracle.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
