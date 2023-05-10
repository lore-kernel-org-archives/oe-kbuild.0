Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430493D60
	for <oe-kbuild@lists.linux.dev>; Wed, 10 May 2023 11:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683718595; x=1715254595;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WO+HdiW1U9+AAOmFj11VV92n7W27Mm9In822Quq4wbI=;
  b=EcGnNvg+Z7+a/SoalO1T4F2rPykhbPxNDrJOgYZClYzJAJYK/ot9ZiEr
   xRieVcDpmDPIbwzopYzqdg4A2sn4XDBuqlcJCyBd5eYbKsmwogE/N+j9V
   Pl2PP6kUkT07HTi4RXMu+2nVWtlgIN/QdgSsaE94KSdf39l0Mx/LPL2B9
   nG/dogwEI3nMGSbzwXQfxblymcxBno528E9eH35X2tuh0uMaoX/qYS0gt
   cL4Gh5/M4Xarm0VAWTPXJxuv8yahjBlLuY/ecTn4tH7FRLsMx3my0BWpa
   WbO5rdRJZxLE7kY078Y+ZI28p/xtGBjs8ZG3TinEb3zw0Y+r/73N1EmUX
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="347651910"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; 
   d="scan'208";a="347651910"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2023 04:36:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="649710512"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; 
   d="scan'208";a="649710512"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 10 May 2023 04:36:29 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwi7Q-0003EE-2g;
	Wed, 10 May 2023 11:36:28 +0000
Date: Wed, 10 May 2023 19:36:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] vc_screen: reload load of struct vc_data pointer in
 vcs_write() to avoid UAF
Message-ID: <202305101936.1ROFaVa9-lkp@intel.com>
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
In-Reply-To: <1683659319-29701-1-git-send-email-george.kennedy@oracle.com>
References: <1683659319-29701-1-git-send-email-george.kennedy@oracle.com>
TO: George Kennedy <george.kennedy@oracle.com>
TO: gregkh@linuxfoundation.org
TO: jirislaby@kernel.org
CC: george.kennedy@oracle.com
CC: sfr@canb.auug.org.au
CC: akpm@linux-foundation.org
CC: linux-kernel@vger.kernel.org
CC: linux-serial@vger.kernel.org
CC: linux@weissschuh.net
CC: regressions@lists.linux.dev

