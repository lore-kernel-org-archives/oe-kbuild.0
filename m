Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AEC920E7
	for <oe-kbuild@lists.linux.dev>; Fri, 11 Nov 2022 10:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668161945; x=1699697945;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NgsnPmNfNjRwyo8SRMhb+1Cx0Q529MPNjaYG6nfI8S0=;
  b=K4BIPA+p2YYLwohVwBIxIHKS857Kmowfd/173p80h+2wVucqzoxKKJzf
   am5vqk0StYzfyMzSxiDS7kqBv6EJJl/lA17wMcqt1s40EH7aFWBKUt6Xl
   tCHLGPU3NTegWHeMwKGHwiEc5QAqlR+fqtL5sDW3LGsR2GbbIRdpj9gc/
   h3ObVgBqROr5zVFKn4AEbjDYKxb1p872MN1QPZ8FUYexZQ/35qsqvHPBk
   K7u4hO1jbpLP/skHTxGP6PX+ykwkWJ0JV4tVwjaLO0RqKrJW6kpCbWmgd
   SG4BbpbhEnUMIE1sLUGZ4QNzMkTYxsjd0LpGOD8UHhDGUBykXXvkykHOu
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="299083946"
X-IronPort-AV: E=Sophos;i="5.96,156,1665471600"; 
   d="scan'208";a="299083946"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2022 02:19:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="670703673"
X-IronPort-AV: E=Sophos;i="5.96,156,1665471600"; 
   d="scan'208";a="670703673"
Received: from lkp-server01.sh.intel.com (HELO e783503266e8) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 11 Nov 2022 02:19:03 -0800
Received: from kbuild by e783503266e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1otR7n-0003qY-0Y;
	Fri, 11 Nov 2022 10:19:03 +0000
Date: Fri, 11 Nov 2022 18:18:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/crypto/hisilicon/qm.c:4517:6: warning: Redundant
 initialization for 'ret'. The initialized value is overwritten before it is
 read. [redundantInitialization]
Message-ID: <202211111817.KM12sEJr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/crypto/hisilicon/qm.c:4517:6: warning: Redundant initialization for 'ret'. The initialized value is overwritten before it is read. [redundantInitialization]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Weili Qian <qianweili@huawei.com>
CC: Herbert Xu <herbert@gondor.apana.org.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4bbf3422df78029f03161640dcb1e9d1ed64d1ea
commit: 82f00b24f532557fb0e15a6a2747859e4b70c4bd crypto: hisilicon/qm - get hardware features from hardware registers
date:   8 weeks ago
:::::: branch date: 9 hours ago
:::::: commit date: 8 weeks ago
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 82f00b24f532557fb0e15a6a2747859e4b70c4bd
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

cppcheck warnings: (new ones prefixed by >>)
   drivers/crypto/hisilicon/qm.c:4613:8: warning: %x in format string (no. 2) requires 'unsigned int *' but the argument type is 'signed int *'. [invalidScanfArgType_int]
    ret = sscanf(tbuf_bdf, "%u:%x:%u.%u", &tmp1, &bus, &device, &function);
          ^

cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   drivers/crypto/hisilicon/qm.c:1777:2: warning: Assignment of function parameter has no effect outside the function. Did you forget dereferencing it? [uselessAssignmentPtrArg]
    dregs = NULL;
    ^
   drivers/crypto/hisilicon/qm.c:4603:8: warning: sscanf() without field width limits can crash with huge input data. [invalidscanf]
    ret = sscanf(buf, "%s %s", tbuf_bdf, val_buf);
          ^
>> drivers/crypto/hisilicon/qm.c:4517:6: warning: Redundant initialization for 'ret'. The initialized value is overwritten before it is read. [redundantInitialization]
    ret = qm_ping_pf(qm, QM_VF_GET_QOS);
        ^
   drivers/crypto/hisilicon/qm.c:4511:10: note: ret is initialized
    int ret = -EINVAL;
            ^
   drivers/crypto/hisilicon/qm.c:4517:6: note: ret is overwritten
    ret = qm_ping_pf(qm, QM_VF_GET_QOS);
        ^
   drivers/crypto/hisilicon/qm.c:3527:46: warning: Parameter 'pdev' can be declared as pointer to const [constParameter]
   static int qm_try_frozen_vfs(struct pci_dev *pdev,
                                                ^
   drivers/crypto/hisilicon/qm.c:4281:29: warning: Uninitialized variable: tmp->distance [uninitvar]
      if (res->distance < tmp->distance) {
                               ^
   drivers/crypto/hisilicon/qm.c:4274:7: note: Assuming condition is false
     if (!res)
         ^
   drivers/crypto/hisilicon/qm.c:4281:29: note: Uninitialized variable: tmp->distance
      if (res->distance < tmp->distance) {
                               ^

vim +/ret +4517 drivers/crypto/hisilicon/qm.c

3bbf0783636be8 Kai Ye     2021-06-11  4507  
3bbf0783636be8 Kai Ye     2021-06-11  4508  static int qm_vf_read_qos(struct hisi_qm *qm)
3bbf0783636be8 Kai Ye     2021-06-11  4509  {
3bbf0783636be8 Kai Ye     2021-06-11  4510  	int cnt = 0;
05b3bade290d6c Kai Ye     2022-01-22  4511  	int ret = -EINVAL;
3bbf0783636be8 Kai Ye     2021-06-11  4512  
3bbf0783636be8 Kai Ye     2021-06-11  4513  	/* reset mailbox qos val */
3bbf0783636be8 Kai Ye     2021-06-11  4514  	qm->mb_qos = 0;
3bbf0783636be8 Kai Ye     2021-06-11  4515  
3bbf0783636be8 Kai Ye     2021-06-11  4516  	/* vf ping pf to get function qos */
82f00b24f53255 Weili Qian 2022-09-09 @4517  	ret = qm_ping_pf(qm, QM_VF_GET_QOS);
3bbf0783636be8 Kai Ye     2021-06-11  4518  	if (ret) {
3bbf0783636be8 Kai Ye     2021-06-11  4519  		pci_err(qm->pdev, "failed to send cmd to PF to get qos!\n");
3bbf0783636be8 Kai Ye     2021-06-11  4520  		return ret;
3bbf0783636be8 Kai Ye     2021-06-11  4521  	}
3bbf0783636be8 Kai Ye     2021-06-11  4522  
3bbf0783636be8 Kai Ye     2021-06-11  4523  	while (true) {
3bbf0783636be8 Kai Ye     2021-06-11  4524  		msleep(QM_WAIT_DST_ACK);
3bbf0783636be8 Kai Ye     2021-06-11  4525  		if (qm->mb_qos)
3bbf0783636be8 Kai Ye     2021-06-11  4526  			break;
3bbf0783636be8 Kai Ye     2021-06-11  4527  
3bbf0783636be8 Kai Ye     2021-06-11  4528  		if (++cnt > QM_MAX_VF_WAIT_COUNT) {
3bbf0783636be8 Kai Ye     2021-06-11  4529  			pci_err(qm->pdev, "PF ping VF timeout!\n");
3bbf0783636be8 Kai Ye     2021-06-11  4530  			return  -ETIMEDOUT;
3bbf0783636be8 Kai Ye     2021-06-11  4531  		}
3bbf0783636be8 Kai Ye     2021-06-11  4532  	}
3bbf0783636be8 Kai Ye     2021-06-11  4533  
3bbf0783636be8 Kai Ye     2021-06-11  4534  	return ret;
3bbf0783636be8 Kai Ye     2021-06-11  4535  }
3bbf0783636be8 Kai Ye     2021-06-11  4536  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
