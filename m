Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D22037C
	for <oe-kbuild@lists.linux.dev>; Thu, 16 Mar 2023 04:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678940130; x=1710476130;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=2NCRJV4LWGY2xzHN5ypfdAQ1lsBFyK6XNU2/uI4yOkE=;
  b=E0pPJSdp8YVCs2feb28Ro6kdz7FcTmMEZGHjFKltFiEmR3Te+3JunluF
   YOgjwkvRjShVVSdW2pLwtA85N5cnZq+AmxP9EA2Ei7Or7J/EpcTIgGR0s
   2TCI+oXSJsaO4x5TZymAW4rwKVJQwA34lwzSmwk29SQlfrhpTWgHX1ZWO
   ARrw4fOABw4OI+u5+AfOzVpblDRrVm5I4tnRwsQlIurbup9SgsqUCzdLy
   tC2U6ME/wOQFuKh5rGu6hvutxHL6MLo0sgrPv1i5mHdAnSC70TtgIlEgl
   rJ5j1rImACY1PiF6yC/08ZlaLifH26t5ZcwEjpZC9fVMla/dtS359LlbP
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="337902221"
X-IronPort-AV: E=Sophos;i="5.98,264,1673942400"; 
   d="scan'208";a="337902221"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2023 21:15:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="629716484"
X-IronPort-AV: E=Sophos;i="5.98,264,1673942400"; 
   d="scan'208";a="629716484"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 15 Mar 2023 21:15:20 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pcf1L-0008I3-1T;
	Thu, 16 Mar 2023 04:15:19 +0000
Date: Thu, 16 Mar 2023 12:15:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 3/3] tty: n_gsm: add ioctl for DLC config via ldisc
 handle
Message-ID: <202303161240.YJ3Fc4ug-lkp@intel.com>
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
In-Reply-To: <20230315105354.6234-3-daniel.starke@siemens.com>
References: <20230315105354.6234-3-daniel.starke@siemens.com>
TO: "D. Starke" <daniel.starke@siemens.com>
TO: linux-serial@vger.kernel.org
TO: gregkh@linuxfoundation.org
TO: jirislaby@kernel.org
TO: ilpo.jarvinen@linux.intel.com
CC: linux-kernel@vger.kernel.org
CC: Daniel Starke <daniel.starke@siemens.com>

