Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E479475
	for <oe-kbuild@lists.linux.dev>; Tue, 28 Feb 2023 21:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677621054; x=1709157054;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dCpcX7kSw8CYagWHV7v3G4RMY4JrmU615AJjDugEs6U=;
  b=kldybAbTuhCBiIZeSbtyqib900xtbelMjWHw6btGqprzsLCnVAO/mG0C
   nQJS4gqNoxvSxhYqRyzWPFct7ROGOKF0cVMt6syVKf7uIbxGi3JMHImvH
   dZNhriWxBavaEgeOQ/Oj+PmDjXaw5hC5hT4cjXM1xXLpk3xDfDF2iHnll
   gXoePmA4Aw7OcnZ35BFXA/cbTaabbSp9iWqKOY0VY/Llz+IRKrJwwNVF8
   sMg5OrsdsLXkdO8ZjXfP0RzCsYaRdhrQ0K3MuGcCag5AGmwYO3BPfA9/0
   /GEK/U7m+b08P4vBTxaZ+ycTpnbns5/2EJUrGlO09XDZ6sj9En7Nh07yk
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="396825132"
X-IronPort-AV: E=Sophos;i="5.98,223,1673942400"; 
   d="scan'208";a="396825132"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2023 13:50:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="704570402"
X-IronPort-AV: E=Sophos;i="5.98,223,1673942400"; 
   d="scan'208";a="704570402"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 28 Feb 2023 13:50:52 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pX7s4-0005f1-14;
	Tue, 28 Feb 2023 21:50:52 +0000
Date: Wed, 1 Mar 2023 05:50:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/scsi/sr_ioctl.c:194:27: warning: Uninitialized variable:
 &local_sshdr [uninitvar]
Message-ID: <202303010529.fGCAKssX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/scsi/sr_ioctl.c:194:27: warning: Uninitialized variable: &local_sshdr [uninitvar]"
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
commit: 49d33b6245d91a2ca20755cd4edf86dd0e49649e scsi: sr: Convert to scsi_execute_cmd()
date:   7 weeks ago
:::::: branch date: 5 hours ago
:::::: commit date: 7 weeks ago
compiler: hppa-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 49d33b6245d91a2ca20755cd4edf86dd0e49649e
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303010529.fGCAKssX-lkp@intel.com/


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/scsi/sr_ioctl.c:194:27: warning: Uninitialized variable: &local_sshdr [uninitvar]
     .sshdr = cgc->sshdr ? : &local_sshdr,
                             ^

vim +194 drivers/scsi/sr_ioctl.c

