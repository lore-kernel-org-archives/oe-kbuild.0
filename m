Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9599459
	for <oe-kbuild@lists.linux.dev>; Tue, 28 Feb 2023 20:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677616193; x=1709152193;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rT18ghOGsZw99aflZDBfpE6WUM4c8hkuTnLGWhQOsmA=;
  b=TE35WgPTCT0LsfsYlUjqOAOzbKAcTx7soyvawfnyNTFnYdz+B7N8nM7O
   Uhrqi8mz+GvtO9olhT0q/t53LzeTtiXF3TF9Z50WydU0anzH6Elrrjub7
   pMfpf8GDjmLepHbW/PFcfYnhWK5V0AfUgWJr2jwMiQNZhr/Tq/4Oicfyc
   xPpKBfT8dFQp//mHzkZgqMhyZzLMAHn0OxcaENv4AQm/MunFX/hHl+zCo
   8egVXmhM++a7VNlF8mflBiQrSLffr/oeYTtiGmo/h56fCHcRx3BuTZd4+
   Fr0KMMmjbNttThcbSq11KVjfoCKZ9vD7pntu3ca6xSclbIb0z1eRaT1GM
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="331719997"
X-IronPort-AV: E=Sophos;i="5.98,222,1673942400"; 
   d="scan'208";a="331719997"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2023 12:29:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="676445749"
X-IronPort-AV: E=Sophos;i="5.98,222,1673942400"; 
   d="scan'208";a="676445749"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 28 Feb 2023 12:29:51 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pX6be-0005dH-2m;
	Tue, 28 Feb 2023 20:29:50 +0000
Date: Wed, 1 Mar 2023 04:28:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/scsi/sd.c:1592:22: warning: Uninitialized variable:
 &my_sshdr [uninitvar]
Message-ID: <202303010451.eTR5KLPj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/scsi/sd.c:1592:22: warning: Uninitialized variable: &my_sshdr [uninitvar]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Mike Christie <michael.christie@oracle.com>
CC: "Martin K. Petersen" <martin.petersen@oracle.com>
CC: John Garry <john.g.garry@oracle.com>
CC: Bart Van Assche <bvanassche@acm.org>
CC: Christoph Hellwig <hch@lst.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e492250d5252635b6c97d52eddf2792ec26f1ec1
commit: af16cd63d9d3b790ecfce3c053595a98f181e025 scsi: sd: Convert to scsi_execute_cmd()
date:   7 weeks ago
:::::: branch date: 3 hours ago
:::::: commit date: 7 weeks ago
compiler: hppa-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout af16cd63d9d3b790ecfce3c053595a98f181e025
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303010451.eTR5KLPj-lkp@intel.com/


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   drivers/scsi/sd.c:1199:14: warning: Operator '|' with one operand equal to zero is redundant. [badBitmaskCheck]
        protect | fua);
                ^
   drivers/scsi/sd.c:2228:75: warning: Parameter 'buffer' can be declared as pointer to const [constParameter]
   static int sd_read_protection_type(struct scsi_disk *sdkp, unsigned char *buffer)
                                                                             ^
   drivers/scsi/sd.c:2943:46: warning: Shifting signed 32-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBitsSigned]
       get_unaligned_be32(&vpd->data[32]) & ~(1 << 31);
                                                ^
   drivers/scsi/sd.c:2943:46: warning: Signed integer overflow for expression '1<<31'. [integerOverflow]
       get_unaligned_be32(&vpd->data[32]) & ~(1 << 31);
                                                ^
>> drivers/scsi/sd.c:1592:22: warning: Uninitialized variable: &my_sshdr [uninitvar]
     .sshdr = sshdr ? : &my_sshdr,
                        ^

vim +1592 drivers/scsi/sd.c