Hi George,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tty/tty-testing]
[also build test WARNING on tty/tty-next tty/tty-linus linus/master v6.4-rc1 next-20230510]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/George-Kennedy/vc_screen-reload-load-of-struct-vc_data-pointer-in-vcs_write-to-avoid-UAF/20230510-031202
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-testing
patch link:    https://lore.kernel.org/r/1683659319-29701-1-git-send-email-george.kennedy%40oracle.com
patch subject: [PATCH] vc_screen: reload load of struct vc_data pointer in vcs_write() to avoid UAF
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: ia64-randconfig-m031-20230509 (https://download.01.org/0day-ci/archive/20230510/202305101936.1ROFaVa9-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202305101936.1ROFaVa9-lkp@intel.com/

smatch warnings:
drivers/tty/vt/vc_screen.c:707 vcs_write() warn: maybe return -EFAULT instead of the bytes remaining?

vim +707 drivers/tty/vt/vc_screen.c

95e0d57fd49780 drivers/tty/vt/vc_screen.c Jiri Slaby     2020-08-18  588  
^1da177e4c3f41 drivers/char/vc_screen.c   Linus Torvalds 2005-04-16  589  static ssize_t
^1da177e4c3f41 drivers/char/vc_screen.c   Linus Torvalds 2005-04-16  590  vcs_write(struct file *file, const char __user *buf, size_t count, loff_t *ppos)
^1da177e4c3f41 drivers/char/vc_screen.c   Linus Torvalds 2005-04-16  591  {
496ad9aa8ef448 drivers/tty/vt/vc_screen.c Al Viro        2013-01-23  592  	struct inode *inode = file_inode(file);
^1da177e4c3f41 drivers/char/vc_screen.c   Linus Torvalds 2005-04-16  593  	struct vc_data *vc;
95e0d57fd49780 drivers/tty/vt/vc_screen.c Jiri Slaby     2020-08-18  594  	char *con_buf;
95e0d57fd49780 drivers/tty/vt/vc_screen.c Jiri Slaby     2020-08-18  595  	u16 *org0, *org;
95e0d57fd49780 drivers/tty/vt/vc_screen.c Jiri Slaby     2020-08-18  596  	unsigned int written;
2665bef49f96df drivers/tty/vt/vc_screen.c Jiri Slaby     2020-08-18  597  	int size;
2665bef49f96df drivers/tty/vt/vc_screen.c Jiri Slaby     2020-08-18  598  	ssize_t ret;
2665bef49f96df drivers/tty/vt/vc_screen.c Jiri Slaby     2020-08-18  599  	loff_t pos;
2665bef49f96df drivers/tty/vt/vc_screen.c Jiri Slaby     2020-08-18  600  	bool viewed, attr;
^1da177e4c3f41 drivers/char/vc_screen.c   Linus Torvalds 2005-04-16  601  
0c9acb1af77a3c drivers/tty/vt/vc_screen.c Nicolas Pitre  2019-11-05  602  	if (use_unicode(inode))
0c9acb1af77a3c drivers/tty/vt/vc_screen.c Nicolas Pitre  2019-11-05  603  		return -EOPNOTSUPP;
0c9acb1af77a3c drivers/tty/vt/vc_screen.c Nicolas Pitre  2019-11-05  604  
fcdba07ee390d9 drivers/tty/vt/vc_screen.c Jiri Olsa      2011-02-07  605  	con_buf = (char *) __get_free_page(GFP_KERNEL);
fcdba07ee390d9 drivers/tty/vt/vc_screen.c Jiri Olsa      2011-02-07  606  	if (!con_buf)
fcdba07ee390d9 drivers/tty/vt/vc_screen.c Jiri Olsa      2011-02-07  607  		return -ENOMEM;
^1da177e4c3f41 drivers/char/vc_screen.c   Linus Torvalds 2005-04-16  608  
^1da177e4c3f41 drivers/char/vc_screen.c   Linus Torvalds 2005-04-16  609  	pos = *ppos;
^1da177e4c3f41 drivers/char/vc_screen.c   Linus Torvalds 2005-04-16  610  
^1da177e4c3f41 drivers/char/vc_screen.c   Linus Torvalds 2005-04-16  611  	/* Select the proper current console and verify
^1da177e4c3f41 drivers/char/vc_screen.c   Linus Torvalds 2005-04-16  612  	 * sanity of the situation under the console lock.
^1da177e4c3f41 drivers/char/vc_screen.c   Linus Torvalds 2005-04-16  613  	 */
ac751efa6a0d70 drivers/tty/vt/vc_screen.c Torben Hohn    2011-01-25  614  	console_lock();
^1da177e4c3f41 drivers/char/vc_screen.c   Linus Torvalds 2005-04-16  615  
d21b0be246bf3b drivers/tty/vt/vc_screen.c Nicolas Pitre  2018-06-26  616  	attr = use_attributes(inode);
^1da177e4c3f41 drivers/char/vc_screen.c   Linus Torvalds 2005-04-16  617  	ret = -ENXIO;
fcdba07ee390d9 drivers/tty/vt/vc_screen.c Jiri Olsa      2011-02-07  618  	vc = vcs_vc(inode, &viewed);
fcdba07ee390d9 drivers/tty/vt/vc_screen.c Jiri Olsa      2011-02-07  619  	if (!vc)
^1da177e4c3f41 drivers/char/vc_screen.c   Linus Torvalds 2005-04-16  620  		goto unlock_out;
^1da177e4c3f41 drivers/char/vc_screen.c   Linus Torvalds 2005-04-16  621  
71d4abfab322e8 drivers/tty/vt/vc_screen.c Jiri Slaby     2020-08-18  622  	size = vcs_size(vc, attr, false);
71d4abfab322e8 drivers/tty/vt/vc_screen.c Jiri Slaby     2020-08-18  623  	if (size < 0) {
71d4abfab322e8 drivers/tty/vt/vc_screen.c Jiri Slaby     2020-08-18  624  		ret = size;
71d4abfab322e8 drivers/tty/vt/vc_screen.c Jiri Slaby     2020-08-18  625  		goto unlock_out;
71d4abfab322e8 drivers/tty/vt/vc_screen.c Jiri Slaby     2020-08-18  626  	}
^1da177e4c3f41 drivers/char/vc_screen.c   Linus Torvalds 2005-04-16  627  	ret = -EINVAL;
^1da177e4c3f41 drivers/char/vc_screen.c   Linus Torvalds 2005-04-16  628  	if (pos < 0 || pos > size)
^1da177e4c3f41 drivers/char/vc_screen.c   Linus Torvalds 2005-04-16  629  		goto unlock_out;
^1da177e4c3f41 drivers/char/vc_screen.c   Linus Torvalds 2005-04-16  630  	if (count > size - pos)
^1da177e4c3f41 drivers/char/vc_screen.c   Linus Torvalds 2005-04-16  631  		count = size - pos;
^1da177e4c3f41 drivers/char/vc_screen.c   Linus Torvalds 2005-04-16  632  	written = 0;
^1da177e4c3f41 drivers/char/vc_screen.c   Linus Torvalds 2005-04-16  633  	while (count) {
95e0d57fd49780 drivers/tty/vt/vc_screen.c Jiri Slaby     2020-08-18  634  		unsigned int this_round = count;
^1da177e4c3f41 drivers/char/vc_screen.c   Linus Torvalds 2005-04-16  635  
^1da177e4c3f41 drivers/char/vc_screen.c   Linus Torvalds 2005-04-16  636  		if (this_round > CON_BUF_SIZE)
^1da177e4c3f41 drivers/char/vc_screen.c   Linus Torvalds 2005-04-16  637  			this_round = CON_BUF_SIZE;
^1da177e4c3f41 drivers/char/vc_screen.c   Linus Torvalds 2005-04-16  638  
^1da177e4c3f41 drivers/char/vc_screen.c   Linus Torvalds 2005-04-16  639  		/* Temporarily drop the console lock so that we can read
^1da177e4c3f41 drivers/char/vc_screen.c   Linus Torvalds 2005-04-16  640  		 * in the write data from userspace safely.
^1da177e4c3f41 drivers/char/vc_screen.c   Linus Torvalds 2005-04-16  641  		 */
ac751efa6a0d70 drivers/tty/vt/vc_screen.c Torben Hohn    2011-01-25  642  		console_unlock();
^1da177e4c3f41 drivers/char/vc_screen.c   Linus Torvalds 2005-04-16  643  		ret = copy_from_user(con_buf, buf, this_round);
ac751efa6a0d70 drivers/tty/vt/vc_screen.c Torben Hohn    2011-01-25  644  		console_lock();
^1da177e4c3f41 drivers/char/vc_screen.c   Linus Torvalds 2005-04-16  645  
^1da177e4c3f41 drivers/char/vc_screen.c   Linus Torvalds 2005-04-16  646  		if (ret) {
^1da177e4c3f41 drivers/char/vc_screen.c   Linus Torvalds 2005-04-16  647  			this_round -= ret;
^1da177e4c3f41 drivers/char/vc_screen.c   Linus Torvalds 2005-04-16  648  			if (!this_round) {
^1da177e4c3f41 drivers/char/vc_screen.c   Linus Torvalds 2005-04-16  649  				/* Abort loop if no data were copied. Otherwise
^1da177e4c3f41 drivers/char/vc_screen.c   Linus Torvalds 2005-04-16  650  				 * fail with -EFAULT.
^1da177e4c3f41 drivers/char/vc_screen.c   Linus Torvalds 2005-04-16  651  				 */
^1da177e4c3f41 drivers/char/vc_screen.c   Linus Torvalds 2005-04-16  652  				if (written)
^1da177e4c3f41 drivers/char/vc_screen.c   Linus Torvalds 2005-04-16  653  					break;
^1da177e4c3f41 drivers/char/vc_screen.c   Linus Torvalds 2005-04-16  654  				ret = -EFAULT;
^1da177e4c3f41 drivers/char/vc_screen.c   Linus Torvalds 2005-04-16  655  				goto unlock_out;
^1da177e4c3f41 drivers/char/vc_screen.c   Linus Torvalds 2005-04-16  656  			}
^1da177e4c3f41 drivers/char/vc_screen.c   Linus Torvalds 2005-04-16  657  		}
^1da177e4c3f41 drivers/char/vc_screen.c   Linus Torvalds 2005-04-16  658  
50f4095ab8ede7 drivers/tty/vt/vc_screen.c George Kennedy 2023-05-09  659  		/* The vc might have been freed or vcs_size might have changed
50f4095ab8ede7 drivers/tty/vt/vc_screen.c George Kennedy 2023-05-09  660  		 * while we slept to grab the user buffer, so recheck.
^1da177e4c3f41 drivers/char/vc_screen.c   Linus Torvalds 2005-04-16  661  		 * Return data written up to now on failure.
^1da177e4c3f41 drivers/char/vc_screen.c   Linus Torvalds 2005-04-16  662  		 */
50f4095ab8ede7 drivers/tty/vt/vc_screen.c George Kennedy 2023-05-09  663  		vc = vcs_vc(inode, &viewed);
50f4095ab8ede7 drivers/tty/vt/vc_screen.c George Kennedy 2023-05-09  664  		if (!vc) {
50f4095ab8ede7 drivers/tty/vt/vc_screen.c George Kennedy 2023-05-09  665  			if (written)
50f4095ab8ede7 drivers/tty/vt/vc_screen.c George Kennedy 2023-05-09  666  				break;
50f4095ab8ede7 drivers/tty/vt/vc_screen.c George Kennedy 2023-05-09  667  			goto unlock_out;
50f4095ab8ede7 drivers/tty/vt/vc_screen.c George Kennedy 2023-05-09  668  		}
71d4abfab322e8 drivers/tty/vt/vc_screen.c Jiri Slaby     2020-08-18  669  		size = vcs_size(vc, attr, false);
dc1892c4bc6960 drivers/tty/vt/vc_screen.c Jiri Olsa      2011-02-07  670  		if (size < 0) {
dc1892c4bc6960 drivers/tty/vt/vc_screen.c Jiri Olsa      2011-02-07  671  			if (written)
dc1892c4bc6960 drivers/tty/vt/vc_screen.c Jiri Olsa      2011-02-07  672  				break;
dc1892c4bc6960 drivers/tty/vt/vc_screen.c Jiri Olsa      2011-02-07  673  			ret = size;
dc1892c4bc6960 drivers/tty/vt/vc_screen.c Jiri Olsa      2011-02-07  674  			goto unlock_out;
dc1892c4bc6960 drivers/tty/vt/vc_screen.c Jiri Olsa      2011-02-07  675  		}
^1da177e4c3f41 drivers/char/vc_screen.c   Linus Torvalds 2005-04-16  676  		if (pos >= size)
^1da177e4c3f41 drivers/char/vc_screen.c   Linus Torvalds 2005-04-16  677  			break;
^1da177e4c3f41 drivers/char/vc_screen.c   Linus Torvalds 2005-04-16  678  		if (this_round > size - pos)
^1da177e4c3f41 drivers/char/vc_screen.c   Linus Torvalds 2005-04-16  679  			this_round = size - pos;
^1da177e4c3f41 drivers/char/vc_screen.c   Linus Torvalds 2005-04-16  680  
^1da177e4c3f41 drivers/char/vc_screen.c   Linus Torvalds 2005-04-16  681  		/* OK, now actually push the write to the console
^1da177e4c3f41 drivers/char/vc_screen.c   Linus Torvalds 2005-04-16  682  		 * under the lock using the local kernel buffer.
^1da177e4c3f41 drivers/char/vc_screen.c   Linus Torvalds 2005-04-16  683  		 */
^1da177e4c3f41 drivers/char/vc_screen.c   Linus Torvalds 2005-04-16  684  
95e0d57fd49780 drivers/tty/vt/vc_screen.c Jiri Slaby     2020-08-18  685  		if (attr)
95e0d57fd49780 drivers/tty/vt/vc_screen.c Jiri Slaby     2020-08-18  686  			org = vcs_write_buf(vc, con_buf, pos, this_round,
95e0d57fd49780 drivers/tty/vt/vc_screen.c Jiri Slaby     2020-08-18  687  					viewed, &org0);
95e0d57fd49780 drivers/tty/vt/vc_screen.c Jiri Slaby     2020-08-18  688  		else
9e6363784e3f1e drivers/tty/vt/vc_screen.c Jiri Slaby     2020-08-18  689  			org = vcs_write_buf_noattr(vc, con_buf, pos, this_round,
9e6363784e3f1e drivers/tty/vt/vc_screen.c Jiri Slaby     2020-08-18  690  					viewed, &org0);
^1da177e4c3f41 drivers/char/vc_screen.c   Linus Torvalds 2005-04-16  691  
95e0d57fd49780 drivers/tty/vt/vc_screen.c Jiri Slaby     2020-08-18  692  		count -= this_round;
95e0d57fd49780 drivers/tty/vt/vc_screen.c Jiri Slaby     2020-08-18  693  		written += this_round;
95e0d57fd49780 drivers/tty/vt/vc_screen.c Jiri Slaby     2020-08-18  694  		buf += this_round;
95e0d57fd49780 drivers/tty/vt/vc_screen.c Jiri Slaby     2020-08-18  695  		pos += this_round;
95e0d57fd49780 drivers/tty/vt/vc_screen.c Jiri Slaby     2020-08-18  696  		if (org)
^1da177e4c3f41 drivers/char/vc_screen.c   Linus Torvalds 2005-04-16  697  			update_region(vc, (unsigned long)(org0), org - org0);
^1da177e4c3f41 drivers/char/vc_screen.c   Linus Torvalds 2005-04-16  698  	}
^1da177e4c3f41 drivers/char/vc_screen.c   Linus Torvalds 2005-04-16  699  	*ppos += written;
^1da177e4c3f41 drivers/char/vc_screen.c   Linus Torvalds 2005-04-16  700  	ret = written;
432c9ed22aff64 drivers/char/vc_screen.c   Nicolas Pitre  2010-10-01  701  	if (written)
432c9ed22aff64 drivers/char/vc_screen.c   Nicolas Pitre  2010-10-01  702  		vcs_scr_updated(vc);
^1da177e4c3f41 drivers/char/vc_screen.c   Linus Torvalds 2005-04-16  703  
^1da177e4c3f41 drivers/char/vc_screen.c   Linus Torvalds 2005-04-16  704  unlock_out:
ac751efa6a0d70 drivers/tty/vt/vc_screen.c Torben Hohn    2011-01-25  705  	console_unlock();
fcdba07ee390d9 drivers/tty/vt/vc_screen.c Jiri Olsa      2011-02-07  706  	free_page((unsigned long) con_buf);
^1da177e4c3f41 drivers/char/vc_screen.c   Linus Torvalds 2005-04-16 @707  	return ret;
^1da177e4c3f41 drivers/char/vc_screen.c   Linus Torvalds 2005-04-16  708  }
^1da177e4c3f41 drivers/char/vc_screen.c   Linus Torvalds 2005-04-16  709  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
