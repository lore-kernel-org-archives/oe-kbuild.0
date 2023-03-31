Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A0015B9
	for <oe-kbuild@lists.linux.dev>; Fri, 31 Mar 2023 02:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680229945; x=1711765945;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=+eZ7eAL/ve/vDTft3MZ0v1bqL3yGbUzjaVhOIP9x6yE=;
  b=RU4y3OvOdcHFl9XlPf5102GRmynDXjqlz/01BLpzTXAiscv/cGIBgB1T
   7Jzt1yP6XxQb5vCGeTklPDu1raPKON5FZ21hdfliNc5Gd/R0DAKMBkZeT
   NYWfixNJ/ps7SZxtbMXe7EeyEy11XpPI1jjRUvrEgFt5l1tQ/09y1BgdA
   7J8TER57Kc7zhmN+ovQTN7Od+6AjrAo5pD/cgj4vS+fjsRJeRT9dCJJ4E
   pxQUXSwBZy5amJgRs64hJ59TW58Prn4YDEkA0vtIje2PZMn5MjFB7RMv5
   ThmsCYltAhp5Yimub/MFsOv8OVxoN7pQTUQWe4t6wwFE/j8uAkIXaVWJu
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="342985491"
X-IronPort-AV: E=Sophos;i="5.98,306,1673942400"; 
   d="scan'208";a="342985491"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 19:32:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="1014665248"
X-IronPort-AV: E=Sophos;i="5.98,306,1673942400"; 
   d="scan'208";a="1014665248"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 30 Mar 2023 19:32:20 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pi4Yt-000LQO-2L;
	Fri, 31 Mar 2023 02:32:19 +0000
Date: Fri, 31 Mar 2023 10:32:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [tty:tty-next 6/24] drivers/tty/n_gsm.c:3751 gsmld_ioctl() warn:
 potential spectre issue 'gsm->dlci' [r] (local cap)
