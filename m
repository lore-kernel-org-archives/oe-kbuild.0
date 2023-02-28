Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2713224
	for <oe-kbuild@lists.linux.dev>; Tue, 28 Feb 2023 19:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677611330; x=1709147330;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B1R3yQBqxxA2+QNJCunKgv2A+BPQ9O5dc9rZDSotq/w=;
  b=hiSjVPRyPH6s2WCeAWKrOkql8s/OsQWwpMj0EASrctVA/sm4LiuXRQza
   vU64rGzQ3tWyJ83sArhwjRIhvNBtyLVt8HRyf28nG6xNq0tCkxgsIvk8o
   ygATC1k1KP7ZrDURLC3u17OY4ku/NqGLMbNVZ+1hozexCNRe+ZA/V2DKU
   B9x7UyshSbr8qvZLQ+KigeF8BdcEVmz5eZm8B9Zo2B3t2nX60vfsfWluD
   +ynfarWgcOOvS0Q5FLrIr5FoZQrg1HSppl5uqR1mFx7fLHYPPbQ8n3jnS
   gxHL+DjSqtU2k9hXG6At63Dsxt6SXME90cio4LpVr/c1lFcbM9UCzYYEH
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="420486049"
X-IronPort-AV: E=Sophos;i="5.98,222,1673942400"; 
   d="scan'208";a="420486049"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2023 11:08:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="783982761"
X-IronPort-AV: E=Sophos;i="5.98,222,1673942400"; 
   d="scan'208";a="783982761"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 28 Feb 2023 11:08:49 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pX5LE-0005aZ-2u;
	Tue, 28 Feb 2023 19:08:48 +0000
Date: Wed, 1 Mar 2023 03:07:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/scsi/scsi_transport_spi.c:117:22: warning: Uninitialized
 variable: &sshdr_tmp [uninitvar]
Message-ID: <202303010344.OvkX9B9I-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/scsi/scsi_transport_spi.c:117:22: warning: Uninitialized variable: &sshdr_tmp [uninitvar]"
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
commit: c9ee828aad6919b7eee7ef2059489c7221edf68a scsi: spi: Convert to scsi_execute_cmd()
date:   7 weeks ago
:::::: branch date: 2 hours ago
:::::: commit date: 7 weeks ago
compiler: hppa-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout c9ee828aad6919b7eee7ef2059489c7221edf68a
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303010344.OvkX9B9I-lkp@intel.com/


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/scsi/virtio_scsi.c:857:53: warning: AST broken, ternary operator missing operand(s) [internalAstError]
    num_queues = virtscsi_config_get(vdev, num_queues) ? : 1;
                                                       ^
--
   drivers/scsi/scsi_transport_spi.c:189:55: warning: Parameter 'cont' can be declared as pointer to const [constParameter]
   static int spi_host_match(struct attribute_container *cont,
                                                         ^
   drivers/scsi/scsi_transport_spi.c:1400:57: warning: Parameter 'cont' can be declared as pointer to const [constParameter]
   static int spi_target_match(struct attribute_container *cont,
                                                           ^
   drivers/scsi/scsi_transport_spi.c:1469:26: warning: Parameter 'attr' can be declared as pointer to const [constParameter]
          struct attribute *attr, int i)
                            ^
>> drivers/scsi/scsi_transport_spi.c:117:22: warning: Uninitialized variable: &sshdr_tmp [uninitvar]
     .sshdr = sshdr ? : &sshdr_tmp,
                        ^
>> drivers/scsi/sd.c:1196:14: warning: Operator '|' with one operand equal to zero is redundant. [badBitmaskCheck]
        protect | fua);
                ^
>> drivers/scsi/sd.c:2214:75: warning: Parameter 'buffer' can be declared as pointer to const [constParameter]
   static int sd_read_protection_type(struct scsi_disk *sdkp, unsigned char *buffer)
                                                                             ^
>> drivers/scsi/sd.c:2923:46: warning: Shifting signed 32-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBitsSigned]
       get_unaligned_be32(&vpd->data[32]) & ~(1 << 31);
                                                ^
>> drivers/scsi/sd.c:2923:46: warning: Signed integer overflow for expression '1<<31'. [integerOverflow]
       get_unaligned_be32(&vpd->data[32]) & ~(1 << 31);
                                                ^

vim +117 drivers/scsi/scsi_transport_spi.c

^1da177e4c3f41 Linus Torvalds    2005-04-16  106  
33aa687db90dd8 James Bottomley   2005-08-28  107  static int spi_execute(struct scsi_device *sdev, const void *cmd,
c9ee828aad6919 Mike Christie     2022-12-29  108  		       enum req_op op, void *buffer, unsigned int bufflen,
33aa687db90dd8 James Bottomley   2005-08-28  109  		       struct scsi_sense_hdr *sshdr)
949bf797595fc9 James Bottomley   2005-05-01  110  {
33aa687db90dd8 James Bottomley   2005-08-28  111  	int i, result;
76aaf87b4cdc7f Christoph Hellwig 2017-02-23  112  	struct scsi_sense_hdr sshdr_tmp;
c9ee828aad6919 Mike Christie     2022-12-29  113  	blk_opf_t opf = op | REQ_FAILFAST_DEV | REQ_FAILFAST_TRANSPORT |
c9ee828aad6919 Mike Christie     2022-12-29  114  			REQ_FAILFAST_DRIVER;
c9ee828aad6919 Mike Christie     2022-12-29  115  	const struct scsi_exec_args exec_args = {
c9ee828aad6919 Mike Christie     2022-12-29  116  		.req_flags = BLK_MQ_REQ_PM,
c9ee828aad6919 Mike Christie     2022-12-29 @117  		.sshdr = sshdr ? : &sshdr_tmp,
c9ee828aad6919 Mike Christie     2022-12-29  118  	};
76aaf87b4cdc7f Christoph Hellwig 2017-02-23  119  
c9ee828aad6919 Mike Christie     2022-12-29  120  	sshdr = exec_args.sshdr;
949bf797595fc9 James Bottomley   2005-05-01  121  
949bf797595fc9 James Bottomley   2005-05-01  122  	for(i = 0; i < DV_RETRIES; i++) {
cfefd9f8240a7b Bart Van Assche   2020-12-08  123  		/*
cfefd9f8240a7b Bart Van Assche   2020-12-08  124  		 * The purpose of the RQF_PM flag below is to bypass the
cfefd9f8240a7b Bart Van Assche   2020-12-08  125  		 * SDEV_QUIESCE state.
cfefd9f8240a7b Bart Van Assche   2020-12-08  126  		 */
c9ee828aad6919 Mike Christie     2022-12-29  127  		result = scsi_execute_cmd(sdev, cmd, opf, buffer, bufflen,
c9ee828aad6919 Mike Christie     2022-12-29  128  					  DV_TIMEOUT, 1, &exec_args);
464a00c9e0ad45 Hannes Reinecke   2021-04-27  129  		if (result < 0 || !scsi_sense_valid(sshdr) ||
76aaf87b4cdc7f Christoph Hellwig 2017-02-23  130  		    sshdr->sense_key != UNIT_ATTENTION)
949bf797595fc9 James Bottomley   2005-05-01  131  			break;
949bf797595fc9 James Bottomley   2005-05-01  132  	}
33aa687db90dd8 James Bottomley   2005-08-28  133  	return result;
949bf797595fc9 James Bottomley   2005-05-01  134  }
949bf797595fc9 James Bottomley   2005-05-01  135  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