Hi Starke,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on tty/tty-testing]
[also build test WARNING on tty/tty-next tty/tty-linus linus/master v6.3-rc2 next-20230315]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/D-Starke/tty-n_gsm-allow-window-size-configuration/20230315-185705
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-testing
patch link:    https://lore.kernel.org/r/20230315105354.6234-3-daniel.starke%40siemens.com
patch subject: [PATCH v2 3/3] tty: n_gsm: add ioctl for DLC config via ldisc handle
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: microblaze-randconfig-m041-20230312 (https://download.01.org/0day-ci/archive/20230316/202303161240.YJ3Fc4ug-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303161240.YJ3Fc4ug-lkp@intel.com/

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
231e8c3b8f9745 drivers/tty/n_gsm.c  Daniel Starke    2023-03-15  3719  	struct gsm_dlci_config dc;
e1eaea46bb4020 drivers/char/n_gsm.c Alan Cox         2010-03-26  3720  	struct gsm_mux *gsm = tty->disc_data;
231e8c3b8f9745 drivers/tty/n_gsm.c  Daniel Starke    2023-03-15  3721  	struct gsm_dlci *dlci;
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
231e8c3b8f9745 drivers/tty/n_gsm.c  Daniel Starke    2023-03-15  3746  	case GSMIOC_GETCONF_DLCI:
231e8c3b8f9745 drivers/tty/n_gsm.c  Daniel Starke    2023-03-15  3747  		if (copy_from_user(&dc, (void __user *)arg, sizeof(dc)))
231e8c3b8f9745 drivers/tty/n_gsm.c  Daniel Starke    2023-03-15  3748  			return -EFAULT;
231e8c3b8f9745 drivers/tty/n_gsm.c  Daniel Starke    2023-03-15  3749  		if (dc.channel == 0 || dc.channel >= NUM_DLCI)
231e8c3b8f9745 drivers/tty/n_gsm.c  Daniel Starke    2023-03-15  3750  			return -EINVAL;
231e8c3b8f9745 drivers/tty/n_gsm.c  Daniel Starke    2023-03-15 @3751  		dlci = gsm->dlci[dc.channel];
231e8c3b8f9745 drivers/tty/n_gsm.c  Daniel Starke    2023-03-15 @3752  		if (!dlci) {
231e8c3b8f9745 drivers/tty/n_gsm.c  Daniel Starke    2023-03-15  3753  			dlci = gsm_dlci_alloc(gsm, dc.channel);
231e8c3b8f9745 drivers/tty/n_gsm.c  Daniel Starke    2023-03-15  3754  			if (!dlci)
231e8c3b8f9745 drivers/tty/n_gsm.c  Daniel Starke    2023-03-15  3755  				return -ENOMEM;
231e8c3b8f9745 drivers/tty/n_gsm.c  Daniel Starke    2023-03-15  3756  		}
231e8c3b8f9745 drivers/tty/n_gsm.c  Daniel Starke    2023-03-15  3757  		gsm_dlci_copy_config_values(dlci, &dc);
231e8c3b8f9745 drivers/tty/n_gsm.c  Daniel Starke    2023-03-15  3758  		if (copy_to_user((void __user *)arg, &dc, sizeof(dc)))
231e8c3b8f9745 drivers/tty/n_gsm.c  Daniel Starke    2023-03-15  3759  			return -EFAULT;
231e8c3b8f9745 drivers/tty/n_gsm.c  Daniel Starke    2023-03-15  3760  		return 0;
231e8c3b8f9745 drivers/tty/n_gsm.c  Daniel Starke    2023-03-15  3761  	case GSMIOC_SETCONF_DLCI:
231e8c3b8f9745 drivers/tty/n_gsm.c  Daniel Starke    2023-03-15  3762  		if (copy_from_user(&dc, (void __user *)arg, sizeof(dc)))
231e8c3b8f9745 drivers/tty/n_gsm.c  Daniel Starke    2023-03-15  3763  			return -EFAULT;
231e8c3b8f9745 drivers/tty/n_gsm.c  Daniel Starke    2023-03-15  3764  		if (dc.channel == 0 || dc.channel >= NUM_DLCI)
231e8c3b8f9745 drivers/tty/n_gsm.c  Daniel Starke    2023-03-15  3765  			return -EINVAL;
231e8c3b8f9745 drivers/tty/n_gsm.c  Daniel Starke    2023-03-15  3766  		dlci = gsm->dlci[dc.channel];
231e8c3b8f9745 drivers/tty/n_gsm.c  Daniel Starke    2023-03-15  3767  		if (!dlci) {
231e8c3b8f9745 drivers/tty/n_gsm.c  Daniel Starke    2023-03-15  3768  			dlci = gsm_dlci_alloc(gsm, dc.channel);
231e8c3b8f9745 drivers/tty/n_gsm.c  Daniel Starke    2023-03-15  3769  			if (!dlci)
231e8c3b8f9745 drivers/tty/n_gsm.c  Daniel Starke    2023-03-15  3770  				return -ENOMEM;
231e8c3b8f9745 drivers/tty/n_gsm.c  Daniel Starke    2023-03-15  3771  		}
231e8c3b8f9745 drivers/tty/n_gsm.c  Daniel Starke    2023-03-15  3772  		return gsm_dlci_config(dlci, &dc, 0);
e1eaea46bb4020 drivers/char/n_gsm.c Alan Cox         2010-03-26  3773  	default:
7c783601a3bc22 drivers/tty/n_gsm.c  Jiri Slaby       2021-09-14  3774  		return n_tty_ioctl_helper(tty, cmd, arg);
e1eaea46bb4020 drivers/char/n_gsm.c Alan Cox         2010-03-26  3775  	}
e1eaea46bb4020 drivers/char/n_gsm.c Alan Cox         2010-03-26  3776  }
e1eaea46bb4020 drivers/char/n_gsm.c Alan Cox         2010-03-26  3777  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