Message-ID: <202303311049.D00HXznH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-serial@vger.kernel.org
TO: Daniel Starke <daniel.starke@siemens.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-next
head:   d30a28a764a8221874ab53b7cbe79f842c30b671
commit: afe3154ba87e798de87ab65c72d6e3f6cd32d9d1 [6/24] tty: n_gsm: add ioctl for DLC config via ldisc handle
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: parisc-randconfig-m041-20230329 (https://download.01.org/0day-ci/archive/20230331/202303311049.D00HXznH-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303311049.D00HXznH-lkp@intel.com/

New smatch warnings:
drivers/tty/n_gsm.c:3751 gsmld_ioctl() warn: potential spectre issue 'gsm->dlci' [r] (local cap)
drivers/tty/n_gsm.c:3752 gsmld_ioctl() warn: possible spectre second half.  'dlci'

Old smatch warnings:
drivers/tty/n_gsm.c:3767 gsmld_ioctl() warn: possible spectre second half.  'dlci'

vim +3751 drivers/tty/n_gsm.c

e1eaea46bb4020 drivers/char/n_gsm.c Alan Cox         2010-03-26  3713  
d78328bcc4d0e6 drivers/tty/n_gsm.c  Jiri Slaby       2021-11-22  3714  static int gsmld_ioctl(struct tty_struct *tty, unsigned int cmd,
d78328bcc4d0e6 drivers/tty/n_gsm.c  Jiri Slaby       2021-11-22  3715  		       unsigned long arg)
e1eaea46bb4020 drivers/char/n_gsm.c Alan Cox         2010-03-26  3716  {
e1eaea46bb4020 drivers/char/n_gsm.c Alan Cox         2010-03-26  3717  	struct gsm_config c;
72206cc730b5c9 drivers/tty/n_gsm.c  Daniel Starke    2023-02-14  3718  	struct gsm_config_ext ce;
afe3154ba87e79 drivers/tty/n_gsm.c  Daniel Starke    2023-03-15  3719  	struct gsm_dlci_config dc;
e1eaea46bb4020 drivers/char/n_gsm.c Alan Cox         2010-03-26  3720  	struct gsm_mux *gsm = tty->disc_data;
afe3154ba87e79 drivers/tty/n_gsm.c  Daniel Starke    2023-03-15  3721  	struct gsm_dlci *dlci;
a7b121b4b8b0bc drivers/tty/n_gsm.c  Martin Hundebøll 2019-08-12  3722  	unsigned int base;
e1eaea46bb4020 drivers/char/n_gsm.c Alan Cox         2010-03-26  3723  
e1eaea46bb4020 drivers/char/n_gsm.c Alan Cox         2010-03-26  3724  	switch (cmd) {
e1eaea46bb4020 drivers/char/n_gsm.c Alan Cox         2010-03-26  3725  	case GSMIOC_GETCONF:
3384104082467e drivers/tty/n_gsm.c  Tony Lindgren    2019-01-13  3726  		gsm_copy_config_values(gsm, &c);
edd05a735a391d drivers/tty/n_gsm.c  Jiri Slaby       2020-02-19  3727  		if (copy_to_user((void __user *)arg, &c, sizeof(c)))
e1eaea46bb4020 drivers/char/n_gsm.c Alan Cox         2010-03-26  3728  			return -EFAULT;
e1eaea46bb4020 drivers/char/n_gsm.c Alan Cox         2010-03-26  3729  		return 0;
e1eaea46bb4020 drivers/char/n_gsm.c Alan Cox         2010-03-26  3730  	case GSMIOC_SETCONF:
edd05a735a391d drivers/tty/n_gsm.c  Jiri Slaby       2020-02-19  3731  		if (copy_from_user(&c, (void __user *)arg, sizeof(c)))
e1eaea46bb4020 drivers/char/n_gsm.c Alan Cox         2010-03-26  3732  			return -EFAULT;
3384104082467e drivers/tty/n_gsm.c  Tony Lindgren    2019-01-13  3733  		return gsm_config(gsm, &c);
a7b121b4b8b0bc drivers/tty/n_gsm.c  Martin Hundebøll 2019-08-12  3734  	case GSMIOC_GETFIRST:
a7b121b4b8b0bc drivers/tty/n_gsm.c  Martin Hundebøll 2019-08-12  3735  		base = mux_num_to_base(gsm);
a7b121b4b8b0bc drivers/tty/n_gsm.c  Martin Hundebøll 2019-08-12  3736  		return put_user(base + 1, (__u32 __user *)arg);
72206cc730b5c9 drivers/tty/n_gsm.c  Daniel Starke    2023-02-14  3737  	case GSMIOC_GETCONF_EXT:
72206cc730b5c9 drivers/tty/n_gsm.c  Daniel Starke    2023-02-14  3738  		gsm_copy_config_ext_values(gsm, &ce);
72206cc730b5c9 drivers/tty/n_gsm.c  Daniel Starke    2023-02-14  3739  		if (copy_to_user((void __user *)arg, &ce, sizeof(ce)))
72206cc730b5c9 drivers/tty/n_gsm.c  Daniel Starke    2023-02-14  3740  			return -EFAULT;
72206cc730b5c9 drivers/tty/n_gsm.c  Daniel Starke    2023-02-14  3741  		return 0;
72206cc730b5c9 drivers/tty/n_gsm.c  Daniel Starke    2023-02-14  3742  	case GSMIOC_SETCONF_EXT:
72206cc730b5c9 drivers/tty/n_gsm.c  Daniel Starke    2023-02-14  3743  		if (copy_from_user(&ce, (void __user *)arg, sizeof(ce)))
72206cc730b5c9 drivers/tty/n_gsm.c  Daniel Starke    2023-02-14  3744  			return -EFAULT;
72206cc730b5c9 drivers/tty/n_gsm.c  Daniel Starke    2023-02-14  3745  		return gsm_config_ext(gsm, &ce);
afe3154ba87e79 drivers/tty/n_gsm.c  Daniel Starke    2023-03-15  3746  	case GSMIOC_GETCONF_DLCI:
afe3154ba87e79 drivers/tty/n_gsm.c  Daniel Starke    2023-03-15  3747  		if (copy_from_user(&dc, (void __user *)arg, sizeof(dc)))
afe3154ba87e79 drivers/tty/n_gsm.c  Daniel Starke    2023-03-15  3748  			return -EFAULT;
afe3154ba87e79 drivers/tty/n_gsm.c  Daniel Starke    2023-03-15  3749  		if (dc.channel == 0 || dc.channel >= NUM_DLCI)
afe3154ba87e79 drivers/tty/n_gsm.c  Daniel Starke    2023-03-15  3750  			return -EINVAL;
afe3154ba87e79 drivers/tty/n_gsm.c  Daniel Starke    2023-03-15 @3751  		dlci = gsm->dlci[dc.channel];
afe3154ba87e79 drivers/tty/n_gsm.c  Daniel Starke    2023-03-15 @3752  		if (!dlci) {
afe3154ba87e79 drivers/tty/n_gsm.c  Daniel Starke    2023-03-15  3753  			dlci = gsm_dlci_alloc(gsm, dc.channel);
afe3154ba87e79 drivers/tty/n_gsm.c  Daniel Starke    2023-03-15  3754  			if (!dlci)
afe3154ba87e79 drivers/tty/n_gsm.c  Daniel Starke    2023-03-15  3755  				return -ENOMEM;
afe3154ba87e79 drivers/tty/n_gsm.c  Daniel Starke    2023-03-15  3756  		}
afe3154ba87e79 drivers/tty/n_gsm.c  Daniel Starke    2023-03-15  3757  		gsm_dlci_copy_config_values(dlci, &dc);
afe3154ba87e79 drivers/tty/n_gsm.c  Daniel Starke    2023-03-15  3758  		if (copy_to_user((void __user *)arg, &dc, sizeof(dc)))
afe3154ba87e79 drivers/tty/n_gsm.c  Daniel Starke    2023-03-15  3759  			return -EFAULT;
afe3154ba87e79 drivers/tty/n_gsm.c  Daniel Starke    2023-03-15  3760  		return 0;
afe3154ba87e79 drivers/tty/n_gsm.c  Daniel Starke    2023-03-15  3761  	case GSMIOC_SETCONF_DLCI:
afe3154ba87e79 drivers/tty/n_gsm.c  Daniel Starke    2023-03-15  3762  		if (copy_from_user(&dc, (void __user *)arg, sizeof(dc)))
afe3154ba87e79 drivers/tty/n_gsm.c  Daniel Starke    2023-03-15  3763  			return -EFAULT;
afe3154ba87e79 drivers/tty/n_gsm.c  Daniel Starke    2023-03-15  3764  		if (dc.channel == 0 || dc.channel >= NUM_DLCI)
afe3154ba87e79 drivers/tty/n_gsm.c  Daniel Starke    2023-03-15  3765  			return -EINVAL;
afe3154ba87e79 drivers/tty/n_gsm.c  Daniel Starke    2023-03-15  3766  		dlci = gsm->dlci[dc.channel];
afe3154ba87e79 drivers/tty/n_gsm.c  Daniel Starke    2023-03-15  3767  		if (!dlci) {
afe3154ba87e79 drivers/tty/n_gsm.c  Daniel Starke    2023-03-15  3768  			dlci = gsm_dlci_alloc(gsm, dc.channel);
afe3154ba87e79 drivers/tty/n_gsm.c  Daniel Starke    2023-03-15  3769  			if (!dlci)
afe3154ba87e79 drivers/tty/n_gsm.c  Daniel Starke    2023-03-15  3770  				return -ENOMEM;
afe3154ba87e79 drivers/tty/n_gsm.c  Daniel Starke    2023-03-15  3771  		}
afe3154ba87e79 drivers/tty/n_gsm.c  Daniel Starke    2023-03-15  3772  		return gsm_dlci_config(dlci, &dc, 0);
e1eaea46bb4020 drivers/char/n_gsm.c Alan Cox         2010-03-26  3773  	default:
7c783601a3bc22 drivers/tty/n_gsm.c  Jiri Slaby       2021-09-14  3774  		return n_tty_ioctl_helper(tty, cmd, arg);
e1eaea46bb4020 drivers/char/n_gsm.c Alan Cox         2010-03-26  3775  	}
e1eaea46bb4020 drivers/char/n_gsm.c Alan Cox         2010-03-26  3776  }
e1eaea46bb4020 drivers/char/n_gsm.c Alan Cox         2010-03-26  3777  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