a09c6311217e8f Christoph Hellwig 2006-01-11  183  
^1da177e4c3f41 Linus Torvalds    2005-04-16  184  /* We do our own retries because we want to know what the specific
^1da177e4c3f41 Linus Torvalds    2005-04-16  185     error code is.  Normally the UNIT_ATTENTION code will automatically
^1da177e4c3f41 Linus Torvalds    2005-04-16  186     clear after one error */
^1da177e4c3f41 Linus Torvalds    2005-04-16  187  
^1da177e4c3f41 Linus Torvalds    2005-04-16  188  int sr_do_ioctl(Scsi_CD *cd, struct packet_command *cgc)
^1da177e4c3f41 Linus Torvalds    2005-04-16  189  {
^1da177e4c3f41 Linus Torvalds    2005-04-16  190  	struct scsi_device *SDev;
49d33b6245d91a Mike Christie     2022-12-29  191  	struct scsi_sense_hdr local_sshdr, *sshdr;
^1da177e4c3f41 Linus Torvalds    2005-04-16  192  	int result, err = 0, retries = 0;
49d33b6245d91a Mike Christie     2022-12-29  193  	const struct scsi_exec_args exec_args = {
49d33b6245d91a Mike Christie     2022-12-29 @194  		.sshdr = cgc->sshdr ? : &local_sshdr,
49d33b6245d91a Mike Christie     2022-12-29  195  	};
^1da177e4c3f41 Linus Torvalds    2005-04-16  196  
^1da177e4c3f41 Linus Torvalds    2005-04-16  197  	SDev = cd->device;
820732b501a5bb James Bottomley   2005-06-12  198  
49d33b6245d91a Mike Christie     2022-12-29  199  	sshdr = exec_args.sshdr;
f7068114d45ec5 Jens Axboe        2018-05-21  200  
^1da177e4c3f41 Linus Torvalds    2005-04-16  201        retry:
^1da177e4c3f41 Linus Torvalds    2005-04-16  202  	if (!scsi_block_when_processing_errors(SDev)) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  203  		err = -ENODEV;
820732b501a5bb James Bottomley   2005-06-12  204  		goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  205  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  206  
49d33b6245d91a Mike Christie     2022-12-29  207  	result = scsi_execute_cmd(SDev, cgc->cmd,
49d33b6245d91a Mike Christie     2022-12-29  208  				  cgc->data_direction == DMA_TO_DEVICE ?
49d33b6245d91a Mike Christie     2022-12-29  209  				  REQ_OP_DRV_OUT : REQ_OP_DRV_IN, cgc->buffer,
49d33b6245d91a Mike Christie     2022-12-29  210  				  cgc->buflen, cgc->timeout, IOCTL_RETRIES,
49d33b6245d91a Mike Christie     2022-12-29  211  				  &exec_args);
^1da177e4c3f41 Linus Torvalds    2005-04-16  212  	/* Minimal error checking.  Ignore cases we know about, and report the rest. */
ced202f7bd78eb Hannes Reinecke   2021-04-27  213  	if (result < 0) {
ced202f7bd78eb Hannes Reinecke   2021-04-27  214  		err = result;
ced202f7bd78eb Hannes Reinecke   2021-04-27  215  		goto out;
ced202f7bd78eb Hannes Reinecke   2021-04-27  216  	}
3d45cefc8edd7f Hannes Reinecke   2021-04-27  217  	if (scsi_status_is_check_condition(result)) {
e7d0748dd71695 Kees Cook         2018-08-02  218  		switch (sshdr->sense_key) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  219  		case UNIT_ATTENTION:
^1da177e4c3f41 Linus Torvalds    2005-04-16  220  			SDev->changed = 1;
^1da177e4c3f41 Linus Torvalds    2005-04-16  221  			if (!cgc->quiet)
96eefad2d9e5a0 Hannes Reinecke   2014-06-25  222  				sr_printk(KERN_INFO, cd,
96eefad2d9e5a0 Hannes Reinecke   2014-06-25  223  					  "disc change detected.\n");
^1da177e4c3f41 Linus Torvalds    2005-04-16  224  			if (retries++ < 10)
^1da177e4c3f41 Linus Torvalds    2005-04-16  225  				goto retry;
^1da177e4c3f41 Linus Torvalds    2005-04-16  226  			err = -ENOMEDIUM;
^1da177e4c3f41 Linus Torvalds    2005-04-16  227  			break;
^1da177e4c3f41 Linus Torvalds    2005-04-16  228  		case NOT_READY:	/* This happens if there is no disc in drive */
e7d0748dd71695 Kees Cook         2018-08-02  229  			if (sshdr->asc == 0x04 &&
e7d0748dd71695 Kees Cook         2018-08-02  230  			    sshdr->ascq == 0x01) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  231  				/* sense: Logical unit is in process of becoming ready */
^1da177e4c3f41 Linus Torvalds    2005-04-16  232  				if (!cgc->quiet)
96eefad2d9e5a0 Hannes Reinecke   2014-06-25  233  					sr_printk(KERN_INFO, cd,
96eefad2d9e5a0 Hannes Reinecke   2014-06-25  234  						  "CDROM not ready yet.\n");
^1da177e4c3f41 Linus Torvalds    2005-04-16  235  				if (retries++ < 10) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  236  					/* sleep 2 sec and try again */
^1da177e4c3f41 Linus Torvalds    2005-04-16  237  					ssleep(2);
^1da177e4c3f41 Linus Torvalds    2005-04-16  238  					goto retry;
^1da177e4c3f41 Linus Torvalds    2005-04-16  239  				} else {
^1da177e4c3f41 Linus Torvalds    2005-04-16  240  					/* 20 secs are enough? */
^1da177e4c3f41 Linus Torvalds    2005-04-16  241  					err = -ENOMEDIUM;
^1da177e4c3f41 Linus Torvalds    2005-04-16  242  					break;
^1da177e4c3f41 Linus Torvalds    2005-04-16  243  				}
^1da177e4c3f41 Linus Torvalds    2005-04-16  244  			}
^1da177e4c3f41 Linus Torvalds    2005-04-16  245  			if (!cgc->quiet)
96eefad2d9e5a0 Hannes Reinecke   2014-06-25  246  				sr_printk(KERN_INFO, cd,
96eefad2d9e5a0 Hannes Reinecke   2014-06-25  247  					  "CDROM not ready.  Make sure there "
96eefad2d9e5a0 Hannes Reinecke   2014-06-25  248  					  "is a disc in the drive.\n");
^1da177e4c3f41 Linus Torvalds    2005-04-16  249  			err = -ENOMEDIUM;
^1da177e4c3f41 Linus Torvalds    2005-04-16  250  			break;
^1da177e4c3f41 Linus Torvalds    2005-04-16  251  		case ILLEGAL_REQUEST:
^1da177e4c3f41 Linus Torvalds    2005-04-16  252  			err = -EIO;
e7d0748dd71695 Kees Cook         2018-08-02  253  			if (sshdr->asc == 0x20 &&
e7d0748dd71695 Kees Cook         2018-08-02  254  			    sshdr->ascq == 0x00)
^1da177e4c3f41 Linus Torvalds    2005-04-16  255  				/* sense: Invalid command operation code */
^1da177e4c3f41 Linus Torvalds    2005-04-16  256  				err = -EDRIVE_CANT_DO_THIS;
^1da177e4c3f41 Linus Torvalds    2005-04-16  257  			break;
^1da177e4c3f41 Linus Torvalds    2005-04-16  258  		default:
^1da177e4c3f41 Linus Torvalds    2005-04-16  259  			err = -EIO;
^1da177e4c3f41 Linus Torvalds    2005-04-16  260  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  261  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  262  
^1da177e4c3f41 Linus Torvalds    2005-04-16  263  	/* Wake up a process waiting for device */
^1da177e4c3f41 Linus Torvalds    2005-04-16  264        out:
^1da177e4c3f41 Linus Torvalds    2005-04-16  265  	cgc->stat = err;
^1da177e4c3f41 Linus Torvalds    2005-04-16  266  	return err;
^1da177e4c3f41 Linus Torvalds    2005-04-16  267  }
^1da177e4c3f41 Linus Torvalds    2005-04-16  268  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