^1da177e4c3f41 Linus Torvalds       2005-04-16  1581  
4fa8324461b824 Derek Basehore       2017-05-11  1582  static int sd_sync_cache(struct scsi_disk *sdkp, struct scsi_sense_hdr *sshdr)
^1da177e4c3f41 Linus Torvalds       2005-04-16  1583  {
^1da177e4c3f41 Linus Torvalds       2005-04-16  1584  	int retries, res;
e73aec8247032e Martin K. Petersen   2007-02-27  1585  	struct scsi_device *sdp = sdkp->device;
7e660100d85af8 James Bottomley      2013-10-04  1586  	const int timeout = sdp->request_queue->rq_timeout
7e660100d85af8 James Bottomley      2013-10-04  1587  		* SD_FLUSH_TIMEOUT_MULTIPLIER;
4fa8324461b824 Derek Basehore       2017-05-11  1588  	struct scsi_sense_hdr my_sshdr;
af16cd63d9d3b7 Mike Christie        2022-12-29  1589  	const struct scsi_exec_args exec_args = {
af16cd63d9d3b7 Mike Christie        2022-12-29  1590  		.req_flags = BLK_MQ_REQ_PM,
af16cd63d9d3b7 Mike Christie        2022-12-29  1591  		/* caller might not be interested in sense, but we need it */
af16cd63d9d3b7 Mike Christie        2022-12-29 @1592  		.sshdr = sshdr ? : &my_sshdr,
af16cd63d9d3b7 Mike Christie        2022-12-29  1593  	};
^1da177e4c3f41 Linus Torvalds       2005-04-16  1594  
^1da177e4c3f41 Linus Torvalds       2005-04-16  1595  	if (!scsi_device_online(sdp))
^1da177e4c3f41 Linus Torvalds       2005-04-16  1596  		return -ENODEV;
^1da177e4c3f41 Linus Torvalds       2005-04-16  1597  
af16cd63d9d3b7 Mike Christie        2022-12-29  1598  	sshdr = exec_args.sshdr;
4fa8324461b824 Derek Basehore       2017-05-11  1599  
^1da177e4c3f41 Linus Torvalds       2005-04-16  1600  	for (retries = 3; retries > 0; --retries) {
42c5907728867d Shin'ichiro Kawasaki 2022-11-15  1601  		unsigned char cmd[16] = { 0 };
^1da177e4c3f41 Linus Torvalds       2005-04-16  1602  
42c5907728867d Shin'ichiro Kawasaki 2022-11-15  1603  		if (sdp->use_16_for_sync)
42c5907728867d Shin'ichiro Kawasaki 2022-11-15  1604  			cmd[0] = SYNCHRONIZE_CACHE_16;
42c5907728867d Shin'ichiro Kawasaki 2022-11-15  1605  		else
^1da177e4c3f41 Linus Torvalds       2005-04-16  1606  			cmd[0] = SYNCHRONIZE_CACHE;
^1da177e4c3f41 Linus Torvalds       2005-04-16  1607  		/*
^1da177e4c3f41 Linus Torvalds       2005-04-16  1608  		 * Leave the rest of the command zero to indicate
^1da177e4c3f41 Linus Torvalds       2005-04-16  1609  		 * flush everything.
^1da177e4c3f41 Linus Torvalds       2005-04-16  1610  		 */
af16cd63d9d3b7 Mike Christie        2022-12-29  1611  		res = scsi_execute_cmd(sdp, cmd, REQ_OP_DRV_IN, NULL, 0,
af16cd63d9d3b7 Mike Christie        2022-12-29  1612  				       timeout, sdkp->max_retries, &exec_args);
ea73a9f23906c3 James Bottomley      2005-08-28  1613  		if (res == 0)
^1da177e4c3f41 Linus Torvalds       2005-04-16  1614  			break;
^1da177e4c3f41 Linus Torvalds       2005-04-16  1615  	}
^1da177e4c3f41 Linus Torvalds       2005-04-16  1616  
e73aec8247032e Martin K. Petersen   2007-02-27  1617  	if (res) {
ef61329db7b8b4 Hannes Reinecke      2014-10-24  1618  		sd_print_result(sdkp, "Synchronize Cache(10) failed", res);
95897910a5b8ec Oliver Neukum        2013-09-16  1619  
ced202f7bd78eb Hannes Reinecke      2021-04-27  1620  		if (res < 0)
ced202f7bd78eb Hannes Reinecke      2021-04-27  1621  			return res;
ced202f7bd78eb Hannes Reinecke      2021-04-27  1622  
464a00c9e0ad45 Hannes Reinecke      2021-04-27  1623  		if (scsi_status_is_check_condition(res) &&
464a00c9e0ad45 Hannes Reinecke      2021-04-27  1624  		    scsi_sense_valid(sshdr)) {
4fa8324461b824 Derek Basehore       2017-05-11  1625  			sd_print_sense_hdr(sdkp, sshdr);
4fa8324461b824 Derek Basehore       2017-05-11  1626  
95897910a5b8ec Oliver Neukum        2013-09-16  1627  			/* we need to evaluate the error return  */
464a00c9e0ad45 Hannes Reinecke      2021-04-27  1628  			if (sshdr->asc == 0x3a ||	/* medium not present */
21e3d6c81179bb Oliver Neukum        2019-09-03  1629  			    sshdr->asc == 0x20 ||	/* invalid command */
464a00c9e0ad45 Hannes Reinecke      2021-04-27  1630  			    (sshdr->asc == 0x74 && sshdr->ascq == 0x71))	/* drive is password locked */
95897910a5b8ec Oliver Neukum        2013-09-16  1631  				/* this is no error here */
95897910a5b8ec Oliver Neukum        2013-09-16  1632  				return 0;
464a00c9e0ad45 Hannes Reinecke      2021-04-27  1633  		}
^1da177e4c3f41 Linus Torvalds       2005-04-16  1634  
95897910a5b8ec Oliver Neukum        2013-09-16  1635  		switch (host_byte(res)) {
95897910a5b8ec Oliver Neukum        2013-09-16  1636  		/* ignore errors due to racing a disconnection */
95897910a5b8ec Oliver Neukum        2013-09-16  1637  		case DID_BAD_TARGET:
95897910a5b8ec Oliver Neukum        2013-09-16  1638  		case DID_NO_CONNECT:
95897910a5b8ec Oliver Neukum        2013-09-16  1639  			return 0;
95897910a5b8ec Oliver Neukum        2013-09-16  1640  		/* signal the upper layer it might try again */
95897910a5b8ec Oliver Neukum        2013-09-16  1641  		case DID_BUS_BUSY:
95897910a5b8ec Oliver Neukum        2013-09-16  1642  		case DID_IMM_RETRY:
95897910a5b8ec Oliver Neukum        2013-09-16  1643  		case DID_REQUEUE:
95897910a5b8ec Oliver Neukum        2013-09-16  1644  		case DID_SOFT_ERROR:
95897910a5b8ec Oliver Neukum        2013-09-16  1645  			return -EBUSY;
95897910a5b8ec Oliver Neukum        2013-09-16  1646  		default:
3721050afc6cb6 Tejun Heo            2007-03-21  1647  			return -EIO;
95897910a5b8ec Oliver Neukum        2013-09-16  1648  		}
95897910a5b8ec Oliver Neukum        2013-09-16  1649  	}
3721050afc6cb6 Tejun Heo            2007-03-21  1650  	return 0;
^1da177e4c3f41 Linus Torvalds       2005-04-16  1651  }
^1da177e4c3f41 Linus Torvalds       2005-04-16  1652  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
